unit URelCCAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelCCAberto = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GB3: TGroupBox;
    BtnConsCC: TsSpeedButton;
    EdtCodCC: UNovosComponentes.TEdit;
    EdtNomeCC: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckConta: TCheckBox;
    CheckData: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelChequesAberto: TFDQuery;
    QRelChequesAbertoCOD_LAN: TIntegerField;
    QRelChequesAbertoCOD_CONTA: TIntegerField;
    QRelChequesAbertoDATAEMI_LAN: TDateField;
    QRelChequesAbertoDATAVENC_LAN: TDateField;
    QRelChequesAbertoNUM_CHEQUE_LAN: TStringField;
    QRelChequesAbertoVALOR_LAN: TBCDField;
    QRelChequesAbertoHISTORICO_LAN: TStringField;
    QRelChequesAbertoNOME_CONTA: TStringField;
    CheckEmp: TCheckBox;
    procedure EdtCodCCExit(Sender: TObject);
    procedure BtnConsCCClick(Sender: TObject);
    procedure EdtCodCCKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckContaClick(Sender: TObject);
    procedure CheckDataClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure EdtCodCCEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCCAberto: TFrmRelCCAberto;

implementation
uses
  Udm, Ubibli1, UConsConta, UQRelCCAberto, UNovoPrincipal, UComissoesVendedores;

{$R *.dfm}

procedure TFrmRelCCAberto.EdtCodCCExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckConta.Focused) then
       exit;
   EdtNomeCC.Text:= consulta('contas_corrente', EdtCodCC, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCC.Text = '' then
      begin 
         AlertaCad('Conta Corrente não Cadastrada');
//         EdtCodCC.SetFocus;
      end;
end;

procedure TFrmRelCCAberto.BtnConsCCClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 8;
   FrmConsConta.showmodal;
end;

procedure TFrmRelCCAberto.EdtCodCCKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmRelCCAberto.EdtCodCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCC.Click;
end;

procedure TFrmRelCCAberto.CheckContaClick(Sender: TObject);
begin 
   EdtCodCC.Clear;
   EdtNomeCC.Clear;
   CheckConta.SetFocus;
   if CheckConta.Checked then
      gb3.Enabled:= false
   else
      gb3.Enabled:= true;
end;

procedure TFrmRelCCAberto.CheckDataClick(Sender: TObject);
begin 
   if CheckData.Checked then
      gb2.Enabled:= true
   else
      gb2.Enabled:= false;
end;

procedure TFrmRelCCAberto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelCCAberto.FormShow(Sender: TObject);
begin 
   edtcodcc.Clear;
   edtnomecc.clear;
   edtdataini.date:= date;
   edtdatafin.date:= date;
   CheckConta.Checked:= false;
   CheckContaClick(sender);
   CheckData.Checked:= false;
   CheckDataClick(sender);
   edtcodcc.SetFocus;
end;

procedure TFrmRelCCAberto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelCCAberto.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelChequesAberto do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT L.COD_LAN, L.COD_CONTA, L.DATAEMI_LAN, ' +
                 'L.DATAVENC_LAN, L.NUM_CHEQUE_LAN, L.VALOR_LAN, ' +
                 'L.HISTORICO_LAN, C.NOME_CONTA ' +
                 'FROM LANCAMENTOS_CONTAS_CORRENTE L ' +
                 'INNER JOIN CONTAS_CORRENTE C ' +
                 'ON (L.COD_CONTA = C.COD_CONTA)' +
                 'WHERE L.CONCILIADO_LAN = 1 AND DC_LAN = 0');
         if not CheckConta.Checked then
            sql.Add(' AND L.COD_CONTA = ' + EdtCodCC.Text);
         if CheckData.Checked then
            begin 
               sql.Add(' AND L.DATAVENC_LAN BETWEEN :DATAINI AND :DATAFIN');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;
         if (not CheckEmp.Checked) then
            begin 
               sql.add(' AND L.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY L.DATAVENC_LAN, L.NUM_CHEQUE_LAN');
         open;
      end;
   Application.CreateForm(TFrmQRelCCAberto, FrmQRelCCAberto);
   if CheckData.Checked then
      FrmQRelCCAberto.QRLTitulo.Caption  := 'Relatório de Cheques em Aberto no Período: ' +
      datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date)
   else
      FrmQRelCCAberto.QRLTitulo.Caption  := 'Relatório de Cheques em Aberto';
   FrmQRelCCAberto.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   if sender = btnvis then
      begin 
         FrmQRelCCAberto.QRCCAberto.PreviewInitialState:= wsMaximized;
         FrmQRelCCAberto.QRCCAberto.Preview;
      end
   else
      begin 
         FrmQRelCCAberto.QRCCAberto.PrinterSetup;
         FrmQRelCCAberto.QRCCAberto.Print;
      end;
   FrmQRelCCAberto.QRCCAberto.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelChequesAberto.Close;
end;

procedure TFrmRelCCAberto.EdtCodCCEnter(Sender: TObject);
begin 
   EdtCodCC.SelectAll;
end;

end.


