unit UConsProdRapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsProdRapida = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    DBGrid: TDBGrid;
    Panel1: TPanel;
    GB: TGroupBox;
    EdtNome: TEdit;
    StatusBar1: TStatusBar;
    QConsPro: TFDQuery;
    DSQConsPro: TDataSource;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    QConsProCOD_PRO: TIntegerField;
    QConsProNOME_PRO: TStringField;
    QConsProVALOR_PRO: TBCDField;
    QConsProPROMOCAO_PRO: TBCDField;
    QConsProUNIDADE_SAIDA_PRO: TStringField;
    QConsProESTOQUE: TBCDField;
    BtnLocalizar: TButton;
    RDG: TRadioGroup;
    QConsProLOCALIZACAO_PRO: TStringField;
    BtnPreco: TButton;
    QPreco: TFDQuery;
    IBTRAux: TFDTransaction;
    QPrecoCOD_TPV: TIntegerField;
    QPrecoNOME_TPV: TStringField;
    QPrecoDESCONTO_TPV: TBCDField;
    QPrecoACRESCIMO_TPV: TBCDField;
    QPrecoPRECO: TCurrencyField;
    DBGPreco: TDBGrid;
    DSQPreco: TDataSource;
    QConsProATIVO_PRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RDGClick(Sender: TObject);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure QPrecoCalcFields(DataSet: TDataSet);
    procedure BtnPrecoClick(Sender: TObject);
    procedure DBGPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridCorTamEnter(Sender: TObject);
    procedure DBGridCorTamExit(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProdRapida: TFrmConsProdRapida;

implementation

{$R *.dfm}
uses
  Udm, UVenda, UNovoPrincipal;

procedure TFrmConsProdRapida.FormShow(Sender: TObject);
begin 
   DBGPreco.Visible:= false;
   rdg.ItemIndex:= 1;
   gb.Caption:= 'Descrição';
   EdtNome.Clear;
   edtnome.Text:= sAuxString;
   edtnome.SetFocus;
   edtnome.SelectAll;
end;

procedure TFrmConsProdRapida.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsProdRapida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if IBTRAux.Active then
      IBTRAux.Commit;
   QPreco.Close;
   QConsPro.Close;
   Action:= caFree;
end;

procedure TFrmConsProdRapida.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPro do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT P.COD_PRO, P.ATIVO_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, ' +
                 'P.UNIDADE_SAIDA_PRO, P.LOCALIZACAO_PRO, ' +
                 '(SELECT SUM(ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO ' +
                 'AND E.COD_EMP = ' + inttostr(iEmp) + ') ESTOQUE ' +
                 'FROM PRODUTO P');
         if rdg.ItemIndex = 0 then
            begin 
               sAuxString:= '';
               if edtnome.Text = '' then
                  sql.Add(' ORDER BY P.COD_PRO')
               else
                  begin 
                     sql.Add(' WHERE P.COD_PRO = :CODPRO');
                     Parambyname('codpro').AsInteger:= strtoint(EdtNome.Text);
                  end;
            end
         else
            begin 
               sAuxString:= trim(edtnome.Text);
               if edtnome.Text = '' then
                  sql.Add(' ORDER BY P.NOME_PRO')
               else
                  sql.Add(' WHERE P.NOME_PRO LIKE ' + #39 + EdtNome.Text + '%' + #39 + ' ORDER BY P.NOME_PRO');
            end;
         open;
         if recordcount > 0 then
            DBGrid.SetFocus
         else
            edtnome.SetFocus;
      end;
end;

procedure TFrmConsProdRapida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
     close;
end;

procedure TFrmConsProdRapida.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      EdtNome.SetFocus;
end;

procedure TFrmConsProdRapida.BtnLocalizarClick(Sender: TObject);
begin 
   case tag of
     0: begin 
           with FrmVenda do
              begin 
                 EdtCodPro.Text    := QConsProCOD_PRO.AsString;
                 edtnomepro.Text   := QConsProNOME_PRO.Value;
                 EdtCodPro.setfocus;
              end;
           close;
        end;
   end;
end;

procedure TFrmConsProdRapida.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsProdRapida.RDGClick(Sender: TObject);
begin 
   edtnome.Clear;
   if rdg.ItemIndex = 0 then
      GB.Caption:= 'Código'
   else
      gb.Caption:= 'Descrição';
   edtnome.SetFocus;
end;

procedure TFrmConsProdRapida.EdtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if rdg.ItemIndex = 0 then
      begin 
         if not (key in ['0'..'9', #13, #8]) then
            key:= #0;
      end;
end;

procedure TFrmConsProdRapida.QPrecoCalcFields(DataSet: TDataSet);
begin 
   if QConsProPROMOCAO_PRO.AsCurrency > 0 then
      begin 
         if QPrecoDESCONTO_TPV.AsCurrency > 0 then
            QPrecoPRECO.AsCurrency:= QConsProPROMOCAO_PRO.AsCurrency -
            ((QConsProPROMOCAO_PRO.AsCurrency * QPrecoDESCONTO_TPV.AsCurrency) / 100)
         else
            if QPrecoACRESCIMO_TPV.AsCurrency > 0 then
               QPrecoPRECO.AsCurrency:= QConsProPROMOCAO_PRO.AsCurrency +
               ((QConsProPROMOCAO_PRO.AsCurrency * QPrecoACRESCIMO_TPV.AsCurrency) / 100)
            else
               QPrecoPRECO.AsCurrency:= QConsProPROMOCAO_PRO.AsCurrency;
      end
   else
      if QConsProVALOR_PRO.AsCurrency > 0 then
         begin 
            if QPrecoDESCONTO_TPV.AsCurrency > 0 then
               QPrecoPRECO.AsCurrency:= QConsProVALOR_PRO.AsCurrency -
               ((QConsProVALOR_PRO.AsCurrency * QPrecoDESCONTO_TPV.AsCurrency) / 100)
            else
               if QPrecoACRESCIMO_TPV.AsCurrency > 0 then
                  QPrecoPRECO.AsCurrency:= QConsProVALOR_PRO.AsCurrency +
                  ((QConsProVALOR_PRO.AsCurrency * QPrecoACRESCIMO_TPV.AsCurrency) / 100)
               else
                  QPrecoPRECO.AsCurrency:= QConsProVALOR_PRO.AsCurrency;
         end
      else
         QPrecoPRECO.AsCurrency:= 0;
end;

procedure TFrmConsProdRapida.BtnPrecoClick(Sender: TObject);
begin 
   if IBTRAux.Active then
      IBTRAux.Commit;
   IBTRAux.StartTransaction;
   with QPreco do
      begin 
         close;
         open;
      end;
   FrmConsProdRapida.KeyPreview:= false;
   DBGPreco.Visible:= true;
   DBGPreco.SetFocus;
end;

procedure TFrmConsProdRapida.DBGPrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         if IBTRAux.Active then
            IBTRAux.Commit;
         QPreco.Close;
         DBGrid.SetFocus;
         DBGPreco.Visible:= false;
         FrmConsProdRapida.KeyPreview:= true;
      end;
end;

procedure TFrmConsProdRapida.DBGridCorTamEnter(Sender: TObject);
begin 
   FrmConsProdRapida.KeyPreview:= false;
end;

procedure TFrmConsProdRapida.DBGridCorTamExit(Sender: TObject);
begin 
   FrmConsProdRapida.KeyPreview:= true;
end;

procedure TFrmConsProdRapida.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsProATIVO_PRO.AsString) = 'N' then
      begin 
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end;
end;

end.
