object FrmHorarioVerao: TFrmHorarioVerao
  Left = 341
  Top = 281
  BorderStyle = bsSingle
  Caption = 'Programar Hor'#225'rio de Ver'#227'o'
  ClientHeight = 156
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 276
    Height = 137
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object BtnHabilitar: TButton
      Left = 17
      Top = 106
      Width = 75
      Height = 25
      Caption = '&Habilitar'
      TabOrder = 0
      OnClick = BtnHabilitarClick
    end
    object BtnDesabilitar: TButton
      Left = 100
      Top = 106
      Width = 75
      Height = 25
      Caption = '&Desabilitar'
      TabOrder = 1
      OnClick = BtnDesabilitarClick
    end
    object Memo: TMemo
      Left = 8
      Top = 24
      Width = 257
      Height = 73
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object BtnMenuFiscal: TButton
      Left = 184
      Top = 106
      Width = 75
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 3
      OnClick = BtnMenuFiscalClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 137
    Width = 276
    Height = 19
    Panels = <>
  end
end
