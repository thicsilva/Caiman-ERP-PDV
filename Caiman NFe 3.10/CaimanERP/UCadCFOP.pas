unit UCadCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, StdCtrls, Mask, ImgList, ComCtrls, ToolWin, ExtCtrls, 
  Buttons, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, dxSkinMetropolisDark, Data.DB;

type
  TFrmCadCFOP = class(TFrmCadastroNovo)
    Label1: TLabel;
    EdtCod: TMaskEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLCFOP: TFDQuery;
    IBTRCFOP: TFDTransaction;
    GroupBox4: TGroupBox;
    MemoObs: TMemo;
    CheckICMS: TCheckBox;
    CheckRelAliq: TCheckBox;
    CheckCupomFiscal: TCheckBox;
    CheckPisCofins: TCheckBox;
    CheckCSOSN: TCheckBox;
    btnTributacoes: TButton;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure MemoObsEnter(Sender: TObject);
    procedure MemoObsExit(Sender: TObject);
    procedure MemoObsKeyPress(Sender: TObject; var Key: Char);
    procedure btnTributacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadCFOP: TFrmCadCFOP;

implementation
uses
  Udm, Ubibli1, UConsCFOP, UCFOP_Tributacoes, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadCFOP: TFrmCadCFOP;
begin
   Result := TFrmCadCFOP( BuscaFormulario( TFrmCadCFOP, False ) );
end;

procedure TFrmCadCFOP.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadCFOP, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadCFOP);
                btnExcluir.Enabled := false
             end
          else
              btnExcluir.Enabled := true;
          BtnConsultar.Enabled   := false;
          if not bGrava then
                btnTributacoes.Enabled := True
          else
                btnTributacoes.Enabled := False;


      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadCFOP);
         EDedit(FrmCadCFOP, false);
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
         btnTributacoes.Enabled := False;
      end;
end;

procedure TFrmCadCFOP.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C024','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtCod.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadCFOP.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C024','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtCod.SetFocus;
end;

procedure TFrmCadCFOP.btnTributacoesClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm( TfrmCFOP_Tributacoes, frmCFOP_Tributacoes);
  frmCFOP_Tributacoes.CFOPEditando := StrToInt( EdtCod.Text );
  frmCFOP_Tributacoes.CFOPDescricao := EdtNome.Text;
  frmCFOP_Tributacoes.ShowModal;
end;

procedure TFrmCadCFOP.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadCFOP.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C024','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  EdtCod.Enabled:= false;
  EdtNome.SetFocus;
end;

procedure TFrmCadCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRCFOP.Active then
     IBTRCFOP.Commit;
  IBSQLCFOP.Close;
  Action:= caFree;
end;

procedure TFrmCadCFOP.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C024','I')) then
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
  if IBTRCFOP.Active then
     IBTRCFOP.Commit;
  IBTRCFOP.StartTransaction;
  try
    try
      with IBSQLCFOP do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 sql.Add('INSERT INTO CFOP(COD_CFO, NOME_CFO, INF_COMPL_NF, ' +
                         'DESTACA_ICMS, SAIR_REL_RESUMO_ALIQ, TIPO, REGISTRADO_ECF, CALCULA_PIS_COFINS, USA_CSOSN) ' +
                         'VALUES(:1, :2, :3, :4, :9, :10, :11, :12, :USA_CSOSN)');
                 if (strtoint(copy(EdtCod.Text, 1, 1)) = 1) or (strtoint(copy(EdtCod.Text, 1, 1)) = 2) then
                    Parambyname('10').AsString:= 'E'
                 else
                    Parambyname('10').AsString:= 'S';
              end
           else
              sql.Add('UPDATE CFOP SET NOME_CFO = :2, INF_COMPL_NF = :3, ' +
                      'DESTACA_ICMS = :4, SAIR_REL_RESUMO_ALIQ = :9, REGISTRADO_ECF = :11, ' +
                      'CALCULA_PIS_COFINS = :12, USA_CSOSN=:USA_CSOSN WHERE COD_CFO = :1');

           Parambyname('1').AsInteger  := strtoint(EdtCod.Text);
           Parambyname('2').AsString   := EdtNome.Text;
           if memoobs.Text = '' then
              Parambyname('3').Value   := null
           else
              Parambyname('3').AsString:= MemoObs.Text;
           if CheckICMS.Checked then
              Parambyname('4').AsString := 'S'
           else
              Parambyname('4').AsString := 'N';
           if CheckRelAliq.Checked then
              Parambyname('9').AsString := 'S'
           else
              Parambyname('9').AsString := 'N';
           if CheckCupomFiscal.Checked then
              Parambyname('11').AsString := 'S'
           else
              Parambyname('11').AsString := 'N';
           if CheckPisCofins.Checked then
              Parambyname('12').AsString := 'S'
           else
              Parambyname('12').AsString := 'N';
           if CheckCSOSN.Checked then
              Parambyname('USA_CSOSN').AsString := 'S'
           else
              Parambyname('USA_CSOSN').AsString := 'N';

           ExecOrOpen;
        end;
      IBTRCFOP.Commit;
      Botoes('G');
    except
      IBTRCFOP.Rollback;
      AlertaCad('Erro ao Gravar o CFOP');
    end;
  finally
    IBSQLCFOP.Close;
  end;
end;

procedure TFrmCadCFOP.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C024','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do CFOP?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRCFOP.Active then
           IBTRCFOP.Commit;
        IBTRCFOP.StartTransaction;
        try
          try
            with IBSQLCFOP do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM CFOP WHERE COD_CFO = :1');
                  Parambyname('1').AsInteger := strtoint(edtcod.Text);
                  ExecOrOpen;
               end;
            IBTRCFOP.Commit;
            Botoes('E');
          except
            IBTRCFOP.Rollback;
            AlertaCad('Erro ao Excluir o CFOP');
          end;
        finally
          IBSQLCFOP.Close;
        end;
     end;
end;

procedure TFrmCadCFOP.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.TAG := 0;
  FrmConsCFOP.SHOWMODAL;
end;

procedure TFrmCadCFOP.MemoObsEnter(Sender: TObject);
begin 
  inherited;
  FrmCadCFOP.KeyPreview:= false;
end;

procedure TFrmCadCFOP.MemoObsExit(Sender: TObject);
begin 
  inherited;
  FrmCadCFOP.KeyPreview:= true;
end;

procedure TFrmCadCFOP.MemoObsKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  Key:= UpCase(Key);
end;

end.

