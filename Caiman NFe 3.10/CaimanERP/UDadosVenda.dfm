object FrmDadosVenda: TFrmDadosVenda
  Left = 343
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados ref. Venda'
  ClientHeight = 160
  ClientWidth = 427
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Autorizado'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label3: TLabel
      Left = 136
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object EdtAutorizado: TEdit
      Left = 8
      Top = 24
      Width = 409
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtDesc: TCurrencyEdit
      Left = 8
      Top = 64
      Width = 105
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
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 136
      Top = 64
      Width = 105
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
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 427
    Height = 44
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 182
      Top = 12
      Width = 64
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 141
    Width = 427
    Height = 19
    Panels = <>
  end
  object QDadosVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT DESC_PESSOA_AUTORIZADA, DESCONTO_VEN, ACRESCIMO_VEN'
      'FROM VENDAS'
      'WHERE COD_VEN = :CODVEN')
    Left = 344
    Top = 48
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
  end
end
