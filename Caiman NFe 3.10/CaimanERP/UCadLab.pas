unit UCadLab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadLab = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_lab: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLLab: TFDQuery;
    IBTRLab: TFDTransaction;
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

  function FrmCadLab: TFrmCadLab;

implementation
uses
  Udm, Ubibli1, UConsLab, UNovoPrincipal;
var bGrava : boolean;

{$R *.dfm}

function FrmCadLab: TFrmCadLab;
begin
   Result := TFrmCadLab( BuscaFormulario(  TFrmCadLab ) );
end;

procedure TFrmCadLab.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadLab, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadLab);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadLab);
         EDedit(FrmCadLab, false);
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

procedure TFrmCadLab.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C004','I') then
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

procedure TFrmCadLab.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C004','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadLab.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadLab.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C004','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRLab.Active then
     IBTRLab.Commit;
  IBSQLLab.Close;
  Action:= caFree;
end;

procedure TFrmCadLab.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C004','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite a Descrição');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRLab.Active then
     IBTRLab.Commit;
  IBTRLab.StartTransaction;
  try
    try
      with IBSQLLab do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_lab.Text:= inttostr(prxcod('laboratorio', 'cod_lab', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO LABORATORIO(COD_LAB, NOME_LAB) VALUES(:CODLAB, :NOMELAB)');
              end
           else
              begin 
                 sql.Add('UPDATE LABORATORIO SET NOME_LAB = :NOMELAB WHERE COD_LAB = :CODLAB');
              end;
           Parambyname('codlab').AsInteger     := strtoint(cod_lab.Text);
           Parambyname('nomelab').AsString     := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRLab.Commit;
      Botoes('G');
    except
      IBTRLab.Rollback;
      AlertaCad('Erro ao Gravar');
    end;
  finally
    IBSQLLab.Close;
  end;
end;

procedure TFrmCadLab.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C004','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadLab, 'laboratorio', cod_lab, IBSQLLab, IBTRLab);
  Botoes('E');
end;

procedure TFrmCadLab.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsLab, FrmConsLab);
  FrmConsLab.tag:= 0;
  FrmConsLab.showmodal;
end;

end.
