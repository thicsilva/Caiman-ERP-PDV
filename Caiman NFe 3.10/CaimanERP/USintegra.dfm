object FrmSintegra: TFrmSintegra
  Left = 379
  Top = 294
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gera Arquivo Sintegra'
  ClientHeight = 441
  ClientWidth = 583
  Color = clWhite
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
    Width = 583
    Height = 385
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 10
      Top = 5
      Width = 327
      Height = 47
      Caption = 'Per'#237'odo'
      Color = clSilver
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 112
        Top = 24
        Width = 8
        Height = 13
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edtdataini: TDateTimePicker
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        Date = 37819.435105740700000000
        Time = 37819.435105740700000000
        TabOrder = 0
      end
      object Edtdatafin: TDateTimePicker
        Left = 136
        Top = 16
        Width = 89
        Height = 21
        Date = 37819.435105740700000000
        Time = 37819.435105740700000000
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 56
      Width = 329
      Height = 49
      Caption = 'Identifica'#231#227'o da Natureza das Opera'#231#245'es Informadas'
      Color = clSilver
      ParentColor = False
      TabOrder = 1
      object ComboNatureza: TComboBox
        Left = 8
        Top = 16
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          '[1] Interestaduais somente opera'#231#245'es c/sub. tribut'#225'ria'
          '[2] Interestaduais - opera'#231#245'es com ou sem sub.tribut'#225'ria'
          '[3] Totalidade das opera'#231#245'es do informantes')
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 112
      Width = 329
      Height = 49
      Caption = 'Finalidades da Apresenta'#231#227'o do Arquivo Magn'#233'tico'
      Color = clSilver
      ParentColor = False
      TabOrder = 2
      object ComboFinalidade: TComboBox
        Left = 8
        Top = 16
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          '[1] Normal'
          '[2] Retifica'#231#227'o total de arquivo'
          '[3] Retifica'#231#227'o aditiva de arquivo'
          '[5] Desfazimento')
      end
    end
    object GroupBox4: TGroupBox
      Left = 344
      Top = 288
      Width = 225
      Height = 49
      TabOrder = 3
      object EdtRegistro: TEdit
        Left = 8
        Top = 18
        Width = 209
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Memo: TMemo
      Left = 344
      Top = 8
      Width = 225
      Height = 273
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 160
      Width = 329
      Height = 217
      Color = clWhite
      ParentColor = False
      TabOrder = 5
      object Check50: TCheckBox
        Left = 8
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Registro 50         [Nota Fiscal Entradas/Sa'#237'das]'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object Check54: TCheckBox
        Left = 8
        Top = 32
        Width = 313
        Height = 17
        Caption = 'Registro 54         [Itens de Mercadorias - Nota Fiscal]'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object Check60M: TCheckBox
        Left = 8
        Top = 48
        Width = 313
        Height = 17
        Caption = 'Registro 60M      [Mestre - ECF]'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object Check60A: TCheckBox
        Left = 8
        Top = 64
        Width = 313
        Height = 17
        Caption = 'Registro 60A       [Anal'#237'tico - ECF]'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object Check60D: TCheckBox
        Left = 8
        Top = 80
        Width = 313
        Height = 17
        Caption = 'Registro 60D      [Resumo Di'#225'rio - ECF]'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object Check60I: TCheckBox
        Left = 8
        Top = 96
        Width = 313
        Height = 17
        Caption = 'Registro 60I        [Itens de Mercadorias - ECF]'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object Check60R: TCheckBox
        Left = 8
        Top = 112
        Width = 313
        Height = 17
        Caption = 'Registro 60R      [Resumo Mensal - ECF]'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object Check70: TCheckBox
        Left = 8
        Top = 160
        Width = 313
        Height = 17
        Caption = 'Registro 70         [Conhecimento de Frete]'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object Check74: TCheckBox
        Left = 8
        Top = 176
        Width = 313
        Height = 17
        Caption = 'Registro 74         [Registro de Invent'#225'rio]'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object Check75: TCheckBox
        Left = 8
        Top = 192
        Width = 313
        Height = 16
        Caption = 'Registro 75         [Cadastro dos Produtos]'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object Check61: TCheckBox
        Left = 8
        Top = 128
        Width = 313
        Height = 17
        Caption = 'Registro 61         [Nota Fiscal de Venda a Consumidor Mod.2]'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object Check61R: TCheckBox
        Left = 8
        Top = 144
        Width = 313
        Height = 17
        Caption = 'Registro 61R      [Resumo Mensal Nota Fiscal Mod.2]'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
    end
    object Button1: TButton
      Left = 344
      Top = 344
      Width = 225
      Height = 33
      Caption = 'Validador Sintegra'
      TabOrder = 6
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 385
    Width = 583
    Height = 56
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clSilver
    TabOrder = 1
    ExplicitTop = 383
    ExplicitHeight = 37
    object BtnOK2: TBitBtn
      Left = 189
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOK2Click
    end
    object BtnSair: TBitBtn
      Left = 317
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object SaveDialog: TSaveDialog
    FileName = 'sintegra.txt'
    Left = 304
    Top = 8
  end
  object Q60M: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT M.*, C.R01_NUMERO_SERIE'
      'FROM MAPA_RESUMO M'
      'INNER JOIN CAIXA C'
      'ON (M.CHECKOUT = C.COD_CAI AND M.COD_EMP = C.COD_EMP)'
      'WHERE M.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'M.COD_EMP = :CODEMP'
      'ORDER BY M.DATA, M.CHECKOUT')
    Left = 360
    Top = 120
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
    object Q60MCHECKOUT: TIntegerField
      FieldName = 'CHECKOUT'
      Origin = 'MAPA_RESUMO.CHECKOUT'
      Required = True
    end
    object Q60MDATA: TDateField
      FieldName = 'DATA'
      Origin = 'MAPA_RESUMO.DATA'
      Required = True
    end
    object Q60MCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
      Origin = 'MAPA_RESUMO.COO_INICIAL'
      Required = True
    end
    object Q60MCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = 'MAPA_RESUMO.COO_FINAL'
      Required = True
    end
    object Q60MGT_INICIAL: TBCDField
      FieldName = 'GT_INICIAL'
      Origin = 'MAPA_RESUMO.GT_INICIAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60MGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = 'MAPA_RESUMO.GT_FINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60MCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
    object Q60MCONT_CANCEL: TIntegerField
      FieldName = 'CONT_CANCEL'
      Origin = 'MAPA_RESUMO.CONT_CANCEL'
      Required = True
    end
    object Q60MCONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = 'MAPA_RESUMO.CONTADOR_REINICIO_OPERACAO'
      Required = True
    end
    object Q60MCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object Q60MCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MAPA_RESUMO.CODIGO'
      Required = True
    end
    object Q60MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'MAPA_RESUMO.DATA_EMISSAO'
    end
    object Q60MHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'MAPA_RESUMO.HORA_EMISSAO'
    end
    object Q60MR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'CAIXA.R01_NUMERO_SERIE'
    end
  end
  object Q60D: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT V.DATA_VEN, I.COD_PRO, '
      'SUM(I.QUANT) QUANT,  SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE V.DATA_VEN = :DATA AND (V.COD_CAI = :CODCAI AND '
      
        'I.COD_EMP = :CODEMP) AND V.TOTAL_VEN > 0 AND V.CODIFICACAO_FISCA' +
        'L = '#39'2D'#39' AND  '
      ' I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0'
      'GROUP BY V.DATA_VEN, I.COD_PRO'
      'ORDER BY V.DATA_VEN')
    Left = 440
    Top = 120
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object Q60DDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Required = True
    end
    object Q60DCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object Q60DQUANT: TBCDField
      FieldName = 'QUANT'
      Precision = 18
      Size = 3
    end
    object Q60DVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object Q75: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.NOME_PRO, P.COD_NCM, G.ALIQUOTA_GRP, U.DESCR' +
        'ICAO'
      'FROM PRODUTO P'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      ''
      'WHERE P.COD_PRO IN (SELECT I.COD_PRO '
      '                    FROM ITENS_VENDA I'
      '                    INNER JOIN VENDAS V'
      '                    ON (I.COD_VEN = V.COD_VEN)'
      
        '                    WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAF' +
        'IN AND V.TOTAL_VEN > 0 AND I.COD_EMP = :CODEMP'
      '                    AND I.CANCELADO = 0 AND V.CANCELADA_VEN = 0)'
      'OR'
      ''
      'P.COD_PRO IN (SELECT IE.COD_PRO'
      '              FROM ITENS_ENTRADA IE'
      '              INNER JOIN ENTRADAS E'
      '              ON (IE.COD_ENT = E.COD_ENT)'
      
        '              WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN ' +
        'AND IE.COD_EMP = :CODEMP)'
      'OR'
      ''
      'P.COD_PRO IN (SELECT COD_PRO FROM ITENS_INVENTARIO_ESTOQUE'
      '              WHERE COD_INVENTARIO = :CODINVENT)'
      'OR'
      ''
      'P.COD_PRO IN (SELECT COD_PRO '
      '             FROM ITENS_NOTA_FISCAL INF'
      '             INNER JOIN NOTA_FISCAL NF'
      '             ON (INF.COD_NF = NF.COD_NF)'
      
        '             WHERE NF.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATA' +
        'FIN AND NF.CANCELADA_NF = '#39'N'#39' AND'
      
        '             NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39 +
        '22'#39', '#39'55'#39'))'
      ''
      'ORDER BY P.COD_PRO')
    Left = 440
    Top = 224
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODINVENT'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object Q75COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object Q75NOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object Q75ALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q75COD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = 'PRODUTO.COD_NCM'
      Size = 8
    end
    object Q75DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object Q60I: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.ORDEM, I.QUANT,  ((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100) VALOR, V.DATA_VEN, P.CO' +
        'D_PRO, V.CUPOM_FISCAL_VEN, V.COD_VEN, G.TIPO_GRP, G.ALIQUOTA_GRP' +
        ', G.ICMS_SERVICO_GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN = :DATA AND (V.COD_CAI = :CODCAI AND I.COD_EMP ' +
        '= :CODEMP) AND V.TOTAL_VEN > 0 AND V.CODIFICACAO_FISCAL = '#39'2D'#39' A' +
        'ND I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0'
      'ORDER BY I.COD_VEN, I.ORDEM')
    Left = 480
    Top = 120
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object Q60IORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object Q60IQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object Q60IVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object Q60IDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object Q60ICUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
    object Q60ICOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object Q60ITIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object Q60IALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60IICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = 'GRUPO_ICMS.ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q60ICOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
  end
  object Q60R: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.COD_PRO, SUM(I.QUANT) QUANT, SUM(((I.QUANT * I.VALOR) -' +
        ' I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR,'
      'G.TIPO_GRP, G.ALIQUOTA_GRP, G.ICMS_SERVICO_GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.TOTAL_VEN >' +
        ' 0 AND V.CODIFICACAO_FISCAL = '#39'2D'#39'  AND I.COD_EMP = :CODEMP AND ' +
        'I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0'
      
        'GROUP BY I.COD_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP, G.ICMS_SERVICO_G' +
        'RP'
      'ORDER BY I.COD_PRO')
    Left = 520
    Top = 120
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
    object Q60RCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object Q60RQUANT: TBCDField
      FieldName = 'QUANT'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object Q60RVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 10
    end
    object Q60RTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object Q60RALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60RICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = '"GRUPO_ICMS"."ICMS_SERVICO_GRP"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object OpenDialog: TOpenDialog
    Left = 240
    Top = 8
  end
  object Q74: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, P.CODIGO_BARRA_PRO'
      'FROM ITENS_INVENTARIO_ESTOQUE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE COD_INVENTARIO = :COD'
      'ORDER BY P.CODIGO_BARRA_PRO')
    Left = 360
    Top = 224
    ParamData = <
      item
        Name = 'COD'
      end>
    object Q74COD_INVENTARIO: TIntegerField
      FieldName = 'COD_INVENTARIO'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.COD_INVENTARIO'
      Required = True
    end
    object Q74COD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.COD_EMP'
      Required = True
    end
    object Q74COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.COD_PRO'
      Required = True
    end
    object Q74QUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.QUANT'
      Precision = 18
      Size = 3
    end
    object Q74CUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.CUSTO'
      Precision = 18
      Size = 2
    end
    object Q74PRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'ITENS_INVENTARIO_ESTOQUE.PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object Q74CODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
  end
  object Q50E: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, R.CNPJ, R.INSCRICAO, R.DATA, R.UF, R.CODIFICACAO_FIS' +
        'CAL, R.SERIE_NOTA, R.EMITENTE, R.NUMERO_NOTA, R.SITUACAO'
      'FROM ITENS_REGISTRO_LIVRO_ENTRADAS I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.CODIGO_EMPRESA = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'0' +
        '4'#39', '#39'06'#39', '#39'21'#39', '#39'22'#39', '#39'55'#39')'
      'ORDER BY R.DATA, I.CODIGO, I.ORDEM')
    Left = 360
    Top = 16
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
    object Q50ECODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object Q50EORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ORDEM'
      Required = True
    end
    object Q50ECFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CFOP'
      Required = True
    end
    object Q50EBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50EVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50EISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50EOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.OUTRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50EALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ALIQUOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50ECODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q50EVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50ECNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q50EINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q50EDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object Q50EUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q50ESERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object Q50EEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q50ENUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object Q50ESITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q50EICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ICMS_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50EBASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50ECODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object Q70: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, R.CNPJ, R.INSCRICAO, R.DATA, R.UF, R.CODIFICACAO_FIS' +
        'CAL, R.SERIE_NOTA, R.EMITENTE, R.NUMERO_NOTA, R.SITUACAO, R.SUB_' +
        'SERIE, R.CIF_FOB'
      'FROM ITENS_REGISTRO_LIVRO_ENTRADAS I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.CODIGO_EMPRESA = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'07'#39', '#39'0' +
        '8'#39', '#39'09'#39', '#39'10'#39', '#39'11'#39', '#39'26'#39')'
      'ORDER BY I.CODIGO, I.ORDEM')
    Left = 400
    Top = 224
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
    object Q70CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object Q70ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ORDEM'
      Required = True
    end
    object Q70CFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CFOP'
      Required = True
    end
    object Q70BASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70VALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70ISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70OUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.OUTRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70ALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ALIQUOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70CODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q70VALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70ICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ICMS_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70BASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q70CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q70INSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q70DATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object Q70UF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q70CODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q70SERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object Q70EMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q70NUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object Q70SITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q70SUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object Q70CIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
  end
  object Q54E: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, R.*'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.COD_ENT = R.CODIGO_ENTRADA)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.COD_EMP = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'04'#39', '#39'06' +
        #39', '#39'21'#39', '#39'22'#39', '#39'55'#39')'
      'ORDER BY R.DATA, R.CODIGO_ENTRADA, I.ORDEM')
    Left = 400
    Top = 16
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
    object Q54ECOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ITENS_ENTRADA.COD_ENT'
      Required = True
    end
    object Q54ECOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ENTRADA.COD_PRO'
      Required = True
    end
    object Q54EPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = 'ITENS_ENTRADA.PERC_ICMS'
      Precision = 18
      Size = 2
    end
    object Q54EPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = 'ITENS_ENTRADA.PERC_IPI'
      Precision = 18
      Size = 2
    end
    object Q54EQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = 'ITENS_ENTRADA.QTDUND_ENT'
      Precision = 18
      Size = 2
    end
    object Q54EPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = 'ITENS_ENTRADA.PERC_DESC'
      Precision = 18
      Size = 2
    end
    object Q54EPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = 'ITENS_ENTRADA.PERC_ACRES'
      Precision = 18
      Size = 2
    end
    object Q54ECOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_ENTRADA.COD_EMP'
      Required = True
    end
    object Q54EVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = 'ITENS_ENTRADA.VALOR_UNIT_PRO'
      Required = True
      Precision = 18
    end
    object Q54ECUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'ITENS_ENTRADA.CUSTO'
      Precision = 18
    end
    object Q54EQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'ITENS_ENTRADA.QTD_PRO'
      Precision = 18
      Size = 3
    end
    object Q54ECOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_ENTRADA.COD_GRP'
    end
    object Q54ECOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = 'ITENS_ENTRADA.COD_CFOP'
    end
    object Q54EVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'ITENS_ENTRADA.VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object Q54EVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'ITENS_ENTRADA.VALOR_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object Q54EPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = 'ITENS_ENTRADA.PERC_BCR'
      Precision = 18
      Size = 2
    end
    object Q54ECST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_ENTRADA.CST'
      FixedChar = True
      Size = 3
    end
    object Q54EVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_ENTRADA.VALOR_TOTAL'
      Precision = 18
    end
    object Q54EBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_ENTRADA.BASE_CALCULO'
      Precision = 18
    end
    object Q54EVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_ENTRADA.VALOR_ICMS'
      Precision = 18
    end
    object Q54EORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_ENTRADA.ORDEM'
      Required = True
    end
    object Q54EPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = 'ITENS_ENTRADA.PERC_ST'
      Precision = 18
    end
    object Q54ECODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object Q54EDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object Q54ECNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q54ESERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object Q54ENUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object Q54EEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54EVALOR_TOTAL1: TBCDField
      FieldName = 'VALOR_TOTAL1'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q54ESITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54ECODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q54ECODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object Q54EINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q54EUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q54ECOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object Q54ESUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object Q54ECIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object Q54EVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = 'ITENS_ENTRADA.VALOR_SUB_TRIBUTARIA'
      Precision = 18
      Size = 2
    end
    object Q54EVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'ITENS_ENTRADA.VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object Q54ECODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q54ECODIGO_NOTA_FISCAL: TIntegerField
      FieldName = 'CODIGO_NOTA_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_NOTA_FISCAL'
    end
  end
  object Q50S: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, R.CNPJ, R.INSCRICAO, R.DATA, R.UF, R.CODIFICACAO_FIS' +
        'CAL, R.SERIE_NOTA, R.EMITENTE, R.NUMERO_NOTA, R.SITUACAO, CF.REG' +
        'ISTRADO_ECF'
      'FROM ITENS_REGISTRO_LIVRO_SAIDAS I'
      'INNER JOIN REGISTRO_LIVRO_SAIDAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'INNER JOIN CFOP CF'
      'ON (I.CFOP = CF.COD_CFO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.CODIGO_EMPRESA = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'0' +
        '6'#39', '#39'21'#39', '#39'22'#39', '#39'55'#39')'
      'ORDER BY I.CODIGO, I.ORDEM')
    Left = 360
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
    object Q50SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CODIGO'
      Required = True
    end
    object Q50SORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ORDEM'
      Required = True
    end
    object Q50SCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CFOP'
      Required = True
    end
    object Q50SBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.BASE_CALCULO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.OUTRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ALIQUOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q50SVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ICMS_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SBASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.BASE_CALCULO_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q50SCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q50SINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q50SDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.DATA'
      Required = True
    end
    object Q50SUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_SAIDAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q50SSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SERIE_NOTA'
      Size = 3
    end
    object Q50SEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_SAIDAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q50SNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA'
      Required = True
    end
    object Q50SSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q50SREGISTRADO_ECF: TStringField
      FieldName = 'REGISTRADO_ECF'
      Origin = 'CFOP.REGISTRADO_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q50SCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q50SCST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CST'
      FixedChar = True
      Size = 3
    end
  end
  object Q54S: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, R.*'
      'FROM REGISTRO_LIVRO_SAIDAS R'
      'INNER JOIN ITENS_NOTA_FISCAL I'
      'ON (R.CODIGO_SAIDA =  I.COD_NF)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.COD_EMP = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'06'#39', '#39'21' +
        #39', '#39'22'#39', '#39'55'#39') AND CF.REGISTRADO_ECF = '#39'N'#39' AND R.SITUACAO = '#39'N'#39
      'ORDER BY R.DATA, R.CODIGO_SAIDA, I.ORDEM')
    Left = 400
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
    object Q54SORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_NOTA_FISCAL.ORDEM'
      Required = True
    end
    object Q54SCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'ITENS_NOTA_FISCAL.COD_NF'
      Required = True
    end
    object Q54SCST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_NOTA_FISCAL.CST'
      FixedChar = True
      Size = 3
    end
    object Q54SUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'ITENS_NOTA_FISCAL.UNIT'
      Precision = 18
      Size = 3
    end
    object Q54SALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ITENS_NOTA_FISCAL.ALIQ'
      Precision = 18
      Size = 2
    end
    object Q54SCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_NOTA_FISCAL.COD_EMP'
      Required = True
    end
    object Q54SCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_NOTA_FISCAL.COD_GRP'
      Required = True
    end
    object Q54SQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_NOTA_FISCAL.QUANT'
      Precision = 18
      Size = 3
    end
    object Q54SALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ITENS_NOTA_FISCAL.ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object Q54SREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'ITENS_NOTA_FISCAL.REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q54SCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'ITENS_NOTA_FISCAL.COD_CFO'
      Required = True
    end
    object Q54SSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'ITENS_NOTA_FISCAL.SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54SVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'ITENS_NOTA_FISCAL.VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object Q54SALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ITENS_NOTA_FISCAL.ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object Q54SUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'ITENS_NOTA_FISCAL.UNIDADE'
      Size = 4
    end
    object Q54SCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_NOTA_FISCAL.COD_PRO'
    end
    object Q54SVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object Q54SBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_NOTA_FISCAL.BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object Q54SVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object Q54SBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'ITENS_NOTA_FISCAL.BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Q54SVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object Q54SVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Q54SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO'
      Required = True
    end
    object Q54SDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.DATA'
      Required = True
    end
    object Q54SCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q54SSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SERIE_NOTA'
      Size = 3
    end
    object Q54SNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA'
      Required = True
    end
    object Q54SEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_SAIDAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54SVALOR_TOTAL1: TBCDField
      FieldName = 'VALOR_TOTAL1'
      Origin = 'REGISTRO_LIVRO_SAIDAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q54SSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54SCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q54SCODIGO_SAIDA: TIntegerField
      FieldName = 'CODIGO_SAIDA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_SAIDA'
    end
    object Q54SINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q54SUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_SAIDAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q54SCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'ITENS_NOTA_FISCAL.CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object Q54SNUMERO_NOTA_FINAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FINAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA_FINAL'
    end
    object Q54SISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ITENS_NOTA_FISCAL.ISENTAS'
      Precision = 18
      Size = 2
    end
    object Q54SOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_NOTA_FISCAL.OUTRAS'
      Precision = 18
      Size = 2
    end
    object Q54SCODIGO_MAPA_RESUMO: TIntegerField
      FieldName = 'CODIGO_MAPA_RESUMO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_MAPA_RESUMO'
    end
    object Q54SCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object Q61: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, R.CNPJ, R.INSCRICAO, R.DATA, R.UF, R.CODIFICACAO_FIS' +
        'CAL, R.SERIE_NOTA, R.EMITENTE, R.NUMERO_NOTA, R.SITUACAO, R.NUME' +
        'RO_NOTA_FINAL,'
      'CF.REGISTRADO_ECF'
      'FROM ITENS_REGISTRO_LIVRO_SAIDAS I'
      'INNER JOIN REGISTRO_LIVRO_SAIDAS R'
      'ON (I.CODIGO = R.CODIGO)'
      'INNER JOIN CFOP CF'
      'ON (I.CFOP = CF.COD_CFO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'I.CODIGO_EMPRESA = :CODEMP AND R.CODIFICACAO_FISCAL = '#39'02'#39
      'ORDER BY I.CODIGO, I.ORDEM')
    Left = 360
    Top = 168
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
    object Q61CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CODIGO'
      Required = True
    end
    object Q61ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ORDEM'
      Required = True
    end
    object Q61CFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CFOP'
      Required = True
    end
    object Q61BASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.BASE_CALCULO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61VALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.VALOR_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61ISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61OUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.OUTRAS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61ALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ALIQUOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61CODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q61VALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61ICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.ICMS_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61BASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_SAIDAS.BASE_CALCULO_RETIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q61INSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q61DATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.DATA'
      Required = True
    end
    object Q61UF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_SAIDAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q61SERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SERIE_NOTA'
      Size = 3
    end
    object Q61EMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_SAIDAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q61NUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA'
      Required = True
    end
    object Q61SITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q61REGISTRADO_ECF: TStringField
      FieldName = 'REGISTRADO_ECF'
      Origin = 'CFOP.REGISTRADO_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q61NUMERO_NOTA_FINAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FINAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA_FINAL'
    end
    object Q61CODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object Q61R: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.QUANT) QUANT, SUM(I.VALOR * I.QUANT) VALOR,'
      
        'I.COD_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP, V.DATA_VEN, P.CODIGO_BARR' +
        'A_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN'
      'AND I.COD_EMP = :CODEMP AND '
      'V.CODIFICACAO_FISCAL = '#39'02'#39' AND I.CANCELADO = 0'
      
        'GROUP BY I.COD_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP, V.DATA_VEN, P.CO' +
        'DIGO_BARRA_PRO'
      'ORDER BY I.COD_PRO')
    Left = 400
    Top = 168
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
    object Q61RQUANT: TBCDField
      FieldName = 'QUANT'
      Precision = 18
      Size = 3
    end
    object Q61RVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object Q61RCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object Q61RTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object Q61RALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61RDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Required = True
    end
    object Q61RCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
  end
  object Q60A: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.codigo, I.cod_grp,'
      'case when I.indice_r03 = '#39'N1'#39' then'
      'cast( ('
      
        'select Sum( ( i2.quant * i2.valor ) - i2.desconto ) from itens_v' +
        'enda i2'
      'inner join produto p'
      'on( p.cod_pro = i2.cod_pro )'
      'inner join grupo_icms gr'
      'on( gr.cod_grp = p.icms_cf_est )'
      'inner join VENDAS V'
      'on( v.cod_ven = I2.cod_ven and v.cod_emp = i2.cod_emp )'
      
        'where gr.tipo_grp = '#39'OUT'#39' and v.data_ven = mr.data  and v.cod_ca' +
        'i = mr.checkout'
      
        ') as numeric(18,3) )  else I.valor end valor, I.cod_emp, I.indic' +
        'e_r03,'
      
        'I.codigo_livro_fiscal, I.codigo_livro_fiscal, I.ordem_livro_fisc' +
        'al,'
      'I.status_exporta,'
      ' G.ALIQUOTA_GRP, G.TIPO_GRP, G.ICMS_SERVICO_GRP'
      ''
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'inner join mapa_resumo mr'
      'on ( mr.codigo = i.codigo and mr.cod_emp = i.cod_emp )'
      'WHERE I.CODIGO = :CODIGO '
      'ORDER BY I.COD_GRP')
    Left = 400
    Top = 120
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object Q60ACODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO'
      Required = True
    end
    object Q60ACOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
    object Q60ACOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object Q60AINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
    object Q60AALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60ATIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object Q60AICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = 'GRUPO_ICMS.ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q60ACODIGO_LIVRO_FISCAL: TIntegerField
      FieldName = 'CODIGO_LIVRO_FISCAL'
      Origin = '"ITENS_MAPA_RESUMO"."CODIGO_LIVRO_FISCAL"'
    end
    object Q60ACODIGO_LIVRO_FISCAL1: TIntegerField
      FieldName = 'CODIGO_LIVRO_FISCAL1'
      Origin = '"ITENS_MAPA_RESUMO"."CODIGO_LIVRO_FISCAL"'
    end
    object Q60AORDEM_LIVRO_FISCAL: TIntegerField
      FieldName = 'ORDEM_LIVRO_FISCAL'
      Origin = '"ITENS_MAPA_RESUMO"."ORDEM_LIVRO_FISCAL"'
    end
    object Q60ASTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_MAPA_RESUMO"."STATUS_EXPORTA"'
    end
    object Q60AVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 3
    end
  end
  object Q54ENF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, R.*'
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN REGISTRO_LIVRO_ENTRADAS R'
      'ON (I.COD_NF = R.CODIGO_NOTA_FISCAL)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.COD_EMP = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'06'#39', '#39'21' +
        #39', '#39'22'#39', '#39'55'#39')  AND R.SITUACAO = '#39'N'#39
      'ORDER BY R.DATA, R.CODIGO_NOTA_FISCAL, I.ORDEM')
    Left = 448
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
    object Q54ENFORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_NOTA_FISCAL.ORDEM'
      Required = True
    end
    object Q54ENFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'ITENS_NOTA_FISCAL.COD_NF'
      Required = True
    end
    object Q54ENFCST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_NOTA_FISCAL.CST'
      FixedChar = True
      Size = 3
    end
    object Q54ENFALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ITENS_NOTA_FISCAL.ALIQ'
      Precision = 18
      Size = 2
    end
    object Q54ENFCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_NOTA_FISCAL.COD_EMP'
      Required = True
    end
    object Q54ENFCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_NOTA_FISCAL.COD_GRP'
      Required = True
    end
    object Q54ENFQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_NOTA_FISCAL.QUANT'
      Precision = 18
      Size = 3
    end
    object Q54ENFALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ITENS_NOTA_FISCAL.ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object Q54ENFREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'ITENS_NOTA_FISCAL.REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q54ENFCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'ITENS_NOTA_FISCAL.COD_CFO'
      Required = True
    end
    object Q54ENFSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'ITENS_NOTA_FISCAL.SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54ENFVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'ITENS_NOTA_FISCAL.VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object Q54ENFALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ITENS_NOTA_FISCAL.ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object Q54ENFUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'ITENS_NOTA_FISCAL.UNIDADE'
      Size = 4
    end
    object Q54ENFCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_NOTA_FISCAL.COD_PRO'
    end
    object Q54ENFVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object Q54ENFBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_NOTA_FISCAL.BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object Q54ENFVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object Q54ENFBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'ITENS_NOTA_FISCAL.BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Q54ENFVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object Q54ENFVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'ITENS_NOTA_FISCAL.VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Q54ENFCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'ITENS_NOTA_FISCAL.CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object Q54ENFUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'ITENS_NOTA_FISCAL.UNIT'
      Precision = 18
      Size = 3
    end
    object Q54ENFISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ITENS_NOTA_FISCAL.ISENTAS'
      Precision = 18
      Size = 2
    end
    object Q54ENFOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_NOTA_FISCAL.OUTRAS'
      Precision = 18
      Size = 2
    end
    object Q54ENFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object Q54ENFDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object Q54ENFCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object Q54ENFSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object Q54ENFNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object Q54ENFEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54ENFVALOR_TOTAL1: TBCDField
      FieldName = 'VALOR_TOTAL1'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q54ENFSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q54ENFCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object Q54ENFCODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object Q54ENFINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object Q54ENFUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q54ENFCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object Q54ENFSUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object Q54ENFCIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object Q54ENFCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q54ENFCODIGO_NOTA_FISCAL: TIntegerField
      FieldName = 'CODIGO_NOTA_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_NOTA_FISCAL'
    end
  end
  object ACBRSintegra: TACBrSintegra
    FileName = 'C:\Sintegra.txt'
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 280
    Top = 224
  end
  object Aux: TFDTransaction
    Connection = DM.IBDatabase
    Left = 216
    Top = 216
  end
  object Qaux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = Aux
    SQL.Strings = (
      'select * from PRODUTO')
    Left = 216
    Top = 264
    object QauxNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
  end
end
