unit UCadTipoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, Mask, StdCtrls, ImgList, 
  ToolWin, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, Data.DB, System.ImageList;

type
  TFrmCadTipoVenda = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_tpv: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtQtdParc: UNovosComponentes.TEdit;
    Label4: TLabel;
    EdtDiasPriParc: UNovosComponentes.TEdit;
    Label5: TLabel;
    EdtDiasentreParc: UNovosComponentes.TEdit;
    IBSQLTPV: TFDQuery;
    IBTRTPV: TFDTransaction;
    ComboEnt: TComboBox;
    Label8: TLabel;
    EdtPercEnt: TCurrencyEdit;
    Label9: TLabel;
    Label6: TLabel;
    ComboPreco: TComboBox;
    Label7: TLabel;
    EdtCodClassif: UNovosComponentes.TEdit;
    BtnConsClassif: TsSpeedButton;
    BtnAddClassif: TsSpeedButton;
    EdtNomeClassif: TEdit;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtQtdParcKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure ComboEntChange(Sender: TObject);
    procedure EdtCodClassifEnter(Sender: TObject);
    procedure BtnAddClassifClick(Sender: TObject);
    procedure BtnConsClassifClick(Sender: TObject);
    procedure EdtCodClassifKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodClassifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClassifExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadTipoVenda: TFrmCadTipoVenda;

implementation
uses
  Udm, Ubibli1, UConsTipoVenda, UCadClassifContasReceber, 
  UConsClassifContasReceber, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadTipoVenda: TFrmCadTipoVenda;
begin
Result := TFrmCadTipoVenda( BuscaFormulario( TFrmCadTipoVenda,  False ) );
end;

procedure TFrmCadTipoVenda.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTipoVenda, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTipoVenda);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTipoVenda);
         EDedit(FrmCadTipoVenda, false);
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

procedure TFrmCadTipoVenda.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C015','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             ComboEnt.ItemIndex:= 0;
             ComboEntChange(sender);
             ComboPreco.ItemIndex:= 0;
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadTipoVenda.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C015','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  ComboPreco.ItemIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmCadTipoVenda.EdtQtdParcKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadTipoVenda.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadTipoVenda.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C015','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRTPV.Active then
     IBTRTPV.Commit;
  IBSQLTPV.Close;
  Action:= caFree;
end;

procedure TFrmCadTipoVenda.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C015','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if trim(EdtCodClassif.Text) = '' then
     begin 
        AlertaCad('Digite a classificação');
//        EdtCodClassif.SetFocus;
        exit;
     end;

  if trim(edtnome.Text) = '' then
     begin 
        AlertaCad('Digite o Nome do Tipo de Venda');
//        edtnome.SetFocus;
        exit;
     end;

  if IBTRTPV.Active then
     IBTRTPV.Commit;
  IBTRTPV.StartTransaction;
  try
    try
      with IBSQLTPV do
        begin 
           close;
           sql.Clear;
           if bGrava = true then
              begin 
                 cod_tpv.Text:= inttostr(prxcod('tipo_venda', 'cod_tpv', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TIPO_VENDA(COD_TPV, NOME_TPV, QTDPARCELAS_TPV, DIASPRIPARC_TPV, DIASENTREPARC_TPV, ' +
                         'POSSUI_ENTRADA, PERC_ENTRADA, TABELA_PRECO_TPV, CODIGO_CLASSIFICACAO) ' +
                         'VALUES(:CODTPV, :NOMETPV, :QTDPARCELASTPV, :DIASPRIPARCTPV, :DIASENTREPARCTPV, :POSSUIENTRADA, ' +
                         ':PERCENTRADA, :TABELAPRECO, :CODCLA)');
              end
           else
              begin 
                 sql.Add('UPDATE TIPO_VENDA SET NOME_TPV = :NOMETPV, QTDPARCELAS_TPV = :QTDPARCELASTPV, DIASPRIPARC_TPV = :DIASPRIPARCTPV, DIASENTREPARC_TPV = :DIASENTREPARCTPV, ' +
                         'POSSUI_ENTRADA = :POSSUIENTRADA, TABELA_PRECO_TPV = :TABELAPRECO, ' +
                         'PERC_ENTRADA = :PERCENTRADA, CODIGO_CLASSIFICACAO = :CODCLA WHERE COD_TPV = :CODTPV');
              end;
           Parambyname('codtpv').AsInteger             := strtoint(cod_tpv.Text);
           Parambyname('nometpv').AsString             := edtnome.Text;
           Parambyname('qtdparcelastpv').AsInteger     := strtoint(EdtQtdParc.Text);
           if EdtDiasPriParc.Text = '' then
              Parambyname('diaspriparctpv').Value      := null
           else
              Parambyname('diaspriparctpv').AsInteger  := strtoint(EdtDiasPriParc.Text);
           if EdtDiasentreParc.Text = '' then
              Parambyname('diasentreparctpv').Value    := null
           else
              Parambyname('diasentreparctpv').AsInteger:= strtoint(EdtDiasentreParc.Text);
           Parambyname('possuientrada').AsString       := copy(ComboEnt.Text, 1, 1);
           if EdtPercEnt.Text = '0' then
              ParamByName('percentrada').Value         := null
           else
              Parambyname('percentrada').AsFloat       := strtofloat(EdtPercEnt.Text);

           case ComboPreco.ItemIndex of
             0: Parambyname('tabelapreco').AsString    := 'N';
             1: Parambyname('tabelapreco').AsString    := 'P';
           end;

           parambyname('codcla').AsInteger             := strtoint(EdtCodClassif.Text); 
           
           ExecOrOpen;
        end;
      IBTRTPV.Commit;
      Botoes('G');
    except
      IBTRTPV.Rollback;
      AlertaCad('Erro ao Gravar o Tipo de Venda');
    end;
  finally
    IBSQLTPV.Close;
  end;
end;

procedure TFrmCadTipoVenda.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C015','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTipoVenda, 'tipo_venda', cod_tpv, IBSQLTPV, IBTRTPV);
  Botoes('E');
end;

procedure TFrmCadTipoVenda.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.tag:= 0;
  FrmConsTipoVenda.showmodal;
end;

procedure TFrmCadTipoVenda.ComboEntChange(Sender: TObject);
begin 
  inherited;
  if ComboEnt.ItemIndex = 0 then
     EdtPercEnt.Enabled:= true
  else
     begin 
        EdtPercEnt.Clear;
        EdtPercEnt.Enabled:= false;
     end;
end;

procedure TFrmCadTipoVenda.EdtCodClassifEnter(Sender: TObject);
begin 
  inherited;
  EdtCodClassif.SelectAll;
end;

procedure TFrmCadTipoVenda.BtnAddClassifClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadClassifContasReceber, True );
end;

procedure TFrmCadTipoVenda.BtnConsClassifClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsClassifContasReceber, FrmConsClassifContasReceber);
  FrmConsClassifContasReceber.Tag:= 199;
  FrmConsClassifContasReceber.ShowModal;
end;

procedure TFrmCadTipoVenda.EdtCodClassifKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmCadTipoVenda.EdtCodClassifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
   case key of
   vk_f3: BtnConsClassif.Click;
   vk_f2: BtnAddClassif.Click;
  end;
end;

procedure TFrmCadTipoVenda.EdtCodClassifExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeClassif.Text:= consulta('classificacao_contas_receber', EdtCodClassif, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if EdtNomeClassif.Text = '' then
     begin 
        AlertaCad('Classificação não Cadastrada');
//        EdtCodClassif.SetFocus;
     end;
end;

end.
