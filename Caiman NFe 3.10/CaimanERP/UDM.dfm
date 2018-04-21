object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 515
  Width = 763
  object IBDatabase: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=localhost:C:\AligatorERP\DataBase\BANCO.FDB'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 65432
    Top = 64
  end
  object IBTransaction: TFDTransaction
    Options.AutoStop = False
    Connection = IBDatabase
    Left = 88
    Top = 8
  end
  object Consulta: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 136
    Top = 8
  end
  object IBSQLCod: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 240
    Top = 8
  end
  object QLab: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM LABORATORIO')
    Left = 24
    Top = 56
    object QLabCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = 'LABORATORIO.COD_LAB'
      Required = True
    end
    object QLabNOME_LAB: TStringField
      FieldName = 'NOME_LAB'
      Origin = 'LABORATORIO.NOME_LAB'
      Required = True
      Size = 50
    end
    object QLabCOMISSAO_FIXA: TStringField
      FieldName = 'COMISSAO_FIXA'
      Origin = '"LABORATORIO"."COMISSAO_FIXA"'
      Size = 1
    end
    object QLabCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = '"LABORATORIO"."COMISSAO"'
    end
    object QLabREDUCAO: TFloatField
      FieldName = 'REDUCAO'
      Origin = '"LABORATORIO"."REDUCAO"'
    end
  end
  object DSLab: TDataSource
    AutoEdit = False
    DataSet = QLab
    Left = 24
    Top = 104
  end
  object QConv: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CONVENIO')
    Left = 80
    Top = 56
    object QConvCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'CONVENIO.COD_CON'
      Required = True
    end
    object QConvNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QConvEND_CON: TStringField
      FieldName = 'END_CON'
      Origin = 'CONVENIO.END_CON'
      Size = 50
    end
    object QConvBAI_CON: TStringField
      FieldName = 'BAI_CON'
      Origin = 'CONVENIO.BAI_CON'
      Size = 30
    end
    object QConvCID_CON: TStringField
      FieldName = 'CID_CON'
      Origin = 'CONVENIO.CID_CON'
      Size = 30
    end
    object QConvCEP_CON: TStringField
      FieldName = 'CEP_CON'
      Origin = 'CONVENIO.CEP_CON'
      FixedChar = True
      Size = 9
    end
    object QConvTEL_CON: TStringField
      FieldName = 'TEL_CON'
      Origin = 'CONVENIO.TEL_CON'
      FixedChar = True
      Size = 13
    end
    object QConvFAX_CON: TStringField
      FieldName = 'FAX_CON'
      Origin = 'CONVENIO.FAX_CON'
      FixedChar = True
      Size = 13
    end
    object QConvATIVO_CON: TStringField
      FieldName = 'ATIVO_CON'
      Origin = 'CONVENIO.ATIVO_CON'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConvRESPONSAVEL_CON: TStringField
      FieldName = 'RESPONSAVEL_CON'
      Origin = 'CONVENIO.RESPONSAVEL_CON'
      Size = 50
    end
    object QConvCNPJ_CON: TStringField
      FieldName = 'CNPJ_CON'
      Origin = 'CONVENIO.CNPJ_CON'
      FixedChar = True
      Size = 18
    end
    object QConvINSC_CON: TStringField
      FieldName = 'INSC_CON'
      Origin = 'CONVENIO.INSC_CON'
    end
    object QConvEST_CON: TStringField
      FieldName = 'EST_CON'
      Origin = 'CONVENIO.EST_CON'
      FixedChar = True
      Size = 2
    end
    object QConvOBS_AUTORIZACAO_CON: TStringField
      FieldName = 'OBS_AUTORIZACAO_CON'
      Origin = 'CONVENIO.OBS_AUTORIZACAO_CON'
      Size = 200
    end
    object QConvDIA_REFERENCIA_CON: TIntegerField
      FieldName = 'DIA_REFERENCIA_CON'
      Origin = 'CONVENIO.DIA_REFERENCIA_CON'
    end
    object QConvDESCONTO_CON: TBCDField
      FieldName = 'DESCONTO_CON'
      Origin = 'CONVENIO.DESCONTO_CON'
      Precision = 18
      Size = 2
    end
  end
  object DSConv: TDataSource
    AutoEdit = False
    DataSet = QConv
    Left = 80
    Top = 104
  end
  object QCla: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIF_CLIENTE')
    Left = 136
    Top = 56
    object QClaCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'CLASSIF_CLIENTE.COD_CLA'
      Required = True
    end
    object QClaNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'CLASSIF_CLIENTE.NOME_CLA'
      Required = True
      Size = 30
    end
  end
  object DSCla: TDataSource
    AutoEdit = False
    DataSet = QCla
    Left = 136
    Top = 104
  end
  object QCli: TFDQuery
    OnCalcFields = QCliCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT C.*, O.NOME_CON, S.NOME_CLA'
      'FROM CLIENTE C'
      'INNER JOIN CONVENIO O'
      'ON (C.COD_CON = O.COD_CON)'
      'INNER JOIN CLASSIF_CLIENTE S'
      'ON (C.COD_CLA = S.COD_CLA)')
    Left = 184
    Top = 56
    object QCliCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QCliFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = 'CLIENTE.FJ_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCliNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QCliCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'CLIENTE.COD_CLA'
      Required = True
    end
    object QCliENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QCliBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QCliCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QCliESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QCliCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CLIENTE.CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QCliTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QCliENDCOM_CLI: TStringField
      FieldName = 'ENDCOM_CLI'
      Origin = 'CLIENTE.ENDCOM_CLI'
      Size = 50
    end
    object QCliBAICOM_CLI: TStringField
      FieldName = 'BAICOM_CLI'
      Origin = 'CLIENTE.BAICOM_CLI'
      Size = 30
    end
    object QCliCIDCOM_CLI: TStringField
      FieldName = 'CIDCOM_CLI'
      Origin = 'CLIENTE.CIDCOM_CLI'
      Size = 30
    end
    object QCliESTCOM_CLI: TStringField
      FieldName = 'ESTCOM_CLI'
      Origin = 'CLIENTE.ESTCOM_CLI'
      FixedChar = True
      Size = 2
    end
    object QCliCEPCOM_CLI: TStringField
      FieldName = 'CEPCOM_CLI'
      Origin = 'CLIENTE.CEPCOM_CLI'
      FixedChar = True
      Size = 9
    end
    object QCliTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = 'CLIENTE.TELCOM_CLI'
      FixedChar = True
      Size = 13
    end
    object QCliCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QCliDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QCliPAI_CLI: TStringField
      FieldName = 'PAI_CLI'
      Origin = 'CLIENTE.PAI_CLI'
      Size = 50
    end
    object QCliMAE_CLI: TStringField
      FieldName = 'MAE_CLI'
      Origin = 'CLIENTE.MAE_CLI'
      Size = 50
    end
    object QCliCONJUGE_CLI: TStringField
      FieldName = 'CONJUGE_CLI'
      Origin = 'CLIENTE.CONJUGE_CLI'
      Size = 50
    end
    object QCliESTCIVIL_CLI: TStringField
      FieldName = 'ESTCIVIL_CLI'
      Origin = 'CLIENTE.ESTCIVIL_CLI'
      FixedChar = True
      Size = 1
    end
    object QCliRENDA_CLI: TBCDField
      FieldName = 'RENDA_CLI'
      Origin = 'CLIENTE.RENDA_CLI'
      Precision = 18
      Size = 2
    end
    object QCliLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'CLIENTE.LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object QCliPROFISSAO_CLI: TStringField
      FieldName = 'PROFISSAO_CLI'
      Origin = 'CLIENTE.PROFISSAO_CLI'
      Size = 50
    end
    object QCliEMPRESA_TRAB_CLI: TStringField
      FieldName = 'EMPRESA_TRAB_CLI'
      Origin = 'CLIENTE.EMPRESA_TRAB_CLI'
      Size = 50
    end
    object QCliATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'CLIENTE.ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCliCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'CLIENTE.COD_CON'
      Required = True
    end
    object QCliNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QCliNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'CLASSIF_CLIENTE.NOME_CLA'
      Required = True
      Size = 30
    end
    object QCliOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = 'CLIENTE.OBS_VENDA'
      Size = 200
    end
    object QCliOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = 'CLIENTE.OBS_CLI'
      Size = 500
    end
    object QCliNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QCliDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'CLIENTE.DATACADASTRO_CLI'
      Required = True
    end
    object QCliATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = 'CLIENTE.ATRAZO_MAXIMO_CLI'
    end
    object QCliCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CLIENTE.CELULAR_CLI'
      Size = 13
    end
    object QCliIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = 'CLIENTE.IMP_SALDO_PENDENTE_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCliNEGATIVADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NEGATIVADO'
      Size = 1
      Calculated = True
    end
    object QCliLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'CLIENTE.LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object QCliDATA_CONSULTA_SPC: TDateField
      FieldName = 'DATA_CONSULTA_SPC'
      Origin = 'CLIENTE.DATA_CONSULTA_SPC'
    end
    object QCliDATA_REGISTRO_SPC: TDateField
      FieldName = 'DATA_REGISTRO_SPC'
      Origin = 'CLIENTE.DATA_REGISTRO_SPC'
    end
    object QCliDATA_REABILITACAO_SPC: TDateField
      FieldName = 'DATA_REABILITACAO_SPC'
      Origin = 'CLIENTE.DATA_REABILITACAO_SPC'
    end
    object QCliSELECIONADO_CLI: TStringField
      FieldName = 'SELECIONADO_CLI'
      Origin = 'CLIENTE.SELECIONADO_CLI'
      FixedChar = True
      Size = 1
    end
    object QCliRENDA_CONJUGE: TBCDField
      FieldName = 'RENDA_CONJUGE'
      Origin = 'CLIENTE.RENDA_CONJUGE'
      Precision = 18
      Size = 2
    end
    object QCliTRABALHO_CONJUGE: TStringField
      FieldName = 'TRABALHO_CONJUGE'
      Origin = 'CLIENTE.TRABALHO_CONJUGE'
      Size = 50
    end
    object QCliPROF_CONJUGE: TStringField
      FieldName = 'PROF_CONJUGE'
      Origin = 'CLIENTE.PROF_CONJUGE'
      Size = 50
    end
    object QCliNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTE.NOME_FANTASIA'
      Size = 60
    end
    object QCliPONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = 'CLIENTE.PONTO_REFERENCIA'
      Size = 80
    end
    object QCliCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = 'CLIENTE.CONTATO_CLI'
      Size = 70
    end
    object QCliROTA_CLI: TIntegerField
      FieldName = 'ROTA_CLI'
      Origin = 'CLIENTE.ROTA_CLI'
    end
    object QCliTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = 'CLIENTE.TIPO_CREDITO_CLI'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QCliCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = 'CLIENTE.CONTROLAR_LIMITE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCliENDCOB_CLI: TStringField
      FieldName = 'ENDCOB_CLI'
      Origin = 'CLIENTE.ENDCOB_CLI'
      Size = 50
    end
    object QCliBAICOB_CLI: TStringField
      FieldName = 'BAICOB_CLI'
      Origin = 'CLIENTE.BAICOB_CLI'
      Size = 30
    end
    object QCliCIDCOB_CLI: TStringField
      FieldName = 'CIDCOB_CLI'
      Origin = 'CLIENTE.CIDCOB_CLI'
      Size = 30
    end
    object QCliESTCOB_CLI: TStringField
      FieldName = 'ESTCOB_CLI'
      Origin = 'CLIENTE.ESTCOB_CLI'
      FixedChar = True
      Size = 2
    end
    object QCliCEPCOB_CLI: TStringField
      FieldName = 'CEPCOB_CLI'
      Origin = 'CLIENTE.CEPCOB_CLI'
      FixedChar = True
      Size = 9
    end
    object QCliTELCOB_CLI: TStringField
      FieldName = 'TELCOB_CLI'
      Origin = 'CLIENTE.TELCOB_CLI'
      FixedChar = True
      Size = 13
    end
    object QCliBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = 'CLIENTE.BLOQUEADO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCliINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = 'CLIENTE.INSC_ESTADUAL'
      Size = 30
    end
    object QCliNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = 'CLIENTE.NUMRES_CLI'
      Size = 10
    end
    object QCliNUMCOM_CLI: TStringField
      FieldName = 'NUMCOM_CLI'
      Origin = 'CLIENTE.NUMCOM_CLI'
      Size = 10
    end
    object QCliNUMCOB_CLI: TStringField
      FieldName = 'NUMCOB_CLI'
      Origin = 'CLIENTE.NUMCOB_CLI'
      Size = 10
    end
    object QCliCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'CLIENTE.CODIGO_IBGE'
    end
    object QCliEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = 'CLIENTE.EMAIL_CLI'
      Size = 100
    end
  end
  object DSCli: TDataSource
    AutoEdit = False
    DataSet = QCli
    Left = 184
    Top = 104
  end
  object QEmp: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM EMPRESA')
    Left = 240
    Top = 56
    object QEmpCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'EMPRESA.COD_EMP'
      Required = True
    end
    object QEmpRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'EMPRESA.RAZAO_EMP'
      Required = True
      Size = 50
    end
    object QEmpEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = 'EMPRESA.END_EMP'
      Size = 50
    end
    object QEmpBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = 'EMPRESA.BAI_EMP'
      Size = 30
    end
    object QEmpCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = 'EMPRESA.CID_EMP'
      Size = 30
    end
    object QEmpCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = 'EMPRESA.CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object QEmpEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = 'EMPRESA.EST_EMP'
      FixedChar = True
      Size = 2
    end
    object QEmpCNPJ_EMP: TStringField
      DisplayWidth = 14
      FieldName = 'CNPJ_EMP'
      Origin = 'EMPRESA.CNPJ_EMP'
      Size = 14
    end
    object QEmpINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = 'EMPRESA.INSC_EMP'
    end
    object QEmpTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = 'EMPRESA.TEL_EMP'
      Size = 13
    end
    object QEmpFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = 'EMPRESA.FAX_EMP'
      Size = 13
    end
    object QEmpNOME_EMP_ETIQUETA: TStringField
      FieldName = 'NOME_EMP_ETIQUETA'
      Origin = 'EMPRESA.NOME_EMP_ETIQUETA'
      Size = 15
    end
    object QEmpNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = 'EMPRESA.NUMERO_EMP'
      Size = 10
    end
    object QEmpRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = 'EMPRESA.RESP_EMP'
      Size = 50
    end
    object QEmpCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = 'EMPRESA.CAMINHO_FOTO_EMP'
      Size = 150
    end
    object QEmpFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = 'EMPRESA.FANTASIA_EMP'
      Size = 50
    end
    object QEmpMOSTRAR_SITCLI_PREVENDA: TStringField
      FieldName = 'MOSTRAR_SITCLI_PREVENDA'
      Origin = 'EMPRESA.MOSTRAR_SITCLI_PREVENDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpCADASTRAR_CLIENTE_SEM_CPF: TStringField
      FieldName = 'CADASTRAR_CLIENTE_SEM_CPF'
      Origin = 'EMPRESA.CADASTRAR_CLIENTE_SEM_CPF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
      Origin = 'EMPRESA.TIPO_EMP'
      Required = True
    end
    object QEmpTIPO_CARGA_BALANCA: TIntegerField
      FieldName = 'TIPO_CARGA_BALANCA'
      Origin = 'EMPRESA.TIPO_CARGA_BALANCA'
      Required = True
    end
    object QEmpCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = 'EMPRESA.CAMINHO_VALIDADOR_SINTEGRA'
      Size = 80
    end
    object QEmpINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'EMPRESA.INSCRICAO_MUNICIPAL'
    end
    object QEmpPERFIL_EFD: TStringField
      FieldName = 'PERFIL_EFD'
      Origin = 'EMPRESA.PERFIL_EFD'
      FixedChar = True
      Size = 1
    end
    object QEmpCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'EMPRESA.CODIGO_MUNICIPIO'
      Size = 7
    end
    object QEmpTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = 'EMPRESA.TIPO_ATIVIDADE_EFD'
    end
    object QEmpNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = 'EMPRESA.NOME_CONTADOR'
      Size = 80
    end
    object QEmpCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = 'EMPRESA.CPF_CONTADOR'
      Size = 14
    end
    object QEmpCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = 'EMPRESA.CRC_CONTADOR'
      Size = 15
    end
    object QEmpCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = 'EMPRESA.CNPJ_CONTADOR'
      Size = 18
    end
    object QEmpCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = 'EMPRESA.CEP_CONTADOR'
      FixedChar = True
      Size = 9
    end
    object QEmpEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = 'EMPRESA.END_CONTADOR'
      Size = 60
    end
    object QEmpNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = 'EMPRESA.NUMERO_CONTADOR'
      Size = 10
    end
    object QEmpBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = 'EMPRESA.BAIRRO_CONTADOR'
      Size = 50
    end
    object QEmpTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = 'EMPRESA.TEL_CONTADOR'
      Size = 10
    end
    object QEmpFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = 'EMPRESA.FAX_CONTADOR'
      Size = 10
    end
    object QEmpCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = 'EMPRESA.CODIGO_MUNICIPIO_CONTADOR'
      Size = 7
    end
    object QEmpVERSAO_EFD: TIntegerField
      FieldName = 'VERSAO_EFD'
      Origin = '"EMPRESA"."VERSAO_EFD"'
    end
    object QEmpEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Origin = 'EMAIL_CONTADOR'
      Size = 255
    end
  end
  object DSEmp: TDataSource
    AutoEdit = False
    DataSet = QEmp
    Left = 240
    Top = 104
  end
  object QFor: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT  *'
      'FROM FORNECEDOR')
    Left = 296
    Top = 56
    object QForCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'FORNECEDOR.COD_FOR'
      Required = True
    end
    object QForFJ_FOR: TStringField
      FieldName = 'FJ_FOR'
      Origin = 'FORNECEDOR.FJ_FOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QForRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QForEND_FOR: TStringField
      FieldName = 'END_FOR'
      Origin = 'FORNECEDOR.END_FOR'
      Size = 50
    end
    object QForBAI_FOR: TStringField
      FieldName = 'BAI_FOR'
      Origin = 'FORNECEDOR.BAI_FOR'
      Size = 30
    end
    object QForCID_FOR: TStringField
      FieldName = 'CID_FOR'
      Origin = 'FORNECEDOR.CID_FOR'
      Size = 30
    end
    object QForCEP_FOR: TStringField
      FieldName = 'CEP_FOR'
      Origin = 'FORNECEDOR.CEP_FOR'
      FixedChar = True
      Size = 9
    end
    object QForEST_FOR: TStringField
      FieldName = 'EST_FOR'
      Origin = 'FORNECEDOR.EST_FOR'
      FixedChar = True
      Size = 2
    end
    object QForCNPJ_FOR: TStringField
      FieldName = 'CNPJ_FOR'
      Origin = 'FORNECEDOR.CNPJ_FOR'
      Size = 18
    end
    object QForINSC_FOR: TStringField
      FieldName = 'INSC_FOR'
      Origin = 'FORNECEDOR.INSC_FOR'
    end
    object QForTEL_FOR: TStringField
      FieldName = 'TEL_FOR'
      Origin = 'FORNECEDOR.TEL_FOR'
      Size = 13
    end
    object QForFAX_FOR: TStringField
      FieldName = 'FAX_FOR'
      Origin = 'FORNECEDOR.FAX_FOR'
      Size = 13
    end
    object QForCONTATO_FOR: TStringField
      FieldName = 'CONTATO_FOR'
      Origin = 'FORNECEDOR.CONTATO_FOR'
      Size = 50
    end
    object QForNUM_FOR: TStringField
      FieldName = 'NUM_FOR'
      Origin = 'FORNECEDOR.NUM_FOR'
      Size = 10
    end
    object QForCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'FORNECEDOR.CODIGO_IBGE'
    end
    object QForEMAIL_FOR: TStringField
      FieldName = 'EMAIL_FOR'
      Origin = 'FORNECEDOR.EMAIL_FOR'
      Size = 100
    end
  end
  object DSFor: TDataSource
    AutoEdit = False
    DataSet = QFor
    Left = 296
    Top = 104
  end
  object QBanco: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM BANCO')
    Left = 352
    Top = 56
    object QBancoCOD_BAN: TIntegerField
      FieldName = 'COD_BAN'
      Origin = 'BANCO.COD_BAN'
      Required = True
    end
    object QBancoNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QBancoLINHA_EMISSAO_BOLETO: TIntegerField
      FieldName = 'LINHA_EMISSAO_BOLETO'
      Origin = 'BANCO.LINHA_EMISSAO_BOLETO'
    end
    object QBancoCOL_EMISSAO_BOLETO: TIntegerField
      FieldName = 'COL_EMISSAO_BOLETO'
      Origin = 'BANCO.COL_EMISSAO_BOLETO'
    end
    object QBancoLINHA_DOC_BOLETO: TIntegerField
      FieldName = 'LINHA_DOC_BOLETO'
      Origin = 'BANCO.LINHA_DOC_BOLETO'
    end
    object QBancoCOL_DOC_BOLETO: TIntegerField
      FieldName = 'COL_DOC_BOLETO'
      Origin = 'BANCO.COL_DOC_BOLETO'
    end
    object QBancoLINHA_VENC_BOLETO: TIntegerField
      FieldName = 'LINHA_VENC_BOLETO'
      Origin = 'BANCO.LINHA_VENC_BOLETO'
    end
    object QBancoCOL_VENC_BOLETO: TIntegerField
      FieldName = 'COL_VENC_BOLETO'
      Origin = 'BANCO.COL_VENC_BOLETO'
    end
    object QBancoLINHA_VALOR_BOLETO: TIntegerField
      FieldName = 'LINHA_VALOR_BOLETO'
      Origin = 'BANCO.LINHA_VALOR_BOLETO'
    end
    object QBancoCOL_VALOR_BOLETO: TIntegerField
      FieldName = 'COL_VALOR_BOLETO'
      Origin = 'BANCO.COL_VALOR_BOLETO'
    end
    object QBancoLINHA_INST_BOLETO: TIntegerField
      FieldName = 'LINHA_INST_BOLETO'
      Origin = 'BANCO.LINHA_INST_BOLETO'
    end
    object QBancoCOL_INST_BOLETO: TIntegerField
      FieldName = 'COL_INST_BOLETO'
      Origin = 'BANCO.COL_INST_BOLETO'
    end
    object QBancoLINHA_SACADO_BOLETO: TIntegerField
      FieldName = 'LINHA_SACADO_BOLETO'
      Origin = 'BANCO.LINHA_SACADO_BOLETO'
    end
    object QBancoCOL_SACADO_BOLETO: TIntegerField
      FieldName = 'COL_SACADO_BOLETO'
      Origin = 'BANCO.COL_SACADO_BOLETO'
    end
    object QBancoLINHAS_FINAL_BOLETO: TIntegerField
      FieldName = 'LINHAS_FINAL_BOLETO'
      Origin = 'BANCO.LINHAS_FINAL_BOLETO'
    end
    object QBancoIMPRIMIR_PARCELA_BOLETO: TStringField
      FieldName = 'IMPRIMIR_PARCELA_BOLETO'
      Origin = 'BANCO.IMPRIMIR_PARCELA_BOLETO'
      FixedChar = True
      Size = 1
    end
  end
  object DSBanco: TDataSource
    AutoEdit = False
    DataSet = QBanco
    Left = 352
    Top = 104
  end
  object QConta: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CONTAS_CORRENTE')
    Left = 408
    Top = 56
    object QContaCOD_CONTA: TIntegerField
      FieldName = 'COD_CONTA'
      Origin = 'CONTAS_CORRENTE.COD_CONTA'
      Required = True
    end
    object QContaNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Origin = 'CONTAS_CORRENTE.NOME_CONTA'
      Required = True
      Size = 50
    end
  end
  object DSConta: TDataSource
    AutoEdit = False
    DataSet = QConta
    Left = 408
    Top = 104
  end
  object QMotivo: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM MOTIVO_ACERTO')
    Left = 464
    Top = 56
    object QMotivoCOD_MOT: TIntegerField
      FieldName = 'COD_MOT'
      Origin = 'MOTIVO_ACERTO.COD_MOT'
      Required = True
    end
    object QMotivoNOME_MOT: TStringField
      FieldName = 'NOME_MOT'
      Origin = 'MOTIVO_ACERTO.NOME_MOT'
      Required = True
      Size = 50
    end
    object QMotivoENTSAI_MOT: TStringField
      FieldName = 'ENTSAI_MOT'
      Origin = 'MOTIVO_ACERTO.ENTSAI_MOT'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSMotivo: TDataSource
    AutoEdit = False
    DataSet = QMotivo
    Left = 464
    Top = 104
  end
  object QGRP: TFDQuery
    OnCalcFields = QGRPCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM GRUPO_ICMS')
    Left = 520
    Top = 56
    object QGRPCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'GRUPO_ICMS.COD_GRP'
      Required = True
    end
    object QGRPNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = 'GRUPO_ICMS.NOME_GRP'
      Required = True
      Size = 50
    end
    object QGRPALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QGRPTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QGRPCST: TStringField
      FieldName = 'CST'
      Origin = 'GRUPO_ICMS.CST'
      FixedChar = True
      Size = 3
    end
    object QGRPICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = 'GRUPO_ICMS.ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QGRPECF: TStringField
      FieldName = 'ECF'
      Origin = 'GRUPO_ICMS.ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QGRPCALC_ICMS_SERVICO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_ICMS_SERVICO'
      Size = 10
      Calculated = True
    end
  end
  object DSGRP: TDataSource
    AutoEdit = False
    DataSet = QGRP
    Left = 521
    Top = 104
  end
  object QSec: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SECAO')
    Left = 568
    Top = 56
    object QSecCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'SECAO.COD_SEC'
      Required = True
    end
    object QSecNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QSecCAMINHO_FOTO_SEC: TStringField
      FieldName = 'CAMINHO_FOTO_SEC'
      Origin = 'SECAO.CAMINHO_FOTO_SEC'
      Size = 150
    end
    object QSecBEBIDAS_FUMO_SEC: TStringField
      FieldName = 'BEBIDAS_FUMO_SEC'
      Origin = 'SECAO.BEBIDAS_FUMO_SEC'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSSec: TDataSource
    AutoEdit = False
    DataSet = QSec
    Left = 568
    Top = 104
  end
  object QTipoVenda: TFDQuery
    OnCalcFields = QTipoVendaCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT T.*, C.DESCRICAO'
      'FROM TIPO_VENDA T'
      'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER C'
      'ON (T.CODIGO_CLASSIFICACAO = C.CODIGO)')
    Left = 24
    Top = 152
    object QTipoVendaCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'TIPO_VENDA.COD_TPV'
      Required = True
    end
    object QTipoVendaNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QTipoVendaQTDPARCELAS_TPV: TIntegerField
      FieldName = 'QTDPARCELAS_TPV'
      Origin = 'TIPO_VENDA.QTDPARCELAS_TPV'
      Required = True
    end
    object QTipoVendaDIASPRIPARC_TPV: TIntegerField
      FieldName = 'DIASPRIPARC_TPV'
      Origin = 'TIPO_VENDA.DIASPRIPARC_TPV'
    end
    object QTipoVendaDIASENTREPARC_TPV: TIntegerField
      FieldName = 'DIASENTREPARC_TPV'
      Origin = 'TIPO_VENDA.DIASENTREPARC_TPV'
    end
    object QTipoVendaPOSSUI_ENTRADA: TStringField
      FieldName = 'POSSUI_ENTRADA'
      Origin = 'TIPO_VENDA.POSSUI_ENTRADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTipoVendaPERC_ENTRADA: TBCDField
      FieldName = 'PERC_ENTRADA'
      Origin = 'TIPO_VENDA.PERC_ENTRADA'
      Precision = 18
      Size = 2
    end
    object QTipoVendaTABELA_PRECO_TPV: TStringField
      FieldName = 'TABELA_PRECO_TPV'
      Origin = 'TIPO_VENDA.TABELA_PRECO_TPV'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTipoVendaCALC_TABELA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TABELA'
      Calculated = True
    end
    object QTipoVendaCODIGO_CLASSIFICACAO: TIntegerField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Origin = 'TIPO_VENDA.CODIGO_CLASSIFICACAO'
      Required = True
    end
    object QTipoVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSTipoVenda: TDataSource
    AutoEdit = False
    DataSet = QTipoVenda
    Left = 24
    Top = 200
  end
  object QCaixa: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CAIXA')
    Left = 80
    Top = 152
    object QCaixaCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaTAMANHO_DESC_CUPOM: TIntegerField
      FieldName = 'TAMANHO_DESC_CUPOM'
      Origin = 'TAMANHO_DESC_CUPOM'
    end
    object QCaixaPORTA_IMP: TStringField
      FieldName = 'PORTA_IMP'
      Origin = 'PORTA_IMP'
      FixedChar = True
      Size = 4
    end
    object QCaixaDESC_CAI: TStringField
      FieldName = 'DESC_CAI'
      Origin = 'DESC_CAI'
      Required = True
      Size = 50
    end
    object QCaixaINDICE_GAVETA: TIntegerField
      FieldName = 'INDICE_GAVETA'
      Origin = 'INDICE_GAVETA'
      Required = True
    end
    object QCaixaINDICE_BALANCA: TIntegerField
      FieldName = 'INDICE_BALANCA'
      Origin = 'INDICE_BALANCA'
      Required = True
    end
    object QCaixaPORTA_BALANCA: TIntegerField
      FieldName = 'PORTA_BALANCA'
      Origin = 'PORTA_BALANCA'
    end
    object QCaixaBAUD_BALANCA: TIntegerField
      FieldName = 'BAUD_BALANCA'
      Origin = 'BAUD_BALANCA'
    end
    object QCaixaCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
      Origin = 'CASAS_DECIMAIS'
    end
    object QCaixaCASAS_DECIMAIS_UNITARIO: TIntegerField
      FieldName = 'CASAS_DECIMAIS_UNITARIO'
      Origin = 'CASAS_DECIMAIS_UNITARIO'
      Required = True
    end
    object QCaixaTRUNCAR_CAI: TStringField
      FieldName = 'TRUNCAR_CAI'
      Origin = 'TRUNCAR_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixaIMPRIMIR_COMPROVANTE_ECF: TStringField
      FieldName = 'IMPRIMIR_COMPROVANTE_ECF'
      Origin = 'IMPRIMIR_COMPROVANTE_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixaECF_MFD: TStringField
      FieldName = 'ECF_MFD'
      Origin = 'ECF_MFD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixaIP_SERVIDOR_TEF: TStringField
      FieldName = 'IP_SERVIDOR_TEF'
      Origin = 'IP_SERVIDOR_TEF'
      Size = 15
    end
    object QCaixaID_LOJA_TEF: TStringField
      FieldName = 'ID_LOJA_TEF'
      Origin = 'ID_LOJA_TEF'
      Size = 8
    end
    object QCaixaID_TERMINAL_TEF: TStringField
      FieldName = 'ID_TERMINAL_TEF'
      Origin = 'ID_TERMINAL_TEF'
      Size = 8
    end
    object QCaixaTEF_CAI: TStringField
      FieldName = 'TEF_CAI'
      Origin = 'TEF_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixaCAMINHO_BANCO: TStringField
      FieldName = 'CAMINHO_BANCO'
      Origin = 'CAMINHO_BANCO'
      Size = 255
    end
    object QCaixaEXPORTAR_DADOS: TStringField
      FieldName = 'EXPORTAR_DADOS'
      Origin = 'EXPORTAR_DADOS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixaR01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = 'R01_MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QCaixaR01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = 'R01_TIPO_ECF'
      Size = 7
    end
    object QCaixaR01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = 'R01_MARCA_ECF'
    end
    object QCaixaR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'R01_MODELO_ECF'
    end
    object QCaixaR01_VERSAO_SB: TStringField
      FieldName = 'R01_VERSAO_SB'
      Origin = 'R01_VERSAO_SB'
      Size = 10
    end
    object QCaixaR01_CNPJ_USUARIO: TStringField
      FieldName = 'R01_CNPJ_USUARIO'
      Origin = 'R01_CNPJ_USUARIO'
      Size = 14
    end
    object QCaixaR01_IE_USUARIO: TStringField
      FieldName = 'R01_IE_USUARIO'
      Origin = 'R01_IE_USUARIO'
      Size = 14
    end
    object QCaixaR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'R01_NUMERO_SERIE'
    end
    object QCaixaLINHA1: TStringField
      FieldName = 'LINHA1'
      Origin = 'LINHA1'
      Size = 48
    end
    object QCaixaLINHA2: TStringField
      FieldName = 'LINHA2'
      Origin = 'LINHA2'
      Size = 48
    end
    object QCaixaLINHA3: TStringField
      FieldName = 'LINHA3'
      Origin = 'LINHA3'
      Size = 48
    end
    object QCaixaINDICE_GER_OS: TStringField
      FieldName = 'INDICE_GER_OS'
      Origin = 'INDICE_GER_OS'
      Size = 15
    end
    object QCaixaINDICE_GER_ORCAMENTO: TStringField
      FieldName = 'INDICE_GER_ORCAMENTO'
      Origin = 'INDICE_GER_ORCAMENTO'
      Size = 15
    end
    object QCaixaINDICE_GER_MESA: TStringField
      FieldName = 'INDICE_GER_MESA'
      Origin = 'INDICE_GER_MESA'
      Size = 15
    end
    object QCaixaR01_NUMERO_USUARIO: TIntegerField
      FieldName = 'R01_NUMERO_USUARIO'
      Origin = 'R01_NUMERO_USUARIO'
    end
    object QCaixaCODIGO_NACIONAL_IDENTIFICACAO: TStringField
      FieldName = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Origin = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Size = 6
    end
    object QCaixaR01_DATAHORA_SB: TSQLTimeStampField
      FieldName = 'R01_DATAHORA_SB'
      Origin = 'R01_DATAHORA_SB'
    end
    object QCaixaINTERVALO_RECEBE: TIntegerField
      FieldName = 'INTERVALO_RECEBE'
      Origin = 'INTERVALO_RECEBE'
      Required = True
    end
    object QCaixaINTERVALO_TRANSMITE: TIntegerField
      FieldName = 'INTERVALO_TRANSMITE'
      Origin = 'INTERVALO_TRANSMITE'
      Required = True
    end
    object QCaixaDIAS_ATUALIZACAO_PAF: TIntegerField
      FieldName = 'DIAS_ATUALIZACAO_PAF'
      Origin = 'DIAS_ATUALIZACAO_PAF'
      Required = True
    end
    object QCaixaCORTA_PAPEL: TStringField
      FieldName = 'CORTA_PAPEL'
      Origin = 'CORTA_PAPEL'
      Size = 1
    end
    object QCaixaNFCE_SERIE: TIntegerField
      FieldName = 'NFCE_SERIE'
      Origin = 'NFCE_SERIE'
    end
    object QCaixaNFCE_NUMERO: TIntegerField
      FieldName = 'NFCE_NUMERO'
      Origin = 'NFCE_NUMERO'
    end
  end
  object DSCaixa: TDataSource
    AutoEdit = False
    DataSet = QCaixa
    Left = 80
    Top = 200
  end
  object QProd: TFDQuery
    OnCalcFields = QProdCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'SELECT P.*, L.NOME_LAB, S.NOME_SEC, SB.NOME_SET, G.NOME_GRP, G.A' +
        'LIQUOTA_GRP, SG.DESCRICAO, SGS.DESCRICAO DESCRICAO1, UE.DESCRICA' +
        'O UND_ENTRADA, US.DESCRICAO UND_SAIDA,'
      'SE.DESCRICAO SETOR_ESTOQUE, '
      
        '(SELECT SUM(E.ESTOQUE) ESTOQUE FROM ESTOQUE E WHERE E.COD_PRO = ' +
        'P.COD_PRO AND E.COD_EMP = :CODEMP) ESTOQUE,'
      
        '(SELECT SUM(CON.QUANT) ESTOQUE_CONDIGNADO FROM ESTOQUE_CONSIGNAD' +
        'O CON WHERE CON.COD_PRO = P.COD_PRO AND CON.COD_EMP = :CODEMP) E' +
        'STOQUE_CONSIGNADO'
      'FROM PRODUTO P'
      'LEFT OUTER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'LEFT OUTER JOIN LABORATORIO L'
      'ON (P.COD_LAB = L.COD_LAB)'
      'LEFT OUTER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'LEFT OUTER JOIN UNIDADE_MEDIDA UE'
      'ON (P.CODIGO_UNIDADE_ENTRADA = UE.CODIGO)'
      'LEFT OUTER JOIN UNIDADE_MEDIDA US'
      'ON (P.CODIGO_UNIDADE_SAIDA = US.CODIGO)'
      'LEFT OUTER JOIN SETORES_ESTOQUE SE'
      'ON (P.CODIGO_SETOR_ESTOQUE = SE.CODIGO)'
      'LEFT OUTER JOIN SETOR_BALANCA SB'
      'ON (P.COD_SETOR = SB.COD_SET)'
      'LEFT OUTER JOIN SECAO_GRUPO SG'
      'ON (P.COD_SEC = SG.COD_SEC AND P.COD_GRUPO = SG.COD_GRUPO)'
      'LEFT OUTER JOIN SECAO_GRUPO_SUBGRUPO SGS'
      
        'ON (P.COD_SEC = SGS.COD_SEC AND P.COD_GRUPO = SGS.COD_GRUPO AND ' +
        'P.SUB_GRUPO = SGS.COD_SUBGRUPO)')
    Left = 136
    Top = 152
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QProdNOME_PRO: TStringField
      DisplayWidth = 80
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QProdCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = 'PRODUTO.COD_LAB'
      Required = True
    end
    object QProdCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object QProdVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdCOMISSAO_PRO: TBCDField
      FieldName = 'COMISSAO_PRO'
      Origin = 'PRODUTO.COMISSAO_PRO'
      Precision = 18
      Size = 2
    end
    object QProdQUANT_UNIDADE_ENTRADA: TBCDField
      FieldName = 'QUANT_UNIDADE_ENTRADA'
      Origin = 'PRODUTO.QUANT_UNIDADE_ENTRADA'
      Precision = 18
      Size = 2
    end
    object QProdNOME_LAB: TStringField
      FieldName = 'NOME_LAB'
      Origin = 'LABORATORIO.NOME_LAB'
      Required = True
      Size = 50
    end
    object QProdNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QProdESTOQUE_MINIMO_PRO: TBCDField
      FieldName = 'ESTOQUE_MINIMO_PRO'
      Origin = 'PRODUTO.ESTOQUE_MINIMO_PRO'
      Precision = 18
      Size = 2
    end
    object QProdATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'PRODUTO.ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdMARGEM_LUCRO_PRO: TBCDField
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = 'PRODUTO.MARGEM_LUCRO_PRO'
      Precision = 18
      Size = 2
    end
    object QProdLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'PRODUTO.LOCALIZACAO_PRO'
    end
    object QProdCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
      Origin = 'PRODUTO.COD_SETOR'
    end
    object QProdTECLA_ATALHO_PRO: TIntegerField
      FieldName = 'TECLA_ATALHO_PRO'
      Origin = 'PRODUTO.TECLA_ATALHO_PRO'
    end
    object QProdINDICE_RECEITA_PRO: TIntegerField
      FieldName = 'INDICE_RECEITA_PRO'
      Origin = 'PRODUTO.INDICE_RECEITA_PRO'
    end
    object QProdPRODUTO_PESADO_PRO: TStringField
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = 'PRODUTO.PRODUTO_PESADO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = 'PRODUTO.DIAS_VALIDADE_PRO'
    end
    object QProdNOME_SET: TStringField
      FieldName = 'NOME_SET'
      Origin = 'SETOR_BALANCA.NOME_SET'
      Size = 50
    end
    object QProdREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QProdCOMPLEMENTO_PRO: TStringField
      FieldName = 'COMPLEMENTO_PRO'
      Origin = 'PRODUTO.COMPLEMENTO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdCAMINHO_FOTO_PRO: TStringField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = 'PRODUTO.CAMINHO_FOTO_PRO'
      Size = 150
    end
    object QProdSAIR_TABELA_PRECO: TStringField
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = 'PRODUTO.SAIR_TABELA_PRECO'
      FixedChar = True
      Size = 1
    end
    object QProdICMS_CONT_EST: TIntegerField
      FieldName = 'ICMS_CONT_EST'
      Origin = 'PRODUTO.ICMS_CONT_EST'
      Required = True
    end
    object QProdICMS_CONT_FORA: TIntegerField
      FieldName = 'ICMS_CONT_FORA'
      Origin = 'PRODUTO.ICMS_CONT_FORA'
      Required = True
    end
    object QProdICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = 'PRODUTO.ICMS_CF_EST'
      Required = True
    end
    object QProdICMS_CF_FORA: TIntegerField
      FieldName = 'ICMS_CF_FORA'
      Origin = 'PRODUTO.ICMS_CF_FORA'
      Required = True
    end
    object QProdCST_CONT_EST: TStringField
      FieldName = 'CST_CONT_EST'
      Origin = 'PRODUTO.CST_CONT_EST'
      FixedChar = True
      Size = 3
    end
    object QProdCST_CONT_FORA: TStringField
      FieldName = 'CST_CONT_FORA'
      Origin = 'PRODUTO.CST_CONT_FORA'
      FixedChar = True
      Size = 3
    end
    object QProdCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = 'PRODUTO.CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QProdCST_CF_FORA: TStringField
      FieldName = 'CST_CF_FORA'
      Origin = 'PRODUTO.CST_CF_FORA'
      FixedChar = True
      Size = 3
    end
    object QProdCFOP_VENDAS_CONT_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_EST'
      Origin = 'PRODUTO.CFOP_VENDAS_CONT_EST'
    end
    object QProdCFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = 'PRODUTO.CFOP_VENDAS_CF_EST'
    end
    object QProdCFOP_VENDAS_CONT_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_FORA'
      Origin = 'PRODUTO.CFOP_VENDAS_CONT_FORA'
    end
    object QProdCFOP_VENDAS_CF_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_FORA'
      Origin = 'PRODUTO.CFOP_VENDAS_CF_FORA'
    end
    object QProdST_CONT_EST: TStringField
      FieldName = 'ST_CONT_EST'
      Origin = 'PRODUTO.ST_CONT_EST'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdVR_AGREG_CONT_EST: TBCDField
      FieldName = 'VR_AGREG_CONT_EST'
      Origin = 'PRODUTO.VR_AGREG_CONT_EST'
      Precision = 18
      Size = 2
    end
    object QProdIPI_CONT_EST: TBCDField
      FieldName = 'IPI_CONT_EST'
      Origin = 'PRODUTO.IPI_CONT_EST'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdIPI_CF_EST: TBCDField
      FieldName = 'IPI_CF_EST'
      Origin = 'PRODUTO.IPI_CF_EST'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdIPI_CONT_FORA: TBCDField
      FieldName = 'IPI_CONT_FORA'
      Origin = 'PRODUTO.IPI_CONT_FORA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdIPI_CF_FORA: TBCDField
      FieldName = 'IPI_CF_FORA'
      Origin = 'PRODUTO.IPI_CF_FORA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdRED_CONT_EST: TBCDField
      FieldName = 'RED_CONT_EST'
      Origin = 'PRODUTO.RED_CONT_EST'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdRED_CF_EST: TBCDField
      FieldName = 'RED_CF_EST'
      Origin = 'PRODUTO.RED_CF_EST'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdRED_CONT_FORA: TBCDField
      FieldName = 'RED_CONT_FORA'
      Origin = 'PRODUTO.RED_CONT_FORA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdRED_CF_FORA: TBCDField
      FieldName = 'RED_CF_FORA'
      Origin = 'PRODUTO.RED_CF_FORA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = 'GRUPO_ICMS.NOME_GRP'
      Required = True
      Size = 50
    end
    object QProdALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = 'PRODUTO.COD_NCM'
      Size = 8
    end
    object QProdCONTROLA_ESTOQUE_PRO: TStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = 'PRODUTO.CONTROLA_ESTOQUE_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Origin = 'PRODUTO.CODIGO_TIPO'
      Required = True
    end
    object QProdCOD_PRODUTO_ESTOQUE: TIntegerField
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = 'PRODUTO.COD_PRODUTO_ESTOQUE'
      Required = True
    end
    object QProdCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'PRODUTO.COD_GRUPO'
    end
    object QProdSUB_GRUPO: TIntegerField
      FieldName = 'SUB_GRUPO'
      Origin = 'PRODUTO.SUB_GRUPO'
    end
    object QProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SECAO_GRUPO.DESCRICAO'
      Size = 80
    end
    object QProdDESCRICAO1: TStringField
      FieldName = 'DESCRICAO1'
      Origin = 'SECAO_GRUPO_SUBGRUPO.DESCRICAO'
      Size = 80
    end
    object QProdPRECO_PROGRAMADO: TBCDField
      FieldName = 'PRECO_PROGRAMADO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'PRODUTO.ALIQUOTA_PIS'
      Precision = 18
      Size = 2
    end
    object QProdALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'PRODUTO.ALIQUOTA_COFINS'
      Precision = 18
      Size = 2
    end
    object QProdALIQUOTA_IR: TBCDField
      FieldName = 'ALIQUOTA_IR'
      Origin = 'PRODUTO.ALIQUOTA_IR'
      Precision = 18
      Size = 2
    end
    object QProdALIQUOTA_CSLL: TBCDField
      FieldName = 'ALIQUOTA_CSLL'
      Origin = 'PRODUTO.ALIQUOTA_CSLL'
      Precision = 18
      Size = 2
    end
    object QProdALIQUOTA_OUTRAS: TBCDField
      FieldName = 'ALIQUOTA_OUTRAS'
      Origin = 'PRODUTO.ALIQUOTA_OUTRAS'
      Precision = 18
      Size = 2
    end
    object QProdISENTO_PIS_COFINS_PRO: TStringField
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = 'PRODUTO.ISENTO_PIS_COFINS_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdCALC_PIS_COFINS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_PIS_COFINS'
      Size = 10
      Calculated = True
    end
    object QProdPRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRODUTO.PRECO_CUSTO'
      Precision = 18
    end
    object QProdCREDITO_ICMS: TBCDField
      FieldName = 'CREDITO_ICMS'
      Origin = 'PRODUTO.CREDITO_ICMS'
      Precision = 18
    end
    object QProdPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRODUTO.PRECO_PRAZO_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QProdTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'PRODUTO.TIPO_PRODUCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QProdDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'PRODUTO.DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QProdCODIGO_UNIDADE_SAIDA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = 'PRODUTO.CODIGO_UNIDADE_SAIDA'
      Required = True
    end
    object QProdCODIGO_UNIDADE_ENTRADA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_ENTRADA'
      Origin = 'PRODUTO.CODIGO_UNIDADE_ENTRADA'
      Required = True
    end
    object QProdUND_ENTRADA: TStringField
      FieldName = 'UND_ENTRADA'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QProdUND_SAIDA: TStringField
      FieldName = 'UND_SAIDA'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QProdPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO_PRAZO'
      Precision = 18
      Size = 2
    end
    object QProdESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QProdDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'PRODUTO.DATA_VALIDADE'
    end
    object QProdCODIGO_SETOR_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_SETOR_ESTOQUE'
      Origin = 'PRODUTO.CODIGO_SETOR_ESTOQUE'
      Required = True
    end
    object QProdSETOR_ESTOQUE: TStringField
      FieldName = 'SETOR_ESTOQUE'
      Origin = 'SETORES_ESTOQUE.DESCRICAO'
      Required = True
      Size = 60
    end
    object QProdCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = '"PRODUTO"."CLASSIFICACAO_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object QProdORIG: TIntegerField
      FieldName = 'ORIG'
      Origin = '"PRODUTO"."ORIG"'
    end
    object QProdCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"PRODUTO"."CSOSN"'
      Size = 3
    end
    object QProdIPI: TFloatField
      FieldName = 'IPI'
      Origin = '"PRODUTO"."IPI"'
    end
    object QProdICMS: TFloatField
      FieldName = 'ICMS'
      Origin = '"PRODUTO"."ICMS"'
    end
    object QProdRICMS: TFloatField
      FieldName = 'RICMS'
      Origin = '"PRODUTO"."RICMS"'
    end
    object QProdIVA: TFloatField
      FieldName = 'IVA'
      Origin = '"PRODUTO"."IVA"'
    end
    object QProdPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"PRODUTO"."PIS"'
    end
    object QProdCONFINS: TFloatField
      FieldName = 'CONFINS'
      Origin = '"PRODUTO"."CONFINS"'
    end
    object QProdTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Origin = '"PRODUTO"."TAMANHO"'
      Size = 10
    end
    object QProdCOR: TStringField
      FieldName = 'COR'
      Origin = '"PRODUTO"."COR"'
      Size = 40
    end
    object QProdESTOQUE_CONSIGNADO: TFloatField
      FieldName = 'ESTOQUE_CONSIGNADO'
      ProviderFlags = []
    end
    object QProdOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"PRODUTO"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QProdCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO"."CST_PIS"'
      Size = 3
    end
    object QProdCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO"."CST_COFINS"'
      Size = 3
    end
    object QProdCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"PRODUTO"."CST_IPI"'
      Size = 3
    end
    object QProdULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PRODUTO"."ULTIMA_ALTERACAO"'
    end
    object QProdVALOR_ATACADO: TBCDField
      FieldName = 'VALOR_ATACADO'
      Origin = '"PRODUTO"."VALOR_ATACADO"'
      Precision = 18
      Size = 2
    end
    object QProdALIQ_IBPT_NAC: TBCDField
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = '"PRODUTO"."ALIQ_IBPT_NAC"'
      Precision = 18
      Size = 2
    end
    object QProdALIQ_IBPT_IMP: TBCDField
      FieldName = 'ALIQ_IBPT_IMP'
      Origin = '"PRODUTO"."ALIQ_IBPT_IMP"'
      Precision = 18
      Size = 2
    end
    object QProdFATOR_CONVERSAO: TBCDField
      FieldName = 'FATOR_CONVERSAO'
      Origin = '"PRODUTO"."FATOR_CONVERSAO"'
      Precision = 18
      Size = 3
    end
    object QProdALERTA_COPA: TStringField
      FieldName = 'ALERTA_COPA'
      Origin = '"PRODUTO"."ALERTA_COPA"'
      FixedChar = True
      Size = 1
    end
    object QProdALERTA_COZINHA: TStringField
      FieldName = 'ALERTA_COZINHA'
      Origin = '"PRODUTO"."ALERTA_COZINHA"'
      FixedChar = True
      Size = 1
    end
    object QProdANDROID_VISUALIZA: TStringField
      FieldName = 'ANDROID_VISUALIZA'
      Origin = '"PRODUTO"."ANDROID_VISUALIZA"'
      FixedChar = True
      Size = 1
    end
    object QProdTEMPO_PREPARO: TTimeField
      FieldName = 'TEMPO_PREPARO'
      Origin = '"PRODUTO"."TEMPO_PREPARO"'
    end
  end
  object DSProd: TDataSource
    AutoEdit = False
    DataSet = QProd
    Left = 136
    Top = 200
  end
  object QFunc: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM FUNCIONARIO')
    Left = 184
    Top = 152
    object QFuncCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Origin = 'FUNCIONARIO.COD_FUN'
      Required = True
    end
    object QFuncDATA_ADM_FUN: TDateField
      FieldName = 'DATA_ADM_FUN'
      Origin = 'FUNCIONARIO.DATA_ADM_FUN'
      Required = True
    end
    object QFuncDATA_DEM_FUN: TDateField
      FieldName = 'DATA_DEM_FUN'
      Origin = 'FUNCIONARIO.DATA_DEM_FUN'
    end
    object QFuncNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Origin = 'FUNCIONARIO.NOME_FUN'
      Required = True
      Size = 60
    end
    object QFuncEND_FUN: TStringField
      FieldName = 'END_FUN'
      Origin = 'FUNCIONARIO.END_FUN'
      Size = 50
    end
    object QFuncBAI_FUN: TStringField
      FieldName = 'BAI_FUN'
      Origin = 'FUNCIONARIO.BAI_FUN'
      Size = 30
    end
    object QFuncCID_FUN: TStringField
      FieldName = 'CID_FUN'
      Origin = 'FUNCIONARIO.CID_FUN'
      Size = 30
    end
    object QFuncCEP_FUN: TStringField
      FieldName = 'CEP_FUN'
      Origin = 'FUNCIONARIO.CEP_FUN'
      FixedChar = True
      Size = 9
    end
    object QFuncEST_FUN: TStringField
      FieldName = 'EST_FUN'
      Origin = 'FUNCIONARIO.EST_FUN'
      FixedChar = True
      Size = 2
    end
    object QFuncCPF_FUN: TStringField
      FieldName = 'CPF_FUN'
      Origin = 'FUNCIONARIO.CPF_FUN'
      FixedChar = True
      Size = 14
    end
    object QFuncDOC_FUN: TStringField
      FieldName = 'DOC_FUN'
      Origin = 'FUNCIONARIO.DOC_FUN'
    end
    object QFuncTEL_FUN: TStringField
      FieldName = 'TEL_FUN'
      Origin = 'FUNCIONARIO.TEL_FUN'
      Size = 13
    end
    object QFuncCEL_FUN: TStringField
      FieldName = 'CEL_FUN'
      Origin = 'FUNCIONARIO.CEL_FUN'
      Size = 13
    end
    object QFuncOBS: TStringField
      FieldName = 'OBS'
      Origin = 'FUNCIONARIO.OBS'
      Size = 100
    end
  end
  object DSFunc: TDataSource
    AutoEdit = False
    DataSet = QFunc
    Left = 184
    Top = 200
  end
  object QUsu: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM USUARIO')
    Left = 240
    Top = 152
    object QUsuCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'USUARIO.COD_USU'
      Required = True
    end
    object QUsuNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QUsuSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'USUARIO.SENHA_USU'
      Required = True
      Size = 6
    end
    object QUsuCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'USUARIO.COD_GRUPO'
      Required = True
    end
    object QUsuOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'USUARIO.OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSUsu: TDataSource
    AutoEdit = False
    DataSet = QUsu
    Left = 240
    Top = 200
  end
  object QAcesso: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 296
    Top = 8
  end
  object QHabilitaMenu: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 352
    Top = 8
  end
  object QSetor: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SETOR_BALANCA')
    Left = 296
    Top = 152
    object QSetorCOD_SET: TIntegerField
      FieldName = 'COD_SET'
      Origin = 'SETOR_BALANCA.COD_SET'
      Required = True
    end
    object QSetorNOME_SET: TStringField
      FieldName = 'NOME_SET'
      Origin = 'SETOR_BALANCA.NOME_SET'
      Required = True
      Size = 50
    end
  end
  object DSSetor: TDataSource
    AutoEdit = False
    DataSet = QSetor
    Left = 296
    Top = 200
  end
  object QTipoES: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_ES')
    Left = 352
    Top = 152
    object QTipoESCOD_ES: TIntegerField
      FieldName = 'COD_ES'
      Origin = 'TIPO_ES.COD_ES'
      Required = True
    end
    object QTipoESNOME_ES: TStringField
      FieldName = 'NOME_ES'
      Origin = 'TIPO_ES.NOME_ES'
      Required = True
      Size = 50
    end
    object QTipoESTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Origin = 'TIPO_ES.TIPO_ES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTipoESCFOP_ESTADO_TRIBUTADO: TIntegerField
      FieldName = 'CFOP_ESTADO_TRIBUTADO'
      Origin = 'TIPO_ES.CFOP_ESTADO_TRIBUTADO'
    end
    object QTipoESCFOP_ESTADO_SUBSTITUICAO: TIntegerField
      FieldName = 'CFOP_ESTADO_SUBSTITUICAO'
      Origin = 'TIPO_ES.CFOP_ESTADO_SUBSTITUICAO'
    end
    object QTipoESCFOP_FORA_TRIBUTADO: TIntegerField
      FieldName = 'CFOP_FORA_TRIBUTADO'
      Origin = 'TIPO_ES.CFOP_FORA_TRIBUTADO'
    end
    object QTipoESCFOP_FORA_SUBSTITUICAO: TIntegerField
      FieldName = 'CFOP_FORA_SUBSTITUICAO'
      Origin = 'TIPO_ES.CFOP_FORA_SUBSTITUICAO'
    end
    object QTipoESTIPO_PRECO: TStringField
      FieldName = 'TIPO_PRECO'
      Origin = 'TIPO_ES.TIPO_PRECO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTipoESCOD_GRP_ESPECIFICO: TIntegerField
      FieldName = 'COD_GRP_ESPECIFICO'
      Origin = 'TIPO_ES.COD_GRP_ESPECIFICO'
    end
    object QTipoESCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = 'TIPO_ES.CODIGO_LOCAL_ESTOQUE'
      Required = True
    end
    object QTipoESCONTROLA_ESTOQUE: TStringField
      FieldName = 'CONTROLA_ESTOQUE'
      Origin = 'TIPO_ES.CONTROLA_ESTOQUE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTipoESATUALIZA_CUSTO_ENTRADAS: TStringField
      FieldName = 'ATUALIZA_CUSTO_ENTRADAS'
      Origin = 'TIPO_ES.ATUALIZA_CUSTO_ENTRADAS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSTipoES: TDataSource
    AutoEdit = False
    DataSet = QTipoES
    Left = 352
    Top = 200
  end
  object QTipoDoc: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_DOCUMENTO')
    Left = 408
    Top = 152
    object QTipoDocCOD_DOC: TIntegerField
      FieldName = 'COD_DOC'
      Origin = 'TIPO_DOCUMENTO.COD_DOC'
      Required = True
    end
    object QTipoDocNOME_DOC: TStringField
      FieldName = 'NOME_DOC'
      Origin = 'TIPO_DOCUMENTO.NOME_DOC'
      Required = True
      Size = 50
    end
  end
  object DSTipoDoc: TDataSource
    AutoEdit = False
    DataSet = QTipoDoc
    Left = 408
    Top = 200
  end
  object QRelRepasse: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'SELECT CHE.AGENCIA_CHE, CHE.COD_CHE, CHE.CONTA_CHE, CHE.EMISSAO_' +
        'CHE, CHE.NUMERO_CHE, CHE.VALOR_CHE, B.NOME_BAN, C.NOME_CLI, CHE.' +
        'VENCTO_CHE, E.NOME_CLI EMITENTE'
      'FROM CHEQUE CHE'
      'INNER JOIN BANCO B'
      'ON (CHE.COD_BANCO = B.COD_BAN)'
      'INNER JOIN CLIENTE C'
      'ON (CHE.COD_CLI = C.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (CHE.COD_EMITENTE = E.COD_CLI)'
      'WHERE CHE.COD_REPASSE = :CODREPASSE '
      'ORDER BY CHE.VENCTO_CHE, CHE.COD_CHE')
    Left = 408
    Top = 8
    ParamData = <
      item
        Name = 'CODREPASSE'
        DataType = ftInteger
      end>
    object QRelRepasseAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QRelRepasseCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QRelRepasseCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QRelRepasseEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QRelRepasseNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QRelRepasseVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelRepasseNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QRelRepasseNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelRepasseVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
    object QRelRepasseEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object DSTipoCobranca: TDataSource
    AutoEdit = False
    DataSet = QTipoCobranca
    Left = 464
    Top = 200
  end
  object QTipoCobranca: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_COBRANCA')
    Left = 464
    Top = 152
    object QTipoCobrancaCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'TIPO_COBRANCA.COD_COB'
      Required = True
    end
    object QTipoCobrancaNOME_COB: TStringField
      FieldName = 'NOME_COB'
      Origin = 'TIPO_COBRANCA.NOME_COB'
      Required = True
      Size = 50
    end
  end
  object QCFOP: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CFOP')
    Left = 520
    Top = 152
    object QCFOPCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'CFOP.COD_CFO'
      Required = True
    end
    object QCFOPNOME_CFO: TStringField
      FieldName = 'NOME_CFO'
      Origin = '"CFOP"."NOME_CFO"'
      Required = True
      Size = 200
    end
    object QCFOPINF_COMPL_NF: TMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = 'CFOP.INF_COMPL_NF'
      BlobType = ftMemo
      Size = 8
    end
    object QCFOPDESTACA_ICMS: TStringField
      FieldName = 'DESTACA_ICMS'
      Origin = 'CFOP.DESTACA_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPSAIR_REL_RESUMO_ALIQ: TStringField
      FieldName = 'SAIR_REL_RESUMO_ALIQ'
      Origin = 'CFOP.SAIR_REL_RESUMO_ALIQ'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'CFOP.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPREGISTRADO_ECF: TStringField
      FieldName = 'REGISTRADO_ECF'
      Origin = 'CFOP.REGISTRADO_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPCALCULA_PIS_COFINS: TStringField
      FieldName = 'CALCULA_PIS_COFINS'
      Origin = 'CFOP.CALCULA_PIS_COFINS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPUSA_CSOSN: TStringField
      FieldName = 'USA_CSOSN'
      Origin = '"CFOP"."USA_CSOSN"'
      FixedChar = True
      Size = 1
    end
  end
  object DSCFOP: TDataSource
    AutoEdit = False
    DataSet = QCFOP
    Left = 520
    Top = 200
  end
  object QTransp: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TRANSPORTADORA')
    Left = 568
    Top = 152
    object QTranspCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = 'TRANSPORTADORA.COD_TRA'
      Required = True
    end
    object QTranspFJ_TRA: TStringField
      FieldName = 'FJ_TRA'
      Origin = 'TRANSPORTADORA.FJ_TRA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTranspNOME_TRA: TStringField
      FieldName = 'NOME_TRA'
      Origin = 'TRANSPORTADORA.NOME_TRA'
      Required = True
      Size = 60
    end
    object QTranspEND_TRA: TStringField
      FieldName = 'END_TRA'
      Origin = 'TRANSPORTADORA.END_TRA'
      Size = 60
    end
    object QTranspCID_TRA: TStringField
      FieldName = 'CID_TRA'
      Origin = 'TRANSPORTADORA.CID_TRA'
      Size = 40
    end
    object QTranspEST_TRA: TStringField
      FieldName = 'EST_TRA'
      Origin = 'TRANSPORTADORA.EST_TRA'
      FixedChar = True
      Size = 2
    end
    object QTranspCNPJ_TRA: TStringField
      FieldName = 'CNPJ_TRA'
      Origin = 'TRANSPORTADORA.CNPJ_TRA'
      Size = 18
    end
    object QTranspINSC_TRA: TStringField
      FieldName = 'INSC_TRA'
      Origin = 'TRANSPORTADORA.INSC_TRA'
    end
    object QTranspPLACA_TRA: TStringField
      FieldName = 'PLACA_TRA'
      Origin = 'TRANSPORTADORA.PLACA_TRA'
      Size = 10
    end
    object QTranspUF_PLACA_TRA: TStringField
      FieldName = 'UF_PLACA_TRA'
      Origin = 'TRANSPORTADORA.UF_PLACA_TRA'
      FixedChar = True
      Size = 2
    end
  end
  object DSTransp: TDataSource
    AutoEdit = False
    DataSet = QTransp
    Left = 568
    Top = 200
  end
  object QAdmCartao: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM ADMINISTRADORA_CARTAO')
    Left = 408
    Top = 248
    object QAdmCartaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ADMINISTRADORA_CARTAO.CODIGO'
      Required = True
    end
    object QAdmCartaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ADMINISTRADORA_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QAdmCartaoCODIGO_TEF: TStringField
      FieldName = 'CODIGO_TEF'
      Origin = 'ADMINISTRADORA_CARTAO.CODIGO_TEF'
      Required = True
      Size = 10
    end
  end
  object DSAdmCartao: TDataSource
    AutoEdit = False
    DataSet = QAdmCartao
    Left = 408
    Top = 296
  end
  object QConsulta: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 184
    Top = 8
  end
  object IBTRAux: TFDTransaction
    Connection = IBDatabase
    Left = 464
    Top = 8
  end
  object QModelo: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CODIFICACAO_DOCUMENTOS')
    Left = 24
    Top = 248
    object QModeloCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIFICACAO_DOCUMENTOS.CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QModeloDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CODIFICACAO_DOCUMENTOS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSModelo: TDataSource
    AutoEdit = False
    DataSet = QModelo
    Left = 24
    Top = 296
  end
  object QReceita: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM RECEITAS')
    Left = 72
    Top = 248
    object QReceitaCOD_RECEITA: TIntegerField
      FieldName = 'COD_RECEITA'
      Origin = 'RECEITAS.COD_RECEITA'
      Required = True
    end
    object QReceitaINGREDIENTES: TStringField
      FieldName = 'INGREDIENTES'
      Origin = 'RECEITAS.INGREDIENTES'
      Required = True
      Size = 200
    end
  end
  object DSReceita: TDataSource
    AutoEdit = False
    DataSet = QReceita
    Left = 72
    Top = 296
  end
  object QTPProd: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_PRODUTO')
    Left = 128
    Top = 248
    object QTPProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_PRODUTO.CODIGO'
      Required = True
    end
    object QTPProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPO_PRODUTO.DESCRICAO'
      Required = True
      Size = 60
    end
    object QTPProdSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'TIPO_PRODUTO.SERVICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTPProdEFD_TIPO: TStringField
      FieldName = 'EFD_TIPO'
      Origin = '"TIPO_PRODUTO"."EFD_TIPO"'
      Size = 2
    end
  end
  object DSTPProd: TDataSource
    AutoEdit = False
    DataSet = QTPProd
    Left = 128
    Top = 296
  end
  object QClaCTP: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIFICACAO_CONTAS_PAGAR')
    Left = 184
    Top = 248
    object QClaCTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLASSIFICACAO_CONTAS_PAGAR.CODIGO'
      Required = True
    end
    object QClaCTPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_PAGAR.DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object DSClaCTP: TDataSource
    AutoEdit = False
    DataSet = QClaCTP
    Left = 184
    Top = 296
  end
  object QEmb: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT E.*, P.NOME_PRO'
      'FROM PRODUTO_EMBALAGENS E'
      'INNER JOIN PRODUTO P'
      'ON (E.COD_PRO = P.COD_PRO)')
    Left = 240
    Top = 248
    object QEmbCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PRODUTO_EMBALAGENS.CODIGO'
      Required = True
    end
    object QEmbDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO_EMBALAGENS.DESCRICAO'
      Required = True
      Size = 80
    end
    object QEmbCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO_EMBALAGENS.COD_PRO'
      Required = True
    end
    object QEmbQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'PRODUTO_EMBALAGENS.QUANT'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QEmbNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QEmbUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTO_EMBALAGENS.UNIDADE'
      Size = 4
    end
    object QEmbCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'PRODUTO_EMBALAGENS.CODIGO_BARRA'
      Required = True
      Size = 14
    end
    object QEmbVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"PRODUTO_EMBALAGENS"."VALOR"'
      Precision = 18
      Size = 2
    end
  end
  object DSEmb: TDataSource
    AutoEdit = False
    DataSet = QEmb
    Left = 240
    Top = 296
  end
  object QGrupo: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SECAO_GRUPO')
    Left = 296
    Top = 248
    object QGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'SECAO_GRUPO.COD_SEC'
      Required = True
    end
    object QGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'SECAO_GRUPO.COD_GRUPO'
      Required = True
    end
    object QGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SECAO_GRUPO.DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object DSGrupo: TDataSource
    AutoEdit = False
    DataSet = QGrupo
    Left = 296
    Top = 296
  end
  object QSubGrupo: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SECAO_GRUPO_SUBGRUPO')
    Left = 352
    Top = 248
    object QSubGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_SEC'
      Required = True
    end
    object QSubGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_GRUPO'
      Required = True
    end
    object QSubGrupoCOD_SUBGRUPO: TIntegerField
      FieldName = 'COD_SUBGRUPO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_SUBGRUPO'
      Required = True
    end
    object QSubGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object DSSubGrupo: TDataSource
    AutoEdit = False
    DataSet = QSubGrupo
    Left = 352
    Top = 296
  end
  object IBSQL: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 520
    Top = 8
  end
  object QVend: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM VENDEDOR')
    Left = 464
    Top = 248
    object QVendCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'VENDEDOR.COD_VEND'
      Required = True
    end
    object QVendNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'VENDEDOR.NOME_VEND'
      Required = True
      Size = 50
    end
    object QVendATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Origin = 'VENDEDOR.ATIVO_VEND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QVendCOMISSAO_VEND: TBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = 'VENDEDOR.COMISSAO_VEND'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
      Origin = '"VENDEDOR"."COD_REGIAO"'
    end
    object QVendSENHA_VEND: TStringField
      FieldName = 'SENHA_VEND'
      Origin = '"VENDEDOR"."SENHA_VEND"'
      Size = 50
    end
  end
  object DSVend: TDataSource
    AutoEdit = False
    DataSet = QVend
    Left = 464
    Top = 296
  end
  object QMarcas: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM MARCAS')
    Left = 520
    Top = 248
    object QMarcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MARCAS.CODIGO'
      Required = True
    end
    object QMarcasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MARCAS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSMarcas: TDataSource
    AutoEdit = False
    DataSet = QMarcas
    Left = 520
    Top = 296
  end
  object QModelos: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM MODELOS')
    Left = 568
    Top = 248
    object QModelosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MODELOS.CODIGO'
      Required = True
    end
    object QModelosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELOS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSModelos: TDataSource
    AutoEdit = False
    DataSet = QModelos
    Left = 568
    Top = 296
  end
  object QUnidMed: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM UNIDADE_MEDIDA')
    Left = 24
    Top = 344
    object QUnidMedCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'UNIDADE_MEDIDA.CODIGO'
      Required = True
    end
    object QUnidMedDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DSUnidMed: TDataSource
    AutoEdit = False
    DataSet = QUnidMed
    Left = 24
    Top = 392
  end
  object QFormas: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM FORMAS_PAGAMENTO')
    Left = 72
    Top = 344
    object QFormasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO'
      Required = True
    end
    object QFormasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMAS_PAGAMENTO.DESCRICAO'
      Required = True
    end
    object QFormasUSA_TEF: TStringField
      FieldName = 'USA_TEF'
      Origin = 'FORMAS_PAGAMENTO.USA_TEF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasABRE_GAVETA: TStringField
      FieldName = 'ABRE_GAVETA'
      Origin = 'FORMAS_PAGAMENTO.ABRE_GAVETA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasUSAR_CONTAS_RECEBER: TStringField
      FieldName = 'USAR_CONTAS_RECEBER'
      Origin = 'FORMAS_PAGAMENTO.USAR_CONTAS_RECEBER'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasUSAR_CONTAS_PAGAR: TStringField
      FieldName = 'USAR_CONTAS_PAGAR'
      Origin = 'FORMAS_PAGAMENTO.USAR_CONTAS_PAGAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'FORMAS_PAGAMENTO.TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QFormasTABELA_PRECO: TIntegerField
      FieldName = 'TABELA_PRECO'
      Origin = 'FORMAS_PAGAMENTO.TABELA_PRECO'
      Required = True
    end
    object QFormasCONCEDER_DESCONTO: TStringField
      FieldName = 'CONCEDER_DESCONTO'
      Origin = 'FORMAS_PAGAMENTO.CONCEDER_DESCONTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasCODIGO_CONTA_VENDAS: TIntegerField
      FieldName = 'CODIGO_CONTA_VENDAS'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_VENDAS'
    end
    object QFormasCODIGO_CENTRO_CUSTO_VENDAS: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_VENDAS'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CENTRO_CUSTO_VENDAS'
    end
    object QFormasUSAR_PAF_ECF: TStringField
      FieldName = 'USAR_PAF_ECF'
      Origin = 'FORMAS_PAGAMENTO.USAR_PAF_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFormasCODIGO_CONTA_CTR: TIntegerField
      FieldName = 'CODIGO_CONTA_CTR'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_CTR'
    end
    object QFormasCODIGO_CENTRO_CUSTO_CTR: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTR'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CENTRO_CUSTO_CTR'
    end
    object QFormasCODIGO_CONTA_CTP: TIntegerField
      FieldName = 'CODIGO_CONTA_CTP'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_CTP'
    end
    object QFormasCODIGO_CONTA_CTR_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_CTR_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_CTR_ESTORNO'
    end
    object QFormasCODIGO_CENTRO_CUSTO_CTR_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTR_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CENTRO_CUSTO_CTR_ESTORNO'
    end
    object QFormasCODIGO_CONTA_CTP_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_CTP_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_CTP_ESTORNO'
    end
    object QFormasCODIGO_CENTRO_CUSTO_CTP_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTP_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CENTRO_CUSTO_CTP_ESTORNO'
    end
    object QFormasCODIGO_CONTA_VEN_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_VEN_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CONTA_VEN_ESTORNO'
    end
    object QFormasCODIGO_CENTRO_CUSTO_VEN_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_VEN_ESTORNO'
      Origin = 'FORMAS_PAGAMENTO.CODIGO_CENTRO_CUSTO_VEN_ESTORNO'
    end
  end
  object DSFormas: TDataSource
    AutoEdit = False
    DataSet = QFormas
    Left = 72
    Top = 392
  end
  object QCentroCusto: TFDQuery
    OnCalcFields = QCentroCustoCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CENTRO_CUSTO')
    Left = 128
    Top = 344
    object QCentroCustoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CENTRO_CUSTO.CODIGO'
      Required = True
    end
    object QCentroCustoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CENTRO_CUSTO.DESCRICAO'
      Required = True
      Size = 60
    end
    object QCentroCustoCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CENTRO_CUSTO.CONTA'
      Required = True
      EditMask = '9.99.999;0;_'
      Size = 6
    end
    object QCentroCustoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'CENTRO_CUSTO.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCentroCustoRECEITA_DESPESA: TStringField
      FieldName = 'RECEITA_DESPESA'
      Origin = 'CENTRO_CUSTO.RECEITA_DESPESA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCentroCustoDEBCRED: TIntegerField
      FieldName = 'DEBCRED'
      Origin = 'CENTRO_CUSTO.DEBCRED'
      Required = True
    end
    object QCentroCustoCALC_RD: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_RD'
      Calculated = True
    end
  end
  object DSCentroCusto: TDataSource
    AutoEdit = False
    DataSet = QCentroCusto
    Left = 128
    Top = 392
  end
  object QClaCTR: TFDQuery
    OnCalcFields = QCentroCustoCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIFICACAO_CONTAS_RECEBER')
    Left = 184
    Top = 344
    object QClaCTRCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.CODIGO'
      Required = True
    end
    object QClaCTRDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSClaCTR: TDataSource
    AutoEdit = False
    DataSet = QClaCTR
    Left = 184
    Top = 392
  end
  object QLocaisEstoque: TFDQuery
    OnCalcFields = QCentroCustoCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM LOCAIS_ESTOQUE')
    Left = 240
    Top = 344
    object QLocaisEstoqueCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'LOCAIS_ESTOQUE.CODIGO'
      Required = True
    end
    object QLocaisEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'LOCAIS_ESTOQUE.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSLocaisEstoque: TDataSource
    AutoEdit = False
    DataSet = QLocaisEstoque
    Left = 240
    Top = 392
  end
  object QSetorEstoque: TFDQuery
    OnCalcFields = QCentroCustoCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT S.*, U.NOME_USU'
      'FROM SETORES_ESTOQUE S'
      'INNER JOIN USUARIO U'
      'ON (S.COD_USU = U.COD_USU)')
    Left = 296
    Top = 344
    object QSetorEstoqueCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SETORES_ESTOQUE.CODIGO'
      Required = True
    end
    object QSetorEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SETORES_ESTOQUE.DESCRICAO'
      Required = True
      Size = 60
    end
    object QSetorEstoqueCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'SETORES_ESTOQUE.COD_USU'
      Required = True
    end
    object QSetorEstoqueNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QSetorEstoqueDATA_INICIO_ESTOQUE: TDateField
      FieldName = 'DATA_INICIO_ESTOQUE'
      Origin = 'SETORES_ESTOQUE.DATA_INICIO_ESTOQUE'
    end
  end
  object DSSetorEstoque: TDataSource
    AutoEdit = False
    DataSet = QSetorEstoque
    Left = 296
    Top = 392
  end
  object QBandeira: TFDQuery
    OnCalcFields = QBandeiraCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT B.*, A.DESCRICAO ADMINISTRADORA'
      'FROM BANDEIRAS_CARTAO B'
      'INNER JOIN ADMINISTRADORA_CARTAO A'
      'ON (B.CODIGO_ADMINISTRADORA = A.CODIGO)'
      '')
    Left = 352
    Top = 344
    object QBandeiraCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BANDEIRAS_CARTAO.CODIGO'
      Required = True
    end
    object QBandeiraCODIGO_ADMINISTRADORA: TIntegerField
      FieldName = 'CODIGO_ADMINISTRADORA'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_ADMINISTRADORA'
      Required = True
    end
    object QBandeiraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QBandeiraATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'BANDEIRAS_CARTAO.ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBandeiraTAXA_CREDITO: TBCDField
      FieldName = 'TAXA_CREDITO'
      Origin = 'BANDEIRAS_CARTAO.TAXA_CREDITO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBandeiraTAXA_DEBITO: TBCDField
      FieldName = 'TAXA_DEBITO'
      Origin = 'BANDEIRAS_CARTAO.TAXA_DEBITO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBandeiraDIAS_CREDITO: TIntegerField
      FieldName = 'DIAS_CREDITO'
      Origin = 'BANDEIRAS_CARTAO.DIAS_CREDITO'
      Required = True
    end
    object QBandeiraDIAS_DEBITO: TIntegerField
      FieldName = 'DIAS_DEBITO'
      Origin = 'BANDEIRAS_CARTAO.DIAS_DEBITO'
      Required = True
    end
    object QBandeiraTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Origin = 'BANDEIRAS_CARTAO.TIPO_CARTAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBandeiraADMINISTRADORA: TStringField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QBandeiraCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Calculated = True
    end
    object QBandeiraCODIGO_TEF: TStringField
      FieldName = 'CODIGO_TEF'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_TEF'
      Required = True
      Size = 10
    end
  end
  object DSBandeira: TDataSource
    AutoEdit = False
    DataSet = QBandeira
    Left = 352
    Top = 392
  end
  object QBuscaItensNF: TFDQuery
    OnCalcFields = QBuscaItensNFCalcFields
    Connection = IBDatabase
    Transaction = IBTRAux
    SQL.Strings = (
      'SELECT I.*, TS.descricao NOME_GRP,'
      'TS.TIPO_GRP,'
      'CF.DESTACA_ICMS,'
      'CF.USA_CSOSN,'
      'P.NOME_PRO,'
      'P.COD_NCM,'
      'TS.origem_prod ORIG,'
      'TS.cst_pis CST_PIS,'
      'TS.cst_cofins CST_COFINS,'
      'P.CODIGO_BARRA_PRO,'
      'P.DESC_CUPOM,'
      'NCM.nacional ALIQ_IBPT_NAC,'
      'P.CEST'
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'LEFT OUTER join TRIBUTACOES_NCMS_SAIDA TS'
      'ON ( TS.ncm = P.cod_ncm and TS.ex = p.ncm_ex and ts.uf=:UF )'
      'left outer join NCM'
      
        'on( NCM.cod_emp = I.cod_emp and NCM.ncm = P.cod_ncm and NCM.ex =' +
        ' P.ncm_ex )'
      'WHERE I.COD_NF = :CODNF'
      'ORDER BY I.ORDEM')
    Left = 680
    Top = 56
    ParamData = <
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CODNF'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensNFORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'COD_NF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensNFCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensNFALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ALIQ'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QBuscaItensNFCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      Required = True
    end
    object QBuscaItensNFQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensNFALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'COD_CFO'
      Required = True
    end
    object QBuscaItensNFSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object QBuscaItensNFCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QBuscaItensNFVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensNFISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'FRETE'
    end
    object QBuscaItensNFDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object QBuscaItensNFBC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = 'BC_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = 'BC_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
    end
    object QBuscaItensNFNF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = 'NF_CANCELADA'
    end
    object QBuscaItensNFCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QBuscaItensNFCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QBuscaItensNFCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object QBuscaItensNFCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object QBuscaItensNFNOME_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QBuscaItensNFTIPO_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_GRP'
      Origin = 'TIPO_GRP'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object QBuscaItensNFDESTACA_ICMS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTACA_ICMS'
      Origin = 'DESTACA_ICMS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFUSA_CSOSN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USA_CSOSN'
      Origin = 'USA_CSOSN'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensNFCOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object QBuscaItensNFORIG: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ORIG'
      Origin = 'ORIGEM_PROD'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensNFCST_PIS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS_1'
      Origin = 'CST_PIS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensNFCST_COFINS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS_1'
      Origin = 'CST_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensNFCODIGO_BARRA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QBuscaItensNFDESC_CUPOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensNFALIQ_IBPT_NAC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = 'NACIONAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      Calculated = True
    end
    object QBuscaItensNFCEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEST'
      Origin = 'CEST'
      ProviderFlags = []
      ReadOnly = True
      Size = 7
    end
  end
  object QNF: TFDQuery
    Connection = IBDatabase
    Transaction = IBTRAux
    SQL.Strings = (
      'SELECT *'
      'FROM NOTA_FISCAL'
      'WHERE COD_NF = :CODNF')
    Left = 680
    Top = 8
    ParamData = <
      item
        Name = 'CODNF'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'NOTA_FISCAL.COD_NF'
      Required = True
    end
    object QNFCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'NOTA_FISCAL.COD_EMP'
      Required = True
    end
    object QNFNUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = 'NOTA_FISCAL.NUMERO_NOTA_NF'
      Required = True
    end
    object QNFDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'NOTA_FISCAL.DATA_EMISSAO_NF'
      Required = True
    end
    object QNFDATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = 'NOTA_FISCAL.DATA_SAIDA_NF'
    end
    object QNFHORA_SAIDA_NF: TTimeField
      FieldName = 'HORA_SAIDA_NF'
      Origin = 'NOTA_FISCAL.HORA_SAIDA_NF'
    end
    object QNFCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = 'NOTA_FISCAL.COD_TRA'
      Required = True
    end
    object QNFBASE_CALCULO_ICMS_NF: TBCDField
      FieldName = 'BASE_CALCULO_ICMS_NF'
      Origin = 'NOTA_FISCAL.BASE_CALCULO_ICMS_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_ICMS_NF: TBCDField
      FieldName = 'VALOR_ICMS_NF'
      Origin = 'NOTA_FISCAL.VALOR_ICMS_NF'
      Precision = 18
      Size = 2
    end
    object QNFBASE_SUBST_NF: TBCDField
      FieldName = 'BASE_SUBST_NF'
      Origin = 'NOTA_FISCAL.BASE_SUBST_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_SUBST_NF: TBCDField
      FieldName = 'VALOR_SUBST_NF'
      Origin = 'NOTA_FISCAL.VALOR_SUBST_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_TOTAL_PROD_NF: TBCDField
      FieldName = 'VALOR_TOTAL_PROD_NF'
      Origin = 'NOTA_FISCAL.VALOR_TOTAL_PROD_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_FRETE_NF: TBCDField
      FieldName = 'VALOR_FRETE_NF'
      Origin = 'NOTA_FISCAL.VALOR_FRETE_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_SEGURO_NF: TBCDField
      FieldName = 'VALOR_SEGURO_NF'
      Origin = 'NOTA_FISCAL.VALOR_SEGURO_NF'
      Precision = 18
      Size = 2
    end
    object QNFOUTRAS_DESPESAS_NF: TBCDField
      FieldName = 'OUTRAS_DESPESAS_NF'
      Origin = 'NOTA_FISCAL.OUTRAS_DESPESAS_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_IPI_NF: TBCDField
      FieldName = 'VALOR_IPI_NF'
      Origin = 'NOTA_FISCAL.VALOR_IPI_NF'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = 'NOTA_FISCAL.VALOR_TOTAL_NF'
      Precision = 18
      Size = 2
    end
    object QNFESPECIE_NF: TStringField
      FieldName = 'ESPECIE_NF'
      Origin = 'NOTA_FISCAL.ESPECIE_NF'
      Size = 10
    end
    object QNFMARCA_NF: TStringField
      FieldName = 'MARCA_NF'
      Origin = 'NOTA_FISCAL.MARCA_NF'
      Size = 10
    end
    object QNFNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = 'NOTA_FISCAL.NUMERO_NF'
      Size = 10
    end
    object QNFINF_COMPL_NF: TMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = 'NOTA_FISCAL.INF_COMPL_NF'
      BlobType = ftMemo
      Size = 8
    end
    object QNFCANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = 'NOTA_FISCAL.CANCELADA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QNFFRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = 'NOTA_FISCAL.FRETE_CONTA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QNFCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'NOTA_FISCAL.COD_CLI'
    end
    object QNFCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'NOTA_FISCAL.COD_FOR'
    end
    object QNFDESCONTO_NF: TBCDField
      FieldName = 'DESCONTO_NF'
      Origin = 'NOTA_FISCAL.DESCONTO_NF'
      Precision = 18
      Size = 2
    end
    object QNFTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'NOTA_FISCAL.TIPO_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QNFNOTA_IMPRESSA: TStringField
      FieldName = 'NOTA_IMPRESSA'
      Origin = 'NOTA_FISCAL.NOTA_IMPRESSA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QNFCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'NOTA_FISCAL.COD_VENDA'
    end
    object QNFCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'NOTA_FISCAL.COD_TPV'
      Required = True
    end
    object QNFSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'NOTA_FISCAL.SERIE_NOTA'
      Size = 3
    end
    object QNFTIPO_NOTA_FISCAL: TIntegerField
      FieldName = 'TIPO_NOTA_FISCAL'
      Origin = 'NOTA_FISCAL.TIPO_NOTA_FISCAL'
      Required = True
    end
    object QNFCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'NOTA_FISCAL.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QNFCODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_ENTRADA'
    end
    object QNFCODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_SAIDA'
    end
    object QNFCHAVE_ACESSO_NFE: TStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = 'NOTA_FISCAL.CHAVE_ACESSO_NFE'
      Size = 44
    end
    object QNFPROTOCOLO_NFE: TStringField
      FieldName = 'PROTOCOLO_NFE'
      Origin = 'NOTA_FISCAL.PROTOCOLO_NFE'
      Size = 50
    end
    object QNFSTATUS_TRANSMITIDA: TStringField
      FieldName = 'STATUS_TRANSMITIDA'
      Origin = 'NOTA_FISCAL.STATUS_TRANSMITIDA'
      FixedChar = True
      Size = 1
    end
    object QNFSTATUS_RETORNO: TStringField
      FieldName = 'STATUS_RETORNO'
      Origin = 'NOTA_FISCAL.STATUS_RETORNO'
      FixedChar = True
      Size = 1
    end
    object QNFSTATUS_CANCELADO: TStringField
      FieldName = 'STATUS_CANCELADO'
      Origin = 'NOTA_FISCAL.STATUS_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object QNFSTATUS_INUTILIZADO: TStringField
      FieldName = 'STATUS_INUTILIZADO'
      Origin = 'NOTA_FISCAL.STATUS_INUTILIZADO'
      FixedChar = True
      Size = 1
    end
    object QNFSTATUS_EMAIL: TStringField
      FieldName = 'STATUS_EMAIL'
      Origin = 'NOTA_FISCAL.STATUS_EMAIL'
      FixedChar = True
      Size = 1
    end
    object QNFJUSTIFICATIVA_CANCEL_INUTIL: TStringField
      FieldName = 'JUSTIFICATIVA_CANCEL_INUTIL'
      Origin = 'NOTA_FISCAL.JUSTIFICATIVA_CANCEL_INUTIL'
      Size = 100
    end
    object QNFPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NOTA_FISCAL.PLACA_TRANSP'
      FixedChar = True
      Size = 8
    end
    object QNFUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NOTA_FISCAL.UF_PLACA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object QNFPESO_BRUTO_NF: TBCDField
      FieldName = 'PESO_BRUTO_NF'
      Origin = 'NOTA_FISCAL.PESO_BRUTO_NF'
      Precision = 18
      Size = 2
    end
    object QNFPESO_LIQUIDO_NF: TBCDField
      FieldName = 'PESO_LIQUIDO_NF'
      Origin = 'NOTA_FISCAL.PESO_LIQUIDO_NF'
      Precision = 18
      Size = 2
    end
    object QNFQUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = 'NOTA_FISCAL.QUANTIDADE_NF'
    end
    object QNFCHAVE2: TStringField
      FieldName = 'CHAVE2'
      Origin = '"NOTA_FISCAL"."CHAVE2"'
      Size = 255
    end
    object QNFDEPEC: TIntegerField
      FieldName = 'DEPEC'
      Origin = '"NOTA_FISCAL"."DEPEC"'
    end
    object QNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object QNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object QNFCORRECAO: TStringField
      FieldName = 'CORRECAO'
      Origin = 'CORRECAO'
      Size = 1
    end
    object QNFPAF_ECF: TStringField
      FieldName = 'PAF_ECF'
      Origin = 'PAF_ECF'
      Size = 1
    end
    object QNFCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'COD_VEND'
    end
    object QNFCHAVE_NFE_ESTORNO: TStringField
      FieldName = 'CHAVE_NFE_ESTORNO'
      Origin = 'CHAVE_NFE_ESTORNO'
      Size = 200
    end
    object QNFINFO_ESTORNO: TStringField
      FieldName = 'INFO_ESTORNO'
      Origin = 'INFO_ESTORNO'
      Size = 255
    end
  end
  object RDprintNF: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.MostrarSETUP = True
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Nota Fiscal'
    OpcoesPreview.PreviewZoom = -1
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'CARLOS JORGE MARTINS DOS SANTOS JUNIOR'
    RegistroUsuario.SerieProduto = 'SINGLE 6.1 - 1651/0616 (DX101)'
    RegistroUsuario.AutorizacaoKey = 'C0H3Y-SZPXG-TEWNN-69VHR-SXMQ3-5GWHT-6K59B'
    About = 'RDprint 6.1'
    Acentuacao = Transliterate
    CaptionSetup = 'Central de Compras Cricare'
    TitulodoRelatorio = 'Nota Fiscal'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 88
    TamanhoQteColunas = 140
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    Left = 680
    Top = 104
  end
  object ACBrNFe1: TACBrNFe
    OnStatusChange = ACBrNFe1StatusChange
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.IncluirQRCodeXMLNFCe = False
    Configuracoes.Arquivos.AdicionarLiteral = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.EmissaoPathNFe = True
    Configuracoes.Arquivos.PathNFe = 'C:\Des\ComercioSuper\NFe\Enviadas'
    Configuracoes.Arquivos.PathInu = 'C:\Des\ComercioSuper\NFe\Inutilizadas'
    Configuracoes.WebServices.UF = 'ES'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFEFR1
    Left = 683
    Top = 161
  end
  object QMunicipio: TFDQuery
    OnCalcFields = QBandeiraCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM MUNICIPIOS'
      '')
    Left = 408
    Top = 344
    object QMunicipioCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'MUNICIPIOS.CODIGO_MUNICIPIO'
      Required = True
    end
    object QMunicipioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MUNICIPIOS.DESCRICAO'
      Required = True
      Size = 80
    end
    object QMunicipioUF: TStringField
      FieldName = 'UF'
      Origin = 'MUNICIPIOS.UF'
      FixedChar = True
      Size = 2
    end
  end
  object DSMunicipio: TDataSource
    AutoEdit = False
    DataSet = QMunicipio
    Left = 408
    Top = 392
  end
  object Limpa: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'UPDATE NOTA_FISCAL SET STATUS_TRANSMITIDA = '#39#39', STATUS_RETORNO='#39 +
        #39', CHAVE2='#39#39' WHERE COD_NF = :CODNF')
    Left = 688
    Top = 264
    ParamData = <
      item
        Name = 'CODNF'
      end>
  end
  object QSacado: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from BOLETOS_SACADO')
    Left = 24
    Top = 440
    object QSacadoCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"BOLETOS_SACADO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSacadoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"BOLETOS_SACADO"."COD_EMP"'
    end
    object QSacadoBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = '"BOLETOS_SACADO"."BANCO"'
    end
    object QSacadoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = '"BOLETOS_SACADO"."AGENCIA"'
      Size = 30
    end
    object QSacadoAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      Origin = '"BOLETOS_SACADO"."AGENCIA_DIGITO"'
      Size = 10
    end
    object QSacadoCODIGO_CEDENTE: TStringField
      FieldName = 'CODIGO_CEDENTE'
      Origin = '"BOLETOS_SACADO"."CODIGO_CEDENTE"'
      Size = 30
    end
    object QSacadoCONTA: TStringField
      FieldName = 'CONTA'
      Origin = '"BOLETOS_SACADO"."CONTA"'
      Size = 30
    end
    object QSacadoCONTA_DIGITO: TStringField
      FieldName = 'CONTA_DIGITO'
      Origin = '"BOLETOS_SACADO"."CONTA_DIGITO"'
      Size = 10
    end
    object QSacadoMENSAGEM_PAGAMENTO: TStringField
      FieldName = 'MENSAGEM_PAGAMENTO'
      Origin = '"BOLETOS_SACADO"."MENSAGEM_PAGAMENTO"'
      Size = 200
    end
    object QSacadoINSTRUCOES_DE_PAGAMENTO: TStringField
      FieldName = 'INSTRUCOES_DE_PAGAMENTO'
      Origin = '"BOLETOS_SACADO"."INSTRUCOES_DE_PAGAMENTO"'
      Size = 255
    end
    object QSacadoMULTA_ATRASO: TBCDField
      FieldName = 'MULTA_ATRASO'
      Origin = '"BOLETOS_SACADO"."MULTA_ATRASO"'
      Precision = 18
      Size = 3
    end
    object QSacadoVALOR_DIA_ATRASO: TBCDField
      FieldName = 'VALOR_DIA_ATRASO'
      Origin = '"BOLETOS_SACADO"."VALOR_DIA_ATRASO"'
      Precision = 18
      Size = 3
    end
    object QSacadoESPECIE_DOC: TStringField
      FieldName = 'ESPECIE_DOC'
      Origin = '"BOLETOS_SACADO"."ESPECIE_DOC"'
      Size = 5
    end
    object QSacadoESPECIE_MOEDA: TStringField
      FieldName = 'ESPECIE_MOEDA'
      Origin = '"BOLETOS_SACADO"."ESPECIE_MOEDA"'
      Size = 2
    end
    object QSacadoACEITE: TStringField
      FieldName = 'ACEITE'
      Origin = '"BOLETOS_SACADO"."ACEITE"'
      Size = 1
    end
    object QSacadoCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = '"BOLETOS_SACADO"."CARTEIRA"'
      Size = 5
    end
    object QSacadoNOSSO_NUMERO: TIntegerField
      FieldName = 'NOSSO_NUMERO'
      Origin = '"BOLETOS_SACADO"."NOSSO_NUMERO"'
    end
    object QSacadoSACADO_NOME: TStringField
      FieldName = 'SACADO_NOME'
      Origin = '"BOLETOS_SACADO"."SACADO_NOME"'
      Size = 60
    end
    object QSacadoSACADO_CNPJ: TStringField
      FieldName = 'SACADO_CNPJ'
      Origin = '"BOLETOS_SACADO"."SACADO_CNPJ"'
    end
    object QSacadoSACADO_ENDERECO: TStringField
      FieldName = 'SACADO_ENDERECO'
      Origin = '"BOLETOS_SACADO"."SACADO_ENDERECO"'
      Size = 100
    end
    object QSacadoSACADO_NUMERO: TStringField
      FieldName = 'SACADO_NUMERO'
      Origin = '"BOLETOS_SACADO"."SACADO_NUMERO"'
      Size = 15
    end
    object QSacadoSACADO_BAIRRO: TStringField
      FieldName = 'SACADO_BAIRRO'
      Origin = '"BOLETOS_SACADO"."SACADO_BAIRRO"'
      Size = 50
    end
    object QSacadoSACADO_CIDADE: TStringField
      FieldName = 'SACADO_CIDADE'
      Origin = '"BOLETOS_SACADO"."SACADO_CIDADE"'
      Size = 50
    end
    object QSacadoSACADO_UF: TStringField
      FieldName = 'SACADO_UF'
      Origin = '"BOLETOS_SACADO"."SACADO_UF"'
      Size = 2
    end
    object QSacadoSACADO_CEP: TStringField
      FieldName = 'SACADO_CEP'
      Origin = '"BOLETOS_SACADO"."SACADO_CEP"'
      Size = 10
    end
    object QSacadoTIPO_IMPRESSAO: TIntegerField
      FieldName = 'TIPO_IMPRESSAO'
      Origin = '"BOLETOS_SACADO"."TIPO_IMPRESSAO"'
    end
    object QSacadoTIPO_REMESSA: TIntegerField
      FieldName = 'TIPO_REMESSA'
      Origin = '"BOLETOS_SACADO"."TIPO_REMESSA"'
    end
    object QSacadoDIAS_PROTESTO: TIntegerField
      FieldName = 'DIAS_PROTESTO'
      Origin = '"BOLETOS_SACADO"."DIAS_PROTESTO"'
    end
    object QSacadoNUMERO_REMESSA: TIntegerField
      FieldName = 'NUMERO_REMESSA'
      Origin = '"BOLETOS_SACADO"."NUMERO_REMESSA"'
    end
    object QSacadoCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Origin = '"BOLETOS_SACADO"."CONVENIO"'
      Size = 30
    end
  end
  object DSSacado: TDataSource
    DataSet = QSacado
    Left = 73
    Top = 440
  end
  object Boleto: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Cedente.TipoInscricao = pJuridica
    NumeroArquivo = 0
    ACBrBoletoFC = BoletoImprime
    Left = 688
    Top = 328
  end
  object BoletoImprime: TACBrBoletoFCFR
    ACBrBoleto = Boleto
    ModoThread = False
    IncorporarBackgroundPdf = False
    IncorporarFontesPdf = False
    Left = 688
    Top = 384
  end
  object QCFOP_Tributacoes: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'select * from CFOP_TRIBUTACOES where COD_CFOP=:COD_CFOP and COD_' +
        'EMP=:COD_EMP')
    Left = 688
    Top = 432
    ParamData = <
      item
        Name = 'COD_CFOP'
      end
      item
        Name = 'COD_EMP'
      end>
    object QCFOP_TributacoesCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"CFOP_TRIBUTACOES"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCFOP_TributacoesCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = '"CFOP_TRIBUTACOES"."COD_CFOP"'
    end
    object QCFOP_TributacoesORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = '"CFOP_TRIBUTACOES"."ORIGEM"'
      Size = 1
    end
    object QCFOP_TributacoesICMS_DENTRO: TIntegerField
      FieldName = 'ICMS_DENTRO'
      Origin = '"CFOP_TRIBUTACOES"."ICMS_DENTRO"'
    end
    object QCFOP_TributacoesCST_DENTRO: TStringField
      FieldName = 'CST_DENTRO'
      Origin = '"CFOP_TRIBUTACOES"."CST_DENTRO"'
      Size = 2
    end
    object QCFOP_TributacoesIPI_DENTRO: TFloatField
      FieldName = 'IPI_DENTRO'
      Origin = '"CFOP_TRIBUTACOES"."IPI_DENTRO"'
    end
    object QCFOP_TributacoesREDU_ICMS_DENTRO: TFloatField
      FieldName = 'REDU_ICMS_DENTRO'
      Origin = '"CFOP_TRIBUTACOES"."REDU_ICMS_DENTRO"'
    end
    object QCFOP_TributacoesTEM_SUBSTITUICAO: TStringField
      FieldName = 'TEM_SUBSTITUICAO'
      Origin = '"CFOP_TRIBUTACOES"."TEM_SUBSTITUICAO"'
      Size = 1
    end
    object QCFOP_TributacoesAGREG_DENTRO: TFloatField
      FieldName = 'AGREG_DENTRO'
      Origin = '"CFOP_TRIBUTACOES"."AGREG_DENTRO"'
    end
    object QCFOP_TributacoesICMS_FORA: TIntegerField
      FieldName = 'ICMS_FORA'
      Origin = '"CFOP_TRIBUTACOES"."ICMS_FORA"'
    end
    object QCFOP_TributacoesCST_FORA: TStringField
      FieldName = 'CST_FORA'
      Origin = '"CFOP_TRIBUTACOES"."CST_FORA"'
      Size = 2
    end
    object QCFOP_TributacoesIPI_FORA: TFloatField
      FieldName = 'IPI_FORA'
      Origin = '"CFOP_TRIBUTACOES"."IPI_FORA"'
    end
    object QCFOP_TributacoesREDU_ICMS_FORA: TFloatField
      FieldName = 'REDU_ICMS_FORA'
      Origin = '"CFOP_TRIBUTACOES"."REDU_ICMS_FORA"'
    end
    object QCFOP_TributacoesCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"CFOP_TRIBUTACOES"."CST_IPI"'
      Size = 2
    end
    object QCFOP_TributacoesCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"CFOP_TRIBUTACOES"."CSOSN"'
      Size = 3
    end
    object QCFOP_TributacoesCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"CFOP_TRIBUTACOES"."CST_PIS"'
      Size = 2
    end
    object QCFOP_TributacoesCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"CFOP_TRIBUTACOES"."CST_COFINS"'
      Size = 2
    end
    object QCFOP_TributacoesISENTO_PIS_COFINS: TStringField
      FieldName = 'ISENTO_PIS_COFINS'
      Origin = '"CFOP_TRIBUTACOES"."ISENTO_PIS_COFINS"'
      Size = 1
    end
    object QCFOP_TributacoesPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"CFOP_TRIBUTACOES"."PIS"'
    end
    object QCFOP_TributacoesCOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = '"CFOP_TRIBUTACOES"."COFINS"'
    end
    object QCFOP_TributacoesIR: TFloatField
      FieldName = 'IR'
      Origin = '"CFOP_TRIBUTACOES"."IR"'
    end
    object QCFOP_TributacoesCONT_SOCIAL: TFloatField
      FieldName = 'CONT_SOCIAL'
      Origin = '"CFOP_TRIBUTACOES"."CONT_SOCIAL"'
    end
    object QCFOP_TributacoesOUTRAS: TFloatField
      FieldName = 'OUTRAS'
      Origin = '"CFOP_TRIBUTACOES"."OUTRAS"'
    end
    object QCFOP_TributacoesCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"CFOP_TRIBUTACOES"."COD_EMP"'
    end
  end
  object QRegiao: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from regiao')
    Left = 128
    Top = 440
    object QRegiaoCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"REGIAO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRegiaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"REGIAO"."DESCRICAO"'
      Size = 100
    end
  end
  object dsRegiao: TDataSource
    DataSet = QRegiao
    Left = 184
    Top = 440
  end
  object QNotasManifesto: TFDQuery
    Connection = IBDatabase
    Transaction = IBTRAux
    SQL.Strings = (
      'select * from NOTAS_MANIFESTACAO')
    Left = 488
    Top = 440
    object QNotasManifestoCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"NOTAS_MANIFESTACAO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNotasManifestoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"NOTAS_MANIFESTACAO"."COD_EMP"'
      Required = True
    end
    object QNotasManifestoCHAVE_NOTA: TStringField
      FieldName = 'CHAVE_NOTA'
      Origin = '"NOTAS_MANIFESTACAO"."CHAVE_NOTA"'
      Size = 100
    end
    object QNotasManifestoDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = '"NOTAS_MANIFESTACAO"."DATA_ENTRADA"'
    end
    object QNotasManifestoEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = '"NOTAS_MANIFESTACAO"."EMITENTE"'
      Size = 100
    end
    object QNotasManifestoCNPJ_EMI: TStringField
      FieldName = 'CNPJ_EMI'
      Origin = '"NOTAS_MANIFESTACAO"."CNPJ_EMI"'
    end
    object QNotasManifestoIE_EMI: TStringField
      FieldName = 'IE_EMI'
      Origin = '"NOTAS_MANIFESTACAO"."IE_EMI"'
    end
    object QNotasManifestoVALOR_NF: TBCDField
      FieldName = 'VALOR_NF'
      Origin = '"NOTAS_MANIFESTACAO"."VALOR_NF"'
      Precision = 18
      Size = 2
    end
    object QNotasManifestoTIPO_NF: TStringField
      FieldName = 'TIPO_NF'
      Origin = '"NOTAS_MANIFESTACAO"."TIPO_NF"'
      Size = 50
    end
    object QNotasManifestoSIT_NF: TStringField
      FieldName = 'SIT_NF'
      Origin = '"NOTAS_MANIFESTACAO"."SIT_NF"'
      Size = 50
    end
    object QNotasManifestoSIT_CONF: TStringField
      FieldName = 'SIT_CONF'
      Origin = '"NOTAS_MANIFESTACAO"."SIT_CONF"'
      Required = True
      Size = 50
    end
  end
  object upNotasManifesto: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into NOTAS_MANIFESTACAO'
      
        '  (CHAVE_NOTA, CNPJ_EMI, COD, COD_EMP, DATA_ENTRADA, EMITENTE, I' +
        'E_EMI, '
      '   SIT_CONF, SIT_NF, TIPO_NF, VALOR_NF)'
      'values'
      
        '  (:CHAVE_NOTA, :CNPJ_EMI, :COD, :COD_EMP, :DATA_ENTRADA, :EMITE' +
        'NTE, :IE_EMI, '
      '   :SIT_CONF, :SIT_NF, :TIPO_NF, :VALOR_NF)')
    ModifySQL.Strings = (
      'update NOTAS_MANIFESTACAO'
      'set'
      '  CHAVE_NOTA = :CHAVE_NOTA,'
      '  CNPJ_EMI = :CNPJ_EMI,'
      '  COD = :COD,'
      '  COD_EMP = :COD_EMP,'
      '  DATA_ENTRADA = :DATA_ENTRADA,'
      '  EMITENTE = :EMITENTE,'
      '  IE_EMI = :IE_EMI,'
      '  SIT_CONF = :SIT_CONF,'
      '  SIT_NF = :SIT_NF,'
      '  TIPO_NF = :TIPO_NF,'
      '  VALOR_NF = :VALOR_NF'
      'where'
      '  COD = :OLD_COD and'
      '  COD_EMP = :OLD_COD_EMP')
    DeleteSQL.Strings = (
      'delete from NOTAS_MANIFESTACAO'
      'where'
      '  COD = :OLD_COD and'
      '  COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      'Select '
      '  COD,'
      '  COD_EMP,'
      '  CHAVE_NOTA,'
      '  DATA_ENTRADA,'
      '  EMITENTE,'
      '  CNPJ_EMI,'
      '  IE_EMI,'
      '  VALOR_NF,'
      '  TIPO_NF,'
      '  SIT_NF,'
      '  SIT_CONF'
      'from NOTAS_MANIFESTACAO '
      'where'
      '  COD = :COD and'
      '  COD_EMP = :COD_EMP')
    Left = 568
    Top = 448
  end
  object QTeclas: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from GRUPO_TECLAS')
    Left = 464
    Top = 344
    object QTeclasTECLA: TStringField
      FieldName = 'TECLA'
      Origin = '"GRUPO_TECLAS"."TECLA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTeclasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPO_TECLAS"."DESCRICAO"'
      Size = 30
    end
  end
  object DSTeclas: TDataSource
    DataSet = QTeclas
    Left = 360
    Top = 232
  end
  object Sintegra: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 568
    Top = 392
  end
  object Alerts: TdxAlertWindowManager
    LookAndFeel.SkinName = 'MetropolisDark'
    OptionsAnimate.AlphaBlendValue = 250
    OptionsAnimate.HidingAnimation = awaSlide
    OptionsAnimate.HidingAnimationTime = 300
    OptionsAnimate.HotTrackFadeInTime = 200
    OptionsAnimate.ShowingAnimation = awaSlide
    OptionsAnimate.ShowingAnimationTime = 300
    OptionsBehavior.DisplayTime = 4000
    OptionsButtons.Buttons = <>
    OptionsCaptionButtons.CaptionButtons = [awcbClose]
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWhite
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Segoe UI'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Images = ImagensGerais
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -15
    OptionsMessage.Text.Font.Name = 'Segoe UI'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Segoe UI'
    OptionsNavigationPanel.Font.Style = []
    OptionsSize.AutoHeight = True
    OptionsSize.AutoWidth = True
    OptionsSize.AutoSizeAdjustment = True
    OptionsSize.Height = 500
    OptionsSize.Width = 300
    WindowPosition = awpBottomRight
    Left = 336
    Top = 464
    PixelsPerInch = 96
  end
  object ImagensGerais: TcxImageList
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 30409128
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000002020D0F0E0E4C5A1818839C2020ACCC2424C5EC2727D3FC2727D3FC2424
          C5EC2020AACC1818839B0E0E4C5A02020C0F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060620261919
          859E2727CFF62828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2626CEF61919859E06062025000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000202080A1616778D2626D3FA2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2626D3FA1616758C0101
          0809000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000006061F252020B3D42828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2020
          B2D306061F240000000000000000000000000000000000000000000000000000
          0000000000000000000008082A322525C5EB2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2525C5EB0808293100000000000000000000000000000000000000000000
          00000000000006061F252525C5EB2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2525C5EA06061F24000000000000000000000000000000000000
          00000202080A2020B3D42828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2020B2D3010108090000000000000000000000000000
          00001616778D2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF1616758C0000000000000000000000000606
          20262626D3FB2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2626D3FA0606202500000000000000001919
          869E2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF1919859E0000000002020D0F2727
          CFF62828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2626CEF602020C0F0E0E4C5B2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF0E0E4C5A1818849C2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF1818839B2020ACCC2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2020AACB2424C7EC2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2424C5EC2727D3FC2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2727D3FC2727D3FC2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2727D3FC2424C7EC2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2424C5EC1F1FADCD2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2020ACCC1818849C2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF1818839C0E0E4D5B2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF0E0E4C5A02020D102727
          CFF62828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2727CFF602020D0F000000001919
          859F2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF1919859E00000000000000000606
          21272626D3FB2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2626D3FA0606202600000000000000000000
          00001616778E2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF1616778D0000000000000000000000000000
          00000202080A2121B3D52828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF8787DFFFE6E6E6FFE6E6E6FF8787
          DFFF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2020B3D40202080A0000000000000000000000000000
          000000000000060620262525C6EB2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2525C5EB06061F25000000000000000000000000000000000000
          0000000000000000000008082A322525C6EB2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2525C5EB08082A3100000000000000000000000000000000000000000000
          0000000000000000000000000000060620262121B3D52828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2020
          B3D406061F250000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000202080A1616778E2626D3FB2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2626D3FB1616778D0202
          080A000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060621271919
          859F2727CFF62828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828D7FF2828
          D7FF2828D7FF2828D7FF2828D7FF2727CFF61919869E06062026000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000002020D100E0E4D5B1818849C1F1FADCD2424C7EC2727D3FC2727D3FC2424
          C7EC2020ACCC1818849C0E0E4C5B02020D0F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000D1E0D2B244E2272337231A63F8B3BCA429541D9429541D93D8A
          3CC9337231A6234D21700D1D0D2A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010301041D41
          1C5E408F3ED050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF418D3DCE1D3E1B5B01030104000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001227113941913FD350AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF408F3ED0112410350000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000010001234E22714DAD49FC50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF4FAA4BFB224A
          206C000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000100012B5D298850AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF295A27830000000000000000000000000000000000000000000000000000
          00000000000000000000244E227250AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF224A206C00000000000000000000000000000000000000000000
          0000000000001228113A4DAD49FC50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF4FAA4BFB11241035000000000000000000000000000000000000
          00000203010543913FD550AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF408F3ED0010301040000000000000000000000000000
          00001F441E6350AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF73DC94FF65C875FF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF1D3E1B5B0000000000000000000000000001
          000143913FD550AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF74DD95FF90FFCCFF8FFDC9FF65C875FF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF418D3DCE0000000000000000000000000F22
          0F3150AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF74DD95FF90FFCCFF90FFCCFF90FFCCFF8FFDC9FF65C875FF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF0D1D0D2A00000000000000002552
          237750AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF75DC95FF90FFCCFF90FFCCFF90FFCCFF90FFCCFF90FFCCFF8FFDC9FF65C8
          75FF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF234D217000000000000000003675
          33AC50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF74DC
          94FF90FFCCFF90FFCCFF8FFFCBFF6AD081FF7AE4A0FF90FFCCFF90FFCCFF8FFD
          C9FF65C875FF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF337231A60000000000000000418C
          3ECF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF74DC94FF90FF
          CCFF90FFCCFF8FFFCBFF69CF7FFF50AF4CFF51B04DFF7AE4A0FF90FFCCFF90FF
          CCFF8FFDC9FF65C875FF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF3D8A3CC900000000000000004697
          40DE50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF51AF4DFF76DF99FF90FF
          CCFF8FFFCBFF69CF7FFF50AF4CFF50AF4CFF50AF4CFF51B04DFF7AE3A0FF90FF
          CCFF90FFCCFF8FFDC9FF65C875FF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF429541D900000000000000004697
          40DE50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF51AF4DFF76DF
          99FF69CF7FFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF51B04DFF7AE3
          A0FF90FFCCFF90FFCCFF8FFDC9FF65C875FF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF429541D90000000000000000418C
          3ECF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF51B0
          4DFF7AE3A0FF90FFCCFF90FFCCFF8FFDC9FF65C875FF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF3F8B3BCA00000000000000003675
          33AC50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF51B04DFF7AE3A0FF90FFCCFF90FFCCFF8FFDC9FF65C875FF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF337231A600000000000000002652
          247850AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF51B04DFF7AE3A0FF90FFCCFF90FFCCFF8FFDC9FF65C875FF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF244E227200000000000000001022
          0F3250AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF51B04DFF7AE3A0FF90FFCCFF90FFCCFF8FFDC9FF5EC1
          68FF50AF4CFF50AF4CFF50AF4CFF50AF4CFF0D1E0D2B00000000000000000001
          000143943ED750AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF51B04DFF79E39FFF90FFCCFF7AE4A1FF51B0
          4DFF50AF4CFF50AF4CFF50AF4CFF408F3ED00000000000000000000000000000
          000020461E6650AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF51B04DFF6AD182FF51B04EFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF1D411C5E0000000000000000000000000000
          000002040206449340D850AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF41913FD3010301040000000000000000000000000000
          000000000000132B123E4DAE49FD50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF4DAD49FC12271139000000000000000000000000000000000000
          000000000000000000002552237750AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF234E227100000000000000000000000000000000000000000000
          00000000000000000000000100012C61298D50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF2B5D29880001000100000000000000000000000000000000000000000000
          000000000000000000000000000000010001255223774DAE49FD50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF4DAD49FC244E
          2272000100010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000132B123E449340D850AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF43913FD51228113A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020402062046
          1E66419340D650AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
          4CFF50AF4CFF50AF4CFF50AF4CFF43913FD51F441E6302030105000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000001000110220F3226522478367533AC418C3ECF469740DE469740DE418C
          3ECF367533AC255223770F220F31000100010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000010230F332E672D962E672D960F210F3110230F332E672D962E672D960F21
          0F3110220F322E672D962E672D9610220F3210220F322E672D962E672D961022
          0F320F220F312E672D962E672D9610230F330F220F312E672D962E672D961023
          0F330F210E302E672D962E672D9610240F340000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00001B3C1A5750AF4CFF50AF4CFF1A3919531B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          000002050207070F0716070F0716020502071B3C1A5750AF4CFF50AF4CFF1A39
          19531B3A195550AF4CFF50AF4CFF1B3A19551B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          0000000000000000000000000000000000001B3C1A5750AF4CFF50AF4CFF1A39
          19530B190B24224A206B224A206B0B180B241B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          000000000000000000000000000000000000152D14413B8438C03B8438C0142B
          133F000000000000000000000000000000001B3A195550AF4CFF50AF4CFF1B3A
          19551A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00000000000000000000193B176B122A114C0000000000000000000000000000
          0000000000000000000000000000000000000B190B24224A206B224A206B0B18
          0B241A3A195450AF4CFF50AF4CFF1B3B1A561A3A195450AF4CFF50AF4CFF1B3B
          1A561A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          000000000000193C186C3C8D38FE398936F8122A114C00000000000000000000
          0000000000000000000000000000010201030000000000000000000000000000
          00001A3A195450AF4CFF50AF4CFF1B3B1A5602050207070F0716070F07160205
          02071A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          0000000000001B411A763C8E38FF3C8E38FF398936F8122A114C000000000000
          00000000000000000000122B114E31752DD2060E061900000000000000000000
          00001A3A195450AF4CFF50AF4CFF1B3B1A560000000000000000000000000000
          00001A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          000000000000000000001B411A763C8E38FF3C8E38FF398936F8122A114C0000
          000000000000122B114D3B8B37F93C8E38FF33772FD8060E0619000000000000
          00001A3A195450AF4CFF50AF4CFF1B3B1A560000000000000000000000000000
          00001A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          00000000000000000000000000001B411A763C8E38FF3C8E38FF398936F8122A
          114C122B114D3A8A37F93C8E38FF3C8E38FF3C8E38FF33772FD8060E06190000
          00000B180B24224B206D224B206D0C190B250000000000000000000000000000
          00001A39195250AF4CFF50AF4CFF1C3D1A580000000000000000000000000000
          0000000000000000000000000000000000001C411A763C8E38FF3C8E38FF3989
          36F8398936F83C8E38FF3C8E38FF347A2FDC3C8E38FF3C8E38FF33772FD8060E
          0619000000000000000000000000000000000102010300000000000000000000
          0000142B133F3D843AC23D843AC2152E14430000000000000000000000000000
          000000000000000000000000000000000000000000001C411A763C8E38FF3C8E
          38FF3C8E38FF3C8E38FF1C411A750306020B2C6B29C03C8E38FF3C8E38FF3377
          2FD8060E06190000000000000000060D051831742ED0122B114D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001C411A753C8E
          38FF3C8E38FF1C411A7500000000000000000306020B2C6B29C03C8E38FF3C8E
          38FF33772FD8060E0619060D051832762FD63C8E38FF3B8B37F9122B114D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001C41
          1A751C411A75000000000000000000000000000000000306020B2C6B29C03C8E
          38FF3C8E38FF33772FD832762FD63C8E38FF3C8E38FF3C8E38FF3B8B37F9122B
          114D000000000000000002040107081408230000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000306020B2D6A
          2ABF3C8E38FF3C8E38FF3C8E38FF3C8E38FF347A2FDC3C8E38FF3C8E38FF3B8B
          37F9122B114D02040107296327B3153113580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000306
          020B2D6A2ABF3C8E38FF3C8E38FF2D6B2AC10306030B1B4119743C8E38FF3C8E
          38FF3B8B37F92F6D2BC63C8E38FF153113580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000306020B2D6A2ABF2D6B2AC10306030C00000000000000001B4019743C8E
          38FF3C8E38FF3C8E38FF3C8E38FF153113580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000306020B0306030C000000000000000000000000020401073176
          2FD53C8E38FF3C8E38FF3C8E38FF153113580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000002040107296327B33C8E
          38FF3C8E38FF3C8E38FF3C8E38FF153113580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B1B0B311A3E186F1A3E
          186F1A3E186F1A3E186F1A3E186F091508260000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000252521435D5C54A87D7C71E48B8A7CFB8383
          76EF69695FC03A39346804040408000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000707070D5F5E54AB8D8C7FFF827C6EFF746857FF6F614EFF7164
          53FF7D7465FF8C8A7DFF78776CDB1B1B18310000000000000000000000000000
          0000000000000000000000000000111110163E3D3B4F42413F5542413F554241
          3F5542413F5542413F5542413F5542413F5542413F5542413F5542413F554241
          3F55403F3D556F6E64C8898679FF6B5C49FF5E4934FF5E4934FF5E4934FF5E49
          34FF5E4934FF64513DFF817C6DFF858477F11B1B183100000000000000000000
          0000000000000000000035343244BEBAB3F3C7C3BDFFC7C3BDFFC7C3BDFFC7C3
          BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
          BDFFA7A49AFF8A887BFF665440FF5E4934FF5E4934FF5E4934FF5E4934FF5E49
          34FF5E4934FF5E4934FF5F4B36FF827C6DFF79786DDA04040408000000000000
          00000000000000000000ACA9A3D8E5E3DEFFF0EFEBFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFE7E6
          E1FF8F8E82FF726553FF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF5E49
          34FF5E4934FF5E4934FF5E4934FF64513DFF8C8A7DFF39393468000000000000
          00000000000000000000E3E1DDFEF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFC7C6
          BEFF8B887BFF604B36FF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF5E49
          34FF5E4934FF5E4934FF5E4934FF5E4934FF7D7565FF6A695EBF000000000000
          00000000000000000000F0EFEBFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFB0AF
          A5FF817A6BFF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF746552FF8070
          60FF817262FF817262FF807060FF624D39FF716553FF838276EF000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFA4A2
          97FF7E7667FF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FFAAA899FFBFBC
          B3FFC7C3BDFFC7C3BDFFC6C2BCFF776654FF6E614EFF8B8A7CFB000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFABA9
          9FFF837E6FFF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FFC7C3BDFF8172
          62FF5E4934FF5E4934FF5E4934FF5E4934FF746857FF7F7E71E5000000000000
          00000000000000000000F1F0ECFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFCAC9
          C2FF8C8B7EFF624F3BFF5E4934FF5E4934FF5E4934FF5E4934FFC7C3BDFF8172
          62FF5E4934FF5E4934FF5E4934FF5E4934FF817B6CFF5E5E54AB000000000000
          00000000000000000000F1F0ECFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFE9E7
          E3FF959488FF79705FFF5E4934FF5E4934FF5E4934FF5E4934FFC7C3BDFF8172
          62FF5E4934FF5E4934FF5E4934FF6A5A47FF8D8C7FFF28282449000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFC8C7BFFF8D8C7FFF6F614FFF5E4934FF5E4934FF5E4934FFC7C3BDFF8172
          62FF5E4934FF5E4934FF65523EFF888577FF636359B500000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFA7A59BFF8D8C7FFF79705FFF624F3BFF5E4934FFC6C2BCFF8070
          60FF5F4B36FF706351FF8A877AFF727067CE0A0A091200000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFC8C7BFFF959488FF8C8B7EFF837E6FFF949184FF847E
          70FF8A887AFF8F8E81FF53534B970707060C0000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFE9E7E3FFCBC9C2FFABA99FFFA4A297FFB0AF
          A5FFC6C5BDFFE6E5E0FF00000000000000000000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFF1F0ECFFF1F0ECFF00000000000000000000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1DCFFE3E1DCFFC7C3BDFFC7C3BDFFE3E1
          DCFFF1F0ECFFF1F0ECFF00000000000000000000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFECEBE7FFE3E1DCFFE3E1DCFFECEBE7FFECEBE7FFE3E1DCFFE3E1DCFFECEB
          E7FFF1F0ECFFF1F0ECFF00000000000000000000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFF00000000000000000000000000000000000000000000
          00000000000000000000F1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
          ECFFF1F0ECFFF1F0ECFF00000000000000000000000000000000000000000000
          000000000000000000003C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF00000000000000000000000000000000000000000000
          000000000000000000003C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF00000000000000000000000000000000000000000000
          000000000000000000003C4CE7FF3C4CE7FF3C4CE7FF3847DEFF3847DEFF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3847DDFF3847DEFF3C4C
          E7FF3C4CE7FF3C4CE7FF00000000000000000000000000000000000000000000
          000000000000000000003C4CE7FF3C4CE7FF3241D0FF2B39C0FF2B39C0FF3241
          D0FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3241D0FF2B39C0FF2B39C0FF3241
          D0FF3C4CE7FF3C4CE7FF00000000000000000000000000000000000000000000
          000000000000000000003C4CE7FF3C4CE7FF3A47C1FFB1B0BDFFB1AFBEFF3A46
          C1FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3946C1FFB0AEBDFFAFAEBDFF3945
          C1FF3C4CE7FF3C4CE7FF00000000000000000000000000000000000000000000
          000000000000000000003F4EE5FE3C4CE7FF626BC7FFC7C3BDFFC7C3BDFF626A
          C7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF626BC7FFC7C3BDFFC7C3BDFF616A
          C7FF3C4CE7FF3F4EE5FE00000000000000000000000000000000000000000000
          000000000000000000003541AFC23C4CE7FF6A74D8FFC7C3BDFFC7C3BDFF6A73
          D8FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF6A74D8FFC7C3BDFFC7C3BDFF6A73
          D8FF3C4CE7FF3640AFC100000000000000000000000000000000000000000000
          000000000000000000000C0D1C1E3541AFC26D76D7FEC7C3BDFFC7C3BDFF6A74
          D9FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4C
          E7FF3C4CE7FF3C4CE7FF3C4CE7FF3C4CE7FF6B74D9FFC7C3BDFFC7C3BDFF6D76
          D7FE3640AFC10C0D1B1E00000000000000000000000000000000000000000000
          00000000000000000000000000000000000043424056C7C3BDFFC7C3BDFF4241
          3F55000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000043424056C7C3BDFFC7C3BDFF4241
          3F55000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003B3A384CC7C3BDFFC7C3BDFF3A39
          374B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C3B394DC7C3BDFFC7C3BDFF3B3A
          384C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000404040569676487696764870303
          0304000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000050504066B69668A6B6966890404
          0406000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000050230330F058E960F058E9605022E31050230330F058E960F058E960502
          2E3105022F320F058E960F058E9605012F3205022F320F058E960F058E960501
          2F3205022F310F058E960F058E960502303305022F310F058E960F058E960502
          303305012E300F058E960F058E96050231340000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000090352571908F2FF1908F2FF08034F53090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          000001000707020115160201151601000707090352571908F2FF1908F2FF0803
          4F53080351551908F2FF1908F2FF08035055080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          000000000000000000000000000000000000090352571908F2FF1908F2FF0803
          4F53030122240A03666B0A03666B03012224080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          00000000000000000000000000000000000006023E411305B5C01305B5C00602
          3B3F00000000000000000000000000000000080351551908F2FF1908F2FF0803
          5055080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          000000000000000000000603506B0502394C0000000000000000000000000000
          000000000000000000000000000000000000030122240A03666B0A03666B0301
          2224080350541908F2FF1908F2FF09035256080350541908F2FF1908F2FF0903
          525608034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000000000000603516C0F06BEFE0F06BBF80402394C00000000000000000000
          0000000000000000000000000000000002030000000000000000000000000000
          0000080350541908F2FF1908F2FF090352560100070702011516020115160100
          070708034E521908F2FF1908F2FF090354580000000000000000000000000000
          000000000000070358760F06C0FF0F06C0FF0F06BBF80402394C000000000000
          0000000000000000000005023A4E0C059DD20201131900000000000000000000
          0000080350541908F2FF1908F2FF090352560000000000000000000000000000
          000008034E521908F2FF1908F2FF090354580000000000000000000000000000
          00000000000000000000070358760F06C0FF0F06C0FF0F06BBF80402394C0000
          00000000000004023A4D0F06BBF90F06C0FF0D04A2D802011319000000000000
          0000080350541908F2FF1908F2FF090352560000000000000000000000000000
          000008034E521908F2FF1908F2FF090354580000000000000000000000000000
          0000000000000000000000000000070358760F06C0FF0F06C0FF0F06BBF80402
          394C05023A4D0F06BBF90F06C0FF0F06C0FF0F06C0FF0D04A2D8020113190000
          0000040122240B04676D0B04676D040123250000000000000000000000000000
          000008034E521908F2FF1908F2FF090354580000000000000000000000000000
          000000000000000000000000000000000000070358760F06C0FF0F06C0FF0F06
          BBF80F06BBF80F06C0FF0F06C0FF0D04A5DC0F06C0FF0F06C0FF0D04A2D80201
          1319000000000000000000000000000000000000020300000000000000000000
          000006023B3F1205B7C21205B7C2070240430000000000000000000000000000
          00000000000000000000000000000000000000000000060358760F06C0FF0F06
          C0FF0F06C0FF0F06C0FF070358750100080B0B0590C00F06C0FF0F06C0FF0D04
          A2D8020113190000000000000000020112180C059DD005023A4D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060358750F06
          C0FF0F06C0FF0703587500000000000000000100080B0B0590C00F06C0FF0F06
          C0FF0D04A2D802011319010112180D04A0D60F06C0FF0F06BBF905023A4D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000603
          587507035875000000000000000000000000000000000100080B0B0590C00F06
          C0FF0F06C0FF0D04A2D80C04A0D60F06C0FF0F06C0FF0F06C0FF0F06BBF90502
          3A4D00000000000000000000050702011A230000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000100080B0A04
          90BF0F06C0FF0F06C0FF0F06C0FF0F06C0FF0D04A5DC0F06C0FF0F06C0FF0F06
          BBF905023A4D000005070B0485B3050242580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000100
          080B0A0490BF0F06C0FF0F06C0FF0B0591C10100090B070357740F06C0FF0F06
          C0FF0F06BBF90C0594C60F06C0FF050242580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000100080B0A0490BF0B0591C10100090C0000000000000000070357740F06
          C0FF0F06C0FF0F06C0FF0F06C0FF050242580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000100080B0100090C000000000000000000000000000005070D04
          A0D50F06C0FF0F06C0FF0F06C0FF050242580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000005070B0485B30F06
          C0FF0F06C0FF0F06C0FF0F06C0FF050242580000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000030125310703536F0703
          536F0703536F0703536F0703536F02011D260000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 456
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 592
    Top = 8
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    ACBrNFe = ACBrNFe1
    Sistema = 'Caiman'
    PathPDF = 'C:\Des\ComercioSuper\NFe\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    EspessuraBorda = 1
    ShowDialog = True
    ExibirTotalTributosItem = False
    ExibeCampoFatura = True
    TributosPercentual = ptValorProdutos
    ImprimirUnQtVlComercial = iuComercial
    Detalhado = False
    DescricaoViaEstabelec = 'Via do Consumidor'
    ExpandirDadosAdicionaisAuto = False
    ImprimirDadosArma = True
    QuebraLinhaEmDetalhamentoEspecifico = True
    IncorporarBackgroundPdf = True
    IncorporarFontesPdf = True
    ImprimirDadosDocReferenciados = True
    Left = 680
    Top = 216
  end
  object AlertsLongos: TdxAlertWindowManager
    LookAndFeel.SkinName = 'MetropolisDark'
    OptionsAnimate.AlphaBlendValue = 250
    OptionsAnimate.HidingAnimation = awaSlide
    OptionsAnimate.HidingAnimationTime = 300
    OptionsAnimate.HotTrackFadeInTime = 200
    OptionsAnimate.ShowingAnimation = awaSlide
    OptionsAnimate.ShowingAnimationTime = 300
    OptionsBehavior.DisplayTime = 10000
    OptionsButtons.Buttons = <>
    OptionsCaptionButtons.CaptionButtons = [awcbClose]
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWhite
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Segoe UI'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Images = ImagensGerais
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -15
    OptionsMessage.Text.Font.Name = 'Segoe UI'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Segoe UI'
    OptionsNavigationPanel.Font.Style = []
    OptionsSize.AutoHeight = True
    OptionsSize.AutoWidth = True
    OptionsSize.AutoSizeAdjustment = True
    OptionsSize.Height = 500
    OptionsSize.Width = 300
    WindowPosition = awpBottomRight
    Left = 368
    Top = 424
    PixelsPerInch = 96
  end
end
