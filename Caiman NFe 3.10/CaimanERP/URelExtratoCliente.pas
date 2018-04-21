unit URelExtratoCliente;

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
  TFrmRelExtratoCliente = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox2: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QConsExtrato: TFDQuery;
    QConsExtratoCODCTR: TIntegerField;
    QConsExtratoSEQCTR: TIntegerField;
    QConsExtratoDATACTR: TDateField;
    QConsExtratoVENCTOCTR: TDateField;
    QConsExtratoVALORCTR: TBCDField;
    QConsExtratoDTPAGTOCTR: TDateField;
    QConsExtratoVLRPAGOCTR: TBCDField;
    QConsExtratoACRESRECCTR: TBCDField;
    QConsExtratoDIAS: TFloatField;
    QBuscaParametros: TFDQuery;
    QBuscaParametrosDIAS_CARENCIA: TIntegerField;
    QBuscaParametrosJUROS_ATRASO: TBCDField;
    QConsExtratoJUROS: TFloatField;
    QConsExtratoACRESCIMOCTR: TBCDField;
    QConsExtratoDESCCONCEDIDO: TBCDField;
    QConsExtratoDEVOLUCAO: TBCDField;
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QConsExtratoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelExtratoCliente: TFrmRelExtratoCliente;

implementation
uses
  UDM, UConsCli, Ubibli1, UQRelExtratoCliente, UNovoPrincipal;
var vl_juros_atraso  : real;
var vl_dias_carencia : integer;

{$R *.dfm}

procedure TFrmRelExtratoCliente.EdtCodExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNome.Text:= consulta('cliente', EdtCod, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNome.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCod.SetFocus;
         EdtCod.SelectAll;
      end;
end;

procedure TFrmRelExtratoCliente.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelExtratoCliente.EdtCodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmRelExtratoCliente.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 13;
   FrmConsCli.ShowModal;
end;

procedure TFrmRelExtratoCliente.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelExtratoCliente.BtnVisClick(Sender: TObject);
var vl_BruARec, vl_BruRec, vl_jurosARec, vl_JurosRec, vl_devRec, vl_devARec, vl_desconto : real;
begin 
   vl_BruARec    := 0;
   vl_BruRec     := 0;
   vl_JurosArec  := 0;
   vl_JurosRec   := 0;
   vl_devrec     := 0;
   vl_devARec    := 0;
   vl_desconto   := 0;
   if edtcod.Text = '' then
      begin 
         AlertaCad('Digite o código do cliente');
         exit;
      end;
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdataini.SetFocus;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
     with QConsExtrato do
        begin 
           close;
           Parambyname('codcli').Value    := EdtCod.Text;
           Parambyname('dataini').Value   := edtdataini.Date;
           Parambyname('datafin').Value   := edtdatafin.Date;
           open;
           First;
           while not eof do
              begin 
                 if QConsExtratoDTPAGTOCTR.IsNull then
                    begin 
                       vl_BruARec  := vl_BruARec +  QConsExtratoVALORCTR.Value;
                       vl_jurosARec:= vl_jurosARec + QConsExtratoJUROS.Value;
                       vl_devARec  := vl_devARec + QConsExtratoDEVOLUCAO.Value;
                    end
                 else
                    begin 
                       vl_BruRec := vl_BruRec + QConsExtratoVALORCTR.Value;
                       vl_jurosRec:= vl_jurosRec + QConsExtratoACRESRECCTR.Value;
                       vl_desconto:= vl_desconto + QConsExtratoDESCCONCEDIDO.value;
                       vl_devrec := vl_devRec + QConsExtratoDEVOLUCAO.Value;
                    end;
                 next;
              end;
           First;
        end;
   Application.CreateForm(TFrmQRelExtratoCliente, FrmQRelExtratoCliente);
   FrmQRelExtratoCliente.QRLBruAReceber.Caption  := currtostrf(vl_BruARec, ffnumber,2);
   FrmQRelExtratoCliente.QRLBruRecebido.Caption  := currtostrf(vl_BruRec, ffnumber, 2);
   FrmQRelExtratoCliente.QRLDevARec.Caption      := currtostrf(vl_devARec, ffnumber,2);
   FrmQRelExtratoCliente.QRLDevRec.Caption       := currtostrf(vl_devRec, ffnumber, 2);
   FrmQRelExtratoCliente.QRLJurosAReceber.Caption:= floattostrf(vl_jurosARec, ffnumber, 15,2);
   FrmQRelExtratoCliente.QRLJurosRecebido.Caption:= floattostrf(vl_JurosRec, ffnumber, 15,2);
   FrmQRelExtratoCliente.QRLDescRec.Caption      := currtostrf(vl_desconto, ffnumber,2);
   FrmQRelExtratoCliente.QRLDescARec.Caption     := '0,00';
   FrmQRelExtratoCliente.QRLLiqARec.Caption      := currtostrf(vl_BruARec - vl_devARec + vl_jurosARec, ffnumber, 2);
   FrmQRelExtratoCliente.QRLLiqRec.Caption       := currtostrf(vl_BruRec - vl_devRec - vl_desconto + vl_JurosRec, ffnumber, 2);
   FrmQRelExtratoCliente.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelExtratoCliente.QRLTitulo.Caption     := 'Relatório de Extrato de Cliente no Período: ' +
   datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);
   FrmQRelExtratoCliente.QRLCli.Caption        := EdtNome.Text;
   if sender = btnvis then
      begin 
         FrmQRelExtratoCliente.QRCli.PreviewInitialState:= wsMaximized;
         FrmQRelExtratoCliente.QRCli.Preview;
      end
   else
      begin 
         FrmQRelExtratoCliente.QRCli.PrinterSetup;
         FrmQRelExtratoCliente.QRCli.Print;
      end;
   FrmQRelExtratoCliente.QRCli.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QConsExtrato.Close;
end;

procedure TFrmRelExtratoCliente.FormShow(Sender: TObject);
begin 
   EdtCod.clear;
   edtnome.Clear;
   edtdataini.Date:= date;
   EdtDataFin.Date:= date;
   edtcod.SetFocus;
end;

procedure TFrmRelExtratoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelExtratoCliente.QConsExtratoCalcFields(DataSet: TDataSet);
begin 
   if QConsExtratoDTPAGTOCTR.IsNull then
      begin 
         QConsExtratoDIAS.Value:= date - QConsExtratoVENCTOCTR.Value;
         if QConsExtratoDIAS.Value >  vl_dias_carencia then
            QConsExtratoJUROS.Value:= (((QConsExtratoVALORCTR.Value - QConsExtratoDEVOLUCAO.Value) * (vl_juros_atraso / 30) * QConsExtratoDIAS.Value) / 100)
         else
            QConsExtratoJUROS.Value:= 0;
      end
   else
      begin 
         QConsExtratoDIAS.Value:= QConsExtratoDTPAGTOCTR.Value - QConsExtratoVENCTOCTR.Value;
         QConsExtratoJUROS.Value:= QConsExtratoACRESCIMOCTR.Value;
      end;
end;

procedure TFrmRelExtratoCliente.FormCreate(Sender: TObject);
begin 
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaParametros do
      begin 
         close;
         Parambyname('codemp').Value:= iEmp;
         open;
         vl_juros_atraso := QBuscaParametrosJUROS_ATRASO.Value;
         vl_dias_carencia:= QBuscaParametrosDIAS_CARENCIA.Value;
      end;
   dm.IBTransaction.Commit;
   QBuscaParametros.Close;
end;

end.
