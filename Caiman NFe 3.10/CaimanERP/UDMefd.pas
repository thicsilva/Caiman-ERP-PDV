unit UDMefd;

interface

uses
  SysUtils, Classes, ACBrSpedPisCofins, DB, ACBrUtil, ACBrTXTClass, 
  ACBrEPCBlocos, DBClient, Forms, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TDMefd = class(TDataModule)
    PisCofins: TACBrSPEDPisCofins;
    Produtos: TFDQuery;
    TREfd: TFDTransaction;
    ProdutosCOD_PRO: TIntegerField;
    ProdutosNOME_PRO: TStringField;
    ProdutosCOD_NCM: TStringField;
    ProdutosALIQUOTA_GRP: TBCDField;
    ProdutosDESCRICAO: TStringField;
    ProdutosCODIGO_BARRA_PRO: TStringField;
    ProdutosTIPO_PRODUCAO: TStringField;
    ProdutosEFD_TIPO: TStringField;
    Medidas: TFDQuery;
    MedidasCODIGO: TIntegerField;
    MedidasDESCRICAO: TStringField;
    Clientes: TFDQuery;
    ClientesCOD_CLI: TIntegerField;
    ClientesNOME_CLI: TStringField;
    ClientesPAIS: TStringField;
    ClientesCNPJ_CLI: TStringField;
    ClientesINSC_ESTADUAL: TStringField;
    ClientesCODIGO_IBGE: TIntegerField;
    ClientesENDRES_CLI: TStringField;
    ClientesNUMRES_CLI: TStringField;
    ClientesOBS_CLI: TStringField;
    ClientesBAIRES_CLI: TStringField;
    Fornecedores: TFDQuery;
    FornecedoresCOD_FOR: TIntegerField;
    FornecedoresRAZAO_FOR: TStringField;
    FornecedoresPAIS: TStringField;
    FornecedoresCNPJ_FOR: TStringField;
    FornecedoresINSC_FOR: TStringField;
    FornecedoresCODIGO_IBGE: TIntegerField;
    FornecedoresEND_FOR: TStringField;
    FornecedoresNUM_FOR: TStringField;
    FornecedoresBAI_FOR: TStringField;
    Alterados: TFDQuery;
    AlteradosCODIGO: TIntegerField;
    AlteradosCOD_PRO: TIntegerField;
    AlteradosDATA_HORA: TSQLTimeStampField;
    AlteradosDATA_INI: TDateField;
    AlteradosDATA_FIN: TDateField;
    AlteradosDESCRICAO_ANT: TStringField;
    Empresa: TFDQuery;
    EmpresaRAZAO_EMP: TStringField;
    EmpresaCNPJ_EMP: TStringField;
    EmpresaEST_EMP: TStringField;
    EmpresaCODIGO_MUNICIPIO: TStringField;
    EmpresaIND_NAT_PJ: TStringField;
    EmpresaTIPO_ATIVIDADE_EFD: TIntegerField;
    Contador: TFDQuery;
    ContadorNOME_CONTADOR: TStringField;
    ContadorCPF_CONTADOR: TStringField;
    ContadorCNPJ_CONTADOR: TStringField;
    ContadorCEP_CONTADOR: TStringField;
    ContadorEND_CONTADOR: TStringField;
    ContadorNUMERO_CONTADOR: TStringField;
    ContadorBAIRRO_CONTADOR: TStringField;
    ContadorTEL_CONTADOR: TStringField;
    ContadorFAX_CONTADOR: TStringField;
    ContadorCODIGO_MUNICIPIO_CONTADOR: TStringField;
    ContadorCRC_CONTADOR: TStringField;
    EmpresaINSC_EMP: TStringField;
    EmpresaINSCRICAO_MUNICIPAL: TStringField;
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
    Itens_NFSAIDA: TFDQuery;
    ConfigEFD: TFDQuery;
    ConfigEFDCOD: TIntegerField;
    ConfigEFDCOD_EMP: TIntegerField;
    ConfigEFDVERSAO: TIntegerField;
    ConfigEFDREGIME_APURACAO: TIntegerField;
    ConfigEFDMETODO: TIntegerField;
    ConfigEFDTIPO_CONT: TIntegerField;
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
    Itens_NFEntradas: TFDQuery;
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
    Itens_NFEntradasCOD_PRO1: TIntegerField;
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
    Itens_NFEntradasOBS: TWideMemoField;
    Itens_NFEntradasCST_PIS: TStringField;
    Itens_NFEntradasCST_COFINS: TStringField;
    Itens_NFEntradasCST_IPI: TStringField;
    Itens_NFEntradasULTIMA_ALTERACAO: TDateField;
    Itens_NFEntradasVALOR_ATACADO: TBCDField;
    NFEntradasBC_ICMS: TBCDField;
    NFEntradasVL_ICMS: TBCDField;
    NFEntradasVL_IPI: TBCDField;
    NFEntradasVL_SEG: TBCDField;
    Itens_NFEntradasALIQ_ICMS: TBCDField;
    Itens_NFEntradasUNID: TStringField;
    Itens_NFEntradasALIQ_PIS: TBCDField;
    Itens_NFEntradasVALOR_PIS: TBCDField;
    Itens_NFEntradasALIQ_COFINS: TBCDField;
    Itens_NFEntradasVALOR_COFINS: TBCDField;
    Itens_NFEntradasCST_PIS1: TStringField;
    Itens_NFEntradasCST_COFINS1: TStringField;
    Itens_NFEntradasCST_IPI1: TStringField;
    QVendas: TFDQuery;
    QItens_Vendas: TFDQuery;
    QCaixa: TFDQuery;
    EmpresaFilha: TFDQuery;
    EmpresaFilhaCOD_EMP: TIntegerField;
    EmpresaFilhaRAZAO_EMP: TStringField;
    EmpresaFilhaEND_EMP: TStringField;
    EmpresaFilhaBAI_EMP: TStringField;
    EmpresaFilhaCID_EMP: TStringField;
    EmpresaFilhaCEP_EMP: TStringField;
    EmpresaFilhaEST_EMP: TStringField;
    EmpresaFilhaINSC_EMP: TStringField;
    EmpresaFilhaTEL_EMP: TStringField;
    EmpresaFilhaFAX_EMP: TStringField;
    EmpresaFilhaNOME_EMP_ETIQUETA: TStringField;
    EmpresaFilhaNUMERO_EMP: TStringField;
    EmpresaFilhaRESP_EMP: TStringField;
    EmpresaFilhaCAMINHO_FOTO_EMP: TStringField;
    EmpresaFilhaFANTASIA_EMP: TStringField;
    EmpresaFilhaMOSTRAR_SITCLI_PREVENDA: TStringField;
    EmpresaFilhaCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    EmpresaFilhaTIPO_EMP: TIntegerField;
    EmpresaFilhaTIPO_CARGA_BALANCA: TIntegerField;
    EmpresaFilhaCNPJ_EMP: TStringField;
    EmpresaFilhaCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    EmpresaFilhaINSCRICAO_MUNICIPAL: TStringField;
    EmpresaFilhaPERFIL_EFD: TStringField;
    EmpresaFilhaCODIGO_MUNICIPIO: TStringField;
    EmpresaFilhaTIPO_ATIVIDADE_EFD: TIntegerField;
    EmpresaFilhaNOME_CONTADOR: TStringField;
    EmpresaFilhaCPF_CONTADOR: TStringField;
    EmpresaFilhaCRC_CONTADOR: TStringField;
    EmpresaFilhaCNPJ_CONTADOR: TStringField;
    EmpresaFilhaCEP_CONTADOR: TStringField;
    EmpresaFilhaEND_CONTADOR: TStringField;
    EmpresaFilhaNUMERO_CONTADOR: TStringField;
    EmpresaFilhaBAIRRO_CONTADOR: TStringField;
    EmpresaFilhaTEL_CONTADOR: TStringField;
    EmpresaFilhaFAX_CONTADOR: TStringField;
    EmpresaFilhaCODIGO_MUNICIPIO_CONTADOR: TStringField;
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
    C481PIS: TFDQuery;
    C481PISTOTAL: TBCDField;
    C481PISBC: TBCDField;
    C481PISCST_PIS: TStringField;
    C481PISALIQUOTA_PIS: TBCDField;
    C481PISVALOR: TFMTBCDField;
    C481PISCOD_PRO: TIntegerField;
    C485COFINS: TFDQuery;
    C485COFINSTOTAL: TBCDField;
    C485COFINSBC: TBCDField;
    C485COFINSCST_COFINS: TStringField;
    C485COFINSALIQUOTA_COFINS: TBCDField;
    C485COFINSVALOR: TFMTBCDField;
    C485COFINSCOD_PRO: TIntegerField;
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
    procedure AbreTabelas;
    procedure FechaTudo;
    procedure Bloco_0;
    procedure Bloco_C;

    // BLOCOS NAO USADO
    procedure Bloco_a;
    procedure Bloco_d;
    procedure Bloco_f;

    function FTIPO_ITEM(I: string): TACBrTipoItem;
    function BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
    function ConverteCST(CST: string): TACBrSituacaoTribICMS;
    function CSOSN(CFOP: Integer): Boolean;
    function ConverteIPI(CSTIPI: string): TACBrSituacaoTribIPI;
    function ConverteCSTPIS(CSTPIS: string): TACBrSituacaoTribPIS;
    function ConverteCSTCOFINS(CSTCOFINS: String): TACBrSituacaoTribCOFINS;
    function BuscaPagENT(COD_NF: Integer): TACBrTipoPagamento;
    function ProcessaChave(Chave: String): string;
    procedure DataModuleCreate(Sender: TObject);
    procedure PisCofinsError(const MsnError: string);

  private
    { Private declarations }
  public
    { Public declarations }
    DATA_INCIO: TDate;
    DATA_Fim: TDate;
    EmpresaGera: Integer;
    GeraMatrizFilial: Boolean;
    SqlEmpresa: String;
  end;

var
  DMefd: TDMefd;

implementation

uses
  UDM, ACBrEPCBloco_0, Ubibli1, USpedPis, UDialog;

{$R *.dfm}

procedure TDMefd.Bloco_0;
var
  AUX: String;

begin 
  // CRIA PASTA
  if not DirectoryExists( ExtractFilePath(Application.exename) + '\SPEDPisCofins\') then
  begin
    ForceDirectories(ExtractFilePath(Application.exename) + '\SPEDPisCofins\');
  end;
  PisCofins.Path := ExtractFilePath(Application.exename) + '\SPEDPisCofins\';
  PisCofins.Arquivo := 'PIS_COFINS_' + FormatDateTime('ddmmyyyy',
    DATA_INCIO) + '.txt';
  // Alimenta o componente com informações para gerar todos os registros do
  // Bloco 0.

  with PisCofins do
  begin 
    DT_INI := DATA_INCIO;
    DT_FIN := DATA_Fim;
    IniciaGeracao;
    LinhasBuffer := StrToIntDef('100', 0);
  end;

  frmSpedPis.AdicionaItem('Processando Bloco 0', 4);
  Application.processmessages;
  Sleep(100);
  DMefd.EmpresaGera := iEmp;
  DMefd.AbreTabelas;
  with PisCofins.Bloco_0 do
  begin 
    // Dados da Empresa
    with Registro0000New do
    begin 
      COD_VER := TACBrVersaoLeiaute(ConfigEFDVERSAO.AsInteger);
      TIPO_ESCRIT := tpEscrOriginal;
      IND_SIT_ESP := indSitAbertura;
      NUM_REC_ANTERIOR := '';
      NOME := EmpresaRAZAO_EMP.AsString;
      CNPJ := RetiraCaracter(EmpresaCNPJ_EMP.AsString);
      UF := EmpresaEST_EMP.AsString;
      COD_MUN := EmpresaCODIGO_MUNICIPIO.AsInteger;
      SUFRAMA := '';
      IND_NAT_PJ := indNatPJSocEmpresariaGeral;
      if EmpresaTIPO_ATIVIDADE_EFD.AsInteger = 0 then
        IND_ATIV := indAtivIndustrial
      else
        IND_ATIV := indAtivoOutros;

      with Registro0001New do
      begin 
        IND_MOV := imComDados;

        // FILHO - Dados do contador.
        try
            with Registro0100New do
            begin
              NOME := ContadorNOME_CONTADOR.AsString;
              CPF := RetiraCaracter(ContadorCPF_CONTADOR.AsString);
              // Deve ser uma informação valida
              CRC := RetiraCaracter(ContadorCRC_CONTADOR.AsString);
              CNPJ := RetiraCaracter(ContadorCNPJ_CONTADOR.AsString);
              CEP := RetiraCaracter(ContadorCEP_CONTADOR.AsString);
              ENDERECO := ContadorEND_CONTADOR.AsString;
              NUM := ContadorNUMERO_CONTADOR.AsString;
              COMPL := '';
              BAIRRO := ContadorBAIRRO_CONTADOR.AsString;
              FONE := RetiraCaracter(ContadorTEL_CONTADOR.AsString);
              FAX := RetiraCaracter(ContadorFAX_CONTADOR.AsString);
              EMAIL := '';
              COD_MUN := ContadorCODIGO_MUNICIPIO_CONTADOR.AsInteger;
            end;
        except
            KDialog( 'Preencha os dados do contador completos' + sLineBreak +
                     ' Com CRC e COD IBGE e Endereço completo', 'Sped', tdtErro);
        end;

        // FILHO - Regime de Apuração
        with Registro0110New do
        begin 
          COD_INC_TRIB := TACBrCodIndIncTributaria
            (ConfigEFDREGIME_APURACAO.AsInteger); // codEscrOpIncCumulativo;
          IND_APRO_CRED := TACBrIndAproCred(ConfigEFDMETODO.AsInteger);
          COD_TIPO_CONT := TACBrCodIndTipoCon(ConfigEFDTIPO_CONT.AsInteger);
          // Campo IND_REG_CUM apenas para Lucro Presumido e (COD_INC_TRIB = 2)
          // IND_REG_CUM := codRegimeCompetEscritDetalhada;

        end;

        // FILHO - REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
        with Registro0500New do
        begin 
          DT_ALT := StrToDate('01/04/2011');
          COD_NAT_CC := ncgAtivo;
          IND_CTA := indCTASintetica;
          NIVEL := '0';
          COD_CTA := '01';
          NOME_CTA := 'PLANO DE CONTAS PADRAO';
          COD_CTA_REF := '0';
          CNPJ_EST := RetiraCaracter(EmpresaCNPJ_EMP.AsString);
        end;

        if not GeraMatrizFilial then
           begin 
              EmpresaFilha.Close;
              EmpresaFilha.SQL.Text := 'select * from empresa where COD_EMP=:CODEMP';
              EmpresaFilha.ParamByName( 'CODEMP' ).AsInteger := iEmp;
           end;

        EmpresaFilha.Open;
        EmpresaFilha.First;
        while not EmpresaFilha.Eof do
        begin 
           DMefd.EmpresaGera := EmpresaFilhaCOD_EMP.AsInteger;
           DMefd.AbreTabelas;
          // 0140 - Tabela de Cadastro de Estabelecimento
          // FILHO
          with Registro0140New do
          begin 
            COD_EST := '01';
            NOME := EmpresaRAZAO_EMP.AsString;
            CNPJ := RetiraCaracter(EmpresaCNPJ_EMP.AsString);
            UF := EmpresaEST_EMP.AsString;
            IE := RetiraCaracter(EmpresaINSC_EMP.AsString);
            COD_MUN := EmpresaCODIGO_MUNICIPIO.AsInteger;
            IM := RetiraCaracter(EmpresaINSCRICAO_MUNICIPAL.AsString);
            SUFRAMA := '';

            // CLIENTES 0150
            Clientes.First;
            while not Clientes.Eof do
            begin 
              // 0150 - Tabela de Cadastro do Participante
              with Registro0150New do
              begin 
                COD_PART := ClientesCOD_CLI.AsString;
                NOME := ClientesNOME_CLI.AsString;
                COD_PAIS := ClientesPAIS.AsString;
                AUX := Trim(RetiraCaracter(ClientesCNPJ_CLI.AsString));
                if Length(AUX) > 11 then
                begin 
                  CNPJ := AUX;
                  CPF := '';
                end
                else
                begin 
                  if AUX = '' then
                    CPF := '12345678909'
                  else
                    CPF := AUX;
                  CNPJ := '';
                end;
                IE := RetiraCaracter(ClientesINSC_ESTADUAL.AsString);
                COD_MUN := ClientesCODIGO_IBGE.AsInteger;
                SUFRAMA := '';
                ENDERECO := ClientesENDRES_CLI.AsString;
                NUM := ClientesNUMRES_CLI.AsString;
                COMPL := '';
                BAIRRO := ClientesBAIRES_CLI.AsString;
                //
              end;
              Clientes.Next;
            end;

            // FORNECEDORES 0150
            Fornecedores.First;
            while not Fornecedores.Eof do
            begin 
              // 0150 - Tabela de Cadastro do Participante
              with Registro0150New do
              begin 
                COD_PART := 'F' + FornecedoresCOD_FOR.AsString;
                NOME := FornecedoresRAZAO_FOR.AsString;
                COD_PAIS := FornecedoresPAIS.AsString;
                AUX := Trim(RetiraCaracter(FornecedoresCNPJ_FOR.AsString));
                if Length(AUX) > 11 then
                begin 
                  CNPJ := AUX;
                  CPF := '';
                end
                else
                begin 
                  if AUX = '' then
                    CPF := '12345678909'
                  else
                    CPF := AUX;
                  CNPJ := '';
                end;
                IE := RetiraCaracter(FornecedoresINSC_FOR.AsString);
                COD_MUN := FornecedoresCODIGO_IBGE.AsInteger;
                SUFRAMA := '';
                ENDERECO := FornecedoresEND_FOR.AsString;
                NUM := FornecedoresNUM_FOR.AsString;
                COMPL := '';
                BAIRRO := FornecedoresBAI_FOR.AsString;
                //
              end;
              Fornecedores.Next;
            end;

            // 0190 - Identificação das Unidades de Medida
            Medidas.First;
            while not Medidas.Eof do
            begin 
              with Registro0190New do
              begin 
                UNID := MedidasDESCRICAO.AsString;
                DESCR := MedidasDESCRICAO.AsString;
              end;
              Medidas.Next;
            end;

            // 10 produtos/serviços
            Produtos.First;
            while not Produtos.Eof do
            begin 
              // 0200 - Tabela de Identificação do Item (Produtos e Serviços)
              with Registro0200New do
              begin 
                COD_ITEM := FormataStringD( ProdutosCOD_PRO.AsString, '8', '0');
                DESCR_ITEM := ProdutosNOME_PRO.AsString;;
                COD_BARRA := ProdutosCODIGO_BARRA_PRO.AsString;
                COD_ANT_ITEM := '';
                UNID_INV := ProdutosDESCRICAO.AsString;
                TIPO_ITEM := FTIPO_ITEM(ProdutosEFD_TIPO.AsString);
                COD_NCM := ProdutosCOD_NCM.AsString;
                EX_IPI := '';
                COD_GEN := '';
                COD_LST := '';
                ALIQ_ICMS := ProdutosALIQUOTA_GRP.AsCurrency;

                Alterados.Close;
                Alterados.ParamByName('COD_PRO').AsInteger :=
                  ProdutosCOD_PRO.AsInteger;
                Alterados.ParamByName('DATAINI').AsDate := DATA_INCIO;
                Alterados.ParamByName('DATAFIN').AsDate := DATA_Fim;
                Alterados.ParamByName('CODEMP').AsInteger := EmpresaGera;
                Alterados.Open;
                if not Alterados.IsEmpty then
                begin 
                  Alterados.First;
                  while not Alterados.Eof do
                  begin 
                    with Registro0205New do
                    begin 
                      DESCR_ANT_ITEM := AlteradosDESCRICAO_ANT.AsString;
                      DT_INI := AlteradosDATA_INI.AsDateTime;
                      DT_FIM := AlteradosDATA_FIN.AsDateTime;
                      // Observe que o campo é DT_FIM e não DT_FIN
                      Alterados.Next;
                    end;
                    Alterados.Next;
                  end;
                end;
                Alterados.Close;
              end;
              Produtos.Next;
            end;
          end;
          EmpresaFilha.Next;
        end;


      end;
    end;

  end;

  // PisCofins.WriteBloco_0;

end;

procedure TDMefd.AbreTabelas;
begin 
  //

  Produtos.Close;
  Produtos.ParamByName('DATAINI').AsDate := DATA_INCIO;
  Produtos.ParamByName('DATAFIN').AsDate := DATA_Fim;
  Produtos.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Produtos.Open;

  Medidas.Close;
  Medidas.ParamByName('DATAINI').AsDate := DATA_INCIO;
  Medidas.ParamByName('DATAFIN').AsDate := DATA_Fim;
  Medidas.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Medidas.Open;

  Clientes.Close;
  Clientes.ParamByName('DATAINI').AsDate := DATA_INCIO;
  Clientes.ParamByName('DATAFIN').AsDate := DATA_Fim;
  Clientes.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Clientes.Open;

  Fornecedores.Close;
  Fornecedores.ParamByName('DATAINI').AsDate := DATA_INCIO;
  Fornecedores.ParamByName('DATAFIN').AsDate := DATA_Fim;
  Fornecedores.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Fornecedores.Open;

  Empresa.Close;
  Empresa.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Empresa.Open;

  Contador.Close;
  Contador.ParamByName('CODEMP').AsInteger := EmpresaGera;
  Contador.Open;

  NFSaidas.Close;
  NFSaidas.ParamByName('DATAINI').AsDate := DATA_INCIO;
  NFSaidas.ParamByName('DATAFIN').AsDate := DATA_Fim;
  NFSaidas.ParamByName('CODEMP').AsInteger := EmpresaGera;
  NFSaidas.Open;

  NFEntradas.Close;
  NFEntradas.ParamByName('DATAINI').AsDate := DATA_INCIO;
  NFEntradas.ParamByName('DATAFIN').AsDate := DATA_Fim;
  NFEntradas.ParamByName('CODEMP').AsInteger := EmpresaGera;
  NFEntradas.Open;

  QCaixa.Close;
  QCaixa.ParamByName( 'CODEMP' ).AsInteger := EmpresaGera;
  QCaixa.ParamByName( 'DATAINI' ).AsDate := DATA_INCIO;
  QCaixa.ParamByName( 'DATAFIN' ).AsDate := DATA_Fim;
  QCaixa.Open;

  ConfigEFD.Close;
  ConfigEFD.ParamByName('CODEMP').AsInteger := EmpresaGera;
  ConfigEFD.Open;

end;

procedure TDMefd.FechaTudo;
begin 
  with PisCofins.Bloco_1 do
  begin 
    with Registro1001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  PisCofins.WriteBloco_1;
  PisCofins.WriteBloco_9;

  Produtos.Close;
  Medidas.Close;
  Clientes.Close;
  Empresa.Close;
  Contador.Close;
  NFSaidas.Close;
  ConfigEFD.Close;
  Fornecedores.Close;
  NFEntradas.Close;
  TREfd.Commit;
end;

// BLOCOS NAO UTILIZADOS COLOCAR SEM DADOS
procedure TDMefd.Bloco_a;
begin 
  frmSpedPis.AdicionaItem('Processando bloco A', 4);
  Application.processmessages;
  Sleep(100);
  with PisCofins.Bloco_a do
  begin 
    with RegistroA001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  PisCofins.WriteBloco_A(True);
end;

procedure TDMefd.Bloco_d;
begin 
  frmSpedPis.AdicionaItem('Processando bloco D', 4);
  Application.processmessages;
  Sleep(100);
  with PisCofins.Bloco_d do
  begin 
    with RegistroD001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  PisCofins.WriteBloco_D;
end;

procedure TDMefd.Bloco_f;
begin 
  frmSpedPis.AdicionaItem('Processando bloco F', 4);
  Application.processmessages;
  Sleep(100);
  with PisCofins.Bloco_f do
  begin 
    with RegistroF001New do
    begin 
      IND_MOV := imSemDados;
    end;
  end;
  PisCofins.WriteBloco_F;
end;
// FIM BLOCOS NAO UTILIZADOS

procedure TDMefd.Bloco_C;
var
  IItens: Integer;
begin 
  // Alimenta o componente com informações para gerar todos os registros do
  // Bloco C.
  frmSpedPis.AdicionaItem('Processando bloco C', 4);
  Application.processmessages;
  Sleep(100);
  with PisCofins.Bloco_C do
  begin 
    with RegistroC001New do
    begin 
      if NFSaidas.IsEmpty and NFEntradas.IsEmpty and QCaixa.IsEmpty then
      begin 
        IND_MOV := imSemDados;
//        PisCofins.WriteBloco_C(True);
        Exit;
      end
      else
        IND_MOV := imComDados;

      // C010 - Identificação do Estabelecimento
      with RegistroC010New do
      begin 
        CNPJ := RetiraCaracter(EmpresaCNPJ_EMP.AsString);
        IND_ESCRI := IndEscriIndividualizado;

        NFSaidas.First;
        while not NFSaidas.Eof do
        begin 
          // C100 - Documento - Nota Fiscal (código 01), Nota Fiscal Avulsa (código 1B), Nota
          // Fiscal de Produtor (código 04) e NF-e (código 55)
          with RegistroC100New do
          begin 
            frmSpedPis.AdicionaItem('Processando Nota Saida: ' +
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
            NUM_DOC := FormatFloat('000000000',
              NFSaidasNUMERO_NOTA_NF.AsInteger); //
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
                COD_PART := NFSaidasCOD_CLI.AsString
              else
                COD_PART := NFSaidasCOD_FOR.AsString;
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
            Itens_NFSAIDA.Close;
            Itens_NFSAIDA.ParamByName('CODNF').AsInteger :=
              NFSaidasCOD_NF.AsInteger;
            Itens_NFSAIDA.Open;
            IItens := 1;
            Itens_NFSAIDA.First;
            if not((COD_SIT = sdCancelado) or
              (COD_SIT = sdDoctoNumInutilizada)) then
              while not Itens_NFSAIDA.Eof do
              begin 
                // c170 - Complemento de Documento – Itens do Documento (códigos 01, 1B, 04 e 55)
                with RegistroC170New do // Inicio Adicionar os Itens:
                begin 
                  NUM_ITEM := FormatFloat('000', IItens);
                  COD_ITEM := FormataStringD( Itens_NFSAIDACOD_PRO.AsString, '8', '0');
                  DESCR_COMPL := Itens_NFSAIDANOME_PRO.AsString;
                  QTD := Itens_NFSAIDAQUANT.AsInteger;
                  // O último dígito deve ser ignorado no arquivo
                  UNID := Itens_NFSAIDAUNIDADE.AsString;
                  VL_ITEM := Itens_NFSAIDAVALOR_TOTAL.AsCurrency;
                  VL_DESC := Itens_NFSAIDADESCONTO.AsCurrency;
                  IND_MOV := mfSim;
                  if CSOSN(Itens_NFSAIDACOD_CFO.AsInteger) then
                    CST_ICMS := ConverteCST(Itens_NFSAIDACST.AsString)
                  else
                    CST_ICMS := ConverteCST(Itens_NFSAIDACSOSN_1.AsString);
                  // TACBrSituacaoTribICMS
                  CFOP := Trim(Itens_NFSAIDACOD_CFO.AsString);
                  COD_NAT := '';
                  // COD_NAT          := '64'; //Informar no 0400 antes de utilizá-lo
                  VL_BC_ICMS := Itens_NFSAIDABASE_CALCULO.AsCurrency;
                  ALIQ_ICMS := Itens_NFSAIDAALIQ.AsCurrency;
                  VL_ICMS := Itens_NFSAIDAVALOR_ICMS.AsCurrency;
                  VL_BC_ICMS_ST := Itens_NFSAIDABASE_SUBTRIB.AsCurrency;
                  ALIQ_ST := Itens_NFSAIDAVR_AGREGADO.AsCurrency;
                  VL_ICMS_ST := Itens_NFSAIDAVALOR_SUBTRIB.AsCurrency;
                  IND_APUR := iaMensal;

                  CST_IPI := ConverteIPI(Itens_NFSAIDACST_IPI.AsString);
                  COD_ENQ := '';
                  VL_BC_IPI := Itens_NFSAIDABASE_CALCULO.AsCurrency;
                  ALIQ_IPI := Itens_NFSAIDAALIQ_IPI.AsCurrency;
                  VL_IPI := Itens_NFSAIDAVALOR_IPI.AsCurrency;

                  CST_PIS := ConverteCSTPIS(Itens_NFSAIDACST_PIS.AsString);
                  VL_BC_PIS := Itens_NFSAIDABC_PIS.AsCurrency;
                  ALIQ_PIS_PERC := Itens_NFSAIDAALIQ_PIS.AsCurrency;
                  QUANT_BC_PIS := 0;
                  ALIQ_PIS_R := 0;
                  VL_PIS := Itens_NFSAIDAVALOR_PIS.AsCurrency;

                  CST_COFINS :=
                    ConverteCSTCOFINS(Itens_NFSAIDACST_COFINS.AsString);
                  VL_BC_COFINS := Itens_NFSAIDABC_COFINS.AsCurrency;
                  ALIQ_COFINS_PERC := Itens_NFSAIDAALIQ_COFINS.AsCurrency;
                  QUANT_BC_COFINS := 0;
                  ALIQ_COFINS_R := 0;
                  VL_COFINS := Itens_NFSAIDAVALOR_COFINS.AsCurrency;
                  COD_CTA := '01'; // Baseado no 0500
                end; // Fim dos Itens;
                IItens := IItens + 1;
                Itens_NFSAIDA.Next;
              end;
            Itens_NFSAIDA.Close;

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
            frmSpedPis.AdicionaItem('Processando Nota Ent: ' +
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
                COD_ITEM := FormataStringD( Itens_NFEntradasCOD_PRO.AsString, '8', '0' );
                DESCR_COMPL := Itens_NFEntradasNOME_PRO.AsString;
                QTD := Itens_NFEntradasQTDUND_ENT.AsCurrency;
                // O último dígito deve ser ignorado no arquivo
                UNID := Itens_NFEntradasUNID.AsString;
                VL_ITEM := Itens_NFEntradasVALOR_TOTAL.AsCurrency;
                VL_DESC := Itens_NFEntradasVALOR_DESCONTO.AsCurrency;
                IND_MOV := mfSim;
                CST_ICMS := ConverteCST(Itens_NFEntradasCST.AsString);
                CFOP := Itens_NFEntradasCOD_CFOP.AsString;
                COD_NAT := '';
                // COD_NAT          := '64'; //Informar no 0400 antes de utilizá-lo
                VL_BC_ICMS := Itens_NFEntradasBASE_CALCULO.AsCurrency;
                ALIQ_ICMS := Itens_NFEntradasPERC_ICMS.AsCurrency;
                ALIQ_ST := Itens_NFEntradasPERC_ST.AsCurrency;
                VL_ICMS_ST := Itens_NFEntradasVALOR_SUB_TRIBUTARIA.AsCurrency;
                IND_APUR := iaMensal;
                CST_IPI := ConverteIPI(Itens_NFEntradasCST_IPI.AsString);
                // FAZER FALTA CAMPO
                COD_ENQ := '';
                VL_BC_IPI := Itens_NFEntradasBASE_CALCULO.AsCurrency;
                ALIQ_IPI := Itens_NFEntradasPERC_IPI.AsCurrency;
                VL_IPI := Itens_NFEntradasVALOR_IPI.AsCurrency;
                CST_PIS := ConverteCSTPIS(Itens_NFEntradasCST_PIS.AsString);
                // FALTA
                VL_BC_PIS := Itens_NFEntradasBASE_CALCULO.AsCurrency; // COLOCAR
                ALIQ_PIS_PERC := Itens_NFEntradasALIQ_PIS.AsCurrency;
                // COLOCAR CAMPO
                QUANT_BC_PIS := 0;
                ALIQ_PIS_R := 0;
                VL_PIS := Itens_NFEntradasVALOR_PIS.AsCurrency; // COLOCAR CAMPO
                CST_COFINS := ConverteCSTCOFINS
                  (Itens_NFEntradasCST_COFINS.AsString); // FAZER COLOCAR CAMPO
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
          NFEntradas.Next;
        end;

        // VENDAS CUPOM
        Qcaixa.First;
        while not QCaixa.Eof do
           begin 
               frmSpedPis.AdicionaItem('Processando ECF: ' +
               QCaixaR01_MODELO_ECF.AsString + ' - ' + QCaixaR01_NUMERO_SERIE.AsString, 6);

               Application.processmessages;

              with RegistroC400New do
                  begin 

                     COD_MOD := QCaixaMODELO.AsString;
                     ECF_MOD := QCaixaR01_MODELO_ECF.AsString;
                     ECF_FAB := QCaixaR01_NUMERO_SERIE.AsString;
                     ECF_CX  := QCaixaR01_NUMERO_USUARIO.AsInteger;

                     Reducoes.Close;
                     Reducoes.ParamByName( 'CODCAI' ).AsInteger := QCaixaCOD_CAI.AsInteger;
                     Reducoes.ParamByName( 'DATAINI' ).AsDate := DATA_INCIO;
                     Reducoes.ParamByName( 'DATAFIN' ).AsDate := DATA_Fim;
                     Reducoes.Open;
                     Reducoes.First;
                     while not Reducoes.Eof do
                        begin 
                           with RegistroC405New do
                              begin 
                                 DT_DOC := ReducoesDATA.AsDateTime;
                                 CRO    := ReducoesCRO.AsInteger;
                                 CRZ    := ReducoesCRZ.AsInteger;
                                 NUM_COO_FIN := ReducoesCOO_FINAL.AsInteger;
                                 GT_FIN := ReducoesGT_FINAL.AsFloat;
                                 VL_BRT := ReducoesVENDA_BRUTA.AsCurrency;

                                 C481PIS.Close;
                                 C481PIS.ParamByName( 'CODCAI' ).AsInteger := QCaixaCOD_CAI.AsInteger;
                                 C481PIS.ParamByName( 'CODEMP' ).AsInteger := EmpresaGera;
                                 C481PIS.ParamByName( 'DATAINI' ).AsDate := ReducoesDATA.AsDateTime;
                                 C481PIS.ParamByName( 'DATAFIN' ).AsDate := ReducoesDATA.AsDateTime;
                                 C481PIS.Open;
                                 C481PIS.First;
                                 while not C481PIS.Eof do
                                    begin 
                                       with RegistroC481New do
                                          begin 
                                             CST_PIS := StrToCstPis( C481PISCST_PIS.AsString );
                                             VL_ITEM := C481PISTOTAL.AsCurrency;
                                             VL_BC_PIS := C481PISBC.AsCurrency;
                                             ALIQ_PIS := C481PISALIQUOTA_PIS.AsFloat;
                                             QUANT_BC_PIS := 0;
                                             ALIQ_PIS_QUANT := 0;
                                             VL_PIS := C481PISVALOR.AsCurrency;
                                             COD_ITEM := FormataStringD( C481PISCOD_PRO.AsString, '8', '0' );


                                             COD_CTA := '01';
                                          end;
                                       C481PIS.Next;
                                    end;
                                 C481PIS.Close;

                                 C485COFINS.Close;
                                 C485COFINS.ParamByName( 'CODCAI' ).AsInteger := QCaixaCOD_CAI.AsInteger;
                                 C485COFINS.ParamByName( 'CODEMP' ).AsInteger := EmpresaGera;
                                 C485COFINS.ParamByName( 'DATAINI' ).AsDate := ReducoesDATA.AsDateTime;
                                 C485COFINS.ParamByName( 'DATAFIN' ).AsDate := ReducoesDATA.AsDateTime;
                                 C485COFINS.Open;
                                 C485COFINS.First;
                                 while not C485COFINS.Eof do
                                    begin 
                                       with RegistroC485New do
                                          begin 
                                             CST_COFINS := StrToCstCofins( C485COFINSCST_COFINS.AsString );
                                             VL_ITEM := C485COFINSTOTAL.AsCurrency;
                                             VL_BC_COFINS := C485COFINSBC.AsCurrency;
                                             ALIQ_COFINS := C485COFINSALIQUOTA_COFINS.AsFloat;
                                             QUANT_BC_COFINS := 0;
                                             ALIQ_COFINS_QUANT := 0;
                                             VL_COFINS := C485COFINSVALOR.AsCurrency;
                                             COD_ITEM := FormataStringD( C485COFINSCOD_PRO.AsString, '8', '0' );
                                             COD_CTA := '01';
                                          end;
                                       C485COFINS.Next;
                                    end;
                                 C485COFINS.Close;


                              end;
                           Reducoes.Next;
                        end;


                  end;

              QCaixa.Next;
           end;

      end;
    end;
  end;
//  PisCofins.WriteBloco_C(True); // True, fecha o Bloco
end;

function TDMefd.FTIPO_ITEM(I: string): TACBrTipoItem;
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

function TDMefd.BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
begin
  if not DM.IBTransaction.Active then
     DM.IBDatabase.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.sql.Clear;
  dm.QConsulta.sql.Text :=
    'SELECT C.COD_CTR, C.PARCELA_CTR, C.VENCTO_CTR, C.VALOR_CTR, C.numdocumento_ctr '
    + 'FROM CONTAS_RECEBER C WHERE C.numdocumento_ctr = :CODNF ' +
    'ORDER BY C.VENCTO_CTR';

  dm.QConsulta.ParamByName('codnf').AsString := 'NF ' + inttostr(COD_NF);
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
  if DM.IBTransaction.Active then
     dm.IBTransaction.Commit;
end;

function TDMefd.BuscaPagENT(COD_NF: Integer): TACBrTipoPagamento;
begin 
  dm.QConsulta.Close;
  dm.QConsulta.sql.Clear;
  dm.QConsulta.sql.Text :=
    'SELECT * FROM CONTAS_PAGAR WHERE NUM_DOC_CTP =:CODNF ' +
    'ORDER BY DTVENCTO_CTP';

  dm.QConsulta.ParamByName('codnf').AsString := inttostr(COD_NF);
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

function TDMefd.ConverteCST(CST: string): TACBrSituacaoTribICMS;
begin 

  if Trim(CST) = '000' then
    result := sticmsTributadaIntegralmente;
  if Trim(CST) = '010' then
    result := sticmsTributadaComCobracaPorST;
  if Trim(CST) = '020' then
    result := sticmsComReducao;
  if Trim(CST) = '030' then
    result := sticmsIsentaComCobracaPorST;
  if Trim(CST) = '040' then
    result := sticmsIsenta;
  if Trim(CST) = '042' then
    result := sticmsNaoTributada;
  if Trim(CST) = '050' then
    result := sticmsSuspensao;
  if Trim(CST) = '051' then
    result := sticmsDiferimento;
  if Trim(CST) = '060' then
    result := sticmsCobradoAnteriormentePorST;
  if Trim(CST) = '070' then
    result := sticmsComReducaoPorST;
  if Trim(CST) = '090' then
    result := sticmsOutros;
  if Trim(CST) = '101' then
    result := sticmsEstrangeiraImportacaoDiretaTributadaIntegralmente;
  if Trim(CST) = '110' then
    result := sticmsEstrangeiraImportacaoDiretaTributadaComCobracaPorST;
  if Trim(CST) = '120' then
    result := sticmsEstrangeiraImportacaoDiretaComReducao;
  if Trim(CST) = '130' then
    result := sticmsEstrangeiraImportacaoDiretaIsentaComCobracaPorST;
  if Trim(CST) = '140' then
    result := sticmsEstrangeiraImportacaoDiretaIsenta;
  if Trim(CST) = '141' then
    result := sticmsEstrangeiraImportacaoDiretaNaoTributada;
  if Trim(CST) = '150' then
    result := sticmsEstrangeiraImportacaoDiretaSuspensao;
  if Trim(CST) = '151' then
    result := sticmsEstrangeiraImportacaoDiretaDiferimento;
  if Trim(CST) = '160' then
    result := sticmsEstrangeiraImportacaoDiretaCobradoAnteriormentePorST;
  if Trim(CST) = '170' then
    result := sticmsEstrangeiraImportacaoDiretaComReducaoPorST;
  if Trim(CST) = '190' then
    result := sticmsEstrangeiraImportacaoDiretaOutros;
  if Trim(CST) = '200' then
    result := sticmsEstrangeiraAdqMercIntTributadaIntegralmente;
  if Trim(CST) = '210' then
    result := sticmsEstrangeiraAdqMercIntTributadaComCobracaPorST;
  if Trim(CST) = '220' then
    result := sticmsEstrangeiraAdqMercIntComReducao;
  if Trim(CST) = '230' then
    result := sticmsEstrangeiraAdqMercIntIsentaComCobracaPorST;
  if Trim(CST) = '240' then
    result := sticmsEstrangeiraAdqMercIntIsenta;
  if Trim(CST) = '241' then
    result := sticmsEstrangeiraAdqMercIntNaoTributada;
  if Trim(CST) = '250' then
    result := sticmsEstrangeiraAdqMercIntSuspensao;
  if Trim(CST) = '251' then
    result := sticmsEstrangeiraAdqMercIntDiferimento;
  if Trim(CST) = '260' then
    result := sticmsEstrangeiraAdqMercIntCobradoAnteriormentePorST;
  if Trim(CST) = '270' then
    result := sticmsEstrangeiraAdqMercIntComReducaoPorST;
  if Trim(CST) = '290' then
    result := sticmsEstrangeiraAdqMercIntOutros;
  if Trim(CST) = '101' then
    result := sticmsSimplesNacionalTributadaComPermissaoCredito;
  if Trim(CST) = '102' then
    result := sticmsSimplesNacionalTributadaSemPermissaoCredito;
  if Trim(CST) = '103' then
    result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBruta;
  if Trim(CST) = '201' then
    result := sticmsSimplesNacionalTributadaComPermissaoCreditoComST;
  if Trim(CST) = '202' then
    result := sticmsSimplesNacionalTributadaSemPermissaoCreditoComST;
  if Trim(CST) = '203' then
    result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBrutaComST;
  if Trim(CST) = '300' then
    result := sticmsSimplesNacionalImune;
  if Trim(CST) = '400' then
    result := sticmsSimplesNacionalNaoTributada;
  if Trim(CST) = '500' then
    result := sticmsSimplesNacionalCobradoAnteriormentePorST;
  if Trim(CST) = '900' then
    result := sticmsSimplesNacionalOutros;
end;

function TDMefd.CSOSN(CFOP: Integer): Boolean;
begin 
  dm.QConsulta.Close;
  dm.QConsulta.sql.Clear;
  dm.QConsulta.sql.Text := 'SELECT * FROM CFOP WHERE COD_CFO = :COD_CFO';
  dm.QConsulta.ParamByName('COD_CFO').AsInteger := CFOP;
  dm.QConsulta.Open;
  if Trim(dm.QConsulta.FieldByName('USA_CSOSN').AsString) = 'S' then
    result := True
  else
    result := False;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

procedure TDMefd.DataModuleCreate(Sender: TObject);
begin 
   SqlEmpresa := EmpresaFilha.SQL.Text;
end;

function TDMefd.ConverteIPI(CSTIPI: string): TACBrSituacaoTribIPI;
begin 
  if Trim(CSTIPI) = '00' then
    result := stipiEntradaRecuperacaoCredito;
  // '00' // Entrada com recuperação de crédito
  if Trim(CSTIPI) = '01' then
    result := stipiEntradaTributradaZero;
  // '01' // Entrada tributada com alíquota zero
  if Trim(CSTIPI) = '02' then
    result := stipiEntradaIsenta; // '02' // Entrada isenta
  if Trim(CSTIPI) = '03' then
    result := stipiEntradaNaoTributada; // '03' // Entrada não-tributada
  if Trim(CSTIPI) = '04' then
    result := stipiEntradaImune; // '04' // Entrada imune
  if Trim(CSTIPI) = '05' then
    result := stipiEntradaComSuspensao; // '05' // Entrada com suspensão
  if Trim(CSTIPI) = '49' then
    result := stipiOutrasEntradas; // '49' // Outras entradas
  if Trim(CSTIPI) = '50' then
    result := stipiSaidaTributada; // '50' // Saída tributada
  if Trim(CSTIPI) = '51' then
    result := stipiSaidaTributadaZero;
  // '51' // Saída tributada com alíquota zero
  if Trim(CSTIPI) = '52' then
    result := stipiSaidaIsenta; // '52' // Saída isenta
  if Trim(CSTIPI) = '53' then
    result := stipiSaidaNaoTributada; // '53' // Saída não-tributada
  if Trim(CSTIPI) = '54' then
    result := stipiSaidaImune; // '54' // Saída imune
  if Trim(CSTIPI) = '55' then
    result := stipiSaidaComSuspensao; // '55' // Saída com suspensão
  if Trim(CSTIPI) = '99' then
    result := stipiOutrasSaidas; // '99' // Outras saídas
end;

function TDMefd.ConverteCSTPIS(CSTPIS: string): TACBrSituacaoTribPIS;
begin 
  if Trim(CSTPIS) = '01' then
    result := stpisValorAliquotaNormal;
  if Trim(CSTPIS) = '02' then
    result := stpisValorAliquotaDiferenciada;
  if Trim(CSTPIS) = '03' then
    result := stpisQtdeAliquotaUnidade;
  if Trim(CSTPIS) = '04' then
    result := stpisMonofaticaAliquotaZero;
  if Trim(CSTPIS) = '05' then
    result := stpisValorAliquotaPorST;
  if Trim(CSTPIS) = '06' then
    result := stpisAliquotaZero;
  if Trim(CSTPIS) = '07' then
    result := stpisIsentaContribuicao;
  if Trim(CSTPIS) = '08' then
    result := stpisSemIncidenciaContribuicao;
  if Trim(CSTPIS) = '09' then
    result := stpisSuspensaoContribuicao;
  if Trim(CSTPIS) = '49' then
    result := stpisOutrasOperacoesSaida;
  if Trim(CSTPIS) = '50' then
    result := stpisOperCredExcRecTribMercInt;
  if Trim(CSTPIS) = '51' then
    result := stpisOperCredExcRecNaoTribMercInt;
  if Trim(CSTPIS) = '52' then
    result := stpisOperCredExcRecExportacao;
  if Trim(CSTPIS) = '53' then
    result := stpisOperCredRecTribNaoTribMercInt;
  if Trim(CSTPIS) = '54' then
    result := stpisOperCredRecTribMercIntEExportacao;
  if Trim(CSTPIS) = '55' then
    result := stpisOperCredRecNaoTribMercIntEExportacao;
  if Trim(CSTPIS) = '56' then
    result := stpisOperCredRecTribENaoTribMercIntEExportacao;
  if Trim(CSTPIS) = '60' then
    result := stpisCredPresAquiExcRecTribMercInt;
  if Trim(CSTPIS) = '61' then
    result := stpisCredPresAquiExcRecNaoTribMercInt;
  if Trim(CSTPIS) = '62' then
    result := stpisCredPresAquiExcExcRecExportacao;
  if Trim(CSTPIS) = '63' then
    result := stpisCredPresAquiRecTribNaoTribMercInt;
  if Trim(CSTPIS) = '64' then
    result := stpisCredPresAquiRecTribMercIntEExportacao;
  if Trim(CSTPIS) = '65' then
    result := stpisCredPresAquiRecNaoTribMercIntEExportacao;
  if Trim(CSTPIS) = '66' then
    result := stpisCredPresAquiRecTribENaoTribMercIntEExportacao;
  if Trim(CSTPIS) = '67' then
    result := stpisOutrasOperacoes_CredPresumido;
  if Trim(CSTPIS) = '70' then
    result := stpisOperAquiSemDirCredito;
  if Trim(CSTPIS) = '71' then
    result := stpisOperAquiComIsensao;
  if Trim(CSTPIS) = '72' then
    result := stpisOperAquiComSuspensao;
  if Trim(CSTPIS) = '73' then
    result := stpisOperAquiAliquotaZero;
  if Trim(CSTPIS) = '74' then
    result := stpisOperAqui_SemIncidenciaContribuicao;
  if Trim(CSTPIS) = '75' then
    result := stpisOperAquiPorST;
  if Trim(CSTPIS) = '98' then
    result := stpisOutrasOperacoesEntrada;
  if Trim(CSTPIS) = '99' then
    result := stpisOutrasOperacoes;
end;

function TDMefd.ConverteCSTCOFINS(CSTCOFINS: string): TACBrSituacaoTribCOFINS;
begin 
  if Trim(CSTCOFINS) = '01' then
    result := stcofinsValorAliquotaNormal;
  if Trim(CSTCOFINS) = '02' then
    result := stcofinsValorAliquotaDiferenciada;
  if Trim(CSTCOFINS) = '03' then
    result := stcofinsQtdeAliquotaUnidade;
  if Trim(CSTCOFINS) = '04' then
    result := stcofinsMonofaticaAliquotaZero;
  if Trim(CSTCOFINS) = '05' then
    result := stcofinsValorAliquotaPorST;
  if Trim(CSTCOFINS) = '06' then
    result := stcofinsAliquotaZero;
  if Trim(CSTCOFINS) = '07' then
    result := stcofinsIsentaContribuicao;
  if Trim(CSTCOFINS) = '08' then
    result := stcofinsSemIncidenciaContribuicao;
  if Trim(CSTCOFINS) = '09' then
    result := stcofinsSuspensaoContribuicao;
  if Trim(CSTCOFINS) = '49' then
    result := stcofinsOutrasOperacoesSaida;
  if Trim(CSTCOFINS) = '50' then
    result := stcofinsOperCredExcRecTribMercInt;
  if Trim(CSTCOFINS) = '51' then
    result := stcofinsOperCredExcRecNaoTribMercInt;
  if Trim(CSTCOFINS) = '52' then
    result := stcofinsOperCredExcRecExportacao;
  if Trim(CSTCOFINS) = '53' then
    result := stcofinsOperCredRecTribNaoTribMercInt;
  if Trim(CSTCOFINS) = '54' then
    result := stcofinsOperCredRecTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '55' then
    result := stcofinsOperCredRecNaoTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '56' then
    result := stcofinsOperCredRecTribENaoTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '60' then
    result := stcofinsCredPresAquiExcRecTribMercInt;
  if Trim(CSTCOFINS) = '61' then
    result := stcofinsCredPresAquiExcRecNaoTribMercInt;
  if Trim(CSTCOFINS) = '62' then
    result := stcofinsCredPresAquiExcExcRecExportacao;
  if Trim(CSTCOFINS) = '63' then
    result := stcofinsCredPresAquiRecTribNaoTribMercInt;
  if Trim(CSTCOFINS) = '64' then
    result := stcofinsCredPresAquiRecTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '65' then
    result := stcofinsCredPresAquiRecNaoTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '66' then
    result := stcofinsCredPresAquiRecTribENaoTribMercIntEExportacao;
  if Trim(CSTCOFINS) = '67' then
    result := stcofinsOutrasOperacoes_CredPresumido;
  if Trim(CSTCOFINS) = '70' then
    result := stcofinsOperAquiSemDirCredito;
  if Trim(CSTCOFINS) = '71' then
    result := stcofinsOperAquiComIsensao;
  if Trim(CSTCOFINS) = '72' then
    result := stcofinsOperAquiComSuspensao;
  if Trim(CSTCOFINS) = '73' then
    result := stcofinsOperAquiAliquotaZero;
  if Trim(CSTCOFINS) = '74' then
    result := stcofinsOperAqui_SemIncidenciaContribuicao;
  if Trim(CSTCOFINS) = '75' then
    result := stcofinsOperAquiPorST;
  if Trim(CSTCOFINS) = '98' then
    result := stcofinsOutrasOperacoesEntrada;
  if Trim(CSTCOFINS) = '99' then
    result := stcofinsOutrasOperacoes;
end;

procedure TDMefd.PisCofinsError(const MsnError: string);
begin
  frmSpedPis.AdicionaItem(MsnError, 0);
  frmSpedPis.Errogeracao := True;
end;

function TDMefd.ProcessaChave(Chave: String): string;
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

end.
