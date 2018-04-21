object FrmRelCTREmitidas: TFrmRelCTREmitidas
  Left = 379
  Top = 259
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio das Contas a Receber por Emiss'#227'o'
  ClientHeight = 182
  ClientWidth = 297
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 293
      Height = 49
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 16
        Width = 97
        Height = 21
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 96
      Width = 177
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 2
    end
    object RdgOrdem: TRadioGroup
      Left = 2
      Top = 51
      Width = 293
      Height = 41
      Align = alTop
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'Alfab'#233'tica'
        'C'#243'digo')
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 121
    Width = 297
    Height = 42
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 15
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 111
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 207
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 163
    Width = 297
    Height = 19
    Panels = <>
  end
  object QRelCTR: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.DATA_CTR, R.CAIXA_EMISSAO_C' +
        'TR, R.COD_EMP, R.COD_VENDA, R.VALOR_CTR, R.DEVOLUCAO_CTR, '
      '(R.VALOR_CTR - R.DEVOLUCAO_CTR) LIQUIDO,'
      'C.NOME_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)')
    Left = 232
    Top = 56
    object QRelCTRCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QRelCTRSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QRelCTRDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QRelCTRCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QRelCTRCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QRelCTRVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCTRNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelCTRDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCTRLIQUIDO: TBCDField
      FieldName = 'LIQUIDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCTRCAIXA_EMISSAO_CTR: TIntegerField
      FieldName = 'CAIXA_EMISSAO_CTR'
      Origin = 'CONTAS_RECEBER.CAIXA_EMISSAO_CTR'
    end
  end
end
