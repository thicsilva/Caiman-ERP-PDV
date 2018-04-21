unit UDM;

interface

uses
  SysUtils, Classes, DB, Forms, menus, Dialogs, IniFiles, Controls, QRExport,
  RDprint, ACBrNFeDANFEClass, ACBrNFe, pcnConversao, MIDASLIB,
  ACBrNFeDANFEFR, ACBrBoleto, ACBrBoletoFCFR, ACBrBase, UDialog,
  Graphics, acAlphaImageList, Grids, ExtDlgs,
  rxCurrEdit, DateUtils, DBGrids, RzCmboBx, RzDBCmbo, DBCtrls, StdCtrls, Mask,
  ComCtrls, ExtCtrls, UNovoFormulario,
  ACBrSintegra, StrUtils, cxLookAndFeelPainters, cxGraphics, dxSkinsCore,
  dxSkinMetropolis, Vcl.ImgList, cxClasses, dxAlertWindow, Winapi.MMSystem,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, ACBrNFeDANFEFRDM,
  ACBrDFe, pcnConversaoNFe, System.IOUtils, AcbrUtil, IdSMTP, IdSSLOpenSSL,
  IdAttachmentFile, IdMessage, IdText, IdExplicitTLSClientServerBase,
  dxSkinDevExpressStyle, dxSkinGlassOceans, dxSkinMoneyTwins, dxSkinSummer2008,
  dxSkinVS2010, dxSkinWhiteprint, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Phys.FBDef, System.ImageList;

type
  TAligatorAlertas = ( alertErro, alertOK, alertFinanceiro, alertTarefas, alertFinanceiroRed );
  TDM = class(TDataModule)
    IBDatabase: TFDConnection;
    IBTransaction: TFDTransaction;
    Consulta: TFDQuery;
    IBSQLCod: TFDQuery;
    QLab: TFDQuery;
    DSLab: TDataSource;
    QLabCOD_LAB: TIntegerField;
    QLabNOME_LAB: TStringField;
    QConv: TFDQuery;
    DSConv: TDataSource;
    QConvCOD_CON: TIntegerField;
    QConvNOME_CON: TStringField;
    QConvEND_CON: TStringField;
    QConvBAI_CON: TStringField;
    QConvCID_CON: TStringField;
    QConvCEP_CON: TStringField;
    QConvTEL_CON: TStringField;
    QConvFAX_CON: TStringField;
    QConvATIVO_CON: TStringField;
    QConvRESPONSAVEL_CON: TStringField;
    QConvCNPJ_CON: TStringField;
    QConvINSC_CON: TStringField;
    QConvEST_CON: TStringField;
    QCla: TFDQuery;
    DSCla: TDataSource;
    QClaCOD_CLA: TIntegerField;
    QClaNOME_CLA: TStringField;
    QCli: TFDQuery;
    DSCli: TDataSource;
    QCliCOD_CLI: TIntegerField;
    QCliFJ_CLI: TStringField;
    QCliNOME_CLI: TStringField;
    QCliCOD_CLA: TIntegerField;
    QCliENDRES_CLI: TStringField;
    QCliBAIRES_CLI: TStringField;
    QCliCIDRES_CLI: TStringField;
    QCliESTRES_CLI: TStringField;
    QCliCEPRES_CLI: TStringField;
    QCliTELRES_CLI: TStringField;
    QCliENDCOM_CLI: TStringField;
    QCliBAICOM_CLI: TStringField;
    QCliCIDCOM_CLI: TStringField;
    QCliESTCOM_CLI: TStringField;
    QCliCEPCOM_CLI: TStringField;
    QCliTELCOM_CLI: TStringField;
    QCliCNPJ_CLI: TStringField;
    QCliDOC_CLI: TStringField;
    QCliPAI_CLI: TStringField;
    QCliMAE_CLI: TStringField;
    QCliCONJUGE_CLI: TStringField;
    QCliESTCIVIL_CLI: TStringField;
    QCliRENDA_CLI: TBCDField;
    QCliLIMITE_CLI: TBCDField;
    QCliPROFISSAO_CLI: TStringField;
    QCliEMPRESA_TRAB_CLI: TStringField;
    QCliATIVO_CLI: TStringField;
    QCliCOD_CON: TIntegerField;
    QCliNOME_CON: TStringField;
    QCliNOME_CLA: TStringField;
    QEmp: TFDQuery;
    DSEmp: TDataSource;
    QEmpCOD_EMP: TIntegerField;
    QEmpRAZAO_EMP: TStringField;
    QEmpEND_EMP: TStringField;
    QEmpBAI_EMP: TStringField;
    QEmpCID_EMP: TStringField;
    QEmpCEP_EMP: TStringField;
    QEmpEST_EMP: TStringField;
    QEmpCNPJ_EMP: TStringField;
    QEmpINSC_EMP: TStringField;
    QEmpTEL_EMP: TStringField;
    QEmpFAX_EMP: TStringField;
    QFor: TFDQuery;
    DSFor: TDataSource;
    QForCOD_FOR: TIntegerField;
    QForFJ_FOR: TStringField;
    QForRAZAO_FOR: TStringField;
    QForEND_FOR: TStringField;
    QForBAI_FOR: TStringField;
    QForCID_FOR: TStringField;
    QForCEP_FOR: TStringField;
    QForEST_FOR: TStringField;
    QForCNPJ_FOR: TStringField;
    QForINSC_FOR: TStringField;
    QForTEL_FOR: TStringField;
    QForFAX_FOR: TStringField;
    QForCONTATO_FOR: TStringField;
    QBanco: TFDQuery;
    QBancoCOD_BAN: TIntegerField;
    QBancoNOME_BAN: TStringField;
    DSBanco: TDataSource;
    QConta: TFDQuery;
    QContaCOD_CONTA: TIntegerField;
    QContaNOME_CONTA: TStringField;
    DSConta: TDataSource;
    QMotivo: TFDQuery;
    DSMotivo: TDataSource;
    QMotivoCOD_MOT: TIntegerField;
    QMotivoNOME_MOT: TStringField;
    QMotivoENTSAI_MOT: TStringField;
    QGRP: TFDQuery;
    QGRPCOD_GRP: TIntegerField;
    QGRPNOME_GRP: TStringField;
    QGRPALIQUOTA_GRP: TBCDField;
    DSGRP: TDataSource;
    QSec: TFDQuery;
    QSecCOD_SEC: TIntegerField;
    QSecNOME_SEC: TStringField;
    DSSec: TDataSource;
    QTipoVenda: TFDQuery;
    DSTipoVenda: TDataSource;
    QTipoVendaCOD_TPV: TIntegerField;
    QTipoVendaNOME_TPV: TStringField;
    QTipoVendaQTDPARCELAS_TPV: TIntegerField;
    QTipoVendaDIASPRIPARC_TPV: TIntegerField;
    QTipoVendaDIASENTREPARC_TPV: TIntegerField;
    QCaixa: TFDQuery;
    DSCaixa: TDataSource;
    QProd: TFDQuery;
    QProdNOME_PRO: TStringField;
    QProdCOD_LAB: TIntegerField;
    QProdCOD_SEC: TIntegerField;
    QProdVALOR_PRO: TBCDField;
    QProdPROMOCAO_PRO: TBCDField;
    QProdCOMISSAO_PRO: TBCDField;
    QProdQUANT_UNIDADE_ENTRADA: TBCDField;
    QProdNOME_LAB: TStringField;
    QProdNOME_SEC: TStringField;
    DSProd: TDataSource;
    QCliOBS_VENDA: TStringField;
    QCliOBS_CLI: TStringField;
    QProdESTOQUE_MINIMO_PRO: TBCDField;
    QCliNASCIMENTO_CLI: TDateField;
    QCliDATACADASTRO_CLI: TDateField;
    QFunc: TFDQuery;
    DSFunc: TDataSource;
    QFuncCOD_FUN: TIntegerField;
    QFuncDATA_ADM_FUN: TDateField;
    QFuncDATA_DEM_FUN: TDateField;
    QFuncNOME_FUN: TStringField;
    QFuncEND_FUN: TStringField;
    QFuncBAI_FUN: TStringField;
    QFuncCID_FUN: TStringField;
    QFuncCEP_FUN: TStringField;
    QFuncEST_FUN: TStringField;
    QFuncCPF_FUN: TStringField;
    QFuncDOC_FUN: TStringField;
    QFuncTEL_FUN: TStringField;
    QFuncCEL_FUN: TStringField;
    QFuncOBS: TStringField;
    QUsu: TFDQuery;
    DSUsu: TDataSource;
    QCliATRAZO_MAXIMO_CLI: TIntegerField;
    QCliCELULAR_CLI: TStringField;
    QProdATIVO_PRO: TStringField;
    QProdMARGEM_LUCRO_PRO: TBCDField;
    QProdLOCALIZACAO_PRO: TStringField;
    QConvOBS_AUTORIZACAO_CON: TStringField;
    QConvDIA_REFERENCIA_CON: TIntegerField;
    QUsuCOD_USU: TIntegerField;
    QUsuNOME_USU: TStringField;
    QUsuSENHA_USU: TStringField;
    QUsuCOD_GRUPO: TIntegerField;
    QAcesso: TFDQuery;
    QHabilitaMenu: TFDQuery;
    QCliIMP_SALDO_PENDENTE_CLI: TStringField;
    QConvDESCONTO_CON: TBCDField;
    QSetor: TFDQuery;
    DSSetor: TDataSource;
    QSetorCOD_SET: TIntegerField;
    QSetorNOME_SET: TStringField;
    QProdPRODUTO_PESADO_PRO: TStringField;
    QProdCOD_SETOR: TIntegerField;
    QProdTECLA_ATALHO_PRO: TIntegerField;
    QProdINDICE_RECEITA_PRO: TIntegerField;
    QProdDIAS_VALIDADE_PRO: TIntegerField;
    QProdNOME_SET: TStringField;
    QTipoES: TFDQuery;
    DSTipoES: TDataSource;
    QTipoESCOD_ES: TIntegerField;
    QTipoESNOME_ES: TStringField;
    QTipoESTIPO_ES: TStringField;
    QTipoVendaPOSSUI_ENTRADA: TStringField;
    QTipoVendaPERC_ENTRADA: TBCDField;
    QProdREFERENCIA_PRO: TStringField;
    QTipoDoc: TFDQuery;
    QTipoDocCOD_DOC: TIntegerField;
    QTipoDocNOME_DOC: TStringField;
    DSTipoDoc: TDataSource;
    QRelRepasse: TFDQuery;
    QRelRepasseAGENCIA_CHE: TStringField;
    QRelRepasseCOD_CHE: TIntegerField;
    QRelRepasseCONTA_CHE: TStringField;
    QRelRepasseEMISSAO_CHE: TDateField;
    QRelRepasseNUMERO_CHE: TStringField;
    QRelRepasseVALOR_CHE: TBCDField;
    QRelRepasseNOME_BAN: TStringField;
    QRelRepasseNOME_CLI: TStringField;
    QRelRepasseVENCTO_CHE: TDateField;
    DSTipoCobranca: TDataSource;
    QTipoCobranca: TFDQuery;
    QTipoCobrancaCOD_COB: TIntegerField;
    QTipoCobrancaNOME_COB: TStringField;
    QProdCOMPLEMENTO_PRO: TStringField;
    QCFOP: TFDQuery;
    DSCFOP: TDataSource;
    QCFOPCOD_CFO: TIntegerField;
    QEmpNOME_EMP_ETIQUETA: TStringField;
    QEmpNUMERO_EMP: TStringField;
    QEmpRESP_EMP: TStringField;
    QTransp: TFDQuery;
    DSTransp: TDataSource;
    QTranspCOD_TRA: TIntegerField;
    QTranspFJ_TRA: TStringField;
    QTranspNOME_TRA: TStringField;
    QTranspEND_TRA: TStringField;
    QTranspCID_TRA: TStringField;
    QTranspEST_TRA: TStringField;
    QTranspCNPJ_TRA: TStringField;
    QTranspINSC_TRA: TStringField;
    QTranspPLACA_TRA: TStringField;
    QTranspUF_PLACA_TRA: TStringField;
    QCFOPINF_COMPL_NF: TMemoField;
    QProdCAMINHO_FOTO_PRO: TStringField;
    QSecCAMINHO_FOTO_SEC: TStringField;
    QEmpCAMINHO_FOTO_EMP: TStringField;
    QCFOPDESTACA_ICMS: TStringField;
    QCliNEGATIVADO: TStringField;
    QBancoLINHA_EMISSAO_BOLETO: TIntegerField;
    QBancoCOL_EMISSAO_BOLETO: TIntegerField;
    QBancoLINHA_DOC_BOLETO: TIntegerField;
    QBancoCOL_DOC_BOLETO: TIntegerField;
    QBancoLINHA_VENC_BOLETO: TIntegerField;
    QBancoCOL_VENC_BOLETO: TIntegerField;
    QBancoLINHA_VALOR_BOLETO: TIntegerField;
    QBancoCOL_VALOR_BOLETO: TIntegerField;
    QBancoLINHA_INST_BOLETO: TIntegerField;
    QBancoCOL_INST_BOLETO: TIntegerField;
    QBancoLINHA_SACADO_BOLETO: TIntegerField;
    QBancoCOL_SACADO_BOLETO: TIntegerField;
    QCliLIMITE_CHEQUE: TBCDField;
    QAdmCartao: TFDQuery;
    DSAdmCartao: TDataSource;
    QCliDATA_CONSULTA_SPC: TDateField;
    QCliDATA_REGISTRO_SPC: TDateField;
    QCliDATA_REABILITACAO_SPC: TDateField;
    QEmpFANTASIA_EMP: TStringField;
    QCliSELECIONADO_CLI: TStringField;
    QCliRENDA_CONJUGE: TBCDField;
    QCliTRABALHO_CONJUGE: TStringField;
    QCliPROF_CONJUGE: TStringField;
    QProdSAIR_TABELA_PRECO: TStringField;
    QEmpMOSTRAR_SITCLI_PREVENDA: TStringField;
    QGRPTIPO_GRP: TStringField;
    QProdICMS_CONT_EST: TIntegerField;
    QProdICMS_CONT_FORA: TIntegerField;
    QProdICMS_CF_EST: TIntegerField;
    QProdICMS_CF_FORA: TIntegerField;
    QProdCST_CONT_EST: TStringField;
    QProdCST_CONT_FORA: TStringField;
    QProdCST_CF_EST: TStringField;
    QProdCST_CF_FORA: TStringField;
    QProdCFOP_VENDAS_CONT_EST: TIntegerField;
    QProdCFOP_VENDAS_CF_EST: TIntegerField;
    QProdCFOP_VENDAS_CONT_FORA: TIntegerField;
    QProdCFOP_VENDAS_CF_FORA: TIntegerField;
    QProdST_CONT_EST: TStringField;
    QProdVR_AGREG_CONT_EST: TBCDField;
    QProdIPI_CONT_EST: TBCDField;
    QProdIPI_CF_EST: TBCDField;
    QProdIPI_CONT_FORA: TBCDField;
    QProdIPI_CF_FORA: TBCDField;
    QProdRED_CONT_EST: TBCDField;
    QProdRED_CF_EST: TBCDField;
    QProdRED_CONT_FORA: TBCDField;
    QProdRED_CF_FORA: TBCDField;
    QCliNOME_FANTASIA: TStringField;
    QCliPONTO_REFERENCIA: TStringField;
    QConsulta: TFDQuery;
    QBancoLINHAS_FINAL_BOLETO: TIntegerField;
    QBancoIMPRIMIR_PARCELA_BOLETO: TStringField;
    IBTRAux: TFDTransaction;
    QCliCONTATO_CLI: TStringField;
    QCliROTA_CLI: TIntegerField;
    QCliTIPO_CREDITO_CLI: TStringField;
    QProdNOME_GRP: TStringField;
    QProdALIQUOTA_GRP: TBCDField;
    QSecBEBIDAS_FUMO_SEC: TStringField;
    QGRPCST: TStringField;
    QEmpCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    QModelo: TFDQuery;
    DSModelo: TDataSource;
    QProdCOD_NCM: TStringField;
    QEmpTIPO_EMP: TIntegerField;
    QReceita: TFDQuery;
    DSReceita: TDataSource;
    QReceitaCOD_RECEITA: TIntegerField;
    QReceitaINGREDIENTES: TStringField;
    QProdCONTROLA_ESTOQUE_PRO: TStringField;
    QEmpTIPO_CARGA_BALANCA: TIntegerField;
    QCliCONTROLAR_LIMITE: TStringField;
    QTPProd: TFDQuery;
    DSTPProd: TDataSource;
    QTPProdCODIGO: TIntegerField;
    QTPProdDESCRICAO: TStringField;
    QProdCODIGO_TIPO: TIntegerField;
    QProdCOD_PRODUTO_ESTOQUE: TIntegerField;
    QClaCTP: TFDQuery;
    DSClaCTP: TDataSource;
    QClaCTPCODIGO: TIntegerField;
    QClaCTPDESCRICAO: TStringField;
    QEmb: TFDQuery;
    DSEmb: TDataSource;
    QEmbCODIGO: TIntegerField;
    QEmbDESCRICAO: TStringField;
    QEmbCOD_PRO: TIntegerField;
    QEmbQUANT: TBCDField;
    QEmbNOME_PRO: TStringField;
    QEmbUNIDADE: TStringField;
    QCliENDCOB_CLI: TStringField;
    QCliBAICOB_CLI: TStringField;
    QCliCIDCOB_CLI: TStringField;
    QCliESTCOB_CLI: TStringField;
    QCliCEPCOB_CLI: TStringField;
    QCliTELCOB_CLI: TStringField;
    QCFOPSAIR_REL_RESUMO_ALIQ: TStringField;
    QGrupo: TFDQuery;
    DSGrupo: TDataSource;
    QGrupoCOD_SEC: TIntegerField;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESCRICAO: TStringField;
    QSubGrupo: TFDQuery;
    DSSubGrupo: TDataSource;
    QSubGrupoCOD_SEC: TIntegerField;
    QSubGrupoCOD_GRUPO: TIntegerField;
    QSubGrupoCOD_SUBGRUPO: TIntegerField;
    QSubGrupoDESCRICAO: TStringField;
    QProdCOD_GRUPO: TIntegerField;
    QProdSUB_GRUPO: TIntegerField;
    QProdDESCRICAO: TStringField;
    QProdDESCRICAO1: TStringField;
    QCliBLOQUEADO_CLI: TStringField;
    QUsuOPERADOR_CAIXA: TStringField;
    QProdPRECO_PROGRAMADO: TBCDField;
    QProdALIQUOTA_PIS: TBCDField;
    QProdALIQUOTA_COFINS: TBCDField;
    QProdALIQUOTA_IR: TBCDField;
    QProdALIQUOTA_CSLL: TBCDField;
    QProdALIQUOTA_OUTRAS: TBCDField;
    QProdISENTO_PIS_COFINS_PRO: TStringField;
    QProdCALC_PIS_COFINS: TStringField;
    QProdPRECO_CUSTO: TBCDField;
    QProdCREDITO_ICMS: TBCDField;
    QProdPRECO_PRAZO_PRO: TBCDField;
    QRelRepasseEMITENTE: TStringField;
    QEmpCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    IBSQL: TFDQuery;
    QCFOPTIPO: TStringField;
    QCFOPREGISTRADO_ECF: TStringField;
    QProdTIPO_PRODUCAO: TStringField;
    QEmpINSCRICAO_MUNICIPAL: TStringField;
    QEmbCODIGO_BARRA: TStringField;
    QProdCODIGO_BARRA_PRO: TStringField;
    QVend: TFDQuery;
    DSVend: TDataSource;
    QVendCOD_VEND: TIntegerField;
    QVendNOME_VEND: TStringField;
    QVendATIVO_VEND: TStringField;
    QVendCOMISSAO_VEND: TBCDField;
    QTipoVendaTABELA_PRECO_TPV: TStringField;
    QTipoVendaCALC_TABELA: TStringField;
    QGRPICMS_SERVICO_GRP: TStringField;
    QGRPECF: TStringField;
    QGRPCALC_ICMS_SERVICO: TStringField;
    QProdCOD_PRO: TIntegerField;
    QProdDESC_CUPOM: TStringField;
    QMarcas: TFDQuery;
    DSMarcas: TDataSource;
    QMarcasCODIGO: TIntegerField;
    QMarcasDESCRICAO: TStringField;
    QModelos: TFDQuery;
    DSModelos: TDataSource;
    QModelosCODIGO: TIntegerField;
    QModelosDESCRICAO: TStringField;
    QTPProdSERVICO: TStringField;
    QEmpPERFIL_EFD: TStringField;
    QEmpCODIGO_MUNICIPIO: TStringField;
    QEmpTIPO_ATIVIDADE_EFD: TIntegerField;
    QUnidMed: TFDQuery;
    DSUnidMed: TDataSource;
    QUnidMedCODIGO: TIntegerField;
    QUnidMedDESCRICAO: TStringField;
    QProdCODIGO_UNIDADE_SAIDA: TIntegerField;
    QProdCODIGO_UNIDADE_ENTRADA: TIntegerField;
    QProdUND_ENTRADA: TStringField;
    QProdUND_SAIDA: TStringField;
    QEmpNOME_CONTADOR: TStringField;
    QEmpCPF_CONTADOR: TStringField;
    QEmpCRC_CONTADOR: TStringField;
    QEmpCNPJ_CONTADOR: TStringField;
    QEmpCEP_CONTADOR: TStringField;
    QEmpEND_CONTADOR: TStringField;
    QEmpNUMERO_CONTADOR: TStringField;
    QEmpBAIRRO_CONTADOR: TStringField;
    QEmpTEL_CONTADOR: TStringField;
    QEmpFAX_CONTADOR: TStringField;
    QEmpCODIGO_MUNICIPIO_CONTADOR: TStringField;
    QModeloCODIGO: TStringField;
    QModeloDESCRICAO: TStringField;
    QFormas: TFDQuery;
    DSFormas: TDataSource;
    QFormasCODIGO: TIntegerField;
    QFormasDESCRICAO: TStringField;
    QFormasUSA_TEF: TStringField;
    QFormasABRE_GAVETA: TStringField;
    QFormasUSAR_CONTAS_RECEBER: TStringField;
    QFormasUSAR_CONTAS_PAGAR: TStringField;
    QFormasTIPO: TStringField;
    QFormasTABELA_PRECO: TIntegerField;
    QAdmCartaoCODIGO: TIntegerField;
    QAdmCartaoDESCRICAO: TStringField;
    QProdPRECO_PROGRAMADO_PRAZO: TBCDField;
    QAdmCartaoCODIGO_TEF: TStringField;
    QFormasCONCEDER_DESCONTO: TStringField;
    QCliINSC_ESTADUAL: TStringField;
    QProdESTOQUE: TBCDField;
    QCentroCusto: TFDQuery;
    DSCentroCusto: TDataSource;
    QCentroCustoCODIGO: TIntegerField;
    QCentroCustoDESCRICAO: TStringField;
    QCentroCustoCONTA: TStringField;
    QCentroCustoTIPO: TStringField;
    QCentroCustoRECEITA_DESPESA: TStringField;
    QCentroCustoDEBCRED: TIntegerField;
    QCentroCustoCALC_RD: TStringField;
    QFormasCODIGO_CONTA_VENDAS: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_VENDAS: TIntegerField;
    QFormasUSAR_PAF_ECF: TStringField;
    QFormasCODIGO_CONTA_CTR: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTR: TIntegerField;
    QFormasCODIGO_CONTA_CTP: TIntegerField;
    QFormasCODIGO_CONTA_CTR_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTR_ESTORNO: TIntegerField;
    QFormasCODIGO_CONTA_CTP_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTP_ESTORNO: TIntegerField;
    QFormasCODIGO_CONTA_VEN_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_VEN_ESTORNO: TIntegerField;
    QTipoESCFOP_ESTADO_TRIBUTADO: TIntegerField;
    QTipoESCFOP_ESTADO_SUBSTITUICAO: TIntegerField;
    QTipoESCFOP_FORA_TRIBUTADO: TIntegerField;
    QTipoESCFOP_FORA_SUBSTITUICAO: TIntegerField;
    QTipoESTIPO_PRECO: TStringField;
    QTipoESCOD_GRP_ESPECIFICO: TIntegerField;
    QClaCTR: TFDQuery;
    DSClaCTR: TDataSource;
    QClaCTRCODIGO: TIntegerField;
    QClaCTRDESCRICAO: TStringField;
    QCFOPCALCULA_PIS_COFINS: TStringField;
    QTipoVendaCODIGO_CLASSIFICACAO: TIntegerField;
    QTipoVendaDESCRICAO: TStringField;
    QLocaisEstoque: TFDQuery;
    DSLocaisEstoque: TDataSource;
    QLocaisEstoqueCODIGO: TIntegerField;
    QLocaisEstoqueDESCRICAO: TStringField;
    QTipoESCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QProdDATA_VALIDADE: TDateField;
    QSetorEstoque: TFDQuery;
    DSSetorEstoque: TDataSource;
    QSetorEstoqueCODIGO: TIntegerField;
    QSetorEstoqueDESCRICAO: TStringField;
    QSetorEstoqueCOD_USU: TIntegerField;
    QSetorEstoqueNOME_USU: TStringField;
    QProdCODIGO_SETOR_ESTOQUE: TIntegerField;
    QProdSETOR_ESTOQUE: TStringField;
    QSetorEstoqueDATA_INICIO_ESTOQUE: TDateField;
    QBandeira: TFDQuery;
    QBandeiraCODIGO: TIntegerField;
    QBandeiraCODIGO_ADMINISTRADORA: TIntegerField;
    QBandeiraDESCRICAO: TStringField;
    QBandeiraATIVO: TStringField;
    QBandeiraTAXA_CREDITO: TBCDField;
    QBandeiraTAXA_DEBITO: TBCDField;
    QBandeiraDIAS_CREDITO: TIntegerField;
    QBandeiraDIAS_DEBITO: TIntegerField;
    QBandeiraTIPO_CARTAO: TStringField;
    QBandeiraADMINISTRADORA: TStringField;
    QBandeiraCALC_TIPO: TStringField;
    DSBandeira: TDataSource;
    QBandeiraCODIGO_TEF: TStringField;
    QBuscaItensNF: TFDQuery;
    QNF: TFDQuery;
    QNFCOD_NF: TIntegerField;
    QNFCOD_EMP: TIntegerField;
    QNFNUMERO_NOTA_NF: TIntegerField;
    QNFDATA_EMISSAO_NF: TDateField;
    QNFDATA_SAIDA_NF: TDateField;
    QNFHORA_SAIDA_NF: TTimeField;
    QNFCOD_TRA: TIntegerField;
    QNFBASE_CALCULO_ICMS_NF: TBCDField;
    QNFVALOR_ICMS_NF: TBCDField;
    QNFBASE_SUBST_NF: TBCDField;
    QNFVALOR_SUBST_NF: TBCDField;
    QNFVALOR_TOTAL_PROD_NF: TBCDField;
    QNFVALOR_FRETE_NF: TBCDField;
    QNFVALOR_SEGURO_NF: TBCDField;
    QNFOUTRAS_DESPESAS_NF: TBCDField;
    QNFVALOR_IPI_NF: TBCDField;
    QNFVALOR_TOTAL_NF: TBCDField;
    QNFESPECIE_NF: TStringField;
    QNFMARCA_NF: TStringField;
    QNFNUMERO_NF: TStringField;
    QNFINF_COMPL_NF: TMemoField;
    QNFCANCELADA_NF: TStringField;
    QNFFRETE_CONTA_NF: TStringField;
    QNFCOD_CLI: TIntegerField;
    QNFCOD_FOR: TIntegerField;
    QNFDESCONTO_NF: TBCDField;
    QNFTIPO_CLIENTE: TStringField;
    QNFNOTA_IMPRESSA: TStringField;
    QNFCOD_VENDA: TIntegerField;
    QNFCOD_TPV: TIntegerField;
    QNFSERIE_NOTA: TStringField;
    QNFTIPO_NOTA_FISCAL: TIntegerField;
    QNFCODIFICACAO_FISCAL: TStringField;
    QNFCODIGO_OUTRA_ENTRADA: TIntegerField;
    QNFCODIGO_OUTRA_SAIDA: TIntegerField;
    RDprintNF: TRDprint;
    QCliNUMRES_CLI: TStringField;
    QCliNUMCOM_CLI: TStringField;
    QCliNUMCOB_CLI: TStringField;
    QCliCODIGO_IBGE: TIntegerField;
    QMunicipio: TFDQuery;
    DSMunicipio: TDataSource;
    QMunicipioCODIGO_MUNICIPIO: TIntegerField;
    QMunicipioDESCRICAO: TStringField;
    QMunicipioUF: TStringField;
    QForNUM_FOR: TStringField;
    QForCODIGO_IBGE: TIntegerField;
    QCliEMAIL_CLI: TStringField;
    QForEMAIL_FOR: TStringField;
    QNFCHAVE_ACESSO_NFE: TStringField;
    QNFPROTOCOLO_NFE: TStringField;
    QNFSTATUS_TRANSMITIDA: TStringField;
    QNFSTATUS_RETORNO: TStringField;
    QNFSTATUS_CANCELADO: TStringField;
    QNFSTATUS_INUTILIZADO: TStringField;
    QNFSTATUS_EMAIL: TStringField;
    QNFJUSTIFICATIVA_CANCEL_INUTIL: TStringField;
    QNFPLACA_TRANSP: TStringField;
    QNFUF_PLACA_TRANSP: TStringField;
    QNFPESO_BRUTO_NF: TBCDField;
    QNFPESO_LIQUIDO_NF: TBCDField;
    QNFQUANTIDADE_NF: TIntegerField;
    QTipoESCONTROLA_ESTOQUE: TStringField;
    QTipoESATUALIZA_CUSTO_ENTRADAS: TStringField;
    Limpa: TFDQuery;
    ACBrNFe1: TACBrNFe;
    QProdCLASSIFICACAO_FISCAL: TStringField;
    QProdORIG: TIntegerField;
    QProdCSOSN: TStringField;
    QProdIPI: TFloatField;
    QProdICMS: TFloatField;
    QProdRICMS: TFloatField;
    QProdIVA: TFloatField;
    QProdPIS: TFloatField;
    QProdCONFINS: TFloatField;
    QCFOPUSA_CSOSN: TStringField;
    QProdTAMANHO: TStringField;
    QProdCOR: TStringField;
    QProdESTOQUE_CONSIGNADO: TFloatField;
    QProdOBS: TWideMemoField;
    QProdCST_PIS: TStringField;
    QProdCST_COFINS: TStringField;
    QProdCST_IPI: TStringField;
    QNFCHAVE2: TStringField;
    QNFDEPEC: TIntegerField;
    QNFVALOR_PIS: TBCDField;
    QNFVALOR_COFINS: TBCDField;
    QProdULTIMA_ALTERACAO: TDateField;
    QProdVALOR_ATACADO: TBCDField;
    QSacado: TFDQuery;
    DSSacado: TDataSource;
    QSacadoCOD: TIntegerField;
    QSacadoCOD_EMP: TIntegerField;
    QSacadoBANCO: TIntegerField;
    QSacadoAGENCIA: TStringField;
    QSacadoAGENCIA_DIGITO: TStringField;
    QSacadoCODIGO_CEDENTE: TStringField;
    QSacadoCONTA: TStringField;
    QSacadoCONTA_DIGITO: TStringField;
    QSacadoMENSAGEM_PAGAMENTO: TStringField;
    QSacadoINSTRUCOES_DE_PAGAMENTO: TStringField;
    QSacadoMULTA_ATRASO: TBCDField;
    QSacadoVALOR_DIA_ATRASO: TBCDField;
    QSacadoESPECIE_DOC: TStringField;
    QSacadoESPECIE_MOEDA: TStringField;
    QSacadoACEITE: TStringField;
    QSacadoCARTEIRA: TStringField;
    QSacadoNOSSO_NUMERO: TIntegerField;
    QSacadoSACADO_NOME: TStringField;
    QSacadoSACADO_CNPJ: TStringField;
    QSacadoSACADO_ENDERECO: TStringField;
    QSacadoSACADO_NUMERO: TStringField;
    QSacadoSACADO_BAIRRO: TStringField;
    QSacadoSACADO_CIDADE: TStringField;
    QSacadoSACADO_UF: TStringField;
    QSacadoSACADO_CEP: TStringField;
    Boleto: TACBrBoleto;
    BoletoImprime: TACBrBoletoFCFR;
    QSacadoTIPO_IMPRESSAO: TIntegerField;
    QSacadoTIPO_REMESSA: TIntegerField;
    QSacadoDIAS_PROTESTO: TIntegerField;
    QSacadoNUMERO_REMESSA: TIntegerField;
    QSacadoCONVENIO: TStringField;
    QEmpVERSAO_EFD: TIntegerField;
    QTPProdEFD_TIPO: TStringField;
    QCFOPNOME_CFO: TStringField;
    QCFOP_Tributacoes: TFDQuery;
    QCFOP_TributacoesCOD: TIntegerField;
    QCFOP_TributacoesCOD_CFOP: TIntegerField;
    QCFOP_TributacoesORIGEM: TStringField;
    QCFOP_TributacoesICMS_DENTRO: TIntegerField;
    QCFOP_TributacoesCST_DENTRO: TStringField;
    QCFOP_TributacoesIPI_DENTRO: TFloatField;
    QCFOP_TributacoesREDU_ICMS_DENTRO: TFloatField;
    QCFOP_TributacoesTEM_SUBSTITUICAO: TStringField;
    QCFOP_TributacoesAGREG_DENTRO: TFloatField;
    QCFOP_TributacoesICMS_FORA: TIntegerField;
    QCFOP_TributacoesCST_FORA: TStringField;
    QCFOP_TributacoesIPI_FORA: TFloatField;
    QCFOP_TributacoesREDU_ICMS_FORA: TFloatField;
    QCFOP_TributacoesCST_IPI: TStringField;
    QCFOP_TributacoesCSOSN: TStringField;
    QCFOP_TributacoesCST_PIS: TStringField;
    QCFOP_TributacoesCST_COFINS: TStringField;
    QCFOP_TributacoesISENTO_PIS_COFINS: TStringField;
    QCFOP_TributacoesPIS: TFloatField;
    QCFOP_TributacoesCOFINS: TFloatField;
    QCFOP_TributacoesIR: TFloatField;
    QCFOP_TributacoesCONT_SOCIAL: TFloatField;
    QCFOP_TributacoesOUTRAS: TFloatField;
    QCFOP_TributacoesCOD_EMP: TIntegerField;
    QProdALIQ_IBPT_NAC: TBCDField;
    QProdALIQ_IBPT_IMP: TBCDField;
    QLabCOMISSAO_FIXA: TStringField;
    QLabCOMISSAO: TFloatField;
    QLabREDUCAO: TFloatField;
    QRegiao: TFDQuery;
    QRegiaoCOD: TIntegerField;
    QRegiaoDESCRICAO: TStringField;
    dsRegiao: TDataSource;
    QVendCOD_REGIAO: TIntegerField;
    QNotasManifesto: TFDQuery;
    upNotasManifesto: TFDUpdateSQL;
    QNotasManifestoCOD: TIntegerField;
    QNotasManifestoCOD_EMP: TIntegerField;
    QNotasManifestoCHAVE_NOTA: TStringField;
    QNotasManifestoDATA_ENTRADA: TDateField;
    QNotasManifestoEMITENTE: TStringField;
    QNotasManifestoCNPJ_EMI: TStringField;
    QNotasManifestoIE_EMI: TStringField;
    QNotasManifestoVALOR_NF: TBCDField;
    QNotasManifestoTIPO_NF: TStringField;
    QNotasManifestoSIT_NF: TStringField;
    QNotasManifestoSIT_CONF: TStringField;
    QProdFATOR_CONVERSAO: TBCDField;
    QTeclas: TFDQuery;
    QTeclasTECLA: TStringField;
    QTeclasDESCRICAO: TStringField;
    DSTeclas: TDataSource;
    QEmbVALOR: TBCDField;
    QProdALERTA_COPA: TStringField;
    QProdALERTA_COZINHA: TStringField;
    QVendSENHA_VEND: TStringField;
    QProdANDROID_VISUALIZA: TStringField;
    QProdTEMPO_PREPARO: TTimeField;
    Sintegra: TACBrSintegra;
    Alerts: TdxAlertWindowManager;
    ImagensGerais: TcxImageList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    QCaixaCOD_CAI: TIntegerField;
    QCaixaCOD_EMP: TIntegerField;
    QCaixaTAMANHO_DESC_CUPOM: TIntegerField;
    QCaixaPORTA_IMP: TStringField;
    QCaixaDESC_CAI: TStringField;
    QCaixaINDICE_GAVETA: TIntegerField;
    QCaixaINDICE_BALANCA: TIntegerField;
    QCaixaPORTA_BALANCA: TIntegerField;
    QCaixaBAUD_BALANCA: TIntegerField;
    QCaixaCASAS_DECIMAIS: TIntegerField;
    QCaixaCASAS_DECIMAIS_UNITARIO: TIntegerField;
    QCaixaTRUNCAR_CAI: TStringField;
    QCaixaIMPRIMIR_COMPROVANTE_ECF: TStringField;
    QCaixaECF_MFD: TStringField;
    QCaixaIP_SERVIDOR_TEF: TStringField;
    QCaixaID_LOJA_TEF: TStringField;
    QCaixaID_TERMINAL_TEF: TStringField;
    QCaixaTEF_CAI: TStringField;
    QCaixaCAMINHO_BANCO: TStringField;
    QCaixaEXPORTAR_DADOS: TStringField;
    QCaixaR01_MF_ADICIONAL: TStringField;
    QCaixaR01_TIPO_ECF: TStringField;
    QCaixaR01_MARCA_ECF: TStringField;
    QCaixaR01_MODELO_ECF: TStringField;
    QCaixaR01_VERSAO_SB: TStringField;
    QCaixaR01_CNPJ_USUARIO: TStringField;
    QCaixaR01_IE_USUARIO: TStringField;
    QCaixaR01_NUMERO_SERIE: TStringField;
    QCaixaLINHA1: TStringField;
    QCaixaLINHA2: TStringField;
    QCaixaLINHA3: TStringField;
    QCaixaINDICE_GER_OS: TStringField;
    QCaixaINDICE_GER_ORCAMENTO: TStringField;
    QCaixaINDICE_GER_MESA: TStringField;
    QCaixaR01_NUMERO_USUARIO: TIntegerField;
    QCaixaCODIGO_NACIONAL_IDENTIFICACAO: TStringField;
    QCaixaR01_DATAHORA_SB: TSQLTimeStampField;
    QCaixaINTERVALO_RECEBE: TIntegerField;
    QCaixaINTERVALO_TRANSMITE: TIntegerField;
    QCaixaDIAS_ATUALIZACAO_PAF: TIntegerField;
    QCaixaCORTA_PAPEL: TStringField;
    QCaixaNFCE_SERIE: TIntegerField;
    QCaixaNFCE_NUMERO: TIntegerField;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    QNFCORRECAO: TStringField;
    QNFPAF_ECF: TStringField;
    QNFCOD_VEND: TIntegerField;
    QNFCHAVE_NFE_ESTORNO: TStringField;
    QNFINFO_ESTORNO: TStringField;
    QEmpEMAIL_CONTADOR: TStringField;
    AlertsLongos: TdxAlertWindowManager;
    QBuscaItensNFORDEM: TIntegerField;
    QBuscaItensNFCOD_NF: TIntegerField;
    QBuscaItensNFCST: TStringField;
    QBuscaItensNFALIQ: TBCDField;
    QBuscaItensNFCOD_EMP: TIntegerField;
    QBuscaItensNFCOD_GRP: TIntegerField;
    QBuscaItensNFQUANT: TBCDField;
    QBuscaItensNFALIQ_IPI: TBCDField;
    QBuscaItensNFREDUCAO_ICMS: TBCDField;
    QBuscaItensNFCOD_CFO: TIntegerField;
    QBuscaItensNFSUB_TRIBUTARIA: TStringField;
    QBuscaItensNFVR_AGREGADO: TBCDField;
    QBuscaItensNFALIQUOTA_FORA_ESTADO: TBCDField;
    QBuscaItensNFUNIDADE: TStringField;
    QBuscaItensNFCOD_PRO: TIntegerField;
    QBuscaItensNFVALOR_TOTAL: TBCDField;
    QBuscaItensNFBASE_CALCULO: TBCDField;
    QBuscaItensNFVALOR_ICMS: TBCDField;
    QBuscaItensNFBASE_SUBTRIB: TBCDField;
    QBuscaItensNFVALOR_IPI: TBCDField;
    QBuscaItensNFVALOR_SUBTRIB: TBCDField;
    QBuscaItensNFCLASSIFICACAO_FISCAL: TStringField;
    QBuscaItensNFUNIT: TBCDField;
    QBuscaItensNFISENTAS: TBCDField;
    QBuscaItensNFOUTRAS: TBCDField;
    QBuscaItensNFFRETE: TFloatField;
    QBuscaItensNFDESCONTO: TFloatField;
    QBuscaItensNFBC_PIS: TBCDField;
    QBuscaItensNFALIQ_PIS: TBCDField;
    QBuscaItensNFVALOR_PIS: TBCDField;
    QBuscaItensNFBC_COFINS: TBCDField;
    QBuscaItensNFALIQ_COFINS: TBCDField;
    QBuscaItensNFVALOR_COFINS: TBCDField;
    QBuscaItensNFCANCELADO: TIntegerField;
    QBuscaItensNFNF_CANCELADA: TIntegerField;
    QBuscaItensNFCST_PIS: TStringField;
    QBuscaItensNFCST_COFINS: TStringField;
    QBuscaItensNFCSOSN: TStringField;
    QBuscaItensNFCST_IPI: TStringField;
    QBuscaItensNFNOME_GRP: TStringField;
    QBuscaItensNFTIPO_GRP: TStringField;
    QBuscaItensNFDESTACA_ICMS: TStringField;
    QBuscaItensNFUSA_CSOSN: TStringField;
    QBuscaItensNFNOME_PRO: TStringField;
    QBuscaItensNFCOD_NCM: TStringField;
    QBuscaItensNFORIG: TIntegerField;
    QBuscaItensNFCST_PIS_1: TStringField;
    QBuscaItensNFCST_COFINS_1: TStringField;
    QBuscaItensNFCODIGO_BARRA_PRO: TStringField;
    QBuscaItensNFDESC_CUPOM: TStringField;
    QBuscaItensNFALIQ_IBPT_NAC: TBCDField;
    QBuscaItensNFCALC_TOTAL: TCurrencyField;
    QBuscaItensNFCEST: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
    function  Acesso(Funcao, TipoAcesso : String):boolean;
    function  DireitoAcesso(iProcesso : integer; sTipoAcesso : String) : boolean;
    procedure HabilitaMenu;
    function  RetornaStringTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : Variant) : string;
    function  RetornaStringTabelaPlus(CampoRetorno, Tabela, Filtro: String ) : string;
    function  RetornaIntegerTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : integer) : integer;
    function  RetornaCurrencyTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : integer) : currency;
    procedure QCliCalcFields(DataSet: TDataSet);
    Function  LeIni(sArqIni : string; sSecao : string; sVariavel : string) : string;
    procedure DataModuleCreate(Sender: TObject);
    procedure GravaIni(sArqIni : string; sSecao : string; sVariavel : string; sValor : string);
    function  BuscaEstoqueProduto(const iCodPro : integer; const iCodEmp : integer) : currency;
    procedure QProdCalcFields(DataSet: TDataSet);
    function  CodigoBarraProduto(const sCodBarra : string) : integer;
    function  CodigoBarraEmbalagem(const sCodBarra : string) : integer;
    procedure QTipoVendaCalcFields(DataSet: TDataSet);
    procedure QGRPCalcFields(DataSet: TDataSet);
    function  BuscaFormaPagamento(const sTipo : string) : integer;
    procedure QCentroCustoCalcFields(DataSet: TDataSet);
    procedure MensagemErroECF(const sMensagem : string; bMostrar : boolean);
    procedure QBandeiraCalcFields(DataSet: TDataSet);
    procedure QBuscaItensNFCalcFields(DataSet: TDataSet);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure AtualizaStatusNfe(const iCodigoNfe : integer; const sCampoStatus, sJustificativa : string);
    function  VerificaCNPJCadastrado(const sCNPJ : string) : boolean;
    procedure AtualizaStatusNfeInu(const ini, fim, serie : integer; const sCampoStatus, sJustificativa : string);
    function ContaMenus: Integer;
    function SetarCedente( COD: Integer ) : Boolean;
    function MovimentoMesmoUF( UF: STring ): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    VersaoNFe: String;
    Mensagem_Pagamento: string;
    Instrucoes: string;
    MultaAtrazo: Double;
    Valor_dia_Atraso: Double;
    EspecieDoc: string;
    EspecieMoeda: String;
    Aceitee: String;
    carteiraa: string;
    dias_protesto: Integer;
    tipo_remessa: Integer;
    cnpj_cedente: string;
    function ConfiguraNFe( NFe: TAcbrNFe ): Boolean;
    function VerificaWebServices( NFe: TACBrNFe ): Boolean;
    function EnviaEmail(
       email, usuario, senha, smtp: String;
       Porta: Integer;
       SSL, Autenticacao : Boolean;
       De, Para, Assunto, Mensagem: String; Anexos: TStrings;
       Copia: Boolean; TipoEnvio: Integer
        ): Boolean;
  end;

  procedure AlertaCad( Mensagem: string;const Img: TAligatorAlertas = alertErro;
   const Titulo: String = '';
   const Longo: Boolean = false );

var
  DM: TDM;
  iCodUsu             : integer;
  iEmp                : integer;
  iTipoEmp            : integer;
  iCaixa              : integer;
  iAtrasoMaximo       : integer;
  iDiasAtrazo         : integer;
  iCodigoNFe          : integer;
  cSaldoCliente       : currency;
  sAuxString          : string;  //variavel usada para auxiliar nas consultas
  dDataLiberacao      : TDate;
  bNoEstado           : boolean;
  bEstoqueNegativo    : boolean;
  bExibeMensagensErro : boolean;
  bMFD                : boolean;
  bDemonstracao       : boolean;
  sJustifNFe          : string;
  sCNPJEmpresa        : string;
  BackupFeito         : Boolean;
  SkinLiga            : Boolean;
  SkinPasta           : String;
  SkinNome            : String;
  ExcluirVendas       : Boolean;

  // PAF
  sMD5: String;
  SincronoNFe: String;

  AtivaLavanderia: Boolean;
  AtivaConserto: Boolean;
  ControlaEstoqueOS: Boolean;

  const Tcnpj : array[1..28] of string = (
  '09420309000105', '01727277000183', '03973199000122',
  '03332930000130', '00483946000156', '10496496000116',
  '07968153000176', '12973454000128', '04516425000109',
  '07073811000161', '13087862000145', '06314531000135',
  '11117968000119', '11003393000103', '11723513000147',
  '08931491000104', '07858433000121', '08504018000132',
  '05828922000105', '01821774000146', '08786308000116',
  '05828922000105', '01821774000146', '42305359000117',
  '11735280000100', '03968511000190', '09613817000100',
  '07774152000190' );

implementation

uses
  UNovoPrincipal, USenha, UFrmStatusNfe, UDicFluxo;

{$R *.dfm}

procedure AlertaCad( Mensagem: string; const Img: TAligatorAlertas = alertErro;
  const Titulo: String = '';
  const Longo: Boolean = false   );
begin
   PlaySound(PChar('SystemExclamation'), 0, SND_ASYNC);
   {SystemDefault
SystemAsterisk
SystemExclamation
SystemExit
SystemHand
SystemQuestion
SystemStart}
   if Longo then
       DM.AlertsLongos.Show( IfThen( Titulo = '', 'Atenção!', Titulo ) , Mensagem, Ord( Img ) )
   else
       DM.Alerts.Show( IfThen( Titulo = '', 'Atenção!', Titulo ) , Mensagem, Ord( Img ) )
end;

function TDM.EnviaEmail(
       email, usuario, senha, smtp: String;
       Porta: Integer;
       SSL, Autenticacao : Boolean;
       De, Para, Assunto, Mensagem: String; Anexos: TStrings;
       Copia: Boolean; TipoEnvio: Integer
        ): Boolean;
var
   idSmtp: TidSmtp;
   idMen: TIdMessage;
   textomsg: tidText;
   idFile: TIdAttachmentFile;
   fSsl: TIdSSLIOHandlerSocketOpenSSL;
   EmailsSend: TStringList;
   I: Integer;
begin

  idSmtp := TIdSMTP.Create( nil );
  idSmtp.Host := smtp;
  idSmtp.Port := Porta;
  idSmtp.Username := usuario;
  idSmtp.Password := senha;
  fSsl := nil;
    try
      fSsl := TIdSSLIOHandlerSocketOpenSSL.Create(IdSMTP);
      IdSMTP.IOHandler := fSsl;
      if (idSMTP.Port = 465) then
        IdSMTP.UseTLS := utUseImplicitTLS
      else
        IdSMTP.UseTLS := utUseExplicitTLS;
    except
      if Assigned(fSsl) then
        FreeAndNil(fSsl);
      IdSMTP.ManagedIOHandler := True;
      Result := False;
    end;
  case TipoEnvio of
     0: idSmtp.AuthType := satDefault; // normal
     1: begin  // SSL
           if idSmtp.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
              begin
                fSsl.SSLOptions.Method := sslvSSLv3;
                fSsl.SSLOptions.Mode := sslmClient;
              end;
              IdSMTP.AuthType := satDefault;
        end;
     2: idSmtp.AuthType := satNone;
     3: begin // TTLS
              if idSmtp.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
              begin
                fSsl.SSLOptions.Method := sslvTLSv1;
                fSsl.PassThrough := True;
              end;
              IdSMTP.AuthType := satDefault;
        end;
  end;
  idMen := TIdMessage.Create( nil );
  try
      try
            idMen.Clear;
            idMen.CharSet:='iso-8859-1';
            idMen.Encoding := MeMIME;
            idMen.ContentType:='multipart/mixed'   ;
            idMen.from.address := email;  // e-mail do remetente
            idMen.From.Name := De;
            idMen.Subject := Assunto;
            EmailsSend := TStringList.Create;
            try
                Para := Trim( Para );
                EmailsSend.Delimiter := ';';
                EmailsSend.StrictDelimiter := True;
                EmailsSend.DelimitedText := Para;
                for I := 0 to EmailsSend.Count - 1 do
                    if Trim(EmailsSend[I])<> '' then
                       idMen.Recipients.Add.Address := EmailsSend[I];
            finally
               FreeAndNil( EmailsSend );
            end;
            if Copia then
               idMen.Recipients.Add.Address := email;
            textomsg := TIdText.Create(idMen.MessageParts);
            textomsg.Body.Text := Mensagem;
            textomsg.ContentType := 'text/html';
            if Assigned( Anexos ) then
               begin
                  for I := 0 to Anexos.Count - 1 do
                      if FileExists( Anexos[I] )  then
                           TIdAttachmentFile.Create( idMen.MessageParts, Anexos[I] );
               end;
          idSmtp.ReadTimeout := 30000;
          idSmtp.ConnectTimeout := 30000;
          idSmtp.Connect;
       {    if idSmtp.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
            begin
              if fSsl.SSLOptions.Method = sslvTLSv1 then
              begin
                 IdSMTP.SendCmd('STARTTLS', 220);
                 fSsl.PassThrough := False;
              end;
            end;          }
          if Autenticacao then
              if idSmtp.Authenticate then
                 idSmtp.send( idMen );
          idSmtp.Disconnect( False );
      finally
         if Assigned( fSsl ) then
            FreeAndNil( fSsl  );
         FreeAndNil( textomsg );
         FreeAndNil( idMen );
         FreeAndNil( idSmtp );
      end;
  except

      Result := False;
  end;

end;

function TDM.SetarCedente( COD: Integer ) : Boolean;
var
   RelBoleto: String;
begin
  //
  if IBTransaction.Active then
     IBTransaction.Commit;
  IBTransaction.StartTransaction;

  Boleto.ListadeBoletos.Clear;

  QSacado.Close;
  QSacado.SQL.Text := 'select * from BOLETOS_SACADO where COD=:COD';
  QSacado.ParamByName( 'COD' ).AsInteger := COD;
  QSacado.Open;
  if QSacado.IsEmpty then
   begin
         KDialog( 'Cedente não encontrado', 'Emissão de boletos', tdtErro );
         Result := False;
         IBTransaction.Rollback;
         Exit;
   end;
  case QSacadoTIPO_IMPRESSAO.AsInteger of
     0: RelBoleto := ExtractFilePath( Application.exename ) + '\Report\BoletoFR.fr3';
     1: RelBoleto := ExtractFilePath( Application.exename ) + '\Report\BoletoCarne.fr3';
     2: RelBoleto := ExtractFilePath( Application.exename ) + '\Report\BoletoExtrato.fr3';
  end;
  if not FileExists( RelBoleto ) then
   begin
         KDialog( 'Arquivo de relatório não encontrado.' +
         #13 + RelBoleto, 'Emissão de boletos', tdtErro );
         Result := False;
         IBTransaction.Rollback;
         Exit;
   end;

  BoletoImprime.FastReportFile := RelBoleto;
     begin
        Boleto.Cedente.Agencia := QSacadoAGENCIA.AsString;
        Boleto.Cedente.AgenciaDigito := QSacadoAGENCIA_DIGITO.AsString;
        Boleto.Cedente.Bairro := QSacadoSACADO_BAIRRO.AsString;
        Boleto.Cedente.CEP := QSacadoSACADO_CEP.AsString;
        Boleto.Cedente.Cidade := QSacadoSACADO_CIDADE.AsString;
        Boleto.Cedente.CNPJCPF := QSacadoSACADO_CNPJ.AsString;
        cnpj_cedente := QSacadoSACADO_CNPJ.AsString;
        Boleto.Cedente.CodigoCedente := QSacadoCODIGO_CEDENTE.AsString;
        Boleto.Cedente.Conta := QSacadoCONTA.AsString;
        Boleto.Cedente.ContaDigito := QSacadoCONTA_DIGITO.AsString;
        Boleto.Cedente.Logradouro := QSacadoSACADO_ENDERECO.AsString;
        Boleto.Cedente.Nome := QSacadoSACADO_NOME.AsString;
        Boleto.Cedente.NumeroRes := QSacadoSACADO_NUMERO.AsString;
        Boleto.Cedente.UF := QSacadoSACADO_UF.AsString;
        Boleto.Cedente.Convenio := QSacadoCONVENIO.AsString;
        if QSacadoTIPO_REMESSA.AsInteger = 0 then
              Boleto.LayoutRemessa := c240
        else
              Boleto.LayoutRemessa := c400;

        Boleto.Cedente.Telefone := '(084)9633-2789';
//        Boleto.Cedente.Logomarca := '';
        case QSacadoBANCO.AsInteger of
           1: Boleto.Banco.TipoCobranca := cobBancoDoBrasil;
           4: Boleto.Banco.TipoCobranca := cobBancoDoNordeste;
           21: Boleto.Banco.TipoCobranca := cobBanestes;
           33,353,8: Boleto.Banco.TipoCobranca := cobSantander;
           41: Boleto.Banco.TipoCobranca := cobBanrisul;
           70: Boleto.Banco.TipoCobranca := cobBRB;
           104: Boleto.Banco.TipoCobranca := cobCaixaEconomica;
           1042: Boleto.Banco.TipoCobranca := cobCaixaSicob;
           237: Boleto.Banco.TipoCobranca := cobBradesco;
           341: Boleto.Banco.TipoCobranca := cobItau;
           389: Boleto.Banco.TipoCobranca := cobBancoMercantil;
           748: Boleto.Banco.TipoCobranca := cobSicred;
           756: Boleto.Banco.TipoCobranca := cobBancoob;
           399: Boleto.Banco.TipoCobranca := cobHSBC;
        end;
        BoletoImprime.DirLogo := ExtractFilePath( Application.exename ) + '\Report\Logos\';
        Mensagem_Pagamento :=QSacadoMENSAGEM_PAGAMENTO.AsString;
        Instrucoes := QSacadoINSTRUCOES_DE_PAGAMENTO.AsString;
        MultaAtrazo := QSacadoMULTA_ATRASO.AsCurrency;
        Valor_dia_Atraso := QSacadoVALOR_DIA_ATRASO.AsCurrency;
        EspecieDoc := QSacadoESPECIE_DOC.AsString;
        EspecieMoeda := QSacadoESPECIE_MOEDA.AsString;
        Aceitee := QSacadoACEITE.AsString;
        carteiraa := QSacadoCARTEIRA.AsString;
        dias_protesto := QSacadoDIAS_PROTESTO.AsInteger;
        tipo_remessa := QSacadoTIPO_REMESSA.AsInteger;
        Result := true;
     end;
  QSacado.Close;
  IBTransaction.Commit;

end;


function TDM.BuscaEstoqueProduto(const iCodPro : integer; const iCodEmp : integer) : currency;
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
             sql.add('SELECT SUM(ESTOQUE) ESTOQUE ' +
                     'FROM ESTOQUE   ' +
                     'WHERE COD_PRO = :CODPRO AND COD_EMP = :CODEMP');
             Parambyname('codpro').AsInteger:= iCodPro;
             Parambyname('codemp').AsInteger:= iCodEmp;
             open;
             result:= fieldbyname('estoque').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o estoque do produto');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

function TDM.RetornaStringTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : Variant) : string;
begin
   try
       if IBTransaction.Active then
          IBTransaction.Commit;
       IBTransaction.StartTransaction;
       with Consulta do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT ' + CampoRetorno + ' FROM ' + TABELA +
                     ' WHERE ' + CampoChave + ' = :cod');
             Parambyname('cod').Value := ValorChave;
             ExecOrOpen;
             result := fieldbyname(CampoRetorno).AsString;
          end;
       IBTransaction.Commit;
       Consulta.Close;
   except
       Result := '';
   end;
end;

function TDM.RetornaStringTabelaPlus(CampoRetorno, Tabela,
  Filtro: String): string;
begin
   try
       if IBTransaction.Active then
          IBTransaction.Commit;
       IBTransaction.StartTransaction;
       with Consulta do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT ' + CampoRetorno + ' FROM ' + TABELA +
                     ' WHERE ' + Filtro );
             ExecOrOpen;
             result := fieldbyname(CampoRetorno).AsString;
          end;
       IBTransaction.Commit;
       Consulta.Close;
   except
       Result := '';
   end;
end;


function TDM.RetornaIntegerTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : integer) : integer;
begin
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   with Consulta do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT ' + CampoRetorno + ' FROM ' + TABELA +
                 ' WHERE ' + CampoChave + ' = :cod');
         Parambyname('cod').AsInteger := ValorChave;
         ExecOrOpen;
         result:= fieldbyname(CampoRetorno).AsInteger;
      end;
   IBTransaction.Commit;
   Consulta.Close;
end;

function TDM.RetornaCurrencyTabela(CampoRetorno : string; tabela : string; Campochave : string; ValorChave : integer) : currency;
begin
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   with Consulta do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT ' + CampoRetorno + ' FROM ' + TABELA +
                 ' WHERE ' + CampoChave + ' = :cod');
         Parambyname('cod').AsInteger := ValorChave;
         ExecOrOpen;
         result:= fieldbyname(CampoRetorno).AsCurrency;
      end;
   IBTransaction.Commit;
   Consulta.Close;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil( DicFluxo );
   IBDatabase.Connected:= false;
end;

function TDM.Acesso(Funcao, TipoAcesso : String):boolean;
begin
   {VERIFICA SE O GRUPO DO USUÁRIO É SUPER}
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   with QAcesso do
      begin
         close;
         SQL.Clear;
         sql.Add('SELECT G.SUPER_GRUPO ' +
                 'FROM USUARIO U ' +
                 'INNER JOIN GRUPO_USUARIO G ' +
                 'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                 'WHERE U.COD_USU = ' + inttostr(iCodUsu));
         open;
         if trim(FieldByName('SUPER_GRUPO').AsString) <> 'S' then
             begin
                with QAcesso do
                   begin
                      close;
                      sql.Clear;
                      if TipoAcesso = 'I' then
                         sql.Add('SELECT G.INSERIR ACESSO ')
                      else
                         if TipoAcesso = 'A' then
                            sql.Add('SELECT G.ALTERAR ACESSO ')
                         else
                            if TipoAcesso = 'E' then
                               sql.Add('SELECT G.EXCLUIR ACESSO ')
                            else
                               if TipoAcesso = 'C' then
                                  sql.Add('SELECT G.INSERIR ACESSO ');
                      sql.Add('FROM USUARIO U ' +
                              'INNER JOIN FUNCOES_GRUPO_USUARIO G ' +
                              'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                              'INNER JOIN FUNCOES F ' +
                              'ON (G.COD_FUNCAO = F.COD_FUNCAO) ' +
                              'WHERE U.COD_USU = ' + inttostr(iCodUsu) +
                              ' AND F.ITEM_MENU = ' + #39 + Funcao + #39);
                      open;
                      if QAcesso.RecordCount > 0 then
                         begin
                            if TipoAcesso = 'C' then
                               Result := true
                            else
                               begin
                                  if trim(QAcesso.FieldByName('ACESSO').AsString) = 'S' then
                                     Result := true
                                  else
                                     Result := false;
                               end;
                         end
                      else
                         Result := false;
                   end;
             end
         else
            Result := true;
      end;
      IBTransaction.Commit;
      QAcesso.Close;
end;

function TDM.DireitoAcesso(iProcesso : integer; sTipoAcesso : String) : boolean;
begin
   {VERIFICA SE O GRUPO DO USUÁRIO É SUPER}
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   with QAcesso do
      begin
         close;
         SQL.Clear;
         sql.Add('SELECT G.SUPER_GRUPO ' +
                 'FROM USUARIO U ' +
                 'INNER JOIN GRUPO_USUARIO G ' +
                 'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                 'WHERE U.COD_USU = ' + inttostr(iCodUsu));
         open;

         if trim(FieldByName('SUPER_GRUPO').AsString) = 'N' then
            begin
               with QAcesso do
                  begin
                     close;
                     sql.Clear;
                     if sTipoAcesso = 'I' then
                        sql.Add('SELECT G.INSERIR ACESSO ')
                     else
                        if sTipoAcesso = 'A' then
                           sql.Add('SELECT G.ALTERAR ACESSO ')
                        else
                           if sTipoAcesso = 'E' then
                              sql.Add('SELECT G.EXCLUIR ACESSO ')
                           else
                              if sTipoAcesso = 'C' then
                                 sql.Add('SELECT G.INSERIR ACESSO ');
                     sql.Add('FROM USUARIO U ' +
                             'INNER JOIN FUNCOES_GRUPO_USUARIO G ' +
                             'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                             'INNER JOIN FUNCOES F ' +
                             'ON (G.COD_FUNCAO = F.COD_FUNCAO) ' +
                             'WHERE U.COD_USU = ' + inttostr(iCodUsu) +
                             ' AND F.ITEM_MENU = ' + #39 + inttostr(iProcesso) + #39);
                     open;
                     if QAcesso.RecordCount > 0 then
                        begin
                           if sTipoAcesso = 'C' then
                              Result := true
                           else
                              begin
                                 if trim(QAcesso.FieldByName('ACESSO').AsString) = 'S' then
                                    Result := true
                                 else
                                    Result := false;
                              end;
                        end
                     else
                        Result := false;
                  end;
            end
        else
           Result := true;
     end;
     IBTransaction.Commit;
     QAcesso.Close;
end;

procedure TDM.HabilitaMenu;
var iQtdMenu : integer;
    i : integer;
begin
   iQtdMenu:= ContaMenus - 11;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QHabilitaMenu do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT G.SUPER_GRUPO ' +
                 'FROM USUARIO U ' +
                 'INNER JOIN GRUPO_USUARIO G ' +
                 'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                 'WHERE U.COD_USU = ' + inttostr(iCodUsu));
         open;
         if trim(QHabilitaMenu.FieldByName('SUPER_GRUPO').AsString) <> 'S' then
            begin
               close;
               sql.Clear;
               sql.Add('SELECT ITEM_MENU FROM FUNCOES');
               open;
               For i:= 1 to iQtdMenu do
                   begin
                      if QHabilitaMenu.Locate('ITEM_MENU',FrmMenu.Menu.FindItem(i,fkCommand).Name,[loCaseInsensitive]) then
                         FrmMenu.Menu.FindItem(i,fkCommand).Visible:= false;
                   end;
               FrmMenu.B002.Enabled:= false; //grupo de usuario
               FrmMenu.B003.Enabled:= false; //usuario
               FrmMenu.B004.Enabled:= false; //definicao de acesso
               close;
               sql.Clear;
               sql.Add('SELECT F.ITEM_MENU ' +
                       'FROM USUARIO U ' +
                       'INNER JOIN FUNCOES_GRUPO_USUARIO G ' +
                       'ON (U.COD_GRUPO = G.COD_GRUPO) ' +
                       'INNER JOIN FUNCOES F ' +
                       'ON (G.COD_FUNCAO = F.COD_FUNCAO) ' +
                       'WHERE U.COD_USU = ' + inttostr(iCodUsu));
               open;
               For i:= 1 to iQtdMenu do
                   begin
                      if QHabilitaMenu.Locate('ITEM_MENU',FrmMenu.Menu.FindItem(
                        i,fkCommand).Name,[loCaseInsensitive]) then
                         FrmMenu.Menu.FindItem(i,fkCommand).Visible:= true;
                   end;
            end;
      end;
   dm.IBTransaction.Commit;
   QHabilitaMenu.Close;
end;

procedure TDM.QCliCalcFields(DataSet: TDataSet);
begin
   if trim(QCliBLOQUEADO_CLI.AsString) = 'S' then
      QCliNEGATIVADO.AsString:= '*'
   else
      QCliNEGATIVADO.AsString:= '';
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  SincronoNFe := 'S';
   BackupFeito := False;
   //empresa demonstracao
   bDemonstracao:= false;

   if trim(LeINI('cnfcomercio.ini', 'SKIN', 'LIGA')) = '1' then
      SkinLiga := true
   else
      SkinLiga := False;
   SkinPasta :=trim(LeINI('cnfcomercio.ini', 'SKIN', 'PASTA'));
   SkinNome :=trim(LeINI('cnfcomercio.ini', 'SKIN', 'NOME'));
   ExcluirVendas := ( Trim( LeIni( 'cnfcomercio.ini', 'ConfiguracaoLocal', 'EXCLUIRVENDAS' )) = 'S' );

   try
     IBDatabase.Connected    := false;
     IBDatabase.Params.Values['Server'] := LeINI('cnfcomercio.ini', 'ConfiguracaoLocal', 'SERVIDOR');
     IBDatabase.Params.Values['Database'] := LeINI('cnfcomercio.ini', 'ConfiguracaoLocal', 'CaminhoBanco');
     IBDatabase.Connected    := true;
   except
   end;
   iCaixa:= strtoint(trim(dm.LeINI('cnfcomercio.ini', 'ConfiguracaoLocal', 'Caixa')));
   DicFluxo := TDicFluxo.Create( IBDatabase );
   Application.CreateForm(TFrmSenha, FrmSenha);
   FrmSenha.showmodal;

  if dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'LAVANDERIA') = '' then
     dm.GravaIni( 'cnfcomercio.ini', 'ConfiguracaoLocal', 'LAVANDERIA', 'N' );
  if dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'CONSERTO') = '' then
     dm.GravaIni( 'cnfcomercio.ini', 'ConfiguracaoLocal', 'CONSERTO', 'N' );
  if dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'OS_SEM_ESTOQUE') = '' then
     dm.GravaIni( 'cnfcomercio.ini', 'ConfiguracaoLocal', 'OS_SEM_ESTOQUE', 'S' );
   VersaoNFe           := ifthen( trim(LeINI('cnfcomercio.ini', 'ConfiguracaoLocal',
   'VersaoNFe')) = '' , '200', trim(LeINI('cnfcomercio.ini', 'ConfiguracaoLocal', 'VersaoNFe')));

  AtivaLavanderia := ( UpperCase( Trim( dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'LAVANDERIA'))) = 'S' );
  AtivaConserto := ( UpperCase( Trim( dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'CONSERTO'))) = 'S' );
  ControlaEstoqueOS := ( UpperCase( Trim( dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'OS_SEM_ESTOQUE'))) = 'N' );
end;

Function TDM.LeIni(sArqIni : string; sSecao : string; sVariavel : string) : string;
var ArqIni  : tIniFile;
    sString : string;
begin
   ArqIni := tIniFile.Create( ExtractFilePath( Application.ExeName ) + '\' + sArqIni);
   Try
     result:= ArqIni.ReadString(sSecao, sVariavel, sString);
   Finally
     ArqIni.Free;
   end;
end;

procedure TDM.GravaIni(sArqIni : string; sSecao : string; sVariavel : string; sValor : string);
var ArqIni  : tIniFile;
begin
   ArqIni:= TIniFile.Create( ExtractFilePath( Application.ExeName ) + '\' + sArqini);
   try
     arqini.WriteString(sSecao, sVariavel, sValor);
   finally
     ArqIni.Free;
   end;
end;

procedure TDM.QProdCalcFields(DataSet: TDataSet);
begin
   if trim(QProdISENTO_PIS_COFINS_PRO.AsString) = 'S' then
      QProdCALC_PIS_COFINS.AsString:= 'ISENTO'
   else
      QProdCALC_PIS_COFINS.AsString:= 'NORMAL';
end;

function Tdm.CodigoBarraProduto(const sCodBarra : string) : integer;
var iAux : integer;
begin
   iAux:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsulta do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT COD_PRO ' +
                    'FROM PRODUTO ' +
                    'WHERE CODIGO_BARRA_PRO = ' + #39 + sCodBarra + #39;
         Open;
         if not (fieldbyname('COD_PRO').IsNull) then
            iAux:= fieldbyname('cod_pro').AsInteger
         else
            iAux:= 0;
      end;
   dm.IBTransaction.Commit;
   QConsulta.Close;

   result:= iAux;
end;

function Tdm.CodigoBarraEmbalagem(const sCodBarra : string) : integer;
var iAux : integer;
begin
   iAux:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsulta do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT CODIGO ' +
                    'FROM PRODUTO_EMBALAGENS ' +
                    'WHERE CODIGO_BARRA = ' + #39 + sCodBarra + #39;
         Open;
         if not (fieldbyname('CODIGO').IsNull) then
            iAux:= fieldbyname('codigo').AsInteger
         else
            iAux:= 0;
      end;
   dm.IBTransaction.Commit;
   QConsulta.Close;

   result:= iAux;
end;

procedure TDM.QTipoVendaCalcFields(DataSet: TDataSet);
begin
   if trim(QTipoVendaTABELA_PRECO_TPV.AsString) = 'N' then
      QTipoVendaCALC_TABELA.AsString:= 'NORMAL'
   else
      QTipoVendaCALC_TABELA.AsString:= 'A PRAZO';
end;

procedure TDM.QGRPCalcFields(DataSet: TDataSet);
begin
   if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'I' then
      dm.QGRPCALC_ICMS_SERVICO.AsString:= 'ICMS'
   else
   if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'S' then
      dm.QGRPCALC_ICMS_SERVICO.AsString:= 'SERVIÇO'
   else
   if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'N' then
      dm.QGRPCALC_ICMS_SERVICO.AsString:= 'NÃO FISCAL'
   else
      dm.QGRPCALC_ICMS_SERVICO.AsString:= '';
end;

function TDM.BuscaFormaPagamento(const sTipo : string) : integer;
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
             sql.Text:= 'SELECT CODIGO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE TIPO = ' + #39 + trim(sTipo) + #39;
             open;
             result:= fieldbyname('codigo').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
       AlertaCad('erro ao buscar o código da forma de pagamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TDM.QCentroCustoCalcFields(DataSet: TDataSet);
begin
   if trim(dm.QCentroCustoRECEITA_DESPESA.AsString) = 'D' then
      dm.QCentroCustoCALC_RD.AsString:= 'DESPESA'
   else
      dm.QCentroCustoCALC_RD.AsString:= 'RECEITA';
end;

procedure TDM.MensagemErroECF(const sMensagem : string; bMostrar : boolean);
begin
   if bMostrar then
      AlertaCad(sMensagem);
end;

function TDM.MovimentoMesmoUF(UF: STring): Boolean;
begin
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;

  dm.QConsulta.Close;
  dm.QConsulta.SQL.Text := 'select EST_EMP from EMPRESA where COD_EMP=:COD_EMP';
  dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  dm.QConsulta.Open;
  if Trim(  dm.QConsulta.FieldByName( 'EST_EMP'  ).AsString )= UF then
     result := True
  else
     result := False;


  dm.IBTransaction.Commit;
end;


procedure TDM.QBandeiraCalcFields(DataSet: TDataSet);
begin
   if trim(dm.QBandeiraTIPO_CARTAO.AsString) = 'C' then
      dm.QBandeiraCALC_TIPO.AsString:= 'CRÉDITO'
   else
   if trim(dm.QBandeiraTIPO_CARTAO.AsString) = 'D' then
      dm.QBandeiraCALC_TIPO.AsString:= 'DÉBITO'
   else
   if trim(dm.QBandeiraTIPO_CARTAO.AsString) = 'A' then
      dm.QBandeiraCALC_TIPO.AsString:= 'CRÉDITO/DÉBITO';
end;

procedure TDM.QBuscaItensNFCalcFields(DataSet: TDataSet);
begin
   QBuscaItensNFCALC_TOTAL.AsCurrency := QBuscaItensNFQUANT.AsCurrency * QBuscaItensNFUNIT.AsCurrency;
end;

procedure TDM.ACBrNFe1StatusChange(Sender: TObject);
begin
   case dm.ACBrNFe1.Status of
     stIdle : begin
                 if (frmStatusNfe <> nil) then
                    FrmStatusNfe.Hide;
              end;

     stNFeStatusServico : begin
                             if (frmStatusNfe = nil) then
                                 frmStatusNfe:= TfrmStatusNfe.Create(Application);
                             frmStatusNfe.lblStatus.Caption:= 'Verificando Status do servico...';
                             frmStatusNfe.Show;
                             frmStatusNfe.BringToFront;
                          end;

     stNFeRecepcao : begin
                        if (frmStatusNfe = nil) then
                            frmStatusNfe := TfrmStatusNfe.Create(Application);
                        frmStatusNfe.lblStatus.Caption := 'Enviando dados da NFe...';
                        frmStatusNfe.Show;
                        frmStatusNfe.BringToFront;
                        AtualizaStatusNfe(iCodigoNfe, 'STATUS_TRANSMITIDA', 'NULL') ;
                     end;

     stNfeRetRecepcao : begin
                           if (frmStatusNfe = nil) then
                               frmStatusNfe := TfrmStatusNfe.Create(Application);
                           frmStatusNfe.lblStatus.Caption := 'Recebendo dados da NFe...';
                           frmStatusNfe.Show;
                           frmStatusNfe.BringToFront;
                           AtualizaStatusNfe(iCodigoNfe, 'STATUS_RETORNO', 'NULL') ;
                        end;

     stNfeConsulta : begin
                        if (frmStatusNfe = nil) then
                            frmStatusNfe := TfrmStatusNfe.Create(Application);
                        frmStatusNfe.lblStatus.Caption := 'Consultando NFe...';
                        frmStatusNfe.Show;
                        frmStatusNfe.BringToFront;
                     end;

     stNfeCancelamento : begin
                            if (frmStatusNfe = nil) then
                                frmStatusNfe := TfrmStatusNfe.Create(Application);
                            frmStatusNfe.lblStatus.Caption := 'Enviando cancelamento de NFe...';
                            frmStatusNfe.Show;
                            frmStatusNfe.BringToFront;

                         end;

     stNfeInutilizacao : begin
                            if (frmStatusNfe = nil) then
                                frmStatusNfe := TfrmStatusNfe.Create(Application);
                            frmStatusNfe.lblStatus.Caption := 'Enviando pedido de Inutilização...';
                            frmStatusNfe.Show;
                            frmStatusNfe.BringToFront;

                         end;

     stNFeRecibo : begin
                      if (frmStatusNfe = nil) then
                          frmStatusNfe := TfrmStatusNfe.Create(Application);
                      frmStatusNfe.lblStatus.Caption := 'Consultando Recibo de Lote...';
                      frmStatusNfe.Show;
                      frmStatusNfe.BringToFront;
                   end;

     stNFeCadastro : begin
                        if (frmStatusNfe = nil) then
                            frmStatusNfe := TfrmStatusNfe.Create(Application);
                        frmStatusNfe.lblStatus.Caption := 'Consultando Cadastro...';
                        frmStatusNfe.Show;
                        frmStatusNfe.BringToFront;
                     end;


     stNFeEmail : begin
                     if (frmStatusNfe = nil) then
                         frmStatusNfe := TfrmStatusNfe.Create(Application);
                     frmStatusNfe.lblStatus.Caption := 'Enviando Email...';
                     frmStatusNfe.Show;
                     frmStatusNfe.BringToFront;
                  end;
     stNFeCCe : begin
                     if (frmStatusNfe = nil) then
                         frmStatusNfe := TfrmStatusNfe.Create(Application);
                     frmStatusNfe.lblStatus.Caption := 'Enviando Carta de Correção...';
                     frmStatusNfe.Show;
                     frmStatusNfe.BringToFront;
                  end;
  end;

  Application.ProcessMessages;
end;

procedure TDM.AtualizaStatusNfe(const iCodigoNfe : integer; const sCampoStatus, sJustificativa : string);
var
 SQLTemp: String;
begin
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   try
     try
       with QConsulta do
          begin
             close;
             sql.Clear;
             if trim(sJustificativa) = 'NULL' then
                begin
                   SQLTemp := 'UPDATE NOTA_FISCAL ' +
                              'SET ' + trim(sCampoStatus) + '=' + quotedstr('S') +
                              ' WHERE COD_NF = :CODNF';
                   sql.Text:= SQLTemp;
                   Parambyname('codnf').AsInteger:= iCodigoNfe;
                end
             else
                begin
                    SQLTemp := 'UPDATE NOTA_FISCAL ' +
                              'SET JUSTIFICATIVA_CANCEL_INUTIL = :JUST, ' + sCampoStatus + ' = ' + quotedstr( 'S' ) +
                              ' WHERE COD_NF = :CODNF';
                   sql.Text:= SQLTemp;
                   Parambyname('codnf').AsInteger := iCodigoNfe;
                   parambyname('just').AsString   := sJustificativa;
                end;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro atualizando status da NFe');
     end;
   finally
     QConsulta.Close;
   end;
end;

procedure TDM.AtualizaStatusNfeInu(const ini, fim, serie : integer; const sCampoStatus, sJustificativa : string);
var
 SQLTemp: String;
 I: Integer;
begin
   if IBTransaction.Active then
      IBTransaction.Commit;
   IBTransaction.StartTransaction;
   try
     try
       for I := ini to fim  do
       begin
       with QConsulta do
          begin
             close;
             sql.Clear;
             if trim(sJustificativa) = 'NULL' then
                begin
                   SQLTemp := 'UPDATE NOTA_FISCAL ' +
                              'SET ' + trim(sCampoStatus) + '=' + quotedstr('S') +
                              ' WHERE NUMERO_NOTA_NF = :CODNF and SERIE_NOTA=:serie';
                   sql.Text:= SQLTemp;
                   Parambyname('codnf').AsInteger:= I;
                   Parambyname('serie').AsInteger:= serie;
                end
             else
                begin
                    SQLTemp := 'UPDATE NOTA_FISCAL ' +
                              'SET JUSTIFICATIVA_CANCEL_INUTIL = :JUST, ' + sCampoStatus + ' = ' + quotedstr( 'S' ) +
                              ' WHERE NUMERO_NOTA_NF = :CODNF and SERIE_NOTA=:serie';
                   sql.Text:= SQLTemp;
                   Parambyname('codnf').AsInteger:= I;
                   Parambyname('serie').AsInteger:= serie;
                   parambyname('just').AsString   := sJustificativa;
                end;
             open;
          end;
       end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro atualizando status da NFe');
     end;
   finally
     QConsulta.Close;
   end;
end;

function TDM.ConfiguraNFe( NFe: TAcbrNFe ): Boolean;
begin
//  { busca parametros }
  dm.ACBrNFe1.NotasFiscais.Clear;
  result := False;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Add(
          'SELECT CAMINHO_CERTIFICADO, SENHA_CERTIFICADO, NUMERO_SERIE_CERTIFICADO,     '
            +
            'TIPO_IMPRESSAO_DANFE, FORMA_EMISSAO_DANFE, CAMINHO_LOGOMARCA_DANFE,          '
            +
            'SALVAR_LOG_DANFE, CAMINHO_LOG_DANFE, AMBIENTE_DANFE, PASTA_CANCELADAS_DANFE, '
            +
            'NFE_VERSAO, NFE_SINCRONO, ' +
            'PASTA_INUTILIZADAS_DANFE, PASTA_TRANSMITIDAS_DANFE, CAMINHO_ARQUIVOS_PDF,    ' + 'CAMINHO_RELATORIO_DANFE, ESTADO_NFE ' + 'FROM PARAMETROS ' + 'WHERE COD_EMP = :CODEMP');
        Parambyname('codemp').AsInteger := iEmp;
        Open;

        { Configurando a NFe }
        NFe.Configuracoes.Certificados.Senha := trim
          (fieldbyname('senha_certificado').AsString);
        NFe.Configuracoes.Certificados.NumeroSerie := trim
          (fieldbyname('numero_serie_certificado').AsString);
        if Assigned( NFe.DANFE ) then
           begin
                if trim(fieldbyname('tipo_impressao_danfe').AsString) = 'R' then
                  NFe.DANFE.TipoDANFE := tiRetrato
                else
                  NFe.DANFE.TipoDANFE := tiPaisagem;
                NFe.DANFE.Logo := trim(fieldbyname('caminho_logomarca_danfe')
                    .AsString);
           end;

        case fieldbyname('forma_emissao_danfe').AsInteger of
          1:
            NFe.Configuracoes.Geral.FormaEmissao := teNormal;
          2:
            NFe.Configuracoes.Geral.FormaEmissao := teContingencia;
          3:
            NFe.Configuracoes.Geral.FormaEmissao := teSCAN;
          4:
            NFe.Configuracoes.Geral.FormaEmissao := teDPEC;
          5:
            NFe.Configuracoes.Geral.FormaEmissao := teFSDA;
        end;


        if trim(fieldbyname('salvar_log_danfe').AsString) = 'S' then
          NFe.Configuracoes.Arquivos.Salvar := true
        else
          NFe.Configuracoes.Arquivos.Salvar := false;

        NFe.Configuracoes.Arquivos.PathSalvar := trim
          (fieldbyname('caminho_log_danfe').AsString);

        if trim(fieldbyname('ambiente_danfe').AsString) = 'P' then
          NFe.Configuracoes.WebServices.Ambiente := taProducao
        else
          NFe.Configuracoes.WebServices.Ambiente := taHomologacao;

        NFe.Configuracoes.WebServices.UF := trim
          (fieldbyname('estado_nfe').AsString); ;
        NFe.Configuracoes.WebServices.Visualizar := false;
        NFe.Configuracoes.Arquivos.SalvarEvento := true;
        NFe.Configuracoes.Arquivos.SalvarApenasNFeProcessadas := False;
        NFe.Configuracoes.Arquivos.SepararPorModelo := True;
        NFe.Configuracoes.Arquivos.PathEvento := trim
          (fieldbyname('pasta_transmitidas_danfe').AsString);
        NFe.Configuracoes.Arquivos.PathInu := trim
          (fieldbyname('pasta_inutilizadas_danfe').AsString);
        NFe.Configuracoes.Arquivos.PathNFe := trim
          (fieldbyname('pasta_transmitidas_danfe').AsString);
        dm.ACBrNFeDANFEFR1.PathPDF := trim
          (fieldbyname('caminho_arquivos_pdf').AsString);
        dm.ACBrNFeDANFEFR1.FastFile := trim
          (fieldbyname('caminho_relatorio_danfe').AsString);

        if not DirectoryExists( fieldbyname('pasta_transmitidas_danfe').AsString ) then
           ForceDirectories( fieldbyname('pasta_transmitidas_danfe').AsString );
        if not DirectoryExists( fieldbyname('pasta_inutilizadas_danfe').AsString ) then
           ForceDirectories( fieldbyname('pasta_inutilizadas_danfe').AsString );
        if not DirectoryExists( fieldbyname('caminho_arquivos_pdf').AsString ) then
           ForceDirectories( fieldbyname('caminho_arquivos_pdf').AsString );
        if not DirectoryExists( fieldbyname('caminho_arquivos_pdf').AsString ) then
           ForceDirectories( fieldbyname('caminho_arquivos_pdf').AsString );
        if not DirectoryExists( fieldbyname('caminho_log_danfe').AsString ) then
           ForceDirectories( fieldbyname('caminho_log_danfe').AsString );
        NFe.Configuracoes.Arquivos.EmissaoPathNFe := True;
        NFe.Configuracoes.Arquivos.SepararPorMes := True;
        NFe.Configuracoes.Arquivos.SepararPorCNPJ := True;
        NFe.Configuracoes.Geral.ExibirErroSchema := True;

        SincronoNFe := FieldByName( 'NFE_SINCRONO' ).AsString;

        case AnsiIndexStr( FieldByName( 'NFE_VERSAO' ).AsString, ['2.00', '3.00', '3.10' ] ) of
            0: begin
                 NFe.Configuracoes.Geral.VersaoDF := ve200;
                 NFe.Configuracoes.Geral.ModeloDF := moNFe;
               end;
            1: NFe.Configuracoes.Geral.VersaoDF := ve300;
            2: begin
                 NFe.Configuracoes.Geral.ModeloDF := moNFe;
                 NFe.Configuracoes.Geral.VersaoDF := ve310;
               end;
        end;
        Dm.ACBrNFeDANFEFR1.ExibeCampoFatura := true;
        NFe.Configuracoes.Arquivos.SalvarEvento := True;
        NFe.Configuracoes.Arquivos.PathSchemas :=
           TPath.Combine( ExtractFilePath( Application.ExeName ),
           'Schemas\ve' + OnlyNumber( FieldByName( 'NFE_VERSAO' ).AsString ) );
      end;
      Result := NFe.Configuracoes.Certificados.VerificarValidade;
      if not Result then
         AlertaCad( 'Certificado Vencido!' + sLineBreak +
         'Data do Vencimento: ' + FormatDateTime( 'dd/mm/yyyy', NFe.SSL.CertDataVenc  ) );
    except
      dm.IBTransaction.Rollback;
      Result := False;
    end;
  finally
    if DM.QConsulta.Active then
       dm.QConsulta.close;
    dm.IBTransaction.Commit;
  end;
end;

function TDM.ContaMenus: Integer;
var
  i : integer;
  Total: Integer;
begin
  Total := 0;
  for i := 0 to frmMenu.ComponentCount - 1 do
    begin
        if UpperCase(frmMenu.Components[i].ClassName) = Uppercase('TMENUITEM') then
           Inc( Total );

    end;
  Result := Total;
end;


function TDM.VerificaCNPJCadastrado(const sCNPJ : string) : boolean;
var i : integer;
begin
   result:= true;
{   for i:= 1 to length(Tcnpj) do
      begin
         if trim(sCNPJ) = trim(Tcnpj[i]) then
            Result:= true;
      end;}
end;



function TDM.VerificaWebServices( NFe: TACBrNFe ): Boolean;
begin
    try
       NFe.WebServices.StatusServico.Executar;
       Result := NFe.WebServices.StatusServico.cStat = 107;
       if not Result then
         AlertaCad( 'Problemas com WebService: ' + sLineBreak +
         NFe.WebServices.StatusServico.xMotivo );
    except
        on E: Exception do
           begin
              AlertaCad( 'Problemas com WebService: ' + sLineBreak + E.Message );
              Result := False;
           end;
    end;
end;

end.








