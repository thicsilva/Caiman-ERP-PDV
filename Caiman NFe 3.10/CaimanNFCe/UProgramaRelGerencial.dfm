object FrmProgramaRelGerencial: TFrmProgramaRelGerencial
  Left = 399
  Top = 280
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Programar Relat'#243'rio Gerencial'
  ClientHeight = 155
  ClientWidth = 389
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
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 389
    Height = 39
    Align = alClient
    Color = 16710131
    TabOrder = 0
    object BtnGravar: TButton
      Left = 62
      Top = 7
      Width = 73
      Height = 25
      Caption = '&Programar'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TButton
      Left = 254
      Top = 7
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 158
      Top = 7
      Width = 73
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 1
      OnClick = BtnMenuFiscalClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 97
    Align = alTop
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 29
      Height = 13
      Caption = #205'ndice'
    end
    object Label2: TLabel
      Left = 88
      Top = 16
      Width = 108
      Height = 13
      Caption = 'Descri'#231#227'o do Relat'#243'rio'
    end
    object Label3: TLabel
      Left = 16
      Top = 69
      Width = 260
      Height = 13
      Caption = '* ECF Daruma n'#227'o usa '#205'ndice para Relat'#243'rio Gerencial.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EdtIndice: TEdit
      Left = 16
      Top = 32
      Width = 49
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = EdtIndiceKeyPress
    end
    object EdtDescricao: TEdit
      Left = 88
      Top = 32
      Width = 241
      Height = 21
      MaxLength = 15
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 136
    Width = 389
    Height = 19
    Panels = <>
  end
end
