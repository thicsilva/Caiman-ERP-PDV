unit URelEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, Buttons, ExtCtrls, DB, ComCtrls, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelEmp = class(TFrmRelatorio)
    QRelEmp: TFDQuery;
    QRelEmpCOD_EMP: TIntegerField;
    QRelEmpRAZAO_EMP: TStringField;
    DSQRelEmp: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEmp: TFrmRelEmp;

implementation
uses
  Udm, UQRelCadEmp, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QRelEmp.Close;
  action:= caFree;
end;

procedure TFrmRelEmp.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelEmp do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT COD_EMP, RAZAO_EMP FROM EMPRESA ORDER BY COD_EMP')
        else
           sql.Add('SELECT COD_EMP, RAZAO_EMP FROM EMPRESA ORDER BY RAZAO_EMP');
        open;
     end;
  Application.CreateForm(TFrmQRelEmp, FrmQRelEmp);
  FrmQRelEmp.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelEmp.QREmp.PreviewInitialState:= wsMaximized;
        FrmQRelEmp.QREmp.Preview;
     end
  else
     begin 
        FrmQRelEmp.QREmp.PrinterSetup;
        FrmQRelEmp.QREmp.Print;
     end;
  FrmQRelEmp.QREmp.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelEmp.Close;
end;

end.
