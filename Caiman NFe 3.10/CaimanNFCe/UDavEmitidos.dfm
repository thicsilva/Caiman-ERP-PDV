object FrmDavEmitidos: TFrmDavEmitidos
  Left = 359
  Top = 307
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DAV Emitidos'
  ClientHeight = 186
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 167
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnOK: TButton
      Left = 80
      Top = 133
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 200
      Top = 133
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 57
      Width = 351
      Height = 65
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 54
        Height = 13
        Caption = 'Data Incial'
      end
      object Label2: TLabel
        Left = 176
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Data Final'
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 32
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 0
      end
      object EdtDataIni: TDateTimePicker
        Left = 32
        Top = 32
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 1
      end
    end
    object RDG: TRadioGroup
      Left = 2
      Top = 2
      Width = 351
      Height = 55
      Align = alTop
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Relat'#243'rio Gerencial'
        'Arquivo TXT')
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 167
    Width = 355
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
  object QOrcamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
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
    Left = 304
    Top = 56
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
  object QOS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRDavEmitidos
    SQL.Strings = (
      
        'SELECT O.COO, O.COO_VENDA, O.CCF_VENDA, O.SEQUENCIA_DAV, O.DATA_' +
        'ABERTURA, O.TOTAL, C.R01_NUMERO_SERIE, C.R01_MF_ADICIONAL, C.R01' +
        '_TIPO_ECF, C.R01_MARCA_ECF, C.R01_MODELO_ECF'
      'FROM ORDEM_SERVICO O'
      'INNER JOIN CAIXA C'
      'ON (O.COD_CAI = C.COD_CAI AND O.COD_EMP = C.COD_EMP)'
      'WHERE DATA_ABERTURA BETWEEN :DATAINI AND :DATAFIN '
      'ORDER BY O.CODIGO')
    Left = 304
    Top = 120
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object QOSCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'ORDEM_SERVICO.COO'
    end
    object QOSCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = 'ORDEM_SERVICO.COO_VENDA'
    end
    object QOSSEQUENCIA_DAV: TLargeintField
      FieldName = 'SEQUENCIA_DAV'
      Origin = 'ORDEM_SERVICO.SEQUENCIA_DAV'
      Required = True
    end
    object QOSDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'ORDEM_SERVICO.DATA_ABERTURA'
      Required = True
    end
    object QOSTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'ORDEM_SERVICO.TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QOSR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'CAIXA.R01_NUMERO_SERIE'
    end
    object QOSR01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = 'CAIXA.R01_MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QOSR01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = 'CAIXA.R01_TIPO_ECF'
      Size = 7
    end
    object QOSR01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = 'CAIXA.R01_MARCA_ECF'
    end
    object QOSR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'CAIXA.R01_MODELO_ECF'
    end
    object QOSCCF_VENDA: TIntegerField
      FieldName = 'CCF_VENDA'
      Origin = 'ORDEM_SERVICO.CCF_VENDA'
    end
  end
  object TRDavEmitidos: TFDTransaction
    Connection = DM.IBDatabase
    Left = 144
    Top = 32
  end
  object ConsultaDAV: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRDavEmitidos
    Left = 168
    Top = 96
  end
  object IBAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRDavEmitidos
    Left = 104
    Top = 88
  end
  object QBuscaItensDAV: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRDavEmitidos
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
    Left = 248
    Top = 32
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
end
