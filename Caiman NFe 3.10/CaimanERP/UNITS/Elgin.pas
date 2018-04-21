unit Elgin;

interface
Uses Classes;

function DLLG2_IniciaDriver(Canal: String): Integer; stdcall; external 'DllG2.dll';
function DLLG2_EncerraDriver(Handle: Integer): Integer; stdcall; external 'DllG2.dll';
Function DLLG2_Versao(Versao : String; TamVersao : Integer) : pchar; stdcall; external 'DllG2.dll';
Function DLLG2_ConfiguraDriver(Porta : Integer; Velocidade : Integer) : Integer; stdcall; external 'DllG2.dll';
//Function DLLG2_SetaArquivoLog(NomeArquivo : String); stdcall; external 'dllg2.dll';
Function DLLG2_ObtemNomeLog(NomeArquivo : String; TamNomeArquivo : Integer) : pchar; stdcall; external 'dllg2.dll';
Procedure DLLG2_DefineTimeout(Porta : Integer; TempoMaximo : Integer) stdcall; external 'dllg2.dll';
Function DLLG2_LeTimeout(Porta : Integer) : Integer; stdcall; external 'dllg2.dll';
Procedure DLLG2_LimpaParams(Porta : Integer) stdcall; external 'dllg2.dll';
Procedure DLLG2_AdicionaParam(Porta : Integer; NomeParametro : String; ValorParametro : String; TipoParametro : Integer) stdcall; external 'dllg2.dll';
Function DLLG2_ListaParams(Porta : Integer; ListaParametros : String; TamListaParametros : Integer) : pchar; stdcall; external 'dllg2.dll';
Function DLLG2_LeRegistrador(Porta : Integer; NomeRegistrador : String; NomeComando : String; TamNomeComando : Integer) : Integer; stdcall; external 'dllg2.dll';
Function DLLG2_ExecutaComando(Porta : Integer; Comando : String) : Integer; stdcall; external 'dllg2.dll';
Function DLLG2_ObtemCodErro(Porta : Integer) : Integer; stdcall; external 'dllg2.dll';
Function DLLG2_ObtemNomeErro(Porta : integer; NomeErro : String; TamNomeErro : Integer) : pchar; stdcall; external 'dllg2.dll';
Function DLLG2_ObtemCircunstancia(Porta : Integer; Circunstancia : String; TamNomeCircunstancia : Integer) : pchar; stdcall; external 'dllg2.dll';
Function DLLG2_ObtemRetornos(Porta : Integer; Retornos : String; TamRetorno : Integer) : pchar; stdcall; external 'dllg2.dll';
Function DLLG2_TotalRetornos(Porta : Integer) : Integer; stdcall; external 'dllg2.dll';
Function DLLG2_Retorno(Porta : Integer; Indice : Integer; NomeRetorno : String; TamNomeRetorno : Integer; ValorRetorno : String; TamValorRetorno : Integer) : Integer; stdcall; external 'dllg2.dll';

{===============================================================================}

function AbreCupomFiscal(nPorta: integer; strEndereco: string; strID: string; strNome: string): integer;
function AbreCupomNaoFiscal(nPorta: integer; strEndereco: string; strID: string; strNome: string): integer;
function AbreGerencial(nPorta: integer; strCodGerencial: string; strNomeGerencial: string): integer;
function AbreGaveta(nPorta: integer; strTempo: string): integer;
function AcertaHorarioVerao(nPorta: integer; strEntradaHV: string): integer;
function AcresceItemFiscal(nPorta: integer; strCancelar: string; strNumItem: string; strValor: string; strPerc: string): integer;
function AcresceItemNaoFiscal(nPorta: integer; strCancelar: string; strNumItem: string; strValor: string; strPerc: string): integer;
function AcresceSubtotal(nPorta: integer; strCancelar: string; strValor: string; strPerc: string): integer;
function CancelaCupom(nPorta: integer; strOperador: string): integer;
function CancelaItemFiscal(nPorta: integer; strNumItem: string; strQuantidade: string): integer;
function CancelaItemNaoFiscal(nPorta: integer; strNumItem: string): integer;
function DefineDadosCabecalho(nPorta: integer; strECF: string; strLoja: string; strTexto:string):integer;
function DefineAliquota(nPorta: integer; strAliqICMS: string; var strCodAliq: string; strDescAliq:string; strPercAliq:string):integer;
function DefineMeioPagamento(nPorta: integer; strPermiteVinculado: string; var strCodMeio: string; strDescMeio:string; strNomeMeio:string):integer;
function DefineNaoFiscal(nPorta: integer; strTipoNaoFiscal: string; var strCodNaoFiscal: string; strDescNaoFiscal:string; strNomeNaoFiscal:string):integer;
procedure DefineTimeout(nPorta:integer; nTimeout:integer);
function EmiteLeituraX(nPorta: integer; strDestino: string; strBitmap: string; strOperador: string; var aRetorno: TStrings): integer ;
function EmiteReducaoZ(nPorta: integer; strOperador: string; strHora: string): integer;
function EmiteLeituraMF(nPorta:integer; strInicial:string; strFinal:string; strDestino:string; strSimplificada:string; var aRetorno: TStrings): integer ;
function EmiteItemNaoFiscal(nPorta: integer; strCodNF: string; strNomeNF: string; strValor: string): integer;
function EncerraDocumento(nPorta: integer; strOperador: string; strTexto: string): integer;
function EncerraDriver(nPorta: integer): integer;
function EscreveData(nPorta: integer; strNomeData: string; strValorData: string):integer;
function EscreveHora(nPorta: integer; strNomeHora: string; strValorHora: string):integer;
function EscreveIndicador(nPorta: integer; strNomeIndicador: string; strValorTextoIndicador: string):integer;
function EscreveInteiro(nPorta: integer; strNomeInteiro: string; strValorInteiro: string):integer;
function EscreveMoeda(nPorta: integer; strNomeMoeda: string; strValorMoeda: string):integer;
function EscreveTexto(nPorta: integer; strNomeTexto: string; strValorTexto: string):integer;
function IniciaDriver(strCanal: string): integer;
function LeAliquota(nPorta: integer; strAliqICMS: string; strCodAliqProg: string; strPerc: string; var strRetorno: string): integer;
function LeData(nPorta: integer; strNomeData: string; var strRetorno: string): integer;
function LeDepartamento(nPorta: integer; strCodDepto: string; strNomeDepto: string; var strRetorno: string): integer;
function LeGerencial(nPorta: integer; strCodGerencial: string; strNomeGerencial: string; var strRetorno: string): integer;
function LeHora(nPorta: integer; strNomeHora: string; var strRetorno: string): integer;
function LeImpressao(nPorta: integer): integer;
function LeIndicador(nPorta: integer; strNomeIndicador: string; var strRetorno: string): integer;
function LeInteiro(nPorta: integer; strNomeInteiro: string; var strRetorno: string): integer;
function LeMeioPagamento(nPorta: integer; strCodMeioPgto: string; strNomeMeioPgto: string; var strRetorno: string): integer;
function LeMoeda(nPorta: integer; strNomeDadoMonetario: string; var strRetorno: string): integer;
function LeNaoFiscal(nPorta: integer; strCodNaoFiscal: string; strNomeNaoFiscal: string; var strRetorno: string): integer;
function LeTexto(nPorta: integer; strNomeTexto: string; var strRetorno: string): integer;
function LeTimeout(nPorta:integer): integer;
function ObtemNomeErro(nPorta:integer): string;
function ObtemCodErro(nPorta:integer): integer;
function ObtemCircunstancia(nPorta:integer): string;
function ObtemRetornos(nPorta:integer; var nQtdeCaracteres: integer): string;
Function ObtemRetornoImpressao(var aRetorno: TStrings): Integer;
function PagaCupom(nPorta: integer; strCodMeioPgto: string; strValor: string): integer;
function Retorno(nPorta:integer; nInd: longint; var strNomeRetorno: string; var nTamNome: integer; var strValorRetorno: string; var nTamValor: integer): integer;
function VendeItem(nPorta: integer; strCodProduto: string; strNomeProduto: string; strPreco: string; strQuantidade: string; strUn: string; strCodAliq: string): integer;
Function VerificaErro( lRetorno: Longint; var lCodErro: Longint): Boolean;

type FlagIndicador = (
  MIT = 1, //Equipamento em Intervenção Técnica.
  SEM_MFD = 2, // MFD não encontrada.
  RAM_NOK = 4, // RAM não está consistente.
  RELOGIO_NOK = 8, // Relógio inconsistente.
  SEM_MF = 16, // Memória fiscal não encontrada.
  DIA_FECHADO = 32, // Dia fiscal já encerrado.
  DIA_ABERTO = 64, // Dia aberto.
  Z_PENDENTE = 128, // Redução Z pendente.
  SEM_PAPEL = 256, // Sem papel na estação de cupom fiscal.
  MECANISMO_NOK = 512, // Mecanismo impressor não configurado.
  DOCUMENTO_ABERTO = 1024, // Documento em emissão não foi encerrado.
  INSCRICOES_OK = 2048, // Inscrições carregadas.
  CLICHE_OK = 4096, // Clichê carregado.
  EM_LINHA = 8192, // Equipamento está em linha.
  MFD_ESGOTADA = 16384 // MFD esgotada
  );

type Dllg2TipoDado = (
    tpIndicador = 0, //Bool
    tpData = 2,
    tpHora = 3,
    tpInteiro = 4,
    tpLong = 5,
    tpMonetario = 6, //Money
    tpString = 7,
    tpInteiroSemSinal = 9,
    tpLongSemSinal = 10
    );

type
  tipo_parametro = Record
    Nome : string;
    Conteudo : string;
    Tipo : Dllg2TipoDado;
  end;

var
  nPortaElgin: integer;

implementation

function IsEmpty( str: string): boolean;
begin 
  result := true;
  if( str <> '') then
    result := false;
end;

function Executa(nPorta: integer; strComando: string; aParametros: array of tipo_parametro): integer;
var
  nLin  : integer;
  lCodErro : Longint;
begin 
  DLLG2_LimpaParams(nPorta);
  for nLin:= 0 to High(aParametros) do
  begin 
    if(not IsEmpty(aParametros[nLin].Conteudo)) then
      DLLG2_AdicionaParam(nPorta, aParametros[nLin].Nome, aParametros[nLin].Conteudo, Integer(aParametros[nLin].Tipo));
  end;
  VerificaErro(DLLG2_ExecutaComando(nPorta, strComando),lCodErro);
  result := lCodErro;
end;

// IniciaDriver
function IniciaDriver(strCanal: string): integer;
begin 
  result := DLLG2_IniciaDriver(strCanal);
end;

// EncerrarDriver
function EncerraDriver(nPorta: integer): integer;
begin 
  result := DLLG2_EncerraDriver(nPorta);
end;

//EmiteLeituraX
function EmiteLeituraX(nPorta: integer; strDestino: string;
                                        strBitmap: string;
                                        strOperador: string;
                                        var aRetorno: TStrings): integer ;
var
  aValorParam : array[0..2] of tipo_parametro;
  nRet : integer;
begin 
  aValorParam[0].Nome:= 'ImprimeBitmap';
  aValorParam[0].Conteudo:= strBitmap;
  aValorParam[0].Tipo:= tpIndicador;

  aValorParam[1].Nome:= 'Destino';
  aValorParam[1].Conteudo:= strDestino;
  aValorParam[1].Tipo:= tpString;

  aValorParam[2].Nome:= 'Operador';
  aValorParam[2].Conteudo:= strOperador; aValorParam[2].Tipo:= tpString;

  nRet:= Executa(nPorta, 'EmiteLeituraX', aValorParam);
  if(nRet>0) then
    result:= nRet
  else
    result := ObtemRetornoImpressao(aRetorno);
end;

//EmiteReducaoZ
function EmiteReducaoZ(nPorta: integer; strOperador: string; strHora: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Operador'; aValorParam[0].Conteudo:= strOperador; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'Hora';     aValorParam[1].Conteudo:= strHora;     aValorParam[1].Tipo:= tpHora;
  result := Executa(nPorta, 'EmiteReducaoZ', aValorParam);
end;

//EmiteLeituraMF
function EmiteLeituraMF(nPorta:integer; strInicial:string;
                                        strFinal:string;
                                        strDestino:string;
                                        strSimplificada:string;
                                        var aRetorno: TStrings): integer ;
var
  aValorParam : array[0..3] of tipo_parametro;
  nRet : integer;
begin 
  aValorParam[0].Nome:= 'DataInicial';   aValorParam[0].Conteudo:= strInicial;  aValorParam[0].Tipo:= tpData;
  aValorParam[1].Nome:= 'DataFinal';     aValorParam[1].Conteudo:= strFinal;    aValorParam[1].Tipo:= tpData;
  aValorParam[2].Nome:= 'Destino';       aValorParam[2].Conteudo:= strDestino;  aValorParam[2].Tipo:= tpString;
  aValorParam[3].Nome:= 'LeituraSimplificada'; aValorParam[3].Conteudo:= strSimplificada; aValorParam[3].Tipo:= tpIndicador;
  nRet:= Executa(nPorta, 'EmiteLeituraMF', aValorParam);
  if(nRet>0) then
    result:= nRet
  else
    result := ObtemRetornoImpressao(aRetorno);
end;

//EmiteItemNaoFiscal
function EmiteItemNaoFiscal(nPorta: integer; strCodNF: string; strNomeNF: string; strValor: string): integer;
var
  aValorParam : array[0..2] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'CodNaoFiscal'; aValorParam[0].Conteudo:= strCodNF;  aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'NomeNaoFiscal';aValorParam[1].Conteudo:= strNomeNF; aValorParam[1].Tipo:= tpString;
  aValorParam[2].Nome:= 'Valor';        aValorParam[2].Conteudo:= strValor;  aValorParam[2].Tipo:= tpMonetario;
  result := Executa(nPorta, 'EmiteItemNaoFiscal', aValorParam);
end;

//AbreCupomNaoFiscal
function AbreCupomNaoFiscal(nPorta: integer; strEndereco: string; strID: string; strNome: string): integer;
var
  aValorParam : array[0..2] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'EnderecoConsumidor'; aValorParam[0].Conteudo:= strEndereco; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'IdConsumidor';       aValorParam[1].Conteudo:= strID;       aValorParam[1].Tipo:= tpString;
  aValorParam[2].Nome:= 'NomeConsumidor';     aValorParam[2].Conteudo:= strNome;     aValorParam[2].Tipo:= tpString;
  result := Executa(nPorta, 'AbreCupomNaoFiscal', aValorParam);
end;

//AbreCupomFiscal
function AbreCupomFiscal(nPorta: integer; strEndereco: string; strID: string; strNome: string): integer;
var
  aValorParam : array[0..2] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'EnderecoConsumidor'; aValorParam[0].Conteudo:= strEndereco; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'IdConsumidor';       aValorParam[1].Conteudo:= strID;       aValorParam[1].Tipo:= tpString;
  aValorParam[2].Nome:= 'NomeConsumidor';     aValorParam[2].Conteudo:= strNome;     aValorParam[2].Tipo:= tpString;
  result := Executa(nPorta, 'AbreCupomFiscal', aValorParam);
end;

//AbreGerencial
function AbreGerencial(nPorta: integer; strCodGerencial: string; strNomeGerencial: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'CodGerencial';   aValorParam[0].Conteudo:= strCodGerencial; aValorParam[0].Tipo:= tpInteiroSemSinal;
  aValorParam[1].Nome:= 'NomeGerencial';  aValorParam[1].Conteudo:= strNomeGerencial;aValorParam[1].Tipo:= tpString;
  result := Executa(nPorta, 'AbreGerencial', aValorParam);
end;

//AbreGaveta
function AbreGaveta(nPorta: integer; strTempo: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'TempoAcionamentoGaveta'; aValorParam[0].Conteudo:= strTempo; aValorParam[0].Tipo:= tpInteiro;
  result := Executa(nPorta, 'AbreGaveta', aValorParam);
end;

//AcertaHorarioVerao
function AcertaHorarioVerao(nPorta: integer; strEntradaHV: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'EntradaHV'; aValorParam[0].Conteudo:= strEntradaHV; aValorParam[0].Tipo:= tpInteiro;
  result := Executa(nPorta, 'AcertaHorarioVerao', aValorParam);
end;

//AcresceItemFiscal
function AcresceItemFiscal(nPorta: integer; strCancelar: string; strNumItem: string; strValor: string; strPerc: string): integer;
var
  aValorParam : array[0..3] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Cancelar'; aValorParam[0].Conteudo:= strCancelar; aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'NumItem';  aValorParam[1].Conteudo:= strNumItem;  aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'ValorAcrescimo'; aValorParam[2].Conteudo:= strValor; aValorParam[2].Tipo:= tpMonetario;
  aValorParam[3].Nome:= 'ValorPercentual';aValorParam[3].Conteudo:= strPerc;  aValorParam[3].Tipo:= tpMonetario;
  result := Executa(nPorta, 'AcresceItemFiscal', aValorParam);
end;

//AcresceItemNaoFiscal
function AcresceItemNaoFiscal(nPorta: integer; strCancelar: string; strNumItem: string; strValor: string; strPerc: string): integer;
var
  aValorParam : array[0..3] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Cancelar'; aValorParam[0].Conteudo:= strCancelar; aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'NumItem';  aValorParam[1].Conteudo:= strNumItem;  aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'ValorAcrescimo'; aValorParam[2].Conteudo:= strValor; aValorParam[2].Tipo:= tpMonetario;
  aValorParam[3].Nome:= 'ValorPercentual';aValorParam[3].Conteudo:= strPerc;  aValorParam[3].Tipo:= tpMonetario;
  result := Executa(nPorta, 'AcresceItemNaoFiscal', aValorParam);
end;

//AcresceSubtotal
function AcresceSubtotal(nPorta: integer; strCancelar: string; strValor: string; strPerc: string): integer;
var
  aValorParam : array[0..2] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Cancelar';       aValorParam[0].Conteudo:= strCancelar; aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'ValorAcrescimo'; aValorParam[1].Conteudo:= strValor;    aValorParam[1].Tipo:= tpMonetario;
  aValorParam[2].Nome:= 'ValorPercentual';aValorParam[2].Conteudo:= strPerc;     aValorParam[2].Tipo:= tpMonetario;
  result := Executa(nPorta, 'AcresceSubtotal', aValorParam);
end;

//VendeItem
function VendeItem(nPorta: integer; strCodProduto: string; strNomeProduto: string; strPreco: string; strQuantidade: string; strUn: string; strCodAliq: string): integer;
var
  aValorParam : array[0..5] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'CodProduto';   aValorParam[0].Conteudo:= strCodProduto;  aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'NomeProduto';  aValorParam[1].Conteudo:= strNomeProduto; aValorParam[1].Tipo:= tpString;
  aValorParam[2].Nome:= 'PrecoUnitario';aValorParam[2].Conteudo:= strPreco;       aValorParam[2].Tipo:= tpMonetario;
  aValorParam[3].Nome:= 'Quantidade';   aValorParam[3].Conteudo:= strQuantidade;  aValorParam[3].Tipo:= tpMonetario;
  aValorParam[4].Nome:= 'Unidade';      aValorParam[4].Conteudo:= strUn;          aValorParam[4].Tipo:= tpString;
  aValorParam[5].Nome:= 'CodAliquota';  aValorParam[5].Conteudo:= strCodAliq;     aValorParam[5].Tipo:= tpInteiro;
  result := Executa(nPorta, 'VendeItem', aValorParam);
end;

// PagaCupom
function PagaCupom(nPorta: integer; strCodMeioPgto: string; strValor: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'CodMeioPagamento'; aValorParam[0].Conteudo:= strCodMeioPgto; aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'Valor';            aValorParam[1].Conteudo:= strValor;       aValorParam[1].Tipo:= tpMonetario;
  result := Executa(nPorta, 'PagaCupom', aValorParam);
end;

// EncerraDocumento
function EncerraDocumento(nPorta: integer; strOperador: string; strTexto: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Operador';         aValorParam[0].Conteudo:= strOperador; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'TextoPromocional'; aValorParam[1].Conteudo:= strTexto;    aValorParam[1].Tipo:= tpString;
  result := Executa(nPorta, 'EncerraDocumento', aValorParam);
end;

// Cancela Cupom
function CancelaCupom(nPorta: integer; strOperador: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'Operador';         aValorParam[0].Conteudo:= strOperador; aValorParam[0].Tipo:= tpString;
  result := Executa(nPorta, 'CancelaCupom', aValorParam);
end;

// Cancela Item Fiscal
function CancelaItemFiscal(nPorta: integer; strNumItem: string; strQuantidade: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NumItem';    aValorParam[0].Conteudo:= strNumItem;    aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'Quantidade'; aValorParam[1].Conteudo:= strQuantidade; aValorParam[1].Tipo:= tpMonetario;
  result := Executa(nPorta, 'CancelaItemFiscal', aValorParam);
end;

// Cancela Item Nao Fiscal
function CancelaItemNaoFiscal(nPorta: integer; strNumItem: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NumItem';    aValorParam[0].Conteudo:= strNumItem;    aValorParam[0].Tipo:= tpInteiro;
  result := Executa(nPorta, 'CancelaItemNaoFiscal', aValorParam);
end;

// Define Dados Cabecalho
function DefineDadosCabecalho(nPorta: integer; strECF: string; strLoja: string; strTexto:string):integer;
var
  aValorParam : array[0..2] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'ECF';           aValorParam[0].Conteudo:= strECF;  aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'Loja';          aValorParam[1].Conteudo:= strLoja; aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'TextoCabecalho';aValorParam[2].Conteudo:= strTexto;aValorParam[2].Tipo:= tpString;
  result := Executa(nPorta, 'DefineDadosCabecalho', aValorParam);
end;

// Define Aliquota
function DefineAliquota(nPorta: integer; strAliqICMS: string; var strCodAliq: string; strDescAliq:string; strPercAliq:string):integer;
var
  aValorParam : array[0..3] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'AliquotaICMS';           aValorParam[0].Conteudo:= strAliqICMS;aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'CodAliquotaProgramavel'; aValorParam[1].Conteudo:= strCodAliq; aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'DescricaoAliquota';      aValorParam[2].Conteudo:= strDescAliq;aValorParam[2].Tipo:= tpString;
  aValorParam[3].Nome:= 'PercentualAliquota';     aValorParam[3].Conteudo:= strPercAliq;aValorParam[3].Tipo:= tpMonetario;
  nTamRet := 20;
  strNomeRetorno := 'CodAliquotaProgramavel';
  nRet := Executa(nPorta, 'DefineAliquota', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strCodAliq, nTamRet);
end;

// Define Meio Pagamento
function DefineMeioPagamento(nPorta: integer; strPermiteVinculado: string; var strCodMeio: string; strDescMeio:string; strNomeMeio:string):integer;
var
  aValorParam : array[0..3] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'PermiteVinculado';       aValorParam[0].Conteudo:= strPermiteVinculado;aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'CodMeioPagamentoProgram';aValorParam[1].Conteudo:= strCodMeio; aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'DescricaoMeioPagamento'; aValorParam[2].Conteudo:= strDescMeio;aValorParam[2].Tipo:= tpString;
  aValorParam[3].Nome:= 'NomeMeioPagamento';      aValorParam[3].Conteudo:= strNomeMeio;aValorParam[3].Tipo:= tpString;
  nTamRet := 20;
  strNomeRetorno := 'CodMeioPagamentoProgram';
  nRet := Executa(nPorta, 'DefineMeioPagamento', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strCodMeio, nTamRet);
end;

// Define Nao Fiscal
function DefineNaoFiscal(nPorta: integer; strTipoNaoFiscal: string; var strCodNaoFiscal: string; strDescNaoFiscal:string; strNomeNaoFiscal:string):integer;
var
  aValorParam : array[0..3] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'TipoNaoFiscal';     aValorParam[0].Conteudo:= strTipoNaoFiscal;aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'CodNaoFiscal';      aValorParam[1].Conteudo:= strCodNaoFiscal; aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'DescricaoNaoFiscal';aValorParam[2].Conteudo:= strDescNaoFiscal;aValorParam[2].Tipo:= tpString;
  aValorParam[3].Nome:= 'NomeNaoFiscal';     aValorParam[3].Conteudo:= strNomeNaoFiscal;aValorParam[3].Tipo:= tpString;
  nTamRet := 20;
  strNomeRetorno := 'CodNaoFiscal ';
  nRet := Executa(nPorta, 'DefineNaoFiscal', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strCodNaoFiscal, nTamRet);
end;

// Escreve Data
function EscreveData(nPorta: integer; strNomeData: string; strValorData: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeData'; aValorParam[0].Conteudo:= strNomeData; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorData';aValorParam[1].Conteudo:= strValorData;aValorParam[1].Tipo:= tpData;
  result := Executa(nPorta, 'EscreveData', aValorParam);
end;

// Escreve Hora
function EscreveHora(nPorta: integer; strNomeHora: string; strValorHora: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeHora'; aValorParam[0].Conteudo:= strNomeHora; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorHora';aValorParam[1].Conteudo:= strValorHora;aValorParam[1].Tipo:= tpHora;
  result := Executa(nPorta, 'EscreveHora', aValorParam);
end;

// Escreve Indicador
function EscreveIndicador(nPorta: integer; strNomeIndicador: string; strValorTextoIndicador: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeIndicador';      aValorParam[0].Conteudo:= strNomeIndicador;      aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorTextoIndicador';aValorParam[1].Conteudo:= strValorTextoIndicador;aValorParam[1].Tipo:= tpString;
  result := Executa(nPorta, 'EscreveIndicador', aValorParam);
end;

// Escreve Inteiro
function EscreveInteiro(nPorta: integer; strNomeInteiro: string; strValorInteiro: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeInteiro'; aValorParam[0].Conteudo:= strNomeInteiro; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorInteiro';aValorParam[1].Conteudo:= strValorInteiro;aValorParam[1].Tipo:= tpInteiro;
  result := Executa(nPorta, 'EscreveInteiro', aValorParam);
end;

// Escreve Moeda
function EscreveMoeda(nPorta: integer; strNomeMoeda: string; strValorMoeda: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeDadoMonetario'; aValorParam[0].Conteudo:= strNomeMoeda; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorMonetario';    aValorParam[1].Conteudo:= strValorMoeda;aValorParam[1].Tipo:= tpMonetario;
  result := Executa(nPorta, 'EscreveMoeda', aValorParam);
end;

// Escreve Texto
function EscreveTexto(nPorta: integer; strNomeTexto: string; strValorTexto: string):integer;
var
  aValorParam : array[0..1] of tipo_parametro;
begin 
  aValorParam[0].Nome:= 'NomeTexto'; aValorParam[0].Conteudo:= strNomeTexto; aValorParam[0].Tipo:= tpString;
  aValorParam[1].Nome:= 'ValorTexto';aValorParam[1].Conteudo:= strValorTexto;aValorParam[1].Tipo:= tpString;
  result := Executa(nPorta, 'EscreveTexto', aValorParam);
end;

// LeAliquota
function LeAliquota(nPorta: integer; strAliqICMS: string;
                                     strCodAliqProg: string;
                                     strPerc: string;
                                     var strRetorno:string): integer;
var
  aValorParam : array[0..2] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'AliquotaICMS';           aValorParam[0].Conteudo:= strAliqICMS;   aValorParam[0].Tipo:= tpIndicador;
  aValorParam[1].Nome:= 'CodAliquotaProgramavel'; aValorParam[1].Conteudo:= strCodAliqProg;aValorParam[1].Tipo:= tpInteiro;
  aValorParam[2].Nome:= 'PercentualAliquota';     aValorParam[2].Conteudo:= strPerc;       aValorParam[1].Tipo:= tpMonetario;
  nRet := Executa(nPorta, 'LeAliquota', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeData
function LeData(nPorta: integer; strNomeData: string; var strRetorno:string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'NomeData'; aValorParam[0].Conteudo:= strNomeData;   aValorParam[0].Tipo:= tpString;
  nTamRet := 20;
  strRetorno := StringofChar('0', nTamRet);
  strNomeRetorno := 'ValorData';
  nRet := Executa(nPorta, 'LeData', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strRetorno, nTamRet);
end;

// LeDepartamento
function LeDepartamento(nPorta: integer; strCodDepto: string; strNomeDepto: string; var strRetorno:string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'CodDepartamento'; aValorParam[0].Conteudo:= strCodDepto; aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'NomeDepartamento';aValorParam[0].Conteudo:= strNomeDepto;aValorParam[0].Tipo:= tpString;
  nRet := Executa(nPorta, 'LeDepartamento', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeGerencial
function LeGerencial(nPorta: integer; strCodGerencial: string; strNomeGerencial: string; var strRetorno: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'CodGerencial'; aValorParam[0].Conteudo:= strCodGerencial; aValorParam[0].Tipo:= tpInteiroSemSinal;
  aValorParam[1].Nome:= 'NomeGerencial';aValorParam[1].Conteudo:= strNomeGerencial;aValorParam[1].Tipo:= tpString;
  nRet := Executa(nPorta, 'LeGerencial', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeHora
function LeHora(nPorta: integer; strNomeHora: string; var strRetorno: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'NomeHora'; aValorParam[0].Conteudo:= strNomeHora; aValorParam[0].Tipo:= tpString;
  nTamRet := 20;
  strRetorno := StringofChar('0', nTamRet);
  strNomeRetorno := 'ValorHora';
  nRet := Executa(nPorta, 'LeHora', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strRetorno, nTamRet);
end;

// LeImpressao
function LeImpressao(nPorta: integer): integer;
begin 
  result := DLLG2_ExecutaComando(nPorta, 'LeImpressao');
end;

// LeIndicador
function LeIndicador(nPorta: integer; strNomeIndicador: string; var strRetorno: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'NomeIndicador'; aValorParam[0].Conteudo:= strNomeIndicador; aValorParam[0].Tipo:= tpString;
  nRet := Executa(nPorta, 'LeIndicador', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeInteiro
function LeInteiro(nPorta: integer; strNomeInteiro: string; var strRetorno: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'NomeInteiro'; aValorParam[0].Conteudo:= strNomeInteiro; aValorParam[0].Tipo:= tpString;
  nTamRet := 20;
  strRetorno := StringofChar('0', nTamRet);
  strNomeRetorno := 'ValorInteiro';
  nRet := Executa(nPorta, 'LeInteiro', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strRetorno, nTamRet);
end;

// LeMeioPagamento
function LeMeioPagamento(nPorta: integer; strCodMeioPgto: string; strNomeMeioPgto: string; var strRetorno: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'CodMeioPagamentoProgram'; aValorParam[0].Conteudo:= strCodMeioPgto; aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'NomeMeioPagamento';       aValorParam[1].Conteudo:= strNomeMeioPgto;aValorParam[1].Tipo:= tpString;
  nRet := Executa(nPorta, 'LeMeioPagamento', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeMoeda
function LeMoeda(nPorta: integer; strNomeDadoMonetario: string; var strRetorno: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'NomeDadoMonetario'; aValorParam[0].Conteudo:= strNomeDadoMonetario; aValorParam[0].Tipo:= tpString;
  nTamRet := 30;
  strRetorno := StringofChar('0', nTamRet);
  strNomeRetorno := 'ValorMoeda';
  nRet := Executa(nPorta, 'LeMoeda', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strRetorno, nTamRet);
end;

// LeNaoFiscal
function LeNaoFiscal(nPorta: integer; strCodNaoFiscal: string; strNomeNaoFiscal: string; var strRetorno: string): integer;
var
  aValorParam : array[0..1] of tipo_parametro;
  nRet, nQtde : integer;
begin 
  aValorParam[0].Nome:= 'CodNaoFiscal'; aValorParam[0].Conteudo:= strCodNaoFiscal; aValorParam[0].Tipo:= tpInteiro;
  aValorParam[1].Nome:= 'NomeNaoFiscal';aValorParam[1].Conteudo:= strNomeNaoFiscal;aValorParam[1].Tipo:= tpString;
  nRet := Executa(nPorta, 'LeNaoFiscal', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    strRetorno := ObtemRetornos(nPorta, nQtde);
  result := 0;
end;

// LeTexto
function LeTexto(nPorta: integer; strNomeTexto: string; var strRetorno: string): integer;
var
  aValorParam : array[0..0] of tipo_parametro;
  nRet, nTamNome, nTamRet : integer;
  strNomeRetorno : string;
begin 
  aValorParam[0].Nome:= 'NomeTexto';aValorParam[0].Conteudo:= strNomeTexto;aValorParam[0].Tipo:= tpString;
  nTamRet := 4000;
  strRetorno := StringofChar('0', nTamRet);
  strNomeRetorno := 'ValorTexto';
  nRet := Executa(nPorta, 'LeTexto', aValorParam);
  if(nRet>0) then
    result := nRet
  else
    result := Retorno(nPorta, 0, strNomeRetorno, nTamNome, strRetorno, nTamRet);
end;

// ObtemNomeErro
function ObtemNomeErro(nPorta:integer): string;
var
  strNomeErro : string;
begin 
  strNomeErro := DLLG2_ObtemNomeErro(nPorta, strNomeErro, 0);
  result := strNomeErro;
end;

// ObtemCodErro
function ObtemCodErro(nPorta:integer): integer;
begin 
  result := DLLG2_ObtemCodErro(nPorta);
end;

// ObtemCircunstancia
function ObtemCircunstancia(nPorta:integer): string;
var
  strCircunstancia : string;
begin 
  // Apesar de strCircunstancia ser um parametro de retorno, é necessario que o valor da funcao seja associado a esta variavel
  strCircunstancia := DLLG2_ObtemCircunstancia(nPorta, strCircunstancia, 200);
  result := strCircunstancia;
end;

// ObtemRetornos
function ObtemRetornos(nPorta:integer; var nQtdeCaracteres: integer): string;
var
  strRetornos : string;
begin 
  // Apesar de strRetornos ser um parametro de retorno, é necessario que o valor da funcao seja associado a esta variavel
  strRetornos := DLLG2_ObtemRetornos(nPorta, strRetornos, nQtdeCaracteres);
  result := strRetornos;
end;

// Retorno
function Retorno(nPorta:integer; nInd: longint; var strNomeRetorno: string;
                                                var nTamNome: integer;
                                                var strValorRetorno: string;
                                                var nTamValor: integer): integer;
var nRet : integer;
begin 
  VerificaErro(DLLG2_Retorno(nPorta, nInd, strNomeRetorno, nTamNome, strValorRetorno, nTamValor),nRet);
  if(nRet>0) then
    result := nRet
  else
    result := 0;
end;

// DefineTimeout
procedure DefineTimeout(nPorta:integer; nTimeout:integer);
begin 
  DLLG2_DefineTimeout(nPorta, nTimeout);
end;

// LeTimeout
function LeTimeout(nPorta:integer): integer;
begin 
  result := DLLG2_LeTimeout(nPorta);
end;

// VerificaErro
Function VerificaErro( lRetorno: Longint; var lCodErro: Longint): Boolean;
begin 
    VerificaErro := False;
    lCodErro := 0;
    If (lRetorno > 0) Then
    begin 
      lCodErro := ObtemCodErro(nPortaElgin);
      if(lCodErro > 0) then
        VerificaErro := True;
    End;
end;

// ObtemRetornoImpressao
Function ObtemRetornoImpressao(var aRetorno: TStrings): Integer;
const
  QTDE_COLUNAS = 48;
  QTDE_CARACTERES_LIDOS = 4000;
var
 iCaracteresLidos, i, k, nRet: Integer;
 strTag, strBuffer, strLinha: string;
 bSucesso: boolean;
 caracter: char;
begin 
  iCaracteresLidos := QTDE_CARACTERES_LIDOS;
  strTag := 'TextoImpressao=""';
  strBuffer := StringOfChar(' ',16000);
  bSucesso := TRUE;
  aRetorno := TStringList.Create;
  k := 1;
  strLinha := '';

  Repeat

    If(VerificaErro(LeImpressao(nPortaElgin),nRet)) Then
    begin 
      bSucesso := False;
      continue;
    end;

    strBuffer := ObtemRetornos(nPortaElgin, iCaracteresLidos);
    iCaracteresLidos := Length(strBuffer);

    If strBuffer <> strTag Then
    begin 

      i := Length(strTag)+1;

      while i <= iCaracteresLidos do
      begin 
        while (k<=QTDE_COLUNAS) and (i <= iCaracteresLidos) do
        begin 
          caracter := strBuffer[i];
          if (caracter <> #10) then  // Caracter de quebra de linha
          begin 
            if (caracter <> #27) then // Caracter de Formatação
            begin 
              strLinha := strLinha + strBuffer[i];
              inc(k);
            end else begin 
              i := i + 2;
              Continue; // Pula os proximos 2 caracteres de formatação
            end;
          end else begin 
            k:=QTDE_COLUNAS+1;
          end;
          inc(i);
        end;
        if(k>QTDE_COLUNAS) then
        begin 
          aRetorno.Add(strLinha);
          k := 1;
          strLinha := '';
        end;
      end;

    end;

  until (iCaracteresLidos <= Length(strTag)) or (bSucesso = FALSE);

  result := nRet;
end;

end.
