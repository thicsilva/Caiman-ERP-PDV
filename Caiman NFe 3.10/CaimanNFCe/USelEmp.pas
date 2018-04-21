unit USelEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, DB, Grids, DBGrids, ComCtrls, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmSelEmp = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    QEmp: TFDQuery;
    DSQEmp: TDataSource;
    BtnOk: TButton;
    BtnSair: TButton;
    SB: TStatusBar;
    QEmpCOD_EMP: TIntegerField;
    QEmpRAZAO_EMP: TStringField;
    QEmpCNPJ_EMP: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaEmpresas;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelEmp: TFrmSelEmp;

implementation
uses
  Udm, UPadraoPafEcf;
var  bFechaForm : boolean;

{$R *.dfm}

procedure TFrmSelEmp.BuscaEmpresas;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QEmp do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT U.COD_EMP, E.CNPJ_EMP, E.RAZAO_EMP ' +
                 'FROM EMPRESA_USUARIO U ' +
                 'INNER JOIN EMPRESA E ' +
                 'ON (U.COD_EMP = E.COD_EMP) ' +
                 'WHERE U.COD_USU = :CODUSU  ' +
                 'ORDER BY U.COD_EMP');
         Parambyname('codusu').AsInteger:= iCodUsu;
         open;
         if not (fieldbyname('cod_emp').IsNull) then
            btnok.Enabled:= true
         else
            btnok.Enabled:= false;
         first;
      end;
   dm.IBTransaction.CommitRetaining;
   dbgrid1.SetFocus;
end;

procedure TFrmSelEmp.BtnSairClick(Sender: TObject);
begin
   bFechaForm:= true;
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QEmp.Close;
   Application.Terminate;
end;

procedure TFrmSelEmp.FormShow(Sender: TObject);
begin
   bFechaForm:= false;
   BuscaEmpresas;
end;

procedure TFrmSelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmSelEmp.BtnOkClick(Sender: TObject);
begin
   iEmp:= QEmpCOD_EMP.AsInteger;
   sCnpj := QEmpCNPJ_EMP.AsString;
   FrmPadraoPafECf.sb.Panels[3].Text:= QEmpRAZAO_EMP.AsString;

   bFechaForm:= true;
   close;
end;

procedure TFrmSelEmp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmSelEmp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:= bFechaForm;
end;

end.
