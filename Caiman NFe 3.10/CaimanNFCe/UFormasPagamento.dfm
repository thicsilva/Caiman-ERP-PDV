object FrmFormasPagamento: TFrmFormasPagamento
  Left = 416
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Pre'#231'o'
  ClientHeight = 382
  ClientWidth = 465
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 363
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 461
      Height = 359
      Align = alClient
      DataSource = DSFormas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_TABELA'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 363
    Width = 465
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Tecle ENTER para selecionar'
  end
  object CDSFormas: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CDSFormasCalcFields
    Left = 256
    Top = 48
    object CDSFormasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CDSFormasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object CDSFormasTABELA_PRECO: TIntegerField
      FieldName = 'TABELA_PRECO'
    end
    object CDSFormasCALC_TABELA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TABELA'
      Calculated = True
    end
  end
  object DSFormas: TDataSource
    AutoEdit = False
    DataSet = CDSFormas
    Left = 256
    Top = 104
  end
end
