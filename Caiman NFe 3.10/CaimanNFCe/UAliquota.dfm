object FrmAliquota: TFrmAliquota
  Left = 436
  Top = 283
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Programar Al'#237'quota'
  ClientHeight = 213
  ClientWidth = 363
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 194
    Width = 363
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 153
    Align = alTop
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 96
      Width = 38
      Height = 13
      Caption = 'Aliquota'
    end
    object EdtAliq: TCurrencyEdit
      Left = 16
      Top = 112
      Width = 81
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object Memo: TMemo
      Left = 112
      Top = 8
      Width = 241
      Height = 137
      TabStop = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object RdgICMS: TRadioButton
      Left = 8
      Top = 40
      Width = 73
      Height = 17
      Caption = 'ICMS'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RdgISS: TRadioButton
      Left = 8
      Top = 64
      Width = 81
      Height = 17
      Caption = 'ISS'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 363
    Height = 41
    Align = alClient
    Color = 16710131
    TabOrder = 2
    object BtnGravar: TButton
      Left = 13
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Programar'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TButton
      Left = 277
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnCancelarClick
    end
    object BtnLe: TButton
      Left = 108
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Ler Aliq.'
      TabOrder = 1
      OnClick = BtnLeClick
    end
    object BtnMenuFiscal: TButton
      Left = 189
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 2
      OnClick = BtnMenuFiscalClick
    end
  end
end
