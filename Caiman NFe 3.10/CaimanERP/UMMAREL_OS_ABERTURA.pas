unit UMMAREL_OS_ABERTURA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, jpeg, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TfrmMMAREL_OS_ABERTURA = class(UNovoFormulario.TForm)
    QuickRep1: TQuickRep;
    Qemp: TFDQuery;
    QRBand1: TQRBand;
    logo: TQRImage;
    QRDBText1: TQRDBText;
    QempCOD_EMP: TIntegerField;
    QempRAZAO_EMP: TStringField;
    QempEND_EMP: TStringField;
    QempBAI_EMP: TStringField;
    QempCID_EMP: TStringField;
    QempCEP_EMP: TStringField;
    QempEST_EMP: TStringField;
    QempINSC_EMP: TStringField;
    QempTEL_EMP: TStringField;
    QempFAX_EMP: TStringField;
    QempNOME_EMP_ETIQUETA: TStringField;
    QempNUMERO_EMP: TStringField;
    QempRESP_EMP: TStringField;
    QempCAMINHO_FOTO_EMP: TStringField;
    QempFANTASIA_EMP: TStringField;
    QempMOSTRAR_SITCLI_PREVENDA: TStringField;
    QempCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    QempTIPO_EMP: TIntegerField;
    QempTIPO_CARGA_BALANCA: TIntegerField;
    QempCNPJ_EMP: TStringField;
    QempCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    QempINSCRICAO_MUNICIPAL: TStringField;
    QempPERFIL_EFD: TStringField;
    QempCODIGO_MUNICIPIO: TStringField;
    QempTIPO_ATIVIDADE_EFD: TIntegerField;
    QempNOME_CONTADOR: TStringField;
    QempCPF_CONTADOR: TStringField;
    QempCRC_CONTADOR: TStringField;
    QempCNPJ_CONTADOR: TStringField;
    QempCEP_CONTADOR: TStringField;
    QempEND_CONTADOR: TStringField;
    QempNUMERO_CONTADOR: TStringField;
    QempBAIRRO_CONTADOR: TStringField;
    QempTEL_CONTADOR: TStringField;
    QempFAX_CONTADOR: TStringField;
    QempCODIGO_MUNICIPIO_CONTADOR: TStringField;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QOS: TFDQuery;
    QOSCOD: TIntegerField;
    QOSDATA_ENTRADA: TDateField;
    QOSDATA_ORCAMENTO: TDateField;
    QOSDATA_FECHAMENTO: TDateField;
    QOSSTATUS: TStringField;
    QOSCOD_EMP: TIntegerField;
    QOSCOD_CAI: TIntegerField;
    QOSVENDEDOR: TStringField;
    QOSCOD_CLI: TIntegerField;
    QOSCLIENTE: TStringField;
    QOSTELEFONE: TStringField;
    QOSCOD_USU: TIntegerField;
    QOSCOD_TPV: TIntegerField;
    QOSTIPO_VENDA: TStringField;
    QOSRETORNO: TStringField;
    QOSCOD_RETORNO: TIntegerField;
    QOSAPARELHO_MODELO: TStringField;
    QOSAPARELHO_MARCA: TStringField;
    QOSAPARELHO_SERIE: TStringField;
    QOSCARRO_MODELO: TStringField;
    QOSCARRO_MARCA: TStringField;
    QOSCARRO_CHASSI: TStringField;
    QOSCARRO_ANO_FAB: TStringField;
    QOSTOTAL_PROD: TFloatField;
    QOSDESCONTO: TFloatField;
    QOSTECNICO: TStringField;
    QOSSUB_TOTAL: TFloatField;
    QOSDEFEITO_RECLAMADO: TWideMemoField;
    QOSOBS: TWideMemoField;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    Qcliente: TFDQuery;
    QclienteCOD_CLI: TIntegerField;
    QclienteFJ_CLI: TStringField;
    QclienteNOME_CLI: TStringField;
    QclienteCOD_CLA: TIntegerField;
    QclienteENDRES_CLI: TStringField;
    QclienteBAIRES_CLI: TStringField;
    QclienteCIDRES_CLI: TStringField;
    QclienteESTRES_CLI: TStringField;
    QclienteCEPRES_CLI: TStringField;
    QclienteTELRES_CLI: TStringField;
    QclienteENDCOM_CLI: TStringField;
    QclienteBAICOM_CLI: TStringField;
    QclienteCIDCOM_CLI: TStringField;
    QclienteESTCOM_CLI: TStringField;
    QclienteCEPCOM_CLI: TStringField;
    QclienteTELCOM_CLI: TStringField;
    QclienteCNPJ_CLI: TStringField;
    QclienteDOC_CLI: TStringField;
    QclientePAI_CLI: TStringField;
    QclienteMAE_CLI: TStringField;
    QclienteCONJUGE_CLI: TStringField;
    QclienteESTCIVIL_CLI: TStringField;
    QclienteRENDA_CLI: TBCDField;
    QclienteLIMITE_CLI: TBCDField;
    QclientePROFISSAO_CLI: TStringField;
    QclienteEMPRESA_TRAB_CLI: TStringField;
    QclienteATIVO_CLI: TStringField;
    QclienteCOD_CON: TIntegerField;
    QclienteOBS_VENDA: TStringField;
    QclienteOBS_CLI: TStringField;
    QclienteNASCIMENTO_CLI: TDateField;
    QclienteDATACADASTRO_CLI: TDateField;
    QclienteATRAZO_MAXIMO_CLI: TIntegerField;
    QclienteCELULAR_CLI: TStringField;
    QclienteIMP_SALDO_PENDENTE_CLI: TStringField;
    QclienteLIMITE_CHEQUE: TBCDField;
    QclienteDATA_CONSULTA_SPC: TDateField;
    QclienteDATA_REGISTRO_SPC: TDateField;
    QclienteDATA_REABILITACAO_SPC: TDateField;
    QclienteSELECIONADO_CLI: TStringField;
    QclienteRENDA_CONJUGE: TBCDField;
    QclienteTRABALHO_CONJUGE: TStringField;
    QclientePROF_CONJUGE: TStringField;
    QclienteNOME_FANTASIA: TStringField;
    QclientePONTO_REFERENCIA: TStringField;
    QclienteCONTATO_CLI: TStringField;
    QclienteROTA_CLI: TIntegerField;
    QclienteTIPO_CREDITO_CLI: TStringField;
    QclienteCONTROLAR_LIMITE: TStringField;
    QclienteBAICOB_CLI: TStringField;
    QclienteCIDCOB_CLI: TStringField;
    QclienteESTCOB_CLI: TStringField;
    QclienteCEPCOB_CLI: TStringField;
    QclienteTELCOB_CLI: TStringField;
    QclienteENDCOB_CLI: TStringField;
    QclienteBLOQUEADO_CLI: TStringField;
    QclienteINSC_ESTADUAL: TStringField;
    QclienteNUMRES_CLI: TStringField;
    QclienteNUMCOM_CLI: TStringField;
    QclienteNUMCOB_CLI: TStringField;
    QclienteCODIGO_IBGE: TIntegerField;
    QclienteEMAIL_CLI: TStringField;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText22: TQRDBText;
    QRShape1: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRDBRichText2: TQRDBRichText;
    Qconfig: TFDQuery;
    QconfigCOD: TIntegerField;
    QconfigTERMO_ENTRADA: TWideMemoField;
    QconfigTERMO_SAIDA: TWideMemoField;
    QRDBRichText3: TQRDBRichText;
    QRLabel27: TQRLabel;
    QRShape3: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMMAREL_OS_ABERTURA: TfrmMMAREL_OS_ABERTURA;

implementation

uses
  UDM, UMMA_OS;
{$R *.dfm}

end.
