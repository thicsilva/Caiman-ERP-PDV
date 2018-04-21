unit UGeraInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmGeraInventario = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB: TStatusBar;
    Label1: TLabel;
    EdtData: TDateTimePicker;
    Check: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    QInsert: TFDQuery;
    QInsertCODIGO: TIntegerField;
    CMD: TFDQuery;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeraInventario: TFrmGeraInventario;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmGeraInventario.Button2Click(Sender: TObject);
begin 
   close;
end;

procedure TFrmGeraInventario.FormShow(Sender: TObject);
begin 
   EdtData.Date:= date;
   EdtData.SetFocus;
end;

procedure TFrmGeraInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmGeraInventario.Button1Click(Sender: TObject);
var iAuxCod : integer;
    DataEstoque : TDate;
begin 
   {busca parametros}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT DATA_INICIO_ESTOQUE ' +
                     'FROM PARAMETROS ' +
                     'WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             DataEstoque := fieldbyname('data_inicio_estoque').AsDateTime;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os parametros');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { Incluindo na Tabela INVENTARIO_ESTOQUE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsert do
          begin 
             close;
             Parambyname('data').AsDate:= EdtData.Date;
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             iAuxCod:= QInsertCODIGO.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       iAuxCod:= 0;
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar na tabela INVENTÁRIO_ESTOQUE');
     end;
   finally
     dm.QConsulta.Close;
   end;

   sb.SimpleText:= 'Processando...';

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       CMD.SQL.Clear;
       CMD.SQL.Add( 'execute procedure SP_GERA_INVENTARIO(  :COD_EMP, :DATA_ESTOQUE, :DATA_INV, :COD_INV,:ZERADO );');
       cmd.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
       cmd.ParamByName( 'DATA_ESTOQUE' ).AsDate := DataEstoque;
       cmd.ParamByName( 'DATA_INV' ).AsDate := EdtData.Date;
       cmd.ParamByName( 'COD_INV' ).AsInteger := iAuxCod;
       if Check.Checked then
          cmd.ParamByName( 'ZERADO' ).AsString := 'S'
       else
          cmd.ParamByName( 'ZERADO' ).AsString := 'N';
{       with IBSP do
          begin 
             close;
             Params[0].AsInteger := iEmp;
             Params[1].AsDate    := DataEstoque;
             Params[2].AsDate    := EdtData.Date;
             Params[3].AsInteger := iAuxCod;
             if Check.Checked then
                Params[4].AsString:= 'S'
             else
                Params[4].AsString:= 'N';
             ExecProc;
          end;}
          cmd.Prepare;
          cmd.ExecOrOpen;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gerar o Inventário');
     end;
   finally
//     IBSP.Close;
     Cmd.Close;
   end;

   sb.SimpleText:= 'Concluído';
end;

procedure TFrmGeraInventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
