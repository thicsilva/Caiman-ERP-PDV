unit UCadNotaFiscalServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, JvExControls,
  JvDBLookup, Vcl.Mask, JvExStdCtrls, JvCombobox, JvDBCombobox, JvLabel,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrNFSeDANFSeClass,
  ACBrNFSeDANFSeFR, ACBrDFe, ACBrNFSe, ACBrBase, ACBrMail, pnfsConversao, Math, pcnConversao;

type
  TfrmCadNotaFiscalServico = class(TForm)
    Panel1: TPanel;
    btImprimir: TSpeedButton;
    btTransmitir: TSpeedButton;
    btCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btValidar: TSpeedButton;
    btExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    GroupBox2: TGroupBox;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    GroupBox3: TGroupBox;
    JvLabel24: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel32: TJvLabel;
    JvLabel37: TJvLabel;
    DBMemo1: TDBMemo;
    RxDBComboBox1: TJvDBComboBox;
    DBEdit15: TDBEdit;
    JvDBComboBox2: TJvDBComboBox;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel10: TJvLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox5: TGroupBox;
    JvLabel19: TJvLabel;
    DBEdit9: TDBEdit;
    ckISS: TDBCheckBox;
    GroupBox6: TGroupBox;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    JvLabel31: TJvLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox7: TGroupBox;
    DBText17: TDBText;
    JvLabel20: TJvLabel;
    DBText18: TDBText;
    JvLabel33: TJvLabel;
    DBText19: TDBText;
    JvLabel34: TJvLabel;
    dbPrestador: TJvDBLookupCombo;
    dbCliente: TJvDBLookupCombo;
    QEmp: TFDQuery;
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
    QEmpNOME_EMP_ETIQUETA: TStringField;
    QEmpNUMERO_EMP: TStringField;
    QEmpRESP_EMP: TStringField;
    QEmpCAMINHO_FOTO_EMP: TStringField;
    QEmpFANTASIA_EMP: TStringField;
    QEmpMOSTRAR_SITCLI_PREVENDA: TStringField;
    QEmpCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    QEmpTIPO_EMP: TIntegerField;
    QEmpTIPO_CARGA_BALANCA: TIntegerField;
    QEmpCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    QEmpINSCRICAO_MUNICIPAL: TStringField;
    QEmpPERFIL_EFD: TStringField;
    QEmpCODIGO_MUNICIPIO: TStringField;
    QEmpTIPO_ATIVIDADE_EFD: TIntegerField;
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
    QEmpVERSAO_EFD: TIntegerField;
    QEmpEMAIL_CONTADOR: TStringField;
    DsEmp: TDataSource;
    QCli: TFDQuery;
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
    QCliOBS_VENDA: TStringField;
    QCliOBS_CLI: TStringField;
    QCliNASCIMENTO_CLI: TDateField;
    QCliDATACADASTRO_CLI: TDateField;
    QCliATRAZO_MAXIMO_CLI: TIntegerField;
    QCliCELULAR_CLI: TStringField;
    QCliIMP_SALDO_PENDENTE_CLI: TStringField;
    QCliNEGATIVADO: TStringField;
    QCliLIMITE_CHEQUE: TBCDField;
    QCliDATA_CONSULTA_SPC: TDateField;
    QCliDATA_REGISTRO_SPC: TDateField;
    QCliDATA_REABILITACAO_SPC: TDateField;
    QCliSELECIONADO_CLI: TStringField;
    QCliRENDA_CONJUGE: TBCDField;
    QCliTRABALHO_CONJUGE: TStringField;
    QCliPROF_CONJUGE: TStringField;
    QCliNOME_FANTASIA: TStringField;
    QCliPONTO_REFERENCIA: TStringField;
    QCliCONTATO_CLI: TStringField;
    QCliROTA_CLI: TIntegerField;
    QCliTIPO_CREDITO_CLI: TStringField;
    QCliCONTROLAR_LIMITE: TStringField;
    QCliENDCOB_CLI: TStringField;
    QCliBAICOB_CLI: TStringField;
    QCliCIDCOB_CLI: TStringField;
    QCliESTCOB_CLI: TStringField;
    QCliCEPCOB_CLI: TStringField;
    QCliTELCOB_CLI: TStringField;
    QCliBLOQUEADO_CLI: TStringField;
    QCliINSC_ESTADUAL: TStringField;
    QCliNUMRES_CLI: TStringField;
    QCliNUMCOM_CLI: TStringField;
    QCliNUMCOB_CLI: TStringField;
    QCliCODIGO_IBGE: TIntegerField;
    QCliEMAIL_CLI: TStringField;
    dsCli: TDataSource;
    DBText5: TDBText;
    DBText9: TDBText;
    dbCodigo: TDBEdit;
    dbServico: TDBEdit;
    JvLabel7: TJvLabel;
    QNotaFiscalServico: TFDQuery;
    dsNotaFiscalServico: TDataSource;
    ACBrMail1: TACBrMail;
    ACBrNFSe1: TACBrNFSe;
    ACBrNFSeDANFSeFR1: TACBrNFSeDANFSeFR;
    QNotaFiscalServicoID_NF_SERVICO: TIntegerField;
    QNotaFiscalServicoDATA_LANCAMENTO: TDateField;
    QNotaFiscalServicoVALOR: TFloatField;
    QNotaFiscalServicoDESCRICAO: TMemoField;
    QNotaFiscalServicoID_CADASTRO: TIntegerField;
    QNotaFiscalServicoNATUREZA_OPERACAO: TStringField;
    QNotaFiscalServicoALIQUOTA: TFloatField;
    QNotaFiscalServicoCODIGO_SERVICO: TStringField;
    QNotaFiscalServicoVALOR_DEDUCOES: TFloatField;
    QNotaFiscalServicoDESCONTOS_INCONDICIONADOS: TFloatField;
    QNotaFiscalServicoDESCONTOS_CONDICIONADOS: TFloatField;
    QNotaFiscalServicoOUTRAS_RETENCOES: TFloatField;
    QNotaFiscalServicoISS_RETIDO: TStringField;
    QNotaFiscalServicoVALOR_ISS_RETIDO: TFloatField;
    QNotaFiscalServicoPIS: TFloatField;
    QNotaFiscalServicoCOFINS: TFloatField;
    QNotaFiscalServicoIR: TFloatField;
    QNotaFiscalServicoINSS: TFloatField;
    QNotaFiscalServicoCSLL: TFloatField;
    QNotaFiscalServicoNUMERO_NF: TIntegerField;
    QNotaFiscalServicoID_EMPRESA: TIntegerField;
    QNotaFiscalServicoCHAVE: TStringField;
    QNotaFiscalServicoGERADA: TStringField;
    QNotaFiscalServicoSERVICO_CODIGO: TStringField;
    TRPrincipal: TFDTransaction;
    qParametro: TFDQuery;
    qParametroDIAS_CARENCIA: TIntegerField;
    qParametroDIAS_NEGATIVACAO: TIntegerField;
    qParametroJUROS_ATRASO: TBCDField;
    qParametroLINHAS_FINAL: TIntegerField;
    qParametroIMP_CABECALHO: TStringField;
    qParametroCOD_EMP: TIntegerField;
    qParametroMOSTRAR_ESTOQUE_VENDA: TStringField;
    qParametroDATA_INICIO_ESTOQUE: TDateField;
    qParametroLANCAR_CHEQUES_CC: TStringField;
    qParametroCOD_DOC: TIntegerField;
    qParametroBUSCAR_VENDEDOR_VENDAS: TStringField;
    qParametroLANC_CONTABIL: TStringField;
    qParametroTAMANHO_COMPROVANTE: TStringField;
    qParametroSOMAR_POR_CST_NF: TStringField;
    qParametroSALDO_CONCILIADO_CC: TStringField;
    qParametroSENHA_EXCLUIR_VENDA: TStringField;
    qParametroDESCONTO_ITEM_VENDA: TStringField;
    qParametroDESCONTO_TOTAL_VENDA: TStringField;
    qParametroDESCONTO_MAXIMO_VENDA: TBCDField;
    qParametroTAMANHO_CODIGO_BALANCA: TIntegerField;
    qParametroIMP_RECIBO_PAGAMENTO: TStringField;
    qParametroINDICE_NOTA_FISCAL: TIntegerField;
    qParametroLANCAR_CHEQUE_CAIXA: TStringField;
    qParametroDADOS_CONVENIO_COMPROVANTE: TStringField;
    qParametroALTERAR_PARCELAS: TStringField;
    qParametroCODVENDA_INICIO_REC: TStringField;
    qParametroINSTRUCOES_BOLETO: TStringField;
    qParametroCONS_PROD_RAPIDA_VENDAS: TStringField;
    qParametroIMP_RECIBO_ECF: TStringField;
    qParametroIMPRIMIR_PARCELAS_PENDENTES: TStringField;
    qParametroDUASLINHAS_ITENS_COMPROVANTE: TStringField;
    qParametroMOSTRAR_PROMOCAO_VENDAS: TStringField;
    qParametroMOSTRAR_SOMENTE_PROD_COM_EST: TStringField;
    qParametroSOMAR_QTD_ITENS_NF: TStringField;
    qParametroGERAR_NF_VENDAS: TStringField;
    qParametroMANTER_DATA_NOTINHA: TStringField;
    qParametroIMPRIMIR_NOTA_PROMISSORIA: TStringField;
    qParametroDATA_LIBERACAO: TDateField;
    qParametroPERGUNTA_PARCELA_PENDENTE: TStringField;
    qParametroMODELO_ETIQUETA_MATRICIAL: TIntegerField;
    qParametroQUANT_MAXIMA_VENDAS: TBCDField;
    qParametroVALOR_MAXIMO_VENDAS: TBCDField;
    qParametroIMPRIMIR_NOME_OPERADOR: TStringField;
    qParametroNUMERO_VIAS_COMPROVANTE: TIntegerField;
    qParametroGERAR_SINTEGRA: TStringField;
    qParametroSERIE_NF: TStringField;
    qParametroTIPO_FRETE_NF: TIntegerField;
    qParametroESPECIE_NF: TStringField;
    qParametroMARCA_NF: TStringField;
    qParametroTIPO_COMPROVANTE: TIntegerField;
    qParametroINCLUIR_FRETE_PRIMEIRA_PARCELA: TStringField;
    qParametroIMPRIMIR_FATURA_NOTA_FISCAL: TStringField;
    qParametroHABILITAR_DEVOLUCAO: TStringField;
    qParametroALIQUOTA_PIS: TBCDField;
    qParametroALIQUOTA_COFINS: TBCDField;
    qParametroALIQUOTA_IR: TBCDField;
    qParametroALIQUOTA_CSLL: TBCDField;
    qParametroALIQUOTA_OUTRAS: TBCDField;
    qParametroVISUALIZAR_RELATORIOS: TStringField;
    qParametroCFOP_CUPOM_ESTADO: TIntegerField;
    qParametroCFOP_CUPOM_FORA: TIntegerField;
    qParametroCLIENTE_PADRAO_VENDA: TIntegerField;
    qParametroVENDEDOR_PADRAO_VENDA: TIntegerField;
    qParametroTIPO_VENDA_PADRAO_VENDA: TIntegerField;
    qParametroTIPO_VENDA_PADRAO_PRAZO: TIntegerField;
    qParametroATRASO_MAXIMO: TIntegerField;
    qParametroCODIGO_COBRANCA: TIntegerField;
    qParametroINICIAR_VENDAS_FORMA_PAGAMENTO: TStringField;
    qParametroCONSULTAR_PRODUTO: TStringField;
    qParametroPRECO_PESO_BALANCA: TIntegerField;
    qParametroIMPRIMIR_SERVICO_ECF: TStringField;
    qParametroCODIFICACAO_FISCAL: TStringField;
    qParametroNUMERO_INICIAL_NOTA_FISCAL: TIntegerField;
    qParametroSAIDAS_ESTOQUE_NEGATIVO: TStringField;
    qParametroISENTAS_OUTRAS_LIVROS_FISCAIS: TStringField;
    qParametroCODIGO_LOCAL_ESTOQUE_VENDAS: TIntegerField;
    qParametroDEFAULT_LOCAL_ORIGEM: TIntegerField;
    qParametroDEFAULT_LOCAL_DESTINO: TIntegerField;
    qParametroCAMINHO_CERTIFICADO: TStringField;
    qParametroSENHA_CERTIFICADO: TStringField;
    qParametroNUMERO_SERIE_CERTIFICADO: TStringField;
    qParametroTIPO_IMPRESSAO_DANFE: TStringField;
    qParametroFORMA_EMISSAO_DANFE: TIntegerField;
    qParametroCAMINHO_LOGOMARCA_DANFE: TStringField;
    qParametroSALVAR_LOG_DANFE: TStringField;
    qParametroCAMINHO_LOG_DANFE: TStringField;
    qParametroAMBIENTE_DANFE: TStringField;
    qParametroSERVIDOR_SMTP: TStringField;
    qParametroPORTA_SMTP: TStringField;
    qParametroUSUARIO_SMTP: TStringField;
    qParametroSENHA_SMTP: TStringField;
    qParametroASSUNTO_EMAIL_DANFE: TStringField;
    qParametroSMTP_CONEXAO_SEGURA: TStringField;
    qParametroMENSAGEM_EMAIL_DANFE: TStringField;
    qParametroPASTA_CANCELADAS_DANFE: TStringField;
    qParametroPASTA_INUTILIZADAS_DANFE: TStringField;
    qParametroPASTA_TRANSMITIDAS_DANFE: TStringField;
    qParametroFROM_SMTP: TStringField;
    qParametroCAMINHO_ARQUIVOS_PDF: TStringField;
    qParametroCAMINHO_RELATORIO_DANFE: TStringField;
    qParametroESTADO_NFE: TStringField;
    qParametroLOCAL_BACKUP: TStringField;
    qParametroCOD_CEDENTE: TIntegerField;
    qParametroPIS_ENTRADAS: TBCDField;
    qParametroCOFINS_ENTRADAS: TBCDField;
    qParametroIR_ENTRADAS: TBCDField;
    qParametroCONT_SOCIAL_ENTRADA: TBCDField;
    qParametroOUTRAS_ENTRADAS: TBCDField;
    qParametroTIPO_ENVIO_EMAIL: TIntegerField;
    qParametroEST_REMESSA: TStringField;
    qParametroPASTA_REMESSA: TStringField;
    qParametroPASTA_RETORNOS: TStringField;
    qParametroPASTA_TXT_SERV: TStringField;
    qParametroNFCE_NUMERO: TIntegerField;
    qParametroNFCE_SERIE: TIntegerField;
    qParametroNFCE_AMBIENTE: TIntegerField;
    qParametroNFCE_PASTA_CANCELADAS: TStringField;
    qParametroNFCE_PASTA_INUTILIZADAS: TStringField;
    qParametroNFCE_PASTA_TRANSMITIDAS: TStringField;
    qParametroNFCE_PASTA_PDF: TStringField;
    qParametroNFCE_ID_TOKEN: TStringField;
    qParametroNFCE_TOKEN: TStringField;
    qParametroNFCE_TIPO_FRENTE: TIntegerField;
    qParametroPADROES_ICMS_D: TIntegerField;
    qParametroPADROES_ICMS_F: TIntegerField;
    qParametroPADROES_CFOP_D: TIntegerField;
    qParametroPADROES_CFOP_F: TSmallintField;
    qParametroPADROES_CST_D: TStringField;
    qParametroPADROES_CST_F: TStringField;
    qParametroREST_USA_COMISSAO: TStringField;
    qParametroREST_COMISSAO: TBCDField;
    qParametroREST_SERVICO: TIntegerField;
    qParametroREST_PISCAR: TStringField;
    qParametroREST_ATRAZO: TTimeField;
    qParametroREST_ATRAZO_PISCA: TTimeField;
    qParametroREST_COR_IT: TStringField;
    qParametroREST_COR_IA: TStringField;
    qParametroREST_COR_IP: TStringField;
    qParametroREST_COR_PT: TStringField;
    qParametroREST_COR_PA: TStringField;
    qParametroREST_COR_PP: TStringField;
    qParametroNFE_VERSAO: TStringField;
    qParametroNFE_SINCRONO: TStringField;
    qParametroNFE_TIPOEMAIL: TIntegerField;
    qParametroNFE_NOMEEMAIL: TStringField;
    qParametroIMAGEM_PREFEITURA: TStringField;
    qParametroPREFEITURA: TStringField;
    qParametroALIQUOTA: TFloatField;
    qParametroSCHEMAS: TStringField;
    QNotaFiscalServicoVALOR_LIQUIDO: TFloatField;
    procedure btExcluirClick(Sender: TObject);
    procedure btValidarClick(Sender: TObject);
    procedure btTransmitirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QNotaFiscalServicoCalcFields(DataSet: TDataSet);
    procedure dsNotaFiscalServicoDataChange(Sender: TObject; Field: TField);
    procedure ckISSClick(Sender: TObject);
  private
    Ok : Boolean;
    procedure GerarNFSe(NumNFSe: String);
    function RoundTo5(Valor: Double; Casas: Integer): Double;
    procedure HabilitaBotao;
    procedure CarregaNFe();
    procedure ConsultaNF;
    procedure CarregaNFeEnviada();
    procedure ConfiguraComponente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNotaFiscalServico: TfrmCadNotaFiscalServico;

implementation

{$R *.dfm}

uses UDM, UDialog, Ubibli1;

procedure TfrmCadNotaFiscalServico.CarregaNFeEnviada();
var Caminho : String;
begin
  ACBrNFSe1.NotasFiscais.Clear;
  Caminho := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar+QNotaFiscalServicoCHAVE.AsString+'-NFSe.xml';
  if FileExists(Caminho) then
    ACBrNFSe1.NotasFiscais.LoadFromFile(Caminho)
  else
    MessageDlg('Arquivo XML não existe . '+Caminho, mtInformation, [mbOK],0);
  ACBrNFSe1.Configuracoes.Arquivos.NomeLongoNFSe := True;
end;

procedure TfrmCadNotaFiscalServico.ckISSClick(Sender: TObject);
var ISS : Double;
begin
  if ckISS.Checked then
    begin
      ISS := QNotaFiscalServicoVALOR.AsFloat / 100;
      ISS := ISS * QNotaFiscalServicoALIQUOTA.AsFloat;
      QNotaFiscalServico.Edit;
      QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat := ISS;
    end
  else if QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat > 0 then
    begin
      QNotaFiscalServico.Edit;
      QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat := ISS;
    end;
end;

procedure TfrmCadNotaFiscalServico.HabilitaBotao;
begin
  btTransmitir.Enabled := QNotaFiscalServicoGERADA.AsString = 'V';
  btCancelar.Enabled   := QNotaFiscalServicoGERADA.AsString = 'E';
  btImprimir.Enabled   := QNotaFiscalServicoGERADA.AsString = 'E';
  btValidar.Enabled    := QNotaFiscalServicoGERADA.AsString = '';
  btExcluir.Visible    := QNotaFiscalServicoGERADA.AsString = 'V';
  btValidar.Visible    := not btExcluir.Visible;
end;

procedure TfrmCadNotaFiscalServico.QNotaFiscalServicoCalcFields(
  DataSet: TDataSet);
begin
  QNotaFiscalServicoVALOR_LIQUIDO.AsFloat := QNotaFiscalServicoVALOR.AsFloat - QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat;
end;

function TfrmCadNotaFiscalServico.RoundTo5(Valor: Double; Casas: Integer): Double;
var
 xValor, xDecimais: String;
 p, nCasas: Integer;
 nValor: Double;
begin
 nValor := Valor;
 xValor := Trim(FloatToStr(Valor));
 p      := pos(',', xValor);
 if Casas < 0
  then nCasas := - Casas
  else nCasas := Casas;
 if p > 0
  then begin
   xDecimais := Copy(xValor, p + 1, length(xValor));
   if length(xDecimais) > nCasas
    then begin
     if xDecimais[nCasas + 1] >= '5'
      then SetRoundMode(rmUP)
      else SetRoundMode(rmNearest);
    end;
   nValor := RoundTo(Valor, Casas);
  end;
 Result := nValor;
end;

procedure TfrmCadNotaFiscalServico.btCancelarClick(Sender: TObject);
var
 Codigo : String;
begin
  ACBrNFSe1.NotasFiscais.Clear;
  CarregaNFeEnviada;

  // Codigo de Cancelamento
  // 1 - Erro de emissão
  // 2 - Serviço não concluido
  // 3 - RPS Cancelado na Emissão

  if not(InputQuery('Cancelar NFSe', 'Código de Cancelamento', Codigo)) then
    exit;

  //   ACBrNFSe1.WebServices.CancelaNFSe(Codigo, '1', '03310700000170', '0306223', '0');
  ACBrNFSe1.CancelarNFSe(Codigo);
  QNotaFiscalServico.Edit;
  QNotaFiscalServicoGERADA.AsString := 'C';

  QNotaFiscalServico.Post;
  QNotaFiscalServico.RefreshRecord();


  MessageDlg('Nota Fiscal de Serviço Cancelada .',mtInformation, [mbOK],0);
  HabilitaBotao;
end;

procedure TfrmCadNotaFiscalServico.btExcluirClick(Sender: TObject);
begin
  QNotaFiscalServico.Edit;
  QNotaFiscalServicoGERADA.Clear;
  QNotaFiscalServicoCHAVE.Clear;
  QNotaFiscalServico.Post;
  QNotaFiscalServico.RefreshRecord();
  HabilitaBotao;
end;

procedure TfrmCadNotaFiscalServico.CarregaNFe();
var Caminho : String;
begin
  ACBrNFSe1.NotasFiscais.Clear;
  Caminho := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar+QNotaFiscalServicoCHAVE.AsString+'-Rps.xml';
  if FileExists(Caminho) then
    ACBrNFSe1.NotasFiscais.LoadFromFile(Caminho)
  else
    MessageDlg('Arquivo XML não existe . '+Caminho, mtInformation, [mbOK],0);
end;

procedure TfrmCadNotaFiscalServico.ConsultaNF;
var
   Chave, ExecutaSQL : string;
   idNota : Integer;
begin
  if ACBrNFSe1.ConsultarNFSeporRps(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero,
                                   ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie,
                                   TipoRPSToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo)) then
                                   //ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Cnpj,
                                   //ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal) then
    begin
       ACBrNFSe1.NotasFiscais.Items[0].GerarXML;
       ACBrNFSe1.NotasFiscais.Items[0].GravarXML(ACBrNFSe1.NotasFiscais.Items[0].NFSe.InfID.ID+'-Rps.xml', ACBrNFSe1.Configuracoes.Arquivos.PathSalvar);
       QNotaFiscalServico.Edit;
       QNotaFiscalServicoGERADA.AsString := 'E';
       QNotaFiscalServicoCHAVE.AsString := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero;
       QNotaFiscalServico.Post;
       TRPrincipal.CommitRetaining;
       QNotaFiscalServico.RefreshRecord();
       MessageDlg('Nota Fiscal de Serviço Enviada .',mtInformation, [mbOK],0);

       HabilitaBotao;
    end
  else
    MessageDlg('Nota Fiscal de Serviço não Enviada. Tente novamente mais tarde !'+#13+
           'Se o erro persistir contate o administrador do sistema !',mtInformation, [mbOK],0);

end;

procedure TfrmCadNotaFiscalServico.dsNotaFiscalServicoDataChange(
  Sender: TObject; Field: TField);
begin
  if dsNotaFiscalServico.State in [dsEdit, dsInsert] then
    begin
      btnSalvar.Visible := True;
      btnCancelar.Visible := True;
      btnNovo.Visible := False;
      btnExcluir.Visible := False;
    end
  else
    begin
      btnSalvar.Visible := False;
      btnCancelar.Visible := False;
      btnNovo.Visible := True;
      if (QNotaFiscalServicoGERADA.AsString = '') or (QNotaFiscalServicoGERADA.AsString = 'V') then
        btnExcluir.Visible := True
      else
        btnExcluir.Enabled := False;
    end;
end;

procedure TfrmCadNotaFiscalServico.ConfiguraComponente;
var PathMensal: String;
begin
  qParametro.Close;
  qParametro.Params[0].AsInteger := iEmp;
  qParametro.Open;

 {$IFDEF ACBrNFSeOpenSSL}
   ACBrNFSe1.Configuracoes.Certificados.Certificado := qParametroCAMINHO_CERTIFICADO.AsString;
   ACBrNFSe1.Configuracoes.Certificados.Senha       := qParametroSENHA_CERTIFICADO.AsString;
 {$ELSE}
   ACBrNFSe1.Configuracoes.Certificados.NumeroSerie := qParametroNUMERO_SERIE_CERTIFICADO.AsString;
 {$ENDIF}


 PathMensal:=ACBrNFSe1.Configuracoes.Arquivos.GetPathNFSe(0);

 ACBrNFSe1.Configuracoes.Arquivos.PathSchemas := qParametroSCHEMAS.AsString;
 ACBrNFSe1.Configuracoes.Geral.Salvar      := qParametroPASTA_TRANSMITIDAS_DANFE.AsString <> '';
 ACBrNFSe1.Configuracoes.Arquivos.PathSalvar  := qParametroPASTA_TRANSMITIDAS_DANFE.AsString;
 ACBrNFSeDANFSeFR1.PathPDF  := qParametroPASTA_TRANSMITIDAS_DANFE.AsString;

 ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio := StrToIntDef(QEmpCODIGO_MUNICIPIO.AsString, 0);
 ACBrNFSe1.Configuracoes.WebServices.Ambiente        := StrToTpAmb(Ok,IntToStr(IfThen(qParametroAMBIENTE_DANFE.AsString = 'P', 1, 2)));
 //ACBrNFSe1.Configuracoes.WebServices.Visualizar      := qParametroVISUALIZAR_MENSAGEM_WEB.AsString = 'S';
 ACBrNFSe1.Configuracoes.Geral.SenhaWeb        := '';
 ACBrNFSe1.Configuracoes.Geral.UserWeb         := '';

 ACBrNFSe1.Configuracoes.WebServices.ProxyHost := '';
 ACBrNFSe1.Configuracoes.WebServices.ProxyPort := '';
 ACBrNFSe1.Configuracoes.WebServices.ProxyUser := '';
 ACBrNFSe1.Configuracoes.WebServices.ProxyPass := '';

 ACBrNFSe1.Configuracoes.Geral.SetConfigMunicipio;

 if ACBrNFSe1.DANFSe <> nil then
  begin
   ACBrNFSe1.DANFSe.Logo       := qParametroCAMINHO_LOGOMARCA_DANFE.AsString;
   ACBrNFSe1.DANFSe.PrestLogo  := qParametroIMAGEM_PREFEITURA.AsString;
   ACBrNFSe1.DANFSe.Prefeitura := qParametroPREFEITURA.AsString;
  end;

end;

procedure TfrmCadNotaFiscalServico.FormCreate(Sender: TObject);
begin
  QEmp.Close;
  QEmp.Params[0].AsInteger := iEmp;
  QEmp.Open;
  QCli.Open;
  QNotaFiscalServico.Open;
end;

procedure TfrmCadNotaFiscalServico.FormShow(Sender: TObject);
begin
  ConfiguraComponente;
  HabilitaBotao;

end;

procedure TfrmCadNotaFiscalServico.btImprimirClick(Sender: TObject);
begin
  ACBrNFSe1.NotasFiscais.Clear;
    {ACBrNFSe1.ConsultarNFSeporRps(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero,
                                  ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie,
                                  TipoRPSToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo),
                                  ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Cnpj,
                                  ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal);    }
  CarregaNFeEnviada;
  ACBrNFSe1.NotasFiscais.Imprimir;
end;

procedure TfrmCadNotaFiscalServico.btnCancelarClick(Sender: TObject);
begin
  QNotaFiscalServico.Cancel;
end;

procedure TfrmCadNotaFiscalServico.btnExcluirClick(Sender: TObject);
begin
  if (QNotaFiscalServicoGERADA.AsString = '') or (QNotaFiscalServicoGERADA.AsString = 'V') then
   if not KDialog( 'Tem certeza que deseja excluir este registro?', 'Exclusão', tdtPergunta )  then
      Exit;
   try
     try
      dsNotaFiscalServico.DataSet.Delete;
     except
        On E: Exception do
           begin
              AlertaCad( 'Erro ao excluir : ' + E.Message );

           end;
     end;
   finally

   end;
end;

procedure TfrmCadNotaFiscalServico.btnNovoClick(Sender: TObject);
begin
  QNotaFiscalServico.Append;
end;

procedure TfrmCadNotaFiscalServico.btnSalvarClick(Sender: TObject);
var ssIdNota : Integer;
begin
   try
     if QNotaFiscalServicoID_NF_SERVICO.AsInteger > 0 then
       ssIdNota := QNotaFiscalServicoID_NF_SERVICO.AsInteger
     else
       ssIdNota := prxcod('NOTA_FISCAL_SERVICO', 'ID_NF_SERVICO', dm.IBTransaction, dm.ibsqlcod);
    QNotaFiscalServico.Post;
    TRPrincipal.CommitRetaining;
    QNotaFiscalServico.RefreshRecord();
   except

   end;

end;

procedure TfrmCadNotaFiscalServico.btTransmitirClick(Sender: TObject);
var j, i : Integer;
begin
  ACBrNFSe1.NotasFiscais.Clear;
  CarregaNFe;
  try
    try
      ACBrNFSe1.Enviar(StrToInt(QNotaFiscalServicoNUMERO_NF.AsString));
    Except

    end;
    if MessageDlg('Deseja realmente transmitir a Nota Fiscal de Serviço ?',mtConfirmation, [mbYes, mbNo],0) = mrYes then
      begin
        //tempo para nota ser enviada para poder pegar o xml dela*******************
        j := 0;
        for I := 0 to 10000000 do
          begin
            j := j + i;
          end;
        //**************************************************************************

        ACBrNFSe1.ConsultarNFSeporRps(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero,
                                           ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie,
                                           TipoRPSToStr(ACBrNFSe1.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo));
                                           //ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Cnpj,
                                           //ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal);
        ACBrNFSe1.NotasFiscais.Items[0].GerarXML;
        ACBrNFSe1.NotasFiscais.Items[0].GravarXML(ACBrNFSe1.NotasFiscais.Items[0].NFSe.InfID.ID+'-Rps.xml', ACBrNFSe1.Configuracoes.Arquivos.PathSalvar);


        QNotaFiscalServico.Edit;
        QNotaFiscalServicoGERADA.AsString := 'E';
        QNotaFiscalServicoCHAVE.AsString := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero;
        QNotaFiscalServico.Post;
        QNotaFiscalServico.RefreshRecord();
        MessageDlg('Nota Fiscal de Serviço enviada com sucesso !', mtInformation, [mbOK],0);
      end;
    HabilitaBotao;
  except
   on E: Exception do
     begin
       MessageDlg('Erro no envio Execption :'+ E.Message, mtInformation, [mbOk],0);
       ConsultaNF;
     end;
  end;

end;

procedure TfrmCadNotaFiscalServico.btValidarClick(Sender: TObject);
begin
  try
    GerarNFSe(QNotaFiscalServicoNUMERO_NF.AsString);
  except
    MessageDlg('Erro ao criar nota fiscal serviço! Verifique os dados da nota selecionada .',mtInformation, [mbOK],0);
    Exit;
  end;
  ACBrNFSe1.NotasFiscais.Items[0].GerarXML;
  ACBrNFSe1.NotasFiscais.Items[0].GravarXML(ACBrNFSe1.NotasFiscais.Items[0].NFSe.InfID.ID+'-Rps.xml', ACBrNFSe1.Configuracoes.Arquivos.PathSalvar);

  QNotaFiscalServico.Edit;
  QNotaFiscalServicoGERADA.AsString := 'V';
  QNotaFiscalServicoCHAVE.AsString := ACBrNFSe1.NotasFiscais.Items[0].NFSe.InfID.ID;
  QNotaFiscalServico.Post;
  QNotaFiscalServico.RefreshRecord();
  HabilitaBotao;
end;

procedure TfrmCadNotaFiscalServico.GerarNFSe(NumNFSe: String);
var
 ValorISS, Valor: Double;
begin
 ACBrNFSe1.NotasFiscais.Clear;

 with ACBrNFSe1 do
  begin
   NotasFiscais.NumeroLote := '0001';
   NotasFiscais.Transacao := True;
   //NotasFiscais.NumeroLote := QNotaFiscalServicoID_NF_SERVICO.AsString;
   with NotasFiscais.Add.NFSe do
    begin
     Numero := NumNFSe;
     Competencia := FormatDateTime('mmyyyy', Date);
     IdentificacaoRps.Numero := FormatFloat('#########0', StrToInt(NumNFSe));

     // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
     IdentificacaoRps.Serie := 'UNICA';

     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;

     DataEmissao := Date+Time;
     DataEmissaoRps := Date+Time;

     // TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );

    // TnfseNaturezaOperacao=( 0=noTributacaoNoMunicipio, 1=noTributacaoForaMunicipio, 2=noIsencao, 3=noImune, 4=noSuspensaDecisaoJudicial,                      						       5=noSuspensaProcedimentoAdministrativo );

     if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '1' then
       NaturezaOperacao := TnfseNaturezaOperacao(0)
     else
       if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '2' then
         NaturezaOperacao := TnfseNaturezaOperacao(1)
       else
         if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '3' then
           NaturezaOperacao := TnfseNaturezaOperacao(2)
         else
           if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '4' then
             NaturezaOperacao := TnfseNaturezaOperacao(4)
           else
             if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '6' then
               NaturezaOperacao := TnfseNaturezaOperacao(3)
             else
               if QNotaFiscalServicoNATUREZA_OPERACAO.AsString = '7' then
                 NaturezaOperacao := TnfseNaturezaOperacao(5);
//     NaturezaOperacao := noTributacaoNoMunicipio51;

     // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
     RegimeEspecialTributacao := retMicroempresaMunicipal;

     // TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := snSim;

     // TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := snSim;

     // TnfseStatusRPS = ( srNormal, srCancelado );
     Status := srNormal;

     (* Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     *)

     Servico.Valores.ValorServicos          := QNotaFiscalServicoVALOR.AsFloat;
     Servico.Valores.ValorDeducoes          := QNotaFiscalServicoVALOR_DEDUCOES.AsFloat;
     Servico.Valores.ValorPis               := QNotaFiscalServicoPIS.AsFloat;
     Servico.Valores.ValorCofins            := QNotaFiscalServicoCOFINS.AsFloat;
     Servico.Valores.ValorInss              := QNotaFiscalServicoINSS.AsFloat;
     Servico.Valores.ValorIr                := QNotaFiscalServicoIR.AsFloat;
     Servico.Valores.ValorCsll              := QNotaFiscalServicoCSLL.AsFloat;


     // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
     // stRetencao = snSim
     // stNormal   = snNao
     if QNotaFiscalServicoISS_RETIDO.AsString = 'S' then
       Servico.Valores.IssRetido  := stRetencao
     else
       Servico.Valores.IssRetido  := stNormal;

     Servico.Valores.OutrasRetencoes        := QNotaFiscalServicoOUTRAS_RETENCOES.AsFloat;
     Servico.Valores.DescontoIncondicionado := QNotaFiscalServicoDESCONTOS_INCONDICIONADOS.AsFloat;
     Servico.Valores.DescontoCondicionado   := QNotaFiscalServicoDESCONTOS_CONDICIONADOS.AsFloat;

     Servico.Valores.BaseCalculo            := Servico.Valores.ValorServicos -
                                               Servico.Valores.ValorDeducoes -
                                               Servico.Valores.DescontoIncondicionado;

     Servico.Valores.Aliquota               := QNotaFiscalServicoALIQUOTA.AsFloat * 100;
     //Servico.Valores.Aliquota               := RoundTo5(QNotaFiscalServicoALIQUOTA.AsFloat / 100, 4);

     if Servico.Valores.IssRetido = stNormal
      then begin
        if QCliFJ_CLI.AsString = 'J' then
          begin
            ValorISS := Servico.Valores.BaseCalculo * (QNotaFiscalServicoALIQUOTA.AsFloat / 100);
            Servico.Valores.ValorIss       := RoundTo5(ValorISS, -2);
            Servico.Valores.ValorIssRetido := QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat;
          end
        else
          ValorISS := 0;
      end
      else begin
       ValorISS := Servico.Valores.BaseCalculo * (QNotaFiscalServicoALIQUOTA.AsFloat / 100);

       Servico.Valores.ValorIss       := QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat;
       Servico.Valores.ValorIssRetido := RoundTo5(ValorISS, -2);
      end;

     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;

     Servico.ItemListaServico         := QNotaFiscalServicoSERVICO_CODIGO.AsString;

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'
     // Servico.CodigoCnae                := '123'; // Informação Opcional
     Servico.CodigoTributacaoMunicipio := QNotaFiscalServicoCODIGO_SERVICO.AsString;
     //Servico.Descricao                 := Cds_CodigoServicoATIVIDADE.AsString;

     Servico.Discriminacao             := QNotaFiscalServicoDESCRICAO.AsString;
     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio :=  QEmpCODIGO_MUNICIPIO.AsString;

     // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;

     // Informar para Saatri
     Servico.CodigoPais := 1058; // Brasil
     Servico.MunicipioIncidencia := StrToIntDef(QEmpCODIGO_MUNICIPIO.AsString, 0);

     with Servico.ItemServico.Add do
      begin
       Descricao     := QNotaFiscalServicoDESCRICAO.AsString;
       Quantidade    := 1;
       ValorUnitario := QNotaFiscalServicoVALOR.AsFloat;
      end;
     ACBrNFSe1.Configuracoes.Geral.Emitente.CNPJ := QEmpCNPJ_EMP.AsString;
     ACBrNFSe1.Configuracoes.Geral.Emitente.InscMun :=  QEmpINSCRICAO_MUNICIPAL.AsString;

     Prestador.Cnpj               := QEmpCNPJ_EMP.AsString;
     Prestador.InscricaoMunicipal := QEmpINSCRICAO_MUNICIPAL.AsString;


     PrestadorServico.RazaoSocial := QEmpRAZAO_EMP.AsString;
     PrestadorServico.Endereco.Endereco := QEmpEND_EMP.AsString;
     PrestadorServico.Endereco.Numero := QEmpNUMERO_EMP.AsString;
     //PrestadorServico.Endereco.Complemento := QEmpcCOMPLEMENTO.AsString;
     PrestadorServico.Endereco.Bairro := QEmpBAI_EMP.AsString;
     PrestadorServico.Endereco.CodigoMunicipio := QEmpCODIGO_MUNICIPIO.AsString;
     PrestadorServico.Endereco.UF := QEmpEST_EMP.AsString;
     PrestadorServico.Endereco.CEP := QEmpCEP_EMP.AsString;
     PrestadorServico.Contato.Telefone := Copy(QEmpTEL_EMP.AsString,1,10);
     //PrestadorServico.Contato.Email := MAIL.AsString;

     if QCliFJ_CLI.AsString = 'F' then
       begin
         Tomador.IdentificacaoTomador.CpfCnpj            := QCliCNPJ_CLI.AsString;
         Tomador.RazaoSocial := QCliNOME_CLI.AsString;
       end
     else
       begin
         Tomador.IdentificacaoTomador.CpfCnpj            := QCliCNPJ_CLI.AsString;
         Tomador.IdentificacaoTomador.InscricaoMunicipal := QCliINSC_ESTADUAL.AsString;
         Tomador.RazaoSocial := QCliNOME_CLI.AsString;
       end;

     Tomador.Endereco.Endereco        := QCliENDRES_CLI.AsString;
     Tomador.Endereco.Numero          := QCliNUMRES_CLI.AsString;
     //Tomador.Endereco.Complemento     := QClicomCOMPLEMENTO.AsString;
     Tomador.Endereco.Bairro          := QCliBAIRES_CLI.AsString;
     Tomador.Endereco.CodigoMunicipio := QCliCODIGO_IBGE.AsString;
     Tomador.Endereco.UF              := QCliESTRES_CLI.AsString;
     Tomador.Endereco.CEP             := QCliCEPRES_CLI.AsString;

     Tomador.Contato.Telefone := Copy(QCliTELRES_CLI.AsString, 1,10);
     Tomador.Contato.Email    := QCliEMAIL_CLI.AsString;

     (* Usando quando houver um intermediario na prestação do serviço
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     *)

     (* Usando quando o serviço for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     *)
    end;

  end;

end;

end.
