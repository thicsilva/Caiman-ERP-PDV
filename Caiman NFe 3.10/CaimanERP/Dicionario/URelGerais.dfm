object dmRelGerais: TdmRelGerais
  OldCreateOrder = False
  Height = 420
  Width = 496
  object QEmpresa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRGerais
    SQL.Strings = (
      'select E.*, P.CAMINHO_LOGOMARCA_DANFE from EMPRESA E'
      'INNER JOIN PARAMETROS P'
      'ON( P.COD_EMP = E.COD_EMP )'
      'where E.COD_EMP=:CODEMP')
    Left = 32
    Top = 96
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QEmpresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEmpresaRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'RAZAO_EMP'
      Required = True
      Size = 50
    end
    object QEmpresaEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = 'END_EMP'
      Size = 50
    end
    object QEmpresaBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = 'BAI_EMP'
      Size = 30
    end
    object QEmpresaCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = 'CID_EMP'
      Size = 30
    end
    object QEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object QEmpresaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = 'EST_EMP'
      FixedChar = True
      Size = 2
    end
    object QEmpresaINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = 'INSC_EMP'
    end
    object QEmpresaTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = 'TEL_EMP'
      Size = 13
    end
    object QEmpresaFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = 'FAX_EMP'
      Size = 13
    end
    object QEmpresaNOME_EMP_ETIQUETA: TStringField
      FieldName = 'NOME_EMP_ETIQUETA'
      Origin = 'NOME_EMP_ETIQUETA'
      Size = 15
    end
    object QEmpresaNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = 'NUMERO_EMP'
      Size = 10
    end
    object QEmpresaRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = 'RESP_EMP'
      Size = 50
    end
    object QEmpresaCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = 'CAMINHO_FOTO_EMP'
      Size = 150
    end
    object QEmpresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      Size = 50
    end
    object QEmpresaMOSTRAR_SITCLI_PREVENDA: TStringField
      FieldName = 'MOSTRAR_SITCLI_PREVENDA'
      Origin = 'MOSTRAR_SITCLI_PREVENDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpresaCADASTRAR_CLIENTE_SEM_CPF: TStringField
      FieldName = 'CADASTRAR_CLIENTE_SEM_CPF'
      Origin = 'CADASTRAR_CLIENTE_SEM_CPF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpresaTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
      Origin = 'TIPO_EMP'
      Required = True
    end
    object QEmpresaTIPO_CARGA_BALANCA: TIntegerField
      FieldName = 'TIPO_CARGA_BALANCA'
      Origin = 'TIPO_CARGA_BALANCA'
      Required = True
    end
    object QEmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = 'CNPJ_EMP'
      Size = 14
    end
    object QEmpresaCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = 'CAMINHO_VALIDADOR_SINTEGRA'
      Size = 80
    end
    object QEmpresaINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'INSCRICAO_MUNICIPAL'
    end
    object QEmpresaPERFIL_EFD: TStringField
      FieldName = 'PERFIL_EFD'
      Origin = 'PERFIL_EFD'
      FixedChar = True
      Size = 1
    end
    object QEmpresaCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      Size = 7
    end
    object QEmpresaTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = 'TIPO_ATIVIDADE_EFD'
    end
    object QEmpresaNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = 'NOME_CONTADOR'
      Size = 80
    end
    object QEmpresaCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = 'CPF_CONTADOR'
      Size = 14
    end
    object QEmpresaCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = 'CRC_CONTADOR'
      Size = 15
    end
    object QEmpresaCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = 'CNPJ_CONTADOR'
      Size = 18
    end
    object QEmpresaCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = 'CEP_CONTADOR'
      FixedChar = True
      Size = 9
    end
    object QEmpresaEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = 'END_CONTADOR'
      Size = 60
    end
    object QEmpresaNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = 'NUMERO_CONTADOR'
      Size = 10
    end
    object QEmpresaBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = 'BAIRRO_CONTADOR'
      Size = 50
    end
    object QEmpresaTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = 'TEL_CONTADOR'
      Size = 10
    end
    object QEmpresaFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = 'FAX_CONTADOR'
      Size = 10
    end
    object QEmpresaCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = 'CODIGO_MUNICIPIO_CONTADOR'
      Size = 7
    end
    object QEmpresaVERSAO_EFD: TIntegerField
      FieldName = 'VERSAO_EFD'
      Origin = 'VERSAO_EFD'
    end
    object QEmpresaEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Origin = 'EMAIL_CONTADOR'
      Size = 255
    end
    object QEmpresaCAMINHO_LOGOMARCA_DANFE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAMINHO_LOGOMARCA_DANFE'
      Origin = 'CAMINHO_LOGOMARCA_DANFE'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRGerais
    SQL.Strings = (
      'select * from CLIENTE where COD_CLI=:CODCLI')
    Left = 104
    Top = 96
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QClienteFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = 'FJ_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object QClienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'COD_CLA'
      Required = True
    end
    object QClienteENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'ENDRES_CLI'
      Size = 50
    end
    object QClienteBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'BAIRES_CLI'
      Size = 30
    end
    object QClienteCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CIDRES_CLI'
      Size = 30
    end
    object QClienteESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QClienteCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QClienteENDCOM_CLI: TStringField
      FieldName = 'ENDCOM_CLI'
      Origin = 'ENDCOM_CLI'
      Size = 50
    end
    object QClienteBAICOM_CLI: TStringField
      FieldName = 'BAICOM_CLI'
      Origin = 'BAICOM_CLI'
      Size = 30
    end
    object QClienteCIDCOM_CLI: TStringField
      FieldName = 'CIDCOM_CLI'
      Origin = 'CIDCOM_CLI'
      Size = 30
    end
    object QClienteESTCOM_CLI: TStringField
      FieldName = 'ESTCOM_CLI'
      Origin = 'ESTCOM_CLI'
      FixedChar = True
      Size = 2
    end
    object QClienteCEPCOM_CLI: TStringField
      FieldName = 'CEPCOM_CLI'
      Origin = 'CEPCOM_CLI'
      FixedChar = True
      Size = 9
    end
    object QClienteTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = 'TELCOM_CLI'
      FixedChar = True
      Size = 13
    end
    object QClienteCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CNPJ_CLI'
      Size = 18
    end
    object QClienteDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'DOC_CLI'
    end
    object QClientePAI_CLI: TStringField
      FieldName = 'PAI_CLI'
      Origin = 'PAI_CLI'
      Size = 50
    end
    object QClienteMAE_CLI: TStringField
      FieldName = 'MAE_CLI'
      Origin = 'MAE_CLI'
      Size = 50
    end
    object QClienteCONJUGE_CLI: TStringField
      FieldName = 'CONJUGE_CLI'
      Origin = 'CONJUGE_CLI'
      Size = 50
    end
    object QClienteESTCIVIL_CLI: TStringField
      FieldName = 'ESTCIVIL_CLI'
      Origin = 'ESTCIVIL_CLI'
      FixedChar = True
      Size = 1
    end
    object QClienteRENDA_CLI: TBCDField
      FieldName = 'RENDA_CLI'
      Origin = 'RENDA_CLI'
      Precision = 18
      Size = 2
    end
    object QClienteLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object QClientePROFISSAO_CLI: TStringField
      FieldName = 'PROFISSAO_CLI'
      Origin = 'PROFISSAO_CLI'
      Size = 50
    end
    object QClienteEMPRESA_TRAB_CLI: TStringField
      FieldName = 'EMPRESA_TRAB_CLI'
      Origin = 'EMPRESA_TRAB_CLI'
      Size = 50
    end
    object QClienteATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'COD_CON'
      Required = True
    end
    object QClienteOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = 'OBS_VENDA'
      Size = 200
    end
    object QClienteOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = 'OBS_CLI'
      Size = 500
    end
    object QClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'NASCIMENTO_CLI'
    end
    object QClienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'DATACADASTRO_CLI'
      Required = True
    end
    object QClienteATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = 'ATRAZO_MAXIMO_CLI'
    end
    object QClienteCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CELULAR_CLI'
      Size = 13
    end
    object QClienteIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = 'IMP_SALDO_PENDENTE_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object QClienteDATA_CONSULTA_SPC: TDateField
      FieldName = 'DATA_CONSULTA_SPC'
      Origin = 'DATA_CONSULTA_SPC'
    end
    object QClienteDATA_REGISTRO_SPC: TDateField
      FieldName = 'DATA_REGISTRO_SPC'
      Origin = 'DATA_REGISTRO_SPC'
    end
    object QClienteDATA_REABILITACAO_SPC: TDateField
      FieldName = 'DATA_REABILITACAO_SPC'
      Origin = 'DATA_REABILITACAO_SPC'
    end
    object QClienteSELECIONADO_CLI: TStringField
      FieldName = 'SELECIONADO_CLI'
      Origin = 'SELECIONADO_CLI'
      FixedChar = True
      Size = 1
    end
    object QClienteRENDA_CONJUGE: TBCDField
      FieldName = 'RENDA_CONJUGE'
      Origin = 'RENDA_CONJUGE'
      Precision = 18
      Size = 2
    end
    object QClienteTRABALHO_CONJUGE: TStringField
      FieldName = 'TRABALHO_CONJUGE'
      Origin = 'TRABALHO_CONJUGE'
      Size = 50
    end
    object QClientePROF_CONJUGE: TStringField
      FieldName = 'PROF_CONJUGE'
      Origin = 'PROF_CONJUGE'
      Size = 50
    end
    object QClienteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object QClientePONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = 'PONTO_REFERENCIA'
      Size = 80
    end
    object QClienteCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = 'CONTATO_CLI'
      Size = 70
    end
    object QClienteROTA_CLI: TIntegerField
      FieldName = 'ROTA_CLI'
      Origin = 'ROTA_CLI'
    end
    object QClienteTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = 'TIPO_CREDITO_CLI'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QClienteCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = 'CONTROLAR_LIMITE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteBAICOB_CLI: TStringField
      FieldName = 'BAICOB_CLI'
      Origin = 'BAICOB_CLI'
      Size = 30
    end
    object QClienteCIDCOB_CLI: TStringField
      FieldName = 'CIDCOB_CLI'
      Origin = 'CIDCOB_CLI'
      Size = 30
    end
    object QClienteESTCOB_CLI: TStringField
      FieldName = 'ESTCOB_CLI'
      Origin = 'ESTCOB_CLI'
      FixedChar = True
      Size = 2
    end
    object QClienteCEPCOB_CLI: TStringField
      FieldName = 'CEPCOB_CLI'
      Origin = 'CEPCOB_CLI'
      FixedChar = True
      Size = 9
    end
    object QClienteTELCOB_CLI: TStringField
      FieldName = 'TELCOB_CLI'
      Origin = 'TELCOB_CLI'
      FixedChar = True
      Size = 13
    end
    object QClienteENDCOB_CLI: TStringField
      FieldName = 'ENDCOB_CLI'
      Origin = 'ENDCOB_CLI'
      Size = 50
    end
    object QClienteBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = 'BLOQUEADO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = 'INSC_ESTADUAL'
      Size = 30
    end
    object QClienteNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = 'NUMRES_CLI'
      Size = 10
    end
    object QClienteNUMCOM_CLI: TStringField
      FieldName = 'NUMCOM_CLI'
      Origin = 'NUMCOM_CLI'
      Size = 10
    end
    object QClienteNUMCOB_CLI: TStringField
      FieldName = 'NUMCOB_CLI'
      Origin = 'NUMCOB_CLI'
      Size = 10
    end
    object QClienteCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
    object QClienteEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = 'EMAIL_CLI'
      Size = 100
    end
    object QClienteCOD_DEPENDENTE: TIntegerField
      FieldName = 'COD_DEPENDENTE'
      Origin = 'COD_DEPENDENTE'
    end
    object QClienteNOME_DEPENDENTE: TStringField
      FieldName = 'NOME_DEPENDENTE'
      Origin = 'NOME_DEPENDENTE'
      Size = 60
    end
    object QClienteGRAU_PARENTESCO: TStringField
      FieldName = 'GRAU_PARENTESCO'
      Origin = 'GRAU_PARENTESCO'
    end
    object QClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'COD_VENDEDOR'
    end
    object QClienteCOD_PAIS: TIntegerField
      FieldName = 'COD_PAIS'
      Origin = 'COD_PAIS'
    end
    object QClientePAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Size = 60
    end
  end
  object frxCliente: TfrxDBDataset
    UserName = 'CLIENTE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CLI=COD_CLI'
      'FJ_CLI=FJ_CLI'
      'NOME_CLI=NOME_CLI'
      'COD_CLA=COD_CLA'
      'ENDRES_CLI=ENDRES_CLI'
      'BAIRES_CLI=BAIRES_CLI'
      'CIDRES_CLI=CIDRES_CLI'
      'ESTRES_CLI=ESTRES_CLI'
      'CEPRES_CLI=CEPRES_CLI'
      'TELRES_CLI=TELRES_CLI'
      'ENDCOM_CLI=ENDCOM_CLI'
      'BAICOM_CLI=BAICOM_CLI'
      'CIDCOM_CLI=CIDCOM_CLI'
      'ESTCOM_CLI=ESTCOM_CLI'
      'CEPCOM_CLI=CEPCOM_CLI'
      'TELCOM_CLI=TELCOM_CLI'
      'CNPJ_CLI=CNPJ_CLI'
      'DOC_CLI=DOC_CLI'
      'PAI_CLI=PAI_CLI'
      'MAE_CLI=MAE_CLI'
      'CONJUGE_CLI=CONJUGE_CLI'
      'ESTCIVIL_CLI=ESTCIVIL_CLI'
      'RENDA_CLI=RENDA_CLI'
      'LIMITE_CLI=LIMITE_CLI'
      'PROFISSAO_CLI=PROFISSAO_CLI'
      'EMPRESA_TRAB_CLI=EMPRESA_TRAB_CLI'
      'ATIVO_CLI=ATIVO_CLI'
      'COD_CON=COD_CON'
      'OBS_VENDA=OBS_VENDA'
      'OBS_CLI=OBS_CLI'
      'NASCIMENTO_CLI=NASCIMENTO_CLI'
      'DATACADASTRO_CLI=DATACADASTRO_CLI'
      'ATRAZO_MAXIMO_CLI=ATRAZO_MAXIMO_CLI'
      'CELULAR_CLI=CELULAR_CLI'
      'IMP_SALDO_PENDENTE_CLI=IMP_SALDO_PENDENTE_CLI'
      'LIMITE_CHEQUE=LIMITE_CHEQUE'
      'DATA_CONSULTA_SPC=DATA_CONSULTA_SPC'
      'DATA_REGISTRO_SPC=DATA_REGISTRO_SPC'
      'DATA_REABILITACAO_SPC=DATA_REABILITACAO_SPC'
      'SELECIONADO_CLI=SELECIONADO_CLI'
      'RENDA_CONJUGE=RENDA_CONJUGE'
      'TRABALHO_CONJUGE=TRABALHO_CONJUGE'
      'PROF_CONJUGE=PROF_CONJUGE'
      'NOME_FANTASIA=NOME_FANTASIA'
      'PONTO_REFERENCIA=PONTO_REFERENCIA'
      'CONTATO_CLI=CONTATO_CLI'
      'ROTA_CLI=ROTA_CLI'
      'TIPO_CREDITO_CLI=TIPO_CREDITO_CLI'
      'CONTROLAR_LIMITE=CONTROLAR_LIMITE'
      'BAICOB_CLI=BAICOB_CLI'
      'CIDCOB_CLI=CIDCOB_CLI'
      'ESTCOB_CLI=ESTCOB_CLI'
      'CEPCOB_CLI=CEPCOB_CLI'
      'TELCOB_CLI=TELCOB_CLI'
      'ENDCOB_CLI=ENDCOB_CLI'
      'BLOQUEADO_CLI=BLOQUEADO_CLI'
      'INSC_ESTADUAL=INSC_ESTADUAL'
      'NUMRES_CLI=NUMRES_CLI'
      'NUMCOM_CLI=NUMCOM_CLI'
      'NUMCOB_CLI=NUMCOB_CLI'
      'CODIGO_IBGE=CODIGO_IBGE'
      'EMAIL_CLI=EMAIL_CLI'
      'COD_DEPENDENTE=COD_DEPENDENTE'
      'NOME_DEPENDENTE=NOME_DEPENDENTE'
      'GRAU_PARENTESCO=GRAU_PARENTESCO'
      'COD_VENDEDOR=COD_VENDEDOR'
      'COD_PAIS=COD_PAIS'
      'PAIS=PAIS')
    DataSet = QCliente
    BCDToCurrency = False
    Left = 176
    Top = 96
  end
  object frxEmpresa: TfrxDBDataset
    UserName = 'EMPRESA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_EMP=COD_EMP'
      'RAZAO_EMP=RAZAO_EMP'
      'END_EMP=END_EMP'
      'BAI_EMP=BAI_EMP'
      'CID_EMP=CID_EMP'
      'CEP_EMP=CEP_EMP'
      'EST_EMP=EST_EMP'
      'INSC_EMP=INSC_EMP'
      'TEL_EMP=TEL_EMP'
      'FAX_EMP=FAX_EMP'
      'NOME_EMP_ETIQUETA=NOME_EMP_ETIQUETA'
      'NUMERO_EMP=NUMERO_EMP'
      'RESP_EMP=RESP_EMP'
      'CAMINHO_FOTO_EMP=CAMINHO_FOTO_EMP'
      'FANTASIA_EMP=FANTASIA_EMP'
      'MOSTRAR_SITCLI_PREVENDA=MOSTRAR_SITCLI_PREVENDA'
      'CADASTRAR_CLIENTE_SEM_CPF=CADASTRAR_CLIENTE_SEM_CPF'
      'TIPO_EMP=TIPO_EMP'
      'TIPO_CARGA_BALANCA=TIPO_CARGA_BALANCA'
      'CNPJ_EMP=CNPJ_EMP'
      'CAMINHO_VALIDADOR_SINTEGRA=CAMINHO_VALIDADOR_SINTEGRA'
      'INSCRICAO_MUNICIPAL=INSCRICAO_MUNICIPAL'
      'PERFIL_EFD=PERFIL_EFD'
      'CODIGO_MUNICIPIO=CODIGO_MUNICIPIO'
      'TIPO_ATIVIDADE_EFD=TIPO_ATIVIDADE_EFD'
      'NOME_CONTADOR=NOME_CONTADOR'
      'CPF_CONTADOR=CPF_CONTADOR'
      'CRC_CONTADOR=CRC_CONTADOR'
      'CNPJ_CONTADOR=CNPJ_CONTADOR'
      'CEP_CONTADOR=CEP_CONTADOR'
      'END_CONTADOR=END_CONTADOR'
      'NUMERO_CONTADOR=NUMERO_CONTADOR'
      'BAIRRO_CONTADOR=BAIRRO_CONTADOR'
      'TEL_CONTADOR=TEL_CONTADOR'
      'FAX_CONTADOR=FAX_CONTADOR'
      'CODIGO_MUNICIPIO_CONTADOR=CODIGO_MUNICIPIO_CONTADOR'
      'VERSAO_EFD=VERSAO_EFD'
      'EMAIL_CONTADOR=EMAIL_CONTADOR'
      'CAMINHO_LOGOMARCA_DANFE=CAMINHO_LOGOMARCA_DANFE')
    DataSet = QEmpresa
    BCDToCurrency = False
    Left = 136
    Top = 24
  end
  object TRGerais: TFDTransaction
    Connection = DM.IBDatabase
    Left = 232
    Top = 192
  end
  object QLinhas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRGerais
    SQL.Strings = (
      
        'SELECT linha1 LINHA FROM CAIXA WHERE COD_CAI=:COD_CAI AND COD_EM' +
        'P=:COD_EMP'
      'UNION ALL'
      
        'SELECT linha2 LINHA FROM CAIXA WHERE COD_CAI=:COD_CAI AND COD_EM' +
        'P=:COD_EMP'
      'UNION ALL'
      
        'SELECT linha3 LINHA FROM CAIXA WHERE COD_CAI=:COD_CAI AND COD_EM' +
        'P=:COD_EMP')
    Left = 104
    Top = 200
    ParamData = <
      item
        Name = 'COD_CAI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QLinhasLINHA: TStringField
      FieldName = 'LINHA'
      Origin = 'LINHA1'
      Size = 48
    end
  end
  object frxLinhas: TfrxDBDataset
    UserName = 'AGRADECIMENTO'
    CloseDataSource = False
    FieldAliases.Strings = (
      'LINHA=LINHA')
    DataSet = QLinhas
    BCDToCurrency = False
    Left = 128
    Top = 264
  end
end
