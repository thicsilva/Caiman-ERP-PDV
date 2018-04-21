unit URelEntradasProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelEntradasProduto = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB2: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    CheckEmp: TCheckBox;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelEntradaProduto: TFDQuery;
    QRelEntradaProdutoCOD_ENT: TIntegerField;
    QRelEntradaProdutoCUSTO: TBCDField;
    QRelEntradaProdutoQTD_PRO: TBCDField;
    QRelEntradaProdutoVALOR_UNIT_PRO: TBCDField;
    QRelEntradaProdutoNUMNF_ENT: TStringField;
    QRelEntradaProdutoDATAENT_ENT: TDateField;
    QRelEntradaProdutoRAZAO_FOR: TStringField;
    procedure EdtCodExit(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEntradasProduto: TFrmRelEntradasProduto;

implementation
uses
  Udm, Ubibli1, UConsProd, UQRelEntradasProduto, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmRelEntradasProduto.EdtCodExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNome.Text := consulta('produto', edtcod, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if edtnome.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         EdtCod.SetFocus;
      end;
end;

procedure TFrmRelEntradasProduto.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag:= 13;
   FrmConsProd.ShowModal;
end;

procedure TFrmRelEntradasProduto.FormShow(Sender: TObject);
begin 
   sSql:= QRelEntradaProduto.SQL.Text;
   edtcod.Clear;
   edtnome.Clear;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtcod.SetFocus;
end;

procedure TFrmRelEntradasProduto.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelEntradasProduto.EdtCodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      btncons.Click;
end;

procedure TFrmRelEntradasProduto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelEntradasProduto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelEntradasProduto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelEntradasProduto.BtnVisClick(Sender: TObject);
begin 
   if edtcod.Text = '' then
      begin 
         AlertaCad('Digite o Código do Produto');
//         edtcod.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelEntradaProduto do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND I.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         Parambyname('codpro').AsInteger:= strtoint(edtcod.Text);
         open;
      end;
   Application.CreateForm(TFrmQRelEntradasProduto, FrmQRelEntradasProduto);
   FrmQRelEntradasProduto.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelEntradasProduto.QRLTitulo.Caption := 'Relatório de Entradas por Produto no Período: ' +
   datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
   FrmQRelEntradasProduto.QRLProduto.Caption:= 'Produto: ' +
   edtcod.Text + '- ' + edtnome.Text;
   if sender = btnvis then
      begin 
         FrmQRelEntradasProduto.QREnt.PreviewInitialState:= wsMaximized;
         FrmQRelEntradasProduto.QREnt.Preview;
      end
   else
      begin 
         FrmQRelEntradasProduto.QREnt.PrinterSetup;
         FrmQRelEntradasProduto.QREnt.Print;
      end;
   FrmQRelEntradasProduto.QREnt.QRPrinter:= nil;
end;

procedure TFrmRelEntradasProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelEntradaProduto.SQL.Clear;
   QRelEntradaProduto.SQL.Text:= sSql;
   QRelEntradaProduto.Close;
   Action:= caFree;
end;

procedure TFrmRelEntradasProduto.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

end.
