unit UCadSetor;

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
  TFrmCadSetor = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_set: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLSetor: TFDQuery;
    IBTRSetor: TFDTransaction;
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

  function FrmCadSetor: TFrmCadSetor;

implementation
uses
  Udm, Ubibli1, UConsSetor, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadSetor: TFrmCadSetor;
begin
   Result := TFrmCadSetor( BuscaFormulario( TFrmCadSetor, False ) );
end;

procedure TFrmCadSetor.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadSetor, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadSetor);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadSetor);
         EDedit(FrmCadSetor, false);
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

procedure TFrmCadSetor.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C020','I') then
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

procedure TFrmCadSetor.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C020','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadSetor.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadSetor.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C020','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadSetor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRSetor.Active then
     IBTRSetor.Commit;
  IBSQLSetor.Close;
  Action:= caFree; 
end;

procedure TFrmCadSetor.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C020','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Setor');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRSetor.Active then
     IBTRSetor.Commit;
  IBTRSetor.StartTransaction;
  try
    try
      with IBSQLSetor do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_set.Text:= inttostr(prxcod('setor_balanca', 'cod_set', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO SETOR_BALANCA(COD_SET, NOME_SET) VALUES(:CODSET, :NOMESET)');
              end
           else
              begin 
                 sql.Add('UPDATE SETOR_BALANCA SET NOME_SET = :NOMESET WHERE COD_SET = :CODSET');
              end;
           Parambyname('codset').AsInteger     := strtoint(cod_set.Text);
           Parambyname('nomeset').AsString     := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRSetor.Commit;
      Botoes('G');
    except
      IBTRSetor.Rollback;
      AlertaCad('Erro ao Gravar o Setor');
    end;
  finally
    IBSQLSetor.Close;
  end;
end;

procedure TFrmCadSetor.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C020','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadSetor, 'setor_balanca', cod_set, IBSQLSetor, IBTRSetor);
  Botoes('E');
end;

procedure TFrmCadSetor.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsSetor, FrmConsSetor);
  FrmConsSetor.tag:= 0;
  FrmConsSetor.showmodal;
end;

end.



