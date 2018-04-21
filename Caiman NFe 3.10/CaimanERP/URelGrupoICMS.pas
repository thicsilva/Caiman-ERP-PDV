unit URelGrupoICMS;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelGrupoICMS = class(TFrmRelatorio)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelGrupoICMS: TFrmRelGrupoICMS;

implementation
Uses Udm, UNovoPrincipal, UQRelCadGrp;

{$R *.dfm}

procedure TFrmRelGrupoICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QGRP.Close;
  action:= caFree;
end;

procedure TFrmRelGrupoICMS.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QGRP do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT * FROM GRUPO_ICMS ORDER BY COD_GRP')
        else
           sql.Add('SELECT * FROM GRUPO_ICMS ORDER BY NOME_GRP');
        open;
     end;
  Application.CreateForm(TFrmQRelGrp, FrmQRelGrp);
  FrmQRelGrp.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelGrp.QRGrp.PreviewInitialState:= wsMaximized;
        FrmQRelGrp.QRGrp.Preview;
     end
  else
     begin 
        FrmQRelGrp.QRGrp.PrinterSetup;
        FrmQRelGrp.QRGrp.Print;
     end;
  FrmQRelGrp.QRGrp.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QLab.Close;
end;

end.
