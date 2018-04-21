unit UMarcarProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmMarcarProd = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    RDGTipo: TRadioGroup;
    DBGrid1: TDBGrid;
    BtnOK: TButton;
    BtnSair: TButton;
    RDGOrdem: TRadioGroup;
    QConsProd: TFDQuery;
    DSQConsProd: TDataSource;
    QConsProdCOD_PRO: TIntegerField;
    QConsProdNOME_PRO: TStringField;
    QConsProdSAIR_TABELA_PRECO: TStringField;
    QConsProdVALOR_PRO: TBCDField;
    QConsProdPRECO_REVENDA: TBCDField;
    IBSQLTabela: TFDQuery;
    IBTRTabela: TFDTransaction;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarcarProd: TFrmMarcarProd;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmMarcarProd.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmMarcarProd.FormShow(Sender: TObject);
begin 
   RDGTipo.ItemIndex:= 0;
   RDGOrdem.ItemIndex:= 1;
end;

procedure TFrmMarcarProd.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsProd do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT COD_PRO, NOME_PRO, SAIR_TABELA_PRECO, VALOR_PRO, PRECO_REVENDA ' +
                 'FROM PRODUTO');
         case RDGTipo.ItemIndex of
           0: sql.add(' WHERE SAIR_TABELA_PRECO = ' + #39 + 'S' + #39);
           1: sql.add(' WHERE SAIR_TABELA_PRECO = ' + #39 + 'N' + #39 +
                      ' OR SAIR_TABELA_PRECO IS NULL');
         end;
         case RDGOrdem.ItemIndex of
           0: sql.Add(' ORDER BY COD_PRO');
           1: sql.add(' ORDER BY NOME_PRO');
         end;
         open;
      end;
end;

procedure TFrmMarcarProd.DBGrid1DblClick(Sender: TObject);
var iCod : integer;
begin 
   if not QConsProd.Eof then
      begin 
         QConsProd.DisableControls;
         QConsProd.next;
         iCod:= QConsProdCOD_PRO.AsInteger;
         QConsProd.Prior;
         QConsProd.EnableControls;
      end;
   if IBTRTabela.Active then
      IBTRTabela.Commit;
   IBTRTabela.StartTransaction;
   try
     try
       with IBSQLTabela do
          begin 
             close;
             sql.Clear;
             if (QConsProdSAIR_TABELA_PRECO.AsString = 'N') or
                (QConsProdSAIR_TABELA_PRECO.IsNull) then
                  begin 
                     sql.add('UPDATE PRODUTO SET SAIR_TABELA_PRECO = ' + #39 + 'S' + #39 +
                             ' WHERE COD_PRO = :CODPRO');
                     Parambyname('codpro').AsInteger:= QConsProdCOD_PRO.AsInteger;
                     ExecOrOpen;
                  end
             else
                begin 
                   sql.add('UPDATE PRODUTO SET SAIR_TABELA_PRECO = ' + #39 + 'N' + #39 +
                           ' WHERE COD_PRO = :CODPRO');
                   Parambyname('codpro').AsInteger:= QConsProdCOD_PRO.AsInteger;
                   ExecOrOpen;
                end;
          end;
       IBTRTabela.Commit;
     except
       IBTRTabela.Rollback;
     end;
   finally
     IBSQLTabela.Close;
     BtnOK.Click;
     QConsProd.Locate('COD_PRO', iCod, []);
   end
end;

procedure TFrmMarcarProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsProd.close;
   Action:= caFree;
end;

procedure TFrmMarcarProd.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmMarcarProd.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      DBGrid1DblClick(DBGrid1);
end;

procedure TFrmMarcarProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
