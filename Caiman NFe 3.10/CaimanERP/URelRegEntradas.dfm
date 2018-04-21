object FrmRelRegEntradas: TFrmRelRegEntradas
  Left = 444
  Top = 359
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do Livro de Entradas'
  ClientHeight = 154
  ClientWidth = 314
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 310
      Height = 53
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
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
    object Rdg: TRadioGroup
      Left = 2
      Top = 55
      Width = 310
      Height = 40
      Align = alClient
      Columns = 3
      Items.Strings = (
        'Detalhado'
        'Res. p/CFOP'
        'Res. p/NF')
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 314
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 28
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 119
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 211
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
    Top = 135
    Width = 314
    Height = 19
    Panels = <>
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, R.CNPJ, R.CODIFICACAO_FISCAL, R.DATA, R.INSCRICAO,'
      'R.NUMERO_NOTA, R.SERIE_NOTA, R.SITUACAO, R.UF'
      'FROM ITENS_REGISTRO_LIVRO_ENTRADAS I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.CODIGO = R.CODIGO)'
      
        'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND I.CODIGO_EMPRESA ' +
        '= :CODEMP'
      'ORDER BY R.DATA, I.CODIGO, I.ORDEM')
    Left = 256
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
    object QRelCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QRelORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ORDEM'
      Required = True
    end
    object QRelCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CFOP'
      Required = True
    end
    object QRelBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_ICMS'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.OUTRAS'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ALIQUOTA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QRelVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ICMS_RETIDO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelBASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO_RETIDO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QRelDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QRelINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QRelNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QRelSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QRelSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QRelCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QResCFOP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) VALORCONTABIL,'
      '               SUM(I.BASE_CALCULO) BASECALCULO,'
      '               SUM(I.VALOR_ICMS) VALORICMS,'
      '               SUM(I.ISENTA_NAO_TRIBUTADA) ISENTAS,'
      '               SUM(I.OUTRAS) OUTRAS,'
      '               CFOP'
      'FROM ITENS_REGISTRO_LIVRO_ENTRADAS I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'I.CODIGO_EMPRESA = :CODEMP'
      'GROUP BY I.CFOP'
      'ORDER BY I.CFOP')
    Left = 144
    Top = 8
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
    object QResCFOPVALORCONTABIL: TBCDField
      FieldName = 'VALORCONTABIL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResCFOPBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResCFOPVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResCFOPISENTAS: TBCDField
      FieldName = 'ISENTAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResCFOPOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResCFOPCFOP: TIntegerField
      FieldName = 'CFOP'
      Required = True
    end
  end
  object QResNota: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT SUM(I.BASE_CALCULO) BASECALCULO, SUM(I.BASE_CALCULO_RETID' +
        'O) BASERETIDO, '
      'SUM(I.ICMS_RETIDO) ICMSRETIDO,'
      'SUM(I.ISENTA_NAO_TRIBUTADA) ISENTAS,'
      'SUM(I.OUTRAS) OUTRAS,'
      'SUM(I.VALOR_ICMS) VALORICMS,'
      'SUM(I.VALOR_TOTAL) VALORCONTABIL,'
      'I.CODIGO, '
      
        'R.NUMERO_NOTA, R.SERIE_NOTA, R.CNPJ, R.CODIFICACAO_FISCAL, R.DAT' +
        'A, R.INSCRICAO,  R.SITUACAO, R.UF, F.RAZAO_FOR '
      'FROM ITENS_REGISTRO_LIVRO_ENTRADAS I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'INNER JOIN FORNECEDOR F'
      'ON (R.COD_FOR = F.COD_FOR)'
      
        'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND I.CODIGO_EMPRESA ' +
        '= :CODEMP'
      
        'GROUP BY I.CODIGO, R.NUMERO_NOTA, R.SERIE_NOTA, R.CNPJ, R.CODIFI' +
        'CACAO_FISCAL, R.DATA, R.INSCRICAO, R.SITUACAO, R.UF, F.RAZAO_FOR'
      'ORDER BY R.DATA, I.CODIGO')
    Left = 24
    Top = 8
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
    object QResNotaBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaBASERETIDO: TBCDField
      FieldName = 'BASERETIDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaICMSRETIDO: TBCDField
      FieldName = 'ICMSRETIDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaISENTAS: TBCDField
      FieldName = 'ISENTAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaVALORCONTABIL: TBCDField
      FieldName = 'VALORCONTABIL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResNotaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QResNotaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Required = True
    end
    object QResNotaSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Size = 3
    end
    object QResNotaCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      Size = 14
    end
    object QResNotaDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object QResNotaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Required = True
      Size = 14
    end
    object QResNotaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QResNotaUF: TStringField
      FieldName = 'UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QResNotaRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QResNotaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
end
