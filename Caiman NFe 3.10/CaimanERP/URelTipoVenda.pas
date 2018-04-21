unit URelTipoVenda;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelTipoVenda = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelTipoVenda: TFrmRelTipoVenda;

implementation
uses Udm, UNovoPrincipal, UQRelTipoVenda;

{$R *.dfm}

procedure TFrmRelTipoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoVenda.Close;
  Action:= caFree;
end;

procedure TFrmRelTipoVenda.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTipoVenda do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM TIPO_VENDA ORDER BY COD_TPV')
        else
           sql.Add('SELECT * FROM TIPO_VENDA ORDER BY NOME_TPV');
        open;
     end;
  Application.CreateForm(TFrmQRelTPV, FrmQRelTPV);
  FrmQRelTPV.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelTPV.QRTPV.PreviewInitialState:= wsMaximized;
        FrmQRelTPV.QRTPV.Preview;
     end
  else
     begin 
        FrmQRelTPV.QRTPV.PrinterSetup;
        FrmQRelTPV.QRTPV.Print;
     end;
  FrmQRelTPV.QRTPV.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QTipoVenda.Close;
end;

end.
