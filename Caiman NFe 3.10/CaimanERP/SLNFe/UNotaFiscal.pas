unit UNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Mask, Buttons, 
  StdCtrls, Grids, DBGrids, DB, ShellApi, NxCollection, rxToolEdit, rxCurrEdit, 
  RXCtrls, AdvGlowButton, UDialog, acAlphaImageList, UNovosComponentes, 
  UNovoFormulario, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar,
  System.IOUtils, System.StrUtils, System.Math, System.ImageList;

type
  TFrmNotaFiscal = class(TFrmCadastroNovo)
    PC: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QDadosProd: TFDQuery;
    QBuscaItens: TFDQuery;
    IBSQLNF: TFDQuery;
    IBTRNF: TFDTransaction;
    DSQBuscaItens: TDataSource;
    GB4: TGroupBox;
    Label32: TLabel;
    EdtQuantidade: TEdit;
    Label33: TLabel;
    EdtEspecie: TEdit;
    Label34: TLabel;
    EdtMarca: TEdit;
    Label35: TLabel;
    EdtNum: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    GB5: TGroupBox;
    MemoObs: TMemo;
    QConsCST: TFDQuery;
    GB1: TGroupBox;
    Label1: TLabel;
    EdtCod: TEdit;
    EdtEmissao: TDateTimePicker;
    Label6: TLabel;
    ComboTipo: TComboBox;
    Label3: TLabel;
    EdtNumero: TEdit;
    Label2: TLabel;
    Label9: TLabel;
    EdtCliFor: TEdit;
    Label11: TLabel;
    cod_tra: TEdit;
    BtnConsTra: TsSpeedButton;
    BtnAddTra: TsSpeedButton;
    BtnAddCliFor: TsSpeedButton;
    BtnConsCliFor: TsSpeedButton;
    EdtNomeCliFor: TEdit;
    EdtNomeTra: TEdit;
    Label12: TLabel;
    Label10: TLabel;
    EdtHora: TMaskEdit;
    GB3: TGroupBox;
    DBGrid1: TDBGrid;
    PanelItens: TPanel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label8: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label30: TLabel;
    Label7: TLabel;
    Label31: TLabel;
    EdtValorUnit: TCurrencyEdit;
    EdtQuant: TCurrencyEdit;
    EdtCST: TEdit;
    EdtAliqICMS: TCurrencyEdit;
    EdtTotal: TCurrencyEdit;
    EdtUnidade: TEdit;
    EdtCodPro: TEdit;
    EdtItens: TEdit;
    BtnGrava: TBitBtn;
    BtnNew: TBitBtn;
    BtnExclui: TBitBtn;
    BtnItens: TBitBtn;
    Label38: TLabel;
    EdtEstoque: TCurrencyEdit;
    QConsEstoque: TFDQuery;
    Label39: TLabel;
    ComboCliFor: TComboBox;
    QConsCSTTOTAL: TFloatField;
    QConsCSTCST: TStringField;
    QConsCSTALIQ: TBCDField;
    Label41: TLabel;
    EdtAliqIPI: TCurrencyEdit;
    EdtBCR: TCurrencyEdit;
    Label63: TLabel;
    CheckST: TCheckBox;
    EdtVrAgregado: TCurrencyEdit;
    Label44: TLabel;
    Label45: TLabel;
    EdtCFOP: TEdit;
    Label46: TLabel;
    EdtCodGRP: TEdit;
    BtnConsGRP: TsSpeedButton;
    BtnAddGRP: TsSpeedButton;
    EdtNomeGRP: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    ComboTipoCliente: TComboBox;
    QForaEstado: TFDQuery;
    QForaEstadoCOD_PRO: TIntegerField;
    QForaEstadoESTADO: TStringField;
    QForaEstadoALIQUOTA: TBCDField;
    QForaEstadoCOD_CFO: TIntegerField;
    QForaEstadoVR_AGREGADO: TBCDField;
    Label49: TLabel;
    EdtAliqEstDestino: TCurrencyEdit;
    Label50: TLabel;
    EdtCodTPV: TEdit;
    BtnConsTPV: TsSpeedButton;
    BtnAddTPV: TsSpeedButton;
    EdtNomeTPV: TEdit;
    Label51: TLabel;
    Label52: TLabel;
    EdtSerie: TEdit;
    QItensRegistro: TFDQuery;
    QInsItensRegistroSaida: TFDQuery;
    QInsRegistroSaida: TFDQuery;
    QInsRegistroSaidaCODREG: TIntegerField;
    QBuscaRegistroSaida: TFDQuery;
    QBuscaRegistroSaidaCODIGO: TIntegerField;
    QBuscaRegistroSaidaDATA: TDateField;
    QBuscaRegistroSaidaCNPJ: TStringField;
    QBuscaRegistroSaidaSERIE_NOTA: TStringField;
    QBuscaRegistroSaidaNUMERO_NOTA: TIntegerField;
    QBuscaRegistroSaidaEMITENTE: TStringField;
    QBuscaRegistroSaidaVALOR_TOTAL: TBCDField;
    QBuscaRegistroSaidaSITUACAO: TStringField;
    QBuscaRegistroSaidaCODIGO_EMPRESA: TIntegerField;
    QBuscaRegistroSaidaINSCRICAO: TStringField;
    QBuscaRegistroSaidaUF: TStringField;
    QBuscaRegistroSaidaDESCRICAO: TStringField;
    QBuscaRegistroSaidaCODIGO_SAIDA: TIntegerField;
    Label53: TLabel;
    Label54: TLabel;
    EdtCF: TEdit;
    QForaEstadoCST: TStringField;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    BtnGerarFatura: TButton;
    BtnExcluirFatura: TButton;
    BtnExcluirTodasFaturas: TButton;
    BtnAlterarFatura: TButton;
    Label56: TLabel;
    EdtTotalParcelas: TCurrencyEdit;
    Label57: TLabel;
    EdtAuxTotal: TCurrencyEdit;
    Label58: TLabel;
    EdtDiferenca: TCurrencyEdit;
    QBuscaFatura: TFDQuery;
    IBTRFatura: TFDTransaction;
    QBuscaFaturaCOD_NF: TIntegerField;
    QBuscaFaturaPARCELA: TIntegerField;
    QBuscaFaturaVALOR: TBCDField;
    QBuscaFaturaVENCIMENTO: TDateField;
    DSFatura: TDataSource;
    QAuxFatura: TFDQuery;
    QBuscaFaturaCALC_VENCIMENTO: TStringField;
    PanelFatura: TPanel;
    EdtVenc: TDateTimePicker;
    Label59: TLabel;
    Label60: TLabel;
    EdtValorParcela: TCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    BtnConsVendas: TBitBtn;
    QItensRegistroCOD_CFO: TIntegerField;
    QItensRegistroVALORTOTAL: TBCDField;
    QItensRegistroBASECALCULO: TBCDField;
    QItensRegistroVALORICMS: TBCDField;
    QItensRegistroBASE_ST: TBCDField;
    QItensRegistroVALOR_ST: TBCDField;
    QItensRegistroISENTAS: TBCDField;
    QItensRegistroOUTRAS: TBCDField;
    QItensRegistroVALOR_IPI: TBCDField;
    QItensRegistroALIQ: TBCDField;
    BtnConsCFOP: TsSpeedButton;
    BtnAddCFOP: TsSpeedButton;
    EdtNomeCFOP: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    EdtDataSaida: TDateTimePicker;
    Label24: TLabel;
    QBuscaRegistroSaidaNUMERO_NOTA_FINAL: TIntegerField;
    QBuscaRegistroSaidaCODIGO_MAPA_RESUMO: TIntegerField;
    GroupBox1: TGroupBox;
    EdtModelo: TEdit;
    QBuscaRegistroSaidaCODIFICACAO_FISCAL: TStringField;
    QInsRegistroEntrada: TFDQuery;
    QInsRegistroEntradaCODREG: TIntegerField;
    QInsItensRegistroEntrada: TFDQuery;
    QBuscaRegistroEntrada: TFDQuery;
    QBuscaRegistroEntradaCODIGO: TIntegerField;
    QBuscaRegistroEntradaDATA: TDateField;
    QBuscaRegistroEntradaCNPJ: TStringField;
    QBuscaRegistroEntradaSERIE_NOTA: TStringField;
    QBuscaRegistroEntradaNUMERO_NOTA: TIntegerField;
    QBuscaRegistroEntradaEMITENTE: TStringField;
    QBuscaRegistroEntradaVALOR_TOTAL: TBCDField;
    QBuscaRegistroEntradaSITUACAO: TStringField;
    QBuscaRegistroEntradaCODIGO_EMPRESA: TIntegerField;
    QBuscaRegistroEntradaCODIGO_ENTRADA: TIntegerField;
    QBuscaRegistroEntradaINSCRICAO: TStringField;
    QBuscaRegistroEntradaUF: TStringField;
    QBuscaRegistroEntradaCOD_FOR: TIntegerField;
    QBuscaRegistroEntradaSUB_SERIE: TStringField;
    QBuscaRegistroEntradaCIF_FOB: TIntegerField;
    QBuscaRegistroEntradaCODIFICACAO_FISCAL: TStringField;
    QBuscaRegistroEntradaDESCRICAO: TStringField;
    QInsertNF: TFDQuery;
    QInsertNFCODIGO: TIntegerField;
    QInsertNFNUMERONF: TIntegerField;
    EdtNomeProduto: TEdit;
    EdtPesoBruto: TCurrencyEdit;
    EdtPesoLiquido: TCurrencyEdit;
    TabSheet4: TTabSheet;
    GB2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label40: TLabel;
    EdtBaseICMS: TCurrencyEdit;
    EdtValorICMS: TCurrencyEdit;
    EdtBaseSub: TCurrencyEdit;
    EdtValorSub: TCurrencyEdit;
    EdtTotalProd: TCurrencyEdit;
    EdtFrete: TCurrencyEdit;
    EdtSeguro: TCurrencyEdit;
    EdtDesp: TCurrencyEdit;
    EdtIPI: TCurrencyEdit;
    EdtTotalNF: TCurrencyEdit;
    EdtDesconto: TCurrencyEdit;
    RdgFrete: TRadioGroup;
    RxLabel1: TRxLabel;
    Label29: TLabel;
    edtPis: TCurrencyEdit;
    Label42: TLabel;
    edtCofins: TCurrencyEdit;
    Label43: TLabel;
    edtTotalPIS: TCurrencyEdit;
    Label55: TLabel;
    edtTotalCofins: TCurrencyEdit;
    QGeraParc: TFDQuery;
    ToolButton1: TToolButton;
    BtnFinaliza: TToolButton;
    btnEnvia: TToolButton;
    btnEmail: TToolButton;
    TAB_PRECO: TFDQuery;
    TAB_PRECOCOD: TIntegerField;
    TAB_PRECOCOD_CLIENTE: TIntegerField;
    TAB_PRECOCLIENTE: TStringField;
    TAB_PRECOCOD_BARRA: TStringField;
    TAB_PRECOCOD_PRODUTO: TIntegerField;
    TAB_PRECOPRODUTO: TStringField;
    TAB_PRECOVALOR_VENDA: TBCDField;
    Label61: TLabel;
    edtCSTPis: TEdit;
    Label62: TLabel;
    edtCSTCofins: TEdit;
    Label64: TLabel;
    edtCSOSN: TEdit;
    Label65: TLabel;
    edtCstIPI: TEdit;
    QBuscaReferencia: TFDQuery;
    QBuscaReferenciaCOD_EMP: TIntegerField;
    QBuscaReferenciaCOD_NF: TIntegerField;
    QBuscaReferenciaCHAVE: TStringField;
    grpRefrencias: TGroupBox;
    upBuscaRefrencia: TFDUpdateSQL;
    dsBuscaReferencias: TDataSource;
    Label66: TLabel;
    GridReferencias: TDBGrid;
    gbImpostos: TGroupBox;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_NF: TIntegerField;
    QBuscaItensCST: TStringField;
    QBuscaItensALIQ: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensCOD_GRP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensALIQ_IPI: TBCDField;
    QBuscaItensREDUCAO_ICMS: TBCDField;
    QBuscaItensCOD_CFO: TIntegerField;
    QBuscaItensSUB_TRIBUTARIA: TStringField;
    QBuscaItensVR_AGREGADO: TBCDField;
    QBuscaItensALIQUOTA_FORA_ESTADO: TBCDField;
    QBuscaItensUNIDADE: TStringField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensVALOR_TOTAL: TBCDField;
    QBuscaItensBASE_CALCULO: TBCDField;
    QBuscaItensVALOR_ICMS: TBCDField;
    QBuscaItensBASE_SUBTRIB: TBCDField;
    QBuscaItensVALOR_IPI: TBCDField;
    QBuscaItensVALOR_SUBTRIB: TBCDField;
    QBuscaItensCLASSIFICACAO_FISCAL: TStringField;
    QBuscaItensUNIT: TBCDField;
    QBuscaItensISENTAS: TBCDField;
    QBuscaItensOUTRAS: TBCDField;
    QBuscaItensFRETE: TFloatField;
    QBuscaItensDESCONTO: TFloatField;
    QBuscaItensBC_PIS: TBCDField;
    QBuscaItensALIQ_PIS: TBCDField;
    QBuscaItensVALOR_PIS: TBCDField;
    QBuscaItensBC_COFINS: TBCDField;
    QBuscaItensALIQ_COFINS: TBCDField;
    QBuscaItensVALOR_COFINS: TBCDField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensNF_CANCELADA: TIntegerField;
    QBuscaItensCST_PIS: TStringField;
    QBuscaItensCST_COFINS: TStringField;
    QBuscaItensCSOSN: TStringField;
    QBuscaItensCST_IPI: TStringField;
    QBuscaItensNOME_GRP: TStringField;
    QBuscaItensTIPO_GRP: TStringField;
    QBuscaItensDESTACA_ICMS: TStringField;
    QBuscaItensUSA_CSOSN: TStringField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCOD_NCM: TStringField;
    QBuscaItensORIG: TIntegerField;
    QBuscaItensCST_PIS_1: TStringField;
    QBuscaItensCST_COFINS_1: TStringField;
    QBuscaItensCODIGO_BARRA_PRO: TStringField;
    QBuscaItensDESC_CUPOM: TStringField;
    QBuscaItensALIQ_IBPT_NAC: TBCDField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QBuscaItensTOTAL: TCurrencyField;
    QBuscaItensISENTO_PIS_COFINS_PRO: TStringField;
    procedure BtnConsCliForClick(Sender: TObject);
    procedure BtnAddCliForClick(Sender: TObject);
    procedure EdtCliForEnter(Sender: TObject);
    procedure cod_traEnter(Sender: TObject);
    procedure EdtCliForExit(Sender: TObject);
    procedure EdtCliForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_traExit(Sender: TObject);
    procedure cod_traKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsTraClick(Sender: TObject);
    procedure BtnAddTraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProExit(Sender: TObject);
    procedure Botoes(acao: string);
    procedure LimpaItens;
    procedure BuscaItens;
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    function BuscaOrdem: integer;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFinalizaClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtHoraExit(Sender: TObject);
    procedure MemoObsKeyPress(Sender: TObject; var Key: Char);
    procedure MemoObsChange(Sender: TObject);
    procedure MemoObsEnter(Sender: TObject);
    procedure MemoObsExit(Sender: TObject);
    procedure BuscaTotalCST;
    procedure BtnConsultarClick(Sender: TObject);
    procedure ComboCliForChange(Sender: TObject);
    procedure CheckSTClick(Sender: TObject);
    procedure EdtCFOPExit(Sender: TObject);
    procedure EdtCFOPEnter(Sender: TObject);
    procedure EdtCodGRPEnter(Sender: TObject);
    procedure EdtCodGRPExit(Sender: TObject);
    procedure EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsTPVClick(Sender: TObject);
    procedure EdtCodTPVEnter(Sender: TObject);
    procedure EdtCodTPVExit(Sender: TObject);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAddTPVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnAddGRPClick(Sender: TObject);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure BuscaSintegra(const iCodigoRegistro, iTipo: integer);
    procedure GerarSintegra(const iTipo: integer);
    procedure EdtFreteExit(Sender: TObject);
    procedure QBuscaFaturaCalcFields(DataSet: TDataSet);
    procedure BuscaFatura;
    procedure BtnExcluirTodasFaturasClick(Sender: TObject);
    procedure BtnExcluirFaturaClick(Sender: TObject);
    procedure BtnGerarFaturaClick(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure BtnAlterarFaturaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalculaItens;
    procedure BtnConsVendasClick(Sender: TObject);
    procedure EdtCSTExit(Sender: TObject);
    procedure EdtCliForKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAddCFOPClick(Sender: TObject);
    procedure BtnConsCFOPClick(Sender: TObject);
    procedure EdtModeloExit(Sender: TObject);
    procedure EdtModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function CodigoRegistro(const iTipo: integer): integer;
    procedure DeletaRegistro(const iTipo, iCodRegistro: integer);
    procedure VerificaEstadoFora;
    procedure btnEnviaClick(Sender: TObject);
    procedure EnviaEmail( NFE: Integer );
    procedure VerificaCF;
    procedure btnEmailClick(Sender: TObject);
    procedure QBuscaReferenciaBeforePost(DataSet: TDataSet);
    procedure dsBuscaReferenciasStateChange(Sender: TObject);
    procedure GridReferenciasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboTipoChange(Sender: TObject);
    procedure QBuscaReferenciaAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmNotaFiscal: TFrmNotaFiscal;

implementation

uses
  Udm, Ubibli1, UCadCli, UConsCli, UCadCFOP, UConsCFOP, UConsTransp, UCadTransp,
  UCadProduto, UConsNotaFiscal, UConsVendas, UConsFor, UCadFor, UConsTipoVenda,
  UCadTipoVenda, UCadGICMS, UConsGRP, URegSaidas, UConsProd, UConsModelo,
  URegEntradas, UImprimeNotaFiscal, UConsVendasCF, USendEmail, UNovoPrincipal,
  UPrincipal, UDicTributacao;

var
  bGrava, bGravaItem, bNotaAberta: Boolean;
  iCFOPCupom: integer;
  sSerie: string;
  iTipoFrete: integer;
  sMarca: string;
  sEspecie: string;
  sModeloNF: string;
  bControlaEstoque: Boolean;
  sEstCli, sEstEmp: string;
  chave: String;
{$R *.dfm}

function FrmNotaFiscal: TFrmNotaFiscal;
begin
   Result := TFrmNotaFiscal( BuscaFormulario( TFrmNotaFiscal, False ) );
end;

procedure TFrmNotaFiscal.btnEmailClick(Sender: TObject);
var
  sCaminhoXML, sCaminhoPDF, sEmail: string;
  tempdata: string;
    PDFCCe : string;
begin
  if dm.RetornaStringTabela( 'STATUS_TRANSMITIDA', 'NOTA_FISCAL', 'COD_NF', StrtoInt( EdtCod.Text )) = 'N' then
  begin
    AlertaCad('NFe não transmitida');
    exit;
  end;
  Chave := dm.RetornaStringTabela( 'CHAVE_ACESSO_NFE', 'NOTA_FISCAL', 'COD_NF', StrtoInt( EdtCod.Text ));
  if Chave = '' then
  begin
    AlertaCad('NFe sem chave de acesso');
    exit;
  end;

  if dm.RetornaStringTabela( 'PROTOCOLO_NFE', 'NOTA_FISCAL', 'COD_NF', StrtoInt( EdtCod.Text )) = '' then
  begin
    AlertaCad('NFe sem protocolo');
    exit;
  end;

  iCodigoNfe := StrtoInt( edtCod.Text );

  tempdata := formatdatetime('yyyy', EdtEmissao.Date)
    + formatdatetime('mm', EdtEmissao.Date);
  { verifica se o arquivo xml da nota existe no caminho especificado }
 sCaminhoXMl :=
  tpath.Combine(
  DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
  EdtEmissao.DateTime, sCNPJEmpresa, 55 ) ,
   trim(Chave) + '-nfe.xml' );
  sCaminhoPDF :=  TPath.Combine( dm.ACBrNFeDANFEFR1.PathPDF,
    trim(Chave) + '-nfe.pdf' );

  if not fileexists(sCaminhoXML) then
  begin
      sCaminhoXML := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' + trim
      (Chave) + '-nfe.xml';
        if not fileexists(sCaminhoXML) then
            begin
              AlertaCad('XML da NFe não encontrada');
              exit;
            end;
  end;

  if not fileexists(sCaminhoPDF) then
  begin
    AlertaCad('PDF da NFe não encontrada');
    exit;
  end;
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoXML);
  { verifica se existe email cadastrado no cliente ou fornecedor }
  if not(EdtCliFor.Text = '') then
    sEmail := trim(dm.RetornaStringTabela('email_cli', 'cliente', 'cod_cli',
        StrtoInt( EdtCliFor.Text)))
  else if not(EdtCliFor.Text = '') then
    sEmail := trim(dm.RetornaStringTabela('email_for', 'fornecedor', 'cod_for',
        StrtoInt( EdtCliFor.Text)))
  else
    sEmail := '';

  Application.CreateForm(TFrmSendEmail, FrmSendEmail);
  FrmSendEmail.EdtPara.Text := sEmail;
  FrmSendEmail.LbAnexos.Items.Add(sCaminhoXML);
  FrmSendEmail.LbAnexos.Items.Add(sCaminhoPDF);
  if dm.RetornaStringTabela( 'CORRECAO', 'NOTA_FISCAL', 'COD_NF', StrtoInt( EdtCod.Text )) = 'S' then
     begin
        PDFCCe := dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\PDFsEventos\' +
        chave +
            '-ProcEventoNFe.pdf';
        if not FileExists( PDFCCe ) then
           begin
              KDialog( 'PDF CC-e não encontrado. Sera enviado sem o mesmo!',
              'KNFe - Envio por e-mail', tdtInfo );
           end
        else
           begin
              FrmSendEmail.CCe := True;
              FrmSendEmail.PDFCCe := PDFCCe;
           end;
     end;

  FrmSendEmail.ShowModal;

end;
procedure TFrmNotaFiscal.btnEnviaClick(Sender: TObject);
begin
  if dm.RetornaStringTabela('CHAVE_ACESSO_NFE', 'NOTA_FISCAL', 'COD_NF',
    StrToInt(EdtCod.Text)) <> '' then
  begin
    Application.MessageBox('NF-e ja foi enviada não pode ser alterada!',
      'Atenção', mb_ApplModal + mb_iconexclamation + mb_OK);
    Abort;
    exit;
  end;

  if not(EdtModelo.Text = '55') then
  begin
    Application.MessageBox('Nota precisa ser modelo 55!', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  if bNotaAberta then
  begin
    Application.MessageBox('Nota aberta precisa finalizar!', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  if Application.MessageBox(pchar(
      'Não Esqueça de gerar as faturas antes de Enviar!' + #13 +
        'Enviar a nota fiscal n. ' + EdtNumero.Text + ' ?'), 'Atenção',
    mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
  begin
    iCodigoNfe := StrToInt(EdtCod.Text);
    NotaFiscalEletronica(StrToInt(EdtCod.Text));
  end;
end;

procedure TFrmNotaFiscal.Botoes(acao: string);
begin
  { (N)OVO
    (G)RAVAR
    (C)ANCELAR
    (A)LTERAR
    (E)EXCLUIR
    (P)ESQUISAR/CONSULTAR }

  if (acao = 'N') or (acao = 'A') then
  begin
    GB1.Enabled := true;
    GB2.Enabled := true;
    GB3.Enabled := false;
    GB4.Enabled := false;
    GB5.Enabled := false;
    btnNovo.Enabled := false;
    BtnGravar.Enabled := true;
    btnCancelar.Enabled := true;
    BtnAlterar.Enabled := false;
    if acao = 'N' then
    begin
      Limpaedit(FrmNotaFiscal);
      btnExcluir.Enabled := false
    end
    else
      btnExcluir.Enabled := true;
    BtnConsultar.Enabled := false;
  end
  else
  begin
    if not(acao = 'G') then
      Limpaedit(FrmNotaFiscal);
    GB1.Enabled := false;
    GB2.Enabled := true;
    GB3.Enabled := true;
    GB4.Enabled := true;
    GB5.Enabled := true;
    btnNovo.Enabled := true;
    BtnGravar.Enabled := false;
    btnCancelar.Enabled := false;
    if (acao = 'C') or (acao = 'E') then
    begin
      BtnAlterar.Enabled := false;
      BtnConsultar.Enabled := true;
    end
    else
      BtnAlterar.Enabled := true;
    if acao = 'G' then
      btnExcluir.Enabled := true
    else
      btnExcluir.Enabled := false;
  end;
end;

procedure TFrmNotaFiscal.VerificaEstadoFora;
begin
  sEstEmp := trim(dm.RetornaStringTabela('est_emp', 'empresa', 'cod_emp',
      iEmp));

  if ComboCliFor.ItemIndex = 0 then
    sEstCli := trim(dm.RetornaStringTabela('estres_cli', 'cliente', 'cod_cli',
        StrToInt(EdtCliFor.Text)))
  else
    sEstCli := trim(dm.RetornaStringTabela('est_for', 'fornecedor', 'cod_for',
        StrToInt(EdtCliFor.Text)));

  if trim(sEstCli) = trim(sEstEmp) then
    bNoEstado := true
  else
    bNoEstado := false;
end;

function TFrmNotaFiscal.CodigoRegistro(const iTipo: integer): integer;
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

        case iTipo of
          0:
            sql.Add('SELECT CODIGO ' + 'FROM REGISTRO_LIVRO_SAIDAS ' +
                'WHERE CODIGO_SAIDA = :COD');

          1:
            sql.Add('SELECT CODIGO ' + 'FROM REGISTRO_LIVRO_ENTRADAS ' +
                'WHERE CODIGO_NOTA_FISCAL = :COD');
        end;

        Parambyname('cod').AsInteger := StrToInt(EdtCod.Text);
        open;
        result := fieldbyname('codigo').AsInteger;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      result := 0;
      AlertaCad('Erro ao verificar o Registro de Saídas/Entrada');
    end;
  finally
    dm.QConsulta.close;
  end;
end;

procedure TFrmNotaFiscal.DeletaRegistro(const iTipo, iCodRegistro: integer);
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

        case iTipo of
          0:
            sql.Add('DELETE FROM REGISTRO_LIVRO_SAIDAS ' +
                'WHERE CODIGO = :COD');

          1:
            sql.Add('DELETE FROM REGISTRO_LIVRO_ENTRADAS ' +
                'WHERE CODIGO = :COD');
        end;

        Parambyname('cod').AsInteger := iCodRegistro;
        ExecOrOpen;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao excluir o Registro');
    end;
  finally
    dm.QConsulta.close;
  end;
end;

procedure TFrmNotaFiscal.dsBuscaReferenciasStateChange(Sender: TObject);
begin
  inherited;
  if (dsBuscaReferencias.State in [ dsInsert, dsEdit ])
  and ( trim( EdtCod.Text ) = '' ) then
     begin
       QBuscaReferencia.Cancel;
       KDialog( 'É necessário salvar o cabeçalho da nota antes de referenciar Notas',
       'Emissão de Nota Fiscal', tdtInfo );
     end;

end;

procedure TFrmNotaFiscal.CalculaItens;
var
  cAuxiTotal: currency;
  cAuxiTotalProd: currency;
  cAuxiBaseICMS: currency;
  cAuxiValorICMS: currency;
  cAuxiValorPIS: currency;
  cAuxiBasePIS: currency;
  cAuxiValorCOFINS: currency;
  cAuxiBaseCOFINS: currency;
  cAuxiBaseSubTrib: currency;
  cAuxiValorSubTrib: currency;
  cAuxiValorIPI: currency;
  cAuxiDesconto: currency;
  cAuxiTxDesconto: currency;
  cAuxiAliquotaICMS: currency;
  frete, calc_frete, desconto, calc_desconto: Double;
begin
  cAuxiTxDesconto := 0;
  cAuxiTotal := 0;
  if EdtFrete.Text <> '' then
  begin
    frete := StrToFloat(EdtFrete.Text);
    calc_frete := frete / (QBuscaItens.RecordCount);
  end;
  if EdtDesconto.Text <> '' then
  begin
    desconto := StrToFloat(EdtDesconto.Text);
    calc_desconto := desconto / (QBuscaItens.RecordCount);
  end;
  { busca a taxa do desconto }
  if strtocurr(EdtDesconto.Text) > 0 then
  begin
    with QBuscaItens do
    begin
      First;
      while not eof do
      begin
        cAuxiTotal := cAuxiTotal +
          (QBuscaItensQUANT.AsCurrency * QBuscaItensUNIT.AsCurrency);
        next;
      end;
    end;
    cAuxiTxDesconto := ((strtocurr(EdtDesconto.Text) * 100) / cAuxiTotal);
  end
  else
    cAuxiTxDesconto := 0;

  with QBuscaItens do
  begin
    First;
    while not eof do
    begin
      cAuxiTotal := 0;
      cAuxiTotalProd := 0;
      cAuxiBaseICMS := 0;
      cAuxiValorICMS := 0;
      cAuxiBaseSubTrib := 0;
      cAuxiValorSubTrib := 0;
      cAuxiValorIPI := 0;
      cAuxiDesconto := 0;
      cAuxiValorPIS := 0;
      cAuxiValorCOFINS := 0;
      cAuxiBasePIS := 0;
      cAuxiBaseCOFINS := 0;
      cAuxiAliquotaICMS := QBuscaItensALIQ.AsCurrency;

      { calcula o Total dos produtos }
      cAuxiTotalProd := QBuscaItensQUANT.AsCurrency *
        QBuscaItensUNIT.AsCurrency;

      { calcula o Desconto }
      if cAuxiTxDesconto > 0 then
      begin
        cAuxiDesconto := (cAuxiTotalProd * cAuxiTxDesconto) / 100;
        cAuxiTotalProd := cAuxiTotalProd - cAuxiDesconto;
      end;

      { calcula a base e o valor do icms }
      if trim(dm.RetornaStringTabela('destaca_icms', 'cfop', 'cod_cfo',
          QBuscaItensCOD_CFO.AsInteger)) = 'S' then
      begin
        if QBuscaItensALIQ.AsCurrency > 0 then
        begin
          if QBuscaItensREDUCAO_ICMS.AsCurrency > 0 then
          begin
            cAuxiBaseICMS := cAuxiTotalProd -
              ((cAuxiTotalProd * QBuscaItensREDUCAO_ICMS.AsCurrency) / 100);
            cAuxiValorICMS := ((cAuxiBaseICMS * QBuscaItensALIQ.AsCurrency)
                / 100);
          end
          else
          begin
            cAuxiBaseICMS := cAuxiTotalProd;
            cAuxiValorICMS := ((cAuxiTotalProd * QBuscaItensALIQ.AsCurrency)
                / 100);
          end;
        end;
      end
      else
      begin
        cAuxiBaseICMS := 0;
        cAuxiValorICMS := 0;
        cAuxiAliquotaICMS := 0;
      end;

      { calcula a base e o valor da sub.tributaria }
      if trim(QBuscaItensSUB_TRIBUTARIA.AsString) = 'S' then
      begin
        if QBuscaItensALIQUOTA_FORA_ESTADO.AsCurrency > 0 then
        begin
          cAuxiBaseSubTrib := cAuxiBaseICMS +
            ((cAuxiBaseICMS * QBuscaItensVR_AGREGADO.AsCurrency) / 100);
          cAuxiValorSubTrib := ((cAuxiBaseSubTrib *
                QBuscaItensALIQUOTA_FORA_ESTADO.AsCurrency) / 100)
            - cAuxiValorICMS;
        end
        else
        begin
          cAuxiBaseSubTrib := cAuxiBaseICMS +
            ((cAuxiBaseICMS * QBuscaItensVR_AGREGADO.AsCurrency) / 100);
          cAuxiValorSubTrib := ((cAuxiBaseSubTrib * QBuscaItensALIQ.AsCurrency)
              / 100) - cAuxiValorICMS;
        end;
      end;

      { calcula o valor do ipi }
      if QBuscaItensALIQ_IPI.AsCurrency > 0 then
        cAuxiValorIPI := ((cAuxiTotalProd * QBuscaItensALIQ_IPI.AsCurrency)
            / 100);

      if QBuscaItensISENTO_PIS_COFINS_PRO.AsString <> 'S' then
      if QBuscaItensALIQ_PIS.AsCurrency > 0 then
      begin
        cAuxiBasePIS := cAuxiTotalProd;
        cAuxiBaseCOFINS := cAuxiTotalProd;
        cAuxiValorPIS := (cAuxiTotalProd * QBuscaItensALIQ_PIS.AsCurrency) / 100;
        cAuxiValorCOFINS := (cAuxiTotalProd * QBuscaItensALIQ_COFINS.AsCurrency)
          / 100;
      end;

      { calcula o total geral do produto }
      cAuxiTotal := (cAuxiTotalProd + cAuxiValorIPI + cAuxiValorSubTrib);

      { gravando os dados nos itens da nota fiscal }
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      try
        try
          dm.QConsulta.close;
          dm.QConsulta.sql.Clear;
          dm.QConsulta.sql.Text := 'UPDATE ITENS_NOTA_FISCAL SET ' +
            'VALOR_TOTAL   = :1,  ' + 'BASE_CALCULO  = :2,  ' +
            'VALOR_ICMS    = :3,  ' + 'BASE_SUBTRIB  = :4,  ' +
            'VALOR_SUBTRIB = :5,  ' + 'VALOR_IPI     = :6,  ' +
            'ISENTAS       = :7,  ' + 'OUTRAS        = :8,  ' +
            'ALIQ          = :9,   ' + 'FRETE         = :20,  ' +
            'BC_PIS = :BC_PIS, VALOR_PIS=:VALOR_PIS,' +
            'BC_COFINS = :BC_COFINS, VALOR_COFINS=:VALOR_COFINS,' +
            'DESCONTO      = :21  ' + 'WHERE ORDEM   = :10 AND COD_NF = :11';

          dm.QConsulta.Parambyname('BC_PIS').AsCurrency := RoundTo( cAuxiBasePIS, -2 );
          dm.QConsulta.Parambyname('VALOR_PIS').AsCurrency := RoundTo( cAuxiValorPIS, -2 );
          dm.QConsulta.Parambyname('BC_COFINS').AsCurrency := RoundTo( cAuxiBaseCOFINS, -2 );
          dm.QConsulta.Parambyname('VALOR_COFINS').AsCurrency := RoundTo( cAuxiValorCOFINS, -2 );

          dm.QConsulta.Parambyname('1').AsCurrency := RoundTo( cAuxiTotal, -2 );
          dm.QConsulta.Parambyname('2').AsCurrency := RoundTo( cAuxiBaseICMS, -2 );
          dm.QConsulta.Parambyname('3').AsCurrency := RoundTo( cAuxiValorICMS, -2 );
          dm.QConsulta.Parambyname('4').AsCurrency := RoundTo( cAuxiBaseSubTrib, -2 );
          dm.QConsulta.Parambyname('5').AsCurrency := RoundTo( cAuxiValorSubTrib, -2 );
          dm.QConsulta.Parambyname('6').AsCurrency := RoundTo( cAuxiValorIPI, -2 );
          dm.QConsulta.Parambyname('20').AsCurrency := RoundTo( calc_frete, -2 );
          dm.QConsulta.Parambyname('21').AsCurrency := RoundTo( calc_desconto, -2 );

          if trim(QBuscaItensTIPO_GRP.AsString) = 'ISE' then
            dm.QConsulta.Parambyname('7').AsCurrency := RoundTo( cAuxiTotal, -2 )
          else
            dm.QConsulta.Parambyname('7').AsCurrency := 0;

          if (trim(QBuscaItensTIPO_GRP.AsString) = 'ST') or
            (trim(QBuscaItensTIPO_GRP.AsString) = 'NT') or
            (trim(QBuscaItensTIPO_GRP.AsString) = 'SN') or
            (trim(QBuscaItensTIPO_GRP.AsString) = 'OUT') then
            dm.QConsulta.Parambyname('8').AsCurrency := RoundTo( cAuxiTotal, -2 )
          else
            dm.QConsulta.Parambyname('8').AsCurrency := 0;
          dm.QConsulta.Parambyname('9').AsCurrency := RoundTo( cAuxiAliquotaICMS, -2 );

          dm.QConsulta.Parambyname('10').AsInteger :=
            QBuscaItensORDEM.AsInteger;
          dm.QConsulta.Parambyname('11').AsInteger :=
            QBuscaItensCOD_NF.AsInteger;
          dm.QConsulta.ExecOrOpen;
        except
          dm.IBTransaction.Rollback;
          AlertaCad('Erro ao atualizar os itens da nota fiscal');
        end;
      finally
        dm.QConsulta.close;
      end;
      next;
    end;
  end;
  BuscaItens;
end;

procedure TFrmNotaFiscal.BuscaFatura;
var
  iAuxTotal: currency;
begin
  iAuxTotal := 0;
  if IBTRFatura.Active then
    IBTRFatura.Commit;
  IBTRFatura.StartTransaction;
  with QBuscaFatura do
  begin
    close;
    Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
    open;
    while not eof do
    begin
      iAuxTotal := iAuxTotal + QBuscaFaturaVALOR.AsCurrency;
      next;
    end;
  end;
  EdtTotalParcelas.Text := currtostr(iAuxTotal);
  EdtDiferenca.Text := currtostr(strtocurr(EdtAuxTotal.Text) - strtocurr
      (EdtTotalParcelas.Text));
end;

procedure TFrmNotaFiscal.BuscaSintegra(const iCodigoRegistro, iTipo: integer);
begin
  case iTipo of
    0:
      begin
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        with QBuscaRegistroSaida do
        begin
          close;
          Parambyname('cod').AsInteger := iCodigoRegistro;
          open;
          Application.CreateForm(TFrmRegSaidas, FrmRegSaidas);
          FrmRegSaidas.tag := 1;
          FrmRegSaidas.EdtCod.Text := QBuscaRegistroSaidaCODIGO.AsString;
          FrmRegSaidas.EdtData.Text := QBuscaRegistroSaidaDATA.AsString;
          FrmRegSaidas.EdtNFInicial.Text :=
            QBuscaRegistroSaidaNUMERO_NOTA.AsString;
          FrmRegSaidas.EdtCodModelo.Text :=
            QBuscaRegistroSaidaCODIFICACAO_FISCAL.AsString;
          FrmRegSaidas.EdtNomeModelo.Text :=
            QBuscaRegistroSaidaDESCRICAO.AsString;
          FrmRegSaidas.EdtSerie.Text := QBuscaRegistroSaidaSERIE_NOTA.AsString;
          FrmRegSaidas.EdtCNPJ.Text := QBuscaRegistroSaidaCNPJ.AsString;
          FrmRegSaidas.EdtNome.Text := EdtNomeCliFor.Text;
          FrmRegSaidas.EdtInscricao.Text :=
            QBuscaRegistroSaidaINSCRICAO.AsString;
          FrmRegSaidas.EdtUF.Text := QBuscaRegistroSaidaUF.AsString;
          FrmRegSaidas.EdtTotalNF.Text :=
            QBuscaRegistroSaidaVALOR_TOTAL.AsString;
          if QBuscaRegistroSaidaEMITENTE.AsString = 'P' then
            FrmRegSaidas.ComboEmitente.ItemIndex := 0
          else
            FrmRegSaidas.ComboEmitente.ItemIndex := 1;
          if QBuscaRegistroSaidaSITUACAO.AsString = 'N' then
            FrmRegSaidas.ComboSituacao.ItemIndex := 0
          else
            FrmRegSaidas.ComboSituacao.ItemIndex := 1;
        end;
        dm.IBTransaction.Commit;
        QBuscaRegistroSaida.close;

        FrmRegSaidas.BuscaItens;
        FrmRegSaidas.ShowModal;
      end;
    1:
      begin
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        with QBuscaRegistroEntrada do
        begin
          close;
          Parambyname('cod').AsInteger := iCodigoRegistro;
          open;
          Application.CreateForm(TFrmRegEntradas, FrmRegEntradas);
          FrmRegEntradas.tag := 1;
          FrmRegEntradas.EdtCod.Text := QBuscaRegistroEntradaCODIGO.AsString;
          FrmRegEntradas.EdtData.Text := QBuscaRegistroEntradaDATA.AsString;
          FrmRegEntradas.EdtNumNF.Text :=
            QBuscaRegistroEntradaNUMERO_NOTA.AsString;
          FrmRegEntradas.EdtCodModelo.Text :=
            QBuscaRegistroEntradaCODIFICACAO_FISCAL.AsString;
          FrmRegEntradas.EdtNomeModelo.Text :=
            QBuscaRegistroEntradaDESCRICAO.AsString;
          FrmRegEntradas.EdtSerie.Text :=
            QBuscaRegistroEntradaSERIE_NOTA.AsString;
          FrmRegEntradas.EdtCNPJ.Text := QBuscaRegistroEntradaCNPJ.AsString;
          FrmRegEntradas.EdtCodFor.Text :=
            QBuscaRegistroEntradaCOD_FOR.AsString;
          FrmRegEntradas.EdtNomeFor.Text := trim(EdtNomeCliFor.Text);
          FrmRegEntradas.EdtInscricao.Text :=
            QBuscaRegistroEntradaINSCRICAO.AsString;
          FrmRegEntradas.EdtUF.Text := QBuscaRegistroEntradaUF.AsString;
          FrmRegEntradas.EdtTotalNF.Text :=
            QBuscaRegistroEntradaVALOR_TOTAL.AsString;
          if QBuscaRegistroEntradaEMITENTE.AsString = 'P' then
            FrmRegEntradas.ComboEmitente.ItemIndex := 0
          else
            FrmRegEntradas.ComboEmitente.ItemIndex := 1;
          if QBuscaRegistroEntradaSITUACAO.AsString = 'N' then
            FrmRegEntradas.ComboSituacao.ItemIndex := 0
          else
            FrmRegEntradas.ComboSituacao.ItemIndex := 1;
        end;
        dm.IBTransaction.Commit;
        QBuscaRegistroEntrada.close;

        FrmRegEntradas.BuscaItens;
        FrmRegEntradas.ShowModal;
      end;
  end;
end;

procedure TFrmNotaFiscal.GerarSintegra(const iTipo: integer);
var
  sAuxCNPJ, sAuxInsc, sAuxUF, sEstEmp, sEstCli, teste: string;
  iAux: integer;
  iCFOPCupom: integer;
  iCodReg: integer;
  cTaxaFrete: currency;
  cValorFrete: currency;
begin
  iCodReg := 0;
  sAuxCNPJ := '';
  sAuxInsc := '';
  sAuxUF := '';
  cTaxaFrete := 0;
  cValorFrete := 0;

  { busca as Taxas }
  if strtocurr(EdtFrete.Text) > 0 then
    cTaxaFrete := (strtocurr(EdtFrete.Text) * 100) /
      (strtocurr(EdtTotalProd.Text) + strtocurr(EdtDesconto.Text))
  else
    cTaxaFrete := 0;

  { busca os dados do cliente/fornecedor }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
      begin
        close;
        sql.Clear;
        if ComboCliFor.ItemIndex = 0 then
        begin
          sql.Add('SELECT CNPJ_CLI, DOC_CLI, ESTRES_CLI, FJ_CLI ' +
              'FROM CLIENTE ' + 'WHERE COD_CLI = :COD');
          Parambyname('cod').AsInteger := StrToInt(EdtCliFor.Text);
          open;
          sAuxCNPJ := RetiraCaracter(fieldbyname('cnpj_cli').AsString);
          if (fieldbyname('doc_cli').AsString = '') or
            (fieldbyname('fj_cli').AsString = 'F') then
            sAuxInsc := 'ISENTO'
          else
            sAuxInsc := RetiraCaracter(fieldbyname('doc_cli').AsString);
          sAuxUF := fieldbyname('estres_cli').AsString;
        end
        else
        begin
          sql.Add('SELECT CNPJ_FOR, INSC_FOR, EST_FOR ' + 'FROM FORNECEDOR ' +
              'WHERE COD_FOR = :COD');
          Parambyname('cod').AsInteger := StrToInt(EdtCliFor.Text);
          open;
          sAuxCNPJ := RetiraCaracter(fieldbyname('cnpj_for').AsString);
          if fieldbyname('insc_for').AsString = '' then
            sAuxInsc := 'ISENTO'
          else
            sAuxInsc := RetiraCaracter(fieldbyname('insc_for').AsString);
          sAuxUF := fieldbyname('est_for').AsString;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad(
        'Erro ao buscar os dados do cliente/fornecedor para gerar o sintegra');
    end;
  finally
    dm.QConsulta.close;
  end;

  case iTipo of
    0:
      begin
        { gravando na tabela registro_livro_saidas }
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with QInsRegistroSaida do
            begin
              close;
              Params[0].AsDate := EdtEmissao.Date;
              Params[1].AsString := trim(sAuxCNPJ);
              Params[2].AsString := trim(EdtModelo.Text);
              if EdtSerie.Text = '' then
                Params[3].Value := null
              else
                Params[3].AsString := trim(EdtSerie.Text);
              Params[4].AsInteger := StrToInt(EdtNumero.Text);
              Params[5].AsString := 'P';
              if FrmNotaFiscal.ComboTipo.ItemIndex = 1 then
                Params[6].AsCurrency := 0
              else
                Params[6].AsCurrency := strtocurr(EdtTotalNF.Text);
              Params[7].AsString := 'N';
              Params[8].AsInteger := iEmp;
              Params[9].AsInteger := StrToInt(EdtCod.Text);
              Params[10].AsString := trim(sAuxUF);
              Params[11].AsString := trim(sAuxInsc);
              Params[12].AsInteger := StrToInt(EdtNumero.Text);
              Params[13].Value := null;
              open;
              iCodReg := QInsRegistroSaidaCODREG.AsInteger;
            end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao gravar na tabela registro_livro_saídas');
          end;
        finally
          QInsRegistroSaida.close;
        end;

        { gravando na tabela itens_registro_livro_saidas }
        if ComboTipo.ItemIndex = 1 then
        begin
          { busca o CFOP }
          sEstEmp := trim(dm.RetornaStringTabela('est_emp', 'empresa',
              'cod_emp', iEmp));
          if ComboCliFor.ItemIndex = 0 then
            sEstCli := trim(dm.RetornaStringTabela('estres_cli', 'cliente',
                'cod_cli', StrToInt(EdtCliFor.Text)))
          else
            sEstCli := trim(dm.RetornaStringTabela('est_for', 'fornecedor',
                'cod_for', StrToInt(EdtCliFor.Text)));

          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Text :=
              'SELECT CFOP_CUPOM_ESTADO, CFOP_CUPOM_FORA ' +
              'FROM PARAMETROS ' + 'WHERE COD_EMP = :CODEMP';
            Parambyname('codemp').AsInteger := iEmp;
            open;
            if sEstEmp = sEstCli then
              iCFOPCupom := fieldbyname('cfop_cupom_estado').AsInteger
            else
              iCFOPCupom := fieldbyname('cfop_cupom_fora').AsInteger;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          QInsItensRegistroSaida.close;
          QInsItensRegistroSaida.Parambyname('1').AsInteger := iCodReg;
          QInsItensRegistroSaida.Parambyname('2').AsInteger := 1;
          QInsItensRegistroSaida.Parambyname('3').AsInteger := iCFOPCupom;
          QInsItensRegistroSaida.Parambyname('4').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('5').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('6').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('7').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('8').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('9').AsInteger := iEmp;
          // QInsItensRegistroSaida.ParamByName('10').AsCurrency  := strtocurr(EdtTotalNF.Text);
          QInsItensRegistroSaida.Parambyname('10').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('11').AsCurrency := 0;
          QInsItensRegistroSaida.Parambyname('12').AsCurrency := 0;
          QInsItensRegistroSaida.ExecOrOpen;
          dm.IBTRAux.Commit;
          QInsItensRegistroSaida.close;
        end
        else
        begin
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with QItensRegistro do
          begin
            iAux := 0;
            close;
            Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
            open;
            First;
            while not eof do
            begin
              inc(iAux);
              if dm.IBTRAux.Active then
                dm.IBTRAux.Commit;
              dm.IBTRAux.StartTransaction;
              QInsItensRegistroSaida.close;
              QInsItensRegistroSaida.Parambyname('1').AsInteger := iCodReg;
              QInsItensRegistroSaida.Parambyname('2').AsInteger := iAux;
              QInsItensRegistroSaida.Parambyname('3').AsInteger :=
                QItensRegistroCOD_CFO.AsInteger;

              if iTipoEmp = 1 then
              begin
                QInsItensRegistroSaida.Parambyname('4').AsCurrency :=
                  QItensRegistroBASECALCULO.AsCurrency;
                QInsItensRegistroSaida.Parambyname('5').AsCurrency :=
                  QItensRegistroVALORICMS.AsCurrency;
                QInsItensRegistroSaida.Parambyname('8').AsCurrency :=
                  QItensRegistroALIQ.AsCurrency;
              end
              else
              begin
                { QInsItensRegistroSaida.ParamByName('4').AsCurrency := QItensRegistroVALORTOTAL.AsCurrency - QItensRegistroISENTAS.AsCurrency - QItensRegistroOUTRAS.AsCurrency;
                  QInsItensRegistroSaida.ParamByName('5').AsCurrency := 0;
                  QInsItensRegistroSaida.ParamByName('8').AsCurrency := 0; }
                QInsItensRegistroSaida.Parambyname('4').AsCurrency :=
                  QItensRegistroBASECALCULO.AsCurrency;
                QInsItensRegistroSaida.Parambyname('5').AsCurrency :=
                  QItensRegistroVALORICMS.AsCurrency;
                QInsItensRegistroSaida.Parambyname('8').AsCurrency :=
                  QItensRegistroALIQ.AsCurrency;

              end;

              QInsItensRegistroSaida.Parambyname('6').AsCurrency :=
                QItensRegistroISENTAS.AsCurrency;
              QInsItensRegistroSaida.Parambyname('7').AsCurrency :=
                QItensRegistroOUTRAS.AsCurrency;

              QInsItensRegistroSaida.Parambyname('9').AsInteger := iEmp;

              { calculando o valor do frete }
              cValorFrete := (QItensRegistroVALORTOTAL.AsCurrency * cTaxaFrete)
                / 100;

              QInsItensRegistroSaida.Parambyname('10').AsCurrency :=
                QItensRegistroVALORTOTAL.AsCurrency + cValorFrete;
              QInsItensRegistroSaida.Parambyname('11').AsCurrency := 0;
              QInsItensRegistroSaida.Parambyname('12').AsCurrency := 0;

              QInsItensRegistroSaida.ExecOrOpen;
              dm.IBTRAux.Commit;
              QInsItensRegistroSaida.close;
              next;
            end;
          end;
          dm.IBTransaction.Commit;
          QItensRegistro.close;
        end;
      end;

    1:
      begin
        { gravando na tabela registro_livro_entradas }
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with QInsRegistroEntrada do
            begin
              close;
              Params[0].AsDate := EdtEmissao.Date;
              Params[1].AsInteger := StrToInt(EdtCliFor.Text);
              Params[2].AsString := trim(sAuxCNPJ);
              Params[3].AsString := trim(EdtModelo.Text);
              if EdtSerie.Text = '' then
                Params[4].Value := null
              else
                Params[4].AsString := trim(EdtSerie.Text);
              Params[5].AsInteger := StrToInt(EdtNumero.Text);
              Params[6].AsString := 'P';
              Params[7].AsCurrency := strtocurr(EdtTotalNF.Text);
              Params[8].AsString := 'N';
              Params[9].AsInteger := iEmp;
              Params[10].Value := null;
              Params[11].AsString := trim(sAuxUF);
              Params[12].AsString := trim(sAuxInsc);
              Params[13].Value := null;
              Params[14].Value := null;
              Params[15].AsInteger := StrToInt(EdtCod.Text);
              teste := Params[3].AsString;
              teste := sql.Text;
              open;
              iCodReg := QInsRegistroEntradaCODREG.AsInteger;
            end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao gravar na tabela registro_livro_entradas');
          end;
        finally
          QInsRegistroEntrada.close;
        end;

        { gravando na tabela itens_registro_livro_entradas }
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        with QItensRegistro do
        begin
          iAux := 0;
          close;
          Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
          open;
          First;
          while not eof do
          begin
            inc(iAux);
            if dm.IBTRAux.Active then
              dm.IBTRAux.Commit;
            dm.IBTRAux.StartTransaction;
            QInsItensRegistroEntrada.close;
            QInsItensRegistroEntrada.Parambyname('1').AsInteger := iCodReg;
            QInsItensRegistroEntrada.Parambyname('2').AsInteger := iAux;
            QInsItensRegistroEntrada.Parambyname('3').AsInteger :=
              QItensRegistroCOD_CFO.AsInteger;
            QInsItensRegistroEntrada.Parambyname('4').AsCurrency :=
              QItensRegistroBASECALCULO.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('5').AsCurrency :=
              QItensRegistroVALORICMS.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('6').AsCurrency :=
              QItensRegistroISENTAS.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('7').AsCurrency :=
              QItensRegistroOUTRAS.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('8').AsCurrency :=
              QItensRegistroALIQ.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('9').AsInteger := iEmp;
            QInsItensRegistroEntrada.Parambyname('10').AsCurrency :=
              QItensRegistroVALORTOTAL.AsCurrency;
            QInsItensRegistroEntrada.Parambyname('11').AsCurrency := 0;
            QInsItensRegistroEntrada.Parambyname('12').AsCurrency := 0;

            QInsItensRegistroEntrada.ExecOrOpen;
            dm.IBTRAux.Commit;
            QInsItensRegistroEntrada.close;
            next;
          end;
        end;
        dm.IBTransaction.Commit;
        QItensRegistro.close;
      end;
  end;
  BuscaSintegra(iCodReg, iTipo);
end;

procedure TFrmNotaFiscal.GridReferenciasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key  of
     vk_f2: begin
                 Application.CreateForm(TFrmConsNotaFiscal, FrmConsNotaFiscal);
                  FrmConsNotaFiscal.tag := 2;
                  FrmConsNotaFiscal.ShowModal;
                   Key := 0;
            end;
     VK_DELETE: begin
                   if QBuscaReferenciaCOD_NF.IsNull then
                      Exit;
                   if KDialog( 'Tem certeza que deseja excluir esta nota?',
                   'Emissão de Nota Fiscal', tdtPergunta ) then
                      QBuscaReferencia.Delete;
                   IBTRNF.CommitRetaining;
                end;
     VK_RETURN: begin
                   if QBuscaReferencia.State in [ dsInsert, dsEdit ] then
                      QBuscaReferencia.Post;
                end;
  end;


end;

procedure TFrmNotaFiscal.BuscaTotalCST;
var
  sAux: string;
begin
  sAux := '';
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsCST do
  begin
    close;
    Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
    open;
    First;
    MemoObs.Clear;
    while not eof do
    begin
      sAux := 'CST ' + QConsCSTCST.AsString + '   ' + FormataStringD
        (currtostrf(QConsCSTTOTAL.AsCurrency, ffnumber, 2), '10', ' ');
      if QConsCSTALIQ.AsCurrency > 0 then
        sAux := sAux + FormataStringD
          (currtostrf((QConsCSTTOTAL.AsCurrency * QConsCSTALIQ.AsCurrency)
              / 100, ffnumber, 2), '10', ' ');
      MemoObs.Lines.Add(sAux);
      next;
    end;
  end;

  dm.IBTransaction.Commit;
  QConsCST.close;
end;

procedure TFrmNotaFiscal.BuscaItens;
var
  cTotal, cTotalBaseICMS, cTotalIcms, cTotalBaseSub, cTotalICMSSub, cTotalIPI,
    cTotalQuant, cTotalPIS, cTotalCOFINS: currency;
  bSomarItens: Boolean;
begin
  cTotal := 0;
  cTotalBaseICMS := 0;
  cTotalIcms := 0;
  cTotalBaseSub := 0;
  cTotalICMSSub := 0;
  cTotalIPI := 0;
  cTotalQuant := 0;
  cTotalPIS := 0;
  cTotalCOFINS := 0;

  { VERIFICA SE VAI SOMAR A QTD DO ITENS }
  if dm.RetornaStringTabela('somar_qtd_itens_nf', 'parametros', 'cod_emp',
    iEmp) = 'S' then
    bSomarItens := true
  else
    bSomarItens := false;

  if IBTRNF.Active then
    IBTRNF.Commit;
  IBTRNF.StartTransaction;
  with QBuscaItens do
  begin
    close;
    Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
    ParamByName('uf').AsString := ifthen( sEstCli <> '', sEstCli, sEstEmp );
    open;
    First;
    while not eof do
    begin
      cTotal := cTotal + QBuscaItensTOTAL.AsCurrency;

      // SOMAR A QTD DOS ITENS
      if bSomarItens then
        cTotalQuant := cTotalQuant + QBuscaItensQUANT.AsCurrency;

      // SOMA AS BASES, ICMS e IPI
      cTotalBaseICMS := cTotalBaseICMS + QBuscaItensBASE_CALCULO.AsCurrency;
      cTotalIcms := cTotalIcms + QBuscaItensVALOR_ICMS.AsCurrency;
      cTotalBaseSub := cTotalBaseSub + QBuscaItensBASE_SUBTRIB.AsCurrency;
      cTotalICMSSub := cTotalICMSSub + QBuscaItensVALOR_SUBTRIB.AsCurrency;
      cTotalIPI := cTotalIPI + QBuscaItensVALOR_IPI.AsCurrency;
      cTotalPIS := cTotalPIS + QBuscaItensVALOR_PIS.AsCurrency;
      cTotalCOFINS := cTotalCOFINS + QBuscaItensVALOR_COFINS.AsCurrency;
      next;
    end;
    EdtTotalProd.Text := currtostr( RoundTo( cTotal, -2 ) );
    EdtTotalNF.Text := currtostr( RoundTo( cTotal + cTotalIPI + cTotalICMSSub - strtocurr
        (EdtDesconto.Text) + strtocurr(EdtFrete.Text) + strtocurr
        (EdtSeguro.Text) + strtocurr(EdtDesp.Text), -2 ));

    EdtBaseICMS.Text := currtostr(RoundTo( cTotalBaseICMS, -2 ));
    EdtValorICMS.Text := currtostr(RoundTo( cTotalIcms, -2 ));
    EdtBaseSub.Text := currtostr(RoundTo( cTotalBaseSub, -2 ));
    EdtValorSub.Text := currtostr(RoundTo( cTotalICMSSub, -2 ));
    EdtIPI.Text := currtostr(RoundTo( cTotalIPI, -2 ));
    edtTotalPIS.Value := RoundTo( cTotalPIS, -2 );
    edtTotalCofins.Value := RoundTo( cTotalCOFINS, -2 );
    if cTotalQuant > 0 then
      EdtQuantidade.Text := currtostr(RoundTo( cTotalQuant, -2 ));
  end;
  IBTRNF.CommitRetaining;

  { BUSCA NOSTAS REFRENCIA }
  if EdtCod.Text <> '' then
     begin
        QBuscaReferencia.Close;
        QBuscaReferencia.ParamByName( 'COD_NF' ).AsString := EdtCod.Text;
        QBuscaReferencia.ParamByName( 'COD_EMP'  ).AsInteger := iEmp;
        QBuscaReferencia.Open;
     end;
end;

procedure TFrmNotaFiscal.LimpaItens;
begin
  EdtItens.Text := inttostr(BuscaOrdem);
  EdtCodPro.Clear;
  EdtNomeProduto.Clear;
  EdtQuant.Clear;
  EdtValorUnit.Clear;
  EdtUnidade.Clear;
  EdtCST.Clear;
  EdtAliqICMS.Clear;
  EdtAliqIPI.Clear;
  EdtTotal.Clear;
  EdtBCR.Clear;
  EdtVrAgregado.Clear;
  EdtCFOP.Clear;
  EdtNomeCFOP.Clear;
  EdtCodGRP.Clear;
  EdtNomeGRP.Clear;
  CheckST.Checked := false;
  EdtCodPro.SetFocus;
  edtPis.Clear;
  edtCofins.Clear;
  edtCSTPis.Clear;
  edtCSTCofins.Clear;
  edtCstIPI.Clear;
  edtCSOSN.Clear;
end;

function TFrmNotaFiscal.BuscaOrdem: integer;
begin
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.Consulta do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT MAX(ORDEM) ORDEM ' + 'FROM ITENS_NOTA_FISCAL ' +
        'WHERE COD_NF = :CODNF');
    Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
    ExecOrOpen;
    if fieldbyname('ordem').IsNull then
      result := 1
    else
      result := fieldbyname('ordem').AsInteger + 1;
  end;
  dm.IBTransaction.Commit;
  dm.Consulta.close;
end;

procedure TFrmNotaFiscal.BtnConsCliForClick(Sender: TObject);
begin
  inherited;
  if ComboCliFor.ItemIndex = 0 then
  begin
    Application.CreateForm(TFrmConsCli, FrmConsCli);
    FrmConsCli.tag := 18;
    FrmConsCli.ShowModal;
  end
  else
  begin
    Application.CreateForm(TFrmConsFor, FrmConsFor);
    FrmConsFor.tag := 17;
    FrmConsFor.ShowModal;
  end;
end;

procedure TFrmNotaFiscal.BtnAddCliForClick(Sender: TObject);
begin
  inherited;
  if ComboCliFor.ItemIndex = 0 then
  begin
    BuscaFormulario( TFrmCadCli, True );
  end
  else
  begin
    BuscaFormulario( TFrmCadFor, True );
  end;
end;

procedure TFrmNotaFiscal.EdtCliForEnter(Sender: TObject);
begin
  inherited;
  EdtCliFor.SelectAll;
end;

procedure TFrmNotaFiscal.cod_traEnter(Sender: TObject);
begin
  inherited;
  cod_tra.SelectAll;
end;

procedure TFrmNotaFiscal.EdtCliForExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
    exit;
  if ComboCliFor.ItemIndex = 0 then
  begin
    EdtNomeCliFor.Text := Consulta('cliente', EdtCliFor, 'cod_cli', 'nome_cli',
      dm.IBTransaction, dm.QConsulta);
    if EdtNomeCliFor.Text = '' then
    begin
      AlertaCad('Cliente não Cadastrado');
      EdtCliFor.SetFocus;
    end;
  end
  else
  begin
    EdtNomeCliFor.Text := Consulta('fornecedor', EdtCliFor, 'cod_for',
      'razao_for', dm.IBTransaction, dm.QConsulta);
    if EdtNomeCliFor.Text = '' then
    begin
      AlertaCad('Forncedor não Cadastrado');
      EdtCliFor.SetFocus;
    end;
  end;

end;

procedure TFrmNotaFiscal.EdtCliForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsCliFor.Click
  else if Key = vk_f2 then
    BtnAddCliFor.Click;
end;

procedure TFrmNotaFiscal.cod_traExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
    exit;
  EdtNomeTra.Text := Consulta('transportadora', cod_tra, 'cod_tra', 'nome_tra',
    dm.IBTransaction, dm.QConsulta);
  if EdtNomeTra.Text = '' then
  begin
    AlertaCad('Transportadora não Cadastrada');
    cod_tra.SetFocus;
  end;
end;

procedure TFrmNotaFiscal.cod_traKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsTra.Click
  else if Key = vk_f2 then
    BtnAddTra.Click;
end;

procedure TFrmNotaFiscal.BtnConsTraClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTransp, FrmConsTransp);
  FrmConsTransp.tag := 2;
  FrmConsTransp.ShowModal;
end;

procedure TFrmNotaFiscal.BtnAddTraClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadTransp, True );
end;

procedure TFrmNotaFiscal.FormShow(Sender: TObject);
begin
  inherited;
  if tag = 0 then
  begin
    if not dm.Acesso('M019', 'I') then
    begin
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
      Botoes('C');
    end
    else
    begin
      PC.ActivePage := TabSheet1;
      Botoes('N');
      BtnFinaliza.Enabled := false;
      BtnEnvia.Enabled := false;
      btnEmail.Enabled := false;
      bGravaItem := true;
      bGrava := true;
      EdtEmissao.Date := Date;
      EdtDataSaida.Date := Date;
      EdtHora.Clear;
      EdtModelo.Text := sModeloNF;
      EdtSerie.Text := sSerie;
      ComboTipo.Enabled := true;
      ComboTipo.ItemIndex := 0;
      RdgFrete.ItemIndex := iTipoFrete;
      EdtEspecie.Text := sEspecie;
      EdtMarca.Text := sMarca;
      ComboCliFor.ItemIndex := 0;
      ComboTipoCliente.ItemIndex := 1;
      ComboCliForChange(ComboCliFor);
      DBGrid1.SendToBack;
      ComboTipo.SetFocus;
    end;
  end
  else if tag = 1 then
  begin
    Botoes('G');
    BtnFinaliza.Enabled := true;
      BtnEnvia.Enabled := true;
      btnEmail.Enabled := true;
    DBGrid1.SendToBack;
  end;
end;

procedure TFrmNotaFiscal.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 31;
  FrmConsProd.ShowModal;
end;

procedure TFrmNotaFiscal.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TFrmNotaFiscal.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  EdtCodPro.SelectAll;
end;

procedure TFrmNotaFiscal.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsPro.Click
  else if Key = vk_f2 then
    BtnAddPro.Click;
end;

procedure TFrmNotaFiscal.EdtCodProExit(Sender: TObject);
var
  bAchou: Boolean;
begin
  inherited;
  bAchou := false;
  if (BtnItens.Focused) or (ToolBar1.Focused) {or (BtnFinaliza.Focused)} or
    (EdtCodPro.Text = '') then
    exit;
   VerificaEstadoFora;
  if ComboTipo.ItemIndex = 1 then
  begin
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    with dm.QConsulta do
    begin
      close;
      sql.Clear;
      sql.Text :=
        'SELECT CFOP_CUPOM_ESTADO, CFOP_CUPOM_FORA ' + 'FROM PARAMETROS ' +
        'WHERE COD_EMP = :CODEMP';
      Parambyname('codemp').AsInteger := iEmp;
      open;
      if bNoEstado then
        iCFOPCupom := fieldbyname('cfop_cupom_estado').AsInteger
      else
        iCFOPCupom := fieldbyname('cfop_cupom_fora').AsInteger;
    end;
    dm.IBTransaction.Commit;
    dm.QConsulta.close;
  end;

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with QDadosProd do
      begin
        close;
        sql.Clear;
{        sql.Add(
          'SELECT P.ALIQUOTA_PIS, P.ALIQUOTA_COFINS ,P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.CONTROLA_ESTOQUE_PRO, '
            +
            'P.CST_CONT_EST, P.CST_CONT_FORA, P.CST_CF_EST, P.CST_CF_FORA, '
            +
            'P.CLASSIFICACAO_FISCAL, P.ICMS_CONT_EST, P.ICMS_CONT_FORA, '
            +
            'P.ICMS_CF_EST, P.ICMS_CF_FORA, '
            +
            'P.IPI_CONT_EST, P.IPI_CF_EST, P.IPI_CONT_FORA, P.IPI_CF_FORA, '
            +
            'P.RED_CONT_EST, P.RED_CF_EST, P.RED_CONT_FORA, P.RED_CF_FORA, ' +
            'P.ST_CONT_EST, P.CFOP_VENDAS_CONT_EST, P.CFOP_VENDAS_CF_EST,  ' +
            'P.CFOP_VENDAS_CONT_FORA, P.CFOP_VENDAS_CF_FORA, P.VR_AGREG_CONT_EST, ' +
            'G.ALIQUOTA_GRP, G.NOME_GRP, U.DESCRICAO, P.CST_PIS, P.CST_COFINS, P.CSOSN, P.CST_IPI ' + 'FROM PRODUTO P ' + 'INNER JOIN UNIDADE_MEDIDA U ' + 'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' + 'INNER JOIN GRUPO_ICMS G');}
        sql.Add( 'SELECT TS.pis ALIQUOTA_PIS,' + sLineBreak +
       'TS.cofins ALIQUOTA_COFINS,' + sLineBreak +
       'P.COD_PRO,' + sLineBreak +
       'P.NOME_PRO,' + sLineBreak +
       'P.VALOR_PRO,' + sLineBreak +
       'P.CONTROLA_ESTOQUE_PRO,' + sLineBreak +
       '( TS.origem_prod || TS.cst ) CST_CONT_EST,' + sLineBreak +
       '( TS.origem_prod || TS.cst ) CST_CONT_FORA,' + sLineBreak +
       '( TS.origem_prod || TS.cst ) CST_CF_EST,' + sLineBreak +
       '( TS.origem_prod || TS.cst ) CST_CF_FORA,' + sLineBreak +
       ''''' CLASSIFICACAO_FISCAL,' + sLineBreak +
       'TS.cod_icms ICMS_CONT_EST,' + sLineBreak +
       'TS.cod_icms ICMS_CONT_FORA,' + sLineBreak +
       'TS.cod_icms ICMS_CF_EST,' + sLineBreak +
       'TS.cod_icms ICMS_CF_FORA,' + sLineBreak +
       'TS.dentro_cont_ipi IPI_CONT_EST,' + sLineBreak +
       'TS.dentro_ncont_ipi IPI_CF_EST,' + sLineBreak +
       'TS.fora_cont_ipi IPI_CONT_FORA,' + sLineBreak +
       'TS.fora_ncont_ipi IPI_CF_FORA,' + sLineBreak +
       'TS.reducao RED_CONT_EST,' + sLineBreak +
       'TS.reducao RED_CF_EST,' + sLineBreak +
       'TS.reducao RED_CONT_FORA,' + sLineBreak +
       'TS.reducao RED_CF_FORA,' + sLineBreak +
       'case when TS.cst = ''60'' then ''S'' else ''N'' end ST_CONT_EST,' + sLineBreak +
       'TS.dentro_cont_cfop CFOP_VENDAS_CONT_EST,' + sLineBreak +
       'TS.dentro_ncont_cfop CFOP_VENDAS_CF_EST,' + sLineBreak +
       'TS.dentro_cont_cfop CFOP_VENDAS_CONT_FORA,' + sLineBreak +
       'TS.dentro_ncont_cfop CFOP_VENDAS_CF_FORA,' + sLineBreak +
       'TS.mva VR_AGREG_CONT_EST,' + sLineBreak +
       'TS.icms ALIQUOTA_GRP,' + sLineBreak +
       'TS.descricao NOME_GRP,' + sLineBreak +
       'U.DESCRICAO,' + sLineBreak +
       'ts.cst_pis CST_PIS,' + sLineBreak +
       'ts.cst_cofins CST_COFINS,' + sLineBreak +
       ''''' CSOSN,' + sLineBreak +
       'ts.dentro_cont_cst_ipi CST_IPI' + sLineBreak +
       'FROM PRODUTO P' + sLineBreak +
       'LEFT JOIN UNIDADE_MEDIDA U ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)' + sLineBreak +
       'LEFT JOIN TRIBUTACOES_NCMS_SAIDA TS' + sLineBreak +
       'ON( TS.ncm = P.cod_ncm and TS.ex = p.ncm_ex and TS.uf = :uf )' );
        { NO ESTADO }
{        if bNoEstado then
        begin
          if ComboTipoCliente.ItemIndex = 0 then
            sql.Add('ON (P.ICMS_CONT_EST = G.COD_GRP)')
          else
            sql.Add('ON (P.ICMS_CF_EST = G.COD_GRP)')
        end
        else}
        { FORA DO ESTADO }
{        begin
          if ComboTipoCliente.ItemIndex = 0 then
            sql.Add('ON (P.ICMS_CONT_FORA = G.COD_GRP)')
          else
            sql.Add('ON (P.ICMS_CF_FORA = G.COD_GRP)')
        end;                       }

        if Length(trim(EdtCodPro.Text)) > 7 then
          sql.Add(' WHERE P.CODIGO_BARRA_PRO = ' + #39 + trim(EdtCodPro.Text)
              + #39)
        else
        begin
          sql.Add(' WHERE P.COD_PRO = :CODPRO');
          Parambyname('codpro').AsInteger := StrToInt(EdtCodPro.Text);
        end;
        ParamByName( 'uf' ).AsString := ifthen( sEstCli <> '', sEstCli, sEstEmp );
        open;
        if not fieldbyname('cod_pro').IsNull then
        begin
          bAchou := true;
          if trim(fieldbyname('controla_estoque_pro').AsString) = 'S' then
            bControlaEstoque := true
          else
            bControlaEstoque := false;

          EdtCodPro.Text := QDadosProd.fieldbyname('COD_PRO').AsString;
          EdtNomeProduto.Text := QDadosProd.fieldbyname('NOME_PRO').AsString;
          EdtValorUnit.Text := QDadosProd.fieldbyname('VALOR_PRO').AsString;
          if ComboCliFor.ItemIndex = 0 then
             begin
                TAB_PRECO.Close;
                TAB_PRECO.SQL.Clear;
                TAB_PRECO.SQL.Text := 'select * from CLIENTE_PRECO where COD_CLIENTE=:COD_CLI'+
                ' and COD_PRODUTO=:COD_PRO';
                TAB_PRECO.ParamByName( 'COD_CLI' ).AsString := EdtCliFor.Text;
                TAB_PRECO.ParamByName( 'COD_PRO' ).AsInteger := QDadosProd.fieldbyname('COD_PRO').AsInteger;
                TAB_PRECO.Open;
                if not TAB_PRECO.IsEmpty then
                   begin
                      EdtValorUnit.Value := TAB_PRECOVALOR_VENDA.AsCurrency;
                   end;
                TAB_PRECO.Close;
             end;
          EdtUnidade.Text := QDadosProd.fieldbyname('DESCRICAO').AsString;
          EdtCF.Text := QDadosProd.fieldbyname('classificacao_fiscal').AsString;
          EdtNomeGRP.Text := QDadosProd.fieldbyname('NOME_GRP').AsString;
          EdtAliqICMS.Text := QDadosProd.fieldbyname('ALIQUOTA_GRP').AsString;
          edtPis.Text := QDadosProd.fieldbyname('ALIQUOTA_PIS').AsString;
          edtCofins.Text := QDadosProd.fieldbyname('ALIQUOTA_COFINS').AsString;

          edtCSTPis.Text := QDadosProd.fieldbyname('CST_PIS').AsString;
          edtCSTCofins.Text := QDadosProd.fieldbyname('CST_COFINS').AsString;
          edtCSOSN.Text := DicAligatorTrib.GetCSOSN( QDadosProd.fieldbyname('CST_CONT_EST').AsString );
          edtCstIPI.Text := QDadosProd.fieldbyname('CST_IPI').AsString;

          // NO ESTADO
          if bNoEstado then
          begin
            if ComboTipoCliente.ItemIndex = 0 then
            begin
              EdtCodGRP.Text := QDadosProd.fieldbyname('ICMS_CONT_EST')
                .AsString;
              EdtCST.Text := QDadosProd.fieldbyname('CST_CONT_EST').AsString;
              EdtAliqIPI.Text := QDadosProd.fieldbyname('IPI_CONT_EST')
                .AsString;

              case ComboTipo.ItemIndex of
                0:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_VENDAS_CONT_EST')
                    .AsString;
                1:
                  EdtCFOP.Text := inttostr(iCFOPCupom);
                { 2:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_TRANSF_ESTADO')
                  .AsString;
                  3:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_DEVOL_ESTADO')
                  .AsString;
                  5:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_ENTRADAS_ESTADO')
                  .AsString; }
              else
                begin
                  EdtCFOP.Clear;
                  EdtNomeCFOP.Clear;
                end;
              end;

              EdtBCR.Text := QDadosProd.fieldbyname('RED_CONT_EST').AsString;

              if trim(QDadosProd.fieldbyname('ST_CONT_EST').AsString) = 'S' then
              begin
                CheckST.Checked := true;
                EdtVrAgregado.Enabled := true;
                EdtVrAgregado.Text := QDadosProd.fieldbyname
                  ('VR_AGREG_CONT_EST').AsString;
              end
              else
              begin
                CheckST.Checked := false;
                EdtVrAgregado.Clear;
                EdtVrAgregado.Enabled := false;
              end;
            end
            else
            begin
              EdtCodGRP.Text := QDadosProd.fieldbyname('ICMS_CF_EST').AsString;
              EdtCST.Text := QDadosProd.fieldbyname('CST_CF_EST').AsString;
              EdtAliqIPI.Text := QDadosProd.fieldbyname('IPI_CF_EST').AsString;

              case ComboTipo.ItemIndex of
                0:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_VENDAS_CF_EST')
                    .AsString;
                1:
                  EdtCFOP.Text := inttostr(iCFOPCupom);
                { 2:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_TRANSF_ESTADO')
                  .AsString;
                  3:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_DEVOL_ESTADO')
                  .AsString;
                  5:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_ENTRADAS_ESTADO')
                  .AsString; }
              else
                begin
                  EdtCFOP.Clear;
                  EdtNomeCFOP.Clear;
                end;
              end;

              CheckST.Checked := false;
              EdtVrAgregado.Clear;
              EdtVrAgregado.Enabled := false;

              EdtBCR.Text := QDadosProd.fieldbyname('RED_CF_EST').AsString;
            end;
          end
          else
          // FORA DO ESTADO
          begin
            if ComboTipoCliente.ItemIndex = 0 then
            begin
              EdtCodGRP.Text := QDadosProd.fieldbyname('ICMS_CONT_FORA')
                .AsString;
              EdtCST.Text := QDadosProd.fieldbyname('CST_CONT_FORA').AsString;
              EdtAliqIPI.Text := QDadosProd.fieldbyname('IPI_CONT_FORA')
                .AsString;

              case ComboTipo.ItemIndex of
                0:
                  EdtCFOP.Text := QDadosProd.fieldbyname
                    ('CFOP_VENDAS_CONT_FORA').AsString;
                1:
                  EdtCFOP.Text := inttostr(iCFOPCupom);
                { 2:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_TRANSF_FORA')
                  .AsString;
                  3:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_DEVOL_FORA_')
                  .AsString;
                  5:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_ENTRADAS_FORA')
                  .AsString; }
              else
                begin
                  EdtCFOP.Clear;
                  EdtNomeCFOP.Clear;
                end;
              end;

              EdtBCR.Text := QDadosProd.fieldbyname('RED_CONT_FORA').AsString;

              // VERIFICA SE É SUB.TRIBUTARIA NO ESTADO DO CLIENTE
              QForaEstado.close;
              QForaEstado.Parambyname('codpro').AsInteger := StrToInt
                (EdtCodPro.Text);
              QForaEstado.Parambyname('estado').AsString := trim(sEstCli);
              QForaEstado.open;
              if QForaEstado.fieldbyname('cod_pro').IsNull then
              begin
                CheckST.Checked := false;
                EdtVrAgregado.Clear;
                EdtVrAgregado.Enabled := false;
              end
              else
              begin
                CheckST.Checked := true;
                EdtVrAgregado.Enabled := true;
                EdtCFOP.Text := QForaEstadoCOD_CFO.AsString;
                EdtCST.Text := QForaEstadoCST.AsString;
                EdtVrAgregado.Text := QForaEstadoVR_AGREGADO.AsString;
                EdtAliqEstDestino.Text := QForaEstadoALIQUOTA.AsString;
              end;
            end
            else
            begin
              EdtCodGRP.Text := QDadosProd.fieldbyname('ICMS_CF_FORA').AsString;
              EdtCST.Text := QDadosProd.fieldbyname('CST_CF_FORA').AsString;
              EdtAliqIPI.Text := QDadosProd.fieldbyname('IPI_CF_FORA').AsString;

              case ComboTipo.ItemIndex of
                0:
                  EdtCFOP.Text := QDadosProd.fieldbyname('CFOP_VENDAS_CF_FORA')
                    .AsString;
                1:
                  EdtCFOP.Text := inttostr(iCFOPCupom);
                // 2: EdtCFOP.Text:= QDadosProd.fieldbyname('CFOP_TRANSF_FORA').AsString;
                // 3: EdtCFOP.Text:= QDadosProd.fieldbyname('CFOP_DEVOL_FORA').AsString;
                // 5: EdtCFOP.Text:= QDadosProd.fieldbyname('CFOP_ENTRADAS_FORA').AsString;
              else
                begin
                  EdtCFOP.Clear;
                  EdtNomeCFOP.Clear;
                end;
              end;

              CheckST.Checked := false;
              EdtVrAgregado.Clear;
              EdtVrAgregado.Enabled := false;

              EdtBCR.Text := QDadosProd.fieldbyname('RED_CF_FORA').AsString;
            end;
          end;
          EdtQuant.SetFocus;
        end
        else
        begin
          bAchou := false;
          EdtEstoque.Clear;
          AlertaCad('Produto não Cadastrado');
          EdtCodPro.SetFocus;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      bAchou := false;
      EdtEstoque.Clear;
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao Buscar os dados do produto');
      EdtCodPro.SetFocus;
    end;
  finally
    QDadosProd.close;
    QForaEstado.close;
  end;

  { BUSCA O ESTOQUE DO PRODUTO }
  if bAchou then
  begin
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with QConsEstoque do
        begin
          close;
          Parambyname('codpro').AsInteger := StrToInt(EdtCodPro.Text);
          Parambyname('codemp').AsInteger := iEmp;
          open;
          EdtEstoque.Text := fieldbyname('estoque').AsString;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        AlertaCad('Erro ao buscar o estoque do produto');
        EdtEstoque.Clear;
      end;
    finally
      QConsEstoque.close;
    end;
  end;
end;

procedure TFrmNotaFiscal.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensTOTAL.AsCurrency := QBuscaItensQUANT.AsCurrency *
    QBuscaItensUNIT.AsCurrency;
end;

procedure TFrmNotaFiscal.QBuscaReferenciaAfterPost(DataSet: TDataSet);
begin
  inherited;
  IBTRNF.CommitRetaining;
end;

procedure TFrmNotaFiscal.QBuscaReferenciaBeforePost(DataSet: TDataSet);
begin
  QBuscaReferenciaCOD_EMP.AsInteger := iEmp;
  QBuscaReferenciaCOD_NF.AsString := EdtCod.Text;
end;

procedure TFrmNotaFiscal.BtnGravaClick(Sender: TObject);
begin
  inherited;
  EdtCFOPExit(nil);
  if EdtQuant.Text = '0' then
  begin
    AlertaCad('Digite a quantidade');
    EdtQuant.SetFocus;
    exit;
  end;
  if EdtValorUnit.Text = '0' then
  begin
    AlertaCad('Digite o valor unitário');
    EdtValorUnit.SetFocus;
    exit;
  end;
  if trim(EdtCST.Text) = '' then
  begin
    AlertaCad('Digite o CST do produto');
    EdtCST.SetFocus;
    exit;
  end;


  FrmNotaFiscal.tag := 0;
  BtnGrava.Enabled := true;
  BtnNew.Enabled := false;
  BtnExclui.Enabled := false;
  BtnItens.Enabled := true;
  if IBTRNF.Active then
    IBTRNF.Commit;
  IBTRNF.StartTransaction;
  try
    try
      with IBSQLNF do
      begin
        close;
        sql.Clear;
        if bGravaItem then
        begin
          sql.Add(
            'INSERT INTO ITENS_NOTA_FISCAL(ORDEM, COD_NF, COD_PRO, CST, QUANT, '
              + 'UNIT, ALIQ, COD_EMP, COD_GRP, ALIQ_IPI, REDUCAO_ICMS, ' +
              'COD_CFO, SUB_TRIBUTARIA, VR_AGREGADO,  ' +
              'ALIQUOTA_FORA_ESTADO, UNIDADE, VALOR_TOTAL, ' +
              'BASE_CALCULO, VALOR_ICMS, BASE_SUBTRIB, VALOR_SUBTRIB, VALOR_IPI, CLASSIFICACAO_FISCAL, ALIQ_PIS, ALIQ_COFINS, '+
              'CST_PIS, CST_COFINS, CSOSN, CST_IPI ) '
              + 'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :12, ' +
              ':13, :14, :15, :19, :21, :22, :23, :24, :25, :26, :27, :28,  :ALIQ_PIS, :ALIQ_COFINS, '+
              ':CST_PIS, :CST_COFINS, :CSOSN, :CST_IPI)');
        end
        else
          sql.Add(
            'UPDATE ITENS_NOTA_FISCAL SET COD_PRO = :3, CST = :4, QUANT = :5, '
              +
              'UNIT = :6, ALIQ = :7, COD_EMP = :8, COD_GRP = :9, ALIQ_IPI = :10, REDUCAO_ICMS = :12, '
              +
              'COD_CFO = :13, SUB_TRIBUTARIA = :14, VR_AGREGADO = :15, ALIQUOTA_FORA_ESTADO = :19,   ' +
              'UNIDADE = :21, VALOR_TOTAL = :22, BASE_CALCULO = :23, VALOR_ICMS = :24, '
              + 'BASE_SUBTRIB = :25, VALOR_SUBTRIB = :26, VALOR_IPI = :27, CLASSIFICACAO_FISCAL = :28,  ALIQ_PIS=:ALIQ_PIS, ALIQ_COFINS=:ALIQ_COFINS,'+
              'CST_PIS=:CST_PIS, CST_COFINS=:CST_COFINS, CSOSN=:CSOSN, CST_IPI=:CST_IPI ' + 'WHERE ORDEM = :1 AND COD_NF = :2');

        Parambyname('1').AsInteger := StrToInt(EdtItens.Text);
        Parambyname('2').AsInteger := StrToInt(EdtCod.Text);
        if EdtCodPro.Text = '' then
          Parambyname('3').Value := null
        else
          Parambyname('3').AsInteger := StrToInt(EdtCodPro.Text);
        Parambyname('4').AsString := EdtCST.Text;
        Parambyname('5').AsCurrency := strtocurr(EdtQuant.Text);
        Parambyname('6').AsCurrency := strtocurr(EdtValorUnit.Text);
        Parambyname('7').AsCurrency := strtocurr(EdtAliqICMS.Text);
        Parambyname('8').AsInteger := iEmp;
        Parambyname('9').AsInteger := StrToInt(EdtCodGRP.Text);
        Parambyname('10').AsCurrency := strtocurr(EdtAliqIPI.Text);
        Parambyname('12').AsCurrency := strtocurr(EdtBCR.Text);
        Parambyname('13').AsInteger := StrToInt(EdtCFOP.Text);
        if CheckST.Checked then
          Parambyname('14').AsString := 'S'
        else
          Parambyname('14').AsString := 'N';
        Parambyname('15').AsCurrency := strtocurr(EdtVrAgregado.Text);
        Parambyname('19').AsCurrency := strtocurr(EdtAliqEstDestino.Text);
        Parambyname('21').AsString := trim(EdtUnidade.Text);
        Parambyname('22').AsCurrency := 0;
        Parambyname('23').AsCurrency := 0;
        Parambyname('24').AsCurrency := 0;
        Parambyname('25').AsCurrency := 0;
        Parambyname('26').AsCurrency := 0;
        Parambyname('27').AsCurrency := 0;
        if trim(EdtCF.Text) = '' then
          Parambyname('28').Value := null
        else
          Parambyname('28').AsString := EdtCF.Text;
        Parambyname('ALIQ_PIS').AsCurrency := edtPis.Value;
        Parambyname('ALIQ_COFINS').AsCurrency := edtCofins.Value;
        ParamByName( 'CST_PIS' ).AsString := edtCSTPis.Text;
        ParamByName( 'CST_COFINS' ).AsString := edtCSTCofins.Text;
        ParamByName( 'CST_IPI' ).AsString := edtCstIPI.Text;
        ParamByName( 'CSOSN' ).AsString := edtCSOSN.Text;
        ExecOrOpen;
      end;
      IBTRNF.Commit;
    except
      IBTRNF.Rollback;
      AlertaCad('Erro ao gravar o item');
    end;
  finally
    bGravaItem := true;
    IBSQLNF.close;
    if trim(dm.RetornaStringTabela('somar_por_cst_nf', 'parametros', 'cod_emp',
        iEmp)) = 'S' then
      BuscaTotalCST;
    BuscaItens;
    LimpaItens;
  end;
end;

procedure TFrmNotaFiscal.BtnItensClick(Sender: TObject);
begin
  inherited;
  BtnGrava.Enabled := false;
  BtnNew.Enabled := true;
  BtnExclui.Enabled := true;
  BtnItens.Enabled := false;
  PanelItens.SendToBack;
end;

procedure TFrmNotaFiscal.BtnNewClick(Sender: TObject);
begin
  inherited;
  FrmNotaFiscal.tag := 0;
  BtnGrava.Enabled := true;
  BtnNew.Enabled := false;
  BtnExclui.Enabled := false;
  BtnItens.Enabled := true;
  DBGrid1.SendToBack;
  LimpaItens;
  EdtItens.Text := inttostr(BuscaOrdem);
  bGravaItem := true;
end;

procedure TFrmNotaFiscal.BtnExcluiClick(Sender: TObject);
var
  iOrdem, iCodigo: integer;
begin
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção',
    mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
  begin
    FrmNotaFiscal.tag := 0;
    BtnGrava.Enabled := false;
    BtnNew.Enabled := true;
    BtnExclui.Enabled := true;
    BtnItens.Enabled := false;
    iOrdem := QBuscaItensORDEM.AsInteger;
    iCodigo := QBuscaItensCOD_NF.AsInteger;
    if IBTRNF.Active then
      IBTRNF.Commit;
    IBTRNF.StartTransaction;
    try
      try
        with IBSQLNF do
        begin
          close;
          sql.Clear;
          sql.Add('DELETE FROM ITENS_NOTA_FISCAL ' +
              'WHERE ORDEM = :1 AND COD_NF = :2');
          Parambyname('1').AsInteger := iOrdem;
          Parambyname('2').AsInteger := iCodigo;
          ExecOrOpen;
        end;
        IBTRNF.Commit;
      except
        IBTRNF.Rollback;
        AlertaCad('Erro ao Excluir o Item');
      end;
    finally
      IBSQLNF.close;
      if trim(dm.RetornaStringTabela('somar_por_cst_nf', 'parametros',
          'cod_emp', iEmp)) = 'S' then
        BuscaTotalCST;
      BuscaItens;
    end;
  end;
end;

procedure TFrmNotaFiscal.BtnGravarClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if trim(EdtModelo.Text) = '2' then
  begin
    AlertaCad('Modelo 2 tem que ser lançada no PAF-ECF');
    EdtModelo.SetFocus;
    exit;
  end;

  if (bGrava) and (not dm.Acesso('M019', 'I')) then
  begin
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;

  if IBTRNF.Active then
    IBTRNF.Commit;
  IBTRNF.StartTransaction;
  try
    try
      if bGrava then
      begin
        with QInsertNF do
        begin
          close;
          Parambyname('codemp').AsInteger := iEmp;

          if ComboCliFor.ItemIndex = 0 then
          begin
            Parambyname('codcli').AsInteger := StrToInt(EdtCliFor.Text);
            Parambyname('codfor').Value := null
          end
          else
          begin
            Parambyname('codcli').Value := null;
            Parambyname('codfor').AsInteger := StrToInt(EdtCliFor.Text);
          end;

          Parambyname('dataemissao').AsDate := EdtEmissao.Date;
          Parambyname('datasaida').AsDate := EdtDataSaida.Date;

          if EdtHora.Text = '  :  ' then
            Parambyname('horasaida').Value := null
          else
            Parambyname('horasaida').AsTime := strtotime(EdtHora.Text);

          Parambyname('codtransp').AsInteger := StrToInt(cod_tra.Text);
          Parambyname('tiponf').AsInteger := ComboTipo.ItemIndex;
          Parambyname('freteconta').AsString := inttostr
            (RdgFrete.ItemIndex + 1);

          if ComboTipoCliente.ItemIndex = 0 then
            Parambyname('tipocliente').AsString := 'C'
          else
            Parambyname('tipocliente').AsString := 'F';

          Parambyname('codtpv').AsInteger := StrToInt(EdtCodTPV.Text);
          Parambyname('serie').AsString := trim(EdtSerie.Text);
          Parambyname('cf').AsString := trim(EdtModelo.Text);

          if trim(EdtQuantidade.Text) = '' then
            Parambyname('quantidade').AsInteger := 0
          else
            Parambyname('quantidade').AsInteger := StrToInt
              (trim(EdtQuantidade.Text));

          Parambyname('especie').AsString := trim(EdtEspecie.Text);
          Parambyname('marca').AsString := trim(EdtMarca.Text);
          Parambyname('numero').AsString := trim(EdtNum.Text);
          Parambyname('pesobruto').AsCurrency := strtocurr(EdtPesoBruto.Text);
          Parambyname('pesoliquido').AsCurrency := strtocurr
            (EdtPesoLiquido.Text);
          open;
          EdtCod.Text := QInsertNFCODIGO.AsString;
          EdtNumero.Text := QInsertNFNUMERONF.AsString;
        end;
      end
      else
      begin
        with IBSQLNF do
        begin
          close;
          sql.Clear;
          sql.Add
            ('UPDATE NOTA_FISCAL SET NUMERO_NOTA_NF = :3, COD_CLI = :4, '
              +
              'DATA_EMISSAO_NF = :6, DATA_SAIDA_NF = :7, HORA_SAIDA_NF = :8, COD_TRA = :9, '
              + 'CANCELADA_NF = :10, TIPO_NOTA_FISCAL = :11, FRETE_CONTA_NF = :12, COD_FOR = :13, ' + 'TIPO_CLIENTE = :15, COD_TPV = :17, SERIE_NOTA = :19, CODIFICACAO_FISCAL = :20, ' +
              ' CHAVE_NFE_ESTORNO =:CHAVE_NFE_ESTORNO WHERE COD_NF = :1');

          Parambyname('1').AsInteger := StrToInt(EdtCod.Text);
          Parambyname('3').AsInteger := StrToInt(EdtNumero.Text);
          Parambyname('6').AsDate := EdtEmissao.Date;
          Parambyname('7').AsDate := EdtDataSaida.Date;
          if EdtHora.Text = '  :  ' then
            Parambyname('8').Value := null
          else
            Parambyname('8').AsTime := strtotime(EdtHora.Text);
          Parambyname('9').AsInteger := StrToInt(cod_tra.Text);
          Parambyname('10').AsString := 'N';
          Parambyname('11').AsInteger := ComboTipo.ItemIndex;
          Parambyname('12').AsString := inttostr(RdgFrete.ItemIndex + 1);
          if ComboCliFor.ItemIndex = 0 then
          begin
            Parambyname('4').AsInteger := StrToInt(EdtCliFor.Text);
            Parambyname('13').Value := null
          end
          else
          begin
            Parambyname('4').Value := null;
            Parambyname('13').AsInteger := StrToInt(EdtCliFor.Text);
          end;
          if ComboTipoCliente.ItemIndex = 0 then
            Parambyname('15').AsString := 'C'
          else
            Parambyname('15').AsString := 'F';
          Parambyname('17').AsInteger := StrToInt(EdtCodTPV.Text);
          Parambyname('19').AsString := trim(EdtSerie.Text);
          Parambyname('20').AsString := trim(EdtModelo.Text);
//          ParamByName('CHAVE_NFE_ESTORNO').AsString := edtChaveRef.Text;
          ExecOrOpen;
        end;
      end;
      IBTRNF.Commit;
      bNotaAberta := true;
      BtnFinaliza.Enabled := true;
      BtnEnvia.Enabled := true;
      btnEmail.Enabled := true;
      Botoes('G');
      LimpaItens;
    except
      IBTRNF.Rollback;
      BtnFinaliza.Enabled := false;
      BtnEnvia.Enabled := false;
      btnEmail.Enabled := false;
      bNotaAberta := false;
      AlertaCad('Erro ao Gravar a Nota Fiscal');
    end;
  finally
    IBSQLNF.close;
    QInsertNF.close;
    FrmNotaFiscal.tag := 0;
    VerificaEstadoFora;

    if ComboTipo.ItemIndex = 1 then
      BtnConsVendas.Enabled := true
    else
      BtnConsVendas.Enabled := false;

    BuscaItens;
  end;
end;

procedure TFrmNotaFiscal.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if bNotaAberta = true then
  begin
    AlertaCad('Nota Fiscal Aberta!, Finalize.');
    exit;
  end;
  if IBTRNF.Active then
    IBTRNF.Commit;
  QBuscaItens.close;
  if not dm.Acesso('M019', 'I') then
  begin
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  Botoes('N');
  FrmNotaFiscal.tag := 0;
  bGrava := true;
  bGravaItem := true;
  PC.ActivePage := TabSheet1;
  EdtEmissao.Date := Date;
  EdtDataSaida.Date := Date;
  EdtHora.Clear;
  EdtModelo.Text := sModeloNF;
  EdtSerie.Text := sSerie;
  ComboTipo.Enabled := true;
  RdgFrete.ItemIndex := iTipoFrete;
  EdtEspecie.Text := sEspecie;
  EdtMarca.Text := sMarca;
  ComboTipo.ItemIndex := 0;
  ComboCliFor.ItemIndex := 0;
  ComboTipoCliente.ItemIndex := 1;
  ComboCliForChange(ComboCliFor);
  DBGrid1.SendToBack;
  ComboTipo.SetFocus;
  edtTotalPIS.Clear;
  edtTotalCofins.Clear;
end;

procedure TFrmNotaFiscal.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  EdtTotal.Text := currtostr( RoundTo( StrToFloat(EdtValorUnit.Text) * StrToFloat
      (EdtQuant.Text), -2 ));
end;

procedure TFrmNotaFiscal.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  PC.TabIndex := 0;
  bNotaAberta := false;
  Botoes('C');
end;

procedure TFrmNotaFiscal.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if not dm.Acesso('M019', 'E') then
  begin
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  if dm.RetornaStringTabela('CHAVE_ACESSO_NFE', 'NOTA_FISCAL', 'COD_NF',
    StrToInt(EdtCod.Text)) <> '' then
  begin
    Application.MessageBox('NF-e ja foi enviada não pode ser excluida!',
      'Atenção', mb_ApplModal + mb_iconexclamation + mb_OK);
    Abort;
    exit;
  end;
  if Application.MessageBox('Confirma a Exclusão da Nota Fiscal', 'Atenção',
    mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
  begin
    if IBTRNF.Active then
      IBTRNF.Commit;
    QBuscaItens.close;
    IBTRNF.StartTransaction;
    try
      try
        with IBSQLNF do
        begin
          close;
          sql.Clear;
          sql.Add('DELETE FROM NOTA_FISCAL WHERE COD_NF = :COD');
          Parambyname('cod').AsInteger := StrToInt(EdtCod.Text);
          ExecOrOpen;
        end;
        IBTRNF.Commit;
        bNotaAberta := false;
        BtnFinaliza.Enabled := false;
      BtnEnvia.Enabled := false;
      btnEmail.Enabled := false;
        Botoes('E');
      except
        IBTRNF.Rollback;
        bNotaAberta := true;
        AlertaCad('Erro ao Excluir a Nota Fiscal');
      end;
    finally
      IBSQLNF.close;
      if IBTRFatura.Active then
        IBTRFatura.Commit;
    end;
  end;
end;

procedure TFrmNotaFiscal.BtnFinalizaClick(Sender: TObject);
var
  iAuxCod: integer;
  iTipoRegistro: integer; // 0-saidas  1-entrada
begin
  inherited;
  if dm.RetornaStringTabela('CHAVE_ACESSO_NFE', 'NOTA_FISCAL', 'COD_NF',
    StrToInt(EdtCod.Text)) <> '' then
  begin
    Application.MessageBox('NF-e ja foi enviada não pode ser alterada!',
      'Atenção', mb_ApplModal + mb_iconexclamation + mb_OK);
    Abort;
    exit;
  end;
  if ComboTipo.ItemIndex < 5 then
    iTipoRegistro := 0
  else
    iTipoRegistro := 1;

  { atualiza os itens da nota fiscal }
  CalculaItens;
  if ComboTipo.ItemIndex = 1 then
     VerificaCF;

  { ATUALIZA O CALCULO DO IMPOSTO E DADOS COMPLEMENTARES }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin
        close;
        sql.Clear;
        sql.Add(
          'UPDATE NOTA_FISCAL SET BASE_CALCULO_ICMS_NF = :2, VALOR_ICMS_NF = :3, '
            +
            'BASE_SUBST_NF = :4, VALOR_SUBST_NF = :5, VALOR_TOTAL_PROD_NF = :6, '
            + 'VALOR_FRETE_NF = :7, VALOR_SEGURO_NF = :8, OUTRAS_DESPESAS_NF = :9, ' +
            'VALOR_IPI_NF = :10, VALOR_TOTAL_NF = :11, QUANTIDADE_NF = :12, '
            + 'ESPECIE_NF = :13, MARCA_NF = :14, NUMERO_NF = :15, PESO_BRUTO_NF = :16, ' + 'PESO_LIQUIDO_NF = :17, INF_COMPL_NF = :18, DESCONTO_NF = :19, ' + ' VALOR_PIS=:VALOR_PIS, VALOR_COFINS=:VALOR_COFINS, ' + 'FRETE_CONTA_NF = :20 WHERE COD_NF = :1');

        Parambyname('VALOR_PIS').AsCurrency := edtTotalPIS.Value;
        Parambyname('VALOR_COFINS').AsCurrency := edtTotalCofins.Value;
        Parambyname('2').AsCurrency := strtocurr(EdtBaseICMS.Text);
        Parambyname('3').AsCurrency := strtocurr(EdtValorICMS.Text);
        Parambyname('4').AsCurrency := strtocurr(EdtBaseSub.Text);
        Parambyname('5').AsCurrency := strtocurr(EdtValorSub.Text);
        Parambyname('6').AsCurrency := strtocurr(EdtTotalProd.Text);
        Parambyname('7').AsCurrency := strtocurr(EdtFrete.Text);
        Parambyname('8').AsCurrency := strtocurr(EdtSeguro.Text);
        Parambyname('9').AsCurrency := strtocurr(EdtDesp.Text);
        Parambyname('10').AsCurrency := strtocurr(EdtIPI.Text);
        Parambyname('11').AsCurrency := strtocurr(EdtTotalNF.Text);

        if trim(EdtQuantidade.Text) = '' then
          Parambyname('12').AsInteger := 1
        else
          Parambyname('12').AsInteger := trunc(StrToFloat(EdtQuantidade.Text));

        if EdtEspecie.Text = '' then
          Parambyname('13').Value := null
        else
          Parambyname('13').AsString := EdtEspecie.Text;

        if EdtMarca.Text = '' then
          Parambyname('14').Value := null
        else
          Parambyname('14').AsString := EdtMarca.Text;

        if EdtNum.Text = '' then
          Parambyname('15').Value := null
        else
          Parambyname('15').AsString := EdtNum.Text;

        Parambyname('16').AsCurrency := strtocurr(EdtPesoBruto.Text);
        Parambyname('17').AsCurrency := strtocurr(EdtPesoLiquido.Text);

        if MemoObs.Text = '' then
          Parambyname('18').Value := null
        else
          Parambyname('18').AsString := MemoObs.Text;

        Parambyname('19').AsCurrency := strtocurr(EdtDesconto.Text);
        Parambyname('20').AsString := inttostr(RdgFrete.ItemIndex + 1);
        Parambyname('1').AsInteger := StrToInt(EdtCod.Text);
        ExecOrOpen;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao atualizar a nota fiscal');
    end;
  finally
    dm.Consulta.close;
  end;

  { gerar o sintegra }
  if dm.RetornaStringTabela('gerar_sintegra', 'parametros', 'cod_emp', iEmp)
    = 'S' then
  begin
    { verifica se já esta na tabela }
    iAuxCod := CodigoRegistro(iTipoRegistro);

    if iAuxCod > 0 then
    begin
      if Application.MessageBox('Refazer o Registro Fiscal?', 'Atenção',
        mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
      begin
        DeletaRegistro(iTipoRegistro, iAuxCod);
        GerarSintegra(iTipoRegistro);
      end
      else
        BuscaSintegra(iAuxCod, iTipoRegistro);
    end
    else
      GerarSintegra(iTipoRegistro);
  end;

  { ABRE O FORM PARA IMPRESSÃO DA NOTA }
  bNotaAberta := false;

  if not(EdtModelo.Text = '55') then
  begin
    if Application.MessageBox
      (pchar('Confirma a Impressão da Nota Fiscal n. ' + EdtNumero.Text),
      'Atenção', mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1)
      = 6 then
      UImprimeNotaFiscal.ImprimeNotaFiscal(StrToInt(EdtCod.Text));
  end;

end;

procedure TFrmNotaFiscal.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dm.Acesso('M019', 'A') then
  begin
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  if dm.RetornaStringTabela('CHAVE_ACESSO_NFE', 'NOTA_FISCAL', 'COD_NF',
    StrToInt(EdtCod.Text)) <> '' then
  begin
    Application.MessageBox('NF-e ja foi enviada não pode ser alterada!',
      'Atenção', mb_ApplModal + mb_iconexclamation + mb_OK);
    Abort;
    exit;
  end;
  PC.TabIndex := 0;
  bGrava := false;
  Botoes('A');
  ComboTipo.Enabled := false;
  EdtEmissao.SetFocus;
end;

procedure TFrmNotaFiscal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if bNotaAberta then
  begin
    AlertaCad('Nota Fiscal Aberta!, Finalize');
    CanClose := false;
  end;
end;

procedure TFrmNotaFiscal.EdtHoraExit(Sender: TObject);
begin
  inherited;
  if EdtHora.Text = '  :  ' then
    exit;
  try
    strtotime(EdtHora.Text);
  except
    AlertaCad('Hora Inválida');
    EdtHora.SetFocus;
  end;
end;

procedure TFrmNotaFiscal.MemoObsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TFrmNotaFiscal.MemoObsChange(Sender: TObject);
begin
  inherited;
  if MemoObs.Lines.Count > 8 then
    AlertaCad('não ultrapasse 7 linhas');
end;

procedure TFrmNotaFiscal.MemoObsEnter(Sender: TObject);
begin
  inherited;
  FrmNotaFiscal.KeyPreview := false;
end;

procedure TFrmNotaFiscal.MemoObsExit(Sender: TObject);
begin
  inherited;
  FrmNotaFiscal.KeyPreview := true;
end;

procedure TFrmNotaFiscal.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsNotaFiscal, FrmConsNotaFiscal);
  FrmConsNotaFiscal.tag := 0;
  FrmConsNotaFiscal.ShowModal;
  ComboTipoChange(Sender);
end;

procedure TFrmNotaFiscal.ComboCliForChange(Sender: TObject);
begin
  inherited;
  if ComboCliFor.ItemIndex = 0 then
  begin
    Label9.Caption := 'Cliente(*)';
    Label10.Caption := 'Nome do Cliente';
  end
  else
  begin
    Label9.Caption := 'Fornecedor(*)';
    Label10.Caption := 'Nome do Fornecedor';
  end;
end;



procedure TFrmNotaFiscal.ComboTipoChange(Sender: TObject);
begin
  inherited;
  case ComboTipo.ItemIndex of
      3,6,7: grpRefrencias.Visible:= True;
      else
         grpRefrencias.Visible := False;
  end;
end;

procedure TFrmNotaFiscal.CheckSTClick(Sender: TObject);
begin
  inherited;
  CheckST.SetFocus;
  if CheckST.Checked then
  begin
    EdtVrAgregado.Enabled := true;
    EdtVrAgregado.SetFocus;
  end
  else
  begin
    EdtVrAgregado.Clear;
    EdtVrAgregado.Enabled := false;
  end;
end;

procedure TFrmNotaFiscal.EdtCFOPExit(Sender: TObject);
var
  bAux: Boolean;
begin
  inherited;
  bAux := false;
  if (BtnItens.Focused) or (ToolBar1.Focused) {or (BtnFinaliza.Focused)} then
    exit;

  if trim(EdtCFOP.Text) = '' then
  begin
    AlertaCad('Digite o CFOP');
    EdtCFOP.SetFocus;
    exit;
  end;

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
          'SELECT COD_CFO, NOME_CFO, DESTACA_ICMS, INF_COMPL_NF, CALCULA_PIS_COFINS '
            + 'FROM CFOP ' + 'WHERE COD_CFO = :COD');
        Parambyname('cod').AsInteger := StrToInt(EdtCFOP.Text);
        open;
        if not(fieldbyname('cod_cfo').IsNull) then
        begin
          bAux := true;
          EdtNomeCFOP.Text := fieldbyname('nome_cfo').AsString;
          if trim(fieldbyname('destaca_icms').Text) = 'N' then
            EdtAliqICMS.Clear;
          if trim(fieldbyname('CALCULA_PIS_COFINS').Text) = 'N' then
          begin
            edtPis.Clear;
            edtCofins.Clear;
          end;

          { verifica CFOP }
          if ComboTipo.ItemIndex < 5 then // saidas
          begin
            if bNoEstado then { no estado }
            begin
              if (StrToInt(copy(EdtCFOP.Text, 1, 1)) <> 5) then
              begin
                bAux := false;
                AlertaCad('CFOP Inválido para Saídas no Estado');
                EdtCFOP.SetFocus;
              end;
            end
            else if (StrToInt(copy(EdtCFOP.Text, 1, 1)) <> 6) then
            begin
              bAux := false;
              AlertaCad('CFOP Inválido para Saídas Fora do Estado');
              EdtCFOP.SetFocus;
            end;
          end
          else
          begin // entradas
            if bNoEstado then { no estado }
            begin
              if (StrToInt(copy(EdtCFOP.Text, 1, 1)) <> 1) then
              begin
                bAux := false;
                AlertaCad('CFOP Inválido para Entradas no Estado');
                EdtCFOP.SetFocus;
              end;
            end
            else
            begin
              if (StrToInt(copy(EdtCFOP.Text, 1, 1)) <> 2) then
              begin
                bAux := false;
                AlertaCad('CFOP Inválido para Entradas Fora do Estado');
                EdtCFOP.SetFocus;
              end;
            end;
          end;
          if bAux then
          begin
            if trim(fieldbyname('inf_compl_nf').AsString) <> '' then
              MemoObs.Text := trim(fieldbyname('inf_compl_nf').AsString);
          end;
        end
        else
        begin
          EdtNomeCFOP.Clear;
          EdtAliqICMS.Clear;
          AlertaCad('CFOP não Cadastrado');
          EdtCFOP.SetFocus;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o CFOP');
    end;
  finally
    dm.QConsulta.close;
  end;
end;

procedure TFrmNotaFiscal.EdtCFOPEnter(Sender: TObject);
begin
  inherited;
  EdtCFOP.SelectAll;
end;

procedure TFrmNotaFiscal.EdtCodGRPEnter(Sender: TObject);
begin
  inherited;
  EdtCodGRP.SelectAll;
end;

procedure TFrmNotaFiscal.EdtCodGRPExit(Sender: TObject);
begin
  inherited;
  if (BtnItens.Focused) or (ToolBar1.Focused) {or (BtnFinaliza.Focused)} then
    exit;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT NOME_GRP, ALIQUOTA_GRP ' + 'FROM GRUPO_ICMS ' +
            'WHERE COD_GRP = :CODGRP');
        Parambyname('codgrp').AsInteger := StrToInt(EdtCodGRP.Text);
        ExecOrOpen;
        if fieldbyname('nome_grp').IsNull then
        begin
          AlertaCad('Grupo de ICMS não Cadastrado');
          EdtAliqICMS.Clear;
        end
        else
        begin
          EdtNomeGRP.Text := fieldbyname('nome_grp').AsString;
          EdtAliqICMS.Text := fieldbyname('aliquota_grp').AsString;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o grupo de icms');
      EdtNomeGRP.Clear;
      EdtAliqICMS.Clear;
    end;
  finally
    dm.Consulta.close;
  end;
end;

procedure TFrmNotaFiscal.EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsGRP.Click
  else if Key = vk_f2 then
    BtnAddGRP.Click;
end;

procedure TFrmNotaFiscal.BtnConsTPVClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.tag := 9;
  FrmConsTipoVenda.ShowModal;
end;

procedure TFrmNotaFiscal.EdtCodTPVEnter(Sender: TObject);
begin
  inherited;
  EdtCodTPV.SelectAll;
end;

procedure TFrmNotaFiscal.EdtCodTPVExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
    exit;
  EdtNomeTPV.Text := Consulta('tipo_venda', EdtCodTPV, 'cod_tpv', 'nome_tpv',
    dm.IBTransaction, dm.QConsulta);
  if EdtNomeTPV.Text = '' then
  begin
    AlertaCad('Tipo de Venda não Cadastrado');
    EdtCodTPV.SetFocus;
  end;
end;

procedure TFrmNotaFiscal.EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsTPV.Click
  else if Key = vk_f2 then
    BtnAddTPV.Click;
end;

procedure TFrmNotaFiscal.BtnAddTPVClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadTipoVenda, True );
end;

procedure TFrmNotaFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  { busca parametros }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT CODIFICACAO_FISCAL, SERIE_NF, ' +
            'TIPO_FRETE_NF, ESPECIE_NF, MARCA_NF  ' + 'FROM PARAMETROS ' +
            'WHERE COD_EMP = :CODEMP');
        Parambyname('codemp').AsInteger := iEmp;
        open;
        sModeloNF := fieldbyname('codificacao_fiscal').AsString;
        sSerie := fieldbyname('serie_nf').AsString;
        iTipoFrete := fieldbyname('tipo_frete_nf').AsInteger;
        sEspecie := fieldbyname('especie_nf').AsString;
        sMarca := fieldbyname('marca_nf').AsString;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar os parâmetros');
    end;
  finally
    dm.QConsulta.close;
  end;
end;

procedure TFrmNotaFiscal.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  bGravaItem := false;
  BtnGrava.Enabled := true;
  BtnNew.Enabled := false;
  BtnExclui.Enabled := false;
  BtnItens.Enabled := true;

  EdtItens.Text := QBuscaItensORDEM.AsString;
  EdtCodPro.Text := QBuscaItensCOD_PRO.AsString;
  EdtNomeProduto.Text := QBuscaItensNOME_PRO.AsString;
  EdtQuant.Text := QBuscaItensQUANT.AsString;
  EdtValorUnit.Text := QBuscaItensUNIT.AsString;
  EdtUnidade.Text := QBuscaItensUNIDADE.AsString;
  EdtCST.Text := QBuscaItensCST.AsString;
  EdtAliqICMS.Text := QBuscaItensALIQ.AsString;
  EdtAliqIPI.Text := QBuscaItensALIQ_IPI.AsString;
  EdtCodGRP.Text := QBuscaItensCOD_GRP.AsString;
  EdtNomeGRP.Text := QBuscaItensNOME_GRP.AsString;
  EdtCFOP.Text := QBuscaItensCOD_CFO.AsString;
  EdtCF.Text := QBuscaItensCLASSIFICACAO_FISCAL.AsString;
  EdtBCR.Text := QBuscaItensREDUCAO_ICMS.AsString;
  edtPis.Text := QBuscaItensALIQ_PIS.AsString;
  edtCofins.Text := QBuscaItensALIQ_COFINS.AsString;
  edtCSTPis.Text := QBuscaItensCST_PIS.AsString;
  edtCSTCofins.Text := QBuscaItensCST_COFINS.AsString;
  edtCstIPI.Text := QBuscaItensCST_IPI.AsString;
  edtCSOSN.Text := QBuscaItensCSOSN.AsString;

  if QBuscaItensSUB_TRIBUTARIA.AsString = 'S' then
  begin
    CheckST.Checked := true;
    EdtVrAgregado.Enabled := true;
    EdtVrAgregado.Text := QBuscaItensVR_AGREGADO.AsString;
  end
  else
  begin
    CheckST.Checked := false;
    EdtVrAgregado.Clear;
    EdtVrAgregado.Enabled := false;
  end;

  EdtAliqEstDestino.Text := QBuscaItensALIQUOTA_FORA_ESTADO.AsString;
  EdtTotal.Text := QBuscaItensTOTAL.AsString;

  DBGrid1.SendToBack;
  EdtQuant.SetFocus;
end;

procedure TFrmNotaFiscal.BtnAddGRPClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadGICMS, True );
end;

procedure TFrmNotaFiscal.BtnConsGRPClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.tag := 12;
  FrmConsGRP.ShowModal;
end;

procedure TFrmNotaFiscal.EdtFreteExit(Sender: TObject);
begin
  inherited;
  BuscaItens;
end;

procedure TFrmNotaFiscal.QBuscaFaturaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if QBuscaFaturaVENCIMENTO.Value > EdtEmissao.Date then
    QBuscaFaturaCALC_VENCIMENTO.AsString := QBuscaFaturaVENCIMENTO.AsString
  else
  begin
    if QBuscaFaturaVALOR.AsCurrency = strtocurr(EdtTotalNF.Text) then
      QBuscaFaturaCALC_VENCIMENTO.AsString := 'A VISTA'
    else
      QBuscaFaturaCALC_VENCIMENTO.AsString := 'ENTRADA';
  end;
end;

procedure TFrmNotaFiscal.BtnExcluirTodasFaturasClick(Sender: TObject);
var
  DOC, CF: String;
begin
  inherited;
  CF := dm.RetornaStringTabela( 'REGISTRADO_ECF', 'CFOP', 'COD_CFO', QbuscaItensCOD_CFO.AsInteger );
  if CF = 'S' then
     begin
       exit;
     end;

  if QBuscaFatura.State = dsBrowse then
  begin
    if Application.MessageBox('Confirma a Exclusão das Parcelas?', 'Atenção',
      mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
    begin
      DOC := trim('NF ' + EdtNumero.Text);
      if IBTRFatura.Active then
        IBTRFatura.Commit;
      IBTRFatura.StartTransaction;
      try
        try
          with QAuxFatura do
          begin
            close;
            sql.Clear;
            sql.Add('DELETE FROM FATURAS_NOTAS_FISCAIS ' +
                'WHERE COD_NF = :CODNF');

            Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
            ExecOrOpen;
            close;
            sql.Clear;
            sql.Add('DELETE FROM CONTAS_RECEBER ' +
                'WHERE NUMDOCUMENTO_CTR = :CODNF');
            Parambyname('codnf').AsString := DOC;
            ExecOrOpen;
          end;
          IBTRFatura.Commit;
        except
          IBTRFatura.Rollback;
          AlertaCad('Erro ao excluir as faturas');
        end;
      finally
        QAuxFatura.close;
        BuscaFatura;
      end;
    end;
  end;
end;

procedure TFrmNotaFiscal.BtnExcluirFaturaClick(Sender: TObject);
var
  iAuxParcela: integer;
  CF: string;
begin
  inherited;
  CF := dm.RetornaStringTabela( 'REGISTRADO_ECF', 'CFOP', 'COD_CFO', QbuscaItensCOD_CFO.AsInteger );
  if CF = 'S' then
     begin
       exit;
     end;

  if QBuscaFatura.State = dsBrowse then
  begin
    if Application.MessageBox('Confirma a Exclusão da Parcela?', 'Atenção',
      mb_ApplModal + mb_iconquestion + mb_yesno + mb_DefButton1) = 6 then
    begin
      iAuxParcela := QBuscaFaturaPARCELA.AsInteger;
      if IBTRFatura.Active then
        IBTRFatura.Commit;
      IBTRFatura.StartTransaction;
      try
        try
          with QAuxFatura do
          begin
            close;
            sql.Clear;
            sql.Add('DELETE FROM FATURAS_NOTAS_FISCAIS ' +
                'WHERE COD_NF = :CODNF AND PARCELA = :PARC');
            Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
            Parambyname('parc').AsInteger := iAuxParcela;
            ExecOrOpen;
            close;
            sql.Clear;
            sql.Add('DELETE FROM CONTAS_RECEBER ' +
                'WHERE NUMDOCUMENTO_CTR = :CODNF AND PARCELA_CTR = :PARC');
            Parambyname('codnf').AsString := 'NF ' + EdtCod.Text;
            Parambyname('parc').AsInteger := iAuxParcela;
            ExecOrOpen;
          end;
          IBTRFatura.Commit;
        except
          IBTRFatura.Rollback;
          AlertaCad('Erro ao excluir as faturas');
        end;
      finally
        QAuxFatura.close;
        BuscaFatura;
      end;
    end;
  end;
end;

procedure TFrmNotaFiscal.BtnGerarFaturaClick(Sender: TObject);
var
  iQtdParcelas, iDiasPri, iDiasEntre, iCodCobranca, iCodClassif, i: integer;
  sEntrada: string;
  cPercEntrada: currency;
  cTotalNota: currency;

  cValorEntrada: currency;
  cValorParcela: currency;
  cDiferenca: currency;
  cVlFrete: currency;
  DOC: String;
  vData: Tdate;
  Valor: currency;
  Parcela: integer;
  CF: String;

begin
  inherited;
  CF := dm.RetornaStringTabela( 'REGISTRADO_ECF', 'CFOP', 'COD_CFO', QbuscaItensCOD_CFO.AsInteger );
  if CF = 'S' then
     begin
       exit;
     end;
  iCodCobranca := dm.RetornaIntegerTabela('codigo_cobranca', 'parametros',
    'cod_emp', iEmp);
  iCodClassif := dm.RetornaIntegerTabela('codigo_classificacao', 'tipo_venda',
    'cod_tpv', StrToInt(EdtCodTPV.Text));
  cTotalNota := strtocurr(EdtTotalNF.Text);
  cValorEntrada := 0;
  cValorParcela := 0;
  cDiferenca := 0;
  cVlFrete := 0;
  vData := Date;
  Valor := 0;
  Parcela := 0;
  DOC := trim('NF ' + EdtCod.Text);
  if dm.RetornaStringTabela('incluir_frete_primeira_parcela', 'parametros',
    'cod_emp', iEmp) = 'S' then
  begin
    cVlFrete := StrToFloat(EdtFrete.Text);
    cTotalNota := cTotalNota - cVlFrete;
  end;

  { excluindo as parcelas }
  if IBTRFatura.Active then
    IBTRFatura.Commit;
  IBTRFatura.StartTransaction;
  try
    try
      with QAuxFatura do
      begin
        close;
        sql.Clear;
        sql.Add('DELETE FROM FATURAS_NOTAS_FISCAIS ' + 'WHERE COD_NF = :CODNF');
        Parambyname('codnf').AsInteger := StrToInt(EdtCod.Text);
        ExecOrOpen;
        close;
        sql.Clear;
        sql.Add('DELETE FROM CONTAS_RECEBER ' +
            'WHERE NUMDOCUMENTO_CTR = :CODNF');
        Parambyname('codnf').AsString := DOC;
        ExecOrOpen;
      end;
      IBTRFatura.Commit;
    except
      IBTRFatura.Rollback;
      AlertaCad('Erro ao excluir as faturas');
    end;
  finally
    QAuxFatura.close;
    BuscaFatura;
  end;

  { buscando a quantidade de parcelas e dias no tipo de venda }
  if IBTRFatura.Active then
    IBTRFatura.Commit;
  IBTRFatura.StartTransaction;
  try
    try
      with QAuxFatura do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM TIPO_VENDA ' + 'WHERE COD_TPV = :CODTPV');
        Parambyname('codtpv').AsInteger := StrToInt(EdtCodTPV.Text);
        open;
        iQtdParcelas := fieldbyname('qtdparcelas_tpv').AsInteger;
        iDiasPri := fieldbyname('diaspriparc_tpv').AsInteger;
        iDiasEntre := fieldbyname('diasentreparc_tpv').AsInteger;
        sEntrada := fieldbyname('possui_entrada').AsString;
        cPercEntrada := fieldbyname('perc_entrada').AsCurrency;
      end;
      IBTRFatura.Commit;
    except
      IBTRFatura.Rollback;
      AlertaCad('Erro ao buscar o tipo de venda');
    end;
  finally
    QAuxFatura.close;
  end;

  { gerando as parcelas - Entrada }
  if trim(sEntrada) = 'S' then
  begin
    cValorEntrada := strtocurr(currtostrf((cTotalNota * cPercEntrada) / 100,
        fffixed, 2));
    if IBTRFatura.Active then
      IBTRFatura.Commit;
    IBTRFatura.StartTransaction;
    with QAuxFatura do
    begin
      close;
      sql.Clear;
      sql.Add('INSERT INTO FATURAS_NOTAS_FISCAIS ' +
          '(COD_NF, PARCELA, VALOR, VENCIMENTO) ' + 'VALUES(:1, :2, :3, :4)');
      Parambyname('1').AsInteger := StrToInt(EdtCod.Text);
      Parambyname('2').AsInteger := 1;
      Parambyname('3').AsCurrency := cValorEntrada + cVlFrete;
      Parambyname('4').AsDate := EdtEmissao.Date;
      ExecOrOpen;
      if ComboTipo.ItemIndex < 5 then
      begin
        if trim( dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'CONTAS_NOTA')) <> 'N' then
        begin
        close;
        sql.Clear;
        sql.Text := 'INSERT INTO CONTAS_RECEBER(COD_CTR, SEQUENCIA_CTR,' +
          'COD_EMP, DATA_CTR, COD_VENDA, COD_CLI, VENCTO_CTR, VALOR_CTR, DTPAGTO_CTR,' +
          ' VLRPAGO_CTR, COD_COB, DESCONTO_CONCEDIDO_CTR, DESCONTO_CTR, ACRESCIMO_CTR, ACRESCIMO_RECEBIDO_CTR, CAIXA_EMISSAO_CTR, COD_CAI, PARCELA_CTR, DEVOLUCAO_CTR, CODIGO_CLASSIFICACAO, NUMDOCUMENTO_CTR)' + ' VALUES(GEN_ID(GNT_COD_CONTAS_RECEBER, 1), :SEQ, :CODEMP, :DATACTR, :CODVENDA, :CODCLI, :VENCTOCTR, :VALORCTR,  :DTPAGTOCTR, :VLRPAGOCTR, :CODCOB, :DESCCONC, :DESC, :ACRES, :ACRESREC, :CAIXAEMI, :CODCAI, :PARC, :DEVOL, :CODCLA, :NUMDOCUMENTO_CTR)';

        Parambyname('seq').AsInteger := 1;
        Parambyname('codemp').AsInteger := iEmp;
        Parambyname('datactr').AsDate := EdtEmissao.Date;
        Parambyname('codvenda').Value := null;
        Parambyname('codcli').AsInteger := StrToInt(EdtCliFor.Text);
        Parambyname('venctoctr').AsDate := EdtEmissao.Date;
        Parambyname('valorctr').AsCurrency := cValorEntrada + cVlFrete;
        Parambyname('dtpagtoctr').AsDate := EdtEmissao.Date;
        Parambyname('vlrpagoctr').AsCurrency := cValorEntrada + cVlFrete;
        Parambyname('codcob').AsInteger := iCodCobranca;
        Parambyname('descconc').AsCurrency := 0;
        Parambyname('desc').AsCurrency := 0;
        Parambyname('acres').AsCurrency := 0;
        Parambyname('acresrec').AsCurrency := 0;
        Parambyname('caixaemi').AsInteger := iCaixa;
        Parambyname('codcai').AsInteger := iCaixa;
        Parambyname('parc').AsCurrency := 1;
        Parambyname('devol').AsCurrency := 0;
        Parambyname('codcla').AsInteger := iCodClassif;
        Parambyname('NUMDOCUMENTO_CTR').AsString := DOC;
        ExecOrOpen;
        end;
      end;
    end;
    IBTRFatura.Commit;
    QAuxFatura.close;
    cVlFrete := 0;
  end;

  { gerando as parcelas - Parcelas }
  if iQtdParcelas > 0 then
  begin
    cValorParcela := strtocurr(currtostrf((cTotalNota - cValorEntrada)
          / iQtdParcelas, fffixed, 2));
    cDiferenca := strtocurr(currtostrf((cTotalNota - cValorEntrada) -
          (cValorParcela * iQtdParcelas), fffixed, 2));
    if IBTRFatura.Active then
      IBTRFatura.Commit;
    IBTRFatura.StartTransaction;

    for i := 1 to iQtdParcelas do
    begin
      with QAuxFatura do
      begin
        close;
        sql.Clear;
        sql.Add('INSERT INTO FATURAS_NOTAS_FISCAIS ' +
            '(COD_NF, PARCELA, VALOR, VENCIMENTO) ' + 'VALUES(:1, :2, :3, :4)');
        Parambyname('1').AsInteger := StrToInt(EdtCod.Text);
        Parambyname('2').AsInteger := i + 1;
        if i = 1 then
        begin
          if cDiferenca > 0 then
            Parambyname('3').AsCurrency := cValorParcela + cDiferenca + cVlFrete
          else
            Parambyname('3').AsCurrency := cValorParcela + cVlFrete;
          cVlFrete := 0;
        end
        else if i = iQtdParcelas then
        begin
          if cDiferenca < 0 then
            Parambyname('3').AsCurrency := cValorParcela + cDiferenca
          else
            Parambyname('3').AsCurrency := cValorParcela;
        end
        else
          Parambyname('3').AsCurrency := cValorParcela;

        if i = 1 then
          Parambyname('4').AsDate := EdtEmissao.Date + iDiasPri
        else
          Parambyname('4').AsDate := (EdtEmissao.Date + iDiasPri) +
            (iDiasEntre * (i - 1));
        vData := Parambyname('4').AsDate;
        Valor := Parambyname('3').AsCurrency;
        Parcela := Parambyname('2').AsInteger;
        ExecOrOpen;
        if trim( dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'CONTAS_NOTA')) <> 'N' then
        begin
        if ComboTipo.ItemIndex < 5 then
        begin
          close;
          sql.Clear;
          sql.Text := 'INSERT INTO CONTAS_RECEBER(COD_CTR, SEQUENCIA_CTR,' +
            'COD_EMP, DATA_CTR, COD_VENDA, COD_CLI, VENCTO_CTR, VALOR_CTR, DTPAGTO_CTR,' +
            ' VLRPAGO_CTR, COD_COB, DESCONTO_CONCEDIDO_CTR, DESCONTO_CTR, ACRESCIMO_CTR, ACRESCIMO_RECEBIDO_CTR, CAIXA_EMISSAO_CTR, COD_CAI, PARCELA_CTR, DEVOLUCAO_CTR, CODIGO_CLASSIFICACAO, NUMDOCUMENTO_CTR)' + ' VALUES(GEN_ID(GNT_COD_CONTAS_RECEBER, 1), :SEQ, :CODEMP, :DATACTR, :CODVENDA, :CODCLI, :VENCTOCTR, :VALORCTR,  :DTPAGTOCTR, :VLRPAGOCTR, :CODCOB, :DESCCONC, :DESC, :ACRES, :ACRESREC, :CAIXAEMI, :CODCAI, :PARC, :DEVOL, :CODCLA, :NUMDOCUMENTO_CTR)';

          Parambyname('seq').AsInteger := 1;
          Parambyname('codemp').AsInteger := iEmp;
          Parambyname('datactr').AsDate := EdtEmissao.Date;
          Parambyname('codvenda').Value := null;
          Parambyname('codcli').AsInteger := StrToInt(EdtCliFor.Text);

          Parambyname('venctoctr').AsDate := vData;

          Parambyname('valorctr').AsCurrency := Valor;
          Parambyname('dtpagtoctr').Value := null;
          Parambyname('vlrpagoctr').AsCurrency := 0;
          Parambyname('codcob').AsInteger := iCodCobranca;
          Parambyname('descconc').AsCurrency := 0;
          Parambyname('desc').AsCurrency := 0;
          Parambyname('acres').AsCurrency := 0;
          Parambyname('acresrec').AsCurrency := 0;
          Parambyname('caixaemi').AsInteger := iCaixa;
          Parambyname('codcai').Value := null;
          Parambyname('parc').AsInteger := Parcela;
          Parambyname('devol').AsCurrency := 0;
          Parambyname('codcla').AsInteger := iCodClassif;
          Parambyname('NUMDOCUMENTO_CTR').AsString := DOC;
          ExecOrOpen;
        end;
        end;
      end;
    end;
    IBTRFatura.Commit;
    QAuxFatura.close;
  end;
  BuscaFatura;
end;

procedure TFrmNotaFiscal.PCChange(Sender: TObject);
begin
  inherited;
  if (trim(EdtCod.Text) <> '') and (strtocurr(EdtTotalNF.Text) > 0) then
  begin
    EdtAuxTotal.Text := EdtTotalNF.Text;
    BuscaFatura;
  end;
end;

procedure TFrmNotaFiscal.BtnAlterarFaturaClick(Sender: TObject);
var
   CF: String;
begin
  inherited;
  CF := dm.RetornaStringTabela( 'REGISTRADO_ECF', 'CFOP', 'COD_CFO', QbuscaItensCOD_CFO.AsInteger );
  if CF = 'S' then
     begin
       exit;
     end;

  if QBuscaFatura.State = dsBrowse then
  begin
    PanelFatura.Visible := true;
    EdtVenc.Date := QBuscaFaturaVENCIMENTO.Value;
    EdtValorParcela.Text := QBuscaFaturaVALOR.AsString;
    EdtVenc.SetFocus;
  end;
end;

procedure TFrmNotaFiscal.Button2Click(Sender: TObject);
begin
  inherited;
  DBGrid2.SetFocus;
  PanelFatura.Visible := false;
end;

procedure TFrmNotaFiscal.Button1Click(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Add('UPDATE FATURAS_NOTAS_FISCAIS ' +
            'SET VALOR = :3, VENCIMENTO = :4' +
            ' WHERE COD_NF = :1 AND PARCELA = :2');
        Parambyname('1').AsInteger := StrToInt(EdtCod.Text);
        Parambyname('2').AsInteger := QBuscaFaturaPARCELA.AsInteger;
        Parambyname('3').AsCurrency := strtocurr(EdtValorParcela.Text);
        Parambyname('4').AsDate := EdtVenc.Date;
        ExecOrOpen;
        close;
        sql.Clear;
        sql.Add('UPDATE CONTAS_RECEBER ' +
            'SET VALOR_CTR = :3, VENCTO_CTR = :4'
            + ' WHERE NUMDOCUMENTO_CTR = :1 AND PARCELA_CTR = :2');
        Parambyname('1').AsString := 'NF ' + EdtCod.Text;
        Parambyname('2').AsInteger := QBuscaFaturaPARCELA.AsInteger;
        Parambyname('3').AsCurrency := strtocurr(EdtValorParcela.Text);
        Parambyname('4').AsDate := EdtVenc.Date;
        ExecOrOpen;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao gravar');
    end;
  finally
    dm.QConsulta.close;
    BuscaFatura;
    DBGrid2.SetFocus;
    PanelFatura.Visible := false;
  end;
end;

procedure TFrmNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if IBTRNF.Active then
    IBTRNF.Commit;
  if IBTRFatura.Active then
    IBTRFatura.Commit;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
end;

procedure TFrmNotaFiscal.BtnConsVendasClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsVendasCF, FrmConsVendasCF);
  FrmConsVendasCF.tag := 2;
  FrmConsVendasCF.ShowModal;
end;

procedure TFrmNotaFiscal.EdtCSTExit(Sender: TObject);
begin
  inherited;
  if not VerificaCST(trim(EdtCST.Text)) then
  begin
    AlertaCad('CST Inválido');
    EdtCST.SetFocus;
  end;
end;

procedure TFrmNotaFiscal.EdtCliForKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in ['0' .. '9', #13, #8]) then
    Key := #0;
end;

procedure TFrmNotaFiscal.EdtCFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
    BtnConsCFOP.Click
  else if Key = vk_f2 then
    BtnAddCFOP.Click;
end;

procedure TFrmNotaFiscal.BtnAddCFOPClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadCFOP, True );
end;

procedure TFrmNotaFiscal.BtnConsCFOPClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.tag := 10;
  FrmConsCFOP.ShowModal;
end;

procedure TFrmNotaFiscal.EdtModeloExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
    exit;

  if trim(EdtModelo.Text) = '02' then
  begin
    AlertaCad('Modelo 2 tem que ser lançada no PAF-ECF');
    EdtModelo.SetFocus;
    exit;
  end;

  EdtModelo.Text := Consulta('codificacao_documentos', EdtModelo, 'codigo',
    'codigo', dm.IBTransaction, dm.QConsulta);
  if trim(EdtModelo.Text) = '' then
  begin
    AlertaCad('Modelo de Nota Fiscal não Cadastrado');
    EdtModelo.SetFocus;
    exit;
  end;

end;

procedure TFrmNotaFiscal.EdtModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f3 then
  begin
    Application.CreateForm(TFrmConsModelo, FrmConsModelo);
    FrmConsModelo.tag := 5;
    FrmConsModelo.ShowModal;
  end;
end;

procedure TFrmNotaFiscal.EnviaEmail(NFE: Integer);
begin
//
end;

procedure TFrmNotaFiscal.VerificaCF;
begin
  memoobs.Clear;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
    dm.QConsulta.Close;
    dm.QConsulta.SQL.Clear;
    dm.QConsulta.SQL.Text := 'select * from NOTA_FISCAL_CF where COD_NF=:NF';
    dm.QConsulta.ParamByName( 'NF').AsInteger := Strtoint( EdtCod.Text );
    dm.QConsulta.Open;
    if not dm.Qconsulta.IsEmpty then
       begin
          dm.QConsulta.First;
          while not dm.QConsulta.Eof do
             begin
                MemoObs.Lines.Add( 'LANÇAMENTO efetuado em decorrência de emissão do CUPOM FISCA N.' +
                dm.QConsulta.FieldByName('COO').AsString +
                ' ECF.' + dm.QConsulta.FieldByName('ECF').AsString +
                ', de ' + dm.QConsulta.FieldByName('DATA').AsString );
                dm.QConsulta.Next;
             end;
       end;
    dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

end.

