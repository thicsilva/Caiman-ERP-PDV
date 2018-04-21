unit URelBanco;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelBanco = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelBanco: TFrmRelBanco;

implementation
Uses UDM, UNovoPrincipal, UQRelBanco;

{$R *.dfm}

procedure TFrmRelBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QBanco.Close;
  Action:= caFree;
end;

procedure TFrmRelBanco.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QBanco do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM BANCO ORDER BY COD_BAN')
        else
           sql.Add('SELECT * FROM BANCO ORDER BY NOME_BAN');
        open;
     end;
  Application.CreateForm(TFrmQRelBanco, FrmQRelBanco);
  FrmQRelBanco.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelBanco.QRBan.PreviewInitialState:= wsMaximized;
        FrmQRelBanco.QRBan.Preview;
     end
  else
     begin 
        FrmQRelBanco.QRBan.PrinterSetup;
        FrmQRelBanco.QRBan.Print;
     end;
  FrmQRelBanco.QRBan.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QBanco.Close;
end;

end.
