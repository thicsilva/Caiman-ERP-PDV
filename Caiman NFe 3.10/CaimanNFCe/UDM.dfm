object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 569
  Width = 798
  object IBTransaction: TFDTransaction
    Connection = IBDatabase
    Left = 104
    Top = 8
  end
  object IBDatabase: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    AfterConnect = IBDatabaseAfterConnect
    Left = 32
    Top = 8
  end
  object QAcesso: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 296
    Top = 8
  end
  object QBanco: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM BANCO')
    Left = 32
    Top = 104
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
  end
  object DSQBanco: TDataSource
    AutoEdit = False
    DataSet = QBanco
    Left = 32
    Top = 152
  end
  object IBSQLcod: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 352
    Top = 8
  end
  object QBandeira: TFDQuery
    OnCalcFields = QBandeiraCalcFields
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT B.*, A.DESCRICAO ADMINISTRADORA'
      'FROM BANDEIRAS_CARTAO B'
      'INNER JOIN ADMINISTRADORA_CARTAO A'
      'ON (B.CODIGO = A.CODIGO)'
      '')
    Left = 104
    Top = 104
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
    object QBandeiraCODIGO_TEF: TIntegerField
      FieldName = 'CODIGO_TEF'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_TEF'
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
  end
  object DSBandeira: TDataSource
    AutoEdit = False
    DataSet = QBandeira
    Left = 104
    Top = 152
  end
  object QConsulta: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 240
    Top = 8
  end
  object IBTRAux: TFDTransaction
    Connection = IBDatabase
    Left = 176
    Top = 8
  end
  object IBSQL: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 296
    Top = 56
  end
  object IBDatabaseServer: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Port=3050'
      'Database=C:\AligatorERP\Database\BANCO.FDB'
      'Server=localhost'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 56
  end
  object IBTRServer: TFDTransaction
    Connection = IBDatabaseServer
    Left = 104
    Top = 56
  end
  object QVend: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM VENDEDOR'
      'ORDER BY COD_VEND')
    Left = 176
    Top = 104
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
  end
  object DSQVend: TDataSource
    AutoEdit = False
    DataSet = QVend
    Left = 176
    Top = 152
  end
  object QTipoVenda: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_VENDA'
      'ORDER BY COD_TPV')
    Left = 240
    Top = 104
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
  end
  object DSQTipoVenda: TDataSource
    AutoEdit = False
    DataSet = QTipoVenda
    Left = 240
    Top = 152
  end
  object QConsultaServer: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    Left = 240
    Top = 56
  end
  object QEstoqueServer: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM ESTOQUE'
      'WHERE COD_EMP = :CODEMP'
      'ORDER BY COD_PRO')
    Left = 320
    Top = 112
    ParamData = <
      item
        Name = 'CODEMP'
      end>
    object QEstoqueServerCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ESTOQUE.COD_PRO'
      Required = True
    end
    object QEstoqueServerESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE.ESTOQUE'
      Required = True
      Precision = 18
      Size = 3
    end
    object QEstoqueServerCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = 'ESTOQUE.CODIGO_LOCAL_ESTOQUE'
      Required = True
    end
    object QEstoqueServerCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ESTOQUE.COD_EMP'
      Required = True
    end
  end
  object QAbreVenda: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INICIA_VENDA(:DATAVEN, :CODEMP, :CODCAI, :DATAHORA, :COD' +
        'USU, :CUPOM, :CODCLI, :CODVEND, :CODTPV, :CODFISCAL, :SERIE, :NU' +
        'MERO, :CANCELADA, :CCF, :CER, '#39'N'#39')')
    Left = 408
    Top = 8
    ParamData = <
      item
        Name = 'DATAVEN'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'CODCAI'
        DataType = ftInteger
      end
      item
        Name = 'DATAHORA'
        DataType = ftDateTime
      end
      item
        Name = 'CODUSU'
        DataType = ftInteger
      end
      item
        Name = 'CUPOM'
        DataType = ftInteger
      end
      item
        Name = 'CODCLI'
      end
      item
        Name = 'CODVEND'
      end
      item
        Name = 'CODTPV'
      end
      item
        Name = 'CODFISCAL'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERO'
      end
      item
        Name = 'CANCELADA'
      end
      item
        Name = 'CCF'
      end
      item
        Name = 'CER'
      end>
    object QAbreVendaCODVEN: TIntegerField
      FieldName = 'CODVEN'
      Origin = 'ABRE_VENDA_CAIXA.CODVEN'
    end
  end
  object QAtualizaVenda: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'UPDATE VENDAS SET DESCONTO_VEN = :2,'
      'TOTAL_VEN = :3, R04_NOME_CLIENTE = :4,'
      'R04_CNPJ_CLIENTE = :5 '
      'WHERE COD_VEN = :1')
    Left = 552
    Top = 8
    ParamData = <
      item
        Name = '2'
        DataType = ftCurrency
      end
      item
        Name = '3'
        DataType = ftCurrency
      end
      item
        Name = '4'
        DataType = ftCurrency
      end
      item
        Name = '5'
        DataType = ftCurrency
      end
      item
        Name = '1'
      end>
  end
  object QMapaResumo: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM MAPA_RESUMO'
      
        'WHERE DATA BETWEEN :DATAINI AND :DATAFIN AND CHECKOUT = :CHECKOU' +
        'T AND COD_EMP = :CODEMP'
      'ORDER BY CONT_REDUCAO')
    Left = 376
    Top = 56
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CHECKOUT'
      end
      item
        Name = 'CODEMP'
      end>
    object QMapaResumoCHECKOUT: TIntegerField
      FieldName = 'CHECKOUT'
      Origin = 'MAPA_RESUMO.CHECKOUT'
      Required = True
    end
    object QMapaResumoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'MAPA_RESUMO.DATA'
      Required = True
    end
    object QMapaResumoCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
      Origin = 'MAPA_RESUMO.COO_INICIAL'
      Required = True
    end
    object QMapaResumoCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = 'MAPA_RESUMO.COO_FINAL'
      Required = True
    end
    object QMapaResumoGT_INICIAL: TBCDField
      FieldName = 'GT_INICIAL'
      Origin = 'MAPA_RESUMO.GT_INICIAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMapaResumoGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = 'MAPA_RESUMO.GT_FINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMapaResumoCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
    object QMapaResumoCONT_CANCEL: TIntegerField
      FieldName = 'CONT_CANCEL'
      Origin = 'MAPA_RESUMO.CONT_CANCEL'
      Required = True
    end
    object QMapaResumoCONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = 'MAPA_RESUMO.CONTADOR_REINICIO_OPERACAO'
      Required = True
    end
    object QMapaResumoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QMapaResumoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QMapaResumoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'MAPA_RESUMO.DATA_EMISSAO'
    end
    object QMapaResumoHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'MAPA_RESUMO.HORA_EMISSAO'
    end
  end
  object QTotalizadores: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT I.*, M.CONT_REDUCAO'
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN MAPA_RESUMO M'
      'ON (I.CODIGO = M.CODIGO)'
      'WHERE M.DATA BETWEEN :DATAINI AND :DATAFIN'
      'AND M.CHECKOUT = :CHECKOUT AND I.COD_EMP = :CODEMP'
      'ORDER BY I.CODIGO, I.COD_GRP'
      '')
    Left = 496
    Top = 64
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CHECKOUT'
      end
      item
        Name = 'CODEMP'
      end>
    object QTotalizadoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QTotalizadoresCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
    object QTotalizadoresVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_MAPA_RESUMO.VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QTotalizadoresCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QTotalizadoresINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
    object QTotalizadoresCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
  end
  object QCupom: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT R04_CCF, R04_NOME_CLIENTE, R04_CNPJ_CLIENTE,'
      
        'CANCELADA_VEN, CUPOM_FISCAL_VEN, DATA_VEN, DESCONTO_VEN, TOTAL_V' +
        'EN, R04_CCF, R04_NOME_CLIENTE, R04_CNPJ_CLIENTE'
      'FROM VENDAS'
      
        'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND COD_CAI = :CODC' +
        'AI AND COD_EMP = :CODEMP AND CUPOM_FISCAL_VEN IS NOT NULL'
      'ORDER BY COD_VEN')
    Left = 592
    Top = 64
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object QCupomR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = 'VENDAS.R04_CCF'
    end
    object QCupomR04_NOME_CLIENTE: TStringField
      FieldName = 'R04_NOME_CLIENTE'
      Origin = 'VENDAS.R04_NOME_CLIENTE'
      Size = 40
    end
    object QCupomR04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = 'VENDAS.R04_CNPJ_CLIENTE'
      Size = 18
    end
    object QCupomCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = 'VENDAS.CANCELADA_VEN'
      Required = True
    end
    object QCupomCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
    object QCupomDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QCupomDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      Precision = 18
      Size = 2
    end
    object QCupomTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      Precision = 18
      Size = 2
    end
    object QCupomR04_CCF1: TIntegerField
      FieldName = 'R04_CCF1'
      Origin = 'VENDAS.R04_CCF'
    end
    object QCupomR04_NOME_CLIENTE1: TStringField
      FieldName = 'R04_NOME_CLIENTE1'
      Origin = 'VENDAS.R04_NOME_CLIENTE'
      Size = 40
    end
    object QCupomR04_CNPJ_CLIENTE1: TStringField
      FieldName = 'R04_CNPJ_CLIENTE1'
      Origin = 'VENDAS.R04_CNPJ_CLIENTE'
      Size = 18
    end
  end
  object QItensCupom: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT I.*, V.CUPOM_FISCAL_VEN, V.R04_CCF, V.COD_CAI,'
      'P.DESC_CUPOM, P.ICMS_CF_EST,'
      'P.TIPO_PRODUCAO, P.CODIGO_BARRA_PRO, U.DESCRICAO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      
        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.COD_CAI = :' +
        'CODCAI AND V.COD_EMP = :CODEMP AND CUPOM_FISCAL_VEN IS NOT NULL'
      'ORDER BY I.COD_VEN, I.ORDEM'
      '')
    Left = 656
    Top = 64
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object QItensCupomCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QItensCupomCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QItensCupomORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QItensCupomDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QItensCupomCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QItensCupomQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensCupomVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensCupomVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QItensCupomPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensCupomCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QItensCupomVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QItensCupomCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
    object QItensCupomR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = 'VENDAS.R04_CCF'
    end
    object QItensCupomDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'PRODUTO.DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QItensCupomICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = 'PRODUTO.ICMS_CF_EST'
      Required = True
    end
    object QItensCupomCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QItensCupomTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'PRODUTO.TIPO_PRODUCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensCupomCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QItensCupomDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object QOutrosDocumentos: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM OUTROS_DOCUMENTOS_ECF'
      
        'WHERE DATA_FINAL BETWEEN :DATAINI AND :DATAFIN AND COD_CAI = :CO' +
        'DCAI AND COD_EMP = :CODEMP'
      'ORDER BY CODIGO')
    Left = 648
    Top = 8
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object QOutrosDocumentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'OUTROS_DOCUMENTOS_ECF.CODIGO'
      Required = True
    end
    object QOutrosDocumentosCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'OUTROS_DOCUMENTOS_ECF.COD_CAI'
      Required = True
    end
    object QOutrosDocumentosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'OUTROS_DOCUMENTOS_ECF.COD_EMP'
      Required = True
    end
    object QOutrosDocumentosCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'OUTROS_DOCUMENTOS_ECF.COO'
    end
    object QOutrosDocumentosGNF: TIntegerField
      FieldName = 'GNF'
      Origin = 'OUTROS_DOCUMENTOS_ECF.GNF'
    end
    object QOutrosDocumentosGRG: TIntegerField
      FieldName = 'GRG'
      Origin = 'OUTROS_DOCUMENTOS_ECF.GRG'
    end
    object QOutrosDocumentosCDC: TIntegerField
      FieldName = 'CDC'
      Origin = 'OUTROS_DOCUMENTOS_ECF.CDC'
    end
    object QOutrosDocumentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'OUTROS_DOCUMENTOS_ECF.DESCRICAO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QOutrosDocumentosDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      Origin = 'OUTROS_DOCUMENTOS_ECF.DATA_FINAL'
      Required = True
    end
    object QOutrosDocumentosHORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
      Origin = 'OUTROS_DOCUMENTOS_ECF.HORA_FINAL'
      Required = True
    end
  end
  object QIndice: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRAuxServer
    SQL.Strings = (
      'SELECT INDICE_R03'
      'FROM INDICE_ECF'
      
        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :COD' +
        'GRP')
    Left = 480
    Top = 112
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODGRP'
      end>
    object QIndiceINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'INDICE_ECF.INDICE_R03'
      Required = True
      Size = 10
    end
  end
  object IBTRAuxServer: TFDTransaction
    Connection = IBDatabaseServer
    Left = 176
    Top = 56
  end
  object QMeiosPagamento: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM MEIOS_PAGAMENTOS_ECF'
      'WHERE DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'COD_CAI = :CODCAI AND COD_EMP = :CODEMP'
      'ORDER BY CODIGO')
    Left = 408
    Top = 112
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end>
    object QMeiosPagamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MEIOS_PAGAMENTOS_ECF.CODIGO'
      Required = True
    end
    object QMeiosPagamentoCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'MEIOS_PAGAMENTOS_ECF.COD_CAI'
      Required = True
    end
    object QMeiosPagamentoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'MEIOS_PAGAMENTOS_ECF.COD_EMP'
      Required = True
    end
    object QMeiosPagamentoCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'MEIOS_PAGAMENTOS_ECF.COO'
      Required = True
    end
    object QMeiosPagamentoCCF: TIntegerField
      FieldName = 'CCF'
      Origin = 'MEIOS_PAGAMENTOS_ECF.CCF'
    end
    object QMeiosPagamentoGNF: TIntegerField
      FieldName = 'GNF'
      Origin = 'MEIOS_PAGAMENTOS_ECF.GNF'
    end
    object QMeiosPagamentoMEIO_PAGAMENTO: TStringField
      FieldName = 'MEIO_PAGAMENTO'
      Origin = 'MEIOS_PAGAMENTOS_ECF.MEIO_PAGAMENTO'
      Required = True
      Size = 15
    end
    object QMeiosPagamentoVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'MEIOS_PAGAMENTOS_ECF.VALOR_PAGO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QMeiosPagamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'MEIOS_PAGAMENTOS_ECF.DATA'
      Required = True
    end
  end
  object QGravaMapa: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_INSERT_MAPA_RESUMO (:CHECKOUT, :DATA,'
      ':COO_INICIAL, :COO_FINAL, :GT_INICIAL, :GT_FINAL, :CRZ,'
      ':CONT_CANCEL, :CRO, :COD_EMP, :DATA_EMISSAO,'
      ':HORA_EMISSAO, :VENDA_BRUTA)')
    Left = 560
    Top = 112
    ParamData = <
      item
        Name = 'CHECKOUT'
      end
      item
        Name = 'DATA'
      end
      item
        Name = 'COO_INICIAL'
      end
      item
        Name = 'COO_FINAL'
      end
      item
        Name = 'GT_INICIAL'
      end
      item
        Name = 'GT_FINAL'
      end
      item
        Name = 'CRZ'
      end
      item
        Name = 'CONT_CANCEL'
      end
      item
        Name = 'CRO'
      end
      item
        Name = 'COD_EMP'
      end
      item
        Name = 'DATA_EMISSAO'
      end
      item
        Name = 'HORA_EMISSAO'
      end
      item
        Name = 'VENDA_BRUTA'
      end>
    object QGravaMapaCODMAPA: TIntegerField
      FieldName = 'CODMAPA'
      Origin = 'SP_INSERT_MAPA_RESUMO.CODMAPA'
    end
  end
  object QC400: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT COD_CAI, R01_NUMERO_SERIE, R01_MODELO_ECF '
      'FROM CAIXA '
      'WHERE COD_EMP = :CODEMP AND R01_NUMERO_SERIE IS NOT NULL '
      'ORDER BY COD_CAI')
    Left = 8
    Top = 256
    ParamData = <
      item
        Name = 'CODEMP'
      end>
    object QC400COD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CAIXA.COD_CAI'
      Required = True
    end
    object QC400R01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'CAIXA.R01_NUMERO_SERIE'
    end
    object QC400R01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'CAIXA.R01_MODELO_ECF'
    end
  end
  object QC405: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT CODIGO, DATA, CONTADOR_REINICIO_OPERACAO, CONT_REDUCAO, C' +
        'OO_FINAL, GT_FINAL, VENDA_BRUTA'
      'FROM MAPA_RESUMO '
      'WHERE DATA BETWEEN :DATAINI AND :DATAFIN AND '
      'CHECKOUT = :CHECKOUT AND COD_EMP = :CODEMP '
      'ORDER BY DATA')
    Left = 48
    Top = 256
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CHECKOUT'
      end
      item
        Name = 'CODEMP'
      end>
    object QC405CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QC405DATA: TDateField
      FieldName = 'DATA'
      Origin = 'MAPA_RESUMO.DATA'
      Required = True
    end
    object QC405CONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = 'MAPA_RESUMO.CONTADOR_REINICIO_OPERACAO'
      Required = True
    end
    object QC405CONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
    object QC405COO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = 'MAPA_RESUMO.COO_FINAL'
      Required = True
    end
    object QC405GT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = 'MAPA_RESUMO.GT_FINAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC405VENDA_BRUTA: TBCDField
      FieldName = 'VENDA_BRUTA'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object QC420: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT INDICE_R03, VALOR, COD_GRP'
      'FROM ITENS_MAPA_RESUMO'
      'WHERE CODIGO = :CODIGO AND VALOR > 0'
      'ORDER BY INDICE_R03')
    Left = 88
    Top = 256
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QC420INDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
    object QC420VALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_MAPA_RESUMO.VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC420COD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
  end
  object QC425: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT I.COD_PRO, SUM(I.QUANT) QUANT, SUM(((I.QUANT * I.VALOR) -' +
        ' I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR, '
      'U.DESCRICAO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND  '
      
        '(V.COD_CAI = :CODCAI AND I.COD_EMP = :CODEMP) AND P.ICMS_CF_EST ' +
        '= :CODGRP AND I.CANCELADO = 0'
      'AND V.cancelada_ven = 0 and'
      'V.CODIFICACAO_FISCAL = '#39'2D'#39' '
      'GROUP BY I.COD_PRO, U.DESCRICAO'
      'ORDER BY I.COD_PRO')
    Left = 128
    Top = 256
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODGRP'
      end>
    object QC425COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QC425QUANT: TBCDField
      FieldName = 'QUANT'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object QC425VALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 10
    end
    object QC425DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object QC460: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT COD_VEN, CUPOM_FISCAL_VEN, DATA_VEN, TOTAL_VEN, R04_CNPJ_' +
        'CLIENTE, R04_NOME_CLIENTE, CANCELADA_VEN, NUMERO_NOTA_FISCAL, CO' +
        'DIFICACAO_FISCAL, desconto_ven'
      'FROM VENDAS'
      
        'WHERE DATA_VEN = :DATA AND (COD_CAI = :CODCAI AND COD_EMP = :COD' +
        'EMP) and CODIFICACAO_FISCAL = '#39'2D'#39
      'ORDER BY CUPOM_FISCAL_VEN')
    Left = 168
    Top = 256
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
    object QC460CUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
    object QC460DATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QC460TOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      Precision = 18
      Size = 2
    end
    object QC460R04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = 'VENDAS.R04_CNPJ_CLIENTE'
      Size = 18
    end
    object QC460R04_NOME_CLIENTE: TStringField
      FieldName = 'R04_NOME_CLIENTE'
      Origin = 'VENDAS.R04_NOME_CLIENTE'
      Size = 40
    end
    object QC460CANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = 'VENDAS.CANCELADA_VEN'
      Required = True
    end
    object QC460COD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QC460NUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = '"VENDAS"."NUMERO_NOTA_FISCAL"'
    end
    object QC460CODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"VENDAS"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QC460DESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = '"VENDAS"."DESCONTO_VEN"'
      Precision = 18
      Size = 2
    end
  end
  object QC470: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT I.COD_PRO, I.QUANT, (( I.QUANT * I.VALOR) - I.desconto) T' +
        'OTAL, I.CANCELADO, P.CFOP_VENDAS_CF_EST, P.CST_CF_EST,'
      'G.ALIQUOTA_GRP, U.DESCRICAO, g.icms_servico_grp'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_VEN = :CODVEN AND V.CANCELADA_VEN = 0'
      'ORDER BY ORDEM')
    Left = 208
    Top = 256
    ParamData = <
      item
        Name = 'CODVEN'
      end>
    object QC470COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QC470QUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QC470TOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object QC470CANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QC470CFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = 'PRODUTO.CFOP_VENDAS_CF_EST'
    end
    object QC470CST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = 'PRODUTO.CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QC470ALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC470DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QC470ICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = '"GRUPO_ICMS"."ICMS_SERVICO_GRP"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QC350: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT COD_VEN, SERIE_NOTA_FISCAL, NUMERO_NOTA_FISCAL, DATA_VEN,' +
        ' R04_CNPJ_CLIENTE, TOTAL_VEN, DESCONTO_VEN'
      'FROM VENDAS'
      'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND '
      
        'COD_EMP = :CODEMP AND CANCELADA_VEN = 0 AND CODIFICACAO_FISCAL =' +
        ' '#39'02'#39' AND SERIE_NOTA_FISCAL = '#39'D'#39' '
      'ORDER BY NUMERO_NOTA_FISCAL')
    Left = 8
    Top = 208
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
    object QC350SERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'VENDAS.SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QC350NUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'VENDAS.NUMERO_NOTA_FISCAL'
    end
    object QC350DATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QC350R04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = 'VENDAS.R04_CNPJ_CLIENTE'
      Size = 18
    end
    object QC350TOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      Precision = 18
      Size = 2
    end
    object QC350DESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      Precision = 18
      Size = 2
    end
    object QC350COD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
  end
  object QC370: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'SELECT I.ORDEM, I.COD_PRO, I.QUANT, I.VALOR, (I.QUANT * I.VALOR)' +
        ' TOTAL, I.DESCONTO, U.DESCRICAO'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE V.COD_VEN = :CODVEN '
      'ORDER BY I.ORDEM')
    Left = 48
    Top = 208
    ParamData = <
      item
        Name = 'CODVEN'
      end>
    object QC370ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QC370COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QC370QUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QC370VALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      Precision = 18
      Size = 3
    end
    object QC370TOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object QC370DESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QC370DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object QC390: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) VALOR, '
      'P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP, G.TIPO_GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE V.COD_VEN = :CODVEN'
      
        'GROUP BY P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP, G.T' +
        'IPO_GRP'
      'ORDER BY P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP')
    Left = 88
    Top = 208
    ParamData = <
      item
        Name = 'CODVEN'
      end>
    object QC390VALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QC390CST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QC390CFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
    end
    object QC390ALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC390TIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
  end
  object QC490: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'SELECT SUM((I.QUANT * I.VALOR) - I.DESCONTO) VALOR,'
      
        'P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP, G.TIPO_GRP, ' +
        'G.cod_grp,  g.icms_servico_grp'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE V.DATA_VEN = :DATA AND V.CODIFICACAO_FISCAL = '#39'2D'#39
      ' and v.cancelada_ven = 0 and i.cancelado = 0 '
      
        'GROUP BY P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP, G.T' +
        'IPO_GRP , G.cod_grp,  g.icms_servico_grp'
      'ORDER BY P.CST_CF_EST, P.CFOP_VENDAS_CF_EST, G.ALIQUOTA_GRP')
    Left = 248
    Top = 256
    ParamData = <
      item
        Name = 'DATA'
      end>
    object QC490VALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QC490CST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QC490CFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
    end
    object QC490ALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC490TIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QC490COD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"GRUPO_ICMS"."COD_GRP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QC490ICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = '"GRUPO_ICMS"."ICMS_SERVICO_GRP"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object LockApplication1: TLockApplication
    IDSistema = 1
    Demostracao = False
    Informacoes_adicionais = False
    Mostrar_Tela_Primeira_Vez = True
    Dias_Demostracao = 30
    Local_Registro = '\Software\Appro'
    Chave_Criptografia = 'LockApplication'
    Titulo_das_janelas = 'Seu t'#237'tulo aqui'
    Versao_Trial = 1
    SMTP_SSL = False
    SMTP_Porta = 0
    EMAIL_Enviar = False
    EMAIL_Dias_enviar = 5
    VerificarData = True
    Left = 384
    Top = 272
  end
  object IBSPGravaItem: TFDStoredProc
    Connection = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'SP_GRAVA_ITEM_VENDA'
    Left = 384
    Top = 216
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ORDEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'QUANT'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'PROMOCAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODVEND'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CANCELADO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'VENDACANCELADA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object cmd: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 384
    Top = 328
  end
  object ECF: TACBrECF
    NaoFiscalImprime = True
    QuebraLinhaRodape = False
    Porta = 'procurar'
    ReTentar = False
    DescricaoGrande = True
    IgnorarTagsFormatacao = True
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    MaxLinhasBuffer = 3
    PaginaDeCodigo = 0
    OnMsgPoucoPapel = ECFMsgPoucoPapel
    OnAntesAbreCupom = ECFAntesAbreCupom
    OnAntesAbreNaoFiscal = ECFAntesAbreNaoFiscal
    OnDepoisAbreNaoFiscal = ECFDepoisAbreNaoFiscal
    OnDepoisFechaNaoFiscal = ECFDepoisFechaNaoFiscal
    OnDepoisCancelaNaoFiscal = ECFDepoisCancelaNaoFiscal
    OnAntesLeituraX = ECFAntesLeituraX
    OnDepoisLeituraX = ECFDepoisLeituraX
    OnAntesReducaoZ = ECFAntesReducaoZ
    OnDepoisReducaoZ = ECFDepoisReducaoZ
    OnAntesAbreRelatorioGerencial = ECFAntesAbreRelatorioGerencial
    OnDepoisAbreRelatorioGerencial = ECFDepoisAbreRelatorioGerencial
    OnDepoisAbreCupomVinculado = ECFDepoisAbreCupomVinculado
    OnDepoisFechaRelatorio = ECFDepoisFechaRelatorio
    DecimaisPreco = 2
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ''
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO     DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ''
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ''
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=4'
      'HTML_Font=<font size="5" face="Lucida Console">')
    AAC = ACBrAAC1
    EAD = EAD1
    ArqLOG = 'acbrlog.txt'
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 3
    ConfigBarras.Altura = 60
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 32
    Top = 373
  end
  object PAF: TACBrPAF
    LinesBuffer = 1000
    Path = 'C:\PAF_ECF\'
    EAD = EAD1
    AAC = ACBrAAC1
    Left = 144
    Top = 376
  end
  object EAD1: TACBrEAD
    OnGetChavePrivada = EAD1GetChavePrivada
    OnGetChavePublica = EAD1GetChavePublica
    Left = 184
    Top = 376
  end
  object ACBrAAC1: TACBrAAC
    NomeArquivoAux = 'config_paf.slpdv'
    IdentPAF.NumeroLaudo = 'FE000033'
    IdentPAF.VersaoER = '1.12'
    IdentPAF.Empresa.CNPJ = '07774152000190'
    IdentPAF.Empresa.RazaoSocial = 'VALBIA ALVES E SIALVA ME'
    IdentPAF.Empresa.Endereco = 'RUA QUINTINO BOCAIUVA, 401, CENTRO'
    IdentPAF.Empresa.Cep = '59900-000'
    IdentPAF.Empresa.Cidade = 'PAU DOS FERROS'
    IdentPAF.Empresa.Uf = 'RN'
    IdentPAF.Empresa.Telefone = '(84)3351-2913'
    IdentPAF.Empresa.Contato = 'Kalenio'
    IdentPAF.Empresa.Email = 'diretoria@kadoshiautomacao.com.br'
    IdentPAF.Empresa.IE = '202017125'
    IdentPAF.Empresa.IM = '31264'
    IdentPAF.Paf.Nome = 'kPDV'
    IdentPAF.Paf.Versao = '2.1'
    IdentPAF.Paf.BancoDados = 'Firebird'
    IdentPAF.Paf.Linguagem = 'Delphi'
    IdentPAF.Paf.SistemaOperacional = 'Windows'
    IdentPAF.Paf.TipoFuncionamento = tpfParametrizavel
    IdentPAF.Paf.TipoDesenvolvimento = tpdComercializavel
    IdentPAF.Paf.IntegracaoPAFECF = tpiRetaguarda
    IdentPAF.Paf.RealizaPreVenda = False
    IdentPAF.Paf.RealizaDAVECF = False
    IdentPAF.Paf.RealizaDAVNaoFiscal = False
    IdentPAF.Paf.RealizaDAVOS = False
    IdentPAF.Paf.DAVConfAnexoII = False
    IdentPAF.Paf.RealizaLancamentoMesa = False
    IdentPAF.Paf.IndiceTecnicoProd = False
    IdentPAF.Paf.BarSimilarECFRestaurante = False
    IdentPAF.Paf.BarSimilarECFComum = True
    IdentPAF.Paf.BarSimilarBalanca = False
    IdentPAF.Paf.UsaImpressoraNaoFiscal = False
    IdentPAF.Paf.DAVDiscrFormula = False
    IdentPAF.Paf.ImpedeVendaVlrZero = False
    IdentPAF.Paf.AcumulaVolumeDiario = False
    IdentPAF.Paf.ArmazenaEncerranteIniFinal = False
    IdentPAF.Paf.EmiteContrEncerrAposREDZLEIX = False
    IdentPAF.Paf.IntegradoComBombas = False
    IdentPAF.Paf.CriaAbastDivergEncerrante = False
    IdentPAF.Paf.CadastroPlacaBomba = False
    IdentPAF.Paf.TransportePassageiro = False
    IdentPAF.Paf.TotalizaValoresLista = False
    IdentPAF.Paf.TransfPreVenda = False
    IdentPAF.Paf.TransfDAV = False
    IdentPAF.Paf.RecompoeGT = False
    IdentPAF.Paf.RecompoeNumSerie = False
    IdentPAF.Paf.EmitePED = False
    IdentPAF.Paf.CupomMania = False
    IdentPAF.Paf.MinasLegal = False
    IdentPAF.Paf.NotaLegalDF = False
    IdentPAF.Paf.ParaibaLegal = False
    IdentPAF.Paf.TrocoEmCartao = False
    OnGetChave = ACBrAAC1GetChave
    Left = 232
    Top = 376
  end
  object CONTEXTO: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'EXECUTE PROCEDURE SET_CONTEXTO( :USU,:EMP,:APP )')
    Left = 371
    Top = 373
  end
  object AuxTipo_R: TFDConnection
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    AfterConnect = AuxTipo_RAfterConnect
    Left = 704
    Top = 280
  end
  object TRAuxTipo_R: TFDTransaction
    Connection = AuxTipo_R
    Left = 704
    Top = 336
  end
  object CONTEXTO_R: TFDQuery
    Connection = AuxTipo_R
    Transaction = TRAuxTipo_R
    SQL.Strings = (
      'EXECUTE PROCEDURE SET_CONTEXTO( :USU,:EMP,:APP )')
    Left = 707
    Top = 389
  end
  object QConsultaR: TFDQuery
    Connection = AuxTipo_R
    Transaction = TRAuxTipo_R
    Left = 708
    Top = 440
  end
  object QConsultaAux: TFDQuery
    Connection = AuxTipo_R
    Transaction = TRAuxTipo_R
    Left = 624
    Top = 280
  end
  object BuscaIndiceR: TFDQuery
    Connection = AuxTipo_R
    Transaction = TRAuxTipo_R
    SQL.Strings = (
      'SELECT INDICE_R03'
      'FROM INDICE_ECF'
      
        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :COD' +
        'GRP')
    Left = 624
    Top = 336
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODGRP'
      end>
    object BuscaIndiceRINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = '"INDICE_ECF"."INDICE_R03"'
      Required = True
      Size = 10
    end
  end
  object TRBlocoVII: TFDTransaction
    Connection = AuxTipo_R
    Left = 624
    Top = 384
  end
  object QBlocoVII: TFDQuery
    Connection = AuxTipo_R
    Transaction = TRBlocoVII
    Left = 624
    Top = 432
  end
  object QC100: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'select * from nota_fiscal where COD_EMP=:CODEMP and Data_emissao' +
        '_nf between :DATAINI and :DATAFIM and CODIFICACAO_FISCAL='#39'55'#39' an' +
        'd PAF_ECF='#39'S'#39)
    Left = 8
    Top = 304
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIM'
      end>
    object QC100COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"NOTA_FISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QC100COD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"NOTA_FISCAL"."COD_EMP"'
      Required = True
    end
    object QC100NUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NOTA_NF"'
      Required = True
    end
    object QC100DATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = '"NOTA_FISCAL"."DATA_EMISSAO_NF"'
      Required = True
    end
    object QC100DATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."DATA_SAIDA_NF"'
    end
    object QC100HORA_SAIDA_NF: TTimeField
      FieldName = 'HORA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."HORA_SAIDA_NF"'
    end
    object QC100COD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = '"NOTA_FISCAL"."COD_TRA"'
      Required = True
    end
    object QC100BASE_CALCULO_ICMS_NF: TBCDField
      FieldName = 'BASE_CALCULO_ICMS_NF'
      Origin = '"NOTA_FISCAL"."BASE_CALCULO_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_ICMS_NF: TBCDField
      FieldName = 'VALOR_ICMS_NF'
      Origin = '"NOTA_FISCAL"."VALOR_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object QC100BASE_SUBST_NF: TBCDField
      FieldName = 'BASE_SUBST_NF'
      Origin = '"NOTA_FISCAL"."BASE_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_SUBST_NF: TBCDField
      FieldName = 'VALOR_SUBST_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_TOTAL_PROD_NF: TBCDField
      FieldName = 'VALOR_TOTAL_PROD_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_PROD_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_FRETE_NF: TBCDField
      FieldName = 'VALOR_FRETE_NF'
      Origin = '"NOTA_FISCAL"."VALOR_FRETE_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_SEGURO_NF: TBCDField
      FieldName = 'VALOR_SEGURO_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SEGURO_NF"'
      Precision = 18
      Size = 2
    end
    object QC100OUTRAS_DESPESAS_NF: TBCDField
      FieldName = 'OUTRAS_DESPESAS_NF'
      Origin = '"NOTA_FISCAL"."OUTRAS_DESPESAS_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_IPI_NF: TBCDField
      FieldName = 'VALOR_IPI_NF'
      Origin = '"NOTA_FISCAL"."VALOR_IPI_NF"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_NF"'
      Precision = 18
      Size = 2
    end
    object QC100ESPECIE_NF: TStringField
      FieldName = 'ESPECIE_NF'
      Origin = '"NOTA_FISCAL"."ESPECIE_NF"'
      Size = 10
    end
    object QC100MARCA_NF: TStringField
      FieldName = 'MARCA_NF'
      Origin = '"NOTA_FISCAL"."MARCA_NF"'
      Size = 10
    end
    object QC100NUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NF"'
      Size = 10
    end
    object QC100INF_COMPL_NF: TWideMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = '"NOTA_FISCAL"."INF_COMPL_NF"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QC100CANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = '"NOTA_FISCAL"."CANCELADA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QC100FRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = '"NOTA_FISCAL"."FRETE_CONTA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QC100COD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"NOTA_FISCAL"."COD_CLI"'
    end
    object QC100COD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"NOTA_FISCAL"."COD_FOR"'
    end
    object QC100DESCONTO_NF: TBCDField
      FieldName = 'DESCONTO_NF'
      Origin = '"NOTA_FISCAL"."DESCONTO_NF"'
      Precision = 18
      Size = 2
    end
    object QC100TIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Origin = '"NOTA_FISCAL"."TIPO_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QC100NOTA_IMPRESSA: TStringField
      FieldName = 'NOTA_IMPRESSA'
      Origin = '"NOTA_FISCAL"."NOTA_IMPRESSA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QC100COD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"NOTA_FISCAL"."COD_VENDA"'
    end
    object QC100COD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"NOTA_FISCAL"."COD_TPV"'
      Required = True
    end
    object QC100SERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = '"NOTA_FISCAL"."SERIE_NOTA"'
      Size = 3
    end
    object QC100TIPO_NOTA_FISCAL: TIntegerField
      FieldName = 'TIPO_NOTA_FISCAL'
      Origin = '"NOTA_FISCAL"."TIPO_NOTA_FISCAL"'
      Required = True
    end
    object QC100CODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"NOTA_FISCAL"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QC100CODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_ENTRADA"'
    end
    object QC100CODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_SAIDA"'
    end
    object QC100CHAVE_ACESSO_NFE: TStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = '"NOTA_FISCAL"."CHAVE_ACESSO_NFE"'
      Size = 44
    end
    object QC100PROTOCOLO_NFE: TStringField
      FieldName = 'PROTOCOLO_NFE'
      Origin = '"NOTA_FISCAL"."PROTOCOLO_NFE"'
      Size = 50
    end
    object QC100STATUS_TRANSMITIDA: TStringField
      FieldName = 'STATUS_TRANSMITIDA'
      Origin = '"NOTA_FISCAL"."STATUS_TRANSMITIDA"'
      Size = 2
    end
    object QC100STATUS_RETORNO: TStringField
      FieldName = 'STATUS_RETORNO'
      Origin = '"NOTA_FISCAL"."STATUS_RETORNO"'
      Size = 2
    end
    object QC100STATUS_CANCELADO: TStringField
      FieldName = 'STATUS_CANCELADO'
      Origin = '"NOTA_FISCAL"."STATUS_CANCELADO"'
      Size = 2
    end
    object QC100STATUS_INUTILIZADO: TStringField
      FieldName = 'STATUS_INUTILIZADO'
      Origin = '"NOTA_FISCAL"."STATUS_INUTILIZADO"'
      Size = 2
    end
    object QC100STATUS_EMAIL: TStringField
      FieldName = 'STATUS_EMAIL'
      Origin = '"NOTA_FISCAL"."STATUS_EMAIL"'
      Size = 2
    end
    object QC100JUSTIFICATIVA_CANCEL_INUTIL: TStringField
      FieldName = 'JUSTIFICATIVA_CANCEL_INUTIL'
      Origin = '"NOTA_FISCAL"."JUSTIFICATIVA_CANCEL_INUTIL"'
      Size = 100
    end
    object QC100PLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."PLACA_TRANSP"'
      FixedChar = True
      Size = 8
    end
    object QC100UF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."UF_PLACA_TRANSP"'
      FixedChar = True
      Size = 2
    end
    object QC100PESO_BRUTO_NF: TBCDField
      FieldName = 'PESO_BRUTO_NF'
      Origin = '"NOTA_FISCAL"."PESO_BRUTO_NF"'
      Precision = 18
      Size = 2
    end
    object QC100PESO_LIQUIDO_NF: TBCDField
      FieldName = 'PESO_LIQUIDO_NF'
      Origin = '"NOTA_FISCAL"."PESO_LIQUIDO_NF"'
      Precision = 18
      Size = 2
    end
    object QC100QUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = '"NOTA_FISCAL"."QUANTIDADE_NF"'
    end
    object QC100CHAVE2: TStringField
      FieldName = 'CHAVE2'
      Origin = '"NOTA_FISCAL"."CHAVE2"'
      Size = 255
    end
    object QC100DEPEC: TIntegerField
      FieldName = 'DEPEC'
      Origin = '"NOTA_FISCAL"."DEPEC"'
    end
    object QC100VALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object QC100VALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object QC100CORRECAO: TStringField
      FieldName = 'CORRECAO'
      Origin = '"NOTA_FISCAL"."CORRECAO"'
      Size = 1
    end
    object QC100PAF_ECF: TStringField
      FieldName = 'PAF_ECF'
      Origin = '"NOTA_FISCAL"."PAF_ECF"'
      Size = 1
    end
  end
  object QC170: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'select I.*, P.nome_pro, U.descricao UNID from itens_nota_fiscal ' +
        'I'
      'inner join PRODUTO P'
      'ON( P.cod_pro = I.cod_pro )'
      'inner join unidade_medida U'
      'on ( u.codigo = P.codigo_unidade_saida )'
      ' where cod_nf=:codnf')
    Left = 48
    Top = 304
    ParamData = <
      item
        Name = 'codnf'
      end>
    object QC170ORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_NOTA_FISCAL"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QC170COD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"ITENS_NOTA_FISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QC170CST: TStringField
      FieldName = 'CST'
      Origin = '"ITENS_NOTA_FISCAL"."CST"'
      FixedChar = True
      Size = 3
    end
    object QC170ALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ"'
      Precision = 18
      Size = 2
    end
    object QC170COD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_NOTA_FISCAL"."COD_EMP"'
      Required = True
    end
    object QC170COD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_NOTA_FISCAL"."COD_GRP"'
      Required = True
    end
    object QC170QUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_NOTA_FISCAL"."QUANT"'
      Precision = 18
      Size = 3
    end
    object QC170ALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_IPI"'
      Precision = 18
      Size = 2
    end
    object QC170REDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = '"ITENS_NOTA_FISCAL"."REDUCAO_ICMS"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QC170COD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = '"ITENS_NOTA_FISCAL"."COD_CFO"'
      Required = True
    end
    object QC170SUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = '"ITENS_NOTA_FISCAL"."SUB_TRIBUTARIA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QC170VR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = '"ITENS_NOTA_FISCAL"."VR_AGREGADO"'
      Precision = 18
      Size = 2
    end
    object QC170ALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQUOTA_FORA_ESTADO"'
      Precision = 18
      Size = 2
    end
    object QC170UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = '"ITENS_NOTA_FISCAL"."UNIDADE"'
      Size = 4
    end
    object QC170COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_NOTA_FISCAL"."COD_PRO"'
    end
    object QC170VALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object QC170BASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = '"ITENS_NOTA_FISCAL"."BASE_CALCULO"'
      Precision = 18
      Size = 2
    end
    object QC170VALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_ICMS"'
      Precision = 18
      Size = 2
    end
    object QC170BASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = '"ITENS_NOTA_FISCAL"."BASE_SUBTRIB"'
      Precision = 18
      Size = 2
    end
    object QC170VALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object QC170VALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_SUBTRIB"'
      Precision = 18
      Size = 2
    end
    object QC170CLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = '"ITENS_NOTA_FISCAL"."CLASSIFICACAO_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object QC170UNIT: TBCDField
      FieldName = 'UNIT'
      Origin = '"ITENS_NOTA_FISCAL"."UNIT"'
      Precision = 18
      Size = 3
    end
    object QC170ISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = '"ITENS_NOTA_FISCAL"."ISENTAS"'
      Precision = 18
      Size = 2
    end
    object QC170OUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = '"ITENS_NOTA_FISCAL"."OUTRAS"'
      Precision = 18
      Size = 2
    end
    object QC170FRETE: TFloatField
      FieldName = 'FRETE'
      Origin = '"ITENS_NOTA_FISCAL"."FRETE"'
    end
    object QC170DESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_NOTA_FISCAL"."DESCONTO"'
    end
    object QC170BC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."BC_PIS"'
      Precision = 18
      Size = 2
    end
    object QC170ALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_PIS"'
      Precision = 18
      Size = 2
    end
    object QC170VALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object QC170BC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."BC_COFINS"'
      Precision = 18
      Size = 2
    end
    object QC170ALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_COFINS"'
      Precision = 18
      Size = 2
    end
    object QC170VALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object QC170CANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_NOTA_FISCAL"."CANCELADO"'
    end
    object QC170NF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = '"ITENS_NOTA_FISCAL"."NF_CANCELADA"'
    end
    object QC170CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."CST_PIS"'
      Size = 2
    end
    object QC170CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."CST_COFINS"'
      Size = 2
    end
    object QC170CSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"ITENS_NOTA_FISCAL"."CSOSN"'
      Size = 3
    end
    object QC170CST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."CST_IPI"'
      Size = 2
    end
    object QC170NOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QC170UNID: TStringField
      FieldName = 'UNID'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object QH010: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'select E.*, U.descricao UNIDADE, P.valor_pro,'
      '( E.estoque * P.valor_pro ) VL_ITEM from ESTOQUE E'
      'INNER JOIN PRODUTO P'
      'ON ( P.cod_pro = E.cod_pro )'
      'INNER JOIN unidade_medida U'
      'ON ( P.codigo_unidade_saida = U.codigo )'
      'where cod_EMP=:codemp and ESTOQUE > 0')
    Left = 128
    Top = 304
    ParamData = <
      item
        Name = 'codemp'
      end>
    object QH010COD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ESTOQUE"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QH010COD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ESTOQUE"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QH010ESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = '"ESTOQUE"."ESTOQUE"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QH010CODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = '"ESTOQUE"."CODIGO_LOCAL_ESTOQUE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QH010UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QH010VALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = '"PRODUTO"."VALOR_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QH010VL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
  end
  object QH005: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'select SUM( E.estoque * P.valor_pro ) TOTAL from ESTOQUE E'
      'INNER JOIN PRODUTO P'
      'ON ( P.cod_pro = E.cod_pro )'
      'INNER JOIN unidade_medida U'
      'ON ( P.codigo_unidade_saida = U.codigo )'
      'where cod_EMP=:codemp and ESTOQUE > 0')
    Left = 168
    Top = 304
    ParamData = <
      item
        Name = 'codemp'
      end>
    object QH005TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
  end
  object QC190: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      
        'select I.cst, I.cod_cfo, I.aliq, SUM( I.valor_total ) TOTAL, SUM' +
        '( I.base_calculo ) BC_ICMS,'
      'SUM( I.valor_icms ) V_ICMS,'
      'SUM( I.base_subtrib ) BC_ICMS_ST,'
      'SUM( I.valor_subtrib ) V_ICMS_ST,'
      'SUM( I.reducao_icms ) V_REDUCAO,'
      'SUM( I.valor_ipi ) V_IPI'
      ' from itens_nota_fiscal I'
      'INNER JOIN nota_fiscal NF'
      'on ( NF.cod_nf = I.cod_nf )'
      'where NF.cod_nf = :codnf'
      'group by I.cst, I.cod_cfo, I.Aliq')
    Left = 88
    Top = 304
    ParamData = <
      item
        Name = 'codnf'
      end>
    object QC190CST: TStringField
      FieldName = 'CST'
      Origin = '"ITENS_NOTA_FISCAL"."CST"'
      FixedChar = True
      Size = 3
    end
    object QC190COD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = '"ITENS_NOTA_FISCAL"."COD_CFO"'
      Required = True
    end
    object QC190ALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ"'
      Precision = 18
      Size = 2
    end
    object QC190TOTAL: TBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190BC_ICMS: TBCDField
      FieldName = 'BC_ICMS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190V_ICMS: TBCDField
      FieldName = 'V_ICMS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190BC_ICMS_ST: TBCDField
      FieldName = 'BC_ICMS_ST'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190V_ICMS_ST: TBCDField
      FieldName = 'V_ICMS_ST'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190V_REDUCAO: TBCDField
      FieldName = 'V_REDUCAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QC190V_IPI: TBCDField
      FieldName = 'V_IPI'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object QC490BuscaValor: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'select II.VALOR from itens_mapa_resumo II'
      'INNER join mapa_resumo M'
      ' ON ( M.codigo = II.codigo )'
      ' where M.data =:DATA and II.cod_grp = :CODGRP')
    Left = 248
    Top = 304
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODGRP'
      end>
    object QC490BuscaValorVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_MAPA_RESUMO"."VALOR"'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object Q0150: TFDQuery
    Connection = IBDatabaseServer
    Transaction = IBTRServer
    SQL.Strings = (
      'select C.* from cliente C'
      'where c.cod_cli in'
      '( select nf.cod_cli from nota_fiscal NF'
      
        ' where nf.COD_EMP=:CODEMP and nf.Data_emissao_nf between :DATAIN' +
        'I and :DATAFIM and nf.CODIFICACAO_FISCAL='#39'55'#39' and nf.PAF_ECF='#39'S'#39 +
        ')'
      '')
    Left = 136
    Top = 208
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIM'
      end>
    object Q0150COD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q0150FJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = '"CLIENTE"."FJ_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q0150NOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object Q0150COD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = '"CLIENTE"."COD_CLA"'
      Required = True
    end
    object Q0150ENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object Q0150BAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object Q0150CIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object Q0150ESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object Q0150CEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object Q0150TELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object Q0150ENDCOM_CLI: TStringField
      FieldName = 'ENDCOM_CLI'
      Origin = '"CLIENTE"."ENDCOM_CLI"'
      Size = 50
    end
    object Q0150BAICOM_CLI: TStringField
      FieldName = 'BAICOM_CLI'
      Origin = '"CLIENTE"."BAICOM_CLI"'
      Size = 30
    end
    object Q0150CIDCOM_CLI: TStringField
      FieldName = 'CIDCOM_CLI'
      Origin = '"CLIENTE"."CIDCOM_CLI"'
      Size = 30
    end
    object Q0150ESTCOM_CLI: TStringField
      FieldName = 'ESTCOM_CLI'
      Origin = '"CLIENTE"."ESTCOM_CLI"'
      FixedChar = True
      Size = 2
    end
    object Q0150CEPCOM_CLI: TStringField
      FieldName = 'CEPCOM_CLI'
      Origin = '"CLIENTE"."CEPCOM_CLI"'
      FixedChar = True
      Size = 9
    end
    object Q0150TELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = '"CLIENTE"."TELCOM_CLI"'
      FixedChar = True
      Size = 13
    end
    object Q0150CNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object Q0150DOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = '"CLIENTE"."DOC_CLI"'
    end
    object Q0150PAI_CLI: TStringField
      FieldName = 'PAI_CLI'
      Origin = '"CLIENTE"."PAI_CLI"'
      Size = 50
    end
    object Q0150MAE_CLI: TStringField
      FieldName = 'MAE_CLI'
      Origin = '"CLIENTE"."MAE_CLI"'
      Size = 50
    end
    object Q0150CONJUGE_CLI: TStringField
      FieldName = 'CONJUGE_CLI'
      Origin = '"CLIENTE"."CONJUGE_CLI"'
      Size = 50
    end
    object Q0150ESTCIVIL_CLI: TStringField
      FieldName = 'ESTCIVIL_CLI'
      Origin = '"CLIENTE"."ESTCIVIL_CLI"'
      FixedChar = True
      Size = 1
    end
    object Q0150RENDA_CLI: TBCDField
      FieldName = 'RENDA_CLI'
      Origin = '"CLIENTE"."RENDA_CLI"'
      Precision = 18
      Size = 2
    end
    object Q0150LIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = '"CLIENTE"."LIMITE_CLI"'
      Precision = 18
      Size = 2
    end
    object Q0150PROFISSAO_CLI: TStringField
      FieldName = 'PROFISSAO_CLI'
      Origin = '"CLIENTE"."PROFISSAO_CLI"'
      Size = 50
    end
    object Q0150EMPRESA_TRAB_CLI: TStringField
      FieldName = 'EMPRESA_TRAB_CLI'
      Origin = '"CLIENTE"."EMPRESA_TRAB_CLI"'
      Size = 50
    end
    object Q0150ATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = '"CLIENTE"."ATIVO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q0150COD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = '"CLIENTE"."COD_CON"'
      Required = True
    end
    object Q0150OBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = '"CLIENTE"."OBS_VENDA"'
      Size = 200
    end
    object Q0150OBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = '"CLIENTE"."OBS_CLI"'
      Size = 500
    end
    object Q0150NASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = '"CLIENTE"."NASCIMENTO_CLI"'
    end
    object Q0150DATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = '"CLIENTE"."DATACADASTRO_CLI"'
      Required = True
    end
    object Q0150ATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = '"CLIENTE"."ATRAZO_MAXIMO_CLI"'
    end
    object Q0150CELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = '"CLIENTE"."CELULAR_CLI"'
      Size = 13
    end
    object Q0150IMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = '"CLIENTE"."IMP_SALDO_PENDENTE_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q0150LIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = '"CLIENTE"."LIMITE_CHEQUE"'
      Precision = 18
      Size = 2
    end
    object Q0150DATA_CONSULTA_SPC: TDateField
      FieldName = 'DATA_CONSULTA_SPC'
      Origin = '"CLIENTE"."DATA_CONSULTA_SPC"'
    end
    object Q0150DATA_REGISTRO_SPC: TDateField
      FieldName = 'DATA_REGISTRO_SPC'
      Origin = '"CLIENTE"."DATA_REGISTRO_SPC"'
    end
    object Q0150DATA_REABILITACAO_SPC: TDateField
      FieldName = 'DATA_REABILITACAO_SPC'
      Origin = '"CLIENTE"."DATA_REABILITACAO_SPC"'
    end
    object Q0150SELECIONADO_CLI: TStringField
      FieldName = 'SELECIONADO_CLI'
      Origin = '"CLIENTE"."SELECIONADO_CLI"'
      FixedChar = True
      Size = 1
    end
    object Q0150RENDA_CONJUGE: TBCDField
      FieldName = 'RENDA_CONJUGE'
      Origin = '"CLIENTE"."RENDA_CONJUGE"'
      Precision = 18
      Size = 2
    end
    object Q0150TRABALHO_CONJUGE: TStringField
      FieldName = 'TRABALHO_CONJUGE'
      Origin = '"CLIENTE"."TRABALHO_CONJUGE"'
      Size = 50
    end
    object Q0150PROF_CONJUGE: TStringField
      FieldName = 'PROF_CONJUGE'
      Origin = '"CLIENTE"."PROF_CONJUGE"'
      Size = 50
    end
    object Q0150NOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"CLIENTE"."NOME_FANTASIA"'
      Size = 60
    end
    object Q0150PONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = '"CLIENTE"."PONTO_REFERENCIA"'
      Size = 80
    end
    object Q0150CONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = '"CLIENTE"."CONTATO_CLI"'
      Size = 70
    end
    object Q0150ROTA_CLI: TIntegerField
      FieldName = 'ROTA_CLI'
      Origin = '"CLIENTE"."ROTA_CLI"'
    end
    object Q0150TIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = '"CLIENTE"."TIPO_CREDITO_CLI"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Q0150CONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = '"CLIENTE"."CONTROLAR_LIMITE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q0150BAICOB_CLI: TStringField
      FieldName = 'BAICOB_CLI'
      Origin = '"CLIENTE"."BAICOB_CLI"'
      Size = 30
    end
    object Q0150CIDCOB_CLI: TStringField
      FieldName = 'CIDCOB_CLI'
      Origin = '"CLIENTE"."CIDCOB_CLI"'
      Size = 30
    end
    object Q0150ESTCOB_CLI: TStringField
      FieldName = 'ESTCOB_CLI'
      Origin = '"CLIENTE"."ESTCOB_CLI"'
      FixedChar = True
      Size = 2
    end
    object Q0150CEPCOB_CLI: TStringField
      FieldName = 'CEPCOB_CLI'
      Origin = '"CLIENTE"."CEPCOB_CLI"'
      FixedChar = True
      Size = 9
    end
    object Q0150TELCOB_CLI: TStringField
      FieldName = 'TELCOB_CLI'
      Origin = '"CLIENTE"."TELCOB_CLI"'
      FixedChar = True
      Size = 13
    end
    object Q0150ENDCOB_CLI: TStringField
      FieldName = 'ENDCOB_CLI'
      Origin = '"CLIENTE"."ENDCOB_CLI"'
      Size = 50
    end
    object Q0150BLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = '"CLIENTE"."BLOQUEADO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Q0150INSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = '"CLIENTE"."INSC_ESTADUAL"'
      Size = 30
    end
    object Q0150NUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object Q0150NUMCOM_CLI: TStringField
      FieldName = 'NUMCOM_CLI'
      Origin = '"CLIENTE"."NUMCOM_CLI"'
      Size = 10
    end
    object Q0150NUMCOB_CLI: TStringField
      FieldName = 'NUMCOB_CLI'
      Origin = '"CLIENTE"."NUMCOB_CLI"'
      Size = 10
    end
    object Q0150CODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"CLIENTE"."CODIGO_IBGE"'
    end
    object Q0150EMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = '"CLIENTE"."EMAIL_CLI"'
      Size = 100
    end
    object Q0150COD_DEPENDENTE: TIntegerField
      FieldName = 'COD_DEPENDENTE'
      Origin = '"CLIENTE"."COD_DEPENDENTE"'
    end
    object Q0150NOME_DEPENDENTE: TStringField
      FieldName = 'NOME_DEPENDENTE'
      Origin = '"CLIENTE"."NOME_DEPENDENTE"'
      Size = 60
    end
    object Q0150GRAU_PARENTESCO: TStringField
      FieldName = 'GRAU_PARENTESCO'
      Origin = '"CLIENTE"."GRAU_PARENTESCO"'
    end
  end
  object Qimpostos: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from sp_pega_imposto( :COD_VEN )')
    Left = 32
    Top = 432
    ParamData = <
      item
        Name = 'COD_VEN'
      end>
    object QimpostosTOTAL_IMPOSTO: TBCDField
      FieldName = 'TOTAL_IMPOSTO'
      Origin = '"SP_PEGA_IMPOSTO"."TOTAL_IMPOSTO"'
      Precision = 18
      Size = 2
    end
  end
  object IBSQLFecha: TFDQuery
    Connection = IBDatabase
    Transaction = IBTransaction
    Left = 560
    Top = 224
  end
  object NFCe: TACBrNFe
    OnStatusChange = NFCeStatusChange
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.IncluirQRCodeXMLNFCe = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = Danfcenaofiscal
    Left = 704
    Top = 192
  end
  object Danfcenaofiscal: TACBrNFeDANFEFR
    ACBrNFe = NFCe
    PathPDF = 'C:\Program Files (x86)\Embarcadero\RAD Studio\8.0\bin\'
    MostrarPreview = False
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = False
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
    Left = 640
    Top = 176
  end
  object TRFormasNFCe: TFDTransaction
    Connection = IBDatabaseServer
    Left = 504
    Top = 344
  end
  object QFormasNFCe: TFDQuery
    Connection = IBDatabaseServer
    Transaction = TRFormasNFCe
    SQL.Strings = (
      'select vf.*, f.tipo, f.descricao,'
      '( select vf2.valor from vendas_formas_pagamento vf2'
      'left outer join formas_pagamento f2'
      'on( f2.codigo = vf2.cod_forma )'
      'where vf2.cod_venda =:cod_venda and   f2.tipo = '#39'TR'#39
      ')  TROCO'
      ' from vendas_formas_pagamento vf'
      'left outer join formas_pagamento f'
      'on( f.codigo = vf.cod_forma )'
      
        'where vf.cod_venda =:cod_venda and ( f.tipo <> '#39'TR'#39' and f.tipo <' +
        '> '#39'TV'#39' )')
    Left = 512
    Top = 296
    ParamData = <
      item
        Name = 'cod_venda'
      end
      item
        Name = 'cod_venda'
      end>
    object QFormasNFCeCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."COD_VENDA"'
      Required = True
    end
    object QFormasNFCeCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."COD_FORMA"'
      Required = True
    end
    object QFormasNFCeVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."VALOR"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QFormasNFCeTIPO: TStringField
      FieldName = 'TIPO'
      Origin = '"FORMAS_PAGAMENTO"."TIPO"'
      FixedChar = True
      Size = 2
    end
    object QFormasNFCeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"FORMAS_PAGAMENTO"."DESCRICAO"'
    end
    object QFormasNFCeTROCO: TBCDField
      FieldName = 'TROCO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object fdphysfbdrvrlnk1: TFDPhysFBDriverLink
    Left = 464
    Top = 176
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 360
    Top = 168
  end
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 42686.448027141200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '       if <Parametros."Imagem"> = '#39#39' then                       ' +
        '                                               '
      '       begin                              '
      
        '               ReportTitle1.Visible := false;                   ' +
        '                                    '
      '       end;'
      
        '       // esconde informa'#231#227'o do protocolo quando em contingencia' +
        '                                                                ' +
        '                                                                ' +
        '                      '
      '       if <Parametros."Contingencia_Valor"> = '#39#39' then'
      '       begin'
      
        '               Memo5.Visible := false;                          ' +
        '                                        '
      
        '       end;                                                     ' +
        '                                    '
      'end;'
      ''
      'procedure DadosProdutosOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  DadosDesconto.Visible  := <DadosProdutos."vDesc"> > 0;'
      '  DadosAcrescimo.Visible := <DadosProdutos."vOutro"> > 0;      '
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Observacoes.Visible := Trim(<InformacoesAdicionais."OBS">) <> ' +
        #39#39'                '
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     Footer1.Visible := <CalculoImposto."vTroco"> > 0;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 440
    Top = 408
    Datasets = <
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'DadosProdutos'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'Duplicatas'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Eventos'
      end
      item
        DataSetName = 'Fatura'
      end
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'ISSQN'
      end
      item
        DataSetName = 'LocalEntrega'
      end
      item
        DataSetName = 'LocalRetirada'
      end
      item
        DataSetName = 'Pagamento'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Transportador'
      end
      item
        DataSetName = 'Veiculo'
      end
      item
        DataSetName = 'Volumes'
      end>
    Variables = <
      item
        Name = ' User'
        Value = Null
      end
      item
        Name = 'LinhasImpressas'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 72.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      TopMargin = 0.500000000000000000
      LargeDesignHeight = True
      PrintIfEmpty = False
      OnBeforePrint = 'Page1OnBeforePrint'
      object ValorTributos: TfrxMasterData
        FillType = ftBrush
        Height = 32.015752910000000000
        Top = 699.213050000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object Memo17: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 177.637934410000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'Informa'#231#227'o dos Tributos Totais Incidentes '
            '(Lei Federal 12.741/2012): ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baRight
          Left = 177.637934410000000000
          Top = 3.779530000000022000
          Width = 94.488225590000000000
          Height = 26.456690470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            
              '[CalculoImposto."vTotTrib" #n%2,2f] [CalculoImposto."VTribFonte"' +
              ']')
          ParentFont = False
          WordWrap = False
        end
      end
      object MensagemFiscal: TfrxMasterData
        FillType = ftBrush
        Height = 111.385882910000000000
        Top = 797.480830000000000000
        Width = 272.126160000000000000
        RowCount = 1
        Stretched = True
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 48.897650000000000000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulte pela chave de acesso em:'
            '[Identificacao."URL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 77.472480000000010000
          Width = 272.126160000000000000
          Height = 11.338590000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 18.559060000000040000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              'N'#250'mero: [Identificacao."NNF"] - S'#233'rie: [Identificacao."Serie" #n' +
              '#000]'
            
              'Emiss'#227'o [Identificacao."DEmi"] - [Parametros."DescricaoViaEstabe' +
              'lec"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Align = baWidth
          Top = 91.267762909999990000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 1.220469999999977000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."MensagemFiscal"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object Consumidor: TfrxMasterData
        FillType = ftBrush
        Height = 41.574768980000000000
        Top = 933.543910000000000000
        Width = 272.126160000000000000
        RowCount = 1
        Stretched = True
        object Memo58: TfrxMemoView
          Align = baWidth
          Top = 0.779530000000022500
          Width = 272.126160000000000000
          Height = 16.251970940000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CONSUMIDOR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Align = baWidth
          Top = 20.787369840000000000
          Width = 272.126160000000000000
          Height = 17.007839840000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Destinatario."Consumidor"]')
          ParentFont = False
        end
      end
      object Rodape: TfrxMasterData
        FillType = ftBrush
        Height = 175.637892910000000000
        Top = 997.795920000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object ImgQrCode: TfrxPictureView
          Align = baWidth
          Top = 20.322834650000000000
          Width = 272.126160000000000000
          Height = 117.165322600000000000
          Center = True
          Frame.Color = clFuchsia
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Align = baWidth
          Top = 158.181200000000200000
          Width = 272.126160000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulta via leitor de QR Code')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 141.401670000000000000
          Width = 272.126160000000000000
          Height = 13.228344020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Protocolo de Autoriza'#231#227'o')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object DadosProdutos: TfrxMasterData
        FillType = ftBrush
        Height = 26.456702680000000000
        Top = 351.496290000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'DadosProdutosOnBeforePrint'
        DataSetName = 'DadosProdutos'
        RowCount = 0
        Stretched = True
        object Memo131: TfrxMemoView
          ShiftMode = smDontShift
          Width = 75.590560940000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."CProd"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo132: TfrxMemoView
          ShiftMode = smDontShift
          Left = 76.031500940000000000
          Width = 196.535599060000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[DadosProdutos."DescricaoProduto"]')
          ParentFont = False
          WordWrap = False
        end
        object memqCom: TfrxMemoView
          ShiftMode = smDontShift
          Top = 13.496065429999990000
          Width = 79.370093390000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."QCom"] [DadosProdutos."UCom"]')
          ParentFont = False
          WordWrap = False
        end
        object memvUnCom: TfrxMemoView
          ShiftMode = smDontShift
          Left = 79.370078740000000000
          Top = 13.496065429999990000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VUnTrib"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo140: TfrxMemoView
          Left = 173.858267720000000000
          Top = 13.496065429999990000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VProd"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosProdutosHeader: TfrxGroupHeader
        FillType = ftBrush
        Height = 27.590560940000000000
        Top = 302.362400000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        object Memo121: TfrxMemoView
          Left = 56.692913390000000000
          Top = 14.472448269999970000
          Width = 22.677165350000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 79.370078740000000000
          Top = 14.472448269999970000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VL.UNIT')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Top = 1.354328269999996000
          Width = 68.031500940000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 68.472440940000000000
          Top = 1.354328269999996000
          Width = 204.094659060000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Top = 14.472448269999970000
          Width = 56.692913390000000000
          Height = 11.338582680000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 173.858267720000000000
          Top = 14.472448269999970000
          Width = 98.267892280000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          GapY = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'VL.TOTAL')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object DadosPagamentoHeader: TfrxGroupHeader
        FillType = ftBrush
        Height = 98.401630940000000000
        Top = 498.897960000000000000
        Width = 272.126160000000000000
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object memTitDadosPagamento: TfrxMemoView
          Top = 6.338590000000010000
          Width = 128.504020000000000000
          Height = 91.842570940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'QTD. TOTAL DE ITENS'
            ''
            'Valor Produtos'
            'Descontos'
            'Acr'#233'scimos'
            'VALOR A PAGAR'
            ''
            'FORMA DE PAGAMENTO  ')
          ParentFont = False
          WordWrap = False
        end
        object memDadosPagamento: TfrxMemoView
          Left = 128.504020000000000000
          Top = 6.338590000000010000
          Width = 143.622140000000000000
          Height = 91.842570940000000000
          DataSetName = 'Parametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Parametros."QtdeItens"]'
            ''
            '[CalculoImposto."VProd" #n%2.2f]'
            '[CalculoImposto."VDesc" #n%2.2f]'
            '[CalculoImposto."VOutro" #n%2.2f]'
            
              '[<CalculoImposto."VProd"> - <CalculoImposto."VDesc"> + <CalculoI' +
              'mposto."VOutro"> #n%2.2f]'
            ''
            'VALOR')
          ParentFont = False
          WordWrap = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 272.126160000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object DadosPagamento: TfrxMasterData
        FillType = ftBrush
        Height = 14.740159920000000000
        Top = 619.842920000000000000
        Width = 272.126160000000000000
        DataSetName = 'Pagamento'
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          Top = 2.000000000000000000
          Width = 128.504020000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Pagamento."tPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 128.504020000000000000
          Top = 2.110233780000044000
          Width = 143.622140000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Pagamento."vPag"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        PrintChildIfInvisible = True
        object ImgLogo: TfrxPictureView
          Left = 45.354360000000000000
          Top = 2.677180000000000000
          Width = 177.637910000000000000
          Height = 64.252010000000000000
          Center = True
          DataField = 'LogoCarregado'
          DataSetName = 'Parametros'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object DadosDesconto: TfrxDetailData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 400.630180000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object Memo7: TfrxMemoView
          Left = 173.858380000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '- [DadosProdutos."vDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 71.811070000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 173.858380000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."vProd"> - <DadosProdutos."vDesc">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 71.811070000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object DadosAcrescimo: TfrxDetailData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 449.764070000000000000
        Width = 272.126160000000000000
        RowCount = 1
        object Memo11: TfrxMemoView
          Left = 173.858380000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '+ [DadosProdutos."VOutro"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 71.811070000000000000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Acr'#233'scimo')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 173.858380000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[<DadosProdutos."vProd"> + <DadosProdutos."VOutro">]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 71.811070000000000000
          Top = 11.338590000000010000
          Width = 98.267892280000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object Observacoes: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 755.906000000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        RowCount = 1
        Stretched = True
        object Memo21: TfrxMemoView
          Align = baWidth
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '[InformacoesAdicionais."OBS"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 113.385900000000000000
        Width = 272.126160000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Top = 79.929189999999990000
          Width = 272.126160000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE NFC-e - Documento Auxiliar '
            'da Nota Fiscal de Consumidor Eletr'#244'nica')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Top = 111.370130000000000000
          Width = 272.126160000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#227'o permite aproveitamento de cr'#233'dito do ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          ShiftMode = smWhenOverlapped
          Width = 272.126160000000000000
          Height = 73.700811809999990000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          LineSpacing = 4.000000000000000000
          Memo.UTF8W = (
            '[Emitente."XNome"]'
            
              'CNPJ: [Emitente."CNPJ"] - IE: [Emitente."IE"] - IM: [Emitente."I' +
              'M"]'
            '[Emitente."XLgr"], [Emitente."nro"] - [Emitente."xBairro"]'
            '[Emitente."XMun"] - [Emitente."UF"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 19.582674720000000000
        Top = 657.638220000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Memo25: TfrxMemoView
          Top = 3.220469999999978000
          Width = 128.504020000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'TROCO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 128.504020000000000000
          Top = 3.330703780000022000
          Width = 143.622140000000000000
          Height = 12.472440940000000000
          DataSetName = 'Pagamento'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."vTroco" #n%2.2f]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 2.000000000000000000
          Width = 272.126160000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
