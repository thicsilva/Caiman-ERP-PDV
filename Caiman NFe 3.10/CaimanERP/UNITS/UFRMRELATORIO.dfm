object FrmRelatorio: TFrmRelatorio
  Left = 389
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio'
  ClientHeight = 112
  ClientWidth = 332
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Rdg: TRadioGroup
      Left = 2
      Top = 2
      Width = 328
      Height = 53
      Align = alClient
      Caption = 'Ordem de Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 332
    Height = 36
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TButton
      Left = 28
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
    end
    object BtnImp: TButton
      Left = 128
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TButton
      Left = 228
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnsairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 93
    Width = 332
    Height = 19
    Panels = <>
  end
end
