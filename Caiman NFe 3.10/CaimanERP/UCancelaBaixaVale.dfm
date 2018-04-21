object FrmCancelaBaixaVale: TFrmCancelaBaixaVale
  Left = 315
  Top = 266
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Baixa [Vale]'
  ClientHeight = 213
  ClientWidth = 472
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
    Width = 472
    Height = 153
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 113
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Data(*)'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 63
      Height = 13
      Caption = 'Cod.Func.(*)'
    end
    object Label5: TLabel
      Left = 112
      Top = 56
      Width = 112
      Height = 13
      Caption = 'Nome do Funcion'#225'rio'
    end
    object Label10: TLabel
      Left = 8
      Top = 104
      Width = 26
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 112
      Top = 104
      Width = 78
      Height = 13
      Caption = 'Autorizado por'
    end
    object Label6: TLabel
      Left = 233
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Dt.Pagto.'
    end
    object EdtCodVale: TEdit
      Left = 8
      Top = 24
      Width = 91
      Height = 21
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnExit = EdtCodValeExit
      OnKeyPress = EdtCodValeKeyPress
    end
    object EdtCodFun: TEdit
      Left = 8
      Top = 72
      Width = 90
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EdtNomeFun: TEdit
      Left = 112
      Top = 72
      Width = 345
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdtValor: TCurrencyEdit
      Left = 8
      Top = 119
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtAutorizado: TEdit
      Left = 112
      Top = 120
      Width = 345
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 80
      TabOrder = 4
    end
    object EdtData: TEdit
      Left = 113
      Top = 24
      Width = 97
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 80
      TabOrder = 5
    end
    object EdtDataPagto: TEdit
      Left = 233
      Top = 24
      Width = 97
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 80
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 472
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOk: TButton
      Left = 151
      Top = 8
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 263
      Top = 8
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 194
    Width = 472
    Height = 19
    Panels = <>
  end
end
