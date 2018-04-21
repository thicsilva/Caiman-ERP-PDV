object FrmDadosCheque: TFrmDadosCheque
  Left = 245
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Cheque'
  ClientHeight = 328
  ClientWidth = 458
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 309
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object Label6: TLabel
      Left = 8
      Top = 152
      Width = 39
      Height = 13
      Caption = 'Ag'#234'ncia'
    end
    object Label7: TLabel
      Left = 164
      Top = 152
      Width = 28
      Height = 13
      Caption = 'Conta'
    end
    object Label8: TLabel
      Left = 320
      Top = 152
      Width = 77
      Height = 13
      Caption = 'N'#250'mero Cheque'
    end
    object Label10: TLabel
      Left = 120
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Emiss'#227'o(*)'
    end
    object Label11: TLabel
      Left = 232
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Vencimento(*)'
    end
    object Label12: TLabel
      Left = 344
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Valor(*)'
    end
    object Label9: TLabel
      Left = 8
      Top = 200
      Width = 51
      Height = 13
      Caption = 'Emitente(*)'
    end
    object Label13: TLabel
      Left = 8
      Top = 248
      Width = 19
      Height = 13
      Caption = 'Obs'
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 72
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EdtNomeCli: TEdit
      Left = 80
      Top = 72
      Width = 353
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdtCodBanco: TEdit
      Left = 8
      Top = 120
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Banco'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object EdtNomeBanco: TEdit
      Left = 80
      Top = 120
      Width = 353
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdtAgencia: TEdit
      Left = 8
      Top = 168
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
    end
    object EdtConta: TEdit
      Left = 164
      Top = 168
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
    end
    object EdtNumero: TEdit
      Left = 320
      Top = 168
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
    end
    object EdtDataEmi: TMaskEdit
      Left = 119
      Top = 24
      Width = 89
      Height = 21
      EditMask = '99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 8
      Text = '  /  /    '
    end
    object EdtDataVenc: TMaskEdit
      Left = 231
      Top = 24
      Width = 89
      Height = 21
      EditMask = '99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 9
      Text = '  /  /    '
    end
    object EdtValor: TCurrencyEdit
      Left = 343
      Top = 24
      Width = 90
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 10
      ZeroEmpty = False
    end
    object EdtObs: TEdit
      Left = 8
      Top = 264
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      TabOrder = 11
    end
    object EdtEmitente: TEdit
      Left = 8
      Top = 216
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      TabOrder = 12
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 309
    Width = 458
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = '[ESC] para sair'
  end
end
