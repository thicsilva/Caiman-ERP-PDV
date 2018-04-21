unit UContasRecRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DB, 
  RDprint, rxPlacemnt, ImgList, acAlphaImageList, ACBrBoleto, frxClass, Ext, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, cxPC, System.ImageList;

type
  TFrmContasRecRec = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsARec: TFDQuery;
    QConsARecCOD_CTR: TIntegerField;
    QConsARecSEQUENCIA_CTR: TIntegerField;
    QConsARecCOD_EMP: TIntegerField;
    QConsARecDATA_CTR: TDateField;
    QConsARecCOD_VENDA: TIntegerField;
    QConsARecCOD_CLI: TIntegerField;
    QConsARecVENCTO_CTR: TDateField;
    QConsARecVALOR_CTR: TBCDField;
    QConsARecNUMDOCUMENTO_CTR: TStringField;
    DSQConsARec: TDataSource;
    QConsARecDIAS: TFloatField;
    QConsARecACRESCIMO: TFloatField;
    QConsARecTOTAL: TFloatField;
    IBTRCTR: TFDTransaction;
    QConsARecOBS_CTR: TStringField;
    QConsARecJUROS_ATRASO: TBCDField;
    QConsARecDIAS_CARENCIA: TIntegerField;
    QConsARecCOD_COB: TIntegerField;
    QRelPendente: TFDQuery;
    CheckEmp: TCheckBox;
    QConsARecPARCELA_CTR: TIntegerField;
    QTotalPagto: TFDQuery;
    QConsARecCAIXA_EMISSAO_CTR: TIntegerField;
    QConsRec: TFDQuery;
    DSQConsRec: TDataSource;
    Label13: TLabel;
    EdtDataRecebidas: TDateTimePicker;
    QConsRecCOD_CTR: TIntegerField;
    QConsRecSEQUENCIA_CTR: TIntegerField;
    QConsRecCOD_EMP: TIntegerField;
    QConsRecPARCELA_CTR: TIntegerField;
    QConsRecDATA_CTR: TDateField;
    QConsRecCOD_VENDA: TIntegerField;
    QConsRecVENCTO_CTR: TDateField;
    QConsRecVALOR_CTR: TBCDField;
    QConsRecDTPAGTO_CTR: TDateField;
    QConsRecVLRPAGO_CTR: TBCDField;
    QConsRecACRESCIMO_CTR: TBCDField;
    QConsRecDESCONTO_CTR: TBCDField;
    QConsRecACRESCIMO_RECEBIDO_CTR: TBCDField;
    QConsRecDESCONTO_CONCEDIDO_CTR: TBCDField;
    QConsRecCOD_CAI: TIntegerField;
    QConsRecCAIXA_EMISSAO_CTR: TIntegerField;
    QConsARecDEVOLUCAO_CTR: TBCDField;
    QConsRecDEVOLUCAO_CTR: TBCDField;
    EdtDataJuros: TDateTimePicker;
    Label15: TLabel;
    BtnAlterarSituacao: TButton;
    RdgCliente: TRadioButton;
    RdgDocumento: TRadioButton;
    EdtDocumento: UNovosComponentes.TEdit;
    QConsARecNOME_CLI: TStringField;
    RDprint: TRDprint;
    QConsARecCALC_AUTORIZADO: TStringField;
    QConsARecDESC_PESSOA_AUTORIZADA: TStringField;
    QConsRecDESC_PESSOA_AUTORIZADA: TStringField;
    QConsRecOBS_CTR: TStringField;
    Panel3: TPanel;
    PCPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    PcCred: TPageControl;
    TabSheet3: TTabSheet;
    DBGridARec: TDBGrid;
    PanelObs: TPanel;
    Label16: TLabel;
    EdtObs: TEdit;
    Button1: TButton;
    Button2: TButton;
    BtnSel: TButton;
    TabSheet4: TTabSheet;
    DBGridRec: TDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    LLiquido: TLabel;
    LDesc: TLabel;
    LAcres: TLabel;
    LBruto: TLabel;
    LAtrasado: TLabel;
    LLimiteCred: TLabel;
    LSaldoDev: TLabel;
    LSaldoAtual: TLabel;
    LSit: TLabel;
    Label14: TLabel;
    LDevol: TLabel;
    BtnRec: TButton;
    BtnDev: TButton;
    BtnExt: TButton;
    BtnRecibo: TButton;
    BtnItens: TButton;
    BtnDadosVendas: TButton;
    BtnFicha: TButton;
    BtnLancar: TButton;
    BtnObs: TButton;
    Panel8: TPanel;
    PCCheque: TPageControl;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet6: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet7: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheet8: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet9: TTabSheet;
    DBGrid5: TDBGrid;
    TabSheet10: TTabSheet;
    DBGrid6: TDBGrid;
    TabSheet11: TTabSheet;
    DBGrid7: TDBGrid;
    Panel7: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    LLimCh: TLabel;
    Label24: TLabel;
    LDevCh: TLabel;
    Label26: TLabel;
    LSaldoCH: TLabel;
    Label28: TLabel;
    LSitCh: TLabel;
    Label30: TLabel;
    LAbertos: TLabel;
    LDepositadosPri: TLabel;
    LPagos: TLabel;
    LDev1: TLabel;
    Label23: TLabel;
    LQuant: TLabel;
    Label25: TLabel;
    LDev2: TLabel;
    Label19: TLabel;
    LDepositadosSeg: TLabel;
    Panel5: TPanel;
    BtnFichaCheque: TButton;
    BtnLancarCheque: TButton;
    QTotaisCheque: TFDQuery;
    QTotaisChequeABERTOS: TBCDField;
    QTotaisChequeDEPOSITADOSPRI: TBCDField;
    QTotaisChequeDEPOSITADOSSEG: TBCDField;
    QTotaisChequePAGOS: TBCDField;
    QTotaisChequeDEVOLVIDOSPRI: TBCDField;
    QTotaisChequeDEVOLVIDOSSEG: TBCDField;
    QTotaisChequeQTDCHEQUE: TIntegerField;
    QConsCheque: TFDQuery;
    QConsChequeAGENCIA: TStringField;
    QConsChequeCONTA: TStringField;
    QConsChequeNUMERO: TStringField;
    QConsChequeEMISSAO: TDateField;
    QConsChequeVENCTO: TDateField;
    QConsChequeVALOR: TBCDField;
    QConsChequePRIDEP: TDateField;
    QConsChequeSEGDEP: TDateField;
    QConsChequePRIDEV: TDateField;
    QConsChequeSEGDEV: TDateField;
    QConsChequePAGTO: TDateField;
    QConsChequeEMPRESA: TIntegerField;
    QConsChequeCODVENDA: TIntegerField;
    QConsChequeOBS: TStringField;
    QConsChequeCODCHE: TIntegerField;
    QConsChequeBANCO: TStringField;
    DSConsCheque: TDataSource;
    QConsChequeNOME_CLIENTE: TStringField;
    QConsChequeNOME_EMITENTE: TStringField;
    QConsRecNUMDOCUMENTO_CTR: TStringField;
    QConsARecNOME_TPV: TStringField;
    QConsRecNOME_TPV: TStringField;
    RDprintDuplicata: TRDprint;
    QConsARecCODIGO_DUPLICATA: TIntegerField;
    QDuplicata: TFDQuery;
    QDuplicataCOD_DUPLICATA: TIntegerField;
    QConsARecDESCRICAO: TStringField;
    QConsARecCODIGO_CLASSIFICACAO: TIntegerField;
    QConsRecDESCRICAO: TStringField;
    QConsARecENDRES_CLI: TStringField;
    QConsARecNUMRES_CLI: TStringField;
    QConsARecBAIRES_CLI: TStringField;
    QConsARecCIDRES_CLI: TStringField;
    QConsARecESTRES_CLI: TStringField;
    QConsARecCNPJ_CLI: TStringField;
    QConsARecSTATUS: TStringField;
    Imagens: TsAlphaImageList;
    QConsARecCEPRES_CLI: TStringField;
    QAux: TFDQuery;
    QConsARecCOD_BOLETO: TIntegerField;
    TabSheet12: TTabSheet;
    btnBoletos: TButton;
    QBoletos: TFDQuery;
    QBoletosCOD: TIntegerField;
    QBoletosCOD_EMP: TIntegerField;
    QBoletosCOD_CEDENTE: TIntegerField;
    QBoletosCOD_CTR: TIntegerField;
    QBoletosDATA_DOCUMENTO: TDateField;
    QBoletosVENCIMENTO: TDateField;
    QBoletosNUMERO_DOC: TStringField;
    QBoletosESPECIE_DOC: TStringField;
    QBoletosACEITE: TStringField;
    QBoletosDATA_PROCESSAMENTO: TDateField;
    QBoletosCARTEIRA: TStringField;
    QBoletosNOSSO_NUMERO: TStringField;
    QBoletosVALOR_DOCUMENTO: TBCDField;
    QBoletosCOD_CLI: TIntegerField;
    QBoletosVALOR_ABATIMENTO: TBCDField;
    QBoletosLOCAL_PAGAMENTO: TStringField;
    QBoletosVALOR_MORA_JURUS: TBCDField;
    QBoletosVALOR_DESCONTO: TBCDField;
    QBoletosDATA_MORA_JUROS: TDateField;
    QBoletosDATA_DESCONTO: TDateField;
    QBoletosDATA_ABATIMENTO: TDateField;
    QBoletosDATA_PROTESTO: TDateField;
    QBoletosPORCENTUAL_MULTA: TBCDField;
    QBoletosOCORRENCIA: TStringField;
    QBoletosSTATUS: TStringField;
    DSQBoletos: TDataSource;
    DBGridBoletos: TDBGrid;
    QBoletosSACADO_NOME: TStringField;
    btnImprime: TButton;
    QBoletosNOME_CLI: TStringField;
    QBoletosCNPJ_CLI: TStringField;
    QBoletosENDRES_CLI: TStringField;
    QBoletosNUMRES_CLI: TStringField;
    QBoletosBAIRES_CLI: TStringField;
    QBoletosCIDRES_CLI: TStringField;
    QBoletosCEPRES_CLI: TStringField;
    QBoletosESTRES_CLI: TStringField;
    QBoletosREMESSA: TIntegerField;
    QBoletosVALOR_RECEBIDO: TBCDField;
    QBoletosDATA_PAGAMENTO: TDateField;
    btnExcluiBoleto: TButton;
    frxRecibo: TfrxReport;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QConsARecCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure BtnRecClick(Sender: TObject);
    procedure ImpRecibo;
    procedure DBGridARecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BtnExtClick(Sender: TObject);
    procedure BtnReciboClick(Sender: TObject);
    procedure LimpaInformacoes;
    procedure PcCredChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnDevClick(Sender: TObject);
    procedure BtnDadosVendasClick(Sender: TObject);
    procedure BtnFichaClick(Sender: TObject);
    procedure BtnAlterarSituacaoClick(Sender: TObject);
    procedure EdtDataJurosExit(Sender: TObject);
    procedure BtnLancarClick(Sender: TObject);
    procedure RdgClienteClick(Sender: TObject);
    procedure RdgDocumentoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnObsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PCPrincipalChange(Sender: TObject);
    procedure PCChequeChange(Sender: TObject);
    procedure EncerraTransacoes;
    procedure BtnFichaChequeClick(Sender: TObject);
    procedure BtnLancarChequeClick(Sender: TObject);
    procedure DBGridARecDblClick(Sender: TObject);
    procedure DBGridARecDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnBoletosClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnExcluiBoletoClick(Sender: TObject);
    procedure ImpReciboFast;
  private
    { Private declarations }
  public
    { Public declarations }
    codcod: Integer
  end;

  var
    vg_TotalBruto: currency;
    vg_Acres: currency;
    vg_TotalLiq: currency;
    vg_QtdParcela: Integer;
    vg_devol: currency;
    bPerg_Pendencia: boolean;
    bSituacao: boolean;

  function FrmContasRecRec: TFrmContasRecRec;

implementation

uses
  Udm, UConsCli, Ubibli1, UContasRecItens, URecebimento, UCTRDevolucao, 
  UDadosVenda, UCadCli, UContasReceber, UsenhaLiberarVenda, UCadCheque, UDialog, 
  UNovoPrincipal, UPrincipal;

var
  sSqlRec, sSqlARec, sSqlCadCli, sSqlBoletos: string;

  cTotalPago: currency;
  cLimiteCredito: currency;
  cLimiteCheque: currency;
  iDiasNegativacao: Integer;
  iLinhasFinal: Integer;
  iAuxCodCTR, iAuxSeq: Integer;
  sTamanhoComprovante: string;

{$R *.dfm}
function FrmContasRecRec: TFrmContasRecRec;
begin
   Result :=  TFrmContasRecRec( BuscaFormulario( TFrmContasRecRec, False ) );
end;

procedure TFrmContasRecRec.LimpaInformacoes;
begin 
  LBruto.Caption := '0,00';
  LAcres.Caption := '0,00';
  LDesc.Caption := '0,00';
  LDevol.Caption := '0,00';
  LLiquido.Caption := '0,00';
  LAtrasado.Caption := '0,00';
  LLimiteCred.Caption := '0,00';
  LSaldoDev.Caption := '0,00';
  LSaldoAtual.Caption := '0,00';
end;

procedure TFrmContasRecRec.ImpRecibo;
var
  iLinha, i: Integer;
  cTotal: currency;
begin 
  cTotalPago := 0;
  with QConsRec do
  begin 
    { ========================================================================== }
    { =============================== BUSCA O TOTAL PAGO ======================= }
    { ========================================================================== }
    cTotalPago := 0;
    First;
    while not eof do
    begin 
      cTotalPago := cTotalPago + fieldbyname('vlrpago_ctr').AsCurrency;
      next;
    end;

    // INICIA O RELATÓRIO
    if sTamanhoComprovante = 'B' then
    begin 
      RDprint.FonteTamanhoPadrao := S17cpp;
      RDprint.Impressora := Bobina;
    end
    else
    begin 
      RDprint.FonteTamanhoPadrao := S10cpp;
      RDprint.Impressora := Epson;
    end;

    RDprint.TamanhoQteLinhas := 1;
    RDprint.Abrir;

    // CABEÇALHO
    RDprint.Imp(1, 1,
      '======================== RECIBO =======================');
    RDprint.Imp(2, 1, 'Data Recebimento: ' + datetostr(date));
    RDprint.Imp(3, 1, 'Recebi(emos) de ' + trim(EdtNomeCli.Text));
    RDprint.Imp(4, 1, 'a importancia de R$ ' + currtostrf(cTotalPago, ffnumber,
      2) + ' Ref. o pagamento da(s)');
    RDprint.Imp(5, 1, 'parcela(s) abaixo:');
    RDprint.Imp(6, 1,
      '=======================================================');
    RDprint.Imp(7, 1,
      'Parcela       Vencto.        Valor    Juros       Total ');
    RDprint.Imp(8, 1,
      '-------------------------------------------------------');
    iLinha := 8;

    // PARCELAS PAGAS
    First;
    while not eof do
    begin 
      inc(iLinha);
      RDprint.Imp(iLinha, 1, FormataStringD(fieldbyname('cod_ctr').AsString,
        '6', '0') + '/' + fieldbyname('sequencia_ctr').AsString);
      RDprint.Imp(iLinha, 14, fieldbyname('vencto_ctr').AsString);
      RDprint.ImpVal(iLinha, 27, '#,##0.00', QConsRecVALOR_CTR.AsCurrency, []);
      RDprint.ImpVal(iLinha, 36, '#,##0.00',
        QConsRecACRESCIMO_RECEBIDO_CTR.AsCurrency, []);
      RDprint.ImpVal(iLinha, 48, '#,##0.00',
        QConsRecVLRPAGO_CTR.AsCurrency, []);
      next;
    end;

    inc(iLinha);
    RDprint.Imp(iLinha, 1,
      '-------------------------------------------------------');
    inc(iLinha);
    RDprint.Imp(iLinha, 1, '                         Total Pagamento:');
    RDprint.ImpVal(iLinha, 48, '#,##0.00', cTotalPago, []);
    inc(iLinha);

    // PARCELAS PENDENTES
    if dm.RetornaStringTabela('imprimir_parcelas_pendentes', 'parametros',
      'cod_emp', iEmp) = 'S' then
    begin 
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      QRelPendente.Close;
      QRelPendente.ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
      QRelPendente.Open;
      if QRelPendente.RecordCount > 0 then
      begin 
        cTotal := 0;
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '----------------- Prestacoes Pendentes ----------------');
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          'Parcela           Vencto.                  Valor        ');
        QRelPendente.First;
        while not QRelPendente.eof do
        begin 
          inc(iLinha);
          RDprint.Imp(iLinha, 1,
            FormataStringD(QRelPendente.fieldbyname('cod_ctr').AsString, '6',
            '0') + '/' + QRelPendente.fieldbyname('sequencia_ctr').AsString);
          RDprint.Imp(iLinha, 19, QRelPendente.fieldbyname('vencto_ctr')
            .AsString);
          RDprint.ImpVal(iLinha, 41, '#,##0.00',
            QRelPendente.fieldbyname('valor_ctr').AsCurrency -
            QRelPendente.fieldbyname('devolucao_ctr').AsCurrency, []);
          cTotal := cTotal + (QRelPendente.fieldbyname('valor_ctr').AsCurrency -
            QRelPendente.fieldbyname('devolucao_ctr').AsCurrency);
          QRelPendente.next;
        end;
        inc(iLinha, 2);
        RDprint.Imp(iLinha, 1, '              Total Pendente:');
        RDprint.ImpVal(iLinha, 41, '#,##0.00', cTotal, []);
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '-------------------------------------------------------');
        inc(iLinha);
      end;
      dm.IBTransaction.Commit;
      QRelPendente.Close;
    end;

    // FINALIZA O RELATÓRIO
    iLinha := iLinha + iLinhasFinal;
    RDprint.Imp(iLinha, 1, ' ');
    if strtoint(dm.LeIni('cnfcomercio.ini', 'configuracaolocal',
      'visualizarrelatorios')) = 1 then
    begin 
      RDprint.TamanhoQteLinhas := iLinha;
      RDprint.OpcoesPreview.Preview := true;
    end
    else
    begin 
      RDprint.TamanhoQteLinhas := 1;
      RDprint.OpcoesPreview.Preview := false;
    end;
    RDprint.Fechar;
  end;

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
end;

procedure TFrmContasRecRec.ImpReciboFast;
var
    CaminhoRel: string;
begin 
//
   CaminhoRel := ExtractFilePath( Application.ExeName ) + '\Report\recibo_contas.fr3';
   if not FileExists( CaminhoRel ) then
      begin 
         KDialog( 'Arquivo recibo_contas.f3 não encontrado' ) ;
         exit;
      end;
   frxRecibo.LoadFromFile( CaminhoRel );
   frxRecibo.Variables[ 'data_extenso' ] := QuotedStr( FormatDateTime('dddddd',Now) );
   frxRecibo.Variables[ 'valor' ]  := QuotedStr( FormatFloat( '0.00', QConsRecVLRPAGO_CTR.AsFloat ));
   frxRecibo.Variables[ 'valor_extenso' ] := QuotedStr( extenso( QConsRecVLRPAGO_CTR.AsString ) );
   frxRecibo.Variables[ 'numero' ] := QuotedStr( FormataStringD( QConsRecCOD_CTR.AsString,
        '6', '0') + '/' + QConsRecSEQUENCIA_CTR.AsString) ;
   frxRecibo.Variables [ 'recebido' ] := QuotedStr( EdtNomeCli.Text );
   frxRecibo.Variables[ 'empresa' ] := QuotedStr( trim(dm.RetornaStringTabela('RAZAO_EMP', 'empresa', 'cod_emp', iEmp)) ) ;
   frxRecibo.Variables[ 'local' ] := QuotedStr( trim(dm.RetornaStringTabela('CID_EMP', 'empresa', 'cod_emp', iEmp))  + ' - ' +
   trim(dm.RetornaStringTabela('EST_EMP', 'empresa', 'cod_emp', iEmp))) ;
   frxRecibo.ShowReport( True );
end;

procedure TFrmContasRecRec.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmContasRecRec.BtnConsCliClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag := 7;
  FrmConsCli.showmodal;
end;

procedure TFrmContasRecRec.EdtCodCliKeyPress(Sender: TObject; var Key: Char);
begin 
  if not(Key in ['0' .. '9', #13, #8]) then
    Key := #0;
end;

procedure TFrmContasRecRec.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  if Key = vk_f3 then
    BtnConsCli.Click;
end;

procedure TFrmContasRecRec.EdtCodCliExit(Sender: TObject);
begin 
  if (RdgCliente.Focused) or (RdgDocumento.Focused) then
    exit;

  EdtDataJuros.date := date;
  if BtnSair.Focused then
    exit;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin 
        Close;
        sql.Clear;
        sql.add('SELECT NOME_CLI, LIMITE_CLI, BLOQUEADO_CLI, TIPO_CREDITO_CLI, '
          + 'LIMITE_CHEQUE FROM CLIENTE WHERE COD_CLI = :CODCLI');
        ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
        ExecOrOpen;
        if RecordCount > 0 then
        begin 
          BtnFicha.Enabled := true;
          EdtNomeCli.Text := fieldbyname('nome_cli').AsString + ' - ' +
            fieldbyname('tipo_credito_cli').AsString;
          cLimiteCredito := fieldbyname('limite_cli').AsCurrency;
          cLimiteCheque := fieldbyname('limite_cheque').AsCurrency;
          LLimiteCred.Caption := currtostrf(cLimiteCredito, ffnumber, 2);
          LLimCh.Caption := currtostrf(cLimiteCheque, ffnumber, 2);
          if trim(fieldbyname('bloqueado_cli').AsString) = 'S' then
          begin 
            LSit.Font.Color := clRed;
            LSit.Caption := 'BLOQUEADO';
          end
          else
          begin 
            LSit.Font.Color := clWhite;
            LSit.Caption := '';
          end;
        end
        else
        begin 
          BtnFicha.Enabled := false;
          EdtNomeCli.Clear;
          cLimiteCredito := 0;
          LSit.Font.Color := clWhite;
          LSit.Caption := '';
          LLimiteCred.Caption := '0,00';
          AlertaCad('Cliente não Cadastrado');
//          EdtCodCli.SetFocus;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      AlertaCad('Erro ao buscar o cliente');
      dm.IBTransaction.Rollback;
      BtnFicha.Enabled := false;
      EdtNomeCli.Clear;
      cLimiteCredito := 0;
      LLimiteCred.Caption := '0,00';
    end;
  finally
    dm.Consulta.Close;
  end;
end;

procedure TFrmContasRecRec.FormShow(Sender: TObject);
begin 
  { BUSCA PARAMETROS }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin 
        Close;
        sql.Clear;
        sql.add('SELECT DIAS_NEGATIVACAO, LINHAS_FINAL,     ' +
          'TAMANHO_COMPROVANTE ' + 'FROM PARAMETROS ' +
          'WHERE COD_EMP = :CODEMP');
        ParamByName('codemp').AsInteger := iEmp;
        ExecOrOpen;
        iDiasNegativacao := fieldbyname('dias_negativacao').AsInteger;
        iLinhasFinal := fieldbyname('linhas_final').AsInteger;
        sTamanhoComprovante := trim(fieldbyname('tamanho_comprovante')
          .AsString);
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar os parâmetros');
    end;
  finally
    dm.QLab.Close;
  end;

  sSqlARec := QConsARec.sql.Text;
  sSqlRec := QConsRec.sql.Text;
  sSqlCadCli := dm.QCli.sql.Text;
  sSqlBoletos := QBoletos.SQL.Text;
  EdtDataRecebidas.date := date;
  EdtDataJuros.date := date;
  EdtCodCli.Clear;
  EdtNomeCli.Clear;
  LimpaInformacoes;
  CheckEmp.Checked := true;
  LSit.Caption := '';
  BtnSel.Enabled := false;
  BtnRec.Enabled := false;
  btnBoletos.Enabled := false;
  BtnExt.Enabled := false;
  BtnItens.Enabled := false;
  BtnRecibo.Enabled := false;
  BtnFicha.Enabled := false;
  PCPrincipal.ActivePageIndex := 0;
  PcCred.ActivePageIndex := 0;

  { busca a posicao do combo }
  try
    if strtoint(dm.LeIni('cnfcomercio.ini', 'PosicaoCombobox',
      'FrmContasRecRec.ComboCons')) = 0 then
      RdgCliente.Checked := true
    else
      RdgDocumento.Checked := true;
  except
    RdgCliente.Checked := true;
  end;
  if (tag = 101) and (codcod > 0) then
  begin 
    EdtCodCli.SetFocus;
    EdtCodCli.Text := inttostr(codcod);
    EdtNomeCli.SetFocus;
    BtnOkClick(self);
  end;
end;

procedure TFrmContasRecRec.FormKeyPress(Sender: TObject; var Key: Char);
begin 
  if Key = #13 then
  begin 
    Key := #0;
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmContasRecRec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  if Key = vk_escape then
  begin 
    if PanelObs.Visible then
    begin 
      DBGridARec.SetFocus;
      PanelObs.Visible := false;
    end
    else
      Close;
  end;
end;

procedure TFrmContasRecRec.QConsARecCalcFields(DataSet: TDataSet);
begin 
  QConsARecDIAS.Value := strtodate(datetostr(EdtDataJuros.date)) -
    QConsARecVENCTO_CTR.Value;
  if QConsARecDIAS.Value > QConsARecDIAS_CARENCIA.Value then
    QConsARecACRESCIMO.Value :=
      ((QConsARecVALOR_CTR.Value - QConsARecDEVOLUCAO_CTR.Value) *
      ((QConsARecJUROS_ATRASO.Value / 30) * QConsARecDIAS.Value) / 100);
  QConsARecTOTAL.Value := QConsARecVALOR_CTR.Value + QConsARecACRESCIMO.Value -
    QConsARecDEVOLUCAO_CTR.Value;
end;

procedure TFrmContasRecRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  { grava qual rdg esta checked }
  if RdgCliente.Checked then
    dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox',
      'FrmContasRecRec.ComboCons', '0')
  else
    dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox',
      'FrmContasRecRec.ComboCons', '1');

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  if IBTRCTR.Active then
    IBTRCTR.Commit;
  QConsARec.sql.Clear;
  QConsARec.sql.Text := sSqlARec;
  QConsARec.Close;
  QConsRec.sql.Clear;
  QConsRec.sql.Text := sSqlRec;
  QConsRec.Close;
  dm.QCli.sql.Clear;
  dm.QCli.sql.Text := sSqlCadCli;
  dm.QCli.Close;

  // if (trim(dm.RetornaParametro('imp_recibo_pagamento')) = 'S') and (trim(EdtCodCli.Text) <> '') then
  // ImpRecibo;
  Action := caFree;
end;

procedure TFrmContasRecRec.BtnSelClick(Sender: TObject);
begin 
  QConsARec.First;
  while not QConsARec.eof do
  begin 
    DBGridARec.SelectedRows.CurrentRowSelected := true;
    QConsARec.next;
  end;
  QConsARec.First;
end;

procedure TFrmContasRecRec.BtnItensClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmContasRecItens, FrmContasRecItens);
  if PcCred.ActivePageIndex = 0 then
    FrmContasRecItens.tag := 0
  else
    FrmContasRecItens.tag := 3;
  FrmContasRecItens.showmodal;
end;

procedure TFrmContasRecRec.BtnRecClick(Sender: TObject);
begin 
  vg_TotalBruto := 0;
  vg_Acres := 0;
  vg_TotalLiq := 0;
  vg_QtdParcela := 0;
  vg_devol := 0;

  QConsARec.First;
  while not QConsARec.eof do
  begin 
    if DBGridARec.SelectedRows.CurrentRowSelected = true then
    begin 
      vg_QtdParcela := vg_QtdParcela + 1;
      vg_TotalBruto := vg_TotalBruto + QConsARecVALOR_CTR.AsCurrency;
      vg_Acres := vg_Acres + QConsARecACRESCIMO.AsCurrency;
      vg_TotalLiq := vg_TotalLiq + QConsARecTOTAL.AsCurrency;
      vg_devol := vg_devol + QConsARecDEVOLUCAO_CTR.AsCurrency;
    end;
    QConsARec.next;
  end;

  if vg_QtdParcela = 0 then
  begin 
    AlertaCad('Nenhuma parcela selecionada');
  end
  else
  begin 
    if vg_TotalBruto < 0 then
    begin 
      AlertaCad('Impossível receber valor negativo');
      exit;
      abort;
    end;
    Application.CreateForm(TFrmRecebimento, FrmRecebimento);
    FrmRecebimento.EdtTotalBruto.Text := CurrToStr(vg_TotalBruto);
    FrmRecebimento.EdtDevol.Text := CurrToStr(vg_devol);
    FrmRecebimento.EdtAcres.Text := CurrToStr(vg_Acres);
    FrmRecebimento.EdtDesc.Text := '0';
    FrmRecebimento.EdtTotalliq.Text := CurrToStr(vg_TotalLiq);
    FrmRecebimento.EdtValorRec.Text := CurrToStr(vg_TotalLiq);
    FrmRecebimento.EdtData.date := date;
    FrmRecebimento.showmodal;
  end;
end;

procedure TFrmContasRecRec.DBGridARecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  if Key = vk_f3 then
    EdtCodCli.SetFocus;
end;

procedure TFrmContasRecRec.EdtCodCliEnter(Sender: TObject);
begin 
  EdtCodCli.SelectAll;
end;

procedure TFrmContasRecRec.BtnExtClick(Sender: TObject);
var
  iLinha: Integer;
  cTotal: currency;
  CLI, END_CLI, Numero_CLI, CEP_CLI, CID_CLI, ESTADO_CLI: String;
begin 
  // DADOS DO CLIENTE
  dm.QConsulta.sql.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
  dm.QConsulta.ParamByName('CODCLI').AsString := EdtCodCli.Text;
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin 
    AlertaCad('Erro ao buscar dados do cliente');
    dm.QConsulta.Close;
    dm.IBTransaction.Commit;
    exit;
  end;
  CLI := dm.QConsulta.fieldbyname('NOME_CLI').AsString;
  END_CLI := dm.QConsulta.fieldbyname('ENDRES_CLI').AsString;
  Numero_CLI := dm.QConsulta.fieldbyname('NUMRES_CLI').AsString;
  CEP_CLI := dm.QConsulta.fieldbyname('CEPRES_CLI').AsString;
  CID_CLI := dm.QConsulta.fieldbyname('CIDRES_CLI').AsString;
  ESTADO_CLI := dm.QConsulta.fieldbyname('ESTRES_CLI').AsString;

  case Application.MessageBox('Impressão da(s) Nota(s) Selecionadas?',
    'Atenção', mb_applmodal + mb_iconquestion + mb_yesnocancel +
    mb_defbutton1) of
    6:
      begin 
        cTotal := 0;
        { ========================================================================== }
        { ============================ IMPRESSAO DO EXTRATO ======================== }
        { ========================================================================== }
        RDprint.FonteTamanhoPadrao := S17cpp;
        RDprint.Abrir;

        { ========================================================================== }
        { ============================= IMPRESSAO DO CABEÇALHO ===================== }
        { ========================================================================== }

        iLinha := 1;
        RDprint.Imp(iLinha, 1,
          '======================== EXTRATO =======================');
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Extrato da conta: ' + trim(EdtCodCli.Text));
        RDprint.Imp(iLinha, 46, datetostr(date));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Cliente: ' + trim(CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Endereco: ' + trim(END_CLI) + ',' +
          trim(Numero_CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, trim(CID_CLI) + ' / ' + trim(ESTADO_CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, trim(CEP_CLI));

        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '========================================================');
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          'Parcela    Vencto.   Dias     Valor    Juros      Total ');
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '--------------------------------------------------------');

        { ========================================================================== }
        { ============================= PARCELAS EM ABERTO ========================= }
        { ========================================================================== }
        with QConsARec do
        begin 
          DisableControls;
          First;
          while not eof do
          begin 
            if DBGridARec.SelectedRows.CurrentRowSelected then
            begin 
              inc(iLinha);
              cTotal := cTotal + QConsARecTOTAL.AsCurrency;
              RDprint.Imp(iLinha, 1, FormataStringD(QConsARecCOD_CTR.AsString,
                '6', '0') + '/' + QConsARecSEQUENCIA_CTR.AsString);
              RDprint.Imp(iLinha, 10, QConsARecVENCTO_CTR.AsString);
              if QConsARecDIAS.Value > 0 then
                RDprint.Imp(iLinha, 22, FormataStringD(QConsARecDIAS.AsString,
                  '4', '0'));
              RDprint.ImpVal(iLinha, 28, '#,##0.00',
                (QConsARecVALOR_CTR.AsCurrency -
                QConsARecDEVOLUCAO_CTR.AsCurrency), []);
              RDprint.ImpVal(iLinha, 37, '#,##0.00',
                QConsARecACRESCIMO.AsCurrency, []);
              RDprint.ImpVal(iLinha, 48, '#,##0.00',
                QConsARecTOTAL.AsCurrency, []);
            end;
            next;
          end;
          First;
          EnableControls;
        end;
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '--------------------------------------------------------');
        inc(iLinha);
        RDprint.Imp(iLinha, 1, '                         Total a Pagar:');
        RDprint.ImpVal(iLinha, 48, '#,##0.00', cTotal, []);
        inc(iLinha);

        { ========================================================================== }
        { ========================== FINALIZA A IMPRESSAO ========================== }
        { ========================================================================== }
        iLinha := iLinha + iLinhasFinal;
        RDprint.Imp(iLinha, 1, ' ');
        RDprint.TamanhoQteLinhas := iLinha;
        RDprint.OpcoesPreview.Preview := true;
        RDprint.Fechar;
      end;
    7:
      begin 
        cTotal := 0;
        { ========================================================================== }
        { ============================ IMPRESSAO DO EXTRATO ======================== }
        { ========================================================================== }
        RDprint.FonteTamanhoPadrao := S17cpp;
        RDprint.Abrir;

        { ========================================================================== }
        { ============================= IMPRESSAO DO CABEÇALHO ===================== }
        { ========================================================================== }

        iLinha := 1;
        RDprint.Imp(iLinha, 1,
          '======================== EXTRATO =======================');
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Extrato da conta: ' + trim(EdtCodCli.Text));
        RDprint.Imp(iLinha, 46, datetostr(date));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Cliente: ' + trim(CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, 'Endereco: ' + trim(END_CLI) + ',' +
          trim(Numero_CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, trim(CID_CLI) + ' / ' + trim(ESTADO_CLI));
        inc(iLinha);
        RDprint.Imp(iLinha, 1, trim(CEP_CLI));

        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '========================================================');
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          'Parcela    Vencto.   Dias     Valor    Juros      Total ');
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '--------------------------------------------------------');

        { ========================================================================== }
        { ============================= PARCELAS EM ABERTO ========================= }
        { ========================================================================== }
        with QConsARec do
        begin 
          DisableControls;
          First;
          while not eof do
          begin 
            inc(iLinha);
            cTotal := cTotal + QConsARecTOTAL.AsCurrency;
            RDprint.Imp(iLinha, 1, FormataStringD(QConsARecCOD_CTR.AsString,
              '6', '0') + '/' + QConsARecSEQUENCIA_CTR.AsString);
            RDprint.Imp(iLinha, 10, QConsARecVENCTO_CTR.AsString);
            if QConsARecDIAS.Value > 0 then
              RDprint.Imp(iLinha, 22, FormataStringD(QConsARecDIAS.AsString,
                '4', '0'));
            RDprint.ImpVal(iLinha, 28, '#,##0.00',
              (QConsARecVALOR_CTR.AsCurrency -
              QConsARecDEVOLUCAO_CTR.AsCurrency), []);
            RDprint.ImpVal(iLinha, 37, '#,##0.00',
              QConsARecACRESCIMO.AsCurrency, []);
            RDprint.ImpVal(iLinha, 48, '#,##0.00',
              QConsARecTOTAL.AsCurrency, []);
            next;
          end;
          First;
          EnableControls;
        end;
        inc(iLinha);
        RDprint.Imp(iLinha, 1,
          '--------------------------------------------------------');
        inc(iLinha);
        RDprint.Imp(iLinha, 1, '                         Total a Pagar:');
        RDprint.ImpVal(iLinha, 48, '#,##0.00', cTotal, []);
        inc(iLinha);

        { ========================================================================== }
        { ========================== FINALIZA A IMPRESSAO ========================== }
        { ========================================================================== }
        iLinha := iLinha + iLinhasFinal;
        RDprint.Imp(iLinha, 1, ' ');
        RDprint.TamanhoQteLinhas := iLinha;
        RDprint.OpcoesPreview.Preview := true;
        RDprint.Fechar;
      end;
  end;
end;

procedure TFrmContasRecRec.BtnReciboClick(Sender: TObject);
begin 
  if (trim(dm.RetornaStringTabela('imp_recibo_pagamento', 'parametros',
    'cod_emp', iEmp)) = 'S') and (trim(EdtCodCli.Text) <> '') then
  begin 
    if Application.MessageBox('Confirma a Impressão do Recibo?', 'Atenção',
      mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
    if Application.MessageBox('Imprimir em matricial?', 'Atenção',
      mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
         ImpRecibo
      else
         ImpReciboFast;
  end;
end;

procedure TFrmContasRecRec.PcCredChange(Sender: TObject);
var
  cBruto, cAcres, cAtrasado, cDesconto, cRecebido, cDevolucao: currency;
begin 
  cBruto := 0;
  cAcres := 0;
  cAtrasado := 0;
  cDesconto := 0;
  cRecebido := 0;
  cDevolucao := 0;

  if RdgCliente.Checked then
  begin 
    if EdtCodCli.Text = '' then
    begin 
      AlertaCad('Digite o Código do Cliente');
//      EdtCodCli.SetFocus;
      exit;
    end;
    if IBTRCTR.Active then
      IBTRCTR.Commit;
    IBTRCTR.StartTransaction;
    case PcCred.ActivePageIndex of
      0:
        begin 
          BtnRecibo.Enabled := false;
          Label7.Caption := 'Total a Receber:';
          with QConsARec do
          begin 
            Close;
            sql.Clear;
            sql.Text := sSqlARec;
            sql.add(' WHERE R.COD_CLI = :CODCLI AND R.DTPAGTO_CTR IS NULL');
            if (not CheckEmp.Checked) then
            begin 
              sql.add(' AND R.COD_EMP = :CODEMP');
              ParamByName('codemp').AsInteger := iEmp;
            end;
            sql.add(' ORDER BY R.VENCTO_CTR, R.COD_CTR, R.SEQUENCIA_CTR');
            ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
            Open;
            First;

            { VERIFICA SITUAÇÃO DO CLIENTE }
            if LSit.Caption <> 'BLOQUEADO' then
            begin 
              LSit.Font.Color := clWhite;
              if QConsARecDIAS.AsInteger = 0 then
                LSit.Caption := 'OK'
              else if (QConsARecVENCTO_CTR.Value < date) and
                (QConsARecDIAS.AsInteger > iDiasNegativacao) then
                LSit.Caption := 'NEGATIVADO'
              else if (QConsARecVENCTO_CTR.Value >= date) then
                LSit.Caption := 'PENDENTE'
              else
                LSit.Caption := 'ATRASADO';
            end;

            DisableControls;
            while not eof do
            begin 
              cBruto := cBruto + QConsARecVALOR_CTR.Value;
              cAcres := cAcres + QConsARecACRESCIMO.Value;
              if QConsARecVENCTO_CTR.Value < date then
                cAtrasado := cAtrasado +
                  (QConsARecVALOR_CTR.AsCurrency -
                  QConsARecDEVOLUCAO_CTR.AsCurrency);
              cDevolucao := cDevolucao + QConsARecDEVOLUCAO_CTR.AsCurrency;
              next;
            end;
            LBruto.Caption := currtostrf(cBruto, ffnumber, 2);
            LAcres.Caption := currtostrf(cAcres, ffnumber, 2);
            LDesc.Caption := '0,00';
            LDevol.Caption := currtostrf(cDevolucao, ffnumber, 2);
            LLiquido.Caption := currtostrf(cBruto + cAcres - cDevolucao,
              ffnumber, 2);
            LSaldoDev.Caption := currtostrf(cBruto + cAcres - cDevolucao,
              ffnumber, 2);
            LSaldoAtual.Caption :=
              currtostrf(cLimiteCredito - (cBruto + cAcres - cDevolucao),
              ffnumber, 2);
            LAtrasado.Caption := currtostrf(cAtrasado + cAcres, ffnumber, 2);
            EnableControls;
            First;
            Locate('cod_ctr; sequencia_ctr',
              VarArrayOf([iAuxCodCTR, iAuxSeq]), []);
            if cBruto > 0 then
            begin 
              BtnSel.Enabled := true;
              BtnRec.Enabled := true;
              btnBoletos.Enabled := true;
              BtnExt.Enabled := true;
              BtnItens.Enabled := true;
              BtnDev.Enabled := true;
              BtnObs.Enabled := true;
              BtnDadosVendas.Enabled := true;
              btnImprime.Visible := false;
              DBGridARec.SetFocus;
            end
            else
            begin 
              BtnSel.Enabled := false;
              BtnRec.Enabled := false;
              btnBoletos.Enabled := false;
              BtnExt.Enabled := false;
              BtnItens.Enabled := false;
              BtnDev.Enabled := false;
              BtnObs.Enabled := false;
              BtnDadosVendas.Enabled := false;
              btnImprime.Visible := false;
              EdtCodCli.SetFocus;
            end;
          end;
        end;
      1:
        begin 
          BtnSel.Enabled := false;
          BtnRec.Enabled := false;
          btnBoletos.Enabled := false;
          BtnDev.Enabled := false;
          BtnExt.Enabled := false;
          BtnObs.Enabled := false;

          Label7.Caption := 'Total Recebido:';
          with QConsRec do
          begin 
            Close;
            sql.Clear;
            sql.Text := sSqlRec;
            sql.add(' WHERE R.COD_CLI = :CODCLI AND R.DTPAGTO_CTR >= :DATA');
            if (not CheckEmp.Checked) then
            begin 
              sql.add(' AND R.COD_EMP = :CODEMP');
              ParamByName('codemp').AsInteger := iEmp;
            end;
            sql.add(' ORDER BY R.DTPAGTO_CTR, R.COD_CTR, R.SEQUENCIA_CTR');
            ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
            ParamByName('data').AsDate := EdtDataRecebidas.date;
            Open;
            First;
            DisableControls;
            while not eof do
            begin 
              cBruto := cBruto + QConsRecVALOR_CTR.Value;
              cAcres := cAcres + QConsRecACRESCIMO_RECEBIDO_CTR.Value;
              cDesconto := cDesconto + QConsRecDESCONTO_CONCEDIDO_CTR.Value;
              cRecebido := cRecebido + QConsRecVLRPAGO_CTR.AsCurrency;
              cDevolucao := cDevolucao + QConsRecDEVOLUCAO_CTR.AsCurrency;
              next;
            end;
            LBruto.Caption := currtostrf(cBruto, ffnumber, 2);
            LAcres.Caption := currtostrf(cAcres, ffnumber, 2);
            LDesc.Caption := currtostrf(cDesconto, ffnumber, 2);
            LDevol.Caption := currtostrf(cDevolucao, ffnumber, 2);
            LLiquido.Caption := currtostrf(cRecebido, ffnumber, 2);
            EnableControls;
            if cBruto > 0 then
            begin 
              BtnItens.Enabled := true;
              BtnRecibo.Enabled := true;
              btnImprime.Visible := false;
              BtnDadosVendas.Enabled := true;
            end
            else
            begin 
              BtnItens.Enabled := false;
              BtnRecibo.Enabled := false;
              btnImprime.Visible := false;
              BtnDadosVendas.Enabled := false;
              EdtCodCli.SetFocus;
            end;
          end;
        end;
      2:
        begin 
          BtnRecibo.Enabled := false;
          Label7.Caption := 'Total a Receber:';
          with QBoletos do
          begin 
            Close;
            sql.Clear;
            sql.Text := sSqlBoletos;
            sql.add(' WHERE B.COD_CLI = :CODCLI ');
            if (not CheckEmp.Checked) then
            begin 
              sql.add(' AND B.COD_EMP = :CODEMP');
              ParamByName('codemp').AsInteger := iEmp;
            end;
            sql.add(' ORDER BY B.VENCIMENTO, B.COD_CTR');
            ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
            Open;
            First;

                LSit.Caption := '';

            DisableControls;

              cBruto := 0;
              cAcres := 0;
                cAtrasado := 0;
              cDevolucao :=0;
            LBruto.Caption := currtostrf(cBruto, ffnumber, 2);
            LAcres.Caption := currtostrf(cAcres, ffnumber, 2);
            LDesc.Caption := '0,00';
            LDevol.Caption := currtostrf(cDevolucao, ffnumber, 2);
            LLiquido.Caption := currtostrf(cBruto + cAcres - cDevolucao,
              ffnumber, 2);
            LSaldoDev.Caption := currtostrf(cBruto + cAcres - cDevolucao,
              ffnumber, 2);
            LSaldoAtual.Caption :=
              currtostrf(cLimiteCredito - (cBruto + cAcres - cDevolucao),
              ffnumber, 2);
            LAtrasado.Caption := currtostrf(cAtrasado + cAcres, ffnumber, 2);
            EnableControls;
            First;
            if cBruto > 0 then
            begin 
              BtnSel.Enabled := true;
              BtnRec.Enabled := true;
              btnBoletos.Enabled := true;
              BtnExt.Enabled := true;
              BtnItens.Enabled := true;
              BtnDev.Enabled := true;
              BtnObs.Enabled := true;
              BtnDadosVendas.Enabled := true;
              DBGridARec.SetFocus;
            end
            else
            begin 
              BtnSel.Enabled := false;
              BtnRec.Enabled := false;
              btnBoletos.Enabled := false;
              BtnExt.Enabled := false;
              BtnItens.Enabled := false;
              BtnDev.Enabled := false;
              BtnObs.Enabled := false;
              BtnDadosVendas.Enabled := false;
              btnImprime.Visible := True;
              EdtCodCli.SetFocus;
              BtnLancar.Enabled := false;
            end;
          end;
        end;

    end;
  end
  else
  begin 
    LAtrasado.Caption := '0,00';
    LLimiteCred.Caption := '0,00';
    LSaldoDev.Caption := '0,00';
    LSaldoAtual.Caption := '0,00';

    with QConsARec do
    begin 
      sql.Text := sSqlARec;
      sql.add(' WHERE R.NUMDOCUMENTO_CTR = ' + #39 + trim(EdtDocumento.Text) +
        #39 + ' AND R.DTPAGTO_CTR IS NULL');
      if (not CheckEmp.Checked) then
      begin 
        sql.add(' AND R.COD_EMP = :CODEMP');
        ParamByName('codemp').AsInteger := iEmp;
      end;
      sql.add(' ORDER BY R.VENCTO_CTR, R.COD_CTR, R.SEQUENCIA_CTR');
      Open;
      First;

      DisableControls;
      while not eof do
      begin 
        cBruto := cBruto + QConsARecVALOR_CTR.Value;
        cAcres := cAcres + QConsARecACRESCIMO.Value;
        if QConsARecVENCTO_CTR.Value < date then
          cAtrasado := cAtrasado +
            (QConsARecVALOR_CTR.AsCurrency - QConsARecDEVOLUCAO_CTR.AsCurrency);
        cDevolucao := cDevolucao + QConsARecDEVOLUCAO_CTR.AsCurrency;
        next;
      end;
      LBruto.Caption := currtostrf(cBruto, ffnumber, 2);
      LAcres.Caption := currtostrf(cAcres, ffnumber, 2);
      LDesc.Caption := '0,00';
      LDevol.Caption := currtostrf(cDevolucao, ffnumber, 2);
      LLiquido.Caption := currtostrf(cBruto + cAcres - cDevolucao, ffnumber, 2);
      EnableControls;
      if cBruto > 0 then
      begin 
        BtnSel.Enabled := true;
        BtnRec.Enabled := true;
        btnBoletos.Enabled := true;
        BtnExt.Enabled := true;
        BtnItens.Enabled := true;
        BtnDev.Enabled := true;
        BtnDadosVendas.Enabled := true;
        First;
        DBGridARec.SetFocus;
      end
      else
      begin 
        BtnSel.Enabled := false;
        BtnRec.Enabled := false;
        btnBoletos.Enabled := false;
        BtnExt.Enabled := false;
        BtnItens.Enabled := false;
        BtnDev.Enabled := false;
        BtnDadosVendas.Enabled := false;
        EdtDocumento.SetFocus;
      end;

    end;
  end;
end;

procedure TFrmContasRecRec.BtnOkClick(Sender: TObject);
begin 
  PcCred.ActivePageIndex := 0;
  PcCredChange(PcCred);
end;

procedure TFrmContasRecRec.BtnDevClick(Sender: TObject);
begin 
  if trim(dm.RetornaStringTabela('habilitar_devolucao', 'parametros', 'cod_emp',
    iEmp)) = 'S' then
  begin 
    Application.CreateForm(TFrmCTRDevolucao, FrmCTRDevolucao);
    FrmCTRDevolucao.EdtCod.Text := QConsARecCOD_CTR.AsString;
    FrmCTRDevolucao.EdtSeq.Text := QConsARecSEQUENCIA_CTR.AsString;
    FrmCTRDevolucao.EdtTotal.Text := QConsARecVALOR_CTR.AsString;
    FrmCTRDevolucao.EdtValorDev.Text := QConsARecDEVOLUCAO_CTR.AsString;
    FrmCTRDevolucao.showmodal;
  end
  else
  begin 
    AlertaCad('Não Habilitado');
  end;
end;

procedure TFrmContasRecRec.btnExcluiBoletoClick(Sender: TObject);
begin 
  while not QConsARec.eof do
  begin 
    if (DBGridARec.SelectedRows.CurrentRowSelected = true) then
    begin 
       QAux.Close;
       QAux.SQL.Text := 'update CONTAS_RECEBER set COD_BOLETO=null where cod_ctr=:cod_ctr and SEQUENCIA_CTR=:SEQUENCIA_CTR';
       QAux.ParamByName( 'cod_ctr' ).AsInteger := QConsARecCOD_CTR.AsInteger;
       QAux.ParamByName( 'SEQUENCIA_CTR' ).AsInteger := QConsARecSEQUENCIA_CTR.AsInteger;
       QAux.Open;
       QAux.Close;
       QAux.Close;
       QAux.SQL.Text := 'delete from boletos where cod=:cod';
       QAux.ParamByName( 'cod' ).AsInteger := QConsARecCOD_BOLETO.AsInteger;
       QAux.Open;
       QAux.Close;
    end;
    QConsARec.Next;
  end;
    QConsARec.Close;
  IBTRCTR.Commit;
  IBTRCTR.StartTransaction;
  QConsARec.Open;
end;

procedure TFrmContasRecRec.BtnDadosVendasClick(Sender: TObject);
begin 
  case PcCred.ActivePageIndex of
    0:
      begin 
        if not QConsARecCOD_VENDA.IsNull then
        begin 
          Application.CreateForm(TFrmDadosVenda, FrmDadosVenda);
          FrmDadosVenda.tag := 0;
          FrmDadosVenda.showmodal;
        end
        else
          AlertaCad('Parcela sem referência de venda');
      end;
    1:
      begin 
        if not QConsRecCOD_VENDA.IsNull then
        begin 
          Application.CreateForm(TFrmDadosVenda, FrmDadosVenda);
          FrmDadosVenda.tag := 1;
          FrmDadosVenda.showmodal;
        end
        else
          AlertaCad('Parcela sem referência de venda');
      end;
  end;
end;

procedure TFrmContasRecRec.BtnFichaClick(Sender: TObject);
var
  i: Integer;
begin 
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  dm.QCli.sql.Clear;
  dm.QCli.sql.Text := sSqlCadCli;
  dm.QCli.sql.add(' WHERE C.COD_CLI = :codcli');
  dm.QCli.ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
  dm.QCli.Open;
  BuscaFormulario( TFrmCadCli, True );
  with FrmCadCli do
  begin 
    tag := 1;
    limpaedit(FrmCadCli);
    ededit(FrmCadCli, false);
    cod_cli.Text := dm.QCliCOD_CLI.AsString;
    if trim(dm.QCliFJ_CLI.AsString) = 'F' then
    begin 
      ComboFJ.ItemIndex := 0;
      Label11.Caption := 'CPF';
      Label12.Caption := 'Documento';
      edtcnpj.EditMask := '999.999.999-99;1;_';
      Label2.Caption := 'Nome(*)';
      label43.Caption := 'Apelido';
      edtprof.Enabled := true;
      edtemp.Enabled := true;
      edtpai.Enabled := true;
      edtmae.Enabled := true;
      edtrenda.Enabled := true;
      EdtContato.Visible := false;
      label45.Visible := false;
      EdtFant.Width := 473;
    end
    else
    begin 
      ComboFJ.ItemIndex := 1;
      Label11.Caption := 'CNPJ';
      Label12.Caption := 'Insc.Estadual';
      edtcnpj.EditMask := '99.999.999/9999-99;1;_';
      Label2.Caption := 'Razão Social(*)';
      label43.Caption := 'Nome Fantasia';
      EdtNasc.Enabled := false;
      edtprof.Enabled := false;
      edtemp.Enabled := false;
      edtpai.Enabled := false;
      edtmae.Enabled := false;
      edtrenda.Enabled := false;
      EdtContato.Visible := true;
      label45.Visible := true;
      EdtFant.Width := 233;
    end;
    edtnome.Text := dm.QCliNOME_CLI.AsString;
    cod_cla.Text := dm.QCliCOD_CLA.AsString;
    edtnomecla.Text := dm.QCliNOME_CLA.AsString;
    edtendres.Text := dm.QCliENDRES_CLI.AsString;
    edtbaires.Text := dm.QCliBAIRES_CLI.AsString;
    edtcidres.Text := dm.QCliCIDRES_CLI.AsString;
    for i := 0 to 26 do
    begin 
      if comboestres.Items[i] = dm.QCliESTRES_CLI.AsString then
        comboestres.ItemIndex := i;
    end;
    edtcepres.Text := dm.QCliCEPRES_CLI.AsString;
    edttelres.Text := dm.QCliTELRES_CLI.AsString;
    edtendcom.Text := dm.QCliENDCOM_CLI.AsString;
    edtbaicom.Text := dm.QCliBAICOM_CLI.AsString;
    edtcidcom.Text := dm.QCliCIDCOM_CLI.AsString;
    for i := 0 to 26 do
    begin 
      if comboestcom.Items[i] = dm.QCliESTCOM_CLI.AsString then
        comboestcom.ItemIndex := i;
    end;
    edtcepcom.Text := dm.QCliCEPCOM_CLI.AsString;
    edttelcom.Text := dm.QCliTELCOM_CLI.AsString;
    edtcnpj.Text := dm.QCliCNPJ_CLI.AsString;

    if trim(dm.QCliFJ_CLI.AsString) = 'F' then
      edtdoc.Text := dm.QCliDOC_CLI.AsString
    else
      edtdoc.Text := dm.QCliINSC_ESTADUAL.AsString;

    edtpai.Text := dm.QCliPAI_CLI.AsString;
    edtmae.Text := dm.QCliMAE_CLI.AsString;
    edtconjuge.Text := dm.QCliCONJUGE_CLI.AsString;
    if trim(dm.QCliESTCIVIL_CLI.AsString) = 'C' then
      ComboCivil.ItemIndex := 0
    else if trim(dm.QCliESTCIVIL_CLI.AsString) = 'S' then
      ComboCivil.ItemIndex := 1
    else if trim(dm.QCliESTCIVIL_CLI.AsString) = 'O' then
      ComboCivil.ItemIndex := 2
    else
      ComboCivil.ItemIndex := -1;
    edtrenda.Text := dm.QCliRENDA_CLI.AsString;
    EdtLimiteCredito.Text := dm.QCliLIMITE_CLI.AsString;
    EdtLimiteCheque.Text := dm.QCliLIMITE_CHEQUE.AsString;
    edtprof.Text := dm.QCliPROFISSAO_CLI.AsString;
    edtemp.Text := dm.QCliEMPRESA_TRAB_CLI.AsString;
    if trim(dm.QCliATIVO_CLI.AsString) = 'S' then
      RDGAtivo.ItemIndex := 0
    else
      RDGAtivo.ItemIndex := 1;

    EdtCodConvenio.Text := dm.QCliCOD_CON.AsString;
    EdtNomeConvenio.Text := dm.QCliNOME_CON.AsString;
    MemoObsVenda.Text := dm.QCliOBS_VENDA.AsString;
    MemoObsDiversos.Text := dm.QCliOBS_CLI.AsString;
    EdtNasc.Text := dm.QCliNASCIMENTO_CLI.AsString;
    edtdatacadastro.date := dm.QCliDATACADASTRO_CLI.Value;
    EdtAtrazoMaximo.Text := dm.QCliATRAZO_MAXIMO_CLI.AsString;
    edtcel.Text := dm.QCliCELULAR_CLI.AsString;
    if trim(dm.QCliIMP_SALDO_PENDENTE_CLI.AsString) = 'S' then
      CheckImpSaldo.Checked := true
    else
      CheckImpSaldo.Checked := false;

    if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'DN' then
      ComboCredito.ItemIndex := 0
    else if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'PR' then
      ComboCredito.ItemIndex := 1
    else if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'CH' then
      ComboCredito.ItemIndex := 2
    else if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'PC' then
      ComboCredito.ItemIndex := 3
    else if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'BO' then
      ComboCredito.ItemIndex := 4
    else
      ComboCredito.ItemIndex := -1;

    EdtConsSPC.Text := dm.QCliDATA_CONSULTA_SPC.AsString;
    EdtRegSPC.Text := dm.QCliDATA_REGISTRO_SPC.AsString;
    EdtReabSPC.Text := dm.QCliDATA_REABILITACAO_SPC.AsString;
    EdtRendaConj.Text := dm.QCliRENDA_CONJUGE.AsString;
    EdtTrabalhoConj.Text := dm.QCliTRABALHO_CONJUGE.AsString;
    EdtProfConj.Text := dm.QCliPROF_CONJUGE.AsString;
    EdtFant.Text := dm.QCliNOME_FANTASIA.AsString;
    EdtPR.Text := dm.QCliPONTO_REFERENCIA.AsString;
    EdtContato.Text := dm.QCliCONTATO_CLI.AsString;
    if trim(dm.QCliCONTROLAR_LIMITE.AsString) = 'S' then
      CheckControlarLimite.Checked := true
    else
      CheckControlarLimite.Checked := false;
    EdtEndCob.Text := dm.QCliENDCOB_CLI.AsString;
    EdtBaiCob.Text := dm.QCliBAICOB_CLI.AsString;
    EdtCidCob.Text := dm.QCliCIDCOB_CLI.AsString;

    for i := 0 to 26 do
    begin 
      if ComboEstCob.Items[i] = dm.QCliESTCOB_CLI.AsString then
        ComboEstCob.ItemIndex := i;
    end;
    EdtCepCob.Text := dm.QCliCEPCOB_CLI.AsString;
    EdtTelCob.Text := dm.QCliTELCOB_CLI.AsString;
    if trim(dm.QCliBLOQUEADO_CLI.AsString) = 'S' then
      RdgBloqueado.ItemIndex := 0
    else
      RdgBloqueado.ItemIndex := 1;

    EdtIBGE.Text := dm.qcliCODIGO_IBGE.AsString;
    EdtNumRes.Text := dm.qcliNUMRES_CLI.AsString;
    EdtNumCom.Text := dm.qcliNUMCOM_CLI.AsString;
    EdtNumCob.Text := dm.qcliNUMCOB_CLI.AsString;
    EdtEmail.Text := dm.QCliEMAIL_CLI.AsString;

    FormShow(Sender);
    show;
  end;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
end;

procedure TFrmContasRecRec.btnImprimeClick(Sender: TObject);
var
  Titulo: TACBrTitulo;
//  Extrato: TACBrExtratoTitulo;
  COD_CEDENTE: Integer;
begin 
  if QBoletos.IsEmpty then
     begin 
        Exit;
     end;
  QBoletos.First;
  if QBoletosCOD_CEDENTE.IsNull then
     Exit;

//  COD_CEDENTE := dm.RetornaIntegerTabela('COD_CEDENTE', 'PARAMETROS',
  //  'COD_EMP', iEmp);
  COD_CEDENTE := 0;

  while not QBoletos.eof do
  begin 
    if (DBGridBoletos.SelectedRows.CurrentRowSelected = true) then
    begin 
       if COD_CEDENTE = 0 then
         begin 
            COD_CEDENTE := QBoletosCOD_CEDENTE.AsInteger;
            if not dm.SetarCedente(COD_CEDENTE) then
              begin 
                  exit;
              end;
         end;
      if not ( QBoletosCOD_CEDENTE.AsInteger = COD_CEDENTE ) then
         begin 
            KDialog( 'Não pode imprimir boletos de cedentes diferentes!', 'Emissão Boletos', tdtErro );
            exit;
         end;
      Titulo := dm.Boleto.CriarTituloNaLista;
      with Titulo do
      begin 
        Vencimento := QBoletosVENCIMENTO.AsDateTime;
        DataDocumento := QBoletosDATA_DOCUMENTO.AsDateTime;
        NumeroDocumento := '';//QBoletosNUMERO_DOC.AsString;
        EspecieDoc := QBoletosESPECIE_DOC.AsString;

        if Trim( QBoletosACEITE.AsString ) = 'S' then
          Aceite := atSim
        else
          Aceite := atNao;
        DataProcessamento := QBoletosDATA_PROCESSAMENTO.AsDateTime;
        Carteira := QBoletosCARTEIRA.AsString;
        NossoNumero := QBoletosNOSSO_NUMERO.AsString;

        ValorDocumento := QBoletosVALOR_DOCUMENTO.AsCurrency;
        Sacado.NomeSacado := QBoletosNOME_CLI.AsString;
        Sacado.CNPJCPF := QBoletosCNPJ_CLI.AsString;
        Sacado.Logradouro := QBoletosENDRES_CLI.AsString;
        Sacado.Numero := QBoletosNUMRES_CLI.AsString;
        Sacado.Bairro := QBoletosBAIRES_CLI.AsString;
        Sacado.Cidade := QBoletosCIDRES_CLI.AsString;
        Sacado.UF := QBoletosESTRES_CLI.AsString;
        Sacado.CEP := QBoletosCEPRES_CLI.AsString;
        ValorAbatimento := 0;
        LocalPagamento := QBoletosLOCAL_PAGAMENTO.AsString;
        ValorMoraJuros := QBoletosVALOR_MORA_JURUS.AsCurrency;
        ValorDesconto := 0;
        ValorAbatimento := 0;
        DataMoraJuros := QBoletosDATA_MORA_JUROS.AsDateTime;
        DataDesconto := 0;
        DataAbatimento := 0;
        if QBoletosDATA_PROTESTO.IsNull then
           DataProtesto := 0
        else
           DataProtesto := QBoletosDATA_PROTESTO.AsDateTime;
        PercentualMulta := QBoletosPORCENTUAL_MULTA.AsCurrency;
        Mensagem.Text := '';
        OcorrenciaOriginal.Tipo := toRemessaRegistrar;
        Instrucao1 := '';
        Instrucao2 := '';
{                  Extrato := CriarExtratoNaLista;
                  Extrato.CodRegistro := QBoletosCOD_CTR.AsString;
                  Extrato.Descricao := 'Débito código ' + QBoletosCOD_CTR.AsString;
                  Extrato.Valor := QBoletosVALOR_DOCUMENTO.AsCurrency;}
      end;
    end;
    QBoletos.Next;
  end;
  if dm.Boleto.ListadeBoletos.Count > 0 then
     dm.Boleto.Imprimir;
end;

procedure TFrmContasRecRec.BtnAlterarSituacaoClick(Sender: TObject);
var
  sSitCliente: string;
  sAux: string;
begin 
  bSituacao := false;
  Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
  FrmSenhaLiberaVenda.tag := 5;
  FrmSenhaLiberaVenda.showmodal;

  if bSituacao then
  begin 
    if EdtCodCli.Text <> '' then
    begin 
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      try
        try
          with dm.QConsulta do
          begin 
            Close;
            sql.Clear;
            sql.add('SELECT BLOQUEADO_CLI FROM CLIENTE WHERE COD_CLI = :CODCLI');
            ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
            Open;
            sSitCliente := trim(fieldbyname('bloqueado_cli').AsString);
          end;
          dm.IBTransaction.Commit;
        except
          dm.IBTransaction.Rollback;
          AlertaCad('Erro ao verificar a situação do cliente');
        end;
      finally
        dm.QConsulta.Close;
      end;

      if not(sSitCliente = '') then
      begin 
        if sSitCliente = 'N' then
          sAux := 'Deseja Bloquear o Cliente?'
        else
          sAux := 'Deseja Desbloquear o Cliente?';
        if Application.MessageBox(Pchar(sAux), 'Atenção',
          mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
        begin 
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.Consulta do
              begin 
                Close;
                sql.Clear;
                sql.add('UPDATE CLIENTE SET BLOQUEADO_CLI = :SIT WHERE COD_CLI = :CODCLI');
                ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
                if sSitCliente = 'N' then
                begin 
                  ParamByName('sit').AsString := 'S';
                  LSit.Font.Color := clRed;
                  LSit.Caption := 'BLOQUEADO';
                end
                else
                begin 
                  ParamByName('sit').AsString := 'N';
                  LSit.Font.Color := clNavy;
                  LSit.Caption := '';
                end;
                ExecOrOpen;
              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              AlertaCad('Erro ao atualizar a situação do cliente');
            end;
          finally
            dm.Consulta.Close;
            BtnOk.Click;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmContasRecRec.EdtDataJurosExit(Sender: TObject);
begin 
  if EdtDataJuros.date < date then
  begin 
    AlertaCad('A data referência para juros não pode ser menor que hoje');
//    EdtDataJuros.SetFocus;
  end;
end;

procedure TFrmContasRecRec.BtnLancarClick(Sender: TObject);
begin 
  BuscaFormulario( TFrmLancContasReceber, True  );
end;

procedure TFrmContasRecRec.RdgClienteClick(Sender: TObject);
begin 
  if RdgCliente.Checked then
  begin 
    EdtDocumento.Visible := false;
    EdtCodCli.Visible := true;
    EdtNomeCli.Visible := true;
    BtnConsCli.Visible := true;
    Label2.Visible := true;
    Label1.Caption := 'Cód.Cliente';
    EdtCodCli.SetFocus;
  end;
end;

procedure TFrmContasRecRec.RdgDocumentoClick(Sender: TObject);
begin 
  if RdgDocumento.Checked then
  begin 
    EdtCodCli.Visible := false;
    EdtNomeCli.Visible := false;
    BtnConsCli.Visible := false;
    Label2.Visible := false;
    Label1.Caption := 'Documento';
    EdtDocumento.Visible := true;
    EdtDocumento.SetFocus;
  end;
end;

procedure TFrmContasRecRec.Button2Click(Sender: TObject);
begin 
  DBGridARec.SetFocus;
  PanelObs.Visible := false;
end;

procedure TFrmContasRecRec.btnBoletosClick(Sender: TObject);
var
  COD_CEDENTE: Integer;
  NOSSO_NUMEROO: Integer;

begin 
  COD_CEDENTE := dm.RetornaIntegerTabela('COD_CEDENTE', 'PARAMETROS',
    'COD_EMP', iEmp);
  if not dm.SetarCedente(COD_CEDENTE) then
  begin 
    exit;
  end;
  QConsARec.First;
  while not QConsARec.eof do
  begin 
    if (DBGridARec.SelectedRows.CurrentRowSelected = true) then
    begin 
       if ( QConsARecCOD_BOLETO.AsInteger = 0 ) or ( QConsARecCOD_BOLETO.IsNull ) then
          begin 
             QAux.Close;
             QAux.SQL.Text := 'INSERT INTO BOLETOS ( COD_EMP, COD_CEDENTE,'+
             ' COD_CTR, COD_CLI, DATA_DOCUMENTO, VENCIMENTO, NUMERO_DOC,'+
             ' ESPECIE_DOC, ACEITE, DATA_PROCESSAMENTO, CARTEIRA, VALOR_DOCUMENTO,'+
             ' VALOR_ABATIMENTO, LOCAL_PAGAMENTO, VALOR_MORA_JURUS,'+
             ' VALOR_DESCONTO, DATA_MORA_JUROS, DATA_DESCONTO, DATA_ABATIMENTO,'+
             ' DATA_PROTESTO, PORCENTUAL_MULTA, OCORRENCIA, STATUS)'+
             ' VALUES ( :COD_EMP, :COD_CEDENTE, :COD_CTR, :COD_CLI, :DATA_DOCUMENTO,'+
             ' :VENCIMENTO, :NUMERO_DOC, :ESPECIE_DOC, :ACEITE, :DATA_PROCESSAMENTO,'+
             ' :CARTEIRA, :VALOR_DOCUMENTO, :VALOR_ABATIMENTO, :LOCAL_PAGAMENTO,'+
             ' :VALOR_MORA_JURUS, :VALOR_DESCONTO, :DATA_MORA_JUROS, :DATA_DESCONTO,'+
             ' :DATA_ABATIMENTO, :DATA_PROTESTO, :PORCENTUAL_MULTA, :OCORRENCIA, :STATUS );';
             QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
             QAux.ParamByName( 'COD_CEDENTE' ).AsInteger := COD_CEDENTE;
             Qaux.ParamByName( 'COD_CTR' ).AsInteger := QConsARecCOD_CTR.AsInteger;
             QAux.ParamByName( 'COD_CLI' ).AsInteger := QConsARecCOD_CLI.AsInteger;
             QAux.ParamByName( 'DATA_DOCUMENTO' ).AsDateTime := QConsARecDATA_CTR.AsDateTime;
             QAux.ParamByName( 'VENCIMENTO' ).AsDateTime := QConsARecVENCTO_CTR.AsDateTime;
             QAux.ParamByName( 'NUMERO_DOC' ).AsString := '';//QConsARecNUMDOCUMENTO_CTR.AsString;
             QAux.ParamByName( 'ESPECIE_DOC' ).AsString := dm.EspecieDoc;
             QAux.ParamByName( 'ACEITE' ).AsString := dm.Aceitee;
             QAux.ParamByName( 'DATA_PROCESSAMENTO' ).AsDateTime := now;
             QAux.ParamByName( 'CARTEIRA' ).AsString := dm.carteiraa;
             QAux.ParamByName( 'VALOR_DOCUMENTO' ).AsCurrency := QConsARecVALOR_CTR.AsCurrency;
             QAux.ParamByName( 'LOCAL_PAGAMENTO' ).AsString := dm.Mensagem_Pagamento;
             QAux.ParamByName( 'VALOR_MORA_JURUS' ).AsCurrency := dm.Valor_dia_Atraso;
             QAux.ParamByName( 'VALOR_DESCONTO' ).AsCurrency := 0;
             QAux.ParamByName( 'VALOR_ABATIMENTO' ).Value := null;
             QAux.ParamByName( 'DATA_MORA_JUROS' ).AsDateTime := QConsARecVENCTO_CTR.AsDateTime;
             QAux.ParamByName( 'DATA_DESCONTO' ).Value := null;
             QAux.ParamByName( 'DATA_ABATIMENTO' ).Value := null;
             if dm.tipo_remessa = 2 then
                 QAux.ParamByName( 'DATA_PROTESTO' ).Value := null
             else
                 QAux.ParamByName( 'DATA_PROTESTO' ).AsDateTime := QConsARecVENCTO_CTR.AsDateTime + dm.dias_protesto;
             QAux.ParamByName( 'PORCENTUAL_MULTA' ).AsCurrency := dm.MultaAtrazo;

             if dm.tipo_remessa = 2 then
                begin 
                   QAux.ParamByName( 'OCORRENCIA' ).AsString := 'Emitido';
                   QAux.ParamByName( 'STATUS' ).AsString := 'EM';
                end
             else
                begin 
                   QAux.ParamByName( 'OCORRENCIA' ).AsString := 'Remessa Registrar ( Aguarda )';
                   QAux.ParamByName( 'STATUS' ).AsString := 'RR';
                end;
             Qaux.ExecOrOpen;
          end
    end;
      QConsARec.next;
  end;
  QConsARec.Close;
  IBTRCTR.Commit;
  IBTRCTR.StartTransaction;
  QConsARec.Open;
end;

  procedure TFrmContasRecRec.BtnObsClick(Sender: TObject);
  begin 
    iAuxCodCTR := QConsARecCOD_CTR.AsInteger;
    iAuxSeq := QConsARecSEQUENCIA_CTR.AsInteger;
    PanelObs.Visible := true;
    EdtObs.Text := QConsARecOBS_CTR.AsString;
    EdtObs.SetFocus;
  end;

  procedure TFrmContasRecRec.Button1Click(Sender: TObject);
  begin 
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin 
          Close;
          sql.Clear;
          sql.add('UPDATE CONTAS_RECEBER ' + 'SET OBS_CTR = :OBS ' +
            'WHERE COD_CTR = :CODCTR');
          if trim(EdtObs.Text) = '' then
            ParamByName('obs').Value := null
          else
            ParamByName('obs').AsString := trim(EdtObs.Text);
          ParamByName('codctr').AsInteger := QConsARecCOD_CTR.AsInteger;
          ExecOrOpen;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        AlertaCad('Erro ao gravar o observação');
      end;
    finally
      dm.QConsulta.Close;
      DBGridARec.SetFocus;
      PanelObs.Visible := false;
      BtnOk.Click;
    end;
  end;

  procedure TFrmContasRecRec.PCPrincipalChange(Sender: TObject);
  var
    cTotalDevedorCh, cSaldoCH: currency;
  begin 
    EncerraTransacoes;
    cTotalDevedorCh := 0;
    cSaldoCH := 0;

    if trim(EdtCodCli.Text) = '' then
    begin 
      AlertaCad('Digite o código do cliente');
//      EdtCodCli.SetFocus;
      exit;
    end;

    case PCPrincipal.ActivePageIndex of
      0:
        begin 
          PcCred.ActivePageIndex := 0;
          PcCredChange(PcCred);
        end;
      1:
        begin 
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with QTotaisCheque do
              begin 
                Close;
                ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
                if (not CheckEmp.Checked) then
                  ParamByName('codemp').AsInteger := iEmp
                else
                  ParamByName('codemp').AsInteger := 0;
                Open;

                { alimentado os Labels }
                cTotalDevedorCh := QTotaisChequeABERTOS.AsCurrency +
                  QTotaisChequeDEVOLVIDOSPRI.AsCurrency +
                  QTotaisChequeDEVOLVIDOSSEG.AsCurrency;
                cSaldoCH := cLimiteCheque - cTotalDevedorCh;

                if cSaldoCH <= 0 then
                  LSaldoCH.Font.Color := clYellow
                else
                  LSaldoCH.Font.Color := clWhite;

                LAbertos.Caption := currtostrf(QTotaisChequeABERTOS.AsCurrency,
                  ffnumber, 2);
                LDepositadosPri.Caption :=
                  currtostrf(QTotaisChequeDEPOSITADOSPRI.AsCurrency,
                  ffnumber, 2);
                LDepositadosSeg.Caption :=
                  currtostrf(QTotaisChequeDEPOSITADOSSEG.AsCurrency,
                  ffnumber, 2);
                LPagos.Caption := currtostrf(QTotaisChequePAGOS.AsCurrency,
                  ffnumber, 2);
                LDev1.Caption :=
                  currtostrf(QTotaisChequeDEVOLVIDOSPRI.AsCurrency,
                  ffnumber, 2);
                LDev2.Caption :=
                  currtostrf(QTotaisChequeDEVOLVIDOSSEG.AsCurrency,
                  ffnumber, 2);

                LQuant.Caption := QTotaisChequeQTDCHEQUE.AsString;
                LDevCh.Caption := currtostrf(cTotalDevedorCh, ffnumber, 2);
                LSaldoCH.Caption := currtostrf(cSaldoCH, ffnumber, 2);

                { verificando a situação do cliente }
                if LSitCh.Caption <> 'BLOQUEADO' then
                begin 
                  LSitCh.Font.Color := clWhite;
                  if QTotaisChequeDEVOLVIDOSSEG.AsCurrency > 0 then
                    LSitCh.Caption := '2ª DEVOLUÇÃO'
                  else if QTotaisChequeDEVOLVIDOSPRI.AsCurrency > 0 then
                    LSitCh.Caption := '1ª DEVOLUÇÃO'
                  else if QTotaisChequeABERTOS.AsCurrency > 0 then
                    LSitCh.Caption := 'EM ABERTO'
                  else if QTotaisChequePAGOS.AsCurrency > 0 then
                    LSitCh.Caption := 'OK'
                  else if QTotaisChequeDEPOSITADOSSEG.AsCurrency > 0 then
                    LSitCh.Caption := 'OK'
                  else if QTotaisChequeDEPOSITADOSPRI.AsCurrency > 0 then
                    LSitCh.Caption := 'OK'
                  else
                    LSitCh.Caption := 'OK';
                end;

              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              AlertaCad('erro ao buscar os totais dos cheques');
            end;
          finally
            QTotaisCheque.Close;
          end;

          PCCheque.ActivePageIndex := 0;
          PCChequeChange(PCCheque);
        end;
    end;
  end;

  procedure TFrmContasRecRec.PCChequeChange(Sender: TObject);
  begin 
    if IBTRCTR.Active then
      IBTRCTR.Commit;
    IBTRCTR.StartTransaction;
    with QConsCheque do
    begin 
      Close;
      ParamByName('codcli').AsInteger := strtoint(EdtCodCli.Text);
      if (not CheckEmp.Checked) then
        ParamByName('codemp').AsInteger := iEmp
      else
        ParamByName('codemp').AsInteger := 0;
      ParamByName('opcao').AsInteger := PCCheque.ActivePageIndex + 1;
      Open;
    end;
  end;

  procedure TFrmContasRecRec.EncerraTransacoes;
  begin 
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
    if IBTRCTR.Active then
      IBTRCTR.Commit;
  end;

  procedure TFrmContasRecRec.BtnFichaChequeClick(Sender: TObject);
  begin 
    BtnFicha.Click;
  end;

  procedure TFrmContasRecRec.BtnLancarChequeClick(Sender: TObject);
  begin 
    BuscaFormulario( TFrmCadCheque, True );
  end;

  procedure TFrmContasRecRec.DBGridARecDblClick(Sender: TObject);
  var
    iAuxQuebra: Integer;
    sAuxExtenso: string;
    iDuplicata: Integer;
  begin 
    { RDprintDuplicata.Abrir;

      if QConsARecCODIGO_DUPLICATA.IsNull then
      begin 
      if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      try
      try
      QDuplicata.Close;
      QDuplicata.ParamByName('cod').AsInteger:= QConsARecCOD_CTR.AsInteger;
      QDuplicata.ParamByName('seq').AsInteger:= QConsARecSEQUENCIA_CTR.AsInteger;
      QDuplicata.Open;
      iDuplicata:= QDuplicataCOD_DUPLICATA.AsInteger;
      dm.IBTransaction.Commit;
      except
      dm.IBTransaction.Rollback;
      iDuplicata:= 0;
      AlertaCad('erro incluindo número da duplicata');
      end;
      finally
      QDuplicata.Close;
      end;
      end
      else
      iDuplicata:= QConsARecCODIGO_DUPLICATA.AsInteger;

      RDprintDuplicata.Imp(8, 71, QConsARecPARCELA_CTR.AsString);

      RDprintDuplicata.ImpVal(13, 25,'#,###,##0.00', QConsARecVALOR_CTR.AsCurrency, []);

      RDprint.Imp(13, 45, QConsARecNUMDOCUMENTO_CTR.AsString);

      rdprint.ImpVal(13, 68,'#,###,##0.00', QConsARecVALOR_CTR.AsCurrency, []);
      RDprint.Imp(13, 87,  FormataStringD(IntToStr(iDuplicata), '6', '0'));
      RDprint.Imp(13, 100, QConsARecVENCTO_CTR.AsString);



      RDprint.Imp(18, 36,  QConsARecCOD_CLI.AsString + '-' + QConsARecNOME_CLI.AsString);

      RDprint.Imp(20, 36,  QParcelasENDRES_CLI.AsString + ' - ' + QParcelasBAIRES_CLI.AsString);
      RDprint.Imp(21, 36,  QParcelasCIDRES_CLI.AsString);
      RDprint.Imp(21, 83,  QParcelasCEPRES_CLI.AsString);
      RDprint.Imp(21, 108, QParcelasESTRES_CLI.AsString);
      RDprint.Imp(22, 36,  QParcelasCIDRES_CLI.AsString);
      RDprint.Imp(24, 36,  QParcelasCNPJ_CLI.AsString);

      if trim(QParcelasFJ_CLI.AsString) = 'J' then
      RDprint.Imp(24, 83, QParcelasINSC_ESTADUAL.AsString);

      sAuxExtenso:= Extenso(QParcelasVALOR_CTR.AsCurrency);
      if length(sAuxExtenso) > 73 then
      begin 
      iAuxQuebra := Quebra(copy(sAuxExtenso, 1, 73));
      RDprint.Imp(26, 32, copy(sAuxExtenso, 1, iAuxQuebra));
      RDprint.Imp(27, 32, copy(sAuxExtenso, iAuxQuebra + 1, length(sAuxExtenso)));
      end
      else
      RDprint.Imp(26, 32, sAuxExtenso);
      RDprint.Novapagina;
      end;
      QParcelas.Next;
      end;
      RDprint.Fechar;
      BuscaParcelas; }
  end;

  procedure TFrmContasRecRec.DBGridARecDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
  begin 
    if Column.Field.FieldName = 'STATUS' then
    begin 
      if QConsARecCOD_BOLETO.AsInteger > 0 then
        Imagens.Draw(DBGridARec.Canvas, Rect.Left + 5, Rect.Top + 1, 0);

    end;

  end;

end.




