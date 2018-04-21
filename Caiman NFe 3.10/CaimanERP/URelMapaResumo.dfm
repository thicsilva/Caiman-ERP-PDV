object FrmRelMapaResumo: TFrmRelMapaResumo
  Left = 416
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do Mapa Resumo'
  ClientHeight = 203
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 145
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 64
      Height = 13
      Caption = 'Respons'#225'vel'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 38
      Height = 13
      Caption = 'Fun'#231#227'o'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 128
      Top = 8
      Width = 41
      Height = 13
      Caption = 'N'#250'mero'
    end
    object EdtResp: TEdit
      Left = 8
      Top = 72
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 2
    end
    object EdtFuncao: TEdit
      Left = 7
      Top = 112
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 30
      TabOrder = 3
    end
    object EdtNumero: TEdit
      Left = 127
      Top = 24
      Width = 98
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
      OnKeyPress = EdtNumeroKeyPress
    end
    object EdtData: TDateTimePicker
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Date = 38475.460671956000000000
      Time = 38475.460671956000000000
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 360
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnImp: TBitBtn
      Left = 87
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BtnImpClick
    end
    object BtnSair: TBitBtn
      Left = 198
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 184
    Width = 360
    Height = 19
    Panels = <>
  end
  object QRelMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT *'
      'FROM MAPA_RESUMO'
      'WHERE DATA = :DATA AND COD_EMP = :CODEMP'
      'ORDER BY CHECKOUT')
    Left = 256
    Top = 8
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QRelMapaCHECKOUT: TIntegerField
      FieldName = 'CHECKOUT'
      Origin = 'MAPA_RESUMO.CHECKOUT'
      Required = True
    end
    object QRelMapaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'MAPA_RESUMO.DATA'
      Required = True
    end
    object QRelMapaCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
      Origin = 'MAPA_RESUMO.COO_INICIAL'
      Required = True
    end
    object QRelMapaCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = 'MAPA_RESUMO.COO_FINAL'
      Required = True
    end
    object QRelMapaGT_INICIAL: TBCDField
      FieldName = 'GT_INICIAL'
      Origin = 'MAPA_RESUMO.GT_INICIAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QRelMapaGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = 'MAPA_RESUMO.GT_FINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QRelMapaCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
    object QRelMapaCONT_CANCEL: TIntegerField
      FieldName = 'CONT_CANCEL'
      Origin = 'MAPA_RESUMO.CONT_CANCEL'
      Required = True
    end
    object QRelMapaCONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = 'MAPA_RESUMO.CONTADOR_REINICIO_OPERACAO'
      Required = True
    end
    object QRelMapaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QRelMapaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QRelMapaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'MAPA_RESUMO.DATA_EMISSAO'
    end
    object QRelMapaHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'MAPA_RESUMO.HORA_EMISSAO'
    end
    object QRelMapaCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = 'MAPA_RESUMO.CODIGO_PAF'
    end
  end
  object RDprint: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Mapa Resumo'
    OpcoesPreview.PreviewZoom = -1
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'DATACAMP LTDA'
    RegistroUsuario.SerieProduto = 'SINGLE-0714/01190'
    RegistroUsuario.AutorizacaoKey = '9HHM-SS2W-455Y-ZASZ-9VI8'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Central de Compras Cricare'
    TitulodoRelatorio = 'Mapa Resumo'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 88
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDprintNewPage
    OnBeforeNewPage = RDprintBeforeNewPage
    Left = 312
    Top = 8
  end
  object QItensMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, G.TIPO_GRP, G.ALIQUOTA_GRP'
      'FROM  ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'WHERE I.CODIGO = :CODIGO'
      'ORDER BY I.COD_GRP')
    Left = 256
    Top = 72
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QItensMapaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QItensMapaCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
    object QItensMapaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_MAPA_RESUMO.VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensMapaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QItensMapaINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
    object QItensMapaCODIGO_LIVRO_FISCAL: TIntegerField
      FieldName = 'CODIGO_LIVRO_FISCAL'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO_LIVRO_FISCAL'
    end
    object QItensMapaORDEM_LIVRO_FISCAL: TIntegerField
      FieldName = 'ORDEM_LIVRO_FISCAL'
      Origin = 'ITENS_MAPA_RESUMO.ORDEM_LIVRO_FISCAL'
    end
    object QItensMapaTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QItensMapaALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
