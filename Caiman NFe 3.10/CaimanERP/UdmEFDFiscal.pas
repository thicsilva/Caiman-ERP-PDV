unit UdmEFDFiscal;

interface

uses
  SysUtils, Classes, ACBrSpedFiscal, DB, Forms, ACBrEFDBlocos, ACBrUtil, 
  ACBrTXTClass, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TdmEFDFiscal = class(TDataModule)
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    TRFiscal: TFDTransaction;
    QEmpresa: TFDQuery;
    QEmpresaCOD_EMP: TIntegerField;
    QEmpresaRAZAO_EMP: TStringField;
    QEmpresaEND_EMP: TStringField;
    QEmpresaBAI_EMP: TStringField;
    QEmpresaCID_EMP: TStringField;
    QEmpresaCEP_EMP: TStringField;
    QEmpresaEST_EMP: TStringField;
    QEmpresaINSC_EMP: TStringField;
    QEmpresaTEL_EMP: TStringField;
    QEmpresaFAX_EMP: TStringField;
    QEmpresaNOME_EMP_ETIQUETA: TStringField;
    QEmpresaNUMERO_EMP: TStringField;
    QEmpresaRESP_EMP: TStringField;
    QEmpresaCAMINHO_FOTO_EMP: TStringField;
    QEmpresaFANTASIA_EMP: TStringField;
    QEmpresaMOSTRAR_SITCLI_PREVENDA: TStringField;
    QEmpresaCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    QEmpresaTIPO_EMP: TIntegerField;
    QEmpresaTIPO_CARGA_BALANCA: TIntegerField;
    QEmpresaCNPJ_EMP: TStringField;
    QEmpresaCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    QEmpresaINSCRICAO_MUNICIPAL: TStringField;
    QEmpresaPERFIL_EFD: TStringField;
    QEmpresaCODIGO_MUNICIPIO: TStringField;
    QEmpresaTIPO_ATIVIDADE_EFD: TIntegerField;
    QEmpresaNOME_CONTADOR: TStringField;
    QEmpresaCPF_CONTADOR: TStringField;
    QEmpresaCRC_CONTADOR: TStringField;
    QEmpresaCNPJ_CONTADOR: TStringField;
    QEmpresaCEP_CONTADOR: TStringField;
    QEmpresaEND_CONTADOR: TStringField;
    QEmpresaNUMERO_CONTADOR: TStringField;
    QEmpresaBAIRRO_CONTADOR: TStringField;
    QEmpresaTEL_CONTADOR: TStringField;
    QEmpresaFAX_CONTADOR: TStringField;
    QEmpresaCODIGO_MUNICIPIO_CONTADOR: TStringField;
    QClientes_0150: TFDQuery;
    QClientes_0150COD_CLI: TIntegerField;
    QClientes_0150NOME_CLI: TStringField;
    QClientes_0150PAIS: TStringField;
    QClientes_0150CNPJ_CLI: TStringField;
    QClientes_0150INSC_ESTADUAL: TStringField;
    QClientes_0150CODIGO_IBGE: TIntegerField;
    QClientes_0150ENDRES_CLI: TStringField;
    QClientes_0150NUMRES_CLI: TStringField;
    QClientes_0150OBS_CLI: TStringField;
    QClientes_0150BAIRES_CLI: TStringField;
    QFornec_0150: TFDQuery;
    QFornec_0150COD_FOR: TIntegerField;
    QFornec_0150RAZAO_FOR: TStringField;
    QFornec_0150PAIS: TStringField;
    QFornec_0150CNPJ_FOR: TStringField;
    QFornec_0150INSC_FOR: TStringField;
    QFornec_0150CODIGO_IBGE: TIntegerField;
    QFornec_0150END_FOR: TStringField;
    QFornec_0150NUM_FOR: TStringField;
    QFornec_0150BAI_FOR: TStringField;
    QMedidas: TFDQuery;
    QMedidasCODIGO: TIntegerField;
    QMedidasDESCRICAO: TStringField;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosCODIGO_BARRA_PRO: TStringField;
    QProdutosTIPO_PRODUCAO: TStringField;
    QProdutosNOME_PRO: TStringField;
    QProdutosCOD_NCM: TStringField;
    QProdutosALIQUOTA_GRP: TBCDField;
    QProdutosDESCRICAO: TStringField;
    QProdutosEFD_TIPO: TStringField;
    Itens_NFSAIDA: TFDQuery;
    NFSaidas: TFDQuery;
    NFSaidasCOD_NF: TIntegerField;
    NFSaidasCOD_EMP: TIntegerField;
    NFSaidasNUMERO_NOTA_NF: TIntegerField;
    NFSaidasDATA_EMISSAO_NF: TDateField;
    NFSaidasDATA_SAIDA_NF: TDateField;
    NFSaidasHORA_SAIDA_NF: TTimeField;
    NFSaidasCOD_TRA: TIntegerField;
    NFSaidasBASE_CALCULO_ICMS_NF: TBCDField;
    NFSaidasVALOR_ICMS_NF: TBCDField;
    NFSaidasBASE_SUBST_NF: TBCDField;
    NFSaidasVALOR_SUBST_NF: TBCDField;
    NFSaidasVALOR_TOTAL_PROD_NF: TBCDField;
    NFSaidasVALOR_FRETE_NF: TBCDField;
    NFSaidasVALOR_SEGURO_NF: TBCDField;
    NFSaidasOUTRAS_DESPESAS_NF: TBCDField;
    NFSaidasVALOR_IPI_NF: TBCDField;
    NFSaidasVALOR_TOTAL_NF: TBCDField;
    NFSaidasESPECIE_NF: TStringField;
    NFSaidasMARCA_NF: TStringField;
    NFSaidasNUMERO_NF: TStringField;
    NFSaidasINF_COMPL_NF: TWideMemoField;
    NFSaidasCANCELADA_NF: TStringField;
    NFSaidasFRETE_CONTA_NF: TStringField;
    NFSaidasCOD_CLI: TIntegerField;
    NFSaidasCOD_FOR: TIntegerField;
    NFSaidasDESCONTO_NF: TBCDField;
    NFSaidasTIPO_CLIENTE: TStringField;
    NFSaidasNOTA_IMPRESSA: TStringField;
    NFSaidasCOD_VENDA: TIntegerField;
    NFSaidasCOD_TPV: TIntegerField;
    NFSaidasSERIE_NOTA: TStringField;
    NFSaidasTIPO_NOTA_FISCAL: TIntegerField;
    NFSaidasCODIFICACAO_FISCAL: TStringField;
    NFSaidasCODIGO_OUTRA_ENTRADA: TIntegerField;
    NFSaidasCODIGO_OUTRA_SAIDA: TIntegerField;
    NFSaidasCHAVE_ACESSO_NFE: TStringField;
    NFSaidasPROTOCOLO_NFE: TStringField;
    NFSaidasSTATUS_TRANSMITIDA: TStringField;
    NFSaidasSTATUS_RETORNO: TStringField;
    NFSaidasSTATUS_CANCELADO: TStringField;
    NFSaidasSTATUS_INUTILIZADO: TStringField;
    NFSaidasSTATUS_EMAIL: TStringField;
    NFSaidasJUSTIFICATIVA_CANCEL_INUTIL: TStringField;
    NFSaidasPLACA_TRANSP: TStringField;
    NFSaidasUF_PLACA_TRANSP: TStringField;
    NFSaidasPESO_BRUTO_NF: TBCDField;
    NFSaidasPESO_LIQUIDO_NF: TBCDField;
    NFSaidasQUANTIDADE_NF: TIntegerField;
    NFSaidasCHAVE2: TStringField;
    NFSaidasDEPEC: TIntegerField;
    NFSaidasVALOR_PIS: TBCDField;
    NFSaidasVALOR_COFINS: TBCDField;
    NFSaidasCORRECAO: TStringField;
    QEmpresaVERSAO_EFD: TIntegerField;
    C190_ITENS: TFDQuery;
    C190_ITENSCST: TStringField;
    C190_ITENSCFO: TIntegerField;
    C190_ITENSALIQ: TBCDField;
    C190_ITENSTOTAL: TBCDField;
    C190_ITENSBC_ICMS: TBCDField;
    C190_ITENSICMS: TBCDField;
    C190_ITENSBC_SUBS: TBCDField;
    C190_ITENSSUBS: TBCDField;
    C190_ITENSREDUCAO: TBCDField;
    C190_ITENSIPI: TBCDField;
    NFEntradas: TFDQuery;
    NFEntradasCOD_ENT: TIntegerField;
    NFEntradasCOD_EMP: TIntegerField;
    NFEntradasDATAEMI_ENT: TDateField;
    NFEntradasDATAENT_ENT: TDateField;
    NFEntradasCOD_FOR: TIntegerField;
    NFEntradasTOTAL_ENT: TBCDField;
    NFEntradasACRES_ENT: TBCDField;
    NFEntradasDESC_ENT: TBCDField;
    NFEntradasFRETE_ENT: TBCDField;
    NFEntradasICMSFRETE_ENT: TBCDField;
    NFEntradasTIPO_ENT: TStringField;
    NFEntradasNUMNF_ENT: TStringField;
    NFEntradasSERIE_ENT: TStringField;
    NFEntradasBASE_SUB_TRIB: TBCDField;
    NFEntradasVALOR_ICMS_SUB: TBCDField;
    NFEntradasFRETE_INCLUSO: TStringField;
    NFEntradasICMS_SUB_INCLUSO: TStringField;
    NFEntradasTOTAL_PRODUTOS: TBCDField;
    NFEntradasCUSTO_SEM_DESCONTO: TStringField;
    NFEntradasCODIFICACAO_FISCAL: TStringField;
    NFEntradasCODIGO_ES: TIntegerField;
    NFEntradasCHAVE_NFE: TStringField;
    NFEntradasVALOR_PIS: TBCDField;
    NFEntradasVALOR_COFINS: TBCDField;
    NFEntradasCODIGO_ESTADO: TStringField;
    NFEntradasBC_ICMS: TBCDField;
    NFEntradasVL_ICMS: TBCDField;
    NFEntradasVL_IPI: TBCDField;
    NFEntradasVL_SEG: TBCDField;
    Itens_NFEntradas: TFDQuery;
    C190_ENTRADA: TFDQuery;
    C190_ENTRADACST: TStringField;
    C190_ENTRADACFO: TIntegerField;
    C190_ENTRADAPERC_ICMS: TBCDField;
    C190_ENTRADATOTAL: TBCDField;
    C190_ENTRADABC_ICMS: TBCDField;
    C190_ENTRADAICMS: TBCDField;
    C190_ENTRADABC_SUBS: TBCDField;
    C190_ENTRADASUBS: TBCDField;
    C190_ENTRADAREDUCAO: TFMTBCDField;
    C190_ENTRADAIPI: TBCDField;
    QCaixa: TFDQuery;
    QCaixaCOD_CAI: TIntegerField;
    QCaixaR01_MODELO_ECF: TStringField;
    QCaixaR01_NUMERO_SERIE: TStringField;
    QCaixaR01_NUMERO_USUARIO: TIntegerField;
    QCaixaMODELO: TStringField;
    Reducoes: TFDQuery;
    ReducoesDATA: TDateField;
    ReducoesCRO: TIntegerField;
    ReducoesCRZ: TIntegerField;
    ReducoesCOO_FINAL: TIntegerField;
    ReducoesGT_FINAL: TBCDField;
    ReducoesVENDA_BRUTA: TBCDField;
    Totalizadores: TFDQuery;
    TotalizadoresCOD_GRP: TIntegerField;
    TotalizadoresVALOR: TBCDField;
    TotalizadoresINDICE_R03: TStringField;
    ReducoesCODIGO: TIntegerField;
    ITENS_TOTALIZADORES: TFDQuery;
    VendasC460: TFDQuery;
    VendasC460COD_VEN: TIntegerField;
    VendasC460DATA_VEN: TDateField;
    VendasC460COD_EMP: TIntegerField;
    VendasC460COD_CAI: TIntegerField;
    VendasC460COD_CLI: TIntegerField;
    VendasC460DESCONTO_VEN: TBCDField;
    VendasC460COD_TPV: TIntegerField;
    VendasC460TOTAL_VEN: TBCDField;
    VendasC460CUPOM_FISCAL_VEN: TIntegerField;
    VendasC460TOTAL_CUSTO_VEN: TBCDField;
    VendasC460DATA_HORA_VEN: TSQLTimeStampField;
    VendasC460DESC_PESSOA_AUTORIZADA: TStringField;
    VendasC460COD_NF: TIntegerField;
    VendasC460COD_USU: TIntegerField;
    VendasC460CANCELADA_VEN: TIntegerField;
    VendasC460CODIGO_PAF: TIntegerField;
    VendasC460R04_CCF: TIntegerField;
    VendasC460R04_NOME_CLIENTE: TStringField;
    VendasC460R04_CNPJ_CLIENTE: TStringField;
    VendasC460NUMERO_NOTA_FISCAL: TIntegerField;
    VendasC460COD_VEND: TIntegerField;
    VendasC460SERIE_NOTA_FISCAL: TStringField;
    VendasC460CODIFICACAO_FISCAL: TStringField;
    VendasC460CER: TIntegerField;
    VendasC460CONSIGNADA: TStringField;
    VendasC460IMPORTADO_NFE: TStringField;
    ItensC470: TFDQuery;
    ItensC470COD_VEN: TIntegerField;
    ItensC470COD_PRO: TIntegerField;
    ItensC470ORDEM: TIntegerField;
    ItensC470DESCONTO: TBCDField;
    ItensC470COD_EMP: TIntegerField;
    ItensC470QUANT: TBCDField;
    ItensC470VALOR: TBCDField;
    ItensC470VALOR_CUSTO: TBCDField;
    ItensC470PRODUTO_PROMOCAO: TStringField;
    ItensC470CANCELADO: TIntegerField;
    ItensC470VENDA_CANCELADA: TIntegerField;
    ItensC470COD_VEND: TIntegerField;
    ItensC470STATUS_EXPORTA: TIntegerField;
    ItensC470CST_CF_EST: TStringField;
    ItensC470CFOP_VENDAS_CF_EST: TIntegerField;
    ItensC470ALIQUOTA_GRP: TBCDField;
    ItensC470UNID: TStringField;
    C490: TFDQuery;
    TotalizadoresALIQUOTA_GRP: TBCDField;
    NatOperacao: TFDQuery;
    NatOperacaoCOD_CFO: TIntegerField;
    NatOperacaoNOME_CFO: TStringField;
    NatOperacaoINF_COMPL_NF: TWideMemoField;
    NatOperacaoDESTACA_ICMS: TStringField;
    NatOperacaoSAIR_REL_RESUMO_ALIQ: TStringField;
    NatOperacaoTIPO: TStringField;
    NatOperacaoREGISTRADO_ECF: TStringField;
    NatOperacaoCALCULA_PIS_COFINS: TStringField;
    NatOperacaoUSA_CSOSN: TStringField;
    INVENTARIO_H: TFDQuery;
    INVENTARIO_HCOD_PRO: TIntegerField;
    INVENTARIO_HCUSTO: TBCDField;
    INVENTARIO_HPRECO_VENDA: TBCDField;
    INVENTARIO_HQUANT: TBCDField;
    INVENTARIO_HTOTAL: TFMTBCDField;
    INVENTARIO_HTOTAL_PRECO_VENDA: TFMTBCDField;
    INVENTARIO_HNOME_PRO: TStringField;
    INVENTARIO_HICMS_CF_EST: TIntegerField;
    INVENTARIO_HNOME_GRP: TStringField;
    INVENTARIO_HDESCRICAO: TStringField;
    INVENTARIO_TOTAL: TFDQuery;
    INVENTARIO_TOTALTOTAL_INVENTARIO: TFMTBCDField;
    C490CST: TStringField;
    C490CFOP: TIntegerField;
    C490ALIQ: TBCDField;
    C490TOTAL: TFMTBCDField;
    C490BC_ICMS: TFMTBCDField;
    C490ICMS: TFMTBCDField;
    ITENS_TOTALIZADORESCOD_PRO: TIntegerField;
    ITENS_TOTALIZADORESUNIDADE: TStringField;
    ITENS_TOTALIZADORESQUANT: TBCDField;
    ITENS_TOTALIZADORESVALOR: TFMTBCDField;
    Itens_NFSAIDAORDEM: TIntegerField;
    Itens_NFSAIDACOD_NF: TIntegerField;
    Itens_NFSAIDACST: TStringField;
    Itens_NFSAIDAALIQ: TBCDField;
    Itens_NFSAIDACOD_EMP: TIntegerField;
    Itens_NFSAIDACOD_GRP: TIntegerField;
    Itens_NFSAIDAQUANT: TBCDField;
    Itens_NFSAIDAALIQ_IPI: TBCDField;
    Itens_NFSAIDAREDUCAO_ICMS: TBCDField;
    Itens_NFSAIDACOD_CFO: TIntegerField;
    Itens_NFSAIDASUB_TRIBUTARIA: TStringField;
    Itens_NFSAIDAVR_AGREGADO: TBCDField;
    Itens_NFSAIDAALIQUOTA_FORA_ESTADO: TBCDField;
    Itens_NFSAIDAUNIDADE: TStringField;
    Itens_NFSAIDACOD_PRO: TIntegerField;
    Itens_NFSAIDAVALOR_TOTAL: TBCDField;
    Itens_NFSAIDABASE_CALCULO: TBCDField;
    Itens_NFSAIDAVALOR_ICMS: TBCDField;
    Itens_NFSAIDABASE_SUBTRIB: TBCDField;
    Itens_NFSAIDAVALOR_IPI: TBCDField;
    Itens_NFSAIDAVALOR_SUBTRIB: TBCDField;
    Itens_NFSAIDACLASSIFICACAO_FISCAL: TStringField;
    Itens_NFSAIDAUNIT: TBCDField;
    Itens_NFSAIDAISENTAS: TBCDField;
    Itens_NFSAIDAOUTRAS: TBCDField;
    Itens_NFSAIDAFRETE: TFloatField;
    Itens_NFSAIDADESCONTO: TFloatField;
    Itens_NFSAIDABC_PIS: TBCDField;
    Itens_NFSAIDAALIQ_PIS: TBCDField;
    Itens_NFSAIDAVALOR_PIS: TBCDField;
    Itens_NFSAIDABC_COFINS: TBCDField;
    Itens_NFSAIDAALIQ_COFINS: TBCDField;
    Itens_NFSAIDAVALOR_COFINS: TBCDField;
    Itens_NFSAIDACANCELADO: TIntegerField;
    Itens_NFSAIDANF_CANCELADA: TIntegerField;
    Itens_NFSAIDACST_PIS: TStringField;
    Itens_NFSAIDACST_COFINS: TStringField;
    Itens_NFSAIDACSOSN: TStringField;
    Itens_NFSAIDACST_IPI: TStringField;
    Itens_NFSAIDACOD_PRO_1: TIntegerField;
    Itens_NFSAIDACOD_LAB: TIntegerField;
    Itens_NFSAIDACOD_SEC: TIntegerField;
    Itens_NFSAIDAVALOR_PRO: TBCDField;
    Itens_NFSAIDAPROMOCAO_PRO: TBCDField;
    Itens_NFSAIDACONTROLA_ESTOQUE_PRO: TStringField;
    Itens_NFSAIDACOMISSAO_PRO: TBCDField;
    Itens_NFSAIDAQUANT_UNIDADE_ENTRADA: TBCDField;
    Itens_NFSAIDAESTOQUE_MINIMO_PRO: TBCDField;
    Itens_NFSAIDANOME_PRO: TStringField;
    Itens_NFSAIDADESC_CUPOM: TStringField;
    Itens_NFSAIDAATIVO_PRO: TStringField;
    Itens_NFSAIDAMARGEM_LUCRO_PRO: TBCDField;
    Itens_NFSAIDALOCALIZACAO_PRO: TStringField;
    Itens_NFSAIDAPRODUTO_PESADO_PRO: TStringField;
    Itens_NFSAIDACOD_SETOR: TIntegerField;
    Itens_NFSAIDATECLA_ATALHO_PRO: TIntegerField;
    Itens_NFSAIDAINDICE_RECEITA_PRO: TIntegerField;
    Itens_NFSAIDADIAS_VALIDADE_PRO: TIntegerField;
    Itens_NFSAIDAREFERENCIA_PRO: TStringField;
    Itens_NFSAIDACOMPLEMENTO_PRO: TStringField;
    Itens_NFSAIDAICMS_CONT_EST: TIntegerField;
    Itens_NFSAIDAICMS_CONT_FORA: TIntegerField;
    Itens_NFSAIDAICMS_CF_EST: TIntegerField;
    Itens_NFSAIDAICMS_CF_FORA: TIntegerField;
    Itens_NFSAIDACST_CONT_EST: TStringField;
    Itens_NFSAIDACST_CONT_FORA: TStringField;
    Itens_NFSAIDACST_CF_EST: TStringField;
    Itens_NFSAIDACST_CF_FORA: TStringField;
    Itens_NFSAIDACAMINHO_FOTO_PRO: TStringField;
    Itens_NFSAIDASAIR_TABELA_PRECO: TStringField;
    Itens_NFSAIDACFOP_VENDAS_CONT_EST: TIntegerField;
    Itens_NFSAIDACFOP_VENDAS_CF_EST: TIntegerField;
    Itens_NFSAIDACFOP_VENDAS_CONT_FORA: TIntegerField;
    Itens_NFSAIDACFOP_VENDAS_CF_FORA: TIntegerField;
    Itens_NFSAIDAST_CONT_EST: TStringField;
    Itens_NFSAIDAVR_AGREG_CONT_EST: TBCDField;
    Itens_NFSAIDAIPI_CONT_EST: TBCDField;
    Itens_NFSAIDAIPI_CF_EST: TBCDField;
    Itens_NFSAIDAIPI_CONT_FORA: TBCDField;
    Itens_NFSAIDAIPI_CF_FORA: TBCDField;
    Itens_NFSAIDACOD_NCM: TStringField;
    Itens_NFSAIDACLASSIFICACAO_FISCAL_1: TStringField;
    Itens_NFSAIDACODIGO_TIPO: TIntegerField;
    Itens_NFSAIDACOD_PRODUTO_ESTOQUE: TIntegerField;
    Itens_NFSAIDACOD_GRUPO: TIntegerField;
    Itens_NFSAIDASUB_GRUPO: TIntegerField;
    Itens_NFSAIDAPRECO_PROGRAMADO: TBCDField;
    Itens_NFSAIDAALIQUOTA_PIS: TBCDField;
    Itens_NFSAIDAALIQUOTA_COFINS: TBCDField;
    Itens_NFSAIDAALIQUOTA_IR: TBCDField;
    Itens_NFSAIDAALIQUOTA_CSLL: TBCDField;
    Itens_NFSAIDAALIQUOTA_OUTRAS: TBCDField;
    Itens_NFSAIDAISENTO_PIS_COFINS_PRO: TStringField;
    Itens_NFSAIDAPRECO_CUSTO: TBCDField;
    Itens_NFSAIDACREDITO_ICMS: TBCDField;
    Itens_NFSAIDAPRECO_PRAZO_PRO: TBCDField;
    Itens_NFSAIDATIPO_PRODUCAO: TStringField;
    Itens_NFSAIDACODIGO_BARRA_PRO: TStringField;
    Itens_NFSAIDACODIGO_UNIDADE_SAIDA: TIntegerField;
    Itens_NFSAIDACODIGO_UNIDADE_ENTRADA: TIntegerField;
    Itens_NFSAIDAPRECO_PROGRAMADO_PRAZO: TBCDField;
    Itens_NFSAIDARED_CF_EST: TBCDField;
    Itens_NFSAIDARED_CF_FORA: TBCDField;
    Itens_NFSAIDARED_CONT_EST: TBCDField;
    Itens_NFSAIDARED_CONT_FORA: TBCDField;
    Itens_NFSAIDADATA_VALIDADE: TDateField;
    Itens_NFSAIDACODIGO_SETOR_ESTOQUE: TIntegerField;
    Itens_NFSAIDAORIG: TIntegerField;
    Itens_NFSAIDACSOSN_1: TStringField;
    Itens_NFSAIDAIPI: TFloatField;
    Itens_NFSAIDAICMS: TFloatField;
    Itens_NFSAIDARICMS: TFloatField;
    Itens_NFSAIDAIVA: TFloatField;
    Itens_NFSAIDAPIS: TFloatField;
    Itens_NFSAIDACONFINS: TFloatField;
    Itens_NFSAIDATAMANHO: TStringField;
    Itens_NFSAIDACOR: TStringField;
    Itens_NFSAIDAOBS: TMemoField;
    Itens_NFSAIDACST_PIS_1: TStringField;
    Itens_NFSAIDACST_COFINS_1: TStringField;
    Itens_NFSAIDACST_IPI_1: TStringField;
    Itens_NFSAIDAULTIMA_ALTERACAO: TDateField;
    Itens_NFSAIDAVALOR_ATACADO: TBCDField;
    Itens_NFSAIDAALIQ_IBPT_NAC: TBCDField;
    Itens_NFSAIDAALIQ_IBPT_IMP: TBCDField;
    Itens_NFSAIDAFATOR_CONVERSAO: TBCDField;
    Itens_NFSAIDAALERTA_COPA: TStringField;
    Itens_NFSAIDAALERTA_COZINHA: TStringField;
    Itens_NFSAIDAANDROID_VISUALIZA: TStringField;
    Itens_NFSAIDATEMPO_PREPARO: TTimeField;
    Itens_NFSAIDANAO_PERMITE_FRAC: TIntegerField;
    Itens_NFSAIDASABORES: TIntegerField;
    Itens_NFSAIDACEST: TStringField;
    Itens_NFSAIDANCM_EX: TIntegerField;
    Itens_NFEntradasCOD_ENT: TIntegerField;
    Itens_NFEntradasCOD_PRO: TIntegerField;
    Itens_NFEntradasPERC_ICMS: TBCDField;
    Itens_NFEntradasPERC_IPI: TBCDField;
    Itens_NFEntradasQTDUND_ENT: TBCDField;
    Itens_NFEntradasPERC_DESC: TBCDField;
    Itens_NFEntradasPERC_ACRES: TBCDField;
    Itens_NFEntradasCOD_EMP: TIntegerField;
    Itens_NFEntradasVALOR_UNIT_PRO: TBCDField;
    Itens_NFEntradasCUSTO: TBCDField;
    Itens_NFEntradasQTD_PRO: TBCDField;
    Itens_NFEntradasCOD_GRP: TIntegerField;
    Itens_NFEntradasCOD_CFOP: TIntegerField;
    Itens_NFEntradasVALOR_DESCONTO: TBCDField;
    Itens_NFEntradasVALOR_ACRESCIMO: TBCDField;
    Itens_NFEntradasPERC_BCR: TBCDField;
    Itens_NFEntradasCST: TStringField;
    Itens_NFEntradasVALOR_TOTAL: TBCDField;
    Itens_NFEntradasBASE_CALCULO: TBCDField;
    Itens_NFEntradasVALOR_ICMS: TBCDField;
    Itens_NFEntradasORDEM: TIntegerField;
    Itens_NFEntradasPERC_ST: TBCDField;
    Itens_NFEntradasVALOR_SUB_TRIBUTARIA: TBCDField;
    Itens_NFEntradasVALOR_IPI: TBCDField;
    Itens_NFEntradasCODIGO_LOCAL_ESTOQUE: TIntegerField;
    Itens_NFEntradasBC_ST: TBCDField;
    Itens_NFEntradasCST_IPI: TStringField;
    Itens_NFEntradasCST_PIS: TStringField;
    Itens_NFEntradasALIQ_PIS: TBCDField;
    Itens_NFEntradasVALOR_PIS: TBCDField;
    Itens_NFEntradasCST_COFINS: TStringField;
    Itens_NFEntradasALIQ_COFINS: TBCDField;
    Itens_NFEntradasVALOR_COFINS: TBCDField;
    Itens_NFEntradasCOD_PRO_1: TIntegerField;
    Itens_NFEntradasCOD_LAB: TIntegerField;
    Itens_NFEntradasCOD_SEC: TIntegerField;
    Itens_NFEntradasVALOR_PRO: TBCDField;
    Itens_NFEntradasPROMOCAO_PRO: TBCDField;
    Itens_NFEntradasCONTROLA_ESTOQUE_PRO: TStringField;
    Itens_NFEntradasCOMISSAO_PRO: TBCDField;
    Itens_NFEntradasQUANT_UNIDADE_ENTRADA: TBCDField;
    Itens_NFEntradasESTOQUE_MINIMO_PRO: TBCDField;
    Itens_NFEntradasNOME_PRO: TStringField;
    Itens_NFEntradasDESC_CUPOM: TStringField;
    Itens_NFEntradasATIVO_PRO: TStringField;
    Itens_NFEntradasMARGEM_LUCRO_PRO: TBCDField;
    Itens_NFEntradasLOCALIZACAO_PRO: TStringField;
    Itens_NFEntradasPRODUTO_PESADO_PRO: TStringField;
    Itens_NFEntradasCOD_SETOR: TIntegerField;
    Itens_NFEntradasTECLA_ATALHO_PRO: TIntegerField;
    Itens_NFEntradasINDICE_RECEITA_PRO: TIntegerField;
    Itens_NFEntradasDIAS_VALIDADE_PRO: TIntegerField;
    Itens_NFEntradasREFERENCIA_PRO: TStringField;
    Itens_NFEntradasCOMPLEMENTO_PRO: TStringField;
    Itens_NFEntradasICMS_CONT_EST: TIntegerField;
    Itens_NFEntradasICMS_CONT_FORA: TIntegerField;
    Itens_NFEntradasICMS_CF_EST: TIntegerField;
    Itens_NFEntradasICMS_CF_FORA: TIntegerField;
    Itens_NFEntradasCST_CONT_EST: TStringField;
    Itens_NFEntradasCST_CONT_FORA: TStringField;
    Itens_NFEntradasCST_CF_EST: TStringField;
    Itens_NFEntradasCST_CF_FORA: TStringField;
    Itens_NFEntradasCAMINHO_FOTO_PRO: TStringField;
    Itens_NFEntradasSAIR_TABELA_PRECO: TStringField;
    Itens_NFEntradasCFOP_VENDAS_CONT_EST: TIntegerField;
    Itens_NFEntradasCFOP_VENDAS_CF_EST: TIntegerField;
    Itens_NFEntradasCFOP_VENDAS_CONT_FORA: TIntegerField;
    Itens_NFEntradasCFOP_VENDAS_CF_FORA: TIntegerField;
    Itens_NFEntradasST_CONT_EST: TStringField;
    Itens_NFEntradasVR_AGREG_CONT_EST: TBCDField;
    Itens_NFEntradasIPI_CONT_EST: TBCDField;
    Itens_NFEntradasIPI_CF_EST: TBCDField;
    Itens_NFEntradasIPI_CONT_FORA: TBCDField;
    Itens_NFEntradasIPI_CF_FORA: TBCDField;
    Itens_NFEntradasCOD_NCM: TStringField;
    Itens_NFEntradasCLASSIFICACAO_FISCAL: TStringField;
    Itens_NFEntradasCODIGO_TIPO: TIntegerField;
    Itens_NFEntradasCOD_PRODUTO_ESTOQUE: TIntegerField;
    Itens_NFEntradasCOD_GRUPO: TIntegerField;
    Itens_NFEntradasSUB_GRUPO: TIntegerField;
    Itens_NFEntradasPRECO_PROGRAMADO: TBCDField;
    Itens_NFEntradasALIQUOTA_PIS: TBCDField;
    Itens_NFEntradasALIQUOTA_COFINS: TBCDField;
    Itens_NFEntradasALIQUOTA_IR: TBCDField;
    Itens_NFEntradasALIQUOTA_CSLL: TBCDField;
    Itens_NFEntradasALIQUOTA_OUTRAS: TBCDField;
    Itens_NFEntradasISENTO_PIS_COFINS_PRO: TStringField;
    Itens_NFEntradasPRECO_CUSTO: TBCDField;
    Itens_NFEntradasCREDITO_ICMS: TBCDField;
    Itens_NFEntradasPRECO_PRAZO_PRO: TBCDField;
    Itens_NFEntradasTIPO_PRODUCAO: TStringField;
    Itens_NFEntradasCODIGO_BARRA_PRO: TStringField;
    Itens_NFEntradasCODIGO_UNIDADE_SAIDA: TIntegerField;
    Itens_NFEntradasCODIGO_UNIDADE_ENTRADA: TIntegerField;
    Itens_NFEntradasPRECO_PROGRAMADO_PRAZO: TBCDField;
    Itens_NFEntradasRED_CF_EST: TBCDField;
    Itens_NFEntradasRED_CF_FORA: TBCDField;
    Itens_NFEntradasRED_CONT_EST: TBCDField;
    Itens_NFEntradasRED_CONT_FORA: TBCDField;
    Itens_NFEntradasDATA_VALIDADE: TDateField;
    Itens_NFEntradasCODIGO_SETOR_ESTOQUE: TIntegerField;
    Itens_NFEntradasORIG: TIntegerField;
    Itens_NFEntradasCSOSN: TStringField;
    Itens_NFEntradasIPI: TFloatField;
    Itens_NFEntradasICMS: TFloatField;
    Itens_NFEntradasRICMS: TFloatField;
    Itens_NFEntradasIVA: TFloatField;
    Itens_NFEntradasPIS: TFloatField;
    Itens_NFEntradasCONFINS: TFloatField;
    Itens_NFEntradasTAMANHO: TStringField;
    Itens_NFEntradasCOR: TStringField;
    Itens_NFEntradasOBS: TMemoField;
    Itens_NFEntradasCST_PIS_1: TStringField;
    Itens_NFEntradasCST_COFINS_1: TStringField;
    Itens_NFEntradasCST_IPI_1: TStringField;
    Itens_NFEntradasULTIMA_ALTERACAO: TDateField;
    Itens_NFEntradasVALOR_ATACADO: TBCDField;
    Itens_NFEntradasALIQ_IBPT_NAC: TBCDField;
    Itens_NFEntradasALIQ_IBPT_IMP: TBCDField;
    Itens_NFEntradasFATOR_CONVERSAO: TBCDField;
    Itens_NFEntradasALERTA_COPA: TStringField;
    Itens_NFEntradasALERTA_COZINHA: TStringField;
    Itens_NFEntradasANDROID_VISUALIZA: TStringField;
    Itens_NFEntradasTEMPO_PREPARO: TTimeField;
    Itens_NFEntradasNAO_PERMITE_FRAC: TIntegerField;
    Itens_NFEntradasSABORES: TIntegerField;
    Itens_NFEntradasCEST: TStringField;
    Itens_NFEntradasNCM_EX: TIntegerField;
    Itens_NFEntradasALIQ_ICMS: TBCDField;
    Itens_NFEntradasUNID: TStringField;
    function ProcessaChave(Chave: String): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure ACBrSPEDFiscal1Error(const MsnError: string);

  private
    { Private declarations }
    EmpresaGerada: Integer;
    FDataIni: TDateTime;
    FDataFim: TDateTime;
    procedure Bloco_0;
    procedure Bloco_C;
    procedure Bloco_D;
    procedure Bloco_E;
    procedure Bloco_G;
    procedure Bloco_H;
    procedure Bloco_1;
    procedure AbreTabelas_Bloco_0;
    procedure FechaTabelas_Bloco_0;
    function FTIPO_ITEM(I: string): TACBrTipoItem;
    function BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
    function BuscaPagENT(COD_NF: Integer): TACBrTipoPagamento;
  public
    SqlMedidas: string;
    SqlProdutos: string;
    CodInventario: Integer;
    data_inv_ini: TDateTime;
    data_inv_fim: TDateTime;
    procedure GeraSped(Cod_emp: Integer; DataIni, DataFim: TDateTime);

    { Public declarations }
  end;

var
  dmEFDFiscal: TdmEFDFiscal;

implementation

uses
  UDM, UDialog, Ubibli1, UfrmSpedFiscal;

{$R *.dfm}
{ TdmEFDFiscal }

procedure TdmEFDFiscal.AbreTabelas_Bloco_0;
begin 
  QClientes_0150.Close;
  QClientes_0150.ParamByName('DATAINI').AsDate := FDataIni;
  QClientes_0150.ParamByName('DATAFIN').AsDate := FDataFim;
  QClientes_0150.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  QClientes_0150.Open;

  QFornec_0150.Close;
  QFornec_0150.ParamByName('DATAINI').AsDate := FDataIni;
  QFornec_0150.ParamByName('DATAFIN').AsDate := FDataFim;
  QFornec_0150.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  QFornec_0150.Open;

  QMedidas.Close;
  QMedidas.SQL.Text := SqlMedidas;
  if ( QEmpresaPERFIL_EFD.AsString <> 'C' ) then
     begin 
        QMedidas.SQL.Add(' OR P.COD_PRO IN (SELECT I.COD_PRO '+
                    ' FROM ITENS_VENDA I'+
                    ' INNER JOIN VENDAS V'+
                    ' ON (I.COD_VEN = V.COD_VEN)'+
                    ' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.TOTAL_VEN > 0 AND I.COD_EMP = :CODEMP'+
                    ' AND I.CANCELADO = 0 AND V.CANCELADA_VEN = 0) ');
     end;
  QMedidas.SQL.Add( ')');
    if ( QEmpresaPERFIL_EFD.AsString <> 'C' ) then
     begin
        QMedidas.SQL.Add( ' or' +
                          ' U.codigo in(' +
                          ' SELECT P2.codigo_unidade_entrada' +
                          ' FROM PRODUTO P2' +
                          ' INNER JOIN GRUPO_ICMS G2' +
                          ' ON (P2.ICMS_CF_EST = G2.COD_GRP)' +
                          ' INNER JOIN UNIDADE_MEDIDA U2' +
                          ' ON (P2.CODIGO_UNIDADE_ENTRADA = U2.CODIGO)' +
                          ' inner join tipo_produto TP2' +
                          ' on ( P2.codigo_tipo = TP2.codigo )' +
                          ' WHERE P2.COD_PRO IN (SELECT IE2.COD_PRO' +
                          '  FROM ITENS_ENTRADA IE2' +
                          '   INNER JOIN ENTRADAS E2' +
                          '   ON (IE2.COD_ENT = E2.COD_ENT)' +
                          '  WHERE E2.DATAENT_ENT BETWEEN :DATAINI' +
                          '  AND :DATAFIN AND IE2.COD_EMP = :CODEMP) )');
     end;
  QMedidas.ParamByName('DATAINI').AsDate := FDataIni;
  QMedidas.ParamByName('DATAFIN').AsDate := FDataFim;
  QMedidas.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  QMedidas.Open;

  QProdutos.Close;
  QProdutos.SQL.Text := SqlProdutos;
  if ( QEmpresaPERFIL_EFD.AsString <> 'C' ) then
     begin 
        QProdutos.SQL.Add(' OR P.COD_PRO IN (SELECT I.COD_PRO '+
                    ' FROM ITENS_VENDA I'+
                    ' INNER JOIN VENDAS V'+
                    ' ON (I.COD_VEN = V.COD_VEN)'+
                    ' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.TOTAL_VEN > 0 AND I.COD_EMP = :CODEMP'+
                    ' AND I.CANCELADO = 0 AND V.CANCELADA_VEN = 0) ');
     end;
  QProdutos.SQL.Add( 'ORDER BY P.COD_PRO' );
  QProdutos.ParamByName('DATAINI').AsDate := FDataIni;
  QProdutos.ParamByName('DATAFIN').AsDate := FDataFim;
  QProdutos.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  QProdutos.Open;

  NFSaidas.Close;
  NFSaidas.ParamByName('DATAINI').AsDate := FDataIni;
  NFSaidas.ParamByName('DATAFIN').AsDate := FDataFim;
  NFSaidas.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  NFSaidas.Open;

  NFEntradas.Close;
  NFEntradas.ParamByName('DATAINI').AsDate := FDataIni;
  NFEntradas.ParamByName('DATAFIN').AsDate := FDataFim;
  NFEntradas.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  NFEntradas.Open;

  QCaixa.Close;
  QCaixa.ParamByName('CODEMP').AsInteger := iEmp;
  QCaixa.ParamByName('DATAINI').AsDate := FDataIni;
  QCaixa.ParamByName('DATAFIN').AsDate := FDataFim;
  QCaixa.Open;

  NatOperacao.Close;
  NatOperacao.ParamByName( 'DATAINI' ).AsDate := FDataIni;
  NatOperacao.ParamByName( 'DATAFIN' ).AsDate := FDataFim;
  NatOperacao.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  NatOperacao.Open;

end;

procedure TdmEFDFiscal.ACBrSPEDFiscal1Error(const MsnError: string);
begin
  frmSpedFiscal.AdicionaItem(MsnError, 0);
  frmSpedFiscal.Errogeracao := True;
end;

procedure TdmEFDFiscal.Bloco_0;
var
  Pasta: String;
  AUX: String;
begin 
  //
  Pasta := ExtractFilePath(Application.exename) + 'SPED_Fiscal\';
  if not DirectoryExists(Pasta) then
    ForceDirectories(Pasta);
  with ACBrSPEDFiscal1 do
  begin 
    DT_INI := FDataIni;
    DT_FIN := FDataFim;
  end;
  ACBrSPEDFiscal1.Path := Pasta;
  ACBrSPEDFiscal1.Arquivo := IntToStr(EmpresaGerada) + 'SPEDFiscal_' +
    FormatDateTime('ddmmyyyy', FDataIni) + '.txt';
  ACBrSPEDFiscal1.IniciaGeracao;
  AbreTabelas_Bloco_0;
  QEmpresa.First;
  with ACBrSPEDFiscal1.Bloco_0 do
  begin 
    // Dados da Empresa
    with Registro0000New do
    begin 
      case QEmpresaVERSAO_EFD.AsInteger of
        1:
          COD_VER := vlVersao103;
        2:
          COD_VER := vlVersao104;
        3:
          COD_VER := vlVersao105;
        4:
          COD_VER := vlVersao108
      else
        COD_VER := High(TACBrCodVer);
      end;
      COD_FIN := raOriginal;
      NOME := QEmpresaRAZAO_EMP.AsString;
      CNPJ := RetiraCaracter(QEmpresaCNPJ_EMP.AsString);
      CPF := '';
      UF := QEmpresaEST_EMP.AsString;
      IE := RetiraCaracter(QEmpresaINSC_EMP.AsString);
      COD_MUN := QEmpresaCODIGO_MUNICIPIO.AsInteger;
      IM := RetiraCaracter(QEmpresaINSCRICAO_MUNICIPAL.AsString);
      SUFRAMA := '';
      if QEmpresaPERFIL_EFD.AsString = 'A' then
        IND_PERFIL := pfPerfilA
      else if QEmpresaPERFIL_EFD.AsString = 'B' then
        IND_PERFIL := pfPerfilB
      else if QEmpresaPERFIL_EFD.AsString = 'C' then
        IND_PERFIL := pfPerfilC;
      case QEmpresaTIPO_ATIVIDADE_EFD.AsInteger of
        0:
          IND_ATIV := atIndustrial;
        1:
          IND_ATIV := atOutros;
      end;
    end;

    with Registro0001New do
    begin 
      IND_MOV := imComDados;

      // FILHO - Dados complementares da Empresa 0005
      with Registro0005New do
      begin 
        FANTASIA := QEmpresaFANTASIA_EMP.AsString;
        CEP := RetiraCaracter(QEmpresaCEP_EMP.AsString);
        ENDERECO := QEmpresaEND_EMP.AsString;
        NUM := QEmpresaNUMERO_EMP.AsString;
        COMPL := '';
        BAIRRO := QEmpresaBAI_EMP.AsString;
        FONE := RetiraCaracter(QEmpresaTEL_EMP.AsString);
        FAX := RetiraCaracter(QEmpresaFAX_EMP.AsString);
        EMAIL := '';
      end;

      /// DADOS CONTADOR 0100
      try
            with Registro0100New do
            begin
              NOME := QEmpresaNOME_CONTADOR.AsString;
              CPF := RetiraCaracter(QEmpresaCPF_CONTADOR.AsString);
              CRC := QEmpresaCRC_CONTADOR.AsString;
              CNPJ := RetiraCaracter(QEmpresaCNPJ_CONTADOR.AsString);
              CEP := RetiraCaracter(QEmpresaCEP_CONTADOR.AsString);
              ENDERECO := QEmpresaEND_CONTADOR.AsString;
              NUM := QEmpresaNUMERO_CONTADOR.AsString;
              COMPL := '';
              BAIRRO := QEmpresaBAIRRO_CONTADOR.AsString;
              FONE := RetiraCaracter(QEmpresaTEL_CONTADOR.AsString);
              FAX := '';
              EMAIL := '171@171.com.br';
              COD_MUN := QEmpresaCODIGO_MUNICIPIO_CONTADOR.AsInteger;
            end;
      except
            KDialog( 'Preencha os dados do contador completos' + sLineBreak +
                     ' Com CRC e COD IBGE e Endereço completo', 'Sped', tdtErro);
      end;

      // CLIENTES 0150
      QClientes_0150.First;
      while not QClientes_0150.Eof do
      begin
        with Registro0150New do
        begin 
          COD_PART := 'C' + QClientes_0150COD_CLI.AsString;
          NOME := QClientes_0150NOME_CLI.AsString;
          COD_PAIS := QClientes_0150PAIS.AsString;
          AUX := Trim(RetiraCaracter(QClientes_0150CNPJ_CLI.AsString));
          if Length(AUX) > 11 then
          begin 
            CNPJ := AUX;
            IE := RetiraCaracter(QClientes_0150INSC_ESTADUAL.AsString);
            CPF := '';
          end
          else
          begin 
            if AUX = '' then
              CPF := '12345678909'
            else
              CPF := AUX;
            CNPJ := '';
            IE := '';
          end;
          COD_MUN := QClientes_0150CODIGO_IBGE.AsInteger;
          SUFRAMA := '';
          ENDERECO := QClientes_0150ENDRES_CLI.AsString;
          NUM := QClientes_0150NUMRES_CLI.AsString;
          COMPL := '';
          BAIRRO := QClientes_0150BAIRES_CLI.AsString;
        end;
        QClientes_0150.Next;
      end;

      // FORNECEDORES 0150
      QFornec_0150.First;
      while not QFornec_0150.Eof do
      begin 
        with Registro0150New do
        begin 
          COD_PART := 'F' + QFornec_0150COD_FOR.AsString;
          NOME := QFornec_0150RAZAO_FOR.AsString;
          COD_PAIS := QFornec_0150PAIS.AsString;
          AUX := Trim(RetiraCaracter(QFornec_0150CNPJ_FOR.AsString));
          if Length(AUX) > 11 then
          begin 
            CNPJ := AUX;
            IE := RetiraCaracter(QFornec_0150INSC_FOR.AsString);
            CPF := '';
          end
          else
          begin 
            if AUX = '' then
              CPF := '12345678909'
            else
              CPF := AUX;
            CNPJ := '';
            IE := '';
          end;
          COD_MUN := QFornec_0150CODIGO_IBGE.AsInteger;
          SUFRAMA := '';
          ENDERECO := QFornec_0150END_FOR.AsString;
          NUM := QFornec_0150NUM_FOR.AsString;
          COMPL := '';
          BAIRRO := QFornec_0150BAI_FOR.AsString;
        end;
        QFornec_0150.Next;
      end;

      // 0190 - UNIDADES MEDIDAS
      QMedidas.First;
      while not QMedidas.Eof do
      begin 
        with Registro0190New do
        begin 
          UNID := QMedidasDESCRICAO.AsString;
          DESCR := 'UNID ' + QMedidasDESCRICAO.AsString;
        end;
        QMedidas.Next;
      end;

      // 0200 - PRODUTOS
      QProdutos.First;
      while not QProdutos.Eof do
      begin 
        with Registro0200New do
        begin 
          COD_ITEM := FormataStringD(QProdutosCOD_PRO.AsString, '8', '0');
          DESCR_ITEM := QProdutosNOME_PRO.AsString;
          COD_BARRA := QProdutosCODIGO_BARRA_PRO.AsString;
//          COD_ANT_ITEM := FormataStringD(QProdutosCOD_PRO.AsString, '8', '0');;
          UNID_INV := QProdutosDESCRICAO.AsString;
          TIPO_ITEM := FTIPO_ITEM(QProdutosEFD_TIPO.AsString);
          COD_NCM := QProdutosCOD_NCM.AsString;
          EX_IPI := '';
          COD_GEN := '';
          COD_LST := '';
          ALIQ_ICMS := QProdutosALIQUOTA_GRP.AsCurrency;
        end;
        QProdutos.Next;
      end;

      NatOperacao.First;
      while not NatOperacao.Eof do
         begin 
            with Registro0400New do
                begin 
                   COD_NAT := NatOperacaoCOD_CFO.AsString;
                   DESCR_NAT := NatOperacaoNOME_CFO.AsString;
                end;
            NatOperacao.Next;
         end;

      // 0450 - INFORMACOES COMPLEMETARES DAS NOTAS FISCAIS
      NFSaidas.First;
      while not NFSaidas.Eof do
      begin 
        if NFSaidasINF_COMPL_NF.AsString <> '' then
        begin 
          with Registro0450New do
          begin 
            COD_INF := 'I' + NFSaidasCOD_NF.AsString;

            TXT :=StringReplace( NFSaidasINF_COMPL_NF.AsString, #13, ' ', [rfReplaceAll] );
            TXT := StringReplace( TXT, #10, ' ', [rfReplaceAll] );
          end;
        end;
        NFSaidas.Next;
      end;

    end;
  end;

  ACBrSPEDFiscal1.WriteBloco_0;

end;

procedure TdmEFDFiscal.Bloco_1;
begin 
  //
  with ACBrSPEDFiscal1.Bloco_1 do
  begin 
    with Registro1001New do
    begin 
      IND_MOV := imComDados;
    end;

    with Registro1010New do
    begin 
      IND_EXP := 'N';
      IND_CCRF := 'N';
      IND_COMB := 'N';
      IND_USINA := 'N';
      IND_VA := 'N';
      IND_EE := 'N';
      IND_CART := 'N';
      IND_FORM := 'N';
      IND_AER := 'N';
    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_1;

end;

procedure TdmEFDFiscal.Bloco_C;
var
  IItens: Integer;
begin 

  with ACBrSPEDFiscal1.Bloco_C do
  begin 
    with RegistroC001New do
    begin 
      if NFSaidas.IsEmpty and NFEntradas.IsEmpty and QCaixa.IsEmpty then
      begin 
        IND_MOV := imSemDados;
        ACBrSPEDFiscal1.WriteBloco_C(True);
        Exit;
      end;
      IND_MOV := imComDados;

      NFSaidas.First;
      while not NFSaidas.Eof do
      begin 
        // C100 - Documento - Nota Fiscal (código 01), Nota Fiscal Avulsa (código 1B), Nota
        // Fiscal de Produtor (código 04) e NF-e (código 55)
        with RegistroC100New do
        begin 
         frmSpedFiscal.AdicionaItem('Processando Nota Saida: ' +
           NFSaidasNUMERO_NOTA_NF.AsString, 6);

           Application.processmessages;
          Sleep(100);
          if NFSaidasTIPO_NOTA_FISCAL.AsInteger < 5 then
            IND_OPER := tpSaidaPrestacao
          else
            IND_OPER := tpEntradaAquisicao;

          IND_EMIT := edEmissaoPropria;

          COD_MOD := Trim(NFSaidasCODIFICACAO_FISCAL.AsString);

          if (NFSaidasCANCELADA_NF.AsString = 'S') or
            (NFSaidasSTATUS_CANCELADO.AsString = 'S') then
            COD_SIT := sdCancelado;

          if (NFSaidasSTATUS_INUTILIZADO.AsString = 'S') then
            COD_SIT := sdDoctoNumInutilizada;

          if ((not NFSaidasCHAVE_ACESSO_NFE.IsNull) and
            (not NFSaidasCHAVE2.IsNull) and (not NFSaidasPROTOCOLO_NFE.IsNull)
            and (NFSaidasSTATUS_CANCELADO.AsString = '')) then
            COD_SIT := sdRegular;

          SER := Trim(NFSaidasSERIE_NOTA.AsString);
          NUM_DOC := FormatFloat('000000000', NFSaidasNUMERO_NOTA_NF.AsInteger);
          //
          if COD_SIT = sdDoctoNumInutilizada then
            CHV_NFE := ''
          else
            CHV_NFE := ProcessaChave(NFSaidasCHAVE_ACESSO_NFE.AsString);
          DT_DOC := NFSaidasDATA_EMISSAO_NF.AsDateTime;
          if NFSaidasDATA_SAIDA_NF.IsNull then
            DT_E_S := NFSaidasDATA_EMISSAO_NF.AsDateTime
          else
            DT_E_S := NFSaidasDATA_SAIDA_NF.AsDateTime;
          if not((COD_SIT = sdCancelado) or
            (COD_SIT = sdDoctoNumInutilizada)) then
          begin 
            if not NFSaidasCOD_CLI.IsNull then
              COD_PART := 'C' + NFSaidasCOD_CLI.AsString
            else
              COD_PART := 'F' + NFSaidasCOD_FOR.AsString;
            VL_DOC := NFSaidasVALOR_TOTAL_NF.AsCurrency;
            //
            IND_PGTO := BuscaPag(NFSaidasCOD_NF.AsInteger);
            VL_DESC := NFSaidasDESCONTO_NF.AsCurrency;
            VL_ABAT_NT := 0;
            VL_MERC := NFSaidasVALOR_TOTAL_PROD_NF.AsCurrency;
            if Trim(NFSaidasFRETE_CONTA_NF.AsString) = '1' then
              IND_FRT := tfPorContaEmitente;
            if Trim(NFSaidasFRETE_CONTA_NF.AsString) = '2' then
              IND_FRT := tfPorContaDestinatario;
            if Trim(NFSaidasFRETE_CONTA_NF.AsString) = '3' then
              IND_FRT := tfPorContaTerceiros;
            if Trim(NFSaidasFRETE_CONTA_NF.AsString) = '4' then
              IND_FRT := tfSemCobrancaFrete;

            VL_FRT := NFSaidasVALOR_FRETE_NF.AsCurrency;
            VL_SEG := NFSaidasVALOR_SEGURO_NF.AsCurrency;
            VL_OUT_DA := NFSaidasOUTRAS_DESPESAS_NF.AsCurrency;
            VL_BC_ICMS := NFSaidasBASE_CALCULO_ICMS_NF.AsCurrency;
            VL_ICMS := NFSaidasVALOR_ICMS_NF.AsCurrency;
            VL_BC_ICMS_ST := NFSaidasBASE_SUBST_NF.AsCurrency;
            VL_ICMS_ST := NFSaidasVALOR_SUBST_NF.AsCurrency;
            VL_IPI := NFSaidasVALOR_IPI_NF.AsCurrency;
            VL_PIS := NFSaidasVALOR_PIS.AsCurrency;
            VL_COFINS := NFSaidasVALOR_COFINS.AsCurrency;

            VL_PIS_ST := 0;
            VL_COFINS_ST := 0;
          end;

          if NFSaidasINF_COMPL_NF.AsString <> '' then
             begin 
                With RegistroC110New do
                   begin 
                      COD_INF :=  'I' + NFSaidasCOD_NF.AsString;
                   end;
             end;

          C190_ITENS.Close;
          C190_ITENS.ParamByName('CODNF').AsInteger := NFSaidasCOD_NF.AsInteger;
          C190_ITENS.Open;
          C190_ITENS.First;
          if not((COD_SIT = sdCancelado) or
            (COD_SIT = sdDoctoNumInutilizada)) then
            while not C190_ITENS.Eof do
            begin 
              with RegistroC190New do
              begin 
                CST_ICMS := C190_ITENSCST.AsString;
                CFOP := C190_ITENSCFO.AsString;
                ALIQ_ICMS := C190_ITENSALIQ.AsFloat;
                VL_OPR := C190_ITENSTOTAL.AsCurrency;
                VL_BC_ICMS := C190_ITENSBC_ICMS.AsCurrency;
                VL_ICMS := C190_ITENSICMS.AsCurrency;
                VL_BC_ICMS_ST := C190_ITENSBC_SUBS.AsCurrency;
                VL_ICMS_ST := C190_ITENSSUBS.AsCurrency;
                VL_RED_BC := C190_ITENSREDUCAO.AsCurrency;
                VL_IPI := C190_ITENSIPI.AsCurrency;
              end;
              C190_ITENS.Next;
            end;

        end;
        NFSaidas.Next;
      end;

      // ENTRADAS
      // Inserir Notas...
      NFEntradas.First;
      while not NFEntradas.Eof do
      begin 
        // C100 - Documento - Nota Fiscal (código 01), Nota Fiscal Avulsa (código 1B), Nota
        // Fiscal de Produtor (código 04) e NF-e (código 55)
        with RegistroC100New do
        begin 
         frmSpedFiscal.AdicionaItem('Processando Nota Ent: ' +
           NFEntradasNUMNF_ENT.AsString, 6);

           Application.processmessages;
          Sleep(100);
          IND_OPER := tpEntradaAquisicao;
          IND_EMIT := edTerceiros;
          COD_PART := 'F' + NFEntradasCOD_FOR.AsString;
          // Baseado no registro 0200
          COD_MOD := NFEntradasCODIFICACAO_FISCAL.AsString;
          COD_SIT := sdRegular;
          SER := NFEntradasSERIE_ENT.AsString;
          NUM_DOC := FormatFloat('000000000', NFEntradasNUMNF_ENT.AsInteger);
          //
          CHV_NFE := ProcessaChave(NFEntradasCHAVE_NFE.AsString);
          DT_DOC := NFEntradasDATAEMI_ENT.AsDateTime;
          DT_E_S := NFEntradasDATAENT_ENT.AsDateTime;
          VL_DOC := NFEntradasTOTAL_ENT.AsCurrency;
          IND_PGTO := BuscaPagENT(NFEntradasCOD_ENT.AsInteger);
          VL_DESC := NFEntradasDESC_ENT.AsCurrency;
          VL_ABAT_NT := 0;
          VL_MERC := NFEntradasTOTAL_PRODUTOS.AsCurrency;
          IND_FRT := tfPorContaDestinatario;
          VL_FRT := NFEntradasFRETE_ENT.AsCurrency;
          VL_SEG := NFEntradasVL_SEG.AsCurrency; // COLOQUEI
          VL_OUT_DA := NFEntradasACRES_ENT.AsCurrency;
          VL_BC_ICMS := NFEntradasBC_ICMS.AsCurrency; // COLOQUIE
          VL_ICMS := NFEntradasVL_ICMS.AsCurrency; // COLOQUEI
          VL_BC_ICMS_ST := NFEntradasBASE_SUB_TRIB.AsCurrency;
          VL_ICMS_ST := NFEntradasVALOR_ICMS_SUB.AsCurrency;
          VL_IPI := NFEntradasVL_IPI.AsCurrency; // COLOQUEI
          VL_PIS := NFEntradasVALOR_PIS.AsCurrency;
          VL_COFINS := NFEntradasVALOR_COFINS.AsCurrency;
          VL_PIS_ST := 0;
          VL_COFINS_ST := 0;


          if ACBrSPEDFiscal1.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilC then
             begin 
                    Itens_NFEntradas.Close;
                    Itens_NFEntradas.ParamByName('CODENT').AsInteger :=
                      NFEntradasCOD_ENT.AsInteger;
                    Itens_NFEntradas.Open;
                    IItens := 1;

                    while not Itens_NFEntradas.Eof do
                    begin 
                      // c170 - Complemento de Documento – Itens do Documento (códigos 01, 1B, 04 e 55)
                      with RegistroC170New do // Inicio Adicionar os Itens:
                      begin 
                        NUM_ITEM := FormatFloat('000', IItens);
                        COD_ITEM := FormataStringD(Itens_NFEntradasCOD_PRO.AsString,
                          '8', '0');
                        DESCR_COMPL := Itens_NFEntradasNOME_PRO.AsString;
                        QTD := Itens_NFEntradasQTDUND_ENT.AsCurrency;
                        // O último dígito deve ser ignorado no arquivo
                        UNID := Itens_NFEntradasUNID.AsString;
                        VL_ITEM := Itens_NFEntradasVALOR_TOTAL.AsCurrency;
                        VL_DESC := Itens_NFEntradasVALOR_DESCONTO.AsCurrency;
                        IND_MOV := mfSim;
                        CST_ICMS := Itens_NFEntradasCST.AsString;
                        CFOP := Itens_NFEntradasCOD_CFOP.AsString;
                        COD_NAT := Itens_NFEntradasCOD_CFOP.AsString;
                        // COD_NAT          := '64'; //Informar no 0400 antes de utilizá-lo
                        VL_BC_ICMS := Itens_NFEntradasBASE_CALCULO.AsCurrency;
                        ALIQ_ICMS := Itens_NFEntradasPERC_ICMS.AsCurrency;
                        VL_ICMS := Itens_NFEntradasVALOR_ICMS.AsCurrency;
                        ALIQ_ST := Itens_NFEntradasPERC_ST.AsCurrency;
                        VL_ICMS_ST := Itens_NFEntradasVALOR_SUB_TRIBUTARIA.AsCurrency;
                        IND_APUR := iaMensal;
                        CST_IPI := Itens_NFEntradasCST_IPI.AsString;
                        // FAZER FALTA CAMPO
                        COD_ENQ := '';
                        VL_BC_IPI := Itens_NFEntradasBASE_CALCULO.AsCurrency;
                        ALIQ_IPI := Itens_NFEntradasPERC_IPI.AsCurrency;
                        VL_IPI := Itens_NFEntradasVALOR_IPI.AsCurrency;
                        CST_PIS := Itens_NFEntradasCST_PIS.AsString;
                        // FALTA
                        VL_BC_PIS := Itens_NFEntradasBASE_CALCULO.AsCurrency; // COLOCAR
                        ALIQ_PIS_PERC := Itens_NFEntradasALIQ_PIS.AsCurrency;
                        // COLOCAR CAMPO
                        QUANT_BC_PIS := 0;
                        ALIQ_PIS_R := 0;
                        VL_PIS := Itens_NFEntradasVALOR_PIS.AsCurrency; // COLOCAR CAMPO
                        CST_COFINS := Itens_NFEntradasCST_COFINS.AsString;
                        VL_BC_COFINS := Itens_NFEntradasBASE_CALCULO.AsCurrency;
                        // COLOCAR
                        ALIQ_COFINS_PERC := Itens_NFEntradasALIQ_COFINS.AsCurrency;
                        // COLOCAR
                        QUANT_BC_COFINS := 0;
                        ALIQ_COFINS_R := 0;
                        VL_COFINS := Itens_NFEntradasVALOR_COFINS.AsCurrency; // COLOCAR
                        COD_CTA := '01'; // Baseado no 0500
                      end; // Fim dos Itens;
                      Itens_NFEntradas.Next;
                      IItens := IItens + 1;
                    end;
             end;

          C190_ENTRADA.Close;
          C190_ENTRADA.ParamByName('CODNF').AsInteger :=
            NFEntradasCOD_ENT.AsInteger;
          C190_ENTRADA.Open;
          C190_ENTRADA.First;
          if not((COD_SIT = sdCancelado) or
            (COD_SIT = sdDoctoNumInutilizada)) then
            while not C190_ENTRADA.Eof do
            begin 
              with RegistroC190New do
              begin 
                CST_ICMS := C190_ENTRADACST.AsString;
                CFOP := C190_ENTRADACFO.AsString;
                ALIQ_ICMS := C190_ENTRADAPERC_ICMS.AsFloat;
                VL_OPR := C190_ENTRADATOTAL.AsCurrency;
                VL_BC_ICMS := C190_ENTRADABC_ICMS.AsCurrency;
                VL_ICMS := C190_ENTRADAICMS.AsCurrency;
                VL_BC_ICMS_ST := C190_ENTRADABC_SUBS.AsCurrency;
                VL_ICMS_ST := C190_ENTRADASUBS.AsCurrency;
                VL_RED_BC := C190_ENTRADAREDUCAO.AsCurrency;
                VL_IPI := C190_ENTRADAIPI.AsCurrency;
              end;
              C190_ENTRADA.Next;
            end;
          C190_ENTRADA.Close;

        end;
        NFEntradas.Next;
      end;

      QCaixa.First;
      while not QCaixa.Eof do
      begin 
        // REGISTRO C400 - EQUIPAMENTO ECF (CÓDIGO 02 e 2D).
        With RegistroC400New do
        begin 
           frmSpedFiscal.AdicionaItem('Processando ECF: ' +
           QCaixaR01_MODELO_ECF.AsString + ' - ' + QCaixaR01_NUMERO_SERIE.AsString, 6);

           Application.processmessages;
          COD_MOD := QCaixaMODELO.AsString;
          ECF_MOD := QCaixaR01_MODELO_ECF.AsString;
          ECF_FAB := QCaixaR01_NUMERO_SERIE.AsString;
          ECF_CX := QCaixaR01_NUMERO_USUARIO.AsString;
          Reducoes.Close;
          Reducoes.ParamByName('CODCAI').AsInteger := QCaixaCOD_CAI.AsInteger;
          Reducoes.ParamByName('DATAINI').AsDate := FDataIni;
          Reducoes.ParamByName('DATAFIN').AsDate := FDataFim;
          Reducoes.Open;
          Reducoes.First;
          while not Reducoes.Eof do
          begin 
            With RegistroC405New do
            begin 
              DT_DOC := ReducoesDATA.AsDateTime; // StrToDate('30/11/2011');
              CRO := ReducoesCRO.AsInteger;
              CRZ := ReducoesCRZ.AsInteger;
              NUM_COO_FIN := ReducoesCOO_FINAL.AsInteger;
              GT_FIN := ReducoesGT_FINAL.AsFloat;
              VL_BRT := ReducoesVENDA_BRUTA.AsFloat;

              { With RegistroC410New do
                begin 
                VL_PIS := 0.00;
                VL_COFINS := 0.00;
                end; }

              Totalizadores.Close;
              Totalizadores.ParamByName('COD').AsInteger :=
                ReducoesCODIGO.AsInteger;
              Totalizadores.Open;
              Totalizadores.First;
              while not Totalizadores.Eof do
              begin 
                if TotalizadoresVALOR.AsCurrency <> 0 then
                with RegistroC420New do
                begin 
                  COD_TOT_PAR := TotalizadoresINDICE_R03.AsString;
                  VLR_ACUM_TOT := TotalizadoresVALOR.AsCurrency;
                  if TotalizadoresALIQUOTA_GRP.AsCurrency > 0 then
                     begin 
                        if ( Pos ( 'T', TotalizadoresINDICE_R03.AsString ) > 0 )
                         and ( Length( TotalizadoresINDICE_R03.AsString ) >= 5 ) then
                         begin 
                            NR_TOT := StrToint(Copy( TotalizadoresINDICE_R03.AsString, 1, 2 ) );
                            DESCR_NR_TOT := 'TOTALIZADOR ' + TotalizadoresINDICE_R03.AsString;
                         end;

                     end;

                  { Gera este registro somente para empresas do pergil B de apresentação }
                  if Bloco_0.Registro0000.IND_PERFIL = pfPerfilB then
                  begin 
                    ITENS_TOTALIZADORES.Close;
                    ITENS_TOTALIZADORES.ParamByName('DATAINI').AsDate :=
                      ReducoesDATA.AsDateTime;
                    ITENS_TOTALIZADORES.ParamByName('COD_GRP').AsInteger :=
                      TotalizadoresCOD_GRP.AsInteger;
                    ITENS_TOTALIZADORES.ParamByName('CODCAI').AsInteger :=
                      QCaixaCOD_CAI.AsInteger;
                    ITENS_TOTALIZADORES.ParamByName('CODEMP').AsInteger := iEmp;
                    ITENS_TOTALIZADORES.Open;
                    ITENS_TOTALIZADORES.First;
                    while not ITENS_TOTALIZADORES.Eof do
                    begin 
                      With RegistroC425New do
                      begin 
                        COD_ITEM :=
                          FormataStringD(ITENS_TOTALIZADORESCOD_PRO.AsString,
                          '8', '0');
                        QTD := ITENS_TOTALIZADORESQUANT.AsFloat;
                        UNID := ITENS_TOTALIZADORESUNIDADE.AsString;
                        if ITENS_TOTALIZADORESVALOR.AsFloat < 0 then
                           VL_ITEM := ITENS_TOTALIZADORESVALOR.AsFloat * -1
                        else
                           VL_ITEM := ITENS_TOTALIZADORESVALOR.AsFloat;
                        VL_PIS := 0.00;
                        VL_COFINS := 0.00;
                      end;
                      ITENS_TOTALIZADORES.Next
                    end;
                    ITENS_TOTALIZADORES.Close;
                  end;
                end;
                Totalizadores.Next;
              end;
              Totalizadores.Close;

              if ( Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB ) and
              ( Bloco_0.Registro0000.IND_PERFIL <> pfPerfilC )then
              begin 
                VendasC460.Close;
                VendasC460.ParamByName('DATAINI').AsDate :=
                  ReducoesDATA.AsDateTime;
                VendasC460.ParamByName('COD_CAI').AsInteger :=
                  QCaixaCOD_CAI.AsInteger;
                VendasC460.ParamByName('CODEMP').AsInteger := iEmp;
                VendasC460.Open;
                VendasC460.First;
                while not VendasC460.Eof do
                begin 
                  with REgistroC460New do
                  begin 

                    if VendasC460CANCELADA_VEN.AsInteger = 1 then
                      COD_SIT := sdCancelado
                    else
                      COD_SIT := sdRegular;
                    COD_MOD := '2D';
                    NUM_DOC := VendasC460CUPOM_FISCAL_VEN.AsString;

                    if COD_SIT = sdRegular then
                    begin 

                      DT_DOC := VendasC460DATA_VEN.AsDateTime;
                      VL_DOC := VendasC460TOTAL_VEN.AsCurrency;
                      VL_PIS := 0.00;
                      VL_COFINS := 0.00;
                      CPF_CNPJ := '';
                      NOM_ADQ := '';

                      ItensC470.Close;
                      ItensC470.ParamByName('CODVEN').AsInteger :=
                        VendasC460COD_VEN.AsInteger;
                      ItensC470.ParamByName('CODEMP').AsInteger := iEmp;
                      ItensC470.Open;
                      ItensC470.First;
                      while not ItensC470.Eof do
                      begin 
                        if not ( ItensC470CANCELADO.AsInteger = 1 ) then
                          begin 
                              with RegistroC470New do
                              begin 
                                COD_ITEM := FormataStringD(ItensC470COD_PRO.AsString,
                                  '8', '0');
                                QTD := ItensC470QUANT.AsCurrency;
                                if ItensC470CANCELADO.AsInteger = 1 then
                                  QTD_CANC := QTD
                                else
                                  QTD_CANC := 0;

                                UNID := ItensC470UNID.AsString;
                                if ( ( QTD  ) * ( ItensC470VALOR.AsCurrency - ItensC470DESCONTO.AsCurrency ) ) < 0 then
                                   VL_ITEM := (( QTD  ) * ( ItensC470VALOR.AsCurrency - ItensC470DESCONTO.AsCurrency )) * -1
                                else
                                   VL_ITEM := ( QTD  ) * ( ItensC470VALOR.AsCurrency - ItensC470DESCONTO.AsCurrency );
                                CST_ICMS := ItensC470CST_CF_EST.AsString;
                                CFOP := ItensC470CFOP_VENDAS_CF_EST.AsString;
                                ALIQ_ICMS := ItensC470ALIQUOTA_GRP.AsCurrency;
                                VL_PIS := 0.00;
                                VL_COFINS := 0.00;
                              end;
                          end;
                        ItensC470.Next;
                      end;
                    end;
                  end;
                  VendasC460.Next;
                end;
                VendasC460.Close;
              end;

              C490.Close;
              C490.ParamByName('CODEMP').AsInteger := iEmp;
              C490.ParamByName('DATAINI').AsDate := ReducoesDATA.AsDateTime;
              C490.Open;
              C490.First;
              while not C490.Eof do
              begin 
                with RegistroC490New do
                begin 
                  CST_ICMS := C490CST.AsString;
                  CFOP := C490CFOP.AsString;
                  ALIQ_ICMS := C490ALIQ.AsCurrency;
                  VL_OPR := C490TOTAL.AsCurrency;
                  VL_BC_ICMS := C490BC_ICMS.AsCurrency;
                  VL_ICMS := C490ICMS.AsCurrency;
                  COD_OBS := ''
                end;
                C490.Next;
              end;
              C490.Close;

              { Só envia este registro se o contribuinte for da BA }
              if Bloco_0.Registro0000.UF = 'BA' then
              begin 
                with RegistroC495New do
                begin 
                  ALIQ_ICMS := 17.00;
                  COD_ITEM := '000001';
                  QTD := 1.00;
                  QTD_CANC := 0.00;
                  UNID := 'UN';
                  VL_ITEM := 100.00;
                  VL_DESC := 0.00;
                  VL_CANC := 0.00;
                  VL_ACMO := 0.00;
                  VL_BC_ICMS := 100.00;
                  VL_ICMS := 17.00;
                  VL_ISEN := 0.00;
                  VL_ICMS_ST := 0.00;
                end;
              end;
            end; // AQUI
            Reducoes.Next;
          end;

        end;
        QCaixa.Next;
      end;

    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_C(True);

end;

procedure TdmEFDFiscal.Bloco_D;
begin 
  with ACBrSPEDFiscal1.Bloco_D do
  begin 
    with RegistroD001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_D;
end;

procedure TdmEFDFiscal.Bloco_E;
begin 
  with ACBrSPEDFiscal1.Bloco_E do
  begin 
    with RegistroE001New do
    begin 
      IND_MOV := imSemDados;

      { with RegistroE100New do
        begin 
        DT_INI := FDataIni;
        DT_FIN:= FDataFim;
        end; }
    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_E;

end;

procedure TdmEFDFiscal.Bloco_G;
begin 
  with ACBrSPEDFiscal1.Bloco_G do
  begin 
    with RegistroG001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  ACBrSPEDFiscal1.WriteBloco_G;
end;

procedure TdmEFDFiscal.Bloco_H;
begin 
  with ACBrSPEDFiscal1.Bloco_H do
  begin 
    if CodInventario = 0 then
       begin 
          with RegistroH001New do
            begin 
                IND_MOV := imSemDados;
            end;
       end
    else
       begin 
          INVENTARIO_H.Close;
          INVENTARIO_H.ParamByName( 'COD' ).AsInteger := CodInventario;
          INVENTARIO_H.Open;
          INVENTARIO_TOTAL.Close;
          INVENTARIO_TOTAL.ParamByName( 'COD' ).AsInteger := CodInventario;
          INVENTARIO_TOTAL.Open;
          with RegistroH001New do
            begin 
                IND_MOV := imComDados;
            end;
          with RegistroH005New do
               begin 
                  DT_INV := data_inv_fim;
                  MOT_INV := miFinalPeriodo;
                  VL_INV := INVENTARIO_TOTALTOTAL_INVENTARIO.AsCurrency;
               end;
          INVENTARIO_H.First;
          while not INVENTARIO_H.Eof do
             begin 
                with RegistroH010New do
                    begin 
                         COD_ITEM := INVENTARIO_HCOD_PRO.AsString;
                         UNID := INVENTARIO_HDESCRICAO.AsString;
                         VL_UNIT := INVENTARIO_HPRECO_VENDA.AsCurrency;
                         QTD := INVENTARIO_HQUANT.AsCurrency;
                         VL_ITEM := INVENTARIO_HTOTAL_PRECO_VENDA.AsCurrency;
                         IND_PROP := piInformante;
                         TXT_COMPL := INVENTARIO_HNOME_PRO.AsString;
                         COD_CTA := '01';
                    end;
                INVENTARIO_H.Next;
             end;
          INVENTARIO_H.Close;
          INVENTARIO_TOTAL.Close;

       end;

  end;
  ACBrSPEDFiscal1.WriteBloco_H;
end;

procedure TdmEFDFiscal.FechaTabelas_Bloco_0;
begin 
  QClientes_0150.Close;
  QFornec_0150.Close;
  QMedidas.Close;
  QProdutos.Close;
  NFSaidas.Close;
  NFEntradas.Close;
  QCaixa.Close;
  NatOperacao.Open;
end;

procedure TdmEFDFiscal.GeraSped(Cod_emp: Integer; DataIni, DataFim: TDateTime);
begin 
  //
  if TRFiscal.Active then
    TRFiscal.Commit;
  TRFiscal.StartTransaction;
  EmpresaGerada := Cod_emp;
  QEmpresa.Close;
  QEmpresa.ParamByName('CODEMP').AsInteger := EmpresaGerada;
  QEmpresa.Open;
  if QEmpresa.IsEmpty then
  begin 
    KDialog('Empresa não encontrata', 'Geração Sped Fiscal', tdtErro);
    TRFiscal.Commit;
    Exit;
  end;
  ACBrSPEDFiscal1.TrimString := true;
  FDataIni := DataIni;
  FDataFim := DataFim;
  frmSpedFiscal.AdicionaItem('Processando Bloco 0', 4);
  Application.ProcessMessages;
  Bloco_0;
  frmSpedFiscal.AdicionaItem('Processando Bloco C', 4);
  Application.ProcessMessages;
  Bloco_C;
  frmSpedFiscal.AdicionaItem('Processando Bloco D', 4);
  Application.ProcessMessages;
  Bloco_D;
  frmSpedFiscal.AdicionaItem('Processando Bloco E', 4);
  Application.ProcessMessages;
  Bloco_E;
  frmSpedFiscal.AdicionaItem('Processando Bloco G', 4);
  Application.ProcessMessages;
  Bloco_G;
  frmSpedFiscal.AdicionaItem('Processando Bloco H', 4);
  Application.ProcessMessages;
  Bloco_H;
  frmSpedFiscal.AdicionaItem('Processando Bloco 1', 4);
  Application.ProcessMessages;
  Bloco_1;
  TRFiscal.Commit;
  ACBrSPEDFiscal1.SaveFileTXT;
  FechaTabelas_Bloco_0;
end;

function TdmEFDFiscal.FTIPO_ITEM(I: string): TACBrTipoItem;
var
  AUX: String;
begin 
  //
  AUX := Trim(I);
  if AUX = '00' then
    result := tiMercadoriaRevenda
  else if AUX = '02' then
    result := tiEmbalagem
  else if AUX = '03' then
    result := tiProdutoProcesso
  else if AUX = '04' then
    result := tiProdutoAcabado
  else if AUX = '05' then
    result := tiSubproduto
  else if AUX = '06' then
    result := tiProdutoIntermediario
  else if AUX = '07' then
    result := tiMaterialConsumo
  else if AUX = '08' then
    result := tiAtivoImobilizado
  else if AUX = '09' then
    result := tiServicos
  else if AUX = '10' then
    result := tiOutrosInsumos
  else if AUX = '99' then
    result := tiOutras
  else
    result := tiProdutoAcabado;
end;

function TdmEFDFiscal.ProcessaChave(Chave: String): string;
var
  ChaveTemp, T: String;
  I: Integer;
begin 
  ChaveTemp := Chave;
  T := '';
  for I := 1 to Length(ChaveTemp) do
  begin 

    if (ChaveTemp[I] in ['0' .. '9']) then
      T := T + ChaveTemp[I];
  end;
  result := Trim(T);
end;

function TdmEFDFiscal.BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
begin 
  dm.QConsulta.Close;
  dm.QConsulta.sql.Clear;
  dm.QConsulta.sql.Text :=
    'SELECT C.COD_CTR, C.PARCELA_CTR, C.VENCTO_CTR, C.VALOR_CTR, C.numdocumento_ctr '
    + 'FROM CONTAS_RECEBER C WHERE C.numdocumento_ctr = :CODNF ' +
    'ORDER BY C.VENCTO_CTR';

  dm.QConsulta.ParamByName('codnf').AsString := 'NF ' + IntToStr(COD_NF);
  dm.QConsulta.Open;
  dm.QConsulta.Last;
  dm.QConsulta.First;
  if dm.QConsulta.IsEmpty then
    result := tpSemPagamento;
  if (not dm.QConsulta.IsEmpty) AND (dm.QConsulta.recordCount > 1) then
    result := tpPrazo
  else
    result := tpVista;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

function TdmEFDFiscal.BuscaPagENT(COD_NF: Integer): TACBrTipoPagamento;
begin 
  dm.QConsulta.Close;
  dm.QConsulta.sql.Clear;
  dm.QConsulta.sql.Text :=
    'SELECT * FROM CONTAS_PAGAR WHERE NUM_DOC_CTP =:CODNF ' +
    'ORDER BY DTVENCTO_CTP';

  dm.QConsulta.ParamByName('codnf').AsString := IntToStr(COD_NF);
  dm.QConsulta.Open;
  dm.QConsulta.Last;
  dm.QConsulta.First;
  if dm.QConsulta.IsEmpty then
    result := tpSemPagamento;
  if (not dm.QConsulta.IsEmpty) AND (dm.QConsulta.recordCount > 1) then
    result := tpPrazo
  else
    result := tpVista;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

procedure TdmEFDFiscal.DataModuleCreate(Sender: TObject);
begin 
   SqlMedidas := QMedidas.SQL.Text;
   SqlProdutos := QProdutos.SQL.Text;
   ACBrSPEDFiscal1.TrimString := true;
end;

end.
