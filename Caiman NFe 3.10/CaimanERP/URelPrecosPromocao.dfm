object FrmRelPrecoPromocao: TFrmRelPrecoPromocao
  Left = 436
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Pre'#231'os Promocionais'
  ClientHeight = 363
  ClientWidth = 352
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 305
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RdgImp: TRadioGroup
      Left = 8
      Top = 8
      Width = 337
      Height = 41
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
    end
    object RdgTipo: TRadioGroup
      Left = 8
      Top = 56
      Width = 337
      Height = 41
      Caption = 'Tipo'
      Columns = 3
      Items.Strings = (
        'Geral'
        'Se'#231#227'o'
        'Fabricante')
      TabOrder = 1
      OnClick = RdgTipoClick
    end
    object GB: TGroupBox
      Left = 8
      Top = 96
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
        TabOrder = 2
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
        TabOrder = 3
        OnEnter = EdtCodFinEnter
        OnExit = EdtCodFinExit
        OnKeyDown = EdtCodFinKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
    end
    object Check: TCheckBox
      Left = 8
      Top = 176
      Width = 241
      Height = 17
      TabOrder = 3
      OnClick = CheckClick
    end
    object RdgTipo1: TRadioGroup
      Left = 8
      Top = 256
      Width = 337
      Height = 41
      Caption = 'Tipo'
      Columns = 3
      Items.Strings = (
        'Promo'#231#227'o'
        'Iniciando'
        'Terminando')
      TabOrder = 4
      OnClick = RdgTipoClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 200
      Width = 337
      Height = 49
      Caption = 'Intervalo'
      TabOrder = 5
      object Label1: TLabel
        Left = 165
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 44
        Top = 18
        Width = 97
        Height = 21
        Date = 38783.569172627300000000
        Time = 38783.569172627300000000
        Color = clSilver
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 196
        Top = 18
        Width = 97
        Height = 21
        Date = 38783.569172627300000000
        Time = 38783.569172627300000000
        Color = clSilver
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 305
    Width = 352
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 36
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 140
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 244
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
    Top = 344
    Width = 352
    Height = 19
    Panels = <>
  end
  object QRelPromocao: TFDQuery
    OnCalcFields = QRelPromocaoCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT PRO.COD_PRO, PRO.VALOR_PROMOCAO, PRO.COD_EMP, PRO.DATA_IN' +
        'ICIO, PRO.DATA_TERMINO, PRO.TIPO_PROMOCAO, P.NOME_PRO, P.VALOR_P' +
        'RO, P.COD_SEC, P.COD_LAB, S.NOME_SEC, L.NOME_LAB'
      'FROM PROMOCOES PRO'
      'INNER JOIN PRODUTO P'
      'ON (PRO.COD_PRO = P.COD_PRO)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'INNER JOIN LABORATORIO L'
      'ON (P.COD_LAB = L.COD_LAB)')
    Left = 280
    Top = 16
    object QRelPromocaoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PROMOCOES.COD_PRO'
      Required = True
    end
    object QRelPromocaoVALOR_PROMOCAO: TBCDField
      FieldName = 'VALOR_PROMOCAO'
      Origin = 'PROMOCOES.VALOR_PROMOCAO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelPromocaoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelPromocaoVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelPromocaoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object QRelPromocaoCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = 'PRODUTO.COD_LAB'
      Required = True
    end
    object QRelPromocaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QRelPromocaoNOME_LAB: TStringField
      FieldName = 'NOME_LAB'
      Origin = 'LABORATORIO.NOME_LAB'
      Required = True
      Size = 50
    end
    object QRelPromocaoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'PROMOCOES.DATA_INICIO'
      Required = True
    end
    object QRelPromocaoDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'PROMOCOES.DATA_TERMINO'
      Required = True
    end
    object QRelPromocaoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'PROMOCOES.COD_EMP'
    end
    object QRelPromocaoTIPO_PROMOCAO: TIntegerField
      FieldName = 'TIPO_PROMOCAO'
      Origin = 'PROMOCOES.TIPO_PROMOCAO'
      Required = True
    end
    object QRelPromocaoCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Size = 30
      Calculated = True
    end
  end
end
