unit UConsRegEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsRegEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    EdtCNPJ: UNovosComponentes.TEdit;
    BtnOK: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QCons: TFDQuery;
    QConsCODIGO: TIntegerField;
    QConsDATA: TDateField;
    QConsCNPJ: TStringField;
    QConsSERIE_NOTA: TStringField;
    QConsNUMERO_NOTA: TIntegerField;
    QConsEMITENTE: TStringField;
    QConsVALOR_TOTAL: TBCDField;
    QConsSITUACAO: TStringField;
    QConsCODIGO_EMPRESA: TIntegerField;
    QConsCODIGO_ENTRADA: TIntegerField;
    QConsINSCRICAO: TStringField;
    QConsUF: TStringField;
    DSCons: TDataSource;
    QConsCOD_FOR: TIntegerField;
    QConsRAZAO_FOR: TStringField;
    QConsDESCRICAO: TStringField;
    QConsSUB_SERIE: TStringField;
    QConsCIF_FOB: TIntegerField;
    QConsCODIFICACAO_FISCAL: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsRegEntradas: TFrmConsRegEntradas;

implementation
uses
  Udm, URegEntradas, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsRegEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsRegEntradas.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtCNPJ.Clear;
   EdtDataIni.SetFocus;
end;

procedure TFrmConsRegEntradas.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCons do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT R.*, F.RAZAO_FOR, M.DESCRICAO ' +
                 'FROM REGISTRO_LIVRO_ENTRADAS R ' +
                 'INNER JOIN FORNECEDOR F ' +
                 'ON (R.COD_FOR = F.COD_FOR) ' +
                 'INNER JOIN CODIFICACAO_DOCUMENTOS M ' +
                 'ON (R.CODIFICACAO_FISCAL = M.CODIGO) ' +
                 'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND ' +
                 'R.CODIGO_EMPRESA = :CODEMP');

         if trim(EdtCNPJ.Text) <> '' then
            sql.Add(' AND R.CNPJ = ' + #39 + trim(EdtCNPJ.Text) + #39);

         sql.add(' ORDER BY R.DATA, R.CODIGO');
         Parambyname('dataini').AsDate  := EdtDataIni.Date;
         Parambyname('datafin').AsDate  := EdtDataFin.Date;
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
end;

procedure TFrmConsRegEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCons.Close;
   Action:= caFree;
end;

procedure TFrmConsRegEntradas.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmConsRegEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsRegEntradas.BtnLocalizarClick(Sender: TObject);
begin 
   if (tag = 0) or (tag = 1) then
      begin 
         if tag = 1 then
            Application.CreateForm(TFrmRegEntradas, FrmRegEntradas);
         with FrmRegEntradas do
            begin 
               tag                := 1;
               EdtCod.Text        := QConsCODIGO.AsString;
               EdtData.Text       := QConsDATA.AsString;
               EdtNumNF.Text      := QConsNUMERO_NOTA.AsString;
               EdtCodModelo.Text  := QConsCODIFICACAO_FISCAL.AsString;
               EdtNomeModelo.Text := QConsDESCRICAO.AsString;
               EdtSerie.Text      := QConsSERIE_NOTA.AsString;
               EdtCodFor.Text     := QConsCOD_FOR.AsString;
               EdtNomeFor.Text    := QConsRAZAO_FOR.AsString;
               EdtCNPJ.Text       := QConsCNPJ.AsString;
               EdtInscricao.Text  := QConsINSCRICAO.AsString;
               EdtUF.Text         := QConsUF.AsString;
               EdtTotalNF.Text    := QConsVALOR_TOTAL.AsString;
               if QConsEMITENTE.AsString = 'P' then
                  ComboEmitente.ItemIndex:= 0
               else
                  ComboEmitente.ItemIndex:= 1;
               if QConsSITUACAO.AsString = 'N' then
                  ComboSituacao.ItemIndex:= 0
               else
                  ComboSituacao.ItemIndex:= 1;
               EdtSubSerie.Text     := QConsSUB_SERIE.AsString;
               ComboFrete.ItemIndex := QConsCIF_FOB.AsInteger;

               try
                 case QConsCODIFICACAO_FISCAL.AsInteger of
                   7,8,9,10,11,26: begin 
                                      Label16.Visible    := true;
                                      ComboFrete.Visible := true;
                                   end;
                 else
                    begin 
                       Label16.Visible    := false;
                       ComboFrete.Visible := false;
                    end;
                 end;
               except
                  Label16.Visible    := false;
                  ComboFrete.Visible := false;
               end;

               BuscaItens;
               show;
               FormShow(sender);
            end;
         close;
      end;
end;

end.
