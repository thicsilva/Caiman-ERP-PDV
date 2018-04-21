object FrmEntradaValores: TFrmEntradaValores
  Left = 437
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 398
  ClientWidth = 650
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
    Width = 650
    Height = 337
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 263
      Width = 650
      Height = 74
      Align = alBottom
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 8
        Width = 48
        Height = 21
        Caption = 'Valor :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 414
        Top = 8
        Width = 120
        Height = 21
        Caption = 'Total em Caixa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtValor: TCurrencyEdit
        Left = 10
        Top = 32
        Width = 167
        Height = 28
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtTotal: TCurrencyEdit
        Left = 414
        Top = 32
        Width = 224
        Height = 29
        Margins.Left = 1
        Margins.Top = 1
        Color = 11206570
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      Left = 38
      Top = 16
      Width = 585
      Height = 241
      DataSource = DSCaixa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = '  Descri'#231#227'o'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = ' Valor'
          Width = 150
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 650
    Height = 42
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOk: TButton
      Left = 218
      Top = 6
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TButton
      Left = 382
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 298
      Top = 6
      Width = 73
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 1
      OnClick = BtnMenuFiscalClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 650
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/sair'
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 264
    Top = 136
  end
  object QConsulta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 304
    Top = 136
  end
  object DSCaixa: TDataSource
    DataSet = Caixa
    Left = 264
    Top = 208
  end
  object Caixa: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CaixaIndex1'
        Fields = 'COD'
        Options = [ixPrimary]
      end>
    IndexName = 'CaixaIndex1'
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 200
    object CaixaCOD: TAutoIncField
      FieldName = 'COD'
    end
    object CaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object CaixaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object CaixaTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
end
