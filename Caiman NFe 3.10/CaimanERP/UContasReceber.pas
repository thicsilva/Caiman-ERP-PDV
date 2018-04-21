unit UContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, Mask, StdCtrls, ImgList, 
  ToolWin, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, 
  dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, System.ImageList;

type
  TFrmLancContasReceber = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_ctr: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label21: TLabel;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    BtnAddCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label22: TLabel;
    EdtNumDoc: TEdit;
    Label4: TLabel;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtObs: TEdit;
    IBSQLCTR: TFDQuery;
    IBTRCTR: TFDTransaction;
    EdtSeq: UNovosComponentes.TEdit;
    Label3: TLabel;
    LCon: TLabel;
    EdtData: TMaskEdit;
    EdtVenc: TMaskEdit;
    QInsCTR: TFDQuery;
    QInsCTRCODCTR: TIntegerField;
    EdtCodCob: UNovosComponentes.TEdit;
    BtnConsCob: TsSpeedButton;
    BtnAddCob: TsSpeedButton;
    EdtNomeCob: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtTotalRec: TCurrencyEdit;
    QTotalRec: TFDQuery;
    QTotalRecTOTAL: TBCDField;
    Label13: TLabel;
    EdtParcela: UNovosComponentes.TEdit;
    Label14: TLabel;
    EdtDevol: TCurrencyEdit;
    Label15: TLabel;
    EdtTotal: TCurrencyEdit;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtCodClassif: UNovosComponentes.TEdit;
    BtnConsClassif: TsSpeedButton;
    BtnAddClassif: TsSpeedButton;
    EdtNomeClassif: TEdit;
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnAddCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtVencExit(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnConsCobClick(Sender: TObject);
    procedure BtnAddCobClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCobEnter(Sender: TObject);
    procedure EdtCodCobExit(Sender: TObject);
    procedure EdtCodCobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtParcelaEnter(Sender: TObject);
    procedure EdtDevolExit(Sender: TObject);
    procedure EdtCodClassifEnter(Sender: TObject);
    procedure EdtCodClassifExit(Sender: TObject);
    procedure EdtCodClassifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsClassifClick(Sender: TObject);
    procedure BtnAddClassifClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmLancContasReceber: TFrmLancContasReceber;

implementation
uses
  Udm, Ubibli1, UConsCli, UCadCli, UConsLancReceber, UConsTipoCobranca,
  UCadTipoCobranca, ULancContabil, UConsClassifContasReceber,
  UCadClassifContasReceber, UNovoPrincipal, UPrincipal;
var bGrava    : boolean;
var cTotalRec : currency;
var dData     : TDate;
var bDevolucao: boolean;

{$R *.dfm}

function FrmLancContasReceber: TFrmLancContasReceber;
begin
   Result := TFrmLancContasReceber( buscaFormulario( TFrmLancContasReceber, False ) );
end;

procedure TFrmLancContasReceber.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmLancContasReceber, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmLancContasReceber);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmLancContasReceber);
         EDedit(FrmLancContasReceber, false);
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

procedure TFrmLancContasReceber.EdtCodCliExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  cTotalRec := 0;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
         begin 
            close;
            sql.Clear;
            sql.Add('SELECT C.NOME_CLI, O.NOME_CON FROM CLIENTE C ' +
                    'INNER JOIN CONVENIO O ' +
                    'ON (C.COD_CON = O.COD_CON) ' +
                    'WHERE C.COD_CLI = ' + edtcodcli.Text);
            ExecOrOpen;
            if recordcount > 0 then
               begin 
                  edtnomecli.Text    := fieldbyname('nome_cli').Value;
                  lcon.Caption       := fieldbyname('nome_con').Value;
               end
            else
               begin 
                  AlertaCad('Cliente não Cadastrado');
                  edtnomecli.Clear;
                  lcon.caption:= '';
                  EdtNomeCli.Clear;
//                  edtcodcli.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o cliente');
      EdtNomeCli.Clear;
//      edtcodcli.SetFocus;
    end;
  finally
      dm.Consulta.Close;
  end;

  { BUSCA O SALDO DO CLIENTE }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with QTotalRec do
         begin 
            close;
            Parambyname('codcli').AsInteger:= strtoint(edtcodcli.Text);
            open;
            cTotalRec:= QTotalRecTOTAL.AsCurrency;
            EdtTotalRec.Text:= currtostr(cTotalRec);
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
    end;
  finally
    QTotalRec.Close;
  end;
end;

procedure TFrmLancContasReceber.EdtCodCliKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmLancContasReceber.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     begin 
        Application.CreateForm(TFrmConsCli, FrmConsCli);
        FrmConsCli.Tag:= 4;
        FrmConsCli.ShowModal;
     end
  else
     if key = vk_f2 then
        begin
           BuscaFormulario( TFrmCadCli, True );
        end;
end;

procedure TFrmLancContasReceber.BtnConsCliClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.Tag:= 4;
  FrmConsCli.ShowModal;
end;

procedure TFrmLancContasReceber.BtnAddCliClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TFrmLancContasReceber.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M008','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtdata.Text    := datetostr(date);
             edtvenc.Text    := datetostr(date);
             EdtParcela.Text := '1';
             EdtSeq.Text     := '1';
             lcon.Caption    := '';
             if bDevolucao then
                EdtDevol.Enabled:= true
             else
                EdtDevol.Enabled:= false;
             edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmLancContasReceber.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('M008','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtParcela.Text := '1';
  EdtSeq.Text     := '1';
  lcon.Caption    := '';
  EdtData.Text    := datetostr(dData);
  if bDevolucao then
     EdtDevol.Enabled:= true
  else
     EdtDevol.Enabled:= false;

  edtdata.SetFocus;
end;

procedure TFrmLancContasReceber.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmLancContasReceber.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M008','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  if bDevolucao then
     EdtDevol.Enabled:= true
  else
     EdtDevol.Enabled:= false;
  edtdata.SetFocus;
end;

procedure TFrmLancContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCTR.Active then
     IBTRCTR.Commit;
  IBSQLCTR.Close;
  Action:= caFree;
end;

procedure TFrmLancContasReceber.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M008','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if strtodate(EdtVenc.Text) < strtodate(EdtData.Text) then
     begin 
        AlertaCad('O vencimento não pode ser menor que a data de emissão');
        exit;
     end;

  if StrToCurr(EdtDevol.text) > StrToCurr(EdtValor.text) then
     begin 
        AlertaCad('O valor da devolução não pode ser maior que o valor da parcela');
        exit;
        abort;
     end;

  if bGrava then
     begin 
        if IBTRCTR.Active then
           IBTRCTR.Commit;
        IBTRCTR.StartTransaction;
        try
          try
            with QInsCTR do
               begin 
                  close;
                  Parambyname('sequenciactr').AsInteger   := strtoint(EdtSeq.Text);
                  Parambyname('codemp').AsInteger         := iEmp;
                  Parambyname('datactr').AsDate           := strtodate(edtdata.Text);
                  Parambyname('codcli').AsInteger         := strtoint(edtcodcli.Text);
                  Parambyname('venctoctr').AsDate         := strtodate(edtVenc.text);
                  Parambyname('valorctr').AsCurrency      := strtocurr(edtvalor.Text);
                  Parambyname('numdocumentoctr').AsString := EdtNumDoc.Text;
                  Parambyname('obsctr').AsString          := edtobs.Text;
                  Parambyname('codcob').AsInteger         := strtoint(EdtCodCob.Text);
                  Parambyname('caixa').AsInteger          := iCaixa;
                  Parambyname('parcela').AsInteger        := strtoint(EdtParcela.Text);
                  Parambyname('devol').AsCurrency         := strtocurr(EdtDevol.Text);
                  Parambyname('codcla').AsInteger         := strtoint(EdtCodClassif.Text);
                  open;
                  cod_ctr.Text:= QInsCTRCODCTR.AsString;
               end;
            IBTRCTR.Commit;
            Botoes('G');
          except
            IBTRCTR.Rollback;
            AlertaCad('Erro ao gravar o Lançamento');
          end;
        finally
          QInsCTR.Close;
        end;
     end
  else
     begin 
        if IBTRCTR.Active then
           IBTRCTR.Commit;
        IBTRCTR.StartTransaction;
        try
          try
            with IBSQLCTR do
              begin 
                 close;
                 sql.Clear;
                 sql.Add('UPDATE CONTAS_RECEBER SET DATA_CTR = :DATACTR, COD_CLI = :CODCLI, VENCTO_CTR = :VENCTOCTR, ' +
                         'VALOR_CTR = :VALORCTR, NUMDOCUMENTO_CTR = :NUMDOCUMENTOCTR, OBS_CTR = :OBSCTR, COD_COB = :CODCOB, ' +
                         'PARCELA_CTR = :PARCELA, DEVOLUCAO_CTR = :DEVOL, CODIGO_CLASSIFICACAO = :CODCLA ' +
                         'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQUENCIACTR');
                 Parambyname('codctr').AsInteger        := strtoint(cod_ctr.Text);
                 Parambyname('sequenciactr').AsInteger  := strtoint(EdtSeq.Text);
                 Parambyname('datactr').AsDate          := strtodate(edtdata.Text);
                 Parambyname('codcli').AsInteger        := strtoint(edtcodcli.Text);
                 Parambyname('venctoctr').AsDate        := strtodate(edtVenc.text);
                 Parambyname('valorctr').AsCurrency     := strtocurr(edtvalor.Text);
                 Parambyname('numdocumentoctr').AsString:= EdtNumDoc.Text;
                 Parambyname('obsctr').AsString         := edtobs.Text;
                 Parambyname('codcob').AsInteger        := strtoint(EdtCodCob.Text);
                 Parambyname('parcela').AsInteger       := strtoint(EdtParcela.Text);
                 Parambyname('devol').AsCurrency        := StrToCurr(EdtDevol.Text);
                 Parambyname('codcla').AsInteger        := strtoint(EdtCodClassif.Text);
                 ExecOrOpen;
              end;
            IBTRCTR.Commit;
            Botoes('G');
          except
            IBTRCTR.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          IBSQLCTR.Close;
        end;
     end;
  { LANÇAMENTOS CONTÁBEIS }
  if DM.RetornaStringTabela('lanc_contabil', 'parametros', 'cod_emp', iEmp) = 'S' then
      begin 
         Application.CreateForm(TFrmLancContabil, FrmLancContabil);
         FrmLancContabil.tag:= 0;
         FrmLancContabil.Caption        := 'Lançamentos Contábeis - Contas a Receber';
         FrmLancContabil.EdtCodigo.Text := cod_ctr.Text;
         FrmLancContabil.EdtSeq.Text    := EdtSeq.Text;
         FrmLancContabil.EdtData.Text   := edtdata.Text;
         FrmLancContabil.EdtTotal.Text  := EdtTotal.Text;
         FrmLancContabil.ShowModal;
      end;
end;

procedure TFrmLancContasReceber.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M008','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if application.MessageBox('Confirma a Exclusão do Lançamento?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin 
        if IBTRCTR.Active then
           IBTRCTR.Commit;
        IBTRCTR.StartTransaction;
        try
          try
            with IBSQLCTR do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM CONTAS_RECEBER WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQUENCIACTR');
                  Parambyname('codctr').AsInteger      := strtoint(cod_ctr.text);
                  Parambyname('sequenciactr').AsInteger:= strtoint(edtseq.Text);
                  ExecOrOpen;
               end;
            IBTRCTR.Commit;
            Limpaedit(FrmLancContasReceber);
            lcon.Caption:= '';
            ededit(FrmLancContasReceber, false);
            Botoes('E');
          except
            ibtrctr.Rollback;
            AlertaCad('Erro ao excluir o Lançamento');
          end;
        finally
          IBSQLCTR.Close;
        end;
     end;
end;

procedure TFrmLancContasReceber.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsLancReceber, FrmConsLancReceber);
  FrmConsLancReceber.tag:= 0;
  FrmConsLancReceber.Caption:= 'Consulta de Lançamento do Contas a Receber';
  FrmConsLancReceber.BtnLocalizar.Caption:= '&Localizar';
  FrmConsLancReceber.showmodal;
end;

procedure TFrmLancContasReceber.EdtDataExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    dData:= strtodate(EdtData.text);
    if bGrava then
       edtvenc.Text:= datetostr(strtodate(edtdata.Text) + 30);
  except
    AlertaCad('Data Inválida');
//    edtdata.SetFocus;
  end;
end;

procedure TFrmLancContasReceber.EdtVencExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(EdtVenc.Text);
  except
    AlertaCad('Data Inválida');
//    EdtVenc.SetFocus;
  end;
end;

procedure TFrmLancContasReceber.EdtValorExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  if edtvalor.Text = '0' then
     begin 
        edtvalor.SetFocus;
        exit;
     end;

  EdtTotal.Text:= currtostr(strtocurr(edtvalor.Text) - strtocurr(EdtDevol.Text));

  { SOMA O TOTAL A RECEBER }
  EdtTotalRec.Text:= currtostr(cTotalRec + (strtoCurr(EdtValor.text) - StrToCurr(edtdevol.Text)));
end;

procedure TFrmLancContasReceber.BtnConsCobClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
  FrmConsTipoCobranca.Tag:= 2;
  FrmConsTipoCobranca.ShowModal;
end;

procedure TFrmLancContasReceber.BtnAddCobClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadTipoCobranca, True );
end;

procedure TFrmLancContasReceber.EdtCodCliEnter(Sender: TObject);
begin 
  inherited;
  EdtCodCli.SelectAll;
end;

procedure TFrmLancContasReceber.EdtCodCobEnter(Sender: TObject);
begin 
  inherited;
  EdtCodCob.SelectAll;
end;

procedure TFrmLancContasReceber.EdtCodCobExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeCob.Text := Consulta('tipo_cobranca', edtcodcob, 'cod_cob', 'nome_cob', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCob.Text = '' then
     begin 
        AlertaCad('Tipo de Cobrança não Cadastrado');
//        EdtCodCob.SetFocus;
     end;
end;

procedure TFrmLancContasReceber.EdtCodCobKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCob.Click
  else
    if key = vk_f2 then
       BtnAddCob.Click;
end;

procedure TFrmLancContasReceber.FormCreate(Sender: TObject);
begin 
  inherited;
  if trim(DM.RetornaStringTabela('habilitar_devolucao', 'parametros', 'cod_emp', iEmp)) = 'S' then
     bDevolucao:= true
  else
     bDevolucao:= false;
end;

procedure TFrmLancContasReceber.EdtParcelaEnter(Sender: TObject);
begin 
  inherited;
  EdtParcela.SelectAll;
end;

procedure TFrmLancContasReceber.EdtDevolExit(Sender: TObject);
begin 
  inherited;
  EdtTotal.Text:= currtostr(strtocurr(edtvalor.Text) - strtocurr(EdtDevol.Text)); 

  { SOMA O TOTAL A RECEBER }
  EdtTotalRec.Text := currtostr(cTotalRec + (strtoCurr(EdtValor.text) - StrToCurr(edtdevol.Text)));
end;

procedure TFrmLancContasReceber.EdtCodClassifEnter(Sender: TObject);
begin 
  inherited;
  EdtCodClassif.SelectAll;
end;

procedure TFrmLancContasReceber.EdtCodClassifExit(Sender: TObject);
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

procedure TFrmLancContasReceber.EdtCodClassifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  case key of
   vk_f3: BtnConsClassif.Click;
   vk_f2: BtnAddClassif.Click;
  end;
end;

procedure TFrmLancContasReceber.BtnConsClassifClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsClassifContasReceber, FrmConsClassifContasReceber);
  FrmConsClassifContasReceber.Tag:= 1;
  FrmConsClassifContasReceber.ShowModal;
end;

procedure TFrmLancContasReceber.BtnAddClassifClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadClassifContasReceber, True );
end;

end.
