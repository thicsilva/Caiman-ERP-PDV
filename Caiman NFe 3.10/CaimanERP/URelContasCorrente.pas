unit URelContasCorrente;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelContasCorrente = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelContasCorrente: TFrmRelContasCorrente;

implementation
uses Udm, UNovoPrincipal, UQRelConta;

{$R *.dfm}

procedure TFrmRelContasCorrente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QConta.Close;
  Action:= caFree;
end;

procedure TFrmRelContasCorrente.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QConta do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM CONTAS_CORRENTE ORDER BY COD_CONTA')
        else
           sql.Add('SELECT * FROM CONTAS_CORRENTE ORDER BY NOME_CONTA');
        open;
     end;
  Application.CreateForm(TFrmQRelConta, FrmQRelConta);
  FrmQRelConta.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelConta.QRCon.PreviewInitialState:= wsMaximized;
        FrmQRelConta.QRCon.Preview;
     end
  else
     begin 
        FrmQRelConta.QRCon.PrinterSetup;
        FrmQRelConta.QRCon.Print;
     end;
  FrmQRelConta.QRCon.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QConta.Close;
end;

end.
