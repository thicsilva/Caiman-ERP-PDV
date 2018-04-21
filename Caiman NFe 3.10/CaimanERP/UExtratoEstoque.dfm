object FrmExtratoEstoque: TFrmExtratoEstoque
  Left = 271
  Top = 147
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Extrato de Estoque'
  ClientHeight = 503
  ClientWidth = 794
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnConsPro: TsSpeedButton
      Left = 68
      Top = 24
      Width = 23
      Height = 21
      Hint = 'Consultar Fornecedor'
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
      OnClick = BtnConsProClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Produto'
    end
    object Label2: TLabel
      Left = 424
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Inicio Estoque'
    end
    object Label3: TLabel
      Left = 520
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Data'
    end
    object EdtCodPro: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Fornecedor'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodProEnter
      OnExit = EdtCodProExit
      OnKeyDown = EdtCodProKeyDown
      OnKeyPress = EdtCodProKeyPress
    end
    object EdtNomePro: TEdit
      Left = 95
      Top = 24
      Width = 311
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
      TabOrder = 4
    end
    object BtnOk: TBitBtn
      Left = 624
      Top = 20
      Width = 65
      Height = 29
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TBitBtn
      Left = 704
      Top = 20
      Width = 65
      Height = 29
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 48
      Width = 177
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
    object EdtInicioEstoque: TMaskEdit
      Left = 424
      Top = 24
      Width = 73
      Height = 21
      Color = clSilver
      Enabled = False
      EditMask = '00/00/0000'
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
    end
    object EdtData: TMaskEdit
      Left = 520
      Top = 24
      Width = 73
      Height = 21
      Color = clSilver
      EditMask = '00/00/0000'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = EdtDataExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 794
    Height = 419
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object SG: TStringGrid
      Left = 2
      Top = 2
      Width = 790
      Height = 415
      Align = alClient
      Color = clSilver
      ColCount = 6
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        76
        87
        90
        91
        364
        51)
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 484
    Width = 794
    Height = 19
    Panels = <>
  end
  object QSaldoAnt: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_ESTOQUE_ANTERIOR (:CODPRO, :CODEMP, :DATAINI)')
    Left = 176
    Top = 232
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end>
    object QSaldoAntESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'SP_ESTOQUE_ANTERIOR.ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
  end
  object QMov: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_EXTRATO_ESTOQUE'
      '(:CODEMP, :CODPRO, :DATAINI)'
      'ORDER BY DATA, TIPO')
    Left = 264
    Top = 232
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end>
    object QMovTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'SP_EXTRATO_ESTOQUE.TIPO'
    end
    object QMovCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'SP_EXTRATO_ESTOQUE.COD_EMP'
    end
    object QMovDATA: TDateField
      FieldName = 'DATA'
      Origin = 'SP_EXTRATO_ESTOQUE.DATA'
    end
    object QMovQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'SP_EXTRATO_ESTOQUE.QUANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QMovHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'SP_EXTRATO_ESTOQUE.HISTORICO'
      Size = 150
    end
  end
end
