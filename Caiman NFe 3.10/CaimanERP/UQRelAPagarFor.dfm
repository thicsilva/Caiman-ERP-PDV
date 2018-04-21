object FrmQRelAPagarFor: TFrmQRelAPagarFor
  Left = 292
  Top = 312
  Caption = 'Relatorio de Contas a Pagar - por Fornecedor'
  ClientHeight = 232
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object QRPagar: TQuickRep
    Tag = 1
    Left = -2
    Top = -5
    Width = 816
    Height = 1056
    Frame.DrawTop = True
    Frame.DrawBottom = True
    DataSet = FrmRelContasAPagar.QPagar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      150.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object DetailBand1: TQRBand
      Left = 38
      Top = 144
      Width = 740
      Height = 17
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText5: TQRDBText
        Left = 0
        Top = 0
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          0.000000000000000000
          0.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'COD_CPT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 88
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          232.833333333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'DATA_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 328
        Top = 0
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          867.833333333333000000
          0.000000000000000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'NUM_DOC_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 408
        Top = 0
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333300000
          1079.500000000000000000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'VALOR_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 496
        Top = 0
        Width = 225
        Height = 16
        Size.Values = (
          42.333333333333300000
          1312.333333333330000000
          0.000000000000000000
          595.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'OBS_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 152
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          402.166666666667000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'DTVENCTO_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 216
        Top = 0
        Width = 105
        Height = 16
        Size.Values = (
          42.333333333333300000
          571.500000000000000000
          0.000000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'TIPO_DOC_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 56
        Top = 0
        Width = 25
        Height = 16
        Size.Values = (
          42.333333333333300000
          148.166666666667000000
          0.000000000000000000
          66.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'SEQUENCIA_CTP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 76
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        201.083333333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLNomeEmpresa: TQRLabel
        Left = 8
        Top = 8
        Width = 561
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          21.166666666666700000
          1484.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLNomeEmpresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 664
        Top = 8
        Width = 31
        Height = 16
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          21.166666666666670000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 664
        Top = 24
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          63.500000000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRSysData3: TQRSysData
        Left = 664
        Top = 40
        Width = 37
        Height = 16
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          105.833333333333300000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 592
        Top = 8
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          1566.333333333333000000
          21.166666666666670000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Emiss'#227'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 592
        Top = 24
        Width = 27
        Height = 16
        Size.Values = (
          42.333333333333330000
          1566.333333333333000000
          63.500000000000000000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hora:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 592
        Top = 40
        Width = 35
        Height = 16
        Size.Values = (
          42.333333333333330000
          1566.333333333333000000
          105.833333333333300000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 53
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          140.000000000000000000
          1899.708333333330000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 58
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          0.000000000000000000
          153.458333333333000000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'd.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLTitulo: TQRLabel
        Left = 8
        Top = 24
        Width = 561
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          63.500000000000000000
          1484.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLTitulo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 88
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          232.833333333333000000
          153.458333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Emiss'#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 152
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          402.166666666667000000
          153.458333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencto.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 328
        Top = 58
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          867.833333333333000000
          153.458333333333000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Num.doc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 408
        Top = 58
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333300000
          1079.500000000000000000
          153.458333333333000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 496
        Top = 58
        Width = 217
        Height = 16
        Size.Values = (
          42.333333333333300000
          1312.333333333330000000
          153.458333333333000000
          574.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Observa'#231#227'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 216
        Top = 58
        Width = 105
        Height = 16
        Size.Values = (
          42.333333333333300000
          571.500000000000000000
          153.458333333333000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo Documento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 48
        Top = 58
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333300000
          127.000000000000000000
          153.458333333333000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Seq.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLCla: TQRLabel
        Left = 8
        Top = 40
        Width = 561
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          105.833333333333000000
          1484.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLCla'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 114
      Width = 740
      Height = 30
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'COD_FOR'
      FooterBand = QRBand1
      Master = QRPagar
      ReprintOnNewPage = True
      object QRShape2: TQRShape
        Left = 0
        Top = 1
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          2.645833333333330000
          1899.708333333330000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 20
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          52.916666666666700000
          1899.708333333330000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 72
        Top = 8
        Width = 585
        Height = 16
        Size.Values = (
          42.333333333333300000
          190.500000000000000000
          21.166666666666700000
          1547.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'RAZAO_FOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText9: TQRDBText
        Left = 5
        Top = 8
        Width = 60
        Height = 16
        Size.Values = (
          42.333333333333330000
          13.229166666666670000
          21.166666666666670000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmRelContasAPagar.QPagar
        DataField = 'COD_FOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 161
      Width = 740
      Height = 16
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel7: TQRLabel
        Left = 296
        Top = 0
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          783.166666666666700000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub Total'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 382
        Top = 0
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333330000
          1010.708333333333000000
          0.000000000000000000
          283.104166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRPagar
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(VALOR_CTP)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 177
      Width = 740
      Height = 31
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel11: TQRLabel
        Left = 264
        Top = 8
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          698.500000000000000000
          21.166666666666670000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL GERAL'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 376
        Top = 8
        Width = 113
        Height = 16
        Size.Values = (
          42.333333333333330000
          994.833333333333300000
          21.166666666666670000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRPagar
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(VALOR_CTP)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
end
