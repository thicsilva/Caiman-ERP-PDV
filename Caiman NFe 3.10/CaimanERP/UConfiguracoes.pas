unit UConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Buttons, StdCtrls, DB, ExtCtrls, Mask, pngimage, 
  rxToolEdit, rxCurrEdit, AdvGlowButton, sMaskEdit, sCustomComboEdit, sTooledit, 
  UNovosComponentes, UNovoFormulario, StrUtils, AdvDateTimePicker, RzEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxPC, 
  sSpeedButton, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinMetropolis, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxDropDownEdit, cxContainer, cxLabel,
  cxSpinEdit;

type
  TFrmConfiguracoes = class(UNovoFormulario.TForm)
    PG: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    cod_cli: TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    GroupBox3: TGroupBox;
    BtnCondTPV: TsSpeedButton;
    EdtCodTPV: TEdit;
    EdtNomeTPV: TEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    EdtCarencia: TEdit;
    Label2: TLabel;
    EdtNegativo: TEdit;
    Label3: TLabel;
    EdtJuros: TCurrencyEdit;
    Panel1: TPanel;
    BtnOk1: TButton;
    BtnCanelar1: TButton;
    TabSheet3: TTabSheet;
    CheckDadosEmp: TCheckBox;
    Label4: TLabel;
    EdtLinhas: TEdit;
    Label6: TLabel;
    EdtAtrazoMaximo: TEdit;
    CheckMostraEstoque: TCheckBox;
    CheckEstoqueNegativo: TCheckBox;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    EdtIniEstoque: TMaskEdit;
    TabSheet5: TTabSheet;
    GroupBox4: TGroupBox;
    BtnConsTipodoc: TsSpeedButton;
    cod_doc: TEdit;
    EdtNomeTipoDoc: TEdit;
    CheckCC: TCheckBox;
    GroupBox5: TGroupBox;
    BtnConsCob: TsSpeedButton;
    EdtcodCob: TEdit;
    EdtNomeCob: TEdit;
    TabSheet6: TTabSheet;
    CheckContabil: TCheckBox;
    RdgTamanho: TRadioGroup;
    TabSheet7: TTabSheet;
    CheckCSTNF: TCheckBox;
    CheckSaldoConciliado: TCheckBox;
    GroupBox6: TGroupBox;
    EdtSenhaExcVenda: TEdit;
    CheckDescItem: TCheckBox;
    CheckDescVenda: TCheckBox;
    GroupBox7: TGroupBox;
    EdtDescMaximo: TCurrencyEdit;
    GroupBox8: TGroupBox;
    ComboTamanho: TComboBox;
    CheckRecibo: TCheckBox;
    Label18: TLabel;
    ComboIndiceNota: TComboBox;
    GroupBox9: TGroupBox;
    BtnConsTVPrazo: TsSpeedButton;
    EdtCodTVPrazo: TEdit;
    EdtNomeTVPrazo: TEdit;
    CheckCheque: TCheckBox;
    CheckDadosConvenio: TCheckBox;
    CheckParcelas: TCheckBox;
    CheckCodVenda: TCheckBox;
    TabSheet8: TTabSheet;
    Label22: TLabel;
    MemoBoleto: TMemo;
    CheckConsProdRapida: TCheckBox;
    CheckRecECF: TCheckBox;
    CheckParcPendente: TCheckBox;
    Check2LinhasItens: TCheckBox;
    CheckMostrarPromocao: TCheckBox;
    CheckProdEstoqueFrente: TCheckBox;
    CheckSomarQtdItens: TCheckBox;
    CheckGerarNFVendas: TCheckBox;
    CheckManterDataNotinha: TCheckBox;
    CheckPromissoria: TCheckBox;
    CheckPergunta: TCheckBox;
    GroupBox12: TGroupBox;
    RDGEtiqueta: TRadioGroup;
    PanelModelo1: TPanel;
    Label5: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    PanelModelo2: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    PanelModelo3: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    GroupBox13: TGroupBox;
    EdtQuantMaximo: TCurrencyEdit;
    GroupBox14: TGroupBox;
    EdtValorMaximo: TCurrencyEdit;
    CheckOperador: TCheckBox;
    Label38: TLabel;
    EdtNumVias: TEdit;
    CheckSintegra: TCheckBox;
    Label39: TLabel;
    EdtCodModelo: TEdit;
    Label40: TLabel;
    EdtSerieNotaFiscal: TEdit;
    RdgFrete: TRadioGroup;
    Label41: TLabel;
    EdtEspecie: TEdit;
    Label42: TLabel;
    EdtMarca: TEdit;
    GroupBox15: TGroupBox;
    ComboTipoComprovante: TComboBox;
    CheckFrete: TCheckBox;
    CheckFatura: TCheckBox;
    CheckHabilitarDevolucao: TCheckBox;
    TabSheet11: TTabSheet;
    GroupBox16: TGroupBox;
    Label44: TLabel;
    EdtAliqPis: TCurrencyEdit;
    Label45: TLabel;
    EdtAliqCofins: TCurrencyEdit;
    Label46: TLabel;
    EdtAliqIR: TCurrencyEdit;
    Label47: TLabel;
    EdtAliqCSLL: TCurrencyEdit;
    Label48: TLabel;
    EdtAliqOutras: TCurrencyEdit;
    EdtCFOPCupomEstado: TEdit;
    Label43: TLabel;
    Label49: TLabel;
    EdtCFOPCupomFora: TEdit;
    CheckIniciarForma: TCheckBox;
    CheckConsultarProduto: TCheckBox;
    CheckImprimirServico: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBalanca: TComboBox;
    Label35: TLabel;
    EdtNumNFInicial: TEdit;
    RdgIsentasOutrasLivros: TRadioGroup;
    QBuscaPara: TFDQuery;
    IBSQLPara: TFDQuery;
    GroupBox10: TGroupBox;
    BtnConsLocal: TsSpeedButton;
    EdtCodLocal: TEdit;
    EdtNomeLocal: TEdit;
    GroupBox11: TGroupBox;
    BtnConsLocalOrigem: TsSpeedButton;
    EdtCodLocalOrigem: TEdit;
    EdtNomeLocalOrigem: TEdit;
    EdtCodLocalDestino: TEdit;
    BtnConsLocalDestino: TsSpeedButton;
    EdtNomeLocalDestino: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    OpenDialog1: TOpenDialog;
    GroupBox18: TGroupBox;
    PageControl1: TPageControl;
    TabSheet12: TTabSheet;
    sbtnCaminhoCert: TsSpeedButton;
    sbtnGetCert: TsSpeedButton;
    EdtCaminhoCertificado: TEdit;
    EdtSenhaCertificado: TEdit;
    EdtNumeroSerieCertificado: TEdit;
    TabSheet13: TTabSheet;
    Label56: TLabel;
    sbtnPathSalvar: TsSpeedButton;
    Label68: TLabel;
    SpeedButton1: TsSpeedButton;
    RdgTipoDanfe: TRadioGroup;
    RdgFormaEmissaoDanfe: TRadioGroup;
    EdtLogoMarcaDanfe: TEdit;
    CheckSalvarLogDanfe: TCheckBox;
    RdgAmbienteDanfe: TRadioGroup;
    EdtPathLogsDanfe: TDirectoryEdit;
    EdtCaminhoRelatorio: TEdit;
    TabSheet14: TTabSheet;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label66: TLabel;
    EdtSmtpHost: TEdit;
    EdtSmtpPort: TEdit;
    EdtSmtpPass: TEdit;
    EdtSmtpUser: TEdit;
    EdtEmailAssunto: TEdit;
    CheckEmailSSL: TCheckBox;
    MemoEmailMsg: TMemo;
    EdtSMTPFrom: TEdit;
    TabSheet15: TTabSheet;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    EdtPastaCanceladasDanfe: TDirectoryEdit;
    EdtPastaInutilizadosDanfe: TDirectoryEdit;
    EdtPastaTransmitidosDanfe: TDirectoryEdit;
    EdtPastaPDFDanfe: TDirectoryEdit;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    Button1: TButton;
    Button2: TButton;
    Label13: TLabel;
    estado_nfe: TComboBox;
    GroupBox17: TGroupBox;
    SpeedButton2: TsSpeedButton;
    edtCodCedente: TEdit;
    edtDescricaoCedente: TEdit;
    GroupBox19: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edtPisEntrada: TCurrencyEdit;
    edtCofinsEntrada: TCurrencyEdit;
    edtIREntrada: TCurrencyEdit;
    edtContSocialEntrada: TCurrencyEdit;
    edtOutrasEntrada: TCurrencyEdit;
    rbTipoEnvio: TRadioGroup;
    Label20: TLabel;
    edtEstRemessa: TEdit;
    edtPastaRemessa: TsDirectoryEdit;
    Label21: TLabel;
    Label23: TLabel;
    edtPastaRetorno: TsDirectoryEdit;
    Label24: TLabel;
    edtPastaTxtServ: TDirectoryEdit;
    tsNFCe: TTabSheet;
    GroupBox20: TGroupBox;
    Label37: TLabel;
    NFCeCancelados: TDirectoryEdit;
    Label50: TLabel;
    NFCeInutilizados: TDirectoryEdit;
    Label51: TLabel;
    NFCeTransmitidos: TDirectoryEdit;
    Label52: TLabel;
    NFCePDF: TDirectoryEdit;
    Label25: TLabel;
    NFCeNumero: TEdit;
    Label53: TLabel;
    NFCeSerie: TEdit;
    NFCeAmbiente: TRadioGroup;
    Label54: TLabel;
    edtIDtoken: TEdit;
    Label55: TLabel;
    edtToken: TEdit;
    opTipoFrente: TRadioGroup;
    TabSheet9: TTabSheet;
    PageControl2: TPageControl;
    TabSheet10: TTabSheet;
    GroupBox21: TGroupBox;
    btnConsIcmsF: TsSpeedButton;
    edtIcmsF: TEdit;
    edtDescIcmsF: TEdit;
    GroupBox22: TGroupBox;
    btnConsCfopD: TsSpeedButton;
    edtCfopD: TEdit;
    edtDescCfopD: TEdit;
    GroupBox23: TGroupBox;
    btnConsIcmsD: TsSpeedButton;
    edtIcmsD: TEdit;
    edtDescIcmsD: TEdit;
    GroupBox24: TGroupBox;
    btnConsCfopF: TsSpeedButton;
    edtCfopF: TEdit;
    edtDescCfopF: TEdit;
    Label69: TLabel;
    edtCstD: TEdit;
    Label70: TLabel;
    edtCstF: TEdit;
    tsRestaurante: TTabSheet;
    chkRest_comissao: TCheckBox;
    pnlRestComissoes: TPanel;
    GroupBox25: TGroupBox;
    edtRestComissao: TCurrencyEdit;
    GroupBox26: TGroupBox;
    btnRest_conspro: TsSpeedButton;
    edtRest_codpro: TEdit;
    edtRest_descpro: TEdit;
    GroupBox27: TGroupBox;
    edtChkPiscar: TCheckBox;
    Label71: TLabel;
    edtTempoAtrazo: TAdvDateTimePicker;
    edtTempoPiscar: TAdvDateTimePicker;
    Label72: TLabel;
    GroupBox28: TGroupBox;
    Label73: TLabel;
    edt_cor_it: TRzColorEdit;
    edt_cor_ia: TRzColorEdit;
    Label74: TLabel;
    Label75: TLabel;
    edt_cor_ip: TRzColorEdit;
    GroupBox29: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    edt_cor_pt: TRzColorEdit;
    edt_cor_pa: TRzColorEdit;
    edt_cor_pp: TRzColorEdit;
    Label79: TLabel;
    edtEmail_Nome: TEdit;
    Label80: TLabel;
    chkSincrono: TCheckBox;
    cbbVersaoNFe: TComboBox;
    tsParametros: TTabSheet;
    QVarParametros: TFDQuery;
    TRVarParametros: TFDTransaction;
    QVarParametrosCOD_EMP: TIntegerField;
    QVarParametrosMODULO: TStringField;
    QVarParametrosVARIAVEL: TStringField;
    QVarParametrosDESCRICAO_MODULO: TStringField;
    QVarParametrosDESCRICAO_VARIAVEL: TStringField;
    QVarParametrosTIPO: TStringField;
    QVarParametrosVALORES_POSSIVEIS: TMemoField;
    QVarParametrosVALOR: TStringField;
    cxParametrosDBTableView1: TcxGridDBTableView;
    cxParametrosLevel1: TcxGridLevel;
    cxParametros: TcxGrid;
    dsVarParametros: TDataSource;
    cxParametrosDBTableView2: TcxGridDBTableView;
    cxParametrosDBTableView2COD_EMP: TcxGridDBColumn;
    cxParametrosDBTableView2MODULO: TcxGridDBColumn;
    cxParametrosDBTableView2VARIAVEL: TcxGridDBColumn;
    cxParametrosDBTableView2DESCRICAO_MODULO: TcxGridDBColumn;
    cxParametrosDBTableView2DESCRICAO_VARIAVEL: TcxGridDBColumn;
    cxParametrosDBTableView2TIPO: TcxGridDBColumn;
    cxParametrosDBTableView2VALORES_POSSIVEIS: TcxGridDBColumn;
    cxParametrosDBTableView2VALOR: TcxGridDBColumn;
    cxParametrosDBTableView1VARIAVEL: TcxGridDBColumn;
    cxParametrosDBTableView1DESCRICAO_MODULO: TcxGridDBColumn;
    cxParametrosDBTableView1DESCRICAO_VARIAVEL: TcxGridDBColumn;
    cxParametrosDBTableView1VALORES_POSSIVEIS: TcxGridDBColumn;
    cxParametrosDBTableView1VALOR: TcxGridDBColumn;
    cxParametrosDBTableView1MODULO: TcxGridDBColumn;
    upVarParametros: TFDUpdateSQL;
    cxStyleRepository1: TcxStyleRepository;
    cxstylContetParametros: TcxStyle;
    cxstylvarColuna: TcxStyle;
    cxstylHeaderParametros: TcxStyle;
    cxstylValorParametros: TcxStyle;
    cxstylDemaisParametros: TcxStyle;
    cxstylGrupoParametros: TcxStyle;
    pnlSearchParametros: TPanel;
    cxLabel1: TcxLabel;
    edtSearchParametros: TEdit;
    TabSheet16: TTabSheet;
    Label81: TLabel;
    EdtPastaSchemas: TDirectoryEdit;
    cbAliquota: TComboBox;
    Label82: TLabel;
    edtPrefeitura: TEdit;
    Label83: TLabel;
    edtImagemPrefeitura: TEdit;
    Label84: TLabel;
    sSpeedButton1: TsSpeedButton;
    edtNumeroInicialNFS: TEdit;
    Label85: TLabel;
    TabSheet17: TTabSheet;
    edtobsOS: TMemo;
    Label86: TLabel;
    TabSheet18: TTabSheet;
    ckOS: TCheckBox;
    ckNFSE: TCheckBox;
    ckSNGPC: TCheckBox;
    procedure BtnCanelar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOk1Click(Sender: TObject);
    procedure cod_cliKeyPress(Sender: TObject; var Key: Char);
    procedure cod_cliExit(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure cod_cliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCondTPVClick(Sender: TObject);
    procedure EdtCodTPVExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCarenciaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsTipodocClick(Sender: TObject);
    procedure cod_docExit(Sender: TObject);
    procedure cod_docKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCobClick(Sender: TObject);
    procedure EdtcodCobExit(Sender: TObject);
    procedure EdtcodCobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsTVPrazoClick(Sender: TObject);
    procedure cod_cliEnter(Sender: TObject);
    procedure EdtCodTPVEnter(Sender: TObject);
    procedure EdtcodCobEnter(Sender: TObject);
    procedure EdtCodTVPrazoEnter(Sender: TObject);
    procedure EdtCodTVPrazoExit(Sender: TObject);
    procedure EdtCodTVPrazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckReciboClick(Sender: TObject);
    procedure RDGEtiquetaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsLocalClick(Sender: TObject);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalOrigemEnter(Sender: TObject);
    procedure EdtCodLocalOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalDestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalOrigemExit(Sender: TObject);
    procedure EdtCodLocalDestinoEnter(Sender: TObject);
    procedure EdtCodLocalDestinoExit(Sender: TObject);
    procedure BtnConsLocalOrigemClick(Sender: TObject);
    procedure BtnConsLocalDestinoClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodCedenteExit(Sender: TObject);
    procedure edtIcmsDExit(Sender: TObject);
    procedure edtCfopDExit(Sender: TObject);
    procedure edtIcmsFExit(Sender: TObject);
    procedure edtCfopFExit(Sender: TObject);
    procedure chkRest_comissaoClick(Sender: TObject);
    procedure edtRest_codproKeyPress(Sender: TObject; var Key: Char);
    procedure edtRest_codproKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRest_codproExit(Sender: TObject);
    procedure edtRest_codproEnter(Sender: TObject);
    procedure btnRest_consproClick(Sender: TObject);
    procedure tsParametrosShow(Sender: TObject);
    procedure cxParametrosDBTableView1VALORGetPropertiesForEdit(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tsParametrosHide(Sender: TObject);
    procedure QVarParametrosAfterPost(DataSet: TDataSet);
    procedure edtSearchParametrosKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchParametrosEnter(Sender: TObject);
    procedure edtSearchParametrosExit(Sender: TObject);
    procedure cxParametrosDBTableView1EditChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cxParametrosDBTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    FAtivaTab: Boolean;
    procedure SetAtivaTab(const Value: Boolean);
    procedure Sair;
    { Private declarations }
  public
    { Public declarations }
  published
     property AtivaTab: Boolean read FAtivaTab write SetAtivaTab;
  end;

 function FrmConfiguracoes: TFrmConfiguracoes;

implementation
uses
  Udm, Ubibli1, UConsCli, UConsTipoVenda, UConsTipoDoc, UConsTipoCobranca, 
  UConsProd, UConsLocaisEstoque, UNovoPrincipal, UPrincipal, UDicImp,
  UDicTributacao;
var  bGrava : boolean;

{$R *.dfm}

function FrmConfiguracoes: TFrmConfiguracoes;
begin
   Result := TFrmConfiguracoes( BuscaFormulario( TFrmConfiguracoes, False ) );
end;

procedure TFrmConfiguracoes.BtnCanelar1Click(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmConfiguracoes.FormShow(Sender: TObject);
var
  I: Integer;
begin
   AtivaTab := False;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaPara do
      begin
         close;
         Parambyname('codemp').AsInteger:= iEmp;
         open;

         if recordCount > 0 then
            bGrava:= true
         else
            bGrava:= false;

         // ALTERAÇÕES DEFAULT
         edtIcmsD.Text := FieldByName( 'PADROES_ICMS_D' ).AsString;
         edtIcmsF.Text := FieldByName( 'PADROES_ICMS_F' ).AsString;
         edtCfopD.Text := FieldByName( 'PADROES_CFOP_D' ).AsString;
         edtCfopF.Text := FieldByName( 'PADROES_CFOP_F' ).AsString;
         edtCstD.Text  := FieldByName( 'PADROES_CST_D'  ).AsString;
         edtCstF.Text  := FieldByName( 'PADROES_CST_F'  ).AsString;
         // FIM ALTERAÇÕES DEFAULT

         // ALTERAÇÕES NFCe
         NFCeNumero.Text := FieldByName( 'NFCE_NUMERO' ).AsString;
         NFCeSerie.Text := FieldByName( 'NFCE_SERIE' ).AsString;
         NFCeAmbiente.ItemIndex := FieldByName( 'NFCE_AMBIENTE' ).AsInteger;
         NFCeCancelados.Text := FieldByName( 'NFCE_PASTA_CANCELADAS' ).AsString;
         NFCeInutilizados.Text := FieldByName( 'NFCE_PASTA_INUTILIZADAS' ).AsString;
         NFCeTransmitidos.Text := FieldByName( 'NFCE_PASTA_TRANSMITIDAS' ).AsString;
         NFCePDF.Text := FieldByName( 'NFCE_PASTA_PDF' ).AsString;
         edtIDtoken.Text := FieldByName( 'NFCE_ID_TOKEN' ).AsString;
         edtToken.Text := FieldByName( 'NFCE_TOKEN' ).AsString;
         opTipoFrente.ItemIndex := FieldByName( 'NFCE_TIPO_FRENTE' ).AsInteger;
         // FIM ALTERAÇÕES NFCe

         // ALTERAÇÕES RESTAURANTE
         chkRest_comissao.Checked := FieldByName( 'REST_USA_COMISSAO' ).AsString = 'S';
         edtRestComissao.Value := FieldByName( 'REST_COMISSAO' ).AsCurrency;
         edtRest_codpro.Text := FieldByName( 'REST_SERVICO' ).AsString;
         chkRest_comissaoClick( nil );
         edtChkPiscar.Checked := FieldByName( 'REST_PISCAR' ).AsString = 'S';
         edtTempoAtrazo.Time := FieldByName( 'REST_ATRAZO' ).AsDateTime;
         edtTempoPiscar.Time := FieldByName( 'REST_ATRAZO_PISCA' ).AsDateTime;
         if FieldByName( 'REST_COR_IT' ).AsString <> '' then
           edt_cor_it.SelectedColor := StringToColor( FieldByName( 'REST_COR_IT' ).AsString );
         if FieldByName( 'REST_COR_IA' ).AsString <> '' then
           edt_cor_ia.SelectedColor := StringToColor( FieldByName( 'REST_COR_IA' ).AsString );
         if FieldByName( 'REST_COR_IP' ).AsString <> '' then
           edt_cor_ip.SelectedColor := StringToColor( FieldByName( 'REST_COR_IP' ).AsString );
         if FieldByName( 'REST_COR_PT' ).AsString <> '' then
           edt_cor_pt.SelectedColor := StringToColor( FieldByName( 'REST_COR_PT' ).AsString );
         if FieldByName( 'REST_COR_PA' ).AsString <> '' then
           edt_cor_pa.SelectedColor := StringToColor( FieldByName( 'REST_COR_PA' ).AsString );
         if FieldByName( 'REST_COR_PP' ).AsString <> '' then
           edt_cor_pp.SelectedColor := StringToColor( FieldByName( 'REST_COR_PP' ).AsString );
//         edtRest_codproExit( nil );
         // FIM ALTERAÇÃOS RESTAURANTE

         cod_cli.Text         := FieldByName('CLIENTE_PADRAO_VENDA').AsString;
         EdtCodTPV.Text       := FieldByName('TIPO_VENDA_PADRAO_VENDA').AsString;
         EdtCarencia.Text     := FieldByName('DIAS_CARENCIA').AsString;
         EdtNegativo.Text     := FieldByName('DIAS_NEGATIVACAO').AsString;
         EdtJuros.Text        := FieldByName('JUROS_ATRASO').AsString;
         EdtLinhas.Text       := FieldByName('LINHAS_FINAL').AsString;
         EdtAtrazoMaximo.Text := FieldByName('ATRASO_MAXIMO').AsString;
         EdtIniEstoque.Text   := FieldByName('DATA_INICIO_ESTOQUE').AsString;
         cod_doc.Text         := FieldByName('COD_DOC').AsString;
         edtCodCedente.Text   := FieldByName('COD_CEDENTE').AsString;
         edtEstRemessa.Text   := FieldByName('EST_REMESSA').AsString;
         edtPastaRemessa.Text := FieldByName('PASTA_REMESSA').AsString;
         edtPastaRetorno.Text := FieldByName('PASTA_RETORNOS').AsString;
         edtPastaTxtServ.Text := FieldByName( 'PASTA_TXT_SERV' ).AsString;


         if FieldByName('IMP_CABECALHO').AsString = 'S' then
            CheckDadosEmp.Checked:= true
         else
            CheckDadosEmp.Checked:= false;

         if FieldByName('IMPRIMIR_NOTA_PROMISSORIA').AsString = 'S' then
            CheckPromissoria.Checked:= true
         else
            CheckPromissoria.Checked:= false;

         if trim(FieldByName('MOSTRAR_ESTOQUE_VENDA').AsString) = 'S' then
            CheckMostraEstoque.Checked:= true
         else
            CheckMostraEstoque.Checked:= false;

         if trim(FieldByName('SAIDAS_ESTOQUE_NEGATIVO').AsString) = 'S' then
            CheckEstoqueNegativo.Checked := true
         else
            CheckEstoqueNegativo.Checked := false;

         if trim(FieldByName('LANCAR_CHEQUES_CC').AsString) = 'S' then
            CheckCC.Checked := true
         else
            CheckCC.Checked := false;

         edtcodcob.Text := Fieldbyname('CODIGO_COBRANCA').AsString;

         if FieldByName('tamanho_comprovante').value = 'B' then
            RdgTamanho.ItemIndex := 0
         else
            RdgTamanho.ItemIndex := 1;

         if trim(fieldbyname('lanc_contabil').AsString) = 'S' then
            CheckContabil.Checked := true
         else
            CheckContabil.Checked := false;

         if trim(fieldbyname('SOMAR_POR_CST_NF').AsString) = 'S' then
            CheckCSTNF.Checked:= true
         else
            CheckCSTNF.Checked:= false;
         if trim(fieldbyname('saldo_conciliado_cc').AsString) = 'S' then
            CheckSaldoConciliado.Checked:= true
         else
            CheckSaldoConciliado.Checked:= false;

         EdtSenhaExcVenda.Text:= fieldbyname('senha_excluir_venda').AsString;

         if trim(FieldByName('DESCONTO_ITEM_VENDA').AsString) = 'S' then
            CheckDescItem.Checked := true
         else
            CheckDescItem.Checked := false;

         if trim(FieldByName('DESCONTO_TOTAL_VENDA').AsString) = 'S' then
            CheckDescVenda.Checked := true
         else
            CheckDescVenda.Checked := false;
         EdtDescMaximo.Text        := FieldByName('DESCONTO_MAXIMO_VENDA').AsString;

         if trim(FieldByName('IMP_RECIBO_PAGAMENTO').AsString) = 'S' then
            CheckRecibo.Checked := true
         else
            CheckRecibo.Checked := false;

         if FieldByName('tamanho_codigo_balanca').AsInteger = 4 then
            ComboTamanho.ItemIndex:= 0
         else
            if FieldByName('tamanho_codigo_balanca').AsInteger = 5 then
               ComboTamanho.ItemIndex:= 1
            else
               if FieldByName('tamanho_codigo_balanca').AsInteger = 6 then
                  ComboTamanho.ItemIndex:= 2
               else
                  ComboTamanho.ItemIndex:= -1;
         ComboIndiceNota.ItemIndex   := fieldbyname('indice_nota_fiscal').AsInteger - 1;
         EdtCodTVPrazo.Text:= fieldbyname('TIPO_VENDA_PADRAO_PRAZO').AsString;

         if trim(FieldByName('LANCAR_CHEQUE_CAIXA').AsString) = 'S' then
            CheckCheque.Checked := true
         else
            CheckCheque.Checked := false;

         if trim(FieldByName('DADOS_CONVENIO_COMPROVANTE').AsString) = 'S' then
            CheckDadosConvenio.Checked := true
         else
            CheckDadosConvenio.Checked := false;

         if trim(FieldByName('ALTERAR_PARCELAS').AsString) = 'S' then
            CheckParcelas.Checked := true
         else
            CheckParcelas.Checked := false;

         if trim(FieldByName('CODVENDA_INICIO_REC').AsString) = 'S' then
            CheckCodVenda.Checked := true
         else
            CheckCodVenda.Checked := false;

         MemoBoleto.Text:= fieldbyname('INSTRUCOES_BOLETO').AsString;

         if trim(FieldByName('CONS_PROD_RAPIDA_VENDAS').AsString) = 'S' then
            CheckConsProdRapida.Checked := true
         else
            CheckConsProdRapida.Checked := false;

         if trim(FieldByName('IMP_RECIBO_ECF').AsString) = 'S' then
            CheckRecECF.Checked := true
         else
            CheckRecECF.Checked := false;

         if trim(FieldByName('IMPRIMIR_PARCELAS_PENDENTES').AsString) = 'S' then
            CheckParcPendente.Checked := true
         else
            CheckParcPendente.Checked := false;

         if trim(FieldByName('DUASLINHAS_ITENS_COMPROVANTE').AsString) = 'S' then
            Check2LinhasItens.Checked := true
         else
            Check2LinhasItens.Checked := false;

         if trim(FieldByName('MOSTRAR_PROMOCAO_VENDAS').AsString) = 'S' then
            CheckMostrarPromocao.Checked := true
         else
            CheckMostrarPromocao.Checked := false;

         if trim(FieldByName('MOSTRAR_SOMENTE_PROD_COM_EST').AsString) = 'S' then
            CheckProdEstoqueFrente.Checked := true
         else
            CheckProdEstoqueFrente.Checked := false;

         if trim(FieldByName('SOMAR_QTD_ITENS_NF').AsString) = 'S' then
            CheckSomarQtdItens.Checked:= true
         else
            CheckSomarQtdItens.Checked:= false;

         if FieldByName('GERAR_NF_VENDAS').AsString = 'S' then
            CheckGerarNFVendas.Checked:= true
         else
            CheckGerarNFVendas.Checked:= false;

         if FieldByName('MANTER_DATA_NOTINHA').AsString = 'S' then
            CheckManterDataNotinha.Checked:= true
         else
            CheckManterDataNotinha.Checked:= false;

         if FieldByName('PERGUNTA_PARCELA_PENDENTE').AsString = 'S' then
            CheckPergunta.Checked:= true
         else
            CheckPergunta.Checked:= false;

         if trim(FieldByName('IMPRIMIR_NOME_OPERADOR').AsString) = 'S' then
            CheckOperador.Checked := true
         else
            CheckOperador.Checked := false;

         RDGEtiqueta.ItemIndex:= fieldbyname('MODELO_ETIQUETA_MATRICIAL').AsInteger - 1;
         EdtQuantMaximo.Text  := fieldbyname('QUANT_MAXIMA_VENDAS').AsString;
         EdtValorMaximo.Text  := fieldbyname('VALOR_MAXIMO_VENDAS').AsString;
         EdtNumVias.Text      := fieldbyname('NUMERO_VIAS_COMPROVANTE').AsString;

         if fieldbyname('GERAR_SINTEGRA').AsString = 'S' then
            CheckSintegra.Checked:= true
         else
            CheckSintegra.Checked:= false;

         EdtCodModelo.Text:= fieldbyname('CODIFICACAO_FISCAL').AsString;
         EdtSerieNotaFiscal.Text:= fieldbyname('SERIE_NF').AsString;
         RdgFrete.ItemIndex:= fieldbyname('TIPO_FRETE_NF').AsInteger;
         EdtEspecie.Text:= fieldbyname('especie_nf').AsString;
         EdtMarca.Text  := fieldbyname('marca_nf').AsString;
         ComboTipoComprovante.ItemIndex:= fieldbyname('tipo_comprovante').AsInteger;

         if trim(FieldByName('INCLUIR_FRETE_PRIMEIRA_PARCELA').AsString) = 'S' then
            CheckFrete.Checked:= true
         else
            CheckFrete.Checked:= false;

         if trim(FieldByName('IMPRIMIR_FATURA_NOTA_FISCAL').AsString) = 'S' then
            CheckFatura.Checked:= true
         else
            CheckFatura.Checked:= false;

         if trim(fieldbyname('HABILITAR_DEVOLUCAO').AsString) = 'S' then
            CheckHabilitarDevolucao.Checked:= true
         else
            CheckHabilitarDevolucao.Checked:= false;

         EdtAliqPis.Text    := fieldbyname('aliquota_pis').AsString;
         EdtAliqCofins.Text := fieldbyname('aliquota_cofins').AsString;
         EdtAliqIR.Text     := fieldbyname('aliquota_ir').AsString;
         EdtAliqCSLL.Text   := fieldbyname('aliquota_csll').AsString;
         EdtAliqOutras.Text := fieldbyname('aliquota_outras').AsString;

         // ENTRADAS
         edtPisEntrada.Text := fieldbyname('PIS_ENTRADAS').AsString;
         edtCofinsEntrada.Text := fieldbyname('COFINS_ENTRADAS').AsString;
         edtIREntrada.Text := fieldbyname('IR_ENTRADAS').AsString;
         edtContSocialEntrada.Text := fieldbyname('CONT_SOCIAL_ENTRADA').AsString;
         edtOutrasEntrada.Text := fieldbyname('OUTRAS_ENTRADAS').AsString;

         EdtCFOPCupomEstado.Text := fieldbyname('cfop_cupom_estado').AsString;
         EdtCFOPCupomFora.Text   := fieldbyname('cfop_cupom_fora').AsString;

         if trim(FieldByName('INICIAR_VENDAS_FORMA_PAGAMENTO').AsString) = 'S' then
            CheckIniciarForma.Checked:= true
         else
            CheckIniciarForma.Checked:= false;

         if trim(FieldByName('CONSULTAR_PRODUTO').AsString) = 'S' then
            CheckConsultarProduto.Checked:= true
         else
            CheckConsultarProduto.Checked:= false;

         ComboBalanca.ItemIndex:= fieldbyname('preco_peso_balanca').AsInteger;

         if trim(FieldByName('IMPRIMIR_SERVICO_ECF').AsString) = 'S' then
            CheckImprimirServico.Checked:= true
         else
            CheckImprimirServico.Checked:= false;

         EdtNumNFInicial.Text:= fieldbyname('NUMERO_INICIAL_NOTA_FISCAL').AsString;

         if trim(fieldbyname('ISENTAS_OUTRAS_LIVROS_FISCAIS').AsString) = 'I' then
            RdgIsentasOutrasLivros.ItemIndex:= 0
         else
            RdgIsentasOutrasLivros.ItemIndex:= 1;

         EdtCodLocal.Text:= fieldbyname('CODIGO_LOCAL_ESTOQUE_VENDAS').AsString;
         EdtCodLocalOrigem.Text  := fieldbyname('DEFAULT_LOCAL_ORIGEM').AsString;
         EdtCodLocalDestino.Text := fieldbyname('DEFAULT_LOCAL_DESTINO').AsString;

         EdtCaminhoCertificado.Text      := fieldbyname('caminho_certificado').AsString;
         EdtSenhaCertificado.Text        := fieldbyname('senha_certificado').AsString;
         EdtNumeroSerieCertificado.text  := fieldbyname('numero_serie_certificado').AsString;
         Estado_nfe.Text                 := fieldbyname('estado_nfe').AsString;

         if trim(fieldbyname('tipo_impressao_danfe').AsString) = 'R' then
            RdgTipoDanfe.ItemIndex:= 0
         else
            RdgTipoDanfe.ItemIndex:= 1;

         RdgFormaEmissaoDanfe.ItemIndex := fieldbyname('forma_emissao_danfe').AsInteger -1;
         EdtLogoMarcaDanfe.Text         := fieldbyname('caminho_logomarca_danfe').AsString;

         if trim(fieldbyname('salvar_log_danfe').AsString) = 'S' then
            CheckSalvarLogDanfe.Checked:= true
         else
            CheckSalvarLogDanfe.Checked:= false;

         EdtPathLogsDanfe.Text:= fieldbyname('caminho_log_danfe').AsString;

         if trim(fieldbyname('ambiente_danfe').AsString) = 'P' then
            RdgAmbienteDanfe.ItemIndex:= 0
         else
            RdgAmbienteDanfe.ItemIndex:= 1;

         EdtSmtpHost.Text     := fieldbyname('servidor_smtp').AsString;
         EdtSmtpPort.Text     := fieldbyname('porta_smtp').AsString;
         EdtSmtpUser.Text     := fieldbyname('usuario_smtp').AsString;
         EdtSmtpPass.Text     := fieldbyname('senha_smtp').AsString;
         EdtEmailAssunto.Text := fieldbyname('assunto_email_danfe').AsString;

         if trim(fieldbyname('smtp_conexao_segura').AsString) = 'S' then
            CheckEmailSSL.Checked:= true
         else
            CheckEmailSSL.Checked:= false;

         chkSincrono.Checked:= trim(fieldbyname('NFE_SINCRONO').AsString) = 'S';
         edtEmail_Nome.Text := FieldByName( 'NFE_NOMEEMAIL' ).AsString;

         cbbVersaoNFe.ItemIndex := cbbVersaoNFe.Items.IndexOf( FieldByName( 'NFE_VERSAO' ).AsString );

         MemoEmailMsg.Text:= fieldbyname('mensagem_email_danfe').AsString;
         EdtPastaCanceladasDanfe.Text    := fieldbyname('pasta_canceladas_danfe').AsString;
         EdtPastaInutilizadosDanfe.Text  := fieldbyname('pasta_inutilizadas_danfe').AsString;
         EdtPastaTransmitidosDanfe.Text  := fieldbyname('pasta_transmitidas_danfe').AsString;
         EdtSMTPFrom.Text                := fieldbyname('from_smtp').AsString;
         EdtPastaPDFDanfe.Text           := fieldbyname('caminho_arquivos_pdf').AsString;
         EdtCaminhoRelatorio.Text        := fieldbyname('caminho_relatorio_danfe').AsString;
         rbTipoEnvio.ItemIndex           := FieldByName('TIPO_ENVIO_EMAIL' ).AsInteger;


         edtImagemPrefeitura.Text := FieldByName('IMAGEM_PREFEITURA').AsString;
         edtPrefeitura.Text := FieldByName('PREFEITURA').AsString;

         if FieldByName('ALIQUOTA').AsFloat = 2 then
           cbAliquota.ItemIndex := 1
         else
           if FieldByName('ALIQUOTA').AsFloat = 2.79 then
             cbAliquota.ItemIndex := 2
           else
             if FieldByName('ALIQUOTA').AsFloat = 3.50 then
               cbAliquota.ItemIndex := 3
             else
               if FieldByName('ALIQUOTA').AsFloat = 3.84 then
                 cbAliquota.ItemIndex := 4
               else
                 if FieldByName('ALIQUOTA').AsFloat = 3.87 then
                   cbAliquota.ItemIndex := 5
                 else
                   if FieldByName('ALIQUOTA').AsFloat = 4.23 then
                     cbAliquota.ItemIndex := 6
                   else
                     if FieldByName('ALIQUOTA').AsFloat = 4.26 then
                       cbAliquota.ItemIndex := 7
                     else
                       if FieldByName('ALIQUOTA').AsFloat = 4.31 then
                         cbAliquota.ItemIndex := 8
                       else
                         if FieldByName('ALIQUOTA').AsFloat = 4.61 then
                           cbAliquota.ItemIndex := 9
                         else
                           if FieldByName('ALIQUOTA').AsFloat = 4.65 then
                             cbAliquota.ItemIndex := 10
                           else
                             if FieldByName('ALIQUOTA').AsFloat = 5 then
                               cbAliquota.ItemIndex := 11;



         EdtPastaSchemas.text    := FieldByName('SCHEMAS').AsString;
         edtNumeroInicialNFS.text    := FieldByName('NUMERO_INICIO_NFS').AsString;
         edtobsOS.Text := FieldByName('OBSERVACAO_OS').AsString;

         ckOS.Checked := Copy(FieldByName('PERMISSAO').AsString,1,1) = 'S';
         ckNFSE.Checked := Copy(FieldByName('PERMISSAO').AsString,2,1) = 'S';
         ckSNGPC.Checked := Copy(FieldByName('PERMISSAO').AsString,3,1) = 'S';
      end;

   dm.IBTransaction.Commit;
   QBuscaPara.Close;
   ExecuteOnExit( Self );
   pg.ActivePageIndex:= 0;
end;

procedure TFrmConfiguracoes.QVarParametrosAfterPost(DataSet: TDataSet);
begin
   TRVarParametros.CommitRetaining;
end;

procedure TFrmConfiguracoes.BtnOk1Click(Sender: TObject);
var
  I: Integer;
begin
   if EdtIniEstoque.Text = '  /  /    ' then
      begin
         if not ( Sender = nil ) then AlertaCad('Digite a data do inicio do estoque');
//         EdtIniEstoque.SetFocus;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with IBSQLPara do
          begin
             close;
             sql.Clear;
             if bGrava then
                sql.Add('UPDATE PARAMETROS SET ESTADO_NFE = :estado_nfei, CLIENTE_PADRAO_VENDA = :1, TIPO_VENDA_PADRAO_VENDA = :3,         ' +
                        'DIAS_CARENCIA = :4, DIAS_NEGATIVACAO = :5, JUROS_ATRASO = :6, LINHAS_FINAL = :7,       ' +
                        'IMP_CABECALHO = :8, IMPRIMIR_NOTA_PROMISSORIA = :9, ATRASO_MAXIMO = :10,               ' +
                        'MOSTRAR_ESTOQUE_VENDA = :13, DATA_INICIO_ESTOQUE = :15, COD_DOC = :17, LANCAR_CHEQUES_CC = :18, ' +
                        'CODIGO_COBRANCA = :20, LANC_CONTABIL = :21, TAMANHO_COMPROVANTE = :30,  ' +
                        'SOMAR_POR_CST_NF = :33,  SALDO_CONCILIADO_CC = :36, SENHA_EXCLUIR_VENDA = :37, DESCONTO_ITEM_VENDA = :38, ' +
                        'DESCONTO_TOTAL_VENDA = :39, DESCONTO_MAXIMO_VENDA = :40, TAMANHO_CODIGO_BALANCA = :41, ' +
                        'IMP_RECIBO_PAGAMENTO = :42, INDICE_NOTA_FISCAL = :43, TIPO_VENDA_PADRAO_PRAZO = :44,   ' +
                        'LANCAR_CHEQUE_CAIXA = :47, DADOS_CONVENIO_COMPROVANTE = :48, ALTERAR_PARCELAS = :49,   ' +
                        'CODVENDA_INICIO_REC = :50, INSTRUCOES_BOLETO = :55, CONS_PROD_RAPIDA_VENDAS = :58, IMP_RECIBO_ECF = :59, ' +
                        'IMPRIMIR_PARCELAS_PENDENTES = :69, DUASLINHAS_ITENS_COMPROVANTE = :70, MOSTRAR_PROMOCAO_VENDAS = :71, ' +
                        'MOSTRAR_SOMENTE_PROD_COM_EST = :75, SOMAR_QTD_ITENS_NF = :77, GERAR_NF_VENDAS = :78, MANTER_DATA_NOTINHA = :79, ' +
                        'PERGUNTA_PARCELA_PENDENTE = :81, MODELO_ETIQUETA_MATRICIAL = :82, ' +
                        'QUANT_MAXIMA_VENDAS = :83, VALOR_MAXIMO_VENDAS = :84, IMPRIMIR_NOME_OPERADOR = :85, ' +
                        'NUMERO_VIAS_COMPROVANTE = :89, GERAR_SINTEGRA = :90, CODIFICACAO_FISCAL = :91, SERIE_NF = :92, TIPO_FRETE_NF = :94, ' +
                        'ESPECIE_NF = :95, MARCA_NF = :96, TIPO_COMPROVANTE = :97, INCLUIR_FRETE_PRIMEIRA_PARCELA = :100, ' +
                        'IMPRIMIR_FATURA_NOTA_FISCAL = :101, HABILITAR_DEVOLUCAO = :103, ' +
                        'ALIQUOTA_PIS = :104, ALIQUOTA_COFINS = :105, ALIQUOTA_IR = :106, ALIQUOTA_CSLL = :107, ALIQUOTA_OUTRAS = :108, ' +
                        'CFOP_CUPOM_ESTADO = :109, CFOP_CUPOM_FORA = :110, INICIAR_VENDAS_FORMA_PAGAMENTO = :118, CONSULTAR_PRODUTO = :119, ' +
                        'PRECO_PESO_BALANCA = :121, IMPRIMIR_SERVICO_ECF = :122, NUMERO_INICIAL_NOTA_FISCAL = :123, SAIDAS_ESTOQUE_NEGATIVO = :124, ' +
                        'ISENTAS_OUTRAS_LIVROS_FISCAIS = :125, CODIGO_LOCAL_ESTOQUE_VENDAS = :126, DEFAULT_LOCAL_ORIGEM = :127, ' +
                        'DEFAULT_LOCAL_DESTINO = :128, CAMINHO_CERTIFICADO = :129, SENHA_CERTIFICADO = :130, NUMERO_SERIE_CERTIFICADO = :131, ' +
                        'TIPO_IMPRESSAO_DANFE = :132, FORMA_EMISSAO_DANFE = :133, CAMINHO_LOGOMARCA_DANFE = :134, SALVAR_LOG_DANFE = :135,    ' +
                        'CAMINHO_LOG_DANFE = :136, AMBIENTE_DANFE = :137, SERVIDOR_SMTP = :138, PORTA_SMTP = :139, USUARIO_SMTP = :140,       ' +
                        'SENHA_SMTP = :141, ASSUNTO_EMAIL_DANFE = :142, SMTP_CONEXAO_SEGURA = :143, MENSAGEM_EMAIL_DANFE = :144,              ' +
                        'PASTA_CANCELADAS_DANFE = :145, PASTA_INUTILIZADAS_DANFE = :146, PASTA_TRANSMITIDAS_DANFE = :147,                     ' +
                        'FROM_SMTP = :148, CAMINHO_ARQUIVOS_PDF = :149, CAMINHO_RELATORIO_DANFE = :150, ' +
                        'PIS_ENTRADAS=:PIS_ENTRADAS, COFINS_ENTRADAS=:COFINS_ENTRADAS, IR_ENTRADAS=:IR_ENTRADAS , '+
                        'CONT_SOCIAL_ENTRADA=:CONT_SOCIAL_ENTRADA,OUTRAS_ENTRADAS=:OUTRAS_ENTRADAS, ' +
                        'COD_CEDENTE = :COD_CEDENTE, TIPO_ENVIO_EMAIL =:TIPO_ENVIO_EMAIL,' +
                        'EST_REMESSA = :EST_REMESSA, PASTA_REMESSA=:PASTA_REMESSA, PASTA_RETORNOS=:PASTA_RETORNOS, PASTA_TXT_SERV=:PASTA_TXT_SERV, ' +
                        'NFCE_NUMERO=:NFCE_NUMERO, NFCE_SERIE=:NFCE_SERIE, NFCE_AMBIENTE=:NFCE_AMBIENTE, '+
                        ' NFCE_PASTA_CANCELADAS=:NFCE_PASTA_CANCELADAS, NFCE_PASTA_INUTILIZADAS=:NFCE_PASTA_INUTILIZADAS,'+
                        ' NFCE_PASTA_TRANSMITIDAS=:NFCE_PASTA_TRANSMITIDAS, NFCE_PASTA_PDF=:NFCE_PASTA_PDF, ' +
                        ' NFCE_ID_TOKEN=:NFCE_ID_TOKEN, NFCE_TOKEN=:NFCE_TOKEN, NFCE_TIPO_FRENTE=:NFCE_TIPO_FRENTE, ' +
                        ' PADROES_ICMS_D=:PADROES_ICMS_D, PADROES_ICMS_F=:PADROES_ICMS_F,' +
                        ' PADROES_CFOP_D=:PADROES_CFOP_D, PADROES_CFOP_F=:PADROES_CFOP_F,' +
                        ' PADROES_CST_D=:PADROES_CST_D, PADROES_CST_F=:PADROES_CST_F,'+
                        ' REST_USA_COMISSAO=:REST_USA_COMISSAO, REST_COMISSAO=:REST_COMISSAO,' +
                        ' REST_SERVICO=:REST_SERVICO, REST_PISCAR=:REST_PISCAR, REST_ATRAZO=:REST_ATRAZO,'+
                            ' REST_ATRAZO_PISCA=:REST_ATRAZO_PISCA, REST_COR_IT=:REST_COR_IT, '+
                            ' REST_COR_IA=:REST_COR_IA, REST_COR_IP=:REST_COR_IP, '+
                            ' REST_COR_PT=:REST_COR_PT, REST_COR_PA=:REST_COR_PA, REST_COR_PP=:REST_COR_PP, '+
                            ' NFE_NOMEEMAIL=:NFE_NOMEEMAIL, NFE_SINCRONO=:NFE_SINCRONO, NFE_VERSAO=:NFE_VERSAO, ' +
                            ' IMAGEM_PREFEITURA =:IMAGEM_PREFEITURA, PREFEITURA =:PREFEITURA, ALIQUOTA =:ALIQUOTA, SCHEMAS=:SCHEMAS, NUMERO_INICIO_NFS=:NUMERO_INICIO_NFS, '+
                            ' OBSERVACAO_OS =:OBSERVACAO_OS, PERMISSAO = :PERMISSAO '+
                        ' WHERE COD_EMP = :11')
                else
                   sql.Add('UPDATE OR INSERT INTO PARAMETROS (ESTADO_NFE, CLIENTE_PADRAO_VENDA, TIPO_VENDA_PADRAO_VENDA, DIAS_CARENCIA, DIAS_NEGATIVACAO, ' +
                           'JUROS_ATRASO, LINHAS_FINAL, IMP_CABECALHO, IMPRIMIR_NOTA_PROMISSORIA, ATRASO_MAXIMO, COD_EMP, ' +
                           'DATA_INICIO_ESTOQUE, MOSTRAR_CLIENTE_VENDA, COD_DOC, LANCAR_CHEQUES_CC, CODIGO_COBRANCA, ' +
                           'LANC_CONTABIL, TAMANHO_COMPROVANTE, SOMAR_POR_CST_NF, SALDO_CONCILIADO_CC, SENHA_EXCLUIR_VENDA, ' +
                           'DESCONTO_ITEM_VENDA, DESCONTO_TOTAL_VENDA, DESCONTO_MAXIMO_VENDA, TAMANHO_CODIGO_BALANCA, IMP_RECIBO_PAGAMENTO, ' +
                           'TIPO_VENDA_PADRAO_PRAZO, INDICE_NOTA_FISCAL, LANCAR_CHEQUE_CAIXA, ' +
                           'DADOS_CONVENIO_COMPROVANTE, ALTERAR_PARCELAS, CODVENDA_INICIO_REC, INSTRUCOES_BOLETO, CONS_PROD_RAPIDA_VENDAS, IMP_RECIBO_ECF, ' +
                           'IMPRIMIR_PARCELAS_PENDENTES, DUASLINHAS_ITENS_COMPROVANTE, ' +
                           'MOSTRAR_PROMOCAO_VENDAS, MOSTRAR_SOMENTE_PROD_COM_EST, SOMAR_QTD_ITENS_NF, ' +
                           'GERAR_NF_VENDAS, MANTER_DATA_NOTINHA, PERGUNTA_PARCELA_PENDENTE, MODELO_ETIQUETA_MATRICIAL, ' +
                           'QUANT_MAXIMA_VENDAS, VALOR_MAXIMO_VENDAS, IMPRIMIR_NOME_OPERADOR, ' +
                           'NUMERO_VIAS_COMPROVANTE, GERAR_SINTEGRA, CODIFICACAO_FISCAL, SERIE_NF, TIPO_FRETE_NF, ESPECIE_NF, ' +
                           'MARCA_NF, TIPO_COMPROVANTE, INCLUIR_FRETE_PRIMEIRA_PARCELA, IMPRIMIR_FATURA_NOTA_FISCAL, ' +
                           'HABILITAR_DEVOLUCAO, ALIQUOTA_PIS, ALIQUOTA_COFINS, ALIQUOTA_IR, ALIQUOTA_CSLL, ' +
                           'ALIQUOTA_OUTRAS, CFOP_CUPOM_ESTADO, CFOP_CUPOM_FORA, INICIAR_VENDAS_FORMA_PAGAMENTO, CONSULTAR_PRODUTO, ' +
                           'PRECO_PESO_BALANCA, IMPRIMIR_SERVICO_ECF, NUMERO_INICIAL_NOTA_FISCAL, SAIDAS_ESTOQUE_NEGATIVO, ISENTAS_OUTRAS_LIVROS_FISCAIS, ' +
                           'CODIGO_LOCAL_ESTOQUE_VENDAS, DEFAULT_LOCAL_ORIGEM, DEFAULT_LOCAL_DESTINO, CAMINHO_CERTIFICADO, SENHA_CERTIFICADO, ' +
                           'NUMERO_SERIE_CERTIFICADO, TIPO_IMPRESSA_DANFE, FORMA_EMISSAO_DANFE, CAMINHO_LOGOMARCA_DANFE, SALVAR_LOG_DANFE, ' +
                           'CAMINHO_LOG_DANFE, AMBIENTE_DANFE, SERVIDOR_SMTP, PORTA_SMTP, USUARIO_SMTP, SENHA_SMTP, ASSUNTO_EMAIL_DANFE, ' +
                           'SMTP_CONEXAO_SEGURA, MENSAGEM_EMAIL_DANFE, PASTA_CANCELADAS_DANFE, PASTA_INUTILIZADAS_DANFE, PASTA_TRANSMITIDAS_DANFE, ' +
                           'FROM_SMTP, CAMINHO_ARQUIVOS_PDF, CAMINHO_RELATORIO_DANFE, COD_CEDENTE, PIS_ENTRADAS, COFINS_ENTRADAS, IR_ENTRADAS , ' +
                           'CONT_SOCIAL_ENTRADA, OUTRAS_ENTRADAS, TIPO_ENVIO_EMAIL, EST_REMESSA, PASTA_REMESSA, PASTA_RETORNOS, PASTA_TXT_SERV,'+
                           'NFCE_NUMERO, NFCE_SERIE, NFCE_AMBIENTE, '+
                           ' NFCE_PASTA_CANCELADAS, NFCE_PASTA_INUTILIZADAS,'+
                            ' NFCE_PASTA_TRANSMITIDAS, NFCE_PASTA_PDF, NFCE_ID_TOKEN, NFCE_TOKEN, NFCE_TIPO_FRENTE,' +
                            ' PADROES_ICMS_D, PADROES_ICMS_F, PADROES_CFOP_D, PADROES_CFOP_F, PADROES_CST_D, PADROES_CST_F, ' +
                            ' REST_USA_COMISSAO, REST_COMISSAO, REST_SERVICO,  REST_PISCAR, REST_ATRAZO,'+
                            ' REST_ATRAZO_PISCA, REST_COR_IT, REST_COR_IA, REST_COR_IP, REST_COR_PT, REST_COR_PA, REST_COR_PP, ' +
                            ' NFE_NOMEEMAIL, NFE_SINCRONO, NFE_VERSAO, IMAGEM_PREFEITURA, PREFEITURA, ALIQUOTA, SCHEMAS, NUMERO_INICIO_NFS, OBSERVACAO_OS, PERMISSAO) ' +

                           'VALUES (:estado_nfei, :1, :3, :4, :5, :6, :7, :8, :9, :10, :11, :13, :15, :17, :18, :19, :20, ' +
                                    ':21, :30, :33, :36, :37, :38, :39, :40, :41, :42, :43, :44, :47, :48, :49, :50, :55, ' +
                                    ':58, :59, :69, :70, :71, :74, :75, :77, :78, :79, :81, :82, :83, :84, :85, :89, ' +
                                    ':90, :91, :92, :94, :95, :96, :97, :100, :101, :103,  :104, :105, :106, :107, :108, ' +
                                    ':109, :110, :118, :119, :121, :122, :123, :124, :125, :126, :127, :128, :129, :130, :131, ' +
                                    ':132, :133, :134, :135, :136, :137, :138, :139, :140, :141, :142, ;143, :144, :145, :146, ' +
                                    ':147, :148, :149, :150, :COD_CEDENTE, :PIS_ENTRADAS, :COFINS_ENTRADAS, :IR_ENTRADAS , ' +
                                    ':CONT_SOCIAL_ENTRADA, :OUTRAS_ENTRADAS, :TIPO_ENVIO_EMAIL, :EST_REMESSA, :PASTA_REMESSA, :PASTA_RETORNOS, :PASTA_TXT_SERV, '+
                                    ':NFCE_NUMERO, :NFCE_SERIE, :NFCE_AMBIENTE, '+
                                    ' :NFCE_PASTA_CANCELADAS, :NFCE_PASTA_INUTILIZADAS,'+
                                    ' :NFCE_PASTA_TRANSMITIDAS, :NFCE_PASTA_PDF, :NFCE_ID_TOKEN, :NFCE_TOKEN, :NFCE_TIPO_FRENTE,' +
                                    ' :PADROES_ICMS_D, :PADROES_ICMS_F, :PADROES_CFOP_D, :PADROES_CFOP_F, :PADROES_CST_D, :PADROES_CST_F , ' +
                                    ' :REST_USA_COMISSAO, :REST_COMISSAO, :REST_SERVICO, :REST_PISCAR, :REST_ATRAZO,'+
                                    ' :REST_ATRAZO_PISCA, :REST_COR_IT, :REST_COR_IA, :REST_COR_IP, :REST_COR_PT, :REST_COR_PA, :REST_COR_PP, :NFE_NOMEEMAIL, :NFE_SINCRONO, :NFE_VERSAO, '+
                                    ' :IMAGEM_PREFEITURA, :PREFEITURA, :ALIQUOTA, :SCHEMAS, :NUMERO_INICIO_NFS, :OBSERVACAO_OS, PERMISSAO ) MATCHING( COD_EMP )');

             // CONFIGURAÇÕES PADROES
//             PADROES_ICMS_D, PADROES_ICMS_F, PADROES_CFOP_D,
//             PADROES_CFOP_F, PADROES_CST_D, PADROES_CST_F
             if edtIcmsD.Text = '' then
                ParamByName( 'PADROES_ICMS_D' ).Value := null
             else
                ParamByName( 'PADROES_ICMS_D' ).AsString := edtIcmsD.Text;
             if edtIcmsF.Text = '' then
                ParamByName( 'PADROES_ICMS_F' ).Value := null
             else
                ParamByName( 'PADROES_ICMS_F' ).AsString := edtIcmsF.Text;
             if edtCfopD.Text = '' then
                ParamByName( 'PADROES_CFOP_D' ).Value := null
             else
                ParamByName( 'PADROES_CFOP_D' ).AsString := edtCfopD.Text;
             if edtCfopF.Text = '' then
                ParamByName( 'PADROES_CFOP_F' ).Value := null
             else
                ParamByName( 'PADROES_CFOP_F' ).AsString := edtCfopF.Text;
             if edtCstD.Text = '' then
                ParamByName( 'PADROES_CST_D' ).Value := null
             else
                ParamByName( 'PADROES_CST_D' ).AsString := edtCstD.Text;
             if edtCstF.Text = '' then
                ParamByName( 'PADROES_CST_F' ).Value := null
             else
                ParamByName( 'PADROES_CST_F' ).AsString := edtCstF.Text;
             // FIM CONFIG PADRAO

             Parambyname('1').AsInteger      := strtoint(cod_cli.Text);
             Parambyname('3').AsInteger      := strtoint(EdtCodTPV.Text);
             Parambyname('4').AsInteger      := strtoint(EdtCarencia.Text);
             Parambyname('5').AsInteger      := strtoint(EdtNegativo.Text);
             Parambyname('6').AsFloat        := strtofloat(EdtJuros.Text);
             Parambyname('7').AsInteger      := strtoint(EdtLinhas.Text);
             ParamByname('estado_nfei').AsString := estado_nfe.Text;
             Parambyname('EST_REMESSA').AsString    := edtEstRemessa.Text;
             Parambyname('PASTA_REMESSA').AsString    := edtPastaRemessa.Text;
             Parambyname('PASTA_RETORNOS').AsString    := edtPastaRetorno.Text;
             ParamByName( 'PASTA_TXT_SERV' ).AsString  := edtPastaTxtServ.Text;

             // ALTERAÇÕES NFC-e
             ParamByName( 'NFCE_NUMERO' ).AsString := NFCeNumero.Text;
             ParamByName( 'NFCE_SERIE' ).AsString := NFCeSerie.Text;
             ParamByName( 'NFCE_AMBIENTE' ).AsInteger := NFCeAmbiente.ItemIndex;
             ParamByName( 'NFCE_PASTA_CANCELADAS' ).AsString := NFCeCancelados.Text;
             ParamByName( 'NFCE_PASTA_INUTILIZADAS' ).AsString := NFCeInutilizados.Text;
             ParamByName( 'NFCE_PASTA_TRANSMITIDAS' ).AsString := NFCeTransmitidos.Text;
             ParamByName( 'NFCE_PASTA_PDF' ).AsString := NFCePDF.Text;
             ParamByName( 'NFCE_ID_TOKEN' ).AsString := edtIDtoken.Text;
             ParamByName( 'NFCE_TOKEN' ).AsString := edtToken.Text;
             ParamByName( 'NFCE_TIPO_FRENTE' ).AsInteger := opTipoFrente.ItemIndex;
             // FIM ALTERAÇÃOS NFC-e


             // ALTERAÇÕES RESTAURANTE
             //REST_USA_COMISSAO, REST_COMISSAO, REST_SERVICO
             ParamByName( 'REST_USA_COMISSAO' ).AsString :=
                        ifthen( chkRest_comissao.Checked, 'S', 'N' );
             ParamByName( 'REST_COMISSAO').AsCurrency := edtRestComissao.Value;
             if edtRest_codpro.Text = '' then
                ParamByName( 'REST_SERVICO' ).Value := Null
             else
                ParamByName( 'REST_SERVICO' ).AsString := edtRest_codpro.Text;
             ParamByName( 'REST_PISCAR' ).AsString := ifthen( edtChkPiscar.Checked,
             'S', 'N' );
             ParamByName( 'REST_ATRAZO' ).AsTime := edtTempoAtrazo.Time;
             ParamByName( 'REST_ATRAZO_PISCA' ).AsTime := edtTempoPiscar.Time;
             ParamByName( 'REST_COR_IT' ).AsString := ColorToString( edt_cor_it.SelectedColor );
             ParamByName( 'REST_COR_IA' ).AsString := ColorToString( edt_cor_ia.SelectedColor );
             ParamByName( 'REST_COR_IP' ).AsString := ColorToString( edt_cor_ip.SelectedColor );

             ParamByName( 'REST_COR_PT' ).AsString := ColorToString( edt_cor_pt.SelectedColor );
             ParamByName( 'REST_COR_PA' ).AsString := ColorToString( edt_cor_pa.SelectedColor );
             ParamByName( 'REST_COR_PP' ).AsString := ColorToString( edt_cor_pp.SelectedColor );
             // FIM ALTERAÇÃOS RESTAURANTE

             if CheckDadosEmp.Checked then
                Parambyname('8').AsString    := 'S'
             else
                Parambyname('8').AsString    := 'N';

             if CheckPromissoria.Checked then
                Parambyname('9').AsString    := 'S'
             else
                Parambyname('9').AsString    := 'N';

             Parambyname('10').AsInteger     := strtoint(EdtAtrazoMaximo.Text);

             Parambyname('11').AsInteger     := iEmp;

             if CheckMostraEstoque.Checked then
                Parambyname('13').AsString   := 'S'
             else
                Parambyname('13').AsString   := 'N';

             Parambyname('15').AsDate        := strtodate(EdtIniEstoque.Text);
             Parambyname('17').AsInteger     := strtoint(cod_doc.Text);

             if CheckCC.Checked then
                Parambyname('18').AsString   := 'S'
             else
                Parambyname('18').AsString   := 'N';

             Parambyname('20').AsInteger     := strtoint(EdtcodCob.Text);

             if CheckContabil.Checked then
                Parambyname('21').AsString   := 'S'
             else
                Parambyname('21').AsString   := 'N';

             Parambyname('30').AsString      := copy(RdgTamanho.Items[RdgTamanho.itemIndex], 1, 1);

             if CheckCSTNF.Checked then
                Parambyname('33').AsString   := 'S'
             else
                Parambyname('33').AsString   := 'N';

             if CheckSaldoConciliado.Checked then
                Parambyname('36').AsString   := 'S'
             else
                Parambyname('36').AsString   := 'N';

             if EdtSenhaExcVenda.Text = '' then
                Parambyname('37').Value      := null
             else
                Parambyname('37').AsString   := EdtSenhaExcVenda.Text;

             if CheckDescItem.Checked then
                Parambyname('38').AsString   := 'S'
             else
                Parambyname('38').AsString   := 'N';

             if CheckDescVenda.Checked then
                Parambyname('39').AsString   := 'S'
             else
                Parambyname('39').AsString   := 'N';

             Parambyname('40').AsFloat       := strtofloat(EdtDescMaximo.Text);

             case ComboTamanho.ItemIndex of
               0: Parambyname('41').Asinteger:= 4;
               1: Parambyname('41').Asinteger:= 5;
               2: Parambyname('41').Asinteger:= 6;
             else
               Parambyname('41').value := null;
             end;

             if CheckRecibo.Checked then
                Parambyname('42').AsString   := 'S'
             else
                Parambyname('42').AsString   := 'N';

             Parambyname('43').AsInteger     := ComboIndiceNota.ItemIndex + 1;

             if trim(EdtCodTVPrazo.Text) = '' then
                Parambyname('44').value      := null
             else
                Parambyname('44').AsInteger  := strtoint(EdtCodTVPrazo.text);

             if CheckCheque.Checked then
                Parambyname('47').AsString   := 'S'
             else
                Parambyname('47').AsString   := 'N';

             if CheckDadosConvenio.Checked then
                Parambyname('48').AsString   := 'S'
             else
                Parambyname('48').AsString   := 'N';

             if CheckParcelas.Checked then
                Parambyname('49').AsString   := 'S'
             else
                Parambyname('49').AsString   := 'N';

             if CheckCodVenda.Checked then
                Parambyname('50').AsString   := 'S'
             else
                Parambyname('50').AsString   := 'N';

             if trim(MemoBoleto.Text) = '' then
                Parambyname('55').Value      := null
             else
                Parambyname('55').AsString   := MemoBoleto.text;

             if CheckConsProdRapida.Checked then
                Parambyname('58').AsString   := 'S'
             else
                Parambyname('58').AsString   := 'N';

             if CheckRecECF.Checked then
                Parambyname('59').AsString   := 'S'
             else
                Parambyname('59').AsString   := 'N';

             if CheckParcPendente.Checked then
                Parambyname('69').AsString   := 'S'
             else
                Parambyname('69').AsString   := 'N';

             if Check2LinhasItens.Checked then
                Parambyname('70').AsString   := 'S'
             else
                Parambyname('70').AsString   := 'N';

             if CheckMostrarPromocao.Checked then
                Parambyname('71').AsString   := 'S'
             else
                Parambyname('71').AsString   := 'N';

             if CheckProdEstoqueFrente.Checked then
                Parambyname('75').AsString   := 'S'
             else
                Parambyname('75').AsString   := 'N';

             if CheckSomarQtdItens.Checked then
                Parambyname('77').AsString   := 'S'
             else
                Parambyname('77').AsString   := 'N';

             if CheckGerarNFVendas.Checked then
                Parambyname('78').AsString   := 'S'
             else
                Parambyname('78').AsString   := 'N';

             if CheckManterDataNotinha.Checked then
                Parambyname('79').AsString   := 'S'
             else
                Parambyname('79').AsString   := 'N';

             if CheckPergunta.Checked then
                Parambyname('81').AsString   := 'S'
             else
                Parambyname('81').AsString   := 'N';

             Parambyname('82').AsInteger     := RDGEtiqueta.ItemIndex + 1;
             Parambyname('83').AsCurrency    := strtocurr(EdtQuantMaximo.Text);
             Parambyname('84').AsCurrency    := strtocurr(EdtValorMaximo.Text);

             if CheckOperador.Checked then
                Parambyname('85').AsString   := 'S'
             else
                Parambyname('85').AsString   := 'N';

             Parambyname('89').AsInteger     := StrToInt(EdtNumVias.text);

             if CheckSintegra.Checked then
                Parambyname('90').AsString   := 'S'
             else
                Parambyname('90').AsString   := 'N';

             Parambyname('91').AsString      := trim(EdtCodModelo.Text);

             if trim(EdtSerieNotaFiscal.Text) = '' then
                Parambyname('92').Value      := null
             else
                Parambyname('92').AsString   := trim(EdtSerieNotaFiscal.Text);
             Parambyname('94').AsInteger     := RdgFrete.ItemIndex;

             if trim(EdtEspecie.Text) = '' then
                Parambyname('95').Value      := null
             else
                Parambyname('95').AsString   := trim(EdtEspecie.Text);

             if trim(EdtMarca.Text) = '' then
                Parambyname('96').Value      := null
             else
                Parambyname('96').AsString   := trim(EdtMarca.Text);
             Parambyname('97').AsInteger     := ComboTipoComprovante.ItemIndex;

             if CheckFrete.Checked then
                Parambyname('100').AsString   := 'S'
             else
                Parambyname('100').AsString   := 'N';

             if CheckFatura.Checked then
                Parambyname('101').AsString   := 'S'
             else
                Parambyname('101').AsString   := 'N';

             if CheckHabilitarDevolucao.Checked then
                Parambyname('103').AsString   := 'S'
             else
                Parambyname('103').AsString   := 'N';

             Parambyname('104').AsCurrency    := strtocurr(EdtAliqPis.Text);
             Parambyname('105').AsCurrency    := strtocurr(EdtAliqCofins.Text);
             Parambyname('106').AsCurrency    := strtocurr(EdtAliqIR.Text);
             Parambyname('107').AsCurrency    := strtocurr(EdtAliqCSLL.Text);
             Parambyname('108').AsCurrency    := strtocurr(EdtAliqOutras.Text);

                //   PIS_ENTRADAS, COFINS_ENTRADAS, IR_ENTRADAS ,
                //    CONT_SOCIAL_ENTRADA, OUTRAS_ENTRADAS
             Parambyname('PIS_ENTRADAS').AsCurrency    := strtocurr(edtPisEntrada.Text);
             Parambyname('COFINS_ENTRADAS').AsCurrency    := strtocurr(edtCofinsEntrada.Text);
             Parambyname('IR_ENTRADAS').AsCurrency    := strtocurr(edtIREntrada.Text);
             Parambyname('CONT_SOCIAL_ENTRADA').AsCurrency    := strtocurr(edtContSocialEntrada.Text);
             Parambyname('OUTRAS_ENTRADAS').AsCurrency    := strtocurr(edtOutrasEntrada.Text);
                // FIM

             if trim(EdtCFOPCupomEstado.Text) = '' then
                Parambyname('109').Value      := null
             else
                Parambyname('109').AsInteger  := strtoint(EdtCFOPCupomEstado.Text);

             if trim(EdtCFOPCupomFora.Text) = '' then
                Parambyname('110').Value      := null
             else
                Parambyname('110').AsInteger  := strtoint(EdtCFOPCupomFora.Text);

             if CheckIniciarForma.Checked then
                Parambyname('118').AsString   := 'S'
             else
                Parambyname('118').AsString   := 'N';

             if CheckConsultarProduto.Checked then
                Parambyname('119').AsString   := 'S'
             else
                Parambyname('119').AsString   := 'N';

             Parambyname('121').AsInteger     := ComboBalanca.ItemIndex;

             if CheckImprimirServico.Checked then
                Parambyname('122').AsString   := 'S'
             else
                Parambyname('122').AsString   := 'N';

             if trim(EdtNumNFInicial.Text) = '' then
                Parambyname('123').AsInteger:= 1
             else
                Parambyname('123').AsInteger:= strtoint(EdtNumNFInicial.Text);

             if CheckEstoqueNegativo.Checked then
                Parambyname('124').AsString   := 'S'
             else
                Parambyname('124').AsString   := 'N';

             Parambyname('125').AsString  := copy(RdgIsentasOutrasLivros.Items[RdgIsentasOutrasLivros.itemindex], 1, 1);
             Parambyname('126').AsInteger := strtoint(EdtCodLocal.Text);
             Parambyname('127').AsInteger := strtoint(EdtCodLocalOrigem.Text);
             Parambyname('128').AsInteger := strtoint(EdtCodLocalDestino.Text);

             Parambyname('129').AsString      := trim(EdtCaminhoCertificado.Text);
             Parambyname('130').AsString      := EdtSenhaCertificado.Text;
             Parambyname('131').AsString      := EdtNumeroSerieCertificado.Text;
             Parambyname('132').AsString      := copy(RdgTipoDanfe.Items[RdgTipoDanfe.itemindex], 1, 1);
             Parambyname('133').AsInteger     := RdgFormaEmissaoDanfe.ItemIndex + 1;
             Parambyname('134').AsString:= trim(EdtLogoMarcaDanfe.Text);

             if CheckSalvarLogDanfe.Checked then
                Parambyname('135').AsString:= 'S'
             else
                Parambyname('135').AsString:= 'N';

             Parambyname('136').AsString   := trim(EdtPathLogsDanfe.Text);
             Parambyname('137').AsString   := copy(RdgAmbienteDanfe.Items[RdgAmbienteDanfe.itemindex], 1, 1);
             Parambyname('138').AsString   := trim(EdtSmtpHost.Text);
             Parambyname('139').AsString   := trim(EdtSmtpPort.Text);
             Parambyname('140').AsString   := trim(EdtSmtpUser.Text);
             Parambyname('141').AsString   := EdtSmtpPass.Text;
             Parambyname('142').AsString   := EdtEmailAssunto.Text;

             if CheckEmailSSL.Checked then
                Parambyname('143').AsString := 'S'
             else
                Parambyname('143').AsString := 'N';

             ParamByName( 'NFE_SINCRONO' ).AsString := IfThen( chkSincrono.Checked, 'S', 'N' );
             ParamByName( 'NFE_NOMEEMAIL' ).AsString := edtEmail_Nome.Text;
             ParamByName( 'NFE_VERSAO' ).AsString := cbbVersaoNFe.Text;


             Parambyname('144').AsString    := trim(MemoEmailMsg.Text);
             Parambyname('145').AsString    := trim(EdtPastaCanceladasDanfe.Text);
             Parambyname('146').AsString    := trim(EdtPastaInutilizadosDanfe.Text);
             Parambyname('147').AsString    := trim(EdtPastaTransmitidosDanfe.Text);
             Parambyname('148').AsString    := trim(EdtSMTPFrom.Text);
             Parambyname('149').AsString    := trim(EdtPastaPDFDanfe.Text);
             Parambyname('150').AsString    := trim(EdtCaminhoRelatorio.Text);
             ParamByName( 'COD_CEDENTE' ).AsString := Trim( edtCodCedente.Text );
             ParamByName( 'TIPO_ENVIO_EMAIL' ).AsInteger := rbTipoEnvio.ItemIndex;
             for I := 0 to ParamCount - 1 do
                 if Params.Items[I].AsString = '' then
                    Params.Items[I].Value := null;

             Parambyname('IMAGEM_PREFEITURA').AsString := Trim(edtImagemPrefeitura.Text);
             Parambyname('PREFEITURA').AsString := Trim(edtPrefeitura.Text);
             //Parambyname('ALIQUOTA').AsFloat := cbAliquota.ItemIndex;
             case cbAliquota.ItemIndex of
               1 : Parambyname('ALIQUOTA').AsFloat := 2;
               2 : Parambyname('ALIQUOTA').AsFloat := 2.79;
               3 : Parambyname('ALIQUOTA').AsFloat := 3.50;

               4 : Parambyname('ALIQUOTA').AsFloat := 3.84;
               5 : Parambyname('ALIQUOTA').AsFloat := 3.87;
               6 : Parambyname('ALIQUOTA').AsFloat := 4.23;
               7 : Parambyname('ALIQUOTA').AsFloat := 4.26;
               8 : Parambyname('ALIQUOTA').AsFloat := 4.31;
               9 : Parambyname('ALIQUOTA').AsFloat := 4.61;
               10 : Parambyname('ALIQUOTA').AsFloat := 4.65;
               11 : Parambyname('ALIQUOTA').AsFloat := 5;
             end;

             Parambyname('SCHEMAS').AsString := Trim(EdtPastaSchemas.text);

             Parambyname('NUMERO_INICIO_NFS').AsString := edtNumeroInicialNFS.Text;
             Parambyname('OBSERVACAO_OS').AsString := edtobsOS.Text;

             Parambyname('PERMISSAO').AsString := IfThen(ckOS.Checked, 'S', 'N');
             Parambyname('PERMISSAO').AsString := Parambyname('PERMISSAO').AsString + IfThen(ckNFSE.Checked, 'S', 'N');
             Parambyname('PERMISSAO').AsString := Parambyname('PERMISSAO').AsString + IfThen(ckSNGPC.Checked, 'S', 'N');
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       if not ( Sender = nil ) then AlertaCad('Erro ao gravar as Configurações');
     end;
   finally
     IBSQLPara.Close;
       if Parent is TcxTabSheet then
          frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
       else
          close;
   end;
end;

procedure TFrmConfiguracoes.btnRest_consproClick(Sender: TObject);
begin
   Application.CreateForm( TFrmConsProd, frmConsProd );
   FrmConsProd.Tag := 103;
   FrmConsProd.ShowModal;
end;

procedure TFrmConfiguracoes.cod_cliKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9', #13, #8]) then
       key:= #0;
end;

procedure TFrmConfiguracoes.cod_cliExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;
   EdtNomeCli.Text:= consulta('cliente', cod_cli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Cliente não Cadastrado');
//         cod_cli.SetFocus;
         cod_cli.SelectAll;
      end;
end;

procedure TFrmConfiguracoes.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 6;
   FrmConsCli.showmodal;
end;

procedure TFrmConfiguracoes.cod_cliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      begin
         Application.CreateForm(TFrmConsCli, FrmConsCli);
         FrmConsCli.tag:= 6;
         FrmConsCli.showmodal;
      end;
end;

procedure TFrmConfiguracoes.EdtCodTPVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      begin
         Application.CreateForm(TFrmConsTipoVenda, FrmConsTipovenda);
         FrmConsTipoVenda.tag:= 1;
         FrmConsTipoVenda.showmodal;
      end;
end;

procedure TFrmConfiguracoes.BtnCondTPVClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
   FrmConsTipoVenda.tag:= 1;
   FrmConsTipoVenda.showmodal;
end;

procedure TFrmConfiguracoes.EdtCodTPVExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;
   EdtNomeTPV.Text:= consulta('tipo_venda', EdtCodTPV, 'cod_tpv', 'nome_tpv', dm.IBTransaction, dm.qConsulta);
   if EdtNomeTPV.Text = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Tipo de Venda não Cadastrado');
//         EdtCodTPV.SetFocus;
         EdtCodTPV.SelectAll;
      end;
end;

procedure TFrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   QVarParametros.Close;
   if TRVarParametros.Active then
      TRVarParametros.Commit;
   action:= caFree;
   DicAligatorTrib.IniciaTributacao( iEmp );
end;

procedure TFrmConfiguracoes.EdtCarenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConfiguracoes.edtCfopDExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      Exit;
   if edtCfopD.Text = '' then
      Exit;
   edtDescCfopD.Text := consulta('CFOP', edtCfopD, 'COD_CFO', 'NOME_CFO', dm.IBTransaction, dm.qConsulta);
end;

procedure TFrmConfiguracoes.edtCfopFExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      Exit;
   if edtCfopF.Text = '' then
      Exit;
   edtDescCfopF.Text := consulta('CFOP', edtCfopF, 'COD_CFO', 'NOME_CFO', dm.IBTransaction, dm.qConsulta);
end;

procedure TFrmConfiguracoes.edtCodCedenteExit(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      DM.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try

       dm.QSacado.Close;
       dm.QSacado.SQL.Text := 'select * from BOLETOS_SACADO where COD=:COD';
       dm.QSacado.ParamByName( 'COD' ).AsInteger := StrToInt( edtCodCedente.Text );
       dm.QSacado.Open;
       if dm.QSacado.IsEmpty then
          begin
             edtDescricaoCedente.Text := 'Cedente Não Encontrado';
             exit;
          end;
       edtDescricaoCedente.Text := DM.QSacadoBANCO.AsString + '.' +
       DM.QSacadoCODIGO_CEDENTE.AsString + ' - '  +
       DM.QSacadoSACADO_NOME.AsString;
       dm.IBTransaction.Commit;
   except
       edtDescricaoCedente.Text := 'Erro ao Buscar Cedente';
       dm.IBTransaction.Rollback;
   end;
end;

procedure TFrmConfiguracoes.BtnConsTipodocClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoDoc, FrmConsTipoDoc);
   FrmConsTipoDoc.tag:= 2;
   FrmConsTipoDoc.showmodal;
end;

procedure TFrmConfiguracoes.cod_docExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;
   EdtNomeTipoDoc.Text:= consulta('tipo_documento', cod_doc, 'cod_doc', 'nome_doc', dm.IBTransaction, dm.qConsulta);
   if EdtNomeTipoDoc.Text = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Tipo de Documento não Cadastrado');
//         cod_doc.SetFocus;
         cod_doc.SelectAll;
      end;
end;

procedure TFrmConfiguracoes.cod_docKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsTipodoc.Click;
end;

procedure TFrmConfiguracoes.cxParametrosDBTableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
//   QVarParametros.Post;
  // AlertaCad( 'Variável ' + QVarParametrosVARIAVEL.AsString + ' Alterada!', 1 );
end;

procedure TFrmConfiguracoes.cxParametrosDBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
           if QVarParametros.State in [ dsEdit, dsInsert ] then
              begin
                 QVarParametros.Post;
                 AlertaCad( 'Variável ' + QVarParametrosVARIAVEL.AsString + ' Alterada!', alertOK );
              end;
      end;
end;

procedure TFrmConfiguracoes.cxParametrosDBTableView1VALORGetPropertiesForEdit(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
//
  if Pos( QVarParametrosTIPO.AsString, 'COMBO/IMP/CHECK' ) > 0 then
     begin
        if not ( AProperties is TcxComboBoxProperties ) then
           AProperties := TcxComboBoxProperties.Create( nil );
        TcxComboBoxProperties( AProperties ).Items.Clear;
        TcxComboBoxProperties( AProperties ).DropDownListStyle := lsFixedList;
     end;
  if Pos( QVarParametrosTIPO.AsString, 'COMBO/CHECK' ) > 0 then
     begin
        TcxComboBoxProperties( AProperties ).Items.Delimiter := ';';
        TcxComboBoxProperties( AProperties ).Items.StrictDelimiter := True;
        TcxComboBoxProperties( AProperties ).Items.DelimitedText := QVarParametrosVALORES_POSSIVEIS.AsString;
     end;
  if Pos( QVarParametrosTIPO.AsString, 'IMP' ) > 0   then
     begin
        TcxComboBoxProperties( AProperties ).Items.Delimiter := ';';
        TcxComboBoxProperties( AProperties ).Items.StrictDelimiter := True;
        KadoshiPrinters.Impressoras.Delimiter := ';';
        KadoshiPrinters.Impressoras.StrictDelimiter := True;
        TcxComboBoxProperties( AProperties ).Items.DelimitedText := KadoshiPrinters.Impressoras.DelimitedText;
        TcxComboBoxProperties( AProperties ).Items.Insert( 0, 'PADRAO' );
     end;
  if Pos( QVarParametrosTIPO.AsString, 'NUM' ) > 0   then
     begin
        if not ( AProperties is TcxSpinEditProperties ) then
          begin
             AProperties := TcxSpinEditProperties.Create( nil );
             TcxSpinEditProperties( AProperties ).ValueType := vtInt;
          end;
     end;
end;

procedure TFrmConfiguracoes.BtnConsCobClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
   FrmConsTipoCobranca.tag:= 4;
   FrmConsTipoCobranca.showmodal;
end;

procedure TFrmConfiguracoes.EdtcodCobExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;
   EdtNomeCob.Text:= consulta('tipo_cobranca', EdtcodCob, 'cod_cob', 'nome_cob', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCob.Text = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Tipo de Cobrança não Cadastrada');
//         EdtcodCob.SetFocus;
         EdtcodCob.SelectAll;
      end;
end;

procedure TFrmConfiguracoes.EdtcodCobKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsCob.Click;
end;

procedure TFrmConfiguracoes.BtnConsTVPrazoClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
   FrmConsTipoVenda.tag:= 4;
   FrmConsTipoVenda.showmodal;
end;

procedure TFrmConfiguracoes.chkRest_comissaoClick(Sender: TObject);
begin
   pnlRestComissoes.Enabled := chkRest_comissao.Checked;
end;

procedure TFrmConfiguracoes.cod_cliEnter(Sender: TObject);
begin
   cod_cli.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodTPVEnter(Sender: TObject);
begin
   EdtCodTPV.SelectAll;
end;

procedure TFrmConfiguracoes.EdtcodCobEnter(Sender: TObject);
begin
   edtcodcob.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodTVPrazoEnter(Sender: TObject);
begin
   EdtCodTVPrazo.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodTVPrazoExit(Sender: TObject);
begin
   if (BtnCanelar1.Focused) or (EdtCodTVPrazo.text = '') then
      begin
         EdtNomeTVPrazo.Clear;
         exit;
      end;
   EdtNomeTVPrazo.Text:= consulta('tipo_venda', EdtCodTVPrazo, 'cod_tpv', 'nome_tpv', dm.IBTransaction, dm.qConsulta);
   if EdtNomeTVPrazo.Text = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Tipo de Venda não Cadastrado');
//         EdtCodTVPrazo.SetFocus;
      end;
end;

procedure TFrmConfiguracoes.EdtCodTVPrazoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsTVPrazo.Click;
end;

procedure TFrmConfiguracoes.edtIcmsDExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      Exit;
   if edtIcmsD.Text = '' then
      Exit;
   edtDescIcmsD.Text := consulta('GRUPO_ICMS', edtIcmsD, 'COD_GRP', 'NOME_GRP', dm.IBTransaction, dm.qConsulta);
end;

procedure TFrmConfiguracoes.edtIcmsFExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      Exit;
   if edtIcmsF.Text = '' then
      Exit;
   edtDescIcmsF.Text := consulta('GRUPO_ICMS', edtIcmsF, 'COD_GRP', 'NOME_GRP', dm.IBTransaction, dm.qConsulta);
end;

procedure TFrmConfiguracoes.edtRest_codproEnter(Sender: TObject);
begin
   edtRest_codpro.SelectAll;
end;

procedure TFrmConfiguracoes.edtRest_codproExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;
   edtRest_descpro.Text:= consulta('produto', edtRest_codpro, 'cod_pro', 'NOME_PRO', dm.IBTransaction, dm.qConsulta);
   if edtRest_descpro.Text = '' then
      begin
         if not ( Sender = nil ) then
            if not ( Sender = nil ) then AlertaCad('Serviço não encontrado não Cadastrado');
////         edtRest_descpro.SetFocus;
  //       edtRest_descpro.SelectAll;
      end;

end;

procedure TFrmConfiguracoes.edtRest_codproKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      begin
//         Application.CreateForm(TFrmConsCli, FrmConsCli);
  //       FrmConsCli.tag:= 6;
    //     FrmConsCli.showmodal;
      end;

end;

procedure TFrmConfiguracoes.edtRest_codproKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (key in ['0'..'9', #13, #8]) then
       key:= #0;

end;

procedure TFrmConfiguracoes.edtSearchParametrosEnter(Sender: TObject);
begin
   AtivaTab := False;
end;

procedure TFrmConfiguracoes.edtSearchParametrosExit(Sender: TObject);
begin
   AtivaTab := true;
end;

procedure TFrmConfiguracoes.edtSearchParametrosKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         QVarParametros.Close;
         QVarParametros.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
         QVarParametros.ParamByName( 'VAR' ).AsString := '%' + edtSearchParametros.Text + '%';
         QVarParametros.Open;
            cxParametrosDBTableView1.ViewData.Expand( False );
      end;
end;

procedure TFrmConfiguracoes.CheckReciboClick(Sender: TObject);
begin
   if not CheckRecibo.Checked then
      begin
         CheckRecECF.Checked:= false;
         CheckRecECF.Enabled:= false;
      end
   else
      begin
         CheckRecECF.Enabled:= true;
      end;
end;

procedure TFrmConfiguracoes.RDGEtiquetaClick(Sender: TObject);
begin
   case RDGEtiqueta.ItemIndex of
    0: begin
          PanelModelo2.Visible:= false;
          PanelModelo3.Visible:= false;
          PanelModelo1.Visible:= true;
       end;
    1: begin
          PanelModelo1.Visible:= false;
          PanelModelo3.Visible:= false;
          PanelModelo2.Visible:= true;
       end;
    2: begin
          PanelModelo1.Visible:= false;
          PanelModelo2.Visible:= false;
          PanelModelo3.Visible:= true;
       end;
   end;
end;

procedure TFrmConfiguracoes.Sair;
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      begin
         Sair;
         Abort;
         Exit;
      end;
end;

procedure TFrmConfiguracoes.BtnConsLocalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.Tag:= 3;
   FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmConfiguracoes.EdtCodLocalExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;

   EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeLocal.Text) = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Local de Estoque não Cadastrado');
//         EdtCodLocal.SetFocus;
      end;
end;

procedure TFrmConfiguracoes.EdtCodLocalEnter(Sender: TObject);
begin
   EdtCodLocal.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodLocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsLocal.Click;
end;

procedure TFrmConfiguracoes.EdtCodLocalOrigemEnter(Sender: TObject);
begin
   EdtCodLocalOrigem.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodLocalOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsLocalOrigem.Click;
end;

procedure TFrmConfiguracoes.EdtCodLocalDestinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsLocalDestino.Click;
end;

procedure TFrmConfiguracoes.EdtCodLocalOrigemExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;

   EdtNomeLocalOrigem.Text:= consulta('locais_estoque', EdtCodLocalOrigem, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeLocalOrigem.Text) = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Local de Estoque não Cadastrado');
//         EdtCodLocalOrigem.SetFocus;
      end;
end;

procedure TFrmConfiguracoes.EdtCodLocalDestinoEnter(Sender: TObject);
begin
   EdtCodLocalDestino.SelectAll;
end;

procedure TFrmConfiguracoes.EdtCodLocalDestinoExit(Sender: TObject);
begin
   if BtnCanelar1.Focused then
      exit;

   EdtNomeLocalDestino.Text:= consulta('locais_estoque', EdtCodLocalDestino, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeLocalDestino.Text) = '' then
      begin
         if not ( Sender = nil ) then AlertaCad('Local de Estoque não Cadastrado');
//         EdtCodLocalDestino.SetFocus;
      end;
end;

procedure TFrmConfiguracoes.BtnConsLocalOrigemClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.Tag:= 9;
   FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmConfiguracoes.BtnConsLocalDestinoClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.Tag:= 10;
   FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmConfiguracoes.sbtnCaminhoCertClick(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Certificado';
   OpenDialog1.DefaultExt := '*.pfx';
   OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      EdtCaminhoCertificado.Text:= OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.sbtnGetCertClick(Sender: TObject);
begin
   {$IFNDEF ACBrNFeOpenSSL}
   EdtNumeroSerieCertificado.Text:= dm.ACBrNFe1.SSL.SelecionarCertificado;
   {$ENDIF}
end;

procedure TFrmConfiguracoes.sbtnPathSalvarClick(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Logo';
   OpenDialog1.DefaultExt := '*.bmp';
   OpenDialog1.Filter     := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      EdtLogoMarcaDanfe.Text := OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.SetAtivaTab(const Value: Boolean);
begin
  FAtivaTab := Value;
end;

procedure TFrmConfiguracoes.SpeedButton1Click(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Relatório';
   OpenDialog1.DefaultExt := '*.fr3';
   OpenDialog1.Filter     := 'Arquivos Relatórios (*.fr3)|*.fr3';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      EdtCaminhoRelatorio.Text := OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.sSpeedButton1Click(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Logo';
   OpenDialog1.DefaultExt := '*.bmp';
   OpenDialog1.Filter     := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      edtImagemPrefeitura.Text := OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.tsParametrosHide(Sender: TObject);
begin
   QVarParametros.Close;
   if TRVarParametros.Active then
      TRVarParametros.Commit;
end;

procedure TFrmConfiguracoes.tsParametrosShow(Sender: TObject);
begin
   if TRVarParametros.Active then
      TRVarParametros.Commit;
   TRVarParametros.StartTransaction;
   QVarParametros.Close;
   QVarParametros.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QVarParametros.ParamByName( 'VAR' ).AsString := '%';
   edtSearchParametros.Clear;
   QVarParametros.Open;
   cxParametrosDBTableView1.ViewData.Expand( False );
end;

procedure TFrmConfiguracoes.AdvGlowButton1Click(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Certificado';
   OpenDialog1.DefaultExt := '*.pfx';
   OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      EdtCaminhoCertificado.Text:= OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.AdvGlowButton2Click(Sender: TObject);
begin
   {$IFNDEF ACBrNFeOpenSSL}
   EdtNumeroSerieCertificado.Text:= dm.ACBrNFe1.SSL.SelecionarCertificado;
   {$ENDIF}
end;

procedure TFrmConfiguracoes.Button1Click(Sender: TObject);
begin
   OpenDialog1.Title      := 'Selecione o Certificado';
   OpenDialog1.DefaultExt := '*.pfx';
   OpenDialog1.Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
   OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);

   if OpenDialog1.Execute then
      EdtCaminhoCertificado.Text:= OpenDialog1.FileName;
end;

procedure TFrmConfiguracoes.Button2Click(Sender: TObject);
begin
   {$IFNDEF ACBrNFeOpenSSL}
   EdtNumeroSerieCertificado.Text:= dm.ACBrNFe1.SSL.SelecionarCertificado;
   {$ENDIF}
end;

end.

