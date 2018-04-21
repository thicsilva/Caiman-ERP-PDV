object frmRelOS: TfrmRelOS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 163
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 412
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
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 412
    Height = 58
    Align = alTop
    Caption = ' T'#233'cnico'
    TabOrder = 1
    object edttecnico: TJvDBLookupCombo
      Left = 10
      Top = 24
      Width = 367
      Height = 21
      DisplayEmpty = 'Selecione um T'#233'cnico'
      LookupField = 'COD_FUN'
      LookupDisplay = 'NOME_FUN'
      LookupSource = dsFuncionario
      TabOrder = 0
    end
  end
  object pnl1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 119
    Width = 412
    Height = 41
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
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
  object QFuncionario: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT COD_FUN, NOME_FUN'
      'FROM FUNCIONARIO'
      'ORDER BY NOME_FUN')
    Left = 288
    Top = 119
    object QFuncionarioCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Origin = 'COD_FUN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QFuncionarioNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Origin = 'NOME_FUN'
      Required = True
      Size = 60
    end
  end
  object dsFuncionario: TDataSource
    DataSet = QFuncionario
    Left = 321
    Top = 119
  end
  object QRelOS: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT OS.ID_OS, F.NOME_FUN, C.NOME_CLI, CASE WHEN OS.SITUACAO =' +
        ' '#39'F'#39' THEN '#39'Fechado'#39' ELSE '#39'Aberto'#39' END SIT,'
      '       OS.VALOR_DESCONTO, OS.VALOR_SERVICOS, OS.DATA_CADASATRO,'
      
        '       COALESCE((SELECT SUM(OSI.QUANTIDADE * OSI.VALOR_UNITARIO)' +
        ' FROM OS_ITEM OSI WHERE OSI.ID_OS = OS.ID_OS),0) AS  VALOR_ITENS' +
        ','
      
        '       OS.VALOR_SERVICOS + COALESCE((SELECT SUM(OSI.QUANTIDADE *' +
        ' OSI.VALOR_UNITARIO) FROM OS_ITEM OSI WHERE OSI.ID_OS = OS.ID_OS' +
        '),0) - OS.VALOR_DESCONTO AS VALOR_TOTAL'
      '  FROM OS'
      '       LEFT OUTER JOIN CLIENTE C ON(C.COD_CLI = OS.ID_CLIENTE)'
      '       LEFT OUTER JOIN FUNCIONARIO F ON(F.COD_FUN = OS.TECNICO)'
      '   ORDER BY F.NOME_FUN, OS.DATA_CADASATRO')
    Left = 288
    Top = 24
    object QRelOSID_OS: TIntegerField
      FieldName = 'ID_OS'
      Origin = 'ID_OS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelOSNOME_FUN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FUN'
      Origin = 'NOME_FUN'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QRelOSNOME_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QRelOSSIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIT'
      Origin = 'SIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object QRelOSVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      currency = True
    end
    object QRelOSVALOR_SERVICOS: TFloatField
      FieldName = 'VALOR_SERVICOS'
      Origin = 'VALOR_SERVICOS'
      currency = True
    end
    object QRelOSDATA_CADASATRO: TDateField
      FieldName = 'DATA_CADASATRO'
      Origin = 'DATA_CADASATRO'
    end
    object QRelOSVALOR_ITENS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ITENS'
      Origin = 'VALOR_ITENS'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
    object QRelOSVALOR_TOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
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
    Left = 192
    Top = 112
  end
  object frxOS: TfrxDBDataset
    UserName = 'OS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_OS=ID_OS'
      'NOME_FUN=NOME_FUN'
      'NOME_CLI=NOME_CLI'
      'SIT=SIT'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_SERVICOS=VALOR_SERVICOS'
      'DATA_CADASATRO=DATA_CADASATRO'
      'VALOR_ITENS=VALOR_ITENS'
      'VALOR_TOTAL=VALOR_TOTAL')
    DataSet = QRelOS
    BCDToCurrency = False
    Left = 240
    Top = 64
  end
  object frxFROS: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41424.638335370400000000
    ReportOptions.LastChange = 42696.336142534730000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 176
    Top = 64
    Datasets = <
      item
        DataSet = frxOS
        DataSetName = 'OS'
      end>
    Variables = <
      item
        Name = ' VENDEDOR'
        Value = Null
      end
      item
        Name = 'VENDEDOR'
        Value = Null
      end
      item
        Name = 'DATAINI'
        Value = Null
      end
      item
        Name = 'DATAFIN'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.779530000000001000
          Width = 744.567410000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Ordem de Servi'#231'o')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 5.118120000000000000
          Top = 29.015770000000010000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'T'#233'cnico :')
          ParentFont = False
        end
        object VENDEDOR: TfrxMemoView
          Left = 95.826840000000000000
          Top = 29.015770000000010000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[VENDEDOR]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Height = 49.133890000000000000
        ParentFont = False
        Top = 132.283550000000000000
        Width = 755.906000000000000000
        DataSet = frxOS
        DataSetName = 'OS'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = 2.000000000000000000
          Top = 0.338590000000010600
          Width = 752.126470000000000000
          Height = 45.354360000000000000
        end
        object Memo4: TfrxMemoView
          Left = 2.559060000000000000
          Top = 1.779529999999994000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo de [DATAINI] '#224' [DATAFIN]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo5: TfrxMemoView
          Left = 85.149660000000000000
          Top = 22.456709999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 326.307360000000000000
          Top = 22.677179999999990000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total Servi'#231'os')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 657.535870000000000000
          Top = 22.677179999999990000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total OS')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 430.866420000000000000
          Top = 22.677179999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total Itens')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 6.559060000000000000
          Top = 23.677179999999990000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'OS')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 521.575140000000000000
          Top = 22.677179999999990000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Desconto')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 755.906000000000000000
        DataSet = frxOS
        DataSetName = 'OS'
        PrintIfDetailEmpty = True
        RowCount = 0
        object VENDAS_COMISSOESVENDA: TfrxMemoView
          Left = 2.559060000000000000
          Top = 1.779529999999994000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'ID_OS'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."ID_OS"]')
          ParentFont = False
        end
        object VENDAS_COMISSOESNOME_CLI: TfrxMemoView
          Left = 84.149660000000000000
          Top = 1.779529999999994000
          Width = 234.330860000000000000
          Height = 15.118120000000000000
          DataField = 'NOME_CLI'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."NOME_CLI"]')
          ParentFont = False
        end
        object VENDAS_COMISSOESTOTAL_VENDA: TfrxMemoView
          Left = 325.275820000000000000
          Top = 1.779529999999994000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR_SERVICOS'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."VALOR_SERVICOS"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 655.842920000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR_TOTAL'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."VALOR_TOTAL"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 430.866420000000000000
          Top = 2.000000000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR_ITENS'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."VALOR_ITENS"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 521.575140000000000000
          Top = 2.000000000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR_DESCONTO'
          DataSet = frxOS
          DataSetName = 'OS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[OS."VALOR_DESCONTO"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 287.244280000000000000
        Width = 755.906000000000000000
        object Memo35: TfrxMemoView
          Left = 525.354670000000000000
          Top = 5.779530000000023000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total Geral : ')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 650.079160000000000000
          Top = 5.779530000000023000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSetName = 'COMISSOES'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<OS."VALOR_TOTAL">,DetailData1)]')
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 748.346940000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object FDTROS: TFDTransaction
    Options.AutoStop = False
    Connection = DM.IBDatabase
    Left = 208
    Top = 64
  end
end
