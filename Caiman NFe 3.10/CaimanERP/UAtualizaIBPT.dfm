object frmAtualizaIBPT: TfrmAtualizaIBPT
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza Produtos'
  ClientHeight = 66
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 182
    Height = 13
    Caption = 'Atualizando Produtos Tabela IBPT :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pb1: TProgressBar
    Left = 8
    Top = 27
    Width = 345
    Height = 17
    TabOrder = 0
  end
  object BaixaTabela: TACBrIBPTax
    ProxyPort = '80'
    URLDownload = 'http://www.kadoshiautomacao.com.br/ibpt/tabela.csv'
    Left = 280
    Top = 8
  end
  object QProduto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRProduto
    UpdateObject = UPProduto
    SQL.Strings = (
      'select * from produto')
    Left = 160
    Top = 8
    object QProdutoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutoCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = '"PRODUTO"."COD_LAB"'
      Required = True
    end
    object QProdutoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"PRODUTO"."COD_SEC"'
      Required = True
    end
    object QProdutoVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = '"PRODUTO"."VALOR_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdutoPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = '"PRODUTO"."PROMOCAO_PRO"'
      Precision = 18
      Size = 2
    end
    object QProdutoCONTROLA_ESTOQUE_PRO: TStringField
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = '"PRODUTO"."CONTROLA_ESTOQUE_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoCOMISSAO_PRO: TBCDField
      FieldName = 'COMISSAO_PRO'
      Origin = '"PRODUTO"."COMISSAO_PRO"'
      Precision = 18
      Size = 2
    end
    object QProdutoQUANT_UNIDADE_ENTRADA: TBCDField
      FieldName = 'QUANT_UNIDADE_ENTRADA'
      Origin = '"PRODUTO"."QUANT_UNIDADE_ENTRADA"'
      Precision = 18
      Size = 2
    end
    object QProdutoESTOQUE_MINIMO_PRO: TBCDField
      FieldName = 'ESTOQUE_MINIMO_PRO'
      Origin = '"PRODUTO"."ESTOQUE_MINIMO_PRO"'
      Precision = 18
      Size = 2
    end
    object QProdutoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QProdutoDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QProdutoATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = '"PRODUTO"."ATIVO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoMARGEM_LUCRO_PRO: TBCDField
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = '"PRODUTO"."MARGEM_LUCRO_PRO"'
      Precision = 18
      Size = 2
    end
    object QProdutoLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = '"PRODUTO"."LOCALIZACAO_PRO"'
    end
    object QProdutoPRODUTO_PESADO_PRO: TStringField
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = '"PRODUTO"."PRODUTO_PESADO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoCOD_SETOR: TIntegerField
      FieldName = 'COD_SETOR'
      Origin = '"PRODUTO"."COD_SETOR"'
    end
    object QProdutoTECLA_ATALHO_PRO: TIntegerField
      FieldName = 'TECLA_ATALHO_PRO'
      Origin = '"PRODUTO"."TECLA_ATALHO_PRO"'
    end
    object QProdutoINDICE_RECEITA_PRO: TIntegerField
      FieldName = 'INDICE_RECEITA_PRO'
      Origin = '"PRODUTO"."INDICE_RECEITA_PRO"'
    end
    object QProdutoDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = '"PRODUTO"."DIAS_VALIDADE_PRO"'
    end
    object QProdutoREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = '"PRODUTO"."REFERENCIA_PRO"'
      Size = 30
    end
    object QProdutoCOMPLEMENTO_PRO: TStringField
      FieldName = 'COMPLEMENTO_PRO'
      Origin = '"PRODUTO"."COMPLEMENTO_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoICMS_CONT_EST: TIntegerField
      FieldName = 'ICMS_CONT_EST'
      Origin = '"PRODUTO"."ICMS_CONT_EST"'
    end
    object QProdutoICMS_CONT_FORA: TIntegerField
      FieldName = 'ICMS_CONT_FORA'
      Origin = '"PRODUTO"."ICMS_CONT_FORA"'
    end
    object QProdutoICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
    end
    object QProdutoICMS_CF_FORA: TIntegerField
      FieldName = 'ICMS_CF_FORA'
      Origin = '"PRODUTO"."ICMS_CF_FORA"'
    end
    object QProdutoCST_CONT_EST: TStringField
      FieldName = 'CST_CONT_EST'
      Origin = '"PRODUTO"."CST_CONT_EST"'
      FixedChar = True
      Size = 3
    end
    object QProdutoCST_CONT_FORA: TStringField
      FieldName = 'CST_CONT_FORA'
      Origin = '"PRODUTO"."CST_CONT_FORA"'
      FixedChar = True
      Size = 3
    end
    object QProdutoCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = '"PRODUTO"."CST_CF_EST"'
      FixedChar = True
      Size = 3
    end
    object QProdutoCST_CF_FORA: TStringField
      FieldName = 'CST_CF_FORA'
      Origin = '"PRODUTO"."CST_CF_FORA"'
      FixedChar = True
      Size = 3
    end
    object QProdutoCAMINHO_FOTO_PRO: TStringField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = '"PRODUTO"."CAMINHO_FOTO_PRO"'
      Size = 150
    end
    object QProdutoSAIR_TABELA_PRECO: TStringField
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = '"PRODUTO"."SAIR_TABELA_PRECO"'
      FixedChar = True
      Size = 1
    end
    object QProdutoCFOP_VENDAS_CONT_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_EST'
      Origin = '"PRODUTO"."CFOP_VENDAS_CONT_EST"'
    end
    object QProdutoCFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = '"PRODUTO"."CFOP_VENDAS_CF_EST"'
    end
    object QProdutoCFOP_VENDAS_CONT_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_FORA'
      Origin = '"PRODUTO"."CFOP_VENDAS_CONT_FORA"'
    end
    object QProdutoCFOP_VENDAS_CF_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_FORA'
      Origin = '"PRODUTO"."CFOP_VENDAS_CF_FORA"'
    end
    object QProdutoST_CONT_EST: TStringField
      FieldName = 'ST_CONT_EST'
      Origin = '"PRODUTO"."ST_CONT_EST"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoVR_AGREG_CONT_EST: TBCDField
      FieldName = 'VR_AGREG_CONT_EST'
      Origin = '"PRODUTO"."VR_AGREG_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object QProdutoIPI_CONT_EST: TBCDField
      FieldName = 'IPI_CONT_EST'
      Origin = '"PRODUTO"."IPI_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object QProdutoIPI_CF_EST: TBCDField
      FieldName = 'IPI_CF_EST'
      Origin = '"PRODUTO"."IPI_CF_EST"'
      Precision = 18
      Size = 2
    end
    object QProdutoIPI_CONT_FORA: TBCDField
      FieldName = 'IPI_CONT_FORA'
      Origin = '"PRODUTO"."IPI_CONT_FORA"'
      Precision = 18
      Size = 2
    end
    object QProdutoIPI_CF_FORA: TBCDField
      FieldName = 'IPI_CF_FORA'
      Origin = '"PRODUTO"."IPI_CF_FORA"'
      Precision = 18
      Size = 2
    end
    object QProdutoCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = '"PRODUTO"."COD_NCM"'
      Size = 8
    end
    object QProdutoCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = '"PRODUTO"."CLASSIFICACAO_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object QProdutoCODIGO_TIPO: TIntegerField
      FieldName = 'CODIGO_TIPO'
      Origin = '"PRODUTO"."CODIGO_TIPO"'
      Required = True
    end
    object QProdutoCOD_PRODUTO_ESTOQUE: TIntegerField
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = '"PRODUTO"."COD_PRODUTO_ESTOQUE"'
      Required = True
    end
    object QProdutoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = '"PRODUTO"."COD_GRUPO"'
    end
    object QProdutoSUB_GRUPO: TIntegerField
      FieldName = 'SUB_GRUPO'
      Origin = '"PRODUTO"."SUB_GRUPO"'
    end
    object QProdutoPRECO_PROGRAMADO: TBCDField
      FieldName = 'PRECO_PROGRAMADO'
      Origin = '"PRODUTO"."PRECO_PROGRAMADO"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = '"PRODUTO"."ALIQUOTA_PIS"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = '"PRODUTO"."ALIQUOTA_COFINS"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQUOTA_IR: TBCDField
      FieldName = 'ALIQUOTA_IR'
      Origin = '"PRODUTO"."ALIQUOTA_IR"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQUOTA_CSLL: TBCDField
      FieldName = 'ALIQUOTA_CSLL'
      Origin = '"PRODUTO"."ALIQUOTA_CSLL"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQUOTA_OUTRAS: TBCDField
      FieldName = 'ALIQUOTA_OUTRAS'
      Origin = '"PRODUTO"."ALIQUOTA_OUTRAS"'
      Precision = 18
      Size = 2
    end
    object QProdutoISENTO_PIS_COFINS_PRO: TStringField
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = '"PRODUTO"."ISENTO_PIS_COFINS_PRO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoPRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = '"PRODUTO"."PRECO_CUSTO"'
      Precision = 18
    end
    object QProdutoCREDITO_ICMS: TBCDField
      FieldName = 'CREDITO_ICMS'
      Origin = '"PRODUTO"."CREDITO_ICMS"'
      Precision = 18
    end
    object QProdutoPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = '"PRODUTO"."PRECO_PRAZO_PRO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QProdutoTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = '"PRODUTO"."TIPO_PRODUCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutoCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QProdutoCODIGO_UNIDADE_SAIDA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = '"PRODUTO"."CODIGO_UNIDADE_SAIDA"'
      Required = True
    end
    object QProdutoCODIGO_UNIDADE_ENTRADA: TIntegerField
      FieldName = 'CODIGO_UNIDADE_ENTRADA'
      Origin = '"PRODUTO"."CODIGO_UNIDADE_ENTRADA"'
      Required = True
    end
    object QProdutoPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = '"PRODUTO"."PRECO_PROGRAMADO_PRAZO"'
      Precision = 18
      Size = 2
    end
    object QProdutoRED_CF_EST: TBCDField
      FieldName = 'RED_CF_EST'
      Origin = '"PRODUTO"."RED_CF_EST"'
      Precision = 18
      Size = 2
    end
    object QProdutoRED_CF_FORA: TBCDField
      FieldName = 'RED_CF_FORA'
      Origin = '"PRODUTO"."RED_CF_FORA"'
      Precision = 18
      Size = 2
    end
    object QProdutoRED_CONT_EST: TBCDField
      FieldName = 'RED_CONT_EST'
      Origin = '"PRODUTO"."RED_CONT_EST"'
      Precision = 18
      Size = 2
    end
    object QProdutoRED_CONT_FORA: TBCDField
      FieldName = 'RED_CONT_FORA'
      Origin = '"PRODUTO"."RED_CONT_FORA"'
      Precision = 18
      Size = 2
    end
    object QProdutoDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = '"PRODUTO"."DATA_VALIDADE"'
    end
    object QProdutoCODIGO_SETOR_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_SETOR_ESTOQUE'
      Origin = '"PRODUTO"."CODIGO_SETOR_ESTOQUE"'
      Required = True
    end
    object QProdutoORIG: TIntegerField
      FieldName = 'ORIG'
      Origin = '"PRODUTO"."ORIG"'
    end
    object QProdutoCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"PRODUTO"."CSOSN"'
      Size = 3
    end
    object QProdutoIPI: TFloatField
      FieldName = 'IPI'
      Origin = '"PRODUTO"."IPI"'
    end
    object QProdutoICMS: TFloatField
      FieldName = 'ICMS'
      Origin = '"PRODUTO"."ICMS"'
    end
    object QProdutoRICMS: TFloatField
      FieldName = 'RICMS'
      Origin = '"PRODUTO"."RICMS"'
    end
    object QProdutoIVA: TFloatField
      FieldName = 'IVA'
      Origin = '"PRODUTO"."IVA"'
    end
    object QProdutoPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"PRODUTO"."PIS"'
    end
    object QProdutoCONFINS: TFloatField
      FieldName = 'CONFINS'
      Origin = '"PRODUTO"."CONFINS"'
    end
    object QProdutoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Origin = '"PRODUTO"."TAMANHO"'
      Size = 10
    end
    object QProdutoCOR: TStringField
      FieldName = 'COR'
      Origin = '"PRODUTO"."COR"'
      Size = 40
    end
    object QProdutoOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"PRODUTO"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QProdutoCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO"."CST_PIS"'
      Size = 3
    end
    object QProdutoCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO"."CST_COFINS"'
      Size = 3
    end
    object QProdutoCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"PRODUTO"."CST_IPI"'
      Size = 3
    end
    object QProdutoULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = '"PRODUTO"."ULTIMA_ALTERACAO"'
    end
    object QProdutoVALOR_ATACADO: TBCDField
      FieldName = 'VALOR_ATACADO'
      Origin = '"PRODUTO"."VALOR_ATACADO"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQ_IBPT_NAC: TBCDField
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = '"PRODUTO"."ALIQ_IBPT_NAC"'
      Precision = 18
      Size = 2
    end
    object QProdutoALIQ_IBPT_IMP: TBCDField
      FieldName = 'ALIQ_IBPT_IMP'
      Origin = '"PRODUTO"."ALIQ_IBPT_IMP"'
      Precision = 18
      Size = 2
    end
  end
  object TRProduto: TFDTransaction
    Connection = DM.IBDatabase
    Left = 80
    Top = 8
  end
  object UPProduto: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into produto'
      
        '  (ALIQ_IBPT_IMP, ALIQ_IBPT_NAC, ALIQUOTA_COFINS, ALIQUOTA_CSLL,' +
        ' ALIQUOTA_IR, '
      
        '   ALIQUOTA_OUTRAS, ALIQUOTA_PIS, ATIVO_PRO, CAMINHO_FOTO_PRO, C' +
        'FOP_VENDAS_CF_EST, '
      
        '   CFOP_VENDAS_CF_FORA, CFOP_VENDAS_CONT_EST, CFOP_VENDAS_CONT_F' +
        'ORA, CLASSIFICACAO_FISCAL, '
      
        '   COD_GRUPO, COD_LAB, COD_NCM, COD_PRO, COD_PRODUTO_ESTOQUE, CO' +
        'D_SEC, '
      
        '   COD_SETOR, CODIGO_BARRA_PRO, CODIGO_SETOR_ESTOQUE, CODIGO_TIP' +
        'O, CODIGO_UNIDADE_ENTRADA, '
      
        '   CODIGO_UNIDADE_SAIDA, COMISSAO_PRO, COMPLEMENTO_PRO, CONFINS,' +
        ' CONTROLA_ESTOQUE_PRO, '
      
        '   COR, CREDITO_ICMS, CSOSN, CST_CF_EST, CST_CF_FORA, CST_COFINS' +
        ', CST_CONT_EST, '
      
        '   CST_CONT_FORA, CST_IPI, CST_PIS, DATA_VALIDADE, DESC_CUPOM, D' +
        'IAS_VALIDADE_PRO, '
      
        '   ESTOQUE_MINIMO_PRO, ICMS, ICMS_CF_EST, ICMS_CF_FORA, ICMS_CON' +
        'T_EST, '
      
        '   ICMS_CONT_FORA, INDICE_RECEITA_PRO, IPI, IPI_CF_EST, IPI_CF_F' +
        'ORA, IPI_CONT_EST, '
      
        '   IPI_CONT_FORA, ISENTO_PIS_COFINS_PRO, IVA, LOCALIZACAO_PRO, M' +
        'ARGEM_LUCRO_PRO, '
      
        '   NOME_PRO, OBS, ORIG, PIS, PRECO_CUSTO, PRECO_PRAZO_PRO, PRECO' +
        '_PROGRAMADO, '
      
        '   PRECO_PROGRAMADO_PRAZO, PRODUTO_PESADO_PRO, PROMOCAO_PRO, QUA' +
        'NT_UNIDADE_ENTRADA, '
      
        '   RED_CF_EST, RED_CF_FORA, RED_CONT_EST, RED_CONT_FORA, REFEREN' +
        'CIA_PRO, '
      
        '   RICMS, SAIR_TABELA_PRECO, ST_CONT_EST, SUB_GRUPO, TAMANHO, TE' +
        'CLA_ATALHO_PRO, '
      
        '   TIPO_PRODUCAO, ULTIMA_ALTERACAO, VALOR_ATACADO, VALOR_PRO, VR' +
        '_AGREG_CONT_EST)'
      'values'
      
        '  (:ALIQ_IBPT_IMP, :ALIQ_IBPT_NAC, :ALIQUOTA_COFINS, :ALIQUOTA_C' +
        'SLL, :ALIQUOTA_IR, '
      
        '   :ALIQUOTA_OUTRAS, :ALIQUOTA_PIS, :ATIVO_PRO, :CAMINHO_FOTO_PR' +
        'O, :CFOP_VENDAS_CF_EST, '
      
        '   :CFOP_VENDAS_CF_FORA, :CFOP_VENDAS_CONT_EST, :CFOP_VENDAS_CON' +
        'T_FORA, '
      
        '   :CLASSIFICACAO_FISCAL, :COD_GRUPO, :COD_LAB, :COD_NCM, :COD_P' +
        'RO, :COD_PRODUTO_ESTOQUE, '
      
        '   :COD_SEC, :COD_SETOR, :CODIGO_BARRA_PRO, :CODIGO_SETOR_ESTOQU' +
        'E, :CODIGO_TIPO, '
      
        '   :CODIGO_UNIDADE_ENTRADA, :CODIGO_UNIDADE_SAIDA, :COMISSAO_PRO' +
        ', :COMPLEMENTO_PRO, '
      
        '   :CONFINS, :CONTROLA_ESTOQUE_PRO, :COR, :CREDITO_ICMS, :CSOSN,' +
        ' :CST_CF_EST, '
      
        '   :CST_CF_FORA, :CST_COFINS, :CST_CONT_EST, :CST_CONT_FORA, :CS' +
        'T_IPI, '
      
        '   :CST_PIS, :DATA_VALIDADE, :DESC_CUPOM, :DIAS_VALIDADE_PRO, :E' +
        'STOQUE_MINIMO_PRO, '
      
        '   :ICMS, :ICMS_CF_EST, :ICMS_CF_FORA, :ICMS_CONT_EST, :ICMS_CON' +
        'T_FORA, '
      
        '   :INDICE_RECEITA_PRO, :IPI, :IPI_CF_EST, :IPI_CF_FORA, :IPI_CO' +
        'NT_EST, '
      
        '   :IPI_CONT_FORA, :ISENTO_PIS_COFINS_PRO, :IVA, :LOCALIZACAO_PR' +
        'O, :MARGEM_LUCRO_PRO, '
      
        '   :NOME_PRO, :OBS, :ORIG, :PIS, :PRECO_CUSTO, :PRECO_PRAZO_PRO,' +
        ' :PRECO_PROGRAMADO, '
      
        '   :PRECO_PROGRAMADO_PRAZO, :PRODUTO_PESADO_PRO, :PROMOCAO_PRO, ' +
        ':QUANT_UNIDADE_ENTRADA, '
      
        '   :RED_CF_EST, :RED_CF_FORA, :RED_CONT_EST, :RED_CONT_FORA, :RE' +
        'FERENCIA_PRO, '
      
        '   :RICMS, :SAIR_TABELA_PRECO, :ST_CONT_EST, :SUB_GRUPO, :TAMANH' +
        'O, :TECLA_ATALHO_PRO, '
      
        '   :TIPO_PRODUCAO, :ULTIMA_ALTERACAO, :VALOR_ATACADO, :VALOR_PRO' +
        ', :VR_AGREG_CONT_EST)')
    ModifySQL.Strings = (
      'update produto'
      'set'
      '  ALIQ_IBPT_IMP = :ALIQ_IBPT_IMP,'
      '  ALIQ_IBPT_NAC = :ALIQ_IBPT_NAC,'
      '  ALIQUOTA_COFINS = :ALIQUOTA_COFINS,'
      '  ALIQUOTA_CSLL = :ALIQUOTA_CSLL,'
      '  ALIQUOTA_IR = :ALIQUOTA_IR,'
      '  ALIQUOTA_OUTRAS = :ALIQUOTA_OUTRAS,'
      '  ALIQUOTA_PIS = :ALIQUOTA_PIS,'
      '  ATIVO_PRO = :ATIVO_PRO,'
      '  CAMINHO_FOTO_PRO = :CAMINHO_FOTO_PRO,'
      '  CFOP_VENDAS_CF_EST = :CFOP_VENDAS_CF_EST,'
      '  CFOP_VENDAS_CF_FORA = :CFOP_VENDAS_CF_FORA,'
      '  CFOP_VENDAS_CONT_EST = :CFOP_VENDAS_CONT_EST,'
      '  CFOP_VENDAS_CONT_FORA = :CFOP_VENDAS_CONT_FORA,'
      '  CLASSIFICACAO_FISCAL = :CLASSIFICACAO_FISCAL,'
      '  COD_GRUPO = :COD_GRUPO,'
      '  COD_LAB = :COD_LAB,'
      '  COD_NCM = :COD_NCM,'
      '  COD_PRO = :COD_PRO,'
      '  COD_PRODUTO_ESTOQUE = :COD_PRODUTO_ESTOQUE,'
      '  COD_SEC = :COD_SEC,'
      '  COD_SETOR = :COD_SETOR,'
      '  CODIGO_BARRA_PRO = :CODIGO_BARRA_PRO,'
      '  CODIGO_SETOR_ESTOQUE = :CODIGO_SETOR_ESTOQUE,'
      '  CODIGO_TIPO = :CODIGO_TIPO,'
      '  CODIGO_UNIDADE_ENTRADA = :CODIGO_UNIDADE_ENTRADA,'
      '  CODIGO_UNIDADE_SAIDA = :CODIGO_UNIDADE_SAIDA,'
      '  COMISSAO_PRO = :COMISSAO_PRO,'
      '  COMPLEMENTO_PRO = :COMPLEMENTO_PRO,'
      '  CONFINS = :CONFINS,'
      '  CONTROLA_ESTOQUE_PRO = :CONTROLA_ESTOQUE_PRO,'
      '  COR = :COR,'
      '  CREDITO_ICMS = :CREDITO_ICMS,'
      '  CSOSN = :CSOSN,'
      '  CST_CF_EST = :CST_CF_EST,'
      '  CST_CF_FORA = :CST_CF_FORA,'
      '  CST_COFINS = :CST_COFINS,'
      '  CST_CONT_EST = :CST_CONT_EST,'
      '  CST_CONT_FORA = :CST_CONT_FORA,'
      '  CST_IPI = :CST_IPI,'
      '  CST_PIS = :CST_PIS,'
      '  DATA_VALIDADE = :DATA_VALIDADE,'
      '  DESC_CUPOM = :DESC_CUPOM,'
      '  DIAS_VALIDADE_PRO = :DIAS_VALIDADE_PRO,'
      '  ESTOQUE_MINIMO_PRO = :ESTOQUE_MINIMO_PRO,'
      '  ICMS = :ICMS,'
      '  ICMS_CF_EST = :ICMS_CF_EST,'
      '  ICMS_CF_FORA = :ICMS_CF_FORA,'
      '  ICMS_CONT_EST = :ICMS_CONT_EST,'
      '  ICMS_CONT_FORA = :ICMS_CONT_FORA,'
      '  INDICE_RECEITA_PRO = :INDICE_RECEITA_PRO,'
      '  IPI = :IPI,'
      '  IPI_CF_EST = :IPI_CF_EST,'
      '  IPI_CF_FORA = :IPI_CF_FORA,'
      '  IPI_CONT_EST = :IPI_CONT_EST,'
      '  IPI_CONT_FORA = :IPI_CONT_FORA,'
      '  ISENTO_PIS_COFINS_PRO = :ISENTO_PIS_COFINS_PRO,'
      '  IVA = :IVA,'
      '  LOCALIZACAO_PRO = :LOCALIZACAO_PRO,'
      '  MARGEM_LUCRO_PRO = :MARGEM_LUCRO_PRO,'
      '  NOME_PRO = :NOME_PRO,'
      '  OBS = :OBS,'
      '  ORIG = :ORIG,'
      '  PIS = :PIS,'
      '  PRECO_CUSTO = :PRECO_CUSTO,'
      '  PRECO_PRAZO_PRO = :PRECO_PRAZO_PRO,'
      '  PRECO_PROGRAMADO = :PRECO_PROGRAMADO,'
      '  PRECO_PROGRAMADO_PRAZO = :PRECO_PROGRAMADO_PRAZO,'
      '  PRODUTO_PESADO_PRO = :PRODUTO_PESADO_PRO,'
      '  PROMOCAO_PRO = :PROMOCAO_PRO,'
      '  QUANT_UNIDADE_ENTRADA = :QUANT_UNIDADE_ENTRADA,'
      '  RED_CF_EST = :RED_CF_EST,'
      '  RED_CF_FORA = :RED_CF_FORA,'
      '  RED_CONT_EST = :RED_CONT_EST,'
      '  RED_CONT_FORA = :RED_CONT_FORA,'
      '  REFERENCIA_PRO = :REFERENCIA_PRO,'
      '  RICMS = :RICMS,'
      '  SAIR_TABELA_PRECO = :SAIR_TABELA_PRECO,'
      '  ST_CONT_EST = :ST_CONT_EST,'
      '  SUB_GRUPO = :SUB_GRUPO,'
      '  TAMANHO = :TAMANHO,'
      '  TECLA_ATALHO_PRO = :TECLA_ATALHO_PRO,'
      '  TIPO_PRODUCAO = :TIPO_PRODUCAO,'
      '  ULTIMA_ALTERACAO = :ULTIMA_ALTERACAO,'
      '  VALOR_ATACADO = :VALOR_ATACADO,'
      '  VALOR_PRO = :VALOR_PRO,'
      '  VR_AGREG_CONT_EST = :VR_AGREG_CONT_EST'
      'where'
      '  COD_PRO = :OLD_COD_PRO')
    DeleteSQL.Strings = (
      'delete from produto'
      'where'
      '  COD_PRO = :OLD_COD_PRO')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_PRO,'
      '  COD_LAB,'
      '  COD_SEC,'
      '  VALOR_PRO,'
      '  PROMOCAO_PRO,'
      '  CONTROLA_ESTOQUE_PRO,'
      '  COMISSAO_PRO,'
      '  QUANT_UNIDADE_ENTRADA,'
      '  ESTOQUE_MINIMO_PRO,'
      '  NOME_PRO,'
      '  DESC_CUPOM,'
      '  ATIVO_PRO,'
      '  MARGEM_LUCRO_PRO,'
      '  LOCALIZACAO_PRO,'
      '  PRODUTO_PESADO_PRO,'
      '  COD_SETOR,'
      '  TECLA_ATALHO_PRO,'
      '  INDICE_RECEITA_PRO,'
      '  DIAS_VALIDADE_PRO,'
      '  REFERENCIA_PRO,'
      '  COMPLEMENTO_PRO,'
      '  ICMS_CONT_EST,'
      '  ICMS_CONT_FORA,'
      '  ICMS_CF_EST,'
      '  ICMS_CF_FORA,'
      '  CST_CONT_EST,'
      '  CST_CONT_FORA,'
      '  CST_CF_EST,'
      '  CST_CF_FORA,'
      '  CAMINHO_FOTO_PRO,'
      '  SAIR_TABELA_PRECO,'
      '  CFOP_VENDAS_CONT_EST,'
      '  CFOP_VENDAS_CF_EST,'
      '  CFOP_VENDAS_CONT_FORA,'
      '  CFOP_VENDAS_CF_FORA,'
      '  ST_CONT_EST,'
      '  VR_AGREG_CONT_EST,'
      '  IPI_CONT_EST,'
      '  IPI_CF_EST,'
      '  IPI_CONT_FORA,'
      '  IPI_CF_FORA,'
      '  COD_NCM,'
      '  CLASSIFICACAO_FISCAL,'
      '  CODIGO_TIPO,'
      '  COD_PRODUTO_ESTOQUE,'
      '  COD_GRUPO,'
      '  SUB_GRUPO,'
      '  PRECO_PROGRAMADO,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  ALIQUOTA_IR,'
      '  ALIQUOTA_CSLL,'
      '  ALIQUOTA_OUTRAS,'
      '  ISENTO_PIS_COFINS_PRO,'
      '  PRECO_CUSTO,'
      '  CREDITO_ICMS,'
      '  PRECO_PRAZO_PRO,'
      '  TIPO_PRODUCAO,'
      '  CODIGO_BARRA_PRO,'
      '  CODIGO_UNIDADE_SAIDA,'
      '  CODIGO_UNIDADE_ENTRADA,'
      '  PRECO_PROGRAMADO_PRAZO,'
      '  RED_CF_EST,'
      '  RED_CF_FORA,'
      '  RED_CONT_EST,'
      '  RED_CONT_FORA,'
      '  DATA_VALIDADE,'
      '  CODIGO_SETOR_ESTOQUE,'
      '  ORIG,'
      '  CSOSN,'
      '  IPI,'
      '  ICMS,'
      '  RICMS,'
      '  IVA,'
      '  PIS,'
      '  CONFINS,'
      '  TAMANHO,'
      '  COR,'
      '  OBS,'
      '  CST_PIS,'
      '  CST_COFINS,'
      '  CST_IPI,'
      '  ULTIMA_ALTERACAO,'
      '  VALOR_ATACADO,'
      '  ALIQ_IBPT_NAC,'
      '  ALIQ_IBPT_IMP'
      'from produto '
      'where'
      '  COD_PRO = :COD_PRO')
    Left = 216
    Top = 8
  end
  object tmr1: TTimer
    Interval = 500
    OnTimer = tmr1Timer
    Left = 168
    Top = 32
  end
end
