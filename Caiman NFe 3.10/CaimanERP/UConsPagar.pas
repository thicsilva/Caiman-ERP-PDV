unit UConsPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, 
  rxPlacemnt, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsPagar = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    RDG: TRadioGroup;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    QConsPagar: TFDQuery;
    DSQConsPagar: TDataSource;
    QConsPagarCOD_CPT: TIntegerField;
    QConsPagarCOD_EMP: TIntegerField;
    QConsPagarDATA_CTP: TDateField;
    QConsPagarCOD_FOR: TIntegerField;
    QConsPagarTIPO_DOC_CTP: TStringField;
    QConsPagarNUM_DOC_CTP: TStringField;
    QConsPagarVALOR_CTP: TBCDField;
    QConsPagarDTVENCTO_CTP: TDateField;
    QConsPagarDTPAGTO_CTP: TDateField;
    QConsPagarVALOR_PAGO_CTP: TBCDField;
    QConsPagarDESCONTO_CTP: TBCDField;
    QConsPagarACRESCIMO_CTP: TBCDField;
    QConsPagarOBS_CTP: TStringField;
    QConsPagarRAZAO_FOR: TStringField;
    BtnItens: TButton;
    QConsPagarCOD_ENTRADA: TIntegerField;
    QConsPagarSEQUENCIA_CTP: TIntegerField;
    Panel3: TPanel;
    Label3: TLabel;
    LTotal: TLabel;
    QConsPagarCOD_CLASSIFICACAO: TIntegerField;
    QConsPagarCODIGO_FORMA_PAGAMENTO: TIntegerField;
    QConsPagarCODIGO_CENTRO_CUSTO: TIntegerField;
    QConsPagarCHEQUE: TStringField;
    QConsPagarDUPLICATA_PENDENTE: TStringField;
    Shape1: TShape;
    Label2: TLabel;
    QPendente: TFDQuery;
    BtnPendente: TButton;
    CheckPendente: TCheckBox;
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnItensClick(Sender: TObject);
    procedure QConsPagarAfterScroll(DataSet: TDataSet);
    procedure EdtCodForEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPendenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsPagar: TFrmConsPagar;

implementation
uses
  Udm, Ubibli1, UConsFor, UItensEntradas, UNovoPrincipal;
var sSql : string;
    iAuxCodCPT : integer;

{$R *.dfm}

procedure TFrmConsPagar.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsPagar.EdtCodForKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsPagar.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.Tag:= 4;
   FrmConsFor.ShowModal;
end;

procedure TFrmConsPagar.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         Application.CreateForm(TFrmConsFor, FrmConsFor);
         FrmConsFor.Tag:= 4;
         FrmConsFor.ShowModal;
      end;
end;

procedure TFrmConsPagar.EdtCodForExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (edtcodfor.Text = '') then
      begin 
         edtnomefor.Clear;
         exit;
      end;

   EdtNomeFor.Text := consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if edtnomefor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         edtcodfor.SetFocus;
      end;
end;

procedure TFrmConsPagar.FormShow(Sender: TObject);
begin 
   iAuxCodCPT:= 0; 
   sSql:= QConsPagar.sql.Text;
   LTotal.Caption:= '0,00';
   edtcodfor.Clear;
   edtnomefor.Clear;
   edtdataini.Date  := date;
   edtdatafin.Date  := date;
   rdg.ItemIndex    := 1;
   CheckEmp.Checked := true;
   BtnItens.Enabled := false;
   CheckPendente.Checked:= false;
   edtdataini.SetFocus;
end;

procedure TFrmConsPagar.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;
   cTotal:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPagar do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;

         if rdg.ItemIndex = 0 then //pagas
            sql.Add(' WHERE C.DTPAGTO_CTP BETWEEN :DATAINI AND :DATAFIN')
         else
            sql.Add(' WHERE C.DTVENCTO_CTP BETWEEN :DATAINI AND :DATAFIN AND C.DTPAGTO_CTP IS NULL');

         if trim(edtcodfor.Text) <> '' then
            begin 
               sql.Add(' AND C.COD_FOR = :CODFOR');
               parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND C.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         if CheckPendente.Checked then
            sql.add(' AND C.DUPLICATA_PENDENTE = ' + #39 + 'S' + #39);

         if rdg.ItemIndex = 0 then
            sql.Add(' ORDER BY C.DTPAGTO_CTP, C.COD_CPT, C.SEQUENCIA_CTP')
         else
            sql.Add(' ORDER BY C.DTVENCTO_CTP, C.COD_CPT, C.SEQUENCIA_CTP');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= edtdatafin.Date;
         Open;

         while not eof do
            begin 
               if rdg.ItemIndex = 0 then
                  cTotal:= cTotal + QConsPagarVALOR_PAGO_CTP.AsCurrency
               else
                  cTotal:= cTotal + QConsPagarVALOR_CTP.AsCurrency;
               next;
            end;

         LTotal.Caption:= currtostrf(cTotal, ffnumber, 2);

         if cTotal > 0 then
            begin 
               BtnItens.Enabled    := true;
               BtnPendente.Enabled := true;
            end
         else
            begin 
               BtnItens.Enabled    := false;
               BtnPendente.Enabled := false;
            end;

         QConsPagar.Locate('COD_CPT', iAuxCodCPT, []);
         iAuxCodCPT:= 0;
      end;
end;

procedure TFrmConsPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.commit;
   QConsPagar.SQL.Clear;
   QConsPagar.sql.Text:= sSql;
   QConsPagar.close;

   Action:= caFree;
end;

procedure TFrmConsPagar.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensEntradas, FrmItensEntradas);
   FrmItensEntradas.tag:= 2;
   FrmItensEntradas.showmodal;
end;

procedure TFrmConsPagar.QConsPagarAfterScroll(DataSet: TDataSet);
begin 
   if QConsPagarCOD_ENTRADA.IsNull then
      BtnItens.Enabled:= false
   else
      BtnItens.Enabled:= true;

   if trim(QConsPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      BtnPendente.Caption:= '&Desmarcar Pendencia'
   else
      BtnPendente.Caption:= '&Marcar como Pendente';
end;

procedure TFrmConsPagar.EdtCodForEnter(Sender: TObject);
begin 
   EdtCodFor.SelectAll;
end;

procedure TFrmConsPagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsPagar.BtnPendenteClick(Sender: TObject);
begin 
   iAuxCodCPT:= QConsPagarCOD_CPT.AsInteger;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QPendente do
          begin 
             close;
             ParamByName('cod').AsInteger:= QConsPagarCOD_CPT.AsInteger;
             ParamByName('seq').AsInteger:= QConsPagarSEQUENCIA_CTP.AsInteger;
             if trim(QConsPagarDUPLICATA_PENDENTE.AsString) = 'S' then
                Parambyname('pend').AsString:= 'N'
             else
                Parambyname('pend').AsString:= 'S';
             ExecOrOpen;
          end;
       dm.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('Erro ao atualizar o contas a pagar');
     end;
   finally
     QPendente.Close;
     BtnOk.Click;
   end;
end;

end.
