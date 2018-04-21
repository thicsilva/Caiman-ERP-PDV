unit URelClienteGeral;

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
  TFrmRelClienteGeral = class(TFrmRelatorio)
    QRelCliente: TFDQuery;
    QRelClienteCOD_CLI: TIntegerField;
    QRelClienteNOME_CLI: TStringField;
    QRelClienteNASCIMENTO_CLI: TDateField;
    QRelClienteTELRES_CLI: TStringField;
    QRelClienteNOME_CON: TStringField;
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClienteGeral: TFrmRelClienteGeral;

implementation
uses
  Udm, UNovoPrincipal, UQRelClienteGeral;
var sSql: string;

{$R *.dfm}

procedure TFrmRelClienteGeral.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelCliente do
     begin 
        close;
        sql.Clear;
        sql.Text:= sSql;
        if rdg.ItemIndex = 0 then
           sql.Add(' ORDER BY COD_CLI')
        else
           sql.Add(' ORDER BY NOME_CLI');
        open;
     end;
  Application.CreateForm(TFrmQRelCliGeral, FrmQRelCliGeral);
  FrmQRelCliGeral.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelCliGeral.QRCli.PreviewInitialState:= wsMaximized;
        FrmQRelCliGeral.QRCli.Preview;
     end
  else
     begin 
        FrmQRelCliGeral.QRCli.PrinterSetup;
        FrmQRelCliGeral.QRCli.Print;
     end;
  FrmQRelCliGeral.QRCli.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelCliente.Close;
end;

procedure TFrmRelClienteGeral.FormShow(Sender: TObject);
begin 
  inherited;
  sSql:= QRelCliente.SQL.Text;
end;

procedure TFrmRelClienteGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QRelCliente.SQL.Clear;
  QRelCliente.SQL.Text:= sSql;
  QRelCliente.Close;
  Action:= caFree;
end;

end.
