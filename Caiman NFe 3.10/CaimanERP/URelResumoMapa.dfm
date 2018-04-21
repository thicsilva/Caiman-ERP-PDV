object FrmRelResumoMapa: TFrmRelResumoMapa
  Left = 415
  Top = 233
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do Resumo por Al'#237'quota'
  ClientHeight = 164
  ClientWidth = 283
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 283
    Height = 105
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GBPeriodo: TGroupBox
      Left = 10
      Top = 42
      Width = 265
      Height = 55
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 128
        Top = 26
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 22
        Width = 97
        Height = 21
        Date = 38475.460671956000000000
        Time = 38475.460671956000000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 22
        Width = 97
        Height = 21
        Date = 38475.460671956000000000
        Time = 38475.460671956000000000
        TabOrder = 1
      end
    end
    object Rdg: TRadioGroup
      Left = 10
      Top = 2
      Width = 265
      Height = 39
      Columns = 2
      Items.Strings = (
        'Mapa Resumo'
        'Nota Fiscal')
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 283
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 145
    Width = 283
    Height = 19
    Panels = <>
  end
  object QRelMapa: TFDQuery
    OnCalcFields = QRelMapaCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.COD_GRP,  SUM(I.VALOR) TOTAL, G.NOME_GRP, G.TIPO_GRP '
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN MAPA_RESUMO M'
      'ON (I.CODIGO = M.CODIGO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      
        'WHERE M.DATA BETWEEN :DATAINI AND :DATAFIN AND M.COD_EMP = :CODE' +
        'MP'
      'GROUP BY I.COD_GRP, G.NOME_GRP, G.TIPO_GRP'
      'ORDER BY G.NOME_GRP')
    Left = 112
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QRelMapaCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Required = True
    end
    object QRelMapaNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
    object QRelMapaTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelMapaTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QRelMapaCALC_CONTABIL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_CONTABIL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QRelMapaCALC_BASE_ICMS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_BASE_ICMS'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
  end
  object QRelNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.COD_CFO, P.ICMS_CF_EST, G.NOME_GRP, SUM((I.QUANT * I.UN' +
        'IT) - (((I.QUANT * I.UNIT) * ((N.DESCONTO_NF * 100) / (N.VALOR_T' +
        'OTAL_NF + N.DESCONTO_NF)) / 100)) )TOTAL '
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN NOTA_FISCAL N'
      'ON (I.COD_NF = N.COD_NF)'
      'INNER JOIN CFOP C'
      'ON (I.COD_CFO = C.COD_CFO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN'
      
        'AND N.CANCELADA_NF = '#39'N'#39' AND C.SAIR_REL_RESUMO_ALIQ = '#39'S'#39' AND I.' +
        'COD_EMP = :CODEMP'
      'GROUP BY I.COD_CFO, P.ICMS_CF_EST, G.NOME_GRP'
      'ORDER BY I.COD_CFO, P.ICMS_CF_EST')
    Left = 232
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
    object QRelNFICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Required = True
    end
    object QRelNFNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
    object QRelNFTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QRelNFCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Required = True
    end
  end
end
