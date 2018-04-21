unit URelProdutosAlterados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Mask, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelProdutosAlterados = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRel: TFDQuery;
    CheckSecao: TCheckBox;
    QRelCOD_PRO: TIntegerField;
    QRelNOME_PRO: TStringField;
    QRelVALOR_PRO: TBCDField;
    QRelPROMOCAO_PRO: TBCDField;
    QRelCOD_SEC: TIntegerField;
    QRelNOME_SEC: TStringField;
    EdtHoraIni: TMaskEdit;
    EdtHoraFin: TMaskEdit;
    EdtDataIni: TMaskEdit;
    EdtDataFin: TMaskEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtHoraIniExit(Sender: TObject);
    procedure EdtDataIniExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutosAlterados: TFrmRelProdutosAlterados;

implementation
uses
  Udm, Ubibli1, UQRelProdutosAlterados, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelProdutosAlterados.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelProdutosAlterados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelProdutosAlterados.FormShow(Sender: TObject);
begin 
   CheckSecao.Checked:= false;
   EdtHoraIni.Text:= '00:00:00';
   EdtHoraFin.Text:= '23:59:59';
   EdtDataIni.Text:= datetostr(date);
   EdtDataFin.Text:= datetostr(date);
   EdtDataIni.SetFocus;
end;

procedure TFrmRelProdutosAlterados.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRel do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT DISTINCT(A.COD_PRO), P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, P.COD_SEC, S.NOME_SEC ' +
                 'FROM PRODUTOS_ALTERADOS A ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (A.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN SECAO S ' +
                 'ON (P.COD_SEC = S.COD_SEC) ' +
                 'WHERE A.DATA_HORA BETWEEN :DATAINI AND :DATAFIN');

         if CheckSecao.Checked then
            sql.add(' ORDER BY P.COD_SEC, P.NOME_PRO')
         else
            sql.Add(' ORDER BY P.NOME_PRO');

         Parambyname('dataini').AsDateTime:= strtodate(EdtDataIni.Text) + StrToTime(EdtHoraIni.Text);
         Parambyname('datafin').AsDateTime:= strtodate(EdtDataFin.Text) + StrToTime(EdtHoraFin.Text);
         open;
      end;
   Application.CreateForm(TFrmQRelProdutosAlterados, FrmQRelProdutosAlterados);
   if CheckSecao.Checked then
      FrmQRelProdutosAlterados.QRGroup1.Enabled:= true
   else
      FrmQRelProdutosAlterados.QRGroup1.Enabled:= false;
   FrmQRelProdutosAlterados.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelProdutosAlterados.QRLTitulo.Caption:= 'Relatório de Produtos Alterados ' +
   'no Período: ' + edtdataini.Text + ' a ' + edtdatafin.Text;

   if sender = btnvis then
      begin 
         FrmQRelProdutosAlterados.QRRel.PreviewInitialState:= wsMaximized;
         FrmQRelProdutosAlterados.QRRel.Preview;
      end
   else
      begin 
         FrmQRelProdutosAlterados.QRRel.PrinterSetup;
         FrmQRelProdutosAlterados.QRRel.Print;
      end;
   FrmQRelProdutosAlterados.QRRel.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRel.Close;
end;

procedure TFrmRelProdutosAlterados.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelProdutosAlterados.EdtHoraIniExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   with sender as TMaskEdit do
      begin 
         try
           StrToTime(text)
         except
           AlertaCad('Hora Inválida');
           setfocus;
         end;
      end;
end;

procedure TFrmRelProdutosAlterados.EdtDataIniExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   with sender as TMaskEdit do
      begin 
         try
           StrToDate(text)
         except
           AlertaCad('Data Inválida');
           setfocus;
         end;
      end;
end;

procedure TFrmRelProdutosAlterados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

end.
