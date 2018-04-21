unit UCadGrupoUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, Data.DB, acAlphaImageList, dxStatusBar;

type
  TFrmCadGrupoUsuario = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_grupo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    CheckGrupo: TCheckBox;
    IBSQLGRU: TFDQuery;
    IBTRGRU: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadGrupoUsuario: TFrmCadGrupoUsuario;

implementation
uses
  Udm, Ubibli1, UConsGrupoUsuario, UNovoPrincipal;
Var vl_grava : boolean;

{$R *.dfm}

function FrmCadGrupoUsuario: TFrmCadGrupoUsuario;
begin
   Result := TFrmCadGrupoUsuario( BuscaFormulario( TFrmCadGrupoUsuario, False ) );
end;

procedure TFrmCadGrupoUsuario.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadGrupoUsuario, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadGrupoUsuario);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadGrupoUsuario);
         EDedit(FrmCadGrupoUsuario, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmCadGrupoUsuario.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        Botoes('N');
        edtnome.SetFocus;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadGrupoUsuario.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadGrupoUsuario.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadGrupoUsuario.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadGrupoUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRGRU.Active then
     IBTRGRU.Commit;
  IBSQLGRU.Close;
  Action:= caFree;
end;

procedure TFrmCadGrupoUsuario.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Grupo');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRGRU.Active then
     IBTRGRU.Commit;
  IBTRGRU.StartTransaction;
  try
    try
      with IBSQLGRU do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_grupo.Text:= inttostr(prxcod('grupo_usuario', 'cod_grupo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO GRUPO_USUARIO(COD_GRUPO, NOME_GRUPO, SUPER_GRUPO) VALUES(:CODGRUPO, :NOMEGRUPO, :SUPERGRUPO)');
              end
           else
              begin 
                 sql.Add('UPDATE GRUPO_USUARIO SET NOME_GRUPO = :NOMEGRUPO, SUPER_GRUPO = :SUPERGRUPO WHERE COD_GRUPO = :CODGRUPO');
              end;
           Parambyname('codgrupo').AsInteger     := strtoint(cod_grupo.Text);
           Parambyname('nomegrupo').AsString     := edtnome.Text;
           if CheckGrupo.Checked then
              Parambyname('supergrupo').AsString := 'S'
           else
              Parambyname('supergrupo').AsString := 'N';
           ExecOrOpen;
        end;
      IBTRGRU.Commit;
      Botoes('G');
    except
      IBTRGRU.Rollback;
      AlertaCad('Erro ao Gravar o Grupo de Usuário');
    end;
  finally
    IBSQLGRU.Close;
  end;
end;

procedure TFrmCadGrupoUsuario.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  excluir(FrmCadGrupoUsuario, 'grupo_usuario', cod_grupo, IBSQLGRU, IBTRGRU);
  Botoes('E');
end;

procedure TFrmCadGrupoUsuario.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGrupoUsuario, FrmConsGrupoUsuario);
  FrmConsGrupoUsuario.tag:= 0;
  FrmConsGrupoUsuario.showmodal;
end;

end.
