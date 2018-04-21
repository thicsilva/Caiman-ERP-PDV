object FrmProdutoNaoCadastrado: TFrmProdutoNaoCadastrado
  Left = 325
  Top = 272
  BorderStyle = bsSingle
  Caption = 'Produto n'#227'o Cadastrado'
  ClientHeight = 152
  ClientWidth = 485
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 133
    Width = 485
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair         [ALT+M] Menu Fiscal'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 133
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Caption = 'PRODUTO N'#195'O CADASTRADO'
    Color = 16710131
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 550
    OnTimer = Timer1Timer
    Left = 440
    Top = 56
  end
end
