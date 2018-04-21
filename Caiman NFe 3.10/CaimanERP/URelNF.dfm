object FrmRelNF: TFrmRelNF
  Left = 421
  Top = 361
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio das Notas Fiscais'
  ClientHeight = 176
  ClientWidth = 311
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 81
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 307
      Height = 47
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 144
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 1
      end
    end
    object CheckTransp: TCheckBox
      Left = 8
      Top = 56
      Width = 177
      Height = 17
      Caption = 'Agrupar por Transportadora'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 311
    Height = 76
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 22
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 118
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 214
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object BitBtn1: TBitBtn
      Left = 22
      Top = 39
      Width = 267
      Height = 25
      Caption = '&Gerar TXT de notas e itens'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 157
    Width = 311
    Height = 19
    Panels = <>
  end
  object QRelNF: TFDQuery
    OnCalcFields = QRelNFCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT N.VALOR_TOTAL_NF ,N.DATA_EMISSAO_NF, N.NUMERO_NOTA_NF, N.' +
        'QUANTIDADE_NF, N.FRETE_CONTA_NF, N.COD_TRA, T.NOME_TRA, C.NOME_C' +
        'LI, F.RAZAO_FOR'
      'FROM NOTA_FISCAL N'
      'INNER JOIN TRANSPORTADORA T'
      'ON (N.COD_TRA = T.COD_TRA)'
      'LEFT JOIN CLIENTE C'
      'ON (N.COD_CLI = C.COD_CLI)'
      'LEFT JOIN FORNECEDOR F'
      'ON (N.COD_FOR = F.COD_FOR)'
      
        'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND N.COD_' +
        'EMP = :CODEMP')
    Left = 136
    Top = 8
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
    object QRelNFDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'NOTA_FISCAL.DATA_EMISSAO_NF'
      Required = True
    end
    object QRelNFNUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = 'NOTA_FISCAL.NUMERO_NOTA_NF'
      Required = True
    end
    object QRelNFFRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = 'NOTA_FISCAL.FRETE_CONTA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelNFNOME_TRA: TStringField
      FieldName = 'NOME_TRA'
      Origin = 'TRANSPORTADORA.NOME_TRA'
      Required = True
      Size = 60
    end
    object QRelNFNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Size = 60
    end
    object QRelNFRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Size = 60
    end
    object QRelNFCALC_NOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NOME'
      Size = 80
      Calculated = True
    end
    object QRelNFCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = 'NOTA_FISCAL.COD_TRA'
      Required = True
    end
    object QRelNFQUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = 'NOTA_FISCAL.QUANTIDADE_NF'
    end
    object QRelNFVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_NF"'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object Rel: TFDQuery
    AfterScroll = RelAfterScroll
    OnCalcFields = QRelNFCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT * FROM NOTA_FISCAL '
      
        'WHERE DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND COD_EMP ' +
        '= :CODEMP')
    Left = 256
    Top = 56
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
    object RelCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"NOTA_FISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RelCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"NOTA_FISCAL"."COD_EMP"'
      Required = True
    end
    object RelNUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NOTA_NF"'
      Required = True
    end
    object RelDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = '"NOTA_FISCAL"."DATA_EMISSAO_NF"'
      Required = True
    end
    object RelDATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."DATA_SAIDA_NF"'
    end
    object RelHORA_SAIDA_NF: TTimeField
      FieldName = 'HORA_SAIDA_NF'
      Origin = '"NOTA_FISCAL"."HORA_SAIDA_NF"'
    end
    object RelCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = '"NOTA_FISCAL"."COD_TRA"'
      Required = True
    end
    object RelBASE_CALCULO_ICMS_NF: TBCDField
      FieldName = 'BASE_CALCULO_ICMS_NF'
      Origin = '"NOTA_FISCAL"."BASE_CALCULO_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_ICMS_NF: TBCDField
      FieldName = 'VALOR_ICMS_NF'
      Origin = '"NOTA_FISCAL"."VALOR_ICMS_NF"'
      Precision = 18
      Size = 2
    end
    object RelBASE_SUBST_NF: TBCDField
      FieldName = 'BASE_SUBST_NF'
      Origin = '"NOTA_FISCAL"."BASE_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_SUBST_NF: TBCDField
      FieldName = 'VALOR_SUBST_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SUBST_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_TOTAL_PROD_NF: TBCDField
      FieldName = 'VALOR_TOTAL_PROD_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_PROD_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_FRETE_NF: TBCDField
      FieldName = 'VALOR_FRETE_NF'
      Origin = '"NOTA_FISCAL"."VALOR_FRETE_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_SEGURO_NF: TBCDField
      FieldName = 'VALOR_SEGURO_NF'
      Origin = '"NOTA_FISCAL"."VALOR_SEGURO_NF"'
      Precision = 18
      Size = 2
    end
    object RelOUTRAS_DESPESAS_NF: TBCDField
      FieldName = 'OUTRAS_DESPESAS_NF'
      Origin = '"NOTA_FISCAL"."OUTRAS_DESPESAS_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_IPI_NF: TBCDField
      FieldName = 'VALOR_IPI_NF'
      Origin = '"NOTA_FISCAL"."VALOR_IPI_NF"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = '"NOTA_FISCAL"."VALOR_TOTAL_NF"'
      Precision = 18
      Size = 2
    end
    object RelESPECIE_NF: TStringField
      FieldName = 'ESPECIE_NF'
      Origin = '"NOTA_FISCAL"."ESPECIE_NF"'
      Size = 10
    end
    object RelMARCA_NF: TStringField
      FieldName = 'MARCA_NF'
      Origin = '"NOTA_FISCAL"."MARCA_NF"'
      Size = 10
    end
    object RelNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = '"NOTA_FISCAL"."NUMERO_NF"'
      Size = 10
    end
    object RelINF_COMPL_NF: TMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = '"NOTA_FISCAL"."INF_COMPL_NF"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object RelCANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = '"NOTA_FISCAL"."CANCELADA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object RelFRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = '"NOTA_FISCAL"."FRETE_CONTA_NF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object RelCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"NOTA_FISCAL"."COD_CLI"'
    end
    object RelCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = '"NOTA_FISCAL"."COD_FOR"'
    end
    object RelDESCONTO_NF: TBCDField
      FieldName = 'DESCONTO_NF'
      Origin = '"NOTA_FISCAL"."DESCONTO_NF"'
      Precision = 18
      Size = 2
    end
    object RelTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Origin = '"NOTA_FISCAL"."TIPO_CLIENTE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object RelNOTA_IMPRESSA: TStringField
      FieldName = 'NOTA_IMPRESSA'
      Origin = '"NOTA_FISCAL"."NOTA_IMPRESSA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object RelCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"NOTA_FISCAL"."COD_VENDA"'
    end
    object RelCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"NOTA_FISCAL"."COD_TPV"'
      Required = True
    end
    object RelSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = '"NOTA_FISCAL"."SERIE_NOTA"'
      Size = 3
    end
    object RelTIPO_NOTA_FISCAL: TIntegerField
      FieldName = 'TIPO_NOTA_FISCAL'
      Origin = '"NOTA_FISCAL"."TIPO_NOTA_FISCAL"'
      Required = True
    end
    object RelCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"NOTA_FISCAL"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object RelCODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_ENTRADA"'
    end
    object RelCODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = '"NOTA_FISCAL"."CODIGO_OUTRA_SAIDA"'
    end
    object RelCHAVE_ACESSO_NFE: TStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = '"NOTA_FISCAL"."CHAVE_ACESSO_NFE"'
      Size = 44
    end
    object RelPROTOCOLO_NFE: TStringField
      FieldName = 'PROTOCOLO_NFE'
      Origin = '"NOTA_FISCAL"."PROTOCOLO_NFE"'
      Size = 50
    end
    object RelSTATUS_TRANSMITIDA: TStringField
      FieldName = 'STATUS_TRANSMITIDA'
      Origin = '"NOTA_FISCAL"."STATUS_TRANSMITIDA"'
      Size = 2
    end
    object RelSTATUS_RETORNO: TStringField
      FieldName = 'STATUS_RETORNO'
      Origin = '"NOTA_FISCAL"."STATUS_RETORNO"'
      Size = 2
    end
    object RelSTATUS_CANCELADO: TStringField
      FieldName = 'STATUS_CANCELADO'
      Origin = '"NOTA_FISCAL"."STATUS_CANCELADO"'
      Size = 2
    end
    object RelSTATUS_INUTILIZADO: TStringField
      FieldName = 'STATUS_INUTILIZADO'
      Origin = '"NOTA_FISCAL"."STATUS_INUTILIZADO"'
      Size = 2
    end
    object RelSTATUS_EMAIL: TStringField
      FieldName = 'STATUS_EMAIL'
      Origin = '"NOTA_FISCAL"."STATUS_EMAIL"'
      Size = 2
    end
    object RelJUSTIFICATIVA_CANCEL_INUTIL: TStringField
      FieldName = 'JUSTIFICATIVA_CANCEL_INUTIL'
      Origin = '"NOTA_FISCAL"."JUSTIFICATIVA_CANCEL_INUTIL"'
      Size = 100
    end
    object RelPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."PLACA_TRANSP"'
      FixedChar = True
      Size = 8
    end
    object RelUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = '"NOTA_FISCAL"."UF_PLACA_TRANSP"'
      FixedChar = True
      Size = 2
    end
    object RelPESO_BRUTO_NF: TBCDField
      FieldName = 'PESO_BRUTO_NF'
      Origin = '"NOTA_FISCAL"."PESO_BRUTO_NF"'
      Precision = 18
      Size = 2
    end
    object RelPESO_LIQUIDO_NF: TBCDField
      FieldName = 'PESO_LIQUIDO_NF'
      Origin = '"NOTA_FISCAL"."PESO_LIQUIDO_NF"'
      Precision = 18
      Size = 2
    end
    object RelQUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = '"NOTA_FISCAL"."QUANTIDADE_NF"'
    end
    object RelCHAVE2: TStringField
      FieldName = 'CHAVE2'
      Origin = '"NOTA_FISCAL"."CHAVE2"'
      Size = 255
    end
    object RelDEPEC: TIntegerField
      FieldName = 'DEPEC'
      Origin = '"NOTA_FISCAL"."DEPEC"'
    end
    object RelVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object RelVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object RelCORRECAO: TStringField
      FieldName = 'CORRECAO'
      Origin = '"NOTA_FISCAL"."CORRECAO"'
      Size = 1
    end
    object RelPAF_ECF: TStringField
      FieldName = 'PAF_ECF'
      Origin = '"NOTA_FISCAL"."PAF_ECF"'
      Size = 1
    end
  end
  object Itens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from ITENS_NOTA_FISCAL where COD_NF=:COD_NF')
    Left = 208
    Top = 56
    ParamData = <
      item
        Name = 'COD_NF'
      end>
    object ItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_NOTA_FISCAL"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ItensCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"ITENS_NOTA_FISCAL"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ItensCST: TStringField
      FieldName = 'CST'
      Origin = '"ITENS_NOTA_FISCAL"."CST"'
      FixedChar = True
      Size = 3
    end
    object ItensALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ"'
      Precision = 18
      Size = 2
    end
    object ItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_NOTA_FISCAL"."COD_EMP"'
      Required = True
    end
    object ItensCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_NOTA_FISCAL"."COD_GRP"'
      Required = True
    end
    object ItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_NOTA_FISCAL"."QUANT"'
      Precision = 18
      Size = 3
    end
    object ItensALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_IPI"'
      Precision = 18
      Size = 2
    end
    object ItensREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = '"ITENS_NOTA_FISCAL"."REDUCAO_ICMS"'
      Required = True
      Precision = 18
      Size = 2
    end
    object ItensCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = '"ITENS_NOTA_FISCAL"."COD_CFO"'
      Required = True
    end
    object ItensSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = '"ITENS_NOTA_FISCAL"."SUB_TRIBUTARIA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ItensVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = '"ITENS_NOTA_FISCAL"."VR_AGREGADO"'
      Precision = 18
      Size = 2
    end
    object ItensALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQUOTA_FORA_ESTADO"'
      Precision = 18
      Size = 2
    end
    object ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = '"ITENS_NOTA_FISCAL"."UNIDADE"'
      Size = 4
    end
    object ItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_NOTA_FISCAL"."COD_PRO"'
    end
    object ItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object ItensBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = '"ITENS_NOTA_FISCAL"."BASE_CALCULO"'
      Precision = 18
      Size = 2
    end
    object ItensVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_ICMS"'
      Precision = 18
      Size = 2
    end
    object ItensBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = '"ITENS_NOTA_FISCAL"."BASE_SUBTRIB"'
      Precision = 18
      Size = 2
    end
    object ItensVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object ItensVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_SUBTRIB"'
      Precision = 18
      Size = 2
    end
    object ItensCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = '"ITENS_NOTA_FISCAL"."CLASSIFICACAO_FISCAL"'
      FixedChar = True
      Size = 1
    end
    object ItensUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = '"ITENS_NOTA_FISCAL"."UNIT"'
      Precision = 18
      Size = 3
    end
    object ItensISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = '"ITENS_NOTA_FISCAL"."ISENTAS"'
      Precision = 18
      Size = 2
    end
    object ItensOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = '"ITENS_NOTA_FISCAL"."OUTRAS"'
      Precision = 18
      Size = 2
    end
    object ItensFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = '"ITENS_NOTA_FISCAL"."FRETE"'
    end
    object ItensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_NOTA_FISCAL"."DESCONTO"'
    end
    object ItensBC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."BC_PIS"'
      Precision = 18
      Size = 2
    end
    object ItensALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_PIS"'
      Precision = 18
      Size = 2
    end
    object ItensVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object ItensBC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."BC_COFINS"'
      Precision = 18
      Size = 2
    end
    object ItensALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."ALIQ_COFINS"'
      Precision = 18
      Size = 2
    end
    object ItensVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
    object ItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_NOTA_FISCAL"."CANCELADO"'
    end
    object ItensNF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = '"ITENS_NOTA_FISCAL"."NF_CANCELADA"'
    end
    object ItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"ITENS_NOTA_FISCAL"."CST_PIS"'
      Size = 2
    end
    object ItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"ITENS_NOTA_FISCAL"."CST_COFINS"'
      Size = 2
    end
    object ItensCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"ITENS_NOTA_FISCAL"."CSOSN"'
      Size = 3
    end
    object ItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"ITENS_NOTA_FISCAL"."CST_IPI"'
      Size = 2
    end
  end
  object QTotal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM( N.VALOR_TOTAL_NF )'
      'FROM NOTA_FISCAL N'
      'INNER JOIN TRANSPORTADORA T'
      'ON (N.COD_TRA = T.COD_TRA)'
      'LEFT JOIN CLIENTE C'
      'ON (N.COD_CLI = C.COD_CLI)'
      'LEFT JOIN FORNECEDOR F'
      'ON (N.COD_FOR = F.COD_FOR)'
      
        'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND N.COD_' +
        'EMP = :CODEMP')
    Left = 64
    Top = 48
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
    object QTotalSUM: TBCDField
      FieldName = 'SUM'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
