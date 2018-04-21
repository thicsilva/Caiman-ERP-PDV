unit UCadTipoCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadTipoCobranca = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_cob: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLCob: TFDQuery;
    IBTRCob: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadTipoCobranca: TFrmCadTipoCobranca;

implementation
uses
  Udm, Ubibli1, UConsTipoCobranca, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadTipoCobranca: TFrmCadTipoCobranca;
begin
   Result := TFrmCadTipoCobranca( BuscaFormulario( TFrmCadTipoCobranca, False ) );
end;

procedure TFrmCadTipoCobranca.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTipoCobranca, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTipoCobranca);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTipoCobranca);
         EDedit(FrmCadTipoCobranca, false);
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

procedure TFrmCadTipoCobranca.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C023','I') then
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

procedure TFrmCadTipoCobranca.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C023','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoCobranca.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  botoes('C');
end;

procedure TFrmCadTipoCobranca.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C023','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCob.Active then
     IBTRCob.Commit;
  IBSQLCob.Close;
  Action:= caFree;
end;

procedure TFrmCadTipoCobranca.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C023','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Tipo de Cobrança');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRCob.Active then
     IBTRCob.Commit;
  IBTRCob.StartTransaction;
  try
    try
      with IBSQLCob do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_cob.Text:= inttostr(prxcod('tipo_cobranca', 'cod_cob', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TIPO_COBRANCA(COD_COB, NOME_COB) VALUES(:1, :2)');
              end
           else
              begin 
                 sql.Add('UPDATE TIPO_COBRANCA SET NOME_COB = :2 WHERE COD_COB = :1');
              end;
           Parambyname('1').AsInteger := strtoint(cod_cob.Text);
           Parambyname('2').AsString  := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRCob.Commit;
      Botoes('G');
    except
      IBTRCob.Rollback;
      AlertaCad('Erro ao Gravar o Tipo de Cobrança');
    end;
  finally
    IBSQLCob.Close;
  end;
end;

procedure TFrmCadTipoCobranca.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C023','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTipoCobranca, 'tipo_cobranca', cod_cob, IBSQLCob, IBTRCob);
  Botoes('E');
end;

procedure TFrmCadTipoCobranca.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
  FrmConsTipoCobranca.tag := 0;
  FrmConsTipoCobranca.showmodal;
end;

end.
