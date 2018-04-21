unit UAlterarSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, pngimage, UNovosComponentes, 
  UNovoFormulario;

type
  TFrmAlterarSenha = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdtUsuario: TEdit;
    Label2: TLabel;
    EdtSenhaAtual: TEdit;
    Label3: TLabel;
    EdtNovaSenha: TEdit;
    Label4: TLabel;
    EdtNovaSenha1: TEdit;
    BtnOK: TButton;
    BtnCancelar: TButton;
    Image1: TImage;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure Limpa;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarSenha: TFrmAlterarSenha;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmAlterarSenha.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAlterarSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   Action:= caFree;
end;

procedure TFrmAlterarSenha.Limpa;
begin 
   EdtUsuario.Clear;
   EdtSenhaAtual.Clear;
   EdtNovaSenha.Clear;
   EdtNovaSenha1.Clear;
   EdtUsuario.SetFocus;
end;

procedure TFrmAlterarSenha.BtnOKClick(Sender: TObject);
var iAuxCod : integer;
    sSenhaAtual : string;
begin 
   iAuxCod:= 0;
   sSenhaAtual:= '';

   if EdtUsuario.Text = '' then
      begin 
         AlertaCad('Digite o Nome do Usuário');
//         EdtUsuario.SetFocus;
         exit;
      end;

   if (EdtNovaSenha.Text = '') or (EdtNovaSenha1.Text = '') then
      begin 
         AlertaCad('Digite a Nova Senha');
//         EdtNovaSenha.SetFocus;
         exit;
      end;

    if trim(EdtNovaSenha.Text) <> trim(EdtNovaSenha1.Text) then
       begin 
          AlertaCad('Nova Senha não Confere');
//          EdtNovaSenha.SetFocus;
          exit;
       end;

   {busca o usuario e senha atual}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT COD_USU, SENHA_USU ' +
                     'FROM USUARIO ' +
                     'WHERE NOME_USU = ' + #39 + trim(EdtUsuario.Text) + #39);
             Open;
             if not fieldbyname('cod_usu').IsNull then
                begin 
                   iAuxCod    := fieldbyname('cod_usu').AsInteger;
                   sSenhaAtual:= fieldbyname('senha_usu').AsString;
                end
             else
                begin 
                   iAuxCod:= 0;
                   sSenhaAtual:= '';
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do usuário');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if iAuxCod > 0 then //usuário cadastrado
      begin 
         if trim(EdtSenhaAtual.Text) <> trim(sSenhaAtual) then
            begin 
               AlertaCad('Senha atual não confere');
//               EdtSenhaAtual.SetFocus;
               exit;
            end;

         {atualizando a senha}
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('UPDATE USUARIO ' +
                           'SET SENHA_USU = ' + #39 + trim(EdtNovaSenha.Text) + #39 +
                           ' WHERE COD_USU = :CODUSU');
                   Parambyname('codusu').AsInteger:= iAuxCod;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
             AlertaCad('Senha Atualizada com sucesso');
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao atualizar a senha');
           end;
         finally
           dm.QConsulta.Close;
           Limpa;
           FrmAlterarSenha.Close;
         end;
      end
   else
      begin 
         AlertaCad('Usuário não Cadastrado');
         Limpa;
//         EdtUsuario.SetFocus;
      end;
end;

procedure TFrmAlterarSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAlterarSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
