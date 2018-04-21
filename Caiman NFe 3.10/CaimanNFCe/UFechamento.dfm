object FrmFechamento: TFrmFechamento
  Left = 408
  Top = 313
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento do Caixa'
  ClientHeight = 154
  ClientWidth = 362
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 97
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Data Movimento'
    end
    object Label2: TLabel
      Left = 120
      Top = 8
      Width = 91
      Height = 13
      Caption = 'Hora Fechamento'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 51
      Height = 13
      Caption = 'C'#243'd.Caixa'
    end
    object EdtData: TMaskEdit
      Left = 8
      Top = 24
      Width = 80
      Height = 21
      EditMask = '99/99/9999'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      Text = '  /  /    '
    end
    object EdtHora: TMaskEdit
      Left = 120
      Top = 24
      Width = 57
      Height = 21
      EditMask = '99:99;1;_'
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
    end
    object EdtNomeCaixa: TEdit
      Left = 77
      Top = 64
      Width = 228
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object EdtCodCaixa: TEdit
      Left = 8
      Top = 64
      Width = 57
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 362
    Height = 38
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 1
    object BtnOk: TButton
      Left = 52
      Top = 7
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancelar: TButton
      Left = 236
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnCancelarClick
    end
    object BtnMenuFiscal: TButton
      Left = 144
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Menu Fiscal'
      TabOrder = 1
      OnClick = BtnMenuFiscalClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 135
    Width = 362
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object IBSQLFecha: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 208
    Top = 8
  end
  object QInsMapaRes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'INSERT INTO MAPA_RESUMO (CHECKOUT, DATA, COO_INICIAL, COO_FINAL,' +
        ' GT_INICIAL, GT_FINAL, CANCELAMENTO, DESCONTO, BC_ISENTA, BC_NAO' +
        'TRIB, BC_SUB, CONT_REDUCAO, CONT_CANCEL, ACRESCIMO, TRIB_25, TRI' +
        'B_17, TRIB_12, TRIB_7, TRIB_4, TRIB_3, NUMERO_SERIE, COD_EMP, CO' +
        'NTADOR_REINICIO_OPERACAO)'
      
        'VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, ' +
        ':14, :15, :16, :17, :18, :19, :20, :21, :22, :23)')
    Left = 280
    Top = 8
    ParamData = <
      item
        Name = '1'
        DataType = ftInteger
      end
      item
        Name = '2'
        DataType = ftDate
      end
      item
        Name = '3'
        DataType = ftInteger
      end
      item
        Name = '4'
        DataType = ftInteger
      end
      item
        Name = '5'
        DataType = ftCurrency
      end
      item
        Name = '6'
        DataType = ftCurrency
      end
      item
        Name = '7'
        DataType = ftCurrency
      end
      item
        Name = '8'
        DataType = ftCurrency
      end
      item
        Name = '9'
        DataType = ftCurrency
      end
      item
        Name = '10'
        DataType = ftCurrency
      end
      item
        Name = '11'
        DataType = ftCurrency
      end
      item
        Name = '12'
        DataType = ftInteger
      end
      item
        Name = '13'
        DataType = ftInteger
      end
      item
        Name = '14'
        DataType = ftCurrency
      end
      item
        Name = '15'
        DataType = ftCurrency
      end
      item
        Name = '16'
        DataType = ftCurrency
      end
      item
        Name = '17'
        DataType = ftCurrency
      end
      item
        Name = '18'
        DataType = ftCurrency
      end
      item
        Name = '19'
        DataType = ftCurrency
      end
      item
        Name = '20'
        DataType = ftCurrency
      end
      item
        Name = '21'
        DataType = ftString
      end
      item
        Name = '22'
        DataType = ftInteger
      end
      item
        Name = '23'
        DataType = ftInteger
      end>
  end
  object QconsPreVenda: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRPreVenda
    SQL.Strings = (
      'SELECT P.*, C.NOME_CLI, C.CNPJ_CLI, C.CIDRES_CLI, C.ESTRES_CLI'
      'FROM PRE_VENDA P'
      'INNER JOIN CLIENTE C'
      'ON (P.COD_CLI = C.COD_CLI)'
      
        'WHERE P.DATA_PRE <= :DATA AND P.COD_EMP = :CODEMP AND P.STATUS_P' +
        'RE = 0'
      'ORDER BY P.COD_PRE')
    Left = 152
    Top = 56
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODEMP'
      end>
    object QconsPreVendaCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = '"PRE_VENDA"."COD_PRE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QconsPreVendaDATA_PRE: TDateField
      FieldName = 'DATA_PRE'
      Origin = '"PRE_VENDA"."DATA_PRE"'
      Required = True
    end
    object QconsPreVendaCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"PRE_VENDA"."COD_CLI"'
      Required = True
    end
    object QconsPreVendaCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"PRE_VENDA"."COD_TPV"'
      Required = True
    end
    object QconsPreVendaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"PRE_VENDA"."COD_EMP"'
      Required = True
    end
    object QconsPreVendaSTATUS_PRE: TIntegerField
      FieldName = 'STATUS_PRE'
      Origin = '"PRE_VENDA"."STATUS_PRE"'
      Required = True
    end
    object QconsPreVendaTOTAL_PRE: TBCDField
      FieldName = 'TOTAL_PRE'
      Origin = '"PRE_VENDA"."TOTAL_PRE"'
      Precision = 18
      Size = 3
    end
    object QconsPreVendaHORA_PRE: TTimeField
      FieldName = 'HORA_PRE'
      Origin = '"PRE_VENDA"."HORA_PRE"'
    end
    object QconsPreVendaCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"PRE_VENDA"."COD_VENDA"'
    end
    object QconsPreVendaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = '"PRE_VENDA"."DOCUMENTO"'
    end
    object QconsPreVendaOBS_PRE: TStringField
      FieldName = 'OBS_PRE'
      Origin = '"PRE_VENDA"."OBS_PRE"'
      Size = 500
    end
    object QconsPreVendaDESCONTO_PRE: TBCDField
      FieldName = 'DESCONTO_PRE'
      Origin = '"PRE_VENDA"."DESCONTO_PRE"'
      Precision = 18
      Size = 2
    end
    object QconsPreVendaCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"PRE_VENDA"."COD_VEND"'
      Required = True
    end
    object QconsPreVendaSEQUENCIA_PAF: TLargeintField
      FieldName = 'SEQUENCIA_PAF'
      Origin = '"PRE_VENDA"."SEQUENCIA_PAF"'
      Required = True
    end
    object QconsPreVendaSENHA_FECHAR_VENDA: TStringField
      FieldName = 'SENHA_FECHAR_VENDA'
      Origin = '"PRE_VENDA"."SENHA_FECHAR_VENDA"'
    end
    object QconsPreVendaNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QconsPreVendaCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QconsPreVendaCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QconsPreVendaESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
  end
  object QItensPreVenda: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      
        'SELECT I.*, P.DESC_CUPOM, P.ICMS_CF_EST,   P.CODIGO_BARRA_PRO, U' +
        '.DESCRICAO'
      'FROM ITENS_PRE_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_PRE = :CODPRE'
      'ORDER BY ORDEM')
    Left = 240
    Top = 56
    ParamData = <
      item
        Name = 'CODPRE'
      end>
    object QItensPreVendaCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = '"ITENS_PRE_VENDA"."COD_PRE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensPreVendaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_PRE_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensPreVendaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_PRE_VENDA"."COD_PRO"'
      Required = True
    end
    object QItensPreVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_PRE_VENDA"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object QItensPreVendaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_PRE_VENDA"."COD_EMP"'
      Required = True
    end
    object QItensPreVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_PRE_VENDA"."QUANT"'
      Precision = 18
      Size = 3
    end
    object QItensPreVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_PRE_VENDA"."VALOR"'
      Precision = 18
      Size = 3
    end
    object QItensPreVendaPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_PRE_VENDA"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensPreVendaCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_PRE_VENDA"."CANCELADO"'
      Required = True
    end
    object QItensPreVendaDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QItensPreVendaICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
      Required = True
    end
    object QItensPreVendaCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QItensPreVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object IBTRPreVenda: TFDTransaction
    Connection = DM.IBDatabaseServer
    Left = 24
    Top = 64
  end
  object QBuscaIndice: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT INDICE_ECF'
      'FROM INDICE_ECF'
      
        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :COD' +
        'GRP')
    Left = 320
    Top = 56
    ParamData = <
      item
        Name = 'CODCAI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODGRP'
        DataType = ftInteger
      end>
    object QBuscaIndiceINDICE_ECF: TStringField
      FieldName = 'INDICE_ECF'
      Origin = 'INDICE_ECF.INDICE_ECF'
      Required = True
      Size = 5
    end
  end
  object QConsConta: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRPreVenda
    SQL.Strings = (
      'SELECT c.*'
      'FROM conta_cliente C'
      
        'WHERE c.data_abertura <= :DATA AND c.COD_EMP = :CODEMP AND c.sta' +
        'tus = 0'
      'ORDER BY c.codigo')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODEMP'
      end>
    object QConsContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"CONTA_CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = '"CONTA_CLIENTE"."DATA_ABERTURA"'
      Required = True
    end
    object QConsContaHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = '"CONTA_CLIENTE"."HORA_ABERTURA"'
      Required = True
    end
    object QConsContaCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = '"CONTA_CLIENTE"."CONTA"'
      Required = True
    end
    object QConsContaDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = '"CONTA_CLIENTE"."DATA_FECHAMENTO"'
    end
    object QConsContaHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = '"CONTA_CLIENTE"."HORA_FECHAMENTO"'
    end
    object QConsContaCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"CONTA_CLIENTE"."COD_CAI"'
      Required = True
    end
    object QConsContaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"CONTA_CLIENTE"."COD_EMP"'
      Required = True
    end
    object QConsContaSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = '"CONTA_CLIENTE"."STATUS"'
      Required = True
    end
    object QConsContaTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = '"CONTA_CLIENTE"."TOTAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QConsContaCONTA_ORIGEM: TIntegerField
      FieldName = 'CONTA_ORIGEM'
      Origin = '"CONTA_CLIENTE"."CONTA_ORIGEM"'
    end
    object QConsContaCER: TIntegerField
      FieldName = 'CER'
      Origin = '"CONTA_CLIENTE"."CER"'
    end
    object QConsContaCOO: TIntegerField
      FieldName = 'COO'
      Origin = '"CONTA_CLIENTE"."COO"'
    end
    object QConsContaCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = '"CONTA_CLIENTE"."COO_VENDA"'
    end
  end
  object QItensConta: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      
        'SELECT I.*, P.DESC_CUPOM, P.ICMS_CF_EST,   P.CODIGO_BARRA_PRO, U' +
        '.DESCRICAO'
      'FROM itens_conta_cliente I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.codigo = :CODCONTA'
      'ORDER BY i.ordem')
    Left = 104
    Top = 16
    ParamData = <
      item
        Name = 'CODCONTA'
      end>
    object QItensContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_CONTA_CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensContaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_CONTA_CLIENTE"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensContaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_CONTA_CLIENTE"."COD_PRO"'
      Required = True
    end
    object QItensContaCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ITENS_CONTA_CLIENTE"."COD_VEND"'
      Required = True
    end
    object QItensContaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_CONTA_CLIENTE"."VALOR"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensContaCONTA_ORIGEM: TIntegerField
      FieldName = 'CONTA_ORIGEM'
      Origin = '"ITENS_CONTA_CLIENTE"."CONTA_ORIGEM"'
    end
    object QItensContaCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_CONTA_CLIENTE"."CANCELADO"'
      Required = True
    end
    object QItensContaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_CONTA_CLIENTE"."COD_EMP"'
      Required = True
    end
    object QItensContaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_CONTA_CLIENTE"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensContaDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QItensContaICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
    end
    object QItensContaCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QItensContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
end
