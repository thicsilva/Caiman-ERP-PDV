object FrmRelAbaixoMinimo: TFrmRelAbaixoMinimo
  Left = 361
  Top = 343
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rel. de Prod. Abaixo do M'#237'nimo'
  ClientHeight = 243
  ClientWidth = 382
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 185
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RDG: TRadioGroup
      Left = 5
      Top = 130
      Width = 375
      Height = 39
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 2
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 168
      Width = 129
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object GBSecao: TGroupBox
      Left = 2
      Top = 2
      Width = 378
      Height = 49
      Align = alTop
      Caption = 'Se'#231#227'o'
      TabOrder = 0
      object BtnConsSec: TsSpeedButton
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
        OnClick = BtnConsSecClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodSec: TEdit
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
        OnEnter = EdtCodSecEnter
        OnExit = EdtCodSecExit
        OnKeyDown = EdtCodSecKeyDown
        OnKeyPress = EdtCodSecKeyPress
      end
      object EdtNomeSec: TEdit
        Left = 88
        Top = 18
        Width = 281
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
    object CheckSecao: TCheckBox
      Left = 8
      Top = 53
      Width = 369
      Height = 17
      TabStop = False
      Caption = 'Todas as Se'#231#245'es'
      TabOrder = 4
      OnClick = CheckSecaoClick
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 80
      Width = 372
      Height = 49
      Caption = 'Classifica'#231#227'o do Produto'
      TabOrder = 1
      object ComboClassif: TComboBox
        Left = 8
        Top = 16
        Width = 353
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 185
    Width = 382
    Height = 39
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 51
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 153
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 255
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
    Top = 224
    Width = 382
    Height = 19
    Panels = <>
  end
  object QRelAbaixo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT SUM(E.ESTOQUE) ATUAL, E.COD_PRO, P.NOME_PRO, P.ESTOQUE_MI' +
        'NIMO_PRO'
      'FROM ESTOQUE E'
      'INNER JOIN PRODUTO P'
      'ON (E.COD_PRO = P.COD_PRO)'
      'WHERE P.ESTOQUE_MINIMO_PRO > 0'
      'GROUP BY E.COD_PRO, P.NOME_PRO, P.ESTOQUE_MINIMO_PRO'
      'HAVING SUM(E.ESTOQUE) < P.ESTOQUE_MINIMO_PRO')
    Left = 304
    Top = 136
    object QRelAbaixoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object QRelAbaixoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelAbaixoESTOQUE_MINIMO_PRO: TBCDField
      FieldName = 'ESTOQUE_MINIMO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelAbaixoATUAL: TBCDField
      FieldName = 'ATUAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
  end
end
