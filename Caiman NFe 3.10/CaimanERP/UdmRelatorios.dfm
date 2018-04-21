object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  Height = 461
  Width = 667
  object QCaixaMovFechamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRelCaixa
    SQL.Strings = (
      'select'
      'mv.plano_contas,'
      'cg.descricao plano_descricao,'
      'cg.op_saldo,'
      'sum( mv.valor ) VALOR,'
      'sum('
      'case'
      '   when fp.tipo = '#39'DN'#39' then'
      '       ('
      '         case'
      
        '            when ( cg.op_saldo = '#39'S'#39' and cg.tipo_dc = '#39'D'#39' and mv' +
        '.valor > 0 ) then'
      '              ( mv.valor * -1 )'
      '            when ( cg.op_saldo = '#39'S'#39' and cg.tipo_dc = '#39'C'#39') then'
      '              mv.valor'
      '            else'
      '              0'
      '         end'
      '       )'
      
        '   when ( cg.op_saldo = '#39'S'#39' and cg.tipo_dc = '#39'D'#39' and mv.valor > ' +
        '0 ) then'
      '        ( mv.valor * -1 )'
      '   when ( cg.op_saldo = '#39'S'#39' and cg.tipo_dc = '#39'C'#39') then'
      '        mv.valor'
      '   else'
      '     0'
      'end ) SALDO'
      'from newcaixa_movimentos mv'
      'left outer join new_caixa_grupos cg'
      'on( cg.chave=mv.plano_contas )'
      'left outer join formas_pagamento fp'
      'on( fp.codigo = mv.cod_forma )'
      'where'
      
        'mv.cod_mov=:cod_mov and mv.cod_emp=:cod_emp and mv.cod_cai=:cod_' +
        'cai'
      'group by mv.plano_contas, cg.descricao, cg.op_saldo'
      'order by cg.op_saldo desc, cg.descricao')
    Left = 88
    Top = 24
    ParamData = <
      item
        Name = 'COD_MOV'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_CAI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QCaixaMovFechamentoPLANO_CONTAS: TStringField
      FieldName = 'PLANO_CONTAS'
      Origin = 'PLANO_CONTAS'
    end
    object QCaixaMovFechamentoPLANO_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANO_DESCRICAO'
      Origin = 'PLANO_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QCaixaMovFechamentoOP_SALDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OP_SALDO'
      Origin = 'OP_SALDO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QCaixaMovFechamentoVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QCaixaMovFechamentoSALDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object TRRelCaixa: TFDTransaction
    Connection = DM.IBDatabase
    Left = 81
    Top = 192
  end
  object QCaixaFormas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRelCaixa
    SQL.Strings = (
      
        'SELECT AF.*, FP.descricao DESC_FORMA FROM ABRE_FECHA_CAIXA_CONFE' +
        'RE AF'
      'INNER JOIN formas_pagamento FP'
      'ON( FP.codigo=AF.cod_forma )'
      'WHERE AF.cod_mov=:CODIGO and AF.cod_emp=:COD_EMP'
      'ORDER BY AF.cod_forma')
    Left = 88
    Top = 80
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QCaixaFormasCOD_MOV: TIntegerField
      FieldName = 'COD_MOV'
      Origin = 'COD_MOV'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaFormasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = 'COD_FORMA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaFormasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
    end
    object QCaixaFormasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
    end
    object QCaixaFormasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object QCaixaFormasVALOR_CONFERE: TBCDField
      FieldName = 'VALOR_CONFERE'
      Origin = 'VALOR_CONFERE'
      Precision = 18
      Size = 2
    end
    object QCaixaFormasVALOR_DIF: TBCDField
      FieldName = 'VALOR_DIF'
      Origin = 'VALOR_DIF'
      Precision = 18
      Size = 2
    end
    object QCaixaFormasDESC_FORMA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_FORMA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QCaixaAbreFecha: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRRelCaixa
    SQL.Strings = (
      'SELECT AF.*,'
      'U.nome_usu,'
      'E.razao_emp,'
      'current_date emissao FROM abre_fecha_caixa AF'
      'inner join USUARIO U'
      'on( U.cod_usu = AF.cod_usu )'
      'inner join EMPRESA E'
      'on( E.cod_emp=AF.cod_emp )'
      'WHERE AF.cod_emp=:COD_EMP AND AF.codigo=:CODIGO')
    Left = 88
    Top = 136
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QCaixaAbreFechaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaAbreFechaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QCaixaAbreFechaCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      Required = True
    end
    object QCaixaAbreFechaCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      Required = True
    end
    object QCaixaAbreFechaDATA_ABRE: TDateField
      FieldName = 'DATA_ABRE'
      Origin = 'DATA_ABRE'
    end
    object QCaixaAbreFechaDATA_FECHA: TDateField
      FieldName = 'DATA_FECHA'
      Origin = 'DATA_FECHA'
    end
    object QCaixaAbreFechaHORA_ABRE: TTimeField
      FieldName = 'HORA_ABRE'
      Origin = 'HORA_ABRE'
    end
    object QCaixaAbreFechaHORA_FECHA: TTimeField
      FieldName = 'HORA_FECHA'
      Origin = 'HORA_FECHA'
    end
    object QCaixaAbreFechaPERIODO_INI: TSQLTimeStampField
      FieldName = 'PERIODO_INI'
      Origin = 'PERIODO_INI'
    end
    object QCaixaAbreFechaPERIODO_FIM: TSQLTimeStampField
      FieldName = 'PERIODO_FIM'
      Origin = 'PERIODO_FIM'
    end
    object QCaixaAbreFechaSALDO_ANTERIOR: TBCDField
      FieldName = 'SALDO_ANTERIOR'
      Origin = 'SALDO_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object QCaixaAbreFechaSALDO_FINAL: TBCDField
      FieldName = 'SALDO_FINAL'
      Origin = 'SALDO_FINAL'
      Precision = 18
      Size = 2
    end
    object QCaixaAbreFechaSALDO_INICIAL: TBCDField
      FieldName = 'SALDO_INICIAL'
      Origin = 'SALDO_INICIAL'
      Precision = 18
      Size = 2
    end
    object QCaixaAbreFechaDATA_HORA_ABRE: TSQLTimeStampField
      FieldName = 'DATA_HORA_ABRE'
      Origin = 'DATA_HORA_ABRE'
    end
    object QCaixaAbreFechaDATA_HORA_FECHA: TSQLTimeStampField
      FieldName = 'DATA_HORA_FECHA'
      Origin = 'DATA_HORA_FECHA'
    end
    object QCaixaAbreFechaNOME_USU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QCaixaAbreFechaRAZAO_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_EMP'
      Origin = 'RAZAO_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QCaixaAbreFechaEMISSAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object frxCaixaMovFechamento: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QCaixaMovFechamento
    BCDToCurrency = False
    Left = 208
    Top = 24
  end
  object frxCaixaFormas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QCaixaFormas
    BCDToCurrency = False
    Left = 192
    Top = 80
  end
  object frxCaixaAbreFecha: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QCaixaAbreFecha
    BCDToCurrency = False
    Left = 192
    Top = 136
  end
end
