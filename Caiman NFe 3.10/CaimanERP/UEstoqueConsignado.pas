unit UEstoqueConsignado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, StdCtrls, DB, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmEstoqueConsignado = class(UNovoFormulario.TForm)
    texto: TLabel;
    DBGrid1: TDBGrid;
    EstoqueConsignado: TFDQuery;
    DEstoqueConsignado: TDataSource;
    Produto: TLabel;
    TRCon: TFDTransaction;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    COD_PRODUTO: integer;
    COD_EMP: integer;
  end;

var
  frmEstoqueConsignado: TfrmEstoqueConsignado;

implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

procedure TfrmEstoqueConsignado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   EstoqueConsignado.Close;
   if TRCon.Active then
      TRCon.Commit;

   Action := cafree;
end;

procedure TfrmEstoqueConsignado.FormShow(Sender: TObject);
begin 
   if TRCon.Active then
      TRCon.Commit;
   TRCon.StartTransaction;
   EstoqueConsignado.Close;
   EstoqueConsignado.ParamByName('COD_PRO').AsInteger := COD_PRODUTO;
   EstoqueConsignado.ParamByName('COD_EMP').AsInteger := COD_EMP;
   EstoqueConsignado.Open;
   produto.Caption := EstoqueConsignadoCOD_PRO.AsString + ' - ' + EstoqueConsignadoNOME_PRO.AsString;
end;

end.
