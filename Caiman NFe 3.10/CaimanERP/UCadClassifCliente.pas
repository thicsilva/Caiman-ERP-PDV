unit UCadClassifCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  acAlphaImageList, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadClassifCliente = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_cla: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLCla: TFDQuery;
    IBTRCla: TFDTransaction;
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

 function FrmCadClassifCliente: TFrmCadClassifCliente;

implementation
uses
  Udm, Ubibli1, UConsClassifCliente, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadClassifCliente: TFrmCadClassifCliente;
begin
   Result := TFrmCadClassifCliente( BuscaFormulario( TFrmCadClassifCliente, False ) );
end;

procedure TFrmCadClassifCliente.Botoes(acao : string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(FrmCadClassifCliente, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmCadClassifCliente);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmCadClassifCliente);
         EDedit(FrmCadClassifCliente, false);
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

procedure TFrmCadClassifCliente.FormShow(Sender: TObject);
begin
  inherited;
  if tag = 0 then
     begin
        vl_grava:= true;
        if not DM.Acesso('C008','I') then
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

procedure TFrmCadClassifCliente.BtnNovoClick(Sender: TObject);
begin
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C008','I') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadClassifCliente.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Botoes('C');
end;

procedure TFrmCadClassifCliente.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('C008','A') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadClassifCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if IBTRCla.Active then
     IBTRCla.Commit;
  IBSQLCla.Close;
  Action:= caFree;
end;

procedure TFrmCadClassifCliente.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if (vl_grava) and (not DM.Acesso('C008','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin
        AlertaCad('Digite o Nome da Classificação');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRCla.Active then
     IBTRCla.Commit;
  IBTRCla.StartTransaction;
  try
    try
      with IBSQLCla do
        begin
           close;
           sql.Clear;
           if vl_grava = true then
              begin
                 cod_cla.Text:= inttostr(prxcod('classif_cliente', 'cod_cla', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CLASSIF_CLIENTE(COD_CLA, NOME_CLA) VALUES(:CODCLA, :NOMECLA)');
              end
           else
              begin
                 sql.Add('UPDATE CLASSIF_CLIENTE SET NOME_CLA = :NOMECLA WHERE COD_CLA = :CODCLA');
              end;
           Parambyname('codcla').AsInteger     := strtoint(cod_cla.Text);
           Parambyname('nomecla').AsString     := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRCla.Commit;
      Botoes('G');
    except
      IBTRCla.Rollback;
      AlertaCad('Erro ao Gravar a Classificação');
    end;
  finally
    IBSQLCla.Close;
  end;
end;

procedure TFrmCadClassifCliente.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('C008','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadClassifCliente, 'Classif_Cliente', cod_cla, IBSQLCla, IBTRCla);
  Botoes('E');
end;

procedure TFrmCadClassifCliente.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsClassifCliente, FrmConsClassifCliente);
  FrmConsClassifCliente.tag:= 0;
  FrmConsClassifCliente.showmodal;
end;

end.









