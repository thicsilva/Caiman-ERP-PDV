object FrmLiberaSistema: TFrmLiberaSistema
  Left = 458
  Top = 475
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Inicio Estoque'
  ClientHeight = 91
  ClientWidth = 284
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
    Width = 284
    Height = 72
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Data'
    end
    object EdtData: TDateTimePicker
      Left = 16
      Top = 32
      Width = 97
      Height = 21
      Date = 38957.486388159700000000
      Time = 38957.486388159700000000
      TabOrder = 0
    end
    object BtnOK: TBitBtn
      Left = 132
      Top = 28
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 204
      Top = 28
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 72
    Width = 284
    Height = 19
    Panels = <>
  end
end
