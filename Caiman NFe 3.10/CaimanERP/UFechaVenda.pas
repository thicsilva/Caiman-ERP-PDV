unit UFechaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, DB, RDprint, Grids, 
  DBGrids, DBClient, rxToolEdit, rxCurrEdit, sSpeedButton, frxClass, frxDBSet, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, dxGDIPlusClasses, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMetropolis, cxButtons,
  ACBrUtil;

type
  TFrmFechaVenda = class(TForm)
    Panel1: TPanel;
    PanelOK: TPanel;
    PanelDesconto: TPanel;
    EdtPercentualDesconto: TCurrencyEdit;
    EdtValorDesconto: TCurrencyEdit;
    Panel3: TPanel;
    PanelFormas: TPanel;
    DBGridFormas: TDBGrid;
    DSFormas: TDataSource;
    CDSFormas: TClientDataSet;
    CDSFormasCODIGO: TIntegerField;
    CDSFormasDESCRICAO: TStringField;
    CDSFormasVALOR: TCurrencyField;
    CDSFormasTIPO: TStringField;
    CDSFormasCONCEDER_DESCONTO: TStringField;
    QBuscaParc: TFDQuery;
    QBuscaParcCOD_CTR: TIntegerField;
    QBuscaParcSEQUENCIA_CTR: TIntegerField;
    QBuscaParcCOD_EMP: TIntegerField;
    QBuscaParcDATA_CTR: TDateField;
    QBuscaParcCOD_VENDA: TIntegerField;
    QBuscaParcCOD_CLI: TIntegerField;
    QBuscaParcVENCTO_CTR: TDateField;
    QBuscaParcVALOR_CTR: TBCDField;
    QBuscaParcVLRPAGO_CTR: TBCDField;
    QBuscaParcDTPAGTO_CTR: TDateField;
    QBuscaParcPARCELA_CTR: TIntegerField;
    DSQBuscaParc: TDataSource;
    QTipoVenda: TFDQuery;
    QTipoVendaCOD_TPV: TIntegerField;
    QTipoVendaNOME_TPV: TStringField;
    QTipoVendaQTDPARCELAS_TPV: TIntegerField;
    QTipoVendaDIASPRIPARC_TPV: TIntegerField;
    QTipoVendaDIASENTREPARC_TPV: TIntegerField;
    QTipoVendaPOSSUI_ENTRADA: TStringField;
    QTipoVendaPERC_ENTRADA: TBCDField;
    QTipoVendaTABELA_PRECO_TPV: TStringField;
    QGeraParc: TFDQuery;
    QUpdValor: TFDQuery;
    EdtSubTotal: TCurrencyEdit;
    EdtTroco: TCurrencyEdit;
    Itens: TFDQuery;
    ItensCOD_VEN: TIntegerField;
    ItensCOD_PRO: TIntegerField;
    ItensORDEM: TIntegerField;
    ItensDESCONTO: TBCDField;
    ItensCOD_EMP: TIntegerField;
    ItensQUANT: TBCDField;
    ItensVALOR: TBCDField;
    ItensVALOR_CUSTO: TBCDField;
    ItensPRODUTO_PROMOCAO: TStringField;
    ItensCANCELADO: TIntegerField;
    ItensVENDA_CANCELADA: TIntegerField;
    ItensCOD_VEND: TIntegerField;
    ItensSTATUS_EXPORTA: TIntegerField;
    ItensNOME_PRO: TStringField;
    ItensDESC_CUPOM: TStringField;
    ItensCST_CF_EST: TStringField;
    ItensCST_CF_FORA: TStringField;
    ItensICMS_CF_EST: TIntegerField;
    ItensICMS_CF_FORA: TIntegerField;
    ItensRED_CF_EST: TBCDField;
    ItensRED_CF_FORA: TBCDField;
    ItensCFOP_VENDAS_CF_EST: TIntegerField;
    ItensCFOP_VENDAS_CF_FORA: TIntegerField;
    ItensDESCRICAO: TStringField;
    ItensCALC_TOTAL: TCurrencyField;
    frxItens: TfrxDBDataset;
    frxFormas: TfrxDBDataset;
    TRVenda: TFDTransaction;
    frxMestre: TfrxReport;
    ItensNOME_TPV: TStringField;
    frxParcelas: TfrxDBDataset;
    ItensDATA_VEN: TDateField;
    pnlGeral: TPanel;
    imgFundo: TImage;
    pnlImg: TPanel;
    BtnOk: TcxButton;
    ItensDESCONTO_VEN: TBCDField;
    EdtTotalLiquido: TCurrencyEdit;
    BtnGeraNF: TcxButton;
    SpeedButton1: TcxButton;
    upParcelas: TFDUpdateSQL;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtDescValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormasPagamento;
    procedure DBGridFormasColEnter(Sender: TObject);
    procedure DBGridFormasEnter(Sender: TObject);
    procedure DBGridFormasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAlteraParcelaClick(Sender: TObject);
    function  TotalizaFormaPagamento(const sTipo : string) : currency;
    procedure GeraParcelas( Sigla: String; CodTpv, CodCli: Integer );
    procedure BtnExcluirParcelaClick(Sender: TObject);
    procedure BuscaParcelas;
    procedure AcertaValorParcela(const Valor : currency);
    procedure AtualizaVenda;
    procedure CalculaTroco(const iCodForma : integer);
    procedure EdtPercentualDescontoExit(Sender: TObject);
    procedure FormasComDesconto;
    procedure EdtValorDescontoExit(Sender: TObject);
    procedure CDSFormasAfterPost(DataSet: TDataSet);
    function  NotaFiscal : integer;
    procedure BtnGeraNFClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ItensCalcFields(DataSet: TDataSet);
    procedure ImpressaoMultiplaVenda;
    procedure DBGridFormasKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridFormasExit(Sender: TObject);
    procedure QBuscaParcAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    bFechouVenda: Boolean;
    btnGerarNF: Boolean;
    SQLItens: String;
  public
    { Public declarations }
  end;

var FrmFechaVenda: TFrmFechaVenda;
var bDescLiberado : boolean;

implementation
uses
  Udm, UVenda, Ubibli1, ULancCheques, UsenhaLiberarVenda, UAlteraParcela, 
  UConsTransp, UCadTransp, UDadosAdm, UDadosNotaFiscal, URel_FechaVenda,
  UNovoPrincipal, URelGerais, UDicImp, UDicLib, UfechaVendaParcelas, UDicFluxo;

var cTotalVenda     : currency;
    cDescMaximo     : currency;
    cDescontoVenda  : currency;
    iFormaPagamento : integer;

    iCodigoNF   : integer;
    iNumeroNF   : integer;
    iSerieNF    : integer;
    sSerieNF    : string;
{$R *.dfm}

procedure TFrmFechaVenda.GeraParcelas( Sigla: String; CodTpv, CodCli: Integer );
var i, iCodCobranca, iCodClassif : integer;
    cValorEntrada, cValorParcela, cDiferenca, cValorPromissoria : currency;
begin 
   iCodCobranca      := dm.RetornaIntegerTabela('codigo_cobranca', 'parametros', 'cod_emp', iEmp);
   iCodClassif       := dm.RetornaIntegerTabela('codigo_classificacao', 'tipo_venda', 'cod_tpv', strtoint(FrmVenda.EdtCodTPV.Text));
   if sigla = 'DN' then
      cValorPromissoria := edtTotalLiquido.Value
   else
      cValorPromissoria := TotalizaFormaPagamento(Sigla);
   cValorEntrada     := 0;
   cValorParcela     := 0;
   cDiferenca        := 0;

   { EXCLUINDO PARCELAS }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                        'WHERE COD_VENDA = :CODVENDA';
             Parambyname('codvenda').AsInteger:= strtoint(FrmVenda.EdtCod.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao excluir as parcelas');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { BUSCA O TIPO DE VENDA }
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QTipoVenda do
     begin 
        close;
        Parambyname('codtpv').AsInteger:= CodTpv;
        Open;
     end;

   { VERIFICA SE TEM ENTRADA E GERA A MESMA }
   if trim(QTipoVendaPOSSUI_ENTRADA.AsString) = 'S' then
      begin 
         cValorEntrada:= (cValorPromissoria * QTipoVendaPERC_ENTRADA.AsCurrency) / 100;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QGeraParc do
            begin 
               close;
               Parambyname('seq').AsInteger           := 1;
               Parambyname('codemp').AsInteger        := iEmp;
               Parambyname('datactr').AsDate          := strtodate(frmvenda.EdtData.Text);
               Parambyname('codvenda').AsInteger      := strtoint(frmvenda.EdtCod.Text);
               Parambyname('codcli').AsInteger        := CodCli;
               Parambyname('venctoctr').AsDate        := strtodate(frmvenda.EdtData.Text);
               Parambyname('valorctr').AsCurrency     := cValorEntrada;
               Parambyname('dtpagtoctr').AsDate       := strtodate(frmvenda.EdtData.Text);
               Parambyname('vlrpagoctr').AsCurrency   := cValorEntrada;
               Parambyname('codcob').AsInteger        := iCodCobranca;
               Parambyname('descconc').AsCurrency     := 0;
               Parambyname('desc').AsCurrency         := 0;
               Parambyname('acres').AsCurrency        := 0;
               Parambyname('acresrec').AsCurrency     := 0;
               Parambyname('caixaemi').AsInteger      := iCaixa;
               Parambyname('codcai').AsInteger        := iCaixa;
               Parambyname('parc').AsCurrency         := 1;
               Parambyname('devol').AsCurrency        := 0;
               Parambyname('codcla').AsInteger        := iCodClassif; 
               ExecOrOpen;
            end;
         dm.IBTransaction.Commit;
         QGeraParc.Close;
      end;
   if Sigla = 'DN' then
      begin 
            BuscaParcelas;
            exit;
      end;
   { GERA PARCELAS }
   cValorParcela:= (cValorPromissoria - StrToCurr(CurrToStrf(cValorEntrada, ffFixed, 2))) / QTipoVendaQTDPARCELAS_TPV.AsInteger;
   cDiferenca   := (cValorPromissoria - StrToCurr(CurrToStrF(cValorEntrada, ffFixed, 2))) - (StrToCurr(CurrToStrF(cValorParcela, ffFixed, 2)) * QTipoVendaQTDPARCELAS_TPV.AsInteger);

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   for i:= 1 to QTipoVendaQTDPARCELAS_TPV.AsInteger do
      begin 
         with QGeraParc do
            begin 
               close;
               Parambyname('seq').AsInteger       := 1;
               Parambyname('codemp').AsInteger    := iEmp;
               Parambyname('datactr').AsDate      := strtodate(frmvenda.EdtData.Text);
               Parambyname('codvenda').AsInteger  := strtoint(frmvenda.EdtCod.Text);
               Parambyname('codcli').AsInteger    := CodCli;

               if i = 1 then
                  Parambyname('venctoctr').AsDate := strtodate(frmvenda.EdtData.Text) + QTipoVendaDIASPRIPARC_TPV.AsInteger
               else
                  Parambyname('venctoctr').AsDate := (strtodate(frmvenda.EdtData.Text) + QTipoVendaDIASPRIPARC_TPV.AsInteger) + (QTipoVendaDIASENTREPARC_TPV.AsInteger * (i - 1));

               if i = 1 then
                  begin 
                     if cDiferenca > 0 then
                        Parambyname('valorctr').AsCurrency:= StrToCurr(CurrToStrf(cValorParcela, ffFixed, 2)) + cDiferenca
                     else
                        Parambyname('valorctr').AsCurrency:= StrToCurr(CurrToStrf(cValorParcela, ffFixed, 2));
                  end
               else
                  if i = QTipoVendaQTDPARCELAS_TPV.AsInteger then
                     begin 
                        if cDiferenca < 0 then
                           Parambyname('valorctr').AsCurrency:= StrToCurr(CurrToStrF(cValorParcela, ffFixed, 2)) + cDiferenca
                        else
                           Parambyname('valorctr').AsCurrency:= StrToCurr(CurrToStrF(cValorParcela, ffFixed, 2));
                     end
                  else
                     Parambyname('valorctr').AsCurrency:= StrToCurr(CurrToStrF(cValorParcela, ffFixed, 2));
               Parambyname('dtpagtoctr').Value      := null;
               Parambyname('vlrpagoctr').AsCurrency := 0;
               Parambyname('codcob').AsInteger      := iCodCobranca;
               Parambyname('descconc').AsCurrency   := 0;
               Parambyname('desc').AsCurrency       := 0;
               Parambyname('acres').AsCurrency      := 0;
               Parambyname('acresrec').AsCurrency   := 0;
               Parambyname('caixaemi').AsInteger    := iCaixa;
               Parambyname('codcai').Value          := null;
               if trim(QTipoVendaPOSSUI_ENTRADA.AsString) = 'S' then
                  Parambyname('parc').AsInteger     := i + 1
               else
                  Parambyname('parc').AsInteger     := i;
               Parambyname('devol').AsCurrency      := 0;
               Parambyname('codcla').AsInteger      := iCodClassif; 
               ExecOrOpen;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.IBTRAux.Commit;
   QTipoVenda.Close;
   QGeraParc.Close;

   BuscaParcelas;
end;

function TFrmFechaVenda.TotalizaFormaPagamento(const sTipo : string) : currency;
var cTotalForma : currency;
begin 
   cTotalForma:= 0;

   with CDSFormas do
      begin 
         First;
         while not eof do
            begin 
               if trim(CDSFormasTIPO.AsString) = trim(sTipo) then
                  cTotalForma:= cTotalForma + CDSFormasVALOR.AsCurrency;
               next;
            end;
      end;
   result:= cTotalForma;
end;

procedure TFrmFechaVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         if ( not DBGridFormas.Focused ) and ( CDSFormas.State <> dsEdit ) then
            begin
               Key := #0;
               SelectNext(ActiveControl, True, True);
            end;
      end;
end;

procedure TFrmFechaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
       VK_ESCAPE: Close;
       VK_F5: BtnOk.Click;
       VK_F6: BtnGeraNF.Click;
   end;
end;

procedure TFrmFechaVenda.BtnOkClick(Sender: TObject);
var bPagou, bErroFormas : boolean;
    cSomaFormas : currency;
begin 
   bPagou       := false;
   bErroFormas  := false;
   cSomaFormas  := 0;

   { Verifica Formas de Pagamento }
   with CDSFormas do
      begin 
         first;
         while not eof do
            begin 
               if CDSFormasVALOR.AsCurrency > 0 then
                  begin 
                     if bPagou then
                        bErroFormas:= true
                     else
                        begin 
                           bErroFormas:= false;
                           cSomaFormas:= cSomaFormas + CDSFormasVALOR.AsCurrency;
                           if cSomaFormas >= (cTotalVenda - cDescontoVenda) then
                              bPagou:= true;
                        end;
                  end;
               next;
            end;
      end;

   if (bErroFormas) or (not bPagou) then
      begin 
         AlertaCad('Verifique as formas de pagamento');
//         DBGridFormas.SetFocus;
         exit;
      end;

   { verifica se o total dos Cartões é maior que o total da venda }
   if TotalizaFormaPagamento('CA') > (cTotalVenda - cDescontoVenda) then
      begin 
         AlertaCad('Verifique o total dos cartões');
         CDSFormas.First;
//         DBGridFormas.SetFocus;
         exit;
         abort;
      end;

   { Cheque }
   if TotalizaFormaPagamento('CH') > 0 then
      begin 
         if trim(dm.RetornaStringTabela('LANCAR_CHEQUE_CAIXA', 'parametros', 'cod_emp', iEmp)) = 'S' then
            begin 
               Application.CreateForm(TFrmLancCheques, FrmLancCheques);
               FrmLancCheques.Tag:= 2;
               FrmLancCheques.showmodal;
            end;
      end;

   if TotalizaFormaPagamento('PR') > 0 then
      begin 
//         GeraParcelas( 'PR'  );
         Application.CreateForm( TfrmFechaVendaParcelas, frmFechaVendaParcelas );
         try
             frmFechaVendaParcelas.edtCodTpv.Text := FrmVenda.EdtCodTPV.Text;
             frmFechaVendaParcelas.edtCodCliente.Text := FrmVenda.EdtCodcli.Text;
             if frmFechaVendaParcelas.ShowModal <> mrOk then
                Exit;
         finally
             frmFechaVendaParcelas.Free;
             frmFechaVendaParcelas := nil;
         end;
      end;
//   else
      //EdtCodTransp.SetFocus;

   { SE FOR CARTAO SEM TEF, ABRE O FORM PARA LANÇAR OS MESMOS }
   if TotalizaFormaPagamento('CA') > 0  then
      begin 
         Application.CreateForm(TFrmDadosAdm, FrmDadosAdm);
         FrmDadosAdm.EdtValor.Text:= CurrToStr(TotalizaFormaPagamento('CA'));
         FrmDadosAdm.EdtParcelamento.Text:= '1';
         FrmDadosAdm.showmodal;
      end;

   if TotalizaFormaPagamento('DN') > 0 then
      begin 
//        GeraParcelas( 'DN');
      end;

   AtualizaVenda;
   ImpressaoMultiplaVenda;
   bFechouVenda := True;
   if not btnGerarNF then
     Close;
end;

procedure TFrmFechaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;

   QBuscaParc.Close;
   CDSFormas.Close;
   if bFechouVenda then
      FrmVenda.BtnNovo.Click;
   Action:= caFree;
end;

procedure TFrmFechaVenda.EdtDescValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_down then
      SelectNext(ActiveControl, true, true)
   else
      if key = vk_up then
         SelectNext(ActiveControl, false, true);
end;

procedure TFrmFechaVenda.FormShow(Sender: TObject);
begin 
   SQLItens := Itens.SQL.Text;
//   BtnGeraNF.Enabled := false;
   bFechouVenda := False;
   btnGerarNF := False;
   {Busca o desconto máximo}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT DESCONTO_MAXIMO_VENDA FROM PARAMETROS ' +
                     'WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             ExecOrOpen;
             cDescMaximo:= fieldbyname('desconto_maximo_venda').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o desconto máximo');
     end;
   finally
     dm.Consulta.close;
   end;

   BuscaParcelas;
end;

procedure TFrmFechaVenda.FormCreate(Sender: TObject);
begin 
   { busca o codigo da forma dinheiro }
   pnlImg.DoubleBuffered := True;
   if FrmVenda.VendaVista then
      iFormaPagamento:= dm.BuscaFormaPagamento('DN')
   else
      iFormaPagamento:= dm.BuscaFormaPagamento('PR');
   FormasPagamento;
end;

procedure TFrmFechaVenda.FormasPagamento;
var sFormaCliente   : string;
begin 
   cTotalVenda:= strtocurr(frmvenda.EdtTotalLiquido.Caption);

   { busca a forma de pagamento do cliente }
   sFormaCliente:= DM.RetornaStringTabela('tipo_credito_cli', 'cliente', 'cod_cli', strtoint(FrmVenda.EdtCodcli.Text));

   { criando o dataset }
   cdsformas.Close;
   CDSFormas.CreateDataSet;
   CDSFormas.IndexFieldNames:= 'codigo';
   CDSFormas.Open;

   { montando o ClientDataSet com as formas de pagamento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO, CONCEDER_DESCONTO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE TIPO <> ' + #39 + 'TR' + #39 +
                        ' ORDER BY CODIGO';
             open;
             while not eof do
                begin 
                   if (trim(fieldbyname('tipo').AsString) = 'DN') or
                      (trim(fieldbyname('tipo').AsString) = 'CA') or
                      (trim(fieldbyname('tipo').AsString) = 'CV') or
                      (trim(fieldbyname('tipo').AsString) = 'TI') or

                      ((trim(sFormaCliente) = 'PR') and (trim(fieldbyname('tipo').AsString) = 'PR')) or
                      ((trim(sFormaCliente) = 'CH') and (trim(fieldbyname('tipo').AsString) = 'CH')) or
                      ((trim(sFormaCliente) = 'BO') and (trim(fieldbyname('tipo').AsString) = 'BO')) or
                      ((trim(sFormaCliente) = 'PC') and ((trim(fieldbyname('tipo').AsString) = 'PR') or (trim(fieldbyname('tipo').AsString) = 'CH'))) then

                         begin 
                            CDSFormas.Insert;
                            CDSFormasCODIGO.AsInteger           := fieldbyname('codigo').AsInteger;
                            CDSFormasDESCRICAO.AsString         := fieldbyname('descricao').AsString;
                            if FieldByName('codigo').AsInteger = iFormaPagamento then
                               CDSFormasVALOR.AsCurrency        := cTotalVenda
                            else
                               CDSFormasVALOR.AsCurrency        := 0;
                            CDSFormasTIPO.AsString              := trim(fieldbyname('tipo').AsString);
                            CDSFormasCONCEDER_DESCONTO.AsString := trim(fieldbyname('conceder_desconto').AsString);
                            CDSFormas.Post;
                         end;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.close;
     CDSFormas.First;
   end;
end;

procedure TFrmFechaVenda.DBGridFormasColEnter(Sender: TObject);
begin 
   if DBGridFormas.SelectedIndex = 0 then
      DBGridFormas.SelectedIndex:= 1;
end;

procedure TFrmFechaVenda.DBGridFormasEnter(Sender: TObject);
begin 
   CDSFormas.First;
   DBGridFormas.SelectedIndex:= 1;
end;

procedure TFrmFechaVenda.DBGridFormasExit(Sender: TObject);
begin
   CalculaTroco(CDSFormasCODIGO.AsInteger);
end;

procedure TFrmFechaVenda.DBGridFormasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   { Para não deixar apagar o registro }
   if  Key = VK_DELETE then
       Key:= VK_NONAME;

   Key:= NaoInsereDBGrid(TDBGrid(Sender), TDBGrid(Sender).DataSource.DataSet, Key);
  if ( key = VK_F6 ) and ( EdtTroco.Value < 0 ) then
     begin
        CDSFormas.Edit;
        CDSFormasVALOR.AsCurrency := EdtTroco.Value * -1;
        CDSFormas.Post;
        CDSFormas.Next;
     end;

end;

procedure TFrmFechaVenda.DBGridFormasKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         if CDSFormas.Eof then
            SelectNext(ActiveControl, True, True)
         else
            CDSFormas.Next;
         Key := #0;
      end;
end;

procedure TFrmFechaVenda.BtnAlteraParcelaClick(Sender: TObject);
begin 
   if (QBuscaParc.State = dsbrowse) and (not QBuscaParcCOD_CTR.IsNull) then
      begin 
         Application.CreateForm(TFrmAlteraParcela, FrmAlteraParcela);
         FrmAlteraParcela.Tag:= 0;
         FrmAlteraParcela.EdtCod.Text       := QBuscaParcCOD_CTR.AsString;
         FrmAlteraParcela.EdtSeq.Text       := QBuscaParcSEQUENCIA_CTR.AsString;
         FrmAlteraParcela.EdtDataEmi.Text   := QBuscaParcDATA_CTR.AsString;
         FrmAlteraParcela.EdtDataVen.Text   := QBuscaParcVENCTO_CTR.AsString;
         FrmAlteraParcela.EdtValor.Text     := QBuscaParcVALOR_CTR.AsString;
         FrmAlteraParcela.EdtDataPagto.Text := QBuscaParcDTPAGTO_CTR.AsString;
         FrmAlteraParcela.EdtParc.Text      := QBuscaParcPARCELA_CTR.AsString;
         FrmAlteraParcela.showmodal;
      end;
end;

procedure TFrmFechaVenda.BtnExcluirParcelaClick(Sender: TObject);
begin 
   if (QBuscaParc.State = dsbrowse) and (not QBuscaParcCOD_CTR.IsNull) then
      begin 
         if Application.MessageBox('Confirma a Exclusão da Parcela?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin 
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               try
                 try
                   with dm.QConsulta do
                     begin 
                        close;
                        sql.Clear;
                        sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                                   'WHERE COD_CTR  = :COD AND SEQUENCIA_CTR = :SEQ';
                        Parambyname('cod').AsInteger := QBuscaParcCOD_CTR.AsInteger;
                        Parambyname('seq').AsInteger := QBuscaParcSEQUENCIA_CTR.AsInteger;
                        ExecOrOpen;
                     end;
                   DM.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   AlertaCad('Erro ao Excluir a Parcela');
                 end;
               finally
                 dm.QConsulta.Close;
                 BuscaParcelas;
               end;
            end;
      end;
end;

procedure TFrmFechaVenda.BuscaParcelas;
var cDif : currency;
    cTotalParc : currency;
    bTemParcela : boolean;
begin 
   cTotalParc:= 0;
   cDif:= 0;
   bTemParcela:= false;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QBuscaParc do
      begin 
         close;
         Parambyname('codvenda').AsInteger:= strtoint(frmvenda.EdtCod.Text);
         Open;
         DisableControls;
         First;
         while not eof do
            begin 
               cTotalParc:= cTotalParc + QBuscaParcVALOR_CTR.AsCurrency;
               next;
            end;
         First;
         EnableControls;
         if cTotalParc > 0 then
            bTemParcela := true
         else
            bTemParcela := false;
      end;

   if bTemParcela then
      begin 
         cDif:= cTotalParc - TotalizaFormaPagamento('PR');
         if cdif <> 0 then
            AcertaValorParcela(cDif);
      end;
end;

procedure TFrmFechaVenda.AcertaValorParcela(const Valor : currency);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaParc do
      begin 
         first;
         if valor > 0 then
            begin 
               last;
               QUpdValor.Close;
               QUpdValor.ParamByName('codctr').AsInteger    := QBuscaParcCOD_CTR.AsInteger;
               QUpdValor.ParamByName('seq').AsInteger       := QBuscaParcSEQUENCIA_CTR.AsInteger;
               QUpdValor.ParamByName('valorctr').AsCurrency := QBuscaParcVALOR_CTR.AsCurrency - valor;
               QUpdValor.ExecOrOpen;
            end
         else
            if valor < 0 then
               begin 
                  if not QBuscaParcDTPAGTO_CTR.IsNull then
                     next;
                  QUpdValor.Close;
                  QUpdValor.ParamByName('codctr').AsInteger    := QBuscaParcCOD_CTR.AsInteger;
                  QUpdValor.ParamByName('seq').AsInteger       := QBuscaParcSEQUENCIA_CTR.AsInteger;
                  QUpdValor.ParamByName('valorctr').AsCurrency := QBuscaParcVALOR_CTR.AsCurrency - valor;
                  QUpdValor.ExecOrOpen;
               end;
      end;
   dm.IBTransaction.Commit;
   QUpdValor.close;
   BuscaParcelas;
end;

procedure TFrmFechaVenda.AtualizaVenda;
var iCodTroco : integer;
   StrVenda: String;
   StrVenda2: string;
begin
   { atualizando a tabela de vendas }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'UPDATE VENDAS SET DESCONTO_VEN = :2, ' +
                        'TOTAL_VEN = :3 WHERE COD_VEN = :1';
             Parambyname('1').AsInteger   := strtoint(FrmVenda.EdtCod.Text);
             Parambyname('2').AsCurrency  := strtocurr(EdtValorDesconto.Text);
             Parambyname('3').AsCurrency  := strtocurr(EdtTotalLiquido.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
       AlertaCad('Venda atualizada com sucesso.', alertOK);
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro atualizando a tabela vendas');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { deletando as formas de pagamento da venda - caso existe }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM VENDAS_FORMAS_PAGAMENTO ' +
                        'WHERE COD_VENDA = :CODVEN';
             Parambyname('codven').AsInteger:= strtoint(FrmVenda.EdtCod.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao excluir as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { deletando as formas de pagamento da venda - caixa }
   StrVenda := 'VENDA[' + Poem_Zeros( strtoint(FrmVenda.EdtCod.Text), 9 ) + ']';
   StrVenda2 := 'CAIXA['+ Poem_Zeros( IntToStr( DicFluxo.CodCaixa ), 3 ) +']/' +
      StrVenda + '->';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM NEWCAIXA_MOVIMENTOS ' +
                        'WHERE COD_EMP = :COD_EMP AND COD_CAI = :COD_CAI AND DOCUMENTO=:DOCUMENTO';
             Parambyname('COD_EMP').AsInteger:= DicFluxo.CodEmp;
             Parambyname('COD_CAI').AsInteger:= DicFluxo.CodCaixa;
             Parambyname('DOCUMENTO').AsString :=
                StrVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao excluir as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { grava as formas de pagamento }
   CDSFormas.First;
   while not CDSFormas.Eof do
      begin 
         if CDSFormasVALOR.AsCurrency > 0 then
            begin 
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               try
                 try
                   with dm.QConsulta do
                      begin 
                         close;
                         sql.Clear;
                         sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                                    'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
                         Parambyname('codvenda').AsInteger  := strtoint(FrmVenda.EdtCod.Text);
                         Parambyname('codforma').AsInteger  := CDSFormasCODIGO.AsInteger;
                         Parambyname('valor').AsCurrency    := CDSFormasVALOR.AsCurrency;
                         ExecOrOpen;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   AlertaCad('erro ao gravar as formas de pagamento');
                 end;
               finally
                 dm.QConsulta.Close;
               end;
            end;
         if CDSFormasVALOR.AsCurrency > 0 then
            DicFluxo.Movimentos.GravarMovimentoForma( 'FLUXO_VENDAS', 'FLUXO_VENDAS_CHAVE',
               StrVenda2 + CDSFormasDESCRICAO.AsString,
               CDSFormasCODIGO.AsInteger,
               CDSFormasVALOR.AsCurrency,
               StrVenda  );

         CDSFormas.Next;
      end;

   { gravando o troco }
   iCodTroco:= dm.BuscaFormaPagamento('TR');
   if strtocurr(EdtTroco.Text) > 0 then
      DicFluxo.Movimentos.GravarMovimentoForma( 'FLUXO_VENDAS', 'FLUXO_VENDAS_CHAVE',
          StrVenda2 + 'TROCO',
         iCodTroco,
         strtocurr(EdtTroco.Text),
         StrVenda  );

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                        'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
             Parambyname('codvenda').AsInteger  := strtoint(FrmVenda.EdtCod.Text);
             Parambyname('codforma').AsInteger  := iCodTroco;
             Parambyname('valor').AsCurrency    := strtocurr(EdtTroco.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao gravar as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
//     BtnGeraNF.Enabled := true;
   end;
   DicFluxo.Movimentos.GravarMovimento(
      'FLUXO_FATURAMENTO' ,
      'FLUXO_FATURAMENTO_VENDAS',
      'CAIXA['+ Poem_Zeros( IntToStr( DicFluxo.CodCaixa ), 3 ) +']/' +
         StrVenda + '/' +
         'CLIENTE[' + FrmVenda.EdtNomecli.Text  + ']',
      'DN',
      cTotalVenda,
      StrVenda );
end;

procedure TFrmFechaVenda.CalculaTroco(const iCodForma : integer);
var cTotalFormas, cValorTroco : currency;
begin 
   cTotalFormas:= 0;
   cValorTroco := 0;

   with CDSFormas do
      begin 
         First;
         while not eof do
            begin 
               cTotalFormas:= cTotalFormas + CDSFormasVALOR.AsCurrency;
               next;
            end;
      end;
   cValorTroco:= cTotalFormas - StrToCurr(EdtTotalLiquido.Text);
   EdtTroco.Text:= currtostr(cValorTroco);

   if iCodForma > 0 then
      CDSFormas.Locate('codigo', iCodForma, []);
end;

procedure TFrmFechaVenda.EdtPercentualDescontoExit(Sender: TObject);
begin 
   if strtocurr(EdtPercentualDesconto.Text) < 0 then
      begin 
         AlertaCad('Valor do Desconto não pode ser negativo');
//         EdtPercentualDesconto.SetFocus;
         exit;
         abort;
      end;
   if strtocurr(EdtPercentualDesconto.Text) > 0 then
      begin 
         cDescontoVenda        := strtocurr(currtostrf((strtocurr(EdtSubTotal.Text) * strtocurr(EdtPercentualDesconto.text)) / 100, ffFixed, 2));
         EdtValorDesconto.Text := currtostr(cDescontoVenda);
         if cDescontoVenda > 0 then
            begin 
               EdtTotalLiquido.Text:= currtostr(strtocurr(EdtSubTotal.Text) - cDescontoVenda);
               FormasComDesconto;
            end;
         EdtTroco.Text := '0';
      end
   else
      begin 
         EdtValorDesconto.Clear;
         cDescontoVenda:= 0;
         FormasPagamento;
      end;
end;

procedure TFrmFechaVenda.FormasComDesconto;
var bAux : boolean;
begin 
   bAux:= false;

   with CDSFormas do
      begin 
         DisableControls;
         First;

         { verfifica se tem alguma forma que concede desconto }
         while not eof do
            begin 
               if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'S' then
                  bAux:= true;
               next;
            end;

         if bAux then
            begin 
               First;
               while not eof do
                  begin 
                     if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'N' then
                        Delete
                     else
                        begin 
                           if CDSFormasCODIGO.AsInteger = iFormaPagamento then
                              begin 
                                 Edit;
                                 CDSFormasVALOR.AsCurrency:= strtocurr(EdtTotalLiquido.Text);
                                 post;
                              end;
                           next;
                        end;
                  end;
            end
         else
            begin 
               cDescontoVenda:= 0;
               EdtPercentualDesconto.Clear;
               EdtValorDesconto.Clear;
               PanelDesconto.Enabled:= false;
               AlertaCad('Formas de Pagamento não concedem desconto');
            end;

         First;
         EnableControls;
      end;
end;

procedure TFrmFechaVenda.EdtValorDescontoExit(Sender: TObject);
begin 
   if strtocurr(EdtValorDesconto.Text) < 0 then
      begin 
         AlertaCad('Valor do Desconto não pode ser negativo');
//         EdtValorDesconto.SetFocus;
         exit;
         abort;
      end;

   cDescontoVenda:= strtocurr(EdtValorDesconto.Text);
   if cDescontoVenda > 0 then
      begin
         EdtTotalLiquido.Text:= currtostr(strtocurr(EdtSubTotal.Text) - cDescontoVenda);
         FormasComDesconto;
      end
   else
      begin 
         EdtPercentualDesconto.Clear;
         FormasPagamento;
      end;

   EdtTroco.Text:= '0';
end;

procedure TFrmFechaVenda.CDSFormasAfterPost(DataSet: TDataSet);
begin 
   CalculaTroco(CDSFormasCODIGO.AsInteger);
end;

function TFrmFechaVenda.NotaFiscal : integer;
begin 
{ verifica se tem nota gerada para esta venda }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_NF ' +
                        'FROM NOTA_FISCAL ' +
                        'WHERE COD_VENDA = :CODVENDA';
             Parambyname('codvenda').AsInteger:= StrToInt(FrmVenda.EdtCod.Text);
             open;
             if not (fieldbyname('cod_nf').IsNull) then
                result:= fieldbyname('cod_nf').AsInteger
             else
                result:= 0;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 999;
       AlertaCad('Erro ao buscar Código da NF');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmFechaVenda.QBuscaParcAfterPost(DataSet: TDataSet);
begin
    dm.IBTRAux.CommitRetaining;
end;

procedure TFrmFechaVenda.SpeedButton1Click(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   Application.CreateForm( TfrmRel_Fechavenda, frmRel_Fechavenda);
   frmRel_Fechavenda.QReceber.SQL.Text := 'select R.*, C.NOME_CLI  from CONTAS_RECEBER R INNER JOIN CLIENTE C ON ( R.COD_CLI = C.COD_CLI ) where COD_VENDA=:CODVENDA';
   frmRel_FechaVenda.QReceber.ParamByName('CODVENDA').AsString := FrmVenda.EdtCod.Text;
   frmRel_FechaVenda.QReceber.Open;
   if frmRel_FechaVenda.QReceber.IsEmpty then
      begin 
         AlertaCad( 'Venda ainda não gerou parcelas!' );
         frmRel_FechaVenda.QReceber.Close;
         dm.IBTransaction.Commit;
         exit;
      end;
   frmRel_FechaVenda.QuickRep1.PreviewModal;
   frmRel_FechaVenda.QReceber.Close;
   dm.IBTransaction.Commit;


end;

procedure TFrmFechaVenda.BtnGeraNFClick(Sender: TObject);
begin 
   btnGerarNF := True;
   BtnOk.Click;
   Application.CreateForm(TFrmDadosNotaFiscal, FrmDadosNotaFiscal);
   FrmDadosNotaFiscal.tag:= 0;
   FrmDadosNotaFiscal.EdtDataEmissao.Text:= FrmVenda.EdtData.Text;
   FrmDadosNotaFiscal.Venda := True;
   FrmDadosNotaFiscal.showmodal;
   close;
end;

procedure TFrmFechaVenda.ImpressaoMultiplaVenda;
var
   ImpPromissoria: Boolean;
begin
   if dmRelGerais.TRGerais.Active then
      dmRelGerais.TRGerais.Commit;
   dmRelGerais.TRGerais.StartTransaction;
   try
       CDSFormas.Filter := 'VALOR>0';
       CDSFormas.Filtered := True;
//               dmRelGerais.QLinhas.Close;
       dmRelGerais.QLinhas.Close;
       dmRelGerais.QLinhas.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
       dmRelGerais.QLinhas.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
       dmRelGerais.QLinhas.Open;
       dmRelGerais.QLinhas.Filter := 'LINHA IS NOT NULL';
       dmRelGerais.QLinhas.Filtered := True;
       dmRelGerais.QEmpresa.Close;
       dmRelGerais.QEmpresa.ParamByName('CODEMP').AsInteger := iEmp;
       dmRelGerais.QEmpresa.Open;
       dmRelGerais.QCliente.Close;
       dmRelGerais.QCliente.ParamByName('CODCLI').AsString := frmVenda.EdtCodcli.Text;
       dmRelGerais.QCliente.Open;
       itens.Close;
       itens.SQL.Text := SQLItens;
       itens.SQL.Add( 'where I.COD_VEN=:CODVENDA');
       itens.ParamByName('CODVENDA').AsString := frmVenda.EdtCod.Text;
       Itens.ParamByName('TPV').AsString := FrmVenda.EdtCodTPV.Text;
       itens.Open;
       ImpPromissoria := TDicLib.GetParam( iEmp, 'FATURAMENTO', 'VENDA_IMPRIME_PROMISSORIAS', DM.IBDatabase,
                        'SIM', 'SIM;NAO', 'FATURAMENTO', 'CHECK', 'DEFINE SE IMPRIME PORMISSORIAS NA VENDA' ).Valor = 'SIM';
       if not ImpPromissoria then
          begin
             QBuscaParc.Filter := 'COD_CTR=0';
             QBuscaParc.Filtered := True;
          end;
       KadoshiPrinters.ImprimirRel( frxMestre, 'FATURAMENTO', 'VENDA', 'FAT_VENDA', '', True );
       QBuscaParc.Filtered := False;
       QBuscaParc.Filter := '';
       BuscaParcelas;

   finally
       CDSFormas.Filtered := False;
       if dmRelGerais.TRGerais.Active then
          dmRelGerais.TRGerais.Commit;
   end;
end;

procedure TFrmFechaVenda.ItensCalcFields(DataSet: TDataSet);
begin 
  itensCALC_TOTAL.AsCurrency:= ((ItensQUANT.AsCurrency * ItensVALOR.AsCurrency) - ItensDESCONTO.AsCurrency);
end;

end.

