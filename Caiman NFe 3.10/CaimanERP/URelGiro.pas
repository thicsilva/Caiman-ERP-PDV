unit URelGiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelGiro = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB: TGroupBox;
    BtnConsIni: TsSpeedButton;
    BtnConsFin: TsSpeedButton;
    EdtCodIni: UNovosComponentes.TEdit;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    EdtNomeFin: TEdit;
    CheckSecao: TCheckBox;
    Rdg: TRadioGroup;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRelGiro: TFDQuery;
    QRelGiroCODPRO: TIntegerField;
    QRelGiroNOMEPRO: TStringField;
    QRelGiroUNIDADE: TStringField;
    QRelGiroCODSEC: TIntegerField;
    QRelGiroNOMESEC: TStringField;
    QRelGiroTOTALVENDAS: TBCDField;
    QRelGiroLUCRO: TCurrencyField;
    QRelGiroPERC: TCurrencyField;
    QRelGiroTOTALQUANT: TBCDField;
    QRelGiroCUSTO: TBCDField;
    procedure CheckSecaoClick(Sender: TObject);
    procedure LimpaGB;
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure QRelGiroCalcFields(DataSet: TDataSet);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelGiro: TFrmRelGiro;

implementation

uses
  UDM, UConsSecao, Ubibli1, UQRelGiro, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelGiro.LimpaGB;
begin 
   edtcodini.Clear;
   edtcodfin.Clear;
   edtnomeini.Clear;
   edtnomefin.Clear;
end;

procedure TFrmRelGiro.CheckSecaoClick(Sender: TObject);
begin 
   CheckSecao.Focused;
   LimpaGB;
   if CheckSecao.Checked then
      gb.Enabled:= false
   else
      begin 
         GB.Enabled:= true;
         edtcodini.SetFocus;
      end;
end;

procedure TFrmRelGiro.EdtCodIniExit(Sender: TObject);
begin 
   if EdtCodIni.Text = '' then
      exit;
   EdtNomeIni.Text:= consulta('secao', EdtCodIni, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomeIni.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodIni.SetFocus;
      end;
end;

procedure TFrmRelGiro.EdtCodIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelGiro.EdtCodIniKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelGiro.EdtCodIniEnter(Sender: TObject);
begin 
   edtcodini.SelectAll;
end;

procedure TFrmRelGiro.EdtCodFinEnter(Sender: TObject);
begin 
   edtcodfin.SelectAll;
end;

procedure TFrmRelGiro.EdtCodFinExit(Sender: TObject);
begin 
   if EdtCodFin.Text = '' then
      exit;
   EdtNomeFin.Text:= consulta('secao', EdtCodFin, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomefin.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodFin.SetFocus;
      end;
end;

procedure TFrmRelGiro.EdtCodFinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelGiro.BtnConsIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 16;
   FrmConsSecao.ShowModal;
end;

procedure TFrmRelGiro.BtnConsFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 17;
   FrmConsSecao.ShowModal;
end;

procedure TFrmRelGiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelGiro.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex := 0;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   CheckSecao.Checked:= true;
   CheckSecaoClick(CheckSecao);
   edtdataini.SetFocus;
end;

procedure TFrmRelGiro.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelGiro do
      begin 
         close;
         sql.clear;
         sql.Add('SELECT * FROM SP_REL_GIRO_VENDAS (:CODEMP, :CODSECINI, :CODSECFIN, :DATAINI, :DATAFIN)');
         if (not CheckEmp.Checked) then
            Parambyname('codemp').AsInteger:= iEmp
         else
            Parambyname('codemp').AsInteger:= 0;  //todas as empresas

         if not CheckSecao.Checked then
            begin 
               Parambyname('codsecini').AsInteger:= strtoint(EdtCodIni.Text);
               Parambyname('codsecfin').AsInteger:= strtoint(EdtCodFin.Text);
            end
         else
            begin 
               Parambyname('codsecini').AsInteger:= 0;
               Parambyname('codsecfin').AsInteger:= 0;
            end;

         if rdg.ItemIndex = 0 then
            sql.Add(' ORDER BY CODSEC, CODPRO')
         else
            sql.Add(' ORDER BY CODSEC, NOMEPRO');
         Parambyname('dataini').AsDate:= EdtDataIni.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         open;
      end;
   Application.CreateForm(TFrmQRelGiro, FrmQRelGiro);
   FrmQRelGiro.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelGiro.QRLTitulo.Caption:= 'Relatório de Giro no Período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelGiro.QRGiro.PreviewInitialState:= wsMaximized;
         FrmQRelGiro.QRGiro.Preview;
      end
   else
      begin 
         FrmQRelGiro.QRGiro.PrinterSetup;
         FrmQRelGiro.QRGiro.Print;
      end;
   FrmQRelGiro.QRGiro.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelGiro.Close;
end;

procedure TFrmRelGiro.QRelGiroCalcFields(DataSet: TDataSet);
begin 
   QRelGiroLUCRO.AsCurrency:= QRelGiroTOTALVENDAS.AsCurrency - (QRelGiroTOTALQUANT.AsCurrency * QRelGiroCUSTO.AsCurrency);
   if QRelGiroCUSTO.AsCurrency > 0 then
     QRelGiroPERC.AsCurrency := ((QRelGiroLUCRO.AsCurrency * 100) / (QRelGiroTOTALQUANT.AsCurrency * QRelGiroCUSTO.AsCurrency))
   else
     QRelGiroPERC.AsCurrency:= 0;
end;

procedure TFrmRelGiro.BtnSairClick(Sender: TObject);
begin 
   close;
end;

end.
