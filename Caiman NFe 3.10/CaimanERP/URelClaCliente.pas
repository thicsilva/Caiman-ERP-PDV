unit URelClaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UFRMRELATORIO, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelClaCliente = class(TFrmRelatorio)
    QRelClassif: TFDQuery;
    DSQRelClassif: TDataSource;
    QRelClassifCOD_CLA: TIntegerField;
    QRelClassifNOME_CLA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClaCliente: TFrmRelClaCliente;

implementation
uses
  Udm, UQRelCadClassif, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelClaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QRelClassif.Close;
  Action:= caFree;
end;

procedure TFrmRelClaCliente.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelClassif do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM CLASSIF_CLIENTE ORDER BY COD_CLA')
        else
           sql.Add('SELECT * FROM CLASSIF_CLIENTE ORDER BY NOME_CLA');
        open;
     end;
  Application.CreateForm(TFrmQRelCadClassif, FrmQRelCadClassif);
  FrmQRelCadClassif.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelCadClassif.QRClassif.PreviewInitialState:= wsMaximized;
        FrmQRelCadClassif.QRClassif.Preview;
     end
  else
     begin 
        FrmQRelCadClassif.QRClassif.PrinterSetup;
        FrmQRelCadClassif.QRClassif.Print;
     end;
  FrmQRelCadClassif.QRClassif.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelClassif.Close;
end;

end.
