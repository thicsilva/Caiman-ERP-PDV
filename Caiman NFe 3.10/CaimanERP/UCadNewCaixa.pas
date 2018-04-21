unit UCadNewCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadNovoDB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxClasses, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, Vcl.Mask,
  Vcl.ComCtrls, cxTextEdit, cxCurrencyEdit, cxLabel, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.ToolWin, Vcl.DBCtrls, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Expr,
  RzCmboBx, RzDBCmbo, UNovosComponentes, UNovoFormulario, Vcl.Buttons,
  sSpeedButton, cxMaskEdit, cxButtonEdit, cxDBEdit, RzPanel, RzDBNav,
  cxDBLookupComboBox, System.ImageList;

type
  TfrmCadNewCaixa = class(TfrmCadNovoDB)
    upPrincipal: TFDUpdateSQL;
    QPrincipalCOD_CAI: TIntegerField;
    QPrincipalCOD_EMP: TIntegerField;
    QPrincipalTAMANHO_DESC_CUPOM: TIntegerField;
    QPrincipalPORTA_IMP: TStringField;
    QPrincipalDESC_CAI: TStringField;
    QPrincipalINDICE_GAVETA: TIntegerField;
    QPrincipalINDICE_BALANCA: TIntegerField;
    QPrincipalPORTA_BALANCA: TIntegerField;
    QPrincipalBAUD_BALANCA: TIntegerField;
    QPrincipalCASAS_DECIMAIS: TIntegerField;
    QPrincipalCASAS_DECIMAIS_UNITARIO: TIntegerField;
    QPrincipalTRUNCAR_CAI: TStringField;
    QPrincipalIMPRIMIR_COMPROVANTE_ECF: TStringField;
    QPrincipalECF_MFD: TStringField;
    QPrincipalIP_SERVIDOR_TEF: TStringField;
    QPrincipalID_LOJA_TEF: TStringField;
    QPrincipalID_TERMINAL_TEF: TStringField;
    QPrincipalTEF_CAI: TStringField;
    QPrincipalCAMINHO_BANCO: TStringField;
    QPrincipalEXPORTAR_DADOS: TStringField;
    QPrincipalR01_MF_ADICIONAL: TStringField;
    QPrincipalR01_TIPO_ECF: TStringField;
    QPrincipalR01_MARCA_ECF: TStringField;
    QPrincipalR01_MODELO_ECF: TStringField;
    QPrincipalR01_VERSAO_SB: TStringField;
    QPrincipalR01_CNPJ_USUARIO: TStringField;
    QPrincipalR01_IE_USUARIO: TStringField;
    QPrincipalR01_NUMERO_SERIE: TStringField;
    QPrincipalLINHA1: TStringField;
    QPrincipalLINHA2: TStringField;
    QPrincipalLINHA3: TStringField;
    QPrincipalINDICE_GER_OS: TStringField;
    QPrincipalINDICE_GER_ORCAMENTO: TStringField;
    QPrincipalINDICE_GER_MESA: TStringField;
    QPrincipalR01_NUMERO_USUARIO: TIntegerField;
    QPrincipalCODIGO_NACIONAL_IDENTIFICACAO: TStringField;
    QPrincipalR01_DATAHORA_SB: TSQLTimeStampField;
    QPrincipalINTERVALO_RECEBE: TIntegerField;
    QPrincipalINTERVALO_TRANSMITE: TIntegerField;
    QPrincipalDIAS_ATUALIZACAO_PAF: TIntegerField;
    QPrincipalCORTA_PAPEL: TStringField;
    QPrincipalNFCE_SERIE: TIntegerField;
    QPrincipalNFCE_NUMERO: TIntegerField;
    cxVisualizaDBTableView1COD_CAI: TcxGridDBColumn;
    cxVisualizaDBTableView1DESC_CAI: TcxGridDBColumn;
    cxPaginas2: TcxPageControl;
    cxPageDadosCaixa: TcxTabSheet;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    dbedtCOD_ICMS: TDBEdit;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    dbedtDESCRICAO: TDBEdit;
    Panel5: TPanel;
    dbrgrpCASAS_DECIMAIS: TDBRadioGroup;
    dbrgrpCASAS_DECIMAIS_UNITARIO: TDBRadioGroup;
    cxPageBalanca: TcxTabSheet;
    cxLabel3: TcxLabel;
    dbedtTAMANHO_DESC_CUPOM: TDBEdit;
    Panel6: TPanel;
    grpConfigIniCai: TGroupBox;
    dbchkTRUNCAR_CAI: TDBCheckBox;
    dbchkIMPRIMIR_COMPROVANTE_ECF: TDBCheckBox;
    dbchkCORTA_PAPEL: TDBCheckBox;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    cxLabel4: TcxLabel;
    cbbINDICE_GAVETA: TRzDBComboBox;
    cxLabel5: TcxLabel;
    cbbPORTA_IMP: TRzDBComboBox;
    Panel8: TPanel;
    GroupBox2: TGroupBox;
    cxLabel6: TcxLabel;
    cbbINDICE_BALANCA: TRzDBComboBox;
    cxLabel7: TcxLabel;
    cbbPORTA_BALANCA: TRzDBComboBox;
    cxLabel8: TcxLabel;
    cbbBAUD_BALANCA: TRzDBComboBox;
    cxPageECF: TcxTabSheet;
    cxPaginasEcf: TcxPageControl;
    cxPageDadosECF: TcxTabSheet;
    Panel9: TPanel;
    Panel10: TPanel;
    cxLabel9: TcxLabel;
    dbedtR01_TIPO_ECF: TDBEdit;
    Panel11: TPanel;
    cxLabel10: TcxLabel;
    dbedtR01_MARCA_ECF: TDBEdit;
    Panel12: TPanel;
    cxLabel11: TcxLabel;
    dbedtR01_MODELO_ECF: TDBEdit;
    Panel13: TPanel;
    cxLabel12: TcxLabel;
    dbedtCODIGO_NACIONAL_IDENTIFICACAO: TDBEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    cxLabel13: TcxLabel;
    dbedtR01_NUMERO_SERIE: TDBEdit;
    Panel16: TPanel;
    cxLabel14: TcxLabel;
    dbedtR01_CNPJ_USUARIO: TDBEdit;
    Panel17: TPanel;
    cxLabel15: TcxLabel;
    dbedtR01_IE_USUARIO: TDBEdit;
    Panel18: TPanel;
    Panel19: TPanel;
    cxLabel16: TcxLabel;
    dbedtR01_MF_ADICIONAL: TDBEdit;
    Panel20: TPanel;
    cxLabel17: TcxLabel;
    dbedtR01_VERSAO_SB: TDBEdit;
    Panel21: TPanel;
    cxLabel18: TcxLabel;
    dbedtR01_DATAHORA_SB: TDBEdit;
    Panel23: TPanel;
    cxLabel20: TcxLabel;
    dbedtR01_NUMERO_USUARIO: TDBEdit;
    Panel22: TPanel;
    grpDadosComunicador: TGroupBox;
    dbchkEXPORTAR_DADOS: TDBCheckBox;
    cxLabel19: TcxLabel;
    dbedtCAMINHO_BANCO: TDBEdit;
    Panel24: TPanel;
    Panel25: TPanel;
    cxLabel21: TcxLabel;
    dbedtINTERVALO_RECEBE: TDBEdit;
    cxLabel22: TcxLabel;
    dbedtINTERVALO_TRANSMITE: TDBEdit;
    Panel26: TPanel;
    cxLabel23: TcxLabel;
    dbedtDIAS_ATUALIZACAO_PAF: TDBEdit;
    cxPageIndicesRel: TcxTabSheet;
    Panel27: TPanel;
    GroupBox3: TGroupBox;
    cxLabel24: TcxLabel;
    dbedtINDICE_GER_OS: TDBEdit;
    cxLabel25: TcxLabel;
    dbedtINDICE_GER_ORCAMENTO: TDBEdit;
    cxLabel26: TcxLabel;
    dbedtINDICE_GER_MESA: TDBEdit;
    GroupBox4: TGroupBox;
    cxLabel27: TcxLabel;
    dbedtLINHA1: TDBEdit;
    cxLabel28: TcxLabel;
    dbedtLINHA2: TDBEdit;
    cxLabel29: TcxLabel;
    dbedtLINHA3: TDBEdit;
    cxPageIndicesAliq: TcxTabSheet;
    cxPageIndicesFormas: TcxTabSheet;
    QIndicesAliq: TFDQuery;
    QIndicesAliqCOD_CAI: TIntegerField;
    QIndicesAliqCOD_EMP: TIntegerField;
    QIndicesAliqCOD_GRP: TIntegerField;
    QIndicesAliqINDICE_ECF: TStringField;
    QIndicesAliqINDICE_R03: TStringField;
    QIndicesAliqNOME_GRP: TStringField;
    QIndicesAliqALIQUOTA_GRP: TBCDField;
    upIndicesAliq: TFDUpdateSQL;
    cxIndicesAliq: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsInicesAliq: TDataSource;
    cxIndicesAliqCOD_GRP: TcxGridDBColumn;
    cxIndicesAliqINDICE_ECF: TcxGridDBColumn;
    cxIndicesAliqINDICE_R03: TcxGridDBColumn;
    cxIndicesAliqNOME_GRP: TcxGridDBColumn;
    cxIndicesAliqALIQUOTA_GRP: TcxGridDBColumn;
    GroupBox5: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Panel28: TPanel;
    Label32: TLabel;
    EdtCodGrp: TEdit;
    BtnConsGRP: TsSpeedButton;
    Label33: TLabel;
    EdtNomeGrp: TEdit;
    Label34: TLabel;
    EdtIndiceECF: TEdit;
    Label50: TLabel;
    EdtIndiceR03: TEdit;
    BtnGravaAliquota: TBitBtn;
    BtnExcluiAliquota: TBitBtn;
    QIndicesFormas: TFDQuery;
    upIndicesFormas: TFDUpdateSQL;
    QIndicesFormasCOD_CAIXA: TIntegerField;
    QIndicesFormasCOD_EMP: TIntegerField;
    QIndicesFormasCOD_FORMA: TIntegerField;
    QIndicesFormasINDICE: TStringField;
    QIndicesFormasDESCRICAO_ECF: TStringField;
    QIndicesFormasDESCRICAO: TStringField;
    dsIndicesFormas: TDataSource;
    cxIndicesFormasDBTableView1: TcxGridDBTableView;
    cxIndicesFormasLevel1: TcxGridLevel;
    cxIndicesFormas: TcxGrid;
    cxIndicesFormasDBTableView1COD_FORMA: TcxGridDBColumn;
    cxIndicesFormasDBTableView1INDICE: TcxGridDBColumn;
    cxIndicesFormasDBTableView1DESCRICAO_ECF: TcxGridDBColumn;
    cxIndicesFormasDBTableView1DESCRICAO: TcxGridDBColumn;
    Panel29: TPanel;
    Label14: TLabel;
    EdtCodForma: TEdit;
    BtnConsForma: TsSpeedButton;
    Label52: TLabel;
    EdtNomeForma: TEdit;
    Label53: TLabel;
    EdtIndiceForma: TEdit;
    Label54: TLabel;
    EdtDescECF: TEdit;
    BtnGravaForma: TBitBtn;
    BtnExcluiForma: TBitBtn;
    cxPageFluxo: TcxTabSheet;
    QPrincipalFLUXO_TIPO: TIntegerField;
    QPrincipalFLUXO_MOVCX_PAG: TStringField;
    QPrincipalFLUXO_MOVCX_PAG_HIST: TStringField;
    QPrincipalFLUXO_MOVCX_JUROS_HIST: TStringField;
    QPrincipalFLUXO_MOVCX_DESC_HIST: TStringField;
    QPrincipalFLUXO_RECEBIMENTO: TStringField;
    QPrincipalFLUXO_RECEBIMENTO_HIST: TStringField;
    QPrincipalFLUXO_RECEBIMENTO_DESC: TStringField;
    QPrincipalFLUXO_RECEBIMENTO_JUROS: TStringField;
    QPrincipalFLUXO_SALTO_ANTERIOR: TStringField;
    QPrincipalFLUXO_TRANS_SAIDA: TStringField;
    QPrincipalFLUXO_TRANS_ENTRADA: TStringField;
    QPrincipalFLUXO_FATURAMENTO: TStringField;
    Panel30: TPanel;
    Panel31: TPanel;
    dbchkFLUXO_MOVCX_PAG: TDBCheckBox;
    GroupBox6: TGroupBox;
    cxLabel30: TcxLabel;
    DBbFLUXO_MOVCX_PAG_HIST: TcxDBButtonEdit;
    cxLabel31: TcxLabel;
    DBbFLUXO_MOVCX_JUROS_HIST: TcxDBButtonEdit;
    cxLabel32: TcxLabel;
    DBbFLUXO_MOVCX_DESC_HIST: TcxDBButtonEdit;
    Panel32: TPanel;
    dbchkFLUXO_RECEBIMENTO: TDBCheckBox;
    GroupBox7: TGroupBox;
    cxLabel33: TcxLabel;
    DBbFLUXO_RECEBIMENTO_HIST: TcxDBButtonEdit;
    cxLabel34: TcxLabel;
    DBbFLUXO_RECEBIMENTO_JUROS: TcxDBButtonEdit;
    cxLabel35: TcxLabel;
    DBbFLUXO_RECEBIMENTO_DESC: TcxDBButtonEdit;
    Panel33: TPanel;
    dbrgrpFLUXO_TIPO: TDBRadioGroup;
    dbrgrpFLUXO_SALTO_ANTERIOR: TDBRadioGroup;
    Panel34: TPanel;
    Panel35: TPanel;
    GroupBox8: TGroupBox;
    cxLabel36: TcxLabel;
    DBbFLUXO_TRANS_ENTRADA: TcxDBButtonEdit;
    cxLabel37: TcxLabel;
    DBbFLUXO_TRANS_SAIDA: TcxDBButtonEdit;
    dbchkFLUXO_TRANS: TDBCheckBox;
    QPrincipalFLUXO_FATURAMENTO_NOTAS: TStringField;
    QPrincipalFLUXO_FATURAMENTO_VENDAS: TStringField;
    QPrincipalFLUXO_TRANS: TStringField;
    Panel36: TPanel;
    GroupBox9: TGroupBox;
    cxLabel38: TcxLabel;
    DBbFLUXO_FATURAMENTO_NOTAS: TcxDBButtonEdit;
    cxLabel39: TcxLabel;
    DBbFLUXO_FATURAMENTO_VENDAS: TcxDBButtonEdit;
    dbchkFLUXO_FATURAMENTO: TDBCheckBox;
    cxImgButtons: TcxImageList;
    cxPageUsuarios: TcxTabSheet;
    QCaixa_Usuarios: TFDQuery;
    QCaixa_UsuariosCOD_EMP: TIntegerField;
    QCaixa_UsuariosCOD_CAI: TIntegerField;
    QCaixa_UsuariosCOD_USU: TIntegerField;
    QCaixa_UsuariosNOME_USU: TStringField;
    upCaixa_Usuarios: TFDUpdateSQL;
    dsCaixa_Usuarios: TDataSource;
    cxGridUsuariosDBTableView1: TcxGridDBTableView;
    cxGridUsuariosLevel1: TcxGridLevel;
    cxGridUsuarios: TcxGrid;
    cxGridUsuariosDBTableView1COD_USU: TcxGridDBColumn;
    RzDBNavigator1: TRzDBNavigator;
    Panel37: TPanel;
    QUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    QUsuariosCOD_USU: TIntegerField;
    QUsuariosNOME_USU: TStringField;
    QUsuariosSENHA_USU: TStringField;
    QUsuariosCOD_GRUPO: TIntegerField;
    QUsuariosOPERADOR_CAIXA: TStringField;
    QPrincipalFLUXO_SANGRIA_SUPRIMETOS: TStringField;
    QPrincipalFLUXO_SANGRIA: TStringField;
    QPrincipalFLUXO_SUPRIMENTOS: TStringField;
    Panel38: TPanel;
    dbchkFLUXO_SANGRIA_SUPRIMETOS: TDBCheckBox;
    GroupBox10: TGroupBox;
    cxLabel40: TcxLabel;
    DBbFLUXO_SANGRIA: TcxDBButtonEdit;
    cxLabel41: TcxLabel;
    DBbFLUXO_SUPRIMENTOS: TcxDBButtonEdit;
    pnl1: TPanel;
    cxPaginasFluxo: TcxPageControl;
    cxPageFluxoGerais: TcxTabSheet;
    cxTabNFCe: TcxTabSheet;
    Panel39: TPanel;
    cxLabel42: TcxLabel;
    dbedtNFCE_SERIE: TDBEdit;
    Panel40: TPanel;
    cxLabel43: TcxLabel;
    dbedtNFCE_NUMERO: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure cxPageIndicesAliqShow(Sender: TObject);
    procedure EdtCodGrpEnter(Sender: TObject);
    procedure EdtCodGrpExit(Sender: TObject);
    procedure EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure BtnGravaAliquotaClick(Sender: TObject);
    procedure BtnExcluiAliquotaClick(Sender: TObject);
    procedure EdtCodFormaEnter(Sender: TObject);
    procedure EdtCodFormaExit(Sender: TObject);
    procedure EdtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsFormaClick(Sender: TObject);
    procedure cxPageIndicesFormasShow(Sender: TObject);
    procedure BtnExcluiFormaClick(Sender: TObject);
    procedure BtnGravaFormaClick(Sender: TObject);
    procedure QPrincipalAfterScroll(DataSet: TDataSet);
    procedure dbrgrpFLUXO_TIPOChange(Sender: TObject);
    procedure FluxosPlanos(Sender: TObject;
      AButtonIndex: Integer);
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure RzDBNavigator1BeforeAction(Sender: TObject;
      Button: TRzNavigatorButton);
    procedure QCaixa_UsuariosAfterInsert(DataSet: TDataSet);
    procedure cxPaginas2Change(Sender: TObject);
    procedure cxPaginasEcfChange(Sender: TObject);
    procedure cxPageUsuariosShow(Sender: TObject);
    procedure cxGridUsuariosDBTableView1COD_USUPropertiesPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreCaixas;
  end;

  function frmCadNewCaixa: TfrmCadNewCaixa;

implementation

{$R *.dfm}

uses UDM, UNovoPrincipal, UDicLib, UConsGRP, UDialog, UConsFormasPagamento,
  UBuscaPlano, UNewCaixaGrupos;


function frmCadNewCaixa: TfrmCadNewCaixa;
begin
    Result := TfrmCadNewCaixa( BuscaFormulario( TfrmCadNewCaixa, False ) );
end;

procedure TfrmCadNewCaixa.AbreCaixas;
begin
   QPrincipal.Close;
   QPrincipal.SQL.Text := Sql;
   QPrincipal.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   if ( VarToStr( Filtro.ValorFiltro ) <> '' ) and
     ( VarToStr( Filtro.ValorFiltro ) <> '0' ) then
      begin
         QPrincipal.SQL.Add( 'AND' );
         QPrincipal.SQL.Add( Filtro.FieldName + ' LIKE :FILTRO' );
         QPrincipal.ParamByName( 'FILTRO' ).AsString := VarToStr( Filtro.ValorFiltro ) + '%';
      end;
   QPrincipal.Open;
end;

procedure TfrmCadNewCaixa.BtnConsFormaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsFormasPagamento, FrmConsFormasPagamento);
  FrmConsFormasPagamento.Tag:= 2;
  FrmConsFormasPagamento.showmodal;

end;

procedure TfrmCadNewCaixa.BtnConsGRPClick(Sender: TObject);
begin
  inherited;
  application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 24;
  FrmConsGRP.showmodal;
end;

procedure TfrmCadNewCaixa.BtnExcluiAliquotaClick(Sender: TObject);
begin
  inherited;
  if QIndicesAliqCOD_GRP.AsString = '' then
     Exit;
  if KDialog( 'Tem Certeza que deseja excluir este registro?', 'Exclusão', tdtPergunta ) then
    QIndicesAliq.Delete;
  EdtCodGrp.Clear;
  EdtNomeGrp.Clear;
  EdtIndiceECF.Clear;
  EdtIndiceR03.Clear;
  EdtCodGrp.SetFocus;
end;

procedure TfrmCadNewCaixa.BtnExcluiFormaClick(Sender: TObject);
begin
  inherited;
  if QIndicesFormasCOD_FORMA.AsString = '' then
     Exit;
  if KDialog( 'Tem Certeza que deseja excluir este registro?', 'Exclusão', tdtPergunta ) then
    QIndicesFormas.Delete;
  EdtCodForma.Clear;
  EdtNomeForma.Clear;
  EdtIndiceForma.Clear;
  EdtDescECF.Clear;

end;

procedure TfrmCadNewCaixa.BtnGravaAliquotaClick(Sender: TObject);
begin
  inherited;
  if EdtCodGrp.Text = '' then
     Exit;
  QIndicesAliq.Insert;
  QIndicesAliqCOD_CAI.AsInteger := QPrincipalCOD_CAI.AsInteger;
  QIndicesAliqCOD_EMP.AsInteger := iEmp;
  QIndicesAliqCOD_GRP.AsString := EdtCodGrp.Text;
  QIndicesAliqINDICE_ECF.AsString :=EdtIndiceECF.Text;
  QIndicesAliqINDICE_R03.AsString := EdtIndiceR03.Text;
  QIndicesAliq.Post;
  QIndicesAliq.RefreshRecord();
  EdtCodGrp.Clear;
  EdtNomeGrp.Clear;
  EdtIndiceECF.Clear;
  EdtIndiceR03.Clear;
  EdtCodGrp.SetFocus;
end;

procedure TfrmCadNewCaixa.BtnGravaFormaClick(Sender: TObject);
begin
  inherited;
  if EdtCodForma.Text = '' then
    Exit;
  QIndicesFormas.Insert;
  QIndicesFormasCOD_CAIXA.AsInteger := QPrincipalCOD_CAI.AsInteger;
  QIndicesFormasCOD_EMP.AsInteger := iEmp;
  QIndicesFormasCOD_FORMA.AsString := EdtCodForma.Text;
  QIndicesFormasINDICE.Text := EdtIndiceForma.Text;
  QIndicesFormasDESCRICAO_ECF.AsString := EdtDescECF.Text;
  QIndicesFormas.Post;
  QIndicesFormas.RefreshRecord();
  EdtCodForma.Clear;
  EdtNomeForma.Clear;
  EdtIndiceForma.Clear;
  EdtDescECF.Clear;
end;

procedure TfrmCadNewCaixa.BtnGravarClick(Sender: TObject);
begin
  if QPrincipal.State = dsInsert then
     begin
        QPrincipalCOD_CAI.AsInteger := TDicLib.ProximoCodigo( 'CAIXA',
          'COD_CAI', 'COD_EMP=' + IntToStr( iEmp ), DM.IBDatabase );
     end;
  inherited;
end;

procedure TfrmCadNewCaixa.BtnNovoClick(Sender: TObject);
begin
  inherited;
  if QPrincipal.State = dsInsert then
     QPrincipalCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmCadNewCaixa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  AbreCaixas;
end;

procedure TfrmCadNewCaixa.cxGridUsuariosDBTableView1COD_USUPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  QUsuarios.Refresh;
end;

procedure TfrmCadNewCaixa.cxPageIndicesAliqShow(Sender: TObject);
begin
  inherited;
  QIndicesAliq.Close;
  QIndicesAliq.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QIndicesAliq.ParamByName( 'COD_CAI' ).AsInteger := QPrincipalCOD_CAI.AsInteger;
  QIndicesAliq.Open;
end;

procedure TfrmCadNewCaixa.cxPageIndicesFormasShow(Sender: TObject);
begin
  inherited;
  QIndicesFormas.Close;
  QIndicesFormas.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QIndicesFormas.ParamByName( 'COD_CAI' ).AsInteger := QPrincipalCOD_CAI.AsInteger;
  QIndicesFormas.Open;

end;

procedure TfrmCadNewCaixa.cxPageUsuariosShow(Sender: TObject);
begin
  inherited;
  QUsuarios.Close;
  QUsuarios.Open;
  QCaixa_Usuarios.Close;
  QCaixa_Usuarios.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QCaixa_Usuarios.ParamByName( 'COD_CAI' ).AsInteger := QPrincipalCOD_CAI.AsInteger;
  QCaixa_Usuarios.Open;

end;

procedure TfrmCadNewCaixa.cxPaginas2Change(Sender: TObject);
begin
  inherited;
  if not ( cxPaginas2.ActivePageIndex in [2] ) then
        FechaQuerys;
end;

procedure TfrmCadNewCaixa.cxPaginasEcfChange(Sender: TObject);
begin
  inherited;
  if not ( cxPaginasEcf.ActivePageIndex in [2, 3] ) then
     FechaQuerys;
end;

procedure TfrmCadNewCaixa.FluxosPlanos(
  Sender: TObject; AButtonIndex: Integer);
var
  Str: String;
begin
  inherited;
  if AButtonIndex = 0 then
     begin
          if not ( QPrincipal.State in [ dsInsert, dsEdit ] ) then
             Exit;
          Str := SelecionarPlanoContas.Codigo;
          if Str = '' then
             Exit;
          QPrincipal.FieldByName( TcxDBButtonEdit( Sender ).
           DataBinding.DataField ).AsString := Str;
          Exit;
     end;
  BuscaFormulario( TfrmNewCaixaGrupos, True );
end;

procedure TfrmCadNewCaixa.dbrgrpFLUXO_TIPOChange(Sender: TObject);
begin
  inherited;
  cxPageECF.TabVisible := dbrgrpFLUXO_TIPO.ItemIndex = 0;
end;

procedure TfrmCadNewCaixa.dsPrincipalStateChange(Sender: TObject);
begin
  inherited;
  cxPageIndicesAliq.Enabled := ( dsPrincipal.State in [dsEdit] );
  cxPageIndicesFormas.Enabled := ( dsPrincipal.State in [dsEdit] );
  cxPageUsuarios.Enabled := ( dsPrincipal.State in [dsEdit] );
end;

procedure TfrmCadNewCaixa.EdtCodFormaEnter(Sender: TObject);
begin
  inherited;
  ControleComKeyDow := True;
end;

procedure TfrmCadNewCaixa.EdtCodFormaExit(Sender: TObject);
begin
  inherited;
  ControleComKeyDow := False;
  if trim(EdtCodForma.Text) = '' then
     exit;

  if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO ' +
                        'FROM FORMAS_PAGAMENTO    ' +
                        'WHERE CODIGO = :COD';
             Parambyname('cod').AsInteger:= strtoint(EdtCodForma.Text);
             open;
             if not fieldbyname('codigo').IsNull then
                EdtNomeForma.Text:= fieldbyname('descricao').AsString
             else
                begin
                   AlertaCad('Forma de Pagamento não Cadastrada');
//                   EdtCodForma.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a Forma de Pagamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TfrmCadNewCaixa.EdtCodFormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsForma.Click;

end;

procedure TfrmCadNewCaixa.EdtCodGrpEnter(Sender: TObject);
begin
  inherited;
   ControleComKeyDow := True;
end;

procedure TfrmCadNewCaixa.EdtCodGrpExit(Sender: TObject);
begin
  inherited;
   ControleComKeyDow := False;
  if trim(EdtCodGrp.Text) = '' then
     exit;

  if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_GRP, NOME_GRP, ECF ' +
                        'FROM GRUPO_ICMS ' +
                        'WHERE COD_GRP = :CODGRP';
             Parambyname('codgrp').AsInteger:= strtoint(EdtCodGrp.Text);
             open;
             if not fieldbyname('cod_grp').IsNull then
                begin
                   if trim(fieldbyname('ecf').AsString) = 'S' then
                      begin
                         EdtNomeGrp.Text:= fieldbyname('nome_grp').AsString;
                         EdtIndiceECF.SetFocus;
                      end
                   else
                      begin
                         AlertaCad('Grupo não usado em ECF');
//                         EdtCodGrp.SetFocus;
                      end;
                end
             else
                begin
                   AlertaCad('Grupo não Cadastrado');
//                   EdtCodGrp.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o grupo');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TfrmCadNewCaixa.EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
      BtnConsGRP.Click;

end;

procedure TfrmCadNewCaixa.EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
      key:= #0;

end;

procedure TfrmCadNewCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  CodigoTela := 'C016';
  AbreCaixas;
end;

procedure TfrmCadNewCaixa.QCaixa_UsuariosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if QCaixa_Usuarios.State <> dsInsert then
     Exit;
  QCaixa_UsuariosCOD_EMP.AsInteger := iEmp;
  QCaixa_UsuariosCOD_CAI.AsInteger := QPrincipalCOD_CAI.AsInteger;
end;

procedure TfrmCadNewCaixa.QPrincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cxPageECF.TabVisible := QPrincipalFLUXO_TIPO.AsInteger = 0;
end;

procedure TfrmCadNewCaixa.RzDBNavigator1BeforeAction(Sender: TObject;
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

end.
