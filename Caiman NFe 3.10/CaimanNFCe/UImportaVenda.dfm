object frmImportaVenda: TfrmImportaVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importa Venda'
  ClientHeight = 325
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnImporta: TButton
    Left = 576
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Importar'
    Default = True
    TabOrder = 0
    OnClick = btnImportaClick
  end
  object List: TListBox
    Left = 8
    Top = 8
    Width = 562
    Height = 303
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemHeight = 23
    ParentFont = False
    TabOrder = 1
  end
  object dsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 168
    object dsClienteCod: TStringField
      FieldName = 'Cod'
    end
    object dsClientenome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object dsClientecpf: TStringField
      FieldName = 'cpf'
    end
    object dsClienteendereco: TStringField
      FieldName = 'endereco'
      Size = 50
    end
    object dsClientebairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object dsClientecidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object dsClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object dsClientecep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object dsClienterg: TStringField
      FieldName = 'rg'
    end
    object dsClientefone: TStringField
      FieldName = 'fone'
      Size = 13
    end
  end
  object dsProduto: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'dsProdutoIndex1'
        Fields = 'ordem'
      end>
    IndexName = 'dsProdutoIndex1'
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 120
    object dsProdutoCodigo: TStringField
      FieldName = 'Codigo'
    end
    object dsProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object dsProdutounidade: TStringField
      FieldName = 'unidade'
      Size = 10
    end
    object dsProdutovalor: TCurrencyField
      FieldName = 'valor'
    end
    object dsProdutodesconto: TCurrencyField
      FieldName = 'desconto'
    end
    object dsProdutoquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object dsProdutoaliquota: TStringField
      FieldName = 'aliquota'
      Size = 10
    end
    object dsProdutobarra: TStringField
      FieldName = 'barra'
    end
    object dsProdutocst: TStringField
      FieldName = 'cst'
      Size = 3
    end
    object dsProdutotipo_producao: TStringField
      FieldName = 'tipo_producao'
      Size = 1
    end
    object dsProdutopesado: TStringField
      FieldName = 'pesado'
      Size = 1
    end
    object dsProdutoibpt: TCurrencyField
      FieldName = 'ibpt'
    end
    object dsProdutoNCM: TStringField
      FieldName = 'NCM'
    end
    object dsProdutoordem: TAutoIncField
      FieldName = 'ordem'
    end
  end
  object dsformas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 168
    object dsformasforma: TStringField
      FieldName = 'forma'
    end
    object dsformasvalor: TCurrencyField
      FieldName = 'valor'
    end
    object dsformastipovenda: TIntegerField
      FieldName = 'tipovenda'
    end
  end
  object upCLiente: TFDUpdateSQL
    FetchRowSQL.Strings = (
      'Select '
      '  COD_CLI,'
      '  FJ_CLI,'
      '  NOME_CLI,'
      '  ENDRES_CLI,'
      '  BAIRES_CLI,'
      '  CIDRES_CLI,'
      '  ESTRES_CLI,'
      '  CEPRES_CLI,'
      '  TELRES_CLI,'
      '  CNPJ_CLI,'
      '  DOC_CLI,'
      '  LIMITE_CLI,'
      '  ATIVO_CLI,'
      '  COD_CON,'
      '  OBS_VENDA,'
      '  OBS_CLI,'
      '  ATRAZO_MAXIMO_CLI,'
      '  IMP_SALDO_PENDENTE_CLI,'
      '  LIMITE_CHEQUE,'
      '  TIPO_CREDITO_CLI,'
      '  CONTROLAR_LIMITE,'
      '  BLOQUEADO_CLI'
      'from Cliente '
      'where'
      '  COD_CLI = :COD_CLI')
    ModifySQL.Strings = (
      'update Cliente'
      'set'
      '  ATIVO_CLI = :ATIVO_CLI,'
      '  ATRAZO_MAXIMO_CLI = :ATRAZO_MAXIMO_CLI,'
      '  BAIRES_CLI = :BAIRES_CLI,'
      '  BLOQUEADO_CLI = :BLOQUEADO_CLI,'
      '  CEPRES_CLI = :CEPRES_CLI,'
      '  CIDRES_CLI = :CIDRES_CLI,'
      '  CNPJ_CLI = :CNPJ_CLI,'
      '  COD_CLI = :COD_CLI,'
      '  COD_CON = :COD_CON,'
      '  CONTROLAR_LIMITE = :CONTROLAR_LIMITE,'
      '  DOC_CLI = :DOC_CLI,'
      '  ENDRES_CLI = :ENDRES_CLI,'
      '  ESTRES_CLI = :ESTRES_CLI,'
      '  FJ_CLI = :FJ_CLI,'
      '  IMP_SALDO_PENDENTE_CLI = :IMP_SALDO_PENDENTE_CLI,'
      '  LIMITE_CHEQUE = :LIMITE_CHEQUE,'
      '  LIMITE_CLI = :LIMITE_CLI,'
      '  NOME_CLI = :NOME_CLI,'
      '  OBS_CLI = :OBS_CLI,'
      '  OBS_VENDA = :OBS_VENDA,'
      '  TELRES_CLI = :TELRES_CLI,'
      '  TIPO_CREDITO_CLI = :TIPO_CREDITO_CLI'
      'where'
      '  COD_CLI = :OLD_COD_CLI')
    InsertSQL.Strings = (
      'insert into Cliente'
      
        '  (ATIVO_CLI, ATRAZO_MAXIMO_CLI, BAIRES_CLI, BLOQUEADO_CLI, CEPR' +
        'ES_CLI, '
      
        '   CIDRES_CLI, CNPJ_CLI, COD_CLI, COD_CON, CONTROLAR_LIMITE, DOC' +
        '_CLI, ENDRES_CLI, '
      
        '   ESTRES_CLI, FJ_CLI, IMP_SALDO_PENDENTE_CLI, LIMITE_CHEQUE, LI' +
        'MITE_CLI, '
      '   NOME_CLI, OBS_CLI, OBS_VENDA, TELRES_CLI, TIPO_CREDITO_CLI)'
      'values'
      
        '  (:ATIVO_CLI, :ATRAZO_MAXIMO_CLI, :BAIRES_CLI, :BLOQUEADO_CLI, ' +
        ':CEPRES_CLI, '
      
        '   :CIDRES_CLI, :CNPJ_CLI, :COD_CLI, :COD_CON, :CONTROLAR_LIMITE' +
        ', :DOC_CLI, '
      
        '   :ENDRES_CLI, :ESTRES_CLI, :FJ_CLI, :IMP_SALDO_PENDENTE_CLI, :' +
        'LIMITE_CHEQUE, '
      
        '   :LIMITE_CLI, :NOME_CLI, :OBS_CLI, :OBS_VENDA, :TELRES_CLI, :T' +
        'IPO_CREDITO_CLI)')
    DeleteSQL.Strings = (
      'delete from Cliente'
      'where'
      '  COD_CLI = :OLD_COD_CLI')
    Left = 288
    Top = 64
  end
  object QClientes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from Cliente')
    UpdateObject = upCLiente
    Left = 208
    Top = 64
    object QClientesCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QClientesFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = '"CLIENTE"."FJ_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClientesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QClientesENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QClientesBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QClientesCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QClientesESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QClientesCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QClientesTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object QClientesCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QClientesDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = '"CLIENTE"."DOC_CLI"'
    end
    object QClientesLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = '"CLIENTE"."LIMITE_CLI"'
      Precision = 18
      Size = 2
    end
    object QClientesATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = '"CLIENTE"."ATIVO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClientesCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = '"CLIENTE"."COD_CON"'
      Required = True
    end
    object QClientesOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = '"CLIENTE"."OBS_VENDA"'
      Size = 200
    end
    object QClientesOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = '"CLIENTE"."OBS_CLI"'
      Size = 500
    end
    object QClientesATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = '"CLIENTE"."ATRAZO_MAXIMO_CLI"'
    end
    object QClientesIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = '"CLIENTE"."IMP_SALDO_PENDENTE_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClientesLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = '"CLIENTE"."LIMITE_CHEQUE"'
      Precision = 18
      Size = 2
    end
    object QClientesTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = '"CLIENTE"."TIPO_CREDITO_CLI"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QClientesCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = '"CLIENTE"."CONTROLAR_LIMITE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClientesBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = '"CLIENTE"."BLOQUEADO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QProdutos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from produto')
    UpdateObject = upProdutos
    Left = 88
    Top = 112
    object QProdutosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutosATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = '"PRODUTO"."ATIVO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutosVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = '"PRODUTO"."VALOR_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdutosPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = '"PRODUTO"."PROMOCAO_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdutosPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = '"PRODUTO"."PRECO_PRAZO_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdutosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QProdutosDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QProdutosPRODUTO_PESADO_PRO: TStringField
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = '"PRODUTO"."PRODUTO_PESADO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutosCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = '"PRODUTO"."COD_NCM"'
      Size = 8
    end
    object QProdutosTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = '"PRODUTO"."TIPO_PRODUCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutosCOD_PRODUTO_ESTOQUE: TIntegerField
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = '"PRODUTO"."COD_PRODUTO_ESTOQUE"'
      Required = True
    end
    object QProdutosCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QProdutosICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
      Required = True
    end
    object QProdutosCODIGO_UNIDADE_SAIDA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = '"PRODUTO"."CODIGO_UNIDADE_SAIDA"'
      Required = True
    end
    object QProdutosREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = '"PRODUTO"."REFERENCIA_PRO"'
      Size = 30
    end
    object QProdutosCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = '"PRODUTO"."CST_CF_EST"'
      FixedChar = True
      Size = 3
    end
    object QProdutosLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = '"PRODUTO"."LOCALIZACAO_PRO"'
    end
    object QProdutosCAMINHO_FOTO_PRO: TStringField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = '"PRODUTO"."CAMINHO_FOTO_PRO"'
      Size = 255
    end
    object QProdutosALIQ_IBPT_NAC: TBCDField
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = '"PRODUTO"."ALIQ_IBPT_NAC"'
      Precision = 18
      Size = 2
    end
    object QProdutosALIQ_IBPT_IMP: TBCDField
      FieldName = 'ALIQ_IBPT_IMP'
      Origin = '"PRODUTO"."ALIQ_IBPT_IMP"'
      Precision = 18
      Size = 2
    end
  end
  object upProdutos: TFDUpdateSQL
    FetchRowSQL.Strings = (
      'Select '
      '  COD_PRO,'
      '  ATIVO_PRO,'
      '  VALOR_PRO,'
      '  PROMOCAO_PRO,'
      '  PRECO_PRAZO_PRO,'
      '  NOME_PRO,'
      '  DESC_CUPOM,'
      '  PRODUTO_PESADO_PRO,'
      '  COD_NCM,'
      '  TIPO_PRODUCAO,'
      '  COD_PRODUTO_ESTOQUE,'
      '  CODIGO_BARRA_PRO,'
      '  ICMS_CF_EST,'
      '  CODIGO_UNIDADE_SAIDA,'
      '  REFERENCIA_PRO,'
      '  CST_CF_EST,'
      '  LOCALIZACAO_PRO,'
      '  CAMINHO_FOTO_PRO,'
      '  ALIQ_IBPT_NAC,'
      '  ALIQ_IBPT_IMP'
      'from produto '
      'where'
      '  COD_PRO = :COD_PRO')
    ModifySQL.Strings = (
      'update produto'
      'set'
      '  ALIQ_IBPT_IMP = :ALIQ_IBPT_IMP,'
      '  ALIQ_IBPT_NAC = :ALIQ_IBPT_NAC,'
      '  ATIVO_PRO = :ATIVO_PRO,'
      '  CAMINHO_FOTO_PRO = :CAMINHO_FOTO_PRO,'
      '  COD_NCM = :COD_NCM,'
      '  COD_PRO = :COD_PRO,'
      '  COD_PRODUTO_ESTOQUE = :COD_PRODUTO_ESTOQUE,'
      '  CODIGO_BARRA_PRO = :CODIGO_BARRA_PRO,'
      '  CODIGO_UNIDADE_SAIDA = :CODIGO_UNIDADE_SAIDA,'
      '  CST_CF_EST = :CST_CF_EST,'
      '  DESC_CUPOM = :DESC_CUPOM,'
      '  ICMS_CF_EST = :ICMS_CF_EST,'
      '  LOCALIZACAO_PRO = :LOCALIZACAO_PRO,'
      '  NOME_PRO = :NOME_PRO,'
      '  PRECO_PRAZO_PRO = :PRECO_PRAZO_PRO,'
      '  PRODUTO_PESADO_PRO = :PRODUTO_PESADO_PRO,'
      '  PROMOCAO_PRO = :PROMOCAO_PRO,'
      '  REFERENCIA_PRO = :REFERENCIA_PRO,'
      '  TIPO_PRODUCAO = :TIPO_PRODUCAO,'
      '  VALOR_PRO = :VALOR_PRO'
      'where'
      '  COD_PRO = :OLD_COD_PRO')
    InsertSQL.Strings = (
      'insert into produto'
      
        '  (ALIQ_IBPT_IMP, ALIQ_IBPT_NAC, ATIVO_PRO, CAMINHO_FOTO_PRO, CO' +
        'D_NCM, '
      
        '   COD_PRO, COD_PRODUTO_ESTOQUE, CODIGO_BARRA_PRO, CODIGO_UNIDAD' +
        'E_SAIDA, '
      
        '   CST_CF_EST, DESC_CUPOM, ICMS_CF_EST, LOCALIZACAO_PRO, NOME_PR' +
        'O, PRECO_PRAZO_PRO, '
      
        '   PRODUTO_PESADO_PRO, PROMOCAO_PRO, REFERENCIA_PRO, TIPO_PRODUC' +
        'AO, VALOR_PRO)'
      'values'
      
        '  (:ALIQ_IBPT_IMP, :ALIQ_IBPT_NAC, :ATIVO_PRO, :CAMINHO_FOTO_PRO' +
        ', :COD_NCM, '
      
        '   :COD_PRO, :COD_PRODUTO_ESTOQUE, :CODIGO_BARRA_PRO, :CODIGO_UN' +
        'IDADE_SAIDA, '
      
        '   :CST_CF_EST, :DESC_CUPOM, :ICMS_CF_EST, :LOCALIZACAO_PRO, :NO' +
        'ME_PRO, '
      
        '   :PRECO_PRAZO_PRO, :PRODUTO_PESADO_PRO, :PROMOCAO_PRO, :REFERE' +
        'NCIA_PRO, '
      '   :TIPO_PRODUCAO, :VALOR_PRO)')
    DeleteSQL.Strings = (
      'delete from produto'
      'where'
      '  COD_PRO = :OLD_COD_PRO')
    Left = 152
    Top = 112
  end
  object Qaux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 272
    Top = 176
  end
  object QEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from ESTOQUE where cod_pro=:cod_pro')
    UpdateObject = upEstoque
    Left = 192
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_pro'
        ParamType = ptUnknown
      end>
    object QEstoqueCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ESTOQUE"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEstoqueESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = '"ESTOQUE"."ESTOQUE"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QEstoqueDATA_ESTOQUE: TDateField
      FieldName = 'DATA_ESTOQUE'
      Origin = '"ESTOQUE"."DATA_ESTOQUE"'
      Required = True
    end
    object QEstoqueCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ESTOQUE"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEstoqueCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = '"ESTOQUE"."CODIGO_LOCAL_ESTOQUE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEstoqueESTOQUE_INICIAL: TBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Origin = '"ESTOQUE"."ESTOQUE_INICIAL"'
      Precision = 18
      Size = 3
    end
  end
  object upEstoque: TFDUpdateSQL
    FetchRowSQL.Strings = (
      'Select '
      '  COD_PRO,'
      '  ESTOQUE,'
      '  DATA_ESTOQUE,'
      '  COD_EMP,'
      '  CODIGO_LOCAL_ESTOQUE,'
      '  ESTOQUE_INICIAL'
      'from ESTOQUE '
      'where'
      '  COD_EMP = :COD_EMP and'
      '  COD_PRO = :COD_PRO')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  COD_EMP = :COD_EMP,'
      '  COD_PRO = :COD_PRO,'
      '  CODIGO_LOCAL_ESTOQUE = :CODIGO_LOCAL_ESTOQUE,'
      '  DATA_ESTOQUE = :DATA_ESTOQUE,'
      '  ESTOQUE = :ESTOQUE,'
      '  ESTOQUE_INICIAL = :ESTOQUE_INICIAL'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_PRO = :OLD_COD_PRO')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      
        '  (COD_EMP, COD_PRO, CODIGO_LOCAL_ESTOQUE, DATA_ESTOQUE, ESTOQUE' +
        ', ESTOQUE_INICIAL)'
      'values'
      
        '  (:COD_EMP, :COD_PRO, :CODIGO_LOCAL_ESTOQUE, :DATA_ESTOQUE, :ES' +
        'TOQUE, '
      '   :ESTOQUE_INICIAL)')
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_PRO = :OLD_COD_PRO')
    Left = 264
    Top = 232
  end
  object IBSQL1: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 136
    Top = 216
  end
  object QInsOrcamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_ORCAMENTO( :C, :S, :DATA, :CODCLI, :CODTPV, :CODE' +
        'MP, :CODVEND, :CAIXA)')
    Left = 72
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'C'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'S'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODTPV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAIXA'
        ParamType = ptUnknown
      end>
    object QInsOrcamentoSEQUENCIA: TLargeintField
      FieldName = 'SEQUENCIA'
      Origin = 'SP_INSERT_DAV.SEQUENCIA'
    end
    object QInsOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_ORCAMENTO.CODIGO'
    end
  end
  object dsChequesContas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'dsChequesContasIndex1'
        Fields = 'PARCELA'
      end>
    IndexFieldNames = 'PARCELA'
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 32
    object dsChequesContasPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object dsChequesContasTIPO: TStringField
      FieldName = 'TIPO'
    end
    object dsChequesContasVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object dsChequesContasVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object dsChequesContasNUM: TStringField
      FieldName = 'NUM'
    end
  end
  object PegaCS: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'select * from PEGA_COD_SEQ_ORCAMENTO')
    Left = 32
    Top = 176
    object PegaCSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"PEGA_COD_SEQ_ORCAMENTO"."CODIGO"'
    end
    object PegaCSSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = '"PEGA_COD_SEQ_ORCAMENTO"."SEQUENCIA"'
    end
  end
end
