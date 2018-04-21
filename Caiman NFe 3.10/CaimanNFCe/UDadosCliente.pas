unit UDadosCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, 
  Grids, DBGrids, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmDadosCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EdtCodTPV: TEdit;
    BtnConsTPV: TsSpeedButton;
    EdtNomeTPV: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodCli: TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label4: TLabel;
    MemoObs: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    EdtDev: TCurrencyEdit;
    Label7: TLabel;
    EdtLimite: TCurrencyEdit;
    Label8: TLabel;
    EdtSaldo: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LConvenio: TLabel;
    EdtDias: TEdit;
    Label12: TLabel;
    Panel4: TPanel;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    QConsCTR: TFDQuery;
    QConsCTRVALOR_CTR: TBCDField;
    QConsCTRVENCTO_CTR: TDateField;
    Btnalterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSair: TBitBtn;
    IBTRParc: TFDTransaction;
    QBuscaParc: TFDQuery;
    QBuscaParcCOD_CTR: TIntegerField;
    QBuscaParcSEQUENCIA_CTR: TIntegerField;
    QBuscaParcCOD_EMP: TIntegerField;
    QBuscaParcDATA_CTR: TDateField;
    QBuscaParcCOD_VENDA: TIntegerField;
    QBuscaParcCOD_CLI: TIntegerField;
    QBuscaParcVENCTO_CTR: TDateField;
    QBuscaParcVALOR_CTR: TBCDField;
    DSQBuscaParc: TDataSource;
    QDelParcelas: TFDQuery;
    QAtualizaVenda: TFDQuery;
    QBuscaParcDTPAGTO_CTR: TDateField;
    QGeraParc: TFDQuery;
    QBuscaTPV: TFDQuery;
    QBuscaTPVCOD_TPV: TIntegerField;
    QBuscaTPVNOME_TPV: TStringField;
    QBuscaTPVQTDPARCELAS_TPV: TIntegerField;
    QBuscaTPVDIASPRIPARC_TPV: TIntegerField;
    QBuscaTPVDIASENTREPARC_TPV: TIntegerField;
    QBuscaTPVPOSSUI_ENTRADA: TStringField;
    QBuscaTPVPERC_ENTRADA: TBCDField;
    QCliente: TFDQuery;
    LCredito: TLabel;
    QNumeroCupom: TFDQuery;
    Label13: TLabel;
    Autorizado: TLabel;
    EdtAutorizado: TEdit;
    QConsCTRCOD_CTR: TIntegerField;
    QBuscaTPVTABELA_PRECO_TPV: TStringField;
    QBuscaParcNUMDOCUMENTO_CTR: TStringField;
    QBuscaParcPARCELA_CTR: TIntegerField;
    StatusBar1: TStatusBar;
    procedure EdtCodTPVKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodTPVExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnConsTPVClick(Sender: TObject);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTPVEnter(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BuscaDadosCliente;
    procedure BuscaParcelas;
    procedure GeraParcelas;
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnalterarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DeleteParcelas;
    procedure AtualizaVenda;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EdtAutorizadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosCliente: TFrmDadosCliente;

implementation
uses
  Udm, UConsCli, UConsTipoVenda, UFechaVenda, UVendasCaixa, UAlteraParcela, 
  UVendasPED, UFechaVendaPED, UsenhaLiberarVenda, UMenuFiscal;

var iAtrazoCliente     : integer;
    cLimiteCliente     : currency;
    bCLienteBloqueado  : boolean;
    cTotalPromissoria  : currency;

{$R *.dfm}

procedure TFrmDadosCliente.AtualizaVenda;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QAtualizaVenda do
          begin
             close;
             Parambyname('codtpv').AsInteger   := strtoint(EdtCodTPV.Text);
             Parambyname('codcli').AsInteger   := strtoint(EdtCodCli.Text);
             if FrmDadosCliente.Tag = 10 then
                Parambyname('codven').AsInteger:= strtoint(FrmVendasPED.EdtCodigo.text)
             else
                Parambyname('codven').AsInteger:= iCodigoVenda;
             if trim(EdtAutorizado.Text) = '' then
                Parambyname('pessoa').Value:= null
             else
                Parambyname('pessoa').AsString := trim(EdtAutorizado.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Atualizar a Venda');
     end;
   finally
      QAtualizaVenda.Close;
   end;
end;

procedure TFrmDadosCliente.DeleteParcelas;
begin
   if IBTRParc.Active then
      IBTRParc.Commit;
   QBuscaParc.Close;
   IBTRParc.StartTransaction;
   with QDelParcelas do
      begin
         close;
         sql.Clear;
         sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                    'WHERE COD_VENDA = :CODVENDA';
         if FrmDadosCliente.Tag = 10 then
            Parambyname('codvenda').AsInteger:= StrToInt(FrmVendasPED.EdtCodigo.Text)
         else
            Parambyname('codvenda').AsInteger:= iCodigoVenda;
         ExecOrOpen;
      end;
   IBTRParc.Commit;
   QDelParcelas.Close;
end;

procedure TFrmDadosCliente.GeraParcelas;
var i : integer;
    cEntrada     : currency;
    iCodCobranca : integer;
    iCodClassif  : integer;
    Soma: Double;
    Diferenca: Double;
begin
   cEntrada:= 0;
   iCodCobranca:= dm.RetornaIntegerTabela('codigo_cobranca', 'parametros', 'cod_emp', iEmp);
   iCodClassif := dm.RetornaIntegerTabela('codigo_classificacao', 'tipo_venda', 'cod_tpv', strtoint(EdtCodTPV.Text));

   { BUSCA O TIPO DE VENDA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaTPV do
     begin
        close;
        Parambyname('codtpv').AsInteger:= strtoint(EdtCodTPV.Text);
        Open;
     end;

   { VERIFICA SE TEM ENTRADA E GERA A MESMA }
   if trim(QBuscaTPVPOSSUI_ENTRADA.AsString) = 'S' then
      begin
         cEntrada:= strtocurr(currtostrf((cTotalPromissoria * QBuscaTPVPERC_ENTRADA.AsCurrency) / 100, ffFixed, 2));

         if IBTRParc.Active then
            IBTRParc.Commit;
         IBTRParc.StartTransaction;
         with QGeraParc do
            begin
               close;
               Parambyname('seq').AsInteger          := 1;
               Parambyname('codemp').AsInteger       := iEmp;
               Parambyname('datactr').Value          := Date;
               if FrmDadosCliente.Tag = 10 then
                  Parambyname('codvenda').AsInteger  := strtoint(FrmVendasPED.EdtCodigo.Text)
               else
                  Parambyname('codvenda').AsInteger  := iCodigoVenda;
               Parambyname('codcli').AsInteger       := strtoint(EdtCodcli.Text);
               Parambyname('venctoctr').Value        := date;
               Parambyname('valorctr').AsCurrency    := cEntrada;
               Parambyname('codcai').AsInteger       := iCaixa;
               Parambyname('parc').AsInteger         := 1;
               Parambyname('dtpagtoctr').Value       := Date;
               Parambyname('vlrpagoctr').Value       := cEntrada;
               Parambyname('codcob').AsInteger       := iCodCobranca;
               Parambyname('documento').AsString     := 'COO ' + inttostr(iCOOVenda);
               Parambyname('codcla').AsInteger       := iCodClassif;
               ExecOrOpen;
            end;
         IBTRParc.Commit;
         QGeraParc.Close;
      end;

   { GERA PARCELAS }
   if IBTRParc.Active then
      IBTRParc.Commit;
   IBTRParc.StartTransaction;
   Soma := 0;
   for i:= 1 to QBuscaTPVQTDPARCELAS_TPV.AsInteger do
      begin
         with QGeraParc do
            begin
               close;
               Parambyname('seq').AsInteger           := 1;
               Parambyname('codemp').AsInteger        := iEmp;
               Parambyname('datactr').Value           := Date;
               if FrmDadosCliente.Tag = 10 then
                  Parambyname('codvenda').AsInteger   := strtoint(FrmVendasPED.EdtCodigo.Text)
               else
                  Parambyname('codvenda').AsInteger   := iCodigoVenda;
               Parambyname('codcli').AsInteger        := strtoint(EdtCodcli.Text);

               if i = 1 then
                  Parambyname('venctoctr').Value      := Date + QBuscaTPVDIASPRIPARC_TPV.Value
               else
                  Parambyname('venctoctr').Value      :=  (Date + QBuscaTPVDIASPRIPARC_TPV.Value) + (QBuscaTPVDIASENTREPARC_TPV.Value * (i - 1));

               Parambyname('valorctr').AsCurrency  := StrToFloat( FormatFloat( '0.00', (cTotalPromissoria - cEntrada) / QBuscaTPVQTDPARCELAS_TPV.AsCurrency ) );
               Parambyname('codcai').AsInteger        := iCaixa;
               Parambyname('dtpagtoctr').Value        := null;
               Parambyname('vlrpagoctr').Value        := null;
               Parambyname('codcob').AsInteger        := iCodCobranca;
               Parambyname('documento').AsString      := 'COO ' + inttostr(iCOOVenda);
               Soma := Soma + Parambyname('valorctr').AsCurrency;
               if I = QBuscaTPVQTDPARCELAS_TPV.AsInteger then
                  begin
                     Diferenca := cTotalPromissoria -
                     ( StrToFloat( FormatFloat( '0.00', Soma ) ) +
                     cEntrada );
                     Parambyname('valorctr').AsCurrency  :=
                        Parambyname('valorctr').AsCurrency  + Diferenca;
                  end;

               if cEntrada > 0 then
                 Parambyname('parc').AsInteger     := i + 1
               else
                 Parambyname('parc').AsInteger     := i;

               Parambyname('codcla').AsInteger     := iCodClassif;
               ExecOrOpen;
            end;
      end;
   dm.IBTransaction.Commit;
   QBuscaTPV.Close;
   IBTRParc.Commit;
   QGeraParc.Close;
end;

procedure TFrmDadosCliente.BuscaParcelas;
begin
   if IBTRParc.Active then
      ibtrparc.Commit;
   IBTRParc.StartTransaction;
   with QBuscaParc do
      begin
         close;
         if FrmDadosCliente.Tag = 10 then
            Parambyname('codvenda').AsInteger:= strtoint(FrmVendasPED.EdtCodigo.Text)
         else
            Parambyname('codvenda').AsInteger:= iCodigoVenda;
         Open;
      end;
   IBTRParc.CommitRetaining;
end;

procedure TFrmDadosCLiente.BuscaDadosCliente;
var cTotalDevedor, cDiasAtraso  : currency;
begin
   if dm.IBDatabaseServer.Connected then
      begin
         cTotalDevedor  := 0;
         cDiasAtraso    := 0;
         try
           try
             if dm.IBTRServer.Active then
                dm.IBTRServer.Commit;
             dm.IBTRServer.StartTransaction;
             with QConsCTR do
                begin
                   close;
                   Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                   open;
                   if not fieldbyname('cod_ctr').IsNull then
                      begin
                         first;
                         while not eof do
                            begin
                               if ((Date - QConsCTRVENCTO_CTR.Value) > iDiasCarencia) then
                                  begin
                                     cTotalDevedor:= cTotalDevedor + QConsCTRVALOR_CTR.AsCurrency + (QConsCTRVALOR_CTR.AsCurrency * ((date - QConsCTRVENCTO_CTR.Value) * (cTaxaJuros / 30)) / 100);
                                     if (date - QConsCTRVENCTO_CTR.Value) > cDiasAtraso then
                                        cDiasAtraso:= (date - QConsCTRVENCTO_CTR.Value);
                                  end
                               else
                                  cTotalDevedor:= cTotalDevedor + QConsCTRVALOR_CTR.AsCurrency;
                               next;
                            end;
                      end;
                   edtdev.Text   := CurrToStr(cTotalDevedor);
                   EdtSaldo.Text := CurrToStr(StrToCurr(edtlimite.Text) - cTotalDevedor);
                   if StrToCurr(edtsaldo.Text) < 0 then
                      edtsaldo.Font.Color:= clred
                   else
                      edtsaldo.Font.Color:= clnavy;
                   EdtDias.Text:= CurrToStr(cDiasAtraso);
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
           end;
         finally
           QConsCTR.Close;
         end;
      end;
end;

procedure TFrmDadosCliente.EdtCodTPVKeyPress(Sender: TObject;
  var Key: Char);
begin

   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmDadosCliente.FormShow(Sender: TObject);
begin
   case FrmDadosCliente.tag of
     1:  cTotalPromissoria:= FrmFechaVenda.TotalizaFormasPagamento('PR');
     10: cTotalPromissoria:= FrmFechaVendaPED.TotalizaFormasPagamento('PR');
   end;

   bPodeEncerrarVenda         := false;
   FrmDadosCliente.KeyPreview := true;
   BtnSair.Enabled            := true;

  if FrmDadosCliente.Tag = 10 then   // Vendas PED tag = 10
     begin
        EdtCodTPV.Text:= FrmVendasPED.EdtCodTPV.Text;
        EdtCodTPVExit(self);
        Btnalterar.Enabled:= true;
        BtnExcluir.Enabled:= true;
     end
  else
     begin
        if ( (iCodPreVenda > 0) or ( iCodOrcamento > 0 ) ) and (iCodTipoVenda > 0) then
           EdtCodTPV.Text:= inttostr(iCodTipoVenda)
        else
           EdtCodTPV.Text:= IntToStr(iTipoVendaPrazo);
        EdtCodTPVExit(EdtCodTPV);

        if iCodCliente > 0 then
           EdtCodCli.Text:= inttostr(iCodCliente);

        EdtCodTPV.SetFocus;

        if FrmDadosCliente.tag > 0 then
           begin
              if bAlterarParcelas then
                 begin
                    Btnalterar.Enabled:= true;
                    BtnExcluir.Enabled:= true;
                 end
              else
                 begin
                    Btnalterar.Enabled:= false;
                    BtnExcluir.Enabled:= false;
                 end;
           end;
     end;
end;

procedure TFrmDadosCliente.BtnCancelarClick(Sender: TObject);
begin
   bPodeEncerrarVenda:= false;

   { excluindo as parcelas }
   if FrmDadosCliente.Tag = 10 then
      begin
         if trim(FrmVendasPED.EdtCodigo.Text) <> '' then
            DeleteParcelas;
      end
   else
      begin
         if iCodigoVenda > 0 then
            DeleteParcelas;
      end;

   if frmdadoscliente.tag = 0 then
      frmvendascaixa.LimpaDadosCliente
   else
      FrmFechaVenda.BtnOk.Enabled:= true;

   ModalResult := mrCancel;
end;

procedure TFrmDadosCliente.EdtCodCliExit(Sender: TObject);
var iCodigoCliente : integer;
begin
   iCodigoCliente:= 0;

   if trim(edtcodcli.Text) = '' then
      begin
         iCodigoCliente:= 0;
         EdtNomeCli.Clear;
         EdtAutorizado.Clear;
         EdtLimite.Clear;
         edtdev.Clear;
         edtsaldo.Clear;
         edtdias.Clear;
         edtcodcli.SetFocus;
         exit;
      end;

   { busca os dados do cliente }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT C.COD_CLI, C.LIMITE_CLI, C.BLOQUEADO_CLI, C.NOME_CLI, ' +
                     'C.ATRAZO_MAXIMO_CLI, O.NOME_CON, C.OBS_VENDA,                ' +
                     'C.TIPO_CREDITO_CLI, C.CONTROLAR_LIMITE, O.DESCONTO_CON       ' +
                     'FROM CLIENTE C             ' +
                     'INNER JOIN CONVENIO O      ' +
                     'ON (C.COD_CON = O.COD_CON) ' +
                     'WHERE C.COD_CLI = :CODCLI AND C.ATIVO_CLI = ' + #39 + 'S' + #39 +
                     ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'PR' + #39 + ', ' + #39 + 'PC' + #39 + ',' + #39 + 'DN' + #39 +')');
             Parambyname('codcli').AsInteger:= strtoint(edtcodcli.Text);
             Open;
             if not fieldbyname('cod_cli').IsNull then
                begin
                   iCodigoCliente:= fieldbyname('COD_CLI').AsInteger;

                   if trim(fieldbyname('CONTROLAR_LIMITE').AsString) = 'S' then
                      bContLimiteCliente:= true
                   else
                      bContLimiteCliente:= false;

                   if trim(fieldbyname('BLOQUEADO_CLI').AsString) = 'S' then
                      bCLienteBloqueado:= true
                   else
                      bCLienteBloqueado:= false;

                   if fieldbyname('ATRAZO_MAXIMO_CLI').IsNull then
                      iAtrazoCliente :=  0
                   else
                      iAtrazoCliente := fieldbyname('atrazo_maximo_cli').AsInteger;

                   if fieldbyname('DESCONTO_CON').IsNull then
                      cDescConvenio:= 0
                   else
                      cDescConvenio:= fieldbyname('desconto_con').AsCurrency;

                   cLimiteCliente   := fieldbyname('LIMITE_CLI').AsCurrency;
                   EdtNomeCli.Text  := trim(fieldbyname('NOME_CLI').AsString);
                   LConvenio.Caption := fieldbyname('NOME_CON').Value;
                   MemoObs.Text      := fieldbyname('OBS_VENDA').AsString;
                   EdtLimite.Text    := fieldbyname('LIMITE_CLI').AsString;

                   if trim(fieldbyname('tipo_credito_cli').AsString) = 'PR' then
                      LCredito.Caption:= 'PROMISSORIA'
                   else
                   if trim(fieldbyname('tipo_credito_cli').AsString) = 'CH' then
                      LCredito.Caption:= 'CHEQUE'
                   else
                   if trim(fieldbyname('tipo_credito_cli').AsString) = 'CC' then
                      LCredito.Caption:= 'CONTAS CORRENTE'
                   else
                      LCredito.Caption:= 'PROMISSÓRIA/CHEQUE';
                end
             else
                begin
                   iCodigoCliente:= 0;
                   edtnomecli.Clear;
                   LConvenio.Caption:= '';
                   LCredito.Caption:= '';
                   MemoObs.Clear;
                   showmessage('Cliente não Cadastrado');
                   edtcodcli.SetFocus;
                   edtcodcli.SelectAll;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       iCodigoCliente:= 0;
       showmessage('Erro ao buscar o cliente');
       edtnomecli.Clear;
       LConvenio.Caption:= '';
       LCredito.Caption:= '';
       memoobs.Clear;
       edtcodcli.SetFocus;
       edtcodcli.SelectAll;
     end;
   finally
     dm.QConsulta.close;
   end;

   { verifica as condições do cliente }
   if iCodigoCliente > 0 then
      begin
         if (bCLienteBloqueado) or ((cLimiteCliente = 0) and (bContLimiteCliente)) then
            begin
               cDescConvenio:= 0;
               EdtLimite.Clear;
               edtdev.clear;
               edtsaldo.clear;
               edtdias.clear;
               EdtCodCli.Clear;

               showmessage('Cliente Bloqueado,' + #13 +
                           'ou está com o limite zerado' + #13 +
                           'Verifique com a Gerência');

               edtcodcli.SetFocus;
               edtcodcli.SelectAll;
               exit;
               abort;
            end
         else
            begin
               BuscaDadosCliente;

               if (iAtrasoMaximoPara > 0) and (strtoint(edtdias.Text) >= iAtrasoMaximoPara) then
                  begin
                     showmessage('O Cliente ultrapassou o atrazo máximo que é de ' +
                                 inttostr(iAtrasoMaximoPara) + ' dias');
                     if FrmDadosCliente.tag = 1 then
                        bFechaForm:= true;
                     close;
                  end
               else
                  if (iAtrazoCliente > 0) and (strtoint(edtdias.Text) >= iAtrazoCliente) then
                      begin
                         showmessage('O Cliente ultrapassou o atrazo máximo que é de ' +
                                     inttostr(iAtrazoCliente) + ' dias');
                         if FrmDadosCliente.tag = 1 then
                            bFechaForm:= true;
                         close;
                      end
                  else
                     begin
                        if FrmDadosCliente.Tag = 1  then
                           bFechaForm:= false;
                     end;
            end;
   end;
end;

procedure TFrmDadosCliente.EdtCodTPVExit(Sender: TObject);
begin
   if EdtCodTPV.Text = '' then
      begin
         showmessage('Digite o código do do Tipo de Venda');
         EdtCodTPV.SetFocus;
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
             sql.Add('SELECT * FROM ' +
                     'TIPO_VENDA ' +
                     'WHERE COD_TPV = :CODTPV');
             Parambyname('codtpv').AsInteger := strtoint(trim(EdtCodTPV.Text));
             Open;
             if not fieldbyname('cod_tpv').IsNull then
                begin
                   EdtNomeTPV.Text:= fieldbyname('nome_tpv').AsString;
                   if trim(FieldByName('tabela_preco_tpv').AsString) = 'N' then
                      iTabelaPreco:= 0  // A VISTA
                   else
                      iTabelaPreco:= 1; // A PRAZO
                end
             else
                begin
                   iTabelaPreco:= 0;
                   EdtNomeTPV.Clear;
                   showmessage('Tipo de Venda não Cadastrada');
                   EdtCodTPV.SetFocus;
                   EdtCodTPV.SelectAll;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar o Tipo de Venda');
       EdtNomeTPV.Clear;
       EdtCodTPV.SetFocus;
       EdtCodTPV.SelectAll;
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmDadosCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      BtnCancelar.Click;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;

end;

procedure TFrmDadosCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         if ( not BtnSair.Focused ) and ( not BtnOK.Focused ) and ( self.Showing ) then
            SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmDadosCliente.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCli.Click;
end;

procedure TFrmDadosCliente.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 0;
   FrmConsCli.showmodal;
end;

procedure TFrmDadosCliente.BtnConsTPVClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
   FrmConsTipoVenda.tag:= 0;
   FrmConsTipoVenda.showmodal;
end;

procedure TFrmDadosCliente.EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsTPV.Click;
end;

procedure TFrmDadosCliente.EdtCodTPVEnter(Sender: TObject);
begin
   EdtCodTPV.SelectAll;
end;

procedure TFrmDadosCliente.EdtAutorizadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
         BtnOK.SetFocus;
         BtnOkClick( nil );
      end;
end;

procedure TFrmDadosCliente.EdtCodCliEnter(Sender: TObject);
begin
   edtcodcli.SelectAll;
end;

procedure TFrmDadosCliente.BtnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a Exclusão da Parcela?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         try
           try
             with QDelParcelas do
               begin
                  close;
                  sql.Clear;
                  sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                             'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ';
                  Parambyname('codctr').AsInteger := QBuscaParcCOD_CTR.AsInteger;
                  Parambyname('seq').AsInteger    := QBuscaParcSEQUENCIA_CTR.AsInteger;
                  ExecOrOpen;
               end;
             IBTRParc.Commit;
           except
             IBTRParc.Rollback;
             showmessage('Erro ao Excluir a Parcela');
           end;
         finally
           QDelParcelas.Close;
           BuscaParcelas;
         end;
      end;
end;

procedure TFrmDadosCliente.BtnOKClick(Sender: TObject);
begin
   if FrmDadosCliente.tag = 0 then
      begin
         if (bContLimiteCliente) and ((strtocurr(EdtLimite.Text) = 0) or (strtocurr(EdtSaldo.Text) <= 0)) then
             begin
                Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
                FrmSenhaLiberaVenda.tag:= 0;
                FrmSenhaLiberaVenda.showmodal;
                if not bVendaLiberada then
                   exit;
             end;

         iCodCliente   := strtoint(EdtCodCli.Text);
         iCodTipoVenda := strtoint(EdtCodTPV.Text);
         cSaldoCliente := strtofloat(EdtSaldo.text);

//         FrmVendasCaixa.SB.Panels[3].Text:= EdtNomeCli.Text;
         Frmvendascaixa.info2.Caption := 'Cliente : ' + EdtNomeCli.Text;
      //   FrmVendasCaixa.SB.Panels[4].Text:= EdtNomeTPV.Text;
         iFormaPagamento:= dm.BuscaFormaPagamento('PR');
         FrmVendasCaixa.info3.Caption := 'Tipo venda : ' + EdtNomeTPV.Text;

         ModalResult := mrOk;
      end
   else
      begin
         if (bContLimiteCliente) and ((strtocurr(EdtLimite.Text) = 0) or (strtocurr(EdtSaldo.Text) <= 0)) then
             begin
                Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
                FrmSenhaLiberaVenda.tag:= 0;
                FrmSenhaLiberaVenda.showmodal;
                if not bVendaLiberada then
                   exit;
             end;

         AtualizaVenda;
         DeleteParcelas;
         geraParcelas;
         BuscaParcelas;
         btnsair.SetFocus;
      end;
end;

procedure TFrmDadosCliente.BtnalterarClick(Sender: TObject);
begin
   Application.CreateForm(TFrmAlteraParcela, FrmAlteraParcela);
   FrmAlteraParcela.EdtCod.Text      := QBuscaParcCOD_CTR.AsString;
   FrmAlteraParcela.EdtSeq.Text      := QBuscaParcSEQUENCIA_CTR.AsString;
   FrmAlteraParcela.EdtDataEmi.Text  := QBuscaParcDATA_CTR.AsString;
   FrmAlteraParcela.EdtDataVen.Text  := QBuscaParcVENCTO_CTR.AsString;
   FrmAlteraParcela.EdtValor.Text    := QBuscaParcVALOR_CTR.AsString;
   FrmAlteraParcela.showmodal;
end;

procedure TFrmDadosCliente.BtnSairClick(Sender: TObject);
var sCNPJ : string;
    iNumViasComp, i : integer;
begin
   BtnSair.Enabled:= false;
   FrmDadosCliente.KeyPreview:= false;

   if FrmDadosCliente.Tag = 10 then
      begin
         bPodeEncerrarVenda:= true;
         ModalResult := mrOk;
      end
   else
      begin
         sNomeCliente := '';
         sEndCliente  := '';
         sDocCliente  := '';
         sCNPJ        := '';

         { BUSCA O NOME, END, DOC DO CLIENTE PARA ECF }
         try
           try
             if dm.IBTransaction.Active then
                dm.IBTransaction.Commit;
             dm.IBTransaction.StartTransaction;
             with QCliente do
                begin
                   close;
                   Parambyname('cod').AsInteger:= strtoint(trim(EdtCodCli.Text));
                   open;
                   sNomeCliente:= fieldbyname('nome_cli').AsString;
                   sEndCliente := fieldbyname('endres_cli').AsString +
                                  ' - ' + fieldbyname('baires_cli').AsString +
                                  ' - ' + fieldbyname('cidres_cli').AsString +
                                  '- ' + fieldbyname('estres_cli').AsString;
                   sDocCliente := fieldbyname('cnpj_cli').AsString ;//+ '    ' + fieldbyname('doc_cli').AsString;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             sNomeCliente:= '';
             sDocCliente := '';
             sEndCliente := '';
           end;
         finally
           QCliente.Close;
         end;

         bPodeEncerrarVenda:= true;
            ModalResult := mrOK;
      end;
end;

procedure TFrmDadosCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   {if IBTRBuscaDados.Active then
      IBTRBuscaDados.Commit;}
   if IBTRParc.Active then
      IBTRParc.Commit;
   QBuscaParc.Close;
   QBuscaTPV.Close;
end;

procedure TFrmDadosCliente.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

end.



