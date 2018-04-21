object FrmLMFRed: TFrmLMFRed
  Left = 351
  Top = 272
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Leitura de MF por Redu'#231#227'o'
  ClientHeight = 115
  ClientWidth = 270
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
    Width = 270
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Red.Inicial'
    end
    object Label2: TLabel
      Left = 152
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Red.Final'
    end
    object EdtRedIni: TEdit
      Left = 40
      Top = 24
      Width = 73
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
    object EdtRedFin: TEdit
      Left = 152
      Top = 24
      Width = 73
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 270
    Height = 39
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOk: TButton
      Left = 14
      Top = 8
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TButton
      Left = 182
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 98
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
    Top = 96
    Width = 270
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/sair'
  end
end
