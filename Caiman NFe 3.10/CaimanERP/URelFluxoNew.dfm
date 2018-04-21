object frmRelFluxonew: TfrmRelFluxonew
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimentos do Caixa'
  ClientHeight = 314
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 397
    Height = 46
    Align = alTop
    Caption = ' Periodo dos Movimentos '
    TabOrder = 0
    object edtDataIni: TDateTimePicker
      Left = 10
      Top = 17
      Width = 105
      Height = 21
      Date = 42610.616261493060000000
      Time = 42610.616261493060000000
      TabOrder = 0
    end
    object edtDataFim: TDateTimePicker
      Left = 138
      Top = 17
      Width = 105
      Height = 21
      Date = 42610.616261493060000000
      Time = 42610.616261493060000000
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 397
    Height = 58
    Align = alTop
    Caption = ' Caixa '
    TabOrder = 1
    object edtCodCaixa: TJvDBSearchComboBox
      Left = 10
      Top = 20
      Width = 255
      Height = 21
      DataField = 'DESC_CAI'
      DataSource = dsCaixa
      TabOrder = 0
      Text = 'edtCodCaixa'
    end
    object chkTodosCaixas: TCheckBox
      Left = 280
      Top = 21
      Width = 97
      Height = 17
      Caption = 'Todos Caixas'
      TabOrder = 1
      OnClick = chkTodosCaixasClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 119
    Width = 397
    Height = 58
    Align = alTop
    Caption = ' Usu'#225'rio '
    TabOrder = 2
    object edtCodUsuario: TJvDBSearchComboBox
      Left = 10
      Top = 20
      Width = 255
      Height = 21
      DataField = 'NOME_USU'
      DataSource = dsUsuarios
      TabOrder = 0
      Text = 'edtCodCaixa'
    end
    object chkTodosUsuarios: TCheckBox
      Left = 280
      Top = 21
      Width = 97
      Height = 17
      Caption = 'Todos Usu'#225'rios'
      TabOrder = 1
      OnClick = chkTodosUsuariosClick
    end
  end
  object pnl1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 242
    Width = 397
    Height = 69
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object btnVisualizar: TButton
      Left = 10
      Top = 0
      Width = 105
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 183
    Width = 397
    Height = 53
    Align = alTop
    Caption = ' Informativos '
    TabOrder = 4
    object chkInformativo: TCheckBox
      Left = 10
      Top = 21
      Width = 199
      Height = 17
      Caption = 'Mostra Informativos (*)'
      TabOrder = 0
      OnClick = chkTodosUsuariosClick
    end
  end
  object QMovimentos: TFDQuery
    Active = True
    Connection = DM.IBDatabase
    Transaction = FDTRMovimentos
    SQL.Strings = (
      'SELECT cv.*, usu.nome_usu, cx.desc_cai,'
      
        'CAST(EXTRACT( DAY FROM cv.data_hora) || '#39'.'#39' || EXTRACT(MONTH FRO' +
        'M'
      
        'cv.data_hora) || '#39'.'#39' || EXTRACT(YEAR FROM cv.data_hora) AS DATE)' +
        ' DATA,'
      'form.descricao DESC_FORMA,'
      'pl.descricao DESC_PLANO,'
      'pl.op_saldo,'
      'pl.tipo_dc,'
      'case'
      '     when ( pl.tipo_dc = '#39'D'#39' ) and ( pl.op_saldo = '#39'S'#39' ) then'
      '        '#39'(-)'#39
      '     when ( pl.tipo_dc = '#39'D'#39' ) and ( pl.op_saldo = '#39'N'#39' ) then'
      '        '#39'(*)(-)'#39
      '     when ( pl.tipo_dc = '#39'C'#39' ) and ( pl.op_saldo = '#39'N'#39' ) then'
      '        '#39'(*)(+)'#39
      '     when ( pl.tipo_dc = '#39'C'#39' ) and ( pl.op_saldo = '#39'S'#39' ) then'
      '        '#39'(+)'#39
      'end CredDeb'
      ' FROM newcaixa_movimentos CV'
      'left outer join usuario usu'
      'on( usu.cod_usu = cv.cod_usu )'
      'left outer join caixa cx'
      'on( cx.cod_cai = cv.cod_cai and cx.cod_emp = cv.cod_emp )'
      'left outer join new_caixa_grupos PL'
      'on( pl.chave = cv.plano_contas and pl.cod_emp = cv.cod_emp )'
      'left outer join formas_pagamento form'
      'on( form.codigo = cv.cod_forma )'
      'where cv.cod_emp=:cod_emp'
      ''
      
        'and CAST(EXTRACT( DAY FROM cv.data_hora) || '#39'.'#39' || EXTRACT(MONTH' +
        ' FROM'
      
        'cv.data_hora) || '#39'.'#39' || EXTRACT(YEAR FROM cv.data_hora) AS DATE)' +
        ' between :DATAINI AND :DATAFIM')
    Left = 264
    Top = 40
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QMovimentosCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QMovimentosCOD_MOV: TIntegerField
      FieldName = 'COD_MOV'
      Origin = 'COD_MOV'
      Required = True
    end
    object QMovimentosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QMovimentosCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      Required = True
    end
    object QMovimentosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      Required = True
    end
    object QMovimentosDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object QMovimentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object QMovimentosMODULO: TStringField
      FieldName = 'MODULO'
      Origin = 'MODULO'
      Required = True
      Size = 50
    end
    object QMovimentosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 50
    end
    object QMovimentosPLANO_CONTAS: TStringField
      FieldName = 'PLANO_CONTAS'
      Origin = 'PLANO_CONTAS'
    end
    object QMovimentosCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = 'COD_FORMA'
    end
    object QMovimentosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object QMovimentosCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
    end
    object QMovimentosSUB_MODULO: TStringField
      FieldName = 'SUB_MODULO'
      Origin = 'SUB_MODULO'
      Size = 50
    end
    object QMovimentosNOME_USU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QMovimentosDESC_CAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_CAI'
      Origin = 'DESC_CAI'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QMovimentosDATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      ReadOnly = True
    end
    object QMovimentosDESC_FORMA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_FORMA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QMovimentosDESC_PLANO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_PLANO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QMovimentosOP_SALDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OP_SALDO'
      Origin = 'OP_SALDO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QMovimentosTIPO_DC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_DC'
      Origin = 'TIPO_DC'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QMovimentosCREDDEB: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CREDDEB'
      Origin = 'CREDDEB'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
  end
  object QCaixas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = FDTRMovimentos
    SQL.Strings = (
      'SELECT * FROM CAIXA WHERE COD_EMP=:COD_EMP')
    Left = 304
    Top = 80
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QCaixasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixasTAMANHO_DESC_CUPOM: TIntegerField
      FieldName = 'TAMANHO_DESC_CUPOM'
      Origin = 'TAMANHO_DESC_CUPOM'
    end
    object QCaixasPORTA_IMP: TStringField
      FieldName = 'PORTA_IMP'
      Origin = 'PORTA_IMP'
      FixedChar = True
      Size = 4
    end
    object QCaixasDESC_CAI: TStringField
      FieldName = 'DESC_CAI'
      Origin = 'DESC_CAI'
      Required = True
      Size = 50
    end
    object QCaixasINDICE_GAVETA: TIntegerField
      FieldName = 'INDICE_GAVETA'
      Origin = 'INDICE_GAVETA'
      Required = True
    end
    object QCaixasINDICE_BALANCA: TIntegerField
      FieldName = 'INDICE_BALANCA'
      Origin = 'INDICE_BALANCA'
      Required = True
    end
    object QCaixasPORTA_BALANCA: TIntegerField
      FieldName = 'PORTA_BALANCA'
      Origin = 'PORTA_BALANCA'
    end
    object QCaixasBAUD_BALANCA: TIntegerField
      FieldName = 'BAUD_BALANCA'
      Origin = 'BAUD_BALANCA'
    end
    object QCaixasCASAS_DECIMAIS: TIntegerField
      FieldName = 'CASAS_DECIMAIS'
      Origin = 'CASAS_DECIMAIS'
    end
    object QCaixasCASAS_DECIMAIS_UNITARIO: TIntegerField
      FieldName = 'CASAS_DECIMAIS_UNITARIO'
      Origin = 'CASAS_DECIMAIS_UNITARIO'
      Required = True
    end
    object QCaixasTRUNCAR_CAI: TStringField
      FieldName = 'TRUNCAR_CAI'
      Origin = 'TRUNCAR_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixasIMPRIMIR_COMPROVANTE_ECF: TStringField
      FieldName = 'IMPRIMIR_COMPROVANTE_ECF'
      Origin = 'IMPRIMIR_COMPROVANTE_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixasECF_MFD: TStringField
      FieldName = 'ECF_MFD'
      Origin = 'ECF_MFD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixasIP_SERVIDOR_TEF: TStringField
      FieldName = 'IP_SERVIDOR_TEF'
      Origin = 'IP_SERVIDOR_TEF'
      Size = 15
    end
    object QCaixasID_LOJA_TEF: TStringField
      FieldName = 'ID_LOJA_TEF'
      Origin = 'ID_LOJA_TEF'
      Size = 8
    end
    object QCaixasID_TERMINAL_TEF: TStringField
      FieldName = 'ID_TERMINAL_TEF'
      Origin = 'ID_TERMINAL_TEF'
      Size = 8
    end
    object QCaixasTEF_CAI: TStringField
      FieldName = 'TEF_CAI'
      Origin = 'TEF_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixasCAMINHO_BANCO: TStringField
      FieldName = 'CAMINHO_BANCO'
      Origin = 'CAMINHO_BANCO'
      Size = 255
    end
    object QCaixasEXPORTAR_DADOS: TStringField
      FieldName = 'EXPORTAR_DADOS'
      Origin = 'EXPORTAR_DADOS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCaixasR01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = 'R01_MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QCaixasR01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = 'R01_TIPO_ECF'
      Size = 7
    end
    object QCaixasR01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = 'R01_MARCA_ECF'
    end
    object QCaixasR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'R01_MODELO_ECF'
    end
    object QCaixasR01_VERSAO_SB: TStringField
      FieldName = 'R01_VERSAO_SB'
      Origin = 'R01_VERSAO_SB'
      Size = 10
    end
    object QCaixasR01_CNPJ_USUARIO: TStringField
      FieldName = 'R01_CNPJ_USUARIO'
      Origin = 'R01_CNPJ_USUARIO'
      Size = 14
    end
    object QCaixasR01_IE_USUARIO: TStringField
      FieldName = 'R01_IE_USUARIO'
      Origin = 'R01_IE_USUARIO'
      Size = 14
    end
    object QCaixasR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'R01_NUMERO_SERIE'
    end
    object QCaixasLINHA1: TStringField
      FieldName = 'LINHA1'
      Origin = 'LINHA1'
      Size = 48
    end
    object QCaixasLINHA2: TStringField
      FieldName = 'LINHA2'
      Origin = 'LINHA2'
      Size = 48
    end
    object QCaixasLINHA3: TStringField
      FieldName = 'LINHA3'
      Origin = 'LINHA3'
      Size = 48
    end
    object QCaixasINDICE_GER_OS: TStringField
      FieldName = 'INDICE_GER_OS'
      Origin = 'INDICE_GER_OS'
      Size = 15
    end
    object QCaixasINDICE_GER_ORCAMENTO: TStringField
      FieldName = 'INDICE_GER_ORCAMENTO'
      Origin = 'INDICE_GER_ORCAMENTO'
      Size = 15
    end
    object QCaixasINDICE_GER_MESA: TStringField
      FieldName = 'INDICE_GER_MESA'
      Origin = 'INDICE_GER_MESA'
      Size = 15
    end
    object QCaixasR01_NUMERO_USUARIO: TIntegerField
      FieldName = 'R01_NUMERO_USUARIO'
      Origin = 'R01_NUMERO_USUARIO'
    end
    object QCaixasCODIGO_NACIONAL_IDENTIFICACAO: TStringField
      FieldName = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Origin = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Size = 6
    end
    object QCaixasR01_DATAHORA_SB: TSQLTimeStampField
      FieldName = 'R01_DATAHORA_SB'
      Origin = 'R01_DATAHORA_SB'
    end
    object QCaixasINTERVALO_RECEBE: TIntegerField
      FieldName = 'INTERVALO_RECEBE'
      Origin = 'INTERVALO_RECEBE'
      Required = True
    end
    object QCaixasINTERVALO_TRANSMITE: TIntegerField
      FieldName = 'INTERVALO_TRANSMITE'
      Origin = 'INTERVALO_TRANSMITE'
      Required = True
    end
    object QCaixasDIAS_ATUALIZACAO_PAF: TIntegerField
      FieldName = 'DIAS_ATUALIZACAO_PAF'
      Origin = 'DIAS_ATUALIZACAO_PAF'
      Required = True
    end
    object QCaixasCORTA_PAPEL: TStringField
      FieldName = 'CORTA_PAPEL'
      Origin = 'CORTA_PAPEL'
      Size = 1
    end
    object QCaixasNFCE_SERIE: TIntegerField
      FieldName = 'NFCE_SERIE'
      Origin = 'NFCE_SERIE'
    end
    object QCaixasNFCE_NUMERO: TIntegerField
      FieldName = 'NFCE_NUMERO'
      Origin = 'NFCE_NUMERO'
    end
    object QCaixasFLUXO_TIPO: TIntegerField
      FieldName = 'FLUXO_TIPO'
      Origin = 'FLUXO_TIPO'
    end
    object QCaixasFLUXO_MOVCX_PAG: TStringField
      FieldName = 'FLUXO_MOVCX_PAG'
      Origin = 'FLUXO_MOVCX_PAG'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_MOVCX_PAG_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_PAG_HIST'
      Origin = 'FLUXO_MOVCX_PAG_HIST'
    end
    object QCaixasFLUXO_MOVCX_JUROS_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_JUROS_HIST'
      Origin = 'FLUXO_MOVCX_JUROS_HIST'
    end
    object QCaixasFLUXO_MOVCX_DESC_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_DESC_HIST'
      Origin = 'FLUXO_MOVCX_DESC_HIST'
    end
    object QCaixasFLUXO_RECEBIMENTO: TStringField
      FieldName = 'FLUXO_RECEBIMENTO'
      Origin = 'FLUXO_RECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_RECEBIMENTO_HIST: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_HIST'
      Origin = 'FLUXO_RECEBIMENTO_HIST'
    end
    object QCaixasFLUXO_RECEBIMENTO_DESC: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_DESC'
      Origin = 'FLUXO_RECEBIMENTO_DESC'
    end
    object QCaixasFLUXO_RECEBIMENTO_JUROS: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_JUROS'
      Origin = 'FLUXO_RECEBIMENTO_JUROS'
    end
    object QCaixasFLUXO_SALTO_ANTERIOR: TStringField
      FieldName = 'FLUXO_SALTO_ANTERIOR'
      Origin = 'FLUXO_SALTO_ANTERIOR'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_TRANS_SAIDA: TStringField
      FieldName = 'FLUXO_TRANS_SAIDA'
      Origin = 'FLUXO_TRANS_SAIDA'
    end
    object QCaixasFLUXO_TRANS_ENTRADA: TStringField
      FieldName = 'FLUXO_TRANS_ENTRADA'
      Origin = 'FLUXO_TRANS_ENTRADA'
    end
    object QCaixasFLUXO_FATURAMENTO: TStringField
      FieldName = 'FLUXO_FATURAMENTO'
      Origin = 'FLUXO_FATURAMENTO'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_FATURAMENTO_NOTAS: TStringField
      FieldName = 'FLUXO_FATURAMENTO_NOTAS'
      Origin = 'FLUXO_FATURAMENTO_NOTAS'
    end
    object QCaixasFLUXO_FATURAMENTO_VENDAS: TStringField
      FieldName = 'FLUXO_FATURAMENTO_VENDAS'
      Origin = 'FLUXO_FATURAMENTO_VENDAS'
    end
    object QCaixasFLUXO_TRANS: TStringField
      FieldName = 'FLUXO_TRANS'
      Origin = 'FLUXO_TRANS'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_SANGRIA_SUPRIMETOS: TStringField
      FieldName = 'FLUXO_SANGRIA_SUPRIMETOS'
      Origin = 'FLUXO_SANGRIA_SUPRIMETOS'
      FixedChar = True
      Size = 1
    end
    object QCaixasFLUXO_SANGRIA: TStringField
      FieldName = 'FLUXO_SANGRIA'
      Origin = 'FLUXO_SANGRIA'
    end
    object QCaixasFLUXO_SUPRIMENTOS: TStringField
      FieldName = 'FLUXO_SUPRIMENTOS'
      Origin = 'FLUXO_SUPRIMENTOS'
    end
  end
  object QUsuarios: TFDQuery
    Connection = DM.IBDatabase
    Transaction = FDTRMovimentos
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'WHERE COD_USU IN'
      '( select COD_USU '
      'from empresa_usuario '
      'where cod_emp=:cod_emp )')
    Left = 296
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QUsuariosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QUsuariosNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      Required = True
      Size = 10
    end
    object QUsuariosSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'SENHA_USU'
      Required = True
      Size = 6
    end
    object QUsuariosCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      Required = True
    end
    object QUsuariosOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object FDTRMovimentos: TFDTransaction
    Options.AutoStop = False
    Connection = DM.IBDatabase
    Left = 248
    Top = 88
  end
  object dsCaixa: TDataSource
    DataSet = QCaixas
    Left = 264
    Top = 160
  end
  object dsUsuarios: TDataSource
    DataSet = QUsuarios
    Left = 192
    Top = 104
  end
  object frxMovimentos: TfrxDBDataset
    UserName = 'MOVIMENTOS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD=COD'
      'COD_MOV=COD_MOV'
      'COD_EMP=COD_EMP'
      'COD_CAI=COD_CAI'
      'COD_USU=COD_USU'
      'DATA_HORA=DATA_HORA'
      'DESCRICAO=DESCRICAO'
      'MODULO=MODULO'
      'DOCUMENTO=DOCUMENTO'
      'PLANO_CONTAS=PLANO_CONTAS'
      'COD_FORMA=COD_FORMA'
      'VALOR=VALOR'
      'CANCELADO=CANCELADO'
      'SUB_MODULO=SUB_MODULO'
      'NOME_USU=NOME_USU'
      'DESC_CAI=DESC_CAI'
      'DATA=DATA'
      'DESC_FORMA=DESC_FORMA'
      'DESC_PLANO=DESC_PLANO'
      'OP_SALDO=OP_SALDO'
      'TIPO_DC=TIPO_DC'
      'CREDDEB=CREDDEB')
    DataSet = QMovimentos
    BCDToCurrency = False
    Left = 280
    Top = 120
  end
  object frxFRMovimentos: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42610.633615358800000000
    ReportOptions.LastChange = 42610.635783588000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 152
    Top = 48
    Datasets = <
      item
        DataSet = frxMovimentos
        DataSetName = 'MOVIMENTOS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 34.015770000000010000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 15.118119999999980000
          Top = 5.338590000000000000
          Width = 687.874460000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Movimentos do Caixa')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baBottom
          Top = 34.015770000000010000
          Width = 718.110236220471900000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = frxMovimentos
        DataSetName = 'MOVIMENTOS'
        RowCount = 0
        object MOVIMENTOSDESCRICAO: TfrxMemoView
          Left = 116.519790000000000000
          Width = 351.496290000001000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO'
          DataSet = frxMovimentos
          DataSetName = 'MOVIMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[MOVIMENTOS."DESCRICAO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Width = 109.606369999999000000
          Height = 15.118120000000000000
          DataField = 'DATA_HORA'
          DataSet = frxMovimentos
          DataSetName = 'MOVIMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[MOVIMENTOS."DATA_HORA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 474.512060000000000000
          Width = 79.370130000000100000
          Height = 15.118120000000000000
          DataSet = frxMovimentos
          DataSetName = 'MOVIMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[MOVIMENTOS."PLANO_CONTAS"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 567.929499999999900000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR'
          DataSet = frxMovimentos
          DataSetName = 'MOVIMENTOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[MOVIMENTOS."VALOR"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 668.976810000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'CREDDEB'
          DataSet = frxMovimentos
          DataSetName = 'MOVIMENTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[MOVIMENTOS."CREDDEB"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Condition = 'MOVIMENTOS."DATA"'
        KeepTogether = True
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Fill.BackColor = 15000804
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 264.567100000000000000
          Top = 1.779529999999994000
          Width = 188.976500000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'DIA:( [MOVIMENTOS."DATA"] )')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Condition = 'MOVIMENTOS."COD_CAI"'
        KeepTogether = True
        object Shape2: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Fill.BackColor = 15000804
        end
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 128.504020000000000000
          Top = 2.338590000000011000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CAIXA:( [MOVIMENTOS."COD_CAI"] - [MOVIMENTOS."DESC_CAI"] )')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'MOVIMENTOS."COD_USU"'
        KeepTogether = True
        object Shape3: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Fill.BackColor = 15000804
        end
        object Memo4: TfrxMemoView
          Align = baCenter
          Left = 128.504020000000000000
          Top = 2.338590000000011000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'USUARIO:( [MOVIMENTOS."COD_USU"] - [MOVIMENTOS."NOME_USU"] )')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Left = 404.409710000000000000
          Width = 313.700990000000000000
          Height = 22.677180000000000000
          Fill.BackColor = 15724527
        end
        object Memo9: TfrxMemoView
          Left = 559.370440000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(IIF(<MOVIMENTOS."CREDDEB">='#39'(+)'#39',<MOVIMENTOS."VALOR">, 0' +
              '),MasterData1) - SUM(IIF(<MOVIMENTOS."CREDDEB">='#39'(-)'#39',<MOVIMENTO' +
              'S."VALOR">, 0),MasterData1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 419.527830000000000000
          Top = 1.000000000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Saldo Agrupado :')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Shape5: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15724527
        end
        object Memo11: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000022000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'R$ [SUM(IIF(<MOVIMENTOS."CREDDEB">='#39'(+)'#39',<MOVIMENTOS."VALOR">, 0' +
              '),MasterData1) - SUM(IIF(<MOVIMENTOS."CREDDEB">='#39'(-)'#39',<MOVIMENTO' +
              'S."VALOR">, 0),MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 430.866420000000000000
          Top = 4.779530000000022000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Saldo do Periodo :')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 168
    Top = 136
  end
end
