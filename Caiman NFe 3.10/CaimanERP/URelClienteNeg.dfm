object FrmRelClienteNeg: TFrmRelClienteNeg
  Left = 326
  Top = 307
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Clientes Negativados'
  ClientHeight = 109
  ClientWidth = 313
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 49
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RDG: TRadioGroup
      Left = 2
      Top = 2
      Width = 309
      Height = 45
      Align = alClient
      Columns = 2
      Items.Strings = (
        'Resumido'
        'Detalhado')
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 90
    Width = 313
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 313
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnVis: TBitBtn
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 222
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object QRelDetalhado: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.COD_CLI, C.NOME_CLI, C.TELRES_CLI, C.NASCIMENTO_CLI, C.' +
        'CNPJ_CLI, V.NOME_VEND, CR.COD_CTR, CR.SEQUENCIA_CTR, CR.COD_EMP,' +
        ' CR.DATA_CTR, CR.COD_VENDA, CR.VENCTO_CTR, CR.VALOR_CTR'
      'FROM CLIENTE C'
      'LEFT OUTER JOIN CONTAS_RECEBER CR'
      'ON (C.COD_CLI = CR.COD_CLI)'
      'LEFT OUTER JOIN VENDEDOR V'
      'ON (CR.COD_VEND = V.COD_VEND)'
      'WHERE C.ATIVO_CLI = '#39'N'#39' AND CR.DTPAGTO_CTR IS NULL'
      'ORDER BY C.NOME_CLI, C.COD_CLI')
    Left = 104
    Top = 8
    object QRelDetalhadoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelDetalhadoNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'VENDEDOR.NOME_VEND'
      Size = 50
    end
    object QRelDetalhadoCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
    end
    object QRelDetalhadoSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
    end
    object QRelDetalhadoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
    end
    object QRelDetalhadoDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
    end
    object QRelDetalhadoCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QRelDetalhadoVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
    end
    object QRelDetalhadoVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelDetalhadoTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QRelDetalhadoNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QRelDetalhadoCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QRelDetalhadoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
  end
  object QRelResumido: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT NOME_CLI, COD_CLI, NASCIMENTO_CLI, CNPJ_CLI, TELRES_CLI'
      'FROM CLIENTE'
      'WHERE ATIVO_CLI = '#39'N'#39' '
      'ORDER BY NOME_CLI')
    Left = 248
    Top = 8
    object QRelResumidoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelResumidoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QRelResumidoNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QRelResumidoCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QRelResumidoTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
  end
end
