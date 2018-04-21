unit UConsSaldoCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmSaldoCC = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    BtnSair: TButton;
    QSaldoCC: TFDQuery;
    DSQSaldoCC: TDataSource;
    QSaldoCCCODIGO_CONTA: TIntegerField;
    QSaldoCCNOME_CONTA: TStringField;
    QSaldoCCSALDO_CONCILIADO: TBCDField;
    QSaldoCCSALDO: TBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaldoCC: TFrmSaldoCC;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmSaldoCC.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmSaldoCC.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QSaldoCC.Close;
   Action:= caFree;
end;

procedure TFrmSaldoCC.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmSaldoCC.FormShow(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   QSaldoCC.Open;
end;

procedure TFrmSaldoCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
