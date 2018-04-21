unit URelMotivo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, ComCtrls, StdCtrls, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelMotivo = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMotivo: TFrmRelMotivo;

implementation
Uses Udm, UNovoPrincipal, UQRelMotivo;

{$R *.dfm}

procedure TFrmRelMotivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QMotivo.Close;
  Action:= caFree;
end;

procedure TFrmRelMotivo.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QMotivo do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM MOTIVO_ACERTO ORDER BY COD_MOT')
        else
           sql.Add('SELECT * FROM MOTIVO_ACERTO ORDER BY NOME_MOT');
        open;
     end;
  Application.CreateForm(TFrmQRelMotivo, FrmQRelMotivo);
  FrmQRelMotivo.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelMotivo.QRMot.PreviewInitialState:= wsMaximized;
        FrmQRelMotivo.QRMot.Preview;
     end
  else
     begin 
        FrmQRelMotivo.QRMot.PrinterSetup;
        FrmQRelMotivo.QRMot.Print;
     end;
  FrmQRelMotivo.QRMot.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QMotivo.Close;
end;

end.
