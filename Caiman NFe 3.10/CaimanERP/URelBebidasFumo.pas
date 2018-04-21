unit URelBebidasFumo;

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
  TFrmRelBebidasFumo = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QNFBebidas: TFDQuery;
    QNFBebidasCODPRO: TIntegerField;
    QNFBebidasNOMEPRO: TStringField;
    QNFBebidasQUANT: TBCDField;
    QNFBebidasVALOR: TBCDField;
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmRelBebidasFumo: TFrmRelBebidasFumo;

implementation

uses
  UDM, UQRelBebidas, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelBebidasFumo.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then     //BEBIDAS FUMO
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QNFBebidas do
      begin 
         close;
         Parambyname('dataini').AsDate   := edtdataini.date;
         Parambyname('datafin').AsDate   := EdtDataFin.date;
         Parambyname('codemp').AsInteger := iEmp;
         open;
      end;
   Application.CreateForm(TFrmQRelBebidas, FrmQRelBebidas);
   FrmQRelBebidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelBebidas.QRLTitulo.Caption:= 'Relatório de Vendas de Bebidas Alcoólicas e Fumo ' +
                                      'no período: ' + datetostr(edtdataini.Date) + ' a ' +
                                      datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelBebidas.QRBebidas.PreviewInitialState:= wsMaximized;
         FrmQRelBebidas.QRBebidas.Preview;
      end
   else
      begin 
         FrmQRelBebidas.QRBebidas.PrinterSetup;
         FrmQRelBebidas.QRBebidas.Print;
      end;
   FrmQRelBebidas.QRBebidas.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QNFBebidas.Close;
end;

procedure TFrmRelBebidasFumo.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelBebidasFumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
end;

procedure TFrmRelBebidasFumo.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelBebidasFumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
