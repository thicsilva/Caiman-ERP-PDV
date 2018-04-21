unit UCadSecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  ExtDlgs, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadSecao = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_sec: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLSec: TFDQuery;
    IBTRSec: TFDTransaction;
    GroupBox6: TGroupBox;
    BtnLimpa: TBitBtn;
    Panel3: TPanel;
    Image: TImage;
    BtnFoto: TBitBtn;
    OpenPicture: TOpenPictureDialog;
    CheckBebidas: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnFotoClick(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure cod_secKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadSecao: TFrmCadSecao;

implementation
uses
  Udm, Ubibli1, UConsSecao, USecaoGrupo, UNovoPrincipal;
Var  bGrava : boolean;

{$R *.dfm}

function FrmCadSecao: TFrmCadSecao;
begin
   Result := TFrmCadSecao( BuscaFormulario( TFrmCadSecao ) );
end;

procedure TFrmCadSecao.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadSecao, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadSecao);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadSecao);
         EDedit(FrmCadSecao, false);
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

procedure TFrmCadSecao.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C006','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             Image.Visible          := false;
             OpenPicture.FileName   := '';
             cod_sec.ReadOnly:= false;
             cod_sec.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadSecao.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C006','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  Image.Visible          := false;
  OpenPicture.FileName   := '';
  cod_sec.ReadOnly:= false;
  cod_sec.SetFocus;
end;

procedure TFrmCadSecao.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Image.Visible          := false;
  OpenPicture.FileName   := '';
  Botoes('C');
end;

procedure TFrmCadSecao.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C006','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  cod_sec.ReadOnly:= true;
  edtnome.SetFocus;
end;

procedure TFrmCadSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRSec.Active then
     IBTRSec.Commit;
  IBSQLSec.Close;
  Action:= caFree;
end;

procedure TFrmCadSecao.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C006','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Seção');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRSec.Active then
     IBTRSec.Commit;
  IBTRSec.StartTransaction;
  try
    try
      with IBSQLSec do
        begin 
           close;
           sql.Clear;

           if bGrava then
              begin 
                 if trim(cod_sec.Text) = '' then
                    cod_sec.Text:= inttostr(prxcod('secao', 'cod_sec', dm.IBTransaction, dm.ibsqlcod));

                 sql.Add('INSERT INTO SECAO(COD_SEC, NOME_SEC, CAMINHO_FOTO_SEC, BEBIDAS_FUMO_SEC) ' +
                         'VALUES(:CODSEC, :NOMESEC, :FOTO, :BEB)');
              end
           else
              begin 
                 sql.Add('UPDATE SECAO SET NOME_SEC = :NOMESEC, CAMINHO_FOTO_SEC = :FOTO, ' +
                         'BEBIDAS_FUMO_SEC = :BEB WHERE COD_SEC = :CODSEC');
              end;

           Parambyname('codsec').AsInteger     := strtoint(cod_sec.Text);
           Parambyname('nomesec').AsString     := edtnome.Text;
           if Image.Visible then
              Parambyname('foto').AsString     := OpenPicture.FileName
           else
              Parambyname('foto').Value        := null;
           if CheckBebidas.Checked then
              Parambyname('beb').AsString      := 'S'
           else
              Parambyname('beb').AsString      := 'N';
           ExecOrOpen;
        end;
      IBTRSec.Commit;
      Botoes('G');
    except
      IBTRSec.Rollback;
      AlertaCad('Erro ao Gravar a Seção');
    end;
  finally
    IBSQLSec.Close;
    Application.CreateForm(TFrmSecaoGrupo, FrmSecaoGrupo);
    FrmSecaoGrupo.Caption:= 'Grupo/subGrupo da Seção ' + EdtNome.Text;
    FrmSecaoGrupo.showmodal;
  end;
end;

procedure TFrmCadSecao.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C006','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadSecao, 'secao', cod_sec, IBSQLSec, IBTRSec);
  Image.Visible          := false;
  OpenPicture.FileName   := '';
  Botoes('E');
end;

procedure TFrmCadSecao.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsSecao, FrmConsSecao);
  FrmConsSecao.tag:= 0;
  FrmConsSecao.showmodal;
end;

procedure TFrmCadSecao.BtnFotoClick(Sender: TObject);
begin 
  inherited;
  Image.Visible:= true;
  OpenPicture.Execute;
  image.Picture.LoadFromFile(OpenPicture.FileName);
end;

procedure TFrmCadSecao.BtnLimpaClick(Sender: TObject);
begin 
  inherited;
  Image.Visible:= false;
  OpenPicture.FileName:= '';
end;

procedure TFrmCadSecao.cod_secKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

end.
