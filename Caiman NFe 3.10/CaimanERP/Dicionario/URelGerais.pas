unit URelGerais;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmRelGerais = class(TDataModule)
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
    QEmpresaVERSAO_EFD: TIntegerField;
    QEmpresaEMAIL_CONTADOR: TStringField;
    QCliente: TFDQuery;
    QClienteCOD_CLI: TIntegerField;
    QClienteFJ_CLI: TStringField;
    QClienteNOME_CLI: TStringField;
    QClienteCOD_CLA: TIntegerField;
    QClienteENDRES_CLI: TStringField;
    QClienteBAIRES_CLI: TStringField;
    QClienteCIDRES_CLI: TStringField;
    QClienteESTRES_CLI: TStringField;
    QClienteCEPRES_CLI: TStringField;
    QClienteTELRES_CLI: TStringField;
    QClienteENDCOM_CLI: TStringField;
    QClienteBAICOM_CLI: TStringField;
    QClienteCIDCOM_CLI: TStringField;
    QClienteESTCOM_CLI: TStringField;
    QClienteCEPCOM_CLI: TStringField;
    QClienteTELCOM_CLI: TStringField;
    QClienteCNPJ_CLI: TStringField;
    QClienteDOC_CLI: TStringField;
    QClientePAI_CLI: TStringField;
    QClienteMAE_CLI: TStringField;
    QClienteCONJUGE_CLI: TStringField;
    QClienteESTCIVIL_CLI: TStringField;
    QClienteRENDA_CLI: TBCDField;
    QClienteLIMITE_CLI: TBCDField;
    QClientePROFISSAO_CLI: TStringField;
    QClienteEMPRESA_TRAB_CLI: TStringField;
    QClienteATIVO_CLI: TStringField;
    QClienteCOD_CON: TIntegerField;
    QClienteOBS_VENDA: TStringField;
    QClienteOBS_CLI: TStringField;
    QClienteNASCIMENTO_CLI: TDateField;
    QClienteDATACADASTRO_CLI: TDateField;
    QClienteATRAZO_MAXIMO_CLI: TIntegerField;
    QClienteCELULAR_CLI: TStringField;
    QClienteIMP_SALDO_PENDENTE_CLI: TStringField;
    QClienteLIMITE_CHEQUE: TBCDField;
    QClienteDATA_CONSULTA_SPC: TDateField;
    QClienteDATA_REGISTRO_SPC: TDateField;
    QClienteDATA_REABILITACAO_SPC: TDateField;
    QClienteSELECIONADO_CLI: TStringField;
    QClienteRENDA_CONJUGE: TBCDField;
    QClienteTRABALHO_CONJUGE: TStringField;
    QClientePROF_CONJUGE: TStringField;
    QClienteNOME_FANTASIA: TStringField;
    QClientePONTO_REFERENCIA: TStringField;
    QClienteCONTATO_CLI: TStringField;
    QClienteROTA_CLI: TIntegerField;
    QClienteTIPO_CREDITO_CLI: TStringField;
    QClienteCONTROLAR_LIMITE: TStringField;
    QClienteBAICOB_CLI: TStringField;
    QClienteCIDCOB_CLI: TStringField;
    QClienteESTCOB_CLI: TStringField;
    QClienteCEPCOB_CLI: TStringField;
    QClienteTELCOB_CLI: TStringField;
    QClienteENDCOB_CLI: TStringField;
    QClienteBLOQUEADO_CLI: TStringField;
    QClienteINSC_ESTADUAL: TStringField;
    QClienteNUMRES_CLI: TStringField;
    QClienteNUMCOM_CLI: TStringField;
    QClienteNUMCOB_CLI: TStringField;
    QClienteCODIGO_IBGE: TIntegerField;
    QClienteEMAIL_CLI: TStringField;
    QClienteCOD_DEPENDENTE: TIntegerField;
    QClienteNOME_DEPENDENTE: TStringField;
    QClienteGRAU_PARENTESCO: TStringField;
    QClienteCOD_VENDEDOR: TIntegerField;
    QClienteCOD_PAIS: TIntegerField;
    QClientePAIS: TStringField;
    frxCliente: TfrxDBDataset;
    frxEmpresa: TfrxDBDataset;
    TRGerais: TFDTransaction;
    QLinhas: TFDQuery;
    QLinhasLINHA: TStringField;
    frxLinhas: TfrxDBDataset;
    QEmpresaCAMINHO_LOGOMARCA_DANFE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelGerais: TdmRelGerais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDM;

{$R *.dfm}

end.
