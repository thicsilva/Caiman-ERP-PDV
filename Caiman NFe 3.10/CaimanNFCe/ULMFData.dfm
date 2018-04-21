object FrmLMFData: TFrmLMFData
  Left = 440
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Leitura MF por Data'
  ClientHeight = 113
  ClientWidth = 290
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
    Width = 290
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 160
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object EdtDataIni: TDateTimePicker
      Left = 24
      Top = 24
      Width = 97
      Height = 21
      Date = 37969.495097338000000000
      Time = 37969.495097338000000000
      TabOrder = 0
    end
    object EdtDataFin: TDateTimePicker
      Left = 160
      Top = 24
      Width = 97
      Height = 21
      Date = 37969.495097338000000000
      Time = 37969.495097338000000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 290
    Height = 37
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOk: TButton
      Left = 25
      Top = 8
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TButton
      Left = 193
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 109
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 1
      OnClick = BtnMenuFiscalClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 94
    Width = 290
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/sair'
  end
end
