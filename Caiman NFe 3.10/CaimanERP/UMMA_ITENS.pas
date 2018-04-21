unit UMMA_ITENS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, Grids, DBGrids, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmMMA_ITENS = class(UNovoFormulario.TForm)
    itens: TFDQuery;
    DataSource1: TDataSource;
    itensCOD: TIntegerField;
    itensCOD_OS: TIntegerField;
    itensCOD_PROD: TIntegerField;
    itensDESCRICAO: TStringField;
    itensUNID: TStringField;
    itensQUANT: TFloatField;
    itensVALOR_UNID: TFloatField;
    itensDESCONTO: TFloatField;
    itensVALOR_TOTAL: TFloatField;
    itensCOBRAR: TStringField;
    DBGrid2: TDBGrid;
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OS: Integer;
  end;

var
  frmMMA_ITENS: TfrmMMA_ITENS;

implementation

uses
  UMMA_OS, UDM, UNovoPrincipal;
{$R *.dfm}

procedure TfrmMMA_ITENS.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
  if trim(itensCOBRAR.AsString) = 'S' then
  begin 
    DBGrid2.Canvas.Brush.Color := $00E1FFD7;
    DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[DataCol].field, State);
  end
  else
  begin 
    DBGrid2.Canvas.Brush.Color := clwhite;
    DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[DataCol].field, State);
  end;

end;

procedure TfrmMMA_ITENS.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  itens.Close;
  Action := cafree;
end;

procedure TfrmMMA_ITENS.FormCreate(Sender: TObject);
begin 
   
end;

procedure TfrmMMA_ITENS.FormShow(Sender: TObject);
begin 
  itens.Close;
  itens.SQL.Text := 'select * from MMA_ORDEM_ITENS where COD_OS=' + inttostr
    (OS);
  itens.Open;

end;

end.
