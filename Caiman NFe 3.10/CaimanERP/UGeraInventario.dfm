object FrmGeraInventario: TFrmGeraInventario
  Left = 301
  Top = 253
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Invent'#225'rio'
  ClientHeight = 140
  ClientWidth = 288
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
    Width = 288
    Height = 81
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Data p/gera'#231#227'o'
    end
    object EdtData: TDateTimePicker
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Date = 39283.503117939800000000
      Time = 39283.503117939800000000
      TabOrder = 0
    end
    object Check: TCheckBox
      Left = 8
      Top = 56
      Width = 273
      Height = 17
      Caption = 'Incluir Produtos com Estoque Zerados ou Negativos'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 288
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Button1: TButton
      Left = 58
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 154
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 121
    Width = 288
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_INSERT_INVENTARIO(:DATA, :CODEMP)')
    Left = 136
    Top = 8
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODEMP'
      end>
    object QInsertCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_INVENTARIO.CODIGO'
    end
  end
  object CMD: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 136
    Top = 72
  end
end
