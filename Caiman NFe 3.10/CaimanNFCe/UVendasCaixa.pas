unit UVendasCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, Mask, rxToolEdit, rxCurrEdit, StdCtrls, Grids, 
  DB, Menus, acPNG, sLabel, OleCtrls, SHDocVw, ActiveX, DBClient, ACBrDevice, 
  UDialog, ShellAPI, Contnrs, UGrupoTeclas, jpeg, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, dxGDIPlusClasses;

const
   MOSTRA_CONEC = 0202;
   MOSTRA_DESCO = 1988;
   ScreenWidth: LongInt = 1024;


type
    { ALTERAÇÃO IMPORTACAO TXT }
    TFormasC = class
         public
              Forma: String;
              Valor: Currency;
              Tipo: STring;
    end;

    TListaFormas = class(TObjectList)
      protected
            procedure SetObject(Index: Integer; Item: TFormasC);
            function GetObject(Index: Integer): TFormasC;
            procedure Insert(Index: Integer; Obj: TFormasC);

      public
            function BuscaValor( Tipo: String ): Currency;
            function Add(Obj: TFormasC): Integer;
            property Objects[Index: Integer]: TFormasC read GetObject
              write SetObject; default;
      end;

    TParcelas = class
         public
              Parcela: Integer;
              Tipo: string;
              Valor: Currency;
              Vencimento: TDate;
              DataPagamento: TDate;
              ValorPago: Currency;
              Num: STring;
    end;

    TListaParcelas = class(TObjectList)
      protected
            procedure SetObject(Index: Integer; Item: TParcelas);
            function GetObject(Index: Integer): TParcelas;
            procedure Insert(Index: Integer; Obj: TParcelas);

      public
            function Add(Obj: TParcelas): Integer;
            property Objects[Index: Integer]: TParcelas read GetObject
              write SetObject; default;
      end;


      { FIM ALTERAÇÃO IMPORTACAO TXT }


  TFrmVendasCaixa = class(TForm)
    QConsItens: TFDQuery;
    DSQConsItens: TDataSource;
    IBTRVenda: TFDTransaction;
    QBuscaProduto: TFDQuery;
    QBuscaIndice: TFDQuery;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    QBuscaItens: TFDQuery;
    QBuscaParametros: TFDQuery;
    QConsItensCOD_VEN: TIntegerField;
    QConsItensCOD_PRO: TIntegerField;
    QConsItensORDEM: TIntegerField;
    QConsItensDESCONTO: TBCDField;
    QConsItensCOD_EMP: TIntegerField;
    QConsItensQUANT: TBCDField;
    QConsItensVALOR: TBCDField;
    QConsItensDESC_CUPOM: TStringField;
    Timer1: TTimer;
    QAux: TFDQuery;
    QBuscaItensCOD_VEN: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensDESC_CUPOM: TStringField;
    QItensPreVenda: TFDQuery;
    QItensPreVendaCOD_PRE: TIntegerField;
    QItensPreVendaORDEM: TIntegerField;
    QItensPreVendaCOD_PRO: TIntegerField;
    QItensPreVendaDESCONTO: TBCDField;
    QItensPreVendaCOD_EMP: TIntegerField;
    QItensPreVendaQUANT: TBCDField;
    QItensPreVendaVALOR: TBCDField;
    QItensPreVendaPRODUTO_PROMOCAO: TStringField;
    QItensPreVendaDESC_CUPOM: TStringField;
    QItensPreVendaICMS_CF_EST: TIntegerField;
    QItensMesa: TFDQuery;
    QItensMesaCODIGO: TIntegerField;
    QItensMesaORDEM: TIntegerField;
    QItensMesaCOD_PRO: TIntegerField;
    QItensMesaCOD_VEND: TIntegerField;
    QItensMesaVALOR: TBCDField;
    QItensMesaCOD_EMP: TIntegerField;
    QItensMesaQUANT: TBCDField;
    QItensMesaDESC_CUPOM: TStringField;
    QItensMesaICMS_CF_EST: TIntegerField;
    QItensPreVendaCANCELADO: TIntegerField;
    QBuscaIndiceINDICE_ECF: TStringField;
    QItensOrcamento: TFDQuery;
    QItensOrcamentoCODIGO: TIntegerField;
    QItensOrcamentoORDEM: TIntegerField;
    QItensOrcamentoCOD_PRO: TIntegerField;
    QItensOrcamentoDESCONTO: TBCDField;
    QItensOrcamentoCOD_EMP: TIntegerField;
    QItensOrcamentoQUANT: TBCDField;
    QItensOrcamentoVALOR: TBCDField;
    QItensOrcamentoPRODUTO_PROMOCAO: TStringField;
    QItensOrcamentoCANCELADO: TIntegerField;
    QItensOrcamentoDESC_CUPOM: TStringField;
    QItensOrcamentoICMS_CF_EST: TIntegerField;
    QItensOS: TFDQuery;
    QItensOSCODIGO: TIntegerField;
    QItensOSORDEM: TIntegerField;
    QItensOSCOD_PRO: TIntegerField;
    QItensOSDESCONTO: TBCDField;
    QItensOSCOD_EMP: TIntegerField;
    QItensOSCOD_VEND: TIntegerField;
    QItensOSQUANT: TBCDField;
    QItensOSVALOR: TBCDField;
    QItensOSPRODUTO_PROMOCAO: TStringField;
    QItensOSCANCELADO: TIntegerField;
    QItensOSDESC_CUPOM: TStringField;
    QItensOSICMS_CF_EST: TIntegerField;
    QItensMesaCONTA_ORIGEM: TIntegerField;
    QItensMesaCANCELADO: TIntegerField;
    QItensPreVendaDESCRICAO: TStringField;
    QItensOrcamentoDESCRICAO: TStringField;
    QBuscaItensCOD_VEND: TIntegerField;
    QBuscaItensVENDA_CANCELADA: TIntegerField;
    QItensMesaDESCRICAO: TStringField;
    QItensOSDESCRICAO: TStringField;
    QItensPreVendaCODIGO_BARRA_PRO: TStringField;
    QItensOrcamentoCODIGO_BARRA_PRO: TStringField;
    QItensOSCODIGO_BARRA_PRO: TStringField;
    QItensMesaCODIGO_BARRA_PRO: TStringField;
    QBuscaItensSTATUS_EXPORTA: TIntegerField;
    imgFundo: TImage;
    Image: TImage;
    MemoItens: TMemo;
    StringGrid: TStringGrid;
    PanelAuxVenda: TPanel;
    LabelAuxVenda: TLabel;
    EdtAuxVenda: TEdit;
    StatusBar1: TStatusBar;
    EdtCodBarra: TEdit;
    EdtQuant: TCurrencyEdit;
    EdtValorUnitario: TCurrencyEdit;
    EdtDescontoItem: TCurrencyEdit;
    EdtTotalItem: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    DescSimb: TLabel;
    Titulo: TLabel;
    Atendido: TLabel;
    Label32: TLabel;
    Caixa: TLabel;
    Info1: TLabel;
    info2: TLabel;
    info3: TLabel;
    PanelNomeProduto: TsLabelFX;
    QCliente: TFDQuery;
    EdtTotalVenda: TCurrencyEdit;
    MenGerente: TLabel;
    RecadoGerente: TTimer;
    TROCA_MEN: TTimer;
    Mensagens2: TFDQuery;
    Mensagens2COD: TIntegerField;
    Mensagens2MENSAGEN: TStringField;
    Mensagens: TClientDataSet;
    MensagensMENSAGEN: TStringField;
    HoraData: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    PagamentosEfetuados: TClientDataSet;
    PagamentosEfetuadosCOO: TIntegerField;
    PagamentosEfetuadosCCF: TIntegerField;
    PagamentosEfetuadosVALOR: TCurrencyField;
    PagamentosEfetuadosINDICE: TStringField;
    PagamentosEfetuadosDESCRICAO: TStringField;
    PagamentosEfetuadosID: TAutoIncField;
    PagamentosEfetuadosSAIUECF: TStringField;
    PagamentosEfetuadosCODFORMA: TIntegerField;
    TROrcamento: TFDTransaction;
    IBAuxOrc: TFDQuery;
    Conec: TImage;
    Desco: TImage;
    QItensOrcamentoESTOQUE: TBCDField;
    Image3: TImage;
    opValeno: TImage;
    opValeok: TImage;
    sLabelFX1: TsLabelFX;
    lblNotaManual: TsLabelFX;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;

    procedure FormShow(Sender: TObject);
    procedure LimpaProduto;
    function  AbreVenda : integer;
    procedure BuscaProduto;
    procedure BuscaIndice;
    procedure BuscaParametros;
    procedure GravaProduto;
    procedure ImprimeNoMemo;
    procedure CancelaVenda;
    procedure EdtCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuant1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescontoItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaDadosCliente;
    procedure FormCreate(Sender: TObject);
    procedure LimpaNovaVenda;

    procedure GravaCodVendaNaPreVenda;
    procedure Timer1Timer(Sender: TObject);
    procedure BuscaVendaAberta;
    function  RegistraProduto : integer;
    procedure EdtAuxVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function  BuscaCodigoPreVenda(const sSenha : string) : integer;
    function  BuscaCodigoOrcamento(const iSequencia : integer) : integer;
    function  BuscaCodigoOrdemServico(const iSequencia : integer) : integer;
    function  BuscaCodigoContaCliente(const iConta : integer) : integer;
    function  VerificaCaixaAbertoeECFAtiva : boolean;
    procedure VendeItensPreVenda;
    procedure VendeItensOrcamento;
    procedure VendeItensOrdemServico;
    procedure VendeItensContaCliente(const iCodigoConta : integer);
    function  CancelaItemMesaPreVenda : boolean;
    procedure AtualizaPreVenda(const iAux : integer);
    procedure AtualizaOrcamento(const iAux : integer);
    procedure AtualizaOrdemServico(const iAux : integer);
    procedure AtualizaContaCliente(const iAux, iCodigoConta : integer);
    procedure BuscaPadroes;
    procedure StringGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoItemExit(Sender: TObject);
    procedure CancelaTudo;
    procedure FormPaint(Sender: TObject);
    procedure Redondo(Control: TWinControl);
    procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    procedure RecadoGerenteTimer(Sender: TObject);
    procedure TROCA_MENTimer(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure IniciaPagamentos;
    function EfetuaPagamentosPreVenda(const cValor : currency) : integer;
     procedure MostraConec(var Message: TMessage); message MOSTRA_CONEC;
     procedure MostraDesco(var Message: TMessage); message MOSTRA_DESCO;
    procedure Image18Click(Sender: TObject);
    procedure ImprimeOrcamento( cod: Integer );
    procedure Image3Click(Sender: TObject);
    procedure TrataArquivoParametro;
    procedure AtualizaAuxVendaOrc( Cod_venda, Cod_orc: Integer );
    procedure InsereItensGrupo(Form: TfrmGrupoTeclas);
    procedure VendeItensSelecaoContaCliente;
    procedure AtualizaItensSelecionados;
  private
    { Private declarations }
    fProdutocomIMEI: Boolean;
    procedure SetopVale(const Value: Boolean);
  protected
//    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
  public
    { Public declarations }
    NumeroNF: Integer;
    IMEIPRod: String;
    InfoCliente: Boolean;
    property ProdutoComIMei: Boolean read fProdutocomIMEI write SetopVale;
    procedure ShowMessage( Men: String );
  end;

var
  FrmVendasCaixa: TFrmVendasCaixa;

  iCodigoVenda           : integer;    //variavel usada para guardar o codigo da venda.
  iCodPreVenda           : integer;    //variável usada para guardar o código da Prevenda
  iCodOrcamento          : integer;    //variável usada para guardar o código do Orçamento
  iCodOrdemServico       : integer;    //variável usada para guardar o código da Ordem de Serviço
  iCodMesa               : integer;    //variável usara para guardar o código da mesa
  iNumMesa               : Integer;    // Variavel para guarda o número da Mesa
  iCodContaCliente       : integer;    //variável usara para guardar o código da Conta do Cliente
  iSequenciaPreVenda     : int64;      //variavel usada para guardar a sequencia da prevenda
  iSequenciaDAV          : int64;      //variavel usada para guardar a sequencia do DAV
  iSequenciaDAVOS        : int64;      //variavel usada para guardar a sequencia do DAV-OS
  iCOOVenda              : integer;    //variável usada para guardar o número do cupom fiscal
  iCCFVenda              : integer;    //variável usada para guardar o número do contador de cupom fiscal
  iCOOMesa               : integer;    //variável usada para guardar o coo do gerencial da mesa
  iCERMesa               : integer;
  iCOOContaCliente       : integer;    //variável usara para guardar o coo da conta do cliente
  iECFMesa               : integer;    //variável usada para guardar o numero da ecf que imprimiu o GER da Mesa
  iCodCliente            : integer;    //variável usada para guardar o código do cliente
  iCodClientePadrao      : Integer;
  iCodTipoVenda          : integer;    //variavel usada para guardar o codigo do tipo de venda
  iAtrasoMaximoPara      : integer;    //variável usada para atraso maximo nos parametros
  iDiasCarencia          : integer;    //variável usada para guardar os dias de carencia
  iFormaPagamento        : integer;    //variável usada para guardar a forma de pagamento (indice)

  PagVirtual           : Boolean;
  cTotalDescontos        : Currency;
  cTotalPago             : Currency;
  cTotalVenda            : currency;   //variável usada para acumular o total da venda
  cDescConvenio          : currency;   //variável usada para guardar o desconto do convênio
  cDescPreVenda          : currency;   //variável usada para guardar o desconto da pre venda
  cDescontoMaximo        : currency;   //variável usada para guardar a % do desconto máximo nas vendas
  cSaldoCliente          : currency;   //variável usada para guardar o saldo do cliente
  cValorMaximo           : currency;   //variável usada para guardar o valor máximo nos itens das vendas
  cTaxaJuros             : currency;   //variável usada para guardar a taxa de juros

  bDescItem              : boolean;    //variável usada para verificar se pode conceder desconto no item
  bDescVenda             : boolean;    //variável usada para verificar se pode conceder desconto no total da venda
  bAlterarParcelas       : boolean;    //variável usada para verificar se altera parcelas
  bVendaLiberada         : boolean;    //variável usada para verificar se libera para cliente sem saldo;
  bBalancaLiberada       : boolean;    //variavel usada para liberar o peso da balança do caixa;
  bContLimiteCliente     : boolean;    //variável usada para verificar se controla o limite do cliente
  bImprimeCupomNaoFiscal : boolean;    //variável usara para verificar se imprime comprovante nao fiscal
  PagamentoEfetuado      : boolean;    //variavel usada para o tef quando pagamentos ja forão efetuados

  sNomeUsuario           : string;     //variavel usada para guardar o nome do operado de caixa
  sCaminhoFotoEmp        : string;     //variável usada para guardar o caminho da foto da empresa
  sMensagen              : string;

  // UTILIZADO NO CTRL + I IMPORTAÇÂO DE VENDAS TXT  { FIM ALTERAÇÃO IMPORTACAO TXT }
  ListaFormas : TListaFormas;
  ListaParcelas : TListaParcelas;
  cDescontoCtrlI: Currency;
  cAcrescimoCtrlI: Currency;


  // RESTAURANTE
  JaFezAdiantamento: Boolean;

  ImpressoraCanCupom: Boolean;

  // TECLAS PQ
  SelP: Boolean;
  SelQ: Boolean;

implementation
uses
  Udm, UECF, Ubibli1, UConsProd, UCancelaItem, UFechaVenda, UDadosCliente, 
  USenhaExcVenda, UsenhaLiberarVenda, UPadraoPafEcf, UProdutoNaoCadastrado, 
  UConsCheque, UFormasPagamento, UMenuFiscal, UMesas, USelVend, 
  UDadosClienteECF, UCarrega, UFBalanca, UConsOrcamento, UImportaVenda, UImei, 
  UNotaFiscalComcomitante, UQuantidadePreco, UVendeItens;

var iCodProduto        : integer;      //variável usada para guardar o código do produto
    iOrdemItens        : integer;      //variável usada para acumular a ordem dos itens
    iCodGrupo          : integer;      //variável usada para guardar o código do grupo de icms
    iCodVendedor       : integer;      //variável usada para guardar o codigo do vendedor padrao nas vendas
    iTamCodBalanca     : integer;      //variável usada para guardar o tamanho do código da balança do açougue
    iTipoBalanca       : integer;      //variável usara para guardar se é por preco ou peso   0=preco  1=peso

    cUnitario          : currency;     //variável usada para guardar o valor unitário
    cQuantidade        : currency;     //variável usada para guardar a quantidade do item
    cQuantEmbalagem    : currency;     //variavel usada para quardar o quant.da embalagem
    cDesconto          : currency;     //variável usada para guardar o valor do desconto do item
    cQuantMaxima       : currency;     //variável usada para guardar a quant. máxima nas vendas
    cTotalItem         : currency;     //variável usada para guardar o Total do Item
    cDescontoPromocao  : currency;     //variável usada para guardar a diferenca entre preco normal e preco promocional

    sTipoDesc          : string;       //variável usada para guardar o tipo de desconto
    sDescricao         : string;       //variável usada para guardar a descrição do produto
    sCodigoBarra       : string;       //variável usada para guardar o codigo de barras do produto
    sIndice            : string;       //variável usada guardar o índice do icms;
    sUnidade           : string;       //variável usada para guardar a unidade do produto
    sSqlProduto        : string;       //variável usada para guardar o sql do produto
    sSqlEmbalagem      : string;       //variável usada para guardar o sql da embalagem

    bPromocao          : boolean;      //variável usada para promocao
    bIniciarFormas     : boolean;      //variável usara para verificar se inicia venda com formas de pagamento
    bConsultarProduto  : boolean;      //variável usara para verificar se pode consultar produto

{$R *.dfm}

function ForceForegroundWindow(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then Result := True
  else
  begin
    // Windows 98/2000 doesn't want to foreground a window when some other
    // window has keyboard focus

    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
      (Win32MinorVersion > 0)))) then
    begin
      // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
      // Converted to Delphi by Ray Lischner
      // Published in The Delphi Magazine 55, page 16

      Result := False;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then
      begin
        // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else
    begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;

    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }


procedure TFrmvendascaixa.InsereItensGrupo(Form: TfrmGrupoTeclas);
var
    I: Integer;
    cEstoque : Currency;
    Key: Word;
    Shift: TShiftState;
begin
   for I := 0 to Form.Produtos.Count - 1 do
       begin
          EdtCodBarra.Text := TProdutos( frmGrupoTeclas.Produtos.Items[I] ).codigoBarras;
          EdtQuant.Value := TProdutos( frmGrupoTeclas.Produtos.Items[I] ).Quantidade;
          Key := VK_RETURN;
          EdtCodBarraKeyDown( self, Key, Shift );
       end;
end;

procedure TFrmvendascaixa.WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
   Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TFrmVendasCaixa.RecadoGerenteTimer(Sender: TObject);
var
  sTexto: string;
begin
  sTexto:=Mengerente.Caption;
  Mengerente.Caption:=copy(sTexto,2,Length(sTexto))+ sTexto[1];

end;

procedure TFrmVendasCaixa.Redondo(Control: TWinControl);
var
R: TRect;
Rgn: HRGN;
begin
    with Control do
      begin
         R := ClientRect;
         rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
         Perform(EM_GETRECT, 0, lParam(@r));
         InflateRect(r, - 5, - 5);
         Perform(EM_SETRECTNP, 0, lParam(@r));
         SetWindowRgn(Handle, rgn, True);
         Invalidate;
      end;
end;

procedure TFrmVendasCaixa.BuscaPadroes;
begin
   { busca codigo do cliente, vendedor e tipo de venda }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CLIENTE_PADRAO_VENDA, VENDEDOR_PADRAO_VENDA, ' +
                        'TIPO_VENDA_PADRAO_VENDA   ' +
                        'FROM PARAMETROS           ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             iCodCliente    := fieldbyname('cliente_padrao_venda').AsInteger;
             iCodClientePadrao :=  fieldbyname('cliente_padrao_venda').AsInteger;
             iCodTipoVenda  := fieldbyname('tipo_venda_padrao_venda').AsInteger;
             if iCodVend = 0 then
                begin
                   iCodVendedor   := fieldbyname('vendedor_padrao_venda').AsInteger;
                   iCodVend := iCodVendedor;
                end
             else
                iCodVendedor := iCodVend;
             Close;
             Sql.Text := 'select * from vendedor where cod_vend=' + inttostr( iCodVend );
             Open;
             Atendido.Caption := 'Atendido por : ' + #13 + FieldByName( 'NOME_VEND' ).AsString;
             close;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os parametros');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { busca o nome do cliente e o tipo de venda para colocar no statusbar }
//   SB.Panels[3].Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
   info2.Caption := 'Cliente : ' + dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);

  // sb.Panels[4].Text:= dm.RetornaStringTabela('nome_tpv', 'tipo_venda', 'cod_tpv', iCodTipoVenda);
   info3.Caption := 'Tipo venda : ' + dm.RetornaStringTabela('nome_tpv', 'tipo_venda', 'cod_tpv', iCodTipoVenda);
   sDocCliente := '';
   sEndCliente := '';
   sNomeCliente := '';
end;

procedure TFrmVendasCaixa.AtualizaPreVenda(const iAux : integer);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE PRE_VENDA   ' +
                        'SET STATUS_PRE = :STATUS ' +
                        'WHERE COD_PRE = :CODPRE';
             Parambyname('status').AsInteger := iAux;
             Parambyname('codpre').AsInteger := iCodPreVenda;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao atualizar a pré-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmVendasCaixa.AtualizaOrcamento(const iAux : integer);
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
             sql.Text:= 'UPDATE ORCAMENTO   ' +
                        'SET STATUS = :STATUS, COO_VENDA = :COOVENDA, CCF_VENDA = :CCFVENDA, STATUS_ALTERADO=0 ' +
                        'WHERE CODIGO = :CODIGO';
             Parambyname('status').AsInteger    := iAux;
             Parambyname('codigo').AsInteger    := iCodOrcamento;
             Parambyname('coovenda').AsInteger  := iCOOVenda;
             Parambyname('ccfvenda').AsInteger  := iCCFVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao atualizar o Orçamento');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmVendasCaixa.AtualizaOrdemServico(const iAux : integer);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE ORDEM_SERVICO  ' +
                        'SET DATA_FECHAMENTO = :DATA, COO_VENDA = :COOVENDA, CCF_VENDA = :CCFVENDA ' +
                        'WHERE CODIGO = :CODIGO';
             Parambyname('data').AsDate         := date;
             Parambyname('codigo').AsInteger    := iCodOrdemServico;
             Parambyname('coovenda').AsInteger  := iCOOVenda;
             Parambyname('ccfvenda').AsInteger  := iCCFVenda;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao atualizar a OS');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmVendasCaixa.AtualizaAuxVendaOrc(Cod_venda, Cod_orc: Integer);
var
    AuxOrc: string;
begin
   AuxOrc  := dm.RetornaStringTabela( 'auxiliar', 'orcamento', 'codigo', cod_orc );
   if AuxOrc <> '' then
      begin
           if dm.IBTransaction.Active then
              dm.IBTransaction.Commit;
           dm.IBTransaction.StartTransaction;

           dm.QConsulta.Close;
           dm.QConsulta.SQL.Text := 'UPDATE VENDAS SET AUXILIAR=:AUX where COD_VEN=:COD';
           dm.QConsulta.ParamByName( 'COD' ).AsInteger := Cod_venda;
           dm.QConsulta.ParamByName( 'AUX' ).AsString := AuxOrc;
           dm.QConsulta.ExecOrOpen;
           dm.QConsulta.Close;

           dm.IBTransaction.Commit;
      end;
end;

procedure TFrmVendasCaixa.AtualizaContaCliente(const iAux, iCodigoConta : integer);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE CONTA_CLIENTE  ' +
                        'SET DATA_FECHAMENTO = :DATA, HORA_FECHAMENTO = :HORA, COO_VENDA = :COOVENDA, STATUS = :STATUS ' +
                        'WHERE CODIGO = :CODIGO';
             Parambyname('data').AsDate         := date;
             Parambyname('hora').AsTime         := time;
             Parambyname('codigo').AsInteger    := iCodigoConta;
             Parambyname('coovenda').AsInteger  := iCOOVenda;
             Parambyname('status').AsInteger    := iAux;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao atualizar a Conta do Cliente');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmVendasCaixa.AtualizaItensSelecionados;
var
  I: Integer;
begin
   if DM.IBTRServer.Active then
      DM.IBTRServer.Commit;
   DM.IBTRServer.StartTransaction;
   with frmSelecionaItens do
      begin
        for I := 0 to ListaItens.Count - 1 do
            begin
              if ListaItens.ItensPedido[I].Selecionado and
              ( not ( ListaItens.ItensPedido[I].CanceladoNoCupom ) ) then
                 begin
                    if ( ListaItens.ItensPedido[I].Quant -
                     ListaItens.ItensPedido[I].QauntEdit ) > 0 then
                       begin
                          with dm.QConsultaServer do
                             begin
                                close;
                                SQL.Text := 'update ITENS_CONTA_CLIENTE' +
                                            ' set QUANT=:QUANT where ' +
                                            ' CODIGO=:CODIGO and ORDEM=:ORDEM';
                                 ParamByName( 'CODIGO' ).AsInteger := ListaItens.CodigoConta;
                                 ParamByName( 'ORDEM' ).AsInteger := ListaItens.ItensPedido[I].Ordem;
                                 ParamByName( 'QUANT' ).AsFloat := ( ListaItens.ItensPedido[I].Quant -
                                        ListaItens.ItensPedido[I].QauntEdit );
                                 ExecOrOpen;
                             end;
                       end
                    else
                       begin
                          with dm.QConsultaServer do
                             begin
                                close;
                                SQL.Text := 'delete from ITENS_CONTA_CLIENTE' +
                                            ' where CODIGO=:CODIGO and ORDEM=:ORDEM';
                                 ParamByName( 'CODIGO' ).AsInteger := ListaItens.CodigoConta;
                                 ParamByName( 'ORDEM' ).AsInteger := ListaItens.ItensPedido[I].Ordem;
                                 ExecOrOpen;
                             end
                       end;
                 end;
            end;
      end;
   DM.IBTRServer.Commit;
end;

procedure TFrmVendasCaixa.BuscaVendaAberta;
var iCodEmp   : integer;
    bAux      : boolean;
    sAuxDesc  : string;
begin
   iCodigoVenda  := 0;
   bAux          := false;
   cTotalPago    := 0;
   PagVirtual := false;


   cTotalDescontos := 0;
   cTotalVenda   := 0;
   sAuxDesc      := '';

   {busca o código da última venda do caixa no dia}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT MAX(COD_VEN) CODVEN ' +
                     'FROM VENDAS ' +
                     'WHERE DATA_VEN = :DATA AND COD_CAI = :CODCAI');
             Parambyname('data').AsDate:= date;
             Parambyname('codcai').AsInteger:= iCaixa;
             Open;
             iCodigoVenda:= fieldbyname('codven').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar o código da última venda');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if iCodigoVenda > 0 then
      begin
         { verifica se o total da venda é igual a zero, busca tambem o codigo da empresa }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin
                   close;
                   sql.Clear;
                   sql.add('SELECT TOTAL_VEN, CANCELADA_VEN ' +
                           'FROM VENDAS ' +
                           'WHERE COD_VEN = :CODVEN ');
                   Parambyname('codven').AsInteger:= iCodigoVenda;
                   Open;
                   if (FieldByName('TOTAL_VEN').AsCurrency > 0) or (fieldbyname('CANCELADA_VEN').AsInteger = 1) then
                      begin
                         bAux:= false;
                         iCodigoVenda := 0;
                      end
                   else
                      bAux:= true;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             showmessage('Erro ao verificar se o total venda é igual a zero');
           end;
         finally
           dm.QConsulta.Close;
         end;

         { busca os itens da venda }
         if bAux then
            begin
               if IBTRVenda.Active then
                  IBTRVenda.Commit;
               IBTRVenda.StartTransaction;
               try
                 try
                   with QBuscaItens do
                      begin
                          MemoItens.Lines.Add( '                C U P O M  F I S C A L' );
                          MemoItens.Lines.Add('');
                          MemoItens.Lines.Add( 'ITEM CÓDIGO            DESCRIÇÃO' );
                          MemoItens.Lines.Add( 'QTD.  UND.   VL.UNIT(  R$)      ST      VL.ITEM(  R$)' );
                          MemoItens.Lines.Add( '------------------------------------------------------' );
                         close;
                         parambyname('codven').AsInteger:= iCodigoVenda;
                         Open;
                         while not eof do
                            begin
                               {incluindo o produto no memo}
                               if bTruncar then
                                  cTotalItem:= trunc(((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) * 100) + 0.0009) / 100
                               else
                                  cTotalItem:= QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency;

                               sAuxDesc:= QBuscaItensDESC_CUPOM.AsString;
                               iOrdemItens:= QBuscaItensORDEM.AsInteger;
{                               MemoItens.Lines.Add(FormataStringE(inttostr(iOrdemItens), '4', ' ') + ' ' +
                               FormataStringE(copy(sAuxDesc, 1, 27), '27', ' ') + ' ' +
                               FormataStringD(currtostrf(QBuscaItensQUANT.AsCurrency, ffnumber, 3), '7', ' ') + ' ' +
                               FormataStringD(currtostrf(QBuscaItensVALOR.AsCurrency, ffnumber, 2), '8' , ' ') +
                               FormataStringD(currtostrf(cTotalItem, ffnumber, 2), '9', ' '));}
                               memoitens.lines.add(FormataStringE(inttostr(iOrdemItens), '4', ' ') +
                               FormataStringE(FormatFloat('00000000000000', 0 ), '14', ' ')  +' ' +
                                         FormataStringE(copy(sAuxDesc, 1, 27), '27', ' '));

                               memoitens.lines.add( '    ' + FormataStringD(currtostrf(QBuscaItensQUANT.AsCurrency, ffnumber, 3), '7', ' ')  +
                                         FormataStringD(sUnidade, '3', ' ') + ' X       ' +
                                         FormataStringD(currtostrf(QBuscaItensVALOR.AsCurrency, ffnumber, 2), '8' , ' ') + '            ' +

                                         FormataStringD(currtostrf(cTotalItem, ffnumber, 2), '9', ' '));


                               //cTotalVendaVenda := cTotalVenda + cTotalItem;
                               cTotalVenda        := SubTotalCupomFiscal(iECF);
                               cTotalPago         := dm.ECF.TotalPago;
                               cTotalDescontos    := DM.ECF.TotalDescontos;
                               PagVirtual    := False;
                               IniciaPagamentos;
                               EdtTotalVenda.Text := currtostr(cTotalVenda);
                               next;
                            end;
                      end;
                   bFechaForm:= false;
                   IBTRVenda.Commit;
                 except
                   IBTRVenda.Rollback;
                   showmessage('Erro ao buscar os itens da venda');
                 end;
               finally
                 QBuscaItens.Close;
                 //sb.Panels[1].Text:= IntToStr(iCodigoVenda);
                    IniciaPagamentos;
                 info1.Caption := 'Venda : ' + IntToStr(iCodigoVenda);
               end;
            end;
      end;
end;

procedure TFrmVendasCaixa.LimpaNovaVenda;
begin
   DM.ECF.NaoFiscalImprime := True;
   SelP := False;
   SelQ := False;
   Dm.ECF.NaoFiscalImprime := True;
   JaFezAdiantamento := False;
   InfoCliente := False;
   NumeroNF := 0;
   PanelAuxVenda.Visible    := false;
   iFormaPagamento          := dm.BuscaFormaPagamento('DN');
   iOrdemItens              := 0;
   iCodigoVenda             := 0;
   iCodPreVenda             := 0;
   iCodOrcamento            := 0;
   iCodOrdemServico         := 0;
   iCodContaCliente         := 0;
   iSequenciaPreVenda       := 0;
   iSequenciaDAV            := 0;
   iSequenciaDAVOS          := 0;
   iCOOContaCliente         := 0;
   iCOOVenda                := 0;
   iCCFVenda                := 0;
   iTabelaPreco             := 0;
   cTefAutorizado           := 0;

   cDescontoVenda           := 0;
   cDesconto                := 0;
   cTotalDescontos          := 0;
   cTotalPago               := 0;
   PagVirtual               := false;
   if PagamentosEfetuados.Active then
      PagamentosEfetuados.Close;
   cTotalVenda              := 0;
   cSaldoCliente            := 0;
   cTotalItem               := 0;
   cDescConvenio            := 0;
   cDescPreVenda            := 0;

   bFechaForm               := true;
   PagamentoEfetuado        := false;
   bVendaLiberada           := false;
   bBalancaLiberada         := false;
   bContLimiteCliente       := true;
   bExibeMensagensErro      := true;
   TEFCancelado := False;

    {  ALTERAÇÃO IMPORTACAO TXT }
   if Assigned( ListaFormas ) then
       begin
          ListaFormas.Clear;
          FreeAndNil( ListaFormas );
       end;
   if Assigned( ListaParcelas ) then
      begin
          ListaParcelas.Clear;
          FreeAndNil( ListaParcelas );
      end;

   { FIM ALTERAÇÃO IMPORTACAO TXT }

   Image.Picture.LoadFromFile( sCaminhoFotoEmp );

   PanelNomeProduto.Caption := 'CAIXA LIVRE';
   //SB.Panels[1].Text        := '';
   info1.Caption := '';   

   MemoItens.Clear;
   EdtTotalVenda.Clear;
   LimpaDadosCliente;
   try
     FrmVendasCaixa.image.Picture.loadFromFile(sCaminhoFotoEmp);
   except
     FrmVendasCaixa.Image.Picture:= nil;
   end;
   BuscaPadroes;  //iCodCliente, iCodVendedor, iCodTipoVenda
   LimpaProduto;
end;

procedure TFrmVendasCaixa.GravaCodVendaNaPreVenda;
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
             sql.add('UPDATE PRE_VENDA ' +
                     'SET COD_VENDA = :CODVENDA, STATUS_PRE = :STATUS ' +
                     'WHERE COD_PRE = :CODPRE');
             Parambyname('codvenda').AsInteger := iCodigoVenda;
             Parambyname('status').AsInteger   := 1;
             Parambyname('codpre').AsInteger   := iCodPreVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao gravar o código da venda na Pre-Venda');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

function TFrmVendasCaixa.RegistraProduto : integer;
var cAuxDesconto, cAuxDescPromocao : currency;
   ValorAux: Double;
   QuantAux: Double;
   DescontoAcrescimoAux: Double;
   Tipo: TTipoQP;
begin
   cAuxDesconto     := 0;
         QuantAux := 0;
         ValorAux := 0;
   cAuxDescPromocao := cDescontoPromocao * cQuantidade;
   if SelP or SelQ then
      begin
         if SelP and SelQ then
            Tipo := tPQ
         else
            if SelP then
               Tipo := tP
                 else
                    if SelQ then
                       Tipo := tQ;

         Application.CreateForm( TfrmQuantidadePreco, frmQuantidadePreco );
         frmQuantidadePreco.Tipo := Tipo;
         frmQuantidadePreco.Quantidade := cQuantidade;
         frmQuantidadePreco.Valor := cUnitario;
         if frmQuantidadePreco.ShowModal  = mrOk then
            begin
               QuantAux := frmQuantidadePreco.Quantidade;
               ValorAux := frmQuantidadePreco.Valor;

            end;
         FreeAndNil( frmQuantidadePreco );
      end;
   if QuantAux > 0 then
      cQuantidade := QuantAux;

   if  ValorAux > cUnitario then
      begin
         if trim(sTipoDesc) = '$' then
            DescontoAcrescimoAux :=  ( ValorAux - cUnitario ) * -1
         else
            begin
                DescontoAcrescimoAux := ( ( ( ValorAux - cUnitario ) * 100 ) / cUnitario )* -1;
            end;
      end;
   if ( ValorAux < cUnitario ) and ( ValorAux > 0 ) then
      begin
         if trim(sTipoDesc) = '$' then
            DescontoAcrescimoAux :=  ( cUnitario -ValorAux )
         else
            begin
                DescontoAcrescimoAux := ( ( ( cUnitario - ValorAux  ) * 100 ) / cUnitario  );
            end;
      end;
   cDesconto := Cdesconto + DescontoAcrescimoAux;
   if cDesconto <> 0 then
      begin
         if trim(sTipoDesc) = '$' then
            cAuxDesconto:= cDesconto
         else
            cAuxDesconto:= (((cQuantidade * cUnitario) * cDesconto) / 100);
      end;

   cAuxDesconto:= cAuxDesconto + cAuxDescPromocao;
   if ProdutoComIMei then
      begin
         result:= RegistraItemECF(iECF, 14, iTamDescCupom + Length( IMEIPRod ) + 5, sCodigoBarra, sDescricao + #13#10 + 'IMEI:' + IMEIPRod,
                            sIndice, sUnidade, cQuantidade, cUnitario, cAuxDesconto);
      end
   else
        begin
           result:= RegistraItemECF(iECF, 14, iTamDescCupom, sCodigoBarra, sDescricao,
                            sIndice, sUnidade, cQuantidade, cUnitario, cAuxDesconto);
        end;
end;


procedure TFrmVendasCaixa.BuscaParametros;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       dm.QConsulta.Close;
       dm.QConsulta.SQL.Text := 'select * from empresa where cod_emp=' + inttostr( iEmp );
       dm.QConsulta.Open;
       titulo.Caption := 'MLF PDV [ ' + dm.QConsulta.FieldByName( 'RAZAO_EMP' ).AsString + ' ] [ SUPORTE 51 98153303 ]';
       dm.QConsulta.Close;

       with QBuscaParametros do
          begin
             close;
             parambyname('codemp').AsInteger:= iEmp;
             open;

             if trim(fieldbyname('DESCONTO_ITEM_VENDA').AsString) = 'S' then
                bDescItem:= true
             else
                bDescItem:= false;

             if trim(fieldbyname('DESCONTO_TOTAL_VENDA').AsString) = 'S' then
                bDescVenda:= true
             else
                bDescVenda:= false;

             if not FieldByName('DESCONTO_MAXIMO_VENDA').IsNull then
                cDescontoMaximo:= FieldByName('DESCONTO_MAXIMO_VENDA').AsCurrency
             else
                cDescontoMaximo:= 0;

             if not FieldByName('tamanho_codigo_balanca').IsNull then
                iTamCodBalanca:= FieldByName('tamanho_codigo_balanca').AsInteger
             else
                iTamCodBalanca:= 0;

             cQuantMaxima        := fieldbyname('QUANT_MAXIMA_VENDAS').AsCurrency;
             cValorMaximo        := fieldbyname('VALOR_MAXIMO_VENDAS').AsCurrency;
             iDiasCarencia       := fieldbyname('DIAS_CARENCIA').AsInteger;
             cTaxaJuros          := fieldbyname('JUROS_ATRASO').AsCurrency;
             iAtrasoMaximoPara   := fieldbyname('ATRASO_MAXIMO').AsInteger;

             if trim(fieldbyname('ALTERAR_PARCELAS').AsString) = 'S' then
                bAlterarParcelas := true
             else
                bAlterarParcelas := false;

             iTipoVendaPrazo     := fieldbyname('TIPO_VENDA_PADRAO_PRAZO').AsInteger;
             iTipoBalanca        := fieldbyname('preco_peso_balanca').AsInteger;

             if trim(fieldbyname('iniciar_vendas_forma_pagamento').AsString) = 'S' then
                bIniciarFormas:= true
             else
                bIniciarFormas:= false;

             if trim(fieldbyname('CONSULTAR_PRODUTO').AsString) = 'S' then
                bConsultarProduto:= true
             else
                bConsultarProduto:= false;

             if trim(fieldbyname('SAIDAS_ESTOQUE_NEGATIVO').AsString) = 'S' then
                bEstoqueNegativo:= true
             else
                bEstoqueNegativo:= false;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Buscar os Parâmetros');
     end;
   finally
     QBuscaParametros.Close;
   end;
end;

procedure TFrmVendasCAixa.LimpaDadosCliente;
begin
   iTabelaPreco:= 0;
   with FrmDadosCliente do
      begin
         edtcodtpv.Clear;
         EdtNomeTPV.Clear;
         LConvenio.Caption:= '';
         LCredito.Caption:= '';
         edtcodcli.Clear;
         EdtNomecli.Clear;
         EdtLimite.Clear;
         EdtSaldo.Clear;
         edtdev.Clear;
         edtdias.Clear;
         EdtAutorizado.Clear;
         memoobs.Clear;
         cSaldoCliente:= 0;
         bContLimiteCliente:= false;
      end;
   //FrmVendasCaixa.SB.Panels[3].Text:= '';
   info2.Caption := '';   
   //FrmVendasCaixa.SB.Panels[4].Text:= '';
   info3.Caption := '';   
   iFormaPagamento:= dm.BuscaFormaPagamento('DN');
   FrmVendasCaixa.BuscaPadroes;
end;

procedure TFrmVendasCaixa.CancelaVenda;
begin
   { cancelando a venda }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Add('UPDATE VENDAS ' +
                     'SET CANCELADA_VEN = 1, TOTAL_VEN = :TOTAL ' +
                     'WHERE COD_VEN = :CODVEN');
             Parambyname('total').AsCurrency:= cTotalVenda;
             Parambyname('codven').AsInteger:= iCodigoVenda;
             ExecOrOpen;

             close;
             sql.Clear;
             sql.Add('UPDATE ITENS_VENDA ' +
                     'SET VENDA_CANCELADA = 1  ' +
                     'WHERE COD_VEN = :CODVEN');
             Parambyname('codven').AsInteger:= iCodigoVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
       LimpaNovaVenda;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Cancelar a Venda');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmVendasCaixa.GravaProduto;
begin
   inc(iOrdemItens);
   if not( sTipoDesc = '$' ) and ( cDescontoPromocao > 0 ) then
      cDescontoPromocao := ( cDescontoPromocao * 100 )/( cQuantidade * cUnitario );
   GravaProdutoVenda(iCodigoVenda, iCodProduto, iOrdemItens, iCodVendedor, 0, 0, cQuantidade, cUnitario, cDesconto + cDescontoPromocao, sTipoDesc, bPromocao);
   ImprimeNoMemo;
end;

procedure TFrmVendasCaixa.Image10Click(Sender: TObject);
begin
             if (not (iCodigoVenda = 0)) or ( not (cTotalVenda = 0)) then
                ShowMessage( 'Venda aberta' )
             else
                begin
                   Application.CreateForm(TFrmSelvend, FrmSelvend);
                   FrmSelvend.cod_vendi := iCodVend;
                   FrmSelvend.ShowModal;
                   if iCodVend > 0 then
                   begin
                     iCodVendedor := iCodVend;
                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     dm.IBTransaction.StartTransaction;
                     dm.QConsulta.Close;
                     dm.QConsulta.SQL.Text := 'select * from vendedor where cod_vend=' + inttostr( iCodVend );
                     dm.QConsulta.Open;
                     iCodVendedor := iCodVend;
                     Atendido.Caption := 'Atendido por : ' + #13 +
                      dm.QConsulta.FieldByName( 'NOME_VEND' ).AsString;
                     dm.QConsulta.Close;
                     dm.IBTransaction.Commit;
                   end;
                end;
end;

procedure TFrmVendasCaixa.Image11Click(Sender: TObject);
begin
             { verificando se o servidor esta ativo }
             if bOFF then
                begin
                   try
                     dm.IBDatabaseServer.Connected    := false;
;
;
                     dm.IBDatabaseServer.Connected    := true;
                   except
                     dm.IBDatabaseServer.Connected    := false;
                     showmessage('Servidor Inativo');
                     exit;
                     abort;
                   end;
                end;

             FrmDadosCliente.panel3.Visible:= false;
             if ( ( DM.PW + DM.PH )/ 2) < 90 then
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
             else
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( DM.PW + DM.PH )/ 2) ) /100);
             FrmDadosCliente.Position:= poDesktopCenter;
             FrmDadosCliente.Tag:= 0;
             FrmDadosCliente.showmodal;
end;

procedure TFrmVendasCaixa.Image12Click(Sender: TObject);
begin
             if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) then
                begin
                   StringGrid.Cells[0, 0]:= 'PRE VENDA  [Ctrl + P]' ;
                   StringGrid.Cells[0, 1]:= 'ORÇAMENTO  [Ctrl + O] ';
                   StringGrid.Cells[0, 2]:= 'IMPRIMIR DAV  [Ctrl + D]';
                   StringGrid.Visible:= true;
                   StringGrid.SetFocus;
                end
end;

procedure TFrmVendasCaixa.Image13Click(Sender: TObject);
begin
             if iCodigoVenda > 0 then
                begin
                   if Application.MessageBox('Confirma cancelamento da venda?', 'Cancelar', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
                      begin
                         PanelNomeProduto.Caption:= 'CANCELANDO VENDA';
                         Application.CreateForm(TFrmSenhaExcVenda, FrmSenhaExcVenda);
                         FrmSenhaExcVenda.showmodal;
                      end;
                end;

end;

procedure TFrmVendasCaixa.Image14Click(Sender: TObject);
begin
            if bConsultarProduto then
               begin
                  Application.CreateForm(TFrmConsProd, FrmConsProd);
                  FrmConsProd.Tag:= 0;
                  FrmConsProd.showmodal;
               end;
end;

procedure TFrmVendasCaixa.Image15Click(Sender: TObject);
begin
             if iCodigoVenda = 0 then
                begin
                   showmessage('Venda não Aberta');
                   exit;
                end;

             if IBTRVenda.Active then
                IBTRVenda.Commit;
             IBTRVenda.StartTransaction;
             with QBuscaItens do
                begin
                   close;
                   Parambyname('codven').AsInteger:= iCodigoVenda;
                   Open;
                   Last;
                   if recordcount > 1 then
                      begin
                         ibtrvenda.Commit;
                         QBuscaItens.Close;
                         PanelNomeProduto.Caption:= 'CANCELANDO ITEM';
                         Application.CreateForm(TFrmCancelaItem, FrmCancelaItem);
                         FrmCancelaItem.showmodal;
                      end
                   else
                     if recordcount = 0 then
                        begin
                           ibtrvenda.Commit;
                           QBuscaItens.Close;
                           showmessage('Nenhum Item Vendido');
                        end
                     else
                        if recordcount = 1 then
                           begin
                              ibtrvenda.Commit;
                              QBuscaItens.Close;
                              showmessage('Venda com 1 Item, tem que cancelar a venda');
                           end;
                end;
end;

procedure TFrmVendasCaixa.Image16Click(Sender: TObject);
begin
             Tag := 4;
             Close;
end;

procedure TFrmVendasCaixa.Image17Click(Sender: TObject);
begin
             if (iCodigoVenda = 0) or (cTotalVenda = 0) then
                exit;

             Application.CreateForm(TFrmFechaVenda, FrmFechaVenda);
             PanelNomeProduto.Caption:= 'FECHA VENDA';

             if bDescVenda then
                FrmFechaVenda.PanelDescontos( false )
             else
                FrmFechaVenda.PanelDescontos( true );

             FrmFechaVenda.showmodal;
             FrmFechaVenda.Release;
             FrmFechaVenda := nil;
end;

procedure TFrmVendasCaixa.Image18Click(Sender: TObject);
begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
end;

procedure TFrmVendasCaixa.Image3Click(Sender: TObject);
begin
   Close;

end;

procedure TFrmVendasCaixa.Image4Click(Sender: TObject);
begin
         if bOFF then
            begin
               try
                 dm.IBDatabaseServer.Connected    := false;
;
;
                 dm.IBDatabaseServer.Connected    := true;
               except
                 dm.IBDatabaseServer.Connected    := false;
                 showmessage('Servidor Inativo');
                 exit;
                 abort;
               end;
            end;

         Application.CreateForm(TFrmConsCheque, FrmConsCheque);
         FrmConsCheque.ShowModal;
end;

procedure TFrmVendasCaixa.Image5Click(Sender: TObject);
begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
end;

procedure TFrmVendasCaixa.Image6Click(Sender: TObject);
begin
             if bDescItem then
                begin
                   sTipoDesc:= '$';
                   DescSimb.Caption := 'R$';
                   EdtDescontoItem.ReadOnly := false;
                   EdtDescontoItem.TabStop  := true;
                   EdtDescontoItem.SetFocus;
                end;
end;

procedure TFrmVendasCaixa.Image7Click(Sender: TObject);
begin
             if bDescItem then
                begin
                   sTipoDesc:= '%';
                   DescSimb.Caption := '%';
                   EdtDescontoItem.ReadOnly := false;
                   EdtDescontoItem.TabStop  := true;
                   EdtDescontoItem.SetFocus;
                end;
end;

procedure TFrmVendasCaixa.Image8Click(Sender: TObject);
begin
             Application.CreateForm(TFrmFormasPagamento, FrmFormasPagamento);
             FrmFormasPagamento.ShowModal;
end;

procedure TFrmVendasCaixa.Image9Click(Sender: TObject);
begin
             edtquant.ReadOnly:= false;
             edtquant.TabStop := true;
             edtquant.SetFocus;
end;

procedure TFrmVendasCaixa.ImprimeNoMemo;
var sAuxDescProduto  : string;
    cAuxDescPromocao, cAuxDesconto : currency;
begin
   cAuxDesconto     := 0;
   cAuxDescPromocao := 0;

   if bPromocao then
      sAuxDescProduto:= 'Pp ' + sDescricao
   else
      sAuxDescProduto:= sDescricao;

   if bTruncar then
      cTotalItem:= trunc(((cQuantidade * cUnitario) * 100) + 0.0009) / 100
   else
      cTotalItem:= cQuantidade * cUnitario;
//  result:= RegistraItemECF(iECF, 14, iTamDescCupom, sCodigoBarra, sDescricao,
  //                          sIndice, sUnidade, cQuantidade, cUnitario, cAuxDesconto);
   with MemoItens do
      begin
         lines.add(FormataStringE(inttostr(iOrdemItens), '4', ' ') +
         FormataStringE(FormatFloat('00000000000000',StrtoFloat(sCodigoBarra)), '14', ' ')  +' ' +
                   FormataStringE(copy(sAuxDescProduto, 1, 27), '27', ' '));

         lines.add( '    ' + FormataStringD(currtostrf(cQuantidade, ffnumber, 3), '7', ' ')  +
                   FormataStringD(sUnidade, '3', ' ') + ' X       ' +
                   FormataStringD(currtostrf(cUnitario, ffnumber, 2), '8' , ' ') + '            ' +

                   FormataStringD(currtostrf(cTotalItem, ffnumber, 2), '9', ' '));

         cAuxDescPromocao:= cDescontoPromocao * cQuantidade;

         if cDesconto <> 0 then
            begin
               if trim(sTipoDesc) = '$' then
                  cAuxDesconto:= cDesconto
               else
                  cAuxDesconto:= (((cQuantidade * cUnitario) * cDesconto) / 100);
            end;

         cAuxDesconto:= cAuxDesconto + cAuxDescPromocao;

         if cAuxDesconto > 0 then
            begin
               lines.Add(FormataStringE('Desconto Item', '30', ' ') +
                         FormataStringD(currtostrf(cAuxDesconto, ffnumber, 2), '22', ' '));
            end
         else
         if cAuxDesconto < 0 then
            begin
               lines.Add(FormataStringE('Acréscimo Item', '30', ' ') +
                         FormataStringD(currtostrf(cAuxDesconto * -1 , ffnumber, 2), '22', ' '));
            end

      end;

      cTotalVenda        := SubTotalCupomFiscal(iECF);
      EdtTotalVenda.Text := currtostr(cTotalVenda);
      EdtTotalVenda.Refresh;
      LimpaProduto;
   edtquant.Text := '1';
   edtquant.ReadOnly := true;
   edtquant.TabStop  := false;

   EdtDescontoItem.ReadOnly := true;
   EdtDescontoItem.TabStop  := false;
   EdtCodBarra.Enabled      := true;
   bBalancaLiberada         := false;
   EdtCodBarra.Clear;
   EdtCodBarra.SetFocus;
end;

procedure TFrmVendasCaixa.ImprimeOrcamento( cod: Integer );
begin
                     begin
                        iCodOrcamento:= BuscaCodigoOrcamento(Cod);
                        if iCodOrcamento > 0 then
                           begin
                              if iCodCliente > 0 then
                                begin
                               //  FrmVendasCaixa.SB.Panels[3].Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                 FrmVendasCaixa.info2.Caption := 'Cliente : ' + dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                end;

                              if iCodTipoVenda > 0 then
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
                                              sql.Text:= 'SELECT COD_TPV, NOME_TPV, QTDPARCELAS_TPV ' +
                                                         'FROM TIPO_VENDA ' +
                                                         'WHERE COD_TPV = :CODTPV';
                                              Parambyname('codtpv').AsInteger:= iCodTipoVenda;
                                              Open;
                                             // FrmVendasCaixa.SB.Panels[4].Text:= fieldbyname('nome_tpv').AsString;
                                              info3.Caption := 'Tipo venda : ' + fieldbyname('nome_tpv').AsString;
                                           end;
                                        dm.IBTransaction.Commit;
                                      except
                                        dm.IBTransaction.Rollback;
                                        showmessage('Erro ao buscar os dados do tipo de venda');
                                      end;
                                    finally
                                     dm.QConsulta.close;
                                    end;
                                 end;

                              if AbreVenda = 0 then
                                 VendeItensOrcamento;
                            end
                        else
                           begin
                              showmessage('Orçamento não encontrado');
                              EdtAuxVenda.SelectAll;
                              EdtAuxVenda.SetFocus;
                              { ALTERAÇÃO IMPORTACAO TXT }
                              if Assigned( ListaFormas ) then
                                 FreeAndNil( ListaFormas );
                           end;
                     end;
end;

procedure TFrmVendasCaixa.BuscaIndice;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaIndice do
      begin
         close;
         Parambyname('codcai').AsInteger:= iCaixa;
         parambyname('codemp').AsInteger:= iEmp;
         Parambyname('codgrp').AsInteger:= iCodGrupo;
         Open;
         if not QBuscaIndiceINDICE_ECF.IsNull then
            begin
               sIndice:= trim(QBuscaIndiceINDICE_ECF.AsString);
               dm.IBTransaction.Commit;
               QBuscaIndice.Close;
               if RegistraProduto = 0 then
                  GravaProduto
               else
                  begin
                     EdtCodBarra.Enabled:= true;
                     EdtCodBarra.SetFocus;
                     EdtCodBarra.SelectAll;
                  end;
            end
         else
            begin
               showmessage('Indice não Cadastrado');
               dm.IBTransaction.Commit;
               QBuscaIndice.Close;
               LimpaProduto;
            end;
      end;
end;

procedure TFrmVendasCaixa.BuscaProduto;
var bBalancaAcougue    : boolean;
    sAuxEtqBalanca     : string;
    sAuxCodigoBarras   : string;
    bProdutoEncontrado : boolean;
    bErroBalanca       : boolean;
    aPeso              : array[0..5]of char;
    cEstoque           : currency;
    iRetornoBalanca    : integer;
    caminho_foto       : String;
    JaFoiChines: Boolean;
label inicia;
begin

   if trim(EdtCodBarra.Text) = '' then
      exit;
   JaFoiChines := False;
   { Verifica se o produto vem da balança }
   Inicia:
   bBalancaAcougue   := false;
   bProdutoEncontrado:= false;

   if (Length(trim(EdtCodBarra.Text)) = 13) and (copy(trim(EdtCodBarra.Text), 1, 1) = '2') and JaFoiChines then
      begin
         bBalancaAcougue:= true;
         if iTipoBalanca = 0 then
            sAuxEtqBalanca := copy(trim(EdtCodBarra.Text), 8, 3) + ',' + copy(trim(EdtCodBarra.Text), 11, 2)
         else
            sAuxEtqBalanca := copy(trim(EdtCodBarra.Text), 8, 2) + ',' + copy(trim(EdtCodBarra.Text), 10, 3);
         sAuxCodigoBarras:= inttostr(strtoint(copy(trim(EdtCodBarra.Text), 2, iTamCodBalanca)));
         if ColocaZerosEnter then
             begin
                sAuxCodigoBarras := FormataStringD( sAuxCodigoBarras,
                     IntToStr( ColocaZerosNum ), '0' );
             end;
      end
   else
      begin
         bBalancaAcougue   := false;
         sAuxCodigoBarras  := trim(EdtCodBarra.Text);
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaProduto do
      begin
         { procura na tabela de produtos }
         close;
         sql.Clear;
         sql.Text:= sSqlProduto;
         Parambyname('codbar').AsString:= sAuxCodigoBarras;
         Open;

         if fieldbyname('cod_pro').IsNull then
            begin
               { nao achou na tabela de produtos, agora vou procurar na tabela de embalagens }
               bProdutoEncontrado:= false;
               dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               close;
               sql.Clear;
               sql.Text:= sSqlEmbalagem;
               Parambyname('codbar').AsString:= sAuxCodigoBarras;
               Open;
               if fieldbyname('cod_pro').IsNull then
                  begin
                     if (Length(trim(EdtCodBarra.Text)) = 13) and
                      (copy(trim(EdtCodBarra.Text), 1, 1) = '2') and ( not JaFoiChines ) then
                       begin
                          JaFoiChines := True;
                          goto inicia;
                       end
                     else
                        bProdutoEncontrado:= false
                  end
               else
                  begin
                     JaFoiChines:= True;
                     bProdutoEncontrado:= true;
                     cQuantEmbalagem:= fieldbyname('quant').AsCurrency;
                  end;
            end
         else
            begin
               bProdutoEncontrado:= true;
               cQuantEmbalagem   := 1;
            end;
         if bProdutoEncontrado and ProdutoComIMei then
            begin
               Application.CreateForm( TfrmIMEI, frmIMEI );
               frmIMEI.ShowModal;
               FreeAndNil(frmIMEI );
            end;
         if bProdutoEncontrado then
            begin
               { verifica se tem descrição (PAF-ECF) }
               if trim(fieldbyname('desc_cupom').AsString) = '' then
                  begin
                     showmessage('Produto sem Descrição');
                     dm.IBTransaction.Commit;
                     QBuscaProduto.Close;
                     EdtCodBarra.Enabled:= true;
                     EdtCodBarra.SetFocus;
                     EdtCodBarra.SelectAll;
                     exit;
                     abort;
                  end;

               if fieldbyname('promocao_pro').AsCurrency > fieldbyname('valor_pro').AsCurrency then
                  begin
                     showmessage('Preço Promocional maior que o Preço de Venda');
                     dm.IBTransaction.Commit;
                     QBuscaProduto.Close;
                     EdtCodBarra.Enabled:= true;
                     EdtCodBarra.SetFocus;
                     EdtCodBarra.SelectAll;
                     exit;
                     abort;
                  end;

               EdtQuant.Enabled := true;
               sDescricao       := trim(fieldbyname('DESC_CUPOM').AsString);
               sCodigoBarra     := trim(fieldbyname('CODIGO_BARRA_PRO').AsString);

               { MOSTRAR O NOME DO PRODUTO NO PANEL1 }
               PanelNomeProduto.Caption:= copy(sDescricao, 1, 34);

               if ((fieldbyname('VALOR_PRO').IsNull) or (fieldbyname('VALOR_PRO').AsCurrency = 0)) then
                  begin
                     showmessage('Produto sem Valor');
                     LimpaProduto;
                  end
               else
                  begin
                     iCodProduto:= fieldbyname('COD_PRO').AsInteger;

                     if iTabelaPreco = 0 then
                        begin
                           if fieldbyname('PROMOCAO_PRO').AsCurrency > 0 then
                              begin
                                 bPromocao             := true;
                                 cDescontoPromocao     := fieldbyname('VALOR_PRO').AsCurrency - fieldbyname('PROMOCAO_PRO').AsCurrency;
                                 cUnitario             := fieldbyname('VALOR_PRO').AsCurrency;
                                 EdtValorUnitario.Text := fieldbyname('VALOR_PRO').AsString;
                              end
                           else
                              begin
                                 bPromocao             := false;
                                 cDescontoPromocao     := 0;
                                 cUnitario             := fieldbyname('VALOR_PRO').AsCurrency;
                                 EdtValorUnitario.Text := fieldbyname('VALOR_PRO').AsString;
                              end;
                        end
                     else
                     if iTabelaPreco = 1 then
                        begin
                           bPromocao         := false;
                           cDescontoPromocao := 0;
                           if fieldbyname('PRECO_PRAZO_PRO').AsCurrency > 0 then
                              begin
                                 cUnitario             := fieldbyname('PRECO_PRAZO_PRO').AsCurrency;
                                 EdtValorUnitario.Text := fieldbyname('PRECO_PRAZO_PRO').AsString;
                              end
                           else
                              begin
                                 cUnitario             := fieldbyname('VALOR_PRO').AsCurrency;
                                 EdtValorUnitario.Text := fieldbyname('VALOR_PRO').AsString;
                              end;
                        end;

                     {tratar o produto vindo da balança do açougue}
                     if bBalancaAcougue then
                        begin
                           if iTipoBalanca = 0 then
                              EdtQuant.Text := FloatToStr( strtofloat(sAuxEtqBalanca) / (cUnitario ))//- cDescontoPromocao))
                           else
                              EdtQuant.Text :=  FloatToStr( strtofloat(sAuxEtqBalanca) );

                        end;

                     {tratar o produto pesado no caixa}
                     if (trim(FieldByName('produto_pesado_pro').AsString) = 'P')  and (iIndiceBalanca < 7) and (not bBalancaAcougue) then
                        begin
                           if strtocurr(EdtQuant.Text) <> 1 then
                              begin
                                 bBalancaLiberada:= false;
                                 Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
                                 FrmSenhaLiberaVenda.tag:= 3;
                                 FrmSenhaLiberaVenda.showmodal;
                                 if not bBalancaLiberada then
                                    begin
                                       EdtCodBarra.Enabled:= true;
                                       EdtCodBarra.SetFocus;
                                       exit;
                                    end;
                              end
                           else
                              begin
                                 bErroBalanca:= false;
                                 Application.CreateForm( TfrmBalanca, frmBalanca);
                                 frmBalanca.ShowModal;
                                 bErrobalanca := frmbalanca.ErroBalanca;
                                 edtQuant.Text := FloatTostr( frmBalanca.Quant );
                                 FreeAndNil( frmBalanca );
                                 if bErroBalanca and not ( strtocurr(edtquant.text) <= 0 ) then
                                    begin
                                       EdtQuant.Text:= '1';
                                       EdtCodBarra.Enabled:= true;
                                       EdtCodBarra.SetFocus;
                                       exit;
                                    end;
                                 if strtocurr(edtquant.text) <= 0 then
                                    begin
//                                       showmessage('Verifique a Balança');
                                       EdtQuant.Text:= '1';
                                       EdtCodBarra.Enabled:= true;
                                       EdtCodBarra.SetFocus;
                                       exit;
                                    end;
                              end;
                        end;

                     cQuantidade := (strtocurr(edtquant.Text) * cQuantEmbalagem);
                     cDesconto   := strtocurr(EdtDescontoItem.Text);
                     iCodGrupo   := fieldbyname('ICMS_CF_EST').AsInteger;
                     sUnidade    := copy(trim(fieldbyname('DESCRICAO').AsString), 1,2);
                     caminho_foto := trim ( fieldbyname( 'CAMINHO_FOTO_PRO').AsString);
                     Image.Picture.LoadFromFile( caminho_foto );
                     if cDesconto > 0 then
                        begin
                           if sTipoDesc = '$' then
                              EdtTotalItem.Text := currtostrf(((cQuantidade * cUnitario) - cDesconto), ffnumber, 2)
                           else
                              EdtTotalItem.Text := currtostrf((cQuantidade * cUnitario) - (((cQuantidade * cUnitario) * cDesconto) / 100), ffnumber, 2);
                        end
                     else
                        begin
                           EdtTotalItem.Text:= currtostrf(cQuantidade * cUnitario, ffnumber, 2);
                        end;

                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     QBuscaProduto.Close;

                     { verifica o estoque do produto }
                     if not bEstoqueNegativo then
                        begin
                           cEstoque:= dm.BuscaEstoqueProduto(iCodProduto, iEmp);
                           if (cEstoque - cQuantidade) < 0 then
                              begin
                                 showmessage('Verifique o estoque do produto');
                                 LimpaProduto;
                                 exit;
                                 abort;
                              end;
                        end;

                     BuscaIndice;
                  end;
            end
         else
            begin
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               QBuscaProduto.Close;
               LimpaProduto;
               Application.CreateForm(TFrmProdutoNaoCadastrado, FrmProdutoNaoCadastrado);
               TThread.Synchronize( nil,
                  procedure
                     begin
                        FrmProdutoNaoCadastrado.showmodal;
                     end
                  );
            end;
      end;
end;

function TFrmVendasCaixa.AbreVenda : integer;
var sAuxCupom, sAuxCCF : string;
  HoraECFT: TTime;
  Tolerancia: TTime;
begin

   { verifica o numero de serie da ecf }
   if not VerificaNumeroSerie then
      begin
         //showmessage('Número de Série da ECF não Confere');
         close;
         exit;
         abort;
      end;

   { verifica o GT da ECF }
   if not VerificaGT then
      begin
         //showmessage('Totalizador Geral do ECF não confere');
         close;
         exit;
         abort;
      end;

   if (not iCodPreVenda > 0) and (not iCodOrcamento > 0) and (not iCodOrdemServico > 0) then
      begin
         {verifica se inicia com formas de pagamento}
         if bIniciarFormas then
            begin
               Application.CreateForm(TFrmFormasPagamento, FrmFormasPagamento);
               FrmFormasPagamento.ShowModal;

            end;
      end;
    DM.ECF.NaoFiscalImprime := False;
   { ABRE CUPOM FISCAL }
   if FrmPadraoPafECf.SelCli.Checked then
      begin
          Application.CreateForm(TFrmDadosClienteECF, FrmDadosClienteECF);
          FrmDadosClienteECF.showmodal;
          info2.Caption := 'Cliente : ' + sNomeCliente;
      end
   else
   begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   if sNomeCliente = '' then
     begin
     try
     try
       with QCliente do
          begin
             close;
             Parambyname('cod').AsInteger:= iCodCliente;
             open;

             sNomeCliente := fieldbyname('nome_cli').AsString;
             sEndCliente  := fieldbyname('endres_cli').AsString + ' - ' + fieldbyname('cidres_cli').AsString + '- ' + fieldbyname('estres_cli').AsString;
             sDocCliente:= fieldbyname('cnpj_cli').AsString;
             if Trim( sDocCliente) = '' then
                begin
                   sDocCliente := '999.999.999-99';
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados do cliente');
     end;
   finally
     QCliente.Close;
   end;
   end;
   end;
   if ( ( dm.ECF.Estado = estVenda ) or ( dm.ECF.Estado = estPagamento ) ) and ( iCodigoVenda = 0)  then
      begin
        dm.ECF.CancelaCupom;
      end;

   if AbreCupom(iECF) = 0 then
      begin
         sAuxCupom:= NumeroCupom(iECF);

         try
           iCOOVenda:= strtoint(sAuxCupom);
         except
           iCOOVenda:= 0;
         end;

         sAuxCCF:= ContadorCupomFiscal(iECF);
         try
           iCCFVenda:= strtoint(sAuxCCF);
         except
           iCCFVenda:= 0;
         end;

         { GRAVANDO A VENDA }
         bFechaForm:= false;
         iCodigoVenda:= GravaVenda(iCOOVenda, iCCFVenda, iCERMesa, iCodCliente, iCodVendedor, iCodTipoVenda, 0);
         if ( iCodOrcamento > 0 ) and ( iCodigoVenda > 0 ) then
            begin
               AtualizaAuxVendaOrc( iCodigoVenda, iCodOrcamento );
            end;
         if iCodigoVenda > 0 then
            begin
                result:= 0;
                MemoItens.Lines.Add( '                C U P O M  F I S C A L' );
                MemoItens.Lines.Add('');
                MemoItens.Lines.Add( 'ITEM CÓDIGO            DESCRIÇÃO' );
                MemoItens.Lines.Add( 'QTD.  UND.   VL.UNIT(  R$)      ST      VL.ITEM(  R$)' );
                MemoItens.Lines.Add( '------------------------------------------------------' );
                PagamentoEfetuado := False;
            end
         else
            result:= 1;
          cTefAutorizado := 0;
         cTotalVenda:= 0;
         cTotalPago := 0;
         PagVirtual := false;
         IniciaPagamentos;
         cTotalDescontos := 0;
        // sb.Panels[1].Text:=  inttostr(iCodigoVenda);
         info1.Caption := 'Venda : ' + IntToStr(iCodigoVenda);
      end
   else
      result:= 1;
end;

procedure TFrmVendasCaixa.LimpaProduto;
begin
   SelP := False;
   SelQ := False;
   ProdutoComIMei := False;
   IMEIPRod := '';
   EdtQuant.Text:= '1';
   EdtValorUnitario.Clear;
   EdtDescontoItem.Clear;
   EdtTotalItem.Clear;

   edtquant.ReadOnly := true;
   edtquant.TabStop  := false;

   EdtDescontoItem.ReadOnly := true;
   EdtDescontoItem.TabStop  := false;
   EdtCodBarra.Enabled      := true;
   bBalancaLiberada         := false;
   EdtCodBarra.Clear;
   EdtCodBarra.SetFocus;
end;

procedure TFrmVendasCaixa.FormShow(Sender: TObject);
var
  Fundo: String;
  TavaNaoIMprimir: Boolean;
begin
   TavaNaoIMprimir :=  dm.ECF.NaoFiscalImprime;
   NumeroNF := 0;
   lblNotaManual.Visible := ( dm.ACBrAAC1.IdentPAF.Paf.EmitePED = false );
  ImpressoraCanCupom := False;
//   if FileExists( dm.FundoCaixa ) then
  //    imgFundo.Picture.LoadFromFile( dm.FundoCaixa );
   MemoItens.Color := dm.Buscacor( dm.FundoCaixa,  MemoItens.Left, MemoItens.Top);
   EdtCodBarra.Color := dm.Buscacor( dm.FundoCaixa, EdtCodBarra.Left, EdtCodBarra.Top);
   EdtQuant.Color := dm.Buscacor( dm.FundoCaixa, EdtQuant.Left, EdtQuant.Top);
   EdtDescontoItem.Color := dm.Buscacor( dm.FundoCaixa, EdtDescontoItem.Left, EdtDescontoItem.Top);
   EdtValorUnitario.Color := dm.Buscacor( dm.FundoCaixa, EdtValorUnitario.Left, EdtValorUnitario.Top);
   EdtTotalItem.Color := dm.Buscacor( dm.FundoCaixa, EdtTotalItem.Left, EdtTotalItem.Top);
    EdtTotalVenda.Color := dm.Buscacor( dm.FundoCaixa, EdtTotalVenda.Left, EdtTotalVenda.Top);

   HoraData.Caption := FormatdateTime( 'dd/mm/yy', Date ) + '       ' + FormatdateTime( 'hh:mm:ss', Time );
   MenGerente.Caption := '';

   Caixa.Caption := formatfloat( '000', iCaixa );
   { VERIFICA O NÚMERO DE SERIE DA ECF }
   if not VerificaNumeroSerie then
      begin
         //showmessage('Número de Série da ECF não confere');
         Application.Terminate;
      end;

   { verifica o GT da ECF }
   if not VerificaGT then
      begin
         //showmessage('Totalizador Geral do ECF não confere');
         Application.Terminate;
      end;

   BuscaParametros;
   LimpaNovaVenda;
   BuscaVendaAberta;

   { Emite Cupom Fisca ref. Mesa }
   if (FrmVendasCaixa.Tag = 1) and (iCodigoVenda = 0) and (iCodMesa > 0) then
       begin
          DM.ECF.NaoFiscalImprime := TavaNaoIMprimir;
          Application.ProcessMessages;
          if AbreVenda = 0 then
             begin
                 Application.ProcessMessages;
                 VendeItensContaCliente(iCodMesa);
             end;
       end
   else
      iCERMesa:= 0;

   if ( FrmVendasCaixa.Tag = 3 ) and ( iCodigoVenda = 0 ) then
       begin
          DM.ECF.NaoFiscalImprime := TavaNaoIMprimir;
          Application.ProcessMessages;
          VendeItensSelecaoContaCliente;
       end;

   Mensagens2.Open;
   Mensagens2.First;

   Mensagens.CreateDataSet;
   Mensagens.Open;
   Mensagens.EmptyDataSet;

   while not Mensagens2.Eof do
      begin
         Mensagens.Insert;
         MensagensMENSAGEN.AsString := Mensagens2MENSAGEN.AsString;
         Mensagens.Post;
         Mensagens2.Next;
      end;
   Mensagens.First;


   sMensagen := '   > ' +MensagensMensagen.AsString + ' <     ';
   Mengerente.Caption := sMensagen;
   Recadogerente.Enabled := True;
   TROCA_MEN.Enabled := true;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoCaixa, dm.ImgTempCia );
   imgFundo.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;
   TrataArquivoParametro;
end;

procedure TFrmVendasCaixa.EdtCodBarraKeyDown(Sender: TObject;
var Key: Word; Shift: TShiftState);
var
   Letra: Char;
   L1, L2: Char;
begin
   if key = vk_return then
      begin
         if trim(EdtCodBarra.Text) = '' then
            begin
               EdtCodBarra.Enabled:= true;
               EdtCodBarra.SetFocus;
               exit;
            end;
         L1 :=  UpCase(  EdtCodBarra.Text[1] );
         if Length( EdtCodBarra.Text ) > 1  then
            L2 := UpCase( EdtCodBarra.Text[2] );
         if L1 = 'P' then
            SelP := True;
         if L1 = 'Q' then
            SelQ := True;
         if L2 = 'Q' then
            SelQ := True;
         EdtCodBarra.Text := StringReplace( EdtCodBarra.Text, 'P', '', [ rfReplaceAll, rfIgnoreCase ] );
         EdtCodBarra.Text := StringReplace( EdtCodBarra.Text, 'Q', '', [ rfReplaceAll, rfIgnoreCase ] );
         // Mostra PQ sempre
         if PQSempre then
            begin
               SelP := True;
               SelQ := True;
            end;
         { desabilito o codigo de barras }
         EdtCodBarra.Enabled:= false;
         if ColocaZerosEnter then
             begin
                EdtCodBarra.Text := FormataStringD( EdtCodBarra.Text,
                     IntToStr( ColocaZerosNum ), '0' );
             end;

         { VERIFICA SE NAO ULTRAPASSOU O SALDO DO CLIENTE }
         if bContLimiteCliente then
            begin
               if (iCodCliente > 0) and (cSaldoCliente <= cTotalVenda) and (not bVendaLiberada) then
                  begin
                     EdtCodBarra.Enabled:= true;
                     EdtCodBarra.Clear;
                     Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
                     FrmSenhaLiberaVenda.tag:= 0;
                     FrmSenhaLiberaVenda.showmodal;
                     if not bVendaLiberada then
                        exit;
                  end;
            end;

         if (iCodigoVenda = 0) and (strtocurr(EdtTotalVenda.text) = 0) then
            begin
               if AbreVenda = 0 then
                  BuscaProduto
               else
                  begin
                     EdtCodBarra.Enabled:= true;
                     EdtCodBarra.SetFocus;
                  end;
            end
         else
            BuscaProduto;
      end
   else
      if key = vk_f2 then
         begin
            if bConsultarProduto then
               begin
                  Application.CreateForm(TFrmConsProd, FrmConsProd);
                  FrmConsProd.Tag:= 0;
                  FrmConsProd.showmodal;
               end;
         end
         else
            begin
                 Letra := UpCase( Chr( key ) );
                 if CharInSet( Letra , ['A'..'Z'] ) then
                    begin
                        if dm.VerificaTecla( chr( Key ) ) then
                           begin
                               Application.CreateForm( TfrmGrupoTeclas, frmGrupoTeclas );
                               frmGrupoTeclas.Tecla := UpCase( chr( Key ) );
                               if frmGrupoTeclas.ShowModal = mrOk then
                                  begin
                                     InsereItensGrupo( frmGrupoTeclas );
                                  end;
                               FreeAndNil( frmGrupoTeclas );
                           end;
                          Key := 0;
                    end
                 else

            end;
end;

procedure TFrmVendasCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Tela: THandle;
begin
   if ( ssCtrl in Shift ) and (  Chr(Key ) in [ 'C', 'c' ] ) then // IINFORMA CLIENTE
       begin
          Application.CreateForm(TFrmDadosClienteECF, FrmDadosClienteECF);
          FrmDadosClienteECF.showmodal;
          info2.Caption := 'Cliente : ' + sNomeCliente;
       end;

   if (ssCtrl in Shift) and (chr(Key) in ['G', 'g']) then // ABREGAVETA
      begin
         AbreGaveta(iECF, IGaveta);
      end;

   if (ssAlt in Shift) and (chr(Key) in ['P', 'p']) then  // ABRE BALCAO
       begin
          if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
             begin
                 ShellExecute(handle,'open',
                 PChar(ExtractFilePath( Application.ExeName) + 'SLBalcao.exe' ),
                 PChar( sNomeUsuario + ' ' +
                 dm.RetornaStringTabela( 'SENHA_USU', 'USUARIO', 'COD_USU',  ICodUsu ) +
                  ' ' + IntToStr( iEMp )
                  ),'',SW_SHOWNORMAL);
             end;
       end;

   if (ssAlt in Shift) and (chr(Key) in ['N', 'n']) then  // NotaFiscal
       begin
          if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
             begin
                 ShellExecute(handle,'open',
                 PChar(ExtractFilePath( Application.ExeName) + 'SLNFe.exe' ),
                 PChar( sNomeUsuario + ' ' +
                 dm.RetornaStringTabela( 'SENHA_USU', 'USUARIO', 'COD_USU',  ICodUsu ) +
                  ' ' + IntToStr( iEMp )
                  ),'',SW_SHOWNORMAL);
             end;
       end;

   if ( ssCtrl in Shift ) and (chr(Key) in ['M', 'm']) then   // IMEI
      begin
         ProdutoComIMei := not ProdutoComIMei;
      end;

   if ( ssCtrl in Shift ) and (chr(Key) in ['N', 'n']) and ( dm.ACBrAAC1.IdentPAF.Paf.EmitePED = false ) then // Nota Comcomitante
       begin
          Application.CreateForm( TfrmNotaFiscalComcomitante, frmNotaFiscalComcomitante);
          frmNotaFiscalComcomitante.ShowModal;
          FreeAndNil( frmNotaFiscalComcomitante );
          if NumeroNF > 0 then
             begin
                AbreVenda;

             end;

       end;



   if (ssAlt in Shift) and (chr(Key) in ['H', 'h']) then  // CHEQUES
      begin
         if bOFF then
            begin
               try
                 dm.IBDatabaseServer.Connected    := false;
;
;
                 dm.IBDatabaseServer.Connected    := true;
               except
                 dm.IBDatabaseServer.Connected    := false;
                 showmessage('Servidor Inativo');
                 exit;
                 abort;
               end;
            end;

         Application.CreateForm(TFrmConsCheque, FrmConsCheque);
         FrmConsCheque.ShowModal;
      end;

   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then   // MENU FISCAL
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;

   if (ssCtrl in Shift) and (chr(Key) in ['P', 'p']) then  // pre venda
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               PanelAuxVenda.Visible:= true;
               LabelAuxVenda.Caption:= 'Senha Pré Venda';
               EdtAuxVenda.Tag:= 0;
               EdtAuxVenda.Clear;
               EdtAuxVenda.SetFocus;
            end
         else
            begin
               showmessage('Venda Aberta!');
            end;
      end;

  if (ssCtrl in Shift) and (chr(Key) in ['O', 'o']) then  // Orçamento
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               PanelAuxVenda.Visible:= true;
               LabelAuxVenda.Caption:= 'Número do Orçamento';
               EdtAuxVenda.Tag:= 1;
               EdtAuxVenda.Clear;
               EdtAuxVenda.SetFocus;
            end
         else
            begin
               showmessage('Venda Aberta!');
            end;
      end;

   if (ssCtrl in Shift) and (chr(Key) in ['D', 'd']) then  // Imprime DAV
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
                 Application.CreateForm( TFrmConsOrcamento,FrmConsOrcamento );
                 FrmConsOrcamento.ShowModal;
            end
         else
            begin
               showmessage('Venda Aberta!');
            end;
      end;

   if (ssCtrl in Shift) and (chr(Key) in ['I', 'i']) and ( dm.PastaArqVends <> '' ) then // VENDAS SIG
      begin
          if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
              begin
                  Application.CreateForm( TfrmImportaVenda, frmImportaVenda );
                  frmImportaVenda.ShowModal;
              end
           else
              ShowMessage('Venda Aberta' );
      end;


   if (ssAlt in Shift) and (chr(Key) in ['V', 'v']) then   //Vendedor
      begin
             if (not (iCodigoVenda = 0)) or ( not (cTotalVenda = 0)) then
                ShowMessage( 'Venda aberta' )
             else
                begin
                   Application.CreateForm(TFrmSelvend, FrmSelvend);
                   FrmSelvend.cod_vendi := iCodVend;
                   FrmSelvend.ShowModal;
                   if iCodVend > 0 then
                   begin
                     iCodVendedor := iCodVend;
                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     dm.IBTransaction.StartTransaction;
                     dm.QConsulta.Close;
                     dm.QConsulta.SQL.Text := 'select * from vendedor where cod_vend=' + inttostr( iCodVend );
                     dm.QConsulta.Open;
                     iCodVendedor := iCodVend;
                     Atendido.Caption := 'Atendido por : ' + #13 +
                      dm.QConsulta.FieldByName( 'NOME_VEND' ).AsString;
                     dm.QConsulta.Close;
                     dm.IBTransaction.Commit;
                   end;
                end;
       end;


   case key of
   vk_f1: begin
             if iCodigoVenda > 0 then
                begin
                   ShowMessage( 'Venda aberta' );
                   Exit;
                end;
             Tag := 4;
             Close;
          end;
   vk_f3: begin
             if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) then
                begin
                   StringGrid.Cells[0, 0]:= 'PRE VENDA  [Ctrl + P]' ;
                   StringGrid.Cells[0, 1]:= 'ORÇAMENTO  [Ctrl + O] ';
                   StringGrid.Cells[0, 2]:= 'IMPRIMIR DAV  [Ctrl + D]';
                   StringGrid.Visible:= true;
                   StringGrid.SetFocus;
                end
             else
                showmessage('Venda Aberta');
          end;
   vk_f5: begin
             if (iCodigoVenda = 0) or (cTotalVenda = 0) then
                exit;

             Application.CreateForm(TFrmFechaVenda, FrmFechaVenda);
             PanelNomeProduto.Caption:= 'FECHA VENDA';

             if bDescVenda then
                FrmFechaVenda.PanelDescontos( false )
             else
                FrmFechaVenda.PanelDescontos( true );

             FrmFechaVenda.showmodal;
             FrmFechaVenda.Release;
             FrmFechaVenda := nil;
          end;
   vk_f6: begin
             edtquant.ReadOnly:= false;
             edtquant.TabStop := true;
             edtquant.SetFocus;
          end;
   vk_f7: begin
             if bDescItem then
                begin
                   sTipoDesc:= '%';
                   DescSimb.Caption := '%';
                   EdtDescontoItem.ReadOnly := false;
                   EdtDescontoItem.TabStop  := true;
                   EdtDescontoItem.SetFocus;
                end;
          end;
   vk_f8: begin
             if bDescItem then
                begin
                   sTipoDesc:= '$';
                   DescSimb.Caption := 'R$';                   
                   EdtDescontoItem.ReadOnly := false;
                   EdtDescontoItem.TabStop  := true;
                   EdtDescontoItem.SetFocus;
                end;
          end;
   vk_f9: begin
             if iCodigoVenda = 0 then
                begin
                   showmessage('Venda não Aberta');
                   exit;
                end;

             if IBTRVenda.Active then
                IBTRVenda.Commit;
             IBTRVenda.StartTransaction;
             with QBuscaItens do
                begin
                   close;
                   Parambyname('codven').AsInteger:= iCodigoVenda;
                   Open;
                   Last;
                   if recordcount > 1 then
                      begin
                         ibtrvenda.Commit;
                         QBuscaItens.Close;
                         PanelNomeProduto.Caption:= 'CANCELANDO ITEM';
                         Application.CreateForm(TFrmCancelaItem, FrmCancelaItem);
                         FrmCancelaItem.showmodal;
                      end
                   else
                     if recordcount = 0 then
                        begin
                           ibtrvenda.Commit;
                           QBuscaItens.Close;
                           showmessage('Nenhum Item Vendido');
                        end
                     else
                        if recordcount = 1 then
                           begin
                              ibtrvenda.Commit;
                              QBuscaItens.Close;
                              showmessage('Venda com 1 Item, tem que cancelar a venda');
                           end;
                end;
          end;
   vk_f10:begin
             if iCodigoVenda > 0 then
                begin
                   if Application.MessageBox('Confirma cancelamento da venda?', 'Cancelar', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
                      begin
                         PanelNomeProduto.Caption:= 'CANCELANDO VENDA';
                         Application.CreateForm(TFrmSenhaExcVenda, FrmSenhaExcVenda);
                         FrmSenhaExcVenda.showmodal;
                      end;
                end;
          end;
   vk_f11:begin
             { verificando se o servidor esta ativo }
             if bOFF then
                begin
                   try
                     dm.IBDatabaseServer.Connected    := false;
;
;
                     dm.IBDatabaseServer.Connected    := true;
                   except
                     dm.IBDatabaseServer.Connected    := false;
                     showmessage('Servidor Inativo');
                     exit;
                     abort;
                   end;
                end;

             FrmDadosCliente.panel3.Visible:= false;
             if ( ( DM.PW + DM.PH )/ 2) < 90 then
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
             else
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( DM.PW + DM.PH )/ 2) ) /100);
             FrmDadosCliente.Position:= poDesktopCenter;
             FrmDadosCliente.Tag:= 0;
             FrmDadosCliente.showmodal;
          end;
   vk_f12:begin
             Application.CreateForm(TFrmFormasPagamento, FrmFormasPagamento);
             FrmFormasPagamento.ShowModal;
          end;
   VK_F4: begin // chama não fiscal
               Tela := FindWindow( nil, 'Vendas Fiscal');
               if Tela <> 0 then
                  begin
                      ForceForegroundWindow( Tela );
                  end;
          end;

   end;
end;

procedure TFrmVendasCaixa.FormPaint(Sender: TObject);
begin
//   FrmVendasCaixa.DoubleBuffered := true;
  // Panel98.Brush.Style := bsClear;
end;

procedure TFrmVendasCaixa.EdtQuant1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then
      begin
         if strtocurr(edtquant.Text) <= 0 then
            begin
               showmessage('Digite a Quantidade');
               exit;
               abort;
            end
         else
            begin
               if cQuantMaxima > 0 then
                  begin
                     if StrToCurr(EdtQuant.Text) > cQuantMaxima then
                        begin
                           showmessage('A Quant.digitada ultrapassou a quantidade máxima');
                           exit;
                        end;
                  end;
               EdtCodBarra.SetFocus;
               edtquant.ReadOnly := true;
               edtquant.TabStop  := false;
            end;
      end;
end;

procedure TFrmVendasCaixa.EdtDescontoItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then
      begin
         if strtocurr(EdtDescontoItem.Text) < 0 then
            begin
               showmessage('Desconto não pode ser negativo');
               EdtDescontoItem.Text:= '0';
               EdtDescontoItem.SetFocus;
               exit;
               abort;
            end;
         EdtCodBarra.SetFocus;
         EdtDescontoItem.ReadOnly:= true;
         EdtDescontoItem.TabStop:= false;
      end;
end;

procedure TFrmVendasCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:= bFechaForm;
   if not bFechaForm then
      showmessage('Venda Aberta');
end;

procedure TFrmVendasCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   if Tag = 0 then
      Application.Terminate;
   Action:= caFree;

   Self := nil;

end;

procedure TFrmVendasCaixa.FormCreate(Sender: TObject);
var sVersaoDLL : string;
begin
 dm.ScaleForm( Self, True );
   FrmVendasCaixa.DoubleBuffered := True;
   sSqlProduto:=   'SELECT P.COD_PRO, P.DESC_CUPOM, P.PROMOCAO_PRO, P.VALOR_PRO, P.CAMINHO_FOTO_PRO,                 ' +
                   'P.ICMS_CF_EST, P.PRODUTO_PESADO_PRO, P.PRECO_PRAZO_PRO, P.CODIGO_BARRA_PRO,  ' +
                   'U.DESCRICAO ' +
                   'FROM PRODUTO P ' +
                   'INNER JOIN UNIDADE_MEDIDA U ' +
                   'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                   'WHERE P.CODIGO_BARRA_PRO = :CODBAR';

   sSqlEmbalagem:= 'SELECT E.COD_PRO, E.QUANT, P.DESC_CUPOM, P.PROMOCAO_PRO, P.VALOR_PRO,P.CAMINHO_FOTO_PRO,        ' +
                   'P.ICMS_CF_EST, P.PRODUTO_PESADO_PRO, P.PRECO_PRAZO_PRO, ' +
                   'P.CODIGO_BARRA_PRO, U.DESCRICAO  ' +
                   'FROM PRODUTO_EMBALAGENS E  ' +
                   'INNER JOIN PRODUTO P       ' +
                   'ON (E.COD_PRO = P.COD_PRO) ' +
                   'INNER JOIN UNIDADE_MEDIDA U ' +
                   'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                   'WHERE E.CODIGO_BARRA = :CODBAR';

   bContLimiteCliente:= true;
   sNomeUsuario:= dm.RetornaStringTabela('nome_usu', 'usuario', 'cod_usu', ICodUsu);
   sVersaoDLL  := VersaoDLL(iECF);
{   Caption:= 'Vendas          Operador: ' + sNomeUsuario     +
              '    Checkout: '            + inttostr(iCaixa) +
              '     v.3.50         '      +
              'Versão DLL: ' + sVersaoDLL;}

 //  sb.Panels[5].Text := datetostr(date);

   { BUSCA A IMAGEM DA EMPRESA }
   sCaminhoFotoEmp:= dm.RetornaStringTabela('caminho_foto_emp', 'empresa', 'cod_emp', iEmp);

   { CASAS DECIMAIS DO CAIXA / VERIFICA SE IMPRIME COMPROVANTE NAO FISCAL }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT CASAS_DECIMAIS, IMPRIMIR_COMPROVANTE_ECF ' +
                     'FROM CAIXA ' +
                     'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('CODCAI').AsInteger := iCaixa;
             Parambyname('CODEMP').AsInteger := iEmp;
             Open;
             if trim(fieldbyname('imprimir_comprovante_ecf').AsString) = 'S' then
                bImprimeCupomNaoFiscal:= true
             else
                bImprimeCupomNaoFiscal:= false;

             ICasasDecimaisQuant := fieldbyname('casas_decimais').AsInteger;
             if ICasasDecimaisQuant = 2 then
                begin
                   EdtQuant.DisplayFormat:= ',#0.00';
                   edtquant.DecimalPlaces:= 2;
                end
             else
                if ICasasDecimaisQuant = 3 then
                   begin
                      EdtQuant.DisplayFormat:= ',#0.000';
                      EdtQuant.DecimalPlaces:= 3;
                   end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar casas decimais');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { Verifica caixa aberto e ecf ativa }
   {if not VerificaCaixaAbertoeECFAtiva then
      begin
         Application.Terminate;
      end;}
end;

procedure TFrmVendasCaixa.Timer1Timer(Sender: TObject);
begin
  // sb.Panels[6].Text:= timetostr(time);
   HoraData.Caption := FormatdateTime( 'dd/mm/yy', Date ) + '       ' + FormatdateTime( 'hh:mm:ss', Time );

end;

procedure TFrmVendasCaixa.TrataArquivoParametro;
begin
   if ( PArquivoVenda <> '' ) and FileExists( PArquivoVenda ) then
      begin
          Application.CreateForm( TfrmImportaVenda, frmImportaVenda );
          frmImportaVenda.AbrirArquviCaminho( PArquivoVenda );
          FreeAndNil( frmImportaVenda );
          PArquivoVenda := '';
      end
   else
      PArquivoVenda := '';
end;

procedure TFrmVendasCaixa.TROCA_MENTimer(Sender: TObject);
begin
   RecadoGerente.Enabled := False;
   if Mensagens.Eof then
      begin
         Mensagens.First;
         sMensagen := '   > ' +MensagensMensagen.AsString + ' <     ';
         Mengerente.Caption := sMensagen;
      end
   else
      begin
         Mensagens.Next;
         sMensagen := '   > ' +MensagensMensagen.AsString + ' <     ';
         Mengerente.Caption := sMensagen;
      end;
   RecadoGerente.Enabled := true;

end;

procedure TFrmVendasCaixa.EdtAuxVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then
       begin
          case EdtAuxVenda.Tag of
            0: begin
                  if trim(EdtAuxVenda.Text) = '' then
                     begin
                        exit;
                        abort;
                     end
                  else
                     begin
                        iCodPreVenda:= BuscaCodigoPreVenda(Trim(EdtAuxVenda.Text));
                        if iCodPreVenda > 0 then
                           begin
                              if iCodCliente > 0 then
                                 begin
                                    //.SB.Panels[3].Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                    FrmvendasCaixa.info2.Caption := 'Cliente : ' + dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                 end;

                              if iCodTipoVenda > 0 then
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
                                              sql.Text:= 'SELECT COD_TPV, NOME_TPV, QTDPARCELAS_TPV ' +
                                                         'FROM TIPO_VENDA ' +
                                                         'WHERE COD_TPV = :CODTPV';
                                              Parambyname('codtpv').AsInteger:= iCodTipoVenda;
                                              Open;
                                             // FrmVendasCaixa.SB.Panels[4].Text:= fieldbyname('nome_tpv').AsString;
                                              info3.Caption := 'Tipo venda : ' + fieldbyname('nome_tpv').AsString;
                                           end;
                                        dm.IBTransaction.Commit;
                                      except
                                        dm.IBTransaction.Rollback;
                                        showmessage('Erro ao buscar os dados do tipo de venda');
                                      end;
                                    finally
                                      dm.QConsulta.close;
                                    end;
                                 end;

                              if AbreVenda = 0 then
                                 VendeItensPreVenda;
                           end
                        else
                           begin
                              showmessage('pré-venda não encontrada');
                              EdtAuxVenda.SelectAll;
                              EdtAuxVenda.SetFocus;
                           end;
                     end;
               end;
            1: begin
                  if trim(EdtAuxVenda.Text) = '' then
                     begin
                        exit;
                        abort;
                     end
                  else
                     begin
                        iCodOrcamento:= BuscaCodigoOrcamento(strtoint(Trim(EdtAuxVenda.Text)));
                        if iCodOrcamento > 0 then
                           begin
                              if iCodCliente > 0 then
                                begin
                              //   FrmVendasCaixa.SB.Panels[3].Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                 FrmVendasCaixa.info2.Caption := 'Cliente : ' + dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                end;

                              if iCodTipoVenda > 0 then
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
                                              sql.Text:= 'SELECT COD_TPV, NOME_TPV, QTDPARCELAS_TPV ' +
                                                         'FROM TIPO_VENDA ' +
                                                         'WHERE COD_TPV = :CODTPV';
                                              Parambyname('codtpv').AsInteger:= iCodTipoVenda;
                                              Open;
                                            //  FrmVendasCaixa.SB.Panels[4].Text:= fieldbyname('nome_tpv').AsString;
                                              info3.Caption := 'Tipo venda : ' + fieldbyname('nome_tpv').AsString;
                                           end;
                                        dm.IBTransaction.Commit;
                                      except
                                        dm.IBTransaction.Rollback;
                                        showmessage('Erro ao buscar os dados do tipo de venda');
                                      end;
                                    finally
                                     dm.QConsulta.close;
                                    end;
                                 end;

                              if AbreVenda = 0 then
                                 VendeItensOrcamento;
                            end
                        else
                           begin
                              showmessage('Orçamento não encontrado');
                              EdtAuxVenda.SelectAll;
                              EdtAuxVenda.SetFocus;
                           end;
                     end;
               end;
            2: begin
{                  if trim(EdtAuxVenda.Text) = '' then
                     begin
                        exit;
                        abort;
                     end
                  else
                     begin
                        iCodOrdemServico:= BuscaCodigoOrdemServico(strtoint(Trim(EdtAuxVenda.Text)));
                        if iCodOrdemServico > 0 then
                           begin
                              if iCodCliente > 0 then
                                 begin
                                   FrmVendasCaixa.SB.Panels[3].Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                   FrmvendasCaixa.info2.Caption := 'Cliente : ' + dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', iCodCliente);
                                 end;

                              if iCodTipoVenda > 0 then
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
                                              sql.Text:= 'SELECT COD_TPV, NOME_TPV, QTDPARCELAS_TPV ' +
                                                         'FROM TIPO_VENDA ' +
                                                         'WHERE COD_TPV = :CODTPV';
                                              Parambyname('codtpv').AsInteger:= iCodTipoVenda;
                                              Open;
                                              FrmVendasCaixa.SB.Panels[4].Text:= fieldbyname('nome_tpv').AsString;
                                              info3.Caption := 'Tipo venda : ' + fieldbyname('nome_tpv').AsString;

                                           end;
                                        dm.IBTransaction.Commit;
                                      except
                                        dm.IBTransaction.Rollback;
                                        showmessage('Erro ao buscar os dados do tipo de venda');
                                      end;
                                    finally
                                     dm.QConsulta.close;
                                    end;
                                 end;

                              if AbreVenda = 0 then
                                 VendeItensOrdemServico;
                            end
                        else
                           begin
                              showmessage('OS não encontrada ou Fechada');
                              EdtAuxVenda.SelectAll;
                              EdtAuxVenda.SetFocus;
                           end;
                     end;      }
               end;
            3: begin
                {  if trim(EdtAuxVenda.Text) = '' then
                     begin
                        exit;
                        abort;
                     end
                  else
                     begin
                        iCodContaCliente:= BuscaCodigoContaCliente(strtoint(Trim(EdtAuxVenda.Text)));
                        if iCodContaCliente > 0 then
                           begin
                              if AbreVenda = 0 then
                                 VendeItensContaCliente(iCodContaCliente);
                            end
                        else
                           begin
                              showmessage('Conta do Cliente não encontrada ou Fechada');
                              EdtAuxVenda.SelectAll;
                              EdtAuxVenda.SetFocus;
                           end;
                     end;   }
               end;
          end;
       end
    else
       if key = vk_escape then
          begin
             EdtCodBarra.SetFocus;
             PanelAuxVenda.Visible:= false;
          end;
end;

function TFrmVendasCaixa.BuscaCodigoPreVenda(const sSenha : string) : integer;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT P.COD_PRE, P.SEQUENCIA_PAF, P.COD_CLI, P.COD_TPV, ' +
                        'P.COD_VEND, P.DESCONTO_PRE, T.QTDPARCELAS_TPV  ' +
                        'FROM PRE_VENDA P ' +
                        'INNER JOIN TIPO_VENDA T ' +
                        'ON (P.COD_TPV = T.COD_TPV) ' +
                        'WHERE P.SENHA_FECHAR_VENDA = :SENHA AND P.STATUS_PRE = 0';
             Parambyname('senha').AsString:= sSenha;
             Open;
             if not (fieldbyname('cod_pre').IsNull) then
                begin
                   iCodCliente        := fieldbyname('cod_cli').AsInteger;
                   iCodTipoVenda      := fieldbyname('cod_tpv').AsInteger;
                   iSequenciaPreVenda := fieldbyname('sequencia_paf').AsInteger;
                   iCodVendedor       := fieldbyname('cod_vend').AsInteger;
                   cDescPreVenda      := fieldbyname('desconto_pre').AsCurrency;
                   if fieldbyname('qtdparcelas_tpv').AsInteger > 0 then
                      iFormaPagamento:= dm.BuscaFormaPagamento('PR')
                   else
                      iFormaPagamento:= dm.BuscaFormaPagamento('DN');
                   result:= fieldbyname('cod_pre').AsInteger;
                end
             else
                result:= 0;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       result:= 0;
       showmessage('Erro ao buscar o código da pré-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

function TFrmVendasCaixa.BuscaCodigoOrcamento(const iSequencia : integer) : integer;
begin
   if TROrcamento.Active then
      TROrcamento.Commit;
   TROrcamento.StartTransaction;
   try
     try
       with IBAuxOrc do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT O.CODIGO, O.SEQUENCIA_DAV, O.COO, O.COD_CLI, O.COD_TPV, ' +
                        'O.COD_VEND, T.QTDPARCELAS_TPV  ' +
                        'FROM ORCAMENTO O ' +
                        'INNER JOIN TIPO_VENDA T ' +
                        'ON (O.COD_TPV = T.COD_TPV) ' +
                        'WHERE O.SEQUENCIA_DAV = :SEQ AND ( O.STATUS = 0 OR O.STATUS = 3 )';
             Parambyname('SEQ').AsInteger:= iSequencia;
             Open;
             if not (fieldbyname('codigo').IsNull) then
                begin
                   iCodCliente        := fieldbyname('cod_cli').AsInteger;
                   iCodTipoVenda      := fieldbyname('cod_tpv').AsInteger;
                   iSequenciaDAV      := fieldbyname('sequencia_dav').AsInteger;
                   iCodVendedor       := fieldbyname('cod_vend').AsInteger;
                   iCodVend := iCodVendedor;
                   if fieldbyname('qtdparcelas_tpv').AsInteger > 0 then
                      iFormaPagamento:= dm.BuscaFormaPagamento('PR')
                   else
                      iFormaPagamento:= dm.BuscaFormaPagamento('DN');
                   result:= fieldbyname('codigo').AsInteger;
                end
             else
                result:= 0;
          end;
       TROrcamento.Commit;
     except
       TROrcamento.Rollback;
       result:= 0;
       showmessage('Erro ao buscar o código do Orçamento');
     end;
   finally
     IBAuxOrc.Close;
   end;
end;

function TFrmVendasCaixa.BuscaCodigoOrdemServico(const iSequencia : integer) : integer;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT O.CODIGO, O.SEQUENCIA_DAV, O.COO, O.COD_CLI, O.COD_TPV, ' +
                        'T.QTDPARCELAS_TPV  ' +
                        'FROM ORDEM_SERVICO O ' +
                        'INNER JOIN TIPO_VENDA T ' +
                        'ON (O.COD_TPV = T.COD_TPV) ' +
                        'WHERE O.SEQUENCIA_DAV = :SEQ AND O.DATA_FECHAMENTO IS NULL AND ' +
                        'O.FLAG_TRANSFERIDA = 0';
             Parambyname('SEQ').AsInteger:= iSequencia;
             Open;
             if not (fieldbyname('codigo').IsNull) then
                begin
                   iCodCliente        := fieldbyname('cod_cli').AsInteger;
                   iCodTipoVenda      := fieldbyname('cod_tpv').AsInteger;
                   iSequenciaDAVOS    := fieldbyname('sequencia_dav').AsInteger;
                   if fieldbyname('qtdparcelas_tpv').AsInteger > 0 then
                      iFormaPagamento:= dm.BuscaFormaPagamento('PR')
                   else
                      iFormaPagamento:= dm.BuscaFormaPagamento('DN');
                   result:= fieldbyname('codigo').AsInteger;
                end
             else
                result:= 0;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       result:= 0;
       showmessage('Erro ao buscar o código da OS');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

function TFrmVendasCaixa.BuscaCodigoContaCliente(const iConta : integer) : integer;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, CONTA, COO, CER, COD_CAI ' +
                        'FROM CONTA_CLIENTE ' +
                        'WHERE CONTA = :CONTA AND STATUS = 0';
             Parambyname('conta').AsInteger:= iConta;
             Open;
             if not (fieldbyname('codigo').IsNull) then
                begin
                   iCOOContaCliente:= fieldbyname('COO').AsInteger;
                   iCOOMesa :=  iCOOContaCliente;
                   iECFMesa:= fieldbyname('COD_CAI').AsInteger;
                   iCERMesa:= fieldbyname('CER').AsInteger;
                   result:= fieldbyname('codigo').AsInteger;
                end
             else
                result:= 0;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       result:= 0;
       showmessage('Erro ao buscar o código da conta do cliente');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmVendasCaixa.VendeItensPreVenda;
begin
   { busca os produtos da pre-venda }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensPreVenda do
      begin
         close;
         Parambyname('codpre').AsInteger:= iCodPreVenda;
         open;
         while not eof do
            begin
               iCodProduto := QItensPreVendaCOD_PRO.AsInteger;
               sCodigoBarra:= QItensPreVendaCODIGO_BARRA_PRO.AsString;
               sDescricao  := QItensPreVendaDESC_CUPOM.AsString;
               cUnitario   := QItensPreVendaVALOR.AsCurrency;
               cQuantidade := QItensPreVendaQUANT.AsCurrency;
               cDesconto   := QItensPreVendaDESCONTO.AsCurrency;
               iCodGrupo   := QItensPreVendaICMS_CF_EST.AsInteger;
               sUnidade    := copy(trim(QItensPreVendaDESCRICAO.AsString), 1,2);
               if trim(QItensPreVendaPRODUTO_PROMOCAO.AsString) = 'S' then
                  bPromocao:= true
               else
                  bPromocao:= false;
               sTipoDesc:= '$';

               BuscaIndice;
               if QItensPreVendaCANCELADO.AsInteger = 1 then
                  CancelaItemMesaPreVenda;
               next;
            end;
      end;
   dm.IBTRServer.Commit;
   QItensPreVenda.Close;

   EdtCodBarra.SetFocus;
   PanelAuxVenda.Visible:= false;
end;

procedure TFrmVendasCaixa.VendeItensSelecaoContaCliente;
var
   I: Integer;
begin
  Application.ProcessMessages;
  if not Assigned( frmCarrega ) then
     Application.CreateForm( TfrmCarrega, frmCarrega );
  frmCarrega.Show;
  frmCarrega.BringToFront;
  Application.ProcessMessages;
  if AbreVenda = 0 then
     begin
         Application.ProcessMessages;
         with frmSelecionaItens do
            begin
              for I := 0 to ListaItens.Count - 1 do
                  begin
                    if ListaItens.ItensPedido[I].Selecionado then
                       begin
                         iCodProduto := ListaItens.ItensPedido[I].Cod_pro;
                         sCodigoBarra:= ListaItens.ItensPedido[I].CodigoBarras;
                         sDescricao  := ListaItens.ItensPedido[I].Descricao;
                         cUnitario   := ListaItens.ItensPedido[I].Valor;
                         cQuantidade := ListaItens.ItensPedido[I].QauntEdit;
                         cDesconto   := 0;
                         iCodGrupo   := ListaItens.ItensPedido[I].CodIcms;
                         sUnidade    := copy(trim(ListaItens.ItensPedido[I].Unidade), 1,2);
                         bPromocao   := false;
                         sTipoDesc   := '$';
                         BuscaIndice;
                         Application.ProcessMessages;
                         ListaItens.ItensPedido[I].OrdemCupom := iOrdemItens;
                       end;
                  end;
            end;

     end;
   frmCarrega.Close;
end;

procedure TFrmVendasCaixa.VendeItensOrcamento;
begin
   { busca os produtos do Orcamento }
   if TROrcamento.Active then
      TROrcamento.Commit;
   TROrcamento.StartTransaction;
   with QItensOrcamento do
      begin
         close;
         Parambyname('codigo').AsInteger:= iCodOrcamento;
         open;
         while not eof do
            begin
               if QItensOrcamentoESTOQUE.AsCurrency > 0 then
               begin
               iCodProduto  := QItensOrcamentoCOD_PRO.AsInteger;
               sCodigoBarra := QItensOrcamentoCODIGO_BARRA_PRO.AsString;
               sDescricao   := QItensOrcamentoDESC_CUPOM.AsString;
               cUnitario    := QItensOrcamentoVALOR.AsCurrency;
               cQuantidade  := QItensOrcamentoQUANT.AsCurrency;
               cDesconto    := QItensOrcamentoDESCONTO.AsCurrency;
               iCodGrupo    := QItensOrcamentoICMS_CF_EST.AsInteger;
               sUnidade     := copy(trim(QItensOrcamentoDESCRICAO.AsString), 1,2);
               if trim(QItensOrcamentoPRODUTO_PROMOCAO.AsString) = 'S' then
                  bPromocao := true
               else
                  bPromocao := false;
               sTipoDesc:= '$';

               BuscaIndice;
               if QItensOrcamentoCANCELADO.AsInteger = 1 then
                  CancelaItemMesaPreVenda;
               end
               else
                  showmessage('Verifique o estoque do produto');
               next;
            end;
      end;
   TROrcamento.Commit;
   QItensOrcamento.Close;

   EdtCodBarra.SetFocus;
   PanelAuxVenda.Visible:= false;
end;

procedure TFrmVendasCaixa.VendeItensOrdemServico;
begin
   { busca os produtos da OS }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensOS do
      begin
         close;
         Parambyname('codigo').AsInteger:= iCodOrdemServico;
         open;
         while not eof do
            begin
               iCodProduto := QItensOSCOD_PRO.AsInteger;
               sCodigoBarra:= QItensOSCODIGO_BARRA_PRO.AsString;
               iCodVendedor:= QItensOSCOD_VEND.AsInteger;
               sDescricao  := QItensOSDESC_CUPOM.AsString;
               cUnitario   := QItensOSVALOR.AsCurrency;
               cQuantidade := QItensOSQUANT.AsCurrency;
               cDesconto   := QItensOSDESCONTO.AsCurrency;
               iCodGrupo   := QItensOSICMS_CF_EST.AsInteger;
               sUnidade    := copy(trim(QItensOSDESCRICAO.AsString), 1,2);
               if trim(QItensOSPRODUTO_PROMOCAO.AsString) = 'S' then
                  bPromocao:= true
               else
                  bPromocao:= false;
               sTipoDesc:= '$';

               BuscaIndice;
               if QItensOSCANCELADO.AsInteger = 1 then
                  CancelaItemMesaPreVenda;
               next;
            end;
      end;
   dm.IBTRServer.Commit;
   QItensOS.Close;

   EdtCodBarra.SetFocus;
   PanelAuxVenda.Visible:= false;
end;

procedure TFrmVendasCaixa.VendeItensContaCLiente(const iCodigoConta : integer);
begin
   { busca os produtos da mesa }
  if not Assigned( frmCarrega ) then
     Application.CreateForm( TfrmCarrega, frmCarrega );
  frmCarrega.Show;
  frmCarrega.BringToFront;
  Application.ProcessMessages;
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensMesa do
      begin
         close;
         Parambyname('cod').AsInteger:= iCodigoConta;
         open;
         while not eof do
            begin
               iCodProduto := QItensMesaCOD_PRO.AsInteger;
               sCodigoBarra:= QItensMesaCODIGO_BARRA_PRO.AsString;
               sDescricao  := QItensMesaDESC_CUPOM.AsString;
               cUnitario   := QItensMesaVALOR.AsCurrency;
               cQuantidade := QItensMesaQUANT.AsCurrency;
               cDesconto   := 0;
               iCodGrupo   := QItensMesaICMS_CF_EST.AsInteger;
               sUnidade    := copy(trim(QItensMesaDESCRICAO.AsString), 1,2);
               bPromocao   := false;
               sTipoDesc   := '$';

               BuscaIndice;
               Application.ProcessMessages;
               if QItensMesaCANCELADO.AsInteger = 1 then
                  CancelaItemMesaPreVenda;
               next;
               Application.ProcessMessages;
            end;
      end;
   dm.IBTRServer.Commit;
   QItensPreVenda.Close;

   EdtCodBarra.SetFocus;
   PanelAuxVenda.Visible:= false;
   frmCarrega.Close;
   { verifica se o total do cupom esta zerado }
   if cTotalVenda = 0 then
      begin
         CancelaCupomFiscal(iECF);
         CancelaVenda;

         AtualizaContaCliente(2, iCodMesa);
         FrmMesas.LimpaTudo;

         FrmVendasCaixa.Close;
      end;

end;

function TFrmVendasCaixa.VerificaCaixaAbertoeECFAtiva : boolean;
var i : integer;
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
             sql.Add('SELECT * FROM ABRE_FECHA_CAIXA ' +
                     'WHERE COD_EMP = :CODEMP AND COD_CAI = :CODCAI AND DATA_FECHA IS NULL');
             Parambyname('codemp').AsInteger := iEmp;
             Parambyname('codcai').AsInteger := iCaixa;
             Open;
             if not fieldbyname('codigo').IsNull then
                begin
                   result:= true;
                   if not ECFLigada(iECF) then
                      begin
                         result:= false;
                         showmessage('ECF Desligada ou desconectada');
                      end;
                end
             else
                begin
                   result:= false;
                   showmessage('Caixa Fechado');
                end;
          end;
       dm.IBTransaction.Commit;
     except
       result:= false;
       dm.IBTransaction.Rollback;
       showmessage('Erro ao verificar o Paf');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

function TFrmVendasCaixa.CancelaItemMesaPreVenda : boolean;
begin
   if CancelaItemCupomFiscal(iECF, iOrdemItens) = 0 then
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
                   sql.Text:= 'UPDATE ITENS_VENDA ' +
                              'SET CANCELADO = 1  ' +
                              'WHERE COD_VEN = :CODVEN AND ORDEM = :ORD';
                   Parambyname('codven').AsInteger := iCodigoVenda;
                   Parambyname('ord').AsInteger    := iOrdemItens;
                   ExecOrOpen;

                   { atualizando a venda }
                   FrmVendasCaixa.MemoItens.Lines.Add('     Cancelamento do Item: ' + inttostr(iOrdemItens));
                   cTotalVenda:= SubTotalCupomFiscal(iECF);
                   FrmVendasCaixa.EdtTotalVenda.Text:= currtostr(cTotalVenda);

                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             showmessage('Erro ao cancelar o item');
           end;
         finally
           dm.QConsulta.Close;
         end;
      end;
end;

procedure TFrmVendasCaixa.SetopVale(const Value: Boolean);
begin
  fProdutocomIMEI := Value;
   opValeok.Visible := fProdutocomIMEI;
   opValeno.Visible := not fProdutocomIMEI;
end;

procedure TFrmVendasCaixa.ShowMessage(Men: String);
begin
   TThread.Synchronize( nil,
           procedure
              begin
                 Dialogs.ShowMessage( Men );
              end
           );
end;

procedure TFrmVendasCaixa.StringGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      begin
         EdtCodBarra.SetFocus;
         StringGrid.Visible:= false;
      end;
end;

procedure TFrmVendasCaixa.StringGridKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         EdtAuxVenda.tag:= StringGrid.Row;
         case StringGrid.Row of
           0: LabelAuxVenda.Caption:= 'Senha Pré Venda';
           1: LabelAuxVenda.Caption:= 'Número do Orçamento';
           2: begin
                 LabelAuxVenda.Caption:= '';
                 Application.CreateForm( TFrmConsOrcamento,FrmConsOrcamento );
                 FrmConsOrcamento.ShowModal;
              end;
           else
             begin
                LabelAuxVenda.Caption:= '';
             end;
         end;
         if LabelAuxVenda.Caption <> '' then
            begin
               PanelAuxVenda.Visible:= true;
               EdtAuxVenda.SetFocus;
            end;
         StringGrid.Visible:= false;
      end;
end;

procedure TFrmVendasCaixa.EdtDescontoItemExit(Sender: TObject);
begin
   if strtocurr(EdtDescontoItem.Text) < 0 then
      begin
         showmessage('Desconto não pode ser negativo');
         EdtDescontoItem.Text:= '0';
         EdtDescontoItem.SetFocus;
      end;
end;

procedure TFrmVendasCaixa.CancelaTudo;
begin
   if ( dm.ECF.Estado = estLivre ) and ( iCodigoVenda > 0 ) then
      begin
         bFechaForm:= true;

         {cancela a pre venda se existe}
         if iCodPreVenda > 0 then
            FrmVendasCaixa.AtualizaPreVenda(2);


         { atualiza a conta cliente se existe }
         if iCodContaCliente > 0 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodContaCliente);

         { atualiza a conta cliente - Mesa - se existe }
         if FrmVendasCaixa.Tag = 1 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodMesa);

         {cancela a venda}


         if iCodigoVenda > 0 then
            FrmVendasCaixa.CancelaVenda;

         GravaGT(iECF);
         Exit;
      end;
   if iCodPreVenda > 0 then
      begin
         SubTotalizaCupom( iECF, 0 );
         if EfetuaPagamentosPreVenda( cTotalVenda ) = 0 then
            begin
                if FechaCupomFiscal(iECF, sNomeCliente, sDocCliente, sEndCliente, iSequenciaPreVenda, iSequenciaDAV, iSequenciaDAVOS, iECFMesa, iCOOMesa, iCERMesa, 0) <> 0 then
                    begin
                       KDialog( 'Erro fechando cupom da pre venda!', 'SLPDV - Erro', 'ERRO' );
                       Exit;
                    end;

            end
         else
            begin
               KDialog( 'Erro ao fazer pagamento da pre venda!', 'SLPDV - Erro', 'ERRO' );
               Exit;
            end;

      end;
   DM.ECF.NaoFiscalImprime := True;
   if CancelaCupomFiscal(iECF) = 0 then
      begin
         bFechaForm:= true;

         {cancela a pre venda se existe}
         if iCodPreVenda > 0 then
            FrmVendasCaixa.AtualizaPreVenda(2);

         { atualiza a conta cliente se existe }
         if iCodContaCliente > 0 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodContaCliente);

         { atualiza a conta cliente - Mesa - se existe }
         if FrmVendasCaixa.Tag = 1 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodMesa);

         {cancela a venda}


         if iCodigoVenda > 0 then
            FrmVendasCaixa.CancelaVenda;

         GravaGT(iECF);
      end;
end;

procedure TFrmVendasCaixa.IniciaPagamentos;
begin
  //
  if PagamentosEfetuados.Active then
     PagamentosEfetuados.Close;
  PagamentosEfetuados.CreateDataSet;
  PagamentosEfetuados.Open;
  PagamentosEfetuados.EmptyDataSet;


end;

function TFrmVendasCaixa.EfetuaPagamentosPreVenda(const cValor : currency) : integer;
var iAuxCodForma : integer;
    sAuxIndiceFP : string;
    sAuxDescFP   : string;
begin
   iAuxCodForma  := dm.BuscaFormaPagamento('DN');
   sAuxIndiceFP  := dm.BuscaIndiceForma(iAuxCodForma);
   sAuxDescFP    := dm.BuscaDescricaoFormaNaECF(iAuxCodForma);
   result:= PagamentoCupomFiscal2(iECF, iCOOVenda, iCCFVenda, cValor, sAuxIndiceFP, sAuxDescFP);
end;

procedure TFrmVendasCaixa.MostraConec(var Message: TMessage);
begin
  //
  Conec.Visible := True;
  Desco.Visible := false;
end;
procedure TFrmVendasCaixa.MostraDesco(var Message: TMessage);
begin
  //
  Conec.Visible := false;
  Desco.Visible := true;
end;

{ TListaFormas }

function TListaFormas.Add(Obj: TFormasC): Integer;
begin
   Result := inherited Add(Obj);
end;

function TListaFormas.BuscaValor(Tipo: String): Currency;
var
   I: Integer;
begin
   Result := 0;
   for I := 0 to Self.Count - 1 do
         begin
            if TFormasC(   self.Items[I] ).Tipo = Tipo then
               Result := TFormasC(   self.Items[I] ).Valor;
         end;
end;

function TListaFormas.GetObject(Index: Integer): TFormasC;
begin
    Result := inherited GetItem(Index) as TFormasC;
end;

procedure TListaFormas.Insert(Index: Integer; Obj: TFormasC);
begin
   inherited Insert(Index, Obj);
end;

procedure TListaFormas.SetObject(Index: Integer; Item: TFormasC);
begin
   inherited SetItem(Index, Item);
end;

{ TListaParcelas }

function TListaParcelas.Add(Obj: TParcelas): Integer;
begin
   Result := inherited Add(Obj);
end;

function TListaParcelas.GetObject(Index: Integer): TParcelas;
begin
    Result := inherited GetItem(Index) as TParcelas;
end;

procedure TListaParcelas.Insert(Index: Integer; Obj: TParcelas);
begin
   inherited Insert(Index, Obj);
end;

procedure TListaParcelas.SetObject(Index: Integer; Item: TParcelas);
begin
   inherited SetItem(Index, Item);
end;

end.

