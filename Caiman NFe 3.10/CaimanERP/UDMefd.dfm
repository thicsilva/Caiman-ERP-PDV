object DMefd: TDMefd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 448
  Width = 733
  object PisCofins: TACBrSPEDPisCofins
    Path = 'C:\Program Files (x86)\Embarcadero\RAD Studio\8.0\bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    OnError = PisCofinsError
    Left = 48
    Top = 16
  end
  object Produtos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'SELECT P.COD_PRO,P.codigo_barra_pro,P.tipo_producao, P.NOME_PRO,' +
        ' P.COD_NCM, G.ALIQUOTA_GRP, U.DESCRICAO, TP.efd_tipo'
      'FROM PRODUTO P'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'inner join tipo_produto TP'
      'on ( P.codigo_tipo = TP.codigo )'
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
      'P.COD_PRO IN (SELECT COD_PRO '
      '             FROM ITENS_NOTA_FISCAL INF'
      '             INNER JOIN NOTA_FISCAL NF'
      '             ON (INF.COD_NF = NF.COD_NF)'
      
        '             WHERE NF.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATA' +
        'FIN AND NF.CANCELADA_NF = '#39'N'#39' AND NF.cod_emp=:CODEMP AND'
      
        '             NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39 +
        '22'#39', '#39'55'#39'))'
      ''
      'ORDER BY P.COD_PRO')
    Left = 40
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
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
    object ProdutosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProdutosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object ProdutosCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = '"PRODUTO"."COD_NCM"'
      Size = 8
    end
    object ProdutosALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object ProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object ProdutosCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object ProdutosTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = '"PRODUTO"."TIPO_PRODUCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ProdutosEFD_TIPO: TStringField
      FieldName = 'EFD_TIPO'
      Origin = '"TIPO_PRODUTO"."EFD_TIPO"'
      Size = 2
    end
  end
  object TREfd: TFDTransaction
    Connection = DM.IBDatabase
    Left = 104
    Top = 16
  end
  object Medidas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select U.* from unidade_medida U where U.codigo in'
      '('
      'SELECT P.codigo_unidade_saida'
      'FROM PRODUTO P'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'inner join tipo_produto TP'
      'on ( P.codigo_tipo = TP.codigo )'
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
      'P.COD_PRO IN (SELECT COD_PRO '
      '             FROM ITENS_NOTA_FISCAL INF'
      '             INNER JOIN NOTA_FISCAL NF'
      '             ON (INF.COD_NF = NF.COD_NF)'
      
        '             WHERE NF.cod_emp=:CODEMP and NF.DATA_EMISSAO_NF BET' +
        'WEEN :DATAINI AND :DATAFIN AND NF.CANCELADA_NF = '#39'N'#39' AND'
      
        '             NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39 +
        '22'#39', '#39'55'#39'))'
      ')'
      '')
    Left = 40
    Top = 176
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
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object MedidasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"UNIDADE_MEDIDA"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MedidasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object Clientes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select c.cod_cli ,C.nome_cli, '#39'1058'#39' PAIS, C.cnpj_cli, c.insc_es' +
        'tadual, c.codigo_ibge,'
      
        'c.endres_cli, c.numres_cli, c.obs_cli, c.baires_cli from cliente' +
        ' C'
      ''
      'WHERE c.cod_cli IN (SELECT NF.cod_cli'
      '             FROM ITENS_NOTA_FISCAL INF'
      '             INNER JOIN NOTA_FISCAL NF'
      '             ON (INF.COD_NF = NF.COD_NF)'
      
        '             WHERE NF.cod_emp=:CODEMP and  NF.DATA_EMISSAO_NF BE' +
        'TWEEN :DATAINI AND :DATAFIN AND NF.CANCELADA_NF = '#39'N'#39' AND'
      
        '             NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39 +
        '22'#39', '#39'55'#39'))'
      ''
      '')
    Left = 40
    Top = 224
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object ClientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object ClientesPAIS: TStringField
      FieldName = 'PAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 4
    end
    object ClientesCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object ClientesINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = '"CLIENTE"."INSC_ESTADUAL"'
      Size = 30
    end
    object ClientesCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"CLIENTE"."CODIGO_IBGE"'
    end
    object ClientesENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object ClientesNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object ClientesOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = '"CLIENTE"."OBS_CLI"'
      Size = 500
    end
    object ClientesBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
  end
  object Fornecedores: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select f.cod_for, f.razao_for, '#39'1058'#39' PAIS, f.cnpj_for, f.insc_f' +
        'or,'
      'f.codigo_ibge, f.end_for, f.num_for, f.bai_for from fornecedor F'
      ''
      'WHERE f.cod_for IN (SELECT E.cod_for'
      '              FROM ITENS_ENTRADA IE'
      '              INNER JOIN ENTRADAS E'
      '              ON (IE.COD_ENT = E.COD_ENT)'
      
        '              WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN ' +
        'AND IE.COD_EMP = :CODEMP)')
    Left = 40
    Top = 280
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
    object FornecedoresCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"FORNECEDOR"."COD_FOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FornecedoresRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = '"FORNECEDOR"."RAZAO_FOR"'
      Required = True
      Size = 60
    end
    object FornecedoresPAIS: TStringField
      FieldName = 'PAIS'
      ProviderFlags = []
      FixedChar = True
      Size = 4
    end
    object FornecedoresCNPJ_FOR: TStringField
      FieldName = 'CNPJ_FOR'
      Origin = '"FORNECEDOR"."CNPJ_FOR"'
      Size = 18
    end
    object FornecedoresINSC_FOR: TStringField
      FieldName = 'INSC_FOR'
      Origin = '"FORNECEDOR"."INSC_FOR"'
    end
    object FornecedoresCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"FORNECEDOR"."CODIGO_IBGE"'
    end
    object FornecedoresEND_FOR: TStringField
      FieldName = 'END_FOR'
      Origin = '"FORNECEDOR"."END_FOR"'
      Size = 50
    end
    object FornecedoresNUM_FOR: TStringField
      FieldName = 'NUM_FOR'
      Origin = '"FORNECEDOR"."NUM_FOR"'
      Size = 10
    end
    object FornecedoresBAI_FOR: TStringField
      FieldName = 'BAI_FOR'
      Origin = '"FORNECEDOR"."BAI_FOR"'
      Size = 30
    end
  end
  object Alterados: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select PA.* from produtos_alterados PA'
      
        'where pa.cod_pro =:COD_PRO and pa.data_fin BETWEEN :DATAINI AND ' +
        ':DATAFIN and pa.cod_pro in('
      'SELECT p.cod_pro'
      'FROM PRODUTO P'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'inner join tipo_produto TP'
      'on ( P.codigo_tipo = TP.codigo )'
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
      'P.COD_PRO IN (SELECT COD_PRO '
      '             FROM ITENS_NOTA_FISCAL INF'
      '             INNER JOIN NOTA_FISCAL NF'
      '             ON (INF.COD_NF = NF.COD_NF)'
      
        '             WHERE NF.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATA' +
        'FIN AND NF.CANCELADA_NF = '#39'N'#39' AND'
      
        '             NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39 +
        '22'#39', '#39'55'#39'))'
      ''
      ')')
    Left = 104
    Top = 120
    ParamData = <
      item
        Name = 'COD_PRO'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
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
      end>
    object AlteradosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"PRODUTOS_ALTERADOS"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AlteradosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTOS_ALTERADOS"."COD_PRO"'
      Required = True
    end
    object AlteradosDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = '"PRODUTOS_ALTERADOS"."DATA_HORA"'
      Required = True
    end
    object AlteradosDATA_INI: TDateField
      FieldName = 'DATA_INI'
      Origin = '"PRODUTOS_ALTERADOS"."DATA_INI"'
    end
    object AlteradosDATA_FIN: TDateField
      FieldName = 'DATA_FIN'
      Origin = '"PRODUTOS_ALTERADOS"."DATA_FIN"'
    end
    object AlteradosDESCRICAO_ANT: TStringField
      FieldName = 'DESCRICAO_ANT'
      Origin = '"PRODUTOS_ALTERADOS"."DESCRICAO_ANT"'
      Size = 200
    end
  end
  object Empresa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select e.inscricao_municipal, e.insc_emp, E.razao_emp, e.cnpj_em' +
        'p, e.est_emp, e.codigo_municipio,'
      
        #39'00'#39' IND_NAT_PJ, e.tipo_atividade_efd from empresa E where COD_E' +
        'MP=:CODEMP')
    Left = 104
    Top = 176
    ParamData = <
      item
        Name = 'CODEMP'
      end>
    object EmpresaRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = '"EMPRESA"."RAZAO_EMP"'
      Required = True
      Size = 50
    end
    object EmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = '"EMPRESA"."CNPJ_EMP"'
      Size = 14
    end
    object EmpresaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = '"EMPRESA"."EST_EMP"'
      FixedChar = True
      Size = 2
    end
    object EmpresaCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO"'
      Size = 7
    end
    object EmpresaIND_NAT_PJ: TStringField
      FieldName = 'IND_NAT_PJ'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object EmpresaTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = '"EMPRESA"."TIPO_ATIVIDADE_EFD"'
    end
    object EmpresaINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = '"EMPRESA"."INSC_EMP"'
    end
    object EmpresaINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = '"EMPRESA"."INSCRICAO_MUNICIPAL"'
    end
  end
  object Contador: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select e.nome_contador, e.cpf_contador, e.cnpj_contador,'
      'e.cep_contador, e.end_contador, e.numero_contador,'
      'e.bairro_contador, e.tel_contador, e.fax_contador,'
      
        'e.codigo_municipio_contador, e.crc_contador from empresa E where' +
        ' COD_EMP =:CODEMP')
    Left = 104
    Top = 232
    ParamData = <
      item
        Name = 'CODEMP'
      end>
    object ContadorNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = '"EMPRESA"."NOME_CONTADOR"'
      Size = 80
    end
    object ContadorCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = '"EMPRESA"."CPF_CONTADOR"'
      Size = 14
    end
    object ContadorCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = '"EMPRESA"."CNPJ_CONTADOR"'
      Size = 18
    end
    object ContadorCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = '"EMPRESA"."CEP_CONTADOR"'
      FixedChar = True
      Size = 9
    end
    object ContadorEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = '"EMPRESA"."END_CONTADOR"'
      Size = 60
    end
    object ContadorNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = '"EMPRESA"."NUMERO_CONTADOR"'
      Size = 10
    end
    object ContadorBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = '"EMPRESA"."BAIRRO_CONTADOR"'
      Size = 50
    end
    object ContadorTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = '"EMPRESA"."TEL_CONTADOR"'
      Size = 10
    end
    object ContadorFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = '"EMPRESA"."FAX_CONTADOR"'
      Size = 10
    end
    object ContadorCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO_CONTADOR"'
      Size = 7
    end
    object ContadorCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = '"EMPRESA"."CRC_CONTADOR"'
      Size = 15
    end
  end
  object NFSaidas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'SELECT NF.* from NOTA_FISCAL NF'
      
        'WHERE NF.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND NF.co' +
        'd_emp =:CODEMP and NF.CANCELADA_NF = '#39'N'#39' AND'
      
        'NF.CODIFICACAO_FISCAL IN ('#39'01'#39', '#39'02'#39', '#39'06'#39', '#39'21'#39', '#39'22'#39', '#39'55'#39') or' +
        'der by NF.numero_nota_nf')
    Left = 280
    Top = 128
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object NFSaidasCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"NOTA_FISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object NFSaidasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"NOTA_FISCAL"."COD_EMP"'
      Required = True
    end
    object NFSaidasNUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NOTA_NF"'
      Required = True
    end
    object NFSaidasDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = '"NOTA_FISCAL"."DATA_EMISSAO_NF"'
      Required = True
    end
    object NFSaidasDATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."DATA_SAIDA_NF"'
    end
    object NFSaidasHORA_SAIDA_NF: TTimeField
      FieldName = 'HORA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."HORA_SAIDA_NF"'
    end
    object NFSaidasCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = '"NOTA_FISCAL"."COD_TRA"'
      Required = True
    end
    object NFSaidasBASE_CALCULO_ICMS_NF: TBCDField
      FieldName = 'BASE_CALCULO_ICMS_NF'
      Origin = '"NOTA_FISCAL"."BASE_CALCULO_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_ICMS_NF: TBCDField
      FieldName = 'VALOR_ICMS_NF'
      Origin = '"NOTA_FISCAL"."VALOR_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasBASE_SUBST_NF: TBCDField
      FieldName = 'BASE_SUBST_NF'
      Origin = '"NOTA_FISCAL"."BASE_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_SUBST_NF: TBCDField
      FieldName = 'VALOR_SUBST_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_TOTAL_PROD_NF: TBCDField
      FieldName = 'VALOR_TOTAL_PROD_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_PROD_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_FRETE_NF: TBCDField
      FieldName = 'VALOR_FRETE_NF'
      Origin = '"NOTA_FISCAL"."VALOR_FRETE_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_SEGURO_NF: TBCDField
      FieldName = 'VALOR_SEGURO_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SEGURO_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasOUTRAS_DESPESAS_NF: TBCDField
      FieldName = 'OUTRAS_DESPESAS_NF'
      Origin = '"NOTA_FISCAL"."OUTRAS_DESPESAS_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_IPI_NF: TBCDField
      FieldName = 'VALOR_IPI_NF'
      Origin = '"NOTA_FISCAL"."VALOR_IPI_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasESPECIE_NF: TStringField
      FieldName = 'ESPECIE_NF'
      Origin = '"NOTA_FISCAL"."ESPECIE_NF"'
      Size = 10
    end
    object NFSaidasMARCA_NF: TStringField
      FieldName = 'MARCA_NF'
      Origin = '"NOTA_FISCAL"."MARCA_NF"'
      Size = 10
    end
    object NFSaidasNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NF"'
      Size = 10
    end
    object NFSaidasINF_COMPL_NF: TWideMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = '"NOTA_FISCAL"."INF_COMPL_NF"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object NFSaidasCANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = '"NOTA_FISCAL"."CANCELADA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFSaidasFRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = '"NOTA_FISCAL"."FRETE_CONTA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFSaidasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"NOTA_FISCAL"."COD_CLI"'
    end
    object NFSaidasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"NOTA_FISCAL"."COD_FOR"'
    end
    object NFSaidasDESCONTO_NF: TBCDField
      FieldName = 'DESCONTO_NF'
      Origin = '"NOTA_FISCAL"."DESCONTO_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Origin = '"NOTA_FISCAL"."TIPO_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFSaidasNOTA_IMPRESSA: TStringField
      FieldName = 'NOTA_IMPRESSA'
      Origin = '"NOTA_FISCAL"."NOTA_IMPRESSA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFSaidasCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"NOTA_FISCAL"."COD_VENDA"'
    end
    object NFSaidasCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"NOTA_FISCAL"."COD_TPV"'
      Required = True
    end
    object NFSaidasSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = '"NOTA_FISCAL"."SERIE_NOTA"'
      Size = 3
    end
    object NFSaidasTIPO_NOTA_FISCAL: TIntegerField
      FieldName = 'TIPO_NOTA_FISCAL'
      Origin = '"NOTA_FISCAL"."TIPO_NOTA_FISCAL"'
      Required = True
    end
    object NFSaidasCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"NOTA_FISCAL"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object NFSaidasCODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_ENTRADA"'
    end
    object NFSaidasCODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_SAIDA"'
    end
    object NFSaidasCHAVE_ACESSO_NFE: TStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = '"NOTA_FISCAL"."CHAVE_ACESSO_NFE"'
      Size = 44
    end
    object NFSaidasPROTOCOLO_NFE: TStringField
      FieldName = 'PROTOCOLO_NFE'
      Origin = '"NOTA_FISCAL"."PROTOCOLO_NFE"'
      Size = 50
    end
    object NFSaidasSTATUS_TRANSMITIDA: TStringField
      FieldName = 'STATUS_TRANSMITIDA'
      Origin = '"NOTA_FISCAL"."STATUS_TRANSMITIDA"'
      Size = 2
    end
    object NFSaidasSTATUS_RETORNO: TStringField
      FieldName = 'STATUS_RETORNO'
      Origin = '"NOTA_FISCAL"."STATUS_RETORNO"'
      Size = 2
    end
    object NFSaidasSTATUS_CANCELADO: TStringField
      FieldName = 'STATUS_CANCELADO'
      Origin = '"NOTA_FISCAL"."STATUS_CANCELADO"'
      Size = 2
    end
    object NFSaidasSTATUS_INUTILIZADO: TStringField
      FieldName = 'STATUS_INUTILIZADO'
      Origin = '"NOTA_FISCAL"."STATUS_INUTILIZADO"'
      Size = 2
    end
    object NFSaidasSTATUS_EMAIL: TStringField
      FieldName = 'STATUS_EMAIL'
      Origin = '"NOTA_FISCAL"."STATUS_EMAIL"'
      Size = 2
    end
    object NFSaidasJUSTIFICATIVA_CANCEL_INUTIL: TStringField
      FieldName = 'JUSTIFICATIVA_CANCEL_INUTIL'
      Origin = '"NOTA_FISCAL"."JUSTIFICATIVA_CANCEL_INUTIL"'
      Size = 100
    end
    object NFSaidasPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."PLACA_TRANSP"'
      FixedChar = True
      Size = 8
    end
    object NFSaidasUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."UF_PLACA_TRANSP"'
      FixedChar = True
      Size = 2
    end
    object NFSaidasPESO_BRUTO_NF: TBCDField
      FieldName = 'PESO_BRUTO_NF'
      Origin = '"NOTA_FISCAL"."PESO_BRUTO_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasPESO_LIQUIDO_NF: TBCDField
      FieldName = 'PESO_LIQUIDO_NF'
      Origin = '"NOTA_FISCAL"."PESO_LIQUIDO_NF"'
      Precision = 18
      Size = 2
    end
    object NFSaidasQUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = '"NOTA_FISCAL"."QUANTIDADE_NF"'
    end
    object NFSaidasCHAVE2: TStringField
      FieldName = 'CHAVE2'
      Origin = '"NOTA_FISCAL"."CHAVE2"'
      Size = 255
    end
    object NFSaidasDEPEC: TIntegerField
      FieldName = 'DEPEC'
      Origin = '"NOTA_FISCAL"."DEPEC"'
    end
    object NFSaidasVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object NFSaidasVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object NFSaidasCORRECAO: TStringField
      FieldName = 'CORRECAO'
      Origin = '"NOTA_FISCAL"."CORRECAO"'
      Size = 1
    end
  end
  object Itens_NFSAIDA: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select I.*, P.* from itens_nota_fiscal I'
      
        'inner join produto P on ( P.cod_pro = I.cod_pro ) where COD_NF=:' +
        'CODNF')
    Left = 280
    Top = 176
    ParamData = <
      item
        Name = 'CODNF'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object Itens_NFSAIDAORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Itens_NFSAIDACOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'COD_NF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Itens_NFSAIDACST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object Itens_NFSAIDAALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ALIQ'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object Itens_NFSAIDACOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      Required = True
    end
    object Itens_NFSAIDAQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Precision = 18
      Size = 3
    end
    object Itens_NFSAIDAALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'COD_CFO'
      Required = True
    end
    object Itens_NFSAIDASUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object Itens_NFSAIDACOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object Itens_NFSAIDAVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDABASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDABASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Precision = 18
      Size = 3
    end
    object Itens_NFSAIDAISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'FRETE'
    end
    object Itens_NFSAIDADESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object Itens_NFSAIDABC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = 'BC_PIS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDABC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = 'BC_COFINS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
    end
    object Itens_NFSAIDANF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = 'NF_CANCELADA'
    end
    object Itens_NFSAIDACST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object Itens_NFSAIDACST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object Itens_NFSAIDACSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object Itens_NFSAIDACST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object Itens_NFSAIDACOD_PRO_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO_1'
      Origin = 'COD_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACOD_LAB: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_LAB'
      Origin = 'COD_LAB'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACOD_SEC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAVALOR_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PRO'
      Origin = 'VALOR_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAPROMOCAO_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PROMOCAO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACONTROLA_ESTOQUE_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = 'CONTROLA_ESTOQUE_PRO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDACOMISSAO_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COMISSAO_PRO'
      Origin = 'COMISSAO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAQUANT_UNIDADE_ENTRADA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANT_UNIDADE_ENTRADA'
      Origin = 'QUANT_UNIDADE_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAESTOQUE_MINIMO_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_MINIMO_PRO'
      Origin = 'ESTOQUE_MINIMO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDANOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object Itens_NFSAIDADESC_CUPOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object Itens_NFSAIDAATIVO_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO_PRO'
      Origin = 'ATIVO_PRO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAMARGEM_LUCRO_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = 'MARGEM_LUCRO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDALOCALIZACAO_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'LOCALIZACAO_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAPRODUTO_PESADO_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = 'PRODUTO_PESADO_PRO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDACOD_SETOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_SETOR'
      Origin = 'COD_SETOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDATECLA_ATALHO_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TECLA_ATALHO_PRO'
      Origin = 'TECLA_ATALHO_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAINDICE_RECEITA_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'INDICE_RECEITA_PRO'
      Origin = 'INDICE_RECEITA_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDADIAS_VALIDADE_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = 'DIAS_VALIDADE_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAREFERENCIA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA_PRO'
      Origin = 'REFERENCIA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object Itens_NFSAIDACOMPLEMENTO_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO_PRO'
      Origin = 'COMPLEMENTO_PRO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAICMS_CONT_EST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS_CONT_EST'
      Origin = 'ICMS_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAICMS_CONT_FORA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS_CONT_FORA'
      Origin = 'ICMS_CONT_FORA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAICMS_CF_EST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS_CF_EST'
      Origin = 'ICMS_CF_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAICMS_CF_FORA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS_CF_FORA'
      Origin = 'ICMS_CF_FORA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACST_CONT_EST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_CONT_EST'
      Origin = 'CST_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object Itens_NFSAIDACST_CONT_FORA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_CONT_FORA'
      Origin = 'CST_CONT_FORA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object Itens_NFSAIDACST_CF_EST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_CF_EST'
      Origin = 'CST_CF_EST'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object Itens_NFSAIDACST_CF_FORA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_CF_FORA'
      Origin = 'CST_CF_FORA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object Itens_NFSAIDACAMINHO_FOTO_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = 'CAMINHO_FOTO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object Itens_NFSAIDASAIR_TABELA_PRECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = 'SAIR_TABELA_PRECO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDACFOP_VENDAS_CONT_EST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_VENDAS_CONT_EST'
      Origin = 'CFOP_VENDAS_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACFOP_VENDAS_CF_EST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = 'CFOP_VENDAS_CF_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACFOP_VENDAS_CONT_FORA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_VENDAS_CONT_FORA'
      Origin = 'CFOP_VENDAS_CONT_FORA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACFOP_VENDAS_CF_FORA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP_VENDAS_CF_FORA'
      Origin = 'CFOP_VENDAS_CF_FORA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAST_CONT_EST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ST_CONT_EST'
      Origin = 'ST_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAVR_AGREG_CONT_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VR_AGREG_CONT_EST'
      Origin = 'VR_AGREG_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAIPI_CONT_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IPI_CONT_EST'
      Origin = 'IPI_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAIPI_CF_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IPI_CF_EST'
      Origin = 'IPI_CF_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAIPI_CONT_FORA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IPI_CONT_FORA'
      Origin = 'IPI_CONT_FORA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAIPI_CF_FORA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IPI_CF_FORA'
      Origin = 'IPI_CF_FORA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDACOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object Itens_NFSAIDACLASSIFICACAO_FISCAL_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLASSIFICACAO_FISCAL_1'
      Origin = 'CLASSIFICACAO_FISCAL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDACODIGO_TIPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_TIPO'
      Origin = 'CODIGO_TIPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACOD_PRODUTO_ESTOQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = 'COD_PRODUTO_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACOD_GRUPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDASUB_GRUPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SUB_GRUPO'
      Origin = 'SUB_GRUPO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAPRECO_PROGRAMADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_PROGRAMADO'
      Origin = 'PRECO_PROGRAMADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_PIS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_COFINS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_IR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_IR'
      Origin = 'ALIQUOTA_IR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_CSLL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_CSLL'
      Origin = 'ALIQUOTA_CSLL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQUOTA_OUTRAS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_OUTRAS'
      Origin = 'ALIQUOTA_OUTRAS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAISENTO_PIS_COFINS_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = 'ISENTO_PIS_COFINS_PRO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAPRECO_CUSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object Itens_NFSAIDACREDITO_ICMS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CREDITO_ICMS'
      Origin = 'CREDITO_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object Itens_NFSAIDAPRECO_PRAZO_PRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRECO_PRAZO_PRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDATIPO_PRODUCAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'TIPO_PRODUCAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDACODIGO_BARRA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object Itens_NFSAIDACODIGO_UNIDADE_SAIDA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = 'CODIGO_UNIDADE_SAIDA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACODIGO_UNIDADE_ENTRADA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_UNIDADE_ENTRADA'
      Origin = 'CODIGO_UNIDADE_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAPRECO_PROGRAMADO_PRAZO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = 'PRECO_PROGRAMADO_PRAZO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDARED_CF_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RED_CF_EST'
      Origin = 'RED_CF_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDARED_CF_FORA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RED_CF_FORA'
      Origin = 'RED_CF_FORA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDARED_CONT_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RED_CONT_EST'
      Origin = 'RED_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDARED_CONT_FORA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RED_CONT_FORA'
      Origin = 'RED_CONT_FORA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDADATA_VALIDADE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACODIGO_SETOR_ESTOQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_SETOR_ESTOQUE'
      Origin = 'CODIGO_SETOR_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAORIG: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ORIG'
      Origin = 'ORIG'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACSOSN_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN_1'
      Origin = 'CSOSN'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object Itens_NFSAIDAIPI: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'IPI'
      Origin = 'IPI'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAICMS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS'
      Origin = 'ICMS'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDARICMS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'RICMS'
      Origin = 'RICMS'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAIVA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'IVA'
      Origin = 'IVA'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAPIS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PIS'
      Origin = 'PIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACONFINS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'CONFINS'
      Origin = 'CONFINS'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDATAMANHO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TAMANHO'
      Origin = 'TAMANHO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object Itens_NFSAIDACOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COR'
      Origin = 'COR'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object Itens_NFSAIDAOBS: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'OBS'
      Origin = 'OBS'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftMemo
    end
    object Itens_NFSAIDACST_PIS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS_1'
      Origin = 'CST_PIS'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object Itens_NFSAIDACST_COFINS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS_1'
      Origin = 'CST_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object Itens_NFSAIDACST_IPI_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_IPI_1'
      Origin = 'CST_IPI'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object Itens_NFSAIDAULTIMA_ALTERACAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = 'ULTIMA_ALTERACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDAVALOR_ATACADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ATACADO'
      Origin = 'VALOR_ATACADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQ_IBPT_NAC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = 'ALIQ_IBPT_NAC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAALIQ_IBPT_IMP: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IBPT_IMP'
      Origin = 'ALIQ_IBPT_IMP'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object Itens_NFSAIDAFATOR_CONVERSAO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FATOR_CONVERSAO'
      Origin = 'FATOR_CONVERSAO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object Itens_NFSAIDAALERTA_COPA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ALERTA_COPA'
      Origin = 'ALERTA_COPA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAALERTA_COZINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ALERTA_COZINHA'
      Origin = 'ALERTA_COZINHA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDAANDROID_VISUALIZA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ANDROID_VISUALIZA'
      Origin = 'ANDROID_VISUALIZA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFSAIDATEMPO_PREPARO: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO_PREPARO'
      Origin = 'TEMPO_PREPARO'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDANAO_PERMITE_FRAC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NAO_PERMITE_FRAC'
      Origin = 'NAO_PERMITE_FRAC'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDASABORES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SABORES'
      Origin = 'SABORES'
      ProviderFlags = []
      ReadOnly = True
    end
    object Itens_NFSAIDACEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEST'
      Origin = 'CEST'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
    object Itens_NFSAIDANCM_EX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NCM_EX'
      Origin = 'NCM_EX'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object ConfigEFD: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select * from EFD_PISCOFINS where COD_EMP=:CODEMP;')
    Left = 112
    Top = 280
    ParamData = <
      item
        Name = 'CODEMP'
      end>
    object ConfigEFDCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"EFD_PISCOFINS"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConfigEFDCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"EFD_PISCOFINS"."COD_EMP"'
    end
    object ConfigEFDVERSAO: TIntegerField
      FieldName = 'VERSAO'
      Origin = '"EFD_PISCOFINS"."VERSAO"'
    end
    object ConfigEFDREGIME_APURACAO: TIntegerField
      FieldName = 'REGIME_APURACAO'
      Origin = '"EFD_PISCOFINS"."REGIME_APURACAO"'
    end
    object ConfigEFDMETODO: TIntegerField
      FieldName = 'METODO'
      Origin = '"EFD_PISCOFINS"."METODO"'
    end
    object ConfigEFDTIPO_CONT: TIntegerField
      FieldName = 'TIPO_CONT'
      Origin = '"EFD_PISCOFINS"."TIPO_CONT"'
    end
  end
  object NFEntradas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select * from ENTRADAS E'
      
        'WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN AND E.cod_emp ' +
        '= :CODEMP')
    Left = 392
    Top = 128
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
    object NFEntradasCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = '"ENTRADAS"."COD_ENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object NFEntradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ENTRADAS"."COD_EMP"'
      Required = True
    end
    object NFEntradasDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Origin = '"ENTRADAS"."DATAEMI_ENT"'
      Required = True
    end
    object NFEntradasDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = '"ENTRADAS"."DATAENT_ENT"'
      Required = True
    end
    object NFEntradasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"ENTRADAS"."COD_FOR"'
      Required = True
    end
    object NFEntradasTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Origin = '"ENTRADAS"."TOTAL_ENT"'
      Precision = 18
      Size = 2
    end
    object NFEntradasACRES_ENT: TBCDField
      FieldName = 'ACRES_ENT'
      Origin = '"ENTRADAS"."ACRES_ENT"'
      Precision = 18
      Size = 2
    end
    object NFEntradasDESC_ENT: TBCDField
      FieldName = 'DESC_ENT'
      Origin = '"ENTRADAS"."DESC_ENT"'
      Precision = 18
      Size = 2
    end
    object NFEntradasFRETE_ENT: TBCDField
      FieldName = 'FRETE_ENT'
      Origin = '"ENTRADAS"."FRETE_ENT"'
      Precision = 18
      Size = 2
    end
    object NFEntradasICMSFRETE_ENT: TBCDField
      FieldName = 'ICMSFRETE_ENT'
      Origin = '"ENTRADAS"."ICMSFRETE_ENT"'
      Precision = 18
      Size = 2
    end
    object NFEntradasTIPO_ENT: TStringField
      FieldName = 'TIPO_ENT'
      Origin = '"ENTRADAS"."TIPO_ENT"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFEntradasNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Origin = '"ENTRADAS"."NUMNF_ENT"'
      Size = 15
    end
    object NFEntradasSERIE_ENT: TStringField
      FieldName = 'SERIE_ENT'
      Origin = '"ENTRADAS"."SERIE_ENT"'
      Size = 3
    end
    object NFEntradasBASE_SUB_TRIB: TBCDField
      FieldName = 'BASE_SUB_TRIB'
      Origin = '"ENTRADAS"."BASE_SUB_TRIB"'
      Precision = 18
      Size = 2
    end
    object NFEntradasVALOR_ICMS_SUB: TBCDField
      FieldName = 'VALOR_ICMS_SUB'
      Origin = '"ENTRADAS"."VALOR_ICMS_SUB"'
      Precision = 18
      Size = 2
    end
    object NFEntradasFRETE_INCLUSO: TStringField
      FieldName = 'FRETE_INCLUSO'
      Origin = '"ENTRADAS"."FRETE_INCLUSO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFEntradasICMS_SUB_INCLUSO: TStringField
      FieldName = 'ICMS_SUB_INCLUSO'
      Origin = '"ENTRADAS"."ICMS_SUB_INCLUSO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFEntradasTOTAL_PRODUTOS: TBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = '"ENTRADAS"."TOTAL_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object NFEntradasCUSTO_SEM_DESCONTO: TStringField
      FieldName = 'CUSTO_SEM_DESCONTO'
      Origin = '"ENTRADAS"."CUSTO_SEM_DESCONTO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NFEntradasCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"ENTRADAS"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object NFEntradasCODIGO_ES: TIntegerField
      FieldName = 'CODIGO_ES'
      Origin = '"ENTRADAS"."CODIGO_ES"'
      Required = True
    end
    object NFEntradasCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Origin = '"ENTRADAS"."CHAVE_NFE"'
      Size = 100
    end
    object NFEntradasVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ENTRADAS"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object NFEntradasVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ENTRADAS"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object NFEntradasCODIGO_ESTADO: TStringField
      FieldName = 'CODIGO_ESTADO'
      Origin = '"ENTRADAS"."CODIGO_ESTADO"'
      Size = 3
    end
    object NFEntradasBC_ICMS: TBCDField
      FieldName = 'BC_ICMS'
      Origin = '"ENTRADAS"."BC_ICMS"'
      Precision = 18
    end
    object NFEntradasVL_ICMS: TBCDField
      FieldName = 'VL_ICMS'
      Origin = '"ENTRADAS"."VL_ICMS"'
      Precision = 18
    end
    object NFEntradasVL_IPI: TBCDField
      FieldName = 'VL_IPI'
      Origin = '"ENTRADAS"."VL_IPI"'
      Precision = 18
    end
    object NFEntradasVL_SEG: TBCDField
      FieldName = 'VL_SEG'
      Origin = '"ENTRADAS"."VL_SEG"'
      Precision = 18
    end
  end
  object Itens_NFEntradas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select I.*, P.*, G.aliquota_grp ALIQ_ICMS, U.descricao UNID from' +
        ' itens_entrada I'
      'inner join produto P'
      'on ( P.cod_pro = I.cod_pro )'
      'inner join grupo_icms G'
      'on ( G.cod_grp = I.cod_grp )'
      'inner join UNIDADE_MEDIDA u'
      'on ( u.codigo = P.codigo_unidade_entrada )'
      'where COD_ENT=:CODENT')
    Left = 392
    Top = 176
    ParamData = <
      item
        Name = 'CODENT'
      end>
    object Itens_NFEntradasCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = '"ITENS_ENTRADA"."COD_ENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Itens_NFEntradasCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ENTRADA"."COD_PRO"'
      Required = True
    end
    object Itens_NFEntradasPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = '"ITENS_ENTRADA"."PERC_ICMS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = '"ITENS_ENTRADA"."PERC_IPI"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = '"ITENS_ENTRADA"."QTDUND_ENT"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = '"ITENS_ENTRADA"."PERC_DESC"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = '"ITENS_ENTRADA"."PERC_ACRES"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_ENTRADA"."COD_EMP"'
      Required = True
    end
    object Itens_NFEntradasVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = '"ITENS_ENTRADA"."VALOR_UNIT_PRO"'
      Required = True
      Precision = 18
    end
    object Itens_NFEntradasCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = '"ITENS_ENTRADA"."CUSTO"'
      Precision = 18
    end
    object Itens_NFEntradasQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = '"ITENS_ENTRADA"."QTD_PRO"'
      Precision = 18
      Size = 3
    end
    object Itens_NFEntradasCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_ENTRADA"."COD_GRP"'
    end
    object Itens_NFEntradasCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = '"ITENS_ENTRADA"."COD_CFOP"'
    end
    object Itens_NFEntradasVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"ITENS_ENTRADA"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = '"ITENS_ENTRADA"."VALOR_ACRESCIMO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = '"ITENS_ENTRADA"."PERC_BCR"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCST: TStringField
      FieldName = 'CST'
      Origin = '"ITENS_ENTRADA"."CST"'
      FixedChar = True
      Size = 3
    end
    object Itens_NFEntradasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"ITENS_ENTRADA"."VALOR_TOTAL"'
      Precision = 18
    end
    object Itens_NFEntradasBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = '"ITENS_ENTRADA"."BASE_CALCULO"'
      Precision = 18
    end
    object Itens_NFEntradasVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"ITENS_ENTRADA"."VALOR_ICMS"'
      Precision = 18
    end
    object Itens_NFEntradasORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_ENTRADA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Itens_NFEntradasPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = '"ITENS_ENTRADA"."PERC_ST"'
      Precision = 18
    end
    object Itens_NFEntradasVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = '"ITENS_ENTRADA"."VALOR_SUB_TRIBUTARIA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"ITENS_ENTRADA"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = '"ITENS_ENTRADA"."CODIGO_LOCAL_ESTOQUE"'
      Required = True
    end
    object Itens_NFEntradasBC_ST: TBCDField
      FieldName = 'BC_ST'
      Origin = '"ITENS_ENTRADA"."BC_ST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCOD_PRO1: TIntegerField
      FieldName = 'COD_PRO1'
      Origin = '"PRODUTO"."COD_PRO"'
      Required = True
    end
    object Itens_NFEntradasCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = '"PRODUTO"."COD_LAB"'
      Required = True
    end
    object Itens_NFEntradasCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"PRODUTO"."COD_SEC"'
      Required = True
    end
    object Itens_NFEntradasVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = '"PRODUTO"."VALOR_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = '"PRODUTO"."PROMOCAO_PRO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCONTROLA_ESTOQUE_PRO: TStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = '"PRODUTO"."CONTROLA_ESTOQUE_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasCOMISSAO_PRO: TBCDField
      FieldName = 'COMISSAO_PRO'
      Origin = '"PRODUTO"."COMISSAO_PRO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasQUANT_UNIDADE_ENTRADA: TBCDField
      FieldName = 'QUANT_UNIDADE_ENTRADA'
      Origin = '"PRODUTO"."QUANT_UNIDADE_ENTRADA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasESTOQUE_MINIMO_PRO: TBCDField
      FieldName = 'ESTOQUE_MINIMO_PRO'
      Origin = '"PRODUTO"."ESTOQUE_MINIMO_PRO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object Itens_NFEntradasDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object Itens_NFEntradasATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = '"PRODUTO"."ATIVO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasMARGEM_LUCRO_PRO: TBCDField
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = '"PRODUTO"."MARGEM_LUCRO_PRO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = '"PRODUTO"."LOCALIZACAO_PRO"'
    end
    object Itens_NFEntradasPRODUTO_PESADO_PRO: TStringField
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = '"PRODUTO"."PRODUTO_PESADO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
      Origin = '"PRODUTO"."COD_SETOR"'
    end
    object Itens_NFEntradasTECLA_ATALHO_PRO: TIntegerField
      FieldName = 'TECLA_ATALHO_PRO'
      Origin = '"PRODUTO"."TECLA_ATALHO_PRO"'
    end
    object Itens_NFEntradasINDICE_RECEITA_PRO: TIntegerField
      FieldName = 'INDICE_RECEITA_PRO'
      Origin = '"PRODUTO"."INDICE_RECEITA_PRO"'
    end
    object Itens_NFEntradasDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = '"PRODUTO"."DIAS_VALIDADE_PRO"'
    end
    object Itens_NFEntradasREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = '"PRODUTO"."REFERENCIA_PRO"'
      Size = 30
    end
    object Itens_NFEntradasCOMPLEMENTO_PRO: TStringField
      FieldName = 'COMPLEMENTO_PRO'
      Origin = '"PRODUTO"."COMPLEMENTO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasICMS_CONT_EST: TIntegerField
      FieldName = 'ICMS_CONT_EST'
      Origin = '"PRODUTO"."ICMS_CONT_EST"'
    end
    object Itens_NFEntradasICMS_CONT_FORA: TIntegerField
      FieldName = 'ICMS_CONT_FORA'
      Origin = '"PRODUTO"."ICMS_CONT_FORA"'
    end
    object Itens_NFEntradasICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
    end
    object Itens_NFEntradasICMS_CF_FORA: TIntegerField
      FieldName = 'ICMS_CF_FORA'
      Origin = '"PRODUTO"."ICMS_CF_FORA"'
    end
    object Itens_NFEntradasCST_CONT_EST: TStringField
      FieldName = 'CST_CONT_EST'
      Origin = '"PRODUTO"."CST_CONT_EST"'
      FixedChar = True
      Size = 3
    end
    object Itens_NFEntradasCST_CONT_FORA: TStringField
      FieldName = 'CST_CONT_FORA'
      Origin = '"PRODUTO"."CST_CONT_FORA"'
      FixedChar = True
      Size = 3
    end
    object Itens_NFEntradasCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = '"PRODUTO"."CST_CF_EST"'
      FixedChar = True
      Size = 3
    end
    object Itens_NFEntradasCST_CF_FORA: TStringField
      FieldName = 'CST_CF_FORA'
      Origin = '"PRODUTO"."CST_CF_FORA"'
      FixedChar = True
      Size = 3
    end
    object Itens_NFEntradasCAMINHO_FOTO_PRO: TStringField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = '"PRODUTO"."CAMINHO_FOTO_PRO"'
      Size = 150
    end
    object Itens_NFEntradasSAIR_TABELA_PRECO: TStringField
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = '"PRODUTO"."SAIR_TABELA_PRECO"'
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasCFOP_VENDAS_CONT_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_EST'
      Origin = '"PRODUTO"."CFOP_VENDAS_CONT_EST"'
    end
    object Itens_NFEntradasCFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = '"PRODUTO"."CFOP_VENDAS_CF_EST"'
    end
    object Itens_NFEntradasCFOP_VENDAS_CONT_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_FORA'
      Origin = '"PRODUTO"."CFOP_VENDAS_CONT_FORA"'
    end
    object Itens_NFEntradasCFOP_VENDAS_CF_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_FORA'
      Origin = '"PRODUTO"."CFOP_VENDAS_CF_FORA"'
    end
    object Itens_NFEntradasST_CONT_EST: TStringField
      FieldName = 'ST_CONT_EST'
      Origin = '"PRODUTO"."ST_CONT_EST"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasVR_AGREG_CONT_EST: TBCDField
      FieldName = 'VR_AGREG_CONT_EST'
      Origin = '"PRODUTO"."VR_AGREG_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasIPI_CONT_EST: TBCDField
      FieldName = 'IPI_CONT_EST'
      Origin = '"PRODUTO"."IPI_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasIPI_CF_EST: TBCDField
      FieldName = 'IPI_CF_EST'
      Origin = '"PRODUTO"."IPI_CF_EST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasIPI_CONT_FORA: TBCDField
      FieldName = 'IPI_CONT_FORA'
      Origin = '"PRODUTO"."IPI_CONT_FORA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasIPI_CF_FORA: TBCDField
      FieldName = 'IPI_CF_FORA'
      Origin = '"PRODUTO"."IPI_CF_FORA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = '"PRODUTO"."COD_NCM"'
      Size = 8
    end
    object Itens_NFEntradasCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = '"PRODUTO"."CLASSIFICACAO_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Origin = '"PRODUTO"."CODIGO_TIPO"'
      Required = True
    end
    object Itens_NFEntradasCOD_PRODUTO_ESTOQUE: TIntegerField
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = '"PRODUTO"."COD_PRODUTO_ESTOQUE"'
      Required = True
    end
    object Itens_NFEntradasCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = '"PRODUTO"."COD_GRUPO"'
    end
    object Itens_NFEntradasSUB_GRUPO: TIntegerField
      FieldName = 'SUB_GRUPO'
      Origin = '"PRODUTO"."SUB_GRUPO"'
    end
    object Itens_NFEntradasPRECO_PROGRAMADO: TBCDField
      FieldName = 'PRECO_PROGRAMADO'
      Origin = '"PRODUTO"."PRECO_PROGRAMADO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = '"PRODUTO"."ALIQUOTA_PIS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = '"PRODUTO"."ALIQUOTA_COFINS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQUOTA_IR: TBCDField
      FieldName = 'ALIQUOTA_IR'
      Origin = '"PRODUTO"."ALIQUOTA_IR"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQUOTA_CSLL: TBCDField
      FieldName = 'ALIQUOTA_CSLL'
      Origin = '"PRODUTO"."ALIQUOTA_CSLL"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQUOTA_OUTRAS: TBCDField
      FieldName = 'ALIQUOTA_OUTRAS'
      Origin = '"PRODUTO"."ALIQUOTA_OUTRAS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasISENTO_PIS_COFINS_PRO: TStringField
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = '"PRODUTO"."ISENTO_PIS_COFINS_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasPRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = '"PRODUTO"."PRECO_CUSTO"'
      Precision = 18
    end
    object Itens_NFEntradasCREDITO_ICMS: TBCDField
      FieldName = 'CREDITO_ICMS'
      Origin = '"PRODUTO"."CREDITO_ICMS"'
      Precision = 18
    end
    object Itens_NFEntradasPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = '"PRODUTO"."PRECO_PRAZO_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = '"PRODUTO"."TIPO_PRODUCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Itens_NFEntradasCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object Itens_NFEntradasCODIGO_UNIDADE_SAIDA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = '"PRODUTO"."CODIGO_UNIDADE_SAIDA"'
      Required = True
    end
    object Itens_NFEntradasCODIGO_UNIDADE_ENTRADA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_ENTRADA'
      Origin = '"PRODUTO"."CODIGO_UNIDADE_ENTRADA"'
      Required = True
    end
    object Itens_NFEntradasPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = '"PRODUTO"."PRECO_PROGRAMADO_PRAZO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasRED_CF_EST: TBCDField
      FieldName = 'RED_CF_EST'
      Origin = '"PRODUTO"."RED_CF_EST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasRED_CF_FORA: TBCDField
      FieldName = 'RED_CF_FORA'
      Origin = '"PRODUTO"."RED_CF_FORA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasRED_CONT_EST: TBCDField
      FieldName = 'RED_CONT_EST'
      Origin = '"PRODUTO"."RED_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasRED_CONT_FORA: TBCDField
      FieldName = 'RED_CONT_FORA'
      Origin = '"PRODUTO"."RED_CONT_FORA"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = '"PRODUTO"."DATA_VALIDADE"'
    end
    object Itens_NFEntradasCODIGO_SETOR_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_SETOR_ESTOQUE'
      Origin = '"PRODUTO"."CODIGO_SETOR_ESTOQUE"'
      Required = True
    end
    object Itens_NFEntradasORIG: TIntegerField
      FieldName = 'ORIG'
      Origin = '"PRODUTO"."ORIG"'
    end
    object Itens_NFEntradasCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"PRODUTO"."CSOSN"'
      Size = 3
    end
    object Itens_NFEntradasIPI: TFloatField
      FieldName = 'IPI'
      Origin = '"PRODUTO"."IPI"'
    end
    object Itens_NFEntradasICMS: TFloatField
      FieldName = 'ICMS'
      Origin = '"PRODUTO"."ICMS"'
    end
    object Itens_NFEntradasRICMS: TFloatField
      FieldName = 'RICMS'
      Origin = '"PRODUTO"."RICMS"'
    end
    object Itens_NFEntradasIVA: TFloatField
      FieldName = 'IVA'
      Origin = '"PRODUTO"."IVA"'
    end
    object Itens_NFEntradasPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"PRODUTO"."PIS"'
    end
    object Itens_NFEntradasCONFINS: TFloatField
      FieldName = 'CONFINS'
      Origin = '"PRODUTO"."CONFINS"'
    end
    object Itens_NFEntradasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Origin = '"PRODUTO"."TAMANHO"'
      Size = 10
    end
    object Itens_NFEntradasCOR: TStringField
      FieldName = 'COR'
      Origin = '"PRODUTO"."COR"'
      Size = 40
    end
    object Itens_NFEntradasOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"PRODUTO"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object Itens_NFEntradasCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO"."CST_PIS"'
      Size = 3
    end
    object Itens_NFEntradasCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO"."CST_COFINS"'
      Size = 3
    end
    object Itens_NFEntradasCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"PRODUTO"."CST_IPI"'
      Size = 3
    end
    object Itens_NFEntradasULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PRODUTO"."ULTIMA_ALTERACAO"'
    end
    object Itens_NFEntradasVALOR_ATACADO: TBCDField
      FieldName = 'VALOR_ATACADO'
      Origin = '"PRODUTO"."VALOR_ATACADO"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasUNID: TStringField
      FieldName = 'UNID'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object Itens_NFEntradasALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = '"ITENS_ENTRADA"."ALIQ_PIS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ITENS_ENTRADA"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = '"ITENS_ENTRADA"."ALIQ_COFINS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ITENS_ENTRADA"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object Itens_NFEntradasCST_PIS1: TStringField
      FieldName = 'CST_PIS1'
      Origin = '"PRODUTO"."CST_PIS"'
      Size = 3
    end
    object Itens_NFEntradasCST_COFINS1: TStringField
      FieldName = 'CST_COFINS1'
      Origin = '"PRODUTO"."CST_COFINS"'
      Size = 3
    end
    object Itens_NFEntradasCST_IPI1: TStringField
      FieldName = 'CST_IPI1'
      Origin = '"PRODUTO"."CST_IPI"'
      Size = 3
    end
  end
  object QVendas: TFDQuery
    Left = 280
    Top = 248
  end
  object QItens_Vendas: TFDQuery
    Left = 280
    Top = 296
  end
  object QCaixa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'SELECT C.cod_cai, C.r01_modelo_ecf, C.r01_numero_serie, C.r01_nu' +
        'mero_usuario, '#39'2D'#39' MODELO from Caixa C'
      'WHERE C.cod_emp=:CODEMP and C.cod_cai IN ( SELECT M.checkout'
      '                    FROM mapa_resumo M'
      
        '                    WHERE M.data BETWEEN :DATAINI AND :DATAFIN a' +
        'nd M.cod_emp=:CODEMP );')
    Left = 656
    Top = 144
    ParamData = <
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
      end>
    object QCaixaCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"CAIXA"."COD_CAI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = '"CAIXA"."R01_MODELO_ECF"'
    end
    object QCaixaR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = '"CAIXA"."R01_NUMERO_SERIE"'
    end
    object QCaixaR01_NUMERO_USUARIO: TIntegerField
      FieldName = 'R01_NUMERO_USUARIO'
      Origin = '"CAIXA"."R01_NUMERO_USUARIO"'
    end
    object QCaixaMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object EmpresaFilha: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      'select * from empresa')
    Left = 656
    Top = 344
    object EmpresaFilhaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"EMPRESA"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EmpresaFilhaRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = '"EMPRESA"."RAZAO_EMP"'
      Required = True
      Size = 50
    end
    object EmpresaFilhaEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = '"EMPRESA"."END_EMP"'
      Size = 50
    end
    object EmpresaFilhaBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = '"EMPRESA"."BAI_EMP"'
      Size = 30
    end
    object EmpresaFilhaCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = '"EMPRESA"."CID_EMP"'
      Size = 30
    end
    object EmpresaFilhaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = '"EMPRESA"."CEP_EMP"'
      FixedChar = True
      Size = 9
    end
    object EmpresaFilhaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = '"EMPRESA"."EST_EMP"'
      FixedChar = True
      Size = 2
    end
    object EmpresaFilhaINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = '"EMPRESA"."INSC_EMP"'
    end
    object EmpresaFilhaTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = '"EMPRESA"."TEL_EMP"'
      Size = 13
    end
    object EmpresaFilhaFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = '"EMPRESA"."FAX_EMP"'
      Size = 13
    end
    object EmpresaFilhaNOME_EMP_ETIQUETA: TStringField
      FieldName = 'NOME_EMP_ETIQUETA'
      Origin = '"EMPRESA"."NOME_EMP_ETIQUETA"'
      Size = 15
    end
    object EmpresaFilhaNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = '"EMPRESA"."NUMERO_EMP"'
      Size = 10
    end
    object EmpresaFilhaRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = '"EMPRESA"."RESP_EMP"'
      Size = 50
    end
    object EmpresaFilhaCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = '"EMPRESA"."CAMINHO_FOTO_EMP"'
      Size = 150
    end
    object EmpresaFilhaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = '"EMPRESA"."FANTASIA_EMP"'
      Size = 50
    end
    object EmpresaFilhaMOSTRAR_SITCLI_PREVENDA: TStringField
      FieldName = 'MOSTRAR_SITCLI_PREVENDA'
      Origin = '"EMPRESA"."MOSTRAR_SITCLI_PREVENDA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object EmpresaFilhaCADASTRAR_CLIENTE_SEM_CPF: TStringField
      FieldName = 'CADASTRAR_CLIENTE_SEM_CPF'
      Origin = '"EMPRESA"."CADASTRAR_CLIENTE_SEM_CPF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object EmpresaFilhaTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
      Origin = '"EMPRESA"."TIPO_EMP"'
      Required = True
    end
    object EmpresaFilhaTIPO_CARGA_BALANCA: TIntegerField
      FieldName = 'TIPO_CARGA_BALANCA'
      Origin = '"EMPRESA"."TIPO_CARGA_BALANCA"'
      Required = True
    end
    object EmpresaFilhaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = '"EMPRESA"."CNPJ_EMP"'
      Size = 14
    end
    object EmpresaFilhaCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = '"EMPRESA"."CAMINHO_VALIDADOR_SINTEGRA"'
      Size = 80
    end
    object EmpresaFilhaINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = '"EMPRESA"."INSCRICAO_MUNICIPAL"'
    end
    object EmpresaFilhaPERFIL_EFD: TStringField
      FieldName = 'PERFIL_EFD'
      Origin = '"EMPRESA"."PERFIL_EFD"'
      FixedChar = True
      Size = 1
    end
    object EmpresaFilhaCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO"'
      Size = 7
    end
    object EmpresaFilhaTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = '"EMPRESA"."TIPO_ATIVIDADE_EFD"'
    end
    object EmpresaFilhaNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = '"EMPRESA"."NOME_CONTADOR"'
      Size = 80
    end
    object EmpresaFilhaCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = '"EMPRESA"."CPF_CONTADOR"'
      Size = 14
    end
    object EmpresaFilhaCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = '"EMPRESA"."CRC_CONTADOR"'
      Size = 15
    end
    object EmpresaFilhaCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = '"EMPRESA"."CNPJ_CONTADOR"'
      Size = 18
    end
    object EmpresaFilhaCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = '"EMPRESA"."CEP_CONTADOR"'
      FixedChar = True
      Size = 9
    end
    object EmpresaFilhaEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = '"EMPRESA"."END_CONTADOR"'
      Size = 60
    end
    object EmpresaFilhaNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = '"EMPRESA"."NUMERO_CONTADOR"'
      Size = 10
    end
    object EmpresaFilhaBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = '"EMPRESA"."BAIRRO_CONTADOR"'
      Size = 50
    end
    object EmpresaFilhaTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = '"EMPRESA"."TEL_CONTADOR"'
      Size = 10
    end
    object EmpresaFilhaFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = '"EMPRESA"."FAX_CONTADOR"'
      Size = 10
    end
    object EmpresaFilhaCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO_CONTADOR"'
      Size = 7
    end
  end
  object Reducoes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select M.data, M.contador_reinicio_operacao CRO, M.cont_reducao ' +
        'CRZ, M.coo_final, M.gt_final, M.venda_bruta from mapa_resumo M'
      
        'where M.checkout=:CODCAI and M.data between :DATAINI and :DATAFI' +
        'N')
    Left = 656
    Top = 192
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object ReducoesDATA: TDateField
      FieldName = 'DATA'
      Origin = '"MAPA_RESUMO"."DATA"'
      Required = True
    end
    object ReducoesCRO: TIntegerField
      FieldName = 'CRO'
      Origin = '"MAPA_RESUMO"."CONTADOR_REINICIO_OPERACAO"'
      Required = True
    end
    object ReducoesCRZ: TIntegerField
      FieldName = 'CRZ'
      Origin = '"MAPA_RESUMO"."CONT_REDUCAO"'
      Required = True
    end
    object ReducoesCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = '"MAPA_RESUMO"."COO_FINAL"'
      Required = True
    end
    object ReducoesGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = '"MAPA_RESUMO"."GT_FINAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object ReducoesVENDA_BRUTA: TBCDField
      FieldName = 'VENDA_BRUTA'
      Origin = '"MAPA_RESUMO"."VENDA_BRUTA"'
      Precision = 18
      Size = 2
    end
  end
  object C481PIS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select SUM( i.valor ) TOTAL,SUM( i.valor ) BC, p.cst_pis, P.aliq' +
        'uota_pis,( ( SUM( i.valor ) * P.aliquota_pis ) / 100 )  VALOR, P' +
        '.cod_pro from itens_venda i'
      'inner join produto P'
      'on ( p.cod_pro = i.cod_pro )'
      'inner join vendas v'
      'on ( v.cod_ven = i.cod_ven )'
      
        'where v.cod_cai=:CODCAI and v.cod_emp =:CODEMP and v.data_ven be' +
        'tween :DATAINI and :DATAFIN'
      'group by p.cst_pis, P.aliquota_pis, P.cod_pro')
    Left = 656
    Top = 240
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object C481PISTOTAL: TBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object C481PISBC: TBCDField
      FieldName = 'BC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object C481PISCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO"."CST_PIS"'
      Size = 3
    end
    object C481PISALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = '"PRODUTO"."ALIQUOTA_PIS"'
      Precision = 18
      Size = 2
    end
    object C481PISVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
    object C481PISCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object C485COFINS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TREfd
    SQL.Strings = (
      
        'select SUM( i.valor ) TOTAL,SUM( i.valor ) BC, p.cst_cofins, P.a' +
        'liquota_cofins,( ( SUM( i.valor ) * P.aliquota_cofins ) / 100 ) ' +
        ' VALOR, P.cod_pro from itens_venda i'
      'inner join produto P'
      'on ( p.cod_pro = i.cod_pro )'
      'inner join vendas v'
      'on ( v.cod_ven = i.cod_ven )'
      
        'where v.cod_cai=:CODCAI and v.cod_emp =:CODEMP and v.data_ven be' +
        'tween :DATAINI and :DATAFIN'
      'group by p.cst_cofins, P.aliquota_cofins, P.cod_pro')
    Left = 656
    Top = 288
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object C485COFINSTOTAL: TBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object C485COFINSBC: TBCDField
      FieldName = 'BC'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object C485COFINSCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO"."CST_COFINS"'
      Size = 3
    end
    object C485COFINSALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = '"PRODUTO"."ALIQUOTA_COFINS"'
      Precision = 18
      Size = 2
    end
    object C485COFINSVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
    object C485COFINSCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
