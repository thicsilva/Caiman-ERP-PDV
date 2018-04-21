unit URelVendasProduto;

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
  TFrmRelVendasProduto = class(UNovoFormulario.TForm)
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
    QRelVendasProduto: TFDQuery;
    QRelVendasProdutoCOD_VEN: TIntegerField;
    QRelVendasProdutoQUANT: TBCDField;
    QRelVendasProdutoVALOR: TBCDField;
    QRelVendasProdutoDESCONTO: TBCDField;
    QRelVendasProdutoDATA_VEN: TDateField;
    QRelVendasProdutoNOME_CLI: TStringField;
    ComboCaixa: TComboBox;
    GroupBox2: TGroupBox;
    procedure EdtCodExit(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendasProduto: TFrmRelVendasProduto;

implementation
uses
  Udm, Ubibli1, UConsProd, UQRelVendasProduto, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmRelVendasProduto.EdtCodExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNome.Text := consulta('produto', edtcod, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if edtnome.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         EdtCod.SetFocus;
         edtcod.SelectAll;
      end;
end;

procedure TFrmRelVendasProduto.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag:= 14;
   FrmConsProd.ShowModal;
end;

procedure TFrmRelVendasProduto.FormShow(Sender: TObject);
begin 
   sSql:= QRelVendasProduto.SQL.Text;
   ComboCaixa.ItemIndex:= 0;
   edtcod.Clear;
   edtnome.Clear;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtcod.SetFocus;
end;

procedure TFrmRelVendasProduto.FormCreate(Sender: TObject);
begin 
   { BUSCA CAIXA }
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT COD_CAI, DESC_CAI ' +
                 'FROM CAIXA ORDER BY COD_CAI');
         open;
         First;
         ComboCaixa.Items.Clear;
         combocaixa.Items.Add('TODOS');
         while not eof do
            begin 
               combocaixa.Items.Add(FormataStringD(fieldbyname('COD_CAI').AsString, '2', '0') + '-' + fieldbyname('DESC_CAI').AsString);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QCaixa.Close;
end;

procedure TFrmRelVendasProduto.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelVendasProduto.EdtCodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      btncons.Click;
end;

procedure TFrmRelVendasProduto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelVendasProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelVendasProduto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelVendasProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelVendasProduto.SQL.Clear;
   QRelVendasProduto.SQL.Text:= sSql;
   QRelVendasProduto.Close;
   Action:= caFree;
end;

procedure TFrmRelVendasProduto.BtnVisClick(Sender: TObject);
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
   with QRelVendasProduto do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

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
   Application.CreateForm(TFrmQRelVendasProduto, FrmQRelVendasProduto);
   FrmQRelVendasProduto.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelVendasProduto.QRLTitulo.Caption := 'Relatório de Vendas por Produto no Período: ' +
   datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
   FrmQRelVendasProduto.QRLProduto.Caption:= 'Produto: ' +
   edtcod.Text + '- ' + edtnome.Text;
   FrmQRelVendasProduto.QRLCaixa.Caption:= 'Caixa: ' + ComboCaixa.Text;
   if sender = btnvis then
      begin 
         FrmQRelVendasProduto.QRVen.PreviewInitialState:= wsMaximized;
         FrmQRelVendasProduto.QRVen.Preview;
      end
   else
      begin 
         FrmQRelVendasProduto.QRVen.PrinterSetup;
         FrmQRelVendasProduto.QRVen.Print;
      end;
   FrmQRelVendasProduto.QRVen.QRPrinter:= nil;
end;

procedure TFrmRelVendasProduto.EdtCodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

end.
