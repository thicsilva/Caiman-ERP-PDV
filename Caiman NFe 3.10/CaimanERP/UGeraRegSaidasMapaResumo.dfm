object FrmGerarRegSaidasMapaResumo: TFrmGerarRegSaidasMapaResumo
  Left = 417
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Livro Sa'#237'das Mapa Resumo'
  ClientHeight = 124
  ClientWidth = 380
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 376
      Height = 61
      Align = alClient
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 152
        Top = 29
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 24
        Width = 105
        Height = 21
        Date = 40371.345122060190000000
        Time = 40371.345122060190000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 184
        Top = 24
        Width = 105
        Height = 21
        Date = 40371.345138125000000000
        Time = 40371.345138125000000000
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 380
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Button1: TButton
      Left = 92
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 212
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 105
    Width = 380
    Height = 19
    Panels = <>
  end
  object QItensMapaResumo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, G.ALIQUOTA_GRP, G.TIPO_GRP'
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      
        'WHERE I.CODIGO = :CODIGO AND G.TIPO_GRP IN ('#39'TRI'#39', '#39'ISE'#39', '#39'ST'#39', ' +
        #39'NT'#39') AND I.VALOR > 0'
      'ORDER BY I.COD_GRP')
    Left = 314
    Top = 18
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QItensMapaResumoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QItensMapaResumoCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
    object QItensMapaResumoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_MAPA_RESUMO.VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensMapaResumoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QItensMapaResumoINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
    object QItensMapaResumoALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'GRUPO_ICMS.ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensMapaResumoTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
  end
  object IBTRReg: TFDTransaction
    Connection = DM.IBDatabase
    Left = 24
    Top = 16
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRReg
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_SAIDAS(:DATA, :CNPJ, :CODMODELO, :SERIE, :NUM' +
        'ERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, :CODSAIDA, ' +
        ':UF, :INSC, :NFFINAL, :CODMAPA)')
    Left = 72
    Top = 16
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERONOTA'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALORTOTAL'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODSAIDA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'NFFINAL'
      end
      item
        Name = 'CODMAPA'
      end>
    object QInsertCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QInsItensLivro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRReg
    SQL.Strings = (
      
        'INSERT INTO ITENS_REGISTRO_LIVRO_SAIDAS (CODIGO, ORDEM, CFOP, BA' +
        'SE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA, ' +
        'CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO, BASE_CALCULO_RETIDO)'
      'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 32
    Top = 72
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QMapaResumo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT M.*, C.TRUNCAR_CAI'
      'FROM MAPA_RESUMO M'
      'INNER JOIN CAIXA C'
      'ON (M.CHECKOUT = C.COD_CAI) AND (M.COD_EMP = C.COD_EMP)'
      'WHERE M.DATA BETWEEN :DATAINI AND :DATAFIN'
      'AND M.COD_EMP = :CODEMP')
    Left = 178
    Top = 18
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
    object QMapaResumoCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = 'MAPA_RESUMO.CODIGO_PAF'
    end
    object QMapaResumoTRUNCAR_CAI: TStringField
      FieldName = 'TRUNCAR_CAI'
      Origin = 'CAIXA.TRUNCAR_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QTotalMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR) TOTAL'
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      
        'WHERE I.CODIGO = :CODIGO AND G.TIPO_GRP IN ('#39'TRI'#39', '#39'ISE'#39', '#39'ST'#39', ' +
        #39'NT'#39')')
    Left = 312
    Top = 73
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QTotalMapaTOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 2
    end
  end
end
