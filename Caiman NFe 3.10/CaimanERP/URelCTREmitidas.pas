unit URelCTREmitidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelCTREmitidas = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    RdgOrdem: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelCTR: TFDQuery;
    QRelCTRCOD_CTR: TIntegerField;
    QRelCTRSEQUENCIA_CTR: TIntegerField;
    QRelCTRDATA_CTR: TDateField;
    QRelCTRCOD_EMP: TIntegerField;
    QRelCTRCOD_VENDA: TIntegerField;
    QRelCTRVALOR_CTR: TBCDField;
    QRelCTRNOME_CLI: TStringField;
    QRelCTRDEVOLUCAO_CTR: TBCDField;
    QRelCTRLIQUIDO: TBCDField;
    QRelCTRCAIXA_EMISSAO_CTR: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCTREmitidas: TFrmRelCTREmitidas;

implementation
uses
  Udm, UQRelCTREmissao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelCTREmitidas.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   RdgOrdem.ItemIndex:= 0;
   edtdataini.SetFocus;
end;

procedure TFrmRelCTREmitidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelCTREmitidas.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCTR do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.DATA_CTR, R.CAIXA_EMISSAO_CTR, ' +
                 'R.COD_EMP, R.COD_VENDA, R.VALOR_CTR, R.DEVOLUCAO_CTR, ' +
                 '(R.VALOR_CTR - R.DEVOLUCAO_CTR) LIQUIDO, C.NOME_CLI ' +
                 'FROM CONTAS_RECEBER R ' +
                 'INNER JOIN CLIENTE C ' +
                 'ON (R.COD_CLI = C.COD_CLI) ' +
                 'WHERE R.DATA_CTR BETWEEN :DATAINI AND :DATAFIN');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND R.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         if RdgOrdem.ItemIndex = 0 then
            sql.add(' ORDER BY C.NOME_CLI')
         else
            sql.add(' ORDER BY R.COD_CTR');
         Parambyname('dataini').asdate := edtdataini.date;
         Parambyname('datafin').asdate := edtdatafin.date;
         open;
      end;
   Application.CreateForm(TFrmQRelCTREmitidas, FrmQRelCTREmitidas);
   FrmQRelCTREmitidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelCTREmitidas.QRLTitulo.Caption:= 'Relatório das contas emitidas no período: ' +
   datetostr(edtdataini.Date) + ' à ' + datetostr(EdtDataFin.date);
   if sender = btnvis then
      begin 
         FrmQRelCTREmitidas.QRRec.PreviewInitialState:= wsMaximized;
         FrmQRelCTREmitidas.QRRec.Preview;
      end
   else
      begin 
         FrmQRelCTREmitidas.QRRec.PrinterSetup;
         FrmQRelCTREmitidas.QRRec.Print;
      end;
   FrmQRelCTREmitidas.QRRec.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelCTR.Close;
end;

procedure TFrmRelCTREmitidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelCTR.close;
   Action:= caFree;
end;

procedure TFrmRelCTREmitidas.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelCTREmitidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
