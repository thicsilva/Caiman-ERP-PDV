object FrmAberturaCaixa: TFrmAberturaCaixa
  Left = 453
  Top = 317
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abertura do Caixa'
  ClientHeight = 154
  ClientWidth = 351
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 97
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Data Abertura'
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Hora Abertura'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 48
      Height = 13
      Caption = 'C'#243'd.Caixa'
    end
    object Label4: TLabel
      Left = 192
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Valor Suprimento'
    end
    object EdtData: TMaskEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      EditMask = '99/99/9999'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object EdtHora: TMaskEdit
      Left = 104
      Top = 24
      Width = 57
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
    object EdtNomeCaixa: TEdit
      Left = 77
      Top = 64
      Width = 196
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
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
      TabOrder = 4
    end
    object EdtCodCaixa: TEdit
      Left = 8
      Top = 64
      Width = 57
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 3
    end
    object EdtSuprimento: TCurrencyEdit
      Left = 192
      Top = 24
      Width = 81
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 2
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 351
    Height = 38
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 1
    object BtnOk: TButton
      Left = 35
      Top = 8
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TButton
      Left = 243
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 139
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
    Top = 135
    Width = 351
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Sair'
        Width = 80
      end>
  end
  object IBSQLAbre: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 136
    Top = 48
  end
end
