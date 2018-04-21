object FrmCancelaItem: TFrmCancelaItem
  Left = 484
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Item'
  ClientHeight = 105
  ClientWidth = 243
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
    Width = 243
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Item >>>'
    end
    object EdtItem: TEdit
      Left = 64
      Top = 12
      Width = 129
      Height = 21
      MaxLength = 3
      TabOrder = 0
      OnKeyPress = EdtItemKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 243
    Height = 45
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object EdtSenha: TEdit
      Left = 64
      Top = 11
      Width = 129
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = EdtSenhaKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 86
    Width = 243
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
end
