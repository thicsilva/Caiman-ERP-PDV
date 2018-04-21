object FrmVendasPeriodo: TFrmVendasPeriodo
  Left = 403
  Top = 225
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas por Per'#237'odo'
  ClientHeight = 163
  ClientWidth = 343
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 144
    Width = 343
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 144
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 1
    object BtnOK: TButton
      Left = 70
      Top = 109
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 190
      Top = 109
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 339
      Height = 47
      Align = alTop
      Caption = 'Per'#237'odo'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 152
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataFin: TDateTimePicker
        Left = 184
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 1
      end
      object EdtDataIni: TDateTimePicker
        Left = 32
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 0
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 2
      Top = 49
      Width = 339
      Height = 48
      Align = alTop
      Color = clBtnFace
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sintegra'
        'EFD')
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
    end
  end
  object Q60M: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT M.*, C.R01_NUMERO_SERIE'
      'FROM MAPA_RESUMO M'
      'INNER JOIN CAIXA C'
      'ON (M.CHECKOUT = C.COD_CAI AND M.COD_EMP = C.COD_EMP)'
      'WHERE M.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'M.COD_EMP = :CODEMP'
      'ORDER BY M.DATA, M.CHECKOUT')
    Left = 16
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object Q60MCHECKOUT: TIntegerField
      FieldName = 'CHECKOUT'
      Origin = '"MAPA_RESUMO"."CHECKOUT"'
      Required = True
    end
    object Q60MDATA: TDateField
      FieldName = 'DATA'
      Origin = '"MAPA_RESUMO"."DATA"'
      Required = True
    end
    object Q60MCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
      Origin = '"MAPA_RESUMO"."COO_INICIAL"'
      Required = True
    end
    object Q60MCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = '"MAPA_RESUMO"."COO_FINAL"'
      Required = True
    end
    object Q60MGT_INICIAL: TBCDField
      FieldName = 'GT_INICIAL'
      Origin = '"MAPA_RESUMO"."GT_INICIAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60MGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = '"MAPA_RESUMO"."GT_FINAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60MCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = '"MAPA_RESUMO"."CONT_REDUCAO"'
      Required = True
    end
    object Q60MCONT_CANCEL: TIntegerField
      FieldName = 'CONT_CANCEL'
      Origin = '"MAPA_RESUMO"."CONT_CANCEL"'
      Required = True
    end
    object Q60MCONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = '"MAPA_RESUMO"."CONTADOR_REINICIO_OPERACAO"'
      Required = True
    end
    object Q60MCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"MAPA_RESUMO"."COD_EMP"'
      Required = True
    end
    object Q60MCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MAPA_RESUMO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q60MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"MAPA_RESUMO"."DATA_EMISSAO"'
    end
    object Q60MHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = '"MAPA_RESUMO"."HORA_EMISSAO"'
    end
    object Q60MCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = '"MAPA_RESUMO"."CODIGO_PAF"'
    end
    object Q60MR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = '"CAIXA"."R01_NUMERO_SERIE"'
    end
    object Q60MVENDA_BRUTA: TBCDField
      FieldName = 'VENDA_BRUTA'
      Origin = '"MAPA_RESUMO"."VENDA_BRUTA"'
      Precision = 18
      Size = 2
    end
    object Q60MCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"MAPA_RESUMO"."CODIFICACAO_FISCAL"'
      FixedChar = True
      Size = 2
    end
  end
  object Q60A: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT I.*, G.ALIQUOTA_GRP, G.TIPO_GRP, G.ICMS_SERVICO_GRP,'
      'case when I.indice_r03 = '#39'N1'#39' then'
      '('
      'select Sum( i.quant * i.valor ) from itens_venda i'
      'inner join produto p'
      'on( p.cod_pro = i.cod_pro )'
      'inner join grupo_icms gr'
      'on( gr.cod_grp = p.icms_cf_est )'
      'inner join VENDAS V'
      'on( v.cod_ven = I.cod_ven and v.cod_emp = i.cod_emp )'
      
        'where gr.tipo_grp = '#39'OUT'#39' and v.data_ven = mr.data and v.cod_cai' +
        ' = mr.checkout'
      ') else 0 end  TOT_OUTRO'
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'inner join mapa_resumo mr'
      'on ( mr.codigo = i.codigo and mr.cod_emp = i.cod_emp )'
      'WHERE I.CODIGO = :CODIGO '
      'ORDER BY I.COD_GRP'
      '')
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object Q60ACODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_MAPA_RESUMO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q60ACOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_MAPA_RESUMO"."COD_GRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q60AVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_MAPA_RESUMO"."VALOR"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60ACOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_MAPA_RESUMO"."COD_EMP"'
      Required = True
    end
    object Q60AINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = '"ITENS_MAPA_RESUMO"."INDICE_R03"'
      Required = True
      Size = 10
    end
    object Q60ACODIGO_LIVRO_FISCAL: TIntegerField
      FieldName = 'CODIGO_LIVRO_FISCAL'
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
    object Q60AALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60ATIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object Q60AICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = '"GRUPO_ICMS"."ICMS_SERVICO_GRP"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q60ATOT_OUTRO: TFMTBCDField
      FieldName = 'TOT_OUTRO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
  end
  object Q60D: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT V.DATA_VEN, I.COD_PRO, '
      'SUM(I.QUANT) QUANT,  SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR,'
      'P.CODIGO_BARRA_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE V.DATA_VEN = :DATA AND (V.COD_CAI = :CODCAI AND '
      
        'I.COD_EMP = :CODEMP) AND V.TOTAL_VEN > 0 AND V.CODIFICACAO_FISCA' +
        'L = '#39'2D'#39' AND  '
      'P.ICMS_CF_EST = :CODGRP AND I.CANCELADO = 0'
      'GROUP BY V.DATA_VEN, I.COD_PRO, P.CODIGO_BARRA_PRO'
      'ORDER BY V.DATA_VEN')
    Left = 112
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODGRP'
        ParamType = ptUnknown
      end>
    object Q60DDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object Q60DCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object Q60DQUANT: TBCDField
      FieldName = 'QUANT'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object Q60DVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = []
    end
    object Q60DCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object Q60I: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT I.ORDEM, I.QUANT,  ((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100) VALOR, V.DATA_VEN, P.CO' +
        'DIGO_BARRA_PRO, V.CUPOM_FISCAL_VEN, V.COD_VEN, G.TIPO_GRP, G.ALI' +
        'QUOTA_GRP, G.ICMS_SERVICO_GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN = :DATA AND (V.COD_CAI = :CODCAI AND I.COD_EMP ' +
        '= :CODEMP) AND V.TOTAL_VEN > 0 AND V.CODIFICACAO_FISCAL = '#39'2D'#39' A' +
        'ND I.CANCELADO = 0'
      'ORDER BY I.COD_VEN, I.ORDEM')
    Left = 160
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object Q60IORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q60IQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object Q60IVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 10
    end
    object Q60IDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object Q60ICODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Q60ICUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = '"VENDAS"."CUPOM_FISCAL_VEN"'
    end
    object Q60ICOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"VENDAS"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q60ITIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object Q60IALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q60IICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = '"GRUPO_ICMS"."ICMS_SERVICO_GRP"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object Q60R: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      
        'SELECT I.COD_PRO, SUM(I.QUANT) QUANT, SUM((I.QUANT * I.VALOR) - ' +
        'I.DESCONTO) VALOR,'
      
        'G.TIPO_GRP, G.ALIQUOTA_GRP, G.ICMS_SERVICO_GRP, P.CODIGO_BARRA_P' +
        'RO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.TOTAL_VEN >' +
        ' 0 AND V.CODIFICACAO_FISCAL = '#39'2D'#39' AND I.COD_EMP = :CODEMP AND I' +
        '.CANCELADO = 0'
      'GROUP BY I.COD_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP, '
      'G.ICMS_SERVICO_GRP, P.CODIGO_BARRA_PRO'
      'ORDER BY I.COD_PRO')
    Left = 208
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
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
    object Q60RCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object Q61R: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
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
      
        'GROUP BY I.COD_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP,  V.DATA_VEN, P.C' +
        'ODIGO_BARRA_PRO'
      'ORDER BY I.COD_PRO')
    Left = 256
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object Q61RQUANT: TBCDField
      FieldName = 'QUANT'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object Q61RVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object Q61RCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object Q61RTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object Q61RALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q61RDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object Q61RCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object Q61: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'select V.data_ven, SUM( V.total_ven ),'
      
        '(select MIN( VV.cod_ven ) from VENDAS VV where VV.data_ven = V.d' +
        'ata_ven and VV.codificacao_fiscal = '#39'02'#39' and vV.serie_nota_fisca' +
        'l='#39'D'#39'),'
      
        '(select MAX( VV.cod_ven ) from VENDAS VV where VV.data_ven = V.d' +
        'ata_ven and VV.codificacao_fiscal = '#39'02'#39' and vV.serie_nota_fisca' +
        'l='#39'D'#39')'
      'from vendas V where v.data_ven between :dataini and :datafin'
      
        'and V.cod_emp =:codemp and v.codificacao_fiscal = '#39'02'#39' and v.ser' +
        'ie_nota_fiscal='#39'D'#39' group by v.data_ven;'
      '')
    Left = 248
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object Q61DATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object Q61SUM: TBCDField
      FieldName = 'SUM'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object Q61MIN: TIntegerField
      FieldName = 'MIN'
      ProviderFlags = []
    end
    object Q61MAX: TIntegerField
      FieldName = 'MAX'
      ProviderFlags = []
    end
  end
  object Q75: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      
        'SELECT DISTINCT(I.COD_PRO), P.CODIGO_BARRA_PRO, P.NOME_PRO, P.CO' +
        'D_NCM, G.ALIQUOTA_GRP, U.DESCRICAO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND I.COD_EMP = :' +
        'CODEMP'
      'ORDER BY CODIGO_BARRA_PRO'
      '')
    Left = 296
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object Q75COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object Q75CODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Q75NOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Q75COD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = '"PRODUTO"."COD_NCM"'
      Size = 8
    end
    object Q75ALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Q75DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object Sped1: TACBrSPEDFiscal
    Path = 'C:\Program Files\Embarcadero\RAD Studio\8.0\bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 144
    Top = 72
  end
  object Sintegra1: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 216
    Top = 80
  end
  object Q50S: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
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
    Left = 72
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
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
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT I.*, R.*, P.DESC_CUPOM'
      'FROM REGISTRO_LIVRO_SAIDAS R'
      'INNER JOIN ITENS_NOTA_FISCAL I'
      'ON (R.CODIGO_SAIDA =  I.COD_NF)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'inner join produto P'
      'on ( P.COD_PRO = I.COD_PRO )'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND '
      
        'I.COD_EMP = :CODEMP AND R.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'06'#39', '#39'21' +
        #39', '#39'22'#39', '#39'55'#39') AND CF.REGISTRADO_ECF = '#39'N'#39' AND R.SITUACAO = '#39'N'#39
      'ORDER BY R.DATA, R.CODIGO_SAIDA, I.ORDEM')
    Left = 112
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
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
    object Q54SDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
  end
end
