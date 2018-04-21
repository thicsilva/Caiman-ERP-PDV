object FrmRelProduto: TFrmRelProduto
  Left = 462
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio da Tabela de Pre'#231'o'
  ClientHeight = 369
  ClientWidth = 353
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
    Width = 353
    Height = 313
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 161
      Height = 49
      Caption = 'Impress'#227'o por'
      TabOrder = 0
      object ComboTipo: TComboBox
        Left = 8
        Top = 16
        Width = 145
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        OnChange = ComboTipoChange
        Items.Strings = (
          'GERAL'
          'FABRICANTE'
          'SE'#199#195'O')
      end
    end
    object GroupBox2: TGroupBox
      Left = 176
      Top = 8
      Width = 169
      Height = 49
      Caption = 'Ativo/N'#227'o Ativo'
      TabOrder = 1
      object ComboAtivo: TComboBox
        Left = 8
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'TODOS'
          'ATIVOS'
          'N'#195'O ATIVOS')
      end
    end
    object GB: TGroupBox
      Left = 8
      Top = 56
      Width = 337
      Height = 81
      TabOrder = 2
      object BtnConsIni: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar'
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
        Hint = 'Consultar'
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
        Hint = 'Pressione F2 para Consultar'
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
        Width = 241
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
        Hint = 'Pressione F2 para Consultar'
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
        Width = 241
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
    object Check: TCheckBox
      Left = 8
      Top = 136
      Width = 337
      Height = 17
      TabStop = False
      Caption = 'Todos as Se'#231#245'es'
      TabOrder = 6
      OnClick = CheckClick
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 160
      Width = 337
      Height = 45
      Caption = 'Produtos Pesados'
      TabOrder = 3
      object ComboPesados: TComboBox
        Left = 8
        Top = 18
        Width = 321
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'Pesados'
          'N'#227'o Pesados'
          'Todos')
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 208
      Width = 337
      Height = 45
      Caption = 'Produtos Marcados'
      TabOrder = 4
      object ComboMarcados: TComboBox
        Left = 8
        Top = 18
        Width = 321
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'Marcados'
          'N'#227'o Marcados'
          'Todos')
      end
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 256
      Width = 337
      Height = 45
      Caption = 'Ordem para Impress'#227'o'
      TabOrder = 5
      object ComboOrdem: TComboBox
        Left = 8
        Top = 18
        Width = 321
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'C'#243'digo'
          'Nome'
          'Refer'#234'ncia')
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 353
    Height = 37
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 43
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 139
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 235
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 350
    Width = 353
    Height = 19
    Panels = <>
  end
  object QProdGeral: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_PRO, NOME_PRO, VALOR_PRO, PROMOCAO_PRO,  ATIVO_PRO, L' +
        'OCALIZACAO_PRO, REFERENCIA_PRO,  CODIGO_BARRA_PRO, PRECO_PRAZO_P' +
        'RO, U.DESCRICAO'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)')
    Left = 280
    Top = 80
    object QProdGeralCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QProdGeralNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QProdGeralVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdGeralPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdGeralATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'PRODUTO.ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdGeralLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'PRODUTO.LOCALIZACAO_PRO'
    end
    object QProdGeralREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QProdGeralCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QProdGeralPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRODUTO.PRECO_PRAZO_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdGeralDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object QRelSecaoLab: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, P.ATI' +
        'VO_PRO, P.LOCALIZACAO_PRO, P.REFERENCIA_PRO, P.COD_SEC, P.COD_LA' +
        'B, P.CODIGO_BARRA_PRO, P.PRECO_PRAZO_PRO,  L.NOME_LAB,  S.NOME_S' +
        'EC, U.DESCRICAO'
      'FROM PRODUTO P'
      'INNER JOIN LABORATORIO L'
      'ON (P.COD_LAB = L.COD_LAB)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)')
    Left = 184
    Top = 80
    object QRelSecaoLabCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QRelSecaoLabNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelSecaoLabVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelSecaoLabPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelSecaoLabATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'PRODUTO.ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelSecaoLabLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'PRODUTO.LOCALIZACAO_PRO'
    end
    object QRelSecaoLabREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QRelSecaoLabCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object QRelSecaoLabCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = 'PRODUTO.COD_LAB'
      Required = True
    end
    object QRelSecaoLabNOME_LAB: TStringField
      FieldName = 'NOME_LAB'
      Origin = 'LABORATORIO.NOME_LAB'
      Required = True
      Size = 50
    end
    object QRelSecaoLabNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QRelSecaoLabCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QRelSecaoLabPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRODUTO.PRECO_PRAZO_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelSecaoLabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
end
