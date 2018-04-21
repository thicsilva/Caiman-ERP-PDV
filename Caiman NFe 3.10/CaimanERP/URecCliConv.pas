unit URecCliConv;

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
  TFrmRelCliConv = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtCodConvIni: UNovosComponentes.TEdit;
    BtnConsConvIni: TsSpeedButton;
    EdtNomeConvIni: TEdit;
    GroupBox2: TGroupBox;
    BtnConsConvFin: TsSpeedButton;
    EdtCodConvFin: UNovosComponentes.TEdit;
    EdtNomeConvFin: TEdit;
    QRelCli: TFDQuery;
    DSQRelCli: TDataSource;
    QRelCliCOD_CLI: TIntegerField;
    QRelCliNOME_CLI: TStringField;
    QRelCliTELRES_CLI: TStringField;
    QRelCliCELULAR_CLI: TStringField;
    QRelCliCOD_CON: TIntegerField;
    QRelCliNOME_CON: TStringField;
    QRelCliTELCOM_CLI: TStringField;
    procedure EdtCodConvIniExit(Sender: TObject);
    procedure EdtCodConvFinExit(Sender: TObject);
    procedure EdtCodConvIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodConvFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodConvIniKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsConvIniClick(Sender: TObject);
    procedure BtnConsConvFinClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCliConv: TFrmRelCliConv;

implementation
uses
  Udm, Ubibli1, UConsConvenio, UQRelClienteConv, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelCliConv.EdtCodConvIniExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;

   EdtNomeConvIni.Text:= consulta('convenio', EdtCodConvIni, 'cod_con', 'nome_con', dm.IBTransaction, dm.qConsulta);
   if EdtNomeConvIni.Text = '' then
      begin 
         AlertaCad('Convênio não Cadastrado');
//         EdtCodConvIni.SetFocus;
         EdtCodConvIni.SelectAll;
      end;
end;

procedure TFrmRelCliConv.EdtCodConvFinExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   EdtNomeConvFin.Text:= consulta('convenio', EdtCodConvFin, 'cod_con', 'nome_con', dm.IBTransaction, dm.qConsulta);
   if EdtNomeConvFin.Text = '' then
      begin 
         AlertaCad('Convênio não Cadastrado');
//         EdtCodConvFin.SetFocus;
         EdtCodConvFin.SelectAll;
      end;
end;

procedure TFrmRelCliConv.EdtCodConvIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConvIni.Click;
end;

procedure TFrmRelCliConv.EdtCodConvFinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConvFin.Click;
end;

procedure TFrmRelCliConv.EdtCodConvIniKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelCliConv.BtnConsConvIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
   FrmConsConvenio.Tag:= 5;
   FrmConsConvenio.ShowModal;
end;

procedure TFrmRelCliConv.BtnConsConvFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
   FrmConsConvenio.Tag:= 6;
   FrmConsConvenio.ShowModal;
end;

procedure TFrmRelCliConv.BtnVisClick(Sender: TObject);
begin 
   if strtoint(EdtCodConvFin.Text) < strtoint(EdtCodConvIni.Text) then
      begin 
         AlertaCad('O convênio final não pode ser menor que o convênio inicial');
//         EdtCodConvFin.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCli do
      begin 
         close;
         Parambyname('codcon_ini').Value := EdtCodConvIni.Text;
         Parambyname('codcon_fin').Value := EdtCodConvFin.Text;
         open;
      end;
   Application.CreateForm(TFrmQRelClienteConvenio, FrmQRelClienteConvenio);
   FrmQRelClienteConvenio.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   if sender = btnvis then
      begin 
         FrmQRelClienteConvenio.QRCli.PreviewInitialState:= wsMaximized;
         FrmQRelClienteConvenio.QRCli.Preview;
      end
   else
      begin 
         FrmQRelClienteConvenio.QRCli.PrinterSetup;
         FrmQRelClienteConvenio.QRCli.Print;
      end;
   FrmQRelClienteConvenio.QRCli.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelCli.Close;
end;

procedure TFrmRelCliConv.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelCliConv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelCliConv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelCliConv.FormShow(Sender: TObject);
begin 
   Limpaedit(FrmRelCliConv);
   EdtCodConvIni.SetFocus;
end;

procedure TFrmRelCliConv.BtnSairClick(Sender: TObject);
begin 
   close;
end;

end.
