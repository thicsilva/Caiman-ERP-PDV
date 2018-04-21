object FrmConsValesFuncionario: TFrmConsValesFuncionario
  Left = 234
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vales Funcion'#225'rio [Consulta]'
  ClientHeight = 444
  ClientWidth = 710
  Color = clWhite
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
    Width = 710
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 353
      Height = 49
      Caption = 'Funcion'#225'rio'
      TabOrder = 0
      object BtnConsFun: TsSpeedButton
        Left = 61
        Top = 20
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
      object EdtCodFun: TEdit
        Left = 8
        Top = 20
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
        Top = 20
        Width = 257
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
    object CheckFunc: TCheckBox
      Left = 8
      Top = 56
      Width = 201
      Height = 17
      TabStop = False
      Caption = 'Todos os Funcion'#225'rios'
      TabOrder = 1
      OnClick = CheckFuncClick
    end
    object RDG: TRadioGroup
      Left = 368
      Top = 8
      Width = 249
      Height = 49
      Columns = 3
      Items.Strings = (
        'Em Abertos'
        'Pagos'
        'Todos')
      TabOrder = 2
    end
    object BtnOk: TButton
      Left = 634
      Top = 16
      Width = 55
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 634
      Top = 48
      Width = 55
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 710
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 536
      Top = 318
      Width = 51
      Height = 13
      Caption = 'Total >>>'
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 710
      Height = 303
      Align = alTop
      Color = clSilver
      DataSource = DSQCons
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_PAGTO'
          Title.Alignment = taCenter
          Title.Caption = 'DT.PAGTO.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'FUNCION'#193'RIO'
          Width = 299
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AUTORIZADO_VALE'
          Title.Alignment = taCenter
          Title.Caption = 'AUTORIZADO'
          Visible = True
        end>
    end
    object EdtTotal: TCurrencyEdit
      Left = 592
      Top = 312
      Width = 97
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
    object BtnLocalizar: TBitBtn
      Left = 317
      Top = 312
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 2
      OnClick = BtnLocalizarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 425
    Width = 710
    Height = 19
    Panels = <>
  end
  object DSQCons: TDataSource
    AutoEdit = False
    DataSet = QCons
    Left = 352
    Top = 264
  end
  object QCons: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT V.*, F.NOME_FUN'
      'FROM VALES_FUNCIONARIO V'
      'INNER JOIN FUNCIONARIO F'
      'ON (V.COD_FUN = F.COD_FUN)')
    Left = 352
    Top = 216
    object QConsCOD_VALE: TIntegerField
      FieldName = 'COD_VALE'
      Origin = 'VALES_FUNCIONARIO.COD_VALE'
      Required = True
    end
    object QConsCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Origin = 'VALES_FUNCIONARIO.COD_FUN'
      Required = True
    end
    object QConsDATA_VALE: TDateField
      FieldName = 'DATA_VALE'
      Origin = 'VALES_FUNCIONARIO.DATA_VALE'
      Required = True
    end
    object QConsDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
      Origin = 'VALES_FUNCIONARIO.DATA_PAGTO'
    end
    object QConsVALOR_VALE: TBCDField
      FieldName = 'VALOR_VALE'
      Origin = 'VALES_FUNCIONARIO.VALOR_VALE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsAUTORIZADO_VALE: TStringField
      FieldName = 'AUTORIZADO_VALE'
      Origin = 'VALES_FUNCIONARIO.AUTORIZADO_VALE'
      Size = 80
    end
    object QConsNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Origin = 'FUNCIONARIO.NOME_FUN'
      Required = True
      Size = 60
    end
  end
end
