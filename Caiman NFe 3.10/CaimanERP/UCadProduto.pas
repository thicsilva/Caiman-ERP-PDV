unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadNovoDB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxClasses, Vcl.ImgList, Vcl.StdCtrls, cxButtons, Vcl.Mask, Vcl.ComCtrls,
  cxTextEdit, cxCurrencyEdit, cxLabel, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ExtCtrls, Vcl.ToolWin, System.StrUtils, Vcl.DBCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FireDAC.Stan.ExprFuncs, UNovosComponentes, cxCalendar, cxDBEdit, Vcl.Buttons,
  Vcl.ExtDlgs, cxDBLabel, sSpeedButton, cxDBExtLookupComboBox, Vcl.Menus,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, RzPanel, RzDBNav, cxImage, acbrutil,
  Vcl.Clipbrd, System.ImageList, JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);
  TFrmCadProduto = class(TfrmCadNovoDB)
    cxVisualizaDBTableView1COD_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_LAB: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_SEC: TcxGridDBColumn;
    cxVisualizaDBTableView1VALOR_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1PROMOCAO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1CONTROLA_ESTOQUE_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1COMISSAO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1QUANT_UNIDADE_ENTRADA: TcxGridDBColumn;
    cxVisualizaDBTableView1ESTOQUE_MINIMO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1DESC_CUPOM: TcxGridDBColumn;
    cxVisualizaDBTableView1ATIVO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1MARGEM_LUCRO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1LOCALIZACAO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1PRODUTO_PESADO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_SETOR: TcxGridDBColumn;
    cxVisualizaDBTableView1TECLA_ATALHO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1INDICE_RECEITA_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1DIAS_VALIDADE_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1REFERENCIA_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1COMPLEMENTO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1SAIR_TABELA_PRECO: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_NCM: TcxGridDBColumn;
    cxVisualizaDBTableView1CODIGO_TIPO: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_PRODUTO_ESTOQUE: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_GRUPO: TcxGridDBColumn;
    cxVisualizaDBTableView1SUB_GRUPO: TcxGridDBColumn;
    cxVisualizaDBTableView1PRECO_PROGRAMADO: TcxGridDBColumn;
    cxVisualizaDBTableView1PRECO_CUSTO: TcxGridDBColumn;
    cxVisualizaDBTableView1PRECO_PRAZO_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1TIPO_PRODUCAO: TcxGridDBColumn;
    cxVisualizaDBTableView1CODIGO_BARRA_PRO: TcxGridDBColumn;
    cxVisualizaDBTableView1CODIGO_UNIDADE_SAIDA: TcxGridDBColumn;
    cxVisualizaDBTableView1CODIGO_UNIDADE_ENTRADA: TcxGridDBColumn;
    cxVisualizaDBTableView1PRECO_PROGRAMADO_PRAZO: TcxGridDBColumn;
    cxVisualizaDBTableView1DATA_VALIDADE: TcxGridDBColumn;
    cxVisualizaDBTableView1CODIGO_SETOR_ESTOQUE: TcxGridDBColumn;
    cxVisualizaDBTableView1TAMANHO: TcxGridDBColumn;
    cxVisualizaDBTableView1COR: TcxGridDBColumn;
    cxVisualizaDBTableView1OBS: TcxGridDBColumn;
    cxVisualizaDBTableView1ULTIMA_ALTERACAO: TcxGridDBColumn;
    cxVisualizaDBTableView1VALOR_ATACADO: TcxGridDBColumn;
    cxVisualizaDBTableView1ALERTA_COPA: TcxGridDBColumn;
    cxVisualizaDBTableView1ALERTA_COZINHA: TcxGridDBColumn;
    cxVisualizaDBTableView1ANDROID_VISUALIZA: TcxGridDBColumn;
    cxVisualizaDBTableView1TEMPO_PREPARO: TcxGridDBColumn;
    cxVisualizaDBTableView1NAO_PERMITE_FRAC: TcxGridDBColumn;
    cxVisualizaDBTableView1SABORES: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_LAB: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_SEC: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_GRUPO: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_SUBGRUPO: TcxGridDBColumn;
    cxVisualizaDBTableView1UNID_ENT: TcxGridDBColumn;
    cxVisualizaDBTableView1UNID_SAI: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_SETOR_ESTOQUE: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_PRO_ESTOQUE: TcxGridDBColumn;
    cxVisualizaDBTableView1NOME_SETOR_BAL: TcxGridDBColumn;
    cxVisualizaDBTableView1ESTOQUE: TcxGridDBColumn;
    cxPaginas2: TcxPageControl;
    cxDadosProduto: TcxTabSheet;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    dbedtCOD_PRO: TDBEdit;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    dbedtNOME_PRO: TDBEdit;
    upPrincipal: TFDUpdateSQL;
    cxLabel3: TcxLabel;
    dbedtCODIGO_BARRA_PRO: TDBEdit;
    cxLabel4: TcxLabel;
    cxDBLTipo: TcxDBLookupComboBox;
    QTipos: TFDQuery;
    QTiposCODIGO: TIntegerField;
    QTiposDESCRICAO: TStringField;
    QTiposSERVICO: TStringField;
    QTiposEFD_TIPO: TStringField;
    dsTipos: TDataSource;
    dbrgrpTIPO_PRODUCAO: TDBRadioGroup;
    pnlLateral1: TPanel;
    pnlCentral1: TPanel;
    grpAtivoCont: TGroupBox;
    dbchkATIVO_PRO: TDBCheckBox;
    dbchkCOMPLEMENTO_PRO: TDBCheckBox;
    dbchkCONTROLA_ESTOQUE_PRO: TDBCheckBox;
    Panel5: TPanel;
    cxLabel5: TcxLabel;
    dbedtDESC_CUPOM: TDBEdit;
    QPrincipalCOD_PRO: TIntegerField;
    QPrincipalCOD_LAB: TIntegerField;
    QPrincipalCOD_SEC: TIntegerField;
    QPrincipalVALOR_PRO: TBCDField;
    QPrincipalPROMOCAO_PRO: TBCDField;
    QPrincipalCONTROLA_ESTOQUE_PRO: TStringField;
    QPrincipalCOMISSAO_PRO: TBCDField;
    QPrincipalQUANT_UNIDADE_ENTRADA: TBCDField;
    QPrincipalESTOQUE_MINIMO_PRO: TBCDField;
    QPrincipalNOME_PRO: TStringField;
    QPrincipalDESC_CUPOM: TStringField;
    QPrincipalATIVO_PRO: TStringField;
    QPrincipalMARGEM_LUCRO_PRO: TBCDField;
    QPrincipalLOCALIZACAO_PRO: TStringField;
    QPrincipalPRODUTO_PESADO_PRO: TStringField;
    QPrincipalCOD_SETOR: TIntegerField;
    QPrincipalTECLA_ATALHO_PRO: TIntegerField;
    QPrincipalINDICE_RECEITA_PRO: TIntegerField;
    QPrincipalDIAS_VALIDADE_PRO: TIntegerField;
    QPrincipalREFERENCIA_PRO: TStringField;
    QPrincipalCOMPLEMENTO_PRO: TStringField;
    QPrincipalICMS_CONT_EST: TIntegerField;
    QPrincipalICMS_CONT_FORA: TIntegerField;
    QPrincipalICMS_CF_EST: TIntegerField;
    QPrincipalICMS_CF_FORA: TIntegerField;
    QPrincipalCST_CONT_EST: TStringField;
    QPrincipalCST_CONT_FORA: TStringField;
    QPrincipalCST_CF_EST: TStringField;
    QPrincipalCST_CF_FORA: TStringField;
    QPrincipalCAMINHO_FOTO_PRO: TStringField;
    QPrincipalSAIR_TABELA_PRECO: TStringField;
    QPrincipalCFOP_VENDAS_CONT_EST: TIntegerField;
    QPrincipalCFOP_VENDAS_CF_EST: TIntegerField;
    QPrincipalCFOP_VENDAS_CONT_FORA: TIntegerField;
    QPrincipalCFOP_VENDAS_CF_FORA: TIntegerField;
    QPrincipalST_CONT_EST: TStringField;
    QPrincipalVR_AGREG_CONT_EST: TBCDField;
    QPrincipalIPI_CONT_EST: TBCDField;
    QPrincipalIPI_CF_EST: TBCDField;
    QPrincipalIPI_CONT_FORA: TBCDField;
    QPrincipalIPI_CF_FORA: TBCDField;
    QPrincipalCOD_NCM: TStringField;
    QPrincipalCLASSIFICACAO_FISCAL: TStringField;
    QPrincipalCODIGO_TIPO: TIntegerField;
    QPrincipalCOD_PRODUTO_ESTOQUE: TIntegerField;
    QPrincipalCOD_GRUPO: TIntegerField;
    QPrincipalSUB_GRUPO: TIntegerField;
    QPrincipalPRECO_PROGRAMADO: TBCDField;
    QPrincipalALIQUOTA_PIS: TBCDField;
    QPrincipalALIQUOTA_COFINS: TBCDField;
    QPrincipalALIQUOTA_IR: TBCDField;
    QPrincipalALIQUOTA_CSLL: TBCDField;
    QPrincipalALIQUOTA_OUTRAS: TBCDField;
    QPrincipalISENTO_PIS_COFINS_PRO: TStringField;
    QPrincipalPRECO_CUSTO: TBCDField;
    QPrincipalCREDITO_ICMS: TBCDField;
    QPrincipalPRECO_PRAZO_PRO: TBCDField;
    QPrincipalTIPO_PRODUCAO: TStringField;
    QPrincipalCODIGO_BARRA_PRO: TStringField;
    QPrincipalCODIGO_UNIDADE_SAIDA: TIntegerField;
    QPrincipalCODIGO_UNIDADE_ENTRADA: TIntegerField;
    QPrincipalPRECO_PROGRAMADO_PRAZO: TBCDField;
    QPrincipalRED_CF_EST: TBCDField;
    QPrincipalRED_CF_FORA: TBCDField;
    QPrincipalRED_CONT_EST: TBCDField;
    QPrincipalRED_CONT_FORA: TBCDField;
    QPrincipalDATA_VALIDADE: TDateField;
    QPrincipalCODIGO_SETOR_ESTOQUE: TIntegerField;
    QPrincipalORIG: TIntegerField;
    QPrincipalCSOSN: TStringField;
    QPrincipalIPI: TFloatField;
    QPrincipalICMS: TFloatField;
    QPrincipalRICMS: TFloatField;
    QPrincipalIVA: TFloatField;
    QPrincipalPIS: TFloatField;
    QPrincipalCONFINS: TFloatField;
    QPrincipalTAMANHO: TStringField;
    QPrincipalCOR: TStringField;
    QPrincipalOBS: TMemoField;
    QPrincipalCST_PIS: TStringField;
    QPrincipalCST_COFINS: TStringField;
    QPrincipalCST_IPI: TStringField;
    QPrincipalULTIMA_ALTERACAO: TDateField;
    QPrincipalVALOR_ATACADO: TBCDField;
    QPrincipalALIQ_IBPT_NAC: TBCDField;
    QPrincipalALIQ_IBPT_IMP: TBCDField;
    QPrincipalFATOR_CONVERSAO: TBCDField;
    QPrincipalALERTA_COPA: TStringField;
    QPrincipalALERTA_COZINHA: TStringField;
    QPrincipalANDROID_VISUALIZA: TStringField;
    QPrincipalTEMPO_PREPARO: TTimeField;
    QPrincipalNAO_PERMITE_FRAC: TIntegerField;
    QPrincipalSABORES: TIntegerField;
    QPrincipalNOME_LAB: TStringField;
    QPrincipalNOME_SEC: TStringField;
    QPrincipalNOME_GRUPO: TStringField;
    QPrincipalNOME_SUBGRUPO: TStringField;
    QPrincipalUNID_ENT: TStringField;
    QPrincipalUNID_SAI: TStringField;
    QPrincipalNOME_SETOR_ESTOQUE: TStringField;
    QPrincipalNOME_PRO_ESTOQUE: TStringField;
    QPrincipalNOME_SETOR_BAL: TStringField;
    QPrincipalESTOQUE: TBCDField;
    QPrincipalNOME_TIPO: TStringField;
    dbchkSAIR_TABELA_PRECO: TDBCheckBox;
    cxVisualizaDBTableView1NOME_TIPO: TcxGridDBColumn;
    Panel6: TPanel;
    cxLabel6: TcxLabel;
    dbedtESTOQUE_MINIMO_PRO: TDBEdit;
    cxLabel7: TcxLabel;
    dbedtLOCALIZACAO_PRO: TDBEdit;
    cxLabel8: TcxLabel;
    dbedtREFERENCIA_PRO: TDBEdit;
    cxLabel9: TcxLabel;
    Panel7: TPanel;
    cxLabel10: TcxLabel;
    dbedtTAMANHO: TDBEdit;
    QUnidades: TFDQuery;
    QUnidadesCODIGO: TIntegerField;
    QUnidadesDESCRICAO: TStringField;
    dsUnidade: TDataSource;
    dbedtCOR: TDBEdit;
    cxLabel11: TcxLabel;
    cxDBCODIGO_UNIDADE_SAIDA: TcxDBLookupComboBox;
    cxLabel12: TcxLabel;
    cxDBCODIGO_UNIDADE_ENTRADA: TcxDBLookupComboBox;
    cxLabel13: TcxLabel;
    Panel8: TPanel;
    cxLabel14: TcxLabel;
    dbedtVALOR_PRO: TDBEdit;
    cxLabel15: TcxLabel;
    dbedtPRECO_PRAZO_PRO: TDBEdit;
    cxLabel16: TcxLabel;
    dbedtPROMOCAO_PRO: TDBEdit;
    QLaboratorios: TFDQuery;
    dsLaboratorios: TDataSource;
    Panel9: TPanel;
    cxLabel17: TcxLabel;
    QLaboratoriosCOD_LAB: TIntegerField;
    QLaboratoriosNOME_LAB: TStringField;
    QLaboratoriosCOMISSAO_FIXA: TStringField;
    QLaboratoriosCOMISSAO: TFloatField;
    QLaboratoriosREDUCAO: TFloatField;
    cxDBCOD_LAB: TcxDBLookupComboBox;
    cxLabel18: TcxLabel;
    dbedtMARGEM_LUCRO_PRO: TDBEdit;
    cxLabel19: TcxLabel;
    dbedtQUANT_UNIDADE_ENTRADA: TDBEdit;
    cxLabel20: TcxLabel;
    dbedtCOMISSAO_PRO: TDBEdit;
    cxLabel21: TcxLabel;
    cxDBCODIGO_SETOR_ESTOQUE: TcxDBLookupComboBox;
    QSetorEstoque: TFDQuery;
    dsSetorEstoque: TDataSource;
    QSetorEstoqueCODIGO: TIntegerField;
    QSetorEstoqueDESCRICAO: TStringField;
    QSetorEstoqueCOD_USU: TIntegerField;
    QSetorEstoqueDATA_INICIO_ESTOQUE: TDateField;
    Panel10: TPanel;
    cxLabel22: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel23: TcxLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    QSecao: TFDQuery;
    QGrupo: TFDQuery;
    QSubGrupo: TFDQuery;
    dsSecao: TDataSource;
    dsGrupo: TDataSource;
    dsSubGrupo: TDataSource;
    QSecaoCOD_SEC: TIntegerField;
    QSecaoNOME_SEC: TStringField;
    QSecaoCAMINHO_FOTO_SEC: TStringField;
    QSecaoBEBIDAS_FUMO_SEC: TStringField;
    QGrupoCOD_SEC: TIntegerField;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESCRICAO: TStringField;
    QSubGrupoCOD_SEC: TIntegerField;
    QSubGrupoCOD_GRUPO: TIntegerField;
    QSubGrupoCOD_SUBGRUPO: TIntegerField;
    QSubGrupoDESCRICAO: TStringField;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxLabel24: TcxLabel;
    Panel11: TPanel;
    cxLabel25: TcxLabel;
    cxDBDATA_VALIDADE: TcxDBDateEdit;
    cxBalanca: TcxTabSheet;
    pnl1: TPanel;
    dbrgrpPRODUTO_PESADO_PRO: TDBRadioGroup;
    pnl2: TPanel;
    cxLabel26: TcxLabel;
    cxDBCOD_SETOR: TcxDBLookupComboBox;
    QSetorBal: TFDQuery;
    dsSetorBal: TDataSource;
    QSetorBalCOD_SET: TIntegerField;
    QSetorBalNOME_SET: TStringField;
    Panel12: TPanel;
    Panel13: TPanel;
    cxLabel27: TcxLabel;
    cxDBINDICE_RECEITA_PRO: TcxDBLookupComboBox;
    Panel14: TPanel;
    cxLabel28: TcxLabel;
    dbedtDIAS_VALIDADE_PRO: TDBEdit;
    QReceita: TFDQuery;
    dsReceita: TDataSource;
    QReceitaCOD_RECEITA: TIntegerField;
    QReceitaINGREDIENTES: TStringField;
    Panel15: TPanel;
    cxLabel29: TcxLabel;
    dbedtTECLA_ATALHO_PRO: TDBEdit;
    cxObs: TcxTabSheet;
    dbmmoOBS: TDBMemo;
    cxFoto: TcxTabSheet;
    GroupBox1: TGroupBox;
    Panel16: TPanel;
    Image: TImage;
    btnNovaFoto: TcxButton;
    btnLimparFoto: TcxButton;
    dlgOpenPic: TOpenPictureDialog;
    cxCompra: TcxTabSheet;
    Panel17: TPanel;
    QCompras: TFDQuery;
    QComprasCOD_ENT: TIntegerField;
    QComprasCOD_PRO: TIntegerField;
    QComprasPERC_ICMS: TBCDField;
    QComprasPERC_IPI: TBCDField;
    QComprasQTDUND_ENT: TBCDField;
    QComprasPERC_DESC: TBCDField;
    QComprasPERC_ACRES: TBCDField;
    QComprasCOD_EMP: TIntegerField;
    QComprasVALOR_UNIT_PRO: TBCDField;
    QComprasCUSTO: TBCDField;
    QComprasQTD_PRO: TBCDField;
    QComprasCOD_GRP: TIntegerField;
    QComprasCOD_CFOP: TIntegerField;
    QComprasVALOR_DESCONTO: TBCDField;
    QComprasVALOR_ACRESCIMO: TBCDField;
    QComprasPERC_BCR: TBCDField;
    QComprasCST: TStringField;
    QComprasVALOR_TOTAL: TBCDField;
    QComprasBASE_CALCULO: TBCDField;
    QComprasVALOR_ICMS: TBCDField;
    QComprasORDEM: TIntegerField;
    QComprasPERC_ST: TBCDField;
    QComprasVALOR_SUB_TRIBUTARIA: TBCDField;
    QComprasVALOR_IPI: TBCDField;
    QComprasCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QComprasBC_ST: TBCDField;
    QComprasCST_IPI: TStringField;
    QComprasCST_PIS: TStringField;
    QComprasALIQ_PIS: TBCDField;
    QComprasVALOR_PIS: TBCDField;
    QComprasCST_COFINS: TStringField;
    QComprasALIQ_COFINS: TBCDField;
    QComprasVALOR_COFINS: TBCDField;
    QComprasCOD_ENT_1: TIntegerField;
    QComprasCOD_EMP_1: TIntegerField;
    QComprasDATAEMI_ENT: TDateField;
    QComprasDATAENT_ENT: TDateField;
    QComprasCOD_FOR: TIntegerField;
    QComprasTOTAL_ENT: TBCDField;
    QComprasACRES_ENT: TBCDField;
    QComprasDESC_ENT: TBCDField;
    QComprasFRETE_ENT: TBCDField;
    QComprasICMSFRETE_ENT: TBCDField;
    QComprasTIPO_ENT: TStringField;
    QComprasNUMNF_ENT: TStringField;
    QComprasSERIE_ENT: TStringField;
    QComprasBASE_SUB_TRIB: TBCDField;
    QComprasVALOR_ICMS_SUB: TBCDField;
    QComprasFRETE_INCLUSO: TStringField;
    QComprasICMS_SUB_INCLUSO: TStringField;
    QComprasTOTAL_PRODUTOS: TBCDField;
    QComprasCUSTO_SEM_DESCONTO: TStringField;
    QComprasCODIFICACAO_FISCAL: TStringField;
    QComprasCODIGO_ES: TIntegerField;
    QComprasCHAVE_NFE: TStringField;
    QComprasVALOR_PIS_1: TBCDField;
    QComprasVALOR_COFINS_1: TBCDField;
    QComprasCODIGO_ESTADO: TStringField;
    QComprasBC_ICMS: TBCDField;
    QComprasVL_ICMS: TBCDField;
    QComprasVL_IPI: TBCDField;
    QComprasVL_SEG: TBCDField;
    QComprasRAZAO_FOR: TStringField;
    QComprasRAZAO_EMP: TStringField;
    dsCompras: TDataSource;
    Panel18: TPanel;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBLabel7: TcxDBLabel;
    cxDBLabel8: TcxDBLabel;
    cxDBLabel9: TcxDBLabel;
    cxDBLabel10: TcxDBLabel;
    cxDBLabel11: TcxDBLabel;
    cxDBLabel12: TcxDBLabel;
    cxDBLabel13: TcxDBLabel;
    cxComprasDBTableView1: TcxGridDBTableView;
    cxComprasLevel1: TcxGridLevel;
    cxCompras: TcxGrid;
    cxComprasDBTableView1VALOR_UNIT_PRO: TcxGridDBColumn;
    cxComprasDBTableView1CUSTO: TcxGridDBColumn;
    cxComprasDBTableView1QTD_PRO: TcxGridDBColumn;
    cxComprasDBTableView1VALOR_DESCONTO: TcxGridDBColumn;
    cxComprasDBTableView1VALOR_ACRESCIMO: TcxGridDBColumn;
    cxComprasDBTableView1VALOR_ICMS: TcxGridDBColumn;
    cxComprasDBTableView1DATAEMI_ENT: TcxGridDBColumn;
    cxComprasDBTableView1DATAENT_ENT: TcxGridDBColumn;
    cxComprasDBTableView1FRETE_ENT: TcxGridDBColumn;
    cxComprasDBTableView1NUMNF_ENT: TcxGridDBColumn;
    cxComprasDBTableView1VALOR_ICMS_SUB: TcxGridDBColumn;
    cxComprasDBTableView1VL_IPI: TcxGridDBColumn;
    cxComprasDBTableView1RAZAO_FOR: TcxGridDBColumn;
    cxComprasDBTableView1RAZAO_EMP: TcxGridDBColumn;
    QUltimaVenda: TFDQuery;
    QUltimaVendaQUANT: TBCDField;
    QUltimaVendaVALOR: TBCDField;
    QUltimaVendaDATA_VEN: TDateField;
    QUltimaVendaCUPOM_FISCAL_VEN: TIntegerField;
    QUltimaVendaNUMERO_NOTA_FISCAL: TIntegerField;
    QUltimaVendaNOME_CLI: TStringField;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxDBLabel14: TcxDBLabel;
    cxDBLabel15: TcxDBLabel;
    dsUltimaVenda: TDataSource;
    cxDBLabel16: TcxDBLabel;
    cxDBLabel17: TcxDBLabel;
    cxDBLabel18: TcxDBLabel;
    cxDBLabel19: TcxDBLabel;
    shp2: TShape;
    Shape1: TShape;
    cxLabel30: TcxLabel;
    BtnConsNcm: TsSpeedButton;
    QNcms: TFDQuery;
    dsNCMs: TDataSource;
    QNcmsCOD_PERFIL: TIntegerField;
    QNcmsCOD_EMP: TIntegerField;
    QNcmsNCM: TIntegerField;
    QNcmsDESCRICAO: TStringField;
    cxNCMs: TcxGridDBTableView;
    cxNCMsNCM: TcxGridDBColumn;
    cxNCMsDESCRICAO: TcxGridDBColumn;
    cxDBNCM: TcxDBExtLookupComboBox;
    QNcmsDESC_NCM: TStringField;
    cxNCMsDESC_NCM: TcxGridDBColumn;
    btnConsLab: TsSpeedButton;
    BtnAddLab: TsSpeedButton;
    btnConsSetorEstoque: TsSpeedButton;
    btnAddSetorEstoque: TsSpeedButton;
    btnConsSecao: TsSpeedButton;
    btnAddSecao: TsSpeedButton;
    tabFornecedores: TcxTabSheet;
    QFornecedoresPro: TFDQuery;
    dsFornecedoresPro: TDataSource;
    upFornecedoresPro: TFDUpdateSQL;
    QFornecedoresProCOD_PRO: TIntegerField;
    QFornecedoresProCOD_FOR: TIntegerField;
    QFornecedoresProREFERENCIA: TStringField;
    QFornecedoresProRAZAO_FOR: TStringField;
    cxFornecedoresDBTableView1: TcxGridDBTableView;
    cxFornecedoresLevel1: TcxGridLevel;
    cxFornecedores: TcxGrid;
    cxFornecedoresDBTableView1COD_FOR: TcxGridDBColumn;
    cxFornecedoresDBTableView1REFERENCIA: TcxGridDBColumn;
    cxFornecedoresDBTableView1RAZAO_FOR: TcxGridDBColumn;
    pnl3: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    tabComposicao: TcxTabSheet;
    QComposicao: TFDQuery;
    dsComposicao: TDataSource;
    upComposicao: TFDUpdateSQL;
    cxComposicao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    Panel19: TPanel;
    RzDBNavigator2: TRzDBNavigator;
    cxComposicaoLevel1: TcxGridLevel;
    cxComposicaoDBTableView1: TcxGridDBTableView;
    QComposicaoCOD_PRO: TIntegerField;
    QComposicaoCOD_PRO_COMPOSICAO: TIntegerField;
    QComposicaoQUANT: TBCDField;
    QComposicaoNOME_PRO: TStringField;
    cxComposicaoDBTableView1COD_PRO_COMPOSICAO: TcxGridDBColumn;
    cxComposicaoDBTableView1QUANT: TcxGridDBColumn;
    cxComposicaoDBTableView1NOME_PRO: TcxGridDBColumn;
    QComposicaoESTOQUE: TBCDField;
    cxComposicaoDBTableView1ESTOQUE: TcxGridDBColumn;
    cxVisualizaDBTableView1STATUS: TcxGridDBColumn;
    QPrincipalSTATUS: TStringField;
    Panel20: TPanel;
    cxLabel31: TcxLabel;
    dbedtPRECO_CUSTO: TDBEdit;
    cxGridImg: TcxImageList;
    QNcmsEX: TIntegerField;
    cxNCMsEX: TcxGridDBColumn;
    QPrincipalCEST: TStringField;
    QPrincipalNCM_EX: TIntegerField;
    cxLabel32: TcxLabel;
    dbtxtEX: TDBText;
    QCest: TFDQuery;
    QCestCEST: TStringField;
    QCestDESCRICAO: TStringField;
    cxCEST: TcxGridDBTableView;
    dsCEST: TDataSource;
    cxCESTCEST: TcxGridDBColumn;
    cxCESTDescricao: TcxGridDBColumn;
    cxLabel33: TcxLabel;
    cxDBExtCEST: TcxDBExtLookupComboBox;
    cxTabSheet1: TcxTabSheet;
    QGrupoICMS: TFDQuery;
    dsGrupoICMS: TDataSource;
    QGrupoICMSCOD_GRP: TIntegerField;
    QGrupoICMSNOME_GRP: TStringField;
    QGrupoICMSALIQUOTA_GRP: TBCDField;
    QGrupoICMSTIPO_GRP: TStringField;
    QGrupoICMSCST: TStringField;
    QGrupoICMSICMS_SERVICO_GRP: TStringField;
    QGrupoICMSECF: TStringField;
    pnl4: TPanel;
    cxLabel34: TcxLabel;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    Panel21: TPanel;
    cxLabel35: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxLabel36: TcxLabel;
    dbedtCST_CF_EST: TDBEdit;
    cxLabel37: TcxLabel;
    dbedtCST_CF_FORA: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    QPrincipalCODIGO_SERVICO: TIntegerField;
    QPrincipalSERVICO_CODIGO: TStringField;
    dbCodigo: TDBEdit;
    lbCodigo: TcxLabel;
    dbServico: TDBEdit;
    lbServico: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    QPrincipalCLASSE_TERAPEUTICA: TStringField;
    QPrincipalREGISTRO_MEDICAMENTO: TStringField;
    QPrincipalNUMERO_LOTE: TStringField;
    QPrincipalUNIDADE_MEDICAMENTO: TStringField;
    Label8: TLabel;
    Label9: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label11: TLabel;
    JvDBComboBox2: TJvDBComboBox;
    JvDBComboBox1: TJvDBComboBox;
    JvDBComboBox3: TJvDBComboBox;
    Label12: TLabel;
    QPrincipalUSO_PROLONGADO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure PageEditShow(Sender: TObject);
    procedure PageConsultaShow(Sender: TObject);
    procedure cxDBLookupComboBox2PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox3PropertiesPopup(Sender: TObject);
    procedure KeyDownLookCombo(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtCODIGO_BARRA_PROExit(Sender: TObject);
    procedure cxFotoShow(Sender: TObject);
    procedure btnLimparFotoClick(Sender: TObject);
    procedure btnNovaFotoClick(Sender: TObject);
    procedure cxCompraShow(Sender: TObject);
    procedure cxPaginas2Change(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsNcmClick(Sender: TObject);
    procedure dbedtCOD_NCMEnter(Sender: TObject);
    procedure dbedtCOD_NCMExit(Sender: TObject);
    procedure dbedtCOD_NCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtVALOR_PROExit(Sender: TObject);
    procedure dbedtNOME_PROExit(Sender: TObject);
    procedure cxDBCOD_LABPropertiesPopup(Sender: TObject);
    procedure cxDBCODIGO_SETOR_ESTOQUEPropertiesPopup(Sender: TObject);
    procedure BtnAddLabClick(Sender: TObject);
    procedure btnConsLabClick(Sender: TObject);
    procedure cxDBCOD_LABEnter(Sender: TObject);
    procedure cxDBCOD_LABExit(Sender: TObject);
    procedure cxDBCOD_LABKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsSetorEstoqueClick(Sender: TObject);
    procedure btnAddSetorEstoqueClick(Sender: TObject);
    procedure btnConsSecaoClick(Sender: TObject);
    procedure btnAddSecaoClick(Sender: TObject);
    procedure cxDBCODIGO_SETOR_ESTOQUEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QFornecedoresAfterPost(DataSet: TDataSet);
    procedure QFornecedoresProAfterInsert(DataSet: TDataSet);
    procedure RzDBNavigator1BeforeAction(Sender: TObject;
      Button: TRzNavigatorButton);
    procedure tabFornecedoresShow(Sender: TObject);
    procedure QComposicaoAfterInsert(DataSet: TDataSet);
    procedure tabComposicaoShow(Sender: TObject);
    procedure cxVisualizaDBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxVisualizaDBTableView1STATUSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QPrincipalCOD_SECChange(Sender: TField);
    procedure QPrincipalCOD_GRUPOChange(Sender: TField);
    procedure QPrincipalAfterScroll(DataSet: TDataSet);
    procedure cxDBNCMPropertiesChange(Sender: TObject);
    procedure cxDBNCMPropertiesPopup(Sender: TObject);
    procedure QPrincipalCOD_NCMChange(Sender: TField);
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure PreencheDadosProdutoEAN;
    procedure dbedtCODIGO_BARRA_PROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBLTipoPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PermiteSemNcm: Boolean;
    procedure MostraProdutos;
    procedure AbreAuxliares( const Abrir: Boolean = True );
    procedure CarregaImagemProduto;
    function VerificaCodigoDeBarras: Boolean;
    function VerificaNCM: Boolean;
    procedure CarregaPadroes;
    procedure AbreTabelaCest;
  end;

  function FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UDicLib, UConsNCM, Ubibli1, UCadLab, UConsLab,
  UConsSetorEstoque, UCadSetorEstoque, UConsSecao, UCadSecao, UConsFor, UDialog,
  UConsProd, ws_trib, UWebServiceTributacoes;

function FrmCadProduto: TFrmCadProduto;
begin
   Result := TFrmCadProduto( BuscaFormulario( TFrmCadProduto, False ) );
end;

procedure TFrmCadProduto.AbreAuxliares(  const Abrir: Boolean = True );
begin
   QTipos.Close;
   QUnidades.Close;
   QLaboratorios.Close;
   QSetorEstoque.Close;
   QSecao.Close;
   QGrupo.Close;
   QSubGrupo.Close;
   QSetorBal.Close;
   QReceita.Close;
   QNcms.Close;
   QGrupoICMS.Close;
   if not Abrir then
      Exit;
   QTipos.Open;
   QUnidades.Open;
   QLaboratorios.Open;
   QSetorEstoque.Open;
   QSecao.Open;
   QGrupo.Open;
   QSubGrupo.Open;
   QSetorBal.Open;
   QReceita.Open;
   QNcms.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QNcms.Open;
   QGrupoICMS.Open;
end;

procedure TFrmCadProduto.AbreTabelaCest;
var
  NCM: String;
begin
   NCM := PadLeft( QPrincipalCOD_NCM.AsString, 8, '0' );
   QCest.Close;
   QCest.ParamByName( 'NCM' ).AsString := NCM;
   QCest.ParamByName( 'NCM1' ).AsString := Copy( NCM, 1, 7 );
   QCest.ParamByName( 'NCM2' ).AsString := Copy( NCM, 1, 6 );
   QCest.ParamByName( 'NCM3' ).AsString := Copy( NCM, 1, 5 );
   QCest.ParamByName( 'NCM4' ).AsString := Copy( NCM, 1, 4 );
   QCest.ParamByName( 'NCM5' ).AsString := Copy( NCM, 1, 3 );
   QCest.ParamByName( 'NCM6' ).AsString := Copy( NCM, 1, 2 );
   QCest.Open;
end;

procedure TFrmCadProduto.BtnAddLabClick(Sender: TObject);
begin
  inherited;
   BuscaFormulario( TFrmCadLab, True );
end;

procedure TFrmCadProduto.btnAddSecaoClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadSecao, True );
end;

procedure TFrmCadProduto.btnAddSetorEstoqueClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadSetorEstoque, True );
end;

procedure TFrmCadProduto.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  if cxPaginas2.ActivePageIndex = 4 then
     CarregaImagemProduto;
end;

procedure TFrmCadProduto.btnConsLabClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsLab, FrmConsLab);
  FrmConsLab.Tag:= 12;
  FrmConsLab.ShowModal;
end;

procedure TFrmCadProduto.BtnConsNcmClick(Sender: TObject);
var
   FormCons: TfrmConsNCM;
   Result: TModalResult;
begin
  inherited;
  if not ( QPrincipal.State in [ dsInsert, dsEdit ] ) then
     Exit;
   Application.CreateForm( TfrmConsNCM, FormCons );
   try
      Result := FormCons.ShowModal;
      Result := FormCons.ModalResult;
      if Result <> mrOk then
         begin
            Exit;
         end;
      QPrincipalCOD_NCM.AsInteger := FormCons.QNCMNCM.AsInteger;
   finally
      FormCons.Free;
   end;
end;

procedure TFrmCadProduto.btnConsSecaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsSecao, FrmConsSecao);
  FrmConsSecao.Tag:= 22;
  FrmConsSecao.ShowModal;
end;

procedure TFrmCadProduto.btnConsSetorEstoqueClick(Sender: TObject);
begin
  inherited;
  application.CreateForm(TFrmConsSetorEstoque, FrmConsSetorEstoque);
  FrmConsSetorEstoque.tag:= 5;
  FrmConsSetorEstoque.showmodal;
end;

procedure TFrmCadProduto.BtnGravarClick(Sender: TObject);
begin
  if not VerificaNCM then
     begin
        AlertaCad( 'NCM não consta Associado a nenhum perfil!' );
        Exit;
     end;
  if QPrincipal.State = dsInsert then
     begin
         QPrincipalCOD_PRO.AsInteger :=  prxcod('produto', 'cod_pro', dm.IBTransaction, dm.ibsqlcod);
         if QPrincipalCODIGO_BARRA_PRO.AsString = '' then
            QPrincipalCODIGO_BARRA_PRO.AsString := QPrincipalCOD_PRO.AsString;
         if QPrincipalCOD_PRODUTO_ESTOQUE.AsString = '' then
            QPrincipalCOD_PRODUTO_ESTOQUE.AsString := QPrincipalCOD_PRO.AsString;
     end;
  if not VerificaCodigoDeBarras then
     Exit;
  inherited;
end;

procedure TFrmCadProduto.btnLimparFotoClick(Sender: TObject);
begin
  inherited;
  if QPrincipal.State in [ dsEdit, dsInsert ] then
    begin
       QPrincipalCAMINHO_FOTO_PRO.AsString := '';
       CarregaImagemProduto;
    end;
end;

procedure TFrmCadProduto.btnNovaFotoClick(Sender: TObject);
begin
  inherited;
  if not ( QPrincipal.State in [ dsEdit, dsInsert ] ) then
     Exit;
  if not dlgOpenPic.Execute then
     Exit;
  QPrincipalCAMINHO_FOTO_PRO.AsString := dlgOpenPic.FileName;
  CarregaImagemProduto;
end;

procedure TFrmCadProduto.btnPesquisarClick(Sender: TObject);
begin
  inherited;
   MostraProdutos;
end;

procedure TFrmCadProduto.CarregaImagemProduto;
begin
  Image.Visible :=  not QPrincipalCAMINHO_FOTO_PRO.IsNull and FileExists( QPrincipalCAMINHO_FOTO_PRO.AsString );
  if QPrincipalCAMINHO_FOTO_PRO.IsNull then
      Exit;
  if QPrincipalCAMINHO_FOTO_PRO.AsString = '' then
      Exit;
  if not FileExists( QPrincipalCAMINHO_FOTO_PRO.AsString ) then
     Exit;
  Image.Picture.LoadFromFile( QPrincipalCAMINHO_FOTO_PRO.AsString );
end;

procedure TFrmCadProduto.CarregaPadroes;
begin
   PermiteSemNcm := TDicLib.GetParam( iEmp, 'CADASTRO PRODUTO', 'CADPRO_NCM', DM.IBDatabase,
                    'NAO', 'SIM;NAO', 'CADASTRO DE PRODUTOS', 'CHECK', 'PERMITIR GRAVAR PRODUTO SEM NCM' ).Valor = 'SIM';
end;

procedure TFrmCadProduto.KeyDownLookCombo(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
     VK_DELETE: QPrincipal.FieldByName( TcxDBLookupComboBox( Sender ).DataBinding.Field.FieldName ).AsInteger := null;
     VK_F3: btnConsSecao.Click;
     VK_F2: btnAddSecao.Click;
  end;
end;

procedure TFrmCadProduto.cxCompraShow(Sender: TObject);
begin
  inherited;
  QCompras.Close;
  QUltimaVenda.Close;
  if  QCompras.ParamByName( 'CODPRO' ).AsString = '' then
     Exit;
  QCompras.ParamByName( 'CODPRO' ).AsInteger := QPrincipalCOD_PRO.AsInteger;
  QCompras.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QUltimaVenda.ParamByName( 'CODPRO' ).AsInteger := QPrincipalCOD_PRO.AsInteger;
  QUltimaVenda.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QCompras.Open;
  QUltimaVenda.Open;
end;

procedure TFrmCadProduto.cxDBCODIGO_SETOR_ESTOQUEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
     VK_F3: btnConsSetorEstoque.Click;
     VK_F2: btnAddSetorEstoque.Click;
  end;
end;

procedure TFrmCadProduto.cxDBCODIGO_SETOR_ESTOQUEPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  TRPrincipal.CommitRetaining;
  QSetorEstoque.Refresh;
end;

procedure TFrmCadProduto.cxDBCOD_LABEnter(Sender: TObject);
begin
  inherited;
   ControleComKeyDow := True;
end;

procedure TFrmCadProduto.cxDBCOD_LABExit(Sender: TObject);
begin
  inherited;
   ControleComKeyDow := False;
end;

procedure TFrmCadProduto.cxDBCOD_LABKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
     VK_F3: btnConsLab.Click;
     VK_F2: BtnAddLab.Click;
  end;
end;

procedure TFrmCadProduto.cxDBCOD_LABPropertiesPopup(Sender: TObject);
begin
  inherited;
  TRPrincipal.CommitRetaining;
  QLaboratorios.Refresh;
end;

procedure TFrmCadProduto.cxDBLookupComboBox2PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  QGrupo.Filtered := False;
  QGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString ) );
  QGrupo.Filtered := True;
end;

procedure TFrmCadProduto.cxDBLookupComboBox3PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  QSubGrupo.Filtered := False;
  QSubGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString  ) )  +
    ' AND COD_GRUPO LIKE ' +
    IfThen(  QPrincipalCOD_GRUPO.AsString = '' , QuotedStr( '0' ), QuotedStr( QPrincipalCOD_GRUPO.AsString ) ) ;
  QSubGrupo.Filtered := True;
end;

procedure TFrmCadProduto.cxDBLTipoPropertiesChange(Sender: TObject);
begin
  inherited;
  lbServico.Visible := QTiposSERVICO.AsString = 'S';
  dbServico.Visible := QTiposSERVICO.AsString = 'S';
  lbCodigo.Visible := QTiposSERVICO.AsString = 'S';
  dbCodigo.Visible := QTiposSERVICO.AsString = 'S';
end;

procedure TFrmCadProduto.cxDBNCMPropertiesChange(Sender: TObject);
begin
  inherited;
  if not ( QPrincipal.State in [ dsInsert, dsEdit ] ) then
     Exit;
  QPrincipalNCM_EX.AsInteger := QNcmsEX.AsInteger;
end;

procedure TFrmCadProduto.cxDBNCMPropertiesPopup(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadProduto.cxFotoShow(Sender: TObject);
begin
  inherited;
  CarregaImagemProduto;
end;

procedure TFrmCadProduto.cxPaginas2Change(Sender: TObject);
begin
  inherited;
  if cxPaginas2.ActivePageIndex <> 4 then
     begin
        QCompras.Close;
        QUltimaVenda.Close;
     end;
  if cxPaginas2.ActivePageIndex <> 5 then
     QFornecedoresPro.Close;
  if cxPaginas2.ActivePageIndex <> 6 then
     QComposicao.Close;
end;

procedure TFrmCadProduto.cxVisualizaDBTableView1STATUSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
      Exit;
  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImgsGrid.Width + 1;

      DrawContent;
      DrawBorders;

      if AViewInfo.GridRecord.Values[cxVisualizaDBTableView1ATIVO_PRO.Index] = 'N' then
        begin
          with AViewInfo.ClientBounds do
            cxGridImg.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
        end
      else
      if AViewInfo.GridRecord.Values[cxVisualizaDBTableView1ESTOQUE.Index] <= 0 then
        begin
          with AViewInfo.ClientBounds do
            cxGridImg.Draw(ACanvas.Canvas, Left + 1, Top + 1, 2);
        end
      else
      if AViewInfo.GridRecord.Values[cxVisualizaDBTableView1ESTOQUE.Index] > 0 then
        begin
          with AViewInfo.ClientBounds do
            cxGridImg.Draw(ACanvas.Canvas, Left + 1, Top + 1, 1);
        end;
    finally
      Free;
    end;
  end;
  ADone := True;

end;


procedure TFrmCadProduto.cxVisualizaDBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
//  if ARecord.Values[ cxVisualizaDBTableView1.GetColumnByFieldName( 'ATIVO_PRO' ).Index ] = 'N' then
  //   AStyle := cxstylVermelho;
end;

procedure TFrmCadProduto.dbedtCODIGO_BARRA_PROExit(Sender: TObject);
begin
  inherited;
  if VerificaCodigoDeBarras then
     if QPrincipalNOME_PRO.AsString = '' then
         PreencheDadosProdutoEAN;
end;

procedure TFrmCadProduto.dbedtCODIGO_BARRA_PROKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
      VK_F2: PreencheDadosProdutoEAN;
  end;
end;

procedure TFrmCadProduto.dbedtCOD_NCMEnter(Sender: TObject);
begin
  inherited;
  ControleComKeyDow := True;
end;

procedure TFrmCadProduto.dbedtCOD_NCMExit(Sender: TObject);
begin
  inherited;
  ControleComKeyDow := False;
  if not VerificaNCM then
    begin
       AlertaCad( 'NCM não consta Associado a nenhum perfil!' );
       Exit;
    end;

end;

procedure TFrmCadProduto.dbedtCOD_NCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
     begin
        BtnConsNcm.Click;
     end;
end;

procedure TFrmCadProduto.dbedtNOME_PROExit(Sender: TObject);
begin
  inherited;
  if QPrincipalDESC_CUPOM.AsString = '' then
     QPrincipalDESC_CUPOM.AsString := QPrincipalNOME_PRO.AsString;
end;

procedure TFrmCadProduto.dbedtVALOR_PROExit(Sender: TObject);
begin
  inherited;
   if QPrincipalPRECO_PRAZO_PRO.AsCurrency = 0 then
      QPrincipalPRECO_PRAZO_PRO.AsCurrency := QPrincipalVALOR_PRO.AsCurrency;
end;

procedure TFrmCadProduto.dsPrincipalStateChange(Sender: TObject);
begin
  inherited;
  if qprincipal.state in [ dsInsert, dsEdit ] then
      AbreTabelaCest;
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  CodigoTela := 'C007';
end;

procedure TFrmCadProduto.FormShow(Sender: TObject);
var
  Col: TcxGridDBColumn;
begin
  inherited;
   CarregaPadroes;
   MostraProdutos;
   cxVisualizaDBTableView1STATUS.Index := 0;
   Col := TcxGridDBColumn( cxVisualizaDBTableView1.GetColumnByFieldName( 'COD_PRO' ) );
    Filtro.TipoFiltro(
    QPrincipal.FieldByName( Col.DataBinding.FieldName ).DataType,
    QPrincipal.FieldByName( Col.DataBinding.FieldName ).EditMask,
    QPrincipal.FieldByName( Col.DataBinding.FieldName ), Col );
end;

procedure TFrmCadProduto.MostraProdutos;
var
  Str: String;
  Liga: String;
const
  AtivosStr: array[0..2] of string = ( '%', 'S', 'N' );
begin
   Liga := 'WHERE';
   QPrincipal.Close;
   if TRPrincipal.Active then
     TRPrincipal.Commit;
   TRPrincipal.StartTransaction;
   QPrincipal.SQL.Clear;
   QPrincipal.SQL.Text := Sql;
   case IndexStr( UpperCase( Filtro.FieldName ),
     ['NOME_LAB',
     'NOME_SEC',
     'NOME_GRUPO',
     'NOME_SUBGRUPO',
     'UNID_ENT',
     'UNID_SAI',
     'NOME_SETOR_ESTOQUE',
     'NOME_PRO_ESTOQUE',
     'NOME_SETOR_BAL',
     'ESTOQUE',
     'NOME_TIPO'] ) of
     0: Str := 'LA.NOME_LAB';
     1: Str := 'SEC.NOME_SEC';
     2: Str := 'SEC_G.DESCRICAO';
     3: Str := 'SEC_S.DESCRICAO';
     4: Str := 'UNENT.DESCRICAO';
     5: Str := 'UNSAI.DESCRICAO';
     6: Str := 'SE.DESCRICAO';
     7: Str := 'PE.NOME_PRO';
     8: Str := 'SB.NOME_SET';
     9: Str := 'EST.ESTOQUE';
     10: Str := 'TP.DESCRICAO';
     else
        Str := 'P.' + Filtro.FieldName;
   end;
   if ( VarToStr( Filtro.ValorFiltro ) <> '' ) and
     ( VarToStr( Filtro.ValorFiltro ) <> '0' ) then
     begin
        QPrincipal.SQL.Add( Liga);
        Liga := 'AND';
        QPrincipal.SQL.Add( Str + ' LIKE :FILTRO'  );
        QPrincipal.ParamByName( 'FILTRO' ).AsString := VarToStr( Filtro.ValorFiltro ) + '%';
     end;
   if rgOptionGrid.ItemIndex >  0 then
      begin
         QPrincipal.SQL.Add( Liga );
         QPrincipal.SQL.Add( 'P.ATIVO_PRO LIKE :VATIVO' );
         QPrincipal.ParamByName( 'VATIVO' ).AsString := AtivosStr[ rgOptionGrid.ItemIndex ];
      end;
   QPrincipal.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QPrincipal.Open;
end;

procedure TFrmCadProduto.PageConsultaShow(Sender: TObject);
begin
  inherited;
  AbreAuxliares( False );
end;

procedure TFrmCadProduto.PageEditShow(Sender: TObject);
begin
  inherited;
  cxPaginas2.ActivePageIndex := 0;
  AbreAuxliares;
end;

procedure TFrmCadProduto.PreencheDadosProdutoEAN;
var
   Str: string;
   UF: String;
   Token: String;
   Prod: TWebserviceTributacaoProd;
begin
   Token := TDicLib.GetParam( iEmp, 'WEBSERVICES', 'WEBSERVICES_TRIBUTACAO_TOKEN',
                      DM.IBDatabase, '0', '',
                       'CONFIGURACOES DE WEBSERVICES DIVERSOS',
                       '',
                       'TOKEN DE ACESSO AO WEBSERVICE TRIBUTACAO' ).Valor;
   UF := dm.RetornaStringTabela( 'EST_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   Str := '';
   try
       Prod := WebserviceTributacao.Produto( dbedtCODIGO_BARRA_PRO.Text,
          'S', UF, Token );
       try
          if Prod.Status <> 'OK' then
             Exit;
          QPrincipalNOME_PRO.AsString := Prod.Descricao;
          QPrincipalDESC_CUPOM.AsString := Prod.Descricao;
          QPrincipalCOD_NCM.AsString := Prod.ncm;
          QPrincipalNCM_EX.AsString := Prod.ex;
          QPrincipalVALOR_PRO.AsString := Prod.valor_medio;
          QPrincipalPROMOCAO_PRO.AsString := Prod.valor_medio;
       finally
          FreeAndNil( Prod );
       end;

   except
      Exit;
   end;
end;

procedure TFrmCadProduto.QComposicaoAfterInsert(DataSet: TDataSet);
var
  FormCons: TFrmConsProd;
begin
  inherited;
  QComposicaoCOD_PRO.AsInteger := QPrincipalCOD_PRO.AsInteger;
  FormCons := TFrmConsProd.Create( nil );
  try
     FormCons.Tag := 201;
     FormCons.ShowModal;
     if FormCons.ModalResult <> mrOk then
        begin
           QComposicao.Cancel;
           Exit;
        end;
     QComposicaoCOD_PRO_COMPOSICAO.AsInteger := DM.QProdCOD_PRO.AsInteger;
     QComposicaoQUANT.AsCurrency := 1;
     QComposicao.Post;
     QComposicao.RefreshRecord();
  finally
     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.QProd.Close;
     DM.QProd.SQL.Text := FormCons.sSql;
     FormCons.Free;
  end;
end;

procedure TFrmCadProduto.QFornecedoresAfterPost(DataSet: TDataSet);
begin
  inherited;
  TRPrincipal.CommitRetaining;
end;

procedure TFrmCadProduto.QFornecedoresProAfterInsert(DataSet: TDataSet);
var
  FormCons: TFrmConsFor;
begin
  inherited;
  QFornecedoresProCOD_PRO.AsInteger := QPrincipalCOD_PRO.AsInteger;
  FormCons := TFrmConsFor.Create( nil );
  try
     FormCons.Tag := 41;
     FormCons.ShowModal;
     if FormCons.ModalResult <> mrOk then
        begin
           QFornecedoresPro.Cancel;
           Exit;
        end;
     QFornecedoresProCOD_FOR.AsInteger := DM.QForCOD_FOR.AsInteger;
     QFornecedoresPro.Post;
     QFornecedoresPro.RefreshRecord();
     QFornecedoresPro.Edit;
  finally
     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.QFor.Close;
     FormCons.Free;
  end;
end;

procedure TFrmCadProduto.QPrincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  QGrupo.Filtered := False;
  QGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString ) );
  QGrupo.Filtered := True;
  QSubGrupo.Filtered := False;
  QSubGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString  ) )  +
    ' AND COD_GRUPO LIKE ' +
    IfThen(  QPrincipalCOD_GRUPO.AsString = '' , QuotedStr( '0' ), QuotedStr( QPrincipalCOD_GRUPO.AsString ) ) ;
  QSubGrupo.Filtered := True;
end;

procedure TFrmCadProduto.QPrincipalCOD_GRUPOChange(Sender: TField);
begin
  inherited;
  QPrincipalSUB_GRUPO.AsVariant := NUll;
  QSubGrupo.Filtered := False;
  QSubGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString  ) )  +
    ' AND COD_GRUPO LIKE ' +
    IfThen(  QPrincipalCOD_GRUPO.AsString = '' , QuotedStr( '0' ), QuotedStr( QPrincipalCOD_GRUPO.AsString ) ) ;
  QSubGrupo.Filtered := True;
end;

procedure TFrmCadProduto.QPrincipalCOD_NCMChange(Sender: TField);
begin
  inherited;
  AbreTabelaCest;
end;

procedure TFrmCadProduto.QPrincipalCOD_SECChange(Sender: TField);
begin
  inherited;
  QPrincipalCOD_GRUPO.AsVariant := Null;
  QGrupo.Filtered := False;
  QGrupo.Filter := 'COD_SEC LIKE ' +
    IfThen(  QPrincipalCOD_SEC.AsString = '', QuotedStr( '0' ), QuotedStr( QPrincipalCOD_SEC.AsString ) );
  QGrupo.Filtered := True;
end;

procedure TFrmCadProduto.RzDBNavigator1BeforeAction(Sender: TObject;
  Button: TRzNavigatorButton);
begin
  inherited;
  if Button = nbDelete then
     begin
        if not KDialog( 'Tem certeza que deseja excluir este Registro?', 'Exclusão', tdtPergunta )  then
           begin
              Abort;
              Exit;
           end;
     end;
end;

procedure TFrmCadProduto.tabComposicaoShow(Sender: TObject);
begin
  inherited;
  QComposicao.Close;
  if QPrincipalCOD_PRO.AsString = '' then
     begin
        AlertaCad( 'Precisa salvar o produto antes de visualizar composição!',alertErro, 'Informação' );
        Exit;
     end;
  QComposicao.ParamByName( 'COD_PRO' ).AsInteger := QPrincipalCOD_PRO.AsInteger;
  QComposicao.ParamByName( 'COD_EMP' ).AsInteger :=  iEmp;
  QComposicao.Open;
end;

procedure TFrmCadProduto.tabFornecedoresShow(Sender: TObject);
begin
  inherited;
  QFornecedoresPro.Close;
  if QPrincipalCOD_PRO.AsString = '' then
     begin
        AlertaCad( 'Precisa salvar o produto antes de visualizar fornecedores!',alertErro, 'Informação' );
        Exit;
     end;

  QFornecedoresPro.ParamByName( 'COD_PRO' ).AsInteger := QPrincipalCOD_PRO.AsInteger;
  QFornecedoresPro.Open;
end;

function TFrmCadProduto.VerificaCodigoDeBarras: Boolean;
var
  Str: string;
begin
  Result := True;
  Str := DM.RetornaStringTabela( 'COD_PRO',
     'PRODUTO', 'CODIGO_BARRA_PRO', dbedtCODIGO_BARRA_PRO.Text );
  if ( Str <> QPrincipalCOD_PRO.AsString ) and ( Str <> '' ) then
     begin
        AlertaCad( 'Código de Barras já existe Cadastrado!' );
//        dbedtCODIGO_BARRA_PRO.SetFocus;
        Result := False;
     end;
end;

function TFrmCadProduto.VerificaNCM: Boolean;
var
  Str: STring;
begin
  Result := True;
  try
      Str := DM.RetornaStringTabelaPlus( 'COD_EMP', 'TRIBUTACAO_PERFIL_NCM',
         'NCM=' + QPrincipalCOD_NCM.AsString +
         ' AND COD_EMP=' + IntToStr( iEmp ) + ' AND EX=' +  QPrincipalNCM_EX.AsString );
      if IntToStr( iEmp ) <> Str then
         begin
            if PermiteSemNcm then
               begin
                  QPrincipalCOD_NCM.AsString := '99999999';
                  Exit;
               end;
            Result := False;
         end;
  except
      Result := False;
  end;
end;

end.

