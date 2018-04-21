unit UDMI;

interface

uses
  SysUtils, Classes, DB, IBTable, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TDMI = class(TDataModule)
    IBTRImport: TFDTransaction;
    Nota: TFDTable;
    ItensNota: TFDTable;
    Contas: TFDTable;
    ContasCOD_EMP: TIntegerField;
    ContasDATA_CTP: TDateField;
    ContasCOD_FOR: TIntegerField;
    ContasTIPO_DOC_CTP: TStringField;
    ContasNUM_DOC_CTP: TStringField;
    ContasVALOR_CTP: TBCDField;
    ContasDTVENCTO_CTP: TDateField;
    ContasCOD_ENTRADA: TIntegerField;
    ContasCOD_CPT: TIntegerField;
    ContasSEQUENCIA_CTP: TIntegerField;
    ContasCOD_CLASSIFICACAO: TIntegerField;
    ContasDUPLICATA_PENDENTE: TStringField;
    NotaCOD_ENT: TIntegerField;
    NotaCOD_EMP: TIntegerField;
    NotaDATAEMI_ENT: TDateField;
    NotaDATAENT_ENT: TDateField;
    NotaCOD_FOR: TIntegerField;
    NotaTOTAL_ENT: TBCDField;
    NotaACRES_ENT: TBCDField;
    NotaDESC_ENT: TBCDField;
    NotaFRETE_ENT: TBCDField;
    NotaICMSFRETE_ENT: TBCDField;
    NotaTIPO_ENT: TStringField;
    NotaNUMNF_ENT: TStringField;
    NotaSERIE_ENT: TStringField;
    NotaBASE_SUB_TRIB: TBCDField;
    NotaVALOR_ICMS_SUB: TBCDField;
    NotaFRETE_INCLUSO: TStringField;
    NotaICMS_SUB_INCLUSO: TStringField;
    NotaTOTAL_PRODUTOS: TBCDField;
    NotaCUSTO_SEM_DESCONTO: TStringField;
    NotaCODIFICACAO_FISCAL: TStringField;
    NotaCODIGO_ES: TIntegerField;
    NotaCHAVE_NFE: TStringField;
    NotaVALOR_PIS: TBCDField;
    NotaVALOR_COFINS: TBCDField;
    NotaCODIGO_ESTADO: TStringField;
    NotaBC_ICMS: TBCDField;
    NotaVL_ICMS: TBCDField;
    NotaVL_IPI: TBCDField;
    NotaVL_SEG: TBCDField;
    ItensNotaCOD_ENT: TIntegerField;
    ItensNotaCOD_PRO: TIntegerField;
    ItensNotaPERC_ICMS: TBCDField;
    ItensNotaPERC_IPI: TBCDField;
    ItensNotaQTDUND_ENT: TBCDField;
    ItensNotaPERC_DESC: TBCDField;
    ItensNotaPERC_ACRES: TBCDField;
    ItensNotaCOD_EMP: TIntegerField;
    ItensNotaVALOR_UNIT_PRO: TBCDField;
    ItensNotaCUSTO: TBCDField;
    ItensNotaQTD_PRO: TBCDField;
    ItensNotaCOD_GRP: TIntegerField;
    ItensNotaCOD_CFOP: TIntegerField;
    ItensNotaVALOR_DESCONTO: TBCDField;
    ItensNotaVALOR_ACRESCIMO: TBCDField;
    ItensNotaPERC_BCR: TBCDField;
    ItensNotaCST: TStringField;
    ItensNotaVALOR_TOTAL: TBCDField;
    ItensNotaBASE_CALCULO: TBCDField;
    ItensNotaVALOR_ICMS: TBCDField;
    ItensNotaORDEM: TIntegerField;
    ItensNotaPERC_ST: TBCDField;
    ItensNotaVALOR_SUB_TRIBUTARIA: TBCDField;
    ItensNotaVALOR_IPI: TBCDField;
    ItensNotaCODIGO_LOCAL_ESTOQUE: TIntegerField;
    ItensNotaBC_ST: TBCDField;
    ItensNotaCST_IPI: TStringField;
    ItensNotaALIQ_PIS: TBCDField;
    ItensNotaVALOR_PIS: TBCDField;
    ItensNotaCST_COFINS: TStringField;
    ItensNotaALIQ_COFINS: TBCDField;
    ItensNotaVALOR_COFINS: TBCDField;
    ItensNotaCST_PIS: TStringField;
    PRODUTO_T_E: TFDQuery;
    PRODUTO_T_ECOD: TIntegerField;
    PRODUTO_T_ECOD_PROD: TIntegerField;
    PRODUTO_T_EORIGEM: TStringField;
    PRODUTO_T_EICMS_DENTRO: TIntegerField;
    PRODUTO_T_ECST_DENTRO: TStringField;
    PRODUTO_T_EIPI_DENTRO: TFloatField;
    PRODUTO_T_EREDU_ICMS_DENTRO: TFloatField;
    PRODUTO_T_ETEM_SUBSTITUICAO: TStringField;
    PRODUTO_T_EAGREG_DENTRO: TFloatField;
    PRODUTO_T_EICMS_FORA: TIntegerField;
    PRODUTO_T_ECST_FORA: TStringField;
    PRODUTO_T_EIPI_FORA: TFloatField;
    PRODUTO_T_EREDU_ICMS_FORA: TFloatField;
    PRODUTO_T_ECST_IPI: TStringField;
    PRODUTO_T_ECSOSN: TStringField;
    PRODUTO_T_ECST_PIS: TStringField;
    PRODUTO_T_ECST_COFINS: TStringField;
    PRODUTO_T_EISENTO_PIS_COFINS: TStringField;
    PRODUTO_T_EPIS: TFloatField;
    PRODUTO_T_ECOFINS: TFloatField;
    PRODUTO_T_EIR: TFloatField;
    PRODUTO_T_ECONT_SOCIAL: TFloatField;
    PRODUTO_T_EOUTRAS: TFloatField;
    PRODUTO_T_ECOD_EMP: TIntegerField;
    PRODUTO_T_ECOD_CFOP_DENTRO: TIntegerField;
    PRODUTO_T_ECOD_CFOP_FORA: TIntegerField;
    PRODUTO_T_EALIQ_ICMS_DENTRO: TBCDField;
    PRODUTO_T_EALIQ_ICMS_FORA: TBCDField;
    PRODUTO_T_ED_ICMS_DENTRO: TStringField;
    PRODUTO_T_ED_PIS_DENTRO: TStringField;
    PRODUTO_T_ED_ICMS_FORA: TStringField;
    PRODUTO_T_ED_PIS_FORA: TStringField;
    ITENS_NOTA: TFDQuery;
    SQL_ITENS_NOTA: TFDUpdateSQL;
    ITENS_NOTACOD_ENT: TIntegerField;
    ITENS_NOTACOD_PRO: TIntegerField;
    ITENS_NOTAPERC_ICMS: TBCDField;
    ITENS_NOTAPERC_IPI: TBCDField;
    ITENS_NOTAQTDUND_ENT: TBCDField;
    ITENS_NOTAPERC_DESC: TBCDField;
    ITENS_NOTAPERC_ACRES: TBCDField;
    ITENS_NOTACOD_EMP: TIntegerField;
    ITENS_NOTAVALOR_UNIT_PRO: TBCDField;
    ITENS_NOTACUSTO: TBCDField;
    ITENS_NOTAQTD_PRO: TBCDField;
    ITENS_NOTACOD_GRP: TIntegerField;
    ITENS_NOTACOD_CFOP: TIntegerField;
    ITENS_NOTAVALOR_DESCONTO: TBCDField;
    ITENS_NOTAVALOR_ACRESCIMO: TBCDField;
    ITENS_NOTAPERC_BCR: TBCDField;
    ITENS_NOTACST: TStringField;
    ITENS_NOTAVALOR_TOTAL: TBCDField;
    ITENS_NOTABASE_CALCULO: TBCDField;
    ITENS_NOTAVALOR_ICMS: TBCDField;
    ITENS_NOTAORDEM: TIntegerField;
    ITENS_NOTAPERC_ST: TBCDField;
    ITENS_NOTAVALOR_SUB_TRIBUTARIA: TBCDField;
    ITENS_NOTAVALOR_IPI: TBCDField;
    ITENS_NOTACODIGO_LOCAL_ESTOQUE: TIntegerField;
    ITENS_NOTABC_ST: TBCDField;
    ITENS_NOTACST_IPI: TStringField;
    ITENS_NOTACST_PIS: TStringField;
    ITENS_NOTAALIQ_PIS: TBCDField;
    ITENS_NOTAVALOR_PIS: TBCDField;
    ITENS_NOTACST_COFINS: TStringField;
    ITENS_NOTAALIQ_COFINS: TBCDField;
    ITENS_NOTAVALOR_COFINS: TBCDField;
    QNota: TFDQuery;
    QNotaTOTAL_ENT: TBCDField;
    QNotaACRES_ENT: TBCDField;
    QNotaDESC_ENT: TBCDField;
    QNotaFRETE_ENT: TBCDField;
    QNotaBASE_SUB_TRIB: TBCDField;
    QNotaVALOR_ICMS_SUB: TBCDField;
    QNotaTOTAL_PRODUTOS: TBCDField;
    QNotaVALOR_PIS: TBCDField;
    QNotaVALOR_COFINS: TBCDField;
    QNotaBC_ICMS: TBCDField;
    QNotaVL_ICMS: TBCDField;
    QNotaVL_IPI: TBCDField;
    QNotaVL_SEG: TBCDField;
    SQL_NOTA: TFDUpdateSQL;
    QNotaCOD_ENT: TIntegerField;
    QNotaCOD_EMP: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMI: TDMI;

implementation

uses
  UDM;

{$R *.dfm}

end.
