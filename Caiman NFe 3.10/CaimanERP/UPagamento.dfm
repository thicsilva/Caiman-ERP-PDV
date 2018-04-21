object FrmPagamento: TFrmPagamento
  Left = 395
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar - Pagamento'
  ClientHeight = 222
  ClientWidth = 477
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 399
    Top = 48
    Width = 71
    Height = 13
    Caption = 'Vencimento(*)'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 203
    Width = 477
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 203
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label8: TLabel
      Left = 96
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object Label9: TLabel
      Left = 184
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Valor Pago'
    end
    object Label11: TLabel
      Left = 111
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Total a Pagar'
    end
    object Label3: TLabel
      Left = 216
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Tipo de Pagamento'
    end
    object Label4: TLabel
      Left = 288
      Top = 64
      Width = 67
      Height = 13
      Caption = 'Num.Cheque'
    end
    object EdtDesc: TCurrencyEdit
      Left = 8
      Top = 80
      Width = 73
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 3
      ZeroEmpty = False
      OnExit = EdtDescExit
    end
    object EdtAcres: TCurrencyEdit
      Left = 96
      Top = 80
      Width = 73
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 4
      ZeroEmpty = False
      OnExit = EdtDescExit
    end
    object EdtValorPago: TCurrencyEdit
      Left = 184
      Top = 80
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      ZeroEmpty = False
    end
    object BtnOk: TButton
      Left = 402
      Top = 108
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 7
      OnClick = BtnOkClick
    end
    object BtnCancela: TButton
      Left = 403
      Top = 77
      Width = 65
      Height = 25
      Caption = '&Cancela'
      TabOrder = 8
      OnClick = BtnCancelaClick
    end
    object EdtPagto: TMaskEdit
      Left = 112
      Top = 32
      Width = 89
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = EdtPagtoExit
    end
    object EdtTotal: TCurrencyEdit
      Left = 8
      Top = 32
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object ComboForma: TComboBox
      Left = 216
      Top = 32
      Width = 177
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboFormaChange
    end
    object GBCentroCusto: TGroupBox
      Left = 8
      Top = 120
      Width = 385
      Height = 65
      Caption = 'Conta'
      TabOrder = 6
      object EdtCodConta: TEdit
        Left = 8
        Top = 24
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Fornecedor'
        TabStop = False
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
      object EdtNomeConta: TEdit
        Left = 74
        Top = 24
        Width = 303
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
      end
    end
    object EdtCheque: TEdit
      Left = 288
      Top = 80
      Width = 105
      Height = 21
      Color = clSilver
      MaxLength = 10
      TabOrder = 5
    end
  end
  object QPagamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRPagto
    Left = 256
    Top = 104
  end
  object IBTRPagto: TFDTransaction
    Connection = DM.IBDatabase
    Left = 216
    Top = 112
  end
end
