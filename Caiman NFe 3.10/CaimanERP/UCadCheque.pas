unit UCadCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ImgList, 
  ToolWin, rxToolEdit, rxCurrEdit, UNovosComponentes,
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinsdxStatusBarPainter, dxStatusBar, dxSkinMetropolisDark, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton,
  Data.DB;

type
  TFrmCadCheque = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_che: UNovosComponentes.TEdit;
    Label4: TLabel;
    EdtCodCliente: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label5: TLabel;
    BtnAddCliente: TsSpeedButton;
    Label2: TLabel;
    EdtCodBanco: UNovosComponentes.TEdit;
    BtnConsBanco: TsSpeedButton;
    BtnAddBanco: TsSpeedButton;
    EdtNomeBanco: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    EdtAgencia: TEdit;
    Label7: TLabel;
    EdtConta: TEdit;
    Label8: TLabel;
    EdtNumero: TEdit;
    Label10: TLabel;
    EdtDataEmi: TMaskEdit;
    EdtDataVenc: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtValor: TCurrencyEdit;
    Label13: TLabel;
    EdtObs: TEdit;
    GB: TGroupBox;
    Label14: TLabel;
    EdtCodConta: UNovosComponentes.TEdit;
    BtnConsConta: TsSpeedButton;
    EdtNomeConta: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    EdtPriDep: TMaskEdit;
    Label17: TLabel;
    EdtPriDev: TMaskEdit;
    EdtSegDep: TMaskEdit;
    Label18: TLabel;
    EdtSegDev: TMaskEdit;
    Label19: TLabel;
    EdtPagtoDev: TMaskEdit;
    Label20: TLabel;
    IBSQLChe: TFDQuery;
    IBTRChe: TFDTransaction;
    Label21: TLabel;
    EdtDestino: TEdit;
    Label22: TLabel;
    EdtCodEmitente: UNovosComponentes.TEdit;
    BtnConsEmitente: TsSpeedButton;
    Label23: TLabel;
    EdtNomeEmitente: TEdit;
    BtnAddEmitente: TsSpeedButton;
    procedure EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnAddClienteClick(Sender: TObject);
    procedure EdtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClienteExit(Sender: TObject);
    procedure BtnConsBancoClick(Sender: TObject);
    procedure BtnAddBancoClick(Sender: TObject);
    procedure EdtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodBancoExit(Sender: TObject);
    procedure BtnConsContaClick(Sender: TObject);
    procedure EdtCodContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaExit(Sender: TObject);
    procedure EdtDataEmiExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure EdtCodClienteEnter(Sender: TObject);
    procedure EdtCodEmitenteEnter(Sender: TObject);
    procedure EdtCodBancoEnter(Sender: TObject);
    procedure EdtCodContaEnter(Sender: TObject);
    procedure EdtCodEmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsEmitenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadCheque: TFrmCadCheque;

implementation
uses
  Udm, Ubibli1, UCadCli, UConsCli, UCadBanco, UConsBanco, UConsConta, 
  UConsCheque, UNovoPrincipal, UPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadCheque: TFrmCadCheque;
begin
   Result := TFrmCadCheque( BuscaFormulario( TFrmCadCheque, False ) );
end;

procedure TFrmCadCheque.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadCheque, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadCheque);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled := true;
          BtnConsultar.Enabled   := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadCheque);
         EDedit(FrmCadCheque, false);
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

procedure TFrmCadCheque.EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadCheque.BtnConsCliClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag:= 1;
  FrmConsCli.ShowModal;
end;

procedure TFrmCadCheque.BtnAddClienteClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TFrmCadCheque.EdtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCli.Click
  else
     if key = vk_f2 then
        BtnAddCliente.Click;
end;

procedure TFrmCadCheque.EdtCodClienteExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodCliente.Text) = '' then
     begin
        AlertaCad('Cliente não Encontrado!');
//        EdtCodCliente.SetFocus;
        exit;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.Text:= 'SELECT COD_CLI, NOME_CLI, TIPO_CREDITO_CLI ' +
                       'FROM CLIENTE ' +
                       'WHERE COD_CLI = :CODCLI';
            if sender = EdtCodCliente then
               Parambyname('codcli').AsInteger:= strtoint(EdtCodCliente.Text)
            else
               Parambyname('codcli').AsInteger:= strtoint(EdtCodEmitente.Text);
            Open;
            if not (fieldbyname('cod_cli').IsNull) then
               begin 
                  if (trim(fieldbyname('tipo_credito_cli').AsString) = 'CH') or (trim(fieldbyname('tipo_credito_cli').AsString) = 'PC') then
                     begin 
                        if sender = EdtCodCliente then
                           EdtNomeCli.Text:= fieldbyname('nome_cli').AsString
                        else
                           EdtNomeEmitente.Text:= fieldbyname('nome_cli').AsString;
                     end
                  else
                      begin 
                         if sender = EdtCodCliente then
                            begin 
                               EdtNomeCli.Clear;
                               AlertaCad('Cliente não tem como tipo de crédito CHEQUE/TODOS');
//                               EdtCodCliente.SetFocus;
                            end
                         else
                            begin 
                               EdtNomeEmitente.Clear;
                               AlertaCad('Cliente não tem como tipo de crédito CHEQUE/TODOS');
//                               EdtCodEmitente.SetFocus;
                            end;
                      end;
               end
            else
               begin 
                  if sender = EdtCodCliente then
                     begin 
                        EdtNomeCli.Clear;
                        AlertaCad('Cliente não Cadastrado');
//                        EdtCodCliente.SetFocus;
                     end
                  else
                     begin 
                        EdtNomeEmitente.Clear;
                        AlertaCad('Cliente não Cadastrado');
//                        EdtCodEmitente.SetFocus;
                     end;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar os dados do cliente');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadCheque.BtnConsBancoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsBanco, FrmConsBanco);
  FrmConsBanco.tag:= 1;
  frmConsbanco.showmodal;
end;

procedure TFrmCadCheque.BtnAddBancoClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadBanco, True );
end;

procedure TFrmCadCheque.EdtCodBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsBanco.Click
  else
     if key = vk_f2 then
        BtnAddBanco.Click;
end;

procedure TFrmCadCheque.EdtCodBancoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeBanco.Text:= consulta('banco', EdtCodBanco, 'cod_ban', 'nome_ban', dm.IBTransaction, dm.qConsulta);
  if edtnomebanco.Text = '' then
     begin 
        AlertaCad('Banco não Cadastrado');
//        EdtCodBanco.SetFocus;
     end;
end;

procedure TFrmCadCheque.BtnConsContaClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.Tag:= 1;
  FrmConsConta.ShowModal;
end;

procedure TFrmCadCheque.EdtCodContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsConta.Click;
end;

procedure TFrmCadCheque.EdtCodContaExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  if trim(EdtCodConta.Text) = '' then
     begin 
        edtnomeconta.Clear;
        exit;
     end;
  EdtNomeConta.Text:= consulta('contas_corrente', EdtCodConta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodConta.SetFocus;
     end
  else
     if not edtpridep.Enabled then
        begin 
           edtpridep.Enabled:= true;
           edtpridep.SetFocus;
        end;
end;

procedure TFrmCadCheque.EdtDataEmiExit(Sender: TObject);
begin 
  inherited;
  with sender as TMaskEdit do
     begin 
        if text = '  /  /    ' then
           exit;
        try
          strtodate(Text);
        except
          AlertaCad('Data Inválida');
//          setfocus;
        end;
     end;
end;

procedure TFrmCadCheque.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M003','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             gb.Enabled:= false;
             EdtCodCliente.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadCheque.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('M003','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  gb.Enabled:= false;
  EdtCodCliente.SetFocus;
end;

procedure TFrmCadCheque.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmCadCheque.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M003','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  gb.Enabled:= true;
  EdtCodCliente.SetFocus;
end;

procedure TFrmCadCheque.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M003','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if IBTRChe.Active then
     IBTRChe.Commit;
  IBTRChe.StartTransaction;
  try
    try
      with IBSQLChe do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_che.Text:= inttostr(prxcod('cheque', 'cod_che', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CHEQUE(COD_CHE, COD_CLI, COD_BANCO, AGENCIA_CHE, ' +
                         'CONTA_CHE, NUMERO_CHE, EMISSAO_CHE, VENCTO_CHE, VALOR_CHE, OBS_CHE, COD_EMP, ' +
                         'COD_EMITENTE, COD_CAIXA, COD_USUARIO) ' +
                         'VALUES(:CODCHE, :CODCLI, :CODBANCO, :AGENCIACHE, :CONTACHE, :NUMEROCHE, ' +
                         ':EMISSAOCHE, :VENCTOCHE, :VALORCHE, :OBSCHE, :CODEMP, :CODEMITENTE, :CODCAIXA, :CODUSU)');
                 Parambyname('codche').AsInteger        := strtoint(cod_che.Text);
                 Parambyname('codcli').AsInteger        := strtoint(EdtCodCliente.Text);
                 Parambyname('codbanco').AsInteger      := strtoint(EdtCodBanco.Text);
                 Parambyname('agenciache').AsString     := edtagencia.Text;
                 Parambyname('contache').AsString       := edtconta.Text;
                 Parambyname('numeroche').AsString      := edtnumero.Text;
                 Parambyname('emissaoche').AsDate       := strtodate(edtdataemi.Text);
                 Parambyname('venctoche').AsDate        := strtodate(edtdatavenc.Text);
                 Parambyname('valorche').AsFloat        := strtofloat(edtvalor.Text);
                 Parambyname('obsche').AsString         := edtobs.Text;
                 Parambyname('codemp').AsInteger        := iEmp;
                 Parambyname('codemitente').AsInteger   := strtoint(EdtCodEmitente.Text);
                 Parambyname('codcaixa').AsInteger      := iCaixa;
                 Parambyname('codusu').AsInteger        := iCodUsu;    
                 ExecOrOpen;
              end
           else
              begin 
                 sql.Add('UPDATE CHEQUE SET COD_CLI = :CODCLI, COD_BANCO = :CODBANCO, ' +
                         'AGENCIA_CHE = :AGENCIACHE, CONTA_CHE = :CONTACHE, NUMERO_CHE = :NUMEROCHE, ' +
                         'EMISSAO_CHE = :EMISSAOCHE, VENCTO_CHE = :VENCTOCHE, ' +
                         'VALOR_CHE = :VALORCHE, COD_CONTA = :CODCONTA, PRIDEP_CHE = :PRIDEPCHE, ' +
                         'SEGDEP_CHE = :SEGDEPCHE, PRIDEV_CHE = :PRIDEVCHE, SEGDEV_CHE = :SEGDEVCHE, ' +
                         'PAGTODEV_CHE = :PAGTODEVCHE, OBS_CHE = :OBSCHE, ' +
                         'DESTINO_CHE = :DESTINO, COD_EMITENTE = :CODEMITENTE WHERE COD_CHE = :CODCHE');
                 Parambyname('codche').AsInteger        := strtoint(cod_che.Text);
                 Parambyname('codcli').AsInteger        := strtoint(EdtCodCliente.Text);
                 Parambyname('codbanco').AsInteger      := strtoint(EdtCodBanco.Text);
                 Parambyname('agenciache').AsString     := edtagencia.Text;
                 Parambyname('contache').AsString       := edtconta.Text;
                 Parambyname('numeroche').AsString      := edtnumero.Text;
                 Parambyname('emissaoche').AsDate       := strtodate(edtdataemi.Text);
                 Parambyname('venctoche').AsDate        := strtodate(edtdatavenc.Text);
                 Parambyname('valorche').AsFloat        := strtofloat(edtvalor.Text);
                 if trim(EdtCodConta.Text) = '' then
                    Parambyname('codconta').Value       := null
                 else
                    Parambyname('codconta').AsInteger   := strtoint(EdtCodConta.Text);
                 if edtpridep.Text = '  /  /    ' then
                    Parambyname('pridepche').Value      := null
                 else
                    Parambyname('pridepche').AsDate     := strtodate(edtpridep.Text);
                 if edtsegdep.Text = '  /  /    ' then
                    Parambyname('segdepche').Value      := null
                 else
                    Parambyname('segdepche').AsDate     := strtodate(edtsegdep.Text);
                 if edtpridev.Text = '  /  /    ' then
                    Parambyname('pridevche').Value      := null
                 else
                    Parambyname('pridevche').AsDate     := strtodate(edtpridev.Text);
                 if edtsegdev.Text = '  /  /    ' then
                    Parambyname('segdevche').Value      := null
                 else
                    Parambyname('segdevche').AsDate     := strtodate(edtsegdev.Text);
                 if edtpagtodev.Text = '  /  /    ' then
                    Parambyname('pagtodevche').Value    := null
                 else
                    Parambyname('pagtodevche').AsDate   := strtodate(edtpagtodev.Text);
                 Parambyname('obsche').AsString         := edtobs.Text;
                 if EdtDestino.Text = '' then
                    Parambyname('destino').Value        := null
                 else
                    Parambyname('destino').AsString     := EdtDestino.Text;
                 Parambyname('codemitente').AsInteger   := strtoint(EdtCodEmitente.Text);
                 ExecOrOpen;
              end;
        end;
      IBTRChe.Commit;
      Botoes('G');
    except
      IBTRChe.Rollback;
      AlertaCad('Erro ao Gravar o Cheque');
    end;
  finally
    IBSQLChe.Close;
  end;
end;

procedure TFrmCadCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRChe.Active then
     IBTRChe.Commit;
  IBSQLChe.Close;
  Action:= caFree;
end;

procedure TFrmCadCheque.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M003','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadCheque, 'cheque', cod_che, IBSQLChe, IBTRChe);
  Botoes('E');
end;

procedure TFrmCadCheque.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCheque, FrmConsCheque);
  FrmConsCheque.tag:= 0;
  FrmConsCheque.showmodal;
end;

procedure TFrmCadCheque.EdtCodClienteEnter(Sender: TObject);
begin 
  inherited;
  EdtCodCliente.SelectAll;
end;

procedure TFrmCadCheque.EdtCodEmitenteEnter(Sender: TObject);
begin 
  inherited;
  EdtCodEmitente.SelectAll;
end;

procedure TFrmCadCheque.EdtCodBancoEnter(Sender: TObject);
begin 
  inherited;
  EdtCodBanco.SelectAll;
end;

procedure TFrmCadCheque.EdtCodContaEnter(Sender: TObject);
begin 
  inherited;
  EdtCodConta.SelectAll;
end;

procedure TFrmCadCheque.EdtCodEmitenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsEmitente.Click
  else
     if key = vk_f2 then
        BtnAddEmitente.Click;
end;

procedure TFrmCadCheque.BtnConsEmitenteClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag:= 40;
  FrmConsCli.ShowModal;
end;

end.
