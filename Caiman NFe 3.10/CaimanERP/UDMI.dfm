object DMI: TDMI
  OldCreateOrder = False
  Height = 430
  Width = 551
  object IBTRImport: TFDTransaction
    Connection = DM.IBDatabase
    Left = 88
    Top = 8
  end
  object Nota: TFDTable
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    UpdateOptions.UpdateTableName = 'ENTRADAS'
    TableName = 'ENTRADAS'
    Left = 16
    Top = 8
    object NotaCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Required = True
    end
    object NotaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object NotaDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Required = True
    end
    object NotaDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Required = True
    end
    object NotaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object NotaTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Precision = 18
      Size = 2
    end
    object NotaACRES_ENT: TBCDField
      FieldName = 'ACRES_ENT'
      Precision = 18
      Size = 2
    end
    object NotaDESC_ENT: TBCDField
      FieldName = 'DESC_ENT'
      Precision = 18
      Size = 2
    end
    object NotaFRETE_ENT: TBCDField
      FieldName = 'FRETE_ENT'
      Precision = 18
      Size = 2
    end
    object NotaICMSFRETE_ENT: TBCDField
      FieldName = 'ICMSFRETE_ENT'
      Precision = 18
      Size = 2
    end
    object NotaTIPO_ENT: TStringField
      FieldName = 'TIPO_ENT'
      Required = True
      Size = 1
    end
    object NotaNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Size = 15
    end
    object NotaSERIE_ENT: TStringField
      FieldName = 'SERIE_ENT'
      Size = 3
    end
    object NotaBASE_SUB_TRIB: TBCDField
      FieldName = 'BASE_SUB_TRIB'
      Precision = 18
      Size = 2
    end
    object NotaVALOR_ICMS_SUB: TBCDField
      FieldName = 'VALOR_ICMS_SUB'
      Precision = 18
      Size = 2
    end
    object NotaFRETE_INCLUSO: TStringField
      FieldName = 'FRETE_INCLUSO'
      Required = True
      Size = 1
    end
    object NotaICMS_SUB_INCLUSO: TStringField
      FieldName = 'ICMS_SUB_INCLUSO'
      Required = True
      Size = 1
    end
    object NotaTOTAL_PRODUTOS: TBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object NotaCUSTO_SEM_DESCONTO: TStringField
      FieldName = 'CUSTO_SEM_DESCONTO'
      Required = True
      Size = 1
    end
    object NotaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Required = True
      Size = 2
    end
    object NotaCODIGO_ES: TIntegerField
      FieldName = 'CODIGO_ES'
      Required = True
    end
    object NotaCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 100
    end
    object NotaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object NotaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object NotaCODIGO_ESTADO: TStringField
      FieldName = 'CODIGO_ESTADO'
      Size = 3
    end
    object NotaBC_ICMS: TBCDField
      FieldName = 'BC_ICMS'
      Precision = 18
    end
    object NotaVL_ICMS: TBCDField
      FieldName = 'VL_ICMS'
      Precision = 18
    end
    object NotaVL_IPI: TBCDField
      FieldName = 'VL_IPI'
      Precision = 18
    end
    object NotaVL_SEG: TBCDField
      FieldName = 'VL_SEG'
      Precision = 18
    end
  end
  object ItensNota: TFDTable
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    UpdateOptions.UpdateTableName = 'ITENS_ENTRADA'
    TableName = 'ITENS_ENTRADA'
    Left = 16
    Top = 56
    object ItensNotaCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Required = True
    end
    object ItensNotaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object ItensNotaPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Precision = 18
      Size = 2
    end
    object ItensNotaPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Precision = 18
      Size = 2
    end
    object ItensNotaQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Precision = 18
      Size = 2
    end
    object ItensNotaPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Precision = 18
      Size = 2
    end
    object ItensNotaPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Precision = 18
      Size = 2
    end
    object ItensNotaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object ItensNotaVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Required = True
      Precision = 18
    end
    object ItensNotaCUSTO: TBCDField
      FieldName = 'CUSTO'
      Precision = 18
    end
    object ItensNotaQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Precision = 18
      Size = 3
    end
    object ItensNotaCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
    end
    object ItensNotaCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
    end
    object ItensNotaVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object ItensNotaVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object ItensNotaPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Precision = 18
      Size = 2
    end
    object ItensNotaCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object ItensNotaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
    end
    object ItensNotaBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Precision = 18
    end
    object ItensNotaVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
    end
    object ItensNotaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Required = True
    end
    object ItensNotaPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Precision = 18
    end
    object ItensNotaVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Precision = 18
      Size = 2
    end
    object ItensNotaVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object ItensNotaCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Required = True
    end
    object ItensNotaBC_ST: TBCDField
      FieldName = 'BC_ST'
      Precision = 18
      Size = 2
    end
    object ItensNotaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 3
    end
    object ItensNotaALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object ItensNotaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object ItensNotaCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 3
    end
    object ItensNotaALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object ItensNotaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object ItensNotaCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 3
    end
  end
  object Contas: TFDTable
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    UpdateOptions.UpdateTableName = 'CONTAS_PAGAR'
    TableName = 'CONTAS_PAGAR'
    Left = 16
    Top = 104
    object ContasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object ContasDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Required = True
    end
    object ContasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object ContasTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
    end
    object ContasNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
    end
    object ContasVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Required = True
      Precision = 18
      Size = 2
    end
    object ContasDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Required = True
    end
    object ContasCOD_ENTRADA: TIntegerField
      FieldName = 'COD_ENTRADA'
    end
    object ContasCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Required = True
    end
    object ContasSEQUENCIA_CTP: TIntegerField
      FieldName = 'SEQUENCIA_CTP'
      Required = True
    end
    object ContasCOD_CLASSIFICACAO: TIntegerField
      FieldName = 'COD_CLASSIFICACAO'
      Required = True
    end
    object ContasDUPLICATA_PENDENTE: TStringField
      FieldName = 'DUPLICATA_PENDENTE'
      Required = True
      Size = 1
    end
  end
  object PRODUTO_T_E: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    SQL.Strings = (
      
        'select P.*,  G1.aliquota_grp ALIQ_ICMS_DENTRO, G2.aliquota_grp A' +
        'LIQ_ICMS_FORA,'
      'CF1.destaca_icms D_ICMS_DENTRO,'
      'CF1.calcula_pis_cofins D_PIS_DENTRO,'
      'CF2.destaca_icms D_ICMS_FORA,'
      'CF2.calcula_pis_cofins D_PIS_FORA from PRODUTO_TRIBUTACOES_ENT P'
      'left outer join grupo_icms G1'
      'on ( G1.cod_grp = P.icms_dentro )'
      'left outer join grupo_icms G2'
      'on ( G2.cod_grp = P.icms_fora )'
      'left outer join CFOP CF1'
      'on ( CF1.cod_cfo = P.cod_cfop_dentro )'
      'left outer join CFOP CF2'
      'on ( CF2.cod_cfo = P.cod_cfop_fora )'
      'where COD_PROD=:COD_PRO and COD_EMP=:COD_EMP')
    Left = 144
    Top = 96
    ParamData = <
      item
        Name = 'COD_PRO'
      end
      item
        Name = 'COD_EMP'
      end>
    object PRODUTO_T_ECOD: TIntegerField
      FieldName = 'COD'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object PRODUTO_T_ECOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_PROD"'
    end
    object PRODUTO_T_EORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ORIGEM"'
      Size = 1
    end
    object PRODUTO_T_EICMS_DENTRO: TIntegerField
      FieldName = 'ICMS_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ICMS_DENTRO"'
    end
    object PRODUTO_T_ECST_DENTRO: TStringField
      FieldName = 'CST_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_DENTRO"'
      Size = 2
    end
    object PRODUTO_T_EIPI_DENTRO: TFloatField
      FieldName = 'IPI_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IPI_DENTRO"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_EREDU_ICMS_DENTRO: TFloatField
      FieldName = 'REDU_ICMS_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."REDU_ICMS_DENTRO"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_ETEM_SUBSTITUICAO: TStringField
      FieldName = 'TEM_SUBSTITUICAO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."TEM_SUBSTITUICAO"'
      Size = 1
    end
    object PRODUTO_T_EAGREG_DENTRO: TFloatField
      FieldName = 'AGREG_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."AGREG_DENTRO"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_EICMS_FORA: TIntegerField
      FieldName = 'ICMS_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ICMS_FORA"'
    end
    object PRODUTO_T_ECST_FORA: TStringField
      FieldName = 'CST_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_FORA"'
      Size = 2
    end
    object PRODUTO_T_EIPI_FORA: TFloatField
      FieldName = 'IPI_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IPI_FORA"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_EREDU_ICMS_FORA: TFloatField
      FieldName = 'REDU_ICMS_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."REDU_ICMS_FORA"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_ECST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_IPI"'
      Size = 2
    end
    object PRODUTO_T_ECSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CSOSN"'
      Size = 3
    end
    object PRODUTO_T_ECST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_PIS"'
      Size = 2
    end
    object PRODUTO_T_ECST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_COFINS"'
      Size = 2
    end
    object PRODUTO_T_EISENTO_PIS_COFINS: TStringField
      FieldName = 'ISENTO_PIS_COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ISENTO_PIS_COFINS"'
      Size = 1
    end
    object PRODUTO_T_EPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."PIS"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_ECOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COFINS"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_EIR: TFloatField
      FieldName = 'IR'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IR"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_ECONT_SOCIAL: TFloatField
      FieldName = 'CONT_SOCIAL'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CONT_SOCIAL"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_EOUTRAS: TFloatField
      FieldName = 'OUTRAS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."OUTRAS"'
      DisplayFormat = '0.00 %'
      EditFormat = '0.00'
    end
    object PRODUTO_T_ECOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_EMP"'
    end
    object PRODUTO_T_ECOD_CFOP_DENTRO: TIntegerField
      FieldName = 'COD_CFOP_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_CFOP_DENTRO"'
    end
    object PRODUTO_T_ECOD_CFOP_FORA: TIntegerField
      FieldName = 'COD_CFOP_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_CFOP_FORA"'
    end
    object PRODUTO_T_EALIQ_ICMS_DENTRO: TBCDField
      FieldName = 'ALIQ_ICMS_DENTRO'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object PRODUTO_T_EALIQ_ICMS_FORA: TBCDField
      FieldName = 'ALIQ_ICMS_FORA'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object PRODUTO_T_ED_ICMS_DENTRO: TStringField
      FieldName = 'D_ICMS_DENTRO'
      Origin = '"CFOP"."DESTACA_ICMS"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object PRODUTO_T_ED_PIS_DENTRO: TStringField
      FieldName = 'D_PIS_DENTRO'
      Origin = '"CFOP"."CALCULA_PIS_COFINS"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object PRODUTO_T_ED_ICMS_FORA: TStringField
      FieldName = 'D_ICMS_FORA'
      Origin = '"CFOP"."DESTACA_ICMS"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object PRODUTO_T_ED_PIS_FORA: TStringField
      FieldName = 'D_PIS_FORA'
      Origin = '"CFOP"."CALCULA_PIS_COFINS"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object ITENS_NOTA: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    UpdateObject = SQL_ITENS_NOTA
    SQL.Strings = (
      'select * from ITENS_ENTRADA where COD_ENT=:COD_ENT')
    Left = 256
    Top = 200
    ParamData = <
      item
        Name = 'COD_ENT'
      end>
    object ITENS_NOTACOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = '"ITENS_ENTRADA"."COD_ENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ITENS_NOTACOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ENTRADA"."COD_PRO"'
      Required = True
    end
    object ITENS_NOTAPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = '"ITENS_ENTRADA"."PERC_ICMS"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = '"ITENS_ENTRADA"."PERC_IPI"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = '"ITENS_ENTRADA"."QTDUND_ENT"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = '"ITENS_ENTRADA"."PERC_DESC"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = '"ITENS_ENTRADA"."PERC_ACRES"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTACOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_ENTRADA"."COD_EMP"'
      Required = True
    end
    object ITENS_NOTAVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = '"ITENS_ENTRADA"."VALOR_UNIT_PRO"'
      Required = True
      Precision = 18
    end
    object ITENS_NOTACUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = '"ITENS_ENTRADA"."CUSTO"'
      Precision = 18
    end
    object ITENS_NOTAQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = '"ITENS_ENTRADA"."QTD_PRO"'
      Precision = 18
      Size = 3
    end
    object ITENS_NOTACOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_ENTRADA"."COD_GRP"'
    end
    object ITENS_NOTACOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = '"ITENS_ENTRADA"."COD_CFOP"'
    end
    object ITENS_NOTAVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"ITENS_ENTRADA"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = '"ITENS_ENTRADA"."VALOR_ACRESCIMO"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = '"ITENS_ENTRADA"."PERC_BCR"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTACST: TStringField
      FieldName = 'CST'
      Origin = '"ITENS_ENTRADA"."CST"'
      FixedChar = True
      Size = 3
    end
    object ITENS_NOTAVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"ITENS_ENTRADA"."VALOR_TOTAL"'
      Precision = 18
    end
    object ITENS_NOTABASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = '"ITENS_ENTRADA"."BASE_CALCULO"'
      Precision = 18
    end
    object ITENS_NOTAVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"ITENS_ENTRADA"."VALOR_ICMS"'
      Precision = 18
    end
    object ITENS_NOTAORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_ENTRADA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ITENS_NOTAPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = '"ITENS_ENTRADA"."PERC_ST"'
      Precision = 18
    end
    object ITENS_NOTAVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = '"ITENS_ENTRADA"."VALOR_SUB_TRIBUTARIA"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"ITENS_ENTRADA"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTACODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = '"ITENS_ENTRADA"."CODIGO_LOCAL_ESTOQUE"'
      Required = True
    end
    object ITENS_NOTABC_ST: TBCDField
      FieldName = 'BC_ST'
      Origin = '"ITENS_ENTRADA"."BC_ST"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTACST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"ITENS_ENTRADA"."CST_IPI"'
      Size = 3
    end
    object ITENS_NOTACST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"ITENS_ENTRADA"."CST_PIS"'
      Size = 3
    end
    object ITENS_NOTAALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = '"ITENS_ENTRADA"."ALIQ_PIS"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ITENS_ENTRADA"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTACST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"ITENS_ENTRADA"."CST_COFINS"'
      Size = 3
    end
    object ITENS_NOTAALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = '"ITENS_ENTRADA"."ALIQ_COFINS"'
      Precision = 18
      Size = 2
    end
    object ITENS_NOTAVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ITENS_ENTRADA"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
  end
  object SQL_ITENS_NOTA: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'insert into ITENS_ENTRADA'
      
        '  (BASE_CALCULO, BC_ST, VALOR_ACRESCIMO, VALOR_COFINS, VALOR_DES' +
        'CONTO, '
      
        '   VALOR_ICMS, VALOR_IPI, VALOR_PIS, VALOR_SUB_TRIBUTARIA, VALOR' +
        '_TOTAL, '
      '   VALOR_UNIT_PRO)'
      'values'
      
        '  (:BASE_CALCULO, :BC_ST, :VALOR_ACRESCIMO, :VALOR_COFINS, :VALO' +
        'R_DESCONTO, '
      
        '   :VALOR_ICMS, :VALOR_IPI, :VALOR_PIS, :VALOR_SUB_TRIBUTARIA, :' +
        'VALOR_TOTAL, '
      '   :VALOR_UNIT_PRO)')
    ModifySQL.Strings = (
      'update ITENS_ENTRADA'
      'set'
      '  BASE_CALCULO = :BASE_CALCULO,'
      '  BC_ST = :BC_ST,'
      '  VALOR_ACRESCIMO = :VALOR_ACRESCIMO,'
      '  VALOR_COFINS = :VALOR_COFINS,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  VALOR_PIS = :VALOR_PIS,'
      '  VALOR_SUB_TRIBUTARIA = :VALOR_SUB_TRIBUTARIA,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_UNIT_PRO = :VALOR_UNIT_PRO'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_ENT = :OLD_COD_ENT and'
      '  ORDEM = :OLD_ORDEM')
    DeleteSQL.Strings = (
      'delete from ITENS_ENTRADA'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_ENT = :OLD_COD_ENT and'
      '  ORDEM = :OLD_ORDEM')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_ENT,'
      '  COD_PRO,'
      '  PERC_ICMS,'
      '  PERC_IPI,'
      '  QTDUND_ENT,'
      '  PERC_DESC,'
      '  PERC_ACRES,'
      '  COD_EMP,'
      '  VALOR_UNIT_PRO,'
      '  CUSTO,'
      '  QTD_PRO,'
      '  COD_GRP,'
      '  COD_CFOP,'
      '  VALOR_DESCONTO,'
      '  VALOR_ACRESCIMO,'
      '  PERC_BCR,'
      '  CST,'
      '  VALOR_TOTAL,'
      '  BASE_CALCULO,'
      '  VALOR_ICMS,'
      '  ORDEM,'
      '  PERC_ST,'
      '  VALOR_SUB_TRIBUTARIA,'
      '  VALOR_IPI,'
      '  CODIGO_LOCAL_ESTOQUE,'
      '  BC_ST,'
      '  CST_IPI,'
      '  CST_PIS,'
      '  ALIQ_PIS,'
      '  VALOR_PIS,'
      '  CST_COFINS,'
      '  ALIQ_COFINS,'
      '  VALOR_COFINS'
      'from ITENS_ENTRADA '
      'where'
      '  COD_EMP = :COD_EMP and'
      '  COD_ENT = :COD_ENT and'
      '  ORDEM = :ORDEM')
    Left = 360
    Top = 200
  end
  object QNota: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRImport
    UpdateObject = SQL_NOTA
    SQL.Strings = (
      'select * from Entradas where COD_ENT=:COD_ENT')
    Left = 24
    Top = 176
    ParamData = <
      item
        Name = 'COD_ENT'
      end>
    object QNotaTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Origin = '"ENTRADAS"."TOTAL_ENT"'
      Precision = 18
      Size = 2
    end
    object QNotaACRES_ENT: TBCDField
      FieldName = 'ACRES_ENT'
      Origin = '"ENTRADAS"."ACRES_ENT"'
      Precision = 18
      Size = 2
    end
    object QNotaDESC_ENT: TBCDField
      FieldName = 'DESC_ENT'
      Origin = '"ENTRADAS"."DESC_ENT"'
      Precision = 18
      Size = 2
    end
    object QNotaFRETE_ENT: TBCDField
      FieldName = 'FRETE_ENT'
      Origin = '"ENTRADAS"."FRETE_ENT"'
      Precision = 18
      Size = 2
    end
    object QNotaBASE_SUB_TRIB: TBCDField
      FieldName = 'BASE_SUB_TRIB'
      Origin = '"ENTRADAS"."BASE_SUB_TRIB"'
      Precision = 18
      Size = 2
    end
    object QNotaVALOR_ICMS_SUB: TBCDField
      FieldName = 'VALOR_ICMS_SUB'
      Origin = '"ENTRADAS"."VALOR_ICMS_SUB"'
      Precision = 18
      Size = 2
    end
    object QNotaTOTAL_PRODUTOS: TBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = '"ENTRADAS"."TOTAL_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object QNotaVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ENTRADAS"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object QNotaVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ENTRADAS"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object QNotaBC_ICMS: TBCDField
      FieldName = 'BC_ICMS'
      Origin = '"ENTRADAS"."BC_ICMS"'
      Precision = 18
    end
    object QNotaVL_ICMS: TBCDField
      FieldName = 'VL_ICMS'
      Origin = '"ENTRADAS"."VL_ICMS"'
      Precision = 18
    end
    object QNotaVL_IPI: TBCDField
      FieldName = 'VL_IPI'
      Origin = '"ENTRADAS"."VL_IPI"'
      Precision = 18
    end
    object QNotaVL_SEG: TBCDField
      FieldName = 'VL_SEG'
      Origin = '"ENTRADAS"."VL_SEG"'
      Precision = 18
    end
    object QNotaCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = '"ENTRADAS"."COD_ENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNotaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ENTRADAS"."COD_EMP"'
      Required = True
    end
  end
  object SQL_NOTA: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'insert into Entradas'
      
        '  (ACRES_ENT, BASE_SUB_TRIB, BC_ICMS, DESC_ENT, FRETE_ENT, TOTAL' +
        '_ENT, TOTAL_PRODUTOS, '
      
        '   VALOR_COFINS, VALOR_ICMS_SUB, VALOR_PIS, VL_ICMS, VL_IPI, VL_' +
        'SEG)'
      'values'
      
        '  (:ACRES_ENT, :BASE_SUB_TRIB, :BC_ICMS, :DESC_ENT, :FRETE_ENT, ' +
        ':TOTAL_ENT, '
      
        '   :TOTAL_PRODUTOS, :VALOR_COFINS, :VALOR_ICMS_SUB, :VALOR_PIS, ' +
        ':VL_ICMS, '
      '   :VL_IPI, :VL_SEG)')
    ModifySQL.Strings = (
      'update Entradas'
      'set'
      '  ACRES_ENT = :ACRES_ENT,'
      '  BASE_SUB_TRIB = :BASE_SUB_TRIB,'
      '  BC_ICMS = :BC_ICMS,'
      '  DESC_ENT = :DESC_ENT,'
      '  FRETE_ENT = :FRETE_ENT,'
      '  TOTAL_ENT = :TOTAL_ENT,'
      '  TOTAL_PRODUTOS = :TOTAL_PRODUTOS,'
      '  VALOR_COFINS = :VALOR_COFINS,'
      '  VALOR_ICMS_SUB = :VALOR_ICMS_SUB,'
      '  VALOR_PIS = :VALOR_PIS,'
      '  VL_ICMS = :VL_ICMS,'
      '  VL_IPI = :VL_IPI,'
      '  VL_SEG = :VL_SEG'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_ENT = :OLD_COD_ENT')
    DeleteSQL.Strings = (
      'delete from Entradas'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_ENT = :OLD_COD_ENT')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_ENT,'
      '  COD_EMP,'
      '  DATAEMI_ENT,'
      '  DATAENT_ENT,'
      '  COD_FOR,'
      '  TOTAL_ENT,'
      '  ACRES_ENT,'
      '  DESC_ENT,'
      '  FRETE_ENT,'
      '  ICMSFRETE_ENT,'
      '  TIPO_ENT,'
      '  NUMNF_ENT,'
      '  SERIE_ENT,'
      '  BASE_SUB_TRIB,'
      '  VALOR_ICMS_SUB,'
      '  FRETE_INCLUSO,'
      '  ICMS_SUB_INCLUSO,'
      '  TOTAL_PRODUTOS,'
      '  CUSTO_SEM_DESCONTO,'
      '  CODIFICACAO_FISCAL,'
      '  CODIGO_ES,'
      '  CHAVE_NFE,'
      '  VALOR_PIS,'
      '  VALOR_COFINS,'
      '  CODIGO_ESTADO,'
      '  BC_ICMS,'
      '  VL_ICMS,'
      '  VL_IPI,'
      '  VL_SEG'
      'from Entradas '
      'where'
      '  COD_EMP = :COD_EMP and'
      '  COD_ENT = :COD_ENT')
    Left = 24
    Top = 176
  end
end
