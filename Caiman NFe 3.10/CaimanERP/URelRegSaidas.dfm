object FrmRelRegSaidas: TFrmRelRegSaidas
  Left = 437
  Top = 322
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do Livro de Sa'#237'das'
  ClientHeight = 154
  ClientWidth = 310
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 135
    Width = 310
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 310
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 26
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 117
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 209
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 306
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
      Width = 306
      Height = 40
      Align = alClient
      Columns = 2
      Items.Strings = (
        'Detalhado'
        'Resumido')
      TabOrder = 1
    end
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, R.CNPJ, R.CODIFICACAO_FISCAL, R.DATA, R.INSCRICAO,'
      
        'R.NUMERO_NOTA, R.SERIE_NOTA, R.SITUACAO, R.UF, R.NUMERO_NOTA_FIN' +
        'AL'
      'FROM ITENS_REGISTRO_LIVRO_SAIDAS I'
      'INNER JOIN REGISTRO_LIVRO_SAIDAS R'
      'ON (I.CODIGO = R.CODIGO)'
      
        'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND I.CODIGO_EMPRESA ' +
        '= :CODEMP AND SITUACAO = '#39'N'#39
      'ORDER BY R.SERIE_NOTA, R.NUMERO_NOTA')
    Left = 272
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
    object QRelNUMERO_NOTA_FINAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FINAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA_FINAL'
    end
    object QRelCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QResumido: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) VALORCONTABIL,'
      '               SUM(I.BASE_CALCULO) BASECALCULO,'
      '               SUM(I.VALOR_ICMS) VALORICMS,'
      '               SUM(I.ISENTA_NAO_TRIBUTADA) ISENTAS,'
      '               SUM(I.OUTRAS) OUTRAS,'
      '               CFOP'
      'FROM ITENS_REGISTRO_LIVRO_SAIDAS I'
      'INNER JOIN REGISTRO_LIVRO_SAIDAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'I.CODIGO_EMPRESA = :CODEMP AND SITUACAO = '#39'N'#39
      'GROUP BY I.CFOP'
      'ORDER BY I.CFOP')
    Left = 272
    Top = 56
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
    object QResumidoVALORCONTABIL: TBCDField
      FieldName = 'VALORCONTABIL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResumidoBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResumidoVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResumidoISENTAS: TBCDField
      FieldName = 'ISENTAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResumidoOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QResumidoCFOP: TIntegerField
      FieldName = 'CFOP'
      Required = True
    end
  end
end
