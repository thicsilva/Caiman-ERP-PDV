object FrmValesBaixa: TFrmValesBaixa
  Left = 251
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vales [Baixa]'
  ClientHeight = 413
  ClientWidth = 598
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
    Width = 598
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Cod.Func.(*)'
    end
    object BtnConsFun: TsSpeedButton
      Left = 61
      Top = 24
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
      OnClick = BtnConsFunClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label5: TLabel
      Left = 88
      Top = 8
      Width = 112
      Height = 13
      Caption = 'Nome do Funcion'#225'rio'
    end
    object EdtCodFun: TEdit
      Left = 8
      Top = 24
      Width = 49
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodFunEnter
      OnExit = EdtCodFunExit
      OnKeyDown = EdtCodFunKeyDown
      OnKeyPress = EdtCodFunKeyPress
    end
    object EdtNomeFun: TEdit
      Left = 88
      Top = 24
      Width = 351
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
    object BtnOk: TButton
      Left = 448
      Top = 22
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 523
      Top = 22
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 598
    Height = 337
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label10: TLabel
      Left = 368
      Top = 310
      Width = 52
      Height = 13
      Caption = 'Total >>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 594
      Height = 287
      Align = alTop
      Color = clSilver
      DataSource = DSQConsVale
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 43
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_PAGTO'
          Title.Alignment = taCenter
          Title.Caption = 'DT.PAGTO.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 69
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'AUTORIZADO_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'AUTORIZADO'
          Width = 330
          Visible = True
        end>
    end
    object EdtTotal: TCurrencyEdit
      Left = 432
      Top = 303
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object BtnBaixar: TButton
      Left = 176
      Top = 302
      Width = 65
      Height = 25
      Caption = '&Baixar'
      TabOrder = 2
      OnClick = BtnBaixarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 394
    Width = 598
    Height = 19
    Panels = <>
  end
  object QConsVale: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM VALES_FUNCIONARIO'
      'WHERE COD_FUN = :CODFUN'
      'AND DATA_PAGTO IS NULL'
      'ORDER BY DATA_VALE')
    Left = 280
    Top = 144
    ParamData = <
      item
        Name = 'CODFUN'
      end>
    object QConsValeCOD_VALE: TIntegerField
      FieldName = 'COD_VALE'
      Origin = 'VALES_FUNCIONARIO.COD_VALE'
      Required = True
    end
    object QConsValeCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Origin = 'VALES_FUNCIONARIO.COD_FUN'
      Required = True
    end
    object QConsValeDATA_VALE: TDateField
      FieldName = 'DATA_VALE'
      Origin = 'VALES_FUNCIONARIO.DATA_VALE'
      Required = True
    end
    object QConsValeDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Origin = 'VALES_FUNCIONARIO.DATA_PAGTO'
    end
    object QConsValeVALOR_VALE: TBCDField
      FieldName = 'VALOR_VALE'
      Origin = 'VALES_FUNCIONARIO.VALOR_VALE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsValeAUTORIZADO_VALE: TStringField
      FieldName = 'AUTORIZADO_VALE'
      Origin = 'VALES_FUNCIONARIO.AUTORIZADO_VALE'
      Size = 80
    end
  end
  object DSQConsVale: TDataSource
    AutoEdit = False
    DataSet = QConsVale
    Left = 280
    Top = 192
  end
  object QBaixa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE VALES_FUNCIONARIO'
      'SET DATA_PAGTO = :DATA'
      'WHERE COD_VALE = :CODVALE')
    Left = 360
    Top = 144
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODVALE'
      end>
  end
end
