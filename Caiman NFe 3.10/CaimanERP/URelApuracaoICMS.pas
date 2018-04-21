unit URelApuracaoICMS;

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
  TFrmRelApuracaoICMS = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GBPeriodo: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRel: TFDQuery;
    QRelCFOP: TIntegerField;
    QRelVALORCONTABIL: TBCDField;
    QRelBASECALCULO: TBCDField;
    QRelVALORICMS: TBCDField;
    QRelISENTAS: TBCDField;
    QRelOUTRAS: TBCDField;
    QRelTIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelApuracaoICMS: TFrmRelApuracaoICMS;

implementation
uses
  Udm, UQRelApuracaoICMS, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelApuracaoICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelApuracaoICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelApuracaoICMS.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelApuracaoICMS.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelApuracaoICMS.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRel do
      begin 
         close;
         Parambyname('dataini').AsDate    := EdtDataIni.Date;
         Parambyname('datafin').AsDate    := EdtDataFin.Date;
         Parambyname('codemp').AsInteger  := iEmp;
         Open;
      end;

   Application.CreateForm(TFrmQRelApuracao, FrmQRelApuracao);

   FrmQRelApuracao.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelApuracao.QRLTitulo.Caption:= 'Apuração do ICMS no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);

   if sender = btnvis then
      begin 
         FrmQRelApuracao.QRApuracaoICMS.PreviewInitialState:= wsMaximized;
         FrmQRelApuracao.QRApuracaoICMS.Preview;
      end
   else
      begin 
         FrmQRelApuracao.QRApuracaoICMS.PrinterSetup;
         FrmQRelApuracao.QRApuracaoICMS.Print;
      end;
   FrmQRelApuracao.QRApuracaoICMS.QRPrinter:= nil;

   dm.IBTransaction.Commit;
   QRel.Close;
end;

end.
