unit UDadosNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Mask, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, System.StrUtils,
  System.Math;

type
  TFrmDadosNotaFiscal = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GB4: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    EdtQuantidade: TEdit;
    EdtEspecie: TEdit;
    EdtMarca: TEdit;
    EdtNum: TEdit;
    GB5: TGroupBox;
    MemoObs: TMemo;
    Label24: TLabel;
    EdtDataSaida: TDateTimePicker;
    Label9: TLabel;
    EdtHoraSaida: TDateTimePicker;
    RdgFrete: TRadioGroup;
    EdtCodTransp: UNovosComponentes.TEdit;
    BtnConsTransp: TsSpeedButton;
    BtnAddTransp: TsSpeedButton;
    EdtNomeTransp: TEdit;
    GroupBox1: TGroupBox;
    BtnGeraNF: TButton;
    QInsertNF: TFDQuery;
    QInsertNFCODIGO: TIntegerField;
    QInsertNFNUMERONF: TIntegerField;
    QInsertItensNF: TFDQuery;
    QBuscaItensNF: TFDQuery;
    QInsRegistroSaida: TFDQuery;
    QInsRegistroSaidaCODREG: TIntegerField;
    QItensRegistro: TFDQuery;
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
    QInsItensRegistroSaida: TFDQuery;
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
    QBuscaRegistroSaidaNUMERO_NOTA_FINAL: TIntegerField;
    QBuscaRegistroSaidaCODIGO_MAPA_RESUMO: TIntegerField;
    QBuscaRegistroSaidaCODIFICACAO_FISCAL: TStringField;
    Label1: TLabel;                                              
    EdtDataEmissao: TMaskEdit;
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
    EdtPesoBruto: TCurrencyEdit;
    EdtPesoLiquido: TCurrencyEdit;
    IBTRFatura: TFDTransaction;
    QAuxFatura: TFDQuery;
    TRNota: TFDTransaction;
    QBuscaItensNFCALC_TOTAL: TCurrencyField;
    QBuscaItensNFISENTO_PIS_COFINS_PRO: TStringField;
    QBuscaItensNFORDEM: TIntegerField;
    QBuscaItensNFCOD_NF: TIntegerField;
    QBuscaItensNFCST: TStringField;
    QBuscaItensNFALIQ: TBCDField;
    QBuscaItensNFCOD_EMP: TIntegerField;
    QBuscaItensNFCOD_GRP: TIntegerField;
    QBuscaItensNFQUANT: TBCDField;
    QBuscaItensNFALIQ_IPI: TBCDField;
    QBuscaItensNFREDUCAO_ICMS: TBCDField;
    QBuscaItensNFCOD_CFO: TIntegerField;
    QBuscaItensNFSUB_TRIBUTARIA: TStringField;
    QBuscaItensNFVR_AGREGADO: TBCDField;
    QBuscaItensNFALIQUOTA_FORA_ESTADO: TBCDField;
    QBuscaItensNFUNIDADE: TStringField;
    QBuscaItensNFCOD_PRO: TIntegerField;
    QBuscaItensNFVALOR_TOTAL: TBCDField;
    QBuscaItensNFBASE_CALCULO: TBCDField;
    QBuscaItensNFVALOR_ICMS: TBCDField;
    QBuscaItensNFBASE_SUBTRIB: TBCDField;
    QBuscaItensNFVALOR_IPI: TBCDField;
    QBuscaItensNFVALOR_SUBTRIB: TBCDField;
    QBuscaItensNFCLASSIFICACAO_FISCAL: TStringField;
    QBuscaItensNFUNIT: TBCDField;
    QBuscaItensNFISENTAS: TBCDField;
    QBuscaItensNFOUTRAS: TBCDField;
    QBuscaItensNFFRETE: TFloatField;
    QBuscaItensNFDESCONTO: TFloatField;
    QBuscaItensNFBC_PIS: TBCDField;
    QBuscaItensNFALIQ_PIS: TBCDField;
    QBuscaItensNFVALOR_PIS: TBCDField;
    QBuscaItensNFBC_COFINS: TBCDField;
    QBuscaItensNFALIQ_COFINS: TBCDField;
    QBuscaItensNFVALOR_COFINS: TBCDField;
    QBuscaItensNFCANCELADO: TIntegerField;
    QBuscaItensNFNF_CANCELADA: TIntegerField;
    QBuscaItensNFCST_PIS: TStringField;
    QBuscaItensNFCST_COFINS: TStringField;
    QBuscaItensNFCSOSN: TStringField;
    QBuscaItensNFCST_IPI: TStringField;
    QBuscaItensNFNOME_GRP: TStringField;
    QBuscaItensNFTIPO_GRP: TStringField;
    QBuscaItensNFDESTACA_ICMS: TStringField;
    QBuscaItensNFUSA_CSOSN: TStringField;
    QBuscaItensNFNOME_PRO: TStringField;
    QBuscaItensNFCOD_NCM: TStringField;
    QBuscaItensNFORIG: TIntegerField;
    QBuscaItensNFCST_PIS_1: TStringField;
    QBuscaItensNFCST_COFINS_1: TStringField;
    QBuscaItensNFCODIGO_BARRA_PRO: TStringField;
    QBuscaItensNFDESC_CUPOM: TStringField;
    QBuscaItensNFALIQ_IBPT_NAC: TBCDField;
    QBuscaItens: TFDQuery;
    QBuscaItensID_OS_ITEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TFloatField;
    QBuscaItensVALOR_CUSTO: TFloatField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensCST: TStringField;
    QBuscaItensIPI: TFloatField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    QBuscaItensRED_CF_EST: TBCDField;
    procedure EdtCodTranspEnter(Sender: TObject);
    procedure EdtCodTranspExit(Sender: TObject);
    procedure EdtCodTranspKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTranspKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddTranspClick(Sender: TObject);
    procedure BtnConsTranspClick(Sender: TObject);
    procedure BtnGeraNFClick(Sender: TObject);
    function  GravaNotaFiscal : boolean;
    procedure CalculaItensNotaFiscal;
    procedure FormShow(Sender: TObject);
    procedure GeraLivroSaidas;
    procedure GeraLivroEntradas;
    procedure ImprimeNotaFiscal;
    procedure BuscaRegistroSaida(const iCodigoRegistro : integer);
    procedure BuscaRegistroEntrada(const iCodigoRegistro : integer);
    procedure QBuscaItensNFCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GerarContas(cod_nf, cod_tipo_venda: Integer);
  private
    { Private declarations }
  public
    Venda : Boolean;
    IDCLIENTE, IDOS : Integer;
    VALORDESC : Double;
    { Public declarations }
  end;

var
  FrmDadosNotaFiscal: TFrmDadosNotaFiscal;

implementation

uses
  UDM, Ubibli1, UCadTransp, UConsTransp, UVenda, UFechaVenda, URegSaidas, 
  UImprimeNotaFiscal, UOutrasSaidas, UOutrasEntradas, URegEntradas, UDialog, 
  UNovoPrincipal, UDicTributacao, UOS;

var iCodigoNotaFiscal   : integer;
    iNumeroNotaFiscal   : integer;
    sSerieNotaFiscal    : string;
    sCodificacaoFiscal  : string;

{$R *.dfm}

procedure TFrmDadosNotaFiscal.GerarContas(cod_nf, cod_tipo_venda: Integer);
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
  iCodCobranca := dm.RetornaIntegerTabela('codigo_cobranca', 'parametros',
    'cod_emp', iEmp);
  iCodClassif := dm.RetornaIntegerTabela('codigo_classificacao', 'tipo_venda',
    'cod_tpv', Cod_tipo_venda);
  cTotalNota := StrToCurr( FrmVenda.EdtTotalLiquido.Caption );
  cValorEntrada := 0;
  cValorParcela := 0;
  cDiferenca := 0;
  cVlFrete := 0;
  vData := Date;
  Valor := 0;
  Parcela := 0;
  DOC := IntToStr( cod_nf );

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
        Parambyname('codnf').AsInteger := cod_nf;
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
    //BuscaFatura;
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
        Parambyname('codtpv').AsInteger := cod_tipo_venda;
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
      Parambyname('1').AsInteger := cod_nf;
      Parambyname('2').AsInteger := 1;
      Parambyname('3').AsCurrency := cValorEntrada;
      Parambyname('4').AsDate := date;
      ExecOrOpen;
    IBTRFatura.Commit;
    QAuxFatura.close;
    cVlFrete := 0;
    end;
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
        Parambyname('1').AsInteger := cod_nf;
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
          Parambyname('4').AsDate := date + iDiasPri
        else
          Parambyname('4').AsDate := (date + iDiasPri) +
            (iDiasEntre * (i - 1));
        vData := Parambyname('4').AsDate;
        Valor := Parambyname('3').AsCurrency;
        Parcela := Parambyname('2').AsInteger;
        ExecOrOpen;

      end;
    end;
    IBTRFatura.Commit;
    QAuxFatura.close;
  end;
end;


function TFrmDadosNotaFiscal.GravaNotaFiscal : boolean;
begin 
   sCodificacaoFiscal   := dm.RetornaStringTabela('codificacao_fiscal', 'parametros', 'cod_emp', iEmp);
   sSerieNotaFiscal     := dm.RetornaStringTabela('serie_nf', 'parametros', 'cod_emp', iEmp);

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsertNF do
          begin 
             Parambyname('codemp').AsInteger        := iEmp;
             Parambyname('dataemissao').AsDate      := strtodate(EdtDataEmissao.Text);
             Parambyname('datasaida').AsDate        := EdtDataSaida.date;
             Parambyname('horasaida').AsTime        := EdtHoraSaida.Time;
             Parambyname('tipocliente').AsString    := 'F';
             Parambyname('codtransp').AsInteger     := strtoint(EdtCodTransp.text);
             Parambyname('freteconta').AsString     := inttostr(RdgFrete.ItemIndex + 1);
             Parambyname('cf').AsString             := trim(sCodificacaoFiscal);
             Parambyname('serie').AsString          := trim(sSerieNotaFiscal);

             if trim(EdtQuantidade.Text) = '' then
                Parambyname('quantidade').AsInteger := 0
             else
                Parambyname('quantidade').AsInteger := strtoint(EdtQuantidade.Text);

             Parambyname('especie').AsString        := trim(EdtEspecie.Text);
             Parambyname('marca').AsString          := trim(EdtMarca.Text);
             Parambyname('numero').AsString         := trim(EdtNum.Text);
             Parambyname('pesobruto').AsCurrency    := strtocurr(EdtPesoBruto.Text);
             Parambyname('pesoliquido').AsCurrency  := strtocurr(EdtPesoLiquido.Text);

             if trim(MemoObs.Text) = '' then
                Parambyname('informacoes').Value         := null
             else
                Parambyname('informacoes').AsString      := trim(MemoObs.Text);

             case FrmDadosNotaFiscal.tag of
               0: begin   //vendas
                     Parambyname('codcli').AsInteger     := strtoint(FrmVenda.EdtCodcli.Text);
                     Parambyname('codfor').Value         := null;
                     Parambyname('codtpv').AsInteger     := strtoint(FrmVenda.EdtCodTPV.text);
                     Parambyname('tiponf').AsInteger     := 0;
                     Parambyname('desconto').AsCurrency  := strtocurr(FrmFechaVenda.EdtValorDesconto.Text);
                  end;
               1: begin   // outras saidas
                     Parambyname('codcli').AsInteger     := strtoint(FrmOutrasSaidas.EdtCodcli.Text);
                     Parambyname('codfor').Value         := null;
                     Parambyname('codtpv').AsInteger     := 1;
                     Parambyname('tiponf').AsInteger     := 4;
                     Parambyname('desconto').AsCurrency  := 0;
                  end;
               2: begin   // outras entradas
                     Parambyname('codcli').Value         := null;
                     Parambyname('codfor').AsInteger     := strtoint(FrmOutrasEntradas.EdtCodFor.Text);
                     Parambyname('codtpv').AsInteger     := 1;
                     Parambyname('tiponf').AsInteger     := 5;
                     Parambyname('desconto').AsCurrency  := 0;
                  end;
               3: begin   //ORDEM DE SERVICO
                     Parambyname('codcli').AsInteger     := IDCLIENTE;
                     Parambyname('codfor').Value         := null;
                     Parambyname('codtpv').AsInteger     := 1;
                     Parambyname('tiponf').AsInteger     := 0;
                     Parambyname('desconto').AsCurrency  := VALORDESC;
                  end;
             end;

             Open;
             iCodigoNotaFiscal:= QInsertNFCODIGO.AsInteger;
             iNumeroNotaFiscal:= QInsertNFNUMERONF.AsInteger;
          end;
       dm.IBTransaction.Commit;
       result:= true;
     except
       dm.IBTransaction.Rollback;
       result:= false;
       AlertaCad('erro ao gravar a NF');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmDadosNotaFiscal.EdtCodTranspEnter(Sender: TObject);
begin 
   EdtCodTransp.SelectAll;
end;

procedure TFrmDadosNotaFiscal.EdtCodTranspExit(Sender: TObject);
begin 
   EdtNomeTransp.Text:= consulta('transportadora', EdtCodTransp, 'cod_tra', 'nome_tra', dm.IBTransaction, dm.qConsulta);
   if EdtNomeTransp.Text = '' then
      begin 
         AlertaCad('Transportadora não Cadastrada');
//         EdtCodTransp.SetFocus;
      end;
end;

procedure TFrmDadosNotaFiscal.EdtCodTranspKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsTransp.Click
   else
      if key = vk_f2 then
         BtnAddTransp.Click;
end;

procedure TFrmDadosNotaFiscal.EdtCodTranspKeyPress(Sender: TObject;
  var Key: Char);
begin 
    if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmDadosNotaFiscal.BtnAddTranspClick(Sender: TObject);
begin 
    BuscaFormulario( TFrmCadTransp, True );
end;

procedure TFrmDadosNotaFiscal.BtnConsTranspClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTransp, FrmConsTransp);
   FrmConsTransp.Tag:= 3;
   FrmConsTransp.ShowModal;
end;

procedure TFrmDadosNotaFiscal.BtnGeraNFClick(Sender: TObject);
var iOrdemItens : integer;
    bAuxErro    : boolean;
    sUFEmpresa  : string;
    sUFCliFor   : string;
    CriaTXT: TStrings;
    PastaTxt : string;
    TotalServicos: Currency;
begin 
   TotalServicos := 0;
   { tag = 0   Vendas
     tag = 1   Outras Saidas
     tag = 2   Outras Entradas }

   bAuxErro:= false;
   PastaTxt := dm.RetornaStringTabela( 'PASTA_TXT_SERV', 'PARAMETROS', 'COD_EMP', iEmp ) + '\';

   if trim(EdtCodTransp.Text) = '' then
      begin 
         AlertaCad('Digite o código da transportadora');
//         EdtCodTransp.SetFocus;
         exit;
      end;

   if EdtDataSaida.Date < strtodate(EdtDataEmissao.Text) then
      begin 
         AlertaCad('Data da saída não pode ser menor que data da emissão');
//         EdtDataSaida.SetFocus;
         exit;
      end;

   sUFEmpresa:= dm.RetornaStringTabela('est_emp', 'empresa', 'cod_emp', iEmp);

   case FrmDadosNotaFiscal.Tag of
     0: sUFCliFor:= dm.RetornaStringTabela('estres_cli', 'cliente',    'cod_cli', strtoint(FrmVenda.EdtCodcli.Text));
     1: sUFCliFor:= dm.RetornaStringTabela('estres_cli', 'cliente',    'cod_cli', strtoint(FrmOutrasSaidas.EdtCodcli.Text));
     2: sUFCliFor:= dm.RetornaStringTabela('est_for',    'fornecedor', 'cod_for', strtoint(FrmOutrasEntradas.EdtCodFor.Text));
   end;

   if trim(sUFEmpresa) = trim(sUFCliFor) then
      bNoEstado:= true
   else
      bNoEstado:= false;

   if GravaNotaFiscal then
      begin 
         case FrmDadosNotaFiscal.Tag of
           0: begin   // VENDAS
                 { gravando os itens da NF }
                 CriaTXT := TStringList.Create;
                 CriaTXT.Clear;
                 iOrdemItens:= 0;
                 with FrmVenda.QBuscaItens do
                    begin 
                       First;
                       while not eof do
                          begin
                             if FrmVenda.QBuscaItensSERVICO.AsString <> 'S' then
                             begin 
                             try
                               try
                                 QInsertItensNF.Close;
                                 if TRNota.Active then
                                    TRNota.Commit;
                                 TRNota.StartTransaction;
                                 inc(iOrdemItens);

                                 QInsertItensNF.Parambyname('1').AsInteger  := iOrdemItens;
                                 QInsertItensNF.Parambyname('2').AsInteger  := iCodigoNotaFiscal;
                                 QInsertItensNF.Parambyname('3').AsInteger  := FrmVenda.QBuscaItensCOD_PRO.AsInteger;

                                 if bNoEstado then
                                    begin
                                       QInsertItensNF.Parambyname('4').AsString    := FrmVenda.QBuscaItensCST_CF_EST.AsString;
                                       QInsertItensNF.Parambyname('9').AsInteger   := FrmVenda.QBuscaItensICMS_CF_EST.AsInteger;
                                       QInsertItensNF.Parambyname('12').AsCurrency := FrmVenda.QBuscaItensRED_CF_EST.AsCurrency;
                                       QInsertItensNF.Parambyname('13').AsInteger  := FrmVenda.QBuscaItensCFOP_VENDAS_CF_EST.AsInteger;
                                    end
                                 else
                                    begin 
                                       QInsertItensNF.Parambyname('4').AsString    := FrmVenda.QBuscaItensCST_CF_FORA.AsString;
                                       QInsertItensNF.Parambyname('9').AsInteger   := FrmVenda.QBuscaItensICMS_CF_FORA.AsInteger;
                                       QInsertItensNF.Parambyname('12').AsCurrency := FrmVenda.QBuscaItensRED_CF_FORA.AsCurrency;
                                       QInsertItensNF.Parambyname('13').AsInteger  := FrmVenda.QBuscaItensCFOP_VENDAS_CF_FORA.AsInteger;
                                    end;



                                 QInsertItensNF.Parambyname('5').AsCurrency   := FrmVenda.QBuscaItensQUANT.AsCurrency;

                                 if FrmVenda.QBuscaItensDESCONTO.AsCurrency > 0 then
                                   QInsertItensNF.Parambyname('6').AsCurrency   := FrmVenda.QBuscaItensVALOR.AsCurrency
                                 //                                    QInsertItensNF.Parambyname('6').AsCurrency   := (FrmVenda.QBuscaItensCALC_TOTAL.AsCurrency / FrmVenda.QBuscaItensQUANT.AsCurrency)
                                 else
                                    QInsertItensNF.Parambyname('6').AsCurrency   := FrmVenda.QBuscaItensVALOR.AsCurrency;
                                 QInsertItensNF.ParamByName('DESCONTO').AsCurrency := FrmVenda.QBuscaItensDESCONTO.AsCurrency;

                                 QInsertItensNF.Parambyname('7').AsCurrency   := frmvenda.QBuscaItensALIQUOTA_GRP.AsCurrency;
                                 QInsertItensNF.Parambyname('8').AsInteger    := iEmp;

                                 QInsertItensNF.Parambyname('10').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('14').AsString    := 'N';
                                 QInsertItensNF.Parambyname('15').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('16').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('18').AsString    := FrmVenda.QBuscaItensDESCRICAO.AsString;
                                 QInsertItensNF.Parambyname('19').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('20').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('21').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('22').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('23').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('24').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('25').Value       := null;
                                 QInsertItensNF.ParamByName( 'CST_IPI' ).AsString := FrmVenda.QBuscaItensCST_IPI.AsString;
                                 QInsertItensNF.ParamByName( 'CSOSN' ).AsString :=
                                   ifthen( bNoEstado,
                                      DicAligatorTrib.GetCSOSN( FrmVenda.QBuscaItensCST_CF_EST.AsString ),
                                      DicAligatorTrib.GetCSOSN( FrmVenda.QBuscaItensCST_CF_FORA.AsString ) );
                                 QInsertItensNF.ParamByName( 'CST_PIS' ).AsString := FrmVenda.QBuscaItensCST_PIS.AsString;
                                 QInsertItensNF.ParamByName( 'CST_COFINS' ).AsString := FrmVenda.QBuscaItensCST_COFINS.AsString;
                                 QInsertItensNF.ParamByName( 'ALIQ_COFINS' ).AsFloat := FrmVenda.QBuscaItensALIQUOTA_COFINS.AsFloat;
                                 QInsertItensNF.ParamByName( 'ALIQ_PIS' ).AsFloat := FrmVenda.QBuscaItensALIQUOTA_PIS.AsFloat;
                                 QInsertItensNF.ExecSQL;
                                 TRNota.Commit;
                               except
                                  on E: Exception do
                                     begin
                                         TRNota.Rollback;
                                         bAuxErro:= true;
                                         AlertaCad('erro ao gravar os itens da NF:' + sLineBreak + E.Message) ;
                                     end;
                               end;
                             finally
                               QInsertItensNF.Close;
                             end;
                             end
                             else
                                begin 
                                   // TXT
                                   TotalServicos := TotalServicos + (FrmVenda.QBuscaItensQUANT.AsCurrency + FrmVenda.QBuscaItensVALOR.AsCurrency);
                                   CriaTXT.Add( 'DESCRICAO : ' + FrmVenda.QBuscaItensNOME_PRO.AsString +
                                   '      QUANT : ' + FrmVenda.QBuscaItensQUANT.AsString + '     VALOR UNID.: ' +
                                   FrmVenda.QBuscaItensVALOR.AsString + '     TOTAL :' + FloatToStr(
                                   FrmVenda.QBuscaItensQUANT.AsCurrency * FrmVenda.QBuscaItensVALOR.AsCurrency )
                                    );
                                end;

                             next;
                          end;
                    end;

                 if not bAuxErro then
                    begin 
                       if CriaTXT.Count > 0 then
                          begin 
                             CriaTXT.Add( ' ' );
                             CriaTXT.Add( ' SubTotal : ' + FloatToStr( TotalServicos ) );
                             CriaTXT.SaveToFile( PastaTxt + 'SERVIÇOS_NF_' +
                             IntToStr( iNumeroNotaFiscal ) + '.txt'  );
                          end;
                       CriaTXT.Clear;
                       CriaTXT.Free;

                       { GRAVA NA VENDA O CÓDIGO/NUMERO DA NOTA FISCAL }
                       if dm.IBTransaction.Active then
                          dm.IBTransaction.Commit;
                       dm.IBTransaction.StartTransaction;
                       with dm.Consulta do
                          begin 
                             Close;
                             SQL.Clear;
                             sql.Add('UPDATE VENDAS SET COD_NF = :CODNF, SERIE_NOTA_FISCAL = :SERIE, ' +
                                     'CODIFICACAO_FISCAL = :CF, NUMERO_NOTA_FISCAL = :NUM ' +
                                     'WHERE COD_VEN = :CODVEN');
                             ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                             Parambyname('serie').AsString   := trim(sSerieNotaFiscal);
                             parambyname('cf').AsString      := trim(sCodificacaoFiscal);
                             parambyname('num').AsInteger    := iNumeroNotaFiscal;
                             ParamByName('codven').AsInteger := strtoint(FrmVenda.EdtCod.text);

                             ExecOrOpen;
                          end;
                       dm.IBTransaction.Commit;
                       dm.Consulta.close;

                       { GRAVA NA NF O CÓDIGO DA VENDA }
                       if dm.IBTransaction.Active then
                          dm.IBTransaction.Commit;
                       dm.IBTransaction.StartTransaction;
                       with dm.Consulta do
                          begin
                             Close;
                             SQL.Clear;
                             sql.Add('UPDATE NOTA_FISCAL SET COD_VENDA = :CODVEN ' +
                                     'WHERE COD_NF = :CODNF');
                             ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                             ParamByName('codven').AsInteger := strtoint(FrmVenda.EdtCod.text);

                             ExecOrOpen;
                          end;
                       dm.IBTransaction.Commit;
                       dm.Consulta.close;

                       { GRAVANDO NAS PARCELAS O NÚMERO DA NF }
                       if dm.IBTransaction.Active then
                          dm.IBTransaction.Commit;
                       dm.IBTransaction.StartTransaction;
                       with dm.Consulta do
                          begin 
                             Close;
                             SQL.Clear;
                             sql.Add('UPDATE CONTAS_RECEBER SET NUMDOCUMENTO_CTR = :DOC ' +
                                     'WHERE COD_VENDA = :CODVEN');
                             Parambyname('doc').AsString     := 'NF ' + inttostr(iNumeroNotaFiscal);
                             ParamByName('codven').AsInteger := strtoint(FrmVenda.EdtCod.text);

                             ExecOrOpen;
                          end;
                       dm.IBTransaction.Commit;
                       dm.Consulta.close;

                       { GRAVANDO NAS PARCELAS DO CARTAO O NÚMERO DA NF }
                       if dm.IBTransaction.Active then
                          dm.IBTransaction.Commit;
                       dm.IBTransaction.StartTransaction;
                       with dm.Consulta do
                          begin 
                             Close;
                             SQL.Clear;
                             sql.Add('UPDATE CONTAS_RECEBER_ADM_CARTAO SET DOCUMENTO = :DOC ' +
                                     'WHERE COD_VEN = :CODVEN');
                             Parambyname('doc').AsString     := 'NF ' + inttostr(iNumeroNotaFiscal);
                             ParamByName('codven').AsInteger := strtoint(FrmVenda.EdtCod.text);

                             ExecOrOpen;
                          end;
                       dm.IBTransaction.Commit;
                       dm.Consulta.close;

                       { calcula os itens da nota fiscal }
                       CalculaItensNotaFiscal;
                       GeraLivroSaidas;
                       GerarContas( iCodigoNotaFiscal, StrToInt( FrmVenda.EdtCodTPV.Text ) );

                       if trim(sCodificacaoFiscal) = '55' then
                          NotaFiscalEletronica( iCodigoNotaFiscal )
                       else
                         ImprimeNotaFiscal;
                    end
                    else
                       begin 
                          if iCodigoNotaFiscal > 0 then
                          begin
                              if dm.IBTransaction.Active then
                                 dm.IBTransaction.Commit;
                              DM.IBTransaction.StartTransaction;
                              dm.QConsulta.Close;
                              dm.QConsulta.SQL.Text := 'delete from nota_fiscal where cod_nf=:cod_nf and cod_emp=:cod_emp';
                              DM.QConsulta.ParamByName( 'cod_nf' ).AsInteger  := iCodigoNotaFiscal;
                              DM.QConsulta.ParamByName( 'cod_emp' ).AsInteger := iEmp;
                              dm.QConsulta.ExecOrOpen;
                              DM.QConsulta.Close;
                              dm.IBTransaction.Commit;
                              KDialog( 'Nota Fiscal não Gerada!' );
                          end;

                       end;
              end;
           1: begin  // OUTRAS SAIDAS
                 { gravando os itens da NF }
                 iOrdemItens:= 0;
                 with FrmOutrasSaidas.QBuscaItens do
                    begin
                       First;
                       while not eof do
                          begin
                             try
                               try
                                 if dm.IBTransaction.Active then
                                    dm.IBTransaction.Commit;
                                 dm.IBTransaction.StartTransaction;
                                 QInsertItensNF.Close;
                                 inc(iOrdemItens);

                                 QInsertItensNF.Parambyname('1').AsInteger    := iOrdemItens;
                                 QInsertItensNF.Parambyname('2').AsInteger    := iCodigoNotaFiscal;
                                 QInsertItensNF.Parambyname('3').AsInteger    := FrmOutrasSaidas.QBuscaItensCOD_PRO.AsInteger;
                                 QInsertItensNF.Parambyname('4').AsString     := FrmOutrasSaidas.QBuscaItensCST.AsString;
                                 QInsertItensNF.Parambyname('5').AsCurrency   := FrmOutrasSaidas.QBuscaItensQUANT_ITEM.AsCurrency;
                                 QInsertItensNF.Parambyname('6').AsCurrency   := FrmOutrasSaidas.QBuscaItensVALOR_ITEM.AsCurrency;
                                 QInsertItensNF.Parambyname('7').AsCurrency   := FrmOutrasSaidas.QBuscaItensALIQ_ICMS.AsCurrency;
                                 QInsertItensNF.Parambyname('8').AsInteger    := iEmp;
                                 QInsertItensNF.Parambyname('9').AsInteger    := FrmOutrasSaidas.QBuscaItensCOD_GRP.AsInteger;
                                 QInsertItensNF.Parambyname('10').AsCurrency  := FrmOutrasSaidas.QBuscaItensIPI.AsCurrency;
                                 QInsertItensNF.Parambyname('12').AsCurrency  := FrmOutrasSaidas.QBuscaItensREDUCAO_ICMS.AsCurrency;
                                 QInsertItensNF.Parambyname('13').AsInteger   := FrmOutrasSaidas.QBuscaItensCFOP.AsInteger;
                                 QInsertItensNF.Parambyname('14').AsString    := 'N';
                                 QInsertItensNF.Parambyname('15').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('16').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('18').AsString    := FrmOutrasSaidas.QBuscaItensDESCRICAO.AsString;
                                 QInsertItensNF.Parambyname('19').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('20').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('21').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('22').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('23').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('24').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('25').Value       := null;
                                 QInsertItensNF.ExecOrOpen;
                                 dm.IBTransaction.Commit;
                               except
                                 dm.IBTransaction.Rollback;
                                 bAuxErro:= true;
                                 AlertaCad('erro ao gravar os itens da NF');
                               end;
                             finally
                               QInsertItensNF.Close;
                             end;

                             next;
                          end;
                    end;

                 if not bAuxErro then
                    begin 
                       { GRAVA EM OUTRAS_SAIDAS O CÓDIGO/NUMERO DA NOTA FISCAL }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin 
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE OUTRAS_SAIDAS SET COD_NF = :CODNF, SERIE_NOTA_FISCAL = :SERIE, ' +
                                       'CODIFICACAO_FISCAL = :CF, NUMERO_NOTA_FISCAL = :NUM ' +
                                       'WHERE COD_OUTRA = :CODIGO');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               Parambyname('serie').AsString   := trim(sSerieNotaFiscal);
                               parambyname('cf').AsString      := trim(sCodificacaoFiscal);
                               parambyname('num').AsInteger    := iNumeroNotaFiscal;
                               ParamByName('codigo').AsInteger := strtoint(FrmOutrasSaidas.EdtCodigo.text);

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                         { GRAVA NA NF O CÓDIGO DA OUTRA SAIDA }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE NOTA_FISCAL SET CODIGO_OUTRA_SAIDA = :CODIGO ' +
                                       'WHERE COD_NF = :CODNF');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               ParamByName('codigo').AsInteger := strtoint(FrmOutrasSaidas.EdtCodigo.Text);

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                       { calcula os itens da nota fiscal }
                       CalculaItensNotaFiscal;
                       GeraLivroSaidas;
                       if trim(sCodificacaoFiscal) = '55' then
                          NotaFiscalEletronica(iNumeroNotaFiscal)
                       else
                         ImprimeNotaFiscal;
                    end;
              end;
           2: begin  // OUTRAS ENTRADAS
                 { gravando os itens da NF }
                 iOrdemItens:= 0;
                 with FrmOutrasEntradas.QBuscaItens do
                    begin 
                       First;
                       while not eof do
                          begin 
                             try
                               try
                                 if dm.IBTransaction.Active then
                                    dm.IBTransaction.Commit;
                                 dm.IBTransaction.StartTransaction;
                                 QInsertItensNF.Close;
                                 inc(iOrdemItens);

                                 QInsertItensNF.Parambyname('1').AsInteger    := iOrdemItens;
                                 QInsertItensNF.Parambyname('2').AsInteger    := iCodigoNotaFiscal;
                                 QInsertItensNF.Parambyname('3').AsInteger    := FrmOutrasEntradas.QBuscaItensCOD_PRO.AsInteger;
                                 QInsertItensNF.Parambyname('4').AsString     := FrmOutrasEntradas.QBuscaItensCST.AsString;
                                 QInsertItensNF.Parambyname('5').AsCurrency   := FrmOutrasEntradas.QBuscaItensQUANT_ITEM.AsCurrency;
                                 QInsertItensNF.Parambyname('6').AsCurrency   := FrmOutrasEntradas.QBuscaItensVALOR_ITEM.AsCurrency;
                                 QInsertItensNF.Parambyname('7').AsCurrency   := FrmOutrasEntradas.QBuscaItensALIQ_ICMS.AsCurrency;
                                 QInsertItensNF.Parambyname('8').AsInteger    := iEmp;
                                 QInsertItensNF.Parambyname('9').AsInteger    := FrmOutrasEntradas.QBuscaItensCOD_GRP.AsInteger;
                                 QInsertItensNF.Parambyname('10').AsCurrency  := FrmOutrasEntradas.QBuscaItensIPI.AsCurrency;
                                 QInsertItensNF.Parambyname('12').AsCurrency  := FrmOutrasEntradas.QBuscaItensREDUCAO_ICMS.AsCurrency;
                                 QInsertItensNF.Parambyname('13').AsInteger   := FrmOutrasEntradas.QBuscaItensCFOP.AsInteger;
                                 QInsertItensNF.Parambyname('14').AsString    := 'N';
                                 QInsertItensNF.Parambyname('15').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('16').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('18').AsString    := FrmOutrasEntradas.QBuscaItensDESCRICAO.AsString;
                                 QInsertItensNF.Parambyname('19').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('20').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('21').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('22').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('23').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('24').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('25').Value       := null;

                                 QInsertItensNF.ExecOrOpen;
                                 dm.IBTransaction.Commit;
                               except
                                 dm.IBTransaction.Rollback;
                                 bAuxErro:= true;
                                 AlertaCad('erro ao gravar os itens da NF');
                               end;
                             finally
                               QInsertItensNF.Close;
                             end;

                             next;
                          end;
                    end;

                 if not bAuxErro then
                    begin 
                       { GRAVA EM OUTRAS_ENTRADAS O CÓDIGO/NUMERO DA NOTA FISCAL }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin 
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE OUTRAS_ENTRADAS SET COD_NF = :CODNF, SERIE_NOTA_FISCAL = :SERIE, ' +
                                       'CODIFICACAO_FISCAL = :CF, NUMERO_NOTA_FISCAL = :NUM ' +
                                       'WHERE COD_OUTRA = :CODIGO');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               Parambyname('serie').AsString   := trim(sSerieNotaFiscal);
                               parambyname('cf').AsString      := trim(sCodificacaoFiscal);
                               parambyname('num').AsInteger    := iNumeroNotaFiscal;
                               ParamByName('codigo').AsInteger := strtoint(FrmOutrasEntradas.EdtCodigo.text);

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                         { GRAVA NA NF O CÓDIGO DA OUTRA ENTRADA }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin 
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE NOTA_FISCAL SET CODIGO_OUTRA_ENTRADA = :CODIGO ' +
                                       'WHERE COD_NF = :CODNF');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               ParamByName('codigo').AsInteger := strtoint(FrmOutrasEntradas.EdtCodigo.Text);

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                       { calcula os itens da nota fiscal }
                       CalculaItensNotaFiscal;
                       GeraLivroEntradas;

                       if trim(sCodificacaoFiscal) = '55' then
                          NotaFiscalEletronica(iNumeroNotaFiscal)
                       else
                         ImprimeNotaFiscal;
                    end;
              end;
           3: begin  // ORDEM DE SERVICO
                 { gravando os itens da NF }
                 iOrdemItens:= 0;
                 QBuscaItens.Close;
                 QBuscaItens.Params[0].AsInteger := IDOS;
                 QBuscaItens.Open;
                 QBuscaItens.First;
                 with QBuscaItens do
                    begin
                       First;
                       while not eof do
                          begin
                             try
                               try
                                 if dm.IBTransaction.Active then
                                    dm.IBTransaction.Commit;
                                 dm.IBTransaction.StartTransaction;
                                 QInsertItensNF.Close;
                                 inc(iOrdemItens);

                                 QInsertItensNF.Parambyname('1').AsInteger    := iOrdemItens;
                                 QInsertItensNF.Parambyname('2').AsInteger    := iCodigoNotaFiscal;
                                 QInsertItensNF.Parambyname('3').AsInteger    := QBuscaItensCOD_PRO.AsInteger;
                                 QInsertItensNF.Parambyname('4').AsString     := QBuscaItensCST.AsString;
                                 QInsertItensNF.Parambyname('5').AsCurrency   := QBuscaItensQUANT_ITEM.AsCurrency;
                                 QInsertItensNF.Parambyname('6').AsCurrency   := QBuscaItensVALOR_CUSTO.AsCurrency;
                                 QInsertItensNF.Parambyname('7').AsCurrency   := 0;
                                 QInsertItensNF.Parambyname('8').AsInteger    := iEmp;
                                 QInsertItensNF.Parambyname('9').AsInteger    := 1;
                                 QInsertItensNF.Parambyname('10').AsCurrency  := QBuscaItensIPI.AsCurrency;
                                 QInsertItensNF.Parambyname('12').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('13').AsInteger   := 5102;
                                 QInsertItensNF.Parambyname('14').AsString    := 'N';
                                 QInsertItensNF.Parambyname('15').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('16').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('18').AsString    := QBuscaItensDESCRICAO.AsString;
                                 QInsertItensNF.Parambyname('19').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('20').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('21').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('22').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('23').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('24').AsCurrency  := 0;
                                 QInsertItensNF.Parambyname('25').Value       := null;
                                 QInsertItensNF.ExecOrOpen;
                                 dm.IBTransaction.Commit;
                               except
                                 dm.IBTransaction.Rollback;
                                 bAuxErro:= true;
                                 AlertaCad('erro ao gravar os itens da NF');
                               end;
                             finally
                               QInsertItensNF.Close;
                             end;

                             next;
                          end;
                    end;

                 if not bAuxErro then
                    begin
                       { GRAVA EM OUTRAS_SAIDAS O CÓDIGO/NUMERO DA NOTA FISCAL }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE OS SET NOTA_FISCAL = :CODNF ' +
                                       'WHERE ID_OS = :CODIGO');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               ParamByName('codigo').AsInteger := IDOS;

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                         { GRAVA NA NF O CÓDIGO DA OUTRA SAIDA }
                         if dm.IBTransaction.Active then
                            dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         with dm.Consulta do
                            begin
                               Close;
                               SQL.Clear;
                               sql.Add('UPDATE NOTA_FISCAL SET COD_OS = :CODIGO ' +
                                       'WHERE COD_NF = :CODNF');
                               ParamByName('codnf').AsInteger  := iCodigoNotaFiscal;
                               ParamByName('codigo').AsInteger := IDOS;

                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                         dm.Consulta.close;

                       { calcula os itens da nota fiscal }
                       CalculaItensNotaFiscal;
                       GeraLivroSaidas;
                       if trim(sCodificacaoFiscal) = '55' then
                          NotaFiscalEletronica(iNumeroNotaFiscal)
                       else
                         ImprimeNotaFiscal;
                    end;
              end;
         end;
      end;
end;

procedure TFrmDadosNotaFiscal.CalculaItensNotaFiscal;
var cAuxiTotal        : currency;
    cAuxiTotalProd    : currency;
    cAuxiTotalProdSemDesconto: currency;
    cAuxiBaseICMS     : currency;
    cAuxiValorICMS    : currency;
    cAuxiBaseSubTrib  : currency;
    cAuxiValorSubTrib : currency;
    cAuxiValorIPI     : currency;
    cAuxiDesconto     : currency;
    cAuxiTxDesconto   : currency;
    cAuxiAliquotaICMS : currency;

    cDesconto         : currency;

    cTotal            : currency;
    cTotalProdutos    : currency;
    cTotalBaseICMS    : currency;
    cTotalIcms        : currency;
    cTotalBaseSub     : currency;
    cTotalICMSSub     : currency;
    cTotalIPI         : currency;
    cAuxiValorPIS: currency;
    cAuxiBasePIS: currency;
    cAuxiValorCOFINS: currency;
    cAuxiBaseCOFINS: currency;
    cTotalPis: Currency;
    cTotalCOFINS: Currency;
    cTotalDescontos: Currency;
    cCalcDescontoItens: Currency;
    sUFCliFor: String;

begin 
   cAuxiTxDesconto := 0;
   cAuxiTotal      := 0;
   cDesconto       := 0;

   cTotal          := 0;
   cTotalProdutos  := 0;
   cTotalBaseICMS  := 0;
   cTotalIcms      := 0;
   cTotalBaseSub   := 0;
   cTotalICMSSub   := 0;
   cTotalIPI       := 0;
   cTotalPis       := 0;
   cTotalCOFINS    := 0;
   cCalcDescontoItens := 0;
   case FrmDadosNotaFiscal.Tag of
     0: cTotalDescontos:= strtocurr(FrmFechaVenda.EdtValorDesconto.Text);   //vendas
     1: cTotalDescontos:= 0;                                                //outras saidas
     2: cTotalDescontos:= 0;
   end;


   case FrmDadosNotaFiscal.Tag of
     0: cDesconto:= strtocurr(FrmFechaVenda.EdtValorDesconto.Text);   //vendas
     1: cDesconto:= 0;                                                //outras saidas
     2: cDesconto:= 0;
   end;

   case FrmDadosNotaFiscal.Tag of
     0: sUFCliFor:= dm.RetornaStringTabela('estres_cli', 'cliente',    'cod_cli', strtoint(FrmVenda.EdtCodcli.Text));
     1: sUFCliFor:= dm.RetornaStringTabela('estres_cli', 'cliente',    'cod_cli', strtoint(FrmOutrasSaidas.EdtCodcli.Text));
     2: sUFCliFor:= dm.RetornaStringTabela('est_for',    'fornecedor', 'cod_for', strtoint(FrmOutrasEntradas.EdtCodFor.Text));
   end;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;

   QBuscaItensNF.Close;
   QBuscaItensNF.ParamByName('codnf').AsInteger:= iCodigoNotaFiscal;
   QBuscaItensNF.ParamByName('uf').AsString := sUFCliFor;
   QBuscaItensNF.Open;
   QBuscaItensNF.First;
   while not QBuscaItensNF.Eof do
      begin
         cTotalDescontos := cTotalDescontos + QBuscaItensNFDESCONTO.AsCurrency;
         QBuscaItensNF.Next;
      end;
   cCalcDescontoItens := cTotalDescontos / QBuscaItensNF.RecordCount;
   {busca a taxa do desconto}
{   if cDesconto > 0 then
      begin
         QBuscaItensNF.First;
         while not QBuscaItensNF.Eof do
            begin
               cAuxiTotal:= cAuxiTotal + (QBuscaItensNFQUANT.AsCurrency * QBuscaItensNFUNIT.AsCurrency);
               QBuscaItensNF.Next;
            end;
         cAuxiTxDesconto:= ((cDesconto * 100) / cAuxiTotal);
      end
   else
      cAuxiTxDesconto:= 0;}

   with QBuscaItensNF do
      begin 
         First;
         while not eof do
            begin 
               cAuxiTotal        := 0;
               cAuxiTotalProd    := 0;
               cAuxiTotalProdSemDesconto:= 0;
               cAuxiBaseICMS     := 0;
               cAuxiValorICMS    := 0;
               cAuxiBaseSubTrib  := 0;
               cAuxiValorSubTrib := 0;
               cAuxiValorIPI     := 0;
               cAuxiDesconto     := 0;
               cAuxiValorPIS     := 0;
               cAuxiBasePIS      := 0;
               cAuxiValorCOFINS  := 0;
               cAuxiBaseCOFINS   := 0;
               cAuxiAliquotaICMS := QBuscaItensNFALIQ.AsCurrency;

               { calcula o Total dos produtos }
               cAuxiTotalProd           := QBuscaItensNFQUANT.AsCurrency * QBuscaItensNFUNIT.AsCurrency;
               cAuxiTotalProdSemDesconto:= QBuscaItensNFQUANT.AsCurrency * QBuscaItensNFUNIT.AsCurrency;

               { calcula o Desconto }
               if cCalcDescontoItens > 0 then
                  begin
//                     cAuxiDesconto:= (cAuxiTotalProd * cAuxiTxDesconto) / 100;
                     cAuxiTotalProd:= cAuxiTotalProd - cCalcDescontoItens;
                  end;

               { calcula a base e o valor do icms }
               if trim(DM.RetornaStringTabela('destaca_icms', 'cfop', 'cod_cfo', QBuscaItensNFCOD_CFO.AsInteger)) = 'S' then
                  begin 
                     if QBuscaItensNFALIQ.AsCurrency > 0 then
                        begin 
                           if QBuscaItensNFREDUCAO_ICMS.AsCurrency > 0 then
                              begin 
                                 cAuxiValorICMS:= ((cAuxiTotalProd * QBuscaItensNFREDUCAO_ICMS.AsCurrency) / 100);
                                 cAuxiBaseICMS := ((cAuxiValorICMS / QBuscaItensNFALIQ.AsCurrency) * 100);
                              end
                           else
                              begin 
                                 cAuxiBaseICMS := cAuxiTotalProd;
                                 cAuxiValorICMS:= ((cAuxiTotalProd * QBuscaItensNFALIQ.AsCurrency) / 100);
                              end;
                        end;
                  end
               else
                  begin 
                     cAuxiBaseICMS    := 0;
                     cAuxiValorICMS   := 0;
                     cAuxiAliquotaICMS:= 0;
                  end;

               { calcula a base e o valor da sub.tributaria }
               if trim(QBuscaItensNFSUB_TRIBUTARIA.AsString) = 'S' then
                  begin 
                     if QBuscaItensNFALIQUOTA_FORA_ESTADO.AsCurrency > 0 then
                        begin 
                           cAuxiBaseSubTrib  := cAuxiBaseICMS + ((cAuxiBaseICMS * QBuscaItensNFVR_AGREGADO.AsCurrency) / 100);
                           cAuxiValorSubTrib := ((cAuxiBaseSubTrib * QBuscaItensNFALIQUOTA_FORA_ESTADO.AsCurrency) / 100) - cAuxiValorICMS;
                        end
                     else
                        begin 
                           cAuxiBaseSubTrib  := cAuxiBaseICMS + ((cAuxiBaseICMS * QBuscaItensNFVR_AGREGADO.AsCurrency) / 100);
                           cAuxiValorSubTrib := ((cAuxiBaseSubTrib * QBuscaItensNFALIQ.AsCurrency) / 100) - cAuxiValorICMS;
                        end;
                  end;

               { calcula o valor do ipi }
               if QBuscaItensNFALIQ_IPI.AsCurrency > 0 then
                  cAuxiValorIPI:= ((cAuxiTotalProd * QBuscaItensNFALIQ_IPI.AsCurrency) / 100);

                if QBuscaItensNFISENTO_PIS_COFINS_PRO.AsString <> 'S' then
                if QBuscaItensNFALIQ_PIS.AsCurrency > 0 then
                begin
                  cAuxiBasePIS := cAuxiTotalProd;
                  cAuxiBaseCOFINS := cAuxiTotalProd;
                  cAuxiValorPIS := (cAuxiTotalProd * QBuscaItensNFALIQ_PIS.AsCurrency) / 100;
                  cAuxiValorCOFINS := (cAuxiTotalProd * QBuscaItensNFALIQ_COFINS.AsCurrency)
                    / 100;
                end;

               { calcula o total geral do produto }
               cAuxiTotal:= (cAuxiTotalProd + cAuxiValorIPI + cAuxiValorSubTrib);

               { gravando os dados nos itens da nota fiscal }
               try
                 try
                   if dm.IBTransaction.Active then
                      dm.IBTransaction.Commit;
                   dm.IBTransaction.StartTransaction;

                   dm.QConsulta.Close;
                   dm.QConsulta.SQL.Clear;
                   dm.QConsulta.SQL.Text:= 'UPDATE ITENS_NOTA_FISCAL SET ' +
                                           'VALOR_TOTAL   = :1,  ' +
                                           'BASE_CALCULO  = :2,  ' +
                                           'VALOR_ICMS    = :3,  ' +
                                           'BASE_SUBTRIB  = :4,  ' +
                                           'VALOR_SUBTRIB = :5,  ' +
                                           'VALOR_IPI     = :6,  ' +
                                           'ISENTAS       = :7,  ' +
                                           'OUTRAS        = :8,  ' +
                                           'ALIQ          = :9,   ' +
                                           'DESCONTO      = :DESCONTO, ' +
                                           'BC_PIS = :BC_PIS, VALOR_PIS=:VALOR_PIS,' +
                                           'BC_COFINS = :BC_COFINS, VALOR_COFINS=:VALOR_COFINS ' +
                                           'WHERE ORDEM   = :10 AND COD_NF = :11';

                   dm.QConsulta.Parambyname('1').AsCurrency:= RoundTo( cAuxiTotal, -2 );
                   dm.QConsulta.Parambyname('2').AsCurrency:= RoundTo( cAuxiBaseICMS, -2 );
                   dm.QConsulta.Parambyname('3').AsCurrency:= RoundTo( cAuxiValorICMS, -2 );
                   dm.QConsulta.Parambyname('4').AsCurrency:= RoundTo( cAuxiBaseSubTrib, -2 );
                   dm.QConsulta.Parambyname('5').AsCurrency:= RoundTo( cAuxiValorSubTrib, -2 );
                   dm.QConsulta.Parambyname('6').AsCurrency:= RoundTo( cAuxiValorIPI, -2 );
                   DM.QConsulta.ParamByName('DESCONTO').AsCurrency := RoundTo( cCalcDescontoItens, -2 );

                    dm.QConsulta.Parambyname('BC_PIS').AsCurrency := RoundTo( cAuxiBasePIS, -2 );
                    dm.QConsulta.Parambyname('VALOR_PIS').AsCurrency := RoundTo( cAuxiValorPIS, -2 );
                    dm.QConsulta.Parambyname('BC_COFINS').AsCurrency := RoundTo( cAuxiBaseCOFINS, -2 );
                    dm.QConsulta.Parambyname('VALOR_COFINS').AsCurrency := RoundTo( cAuxiValorCOFINS, -2 );

                   if trim(QBuscaItensNFTIPO_GRP.AsString) = 'ISE' then
                      dm.QConsulta.ParamByName('7').AsCurrency:= RoundTo( cAuxiTotal, -2 )
                   else
                      dm.QConsulta.ParamByName('7').AsCurrency:= 0;

                   if (trim(QBuscaItensNFTIPO_GRP.AsString) = 'ST') or
                      (trim(QBuscaItensNFTIPO_GRP.AsString) = 'NT') or
                      (trim(QBuscaItensNFTIPO_GRP.AsString) = 'SN') or
                      (trim(QBuscaItensNFTIPO_GRP.AsString) = 'OUT') then
                      dm.QConsulta.ParamByName('8').AsCurrency:= RoundTo( cAuxiTotal, -2 )
                   else
                      dm.QConsulta.ParamByName('8').AsCurrency:= 0;
                   dm.QConsulta.Parambyname('9').AsCurrency:= RoundTo( cAuxiAliquotaICMS, -2 );

                   dm.QConsulta.Parambyname('10').AsInteger := QBuscaItensNFORDEM.AsInteger;
                   dm.QConsulta.Parambyname('11').AsInteger := QBuscaItensNFCOD_NF.AsInteger;
                   dm.QConsulta.ExecOrOpen;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   AlertaCad('Erro ao atualizar os itens da nota fiscal');
                 end;
               finally
                  dm.QConsulta.Close;
               end;

               { soma os valores para atualizar a tabela nota_fiscal }
               cTotal         := RoundTo( cTotal, -2 )         + RoundTo( cAuxiTotal, -2 );
               cTotalProdutos := RoundTo( cTotalProdutos, -2 ) + RoundTo( cAuxiTotalProdSemDesconto, -2 );
               cTotalBaseICMS := RoundTo( cTotalBaseICMS, -2 ) + RoundTo( cAuxiBaseICMS, -2 );
               cTotalIcms     := RoundTo( cTotalIcms, -2 )     + RoundTo( cAuxiValorICMS, -2 );
               cTotalBaseSub  := RoundTo( cTotalBaseSub, -2 )  + RoundTo( cAuxiBaseSubTrib, -2 );
               cTotalICMSSub  := RoundTo( cTotalICMSSub, -2 )  + RoundTo( cAuxiValorSubTrib, -2 );
               cTotalIPI      := RoundTo( cTotalIPI, -2 )      + RoundTo( cAuxiValorIPI, -2 );
               cTotalPis      := RoundTo( cTotalPis, -2 )      + RoundTo( cAuxiValorPIS, -2 );
               cTotalCOFINS   := RoundTo( cTotalCOFINS, -2 )   + RoundTo( cAuxiValorCOFINS, -2 );

               next;
            end;
      end;
   dm.IBTRAux.Commit;
   QBuscaItensNF.Close;

   { atualizando os totais da nota fiscal }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'UPDATE NOTA_FISCAL SET BASE_CALCULO_ICMS_NF = :2, VALOR_ICMS_NF = :3, ' +
                        'BASE_SUBST_NF =  :4,  VALOR_SUBST_NF =  :5, VALOR_TOTAL_PROD_NF = :6, ' +
                        'VALOR_FRETE_NF = :7,  VALOR_SEGURO_NF = :8, OUTRAS_DESPESAS_NF =  :9, ' +
                        'VALOR_IPI_NF =   :10, VALOR_TOTAL_NF =  :11, VALOR_PIS=:VALOR_PIS, VALOR_COFINS=:VALOR_COFINS, DESCONTO_NF=:DESCONTO_NF ' +
                        'WHERE COD_NF =   :1';

            Parambyname('2').AsCurrency   := RoundTo( cTotalBaseICMS, -2 );
            Parambyname('3').AsCurrency   := RoundTo( cTotalIcms, -2 );
            Parambyname('4').AsCurrency   := RoundTo( cTotalBaseSub, -2 );
            Parambyname('5').AsCurrency   := RoundTo( cTotalICMSSub, -2 );
            Parambyname('6').AsCurrency   := RoundTo( cTotalProdutos, -2 );
            ParamByName('VALOR_COFINS').AsCurrency := RoundTo( cTotalCOFINS, -2 );
            ParamByName('VALOR_PIS').AsCurrency := RoundTo( cTotalPis, -2 );
            Parambyname('7').AsCurrency   := 0;
            Parambyname('8').AsCurrency   := 0;
            Parambyname('9').AsCurrency   := 0;
            ParamByName('DESCONTO_NF').AsCurrency := RoundTo( cTotalDescontos, -2 );
            Parambyname('10').AsCurrency  := RoundTo( cTotalIPI, -2 );
            Parambyname('11').AsCurrency  := RoundTo( cTotal + cTotalIPI + cTotalICMSSub, -2 );
            Parambyname('1').AsInteger    := iCodigoNotaFiscal;
            ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao atualizar os totais da Nota Fiscal');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmDadosNotaFiscal.FormShow(Sender: TObject);
begin 
   EdtDataSaida.Date   := date;
   EdtHoraSaida.Time   := time;
   sCodificacaoFiscal  := '';
   sSerieNotaFiscal    := '';
   edtdatasaida.SetFocus;
   if Venda then
     begin
       if bNoEstado then
          MemoObs.Text := trim(DM.RetornaStringTabela('INF_COMPL_NF', 'cfop', 'cod_cfo', FrmVenda.QBuscaItensCFOP_VENDAS_CF_EST.AsInteger ))
       else
          MemoObs.Text := trim(DM.RetornaStringTabela('INF_COMPL_NF', 'cfop', 'cod_cfo', FrmVenda.QBuscaItensCFOP_VENDAS_CF_FORA.AsInteger ));
     end;
   EdtCodTransp.Text := '1';
   EdtCodTranspExit(nil);
end;

procedure TFrmDadosNotaFiscal.GeraLivroSaidas;
var sAuxCNPJ, sAuxInsc, sAuxUF : string;
    iAux           : integer;
    iCodRegistro   : integer;
begin 
   Exit;
   iCodRegistro    := 0;
   sAuxCNPJ        := '';
   sAuxInsc        := '';
   sAuxUF          := '';

   {busca os dados do cliente}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT CNPJ_CLI, DOC_CLI, ESTRES_CLI, FJ_CLI ' +
                     'FROM CLIENTE ' +
                     'WHERE COD_CLI = :COD');
             case FrmDadosNotaFiscal.Tag of
               0: Parambyname('cod').AsInteger:= strtoint(FrmVenda.EdtCodcli.Text);        //vendas
               1: Parambyname('cod').AsInteger:= strtoint(FrmOutrasSaidas.EdtCodcli.Text); //outras saidas
             end;
             open;

             sAuxCNPJ:= RetiraCaracter(fieldbyname('cnpj_cli').AsString);
             if (fieldbyname('doc_cli').AsString = '') or (fieldbyname('fj_cli').AsString = 'F') then
                sAuxInsc:= 'ISENTO'
             else
                sAuxInsc:= RetiraCaracter(fieldbyname('doc_cli').AsString);
            sAuxUF:= fieldbyname('estres_cli').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do cliente/fornecedor para gerar o livro');
     end;
   finally
     dm.QConsulta.Close;
   end;

   {gravando na tabela registro_livro_saidas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsRegistroSaida do
          begin 
             close;
             Params[0].AsDate       := strtodate(EdtDataEmissao.Text);
             Params[1].AsString     := trim(sAuxCNPJ);
             Params[2].AsString     := trim(sCodificacaoFiscal);
             if trim(sSerieNotaFiscal) = '' then
                Params[3].Value     := null
             else
                Params[3].AsString  := trim(sSerieNotaFiscal);
             Params[4].AsInteger    := iNumeroNotaFiscal;
             Params[5].AsString     := 'P';
             case FrmDadosNotaFiscal.Tag of
               0: Params[6].AsCurrency   := strtocurr(FrmFechaVenda.EdtTotalLiquido.Text);
               1: Params[6].AsCurrency   := strtocurr(FrmOutrasSaidas.EdtTotal.Text);
             end;
             Params[7].AsString     := 'N';
             Params[8].AsInteger    := iEmp;
             Params[9].AsInteger    := iCodigoNotaFiscal;
             Params[10].AsString    := trim(sAuxUF);
             Params[11].AsString    := trim(sAuxInsc);
             Params[12].AsInteger   := iNumeroNotaFiscal;
             Params[13].Value       := null;
             Open;
             iCodRegistro:= QInsRegistroSaidaCODREG.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar na tabela registro_livro_saídas');
     end;
   finally
     QInsRegistroSaida.Close;
   end;

   {gravando na tabela itens_registro_livro_saidas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QItensRegistro do
      begin 
         iAux:= 0;
         close;
         Parambyname('codnf').AsInteger:= iCodigoNotaFiscal;
         open;
         First;
         while not eof do
            begin 
               inc(iAux);
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               DM.IBTRAux.StartTransaction;
               QInsItensRegistroSaida.Close;
               QInsItensRegistroSaida.ParamByName('1').AsInteger  := iCodRegistro;
               QInsItensRegistroSaida.ParamByName('2').AsInteger  := iAux;
               QInsItensRegistroSaida.ParamByName('3').AsInteger  := QItensRegistroCOD_CFO.AsInteger;

               if iTipoEmp = 1 then
                  begin 
                     QInsItensRegistroSaida.ParamByName('4').AsCurrency := QItensRegistroBASECALCULO.AsCurrency;
                     QInsItensRegistroSaida.ParamByName('5').AsCurrency := QItensRegistroVALORICMS.AsCurrency;
                     QInsItensRegistroSaida.ParamByName('8').AsCurrency := QItensRegistroALIQ.AsCurrency;
                  end
               else
                  begin 
                     QInsItensRegistroSaida.ParamByName('4').AsCurrency := QItensRegistroVALORTOTAL.AsCurrency - QItensRegistroISENTAS.AsCurrency - QItensRegistroOUTRAS.AsCurrency;
                     QInsItensRegistroSaida.ParamByName('5').AsCurrency := 0;
                     QInsItensRegistroSaida.ParamByName('8').AsCurrency := 0;
                  end;

               QInsItensRegistroSaida.ParamByName('6').AsCurrency := QItensRegistroISENTAS.AsCurrency;
               QInsItensRegistroSaida.ParamByName('7').AsCurrency := QItensRegistroOUTRAS.AsCurrency;

               QInsItensRegistroSaida.ParamByName('9').AsInteger  := iEmp;

               QInsItensRegistroSaida.ParamByName('10').AsCurrency := QItensRegistroVALORTOTAL.AsCurrency;
               QInsItensRegistroSaida.ParamByName('11').AsCurrency := 0;
               QInsItensRegistroSaida.ParamByName('12').AsCurrency := 0;

               QInsItensRegistroSaida.ExecOrOpen;
               dm.IBTRAux.Commit;
               QInsItensRegistroSaida.Close;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QItensRegistro.Close;

   BuscaRegistroSaida(iCodRegistro);
end;

procedure TFrmDadosNotaFiscal.GeraLivroEntradas;
var sAuxCNPJ, sAuxInsc, sAuxUF : string;
    iAux           : integer;
    iCodRegistro   : integer;
begin 
      Exit;
   iCodRegistro    := 0;
   sAuxCNPJ        := '';
   sAuxInsc        := '';
   sAuxUF          := '';

   {busca os dados do fornecedor}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT CNPJ_FOR, INSC_FOR, EST_FOR ' +
                     'FROM FORNECEDOR ' +
                     'WHERE COD_FOR = :COD');
             Parambyname('cod').AsInteger:= strtoint(FrmOutrasEntradas.EdtCodFor.Text);
             open;
             sAuxCNPJ:= RetiraCaracter(fieldbyname('cnpj_for').AsString);
             if fieldbyname('insc_for').AsString = '' then
                sAuxInsc:= 'ISENTO'
             else
                sAuxInsc:= RetiraCaracter(fieldbyname('insc_for').AsString);
             sAuxUF:= fieldbyname('est_for').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do fornecedor para gerar o livro de registro de entrada');
     end;
   finally
     dm.QConsulta.Close;
   end;

   {gravando na tabela registro_livro_entradas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsRegistroEntrada do
          begin 
             close;
             Params[0].AsDate       := StrToDate(EdtDataEmissao.Text);
             Params[1].AsInteger    := strtoint(FrmOutrasEntradas.EdtCodFor.Text);
             Params[2].AsString     := trim(sAuxCNPJ);
             Params[3].AsString     := trim(sCodificacaoFiscal);
             if trim(sSerieNotaFiscal) = '' then
                Params[4].Value     := null
             else
                Params[4].AsString  := trim(sSerieNotaFiscal);
             Params[5].AsInteger    := iNumeroNotaFiscal;
             Params[6].AsString     := 'P';
             Params[7].AsCurrency   := strtocurr(FrmOutrasEntradas.EdtTotal.Text);
             Params[8].AsString     := 'N';
             Params[9].AsInteger    := iEmp;
             Params[10].value       := null;
             Params[11].AsString    := trim(sAuxUF);
             Params[12].AsString    := trim(sAuxInsc);
             Params[13].value       := null;
             Params[14].Value       := null;
             Params[15].AsInteger   := iCodigoNotaFiscal;
             Open;
             iCodRegistro := QInsRegistroEntradaCODREG.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar na tabela registro_livro_entradas');
     end;
   finally
     QInsRegistroEntrada.Close;
   end;

   {gravando na tabela itens_registro_livro_entradas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QItensRegistro do
      begin 
         iAux:= 0;
         close;
         Parambyname('codnf').AsInteger:= iCodigoNotaFiscal;
         open;
         First;
         while not eof do
            begin 
               inc(iAux);
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               DM.IBTRAux.StartTransaction;
               QInsItensRegistroEntrada.Close;
               QInsItensRegistroEntrada.ParamByName('1').AsInteger   := iCodRegistro;
               QInsItensRegistroEntrada.ParamByName('2').AsInteger   := iAux;
               QInsItensRegistroEntrada.ParamByName('3').AsInteger   := QItensRegistroCOD_CFO.AsInteger;
               QInsItensRegistroEntrada.ParamByName('4').AsCurrency  := QItensRegistroBASECALCULO.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('5').AsCurrency  := QItensRegistroVALORICMS.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('6').AsCurrency  := QItensRegistroISENTAS.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('7').AsCurrency  := QItensRegistroOUTRAS.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('8').AsCurrency  := QItensRegistroALIQ.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('9').AsInteger   := iEmp;
               QInsItensRegistroEntrada.ParamByName('10').AsCurrency := QItensRegistroVALORTOTAL.AsCurrency;
               QInsItensRegistroEntrada.ParamByName('11').AsCurrency := 0;
               QInsItensRegistroEntrada.ParamByName('12').AsCurrency := 0;

               QInsItensRegistroEntrada.ExecOrOpen;
               dm.IBTRAux.Commit;
               QInsItensRegistroEntrada.Close;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QItensRegistro.Close;
   BuscaRegistroEntrada(iCodRegistro);
end;

procedure TFrmDadosNotaFiscal.BuscaRegistroSaida(const iCodigoRegistro : integer);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaRegistroSaida do
      begin 
         close;
         Parambyname('cod').AsInteger:= iCodigoRegistro;
         open;
         Application.CreateForm(TFrmRegSaidas, FrmRegSaidas);
         FrmRegSaidas.tag                := 1;
         FrmRegSaidas.EdtCod.Text        := QBuscaRegistroSaidaCODIGO.AsString;
         FrmRegSaidas.EdtData.Text       := QBuscaRegistroSaidaDATA.AsString;
         FrmRegSaidas.EdtNFInicial.Text  := QBuscaRegistroSaidaNUMERO_NOTA.AsString;
         FrmRegSaidas.EdtCodModelo.Text  := QBuscaRegistroSaidaCODIFICACAO_FISCAL.AsString;
         FrmRegSaidas.EdtNomeModelo.Text := QBuscaRegistroSaidaDESCRICAO.AsString;
         FrmRegSaidas.EdtSerie.Text      := QBuscaRegistroSaidaSERIE_NOTA.AsString;
         FrmRegSaidas.EdtCNPJ.Text       := QBuscaRegistroSaidaCNPJ.AsString;
         case FrmDadosNotaFiscal.Tag of
           0: FrmRegSaidas.EdtNome.Text  := FrmVenda.EdtNomecli.Text;
           1: FrmRegSaidas.EdtNome.Text  := FrmOutrasSaidas.EdtNomecli.Text;
         end;
         FrmRegSaidas.EdtInscricao.Text  := QBuscaRegistroSaidaINSCRICAO.AsString;
         FrmRegSaidas.EdtUF.Text         := QBuscaRegistroSaidaUF.AsString;
         FrmRegSaidas.EdtTotalNF.Text    := QBuscaRegistroSaidaVALOR_TOTAL.AsString;
         if QBuscaRegistroSaidaEMITENTE.AsString = 'P' then
            FrmRegSaidas.ComboEmitente.ItemIndex:= 0
         else
            FrmRegSaidas.ComboEmitente.ItemIndex:= 1;
         if QBuscaRegistroSaidaSITUACAO.AsString = 'N' then
            FrmRegSaidas.ComboSituacao.ItemIndex:= 0
         else
            FrmRegSaidas.ComboSituacao.ItemIndex:= 1;
      end;
   dm.IBTransaction.Commit;
   QBuscaRegistroSaida.Close;

   FrmRegSaidas.BuscaItens;
   FrmRegSaidas.ShowModal;
end;

procedure TFrmDadosNotaFiscal.BuscaRegistroEntrada(const iCodigoRegistro : integer);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaRegistroEntrada do
      begin 
         close;
         Parambyname('cod').AsInteger:= iCodigoRegistro;
         open;
         Application.CreateForm(TFrmRegEntradas, FrmRegEntradas);
         FrmRegEntradas.tag                := 1;
         FrmRegEntradas.EdtCod.Text        := QBuscaRegistroEntradaCODIGO.AsString;
         FrmRegEntradas.EdtData.Text       := QBuscaRegistroEntradaDATA.AsString;
         FrmRegEntradas.EdtNumNF.Text      := QBuscaRegistroEntradaNUMERO_NOTA.AsString;
         FrmRegEntradas.EdtCodModelo.Text  := QBuscaRegistroEntradaCODIFICACAO_FISCAL.AsString;
         FrmRegEntradas.EdtNomeModelo.Text := QBuscaRegistroEntradaDESCRICAO.AsString;
         FrmRegEntradas.EdtSerie.Text      := QBuscaRegistroEntradaSERIE_NOTA.AsString;
         FrmRegEntradas.EdtCNPJ.Text       := QBuscaRegistroEntradaCNPJ.AsString;
         FrmRegEntradas.EdtCodFor.Text     := QBuscaRegistroEntradaCOD_FOR.AsString;
         FrmRegEntradas.EdtNomeFor.Text    := FrmOutrasEntradas.EdtNomeFor.Text;
         FrmRegEntradas.EdtInscricao.Text  := QBuscaRegistroEntradaINSCRICAO.AsString;
         FrmRegEntradas.EdtUF.Text         := QBuscaRegistroEntradaUF.AsString;
         FrmRegEntradas.EdtTotalNF.Text    := QBuscaRegistroEntradaVALOR_TOTAL.AsString;
         if QBuscaRegistroEntradaEMITENTE.AsString = 'P' then
            FrmRegEntradas.ComboEmitente.ItemIndex:= 0
         else
            FrmRegEntradas.ComboEmitente.ItemIndex:= 1;
         if QBuscaRegistroEntradaSITUACAO.AsString = 'N' then
            FrmRegEntradas.ComboSituacao.ItemIndex:= 0
         else
            FrmRegEntradas.ComboSituacao.ItemIndex:= 1;
      end;
   dm.IBTransaction.Commit;
   QBuscaRegistroEntrada.Close;

   FrmRegEntradas.BuscaItens;
   FrmRegEntradas.ShowModal;
end;

procedure TFrmDadosNotaFiscal.ImprimeNotaFiscal;
begin 
   if Application.MessageBox(pchar('Confirma a Impressão da Nota Fiscal n. ' + inttostr(iNumeroNotaFiscal)), 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      UimprimeNotaFiscal.ImprimeNotaFiscal(icodigoNotaFiscal);

   FrmDadosNotaFiscal.Close;
   case FrmDadosNotaFiscal.Tag of
     0: begin  //vendas
           FrmFechaVenda.Close;
           FrmVenda.BtnNovoClick(self);
        end;
     1: begin  //outras saidas
           FrmOutrasSaidas.BtnNovoClick(self);
        end;
     2: begin  //outras entradas
           FrmOutrasEntradas.BtnNovoClick(self);
        end;
   end;
end;

procedure TFrmDadosNotaFiscal.QBuscaItensNFCalcFields(DataSet: TDataSet);
begin 
   QBuscaItensNFCALC_TOTAL.AsCurrency:= QBuscaItensNFQUANT.AsCurrency * QBuscaItensNFUNIT.AsCurrency;
end;

procedure TFrmDadosNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;

   Action:= caFree;
end;

procedure TFrmDadosNotaFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

End.
