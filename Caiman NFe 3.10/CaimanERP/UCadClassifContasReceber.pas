unit UCadClassifContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, StdCtrls, ImgList, ComCtrls, ToolWin, ExtCtrls, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadClassifContasReceber = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
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
    procedure Botoes(acao : string);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadClassifContasReceber: TFrmCadClassifContasReceber;

implementation
uses
  Udm, Ubibli1, UConsClassifContasReceber, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadClassifContasReceber: TFrmCadClassifContasReceber;
begin
   Result := TFrmCadClassifContasReceber( BuscaFormulario( TFrmCadClassifContasReceber, False ) );
end;

procedure TFrmCadClassifContasReceber.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadClassifContasReceber, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadClassifContasReceber);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadClassifContasReceber);
         EDedit(FrmCadClassifContasReceber, false);
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

procedure TFrmCadClassifContasReceber.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C036','I') then
           begin 
             Application.MessageBox('Voc� n�o tem permiss�o para efetuar esta opera��o.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
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

procedure TFrmCadClassifContasReceber.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C036','I') then
     begin 
        Application.MessageBox('Voc� n�o tem permiss�o para efetuar esta opera��o.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadClassifContasReceber.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadClassifContasReceber.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C036','A') then
     begin 
        Application.MessageBox('Voc� n�o tem permiss�o para efetuar esta opera��o.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadClassifContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCla.Active then
     IBTRCla.Commit;
  IBSQLCla.Close;
  Action:= caFree;
end;

procedure TFrmCadClassifContasReceber.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C036','I')) then
     begin 
        Application.MessageBox('Voc� n�o tem permiss�o para efetuar esta opera��o.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Classifica��o');
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
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('classificacao_contas_receber', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CLASSIFICACAO_CONTAS_RECEBER(CODIGO, DESCRICAO) ' +
                         'VALUES(:1, :2)');
              end
           else
              begin 
                 sql.Add('UPDATE CLASSIFICACAO_CONTAS_RECEBER SET DESCRICAO = :2 WHERE CODIGO = :1');
              end;
           Parambyname('1').AsInteger := strtoint(codigo.Text);
           Parambyname('2').AsString  := trim(edtnome.Text);
           ExecOrOpen;
        end;
      IBTRCla.Commit;
      Botoes('G');
    except
      IBTRCla.Rollback;
      AlertaCad('Erro ao Gravar a Classifica��o');
    end;
  finally
    IBSQLCla.Close;
  end;
end;

procedure TFrmCadClassifContasReceber.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C036','E') then
     begin 
        Application.MessageBox('Voc� n�o tem permiss�o para efetuar esta opera��o.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadClassifContasReceber, 'classificacao_contas_receber', codigo, IBSQLCla, IBTRCla);
  Botoes('E');
end;

procedure TFrmCadClassifContasReceber.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsClassifContasReceber, FrmConsClassifContasReceber);
  FrmConsClassifContasReceber.tag:= 0;
  FrmConsClassifContasReceber.showmodal;
end;

end.
