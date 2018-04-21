unit URelSecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UFRMRELATORIO, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelSecao = class(TFrmRelatorio)
    QRelSecao: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelSecao: TFrmRelSecao;

implementation
uses
  Udm, UNovoPrincipal, UQRelSec;

{$R *.dfm}

procedure TFrmRelSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSec.Close;
  Action:= caFree;
end;

procedure TFrmRelSecao.BtnVisClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelSecao do
     begin 
        close;
        sql.Clear;
        sql.Text:= 'SELECT S.COD_SEC, S.NOME_SEC, G.COD_GRUPO, G.DESCRICAO NOME_GRUPO, ' +
                   'SUB.COD_SUBGRUPO, SUB.DESCRICAO NOME_SUBGRUPO ' +
                   'FROM SECAO S ' +
                   'LEFT JOIN SECAO_GRUPO G ' +
                   'ON (S.COD_SEC = G.COD_SEC) ' +
                   'LEFT JOIN SECAO_GRUPO_SUBGRUPO SUB ' +
                   'ON (G.COD_SEC = SUB.COD_SEC AND G.COD_GRUPO = SUB.COD_GRUPO)';

        if rdg.ItemIndex = 0 then
           sql.add(' ORDER BY S.COD_SEC, G.COD_GRUPO, SUB.COD_SUBGRUPO')
        else
           sql.Add(' ORDER BY S.NOME_SEC, G.DESCRICAO, SUB.DESCRICAO');
        open;
     end;
  Application.CreateForm(TFrmQRelSec, FrmQRelSec);
  FrmQRelSec.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  if sender = btnvis then
     begin 
        FrmQRelSec.QRSec.PreviewInitialState:= wsMaximized;
        FrmQRelSec.QRSec.Preview;
     end
  else
     begin 
        FrmQRelSec.QRSec.PrinterSetup;
        FrmQRelSec.QRSec.Print;
     end;
  FrmQRelSec.QRSec.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  dm.QSec.Close;
end;

end.
