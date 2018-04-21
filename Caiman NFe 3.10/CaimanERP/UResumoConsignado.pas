unit UResumoConsignado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TfrmResumoConsignado = class(UNovoFormulario.TForm)
    EstoqueConsignado: TFDQuery;
    EstoqueConsignadoCOD: TIntegerField;
    EstoqueConsignadoCOD_EMP: TIntegerField;
    EstoqueConsignadoCOD_PRO: TIntegerField;
    EstoqueConsignadoCODIGO_LOCAL_ESTOQUE: TIntegerField;
    EstoqueConsignadoCOD_CLI: TIntegerField;
    EstoqueConsignadoQUANT: TFloatField;
    EstoqueConsignadoCOD_VENDA: TIntegerField;
    EstoqueConsignadoDATA: TDateField;
    EstoqueConsignadoORDEM: TIntegerField;
    EstoqueConsignadoNOME_CLI: TStringField;
    EstoqueConsignadoTELRES_CLI: TStringField;
    EstoqueConsignadoCELULAR_CLI: TStringField;
    EstoqueConsignadoNOME_PRO: TStringField;
    DEstoqueConsignado: TDataSource;
    TRCon: TFDTransaction;
    DBGrid1: TDBGrid;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    COD_EMP: integer;
  end;

var
  frmResumoConsignado: TfrmResumoConsignado;

implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

procedure TfrmResumoConsignado.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin 
  if EstoqueConsignadoDATA.AsDateTime < ( date -2 ) then
  begin 
    DBGrid1.Canvas.Brush.Color := $00BBBBFF;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
end;

procedure TfrmResumoConsignado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   EstoqueConsignado.Close;
   if TRCon.Active then
      TRCon.Commit;

   Action := cafree;
end;

procedure TfrmResumoConsignado.FormShow(Sender: TObject);
begin 
   if TRCon.Active then
      TRCon.Commit;
   TRCon.StartTransaction;
   EstoqueConsignado.Close;

   EstoqueConsignado.ParamByName('COD_EMP').AsInteger := COD_EMP;
   EstoqueConsignado.Open;

end;

end.
