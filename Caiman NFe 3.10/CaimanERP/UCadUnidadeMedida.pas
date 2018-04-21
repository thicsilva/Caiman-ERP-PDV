unit UCadUnidadeMedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, 
  UNovosComponentes, UNovoFormulario, acAlphaImageList, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadUnidadeMedida = class(TFrmCadastroNovo)
    IBSQLUM: TFDQuery;
    IBTRUM: TFDTransaction;
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
  procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadUnidadeMedida: TFrmCadUnidadeMedida;

implementation
uses
  Udm, Ubibli1, UConsUnidadeMedida, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadUnidadeMedida: TFrmCadUnidadeMedida;
begin
   Result := TFrmCadUnidadeMedida( BuscaFormulario( TFrmCadUnidadeMedida, False ) );
end;

procedure TFrmCadUnidadeMedida.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadUnidadeMedida, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadUnidadeMedida);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadUnidadeMedida);
         EDedit(FrmCadUnidadeMedida, false);
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

procedure TFrmCadUnidadeMedida.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C027','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G'); 
end;

procedure TFrmCadUnidadeMedida.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C027','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus; 
end;

procedure TFrmCadUnidadeMedida.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadUnidadeMedida.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C027','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadUnidadeMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRUM.Active then
     IBTRUM.Commit;
  IBSQLUM.Close;
  Action:= caFree;
end;

procedure TFrmCadUnidadeMedida.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C027','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Unidade');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRUM.Active then
     IBTRUM.Commit;
  IBTRUM.StartTransaction;
  try
    try
      with IBSQLUM do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('unidade_medida', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO UNIDADE_MEDIDA(CODIGO, DESCRICAO) VALUES(:CODIGO, :DESCRICAO)');
              end
           else
              begin 
                 sql.Add('UPDATE UNIDADE_MEDIDA SET DESCRICAO = :DESCRICAO WHERE CODIGO = :CODIGO');
              end;
           Parambyname('codigo').AsInteger     := strtoint(codigo.Text);
           Parambyname('descricao').AsString   := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRUM.Commit;
      Botoes('G');
    except
      IBTRUM.Rollback;
      AlertaCad('Erro ao Gravar a Unidade');
    end;
  finally
    IBSQLUM.Close;
  end;
end;

procedure TFrmCadUnidadeMedida.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C027','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadUnidadeMedida, 'unidade_medida', codigo, IBSQLUM, IBTRUM);
  Botoes('E');
end;

procedure TFrmCadUnidadeMedida.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsUnidadeMedida, FrmConsUnidadeMedida);
  FrmConsUnidadeMedida.tag:= 0;
  FrmConsUnidadeMedida.showmodal;
end;

end.

