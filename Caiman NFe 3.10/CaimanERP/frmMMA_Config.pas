unit frmMMA_Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, IBTable, StdCtrls, DBCtrls, Buttons, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmMMA_ConfigT = class(UNovoFormulario.TForm)
    IBTable1: TFDTable;
    IBTable1COD: TIntegerField;
    IBTable1TERMO_ENTRADA: TWideMemoField;
    IBTable1TERMO_SAIDA: TWideMemoField;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    salvar: TsSpeedButton;
    cancelar: TsSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cancelarClick(Sender: TObject);
    procedure salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMMA_ConfigT: TfrmMMA_ConfigT;

implementation

uses
  UDM, UMMA_OS, UNovoPrincipal;

{$R *.dfm}

procedure TfrmMMA_ConfigT.cancelarClick(Sender: TObject);
begin 
   IBtable1.Cancel;
   Close;
end;

procedure TfrmMMA_ConfigT.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if ( DataSource1.State = dsEdit ) or ( DataSource1.State = dsinsert ) then
      IBtable1.Cancel;

   IBTable1.Close;

   Action := caFree;
end;

procedure TfrmMMA_ConfigT.FormShow(Sender: TObject);
begin 
   IBtable1.Active := True;
   IBtable1.Edit;
end;

procedure TfrmMMA_ConfigT.salvarClick(Sender: TObject);
begin 
   IBTable1.Post;
   Close;
end;

end.
