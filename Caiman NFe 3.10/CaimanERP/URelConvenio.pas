unit URelConvenio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UFRMRELATORIO, StdCtrls, ExtCtrls, Buttons, DB, ComCtrls, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;


type
  TFrmRelConvenio = class(TFrmRelatorio)
    QRelConv: TFDQuery;
    DSQRelConv: TDataSource;
    QRelConvCOD_CON: TIntegerField;
    QRelConvNOME_CON: TStringField;
    QRelConvTEL_CON: TStringField;
    QRelConvRESPONSAVEL_CON: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelConvenio: TFrmRelConvenio;

implementation
uses
  Udm, UQRelCadConvenio, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelConvenio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QRelConv.Close;
  action:= caFree;
end;

procedure TFrmRelConvenio.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelConv do
     begin 
        close;
        sql.Clear;
        if rdg.ItemIndex = 0 then
           sql.Add('SELECT COD_CON, NOME_CON, TEL_CON, RESPONSAVEL_CON FROM CONVENIO ORDER BY COD_CON')
        else
           sql.Add('SELECT COD_CON, NOME_CON, TEL_CON, RESPONSAVEL_CON FROM CONVENIO ORDER BY NOME_CON');
        open;
     end;
  Application.CreateForm(TFrmQRelConv, FrmQRelConv);
  FrmQRelConv.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelConv.QRConv.PreviewInitialState:= wsMaximized;
        FrmQRelConv.QRConv.Preview;
     end
  else
     begin 
        FrmQRelConv.QRConv.PrinterSetup;
        FrmQRelConv.QRConv.Print;
     end;
  FrmQRelConv.QRConv.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelConv.Close;
end;

end.
