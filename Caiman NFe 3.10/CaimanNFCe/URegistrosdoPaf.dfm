object dmRegistrosdoPaf: TdmRegistrosdoPaf
  OldCreateOrder = False
  Height = 350
  Width = 481
  object TRBlocoVII: TFDTransaction
    Connection = DM.IBDatabase
    Left = 432
    Top = 80
  end
  object QMeiosPagamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      'select * from MEIOS_PAGAMENTOS_ECF where'
      
        ' cod_cai=:cod_cai and cod_emp=:cod_emp and DATA between :dataini' +
        ' and :datafim')
    Left = 128
    Top = 8
    ParamData = <
      item
        Name = 'cod_cai'
      end
      item
        Name = 'cod_emp'
      end
      item
        Name = 'dataini'
      end
      item
        Name = 'datafim'
      end>
    object QMeiosPagamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QMeiosPagamentoCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."COD_CAI"'
      Required = True
    end
    object QMeiosPagamentoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."COD_EMP"'
      Required = True
    end
    object QMeiosPagamentoCOO: TIntegerField
      FieldName = 'COO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."COO"'
      Required = True
    end
    object QMeiosPagamentoCCF: TIntegerField
      FieldName = 'CCF'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."CCF"'
    end
    object QMeiosPagamentoGNF: TIntegerField
      FieldName = 'GNF'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."GNF"'
    end
    object QMeiosPagamentoMEIO_PAGAMENTO: TStringField
      FieldName = 'MEIO_PAGAMENTO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."MEIO_PAGAMENTO"'
      Required = True
      Size = 15
    end
    object QMeiosPagamentoVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."VALOR_PAGO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMeiosPagamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."DATA"'
      Required = True
    end
    object QMeiosPagamentoTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."TIPO_DOCUMENTO"'
      Required = True
      Size = 30
    end
    object QMeiosPagamentoSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."STATUS_EXPORTA"'
    end
  end
  object QBlocoVII: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRBlocoVII
    Left = 432
    Top = 32
  end
  object TRRegistros: TFDTransaction
    Connection = DM.IBDatabase
    Left = 40
    Top = 24
  end
  object QConsulta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    Left = 120
    Top = 64
  end
  object QEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      
        'select p.codigo_barra_pro ,e.cod_pro,  p.desc_cupom, u.descricao' +
        ' unidade,'
      'case when e.estoque_inicial < 0 then '#39'-'#39' else '#39'+'#39' end'
      'mensuracao,e.estoque_inicial from estoque e'
      'inner join produto p'
      'on ( p.cod_pro = e.cod_pro )'
      'inner join  unidade_medida u'
      'on ( u.codigo = p.codigo_unidade_saida )'
      'where e.cod_emp = :cod_emp')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object QEstoqueCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ESTOQUE"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEstoqueDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QEstoqueUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QEstoqueMENSURACAO: TStringField
      FieldName = 'MENSURACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object QEstoqueESTOQUE_INICIAL: TBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Origin = '"ESTOQUE"."ESTOQUE_INICIAL"'
      Precision = 18
      Size = 3
    end
    object QEstoqueCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object QOrcamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      
        'SELECT O.COO, O.COO_VENDA, O.CCF_VENDA, O.SEQUENCIA_DAV, O.DATA,' +
        ' O.TOTAL, C.R01_NUMERO_SERIE, C.R01_MF_ADICIONAL, C.R01_TIPO_ECF' +
        ', C.R01_MARCA_ECF, C.R01_MODELO_ECF, CC.nome_cli, CC.cnpj_cli, O' +
        '.CODIGO'
      'FROM ORCAMENTO O'
      'INNER JOIN CAIXA C'
      'ON (O.COD_CAI = C.COD_CAI AND O.COD_EMP = C.COD_EMP)'
      'INNER JOIN CLIENTE CC'
      'ON ( CC.cod_cli = O.cod_cli )'
      'WHERE DATA BETWEEN :DATAINI AND :DATAFIN '
      'ORDER BY O.CODIGO')
    Left = 104
    Top = 192
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object QOrcamentoCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'ORCAMENTO.COO'
    end
    object QOrcamentoCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = 'ORCAMENTO.COO_VENDA'
    end
    object QOrcamentoSEQUENCIA_DAV: TLargeintField
      FieldName = 'SEQUENCIA_DAV'
      Origin = 'ORCAMENTO.SEQUENCIA_DAV'
      Required = True
    end
    object QOrcamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'ORCAMENTO.DATA'
      Required = True
    end
    object QOrcamentoTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'ORCAMENTO.TOTAL'
      Precision = 18
      Size = 2
    end
    object QOrcamentoR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'CAIXA.R01_NUMERO_SERIE'
    end
    object QOrcamentoR01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = 'CAIXA.R01_MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QOrcamentoR01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = 'CAIXA.R01_TIPO_ECF'
      Size = 7
    end
    object QOrcamentoR01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = 'CAIXA.R01_MARCA_ECF'
    end
    object QOrcamentoR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'CAIXA.R01_MODELO_ECF'
    end
    object QOrcamentoCCF_VENDA: TIntegerField
      FieldName = 'CCF_VENDA'
      Origin = 'ORCAMENTO.CCF_VENDA'
    end
    object QOrcamentoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QOrcamentoCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ORCAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object QBuscaItensDAV: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      
        'select IO.*, P.NOME_PRO, U.descricao, G.tipo_grp, G.aliquota_grp' +
        ', P.codigo_barra_pro from itens_orcamento IO'
      'INNER JOIN PRODUTO P'
      'ON ( P.COD_PRO = IO.cod_pro )'
      'INNER JOIN unidade_medida U'
      'ON ( U.codigo = P.codigo_unidade_saida )'
      'INNER JOIN grupo_icms G'
      'ON ( G.cod_grp = P.icms_cf_est )'
      'where IO.codigo = :CODIGO'
      'ORDER BY ORDEM')
    Left = 48
    Top = 168
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QBuscaItensDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_ORCAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDAVORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_ORCAMENTO"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDAVCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ORCAMENTO"."COD_PRO"'
      Required = True
    end
    object QBuscaItensDAVDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_ORCAMENTO"."DESCONTO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensDAVCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_ORCAMENTO"."COD_EMP"'
      Required = True
    end
    object QBuscaItensDAVQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_ORCAMENTO"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensDAVVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_ORCAMENTO"."VALOR"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensDAVPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_ORCAMENTO"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensDAVCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_ORCAMENTO"."CANCELADO"'
      Required = True
    end
    object QBuscaItensDAVCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = '"ITENS_ORCAMENTO"."CHAVE"'
      Size = 100
    end
    object QBuscaItensDAVNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QBuscaItensDAVDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QBuscaItensDAVTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensDAVALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensDAVDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
      Origin = '"ITENS_ORCAMENTO"."DATA_INCLUSAO"'
    end
    object QBuscaItensDAVCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object QBuscaItensDavLog: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      
        'select IO.*, P.NOME_PRO, U.descricao, G.tipo_grp, G.aliquota_grp' +
        ', P.codigo_barra_pro from itens_orcamento_log IO'
      'INNER JOIN PRODUTO P'
      'ON ( P.COD_PRO = IO.cod_pro )'
      'INNER JOIN unidade_medida U'
      'ON ( U.codigo = P.codigo_unidade_saida )'
      'INNER JOIN grupo_icms G'
      'ON ( G.cod_grp = P.icms_cf_est )'
      'where IO.codigo = :CODIGO'
      'ORDER BY ORDEM')
    Left = 72
    Top = 256
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QBuscaItensDavLogCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_ORCAMENTO_LOG"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDavLogORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_ORCAMENTO_LOG"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDavLogCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ORCAMENTO_LOG"."COD_PRO"'
      Required = True
    end
    object QBuscaItensDavLogDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_ORCAMENTO_LOG"."DESCONTO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensDavLogCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_ORCAMENTO_LOG"."COD_EMP"'
      Required = True
    end
    object QBuscaItensDavLogQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_ORCAMENTO_LOG"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensDavLogVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_ORCAMENTO_LOG"."VALOR"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensDavLogPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_ORCAMENTO_LOG"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensDavLogCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_ORCAMENTO_LOG"."CANCELADO"'
      Required = True
    end
    object QBuscaItensDavLogTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"ITENS_ORCAMENTO_LOG"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensDavLogDATA_ALT: TDateField
      FieldName = 'DATA_ALT'
      Origin = '"ITENS_ORCAMENTO_LOG"."DATA_ALT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDavLogHORA_ALT: TTimeField
      FieldName = 'HORA_ALT'
      Origin = '"ITENS_ORCAMENTO_LOG"."HORA_ALT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensDavLogNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QBuscaItensDavLogDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QBuscaItensDavLogTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QBuscaItensDavLogALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensDavLogCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
  end
  object QMesas: TFDQuery
    Transaction = IBTRMesas
    SQL.Strings = (
      
        'select c.*, ca.r01_numero_serie, ca.r01_cnpj_usuario  from conta' +
        '_cliente c'
      'left outer join caixa ca'
      'on (ca.cod_cai = c.cod_cai and ca.cod_emp = c.cod_emp )'
      'left outer join empresa e'
      'on ( e.cod_emp = c.cod_emp )'
      
        'where c.data_abertura between :dataini and :datafim and c.cod_em' +
        'p =:cod_emp')
    Left = 424
    Top = 160
    ParamData = <
      item
        Name = 'dataini'
      end
      item
        Name = 'datafim'
      end
      item
        Name = 'cod_emp'
      end>
    object QMesasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"CONTA_CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QMesasDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = '"CONTA_CLIENTE"."DATA_ABERTURA"'
      Required = True
    end
    object QMesasHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = '"CONTA_CLIENTE"."HORA_ABERTURA"'
      Required = True
    end
    object QMesasCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = '"CONTA_CLIENTE"."CONTA"'
      Required = True
    end
    object QMesasDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = '"CONTA_CLIENTE"."DATA_FECHAMENTO"'
    end
    object QMesasHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = '"CONTA_CLIENTE"."HORA_FECHAMENTO"'
    end
    object QMesasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"CONTA_CLIENTE"."COD_CAI"'
      Required = True
    end
    object QMesasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"CONTA_CLIENTE"."COD_EMP"'
      Required = True
    end
    object QMesasSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = '"CONTA_CLIENTE"."STATUS"'
      Required = True
    end
    object QMesasTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = '"CONTA_CLIENTE"."TOTAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMesasCONTA_ORIGEM: TIntegerField
      FieldName = 'CONTA_ORIGEM'
      Origin = '"CONTA_CLIENTE"."CONTA_ORIGEM"'
    end
    object QMesasCER: TIntegerField
      FieldName = 'CER'
      Origin = '"CONTA_CLIENTE"."CER"'
    end
    object QMesasCOO: TIntegerField
      FieldName = 'COO'
      Origin = '"CONTA_CLIENTE"."COO"'
    end
    object QMesasCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = '"CONTA_CLIENTE"."COO_VENDA"'
    end
    object QMesasR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = '"CAIXA"."R01_NUMERO_SERIE"'
    end
    object QMesasR01_CNPJ_USUARIO: TStringField
      FieldName = 'R01_CNPJ_USUARIO'
      Origin = '"CAIXA"."R01_CNPJ_USUARIO"'
      Size = 14
    end
  end
  object IBTRMesas: TFDTransaction
    Left = 424
    Top = 216
  end
  object QMesasItens: TFDQuery
    Transaction = IBTRMesas
    SQL.Strings = (
      'select p.codigo_barra_pro, p.desc_cupom, u.descricao unid,'
      'i.quant, i.valor from itens_conta_cliente i'
      'inner join produto p'
      'on ( p.cod_pro = i.cod_pro )'
      'inner join unidade_medida u'
      'on ( u.codigo = p.codigo_unidade_saida )'
      'where i.codigo=:cod and i.cod_emp=:cod_emp')
    Left = 424
    Top = 272
    ParamData = <
      item
        Name = 'cod'
      end
      item
        Name = 'cod_emp'
      end>
    object QMesasItensCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QMesasItensUNID: TStringField
      FieldName = 'UNID'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QMesasItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_CONTA_CLIENTE"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QMesasItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_CONTA_CLIENTE"."VALOR"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMesasItensDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
  end
  object QTrocoH2: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRegistros
    SQL.Strings = (
      
        'select H2.*, c.r01_numero_serie, c.r01_mf_adicional, c.r01_tipo_' +
        'ecf,'
      'c.r01_marca_ecf, c.r01_modelo_ecf from troco_cartao_h2 H2'
      'left outer join caixa c'
      'on ( c.cod_cai = H2.cod_caixa and c.cod_emp = H2.cod_emp )'
      
        'where H2.cod_caixa=:cod_caixa and H2.cod_emp = :cod_emp and H2.d' +
        'ata between :dataini and :datafim')
    Left = 176
    Top = 256
    ParamData = <
      item
        Name = 'cod_caixa'
      end
      item
        Name = 'cod_emp'
      end
      item
        Name = 'dataini'
      end
      item
        Name = 'datafim'
      end>
    object QTrocoH2COD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"TROCO_CARTAO_H2"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTrocoH2COD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = '"TROCO_CARTAO_H2"."COD_CAIXA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTrocoH2COO: TIntegerField
      FieldName = 'COO'
      Origin = '"TROCO_CARTAO_H2"."COO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTrocoH2CCF: TIntegerField
      FieldName = 'CCF'
      Origin = '"TROCO_CARTAO_H2"."CCF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTrocoH2DATA: TDateField
      FieldName = 'DATA'
      Origin = '"TROCO_CARTAO_H2"."DATA"'
    end
    object QTrocoH2VALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"TROCO_CARTAO_H2"."VALOR"'
      Precision = 18
      Size = 2
    end
    object QTrocoH2CNPJ_CRED: TStringField
      FieldName = 'CNPJ_CRED'
      Origin = '"TROCO_CARTAO_H2"."CNPJ_CRED"'
    end
    object QTrocoH2CPF: TStringField
      FieldName = 'CPF'
      Origin = '"TROCO_CARTAO_H2"."CPF"'
    end
    object QTrocoH2TITULO: TStringField
      FieldName = 'TITULO'
      Origin = '"TROCO_CARTAO_H2"."TITULO"'
      Size = 7
    end
    object QTrocoH2R01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = '"CAIXA"."R01_NUMERO_SERIE"'
    end
    object QTrocoH2R01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = '"CAIXA"."R01_MF_ADICIONAL"'
      FixedChar = True
      Size = 1
    end
    object QTrocoH2R01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = '"CAIXA"."R01_TIPO_ECF"'
      Size = 7
    end
    object QTrocoH2R01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = '"CAIXA"."R01_MARCA_ECF"'
    end
    object QTrocoH2R01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = '"CAIXA"."R01_MODELO_ECF"'
    end
  end
end
