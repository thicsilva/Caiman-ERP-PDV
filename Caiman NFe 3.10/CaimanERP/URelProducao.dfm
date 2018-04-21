object FrmRelProducao: TFrmRelProducao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Produ'#231#227'o'
  ClientHeight = 186
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    ExplicitWidth = 447
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 337
      Height = 49
      Caption = 'Intervalo'
      TabOrder = 0
      object Label1: TLabel
        Left = 165
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 44
        Top = 18
        Width = 97
        Height = 21
        Date = 38783.569172627300000000
        Time = 38783.569172627300000000
        Color = clSilver
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 196
        Top = 18
        Width = 97
        Height = 21
        Date = 38783.569172627300000000
        Time = 38783.569172627300000000
        Color = clSilver
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 167
    Width = 372
    Height = 19
    Panels = <>
    ExplicitLeft = -24
    ExplicitTop = 266
    ExplicitWidth = 510
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 372
    Height = 94
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 71
    ExplicitWidth = 376
    ExplicitHeight = 80
    object BtnVis: TBitBtn
      Left = 82
      Top = 22
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 212
      Top = 22
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object frxProducao: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41094.385441736100000000
    ReportOptions.LastChange = 42761.881974861110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'RelatorioOnReportPrint'
    Left = 222
    Top = 131
    Datasets = <
      item
        DataSet = itens
        DataSetName = 'Itens'
      end
      item
        DataSet = Producao
        DataSetName = 'Producao'
      end>
    Variables = <
      item
        Name = ' Variaveis'
        Value = Null
      end
      item
        Name = 'periodo'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnAfterPrint = 'Page1OnAfterPrint'
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 408.189240000000000000
          Height = 26.456710000000000000
          DataSetName = 'DBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[PRODUCAO."FANTASIA_EMP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 612.283860000000000000
          Top = 3.779530000000001000
          Width = 98.267716540000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatDateTime('#39'dd/mm/yy'#39', <Date>)]'
            '[FormatDateTime('#39'hh:mm'#39', <Time>)]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo6: TfrxMemoView
          Left = 0.220470000000000100
          Top = 83.472480000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODU'#199#195'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 56.692949999999990000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          DataSetName = 'DBOSItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[periodo]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 60.472480000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = Producao
        DataSetName = 'Producao'
        RowCount = 0
        object DBOSGeralCLI_RAZAOSOCIAL: TfrxMemoView
          Left = 151.519790000000000000
          Top = 40.031540000000010000
          Width = 374.173470000000000000
          Height = 15.118120000000000000
          DataField = 'NOME_PRO'
          DataSet = Producao
          DataSetName = 'Producao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            '[Producao."NOME_PRO"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 3.779530000000000000
          Top = 40.031540000000040000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBOSItem'
          DisplayFormat.FormatStr = '%8.8d'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
          WordWrap = False
        end
        object Memo42: TfrxMemoView
          Left = 56.133890000000000000
          Top = 40.031540000000040000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'CODIGO'
          DataSet = Producao
          DataSetName = 'Producao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            '[Producao."CODIGO"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 114.590600000000000000
          Top = 40.031540000000040000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBOSItem'
          DisplayFormat.FormatStr = '%8.8d'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o:')
          ParentFont = False
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          Left = 598.370440000000000000
          Top = 39.795299999999970000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBOSItem'
          DisplayFormat.FormatStr = '%8.8d'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quatidade:')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 650.724800000000000000
          Top = 39.795299999999970000
          Width = 56.692950000000010000
          Height = 15.118120000000000000
          DataField = 'QUANT'
          DataSet = Producao
          DataSetName = 'Producao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            '[Producao."QUANT"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baWidth
          Top = 0.795299999999997400
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          DataSetName = 'DBOSItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS DO PRODUTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          Align = baWidth
          Top = 0.440940000000011900
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          DataSetName = 'DBOSItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'MAT'#201'RIAS PRIMAS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 2.307050000000000000
          Top = 30.236240000000120000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBOSItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 600.945270000000000000
          Top = 30.236240000000120000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBOSItem'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 72.165430000000000000
          Top = 30.236240000000120000
          Width = 525.354670000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBOSItem'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          WordWrap = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        DataSet = itens
        DataSetName = 'Itens'
        RowCount = 0
        object DBOSGeralItemQUANTIDADE: TfrxMemoView
          Left = 65.858380000000000000
          Top = 3.000000000000000000
          Width = 525.354670000000100000
          Height = 15.118120000000000000
          DataSetName = 'DBProdutoFichaComposicao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENS."NOME_PRO_COMPOSICAO"]')
          ParentFont = False
        end
        object DBOSGeralItemVL_UNITARIO: TfrxMemoView
          Left = 602.197280000000000000
          Top = 3.000000000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          DataSetName = 'DBProdutoFichaComposicao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ITENS."QUANT_COMPOSICAO"]')
          ParentFont = False
        end
        object DBOSGeralItemPROD_DESCRICAO: TfrxMemoView
          Left = 3.559060000000000000
          Top = 3.000000000000000000
          Width = 68.031540000000010000
          Height = 15.118120000000000000
          DataSetName = 'DBProdutoFichaComposicao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENS."COD_PRO_COMPOSICAO"]')
          ParentFont = False
        end
      end
    end
  end
  object Producao: TfrxDBDataset
    UserName = 'Producao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CODIGO=CODIGO'
      'QUANT=QUANT'
      'COD_PRO=COD_PRO'
      'NOME_PRO=NOME_PRO'
      'FANTASIA_EMP=FANTASIA_EMP')
    DataSet = QProducao
    BCDToCurrency = False
    Left = 304
    Top = 120
  end
  object QItens: TFDQuery
    MasterSource = dsNested
    MasterFields = 'COD_PRO'
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT P.DATA, P.CODIGO, IP.QUANT, IP.COD_PRO, PR.NOME_PRO, PC.C' +
        'OD_PRO_COMPOSICAO,'
      
        '       IP.QUANT * PC.QUANT AS QUANT_COMPOSICAO, PRC.NOME_PRO AS ' +
        'NOME_PRO_COMPOSICAO, E.FANTASIA_EMP'
      '  FROM REGISTRO_PRODUCAO P'
      
        '       LEFT OUTER JOIN ITENS_REGISTRO_PRODUCAO IP ON(P.CODIGO = ' +
        'IP.CODIGO)'
      '       LEFT OUTER JOIN PRODUTO PR ON(PR.COD_PRO = IP.COD_PRO)'
      
        '       LEFT OUTER JOIN PRODUTOS_COMPOSICAO PC ON(PR.COD_PRO = PC' +
        '.COD_PRO)'
      
        '       LEFT OUTER JOIN PRODUTO PRC ON(PRC.COD_PRO = PC.COD_PRO_C' +
        'OMPOSICAO)'
      '       LEFT OUTER JOIN EMPRESA E ON(P.COD_EMP = E.COD_EMP)'
      ' WHERE  IP.COD_PRO = :COD_PRO'
      ' '
      ' ORDER By PR.NOME_PRO')
    Left = 344
    Top = 80
    ParamData = <
      item
        Name = 'COD_PRO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object DateField1: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BCDField1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANT'
      Origin = 'QUANT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO_COMPOSICAO'
      Origin = 'COD_PRO_COMPOSICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO_COMPOSICAO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FMTBCDField1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANT_COMPOSICAO'
      Origin = 'QUANT_COMPOSICAO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
  end
  object itens: TfrxDBDataset
    UserName = 'Itens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CODIGO=CODIGO'
      'QUANT=QUANT'
      'COD_PRO=COD_PRO'
      'NOME_PRO=NOME_PRO'
      'COD_PRO_COMPOSICAO=COD_PRO_COMPOSICAO'
      'NOME_PRO_COMPOSICAO=NOME_PRO_COMPOSICAO'
      'FANTASIA_EMP=FANTASIA_EMP'
      'QUANT_COMPOSICAO=QUANT_COMPOSICAO')
    DataSet = QItens
    BCDToCurrency = False
    Left = 344
    Top = 120
  end
  object QProducao: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT P.DATA, P.CODIGO, IP.QUANT, IP.COD_PRO, PR.NOME_PRO,  E.F' +
        'ANTASIA_EMP'
      '  FROM REGISTRO_PRODUCAO P'
      
        '       LEFT OUTER JOIN ITENS_REGISTRO_PRODUCAO IP ON(P.CODIGO = ' +
        'IP.CODIGO)'
      '       LEFT OUTER JOIN PRODUTO PR ON(PR.COD_PRO = IP.COD_PRO)'
      '       LEFT OUTER JOIN EMPRESA E ON(P.COD_EMP = E.COD_EMP)'
      ' WHERE P.COD_EMP = :COD_EMP'
      '   AND P.DATA BETWEEN :DTINI AND :DTFIM'
      ' '
      ' ORDER By PR.NOME_PRO')
    Left = 304
    Top = 80
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DTINI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DTFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QProducaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object QProducaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProducaoQUANT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANT'
      Origin = 'QUANT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object QProducaoCOD_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QProducaoNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QProducaoFANTASIA_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsNested: TDataSource
    DataSet = QProducao
    Left = 368
    Top = 40
  end
end
