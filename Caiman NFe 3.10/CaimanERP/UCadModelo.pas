unit UCadModelo;

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
  TFrmCadModelo = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLModelo: TFDQuery;
    IBTRModelo: TFDTransaction;
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

  function FrmCadModelo: TFrmCadModelo;

implementation
uses
  Udm, Ubibli1, UConsModelos, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadModelo: TFrmCadModelo;
begin
   Result := TFrmCadModelo( BuscaFormulario( TFrmCadModelo, False ) );
end;

procedure TFrmCadModelo.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadModelo, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadModelo);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadModelo);
         EDedit(FrmCadModelo, false);
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

procedure TFrmCadModelo.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C029','I') then
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

procedure TFrmCadModelo.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C029','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadModelo.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadModelo.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C029','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRModelo.Active then
     IBTRModelo.Commit;
  IBSQLModelo.Close;
  Action:= caFree;
end;

procedure TFrmCadModelo.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C029','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Modelo');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRModelo.Active then
     IBTRModelo.Commit;
  IBTRModelo.StartTransaction;
  try
    try
      with IBSQLModelo do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('modelos', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO MODELOS(CODIGO, DESCRICAO) VALUES(:COD, :DESC)');
              end
           else
              begin 
                 sql.Add('UPDATE MODELOS SET DESCRICAO = :DESC WHERE CODIGO = :COD');
              end;
           Parambyname('cod').AsInteger := strtoint(codigo.Text);
           Parambyname('desc').AsString := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRModelo.Commit;
      Botoes('G');
    except
      IBTRModelo.Rollback;
      AlertaCad('Erro ao Gravar o Modelo');
    end;
  finally
    IBSQLModelo.Close;
  end;
end;

procedure TFrmCadModelo.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C029','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadModelo, 'modelos', codigo, IBSQLModelo, IBTRModelo);
  Botoes('E');
end;

procedure TFrmCadModelo.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsModelos, FrmConsModelos);
  FrmConsModelos.tag:= 0;
  FrmConsModelos.showmodal;
end;

end.
 
