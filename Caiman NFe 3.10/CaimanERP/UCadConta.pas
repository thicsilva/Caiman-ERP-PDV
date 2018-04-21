unit UCadConta;

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
  TFrmCadConta = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_conta: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLConta: TFDQuery;
    IBTRConta: TFDTransaction;
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

 function FrmCadConta: TFrmCadConta;

implementation
uses
  Udm, Ubibli1, UConsConta, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}


function FrmCadConta: TFrmCadConta;
begin
   Result := TFrmCadConta( BuscaFormulario( TFrmCadConta, False ) );
end;

procedure TFrmCadConta.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadConta, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadConta);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadConta);
         EDedit(FrmCadConta, false);
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

procedure TFrmCadConta.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C236','I') then
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

procedure TFrmCadConta.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C236','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadConta.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadConta.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C236','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRConta.Active then
     IBTRConta.Commit;
  IBSQLConta.Close;
  Action:= caFree;
end;

procedure TFrmCadConta.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C236','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Conta');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRConta.Active then
     IBTRConta.Commit;
  IBTRConta.StartTransaction;
  try
    try
      with IBSQLConta do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_conta.Text:= inttostr(prxcod('contas_corrente', 'cod_conta', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CONTAS_CORRENTE(COD_CONTA, NOME_CONTA) VALUES(:CODCONTA, :NOMECONTA)');
              end
           else
              begin 
                 sql.Add('UPDATE CONTAS_CORRENTE SET NOME_CONTA = :NOMECONTA WHERE COD_CONTA = :CODCONTA');
              end;
           Parambyname('codconta').AsInteger     := strtoint(cod_conta.Text);
           Parambyname('nomeconta').AsString     := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRConta.Commit;
      Botoes('G');
    except
      IBTRConta.Rollback;
      AlertaCad('Erro ao Gravar a Conta');
    end;
  finally
    IBSQLConta.Close;
  end;
end;

procedure TFrmCadConta.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C236','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadConta, 'contas_corrente', cod_conta, IBSQLConta, IBTRConta);
  Botoes('E');
end;

procedure TFrmCadConta.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 0;
  FrmConsConta.showmodal;
end;

end.
