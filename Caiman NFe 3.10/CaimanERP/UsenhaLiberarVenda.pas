unit UsenhaLiberarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, jpeg, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmSenhaLiberaVenda = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtSenha: TEdit;
    QSenha: TFDQuery;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenhaLiberaVenda: TFrmSenhaLiberaVenda;

implementation
uses
  Udm, UVenda, UFechaVenda, UContasRecRec, UNovoPrincipal;
var sSenha : string;

{$R *.dfm}

procedure TFrmSenhaLiberaVenda.FormShow(Sender: TObject);
begin 
   EdtSenha.Clear;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QSenha do
          begin 
             close;
             UnPrepare;
             Parambyname('codemp').value := iEmp;
             Prepare;
             Open;
             sSenha:= trim(fieldbyname('senha_excluir_venda').AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a senha');
     end;
   finally
     qsenha.UnPrepare;
     QSenha.Close;
     edtsenha.SetFocus;
   end;
end;

procedure TFrmSenhaLiberaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmSenhaLiberaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmSenhaLiberaVenda.EdtSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         if sSenha = trim(edtsenha.Text) then
            begin 
               case FrmSenhaLiberaVenda.tag of
                 0,2,4: bVendaLiberada := true;
                 1: bDescLiberado      := true;
                 5: bSituacao          := true;
               end;
               close;
            end
         else
            begin 
               case FrmSenhaLiberaVenda.tag of
                 0,2,4: bVendaLiberada := false;
                 1: bDescLiberado      := false;
                 5: bSituacao          := false;
               end;
               AlertaCad('Senha Inválida');
               EdtSenha.Clear;
//               edtsenha.SetFocus;
            end;
      end;
end;

end.
