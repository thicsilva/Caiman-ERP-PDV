object FrmCancNotaFiscal: TFrmCancNotaFiscal
  Left = 538
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Nota Fiscal'
  ClientHeight = 229
  ClientWidth = 431
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
    Width = 431
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 145
      Height = 49
      Caption = 'N'#250'mero da Nota'
      TabOrder = 0
      object EdtNum: TEdit
        Left = 8
        Top = 16
        Width = 105
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        OnEnter = EdtNumEnter
        OnKeyPress = EdtNumKeyPress
      end
    end
    object BtnOK: TBitBtn
      Left = 184
      Top = 24
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 280
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 431
    Height = 97
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 112
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label2: TLabel
      Left = 216
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Sa'#237'da'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 99
      Height = 13
      Caption = 'Cliente/Fornecedor'
    end
    object Label4: TLabel
      Left = 328
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Total da Nota'
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object EdtEmissao: TMaskEdit
      Left = 112
      Top = 24
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '  /  /    '
    end
    object EdtSaida: TMaskEdit
      Left = 216
      Top = 24
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /    '
    end
    object EdtCli: TEdit
      Left = 8
      Top = 64
      Width = 417
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
      TabOrder = 2
    end
    object EdtTotal: TCurrencyEdit
      Left = 328
      Top = 24
      Width = 97
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
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 81
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
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 162
    Width = 431
    Height = 48
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnCancela: TBitBtn
      Left = 174
      Top = 16
      Width = 97
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 0
      OnClick = BtnCancelaClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 210
    Width = 431
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Panels = <>
    SimplePanel = True
    UseSystemFont = False
  end
  object QNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT N.COD_NF, N.DATA_EMISSAO_NF, N.DATA_SAIDA_NF,  N.VALOR_TO' +
        'TAL_NF, N.CANCELADA_NF, C.NOME_CLI, N.COD_VENDA, N.CODIGO_OUTRA_' +
        'ENTRADA, N.CODIGO_OUTRA_SAIDA, F.RAZAO_FOR'
      'FROM NOTA_FISCAL N'
      'LEFT OUTER JOIN  CLIENTE C'
      'ON (N.COD_CLI = C.COD_CLI)'
      'LEFT OUTER JOIN FORNECEDOR F'
      'ON (N.COD_FOR = F.COD_FOR)'
      'WHERE N.NUMERO_NOTA_NF = :NUM AND N.COD_EMP = :CODEMP '
      '')
    Left = 344
    Top = 168
    ParamData = <
      item
        Name = 'NUM'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'NOTA_FISCAL.COD_NF'
      Required = True
    end
    object QNFDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'NOTA_FISCAL.DATA_EMISSAO_NF'
      Required = True
    end
    object QNFDATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = 'NOTA_FISCAL.DATA_SAIDA_NF'
    end
    object QNFVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = 'NOTA_FISCAL.VALOR_TOTAL_NF'
      Precision = 18
      Size = 2
    end
    object QNFCANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = 'NOTA_FISCAL.CANCELADA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QNFNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Size = 60
    end
    object QNFCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'NOTA_FISCAL.COD_VENDA'
    end
    object QNFCODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_ENTRADA'
    end
    object QNFCODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_SAIDA'
    end
    object QNFRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Size = 60
    end
  end
  object QCancela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'UPDATE NOTA_FISCAL '
      'SET CANCELADA_NF = '#39'S'#39
      'WHERE COD_NF = :COD')
    Left = 304
    Top = 168
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
      end>
  end
end
