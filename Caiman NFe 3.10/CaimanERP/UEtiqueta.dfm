object FrmEtiqueta: TFrmEtiqueta
  Left = 262
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Etiquetas de Produto'
  ClientHeight = 330
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 311
    Width = 595
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Entrada'
    end
    object cod_lab: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Laborat'#243'rio'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BtnOK: TBitBtn
      Left = 85
      Top = 21
      Width = 60
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 149
      Top = 21
      Width = 60
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 595
    Height = 63
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 120
    Width = 595
    Height = 191
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 591
      Height = 187
      Align = alClient
      Color = clSilver
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
