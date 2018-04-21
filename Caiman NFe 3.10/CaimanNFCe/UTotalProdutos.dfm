object FrmTotalProdutos: TFrmTotalProdutos
  Left = 419
  Top = 284
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Total dos Produtos'
  ClientHeight = 175
  ClientWidth = 230
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 230
    Height = 156
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 14
      Width = 142
      Height = 16
      Caption = 'Produtos em Promo'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 79
      Width = 146
      Height = 16
      Caption = 'Produtos fora Promo'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EdtPromocao: TCurrencyEdit
      Left = 32
      Top = 31
      Width = 169
      Height = 35
      Margins.Left = 8
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = 11307078
      Ctl3D = True
      DisplayFormat = ',#0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtForaPromocao: TCurrencyEdit
      Left = 32
      Top = 95
      Width = 169
      Height = 35
      Margins.Left = 8
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = 11307078
      Ctl3D = True
      DisplayFormat = ',#0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 156
    Width = 230
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = '[ESC] para sair   [ALT+M] Menu Fiscal'
  end
end
