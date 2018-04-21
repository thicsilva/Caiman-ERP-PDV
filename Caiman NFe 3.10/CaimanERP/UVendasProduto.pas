unit UVendasProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, StdCtrls, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmVendasProduto = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    QConsProdVenda: TFDQuery;
    IBTRProdVenda: TFDTransaction;
    QConsProdVendaCOD_VEN: TIntegerField;
    QConsProdVendaDATA_VEN: TDateField;
    DSQConsProdVenda: TDataSource;
    QConsProdVendaVALOR: TBCDField;
    BtnSair: TButton;
    QConsProdVendaQUANT: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendasProduto: TFrmVendasProduto;

implementation
uses
  Udm, UProdutoCliente, UNovoPrincipal;

{$R *.dfm}

procedure TFrmVendasProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IF IBTRProdVenda.Active then
      IBTRProdVenda.Commit;
   QConsProdVenda.Close;
   Action:= caFree;
end;

procedure TFrmVendasProduto.BtnSairClick(Sender: TObject);
begin
   close;
end;

end.

