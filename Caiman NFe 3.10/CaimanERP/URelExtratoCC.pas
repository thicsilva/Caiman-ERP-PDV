unit URelExtratoCC;

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
  TFrmRelExtratoCC = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB4: TGroupBox;
    BtnConsConta: TsSpeedButton;
    cod_conta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelExtrato: TFDQuery;
    CheckEmp: TCheckBox;
    QRelExtratoCOD_LAN: TIntegerField;
    QRelExtratoCOD_CONTA: TIntegerField;
    QRelExtratoCOD_DOC: TIntegerField;
    QRelExtratoDATAEMI_LAN: TDateField;
    QRelExtratoDATAVENC_LAN: TDateField;
    QRelExtratoNUM_CHEQUE_LAN: TStringField;
    QRelExtratoVALOR_LAN: TBCDField;
    QRelExtratoHISTORICO_LAN: TStringField;
    QRelExtratoDOCUMENTO_LAN: TStringField;
    QRelExtratoCOD_EMP: TIntegerField;
    QRelExtratoDC_LAN: TIntegerField;
    QRelExtratoCONCILIADO_LAN: TIntegerField;
    procedure BtnConsContaClick(Sender: TObject);
    procedure cod_contaEnter(Sender: TObject);
    procedure cod_contaExit(Sender: TObject);
    procedure cod_contaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_contaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelExtratoCC: TFrmRelExtratoCC;

implementation
uses
  Udm, Ubibli1, UConsConta, UQRelExtratoCC, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelExtratoCC.BtnConsContaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 9;
   FrmConsConta.showmodal;
end;

procedure TFrmRelExtratoCC.cod_contaEnter(Sender: TObject);
begin 
   cod_conta.SelectAll;
end;

procedure TFrmRelExtratoCC.cod_contaExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;
   EdtNomeConta.Text:= Consulta('contas_corrente', cod_conta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
   if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Erro ao buscar a Conta');
//        cod_conta.SetFocus;
        cod_conta.SelectAll;
     end;
end;

procedure TFrmRelExtratoCC.cod_contaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConta.Click;
end;

procedure TFrmRelExtratoCC.cod_contaKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelExtratoCC.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   cod_conta.Clear;
   EdtNomeConta.Clear;
   cod_conta.SetFocus;
end;

procedure TFrmRelExtratoCC.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelExtrato do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT * ' +
                 'FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                 'WHERE DATAVENC_LAN BETWEEN :DATAINI AND :DATAFIN ' +
                 'AND COD_CONTA = :CONTA');
         if (not CheckEmp.Checked) then
            begin 
               sql.add(' AND COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.add(' ORDER BY DATAVENC_LAN, COD_LAN');
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         Parambyname('conta').AsInteger := strtoint(cod_conta.Text);
         open;
      end;
   Application.CreateForm(TFrmQRelExtratoCC, FrmQRelExtratoCC);
   FrmQRelExtratoCC.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelExtratoCC.QRLTitulo.Caption:= 'Relatório de Extrato da Conta: ' + EdtNomeConta.Text;
   FrmQRelExtratoCC.QRLPeriodo.Caption:= 'Período: ' + datetostr(edtdataini.Date) +
   ' à ' + datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelExtratoCC.QRExtrato.PreviewInitialState:= wsMaximized;
         FrmQRelExtratoCC.QRExtrato.Preview;
      end
   else
      begin 
         FrmQRelExtratoCC.QRExtrato.PrinterSetup;
         FrmQRelExtratoCC.QRExtrato.Print;
      end;
   FrmQRelExtratoCC.QRExtrato.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelExtrato.Close;
end;

procedure TFrmRelExtratoCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelExtratoCC.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelExtratoCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
