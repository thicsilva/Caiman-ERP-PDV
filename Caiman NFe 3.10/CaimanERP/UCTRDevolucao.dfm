object FrmCTRDevolucao: TFrmCTRDevolucao
  Left = 373
  Top = 342
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#227'o'
  ClientHeight = 145
  ClientWidth = 323
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
    Width = 323
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 152
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Valor da Parcela'
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object EdtSeq: TEdit
      Left = 80
      Top = 24
      Width = 33
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object EdtTotal: TCurrencyEdit
      Left = 152
      Top = 24
      Width = 97
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 323
    Height = 69
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Valor da Devolu'#231#227'o'
    end
    object EdtValorDev: TCurrencyEdit
      Left = 24
      Top = 32
      Width = 89
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
      TabOrder = 0
      ZeroEmpty = False
    end
    object BtnOk: TButton
      Left = 146
      Top = 28
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 226
      Top = 28
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 126
    Width = 323
    Height = 19
    Panels = <>
  end
  object QDevolucao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRDev
    SQL.Strings = (
      'UPDATE CONTAS_RECEBER'
      'SET DEVOLUCAO_CTR = :DEV'
      'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ')
    Left = 280
    Top = 16
    ParamData = <
      item
        Name = 'DEV'
        DataType = ftCurrency
      end
      item
        Name = 'CODCTR'
        DataType = ftInteger
      end
      item
        Name = 'SEQ'
        DataType = ftInteger
      end>
  end
  object IBTRDev: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 72
  end
end
