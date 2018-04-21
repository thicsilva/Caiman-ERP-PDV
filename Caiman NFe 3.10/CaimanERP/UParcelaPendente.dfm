object FrmParcelaPendente: TFrmParcelaPendente
  Left = 357
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parcela Pendente'
  ClientHeight = 118
  ClientWidth = 341
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label2: TLabel
      Left = 120
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Vencimento'
    end
    object Label3: TLabel
      Left = 232
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Valor'
    end
    object EdtEmissao: TMaskEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = EdtEmissaoExit
    end
    object EdtVenc: TMaskEdit
      Left = 120
      Top = 24
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = EdtVencExit
    end
    object EdtValor: TCurrencyEdit
      Left = 232
      Top = 24
      Width = 97
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 2
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 341
    Height = 42
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 64
      Top = 8
      Width = 73
      Height = 27
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 192
      Top = 8
      Width = 73
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 99
    Width = 341
    Height = 19
    Panels = <>
  end
end
