object FrmGerarRegSaidas: TFrmGerarRegSaidas
  Left = 402
  Top = 282
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Reg.Sa'#237'das Mod.2 S'#233'rie D'
  ClientHeight = 123
  ClientWidth = 341
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 104
    Width = 341
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 341
      Height = 65
      Align = alClient
      Caption = 'Per'#237'odo'
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 337
      ExplicitHeight = 61
      object Label1: TLabel
        Left = 144
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 24
        Top = 20
        Width = 97
        Height = 21
        Date = 39306.431661956000000000
        Time = 39306.431661956000000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 20
        Width = 97
        Height = 21
        Date = 39306.431661956000000000
        Time = 39306.431661956000000000
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 341
    Height = 39
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnGerar: TBitBtn
      Left = 75
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gerar'
      TabOrder = 0
      OnClick = BtnGerarClick
    end
    object BtnSair: TBitBtn
      Left = 194
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object QCons: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT DATA_VEN, MIN(NUMERO_NOTA_FISCAL) NUM_MIN, MAX(NUMERO_NOT' +
        'A_FISCAL) NUM_MAX '
      'FROM VENDAS'
      'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND '
      
        'COD_EMP = :CODEMP AND CODIFICACAO_FISCAL = '#39'02'#39' AND SERIE_NOTA_F' +
        'ISCAL = '#39'D'#39
      'GROUP BY DATA_VEN')
    Left = 16
    Top = 64
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
    object QConsNUM_MIN: TIntegerField
      FieldName = 'NUM_MIN'
    end
    object QConsNUM_MAX: TIntegerField
      FieldName = 'NUM_MAX'
    end
    object QConsDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Required = True
    end
  end
  object QInsItensLivro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'INSERT INTO ITENS_REGISTRO_LIVRO_SAIDAS (CODIGO, ORDEM, CFOP, BA' +
        'SE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA, ' +
        'CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO, BASE_CALCULO_RETIDO, C' +
        'ST)'
      'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13)'
      '')
    Left = 88
    Top = 17
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end
      item
        Name = '13'
      end>
  end
  object QInsRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_SAIDAS(:DATA, :CNPJ, :CODMODELO, :SERIE, :NUM' +
        'INI, :EMITENTE, :VALOR, :SITUACAO, :CODEMP, :CODSAIDA, :UF, :INS' +
        'C, :NUMFIN, :CODMAPA)')
    Left = 160
    Top = 16
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMINI'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALOR'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODSAIDA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'NUMFIN'
      end
      item
        Name = 'CODMAPA'
      end>
    object QInsRegistroCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QTotal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT SUM(TOTAL_VEN) TOTAL'
      'FROM VENDAS'
      
        'WHERE DATA_VEN = :DATA AND COD_EMP = :CODEMP AND CODIFICACAO_FIS' +
        'CAL = '#39'02'#39' AND SERIE_NOTA_FISCAL = '#39'D'#39' AND '
      'CANCELADA_VEN = 0'
      '')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODEMP'
      end>
    object QTotalTOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object QItensLivro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR, P.CFOP_VENDAS_C' +
        'F_EST, P.CST_CF_EST, G.ALIQUOTA_GRP, G.ICMS_SERVICO_GRP, G.TIPO_' +
        'GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND I.COD_EMP = :' +
        'CODEMP AND V.CODIFICACAO_FISCAL = '#39'02'#39
      'AND V.SERIE_NOTA_FISCAL = '#39'D'#39' AND'
      'V.CANCELADA_VEN = 0'
      
        'GROUP BY P.CFOP_VENDAS_CF_EST, P.CST_CF_EST, G.ALIQUOTA_GRP, G.I' +
        'CMS_SERVICO_GRP, G.TIPO_GRP'
      'ORDER BY P.CFOP_VENDAS_CF_EST')
    Left = 288
    Top = 24
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
    object QItensLivroCFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
    end
    object QItensLivroALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensLivroICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensLivroTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QItensLivroVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QItensLivroCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      FixedChar = True
      Size = 3
    end
  end
end
