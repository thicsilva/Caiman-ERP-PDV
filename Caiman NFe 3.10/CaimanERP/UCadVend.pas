unit UCadVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  Mask, rxToolEdit, rxCurrEdit, acAlphaImageList, sSpeedButton, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, dxSkinMetropolisDark, Data.DB;

type
  TFrmCadVend = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_vend: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    ComboAtivo: TComboBox;
    IBSQLVend: TFDQuery;
    IBTRVend: TFDTransaction;
    Label4: TLabel;
    EdtComissao: TCurrencyEdit;
    sSpeedButton1: TsSpeedButton;
    Label73: TLabel;
    edtCodregiao: TEdit;
    BtnConsGrupo: TsSpeedButton;
    Label74: TLabel;
    edtRegiao: TEdit;
    Label5: TLabel;
    edtSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnConsultarClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure edtCodregiaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodregiaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadVend: TFrmCadVend;

implementation
uses
  Udm, Ubibli1, UConsVend, UCadComissosXDescontos, UCidadesVendedor, 
  UConsRegiao, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadVend: TFrmCadVend;
begin
   Result := TFrmCadVend( BuscaFormulario( TFrmCadVend, False ) );
end;

procedure TFrmCadVend.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadVend, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadVend);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadVend);
         EDedit(FrmCadVend, false);
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

procedure TFrmCadVend.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C013','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             ComboAtivo.ItemIndex:= 0;
             ComboAtivo.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadVend.sSpeedButton1Click(Sender: TObject);
begin 
  inherited;
   if cod_vend.Text <> '' then
      begin 
         Application.CreateForm( TfrmCadComissosXDescontos, frmCadComissosXDescontos);
         frmCadComissosXDescontos.cod_vend := StrToInt( cod_vend.Text );
         frmCadComissosXDescontos.nome_vend := EdtNome.Text;
         frmCadComissosXDescontos.ShowModal;
      end;

end;

procedure TFrmCadVend.sSpeedButton2Click(Sender: TObject);
begin 
  inherited;
   if cod_vend.Text <> '' then
      begin 
         Application.CreateForm( TfrmCidades_Vendedor, frmCidades_Vendedor);
         frmCidades_Vendedor.cod_vend := StrToInt( cod_vend.Text );
         frmCidades_Vendedor.nome_vend := EdtNome.Text;
         frmCidades_Vendedor.ShowModal;
      end;

end;

procedure TFrmCadVend.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C013','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  ComboAtivo.ItemIndex:= 0;
  ComboAtivo.SetFocus;
end;

procedure TFrmCadVend.edtCodregiaoExit(Sender: TObject);
begin 
  inherited;
    if ToolBar1.Focused then
    exit;
  if edtCodregiao.Text = '' then
     begin 
        edtRegiao.Text := '';
        Exit;
     end;

  edtRegiao.Text := consulta('REGIAO', edtCodregiao, 'COD',
    'DESCRICAO', dm.IBTransaction, dm.qConsulta);
  if edtRegiao.Text = '' then
  begin 
    edtRegiao.Text := 'Região não Encontrada';
  end;
end;

procedure TFrmCadVend.edtCodregiaoKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadVend.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadVend.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C013','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  ComboAtivo.SetFocus;
end;

procedure TFrmCadVend.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRVend.Active then
     IBTRVend.Commit;
  IBSQLVend.Close;
  Action:= caFree;
end;

procedure TFrmCadVend.BtnGravarClick(Sender: TObject);
begin 
  inherited;

  if (bGrava) and (not DM.Acesso('C013','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Vendedor');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRVend.Active then
     IBTRVend.Commit;
  IBTRVend.StartTransaction;
  try
    try
      with IBSQLVend do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_vend.Text:= inttostr(prxcod('vendedor', 'cod_vend', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO VENDEDOR(COD_VEND, NOME_VEND, ATIVO_VEND, COMISSAO_VEND, COD_REGIAO, SENHA_VEND) ' +
                                       'VALUES(:CODVEND, :NOMEVEND, :ATIVOVEND, :COMISSAOVEND, :COD_REGIAO, :SENHA_VEND)');
              end
           else
              begin 
                 sql.Add('UPDATE VENDEDOR SET COD_REGIAO=:COD_REGIAO, NOME_VEND = :NOMEVEND, '+
                         ' ATIVO_VEND = :ATIVOVEND, COMISSAO_VEND = :COMISSAOVEND, ' +
                         ' SENHA_VEND=:SENHA_VEND' +
                         'WHERE COD_VEND = :CODVEND');
              end;
           Parambyname('codvend').AsInteger       := strtoint(cod_vend.Text);
           Parambyname('nomevend').AsString       := edtnome.Text;
           Parambyname('ativovend').AsString      := copy(ComboAtivo.Text, 1, 1);
           Parambyname('comissaovend').AsFloat    := strtofloat(EdtComissao.Text);
           ParamByName('SENHA_VEND').AsString     := edtSenha.Text;
           if edtCodregiao.Text = '' then
              ParamByName( 'COD_REGIAO' ).Value   := null
           else
              ParamByName( 'COD_REGIAO' ).AsString   := edtCodregiao.Text;
           ExecOrOpen;
        end;
      IBTRVend.Commit;
      Botoes('G');
    except
      IBTRVend.Rollback;
      AlertaCad('Erro ao Gravar o Vendedor');
    end;
  finally
    IBSQLVend.Close;
  end;
end;

procedure TFrmCadVend.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C013','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadVend, 'vendedor', cod_vend, IBSQLVend, IBTRVend);
  Botoes('E');
end;

procedure TFrmCadVend.BtnConsGrupoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm( TfrmConsRegiao, frmConsRegiao );
  frmConsRegiao.Tag := 2;
  frmConsRegiao.ShowModal;
end;

procedure TFrmCadVend.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.Tag:= 0;
  FrmConsVend.ShowModal;
  edtCodregiaoExit( nil );
end;

end.
