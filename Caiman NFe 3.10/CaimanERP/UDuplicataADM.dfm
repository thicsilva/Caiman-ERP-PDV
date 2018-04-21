object FrmDuplicataADM: TFrmDuplicataADM
  Left = 339
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber Cart'#227'o [Duplicata]'
  ClientHeight = 434
  ClientWidth = 611
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 415
    Width = 611
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 611
    Height = 294
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 611
      Height = 255
      Align = alTop
      Color = clSilver
      DataSource = DSQParcelas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'PARC.'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Title.Alignment = taCenter
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_DUPLICATA'
          Title.Alignment = taCenter
          Title.Caption = 'DUPLICATA'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'BANDEIRA'
          Width = 154
          Visible = True
        end>
    end
    object PanelDoc: TPanel
      Left = 168
      Top = 80
      Width = 217
      Height = 97
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 4
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 217
        Height = 97
        Align = alClient
        Caption = 'N'#250'mero do Documento'
        Color = 16710131
        ParentColor = False
        TabOrder = 0
        object EdtDoc: TEdit
          Left = 16
          Top = 24
          Width = 169
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
        end
        object BtnOK: TButton
          Left = 24
          Top = 56
          Width = 73
          Height = 25
          Caption = '&OK'
          TabOrder = 1
          OnClick = BtnOKClick
        end
        object BtnCancelar: TButton
          Left = 112
          Top = 56
          Width = 73
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 2
          OnClick = BtnCancelarClick
        end
      end
    end
    object BtnDoc: TButton
      Left = 186
      Top = 262
      Width = 105
      Height = 25
      Caption = '&Num.Documento'
      Enabled = False
      TabOrder = 2
      OnClick = BtnDocClick
    end
    object BtnImpressao: TButton
      Left = 319
      Top = 260
      Width = 105
      Height = 25
      Caption = '&Impress'#227'o Duplicata'
      Enabled = False
      TabOrder = 3
      OnClick = BtnImpressaoClick
    end
    object BtnSelecionar: TButton
      Left = 53
      Top = 262
      Width = 105
      Height = 25
      Caption = 'Selecionar Totas'
      Enabled = False
      TabOrder = 1
      OnClick = BtnSelecionarClick
    end
    object BtnAltera: TButton
      Left = 453
      Top = 260
      Width = 105
      Height = 25
      Caption = '&Alterar Parcela'
      Enabled = False
      TabOrder = 5
      OnClick = BtnAlteraClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Venda'
    end
    object Label2: TLabel
      Left = 440
      Top = 22
      Width = 59
      Height = 13
      Caption = 'Data Venda'
    end
    object Label3: TLabel
      Left = 440
      Top = 46
      Width = 59
      Height = 13
      Caption = 'Total Venda'
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 36
      Height = 13
      Caption = 'Cliente'
    end
    object BtnConsVenda: TsSpeedButton
      Left = 84
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Consultar Cliente'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000502020B4B201CB1662A26F032151275000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
        0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
        052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
        00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
        27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
        12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
        23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
        26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
        04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
        28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
        090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
        23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
        4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
        1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
        69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
        22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
        527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
        28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
        0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
        28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
        020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
        14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
        20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
        0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
        26F92F14116F0000000000000000000000000000000000000000000000000000
        0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
        0625000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsVendaClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label6: TLabel
      Left = 444
      Top = 70
      Width = 56
      Height = 13
      Caption = 'Nota Fiscal'
    end
    object Label7: TLabel
      Left = 436
      Top = 94
      Width = 68
      Height = 13
      Caption = 'Cupom Fiscal'
    end
    object EdtCodVenda: TEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      TabOrder = 0
      OnEnter = EdtCodVendaEnter
      OnKeyDown = EdtCodVendaKeyDown
    end
    object EdtData: TMaskEdit
      Left = 504
      Top = 16
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '  /  /    '
    end
    object EdtTotalVenda: TCurrencyEdit
      Left = 504
      Top = 40
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 88
      Width = 49
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object EdtNomeCli: TEdit
      Left = 64
      Top = 88
      Width = 361
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object EdtNF: TEdit
      Left = 504
      Top = 64
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object BtnConfirma: TButton
      Left = 120
      Top = 20
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnConfirmaClick
    end
    object BtnSair: TButton
      Left = 192
      Top = 20
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object EdtCOO: TEdit
      Left = 504
      Top = 88
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
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
    OpcoesPreview.MostrarSETUP = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Duplicatas'
    OpcoesPreview.PreviewZoom = 100
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
    RegistroUsuario.NomeRegistro = 'CARLOS JORGE MARTINS DOS SANTOS JUNIOR'
    RegistroUsuario.SerieProduto = 'SINGLE 6.1 - 1651/0616 (DX101)'
    RegistroUsuario.AutorizacaoKey = 'C0H3Y-SZPXG-TEWNN-69VHR-SXMQ3-5GWHT-6K59B'
    About = 'RDprint 6.1'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Duplicatas'
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
    TamanhoQteLinhas = 36
    TamanhoQteColunas = 140
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    Left = 24
    Top = 240
  end
  object QDuplicata: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_DUPLICATA_CARTAO(:CODIGO)')
    Left = 24
    Top = 296
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QDuplicataCOD_DUPLICATA: TIntegerField
      FieldName = 'COD_DUPLICATA'
      Origin = 'SP_DUPLICATA.COD_DUPLICATA'
    end
  end
  object QParcelas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParcelas
    SQL.Strings = (
      
        'SELECT R.CODIGO, R.PARCELA, R.VALOR, R.EMISSAO, R.VENCIMENTO,  R' +
        '.COD_CLI, R.DOCUMENTO, R.COD_VEN, R.CODIGO_DUPLICATA,'
      
        'C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI, C.CEPRES_C' +
        'LI, C.ESTRES_CLI, C.CNPJ_CLI, C.DOC_CLI, C.INSC_ESTADUAL, C.FJ_C' +
        'LI, B.DESCRICAO'
      'FROM CONTAS_RECEBER_ADM_CARTAO R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN BANDEIRAS_CARTAO B'
      'ON (R.CODIGO_BANDEIRA = B.CODIGO)'
      'WHERE R.COD_VEN = :CODVEN'
      'ORDER BY R.CODIGO')
    Left = 440
    Top = 232
    ParamData = <
      item
        Name = 'CODVEN'
      end>
    object QParcelasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO'
      Required = True
    end
    object QParcelasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QParcelasEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.EMISSAO'
      Required = True
    end
    object QParcelasVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VENCIMENTO'
      Required = True
    end
    object QParcelasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_CLI'
      Required = True
    end
    object QParcelasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DOCUMENTO'
    end
    object QParcelasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_VEN'
    end
    object QParcelasCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO_DUPLICATA'
    end
    object QParcelasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QParcelasENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QParcelasBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QParcelasCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QParcelasCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CLIENTE.CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QParcelasESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QParcelasCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QParcelasDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QParcelasINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = 'CLIENTE.INSC_ESTADUAL'
      Size = 30
    end
    object QParcelasFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = 'CLIENTE.FJ_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QParcelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QParcelasPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.PARCELA'
      Required = True
    end
  end
  object DSQParcelas: TDataSource
    AutoEdit = False
    DataSet = QParcelas
    Left = 440
    Top = 280
  end
  object IBTRParcelas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 512
    Top = 232
  end
end
