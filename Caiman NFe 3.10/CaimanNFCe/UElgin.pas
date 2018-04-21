unit UElgin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;



{===============================================================================
********************************************************************************

                      DECLARAÇÃO DAS FUNÇÕES DA Elgin.DLL
                         Data de atualização 17/12/2010
                                versão 1.0.0.8

********************************************************************************
===============================================================================}
function Elgin_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento, Valor, NumeroCupom, CGC, nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_AbrePortaSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRelatorioGerencial(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRelatorioGerencialMFD(Indice : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AcionaGaveta:Integer; StdCall; External 'Elgin.DLL'
function Elgin_AcionaGuilhotinaMFD (TipoCorte:integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AcrescimoDescontoItemMFD (Item, AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimoDesconto: string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: string): integer; StdCall; External 'Elgin.DLL'
function Elgin_AcrescimoDescontoSubtotalRecebimentoMFD( cFlag, cTipo, cValor: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_AcrescimoItemNaoFiscalMFD(strNroItem:string; strAcrescDesc:string; strTipoAcrescDesc:string; strValor:string): integer; StdCall; External 'Elgin.DLL';
function Elgin_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AlteraSimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AtivaDesativaVendaUmaLinhaMFD( iFlag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AumentaDescricaoItem( Descricao: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Autenticacao:Integer; StdCall; External 'Elgin.DLL'
function Elgin_AutenticacaoMFD(Linhas, Texto : string):Integer; StdCall; External 'Elgin.DLL'
function Elgin_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaAcrescimoDescontoSubtotalMFD( cFlag: string): integer; StdCall; External 'Elgin.DLL'
function Elgin_CancelaAcrescimoDescontoSubtotalRecebimentoMFD( cFlag: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaAcrescimoNaoFiscalMFD(strNumeroItem: String; strAcrecDesc: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupom: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupomMFD(CGC, Nome, Endereco: string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_CancelaImpressaoCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemAnterior: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemGenerico( NumeroItem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemNaoFiscalMFD(strNroItem:string): integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaLeituraBinario(): Integer;  stdcall; External 'Elgin.dll';
function Elgin_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_CNPJ_IE(CNPJ: string; IE: string):Integer;stdcall; External 'Elgin.DLL';
function Elgin_CNPJMFD(CNPJ : string): Integer; StdCall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODABARMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE128MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE39MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE93MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasEAN13MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasEAN8MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasISBNMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasITFMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasMSIMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasPLESSEYMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasUPCAMFD(Codigo : String) :Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasUPCEMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
function Elgin_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ConfiguraCodigoBarrasMFD (Var Altura: Integer; var Largura: Integer; var pos: Integer; var Fonte: Integer; var Margem: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorComprovantesCreditoMFD(Comprovantes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorCupomFiscalMFD(CuponsEmitidos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_ContadoresTotalizadoresNaoFiscaisMFD(Contadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorFitaDetalheMFD(ContadorFita : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_ContadorRelatoriosGerenciaisMFD (Relatorios : String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ConverteATO17ParaPAFRJ( arquivoATO17: String ): Integer; stdcall; External 'Elgin.dll';
function Elgin_CupomAdicionalMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosSintegra( DataInicial: string; DataFinal: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosUltimaReducaoMFD(DadosReducao : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataHoraSoftwareBasico(DataSW, HoraSW: String ): Integer;stdcall; External 'Elgin.DLL';
function Elgin_DataHoraUltimoDocumentoMFD( cDataHora: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_DataMovimento( Data: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataMovimentoUltimaReducaoMFD( cDataMovimento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Descontos( ValorDescontos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DownloadMF( Arquivo: String ): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EspacoEntreLinhas( Dots: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoFormasPagamento( FormaOrigem: String; FormaDestino: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ExecutaComando(Comandos: Pchar; Parametros: PChar):integer;stdcall;External 'ELGIN.DLL';
function Elgin_ExecutaLeitura(Comandos,Parametros,Retorno:string):integer;stdcall;External 'ELGIN.DLL';
function Elgin_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechamentoDoDia: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaPortaSerial: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRecebimentoNaoFiscalMFD(Mensagem : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRelatorioGerencial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscaisStr(FlagFiscal: String): Integer; StdCall; External 'Elgin.DLL';
Function Elgin_FormatoDadosMFD(ArquivoOrigem: String;
                               ArquivoDestino: String;
                               TipoFormato: String;
                               TipoDownload: String;
                               ParametroInicial: String;
                               ParametroFinal: String;
                               UsuarioECF: String):  Integer; StdCall; External 'Elgin.DLL';
function Elgin_GeraArquivoATO17Binario( szArquivoBinario, szArquivoTexto,szPeriodoIni, szPeriodoFIM:string;
    TipoPeriodo:char; szUsuario:string;szTipoLeitura:string):integer; stdcall; External 'Elgin.dll';
function Elgin_GeraRFDBinario( periodoInicial, periodoFinal: String;
    tipoPeriodo: Integer; tipoLeitura: Integer; nomeArquivo: String ): Integer; stdcall; External 'Elgin.dll';
function Elgin_GeraRFDBinarioRJ( periodoInicial, periodoFinal: String;
    tipoPeriodo: Integer ): Integer; stdcall; External 'Elgin.dll';
function Elgin_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_GrandeTotalUltimaReducaoMFD( cGT: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IdentificaConsumidor(CNPJ_CPF: String; Nome: String; Endereco : String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeCheque( Banco: String; Valor: String; Favorecido: String; Cidade: String; Data: String; Mensagem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeChequeMFD(NumeroBanco, Valor, Favorecido, Cidade, Data, Mensagem, ImpressaoVerso, Linhas : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeConfiguracoesImpressora:Integer; StdCall; External 'Elgin.DLL'
function Elgin_ImprimeCopiaCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeDepartamentos: Integer; StdCall; External 'Elgin.DLL';
function Elgin_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoCupomMFD(AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimCOOsMFD( cCOOIni, cCOOFim: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimGTsMFD( cGTInicial, cGTFinal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InscricaoEstadualMFD(InscricaoEstadual : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InscricaoMunicipalMFD(InscricaoMunicipal : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeArquivoRetorno(sCupom: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeCodigoNacionalIdentificacaoECF(CNI:string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_LeIndicadores( var Indicador: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraCheque(CodigoCMC7 : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraX: Integer; StdCall; External 'Elgin.DLL' ;
function Elgin_LeituraXSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeMemoriasBinario(szNomeArquivo: string; szSerieECF: string; bAguardaConcluirLeitura: Boolean): Integer; stdcall; External 'Elgin.DLL';
function Elgin_LeNomeRelatorioGerencial(Codigo, descricao: string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeParametrosPAF(CNPJ, Data, Hora, NumeroSerie, NumeroECF,GrandeTotal:string) :integer;stdcall; External 'Elgin.DLL';
function Elgin_LeStatusGeraBinario(var nSituacaoAtual: Integer;
    var nCodigoErro: Integer; var nTamanhoLeitura: Integer;
    var nProgressoLeitura: Integer; strSituacaoAtual: String ): Integer; stdcall; External 'Elgin.dll';
function Elgin_LinhasEntreCupons( Linhas: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumo:Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumoMFD:Integer; StdCall; External 'Elgin.DLL';
function Elgin_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosEmitindoDocumentosFiscaisMFD(Minutos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_MinutosLigada( Minutos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ModeloImpressora(ModeloImpressora: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaDepartamento( Indice: Integer; Departamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaTotalizadorNaoSujeitoIcms( Indice: Integer; Totalizador: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieCriptografado(NumeroSerie: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieDescriptografado(NumeroSerieCriptografado:String; NumeroSerieDesCriptografado:String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieMemoriaMFD(NumeroSerieMFD : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_PercentualLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaArredondamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaBaudRate(BaudRate:PChar):Integer;stdcall; External 'Elgin.DLL';
function Elgin_ProgramaCaracterAutenticacao( Parametros: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: String) : Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaHorarioVerao: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaIdAplicativoMFD( NomeAplicativo: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaMoedaPlural( MoedaPlural: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaMoedaSingular( MoedaSingular: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaOperador(NomeOperador:String): Integer;stdcall; External 'Elgin.DLL';
function Elgin_ProgramaTruncamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducoesRestantesMFD(Reducoes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RegistrosTipo60: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReimpressaoNaoFiscalVinculadoMFD() : Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioGerencial( Texto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioSintegraMFD( iRelatorios: Integer;cArquivo: String; cMes: String; cAno: String; cRazaoSocial: String; cEndereco: String;cNumero: String; cComplemento: String; cBairro: String; cCidade: String; cCEP: String; cTelefone: String; cFax: String; cContato: String ): Integer; StdCall; External 'Elgin.DLL'
function Elgin_RelatorioTipo60Analitico: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60AnaliticoMFD: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60Mestre: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ResetaImpressora: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoImpressora( var i:integer; ErrorMsg:string):integer;StdCall; External 'Elgin.DLL';
function Elgin_Sangria( Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SegundaViaNaoFiscalVinculadoMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_StatusEstendidoMFD( Var iStatus: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotal( SubTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotalComprovanteNaoFiscalMFD( cSubTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Suprimento( Valor: String; FormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TamanhoTotalMFD( cTamanhoMFD: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_TempoOperacionalMFD(TempoOperacional : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TerminaFechamentoCupomCodigoBarrasMFD( cMensagem: string;cTipoCodigo: string;cCodigo: string;iAltura: integer;iLargura: integer;iPosicaoCaracteres: integer;iFonte: integer;iMargem: integer;iCorrecaoErros: integer;iColunas: integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalDiaTroco( TotalDiaTroco: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalDocTroco( TotalDocTroco: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalIcmsCupom(ICMS: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_UsaRelatorioGerencialMFD(Texto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_ValorFormaPagamentoMFD( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorTotalizadorNaoFiscalMFD( Totalizador: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendaLiquida( VendaLiquida: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasICMS( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaDepartamentos( Departamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoGavetaStr( EstadoGaveta: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraStr(ACK: String; ST1: String; ST2: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaFormasPagamentoMFD(FormasPagamento : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaImpressoraLigada: Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasICMS( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaRecebimentoNaoFiscalMFD(Recebimentos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaReducaoZAutomatica(var Flag:integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaRelatorioGerencialMFD(Relatorios : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaSensorPoucoPapelMFD( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaStatusCheque( Var StatusCheque: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTipoImpressoraStr(TipoImpressora: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciaisMFD(Totalizadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTruncamento( Flag: string ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaZPendente( var Flag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'Elgin.DLL';
function Wind_AcionaGaveta:integer; stdcall; External 'Elgin.DLL';
function Wind_AcionaGuilhotina(Modo:integer):integer; stdcall;  External 'Elgin.DLL';
function Wind_AcionaGuilhotinaParcial(Modo:integer):integer; stdcall;  External 'Elgin.DLL';
function Wind_AjustaLarguraPapel(LarguraPapel :  integer) : Integer; stdcall; External 'Elgin.DLL';
function Wind_ConfiguraCodigoBarras(Altura, Largura, PosicaoCaracteres, Fonte, Margem : Integer) : Integer; stdcall; External 'Elgin.DLL';
function Wind_EnviaBuffer(Buffer:string):integer; stdcall; External 'Elgin.DLL';
function Wind_EnviaBufferFormatado(Buffer:string; TipoLetra:integer; Italico:integer;Sublinhado:integer; Expandido:integer; Enfatizado:integer):integer; stdcall;External 'Elgin.DLL';
function Wind_EnviaComando (Buffer:string; TamanhoBuffer:integer):integer; stdcall; External 'Elgin.DLL';
function Wind_ImprimeBitmap(NomeArquivo:string; TamanhoBuffer:integer):integer; stdcall; External 'Elgin.DLL';
function Wind_ImprimeBmpEspecial (NomeArquivo:string; EscalaX, EscalaY, Angulo:integer):integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasCODABAR(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasCODE128(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasCODE39(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasCODE93(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasEAN13(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasEAN8(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasISBN(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasITF(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasMSI(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasPDF417(NivelCorrecaoErros , Altura , Largura , Colunas: Integer; Codigo: string) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasPLESSEY(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasUPCA(Codigo : String) :Integer; stdcall; External 'Elgin.DLL';
Function Wind_ImprimeCodigoBarrasUPCE(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
function Wind_VerificaEstadoGaveta:integer; stdcall; External 'Elgin.DLL';
Function Wind_VerificaFimPapel: Integer; StdCall; External 'Elgin.DLL';
Function Wind_VerificaPoucoPapel: Integer; StdCall; External 'Elgin.DLL';
Function RFD_ConvertedaMFD(CRZ:String): Integer; StdCall; External 'Elgin.DLL';
Function RFD_ConvertedaMFDData(DataInicial: String; DataFinal: String): Integer; StdCall; External 'Elgin.DLL';
//Speed Fiscal
Function Elgin_GeraRegistrosSpedMFD(sArquivoMFD:string;sArquivoTXT:string;sDataInicial:string;
                                    sDataFinal:string;sPerfil:string;sCFOP:string;sCODOBSFiscal:string;
                                    sAliqPIS:string;sAliqCOFINS:string):Integer; StdCall; External 'Elgin.DLL';


// Funções Globais
function TrataErro(iRetorno:integer): boolean;

{ Fim da Declaração }

implementation

// Funções Globais
function TrataErro(iRetorno:integer): boolean;
var iCodErro: integer;
    strErroMsg: string;
begin
  if ( iRetorno <> 1 ) then
  begin
    strErroMsg := StringOfChar(' ',100);
    Elgin_RetornoImpressora( iCodErro, strErroMsg );
    Application.MessageBox(  Pchar('Erro Nº '+inttostr(iCodErro)+chr(13)+chr(10)+strErroMsg),'Erro',MB_IconError + MB_OK);
  end;
  result:= iRetorno = 1;
end;

end.
