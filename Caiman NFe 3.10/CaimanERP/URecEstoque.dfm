object FrmRecEstoque: TFrmRecEstoque
  Left = 469
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rec'#225'lculo de Estoque'
  ClientHeight = 239
  ClientWidth = 432
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
    Width = 432
    Height = 177
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 136
      Width = 74
      Height = 17
      Caption = '* ATEN'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 152
      Width = 417
      Height = 16
      AutoSize = False
      Caption = 'Se existir Produtos Composi'#231#227'o, fazer rec'#225'lculo completo.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GB1: TGroupBox
      Left = 2
      Top = 2
      Width = 428
      Height = 49
      Align = alTop
      Caption = 'Local de Estoque'
      TabOrder = 0
      object BtnConsLocal: TsSpeedButton
        Left = 68
        Top = 18
        Width = 23
        Height = 22
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
        OnClick = BtnConsLocalClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodLocal: TEdit
        Left = 8
        Top = 18
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodLocalEnter
        OnExit = EdtCodLocalExit
        OnKeyDown = EdtCodLocalKeyDown
        OnKeyPress = EdtCodLocalKeyPress
      end
      object EdtNomeLocal: TEdit
        Left = 95
        Top = 18
        Width = 322
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
      end
    end
    object GB2: TGroupBox
      Left = 2
      Top = 51
      Width = 428
      Height = 47
      Align = alTop
      Caption = 'Setor de Estoque'
      TabOrder = 1
      object BtnConsSetor: TsSpeedButton
        Left = 68
        Top = 18
        Width = 23
        Height = 22
        Hint = 'Consultar '
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
        OnClick = BtnConsSetorClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodSetor: TEdit
        Left = 8
        Top = 18
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodSetorEnter
        OnExit = EdtCodSetorExit
        OnKeyDown = EdtCodSetorKeyDown
        OnKeyPress = EdtCodLocalKeyPress
      end
      object EdtNomeSetor: TEdit
        Left = 95
        Top = 18
        Width = 322
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 432
    Height = 62
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TBitBtn
      Left = 239
      Top = 11
      Width = 66
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object BtnOK: TBitBtn
      Left = 127
      Top = 11
      Width = 74
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object SB: TStatusBar
      Left = 2
      Top = 41
      Width = 428
      Height = 19
      Panels = <>
      SimplePanel = True
    end
  end
  object QConsPro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_PRO'
      'FROM PRODUTO'
      'WHERE CONTROLA_ESTOQUE_PRO = '#39'S'#39)
    Left = 208
    Top = 104
    object QConsProCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
  end
  object IBTRAux: TFDTransaction
    Connection = DM.IBDatabase
    Left = 312
    Top = 104
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAux
    Left = 264
    Top = 104
  end
  object IBSPEstoque: TFDStoredProc
    Connection = DM.IBDatabase
    Transaction = IBTRAux
    StoredProcName = 'SP_ATUALIZA_ESTOQUE'
    Left = 376
    Top = 104
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'QUANT'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'LOCAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object QComposicao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT COD_PRO_COMPOSICAO, QUANT'
      'FROM PRODUTOS_COMPOSICAO'
      'WHERE COD_PRO = :CODPRO')
    Left = 144
    Top = 104
    ParamData = <
      item
        Name = 'CODPRO'
      end>
    object QComposicaoCOD_PRO_COMPOSICAO: TIntegerField
      FieldName = 'COD_PRO_COMPOSICAO'
      Origin = 'PRODUTOS_COMPOSICAO.COD_PRO_COMPOSICAO'
      Required = True
    end
    object QComposicaoQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'PRODUTOS_COMPOSICAO.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object QLimpaEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'UPDATE ESTOQUE'
      'SET ESTOQUE = 0'
      
        'WHERE COD_PRO = :CODPRO AND CODIGO_LOCAL_ESTOQUE = :LOCAL AND CO' +
        'D_EMP = :CODEMP')
    Left = 192
    Top = 8
    ParamData = <
      item
        Name = 'CODPRO'
      end
      item
        Name = 'LOCAL'
      end
      item
        Name = 'CODEMP'
      end>
  end
end
