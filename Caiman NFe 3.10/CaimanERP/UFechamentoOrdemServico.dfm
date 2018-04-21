object frmFechamentoOS: TfrmFechamentoOS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento Oordem Servi'#231'o'
  ClientHeight = 223
  ClientWidth = 366
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
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 366
    Height = 91
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    ExplicitWidth = 351
    object BtnOK: TBitBtn
      Left = 72
      Top = 34
      Width = 73
      Height = 27
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 200
      Top = 34
      Width = 73
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 366
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    ExplicitWidth = 351
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Valor Recebido'
    end
    object Label6: TLabel
      Left = 132
      Top = 8
      Width = 103
      Height = 13
      Caption = 'Data do Recebimento'
    end
    object Label2: TLabel
      Left = 244
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Data Vencimento'
    end
    object EdtValorRec: TCurrencyEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtData: TDateTimePicker
      Left = 132
      Top = 24
      Width = 97
      Height = 21
      Date = 37981.618029594900000000
      Time = 37981.618029594900000000
      Color = clSilver
      TabOrder = 1
    end
    object dataVencimento: TDateTimePicker
      Left = 244
      Top = 24
      Width = 97
      Height = 21
      Date = 37981.618029594900000000
      Time = 37981.618029594900000000
      Color = clSilver
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    ExplicitWidth = 351
    object Label1: TLabel
      Left = 8
      Top = 7
      Width = 53
      Height = 13
      Caption = 'Valor Bruto'
    end
    object Label3: TLabel
      Left = 98
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Desconto'
    end
    object Label4: TLabel
      Left = 265
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Valor L'#237'quido'
    end
    object Label7: TLabel
      Left = 170
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Valor Pago'
    end
    object EdtTotalBruto: TCurrencyEdit
      Left = 8
      Top = 23
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtDesc: TCurrencyEdit
      Left = 98
      Top = 23
      Width = 65
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtTotalLiq: TCurrencyEdit
      Left = 265
      Top = 23
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object edtValorPago: TCurrencyEdit
      Left = 170
      Top = 23
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 204
    Width = 366
    Height = 19
    Panels = <>
    ExplicitWidth = 351
  end
  object IBTR: TFDTransaction
    Connection = DM.IBDatabase
    Left = 264
    Top = 184
  end
  object QInsParcela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTR
    SQL.Strings = (
      
        'INSERT INTO CONTAS_RECEBER (COD_CTR, SEQUENCIA_CTR, COD_EMP, DAT' +
        'A_CTR, COD_OS, COD_CLI, VENCTO_CTR,'
      
        'VALOR_CTR, NUMDOCUMENTO_CTR, OBS_CTR, COD_COB, PARCELA_CTR, DEVO' +
        'LUCAO_CTR, CAIXA_EMISSAO_CTR, CODIGO_CLASSIFICACAO) '
      
        'VALUES (:CODCTR, :SEQUENCIACTR, :CODEMP, :DATACTR, :CODOS, :CODC' +
        'LI, :VENCTOCTR, :VALORCTR, :NUMDOCUMENTOCTR, :OBSCTR, :CODCOB, :' +
        'PARC, :DEVOL, :CX, :CODCLASSIF)')
    Left = 320
    Top = 152
    ParamData = <
      item
        Name = 'CODCTR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SEQUENCIACTR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DATACTR'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CODOS'
        ParamType = ptInput
      end
      item
        Name = 'CODCLI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'VENCTOCTR'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VALORCTR'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'NUMDOCUMENTOCTR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'OBSCTR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODCOB'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARC'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DEVOL'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'CX'
        ParamType = ptInput
      end
      item
        Name = 'CODCLASSIF'
        ParamType = ptInput
      end>
  end
  object frxRecibo: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41541.473408611100000000
    ReportOptions.LastChange = 41541.501713078700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 299
    Top = 115
    Datasets = <>
    Variables = <
      item
        Name = ' dados_rel'
        Value = Null
      end
      item
        Name = 'empresa'
        Value = ''
      end
      item
        Name = 'valor'
        Value = ''
      end
      item
        Name = 'numero'
        Value = ''
      end
      item
        Name = 'recebido'
        Value = ''
      end
      item
        Name = 'local'
        Value = ''
      end
      item
        Name = 'data_extenso'
        Value = ''
      end
      item
        Name = 'valor_extenso'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 366.614410000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 366.614410000000000000
        end
        object Shape2: TfrxShapeView
          Width = 740.787401570000000000
          Height = 34.015770000000000000
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.559060000000000000
          Width = 733.228820000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Top = 49.133890000000000000
          Width = 117.165430000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'RECIBO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 241.889920000000000000
          Top = 56.692950000000000000
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'N.'#186)
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 284.023810000000000000
          Top = 54.472480000000000000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo4: TfrxMemoView
          Left = 428.323130000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Valor R$ :')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Left = 523.913730000000000000
          Top = 53.913420000000000000
          Width = 207.874150000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 289.141930000000000000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[numero]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
          Top = 60.472480000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[valor]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 18.897650000000000000
          Top = 102.385900000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Recebi (emos) de:')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          Left = 18.897650000000000000
          Top = 124.724490000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo8: TfrxMemoView
          Left = 24.015770000000000000
          Top = 128.724490000000000000
          Width = 699.213050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[recebido]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 18.897650000000000000
          Top = 158.740260000000000000
          Width = 185.196970000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'A quantia subra de :')
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 18.897650000000000000
          Top = 181.078850000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo10: TfrxMemoView
          Left = 24.015770000000000000
          Top = 185.078850000000000000
          Width = 699.213050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[valor_extenso]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 18.897650000000000000
          Top = 219.212740000000000000
          Width = 287.244280000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Referente ao parcelamento : [numero]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 132.283550000000000000
          Top = 257.905690000000000000
          Width = 597.165740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[local], [data_extenso]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 181.417440000000000000
          Top = 328.819110000000000000
          Width = 389.291590000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 302.362400000000000000
          Top = 336.378170000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EMITENTE')
          ParentFont = False
        end
      end
    end
  end
end
