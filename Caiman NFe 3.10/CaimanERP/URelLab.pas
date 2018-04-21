unit URelLab;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelLab = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelLab: TFrmRelLab;

implementation
Uses Udm, UNovoPrincipal, UQRelCadLab;

{$R *.dfm}

procedure TFrmRelLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QLab.Close;
  action:= caFree;
end;

procedure TFrmRelLab.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QLab do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM LABORATORIO ORDER BY COD_LAB')
        else
           sql.Add('SELECT * FROM LABORATORIO ORDER BY NOME_LAB');
        open;
     end;
  Application.CreateForm(TFrmQRelCadLab, FrmQRelCadLab);
  FrmQRelCadLab.QRLTitulo.Caption := 'Relatório de Fabricante';
  FrmQRelCadLab.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelCadLab.QRelLab.PreviewInitialState:= wsMaximized;
        FrmQRelCadLab.QRelLab.Preview;
     end
  else
     begin 
        FrmQRelCadLab.QRelLab.PrinterSetup;
        FrmQRelCadLab.QRelLab.Print;
     end;
  FrmQRelCadLab.QRelLab.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QLab.Close;
end;

end.
