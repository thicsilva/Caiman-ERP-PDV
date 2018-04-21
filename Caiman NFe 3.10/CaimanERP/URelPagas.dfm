object FrmRelPagas: TFrmRelPagas
  Left = 403
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Contas Pagas'
  ClientHeight = 340
  ClientWidth = 384
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 281
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 369
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 184
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 48
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 216
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 1
      end
    end
    object GB2: TGroupBox
      Left = 8
      Top = 104
      Width = 369
      Height = 81
      Caption = 'Fornecedor Inicial/Final'
      TabOrder = 2
      object BtnConsIni: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Conv'#234'nio'
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
        OnClick = BtnConsIniClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnConsFin: TsSpeedButton
        Left = 61
        Top = 50
        Width = 23
        Height = 21
        Hint = 'Consultar Conv'#234'nio'
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
        OnClick = BtnConsFinClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodIni: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Conv'#234'nio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodIniEnter
        OnExit = EdtCodIniExit
        OnKeyDown = EdtCodIniKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
      object EdtNomeIni: TEdit
        Left = 88
        Top = 18
        Width = 273
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object EdtCodFin: TEdit
        Left = 8
        Top = 50
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Conv'#234'nio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodFinEnter
        OnExit = EdtCodFinExit
        OnKeyDown = EdtCodFinKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
      object EdtNomeFin: TEdit
        Left = 88
        Top = 50
        Width = 273
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object CheckFor: TCheckBox
      Left = 8
      Top = 184
      Width = 161
      Height = 17
      TabStop = False
      Caption = 'Todos os Fornecedores'
      TabOrder = 4
      OnClick = CheckForClick
    end
    object CheckEmp: TCheckBox
      Left = 248
      Top = 256
      Width = 129
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
    object Rdg: TRadioGroup
      Left = 8
      Top = 56
      Width = 369
      Height = 49
      Caption = 'Agrupado por'
      Columns = 2
      Items.Strings = (
        'Data Pagamento'
        'Fornecedor')
      TabOrder = 1
    end
    object GBCla: TGroupBox
      Left = 7
      Top = 208
      Width = 369
      Height = 49
      Caption = 'Classifica'#231#227'o'
      TabOrder = 3
      object BtnConsCla: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Conv'#234'nio'
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
        OnClick = BtnConsClaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodCla: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Conv'#234'nio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodClaEnter
        OnExit = EdtCodClaExit
        OnKeyDown = EdtCodClaKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
      object EdtNomeCla: TEdit
        Left = 88
        Top = 18
        Width = 273
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object CheckCla: TCheckBox
      Left = 8
      Top = 256
      Width = 161
      Height = 17
      TabStop = False
      Caption = 'Todos as Classifica'#231#245'es'
      TabOrder = 6
      OnClick = CheckClaClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 281
    Width = 384
    Height = 40
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 321
    Width = 384
    Height = 19
    Panels = <>
  end
  object QPagas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_CPT, P.DATA_CTP, P.DTVENCTO_CTP, P.DTPAGTO_CTP, P.N' +
        'UM_DOC_CTP, P.VALOR_CTP, P.VALOR_PAGO_CTP, P.OBS_CTP, P.COD_FOR,' +
        ' '
      'P.DESCONTO_CTP, P.ACRESCIMO_CTP, '
      'P.COD_CLASSIFICACAO,  F.RAZAO_FOR, CF.DESCRICAO'
      'FROM CONTAS_PAGAR P'
      'INNER JOIN FORNECEDOR F'
      'ON (P.COD_FOR = F.COD_FOR)'
      'INNER JOIN CLASSIFICACAO_CONTAS_PAGAR CF'
      'ON (P.COD_CLASSIFICACAO = CF.CODIGO)')
    Left = 344
    Top = 16
    object QPagasCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Origin = 'CONTAS_PAGAR.COD_CPT'
      Required = True
    end
    object QPagasDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Origin = 'CONTAS_PAGAR.DATA_CTP'
      Required = True
    end
    object QPagasDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
      Required = True
    end
    object QPagasDTPAGTO_CTP: TDateField
      FieldName = 'DTPAGTO_CTP'
      Origin = 'CONTAS_PAGAR.DTPAGTO_CTP'
    end
    object QPagasNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QPagasVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QPagasVALOR_PAGO_CTP: TBCDField
      FieldName = 'VALOR_PAGO_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_PAGO_CTP'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QPagasRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QPagasOBS_CTP: TStringField
      FieldName = 'OBS_CTP'
      Origin = 'CONTAS_PAGAR.OBS_CTP'
      Size = 60
    end
    object QPagasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'CONTAS_PAGAR.COD_FOR'
      Required = True
    end
    object QPagasCOD_CLASSIFICACAO: TIntegerField
      FieldName = 'COD_CLASSIFICACAO'
      Origin = 'CONTAS_PAGAR.COD_CLASSIFICACAO'
      Required = True
    end
    object QPagasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_PAGAR.DESCRICAO'
      Required = True
      Size = 80
    end
    object QPagasDESCONTO_CTP: TBCDField
      FieldName = 'DESCONTO_CTP'
      Origin = 'CONTAS_PAGAR.DESCONTO_CTP'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QPagasACRESCIMO_CTP: TBCDField
      FieldName = 'ACRESCIMO_CTP'
      Origin = 'CONTAS_PAGAR.ACRESCIMO_CTP'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
end
