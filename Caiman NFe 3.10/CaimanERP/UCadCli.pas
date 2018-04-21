unit UCadCli;

interface

uses
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Windows, Messages, 
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UCadNovo, 
  Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, DB, Grids, DBGrids, jpeg, 
  ImgList, ToolWin, ExtDlgs, rxToolEdit, rxCurrEdit, acPNG, RzCmboBx, RzDBCmbo, 
  DBCtrls, acAlphaImageList, ACBrBase, ACBrSocket, ACBrIBPTax, StrUtils, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, dxStatusBar, cxClasses, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, UNovosComponentes, UNovoFormulario, 
  sSpeedButton, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, System.ImageList,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxContainer, Vcl.Menus,
  cxButtons, cxTextEdit, cxCurrencyEdit, cxLabel;

type
  TFrmCadCli = class(TFrmCadastroNovo)
    IBSQLCli: TFDQuery;
    IBTRCli: TFDTransaction;
    QVerficaCliente: TFDQuery;
    QVerficaClienteCOD_CLI: TIntegerField;
    QVerficaClienteNOME_CLI: TStringField;
    QConsClientecli: TFDQuery;
    QConsClientecliCOD_CLI: TIntegerField;
    QConsClientecliFJ_CLI: TStringField;
    QConsClientecliNOME_CLI: TStringField;
    QConsClientecliCOD_CLA: TIntegerField;
    QConsClientecliENDRES_CLI: TStringField;
    QConsClientecliBAIRES_CLI: TStringField;
    QConsClientecliCIDRES_CLI: TStringField;
    QConsClientecliESTRES_CLI: TStringField;
    QConsClientecliCEPRES_CLI: TStringField;
    QConsClientecliTELRES_CLI: TStringField;
    QConsClientecliENDCOM_CLI: TStringField;
    QConsClientecliBAICOM_CLI: TStringField;
    QConsClientecliCIDCOM_CLI: TStringField;
    QConsClientecliESTCOM_CLI: TStringField;
    QConsClientecliCEPCOM_CLI: TStringField;
    QConsClientecliTELCOM_CLI: TStringField;
    QConsClientecliCNPJ_CLI: TStringField;
    QConsClientecliDOC_CLI: TStringField;
    QConsClientecliPAI_CLI: TStringField;
    QConsClientecliMAE_CLI: TStringField;
    QConsClientecliCONJUGE_CLI: TStringField;
    QConsClientecliESTCIVIL_CLI: TStringField;
    QConsClientecliRENDA_CLI: TBCDField;
    QConsClientecliLIMITE_CLI: TBCDField;
    QConsClientecliPROFISSAO_CLI: TStringField;
    QConsClientecliEMPRESA_TRAB_CLI: TStringField;
    QConsClientecliATIVO_CLI: TStringField;
    QConsClientecliCOD_CON: TIntegerField;
    QConsClientecliOBS_VENDA: TStringField;
    QConsClientecliOBS_CLI: TStringField;
    QConsClientecliNASCIMENTO_CLI: TDateField;
    QConsClientecliDATACADASTRO_CLI: TDateField;
    QConsClientecliATRAZO_MAXIMO_CLI: TIntegerField;
    QConsClientecliCELULAR_CLI: TStringField;
    QConsClientecliIMP_SALDO_PENDENTE_CLI: TStringField;
    QConsClientecliLIMITE_CHEQUE: TBCDField;
    QConsClientecliDATA_CONSULTA_SPC: TDateField;
    QConsClientecliDATA_REGISTRO_SPC: TDateField;
    QConsClientecliDATA_REABILITACAO_SPC: TDateField;
    QConsClientecliSELECIONADO_CLI: TStringField;
    QConsClientecliRENDA_CONJUGE: TBCDField;
    QConsClientecliTRABALHO_CONJUGE: TStringField;
    QConsClientecliPROF_CONJUGE: TStringField;
    QConsClientecliNOME_FANTASIA: TStringField;
    QConsClientecliPONTO_REFERENCIA: TStringField;
    QConsClientecliCONTATO_CLI: TStringField;
    QConsClientecliROTA_CLI: TIntegerField;
    QConsClientecliTIPO_CREDITO_CLI: TStringField;
    QConsClientecliCONTROLAR_LIMITE: TStringField;
    QConsClientecliBAICOB_CLI: TStringField;
    QConsClientecliCIDCOB_CLI: TStringField;
    QConsClientecliESTCOB_CLI: TStringField;
    QConsClientecliCEPCOB_CLI: TStringField;
    QConsClientecliTELCOB_CLI: TStringField;
    QConsClientecliENDCOB_CLI: TStringField;
    QConsClientecliBLOQUEADO_CLI: TStringField;
    QConsClientecliNOME_CON: TStringField;
    QConsClientecliNOME_CLA: TStringField;
    QConsClientecliCALC_SITUACAO: TStringField;
    QConsClientecliINSC_ESTADUAL: TStringField;
    QConsClientecliNUMRES_CLI: TStringField;
    QConsClientecliNUMCOM_CLI: TStringField;
    QConsClientecliNUMCOB_CLI: TStringField;
    QConsClientecliCODIGO_IBGE: TIntegerField;
    QConsClientecliEMAIL_CLI: TStringField;
    QConsClientecliCOD_DEPENDENTE: TIntegerField;
    QConsClientecliNOME_DEPENDENTE: TStringField;
    QConsClientecliGRAU_PARENTESCO: TStringField;
    Dependentes_Imagens: TsAlphaImageList;
    HTTPRIO1: THTTPRIO;
    cxPageControl1: TcxPageControl;
    cxConsulta: TcxTabSheet;
    cxCadastro: TcxTabSheet;
    BtnAddCla: TsSpeedButton;
    BtnAddConvenio: TsSpeedButton;
    BtnConsCla: TsSpeedButton;
    BtnConsConvenio: TsSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label33: TLabel;
    Label4: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label5: TLabel;
    cod_cla: TEdit;
    cod_cli: TEdit;
    ComboFJ: TComboBox;
    EdtCodConvenio: TEdit;
    EdtContato: TEdit;
    EdtDataCadastro: TDateTimePicker;
    EdtFant: TEdit;
    EdtNome: TEdit;
    EdtNomeCla: TEdit;
    EdtNomeConvenio: TEdit;
    RDGAtivo: TRadioGroup;
    RdgBloqueado: TRadioGroup;
    PG: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label32: TLabel;
    Label22: TLabel;
    Label55: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label37: TLabel;
    Label34: TLabel;
    Label23: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label36: TLabel;
    BuscaCnpj: TsSpeedButton;
    EdtCNPJ: TMaskEdit;
    EdtDoc: TEdit;
    EdtNasc: TMaskEdit;
    EdtPai: TEdit;
    EdtMae: TEdit;
    EdtRenda: TCurrencyEdit;
    EdtLimiteCredito: TCurrencyEdit;
    EdtLimiteCheque: TCurrencyEdit;
    EdtAtrazoMaximo: TEdit;
    CheckImpSaldo: TCheckBox;
    EdtConsSPC: TMaskEdit;
    EdtRegSPC: TMaskEdit;
    EdtReabSPC: TMaskEdit;
    ComboCredito: TComboBox;
    GBCivil: TGroupBox;
    Label26: TLabel;
    Label25: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    ComboCivil: TComboBox;
    EdtConjuge: TEdit;
    EdtRendaConj: TCurrencyEdit;
    EdtProfConj: TEdit;
    EdtTrabalhoConj: TEdit;
    CheckControlarLimite: TCheckBox;
    TabSheet5: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label35: TLabel;
    Label44: TLabel;
    BtnConsCidade: TsSpeedButton;
    Label47: TLabel;
    Label53: TLabel;
    Label57: TLabel;
    sSpeedButton2: TsSpeedButton;
    Label63: TLabel;
    Label64: TLabel;
    SpeedButton4: TsSpeedButton;
    EdtEndRes: TEdit;
    EdtBaiRes: TEdit;
    EdtCidRes: TEdit;
    ComboEstRes: TComboBox;
    EdtCepRes: TMaskEdit;
    EdtPR: TEdit;
    EdtTelRes: TEdit;
    EdtCel: TEdit;
    EdtIBGE: TEdit;
    EdtNumRes: TEdit;
    EdtEmail: TEdit;
    edtCodPais: TEdit;
    edtPais: TEdit;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label54: TLabel;
    EdtEndCom: TEdit;
    EdtBaiCom: TEdit;
    EdtCidCom: TEdit;
    ComboEstCom: TComboBox;
    EdtCepCom: TMaskEdit;
    EdtEmp: TEdit;
    EdtProf: TEdit;
    EdtTelCom: TEdit;
    EdtNumCom: TEdit;
    TabSheet3: TTabSheet;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label56: TLabel;
    EdtEndCob: TEdit;
    EdtBaiCob: TEdit;
    EdtCidCob: TEdit;
    ComboEstCob: TComboBox;
    EdtCepCob: TMaskEdit;
    EdtTelCob: TEdit;
    EdtNumCob: TEdit;
    TabSheet4: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    MemoObsDiversos: TMemo;
    MemoObsVenda: TMemo;
    TabSheet6: TTabSheet;
    Label58: TLabel;
    SpeedButton1: TsSpeedButton;
    Label59: TLabel;
    Label60: TLabel;
    sSpeedButton1: TsSpeedButton;
    Label61: TLabel;
    cod_dependente: TEdit;
    nome_dependente: TEdit;
    grau_parentesco: TEdit;
    Lista_Dependentes: TTreeView;
    TabSheet7: TTabSheet;
    SpeedButton2: TsSpeedButton;
    SpeedButton3: TsSpeedButton;
    Label62: TLabel;
    edtCodVend: TEdit;
    edtVend: TEdit;
    cxVisualiza: TcxGrid;
    cxVisualizaDBTableView1: TcxGridDBTableView;
    cxNCMs: TcxGridDBTableView;
    cxNCMsNCM: TcxGridDBColumn;
    cxNCMsEX: TcxGridDBColumn;
    cxNCMsDESC_NCM: TcxGridDBColumn;
    cxNCMsDESCRICAO: TcxGridDBColumn;
    cxCEST: TcxGridDBTableView;
    cxCESTCEST: TcxGridDBColumn;
    cxCESTDescricao: TcxGridDBColumn;
    cxVisualizaLevel1: TcxGridLevel;
    dsConsCliente: TDataSource;
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxVisualizaDBTableView1Column2: TcxGridDBColumn;
    cxVisualizaDBTableView1Column3: TcxGridDBColumn;
    cxVisualizaDBTableView1Column4: TcxGridDBColumn;
    Panel3: TPanel;
    lblPesquisa: TcxLabel;
    Panel4: TPanel;
    edtText: TEdit;
    edtCurr: TcxCurrencyEdit;
    edtData: TDateTimePicker;
    edtMask: TMaskEdit;
    btnPesquisar: TcxButton;
    pnlData2: TPanel;
    QConsClientecliCOD_VENDEDOR: TIntegerField;
    QConsClientecliCOD_PAIS: TIntegerField;
    QConsClientecliPAIS: TStringField;
    IBTRAux: TFDTransaction;
    QAux: TFDQuery;
    procedure cod_claKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsClaClick(Sender: TObject);
    procedure cod_claKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboFJChange(Sender: TObject);
    procedure cod_claExit(Sender: TObject);
    procedure EdtCNPJExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodConvenioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodConvenioExit(Sender: TObject);
    procedure BtnConsConvenioClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure ComboCivilChange(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure MemoObsVendaEnter(Sender: TObject);
    procedure MemoObsVendaExit(Sender: TObject);
    procedure MemoObsDiversosEnter(Sender: TObject);
    procedure MemoObsDiversosExit(Sender: TObject);
    procedure MemoObsVendaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNascExit(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    function VerificaCliente: boolean;
    procedure Botoes(acao: string);
    procedure BtnAddClaClick(Sender: TObject);
    procedure BtnAddConvenioClick(Sender: TObject);
    procedure cod_claEnter(Sender: TObject);
    procedure EdtCodConvenioEnter(Sender: TObject);
    procedure EdtConsSPCExit(Sender: TObject);
    procedure ComboCreditoExit(Sender: TObject);
    procedure EdtTelComExit(Sender: TObject);
    procedure EdtFantEnter(Sender: TObject);
    procedure EdtTelCobExit(Sender: TObject);
    procedure BtnConsCidadeClick(Sender: TObject);
    procedure cod_dependenteExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MudaCadastro(COD: integer);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizaGrid(COD: integer);
    procedure Lista_DependentesDblClick(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure BuscaCnpjClick(Sender: TObject);
    procedure edtCodVendExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure edtPaisExit(Sender: TObject);
    procedure CamposObrigatorios;
    procedure EdtCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cxCadastroShow(Sender: TObject);
    procedure cxVisualizaDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    { Private declarations }
    sqlCliente: String;
  public
    { Public declarations }
  end;

 function FrmCadCli: TFrmCadCli;

implementation

uses
  Udm, Ubibli1, UConsClassifCliente, UConsConvenio, UConsCli, 
  UCadClassifCliente, UCadConvenio, UConsMunicipios, cep, UCadVend, UConsVend,
  UConsPais, frmConsultaCPFCNPJ, UNovoPrincipal;

var
  bGrava: boolean;
{$R *.dfm}

function FrmCadCli: TFrmCadCli;
begin
   Result := TFrmCadCli( BuscaFormulario( TFrmCadCli, False ) );
end;

procedure TFrmCadCli.Botoes(acao: string);
begin 
  { (N)OVO
    (G)RAVAR
    (C)ANCELAR
    (A)LTERAR
    (E)EXCLUIR
    (P)ESQUISAR/CONSULTAR }

  if (acao = 'N') or (acao = 'A') then
  begin 
    EDedit(FrmCadCli, true);
    btnNovo.Enabled := false;
    BtnGravar.Enabled := true;
    btnCancelar.Enabled := true;
    BtnAlterar.Enabled := false;
    if acao = 'N' then
    begin 
      Limpaedit(FrmCadCli);
      btnExcluir.Enabled := false;
      AtualizaGrid( 0 );
    end
    else
      btnExcluir.Enabled := true;
    BtnConsultar.Enabled := false;
  end
  else
  begin 
    if not(acao = 'G') then
      Limpaedit(FrmCadCli);
    EDedit(FrmCadCli, false);
    btnNovo.Enabled := true;
    BtnGravar.Enabled := false;
    btnCancelar.Enabled := false;
    if (acao = 'C') or (acao = 'E') then
       begin 
          BtnAlterar.Enabled := false;
          AtualizaGrid( 0 );
       end
    else
      BtnAlterar.Enabled := true;
    if acao = 'G' then
      btnExcluir.Enabled := true
    else
      btnExcluir.Enabled := false;
    BtnConsultar.Enabled := true;
  end;
end;

procedure TFrmCadCli.cod_claKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not(Key in ['0' .. '9', #13, #8]) then
    Key := #0;
end;

procedure TFrmCadCli.cod_dependenteExit(Sender: TObject);
begin 
  inherited;
  if trim(cod_dependente.Text) <> '' then
  begin 
    nome_dependente.Text := consulta('cliente', cod_dependente, 'cod_cli',
      'nome_cli', dm.IBTransaction, dm.qConsulta);
    if nome_dependente.Text = '' then
    begin 
      Application.MessageBox('Cliente não encontrado!', 'Localizar Cliente',
        MB_ICONINFORMATION + MB_OK);
      cod_dependente.clear;
    end;
  end
  else
  begin 
    nome_dependente.clear;
  end;

end;

function TFrmCadCli.VerificaCliente;
begin 
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QVerficaCliente do
  begin 
    close;
    Parambyname('nomecli').AsString := trim(EdtNome.Text);
    Open;
    if recordcount > 0 then
      result := true
    else
      result := false;
    dm.IBTransaction.Commit;
    QVerficaCliente.close;
  end;
end;

procedure TFrmCadCli.BtnConsClaClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsClassifCliente, FrmConsClassifCliente);
  FrmConsClassifCliente.Tag := 1;
  FrmConsClassifCliente.ShowModal;
end;

procedure TFrmCadCli.cod_claKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if Key = vk_f3 then
    BtnConsCla.Click
  else if Key = vk_f2 then
    BtnAddCla.Click;
end;

procedure TFrmCadCli.ComboFJChange(Sender: TObject);
begin 
  inherited;
  if ComboFJ.ItemIndex = 0 then
  begin 
    Label11.Caption := 'CPF';
    Label12.Caption := 'Documento';
    EdtCNPJ.EditMask := '999.999.999-99;1;_';
    Label2.Caption := 'Nome';
    Label43.Caption := 'Apelido';
    EdtNasc.Enabled := true;
    EdtProf.Enabled := true;
    EdtEmp.Enabled := true;
    EdtPai.Enabled := true;
    EdtMae.Enabled := true;
    EdtRenda.Enabled := true;
    EdtContato.Visible := false;
    Label45.Visible := false;
    EdtFant.Width := 473;
    GBCivil.Enabled := true;
  end
  else
  begin 
    Label11.Caption := 'CNPJ';
    Label12.Caption := 'Insc.Estadual';
    EdtCNPJ.EditMask := '99.999.999/9999-99;1;_';
    Label2.Caption := 'Razão Social';
    Label43.Caption := 'Nome Fantasia';
    EdtNasc.Enabled := false;
    EdtProf.Enabled := false;
    EdtEmp.Enabled := false;
    EdtPai.Enabled := false;
    EdtMae.Enabled := false;
    EdtRenda.Enabled := false;
    EdtContato.Visible := true;
    Label45.Visible := true;
    EdtFant.Width := 233;
    GBCivil.Enabled := false;
  end;
end;

procedure TFrmCadCli.cxCadastroShow(Sender: TObject);
var i : Integer;
begin
  limpaedit(FrmCadCli);
  ededit(FrmCadCli, false);
  cod_cli.Text:= QConsClientecliCOD_CLI.AsString;
  edtCodVend.Text := QConsClientecliCOD_VENDEDOR.AsString;
  if edtCodVend.Text <> '' then
      edtVend.Text := consulta('vendedor', edtCodVend, 'cod_vend',
          'nome_vend', IBTRAux, QAux);
  if trim(QConsClientecliFJ_CLI.AsString) = 'F' then
     begin
        ComboFJ.ItemIndex    := 0;
        label11.Caption      := 'CPF';
        label12.Caption      := 'Documento';
        edtcnpj.EditMask     := '999.999.999-99;1;_';
        label2.Caption       := 'Nome(*)';
        label43.Caption      := 'Apelido';
        edtprof.Enabled      := true;
        edtemp.Enabled       := true;
        edtpai.Enabled       := true;
        edtmae.Enabled       := true;
        edtrenda.Enabled     := true;
        EdtContato.Visible   := false;
        label45.Visible      := false;
        EdtFant.Width        := 473;
     end
  else
     begin
        ComboFJ.ItemIndex    := 1;
        label11.Caption      := 'CNPJ';
        label12.Caption      := 'Insc.Estadual';
        edtcnpj.EditMask     := '99.999.999/9999-99;1;_';
        label2.Caption       := 'Razão Social(*)';
        label43.Caption      := 'Nome Fantasia';
        EdtNasc.Enabled      := false;
        edtprof.Enabled      := false;
        edtemp.Enabled       := false;
        edtpai.Enabled       := false;
        edtmae.Enabled       := false;
        edtrenda.Enabled     := false;
        EdtContato.Visible   := true;
        label45.Visible      := true;
        EdtFant.Width        := 233;
     end;
  edtnome.Text          := QConsClientecliNOME_CLI.AsString;
  cod_cla.Text          := QConsClientecliCOD_CLA.AsString;
  edtnomecla.Text       := QConsClientecliNOME_CLA.AsString;
  edtendres.Text        := QConsClientecliENDRES_CLI.AsString;
  edtbaires.Text        := QConsClientecliBAIRES_CLI.AsString;
  edtcidres.Text        := QConsClientecliCIDRES_CLI.AsString;
  for i:= 0 to 26 do
     begin
        if comboestres.Items[i] = QConsClientecliESTRES_CLI.AsString then
           comboestres.ItemIndex:= i;
     end;
  edtcepres.Text        := QConsClientecliCEPRES_CLI.AsString;
  edttelres.Text        := QConsClientecliTELRES_CLI.AsString;
  edtendcom.Text        := QConsClientecliENDCOM_CLI.AsString;
  edtbaicom.Text        := QConsClientecliBAICOM_CLI.AsString;
  edtcidcom.Text        := QConsClientecliCIDCOM_CLI.AsString;
  for i:= 0 to 26 do
     begin
        if comboestcom.Items[i] = QConsClientecliESTCOM_CLI.AsString then
           comboestcom.ItemIndex:= i;
     end;
  edtcepcom.Text        := QConsClientecliCEPCOM_CLI.AsString;
  edttelcom.Text        := QConsClientecliTELCOM_CLI.AsString;
  edtcnpj.Text          := QConsClientecliCNPJ_CLI.AsString;

  if trim(QConsClientecliFJ_CLI.AsString) = 'F' then
     edtdoc.Text:= QConsClientecliDOC_CLI.AsString
  else
     EdtDoc.Text:= QConsClientecliINSC_ESTADUAL.AsString;

  edtpai.Text           := QConsClientecliPAI_CLI.AsString;
  edtmae.Text           := QConsClientecliMAE_CLI.AsString;
  edtconjuge.Text       := QConsClientecliCONJUGE_CLI.AsString;
  if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'C' then
     ComboCivil.ItemIndex := 0
  else
     if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'S' then
        ComboCivil.ItemIndex:= 1
     else
        if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'O' then
           ComboCivil.ItemIndex := 2
        else
           combocivil.ItemIndex:= -1;
  edtrenda.Text         := QConsClientecliRENDA_CLI.AsString;
  EdtLimiteCredito.Text := QConsClientecliLIMITE_CLI.AsString;
  EdtLimiteCheque.Text  := QConsClientecliLIMITE_CHEQUE.AsString;
  edtprof.Text          := QConsClientecliPROFISSAO_CLI.AsString;
  edtemp.Text           := QConsClientecliEMPRESA_TRAB_CLI.AsString;
  if trim(QConsClientecliATIVO_CLI.AsString) = 'S' then
     RDGAtivo.ItemIndex := 0
  else
     RDGAtivo.ItemIndex := 1;

  EdtCodConvenio.Text   := QConsClientecliCOD_CON.AsString;
  EdtNomeConvenio.Text  := QConsClientecliNOME_CON.AsString;

  MemoObsVenda.Text     := QConsClientecliOBS_VENDA.AsString;
  MemoObsDiversos.Text  := QConsClientecliOBS_CLI.AsString;
  edtnasc.Text          := QConsClientecliNASCIMENTO_CLI.AsString;
  edtdatacadastro.Date  := QConsClientecliDATACADASTRO_CLI.Value;
  EdtAtrazoMaximo.Text  := QConsClientecliATRAZO_MAXIMO_CLI.AsString;
  edtcel.Text           := QConsClientecliCELULAR_CLI.AsString;
  if trim(QConsClientecliIMP_SALDO_PENDENTE_CLI.AsString) = 'S' then
     CheckImpSaldo.Checked:= true
  else
     CheckImpSaldo.Checked:= false;

  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'DN' then
     ComboCredito.ItemIndex:= 0
  else
  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'PR' then
     ComboCredito.ItemIndex:= 1
  else
  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'CH' then
     ComboCredito.ItemIndex:= 2
  else
  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'PC' then
     ComboCredito.ItemIndex:= 3
  else
  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'BO' then
     ComboCredito.ItemIndex:= 4
  else
     ComboCredito.ItemIndex:= -1;

  EdtConsSPC.Text     := QConsClientecliDATA_CONSULTA_SPC.AsString;
  EdtRegSPC.Text      := QConsClientecliDATA_REGISTRO_SPC.AsString;
  EdtReabSPC.text     := QConsClientecliDATA_REABILITACAO_SPC.AsString;
  EdtRendaConj.Text   := QConsClientecliRENDA_CONJUGE.AsString;
  EdtTrabalhoConj.Text:= QConsClientecliTRABALHO_CONJUGE.AsString;
  EdtProfConj.Text    := QConsClientecliPROF_CONJUGE.AsString;
  EdtFant.Text        := QConsClientecliNOME_FANTASIA.AsString;
  EdtPR.Text          := QConsClientecliPONTO_REFERENCIA.AsString;
  EdtContato.Text     := QConsClientecliCONTATO_CLI.AsString;
  if trim(QConsClientecliCONTROLAR_LIMITE.AsString) = 'S' then
     CheckControlarLimite.Checked:= true
  else
     CheckControlarLimite.Checked:= false;
  EdtEndCob.Text      := QConsClientecliENDCOB_CLI.AsString;
  EdtBaiCob.Text      := QConsClientecliBAICOB_CLI.AsString;
  EdtCidCob.Text      := QConsClientecliCIDCOB_CLI.AsString;

  for i:= 0 to 26 do
     begin
        if ComboEstCob.Items[i] = QConsClientecliESTCOB_CLI.AsString then
           ComboEstCob.ItemIndex:= i;
     end;
  EdtCepCob.Text      := QConsClientecliCEPCOB_CLI.AsString;
  EdtTelCob.Text      := QConsClientecliTELCOB_CLI.AsString;
  if trim(QConsClientecliBLOQUEADO_CLI.AsString) = 'S' then
     RdgBloqueado.ItemIndex := 0
  else
     RdgBloqueado.ItemIndex := 1;

  EdtIBGE.Text    := QConsClientecliCODIGO_IBGE.AsString;
  EdtNumRes.Text  := QConsClientecliNUMRES_CLI.AsString;
  EdtNumCom.Text  := QConsClientecliNUMCOM_CLI.AsString;
  EdtNumCob.Text  := QConsClientecliNUMCOB_CLI.AsString;
  EdtEmail.Text   := QConsClientecliEMAIL_CLI.AsString;
  cod_dependente.Text  := QConsClientecliCOD_DEPENDENTE.AsString;
  nome_dependente.Text := QConsClientecliNOME_DEPENDENTE.AsString;
  grau_parentesco.Text  := QConsClientecliGRAU_PARENTESCO.AsString;

end;

procedure TFrmCadCli.cxVisualizaDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  cxCadastro.Show;
end;

procedure TFrmCadCli.cod_claExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;
  EdtNomeCla.Text := consulta('classif_cliente', cod_cla, 'cod_cla',
    'nome_cla', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCla.Text = '' then
  begin 
     AlertaCad( 'Classificação não encontrada!' );
//    cod_cla.SetFocus;
  end;
end;

procedure TFrmCadCli.EdtCNPJExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;

  if dm.RetornaStringTabela('cadastrar_cliente_sem_cpf', 'empresa', 'cod_emp',
    iEmp) = 'S' then
  begin 
    if (EdtCNPJ.Text = '   .   .   -  ') or
      (EdtCNPJ.Text = '  .   .   /    -  ') then
    begin
      exit;
    end;
  end
  else
  begin 
    if (EdtCNPJ.Text = '   .   .   -  ') or
      (EdtCNPJ.Text = '  .   .   /    -  ') then
    begin 
      EdtCNPJ.SetFocus;
      exit;
    end;
  end;

  if ComboFJ.ItemIndex = 0 then
  begin 
    try
      if not cpf(RetiraCaracter(EdtCNPJ.Text)) then
      begin 
        AlertaCad('CPF Inválido');
//        EdtCNPJ.SetFocus;
      end;
    except
      EdtCNPJ.SetFocus;
    end;
  end
  else
  begin 

    if not cnpj(EdtCNPJ.Text) then
    begin 
      AlertaCad('CNPJ Inválido');
//      EdtCNPJ.SetFocus;
    end;
  end;

  { VERIFICA SE ESTA CADASTRADO }
  if bGrava then
  begin 
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.qConsulta do
        begin 
          close;
          sql.clear;
          sql.add('SELECT CNPJ_CLI FROM CLIENTE WHERE CNPJ_CLI = ' + #39 +
              EdtCNPJ.Text + #39);
          Open;
          if recordcount > 0 then
          begin 
            AlertaCad('CNPJ/CPF cadastrado');
          end;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        AlertaCad('Erro ao verificar se já existe cnpj/cpf');
      end;
    finally
      dm.qConsulta.close;
    end;
  end;
end;

procedure TFrmCadCli.EdtCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
     vk_f3: BuscaCnpj.Click;
  end;
end;

procedure TFrmCadCli.FormShow(Sender: TObject);
begin 
  inherited;

  if Tag = 0 then
  begin 
    bGrava := true;
    if not dm.Acesso('C009', 'I') then
    begin 
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
      Botoes('C');
    end
    else
    begin
      Botoes('C');
      edtMask.Enabled := True;
      edtMask.Text := '';
      {Botoes('N');
      EdtDataCadastro.Date := Date;
      ComboFJ.ItemIndex := 0;
      ComboFJChange(Sender);
      RDGAtivo.ItemIndex := 0;
      RdgBloqueado.ItemIndex := 1;
      PG.ActivePageIndex := 0;
      ComboEstRes.ItemIndex := 7;
      ComboEstCom.ItemIndex := 7;
      ComboCredito.ItemIndex := 0;
      ComboFJ.SetFocus;}
    end;
  end
  else if Tag = 1 then
    begin 
       Botoes('G');
       AtualizaGrid( StrToint( Cod_Cli.Text ) );
    end;
  btnPesquisarClick(Sender);
end;

procedure TFrmCadCli.Lista_DependentesDblClick(Sender: TObject);
var
   CODIGO: String;
   NOME: String;
begin 
  inherited;
   if ( POS( 'INFORMAÇÃO', Lista_Dependentes.Selected.Text) > 0 ) or  (POS( 'Lista', Lista_Dependentes.Selected.Text) > 0 ) then
      exit;
   CODIGO := copy( Lista_Dependentes.Selected.Text, 1, POS( '-',Lista_Dependentes.Selected.Text ) - 1 );
   NOME := copy( Lista_Dependentes.Selected.Text, 1, POS( '->',Lista_Dependentes.Selected.Text ) - 2 );
  if Application.MessageBox('Deseja alterar entre os cadastros de clientes?',
    'Kadoshi - Dependentes', MB_ICONQUESTION + mb_yesno) = idyes then
     MudaCadastro( StrtoInt( trim( CODIGO ) ) );

end;

procedure TFrmCadCli.EdtCodConvenioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if Key = vk_f3 then
    BtnConsConvenio.Click
  else if Key = vk_f2 then
    BtnAddConvenio.Click;
end;

procedure TFrmCadCli.edtCodVendExit(Sender: TObject);
begin 
  inherited;
    if ToolBar1.Focused then
    exit;
  if edtCodVend.Text = '' then
     exit;
  edtVend.Text := consulta('vendedor', edtCodVend, 'cod_vend',
    'nome_vend', dm.IBTransaction, dm.qConsulta);
  if edtVend.Text = '' then
  begin 
    edtVend.Text := 'Vendedor não Encontrado';
  end;

end;

procedure TFrmCadCli.EdtCodConvenioExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;
  EdtNomeConvenio.Text := consulta('convenio', EdtCodConvenio, 'cod_con',
    'nome_con', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConvenio.Text = '' then
  begin 
    AlertaCad('Convênio não Cadastrado');
//    EdtCodConvenio.SetFocus;
    exit;
  end;

  PG.ActivePageIndex := 0;
  if ComboFJ.ItemIndex = 0 then
    EdtNasc.SetFocus
  else
    EdtCNPJ.SetFocus;
end;

procedure TFrmCadCli.BtnConsConvenioClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
  FrmConsConvenio.Tag := 2;
  FrmConsConvenio.ShowModal;
end;

procedure TFrmCadCli.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  cxCadastro.Show;
  bGrava := true;
  if not dm.Acesso('C009', 'I') then
  begin 
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  Botoes('N');
  EdtDataCadastro.Date := Date;
  ComboFJ.ItemIndex := 0;
  ComboFJChange(Sender);
  RDGAtivo.ItemIndex := 0;
  RdgBloqueado.ItemIndex := 1;
  PG.ActivePageIndex := 0;
  ComboEstRes.ItemIndex := 7;
  ComboEstCom.ItemIndex := 7;
  ComboCredito.ItemIndex := 0;
  edtCodPais.Text := '1058';
  EdtPaiS.Text := 'BRASIL';
  ComboFJ.SetFocus;
end;

procedure TFrmCadCli.btnPesquisarClick(Sender: TObject);
begin
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsClientecli do
    begin
       close;
       sql.Clear;
       SQL.Add('SELECT C.*, O.NOME_CON, S.NOME_CLA '+
               '  FROM CLIENTE C '+
               '       INNER JOIN CONVENIO O ON (C.COD_CON = O.COD_CON) '+
               '       INNER JOIN CLASSIF_CLIENTE S ON (C.COD_CLA = S.COD_CLA)'+
               ' WHERE UPPER(C.NOME_CLI) LIKE UPPER(''%'+edtMask.Text+'%'')' );
       open;
    end;
  dm.IBTransaction.CommitRetaining;
end;

procedure TFrmCadCli.BuscaCnpjClick(Sender: TObject);
  var
    I: Integer;
   Cons: CEPServicePort;
   Ret: String;
   Rua, Cidade, Bairro, Estado, Ibge: String;
begin
  Application.CreateForm( TfmConsultaReceita, fmConsultaReceita );
  if ComboFJ.ItemIndex = 0 then
     fmConsultaReceita.TipoConsulta := consCPF
  else
     fmConsultaReceita.TipoConsulta := consCNPJ;
  fmConsultaReceita.CPFCNPJ := EdtCNPJ.Text;
  if fmConsultaReceita.ShowModal =  mrOk then
     begin
          EdtNome.Text := fmConsultaReceita.Razao;
          EdtFant.Text := fmConsultaReceita.Fantasia;
          edtendres.Text := fmConsultaReceita.Endereco;
          EdtNumRes.Text := fmConsultaReceita.Numero;
          EdtBaiRes.Text := fmConsultaReceita.Bairro;
          EdtCidRes.Text := fmConsultaReceita.Cidade;
          EdtCepRes.Text := FormataCEP( fmConsultaReceita.CEP );
                      for i:= 0 to 26 do
                         begin
                            if ComboEstRes.Items[i] = fmConsultaReceita.UF then
                               ComboEstRes.ItemIndex:= i;
                         end;
        Cons:= GetCEPServicePorT(false,'',HTTPRIO1);
        Ret := Cons.obterLogradouroAuth( EdtCepRes.Text, 'maiconferreira', 'kelly1' );
        ProcessaRetConsCep( Ret, Rua, Bairro, Cidade, Estado, Ibge );
        EdtIBGE.Text := Ibge;
     end;
   FreeAndNil( fmConsultaReceita );
end;

procedure TFrmCadCli.CamposObrigatorios;
begin
      EdtNome.Obrigatorio := True;
      EdtFant.Obrigatorio := True;
      cod_cla.Obrigatorio := True;
      edtCodConvenio.Obrigatorio := True;
      EdtCNPJ.Obrigatorio := True;
end;

procedure TFrmCadCli.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmCadCli.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not dm.Acesso('C009', 'A') then
  begin 
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  bGrava := false;
  Botoes('A');
  EdtNome.SetFocus;
end;

procedure TFrmCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRCli.Active then
    IBTRCli.Commit;
  IBSQLCli.close;
  Action := caFree;
end;

procedure TFrmCadCli.FormCreate(Sender: TObject);
begin 
  inherited;
  CamposObrigatorios;
    sqlCliente := QConsClienteCli.sql.Text;
end;

procedure TFrmCadCli.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not dm.Acesso('C009', 'I')) then
  begin 
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
    Abort;
    exit;
  end;

  { verifica insc.estadual }
  if ComboFJ.ItemIndex = 1 then
  begin 
    if trim(EdtDoc.Text) <> '' then
    begin 
      { if not VerificaInscricao(EdtDoc.Text, ComboEstRes.Text) then
        begin 
        AlertaCad('Inscrição Estadual inválida para ' + ComboEstRes.Text);
//        EdtDoc.SetFocus;
        exit;
        abort;
        end; }
    end;
  end;

  ToolBar1.SetFocus;
  if IBTRCli.Active then
    IBTRCli.Commit;
  IBTRCli.StartTransaction;
  try
    try
      with IBSQLCli do
      begin 
        close;
        sql.clear;
        if bGrava then
        begin 
          cod_cli.Text := inttostr(prxcod('cliente', 'cod_cli',
              dm.IBTransaction, dm.ibsqlcod));
          sql.add(
            'INSERT INTO CLIENTE(COD_CLI, FJ_CLI, NOME_CLI, COD_CLA, ENDRES_CLI, BAIRES_CLI, CIDRES_CLI, '
              +
              'ESTRES_CLI, CEPRES_CLI, TELRES_CLI, ENDCOM_CLI, BAICOM_CLI, CIDCOM_CLI, ESTCOM_CLI, CEPCOM_CLI, '
              + 'TELCOM_CLI, CNPJ_CLI, DOC_CLI, PAI_CLI, MAE_CLI, CONJUGE_CLI, ESTCIVIL_CLI, RENDA_CLI, LIMITE_CLI, '
              +
              'PROFISSAO_CLI, EMPRESA_TRAB_CLI, ATIVO_CLI, COD_CON, OBS_VENDA, OBS_CLI, NASCIMENTO_CLI, DATACADASTRO_CLI, '
              +
              'ATRAZO_MAXIMO_CLI, CELULAR_CLI, IMP_SALDO_PENDENTE_CLI, TIPO_CREDITO_CLI, LIMITE_CHEQUE, '
              +
              'DATA_CONSULTA_SPC, DATA_REGISTRO_SPC, DATA_REABILITACAO_SPC, RENDA_CONJUGE, TRABALHO_CONJUGE, PROF_CONJUGE, '
              +
              'NOME_FANTASIA, PONTO_REFERENCIA, CONTATO_CLI, CONTROLAR_LIMITE, ENDCOB_CLI, BAICOB_CLI, CIDCOB_CLI, ESTCOB_CLI, '
              + 'CEPCOB_CLI, TELCOB_CLI, BLOQUEADO_CLI, INSC_ESTADUAL, CODIGO_IBGE, NUMRES_CLI, NUMCOM_CLI, NUMCOB_CLI, EMAIL_CLI,' +
              'COD_DEPENDENTE, NOME_DEPENDENTE, GRAU_PARENTESCO, COD_VENDEDOR, COD_PAIS, PAIS) ' +
              'VALUES(:CODCLI, :FJCLI, :NOMECLI, :CODCLA, :ENDRESCLI, :BAIRESCLI, :CIDRESCLI, :ESTRESCLI, :CEPRESCLI, ' +
              ':TELRESCLI, :ENDCOMCLI, :BAICOMCLI, :CIDCOMCLI, :ESTCOMCLI, :CEPCOMCLI, :TELCOMCLI, :CNPJCLI, :DOCCLI, ' +
              ':PAICLI, :MAECLI, :CONJUGECLI, :ESTCIVILCLI, :RENDACLI, :LIMITECLI, :PROFISSAOCLI, :EMPRESA_TRABCLI, ' +
              ':ATIVOCLI, :CODCON, :OBSVENDA, :OBSCLI, :NASCIMENTOCLI, :DATACADASTROCLI, :ATRAZO_MAXIMOCLI, ' +
              ':CELULARCLI, :IMPSALDO, :TIPOCRED, :LIMITECHEQUE, :DTCONSSPC, :DTREGSPC, :DTREABSPC, :RENDACONJ, :TRABCONJ, ' +
              ':PROFCONJ, :NF, :PR, :CONTATO, :CONTLIMITE, :ENDCOBCLI, :BAICOBCLI, :CIDCOBCLI, ' +
              ':ESTCOBCLI, :CEPCOBCLI, :TELCOBCLI, :BLOQUEADO, :INSCESTADUAL, :IBGE, :NUMRES, :NUMCOM, :NUMCOB, :EMAIL,' +
              ':COD_DEPENDENTE, :NOME_DEPENDENTE, :GRAU_PARENTESCO, :COD_VENDEDOR, :COD_PAIS, :PAIS )');
        end
        else
        begin 
          sql.add(
            'UPDATE CLIENTE SET FJ_CLI = :FJCLI, NOME_CLI = :NOMECLI, COD_CLA = :CODCLA, ENDRES_CLI = :ENDRESCLI, '
              + 'BAIRES_CLI = :BAIRESCLI, CIDRES_CLI = :CIDRESCLI, ESTRES_CLI = :ESTRESCLI, CEPRES_CLI = :CEPRESCLI, '
              +
              'TELRES_CLI = :TELRESCLI, ENDCOM_CLI = :ENDCOMCLI, BAICOM_CLI = :BAICOMCLI, CIDCOM_CLI = :CIDCOMCLI, ESTCOM_CLI = :ESTCOMCLI, '
              + 'CEPCOM_CLI = :CEPCOMCLI, TELCOM_CLI = :TELCOMCLI, CNPJ_CLI = :CNPJCLI, DOC_CLI = :DOCCLI, PAI_CLI = :PAICLI, '
              +
              'MAE_CLI = :MAECLI, CONJUGE_CLI = :CONJUGECLI, ESTCIVIL_CLI = :ESTCIVILCLI, RENDA_CLI = :RENDACLI, '
              +
              'LIMITE_CLI = :LIMITECLI, PROFISSAO_CLI = :PROFISSAOCLI, EMPRESA_TRAB_CLI = :EMPRESA_TRABCLI, '
              +
              'ATIVO_CLI = :ATIVOCLI, COD_CON = :CODCON, OBS_VENDA = :OBSVENDA, OBS_CLI = :OBSCLI, NASCIMENTO_CLI = :NASCIMENTOCLI, '
              + 'DATACADASTRO_CLI = :DATACADASTROCLI, ATRAZO_MAXIMO_CLI = :ATRAZO_MAXIMOCLI,' +
                'COD_VENDEDOR=:COD_VENDEDOR,  CELULAR_CLI = :CELULARCLI, ' +
                 'IMP_SALDO_PENDENTE_CLI = :IMPSALDO, TIPO_CREDITO_CLI = :TIPOCRED, LIMITE_CHEQUE = :LIMITECHEQUE, ' +
                 'DATA_CONSULTA_SPC = :DTCONSSPC, DATA_REGISTRO_SPC = :DTREGSPC, DATA_REABILITACAO_SPC = :DTREABSPC, ' +
                 'RENDA_CONJUGE = :RENDACONJ, TRABALHO_CONJUGE = :TRABCONJ, PROF_CONJUGE = :PROFCONJ, NOME_FANTASIA = :NF, ' +
                 'PONTO_REFERENCIA = :PR, CONTATO_CLI = :CONTATO, CONTROLAR_LIMITE = :CONTLIMITE, ENDCOB_CLI = :ENDCOBCLI, ' +
                 'BAICOB_CLI = :BAICOBCLI, CIDCOB_CLI = :CIDCOBCLI, ESTCOB_CLI = :ESTCOBCLI, CEPCOB_CLI = :CEPCOBCLI, ' +
                 'TELCOB_CLI = :TELCOBCLI, BLOQUEADO_CLI = :BLOQUEADO, INSC_ESTADUAL = :INSCESTADUAL, CODIGO_IBGE = :IBGE, ' +
                 'NUMRES_CLI = :NUMRES, NUMCOM_CLI = :NUMCOM, NUMCOB_CLI = :NUMCOB, EMAIL_CLI = :EMAIL, ' +
                 'COD_DEPENDENTE = :COD_DEPENDENTE, NOME_DEPENDENTE = :NOME_DEPENDENTE, GRAU_PARENTESCO = :GRAU_PARENTESCO, ' +
                 ' COD_PAIS=:COD_PAIS, PAIS=:PAIS  WHERE COD_CLI = :CODCLI');
        end;
        Parambyname('codcli').AsInteger := strtoint(cod_cli.Text);
        Parambyname('fjcli').AsString := copy(ComboFJ.Text, 1, 1);
        Parambyname('nomecli').AsString := trim(EdtNome.Text);
        Parambyname('codcla').AsInteger := strtoint(cod_cla.Text);
        if  edtCodPais.Text = '' then
            ParamByName( 'cod_pais' ).Value := null
        else
            ParamByName( 'COD_PAIS' ).AsString := edtCodPais.Text;
        ParamByName( 'pais' ).AsString := edtPais.Text;
        if edtCodVend.Text = '' then
           ParamByName('COD_VENDEDOR').Value := null
        else
           ParamByName('COD_VENDEDOR').AsInteger := StrToInt( edtCodVend.Text );
        if EdtEndRes.Text = '' then
          Parambyname('endrescli').Value := null
        else
          Parambyname('endrescli').AsString := trim(EdtEndRes.Text);
        if EdtBaiRes.Text = '' then
          Parambyname('bairescli').Value := null
        else
          Parambyname('bairescli').AsString := trim(EdtBaiRes.Text);
        if EdtCidRes.Text = '' then
          Parambyname('cidrescli').Value := null
        else
          Parambyname('cidrescli').AsString := trim(EdtCidRes.Text);
        if ComboEstRes.ItemIndex = -1 then
          Parambyname('estrescli').Value := null
        else
          Parambyname('estrescli').AsString := ComboEstRes.Text;
        Parambyname('ceprescli').AsString := EdtCepRes.Text;
        Parambyname('telrescli').AsString := EdtTelRes.Text;
        if EdtEndCom.Text = '' then
          Parambyname('endcomcli').Value := null
        else
          Parambyname('endcomcli').AsString := trim(EdtEndCom.Text);
        if EdtBaiCom.Text = '' then
          Parambyname('baicomcli').Value := null
        else
          Parambyname('baicomcli').AsString := trim(EdtBaiCom.Text);
        if EdtCidCom.Text = '' then
          Parambyname('cidcomcli').Value := null
        else
          Parambyname('cidcomcli').AsString := trim(EdtCidCom.Text);
        if ComboEstCom.ItemIndex = -1 then
          Parambyname('estcomcli').Value := null
        else
          Parambyname('estcomcli').AsString := ComboEstCom.Text;
        Parambyname('cepcomcli').AsString := EdtCepCom.Text;
        Parambyname('telcomcli').AsString := EdtTelCom.Text;
        Parambyname('cnpjcli').AsString := EdtCNPJ.Text;
        case ComboFJ.ItemIndex of
          0:
            begin 
              Parambyname('doccli').AsString := trim(EdtDoc.Text);
              Parambyname('inscestadual').Value := null;
            end;
          1:
            begin 
              Parambyname('doccli').Value := null;
              Parambyname('inscestadual').AsString := trim(EdtDoc.Text);
            end;
        else
          begin 
            Parambyname('doccli').Value := null;
            Parambyname('inscestadual').Value := null;
          end;
        end;

        if EdtPai.Text = '' then
          Parambyname('paicli').Value := null
        else
          Parambyname('paicli').AsString := trim(EdtPai.Text);
        if EdtMae.Text = '' then
          Parambyname('maecli').Value := null
        else
          Parambyname('maecli').AsString := trim(EdtMae.Text);
        if EdtConjuge.Text = '' then
          Parambyname('conjugecli').Value := null
        else
          Parambyname('conjugecli').AsString := trim(EdtConjuge.Text);
        if ComboCivil.ItemIndex = -1 then
          Parambyname('estcivilcli').Value := null
        else
          Parambyname('estcivilcli').AsString := copy(ComboCivil.Text, 1, 1);
        Parambyname('rendacli').asfloat := strtofloat(EdtRenda.Text);
        Parambyname('limitecli').asfloat := strtofloat(EdtLimiteCredito.Text);
        Parambyname('limitecheque').asfloat := strtofloat(EdtLimiteCheque.Text);
        if EdtProf.Text = '' then
          Parambyname('profissaocli').Value := null
        else
          Parambyname('profissaocli').AsString := trim(EdtProf.Text);
        if EdtEmp.Text = '' then
          Parambyname('empresa_trabcli').Value := null
        else
          Parambyname('empresa_trabcli').AsString := EdtEmp.Text;
        Parambyname('ativocli').AsString := copy
          (RDGAtivo.Items[RDGAtivo.ItemIndex], 1, 1);
        Parambyname('codcon').AsInteger := strtoint(EdtCodConvenio.Text);
        if MemoObsVenda.Text = '' then
          Parambyname('obsvenda').Value := null
        else
          Parambyname('obsvenda').AsString := MemoObsVenda.Text;
        if MemoObsDiversos.Text = '' then
          Parambyname('obscli').Value := null
        else
          Parambyname('obscli').AsString := MemoObsDiversos.Text;
        if EdtNasc.Text = '  /  /    ' then
          Parambyname('nascimentocli').Value := null
        else
          Parambyname('nascimentocli').AsDate := strtodate(EdtNasc.Text);
        Parambyname('datacadastrocli').AsDate := EdtDataCadastro.Date;
        if EdtAtrazoMaximo.Text = '' then
          Parambyname('atrazo_maximocli').Value := null
        else
          Parambyname('atrazo_maximocli').AsInteger := strtoint
            (EdtAtrazoMaximo.Text);
        Parambyname('celularcli').AsString := EdtCel.Text;
        if CheckImpSaldo.Checked then
          Parambyname('impsaldo').AsString := 'S'
        else
          Parambyname('impsaldo').AsString := 'N';

        case ComboCredito.ItemIndex of
          0:
            Parambyname('tipocred').AsString := 'DN';
          1:
            Parambyname('tipocred').AsString := 'PR';
          2:
            Parambyname('tipocred').AsString := 'CH';
          3:
            Parambyname('tipocred').AsString := 'PC';
          4:
            Parambyname('tipocred').AsString := 'BO';
        end;

        if EdtConsSPC.Text = '  /  /    ' then
          Parambyname('dtconsspc').Value := null
        else
          Parambyname('dtconsspc').AsDate := strtodate(EdtConsSPC.Text);
        if EdtRegSPC.Text = '  /  /    ' then
          Parambyname('dtregspc').Value := null
        else
          Parambyname('dtregspc').AsDate := strtodate(EdtRegSPC.Text);
        if EdtReabSPC.Text = '  /  /    ' then
          Parambyname('dtreabspc').Value := null
        else
          Parambyname('dtreabspc').AsDate := strtodate(EdtReabSPC.Text);
        Parambyname('RENDACONJ').AsCurrency := strtocurr(EdtRendaConj.Text);
        if EdtProfConj.Text = '' then
          Parambyname('profconj').Value := null
        else
          Parambyname('profconj').Value := trim(EdtProfConj.Text);
        if EdtTrabalhoConj.Text = '' then
          Parambyname('trabconj').Value := null
        else
          Parambyname('trabconj').Value := trim(EdtTrabalhoConj.Text);
        if EdtFant.Text = '' then
          Parambyname('nf').Value := null
        else
          Parambyname('nf').AsString := trim(EdtFant.Text);
        if EdtPR.Text = '' then
          Parambyname('pr').Value := null
        else
          Parambyname('pr').AsString := trim(EdtPR.Text);
        if trim(EdtContato.Text) = '' then
          Parambyname('contato').Value := null
        else
          Parambyname('contato').AsString := trim(EdtContato.Text);
        if CheckControlarLimite.Checked then
          Parambyname('contlimite').AsString := 'S'
        else
          Parambyname('contlimite').AsString := 'N';
        if trim(EdtEndCob.Text) = '' then
          Parambyname('endcobcli').Value := null
        else
          Parambyname('endcobcli').AsString := trim(EdtEndCob.Text);
        if trim(EdtBaiCob.Text) = '' then
          Parambyname('baicobcli').Value := null
        else
          Parambyname('baicobcli').AsString := trim(EdtBaiCob.Text);
        if trim(EdtCidCob.Text) = '' then
          Parambyname('cidcobcli').Value := null
        else
          Parambyname('cidcobcli').AsString := trim(EdtCidCob.Text);
        if ComboEstCob.ItemIndex = -1 then
          Parambyname('estcobcli').Value := null
        else
          Parambyname('estcobcli').AsString := ComboEstCob.Text;
        Parambyname('cepcobcli').AsString := EdtCepCob.Text;
        Parambyname('telcobcli').AsString := EdtTelCob.Text;
        Parambyname('bloqueado').AsString := copy
          (RdgBloqueado.Items[RdgBloqueado.ItemIndex], 1, 1);

        if trim(EdtIBGE.Text) = '' then
          Parambyname('ibge').Value := null
        else
          Parambyname('ibge').AsInteger := strtoint(EdtIBGE.Text);

        Parambyname('numres').AsString := trim(EdtNumRes.Text);
        Parambyname('numcom').AsString := trim(EdtNumCom.Text);
        Parambyname('numcob').AsString := trim(EdtNumCob.Text);

        if trim(EdtEmail.Text) = '' then
          Parambyname('email').Value := null
        else
          Parambyname('email').AsString := trim(EdtEmail.Text);

        Parambyname('COD_DEPENDENTE').AsString := trim(cod_dependente.Text);
        Parambyname('NOME_DEPENDENTE').AsString := trim(nome_dependente.Text);
        Parambyname('GRAU_PARENTESCO').AsString := trim(grau_parentesco.Text);

        ExecOrOpen;
      end;
      IBTRCli.Commit;
      Botoes('G');
    except
      IBTRCli.Rollback;
      AlertaCad('Erro ao Gravar o Cliente');
    end;
  finally
    IBSQLCli.close;
  end;
end;

procedure TFrmCadCli.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not dm.Acesso('C009', 'E') then
  begin 
    Application.MessageBox
      ('Você não tem permissão para efetuar esta operação.', 'Aviso',
      mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
    Abort;
    exit;
  end;
  excluir(FrmCadCli, 'cliente', cod_cli, IBSQLCli, IBTRCli);
  Botoes('E');
end;

procedure TFrmCadCli.ComboCivilChange(Sender: TObject);
begin 
  inherited;
  if ComboCivil.ItemIndex = 0 then
  begin 
    EdtConjuge.Enabled := true;
    EdtRendaConj.Enabled := true;
    EdtTrabalhoConj.Enabled := true;
    EdtProfConj.Enabled := true;
  end
  else
  begin 
    EdtConjuge.Enabled := false;
    EdtRendaConj.Enabled := false;
    EdtTrabalhoConj.Enabled := false;
    EdtProfConj.Enabled := false;
  end;
end;

procedure TFrmCadCli.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  cxCadastro.Show;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.Tag := 0;
  FrmConsCli.ShowModal;

end;

procedure TFrmCadCli.MemoObsVendaEnter(Sender: TObject);
begin 
  inherited;
  FrmCadCli.KeyPreview := false;
end;

procedure TFrmCadCli.MemoObsVendaExit(Sender: TObject);
begin 
  inherited;
  FrmCadCli.KeyPreview := true;
end;

procedure TFrmCadCli.MemoObsDiversosEnter(Sender: TObject);
begin 
  inherited;
  FrmCadCli.KeyPreview := false;
end;

procedure TFrmCadCli.MemoObsDiversosExit(Sender: TObject);
begin 
  inherited;
  FrmCadCli.KeyPreview := true;
end;

procedure TFrmCadCli.MemoObsVendaKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  Key := Upcase(Key);
end;

procedure TFrmCadCli.SpeedButton1Click(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.Tag := 44;
  FrmConsCli.ShowModal;
end;

procedure TFrmCadCli.SpeedButton2Click(Sender: TObject);
begin 
  inherited;
//TFrmConsVend ;
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.Tag := 7;
  FrmConsVend.ShowModal;


end;

procedure TFrmCadCli.SpeedButton3Click(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadVend, True );
end;

procedure TFrmCadCli.SpeedButton4Click(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TfrmConsultaPais, frmConsultaPais);
  frmConsultaPais.Tag := 0;
  frmConsultaPais.ShowModal;
end;

procedure TFrmCadCli.sSpeedButton1Click(Sender: TObject);
begin 
  inherited;
   if Cod_Dependente.Text <> '' then
      begin 
         MudaCadastro( StrToInt( Cod_Dependente.Text ) );
      end;
end;

procedure TFrmCadCli.sSpeedButton2Click(Sender: TObject);
var
   Cons: CEPServicePort;
   Ret: String;
   Rua, Cidade, Bairro, Estado, Ibge: String;
   I: Integer;
begin 
  inherited;
  Cons:= GetCEPServicePorT(false,'',HTTPRIO1);
  Ret := Cons.obterLogradouroAuth( EdtCepRes.Text, 'maiconferreira', 'kelly1' );
  ProcessaRetConsCep( Ret, Rua, Bairro, Cidade, Estado, Ibge );
  EdtEndRes.Text := Rua;
  EdtBaiRes.Text := Bairro;
  EdtCidRes.Text := Cidade;
  EdtIBGE.Text := Ibge;
                  for i:= 0 to 26 do
                   begin 
                      if ComboEstRes.Items[i] = Estado then
                         ComboEstRes.ItemIndex:= i;
                   end;

end;

procedure TFrmCadCli.EdtNascExit(Sender: TObject);
begin 
  inherited;
  if (ToolBar1.Focused) or (EdtNasc.Text = '  /  /    ') then
    exit;
  try
    strtodate(EdtNasc.Text);
  except
    AlertaCad('Data Inválida');
//    EdtNasc.SetFocus;
  end;
end;

procedure TFrmCadCli.EdtNomeExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;
  if trim(EdtNome.Text) = '' then
  begin 
//    EdtNome.SetFocus;
    exit;
  end;
  if bGrava then
  begin 
    if VerificaCliente = true then
    begin 
      if Application.MessageBox('Cliente Cadastrado, deseja continuar?',
        'Atenção', mb_ApplModal + mb_iconquestion + mb_yesno + mb_defbutton2)
        = 6 then
        cod_cla.SetFocus
      else
        EdtNome.SetFocus;
    end;
  end;
end;

procedure TFrmCadCli.edtPaisExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;

  if ComboFJ.ItemIndex = 0 then
  begin 
    PG.ActivePageIndex := 2;
    EdtEmp.SetFocus;
  end
  else
  begin 
    PG.ActivePageIndex := 2;
    EdtEndCom.SetFocus;
  end;

end;

procedure TFrmCadCli.BtnAddClaClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadClassifCliente, True );
end;

procedure TFrmCadCli.BtnAddConvenioClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadConvenio, True );
end;

procedure TFrmCadCli.cod_claEnter(Sender: TObject);
begin 
  inherited;
  cod_cla.SelectAll;
end;

procedure TFrmCadCli.EdtCodConvenioEnter(Sender: TObject);
begin 
  inherited;
  EdtCodConvenio.SelectAll;
end;

procedure TFrmCadCli.EdtConsSPCExit(Sender: TObject);
begin 
  inherited;
  with Sender as TMaskEdit do
  begin 
    if (ToolBar1.Focused) or (Text = '  /  /    ') then
      exit;
    try
      strtodate(Text);
    except
      AlertaCad('Data Inválida');
      SetFocus;
    end;
  end;
end;

procedure TFrmCadCli.ComboCreditoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;

  PG.ActivePageIndex := 1;
  EdtEndRes.SetFocus;
end;

procedure TFrmCadCli.EdtTelComExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;

  PG.ActivePageIndex := 3;
  EdtEndCob.SetFocus;
end;

procedure TFrmCadCli.EdtFantEnter(Sender: TObject);
begin 
  inherited;
  if trim(EdtFant.Text) = '' then
    EdtFant.Text := EdtNome.Text;
end;

procedure TFrmCadCli.EdtTelCobExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
    exit;

  PG.ActivePageIndex := 4;
  MemoObsVenda.SetFocus;
end;

procedure TFrmCadCli.BtnConsCidadeClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMunicipios, FrmConsMunicipios);
  FrmConsMunicipios.Tag := 1;
  FrmConsMunicipios.ShowModal;
end;

procedure TFrmCadCli.MudaCadastro(COD: integer);
var
   I: Integer;
begin 
  ToolBar1.SetFocus;
  Botoes('C');
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  QConsClientecli.sql.clear;
  QConsClientecli.SQL.Text := sqlCliente;
  QConsClientecli.sql.add('where COD_CLI=:CODCLI');
  QConsClientecli.Parambyname('CODCLI').AsInteger := COD;
  QConsClientecli.Open;
  Limpaedit(FrmCadCli);
  EDedit(FrmCadCli, false);
  cod_cli.Text := QConsClientecliCOD_CLI.AsString;
  if trim(QConsClientecliFJ_CLI.AsString) = 'F' then
  begin 
    ComboFJ.ItemIndex := 0;
    Label11.Caption := 'CPF';
    Label12.Caption := 'Documento';
    EdtCNPJ.EditMask := '999.999.999-99;1;_';
    Label2.Caption := 'Nome(*)';
    Label43.Caption := 'Apelido';
    EdtProf.Enabled := true;
    EdtEmp.Enabled := true;
    EdtPai.Enabled := true;
    EdtMae.Enabled := true;
    EdtRenda.Enabled := true;
    EdtContato.Visible := false;
    Label45.Visible := false;
    EdtFant.Width := 473;
  end
  else
  begin 
    ComboFJ.ItemIndex := 1;
    Label11.Caption := 'CNPJ';
    Label12.Caption := 'Insc.Estadual';
    EdtCNPJ.EditMask := '99.999.999/9999-99;1;_';
    Label2.Caption := 'Razão Social(*)';
    Label43.Caption := 'Nome Fantasia';
    EdtNasc.Enabled := false;
    EdtProf.Enabled := false;
    EdtEmp.Enabled := false;
    EdtPai.Enabled := false;
    EdtMae.Enabled := false;
    EdtRenda.Enabled := false;
    EdtContato.Visible := true;
    Label45.Visible := true;
    EdtFant.Width := 233;
  end;
  EdtNome.Text := QConsClientecliNOME_CLI.AsString;
  cod_cla.Text := QConsClientecliCOD_CLA.AsString;
  EdtNomeCla.Text := QConsClientecliNOME_CLA.AsString;
  EdtEndRes.Text := QConsClientecliENDRES_CLI.AsString;
  EdtBaiRes.Text := QConsClientecliBAIRES_CLI.AsString;
  EdtCidRes.Text := QConsClientecliCIDRES_CLI.AsString;
  for i := 0 to 26 do
  begin 
    if ComboEstRes.Items[i] = QConsClientecliESTRES_CLI.AsString then
      ComboEstRes.ItemIndex := i;
  end;
  EdtCepRes.Text := QConsClientecliCEPRES_CLI.AsString;
  EdtTelRes.Text := QConsClientecliTELRES_CLI.AsString;
  EdtEndCom.Text := QConsClientecliENDCOM_CLI.AsString;
  EdtBaiCom.Text := QConsClientecliBAICOM_CLI.AsString;
  EdtCidCom.Text := QConsClientecliCIDCOM_CLI.AsString;
  for i := 0 to 26 do
  begin 
    if ComboEstCom.Items[i] = QConsClientecliESTCOM_CLI.AsString then
      ComboEstCom.ItemIndex := i;
  end;
  EdtCepCom.Text := QConsClientecliCEPCOM_CLI.AsString;
  EdtTelCom.Text := QConsClientecliTELCOM_CLI.AsString;
  EdtCNPJ.Text := QConsClientecliCNPJ_CLI.AsString;

  if trim(QConsClientecliFJ_CLI.AsString) = 'F' then
    EdtDoc.Text := QConsClientecliDOC_CLI.AsString
  else
    EdtDoc.Text := QConsClientecliINSC_ESTADUAL.AsString;

  EdtPai.Text := QConsClientecliPAI_CLI.AsString;
  EdtMae.Text := QConsClientecliMAE_CLI.AsString;
  EdtConjuge.Text := QConsClientecliCONJUGE_CLI.AsString;
  if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'C' then
    ComboCivil.ItemIndex := 0
  else if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'S' then
    ComboCivil.ItemIndex := 1
  else if trim(QConsClientecliESTCIVIL_CLI.AsString) = 'O' then
    ComboCivil.ItemIndex := 2
  else
    ComboCivil.ItemIndex := -1;
  EdtRenda.Text := QConsClientecliRENDA_CLI.AsString;
  EdtLimiteCredito.Text := QConsClientecliLIMITE_CLI.AsString;
  EdtLimiteCheque.Text := QConsClientecliLIMITE_CHEQUE.AsString;
  EdtProf.Text := QConsClientecliPROFISSAO_CLI.AsString;
  EdtEmp.Text := QConsClientecliEMPRESA_TRAB_CLI.AsString;
  if trim(QConsClientecliATIVO_CLI.AsString) = 'S' then
    RDGAtivo.ItemIndex := 0
  else
    RDGAtivo.ItemIndex := 1;

  EdtCodConvenio.Text := QConsClientecliCOD_CON.AsString;
  EdtNomeConvenio.Text := QConsClientecliNOME_CON.AsString;

  MemoObsVenda.Text := QConsClientecliOBS_VENDA.AsString;
  MemoObsDiversos.Text := QConsClientecliOBS_CLI.AsString;
  EdtNasc.Text := QConsClientecliNASCIMENTO_CLI.AsString;
  EdtDataCadastro.Date := QConsClientecliDATACADASTRO_CLI.Value;
  EdtAtrazoMaximo.Text := QConsClientecliATRAZO_MAXIMO_CLI.AsString;
  EdtCel.Text := QConsClientecliCELULAR_CLI.AsString;
  if trim(QConsClientecliIMP_SALDO_PENDENTE_CLI.AsString) = 'S' then
    CheckImpSaldo.Checked := true
  else
    CheckImpSaldo.Checked := false;

  if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'DN' then
    ComboCredito.ItemIndex := 0
  else if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'PR' then
    ComboCredito.ItemIndex := 1
  else if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'CH' then
    ComboCredito.ItemIndex := 2
  else if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'PC' then
    ComboCredito.ItemIndex := 3
  else if trim(QConsClientecliTIPO_CREDITO_CLI.AsString) = 'BO' then
    ComboCredito.ItemIndex := 4
  else
    ComboCredito.ItemIndex := -1;

  EdtConsSPC.Text := QConsClientecliDATA_CONSULTA_SPC.AsString;
  EdtRegSPC.Text := QConsClientecliDATA_REGISTRO_SPC.AsString;
  EdtReabSPC.Text := QConsClientecliDATA_REABILITACAO_SPC.AsString;
  EdtRendaConj.Text := QConsClientecliRENDA_CONJUGE.AsString;
  EdtTrabalhoConj.Text := QConsClientecliTRABALHO_CONJUGE.AsString;
  EdtProfConj.Text := QConsClientecliPROF_CONJUGE.AsString;
  EdtFant.Text := QConsClientecliNOME_FANTASIA.AsString;
  EdtPR.Text := QConsClientecliPONTO_REFERENCIA.AsString;
  EdtContato.Text := QConsClientecliCONTATO_CLI.AsString;
  if trim(QConsClientecliCONTROLAR_LIMITE.AsString) = 'S' then
    CheckControlarLimite.Checked := true
  else
    CheckControlarLimite.Checked := false;
  EdtEndCob.Text := QConsClientecliENDCOB_CLI.AsString;
  EdtBaiCob.Text := QConsClientecliBAICOB_CLI.AsString;
  EdtCidCob.Text := QConsClientecliCIDCOB_CLI.AsString;

  for i := 0 to 26 do
  begin 
    if ComboEstCob.Items[i] = QConsClientecliESTCOB_CLI.AsString then
      ComboEstCob.ItemIndex := i;
  end;
  EdtCepCob.Text := QConsClientecliCEPCOB_CLI.AsString;
  EdtTelCob.Text := QConsClientecliTELCOB_CLI.AsString;
  if trim(QConsClientecliBLOQUEADO_CLI.AsString) = 'S' then
    RdgBloqueado.ItemIndex := 0
  else
    RdgBloqueado.ItemIndex := 1;

  EdtIBGE.Text := QConsClientecliCODIGO_IBGE.AsString;
  EdtNumRes.Text := QConsClientecliNUMRES_CLI.AsString;
  EdtNumCom.Text := QConsClientecliNUMCOM_CLI.AsString;
  EdtNumCob.Text := QConsClientecliNUMCOB_CLI.AsString;
  EdtEmail.Text := QConsClientecliEMAIL_CLI.AsString;
  cod_dependente.Text := QConsClientecliCOD_DEPENDENTE.AsString;
  nome_dependente.Text := QConsClientecliNOME_DEPENDENTE.AsString;
  grau_parentesco.Text := QConsClientecliGRAU_PARENTESCO.AsString;
  QConsClientecli.close;
  dm.IBTransaction.Commit;
  Botoes('G');
  AtualizaGrid( COD );
end;

procedure TfrmCadCli.AtualizaGrid(COD: integer);
var
  Itens, SubItens: TTreeNode;
  Titulo, Titulo2: String;

begin 
  if COD = 0 then
     begin 
        lista_Dependentes.Items.Clear;
        exit;
     end;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  QConsClienteCli.SQL.Clear;
  QConsClienteCli.SQL.Text := sqlCliente;
  QConsClienteCli.SQL.Add( 'where COD_DEPENDENTE=:CODCLI' );
  QConsClienteCli.ParamByName( 'CODCLI' ).AsInteger := COD;
  QConsClienteCli.Open;
  if  trim( COD_Dependente.Text ) <> '' then
     begin 
        lista_Dependentes.Items.Clear;
        Titulo2 := 'INFORMAÇÃO : Cliente pertence a um grupo de dependentes';
        Itens := lista_Dependentes.Items.Add( nil, Titulo2 );
        Itens.ImageIndex := 2;
        Itens.SelectedIndex := 2;
        Itens.ExpandedImageIndex := 2;
        QConsClienteCli.Close;
        dm.IBTransaction.Commit;
        exit;
     end;
  if QConsClienteCli.IsEmpty then
     begin 
        lista_Dependentes.Items.Clear;
        Titulo2 := 'INFORMAÇÃO : Cliente não possui dependentes';
        Itens := lista_Dependentes.Items.Add( nil, Titulo2 );
        Itens.ImageIndex := 3;
        Itens.SelectedIndex := 3;
        Itens.ExpandedImageIndex := 3;
        QConsClienteCli.Close;
        dm.IBTransaction.Commit;
        exit;
     end;

  lista_Dependentes.Items.Clear;
  Titulo2 := 'Lista de clientes dependentes';
  Itens := lista_Dependentes.Items.Add( nil, Titulo2 );
  Itens.ImageIndex := 1;
  Itens.SelectedIndex := 1;
  Itens.ExpandedImageIndex := 1;
  QConsClienteCli.First;
  while not QConsClienteCli.Eof do
     begin 
        Titulo := QConsClienteCliCOD_CLI.AsString + ' - ' + QConsClienteCliNOME_CLI.AsString + '      -> ' +
          QConsClienteCliGRAU_PARENTESCO.AsString;
        Subitens  := lista_Dependentes.Items.AddChild( Itens, Titulo );
        SubItens.ImageIndex := 2;
        SubItens.SelectedIndex := 2;
        QConsClienteCli.Next;
     end;
  QConsClienteCli.Close;
  dm.IBTransaction.Commit;
end;

end.
