unit URelFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, ExtCtrls, Buttons, DB, ComCtrls, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;


type
  TFrmRelFor = class(TFrmRelatorio)
    QRelFor: TFDQuery;
    DSQRelFor: TDataSource;
    QRelForCOD_FOR: TIntegerField;
    QRelForRAZAO_FOR: TStringField;
    QRelForTEL_FOR: TStringField;
    QRelForFAX_FOR: TStringField;
    QRelForCONTATO_FOR: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFor: TFrmRelFor;

implementation
uses
  Udm, UNovoPrincipal, UQRelCadFor;

{$R *.dfm}

procedure TFrmRelFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QRelFor.Close;
  action:= caFree;
end;

procedure TFrmRelFor.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelFor do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FORNECEDOR ORDER BY COD_FOR')
        else
           sql.Add('SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR FROM FORNECEDOR ORDER BY RAZAO_FOR');
        open;
     end;
  Application.CreateForm(TFrmQRelCadFor, FrmQRelCadFor);   
  FrmQRelCadFor.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelCadFor.QRFor.PreviewInitialState:= wsMaximized;
        FrmQRelCadFor.QRFor.Preview;
     end
  else
     begin 
        FrmQRelCadFor.QRFor.PrinterSetup;
        FrmQRelCadFor.QRFor.Print;
     end;
  FrmQRelCadFor.QRFor.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelFor.Close;
end;

end.
