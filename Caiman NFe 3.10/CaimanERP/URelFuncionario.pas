unit URelFuncionario;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, ComCtrls, StdCtrls, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario;
type
  TFrmRelFuncionario = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFuncionario: TFrmRelFuncionario;

implementation
Uses Udm, UNovoPrincipal, UQRelFunc;

{$R *.dfm}

procedure TFrmRelFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QFunc.Close;
  Action:= caFree;
end;

procedure TFrmRelFuncionario.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QFunc do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM FUNCIONARIO ORDER BY COD_FUN')
        else
           sql.Add('SELECT * FROM FUNCIONARIO ORDER BY NOME_FUN');
        open;
     end;
  Application.CreateForm(TFrmQRelFunc, FrmQRelFunc);
  FrmQRelFunc.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelFunc.QRfunc.PreviewInitialState:= wsMaximized;
        FrmQRelFunc.QRfunc.Preview;
     end
  else
     begin 
        FrmQRelFunc.QRfunc.PrinterSetup;
        FrmQRelFunc.QRfunc.Print;
     end;
  FrmQRelFunc.QRfunc.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QFunc.Close;
end;

end.









