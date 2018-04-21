object FrmCancelaRecebimento: TFrmCancelaRecebimento
  Left = 311
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Recebimento'
  ClientHeight = 199
  ClientWidth = 459
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 368
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Vencimento'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 137
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Seq.'
    end
    object Label3: TLabel
      Left = 168
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label4: TLabel
      Left = 264
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Vencimento'
    end
    object Label6: TLabel
      Left = 360
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Recebimento'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 60
      Height = 13
      Caption = 'Documento'
    end
    object Label8: TLabel
      Left = 128
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Valor Bruto'
    end
    object Label9: TLabel
      Left = 216
      Top = 48
      Width = 77
      Height = 13
      Caption = 'Valor Recebido'
    end
    object Label10: TLabel
      Left = 8
      Top = 88
      Width = 60
      Height = 13
      Caption = 'C'#243'd.Cliente'
    end
    object Label11: TLabel
      Left = 80
      Top = 88
      Width = 105
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object Label12: TLabel
      Left = 304
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Tipo Rec.'
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtSeq: TEdit
      Left = 104
      Top = 24
      Width = 49
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdtEmissao: TMaskEdit
      Left = 168
      Top = 24
      Width = 81
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '  /  /    '
    end
    object EdtVenc: TMaskEdit
      Left = 264
      Top = 24
      Width = 81
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '  /  /    '
    end
    object EdtDoc: TEdit
      Left = 8
      Top = 64
      Width = 113
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
      ReadOnly = True
      TabOrder = 4
    end
    object EdtValorBruto: TCurrencyEdit
      Left = 128
      Top = 64
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
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      ZeroEmpty = False
    end
    object EdtValorRec: TCurrencyEdit
      Left = 216
      Top = 64
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
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      ZeroEmpty = False
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 104
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object EdtNomeCli: TEdit
      Left = 80
      Top = 104
      Width = 361
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
      ReadOnly = True
      TabOrder = 8
    end
    object EdtFormaPagamento: TEdit
      Left = 304
      Top = 64
      Width = 137
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 459
    Height = 43
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 136
      Top = 8
      Width = 73
      Height = 27
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 264
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
    Top = 180
    Width = 459
    Height = 19
    Panels = <>
  end
  object EdtReceb: TMaskEdit
    Left = 360
    Top = 24
    Width = 81
    Height = 21
    TabStop = False
    Color = clSilver
    EditMask = '99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '  /  /    '
  end
  object IBSQLCanc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCanc
    Left = 24
    Top = 144
  end
  object IBTRCanc: TFDTransaction
    Connection = DM.IBDatabase
    Left = 384
    Top = 136
  end
end
