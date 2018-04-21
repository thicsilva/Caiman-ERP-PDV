unit UDM;

interface

uses
  SysUtils, Windows, ComCtrls, Classes, DB, Forms, IniFiles, dialogs, 
  LockApplication, ACBrECFClass, ACBrBase, ACBrECF, ACBrEAD, ACBrPAF, ACBrAAC, 
  UVendasCaixa, ACBrTEFD, ACBrUtil, TypInfo, Controls, ACBrDevice, UECF, 
  UDialog, Func, ExtCtrls, Graphics, jpeg, RxCurrEdit, StdCtrls, sLabel, 
  DBGrids, acAlphaImageList, ACBrPAFClass, StrUtils, UMultiThreadNew, ACBrNFe, 
  ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR, pcnConversao, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, ACBrDFe, 
  pcnCOnversaoNFe, FireDAC.VCLUI.Wait, FireDAC.Phys.FB, FireDAC.Phys.IBBase, 
  FireDAC.Phys.FBDef, FireDAC.Comp.UI, frxClass;

type
  TDM = class(TDataModule)
    IBTransaction: TFDTransaction;
    IBDatabase: TFDConnection;
    QAcesso: TFDQuery;
    QBanco: TFDQuery;
    DSQBanco: TDataSource;
    QBancoCOD_BAN: TIntegerField;
    QBancoNOME_BAN: TStringField;
    IBSQLcod: TFDQuery;
    QBandeira: TFDQuery;
    DSBandeira: TDataSource;
    QConsulta: TFDQuery;
    IBTRAux: TFDTransaction;
    IBSQL: TFDQuery;
    IBDatabaseServer: TFDConnection;
    IBTRServer: TFDTransaction;
    QVend: TFDQuery;
    QVendCOD_VEND: TIntegerField;
    QVendNOME_VEND: TStringField;
    QVendATIVO_VEND: TStringField;
    DSQVend: TDataSource;
    QTipoVenda: TFDQuery;
    DSQTipoVenda: TDataSource;
    QConsultaServer: TFDQuery;
    QEstoqueServer: TFDQuery;
    QEstoqueServerCOD_PRO: TIntegerField;
    QEstoqueServerESTOQUE: TBCDField;
    QAbreVenda: TFDQuery;
    QAbreVendaCODVEN: TIntegerField;
    QAtualizaVenda: TFDQuery;
    QTipoVendaCOD_TPV: TIntegerField;
    QTipoVendaNOME_TPV: TStringField;
    QTipoVendaQTDPARCELAS_TPV: TIntegerField;
    QTipoVendaDIASPRIPARC_TPV: TIntegerField;
    QTipoVendaDIASENTREPARC_TPV: TIntegerField;
    QTipoVendaPOSSUI_ENTRADA: TStringField;
    QTipoVendaPERC_ENTRADA: TBCDField;
    QTipoVendaTABELA_PRECO_TPV: TStringField;
    QMapaResumo: TFDQuery;
    QMapaResumoCHECKOUT: TIntegerField;
    QMapaResumoDATA: TDateField;
    QMapaResumoCOO_INICIAL: TIntegerField;
    QMapaResumoCOO_FINAL: TIntegerField;
    QMapaResumoGT_INICIAL: TBCDField;
    QMapaResumoGT_FINAL: TBCDField;
    QMapaResumoCONT_REDUCAO: TIntegerField;
    QMapaResumoCONT_CANCEL: TIntegerField;
    QMapaResumoCONTADOR_REINICIO_OPERACAO: TIntegerField;
    QMapaResumoCOD_EMP: TIntegerField;
    QMapaResumoCODIGO: TIntegerField;
    QMapaResumoDATA_EMISSAO: TDateField;
    QMapaResumoHORA_EMISSAO: TTimeField;
    QTotalizadores: TFDQuery;
    QTotalizadoresCODIGO: TIntegerField;
    QTotalizadoresCOD_GRP: TIntegerField;
    QTotalizadoresVALOR: TBCDField;
    QTotalizadoresCOD_EMP: TIntegerField;
    QTotalizadoresINDICE_R03: TStringField;
    QTotalizadoresCONT_REDUCAO: TIntegerField;
    QCupom: TFDQuery;
    QCupomR04_CCF: TIntegerField;
    QCupomR04_NOME_CLIENTE: TStringField;
    QCupomR04_CNPJ_CLIENTE: TStringField;
    QCupomCANCELADA_VEN: TIntegerField;
    QCupomCUPOM_FISCAL_VEN: TIntegerField;
    QCupomDATA_VEN: TDateField;
    QCupomDESCONTO_VEN: TBCDField;
    QCupomTOTAL_VEN: TBCDField;
    QCupomR04_CCF1: TIntegerField;
    QCupomR04_NOME_CLIENTE1: TStringField;
    QCupomR04_CNPJ_CLIENTE1: TStringField;
    QItensCupom: TFDQuery;
    QItensCupomCOD_VEN: TIntegerField;
    QItensCupomCOD_PRO: TIntegerField;
    QItensCupomORDEM: TIntegerField;
    QItensCupomDESCONTO: TBCDField;
    QItensCupomCOD_EMP: TIntegerField;
    QItensCupomQUANT: TBCDField;
    QItensCupomVALOR: TBCDField;
    QItensCupomVALOR_CUSTO: TBCDField;
    QItensCupomPRODUTO_PROMOCAO: TStringField;
    QItensCupomCANCELADO: TIntegerField;
    QItensCupomVENDA_CANCELADA: TIntegerField;
    QItensCupomCUPOM_FISCAL_VEN: TIntegerField;
    QItensCupomR04_CCF: TIntegerField;
    QItensCupomDESC_CUPOM: TStringField;
    QItensCupomICMS_CF_EST: TIntegerField;
    QItensCupomCOD_CAI: TIntegerField;
    QItensCupomTIPO_PRODUCAO: TStringField;
    QItensCupomCODIGO_BARRA_PRO: TStringField;
    QOutrosDocumentos: TFDQuery;
    QOutrosDocumentosCODIGO: TIntegerField;
    QOutrosDocumentosCOD_CAI: TIntegerField;
    QOutrosDocumentosCOD_EMP: TIntegerField;
    QOutrosDocumentosCOO: TIntegerField;
    QOutrosDocumentosGNF: TIntegerField;
    QOutrosDocumentosGRG: TIntegerField;
    QOutrosDocumentosCDC: TIntegerField;
    QOutrosDocumentosDESCRICAO: TStringField;
    QOutrosDocumentosDATA_FINAL: TDateField;
    QOutrosDocumentosHORA_FINAL: TTimeField;
    QIndice: TFDQuery;
    QIndiceINDICE_R03: TStringField;
    IBTRAuxServer: TFDTransaction;
    QMeiosPagamento: TFDQuery;
    QMeiosPagamentoCODIGO: TIntegerField;
    QMeiosPagamentoCOD_CAI: TIntegerField;
    QMeiosPagamentoCOD_EMP: TIntegerField;
    QMeiosPagamentoCOO: TIntegerField;
    QMeiosPagamentoCCF: TIntegerField;
    QMeiosPagamentoGNF: TIntegerField;
    QMeiosPagamentoMEIO_PAGAMENTO: TStringField;
    QMeiosPagamentoVALOR_PAGO: TBCDField;
    QMeiosPagamentoDATA: TDateField;
    QGravaMapa: TFDQuery;
    QGravaMapaCODMAPA: TIntegerField;
    QC400: TFDQuery;
    QC400COD_CAI: TIntegerField;
    QC400R01_NUMERO_SERIE: TStringField;
    QC400R01_MODELO_ECF: TStringField;
    QC405: TFDQuery;
    QC405CODIGO: TIntegerField;
    QC405DATA: TDateField;
    QC405CONTADOR_REINICIO_OPERACAO: TIntegerField;
    QC405CONT_REDUCAO: TIntegerField;
    QC405COO_FINAL: TIntegerField;
    QC405GT_FINAL: TBCDField;
    QC405VENDA_BRUTA: TBCDField;
    QC420: TFDQuery;
    QC420INDICE_R03: TStringField;
    QC420VALOR: TBCDField;
    QC420COD_GRP: TIntegerField;
    QC425: TFDQuery;
    QC460: TFDQuery;
    QC460CUPOM_FISCAL_VEN: TIntegerField;
    QC460DATA_VEN: TDateField;
    QC460TOTAL_VEN: TBCDField;
    QC460R04_CNPJ_CLIENTE: TStringField;
    QC460R04_NOME_CLIENTE: TStringField;
    QC460CANCELADA_VEN: TIntegerField;
    QC460COD_VEN: TIntegerField;
    QC470: TFDQuery;
    QC470COD_PRO: TIntegerField;
    QC470QUANT: TBCDField;
    QC470TOTAL: TFloatField;
    QC470CANCELADO: TIntegerField;
    QC470CFOP_VENDAS_CF_EST: TIntegerField;
    QC470CST_CF_EST: TStringField;
    QC470ALIQUOTA_GRP: TBCDField;
    QC470DESCRICAO: TStringField;
    QC350: TFDQuery;
    QC350SERIE_NOTA_FISCAL: TStringField;
    QC350NUMERO_NOTA_FISCAL: TIntegerField;
    QC350DATA_VEN: TDateField;
    QC350R04_CNPJ_CLIENTE: TStringField;
    QC350TOTAL_VEN: TBCDField;
    QC350DESCONTO_VEN: TBCDField;
    QC370: TFDQuery;
    QC350COD_VEN: TIntegerField;
    QC370ORDEM: TIntegerField;
    QC370COD_PRO: TIntegerField;
    QC370QUANT: TBCDField;
    QC370VALOR: TBCDField;
    QC370TOTAL: TFloatField;
    QC370DESCONTO: TBCDField;
    QC370DESCRICAO: TStringField;
    QC390: TFDQuery;
    QC390VALOR: TFloatField;
    QC390CST_CF_EST: TStringField;
    QC390CFOP_VENDAS_CF_EST: TIntegerField;
    QC390ALIQUOTA_GRP: TBCDField;
    QC390TIPO_GRP: TStringField;
    QItensCupomDESCRICAO: TStringField;
    QC490: TFDQuery;
    QC490VALOR: TFloatField;
    QC490CST_CF_EST: TStringField;
    QC490CFOP_VENDAS_CF_EST: TIntegerField;
    QC490ALIQUOTA_GRP: TBCDField;
    QC490TIPO_GRP: TStringField;
    QBandeiraCODIGO: TIntegerField;
    QBandeiraCODIGO_ADMINISTRADORA: TIntegerField;
    QBandeiraDESCRICAO: TStringField;
    QBandeiraATIVO: TStringField;
    QBandeiraTAXA_CREDITO: TBCDField;
    QBandeiraTAXA_DEBITO: TBCDField;
    QBandeiraDIAS_CREDITO: TIntegerField;
    QBandeiraDIAS_DEBITO: TIntegerField;
    QBandeiraTIPO_CARTAO: TStringField;
    QBandeiraCODIGO_TEF: TIntegerField;
    QBandeiraADMINISTRADORA: TStringField;
    QBandeiraCALC_TIPO: TStringField;
    QEstoqueServerCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QEstoqueServerCOD_EMP: TIntegerField;
    LockApplication1: TLockApplication;
    IBSPGravaItem: TFDStoredProc;
    cmd: TFDQuery;
    ECF: TACBrECF;
    PAF: TACBrPAF;
    EAD1: TACBrEAD;
    ACBrAAC1: TACBrAAC;
    CONTEXTO: TFDQuery;
    AuxTipo_R: TFDConnection;
    TRAuxTipo_R: TFDTransaction;
    CONTEXTO_R: TFDQuery;
    QConsultaR: TFDQuery;
    QConsultaAux: TFDQuery;
    BuscaIndiceR: TFDQuery;
    BuscaIndiceRINDICE_R03: TStringField;
    TRBlocoVII: TFDTransaction;
    QBlocoVII: TFDQuery;
    QC100: TFDQuery;
    QC100COD_NF: TIntegerField;
    QC100COD_EMP: TIntegerField;
    QC100NUMERO_NOTA_NF: TIntegerField;
    QC100DATA_EMISSAO_NF: TDateField;
    QC100DATA_SAIDA_NF: TDateField;
    QC100HORA_SAIDA_NF: TTimeField;
    QC100COD_TRA: TIntegerField;
    QC100BASE_CALCULO_ICMS_NF: TBCDField;
    QC100VALOR_ICMS_NF: TBCDField;
    QC100BASE_SUBST_NF: TBCDField;
    QC100VALOR_SUBST_NF: TBCDField;
    QC100VALOR_TOTAL_PROD_NF: TBCDField;
    QC100VALOR_FRETE_NF: TBCDField;
    QC100VALOR_SEGURO_NF: TBCDField;
    QC100OUTRAS_DESPESAS_NF: TBCDField;
    QC100VALOR_IPI_NF: TBCDField;
    QC100VALOR_TOTAL_NF: TBCDField;
    QC100ESPECIE_NF: TStringField;
    QC100MARCA_NF: TStringField;
    QC100NUMERO_NF: TStringField;
    QC100INF_COMPL_NF: TWideMemoField;
    QC100CANCELADA_NF: TStringField;
    QC100FRETE_CONTA_NF: TStringField;
    QC100COD_CLI: TIntegerField;
    QC100COD_FOR: TIntegerField;
    QC100DESCONTO_NF: TBCDField;
    QC100TIPO_CLIENTE: TStringField;
    QC100NOTA_IMPRESSA: TStringField;
    QC100COD_VENDA: TIntegerField;
    QC100COD_TPV: TIntegerField;
    QC100SERIE_NOTA: TStringField;
    QC100TIPO_NOTA_FISCAL: TIntegerField;
    QC100CODIFICACAO_FISCAL: TStringField;
    QC100CODIGO_OUTRA_ENTRADA: TIntegerField;
    QC100CODIGO_OUTRA_SAIDA: TIntegerField;
    QC100CHAVE_ACESSO_NFE: TStringField;
    QC100PROTOCOLO_NFE: TStringField;
    QC100STATUS_TRANSMITIDA: TStringField;
    QC100STATUS_RETORNO: TStringField;
    QC100STATUS_CANCELADO: TStringField;
    QC100STATUS_INUTILIZADO: TStringField;
    QC100STATUS_EMAIL: TStringField;
    QC100JUSTIFICATIVA_CANCEL_INUTIL: TStringField;
    QC100PLACA_TRANSP: TStringField;
    QC100UF_PLACA_TRANSP: TStringField;
    QC100PESO_BRUTO_NF: TBCDField;
    QC100PESO_LIQUIDO_NF: TBCDField;
    QC100QUANTIDADE_NF: TIntegerField;
    QC100CHAVE2: TStringField;
    QC100DEPEC: TIntegerField;
    QC100VALOR_PIS: TBCDField;
    QC100VALOR_COFINS: TBCDField;
    QC100CORRECAO: TStringField;
    QC170: TFDQuery;
    QC170ORDEM: TIntegerField;
    QC170COD_NF: TIntegerField;
    QC170CST: TStringField;
    QC170ALIQ: TBCDField;
    QC170COD_EMP: TIntegerField;
    QC170COD_GRP: TIntegerField;
    QC170QUANT: TBCDField;
    QC170ALIQ_IPI: TBCDField;
    QC170REDUCAO_ICMS: TBCDField;
    QC170COD_CFO: TIntegerField;
    QC170SUB_TRIBUTARIA: TStringField;
    QC170VR_AGREGADO: TBCDField;
    QC170ALIQUOTA_FORA_ESTADO: TBCDField;
    QC170UNIDADE: TStringField;
    QC170COD_PRO: TIntegerField;
    QC170VALOR_TOTAL: TBCDField;
    QC170BASE_CALCULO: TBCDField;
    QC170VALOR_ICMS: TBCDField;
    QC170BASE_SUBTRIB: TBCDField;
    QC170VALOR_IPI: TBCDField;
    QC170VALOR_SUBTRIB: TBCDField;
    QC170CLASSIFICACAO_FISCAL: TStringField;
    QC170UNIT: TBCDField;
    QC170ISENTAS: TBCDField;
    QC170OUTRAS: TBCDField;
    QC170FRETE: TFloatField;
    QC170DESCONTO: TFloatField;
    QC170BC_PIS: TBCDField;
    QC170ALIQ_PIS: TBCDField;
    QC170VALOR_PIS: TBCDField;
    QC170BC_COFINS: TBCDField;
    QC170ALIQ_COFINS: TBCDField;
    QC170VALOR_COFINS: TBCDField;
    QC170CANCELADO: TIntegerField;
    QC170NF_CANCELADA: TIntegerField;
    QC170CST_PIS: TStringField;
    QC170CST_COFINS: TStringField;
    QC170CSOSN: TStringField;
    QC170CST_IPI: TStringField;
    QC100PAF_ECF: TStringField;
    QH010: TFDQuery;
    QH005: TFDQuery;
    QH005TOTAL: TFMTBCDField;
    QH010COD_EMP: TIntegerField;
    QH010COD_PRO: TIntegerField;
    QH010ESTOQUE: TBCDField;
    QH010CODIGO_LOCAL_ESTOQUE: TIntegerField;
    QH010UNIDADE: TStringField;
    QH010VALOR_PRO: TBCDField;
    QH010VL_ITEM: TFMTBCDField;
    QC170NOME_PRO: TStringField;
    QC170UNID: TStringField;
    QC190: TFDQuery;
    QC190CST: TStringField;
    QC190COD_CFO: TIntegerField;
    QC190ALIQ: TBCDField;
    QC190TOTAL: TBCDField;
    QC190BC_ICMS: TBCDField;
    QC190V_ICMS: TBCDField;
    QC190BC_ICMS_ST: TBCDField;
    QC190V_ICMS_ST: TBCDField;
    QC190V_REDUCAO: TBCDField;
    QC190V_IPI: TBCDField;
    QC460NUMERO_NOTA_FISCAL: TIntegerField;
    QC460CODIFICACAO_FISCAL: TStringField;
    QC490BuscaValor: TFDQuery;
    QC490BuscaValorVALOR: TBCDField;
    QC490COD_GRP: TIntegerField;
    Q0150: TFDQuery;
    Q0150COD_CLI: TIntegerField;
    Q0150FJ_CLI: TStringField;
    Q0150NOME_CLI: TStringField;
    Q0150COD_CLA: TIntegerField;
    Q0150ENDRES_CLI: TStringField;
    Q0150BAIRES_CLI: TStringField;
    Q0150CIDRES_CLI: TStringField;
    Q0150ESTRES_CLI: TStringField;
    Q0150CEPRES_CLI: TStringField;
    Q0150TELRES_CLI: TStringField;
    Q0150ENDCOM_CLI: TStringField;
    Q0150BAICOM_CLI: TStringField;
    Q0150CIDCOM_CLI: TStringField;
    Q0150ESTCOM_CLI: TStringField;
    Q0150CEPCOM_CLI: TStringField;
    Q0150TELCOM_CLI: TStringField;
    Q0150CNPJ_CLI: TStringField;
    Q0150DOC_CLI: TStringField;
    Q0150PAI_CLI: TStringField;
    Q0150MAE_CLI: TStringField;
    Q0150CONJUGE_CLI: TStringField;
    Q0150ESTCIVIL_CLI: TStringField;
    Q0150RENDA_CLI: TBCDField;
    Q0150LIMITE_CLI: TBCDField;
    Q0150PROFISSAO_CLI: TStringField;
    Q0150EMPRESA_TRAB_CLI: TStringField;
    Q0150ATIVO_CLI: TStringField;
    Q0150COD_CON: TIntegerField;
    Q0150OBS_VENDA: TStringField;
    Q0150OBS_CLI: TStringField;
    Q0150NASCIMENTO_CLI: TDateField;
    Q0150DATACADASTRO_CLI: TDateField;
    Q0150ATRAZO_MAXIMO_CLI: TIntegerField;
    Q0150CELULAR_CLI: TStringField;
    Q0150IMP_SALDO_PENDENTE_CLI: TStringField;
    Q0150LIMITE_CHEQUE: TBCDField;
    Q0150DATA_CONSULTA_SPC: TDateField;
    Q0150DATA_REGISTRO_SPC: TDateField;
    Q0150DATA_REABILITACAO_SPC: TDateField;
    Q0150SELECIONADO_CLI: TStringField;
    Q0150RENDA_CONJUGE: TBCDField;
    Q0150TRABALHO_CONJUGE: TStringField;
    Q0150PROF_CONJUGE: TStringField;
    Q0150NOME_FANTASIA: TStringField;
    Q0150PONTO_REFERENCIA: TStringField;
    Q0150CONTATO_CLI: TStringField;
    Q0150ROTA_CLI: TIntegerField;
    Q0150TIPO_CREDITO_CLI: TStringField;
    Q0150CONTROLAR_LIMITE: TStringField;
    Q0150BAICOB_CLI: TStringField;
    Q0150CIDCOB_CLI: TStringField;
    Q0150ESTCOB_CLI: TStringField;
    Q0150CEPCOB_CLI: TStringField;
    Q0150TELCOB_CLI: TStringField;
    Q0150ENDCOB_CLI: TStringField;
    Q0150BLOQUEADO_CLI: TStringField;
    Q0150INSC_ESTADUAL: TStringField;
    Q0150NUMRES_CLI: TStringField;
    Q0150NUMCOM_CLI: TStringField;
    Q0150NUMCOB_CLI: TStringField;
    Q0150CODIGO_IBGE: TIntegerField;
    Q0150EMAIL_CLI: TStringField;
    Q0150COD_DEPENDENTE: TIntegerField;
    Q0150NOME_DEPENDENTE: TStringField;
    Q0150GRAU_PARENTESCO: TStringField;
    QC490ICMS_SERVICO_GRP: TStringField;
    QC470ICMS_SERVICO_GRP: TStringField;
    QC460DESCONTO_VEN: TBCDField;
    Qimpostos: TFDQuery;
    QimpostosTOTAL_IMPOSTO: TBCDField;
    QC425COD_PRO: TIntegerField;
    QC425QUANT: TBCDField;
    QC425VALOR: TFMTBCDField;
    QC425DESCRICAO: TStringField;
    IBSQLFecha: TFDQuery;
    NFCe: TACBrNFe;
    Danfcenaofiscal: TACBrNFeDANFEFR;
    TRFormasNFCe: TFDTransaction;
    QFormasNFCe: TFDQuery;
    QFormasNFCeCOD_VENDA: TIntegerField;
    QFormasNFCeCOD_FORMA: TIntegerField;
    QFormasNFCeVALOR: TBCDField;
    QFormasNFCeTIPO: TStringField;
    QFormasNFCeDESCRICAO: TStringField;
    QFormasNFCeTROCO: TBCDField;
    fdphysfbdrvrlnk1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    frxReport1: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    Function RetiraPonto(Text: string): string;
    function RetornaStringTabela(CampoRetorno: string; tabela: string;
      Campochave: string; ValorChave: integer; const Server: Boolean = False ): string;
    function RetornaIntegerTabela(CampoRetorno: string; tabela: string;
      Campochave: string; ValorChave: integer): integer;
    Function LeIni(sArqIni: string; sSecao: string; sVariavel: string): string;
    procedure GravaIni(sArqIni: string; sSecao: string; sVariavel: string;
      sValor: string);
    function UltimoCOOVendido: integer;
    procedure CancelaVenda(const iCooVenda: integer);
    function BuscaCodigoProduto(const sCodBarra: string): integer;
    function TotalizaProdutos(sTipo: string; iCodVenda: integer): currency;
    procedure AssinaturaDigital(sArquivo: string);
    procedure GravaArquivosPAF(const sArquivoOrigem: string;
      const sArquivoDestino: string);
    procedure AtualizaEstoque( tag: integer);
    procedure MensagemErroECF(const sMensagem: string; bMostrar: boolean);

    function UpdateEstoque(const cEstoque: currency;
      const iCodProduto, iEmpresa, iLocal, tag: integer): integer;
    function InsertEstoque(const cEstoque: currency;
      const iCodProduto, iEmpresa, iLocal, tag: integer): integer;
    function IndiceRelGerencial(const sTipo: string): string;
    function BuscaIndice(const cod_cai, cod_emp, cod_grp: integer): string;
    function BuscaIndiceRR(const cod_cai, cod_emp, cod_grp: integer): string;
    function BuscaFormaPagamento(const sTipo: string): integer;
    function BuscaIndiceForma(const iForma: integer): string;
    function BuscaDescricaoFormaNaECF(const iForma: integer): string;
    function BuscaEstoqueProduto(const iCodPro, iCodEmp: integer): currency;

    procedure GeraMovimento(const NumeroECF: integer;
      const DataInicial, DataFinal: TDateTime; const iTag: integer; Parcial: string );
    procedure Gera_R01(const iNumECF: integer;
      const DataInicial, DataFinal: TDateTime);
    procedure Gera_R02(const iNumECF: integer;
      const DataInicial, DataFinal: TDateTime);

    procedure Gera_R04(const iNumECF: integer;
      const DataInicial, DataFinal: TDateTime);

    procedure Gera_R06(const iNumECF: integer;
      const DataInicial, DataFinal: TDateTime);

    procedure TabelaPreco(codtpv: integer);
    procedure QBandeiraCalcFields(DataSet: TDataSet);
    procedure EAD1GetChavePrivada(var Chave: AnsiString);
    procedure EAD1GetChavePublica(var Chave: AnsiString);
    procedure ACBrAAC1GetChave(var Chave: AnsiString);
    procedure Gera_RegistroN;
    procedure SetMainForm(FormAtivo: TForm);

    // FUNCOENS RPA MD5
    function Gerar_MD5_Registro_Tabela_Dados(tabela: TFDQuery): String;
    function MD5_IBSql(tabela: TFDQuery): String;
    procedure IBDatabaseAfterConnect(Sender: TObject);

    procedure VerificaEstoqueDia(tag: integer);
    procedure ECFAntesAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
    procedure ECFAntesAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
    procedure ECFAntesAbreRelatorioGerencial(const Indice: integer);
    function VerificaCaixaAberto: boolean;
    procedure ECFAntesLeituraX(Sender: TObject);
    procedure ECFDepoisCancelaNaoFiscal(Sender: TObject);
    procedure ECFDepoisAbreCupomVinculado(Sender: TObject);
    procedure ECFDepoisAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
    procedure ECFDepoisAbreRelatorioGerencial(const Indice: integer);
    procedure ECFAntesReducaoZ(Sender: TObject);
    procedure AuxTipo_RAfterConnect(Sender: TObject);
    procedure ECFMsgPoucoPapel(Sender: TObject);

    // TIPOS R BLOCO VII
    function Verifica_Alteracao_R01(cod_emp, CODCAI: integer): boolean;
    function Verifica_Alteracao_R02(COD_MAP, cod_emp, CODCAI: integer): boolean;
    function Verifica_Alteracao_R03(COD_MAP, cod_grp, cod_emp,
      CODCAI: integer): boolean;
    function Verifica_Alteracao_R04(cod_cai, cod_emp, COD_VEN,
      COD_CLI: integer): boolean;
    function Verifica_Alteracao_R05(cod_emp, cod_cai, COD_PRO, COD_VEN,
      ORDEM: integer): boolean;
    function Verifica_Alteracao_R06(CODIGO, cod_emp, cod_cai: integer): boolean;
    function Verifica_Alteracao_R07(cod_emp, cod_cai, CODIGO: integer): boolean;
    // INCLUSAO EXCLUSAO
    function Verifica_IncExc_R01(D1, D2: Tdate): boolean;
    procedure BuscaParametrosConf;
    procedure ECFDepoisFechaRelatorio(Sender: TObject);
    procedure ECFDepoisFechaNaoFiscal(const Observacao: AnsiString;
      const IndiceBMP: Integer);
     procedure MostraPopUp(Titulo: string; Mensagen: string; Financeiro: Boolean);
     procedure onTempo(Sender: TObject);

     function BuscaCor( Arquivo: string ;X, Y: Integer ): TColor;
  //   procedure RedimencionaTela( Formulario: TForm; XO, YO, XN, YN: Integer );
    procedure  ScaleForm (F: TForm; TelaInteira: Boolean ) ;
    function CarregaImagem( Arquivo: string ): TJPEGImage;
    procedure CarregaImagem2( Arquivo: string; Var Img: TJPEGImage );
    procedure CriaImg;
    procedure DestroyImg;

    procedure ImprimeConfiguracaoPAF;

    procedure AbreSemSenha;


     // REDUÇÃO Z AUTOMÁTICA
    function VerificadoReducaoAutomatica: Boolean;
    Procedure GravaReducaoZAutomatica;
    function VerificaTecla( Tecla: Char) : Boolean;
    procedure ECFDepoisLeituraX(Sender: TObject);
    procedure ECFDepoisReducaoZ(Sender: TObject);

    procedure ConfiguraNFCe;

    procedure NovoNumeroNFCe( Var NumeroNFCe: Integer; var Serie: Integer;
     const Gravar: Boolean = false );
    procedure NFCeStatusChange(Sender: TObject);

  private
    { Private declarations }
    fCancelado: boolean;
    iCOOaCancelar: integer;
    MD5LIDO: string;
    ArquivoAntigo: TStrings;
    ArquivoNovo: TStrings;
    Cortar: Boolean;

  public
    { Public declarations }
        Tempo: TTimer;
        tmAltura: Integer;
        PastaArqVends: string;
        ErroArquivoAuxiliar: Boolean;

    // IMAGENS SKIN
    FundoCaixa: String;
    Fundotroco: String;
    FundoFechaVenda: String;
    FundoCarrega: String;
    FundoMenTef: String;
    FundoEntradaTef: String;
    FundoMenuTef: STring;
    FundoBalanca: String;
    FundoLogin: String;
    LogoRestaurante: String;
    //////////////////
    ///
    ///
    ///  TEF
    TecladoBloqueado: Boolean;


    ImgTempCia: TJPEGImage;

    PW: Double;
    PH: Double;
    const
       WOriginal = 1024;
       HOriginal = 768;
  end;

  // *************************************
  // Funções principais da DLL
  // *************************************
function ConfiguraIntSiTefInterativo(pEnderecoIP: PChar; pCodigoLoja: PChar;
  pNumeroTerminal: PChar; ConfiguraResultado: smallint): integer; far; stdcall;
  external 'CliSiTef32I.dll';
function ConfiguraIntSiTefInterativoEx(pEnderecoIP: PChar; pCodigoLoja: PChar;
  pNumeroTerminal: PChar; ConfiguraResultado: smallint;
  ParametrosAdicionais: PChar): integer; far; stdcall;
  external 'CliSiTef32I.dll';
function IniciaFuncaoSiTefInterativo(Modalidade: integer; pValor: PChar;
  pNumeroCuponFiscal: PChar; pDataFiscal: PChar; pHorario: PChar;
  pOperador: PChar; pRestricoes: PChar): integer; far; stdcall;
  external 'CliSiTef32I.dll';
procedure FinalizaTransacaoSiTefInterativo(smallint: Word;
  pNumeroCuponFiscal: PChar; pDataFiscal: PChar; pHorario: PChar); far; stdcall;
  external 'CliSiTef32I.dll';
function ContinuaFuncaoSiTefInterativo(var ProximoComando: integer;
  var TipoCampo: integer; var TamanhoMinimo: smallint;
  var TamanhoMaximo: smallint; pBuffer: PChar; TamMaxBuffer: integer;
  ContinuaNavegacao: integer): integer; far; stdcall;
  external 'CliSiTef32I.dll';

// *************************************
// Outras funções da DLL...
// *************************************
function LeCartaoInterativo(Mensagem: PChar): integer; far; stdcall;
  external 'CliSiTef32I.dll';
function VerificaPresencaPinPad: integer; far; stdcall;
  external 'CliSiTef32I.dll';
function CorrespondenteBancarioSiTefInterativo(CuponFiscal, DataFiscal, Horario,
  Operador, ParamAdic: PChar): integer; far; stdcall;
  external 'CliSiTef32I.dll';
function EscreveMensagemPermanentePinPad(Mensagem: PChar): integer; far;
  stdcall; external 'CliSiTef32I.dll';
function ObtemQuantidadeTransacoesPendentes(DataFiscal, NumeroCupon: PChar)
  : integer; far; stdcall; external 'CliSiTef32I.dll';
function ObtemVersao(VersaoCliSiTef, VersaoCliSiTefI: PChar): integer; far;
  stdcall; external 'CliSiTef32I.dll';

var
  DM: TDM;
  TemDAVAnexoII: Boolean;
  TemCupomMania: Boolean;
  TemMinasLegal: Boolean;

var
  iTipoEmpresa: integer;
  iCaixa: integer;
  iECF: integer;
  iEmp: integer;
  sCnpj: String;
  ICodUsu: integer;
  iTamDescCupom: integer;
  IGaveta: integer;
  ICasasDecimaisQuant: integer;

  iIndiceBalanca: integer;
  iBaud, iPorta: integer;

  iTipoVendaPrazo: integer;
  iAtrasoMaximo: integer;
  iDiasAtrazo: integer;
  iTabelaPreco: integer;
  iCodVend: integer;

  bMFD: boolean;
  bFechaForm: boolean;
  bTruncar: boolean;
  bTEF: boolean;
  bTEFCancelado: boolean;
  bPodeEncerrarVenda: boolean;
  bOFF: boolean;
  bCupomNaoFiscalAberto: boolean;
  bEstoqueNegativo: boolean;
  bExibeMensagensErro: boolean;
  TipoTEF: integer;
  IPServidor: string;
  TEFCancelado: boolean;

  sIPTEF: string;
  sIDLojaTEF: string;
  sIDTermTEF: string;
  sMensagemECF: string;
  sMD5: string;
  sLaudoPAFECF: string;

  dDataHoraVenda: TDateTime;

  cSaldoCliente: currency;

  PUsuario: String;
  PSenha: String;
  PArquivoVenda: String;
  NaoVerifica: Boolean;


  // VARIASVEIS USADO NATAL
  ColocaZerosEnter: Boolean;
  ColocaZerosNum: Integer;
  PQSempre: Boolean;
  TeclasSemQuantidade: Boolean;

  // procedure VerificaLicenca( modulo: integer;  var retorno: integer ); stdcall; external 'licencecontrol.dll';

const
  ListaArquivos: array [1 .. 3] of string = ( 'SLNFe.exe', 'SLPDV.exe', 'SLBalcao.exe');

implementation

uses
  USenha, Ubibli1, UPadraoPafEcf, UAtualizaEstoque, UPopUp, URegistrosdoPaf, 
  UStatusGerando, UFechamento, UCarrega, UStatus;

var
  sArquivo: TextFile;
  sNumeroSerie: string;
  sMemoria: string;
  sTipoECF: string;
  sMarcaECF: string;
  sModeloECF: string;
  sVersaoSB: string;
  sDataSB: string;
  sHoraSB: string;
  sNumECF: string;
  sCNPJUsuario: string;
  sIEUsuario: string;
  sIMUsuario: string;
  sRazaoUsuario: String;
  sNumeroUsuario: string;

function genkkey(ChavePublica: String; ChavePrivada: String): integer; stdcall;
  external 'sign_bema.dll';
function setLibType(Tipo: integer): integer; stdcall; external 'sign_bema.dll';
function generateEAD(NomeArq: String; ChavePublica: String;
  ChavePrivada: String; EAD: String; Sign: integer): integer; stdcall;
  external 'sign_bema.dll';
function validateFile(NomeArq: String; ChavePublica: String;
  ChavePrivada: String): integer; stdcall; external 'sign_bema.dll';

{$R *.dfm}

procedure TDM.onTempo(Sender: TObject);
begin
  PopUp.Top := PopUp.Top - 4;
  PopUp.BringToFront;
  if PopUp.Top <= ((Screen.Height - PopUp.Height) - tmAltura) then
  begin
    Tempo.Enabled := false;
    Tempo.Free;
  end;
end;


procedure TDM.MostraPopUp(Titulo: string; Mensagen: string; Financeiro: Boolean);
var
  tmRect: TRect;
  BarraIniciar: HWND; { Barra Iniciar }

begin
  // dd
  Application.CreateForm(TPopup, PopUp);
  Tempo := TTimer.Create(Self);
  Tempo.Enabled := false;
  Tempo.Interval := 20;
  Tempo.OnTimer := onTempo;
  // localiza o Handle da janela iniciar
  BarraIniciar := FindWindow('Shell_TrayWnd', nil);
  // Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(BarraIniciar, tmRect);
  tmAltura := tmRect.Bottom - tmRect.Top;
  PopUp.Top := Screen.Height - tmAltura;
  PopUp.Left := Screen.Width - PopUp.Width;
  PopUp.Titulo := Titulo;
  PopUp.Mensagen := Mensagen;
  Popup.Financeiro := Financeiro;
  PopUp.Show;
  Tempo.Enabled := True;

end;


procedure TDM.NFCeStatusChange(Sender: TObject);
begin
  case NFCe.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCCe :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEvento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Evento...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;

end;

procedure TDM.NovoNumeroNFCe(var NumeroNFCe, Serie: Integer;
  const Gravar: Boolean = false );
var
  GN, GS: Integer;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   DM.IBTransaction.StartTransaction;

   with DM.QConsulta do
      begin
         close;
         sql.Text := 'select * from CAIXA where cod_emp=:cod_emp' +
         ' and cod_cai=:cod_cai';
         ParamByName( 'cod_emp' ).AsInteger := iEmp;
         ParamByName( 'cod_cai' ).AsInteger := iCaixa;
         Open;
         NumeroNFCe := FieldByName('NFCE_NUMERO' ).AsInteger;
         Serie := FieldByName('NFCE_SERIE' ).AsInteger;
         close;
         if not Gravar then
            Exit;
         if NumeroNFCe = 999999999 then
            begin
               GN := 1;
               GS := Serie + 1;
            end
         else
            begin
                GN := NumeroNFCe + 1;
                GS := Serie;
            end;
         SQL.Text := 'update CAIXA set NFCE_SERIE=:SERIE, NFCE_NUMERO=:NUMERO' +
         ' where cod_emp=:cod_emp' +
         ' and cod_cai=:cod_cai';
         ParamByName( 'cod_emp' ).AsInteger := iEmp;
         ParamByName( 'SERIE' ).AsInteger := GS;
         ParamByName( 'cod_cai' ).AsInteger := iCaixa;
         ParamByName( 'NUMERO' ).AsInteger := GN;
         ExecOrOpen;
         Close;
      end;

   dm.IBTransaction.Commit;
//
end;

function TDM.UltimoCOOVendido: integer;
var
  iCodVenda: integer;
begin
  { busca o numero do COO da ultima venda }
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT MAX(COD_VEN) CODVEN ' + 'FROM VENDAS ' +
          'WHERE DATA_VEN = :DATA';
        Parambyname('data').AsDate := date;
        open;
        iCodVenda := fieldbyname('codven').AsInteger;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := 0;
      showmessage('Erro ao buscar o código da última venda');
    end;
  finally
    DM.QConsulta.close;
  end;

  if iCodVenda > 0 then
  begin
    if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
    DM.IBTransaction.StartTransaction;
    try
      try
        with DM.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text := 'SELECT CUPOM_FISCAL_VEN ' + 'FROM VENDAS ' +
            'WHERE COD_VEN = :CODVEN AND CANCELADA_VEN = 0';
          Parambyname('codven').AsInteger := iCodVenda;
          open;
          if fieldbyname('cupom_fiscal_ven').AsInteger > 0 then
            result := fieldbyname('cupom_fiscal_ven').AsInteger
          else
            result := -1;
        end;
        DM.IBTransaction.Commit;
      except
        DM.IBTransaction.Rollback;
        result := 0;
        showmessage('Erro ao buscar o COO da Venda');
      end;
    finally
      DM.QConsulta.close;
    end;
  end
  else
    result := 0;
end;

procedure TDM.CancelaVenda(const iCooVenda: integer);
var
  iCodVenda: integer;
begin
  { busca o código venda }
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT COD_VEN ' + 'FROM VENDAS ' +
          'WHERE CUPOM_FISCAL_VEN = :COO AND DATA_VEN = :DATA';
        Parambyname('coo').AsInteger := iCooVenda;
        Parambyname('data').AsDate := date;
        open;
        iCodVenda := fieldbyname('cod_ven').AsInteger;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      showmessage('Erro ao buscar o código da Venda');
    end;
  finally
    DM.QConsulta.close;
  end;

  if iCodVenda > 0 then
  begin
    if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
    DM.IBTransaction.StartTransaction;
    try
      try
        with DM.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text := 'UPDATE VENDAS ' + 'SET CANCELADA_VEN = 1 ' +
            'WHERE COD_VEN = :CODVEN';
          Parambyname('codven').AsInteger := iCodVenda;
          open;
        end;
        DM.IBTransaction.Commit;
      except
        DM.IBTransaction.Rollback;
        showmessage('Erro ao cancelar a Venda');
      end;
    finally
      DM.QConsulta.close;
    end;

    if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
    DM.IBTransaction.StartTransaction;
    try
      try
        with DM.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text := 'UPDATE ITENS_VENDA ' + 'SET VENDA_CANCELADA = 1 ' +
            'WHERE COD_VEN = :CODVEN';
          Parambyname('codven').AsInteger := iCodVenda;
          open;
        end;
        DM.IBTransaction.Commit;
      except
        DM.IBTransaction.Rollback;
        showmessage('Erro ao cancelar os itens da Venda');
      end;
    finally
      DM.QConsulta.close;
    end;
  end;
end;

function TDM.CarregaImagem(Arquivo: string): TJPEGImage;
var
   Bmp, BMp2: TBitmap;
   Jpg: TJPEGImage;
begin
  Bmp := TBitmap.Create;
  Bmp2 := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  Jpg.LoadFromFile( Arquivo );
  Bmp2.Assign( Jpg );
  try
    //r := Rect(0, 0, Screen.Width, Screen.Height);
    Bmp.Width := Round( ( BMp2.Width  * Pw ) / 100 );
    Bmp.Height := Round ( ( Bmp2.Height * Ph ) / 100 );
    // R2 := Rect( 0, 0,Larg - Col, Alt - Lin );
    SetStretchBltMode(Bmp.Canvas.Handle, HALFTONE);
    StretchBlt( Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, Bmp2.Canvas.Handle, 0, 0,
    Bmp2.Width,  Bmp2.Height, SRCCOPY);
    Result := TJPEGImage.Create;
    Result.Assign( Bmp );

    //Bild.Canvas.CopyRect(r, C, r);
  finally
    Bmp.Free;
    bmp := nil;
    Bmp2.Free;
    bmp2 := nil;
    Jpg.Free;
    Jpg := nil;

  end;
end;


procedure TDM.CarregaImagem2(Arquivo: string; var Img: TJPEGImage);
var
   Bmp, BMp2: TBitmap;
   Jpg: TJPEGImage;
begin
  Bmp := TBitmap.Create;
  Bmp2 := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  Jpg.LoadFromFile( Arquivo );
  Bmp2.Assign( Jpg );
  try
    //r := Rect(0, 0, Screen.Width, Screen.Height);
    Bmp.Width := Round( ( BMp2.Width  * Pw ) / 100 );
    Bmp.Height := Round ( ( Bmp2.Height * Ph ) / 100 );
    // R2 := Rect( 0, 0,Larg - Col, Alt - Lin );
    SetStretchBltMode(Bmp.Canvas.Handle, HALFTONE);
    StretchBlt( Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, Bmp2.Canvas.Handle, 0, 0,
    Bmp2.Width,  Bmp2.Height, SRCCOPY);
    Img.Assign( Bmp );

    //Bild.Canvas.CopyRect(r, C, r);
  finally
    Bmp.Free;
    bmp := nil;
    Bmp2.Free;
    bmp2 := nil;
    Jpg.Free;
    Jpg := nil;

  end;
end;

procedure TDM.ConfiguraNFCe;
var
  AuxB: Boolean;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   DM.IBTransaction.StartTransaction;
   DM.Danfcenaofiscal.MostrarPreview := False;
   DM.Danfcenaofiscal.Impressora := trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF', 'PORTA'));
   DanfceNaoFiscal.FastFile := ExtractFilePath( Application.ExeName ) + 'Report\DANFeNFCe.fr3';
   with dm.QConsulta do
      begin
         Close;
         SQL.Text := 'select * from parametros where cod_emp=:cod_emp';
         ParamByName( 'cod_emp' ).AsInteger := iEmp;
         Open;
         dm.NFCe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true;
         dm.NFCe.Configuracoes.Geral.AtualizarXMLCancelado := True;
         dm.NFCe.Configuracoes.Geral.FormaEmissao := teNormal;
         dm.NFCe.Configuracoes.Geral.Salvar       := True;
         dm.NFCe.Configuracoes.Arquivos.PathSalvar   := FieldByName( 'NFCE_PASTA_TRANSMITIDAS' ).AsString;

         dm.NFCe.Configuracoes.Arquivos.PathSchemas :=
            ExtractFilePath( Application.ExeName ) + '\Schemas\ve310';
         dm.NFCe.Configuracoes.Geral.ModeloDF := moNFCe;
         dm.NFCe.Configuracoes.Geral.VersaoDF := ve310;
         dm.NFCe.Configuracoes.Certificados.NumeroSerie := FieldByName( 'NUMERO_SERIE_CERTIFICADO').AsString;
         dm.NFCe.Configuracoes.Certificados.Senha := FieldByName( 'SENHA_CERTIFICADO' ).AsString;
         dm.NFCe.Configuracoes.WebServices.Ambiente := StrToTpAmb( AuxB, Inttostr( FieldByName( 'NFCE_AMBIENTE' ).AsInteger + 1  ));
         dm.NFCe.Configuracoes.WebServices.UF := FieldByName( 'ESTADO_NFE' ).AsString;
         dm.NFCe.Configuracoes.WebServices.Visualizar := False;
         dm.NFCe.Configuracoes.Geral.ExibirErroSchema := True;
         dm.NFCe.Configuracoes.Arquivos.SepararPorMes := True;
         DM.NFCe.Configuracoes.Arquivos.PathNFe :=  FieldByName( 'NFCE_PASTA_TRANSMITIDAS' ).AsString;
         DM.NFCe.Configuracoes.Arquivos.PathEvento :=  FieldByName( 'NFCE_PASTA_CANCELADAS' ).AsString;
         DM.NFCe.Configuracoes.Arquivos.PathInu :=  FieldByName( 'NFCE_PASTA_INUTILIZADAS' ).AsString;
//         DM.NFCe.Configuracoes.Arquivos.Pa :=  FieldByName( 'NFCE_PASTA_TRANSMITIDAS' ).AsString;
         if trim(FieldByName( 'NFCE_ID_TOKEN' ).AsString) <> '' then
            begin
               DM.NFCe.Configuracoes.Geral.IdCSC := trim(FieldByName( 'NFCE_ID_TOKEN' ).AsString);
               DM.NFCe.Configuracoes.Geral.CSC := trim(FieldByName( 'NFCE_TOKEN' ).AsString)
            end;
         Close;
      end;

   dm.IBTransaction.Commit;

end;


procedure TDM.CriaImg;
begin
   ImgTempCia := TJPEGImage.Create;

end;

function TDM.RetornaStringTabela(CampoRetorno: string; tabela: string;
  Campochave: string; ValorChave: integer; const Server: Boolean = False ): string;
begin
  if not Server  then
     begin
          if IBTransaction.Active then
            IBTransaction.Commit;
          IBTransaction.StartTransaction;
          with QConsulta do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT ' + CampoRetorno + ' FROM ' + tabela + ' WHERE ' +
              Campochave + ' = :cod');
            Parambyname('cod').AsInteger := ValorChave;
            open;
            result := fieldbyname(CampoRetorno).AsString;
          end;
          IBTransaction.Commit;
          QConsulta.close;
     end
  else
     begin
          if IBTRServer.Active then
            IBTRServer.Commit;
          IBTRServer.StartTransaction;
          with QConsultaServer do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT ' + CampoRetorno + ' FROM ' + tabela + ' WHERE ' +
              Campochave + ' = :cod');
            Parambyname('cod').AsInteger := ValorChave;
            open;
            result := fieldbyname(CampoRetorno).AsString;
          end;
          IBTRServer.Commit;
          QConsultaServer.close;
     end;
end;

function TDM.RetornaIntegerTabela(CampoRetorno: string; tabela: string;
  Campochave: string; ValorChave: integer): integer;
begin
  if IBTransaction.Active then
    IBTransaction.Commit;
  IBTransaction.StartTransaction;
  with QConsulta do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT ' + CampoRetorno + ' FROM ' + tabela + ' WHERE ' +
      Campochave + ' = :cod');
    Parambyname('cod').AsInteger := ValorChave;
    open;
    result := fieldbyname(CampoRetorno).AsInteger;
  end;
  IBTransaction.Commit;
  QConsulta.close;
end;

function TDM.RetiraPonto(Text: string): string;
var
  n: integer;
begin
  for n := 1 to length(Text) do
  begin
    if (Copy(Text, n, 1) = '.') or (Copy(Text, n, 1) = ',') then
      Delete(Text, n, 1);
  end;
  result := Text;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   R: Integer;
begin
//   VerificaLicenca( 2, R );
  // if not ( R in [ 0, 2, 3 ] ) then
    //  Halt;
  // Imagens
  NaoVerifica := False;
  TecladoBloqueado := False;
  Pw := ( Screen.Width * 100 ) /  WOriginal;
  Ph := ( Screen.Height * 100 ) /  HOriginal;
  FundoCaixa := ExtractFilePath( Application.ExeName ) + 'Skin\fundo.jpg';
  Fundotroco := ExtractFilePath( Application.ExeName ) + 'Skin\troco.jpg';
  FundoFechaVenda := ExtractFilePath( Application.ExeName ) + 'Skin\fechavenda.jpg';
  FundoCarrega := ExtractFilePath( Application.ExeName ) + 'Skin\carregando.jpg';
  FundoMenTef := ExtractFilePath( Application.ExeName ) + 'Skin\tef.jpg';
  FundoEntradaTef := ExtractFilePath( Application.ExeName ) + 'Skin\tefentrada.jpg';
  FundoMenuTef := ExtractFilePath( Application.ExeName ) + 'Skin\tefmenu.jpg';
  FundoBalanca := ExtractFilePath( Application.ExeName ) + 'Skin\balanca.jpg';
  FundoLogin := ExtractFilePath( Application.ExeName ) + 'Skin\login.jpg';
  LogoRestaurante := ExtractFilePath( Application.ExeName ) + 'Skin\logores.jpg';
  ////////////////////


  PastaArqVends := '';
   Cortar := false;
  BuscaParametrosConf;
  ArquivoAntigo := TStringList.Create.Create;
  ArquivoAntigo.Clear;
  ArquivoNovo := TStringList.Create.Create;
  ArquivoNovo.Clear;
  FormatSettings.ThousandSeparator := '.';
  FormatSettings.DecimalSeparator := ',';
  if FileExists(ExtractFilePath(Application.ExeName) + 'SLPDvGen.txt') then
  begin
    MD5LIDO := PAF.EAD.MD5FromFile(ExtractFilePath(Application.ExeName) +
      'SLPDvGen.txt');
    ArquivoAntigo.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'SLPDvGen.txt');
  end;
  ErroArquivoAuxiliar := False;
  try
     ACBrAAC1.AbrirArquivo;
  except
     KDialog( 'Erro no arquivo Auxiliar', 'SLPDv- Informação', 'ERRO' );
     ErroArquivoAuxiliar := True;
  end;
  TEFCancelado := False;

  bExibeMensagensErro := true;

  ColocaZerosEnter := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'COLOCAZEROS')) = 'S';
  PQSempre := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'PQSEMPRE')) = 'S';
  TeclasSemQuantidade := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'TECLAS_SEM_QUANTIDADE')) = 'S';
  GravaIni( GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'TECLAS_SEM_QUANTIDADE', IfThen( TeclasSemQuantidade, 'S', 'N'  ) ) ;
  GravaIni( GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'PQSEMPRE', IfThen( PQSempre, 'S', 'N'  ) ) ;

  if ColocaZerosEnter then
     begin
        ColocaZerosNum := strtoint(trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
          'NUMZEROS')));
     end
  else
     ColocaZerosNum := 0;


  if strtoint(trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
    'OFFLINE'))) = 0 then
    bOFF := true
  else
    bOFF := False;

  bCupomNaoFiscalAberto := False;
  sMensagemECF := 'Função não Suportada pelo Modelo de ECF utilizado';


  try
    IBDatabase.Connected := False;
    IBDatabaseServer.Connected := False;
    if bOFF then
    begin
        IBDatabase.Params.Values[ 'Database' ] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
          'CaminhoBancoPAF'));
        IBDatabaseServer.Params.Values[ 'Database' ] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
          'CaminhoBancoServer'));
        IBDatabaseServer.Params.Values['Server'] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
                'SERVIDOR'));
        IBDatabaseServer.Params.Values['Port'] := '3050';
    end
    else
    begin
        IBDatabase.Params.Values[ 'Database' ] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
        'CaminhoBancoServer'));
        IBDatabaseServer.Params.Values['Server'] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
                'SERVIDOR'));
        IBDatabaseServer.Params.Values['Port'] := '3050';
        IBDatabaseServer.Params.Values[ 'Database' ] := trim(LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
        'CaminhoBancoServer'));
    end;


    IBDatabase.Connected := true;
    IBDatabaseServer.Connected := true;
  except
  end;
  dm.ECF.IgnorarTagsFormatacao := (IfThen( dm.LeIni(GetCurrentDir + '\PafEcf.ini',
    'ECF', 'TAGS') = 'S', 'S', 'N' ) = 'S' );
  iCaixa := strtoint(trim(DM.LeIni(GetCurrentDir + '\PafEcf.ini',
    'ConfiguracaoLocal', 'Caixa')));
  iEmp := strtoint(trim(DM.LeIni(GetCurrentDir + '\PafEcf.ini',
    'ConfiguracaoLocal', 'Empresa')));

  PastaArqVends := trim( DM.LeIni(GetCurrentDir + '\PafEcf.ini',
    'ConfiguracaoLocal', 'PastaArqVendas') );

  if ( PUsuario <> '' ) and ( PSenha <> '' ) then
     AbreSemSenha
  else
     begin
        Application.CreateForm(TFrmSenha, FrmSenha);
         FrmSenha.showmodal;
     end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin

  IBDatabase.Connected := False;
end;

procedure TDM.DestroyImg;
begin
   if Assigned( ImgTempCia ) then
      begin
          ImgTempCia.Free;
          ImgTempCia := nil;
      end;
end;

Function TDM.LeIni(sArqIni: string; sSecao: string; sVariavel: string): string;
var
  ArqIni: tIniFile;
var
  sString: string;
begin
  ArqIni := tIniFile.Create(sArqIni);
  Try
    result := ArqIni.ReadString(sSecao, sVariavel, sString);
  Finally
    ArqIni.Free;
  end;
end;

procedure TDM.GravaIni(sArqIni: string; sSecao: string; sVariavel: string;
  sValor: string);
var
  ArqIni: tIniFile;
begin
  ArqIni := tIniFile.Create(sArqIni);
  try
    ArqIni.WriteString(sSecao, sVariavel, sValor);
  finally
    ArqIni.Free;
  end;
end;

procedure TDM.GravaReducaoZAutomatica;
var
   DadosZ: AnsiString;
   AIni : TMemIniFile ;
   AStr : TStringList ;
   COOINIStr: String;
   dDataMovimento: TDateTime;
   Servidor : Boolean;
begin
//
  frmStatusGerando.pnl1.Caption := 'Buscando Ultima Redução Z';
  frmStatusGerando.Show;
  frmStatusGerando.BringToFront;
   try
       DadosZ := dm.ecf.DadosUltimaReducaoZ;
   except
       frmStatusGerando.Close;
       NaoVerifica := True;
       Exit;
   end;

  Servidor := false;

  Application.ProcessMessages;
   AStr := TStringList.Create;
   AIni := TMemIniFile.Create( 'DadosUltimaReducaoZ.ini' ) ;
   AStr.Text := DadosZ;
   Aini.SetStrings( AStr );
   if FileExists( 'C:\PAF_ECF\MAPARESUMO.INI' ) then
      begin
         COOINIStr := dm.LeIni(
              'C:\PAF_ECF\MAPARESUMO.INI', 'MAPARESUMO', 'COOINICIAL' )
      end
   else
      COOINIStr := '0';
   Aini.WriteString( 'ECF', 'COOINICIAL_MAPA', COOINIStr );
  frmStatusGerando.pnl1.Caption := 'Gravando Mapa Resumo';
  frmStatusGerando.Show;
  frmStatusGerando.BringToFront;
  Application.ProcessMessages;

   dDataMovimento := StrToDate( Aini.ReadString( 'ECF', 'DataMovimento', DateToStr( Date ) ) );
   MapaResumoAutomatico( iECF, Aini);
  frmStatusGerando.pnl1.Caption := 'Verificando servidor';
  frmStatusGerando.Show;
  frmStatusGerando.BringToFront;
  Application.ProcessMessages;
          if DM.IBDatabaseServer.Connected then
            Servidor := True
         else
            begin
               try
                  DM.IBDatabaseServer.Connected := True;
                  Servidor := True;
               except
                  Servidor := False;
               end;
            end;
         if Servidor then
         Application.CreateForm( TFrmFechamento, frmFechamento );
         if iECF < 99 then
            begin
                  begin
                     if dDataMovimento < date then
                        begin
                            frmStatusGerando.pnl1.Caption := 'Cancelando Pré-Vendas';
                            Application.ProcessMessages;
                           frmFechamento.CancelarPreVenda(date -2);
                        end;
                  end;
            end;

         Application.ProcessMessages;
         if Servidor then
         if iECF < 99 then
            begin
                   frmStatusGerando.pnl1.Caption := 'Gerencial Mesas Abertas';
                   Application.ProcessMessages;
                   frmFechamento.GerencialMesasAbertas;
            end;
         if Servidor then
         if iECF < 99 then
            begin
                  begin
                     if dDataMovimento < date then
                        begin
                            frmStatusGerando.pnl1.Caption := 'Cancelando Mesas';
                            Application.ProcessMessages;
                           frmFechamento.CancelaContas(date -2);
                        end;
                  end;
            end;
         FreeAndNil( FrmFechamento );
   frmStatusGerando.Close;
   Aini.Free;
end;

function TDM.BuscaCodigoProduto(const sCodBarra: string): integer;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT COD_PRO ' + 'FROM PRODUTO ' +
          'WHERE CODIGO_BARRA_PRO = :CODBAR');
        Parambyname('codbar').AsString := trim(sCodBarra);
        open;
        if IsEmpty then
            begin
               Result := 0;
            end
        else
            result := fieldbyname('cod_pro').AsInteger;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      showmessage('Erro ao buscar o código do produto');
      result := 0;
    end;
  finally
    DM.QConsulta.close;
  end;
end;

function TDM.BuscaCor(Arquivo: string ;X, Y: Integer ): TColor;
var
   Bmp: TBitmap;
begin
    try
        Bmp := TBitmap.Create;
        DM.CriaImg;
        CarregaImagem2( Arquivo, ImgTempCia );
        Bmp.Assign( ImgTempCia );
        DestroyImg;
        Result := Bmp.Canvas.Pixels[ X, Y ];

    finally
        Bmp.Free;
        Bmp := nil;
    end;
  //  Jpg.Free;
end;

function TDM.TotalizaProdutos(sTipo: string; iCodVenda: integer): currency;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  with DM.QConsulta do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM((QUANT * VALOR) - DESCONTO) TOTAL ' +
      'FROM ITENS_VENDA ' +
      'WHERE COD_VEN = :CODVEN AND PRODUTO_PROMOCAO = :PROMOCAO');
    Parambyname('codven').AsInteger := iCodVenda;
    Parambyname('promocao').AsString := sTipo;
    open;
    result := fieldbyname('total').AsCurrency;
  end;
  DM.IBTransaction.Commit;
  DM.QConsulta.close;
end;

procedure TDM.EAD1GetChavePrivada(var Chave: AnsiString);
begin
  Chave := '-----BEGIN RSA PRIVATE KEY-----' + sLineBreak +
    'MIICXQIBAAKBgQDU5OKg4YNshwBvOYE8iK9sIyWSPuYsPfRgCNLLb70lg4YS1PmN' + sLineBreak +
    'inbEKgNOD5eN5LBiu25cjTSZl7kizOtCgvKN3Smzyj+5qErozjnozDHIMj+SK4B+' + sLineBreak +
    'srzKYW2hWzUUtc+Oh24tXey9C4Mg2oMSVBANQpeA75zUOTY/D0SBkHp5pQIDAQAB' + sLineBreak +
    'AoGAMUQeZdiKD01WfmayT43Z+o5PnX5MyaQ0rxybm1RqUwoStrzuWyDVxyNpzGCz' + sLineBreak +
    'U7S+VLrHGUfcCkcgIruFHckr09hzQKjvEiYWzr5iGaTi8tRuamk4n7Qrbz8MaaYR' + sLineBreak +
    'HO5vyXeK1CbjFhdd6MGYbAGMe6mTlWKxDga1VpgJ7u65KukCQQDqtLAGqev0iBij' + sLineBreak +
    'i8LImO+O6uDirTMygJegyq1QG7VRBdCO9/7YHeFaZD/CMMCbLhqePOIke0L7mwJD' + sLineBreak +
    'LnfmY1fvAkEA6DWYXwT9YpYijdojD2/MmKRIoq0hfYyFwm56mf29hf7ZBf6K3D7s' + sLineBreak +
    'h8PTxK3H8wIzoOOzyZIcMx4rY0DUJOgTqwJAPW/MwAHMvPa/FFhqRV4bHxsGgO97' + sLineBreak +
    'flXA2xsSoOyP2sSd4j6yW9n+ek3RjsB6OmSoHRGs1IXbc8cQoYtRYWJRywJBALB6' + sLineBreak +
    'iyMsF6clk31bm+nPfh9EPC/mhN12PvJWJLeEMNX1qdr0aXSaHgnQutFvgdcehT5x' + sLineBreak +
    'z+ISOXxgIXl9e73Q46ECQQDD1EoXRgZ5/utSfo48udPhQ1e2ITXInBnTpCvv+O+g' + sLineBreak +
    'wsXc7xWE0WzQbehiXZanEYu63ceijx+Qtc28t5CZ4zW9' + sLineBreak +
    '-----END RSA PRIVATE KEY-----';

end;

procedure TDM.EAD1GetChavePublica(var Chave: AnsiString);
begin
  Chave := '-----BEGIN PUBLIC KEY-----' + sLineBreak +
    'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDU5OKg4YNshwBvOYE8iK9sIyWS' + sLineBreak +
    'PuYsPfRgCNLLb70lg4YS1PmNinbEKgNOD5eN5LBiu25cjTSZl7kizOtCgvKN3Smz' + sLineBreak +
    'yj+5qErozjnozDHIMj+SK4B+srzKYW2hWzUUtc+Oh24tXey9C4Mg2oMSVBANQpeA' + sLineBreak +
    '75zUOTY/D0SBkHp5pQIDAQAB' + sLineBreak +
    '-----END PUBLIC KEY-----';
end;

procedure TDM.ECFAntesAbreCupom(const CPF_CNPJ, Nome, Endereco: string);
begin
//  DM.VerificaEstoqueDia(0);
end;

procedure TDM.ECFAntesAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
begin
  DM.VerificaEstoqueDia(0);

end;

procedure TDM.ECFAntesAbreRelatorioGerencial(const Indice: integer);
begin
  DM.VerificaEstoqueDia(0);

end;

procedure TDM.ECFAntesLeituraX(Sender: TObject);
begin
  ECF.NaoFiscalImprime := False;
  DM.VerificaEstoqueDia(0);
end;

procedure TDM.ECFAntesReducaoZ(Sender: TObject);
begin
  ECF.NaoFiscalImprime := False;
  if FrmFechamento <> nil then
     if FrmFechamento.Showing then
        begin
           FrmFechamento.StatusBar.SimpleText:= 'Gravando totalizadores...';
           Application.ProcessMessages;
        end;

  GravaTotalizadoresAntesZ;
  if FrmFechamento <> nil then
     if FrmFechamento.Showing then
        begin
           FrmFechamento.StatusBar.SimpleText:= 'Emitindo Resdução Z...';
           Application.ProcessMessages;
        end;

end;

procedure TDM.ECFDepoisAbreCupomVinculado(Sender: TObject);
begin
  GravaOutrosDocumentos('CC');
end;

procedure TDM.ECFDepoisAbreNaoFiscal(const CPF_CNPJ, Nome, Endereco: string);
begin
//  GravaOutrosDocumentos('CN');

  Cortar := True;
end;

procedure TDM.ECFDepoisAbreRelatorioGerencial(const Indice: integer);
begin
  GravaOutrosDocumentos('RG');
  Cortar := True;
end;

procedure TDM.ECFDepoisCancelaNaoFiscal(Sender: TObject);
begin
  GravaOutrosDocumentos('NC');
end;

procedure TDM.ECFDepoisFechaNaoFiscal(const Observacao: AnsiString;
  const IndiceBMP: Integer);
begin

   if Cortar then
      begin
         Cortar_papel;
         Cortar := false;
      end;
end;

procedure TDM.ECFDepoisFechaRelatorio(Sender: TObject);
begin
   if Cortar then
      begin
         Cortar_papel;
         Cortar := false;
      end;
end;

procedure TDM.ECFDepoisLeituraX(Sender: TObject);
begin
  ECF.NaoFiscalImprime := True;
end;

procedure TDM.ECFDepoisReducaoZ(Sender: TObject);
begin
  ECF.NaoFiscalImprime := True;
end;

procedure TDM.ECFMsgPoucoPapel(Sender: TObject);
begin
  DM.tag := 0;
  if not dm.TecladoBloqueado then
       KDialog('Detectado pouco papel!', 'SLPDV - Aviso!', 'INFO')
  else
  begin
      Exit;
  end;
end;

procedure TDM.AbreSemSenha;
const
  AchaModelo: array [0 .. 15] of TACBrECFModelo = (ecfNenhum, ecfNaoFiscal,
    ecfBematech, ecfSweda, ecfDaruma, ecfSchalter, ecfMecaf, ecfYanco,
    ecfDataRegis, ecfUrano, ecfICash, ecfQuattro, ecfFiscNET, ecfEpson, ecfNCR,
    ecfSwedaSTX);
var
  MODELO: integer;
  Porta: String;
  TimeOut: integer;
  Intervalo: integer;
  Linhas: integer;
  Velocidade: String;
  dData: TDate;
begin

    iEmp := StrToInt( trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
          'Empresa')));
    if iEmp <= 0 then
       begin
          ShowMessage( 'Empresa não configurada!');
          Application.Terminate;
          Exit;
       end;

    if dm.IBTransaction.Active then
       dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    dm.QConsulta.Close;
    DM.QConsulta.SQL.Text := 'select RAZAO_EMP from empresa where COD_EMP=:codemp';
    dm.QConsulta.ParamByName( 'codemp' ).AsInteger := iEmp;
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
       begin
          Kdialog( 'Empresa não cadastrada' , 'SLPDV - Empresa', 'ERRO' );
          Application.Terminate;
          Exit;
       end;
   FrmPadraoPafECf.sb.Panels[3].Text:= dm.QConsulta.FieldByName( 'RAZAO_EMP' ).AsString;
   dm.QConsulta.Close;
   DM.IBTransaction.Commit;
  try

    MODELO := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'MODELO')));
    Porta := trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF', 'PORTA'));
    TimeOut := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'TIMEOUT')));
    Intervalo := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'INTERVALO')));
    Linhas := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'LINHAS')));
    Velocidade := trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'VELOCIDADE'));

    if MODELO < 2  then
       begin
          KDialog( 'Proibido o uso de impressora não fiscal!' , 'SLPDV - restrição', 'ERRO' );
           ErroImpressora := true;
          iECF := 99;
       end;
    dm.ECF.MODELO := AchaModelo[MODELO];
    dm.ECF.Porta := Porta;
    dm.ECF.TimeOut := TimeOut;
    dm.ECF.IntervaloAposComando := Intervalo;
    dm.ECF.MaxLinhasBuffer := Linhas;
    dm.ECF.Device.ParamsString := Velocidade;
    // dm.ECF.Device.ParamsString := trim(dm.LeIni(GetCurrentDir +  '\PafEcf.ini', 'ECF', 'SerialParams'));
  //  hide;
    Sleep(200);
    Application.CreateForm(TfrmCarrega, frmCarrega);
    frmCarrega.Show;

    FrmCarrega.Men.Caption := 'Gerando MD5';
    Application.ProcessMessages;
    dm.Gera_RegistroN;
    Sleep( 200 );
    FrmCarrega.Men.Caption := 'MD5 gerado com sucesso';
    Application.ProcessMessages;
    Sleep( 200 );
    if MODELO > 1 then
    begin
    FrmCarrega.Men.Caption := 'Localizando Impressora';
    Application.ProcessMessages;
    ErroImpressora := false;
    dm.ECF.Ativar;
    Application.ProcessMessages;
    FrmCarrega.Men.Caption := 'Fim da Localização';
    Sleep(300);
    Application.ProcessMessages;
    end;
    frmCarrega.close;
    dm.ECF.IdentificaPAF( '', '' );


  except
    on E: Exception do
    begin
      Application.MessageBox(pwidechar(E.Message),
        'Erro ao inicializar a impressora', mb_applmodal + mb_iconerror);
      ErroImpressora := true;
      iECF := 99;
    end;
  end;

  try
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    with dm.QConsulta do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM USUARIO ' + 'WHERE NOME_USU = :USUARIO');
      Parambyname('USUARIO').AsString := trim(PUsuario);
      Open;
      if not(fieldbyname('cod_usu').IsNull) then
      begin
        if PSenha = trim(fieldbyname('SENHA_USU').AsString) then
        begin
          ICodUsu := fieldbyname('cod_usu').AsInteger;
          FrmPadraoPafECf.SB.Panels[1].text := fieldbyname('NOME_USU').AsString;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;


        end
        else
        begin
          dm.IBTransaction.Rollback;
          dm.QConsulta.close;
          showmessage('Senha Inválida');
        //  Edtsenha.SetFocus;

          exit;
        end;
      end
      else
      begin
        showmessage('Usuário não Cadastrado');

      end;
      //dm.IBTransaction.Commit;
    end;
  except
    dm.IBTransaction.Rollback;
    showmessage('Erro ao Selecionar o Usuário');
    Halt;
  end;

end;
procedure TDM.ACBrAAC1GetChave(var Chave: AnsiString);
begin
  Chave := 'kadoshiautomacao4525';
end;

procedure TDM.AssinaturaDigital(sArquivo: string);
var
  sChavePrivada: string;
  sChavePublica: string;
  iRetornoDLL: integer;
  sEAD: string;
  cont: integer;
begin
  { cNomeArquivo: Variável STRING com o cominho+nome do arquivo que será usado na geração do registro EAD.
    cChavePublica: Variável STRING com a chave pública gerada.
    cChavePrivada: Variável STRING com a chave privada gerada.
    cRegistroEAD: Variável STRING com o tamanho de 256 bytes para receber o registro EAD criado
    iGrava: Variável INTEGER para indicar se o registro EAD será ou não incluído ao final do arquivo informado, onde:
    0: não incluir.
    1: incluir. }

  DM.ECF.AssinaArquivoComEAD(sArquivo);

end;

procedure TDM.GravaArquivosPAF(const sArquivoOrigem: string;
  const sArquivoDestino: string);
var
  ArqOrigem: TextFile;
  ArqDestino: TextFile;
  sAux: string;
begin
  { Lendo arquivo origem e gravando no destino }
  { AssignFile(ArqOrigem,  sArquivoOrigem);
    AssignFile(ArqDestino, sArquivoDestino);
    Reset(ArqOrigem);
    Rewrite(ArqDestino);

    while not Eof(ArqOrigem) do
    begin
    ReadLn(ArqOrigem, sAux);
    writeln(ArqDestino, sAux);
    end;
    CloseFile(ArqOrigem);
    CloseFile(ArqDestino);

    { EAD - Assinatura Digital }

end;

procedure TDM.AtualizaEstoque( tag: integer);
var
  bServidorAtivo: boolean;
  i: integer;
  EstavaAberta: boolean;
begin
   ListaThreads.Start( [
      procedure
      begin
          TThread.Synchronize( nil,
                     procedure
                        begin
                          if frmAtualizaEstoque = nil then
                            Application.CreateForm(TfrmAtualizaEstoque, frmAtualizaEstoque);
                          if not frmAtualizaEstoque.Showing then
                            frmAtualizaEstoque.Show;
                          frmAtualizaEstoque.PBEstoque.Refresh;
                        end
                     );
          bServidorAtivo := true;
          if not DM.IBDatabaseServer.Connected then
            if bOFF then
            begin
              try
                DM.IBDatabaseServer.Connected := False;
;
;
                DM.IBDatabaseServer.Connected := true;
                bServidorAtivo := true;
              except
                DM.IBDatabaseServer.Connected := False;
                bServidorAtivo := False;
                TThread.Synchronize( nil,
                procedure begin showmessage('Estoque não atualizado. Servidor Inativo');end);
              end;
            end;

          if (bOFF) and (bServidorAtivo) then
          begin
            { atualiza o estoque }
            { zerando  o estoque }
            if DM.IBTransaction.Active then
              DM.IBTransaction.Commit;
            DM.IBTransaction.StartTransaction;
            try
              try
                with DM.QConsulta do
                begin
                  close;
                  sql.Clear;
                  sql.Text :=
                    'UPDATE ESTOQUE SET ESTOQUE = 0, ESTOQUE_INICIAL=0 WHERE COD_EMP = :CODEMP';
                  Parambyname('codemp').AsInteger := iEmp;
                  ExecOrOpen;
                end;
             //   DM.IBTransaction.Commit;
              except
              //  DM.IBTransaction.Rollback;
                TThread.Synchronize( nil,
                procedure begin showmessage('Erro ao zerar o estoque');end );
              end;
            finally
              DM.QConsulta.close;
            end;

            { lendo estoque do servidor }
            EstavaAberta := False;
            if not IBTRServer.Active then
            begin
              if DM.IBTRServer.Active then
                DM.IBTRServer.Commit;
              DM.IBTRServer.StartTransaction;
            end
            else
              EstavaAberta := true;
            with QEstoqueServer do
            begin
              close;
              Parambyname('codemp').AsInteger := iEmp;
              open;
              last;
              TThread.Synchronize( nil,
                         procedure
                            begin
                               frmAtualizaEstoque.PBEstoque.Min := 0;
                               frmAtualizaEstoque.PBEstoque.Max := RecordCount;
                            end
                         );

              i := 1;
              First;
              TRY
                    while not eof do
                    begin
                      TThread.Synchronize( nil,
                                 procedure
                                    begin
                                       frmAtualizaEstoque.PBEstoque.position := i;
                                    end
                                 );
                      inc(i);

                      DM.InsertEstoque(QEstoqueServerESTOQUE.AsCurrency,
                        QEstoqueServerCOD_PRO.AsInteger, iEmp,
                        QEstoqueServerCODIGO_LOCAL_ESTOQUE.AsInteger, tag);
                      next;
                    end;
              except
                  TThread.Synchronize( nil,
                  procedure begin showmessage('Erro ATUALIZANDO estoque');end );
              end;
            end;
            if not EstavaAberta then
              DM.IBTRServer.Commit;
            QEstoqueServer.close;

            { gravando a data do estoque na tabela parametros }
            if DM.IBTransaction.Active then
              DM.IBTransaction.Commit;
            DM.IBTransaction.StartTransaction;
            try
              try
                with DM.QConsulta do
                begin
                  close;
                  sql.Clear;
                  sql.Text := 'UPDATE PARAMETROS ' +
                    'SET DATA_ATUALIZACAO_ESTOQUE = :DATA, HORA_ATUALIZACAO_ESTOQUE=:HORA '
                    + 'WHERE COD_EMP = :CODEMP';
                  Parambyname('codemp').AsInteger := iEmp;
                  Parambyname('data').AsDate := date;
                  Parambyname('hora').Astime := time;
                  ExecOrOpen;
                end;
                DM.IBTransaction.Commit;
              except
                DM.IBTransaction.Rollback;
                 TThread.Synchronize( nil,
                procedure begin showmessage('Erro ao zerar o estoque'); end);
              end;
            finally
              DM.QConsulta.close;
            end;
          end;
          TThread.Synchronize( nil,
                     procedure
                        begin
                          if Assigned( frmAtualizaEstoque ) then
                            begin
                                frmAtualizaEstoque.Close;
                            end;
                        end
                     );
      end
      ]
      );
  { verificando se o servidor esta ativo }
end;

procedure TDM.AuxTipo_RAfterConnect(Sender: TObject);
begin
  if TRAuxTipo_R.Active then
    TRAuxTipo_R.Commit;
  TRAuxTipo_R.StartTransaction;
  CONTEXTO_R.Parambyname('USU').AsString := sNomeUsuario;
  CONTEXTO_R.Parambyname('EMP').AsInteger := iEmp;
  CONTEXTO_R.Parambyname('APP').AsString := 'KPDVKAKA4525';
  CONTEXTO_R.ExecOrOpen;
  TRAuxTipo_R.Commit;
end;

function TDM.UpdateEstoque(const cEstoque: currency;
  const iCodProduto, iEmpresa, iLocal, tag: integer): integer;
begin
//  if DM.IBTransaction.Active then
 //   DM.IBTransaction.Commit;
 // DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        if tag = 0 then
          sql.Text := 'UPDATE ESTOQUE ' +
            'SET ESTOQUE_INICIAL=:ESTOQUE_INICIAL, ESTOQUE = :ESTOQUE, DATA_ESTOQUE = :DATA '
            + 'WHERE COD_PRO = :CODPRO AND CODIGO_LOCAL_ESTOQUE = :LOCAL AND COD_EMP = :CODEMP'
        else
          sql.Text := 'UPDATE ESTOQUE ' +
            'SET ESTOQUE = :ESTOQUE, DATA_ESTOQUE = :DATA ' +
            'WHERE COD_PRO = :CODPRO AND CODIGO_LOCAL_ESTOQUE = :LOCAL AND COD_EMP = :CODEMP';
        Parambyname('codpro').AsInteger := iCodProduto;
        Parambyname('codemp').AsInteger := iEmpresa;
        Parambyname('estoque').AsCurrency := cEstoque;
        if tag = 0 then
          Parambyname('estoque_inicial').AsCurrency := cEstoque;
        Parambyname('data').AsDate := date;
        Parambyname('local').AsInteger := iLocal;
        ExecOrOpen;
      end;
    //  DM.IBTransaction.Commit;
      result := 1;
    except
      result := 0;
     // DM.IBTransaction.Rollback;
    end;
  finally
    DM.QConsulta.close;
  end;
end;

function TDM.InsertEstoque(const cEstoque: currency;
  const iCodProduto, iEmpresa, iLocal, tag: integer): integer;
begin
 // if DM.IBTransaction.Active then
  //  DM.IBTransaction.Commit;
 // DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        if tag = 0 then
          sql.Text :=
            'UPDATE OR INSERT INTO ESTOQUE (COD_PRO, ESTOQUE, DATA_ESTOQUE, COD_EMP, CODIGO_LOCAL_ESTOQUE, ESTOQUE_INICIAL) '
            + 'VALUES(:CODPRO, :ESTOQUE, :DATA, :CODEMP, :LOCAL,:ESTOQUE_INICIAL) macthing( COD_PRO, COD_EMP )'
        else
          sql.Text :=
            'UPDATE OR INSERT INTO ESTOQUE (COD_PRO, ESTOQUE, DATA_ESTOQUE, COD_EMP, CODIGO_LOCAL_ESTOQUE) '
            + 'VALUES(:CODPRO, :ESTOQUE, :DATA, :CODEMP, :LOCAL) macthing( COD_PRO, COD_EMP )';
        Parambyname('codpro').AsInteger := iCodProduto;
        Parambyname('codemp').AsInteger := iEmpresa;
        Parambyname('estoque').AsCurrency := cEstoque;
        if tag = 0 then
          Parambyname('estoque_inicial').AsCurrency := cEstoque;
        Parambyname('data').AsDate := date;
        Parambyname('local').AsInteger := iLocal;
        ExecOrOpen;
      end;
  //    DM.IBTransaction.Commit;
      result := 1;
    except
      result := 0;
   //   DM.IBTransaction.Rollback;
    end;
  finally
    DM.QConsulta.close;
  end;
end;

procedure TDM.TabelaPreco(codtpv: integer);
begin
  if DM.IBTRServer.Active then
    DM.IBTRServer.Commit;
  DM.IBTRServer.StartTransaction;
  with DM.QConsulta do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT TABELA_PRECO_TPV ' + 'FROM TIPO_VENDA ' +
      'WHERE COD_TPV = :COD');
    Parambyname('cod').AsInteger := codtpv;
    open;
    if trim(fieldbyname('tabela_preco_tpv').AsString) = 'P' then
      iTabelaPreco := 1
    else
      iTabelaPreco := 0;
  end;
  DM.IBTRServer.Commit;
  DM.QConsulta.close;
end;

procedure TDM.IBDatabaseAfterConnect(Sender: TObject);
begin
   if not bOff then
      Exit;

  if IBTransaction.Active then
    IBTransaction.Commit;
  IBTransaction.StartTransaction;
  CONTEXTO.Parambyname('USU').AsString := sNomeUsuario;
  CONTEXTO.Parambyname('EMP').AsInteger := iEmp;
  CONTEXTO.Parambyname('APP').AsString := 'KPDVKAKA4525';
  CONTEXTO.ExecOrOpen;
  IBTransaction.Commit;
end;


procedure TDM.ImprimeConfiguracaoPAF;
var
    Relatorio: TStrings;
    TamColSimNao: Integer;
    TamColDescr: Integer;

  function GetDescrFlag(const ALigado: Boolean): String;
  begin
    Result := IfThen(ALigado, ': S', ': N');
  end;

  function GetTipoIntegracao(const ATipo: TACBrPAFTipoIntegracao): String;
  begin
    case ATipo of
      tpiRetaguarda: Result := ': Retaguarda';
      tpiPED:        Result := ': Sistema PED';
      tpiAmbos:      Result := ': Ambos';
      tpiNaoIntegra: Result := ': Não Integrado';
    end;

  end;

  function GetTipoDesenvolvimento(const ATipo: TACBrPAFTipoDesenvolvimento): String;
  begin
    case ATipo of
      tpdComercializavel:       Result := ': Comercializável';
      tpdExclusivoProprio:      Result := ': Exclusivo-Próprio';
      tpdExclusivoTerceirizado: Result := ': Exclusivo-Terceirizado';
    end;
  end;

  function GetTipoFuncionamento(const ATipo: TACBrPAFTipoFuncionamento): String;
  begin
    case ATipo of
      tpfStandAlone:     Result := ': Stand-Alone';
      tpfEmRede:         Result := ': Em Rede';
      tpfParametrizavel: Result := ': Parametrizável';
    end;
  end;

begin
   if not  VerificaNumeroSerie then
       exit;
  TamColSimNao := ECF.Colunas - 3;
  TamColDescr  := ECF.Colunas - 25;
   Relatorio := TStringList.Create;
   Relatorio.Clear;
    Relatorio.Add('</linha_dupla>');
    Relatorio.Add('<ce>PARÂMETROS DE CONFIGURAÇÃO</ce>');
    Relatorio.Add('</linha_dupla>');
    Relatorio.Add('');
      Relatorio.Add(QuebraLinhas(
        'Todas as parametrizações relacionadas neste relatório são de ' +
        'configuração inacessível ao usuário do PAF-ECF.',
        ECF.Colunas)
      );
      Relatorio.Add(QuebraLinhas(
        'A ativação ou não destes parâmetros é determinada pela unidade ' +
        'federada e somente pode ser feita pela intervenção da empresa ' +
        'desenvolvedora do PAF-ECF.',
        ECF.Colunas)
      );
      Relatorio.Add('');
      Relatorio.Add('<n>IDENTIFICAÇÃO E CARACTERISTICAS DO</n>');
      Relatorio.Add('<n>PROGRAMA APLICATIVO FISCAL</n>');
      Relatorio.Add('</linha_simples>');
      Relatorio.Add(padLeft('Nome Comercial', TamColDescr, '.')    + ': ' + ECF.AAC.IdentPAF.Paf.Nome);
      Relatorio.Add(padLeft('Versão', TamColDescr, '.')            + ': ' + ECF.AAC.IdentPAF.Paf.Versao);
      Relatorio.Add(padLeft('Ling. Programação', TamColDescr, '.') + ': ' + ECF.AAC.IdentPAF.Paf.Linguagem);
      Relatorio.Add(padLeft('Sist. Operacional', TamColDescr, '.') + ': ' + ECF.AAC.IdentPAF.Paf.SistemaOperacional);
      Relatorio.Add(padLeft('Banco de Dados.', TamColDescr, '.')   + ': ' + ECF.AAC.IdentPAF.Paf.BancoDados);

      Relatorio.Add('');
      Relatorio.Add('<n>FUNCIONALIDADES</n>');
      Relatorio.Add('</linha_simples>');
      Relatorio.Add(padLeft('Perfils Atendidos', TamColDescr, '.') + 'W/X/Y/Z');
      Relatorio.Add(padLeft('Tipo de Funcionamento', TamColDescr, '.') + GetTipoFuncionamento(ECF.AAC.IdentPAF.Paf.TipoFuncionamento));
      Relatorio.Add(padLeft('Tipo de Desenvolvimento', TamColDescr, '.') + GetTipoDesenvolvimento(ECF.AAC.IdentPAF.Paf.TipoDesenvolvimento));
      Relatorio.Add(padLeft('Integração com PAF-ECF', TamColDescr, '.') + GetTipoIntegracao(ECF.AAC.IdentPAF.Paf.IntegracaoPAFECF));

      Relatorio.Add('');
      Relatorio.Add('<n>PARÂMETROS PARA NÃO CONCOMITÂNCIA</n>');
      Relatorio.Add('</linha_simples>');

      Relatorio.Add('<n>Req IV</n>');
      Relatorio.Add('ITEM 2: Realiza registros de pré-venda');
      Relatorio.Add(padLeft('conforme definido no inciso II do art. 1º', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RealizaPreVenda));
      Relatorio.Add('ITEM 3: Emitir DAV, impresso em equip. não');
      Relatorio.Add(padLeft('fiscal, conf. defin. no inciso III do art.1º', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RealizaDAVNaoFiscal));
      Relatorio.Add('ITEM 4: Emite DAV, impresso no ECF, como');
      Relatorio.Add('Relat. Ger.,conforme defin. no inciso');
      Relatorio.Add(padLeft('III do art.1º', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RealizaDAVECF ));
      Relatorio.Add('ITEM 5: Registro de lançamento de mesa ou');
      Relatorio.Add(padLeft('conta de cliente', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RealizaLancamentoMesa ));
      Relatorio.Add('<n>Req VI</n>');
      Relatorio.Add('ITEM 2: imprime o DAV conforme o modelo');
      Relatorio.Add(padLeft('constante no Anexo II', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.DAVConfAnexoII ));

      Relatorio.Add('');
      Relatorio.Add('<n>OFICINA DE CONSERTO</n>');
      Relatorio.Add('</linha_simples>');

      Relatorio.Add('<n>Req. LI</n>');
      Relatorio.Add(padLeft('ITEM 1: Emite DAV-OS para serviços', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RealizaDAVOS ));

      Relatorio.Add('');
      Relatorio.Add('<n>APLICAÇÕES ESPECIAIS</n>');
      Relatorio.Add('</linha_simples>');

      Relatorio.Add('<n>Req. VII</n>');
      Relatorio.Add('ITEM 14: Tabela de Indice Técnico');
      Relatorio.Add(padLeft('de Producao', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.IndiceTecnicoProd ));
      Relatorio.Add('<n>Req. XLVII</n>');
      Relatorio.Add(padLeft('ITEM 1: Bar,Restaurante e Similares', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.BarSimilarECFComum ));
      Relatorio.Add('<n>Req. XLVIII</n>');
      Relatorio.Add(padLeft('ITEM 1: Bar,Restaurante e Similar c/ balança', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.BarSimilarBalanca ));
      Relatorio.Add('<n>Req. XLIX</n>');
      Relatorio.Add('ITEM 1: Usa impressora não fiscal no ambiente');
      Relatorio.Add(padLeft('ambiente de produção', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.UsaImpressoraNaoFiscal ));
      Relatorio.Add('<n>Req. L</n>');
      Relatorio.Add('ITENS 1 e 2: Imprime DAV descriminando a');
      Relatorio.Add(padLeft('fórmula manipulada', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.DAVDiscrFormula ));




       Relatorio.Add('');
      Relatorio.Add('<n>REVENDA COMBUSTÍVEL</n>');
      Relatorio.Add('</linha_simples>');

      Relatorio.Add('<n>Req. XXXIV</n>');
      Relatorio.Add('ITEM 1: Acumula por dia, o volume de cada');
      Relatorio.Add(padLeft('combustível', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.AcumulaVolumeDiario ));
      Relatorio.Add('ITEM 2: Armazena os encerrantes inicial');
      Relatorio.Add(padLeft('e final a cada abastecimento', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.ArmazenaEncerranteIniFinal ));

      Relatorio.Add('<n>REQ XXXV</n>');
      Relatorio.Add('ITENS 1 e 2: Emite controle de encerrantes');
      Relatorio.Add(padLeft('após a Redução Z e Leitura X', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.EmiteContrEncerrAposREDZLEIX ));

      Relatorio.Add('<n>REQ XXXVII</n>');
      Relatorio.Add(padLeft('ITEM 1: PAF integrado com bombas', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.IntegradoComBombas ));
      Relatorio.Add('ITEM 3: Cria um abastecimento em caso de');
      Relatorio.Add(padLeft('divergência de encerrantes', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.CriaAbastDivergEncerrante ));

      Relatorio.Add('<n>Requisito XXXIX</n>');
      Relatorio.Add('ITEM 1: impede registro venda com valor');
      Relatorio.Add(padLeft('zerado ou negativo', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.ImpedeVendaVlrZero ));

      Relatorio.Add('<n>REQ XL</n>');
      Relatorio.Add('ITENS 1, 2, 3 e 4: possui cadastro da(s)');
      Relatorio.Add(padLeft('placa(s) da(s) bomba(s)', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.CadastroPlacaBomba ));


            Relatorio.Add('');
      Relatorio.Add('<n>CRITÉRIOS POR UNIDADE FEDERADA</n>');
      Relatorio.Add('</linha_simples>');

      Relatorio.Add('<n>Req. XIX</n>');
      Relatorio.Add('ITEM 1 alinea b: emissão de documento');
      Relatorio.Add(padLeft('fiscal por PED', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.EmitePED ));

      Relatorio.Add('<n>REQ XX</n>');
      Relatorio.Add('ITEM 1 - Tela de Consulta de Produtos');
      Relatorio.Add(padLeft('Alinea a: Totalização dos valores da lista', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.TotalizaValoresLista ));
      Relatorio.Add(padLeft('Alinea b: Transf. das info em Pré-venda', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.TransfPreVenda ));
      Relatorio.Add(padLeft('Alinea c: Transf. das info em DAV', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.TransfDAV ));

      Relatorio.Add('<n>REQ. XXIV</n>');
      Relatorio.Add(padLeft('ITEM 7 Alinea b: Recompõe valor GT', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RecompoeGT ));
      Relatorio.Add(padLeft('ITEM 8 Alinea a1: Recompõe Número Série', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.RecompoeNumSerie ));

      Relatorio.Add('<n>Req. IX</n>');
      Relatorio.Add(padLeft('ITEM 2 : MINAS LEGAL', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.MinasLegal ));
      Relatorio.Add(padLeft('ITEM 2A: CUPOM MANIA', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.CupomMania ));
      Relatorio.Add(padLeft('ITEM 2B: NOTA LEGAL', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.NotaLegalDF ));
      Relatorio.Add(padLeft('ITEM 2C: PARAIBA LEGAL', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.ParaibaLegal ));

      Relatorio.Add('<n>REQUISITO XVI</n>');
      Relatorio.Add(padLeft('ITEM 4 Alinea a1: TROCO EM CARTÃO', TamColSimNao, '.') + GetDescrFlag( ECF.AAC.IdentPAF.Paf.TrocoEmCartao ));

      Relatorio.Add('');

      ECF.RelatorioGerencial( Relatorio );
      Relatorio.Free;

end;

function TDM.IndiceRelGerencial(const sTipo: string): string;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text :=
          'SELECT INDICE_GER_OS, INDICE_GER_ORCAMENTO, INDICE_GER_MESA ' +
          'FROM CAIXA ' + 'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP';
        Parambyname('codcai').AsInteger := iCaixa;
        Parambyname('codemp').AsInteger := iEmp;
        open;
        if trim(sTipo) = 'OS' then
          result := fieldbyname('indice_ger_os').AsString
        else if trim(sTipo) = 'ORCAMENTO' then
          result := fieldbyname('indice_ger_orcamento').AsString
        else if trim(sTipo) = 'MESA' then
          result := fieldbyname('indice_ger_mesa').AsString
        else
          result := '01';
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := '01';
      showmessage('Erro ao buscar o índice');
    end;
  finally
    DM.QConsulta.close;
  end;
end;

procedure TDM.GeraMovimento(const NumeroECF: integer;
  const DataInicial, DataFinal: TDateTime; const iTag: integer; Parcial: string );
var
  sNomeArquivo: string;
  sNomeArquivo2: string;
  sCodIdentif: string;
  CaminhoBancoCAI: String;
begin
  try
    if DM.IBTRServer.Active then
      DM.IBTRServer.Commit;
    DM.IBTRServer.StartTransaction;
    with DM.QConsultaServer do
    begin
      close;
      sql.Clear;
      sql.Text := 'SELECT CAMINHO_BANCO FROM CAIXA ' +
        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP';
      Parambyname('codcai').AsInteger := NumeroECF;
      Parambyname('codemp').AsInteger := iEmp;
      open;
      if trim(fieldbyname('CAMINHO_BANCO').AsString) = '' then
      begin
        KDialog('Caixa desejado não configurado', 'SLPDV', 'ERRO');
        Exit;
      end;

      CaminhoBancoCAI := trim(fieldbyname('CAMINHO_BANCO').AsString);
      close;
    end;
  except
    KDialog('Sem Acesso ao servidor', 'SLPDV', 'ERRO');
    Exit;
  end;
  DM.IBTRServer.Commit;

  try
;
    AuxTipo_R.Connected := true;
  except
    KDialog('Sem Acesso ao caixa : ' + IntToStr(NumeroECF), 'SLPDV', 'ERRO');
    Exit;
  end;
  frmStatusGerando.pnl1.Caption := 'Gerando Registros do PAF-ECF';
  frmStatusGerando.Show;
  frmStatusGerando.BringToFront;
  Application.ProcessMessages;
  if DM.TRAuxTipo_R.Active then
    DM.TRAuxTipo_R.Commit;
  DM.TRAuxTipo_R.StartTransaction;
  with DM.QConsultaR do
  begin
    close;
    sql.Clear;
    sql.Text :=
      'SELECT C.R01_NUMERO_SERIE, C.R01_MF_ADICIONAL, C.R01_TIPO_ECF, C.R01_MARCA_ECF,'+
      ' C.R01_MODELO_ECF, C.R01_VERSAO_SB, C.R01_DATAHORA_SB, C.R01_CNPJ_USUARIO,'+
      ' C.R01_IE_USUARIO, C.R01_NUMERO_USUARIO, C.CODIGO_NACIONAL_IDENTIFICACAO, '+
      ' E.razao_emp, E.inscricao_municipal FROM CAIXA C'+
      ' inner join empresa e '+
      ' on ( e.cod_emp = C.COD_EMP ) WHERE C.COD_CAI = :CODCAI '+
      'AND C.COD_EMP = :CODEMP';
    Parambyname('codcai').AsInteger := NumeroECF;
    Parambyname('codemp').AsInteger := iEmp;
    open;
    First;
    sNumeroSerie := fieldbyname('r01_numero_serie').AsString;
    sMemoria := fieldbyname('r01_mf_adicional').AsString;
    sTipoECF := fieldbyname('r01_tipo_ecf').AsString;
    sMarcaECF := fieldbyname('r01_marca_ecf').AsString;
    sModeloECF := fieldbyname('r01_modelo_ecf').AsString;
    sVersaoSB := fieldbyname('r01_versao_sb').AsString;
    if fieldbyname('r01_datahora_sb').IsNull then
    begin
      sDataSB := '';
      sHoraSB := '';
    end
    else
    begin
      sDataSB := FormatDateTime('dd/mm/yyyy', fieldbyname('r01_datahora_sb')
        .AsDateTime);
      sHoraSB := FormatDateTime('hh:mm:ss', fieldbyname('r01_datahora_sb')
        .AsDateTime);
    end;

    sCNPJUsuario := fieldbyname('r01_cnpj_usuario').AsString;
    sIEUsuario := fieldbyname('r01_ie_usuario').AsString;
    sIMUsuario := fieldbyname('inscricao_municipal').AsString;
    sRazaoUsuario := fieldbyname('razao_emp').AsString;
    sNumeroUsuario := fieldbyname('r01_numero_usuario').AsString;
    sNumECF := IntToStr(NumeroECF);
    sCodIdentif := fieldbyname('codigo_nacional_identificacao').AsString;
  end;
  DM.TRAuxTipo_R.Commit;
  DM.QConsultaR.close;

  { cria o arquivo }

  case iTag of
    0:
      begin // movimento por ecf - Menu Fiscal
          sNomeArquivo := 'C:\PAF_ECF\' + 'RegistrosPAF' +
            FormatDateTime('ddmmyyyy', DataInicial) +
            FormatDateTime('ddmmyyyy', DataFinal) + '.TXT';
          sNomeArquivo2 := 'RegistrosPAF' +
            FormatDateTime('ddmmyyyy', DataInicial) +
            FormatDateTime('ddmmyyyy', DataFinal) + '.TXT';
      end;
    1:
      begin // movimento por ecf - Reducao Z
        if length(sNumeroSerie) > 14 then
        begin
          sNomeArquivo := 'C:\PAF_ECF\' + sCodIdentif +
            Copy(sNumeroSerie, (length(sNumeroSerie) - 14) + 1, 14) +
            FormatDateTime('ddmmyyyy', DataFinal) + '.TXT';
          sNomeArquivo2 := sCodIdentif + Copy(sNumeroSerie,
            (length(sNumeroSerie) - 14) + 1, 14) + FormatDateTime('ddmmyyyy',
            DataFinal) + '.TXT';
        end
        else
        begin
          sNomeArquivo := 'C:\PAF_ECF\' + sCodIdentif +
            FormataStringD(sNumeroSerie, '14', '0') + FormatDateTime('ddmmyyyy',
            DataFinal) + '.TXT';
          sNomeArquivo2 := sCodIdentif + FormataStringD(sNumeroSerie, '14', '0')
            + FormatDateTime('ddmmyyyy', DataFinal) + '.TXT';
        end;
      end;
  end;

  DM.PAF.PAF_R.LimpaRegistros;
  { Registro R01 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros R01';
  Application.ProcessMessages;
  Gera_R01(NumeroECF, DataInicial, DataFinal);

  { Registro R02 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros R02, R03';
  Application.ProcessMessages;
  Gera_R02(NumeroECF, DataInicial, DataFinal);

  { Registro R04 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros R04, R05';
  Application.ProcessMessages;
  Gera_R04(NumeroECF, DataInicial, DataFinal);

  { Registro R06 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros R06';
  Application.ProcessMessages;
  Gera_R06(NumeroECF, DataInicial, DataFinal);

  { Registro A2}
  frmStatusGerando.pnl1.Caption := 'Gerando Registros A2';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaA2_MeiosPagamento( DataInicial, DataFinal );

  { Registro H2 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros H2';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaRegistrosH2( DataInicial, DataFinal );

  { Registro P2 }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros P2';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaP2_Produtos;

  { Registros D }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros D2, D3, D4';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaRegistrosD( DataInicial, DataFinal );

  { Registros E }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros E2, E3';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaE_Estoque( Parcial );

  { Registros S }
  frmStatusGerando.pnl1.Caption := 'Gerando Registros S2, S3';
  Application.ProcessMessages;
  dmRegistrosdoPaf.MontaRegistrosS( DataInicial, DataFinal );

//  PAF.SaveFileTXT_R(sNomeArquivo2);
  PAF.PAF_R.NomeArquivo := sNomeArquivo2 ;
  PAF.PAF_R.SaveToFile;

  { EAD - Assinatura Digital }

//  if iTag = 1 then
  //  Application.MessageBox('Arquivo(s) gerado com sucesso na pasta C:\PAF_ECF',
    //  'Atenção', MB_ICONINFORMATION + MB_OK);
//  if iTag = 0 then
    frmStatusGerando.Close;
    Application.MessageBox(PChar('Arquivo ' + sNomeArquivo +
      ' gerado com sucesso'), 'Atenção', MB_ICONINFORMATION + MB_OK);
end;

procedure TDM.Gera_R01(const iNumECF: integer;
  const DataInicial, DataFinal: TDateTime);
var
  sCNPJAtip: string;
  sIEAtip: string;
  sIMAtip: string;
  sRazaoAtip: string;
  sNomePAFatip: string;
  sVersaoPafAtip: string;
  sVersaoPAF: string;
  sMD5Atip: string;
  sAux: string;
  sAuxArquivo: TStringList;
begin

  sCNPJAtip := DM.ACBrAAC1.IdentPAF.Empresa.CNPJ;
  sIEAtip := DM.ACBrAAC1.IdentPAF.Empresa.IE;
  sIMAtip := DM.ACBrAAC1.IdentPAF.Empresa.IM;
  sRazaoAtip := DM.ACBrAAC1.IdentPAF.Empresa.RazaoSocial;
  sNomePAFatip := DM.ACBrAAC1.IdentPAF.PAF.Nome;
  sVersaoPafAtip := DM.ACBrAAC1.IdentPAF.PAF.Versao;
  sMD5Atip := DM.ACBrAAC1.IdentPAF.ArquivoListaAutenticados.MD5;

  sVersaoPAF := DM.ACBrAAC1.IdentPAF.VersaoER;
  dm.paf.PAF_P.RegistroP1.CNPJ := sCNPJUsuario;
  dm.PAF.PAF_E.RegistroE1.CNPJ := sCNPJUsuario;
  dm.PAF.PAF_D.RegistroD1.CNPJ := sCNPJUsuario;


  with dm.PAF.PAF_R.RegistroR01.New do
       begin
          NUM_FAB := sNumeroSerie;
          MF_ADICIONAL := sMemoria;
          TIPO_ECF := sTipoECF;
          MARCA_ECF := sMarcaECF;
          MODELO_ECF := sModeloECF;
          VERSAO_SB := sVersaoSB;
          DT_INST_SB := StrToDate(sDataSB);
          HR_INST_SB := StrToTime(sHoraSB);
          NUM_SEQ_ECF := strtoint(sNumECF);
          CNPJ := sCNPJUsuario;
          IE := sIEUsuario;
          CNPJ_SH := sCNPJAtip;
          IE_SH := sIEAtip;
          IM_SH := sIMAtip;
          NOME_SH := sRazaoAtip;
          NOME_PAF := sNomePAFatip;
          VER_PAF := sVersaoPafAtip;
          COD_MD5 := sMD5Atip;
          ER_PAF_ECF :=
                FormataStringD(RetiraPontoString(sVersaoPAF), '4', '0');
          DT_INI := DataInicial;
          DT_FIN := DataFinal;
          InclusaoExclusao := Verifica_IncExc_R01(DataInicial,
                DataFinal);
          RegistroValido := Verifica_Alteracao_R01(iEmp,
                strtoint(sNumECF));
       end;


  with dm.PAF.PAF_U.RegistroU1 do
    begin
      CNPJ:= sCNPJUsuario;
      IE  := sIEUsuario;
      IM  := sIMUsuario;
      RAZAOSOCIAL:= sRazaoUsuario;
      InclusaoExclusao:= dmRegistrosdoPaf.Verifica_IncExc_U1( DataInicial, DataFinal );
    end;




end;

procedure TDM.Gera_R02(const iNumECF: integer;
  const DataInicial, DataFinal: TDateTime);
var
  sCRZ: string;
  sCOO: string;
  sCRO: string;
  sDataMov: string;
  sDataEmisao: string;
  sHoraEmissao: string;
  sVendaBruta: string;
  sDescISSQN: string;
  sAux: string;

begin
  if DM.TRAuxTipo_R.Active then
    DM.TRAuxTipo_R.Commit;
  DM.TRAuxTipo_R.StartTransaction;
  QConsultaR.close;
  QConsultaR.sql.Text := 'SELECT * FROM MAPA_RESUMO ' +
    'WHERE DATA BETWEEN :DATAINI AND :DATAFIN AND CHECKOUT = :CHECKOUT ' +
    'AND COD_EMP = :CODEMP ORDER BY CONT_REDUCAO';
  with QConsultaR do
  begin
    close;
    Parambyname('dataini').AsDate := DataInicial;
    Parambyname('datafin').AsDate := DataFinal;
    Parambyname('checkout').AsInteger := iNumECF;
    Parambyname('codemp').AsInteger := iEmp;
    open;
    First;


    while not eof do
    begin
      with paf.PAF_R.RegistroR01.Items[0].RegistroR02.New do
      begin
        NUM_USU := strtoint(sNumeroUsuario);
        CRZ := fieldbyname('CONT_REDUCAO').AsInteger;
        COO := fieldbyname('COO_FINAL').AsInteger;
        CRO := fieldbyname('CONTADOR_REINICIO_OPERACAO').AsInteger;
        DT_MOV := fieldbyname('DATA').AsDateTime;
        DT_EMI := fieldbyname('DATA_EMISSAO').AsDateTime;
        HR_EMI := fieldbyname('HORA_EMISSAO').AsDateTime;
        VL_VBD := fieldbyname('VENDA_BRUTA').AsCurrency;
        PAR_ECF := 'N';
        RegistroValido := Verifica_Alteracao_R02(fieldbyname('CODIGO')
          .AsInteger, iEmp, strtoint(sNumECF));

        QConsultaAux.close;
        QConsultaAux.sql.Text := 'SELECT I.*, M.CONT_REDUCAO ' +
          'FROM ITENS_MAPA_RESUMO I INNER JOIN MAPA_RESUMO M ' +
          'ON (I.CODIGO = M.CODIGO) WHERE M.codigo = :cod ' +
          'AND M.CHECKOUT = :CHECKOUT AND I.COD_EMP = :CODEMP ' +
          'ORDER BY I.CODIGO, I.COD_GRP';
        QConsultaAux.Parambyname('COD').AsInteger := fieldbyname('CODIGO')
          .AsInteger;
        QConsultaAux.Parambyname('CODEMP').AsInteger := iEmp;
        QConsultaAux.Parambyname('CHECKOUT').AsInteger := iNumECF;
        QConsultaAux.open;
        QConsultaAux.First;
        while not QConsultaAux.eof do
        begin
          with RegistroR03.New do
          begin
            TOT_PARCIAL := QConsultaAux.fieldbyname('INDICE_R03').AsString;
            VL_ACUM := QConsultaAux.fieldbyname('VALOR').AsCurrency;
            RegistroValido := Verifica_Alteracao_R03
              (fieldbyname('CODIGO').AsInteger,
              QConsultaAux.fieldbyname('COD_GRP').AsInteger, iEmp,
              strtoint(sNumECF));

          end;
          QConsultaAux.next;
        end;
        QConsultaAux.close;
      end;
      next;
    end;
  end;
  DM.TRAuxTipo_R.Commit;
  QConsultaR.close;
end;

procedure TDM.Gera_R04(const iNumECF: integer;
  const DataInicial, DataFinal: TDateTime);
var
  sContador: string;
  sCOO: string;
  sData: string;
  sSubTotal: string;
  sDesconto: string;
  sTipoDesc: string;
  sAcrescimo: string;
  sTipoAcre: string;
  sValorLiq: string;
  sCancelado: string;
  sCancelAcrescimo: string;
  sOrdemAcreDesc: string;
  sNomeCliente: string;
  sCNPJCliente: string;
  sAux: string;
  TotalItem: currency;
begin
  if DM.TRAuxTipo_R.Active then
    DM.TRAuxTipo_R.Commit;
  DM.TRAuxTipo_R.StartTransaction;
  QConsultaR.close;
  QConsultaR.sql.Text :=
    'SELECT V.COD_VEN, V.R04_CCF, c.nome_cli, c.cnpj_cli, c.cod_cli, ' +
    'V.CANCELADA_VEN, V.CUPOM_FISCAL_VEN, V.DATA_VEN, V.DESCONTO_VEN, V.TOTAL_VEN, V.R04_CCF '
    + 'FROM VENDAS V ' + 'INNER JOIN CLIENTE C ' +
    'ON ( V.cod_cli = C.cod_cli ) WHERE ' +
    'DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND COD_CAI = :CODCAI AND ' +
    'COD_EMP = :CODEMP AND CUPOM_FISCAL_VEN IS NOT NULL ORDER BY COD_VEN';
  with QConsultaR do
  begin
    close;
    Parambyname('dataini').AsDate := DataInicial;
    Parambyname('datafin').AsDate := DataFinal;
    Parambyname('codcai').AsInteger := iNumECF;
    Parambyname('codemp').AsInteger := iEmp;
    open;
    First;
    while not eof do
    begin
      if fieldbyname('CANCELADA_VEN').AsInteger = 0 then
        sCancelado := 'N'
      else
        sCancelado := 'S';

      with paf.PAF_R.RegistroR01.Items[0].RegistroR04.New do
      begin
        NUM_USU := strtoint(sNumeroUsuario);
        NUM_CONT := fieldbyname('R04_CCF').AsInteger;
        COO := fieldbyname('CUPOM_FISCAL_VEN').AsInteger;
        DT_INI := fieldbyname('DATA_VEN').AsDateTime;
        SUB_DOCTO := fieldbyname('TOTAL_VEN').AsCurrency;
        SUB_DESCTO := Abs(fieldbyname('DESCONTO_VEN').AsCurrency);
        TP_DESCTO := 'V';
        SUB_ACRES := 0;
        TP_ACRES := 'V';
        VL_TOT := fieldbyname('TOTAL_VEN').AsCurrency;
        CANC := sCancelado;
        VL_CA := 0;
        ORDEM_DA := 'D';
        NOME_CLI := fieldbyname('nome_cli').AsString;
        CNPJ_CPF := RetiraCaracter(fieldbyname('cnpj_cli').AsString);
        RegistroValido := Verifica_Alteracao_R04(strtoint(sNumECF), iEmp,
          fieldbyname('COD_VEN').AsInteger, fieldbyname('COD_CLI').AsInteger);

        QConsultaAux.close;
        QConsultaAux.sql.Text := 'SELECT I.*, V.CUPOM_FISCAL_VEN, ' +
          'V.R04_CCF, V.COD_CAI, P.DESC_CUPOM, P.ICMS_CF_EST, ' +
          'P.TIPO_PRODUCAO, P.CODIGO_BARRA_PRO, U.DESCRICAO FROM ITENS_VENDA I '
          + 'INNER JOIN VENDAS V ON (I.COD_VEN = V.COD_VEN) INNER JOIN PRODUTO P '
          + 'ON (I.COD_PRO = P.COD_PRO) INNER JOIN UNIDADE_MEDIDA U ' +
          'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
          'WHERE V.cod_ven = :codven AND V.COD_CAI = :CODCAI AND ' +
          'V.COD_EMP = :CODEMP AND CUPOM_FISCAL_VEN IS NOT NULL ' +
          'ORDER BY I.COD_VEN, I.ORDEM ';
        QConsultaAux.Parambyname('CODVEN').AsInteger := fieldbyname('COD_VEN')
          .AsInteger;
        QConsultaAux.Parambyname('codcai').AsInteger := iNumECF;
        QConsultaAux.Parambyname('codemp').AsInteger := iEmp;
        QConsultaAux.open;
        QConsultaAux.First;
        while not QConsultaAux.eof do
        begin
          TotalItem := 0;
          with RegistroR05.New do
          begin
            NUM_ITEM := QConsultaAux.fieldbyname('ORDEM').AsInteger;
            COD_ITEM := QConsultaAux.fieldbyname('CODIGO_BARRA_PRO').AsString;
            DESC_ITEM := QConsultaAux.fieldbyname('DESC_CUPOM').AsString;
            QTDE_ITEM := QConsultaAux.fieldbyname('QUANT').AsCurrency;
            UN_MED := QConsultaAux.fieldbyname('DESCRICAO').AsString;
            VL_UNIT := QConsultaAux.fieldbyname('VALOR').AsCurrency;
            DESCTO_ITEM := 0;
            ACRES_ITEM := 0;
            if QConsultaAux.fieldbyname('DESCONTO').AsCurrency > 0 then
               DESCTO_ITEM := QConsultaAux.fieldbyname('DESCONTO').AsCurrency
            else
               if QConsultaAux.fieldbyname('DESCONTO').AsCurrency < 0 then
                   ACRES_ITEM := QConsultaAux.fieldbyname('DESCONTO').AsCurrency * -1;
            TotalItem := (VL_UNIT * QTDE_ITEM) - DESCTO_ITEM;
            VL_TOT_ITEM := TotalItem;
            COD_TOT_PARC := BuscaIndiceRR(QConsultaAux.fieldbyname('COD_CAI')
              .AsInteger, iEmp, QConsultaAux.fieldbyname('ICMS_CF_EST')
              .AsInteger);
            if QConsultaAux.fieldbyname('CANCELADO').AsInteger = 1 then
              IND_CANC := 'S'
            else
              IND_CANC := 'N';
            QTDE_CANC := 0;
            VL_CANC := 0;
            VL_CANC_ACRES := 0;
            IAT := 'T';
            IPPT := QConsultaAux.fieldbyname('TIPO_PRODUCAO').AsString;
            QTDE_DECIMAL := 3;
            VL_DECIMAL := 2;
            RegistroValido := Verifica_Alteracao_R05(iEmp, strtoint(sNumECF),
              QConsultaAux.fieldbyname('COD_PRO').AsInteger,
              QConsultaAux.fieldbyname('COD_VEN').AsInteger,
              QConsultaAux.fieldbyname('ORDEM').AsInteger);
          end;

          QConsultaAux.next;
        end;

        QConsultaAux.close;
        QConsultaAux.sql.Text := 'SELECT * FROM MEIOS_PAGAMENTOS_ECF ' +
          'WHERE COO=:COO AND COD_CAI = :CODCAI AND COD_EMP = :CODEMP ' +
          'ORDER BY CODIGO';
        QConsultaAux.Parambyname('COO').AsInteger :=
          fieldbyname('CUPOM_FISCAL_VEN').AsInteger;
        QConsultaAux.Parambyname('codcai').AsInteger := iNumECF;
        QConsultaAux.Parambyname('codemp').AsInteger := iEmp;
        QConsultaAux.open;
        QConsultaAux.First;
        while not QConsultaAux.eof do
        begin
          with RegistroR07.New do
          begin
            CCF := QConsultaAux.fieldbyname('CCF').AsInteger;
            MP := QConsultaAux.fieldbyname('MEIO_PAGAMENTO').AsString;
            VL_PAGTO := QConsultaAux.fieldbyname('VALOR_PAGO').AsCurrency;
            IND_EST := 'N';
            VL_EST := 0;
            RegistroValido := Verifica_Alteracao_R07(iEmp, strtoint(sNumECF),
              QConsultaAux.fieldbyname('CODIGO').AsInteger);
          end;
          QConsultaAux.next;
        end;
        QConsultaAux.close;
      end;
      next;
    end;
  end;
  DM.TRAuxTipo_R.Commit;
  QConsultaR.close;
end;

procedure TDM.Gera_R06(const iNumECF: integer;
  const DataInicial, DataFinal: TDateTime);
var
  sCOO: string;
  sGNF: string;
  sGRG: string;
  sCDC: string;
  sDescricao: string;
  sDataFinal: string;
  sHoraFinal: string;
  sAux: string;
begin
  if DM.TRAuxTipo_R.Active then
    DM.TRAuxTipo_R.Commit;
  DM.TRAuxTipo_R.StartTransaction;
  DM.QConsultaR.close;
  DM.QConsultaR.sql.Text := 'SELECT * FROM OUTROS_DOCUMENTOS_ECF ' +
    'WHERE DATA_FINAL BETWEEN :DATAINI AND :DATAFIN AND ' +
    'COD_CAI = :CODCAI AND COD_EMP = :CODEMP ORDER BY CODIGO';

  with QConsultaR do
  begin
    close;
    Parambyname('dataini').AsDate := DataInicial;
    Parambyname('datafin').AsDate := DataFinal;
    Parambyname('codcai').AsInteger := iNumECF;
    Parambyname('codemp').AsInteger := iEmp;
    open;
    First;
    while not eof do
    begin
      with paf.PAF_R.RegistroR01.Items[0].RegistroR06.New do
      begin
        NUM_USU := strtoint(sNumeroUsuario);
        COO := fieldbyname('COO').AsInteger;
        GNF := fieldbyname('GNF').AsInteger;
        GRG := fieldbyname('GRG').AsInteger;
        CDC := fieldbyname('CDC').AsInteger;
        DENOM := fieldbyname('DESCRICAO').AsString;
        DT_FIN := fieldbyname('DATA_FINAL').AsDateTime;
        HR_FIN := fieldbyname('HORA_FINAL').AsDateTime;
        RegistroValido := Verifica_Alteracao_R06(fieldbyname('CODIGO')
          .AsInteger, iEmp, strtoint(sNumECF));

        QConsultaAux.close;
        QConsultaAux.sql.Text := 'SELECT * FROM MEIOS_PAGAMENTOS_ECF ' +
          'WHERE COO=:COO AND COD_CAI = :CODCAI AND COD_EMP = :CODEMP ' +
          'ORDER BY CODIGO';
        QConsultaAux.Parambyname('COO').AsInteger := fieldbyname('COO')
          .AsInteger;
        QConsultaAux.Parambyname('codcai').AsInteger := iNumECF;
        QConsultaAux.Parambyname('codemp').AsInteger := iEmp;
        QConsultaAux.open;
        QConsultaAux.First;
        while not QConsultaAux.eof do
        begin
          with RegistroR07.New do
          begin
            CCF := QConsultaAux.fieldbyname('CCF').AsInteger;
            GNF := QConsultaAux.fieldbyname('GNF').AsInteger;
            MP := QConsultaAux.fieldbyname('MEIO_PAGAMENTO').AsString;
            VL_PAGTO := QConsultaAux.fieldbyname('VALOR_PAGO').AsCurrency;
            IND_EST := 'N';
            VL_EST := 0;
            RegistroValido := Verifica_Alteracao_R07(iEmp, strtoint(sNumECF),
              QConsultaAux.fieldbyname('CODIGO').AsInteger);

          end;
          QConsultaAux.next;
        end;
        QConsultaAux.close;

      end;
      next;
    end;
  end;
  DM.TRAuxTipo_R.Commit;
  QConsultaR.close;
end;

function TDM.BuscaIndice(const cod_cai, cod_emp, cod_grp: integer): string;
begin
  if IBTRAuxServer.Active then
    IBTRAuxServer.Commit;
  IBTRAuxServer.StartTransaction;
  with QIndice do
  begin
    close;
    Parambyname('codcai').AsInteger := cod_cai;
    Parambyname('codemp').AsInteger := cod_emp;
    Parambyname('codgrp').AsInteger := cod_grp;
    open;
    result := QIndiceINDICE_R03.AsString;
  end;
  IBTRAuxServer.Commit;
  QIndice.close;
end;

function TDM.BuscaIndiceRR(const cod_cai, cod_emp, cod_grp: integer): string;
var
  T: boolean;
begin
  T := False;
  if not TRAuxTipo_R.Active then
  begin
    TRAuxTipo_R.StartTransaction;
  end
  else
    T := true;
  with BuscaIndiceR do
  begin
    close;
    Parambyname('codcai').AsInteger := cod_cai;
    Parambyname('codemp').AsInteger := cod_emp;
    Parambyname('codgrp').AsInteger := cod_grp;
    open;
    result := BuscaIndiceRINDICE_R03.AsString;
  end;
  if not T then
    IBTRAuxServer.Commit;
  BuscaIndiceR.close;
end;

function TDM.BuscaFormaPagamento(const sTipo: string): integer;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT CODIGO ' + 'FROM FORMAS_PAGAMENTO ' +
          'WHERE TIPO = ' + #39 + trim(sTipo) + #39;
        open;
        result := fieldbyname('codigo').AsInteger;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := 0;
      showmessage('erro ao buscar o código da forma de pagamento');
    end;
  finally
    DM.QConsulta.close;
  end;
end;

function TDM.BuscaIndiceForma(const iForma: integer): string;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT INDICE ' + 'FROM INDICE_FORMA_PAGAMENTO ' +
          'WHERE COD_CAIXA = :CODCAI AND COD_EMP = :CODEMP AND COD_FORMA = :CODFORMA';
        Parambyname('codcai').AsInteger := iCaixa;
        Parambyname('codemp').AsInteger := iEmp;
        Parambyname('codforma').AsInteger := iForma;
        open;
        result := fieldbyname('indice').AsString;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := '';
      showmessage('erro ao buscar o indice da forma de pagamento');
    end;
  finally
    DM.QConsulta.close;
  end;
end;

function TDM.BuscaDescricaoFormaNaECF(const iForma: integer): string;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT DESCRICAO_ECF ' + 'FROM INDICE_FORMA_PAGAMENTO ' +
          'WHERE COD_CAIXA = :CODCAI AND COD_EMP = :CODEMP AND COD_FORMA = :CODFORMA';
        Parambyname('codcai').AsInteger := iCaixa;
        Parambyname('codemp').AsInteger := iEmp;
        Parambyname('codforma').AsInteger := iForma;
        open;
        result := fieldbyname('DESCRICAO_ECF').AsString;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := '';
      showmessage('erro ao buscar a Descrição da forma de pagamento no ECF');
    end;
  finally
    DM.QConsulta.close;
  end;
end;

procedure TDM.QBandeiraCalcFields(DataSet: TDataSet);
begin
  if trim(DM.QBandeiraTIPO_CARTAO.AsString) = 'C' then
    DM.QBandeiraCALC_TIPO.AsString := 'CRÉDITO'
  else if trim(DM.QBandeiraTIPO_CARTAO.AsString) = 'D' then
    DM.QBandeiraCALC_TIPO.AsString := 'DÉBITO'
  else if trim(DM.QBandeiraTIPO_CARTAO.AsString) = 'A' then
    DM.QBandeiraCALC_TIPO.AsString := 'CRÉDITO/DÉBITO';
end;

function TDM.BuscaEstoqueProduto(const iCodPro, iCodEmp: integer): currency;
begin
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
    try
      with DM.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Text := 'SELECT SUM(ESTOQUE) ESTOQUE ' + 'FROM ESTOQUE   ' +
          'WHERE COD_PRO = :CODPRO AND COD_EMP = :CODEMP';

        Parambyname('codpro').AsInteger := iCodPro;
        Parambyname('codemp').AsInteger := iCodEmp;
        open;
        result := fieldbyname('estoque').AsCurrency;
      end;
      DM.IBTransaction.Commit;
    except
      DM.IBTransaction.Rollback;
      result := 0;
      showmessage('Erro ao buscar o estoque do produto');
    end;
  finally
    DM.QConsulta.close;
  end;
end;

procedure TDM.MensagemErroECF(const sMensagem: string; bMostrar: boolean);
begin
  if bMostrar then
    showmessage(sMensagem);
end;

procedure TDM.Gera_RegistroN;
var
  i: integer;
  Arquivo: String;
  SenhaDesenvolvimento: String;
begin
  // REGISTROS N1 N2 N3

  Arquivo := 'SLPDvGen.txt';
  PAF.Path := ExtractFilePath(Application.ExeName);
  with PAF.PAF_N.RegistroN1 do
  begin
    CNPJ := ECF.AAC.IdentPAF.Empresa.CNPJ;
    IE := ECF.AAC.IdentPAF.Empresa.IE;
    IM := ECF.AAC.IdentPAF.Empresa.IM;
    UF := ECF.AAC.IdentPAF.Empresa.UF;
    RazaoSocial := ECF.AAC.IdentPAF.Empresa.RazaoSocial;
  end;
  with PAF.PAF_N.RegistroN2 do
  begin
    LAUDO := ECF.AAC.IdentPAF.NumeroLaudo;
    Nome := ECF.AAC.IdentPAF.PAF.Nome;
    Versao := RetiraPonto(ECF.AAC.IdentPAF.PAF.Versao);
  end;

  ACBrAAC1.IdentPAF.OutrosArquivos.Clear;
  for i := 1 to 3 do
    with PAF.PAF_N.RegistroN3.New do
    begin
      NOME_ARQUIVO := ListaArquivos[i];
      MD5 := PAF.EAD.MD5FromFile(PAF.Path + ListaArquivos[i]);
      with ACBrAAC1.IdentPAF.OutrosArquivos.New do
      begin
        Nome := ListaArquivos[i];
        MD5 := PAF.EAD.MD5FromFile(PAF.Path + ListaArquivos[i]);
      end;
    end;

  PAF.PAF_N.NomeArquivo := Arquivo;
  PAF.PAF_N.SaveToFile;

  DM.ECF.AAC.IdentPAF.ArquivoListaAutenticados.Nome := Arquivo;
  DM.ECF.AAC.IdentPAF.ArquivoListaAutenticados.MD5 :=
    PAF.EAD.MD5FromFile(PAF.Path + Arquivo);
  DM.ECF.AAC.IdentPAF.PAF.PrincipalExe.Nome := 'SLPDV.exe';
  DM.ECF.AAC.IdentPAF.PAF.PrincipalExe.MD5 :=
    PAF.EAD.MD5FromFile(PAF.Path + 'SLPDV.exe');
  sMD5 := DM.ECF.AAC.IdentPAF.ArquivoListaAutenticados.MD5;

  KDialog('Arquivo auxiliar MD5 :' + #13 + PAF.Path + Arquivo,
    'Arquivo MD5', 'INFO');

   DM.ECF.InfoRodapeCupom.MD5 := sMD5 + #10;
  if ArquivoAntigo <> nil then
    ArquivoAntigo.Free;
  if ArquivoNovo <> nil then
    ArquivoNovo.Free;

end;

function TDM.Gerar_MD5_Registro_Tabela_Dados(tabela: TFDQuery): String;

var
  i: integer;

  AuxSTR, NomeCampo, TipoCampo: String;
const
  Chave: String = 'kaka4525';

begin

  // efetua um loop nos registros da tabela somando uma variávei string

  // para gerar o MF5

  AuxSTR := '';

  for i := 0 to tabela.Fields.Count - 1 do

  begin

    NomeCampo := UpperCase(tabela.Fields.Fields[i].FieldName);

    TipoCampo := FieldTypeNames[tabela.Fields.Fields[i].DataType];

    if NomeCampo <> 'CHAVE' then

    begin

      if TipoCampo = 'String' then

        AuxSTR := AuxSTR + tabela.fieldbyname(NomeCampo).AsString;

      if TipoCampo = 'WideString' then

        AuxSTR := AuxSTR + tabela.fieldbyname(NomeCampo).AsString;

      if TipoCampo = 'ftMemo' then

        AuxSTR := AuxSTR + tabela.fieldbyname(NomeCampo).AsString;

      if TipoCampo = 'Integer' then

        AuxSTR := AuxSTR + IntToStr(tabela.fieldbyname(NomeCampo).AsInteger);

      if TipoCampo = 'Smallint' then

        AuxSTR := AuxSTR + IntToStr(tabela.fieldbyname(NomeCampo).AsInteger);

      if TipoCampo = 'Largeint' then

        AuxSTR := AuxSTR + IntToStr(tabela.fieldbyname(NomeCampo).AsInteger);

      if TipoCampo = 'Word' then

        AuxSTR := AuxSTR + IntToStr(tabela.fieldbyname(NomeCampo).AsInteger);

      if TipoCampo = 'Float' then

        AuxSTR := AuxSTR + FloatToStr(tabela.fieldbyname(NomeCampo).AsFloat);

      if TipoCampo = 'Currency' then

        AuxSTR := AuxSTR + FloatToStr(tabela.fieldbyname(NomeCampo).AsFloat);

      if TipoCampo = 'FMTBcd' then

        AuxSTR := AuxSTR + FloatToStr(tabela.fieldbyname(NomeCampo).AsFloat);

      if TipoCampo = 'Date' then

        AuxSTR := AuxSTR + DateToStr(tabela.fieldbyname(NomeCampo).AsDateTime);

      if TipoCampo = 'DateTime' then

        AuxSTR := AuxSTR + DateToStr(tabela.fieldbyname(NomeCampo).AsDateTime);

      if TipoCampo = 'Time' then

        AuxSTR := AuxSTR + DateToStr(tabela.fieldbyname(NomeCampo).AsDateTime);

    end;

  end;
  AuxSTR := AuxSTR + Chave;
  // retorna o resultado
  result := DM.PAF.EAD.MD5FromString(AuxSTR);

end;

function TDM.MD5_IBSql(tabela: TFDQuery): String;

var
  i: integer;

  AuxSTR, NomeCampo: String;
const
  Chave: String = 'kaka4525';

begin

  // efetua um loop nos registros da tabela somando uma variávei string

  // para gerar o MF5

  AuxSTR := '';

  for i := 0 to tabela.Params.Count - 1 do

  begin

    NomeCampo := UpperCase(tabela.Params[i].Name);

    if NomeCampo <> 'CHAVE' then

    begin
      AuxSTR := AuxSTR + UpperCase(tabela.Params[i].AsString);
    end;

  end;
  AuxSTR := AuxSTR + Chave;
  // retorna o resultado
  result := DM.PAF.EAD.MD5FromString(AuxSTR);

end;

procedure TDM.VerificaEstoqueDia(tag: integer);

var
  DataEstoque: Tdate;
begin
  { atualiza o estoque }
  if bOFF then
  begin
    if tag = 0 then
    begin
      if DM.IBTransaction.Active then
        DM.IBTransaction.Commit;
      DM.IBTransaction.StartTransaction;
      try
        try
          with DM.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Text := 'SELECT DATA_ATUALIZACAO_ESTOQUE ' + 'FROM PARAMETROS '
              + 'WHERE COD_EMP = :CODEMP';
            Parambyname('codemp').AsInteger := iEmp;
            open;
            DataEstoque := fieldbyname('data_atualizacao_estoque').AsDateTime;
          end;
          DM.IBTransaction.Commit;
        except
          DM.IBTransaction.Rollback;
          showmessage('erro ao buscar a data do estoque');
        end;
      finally
        DM.QConsulta.close;
      end;

      // FrmPadraoPafECf.Refresh;
      if date <> DataEstoque then
      begin
        DM.AtualizaEstoque( tag);
      end;
    end
    else
    begin
       DM.AtualizaEstoque( tag);
    end;
  end;
end;

function TDM.VerificaTecla(Tecla: Char): Boolean;
begin
   Result := False;
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;

   with QConsulta do
      begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from GRUPO_TECLAS where TECLA=:TECLA';
          ParamByName( 'TECLA' ).AsString := Tecla;
          Open;
          if not IsEmpty then
             Result := true
          else
             Result := False;
          Close;
      end;

   IBTransaction.Commit;
end;

function TDM.VerificaCaixaAberto: boolean;
begin
  //
        if ( DM.VerificadoReducaoAutomatica ) and ( not NaoVerifica)  then // TEVE redução Automática
              begin
                 KDialog( 'O ECF emitiu uma redução automáticamente!' + #13+
                 'Mapa Resumo será executado', 'SLPDV - Informação', 'INFO' );
                 GravaReducaoZAutomatica;
              end;

  if IBTransaction.Active then
    IBTransaction.Commit;
  IBTransaction.StartTransaction;

  QConsulta.close;
  QConsulta.sql.Text :=
    'select * from ABRE_FECHA_CAIXA where DATA_ABRE=:DATAA AND COD_EMP=:EMP and COD_CAI=:CAI';
  QConsulta.Parambyname('DATAA').AsDate := date;
  QConsulta.Parambyname('EMP').AsInteger := iEmp;
  QConsulta.Parambyname('CAI').AsInteger := iCaixa;
  QConsulta.open;
  if QConsulta.IsEmpty then
    result := False
  else
    result := true;
  QConsulta.close;
  IBTransaction.Commit;
end;

function TDM.VerificadoReducaoAutomatica: Boolean;
var
   DReducao: TDateTime;
   DTolerancia: string;
   DHoraAntes: TDateTime;
   DHoraDepois: TDateTime;
   DataHoraBase: TDateTime;
begin
//
   Result := False;
   Exit;
   if dm.ECF.Estado = estRequerZ then
      begin
         Result := False;
         exit;
      end;
   if DM.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

    dm.QConsulta.Close;
    dm.QConsulta.SQL.Text := 'Select FIRST 1 DATA_EMISSAO, HORA_EMISSAO from MAPA_RESUMO where '+
    'CHECKOUT=:CAIXA and COD_EMP=:COD_EMP order by DATA_EMISSAO DESC';
    dm.QConsulta.ParamByName( 'CAIXA' ).AsInteger := iCaixa;
    dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
       begin
          Result := False;
         exit;
       end;
    DReducao := dm.ECF.DataHoraUltimaReducaoZ;
    DTolerancia := '00:20:00';
    DHoraAntes :=  DReducao  - StrToTime( DTolerancia );
    DHoraDepois :=  DReducao  + StrToTime( DTolerancia );


    DataHoraBase := StrToDateTime( dm.QConsulta.FieldByName( 'DATA_EMISSAO' ).AsString + ' ' +
         dm.QConsulta.FieldByName( 'HORA_EMISSAO' ).AsString );
    if not (  (  DataHoraBase < DHoraDepois ) and ( DataHoraBase > DHoraAntes )  )  then
       result := True
     else
       Result := False;


    dm.QConsulta.Close;
    //if dm then


   dm.IBTransaction.Commit;
end;

procedure TDM.SetMainForm(FormAtivo: TForm);
var
  TmpMain: ^TCustomForm;
begin
  TmpMain := @Application.Mainform;
  TmpMain^ := FormAtivo;
end;

function TDM.Verifica_Alteracao_R01(cod_emp, CODCAI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R01(:CODEMP, :CODCAI );';
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODCAI').AsInteger := CODCAI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

// SP_VERIFICA_ALTERACAO_R02

function TDM.Verifica_Alteracao_R02(COD_MAP, cod_emp, CODCAI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R02(:CODMAPA,:CODEMP, :CODCAI );';
  QBlocoVII.Parambyname('CODMAPA').AsInteger := COD_MAP;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODCAI').AsInteger := CODCAI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

function TDM.Verifica_Alteracao_R03(COD_MAP, cod_grp, cod_emp,
  CODCAI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R03(:CODMAPA,:CODGRP,:CODEMP, :CODCAI );';
  QBlocoVII.Parambyname('CODGRP').AsInteger := cod_grp;
  QBlocoVII.Parambyname('CODMAPA').AsInteger := COD_MAP;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODCAI').AsInteger := CODCAI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

{ SP_VERIFICA_ALTERACAO_R04COD_CAI integer,
  COD_EMP integer,
  COD_VEN integer,
  COD_CLI integer) }
function TDM.Verifica_Alteracao_R04(cod_cai, cod_emp, COD_VEN,
  COD_CLI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R04(:CODCAI, :CODEMP, ' +
    ':CODVEN, :CODCLI );';
  QBlocoVII.Parambyname('CODCAI').AsInteger := cod_cai;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODVEN').AsInteger := COD_VEN;
  QBlocoVII.Parambyname('CODCLI').AsInteger := COD_CLI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

/// /SP_VERIFICA_ALTERACAO_R05
///
function TDM.Verifica_Alteracao_R05(cod_emp, cod_cai, COD_PRO, COD_VEN,
  ORDEM: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R05(:CODEMP, :CODCAI, ' +
    ':CODPRO, :CODVEN, :ORDEM );';
  QBlocoVII.Parambyname('CODCAI').AsInteger := cod_cai;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODVEN').AsInteger := COD_VEN;
  QBlocoVII.Parambyname('CODPRO').AsInteger := COD_PRO;
  QBlocoVII.Parambyname('ORDEM').AsInteger := ORDEM;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

// SP_VERIFICA_ALTERACAO_R07
function TDM.Verifica_Alteracao_R07(cod_emp, cod_cai, CODIGO: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R07(:CODEMP, :CODCAI, ' + ':CODIGO );';
  QBlocoVII.Parambyname('CODCAI').AsInteger := cod_cai;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODIGO').AsInteger := CODIGO;

  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

// SP_VERIFICA_ALTERACAO_R06
function TDM.Verifica_Alteracao_R06(CODIGO, cod_emp, cod_cai: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_R06(:CODIGO, :CODEMP, ' + ':CODCAI );';
  QBlocoVII.Parambyname('CODCAI').AsInteger := cod_cai;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODIGO').AsInteger := CODIGO;

  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

// INCLUSAO EXCLUSAO
function TDM.Verifica_IncExc_R01(D1, D2: Tdate): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select ALTERADO from SP_VERIFICA_INCEXC_R01( :D1, :D2 )';
  QBlocoVII.Parambyname('D1').AsDate := D1;
  QBlocoVII.Parambyname('D2').AsDate := D2;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := False
  else
    result := true;

  TRBlocoVII.Commit;
end;

procedure TDM.BuscaParametrosConf;
var
   LIDO: String;
   I: Integer;
begin
   LIDO := Cr( LeIni( GetCurrentDir + '\PafEcf.ini', 'OUTROS', 'STRING' ), '4525' );
   if Length( LIDO ) > 3 then
      begin
         KDialog( 'Parametros de configuração inconsistentes!', 'SLPDV - Configuração', 'ERRO' );
         Application.Terminate;

      end;
   for I := 1 to 3 do
       begin
          if not ( ( LIDO[I] = 'S' ) or ( LIDO[I] = 'N' ) ) then
             begin
                 KDialog( 'Parametros de configuração inconsistentes!', 'SLPDV - Configuração', 'ERRO' );
                 Application.Terminate;
             end;

       end;

  TemDAVAnexoII := ( LIDO[1] = 'S' );
  TemCupomMania := ( LIDO[2] = 'S' );
  TemMinasLegal := ( LIDO[3] = 'S' );
end;


procedure TDM.ScaleForm (F: TForm; TelaInteira: Boolean) ;
procedure ModifyFontsFor(ctrl: TWinControl);
  procedure ModifyFont(ctrl: TControl);
  var
    f: TFont;

  begin
    if IsPublishedProp(ctrl, 'Parentfont')
      and (GetOrdProp(ctrl, 'Parentfont') = Ord(false))
      and  IsPublishedProp(ctrl, 'font')
      then begin
               f := TFont(GetObjectProp(ctrl, 'font', TFont));
               f.Size := Round( ( F.Size * ( ( PW + PH ) /2 ) ) /100 );
           end;

  end;
var
  i: Integer;
begin
  ModifyFont(ctrl);
  for i := 0 to ctrl.controlcount - 1 do
    if ctrl.controls[i] is Twincontrol then
      ModifyFontsfor(TWincontrol(ctrl.controls[i]))
    else
      Modifyfont(ctrl.controls[i]);
end;

var
ScreenRatio : Double;
I, I2: Integer;
Tam: Double;
propInfo : PPropInfo;
begin
  ScreenRatio := Screen.Height / Screen.Width;
  F.Scaled := True;
  F.AutoScroll := false;
  F.position := poDesigned;
 // F.Font.Name := 'Arial';
  if TelaInteira then
     begin
        F.Left := 0;
        F.Top := 0;
        F.Height := Round( ( F.Height * PH ) /100 );
        F.Width := Round(  (F.Width * Pw ) / 100 );
     end
  else
      begin
        if ScreenRatio >= 0.75 then
           begin
              if PW < 90 then
                      F.Height := Round( ( F.Height *  ( Pw  + 10 )) /100 )
              else
                      F.Height := Round( ( F.Height *  ( Pw  )) /100 )
           end
        else
        F.Height := Round( ( F.Height * ( ( PW + PH ) /2) )  /100 );
        F.Width := Round(  (F.Width * PW )   / 100 );
        F.Left := ( Screen.Width - F.Width ) div 2;
        F.Top := ( Screen.Height - F.Height ) div 2;
      end;
  if ScreenRatio >= 0.75 then
     begin
                for i := F.componentCount - 1 downto 0 do
            begin

                if ( F.Components[I] is TWinControl  )and not ( F.Components[I] is TListView) then
                   begin
//                      TWinControl( F.Components[I] ).Font.Size := (screen.width DIV ScreenWidth) * TCurrencyEdit( F.Components[I] ).font.size;
                      TWinControl( F.Components[I] ).Height := Round(( TWinControl( F.Components[I] ).Height * PH ) /100);
                      TWinControl( F.Components[I] ).Width := Round(( TWinControl( F.Components[I] ).Width * Pw ) /100);
                      TWinControl( F.Components[I] ).Top :=  Round(( TWinControl( F.Components[I] ).Top * Ph ) /100);
                      TWinControl( F.Components[I] ).Left :=  Round(( TWinControl( F.Components[I] ).Left * Pw ) /100);

                   end else
                if ( F.Components[I] is TControl  ) and not ( F.Components[I] is TListView)then
                   begin
//                      TWinControl( F.Components[I] ).Font.Size := (screen.width DIV ScreenWidth) * TCurrencyEdit( F.Components[I] ).font.size;
                      TControl( F.Components[I] ).Height := Round(( TControl( F.Components[I] ).Height * PH ) /100);
                      TControl( F.Components[I] ).Width := Round(( TControl( F.Components[I] ).Width * Pw ) /100);
                      TControl( F.Components[I] ).Top :=  Round(( TControl( F.Components[I] ).Top * Ph ) /100);
                      TControl( F.Components[I] ).Left :=  Round(( TControl( F.Components[I] ).Left * Pw ) /100);
                   end;
                 if ( f.Components[I] is TLabel )  then
                    begin
                       TLabel( f.Components[I] ).Font.Size :=
                       Round( ( TLabel( f.Components[I] ).Font.Size * pw ) / 100 );
                    end;

                 if ( f.Components[I] is TsAlphaImageList ) then
                    begin
                      if not ( F.Components[I].Name = 'ImagensMesas'  ) then
                         begin
                             TsAlphaImageList( f.Components[I] ).Width :=
                                Round( ( TsAlphaImageList( f.Components[I] ).Width * ( ( Pw + Ph )/ 2 ) / 100 ) );
                             TsAlphaImageList( f.Components[I] ).Height :=
                                Round( ( TsAlphaImageList( f.Components[I] ).Height * ( ( Pw + Ph )/ 2 ) / 100 ) );
                         end;

                    end;

                if ( F.Components[I] is TDBGrid  ) then
                   begin
                      TDBGrid( F.Components[I] ).TitleFont.Size :=
                      Round( (  TDBGrid( F.Components[I] ).TitleFont.Size * ( ( Pw + ph) / 2 ) / 100 )  );

                      for I2 := 0 to TDBGrid( F.Components[I] ).Columns.Count - 1 do
                         begin
                          TDBGrid( F.Components[I] ).Columns.Items[I2].Width :=
                           Round( (  TDBGrid( F.Components[I] ).Columns.Items[I2].Width * PW ) / 100 );
                      //    TDBGrid( F.Components[I] ).Font.Size := Round( TDBGrid( F.Components[I] ).Font.Size * ( ( PW + Ph ) / 2) /100 );
                         end;
                   end;
                if ( F.Components[I] is TStatusBar  ) then
                   begin
                      for I2 := 0 to TStatusBar( F.Components[I] ).Panels.Count - 1 do
                          TStatusBar( F.Components[I] ).Panels.Items[I2].Width :=
                          Round( ( TStatusBar( F.Components[I] ).Panels.Items[I2].Width * PW ) / 100  ) ;
                   end;
                if ( f.Components[I] is TListView ) then
                   begin
                       TListView( F.Components[I] ).Height := Round(( TListView( F.Components[I] ).Height * PH ) /100);
                       TListView( F.Components[I] ).Width := Round(( TListView( F.Components[I] ).Width * Pw ) /100);
//                       TListView( F.Components[I] ).Top :=  Round(( TListView( F.Components[I] ).Top * Ph ) /100);
   //                    TListView( F.Components[I] ).Left :=  Round(( TListView( F.Components[I] ).Left * Pw ) /100);

                   end;

             end;

     end
  else
     begin
        for i := F.componentCount - 1 downto 0 do
            begin
                if ( F.Components[I] is TWinControl ) and not ( F.Components[I] is TListView) then
                   begin
//                      TWinControl( F.Components[I] ).Font.Size := (screen.width DIV ScreenWidth) * TCurrencyEdit( F.Components[I] ).font.size;
                      TWinControl( F.Components[I] ).Height := Round(( TWinControl( F.Components[I] ).Height * PH ) /100);
                      TWinControl( F.Components[I] ).Width := Round(( TWinControl( F.Components[I] ).Width * Pw ) /100);
                      TWinControl( F.Components[I] ).Top :=  Round(( TWinControl( F.Components[I] ).Top * Ph ) /100);
                      TWinControl( F.Components[I] ).Left :=  Round(( TWinControl( F.Components[I] ).Left * Pw ) /100);

                   end else
                if ( F.Components[I] is TControl  ) and not ( F.Components[I] is TListView) then
                   begin
//                      TWinControl( F.Components[I] ).Font.Size := (screen.width DIV ScreenWidth) * TCurrencyEdit( F.Components[I] ).font.size;
                      TControl( F.Components[I] ).Height := Round(( TControl( F.Components[I] ).Height * PH ) /100);
                      TControl( F.Components[I] ).Width := Round(( TControl( F.Components[I] ).Width * Pw ) /100);
                      TControl( F.Components[I] ).Top :=  Round(( TControl( F.Components[I] ).Top * Ph ) /100);
                      TControl( F.Components[I] ).Left :=  Round(( TControl( F.Components[I] ).Left * Pw ) /100);
                   end;

                 if ( f.Components[I] is TsAlphaImageList ) then
                    begin
                      if not ( F.Components[I].Name = 'ImagensMesas'  ) then
                         begin
                             TsAlphaImageList( f.Components[I] ).Width :=
                                Round( ( TsAlphaImageList( f.Components[I] ).Width * ( ( Pw + Ph )/ 2 ) / 100 ) );
                             TsAlphaImageList( f.Components[I] ).Height :=
                                Round( ( TsAlphaImageList( f.Components[I] ).Height * ( ( Pw + Ph )/ 2 ) / 100 ) );
                         end;
                    end;

                if ( F.Components[I] is TDBGrid  ) then
                   begin
                      TDBGrid( F.Components[I] ).TitleFont.Size :=
                      Round( (  TDBGrid( F.Components[I] ).TitleFont.Size * ( ( Pw + ph) / 2 ) / 100 )  );

                      for I2 := 0 to TDBGrid( F.Components[I] ).Columns.Count - 1 do
                         begin
                          TDBGrid( F.Components[I] ).Columns.Items[I2].Width :=
                           Round( (  TDBGrid( F.Components[I] ).Columns.Items[I2].Width * PW ) / 100 );
//                          TDBGrid( F.Components[I] ).Font.Size := Round( TDBGrid( F.Components[I] ).Font.Size * ( ( PW + Ph ) / 2) /100 );
                         end;
                   end;
                if ( F.Components[I] is TStatusBar  ) then
                   begin
                      for I2 := 0 to TStatusBar( F.Components[I] ).Panels.Count - 1 do
                          TStatusBar( F.Components[I] ).Panels.Items[I2].Width :=
                          Round( ( TStatusBar( F.Components[I] ).Panels.Items[I2].Width * PW ) / 100  ) ;
                   end;
                if ( f.Components[I] is TListView ) then
                   begin
                       TListView( F.Components[I] ).Height := Round(( TListView( F.Components[I] ).Height * PH ) /100);
                       TListView( F.Components[I] ).Width := Round(( TListView( F.Components[I] ).Width * Pw ) /100);
                     //  TListView( F.Components[I] ).Top :=  Round(( TListView( F.Components[I] ).Top * Ph ) /100);
                       //TListView( F.Components[I] ).Left :=  Round(( TListView( F.Components[I] ).Left * Pw ) /100);

                   end;

             end;

     end;
  ModifyFontsFor( F );
end;






end.


