object FrmQRelCarta: TFrmQRelCarta
  Left = 197
  Top = 112
  Caption = 'Carta'
  ClientHeight = 617
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QRCarta: TQuickRep
    Tag = 1
    Left = -12
    Top = -567
    Width = 816
    Height = 1056
    DataSet = FrmMalaSel.QRelCobranca
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
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
      Top = 345
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
      object QRDBText2: TQRDBText
        Left = 57
        Top = 1
        Width = 56
        Height = 16
        Size.Values = (
          42.333333333333300000
          150.812500000000000000
          2.645833333333330000
          148.166666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'COD_CTR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 166
        Top = 1
        Width = 67
        Height = 16
        Size.Values = (
          42.333333333333300000
          439.208333333333000000
          2.645833333333330000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'DATA_CTR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 307
        Top = 1
        Width = 62
        Height = 16
        Size.Values = (
          42.333333333333300000
          812.270833333333000000
          2.645833333333330000
          164.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'VENCTO_CTR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 417
        Top = 1
        Width = 56
        Height = 16
        Size.Values = (
          42.333333333333300000
          1103.312500000000000000
          2.645833333333330000
          148.166666666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'VALOR_CTR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 384
        Top = 1
        Width = 29
        Height = 16
        Size.Values = (
          42.333333333333330000
          1016.000000000000000000
          2.645833333333333000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor:'
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
        Left = 0
        Top = 1
        Width = 58
        Height = 16
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          2.645833333333333000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Documento:'
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
        Left = 120
        Top = 1
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          317.500000000000000000
          2.645833333333333000
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
      object QRLabel4: TQRLabel
        Left = 240
        Top = 1
        Width = 60
        Height = 16
        Size.Values = (
          42.333333333333330000
          635.000000000000000000
          2.645833333333333000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Vencimento:'
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
      object QRLabel7: TQRLabel
        Left = 480
        Top = 1
        Width = 24
        Height = 16
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
          2.645833333333333000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dias:'
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
      object QRDBText6: TQRDBText
        Left = 505
        Top = 1
        Width = 32
        Height = 16
        Size.Values = (
          42.333333333333300000
          1336.145833333330000000
          2.645833333333330000
          84.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'DIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 544
        Top = 1
        Width = 27
        Height = 16
        Size.Values = (
          42.333333333333330000
          1439.333333333333000000
          2.645833333333333000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Juros:'
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
      object QRDBText7: TQRDBText
        Left = 569
        Top = 1
        Width = 48
        Height = 16
        Size.Values = (
          42.333333333333300000
          1505.479166666670000000
          2.645833333333330000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'CALC_JUROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 632
        Top = 1
        Width = 30
        Height = 16
        Size.Values = (
          42.333333333333330000
          1672.166666666667000000
          2.645833333333333000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total:'
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
      object QRDBText8: TQRDBText
        Left = 665
        Top = 1
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333300000
          1759.479166666670000000
          2.645833333333330000
          169.333333333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'CALC_VALORLIQ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 131
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        346.604166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLNomeEmpresa: TQRLabel
        Left = 8
        Top = 16
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          42.333333333333300000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLNomeEmpresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLEndEmp: TQRLabel
        Left = 8
        Top = 40
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          105.833333333333000000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLEndEmp'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLEnd1: TQRLabel
        Left = 8
        Top = 64
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          169.333333333333000000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLEnd1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLData: TQRLabel
        Left = 8
        Top = 96
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          254.000000000000000000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLData'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 169
      Width = 740
      Height = 176
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        465.666666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'NOME_CLI'
      FooterBand = QRBand1
      Master = QRCarta
      ReprintOnNewPage = False
      object QRLabel1: TQRLabel
        Left = 8
        Top = 16
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          42.333333333333300000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Ao(a) Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLConteudo: TQRLabel
        Left = 64
        Top = 96
        Width = 657
        Height = 20
        Size.Values = (
          52.916666666666700000
          169.333333333333000000
          254.000000000000000000
          1738.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'QRLConteudo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 48
        Width = 721
        Height = 20
        Size.Values = (
          52.916666666666700000
          21.166666666666700000
          127.000000000000000000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'NOME_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 362
      Width = 740
      Height = 495
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1309.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel6: TQRLabel
        Left = 368
        Top = 7
        Width = 32
        Height = 16
        Size.Values = (
          42.333333333333330000
          973.666666666666700000
          18.520833333333330000
          84.666666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 416
        Top = 7
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          1100.666666666670000000
          18.520833333333300000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(valor_ctr)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 568
        Top = 7
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          1502.833333333330000000
          18.520833333333300000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(calc_juros)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 664
        Top = 7
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1756.833333333330000000
          18.520833333333300000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = True
        Transparent = False
        Expression = 'sum(calc_valorliq)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 6
        Top = 426
        Width = 90
        Height = 18
        Size.Values = (
          47.625000000000000000
          15.875000000000000000
          1127.125000000000000000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Destinat'#225'rio :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText9: TQRDBText
        Left = 102
        Top = 426
        Width = 77
        Height = 18
        Size.Values = (
          47.625000000000000000
          269.875000000000000000
          1127.125000000000000000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'NOME_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel10: TQRLabel
        Left = 6
        Top = 445
        Width = 73
        Height = 18
        Size.Values = (
          47.625000000000000000
          15.875000000000000000
          1177.395833333333000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Endere'#231'o :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText10: TQRDBText
        Left = 84
        Top = 445
        Width = 91
        Height = 18
        Size.Values = (
          47.625000000000000000
          222.250000000000000000
          1177.395833333333000000
          240.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'ENDRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel13: TQRLabel
        Left = 245
        Top = 463
        Width = 56
        Height = 18
        Size.Values = (
          47.625000000000000000
          648.229166666666700000
          1225.020833333333000000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText13: TQRDBText
        Left = 306
        Top = 463
        Width = 86
        Height = 18
        Size.Values = (
          47.625000000000000000
          809.625000000000000000
          1225.020833333333000000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'CIDRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel11: TQRLabel
        Left = 406
        Top = 445
        Width = 63
        Height = 18
        Size.Values = (
          47.625000000000000000
          1074.208333333333000000
          1177.395833333333000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Numero :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText12: TQRDBText
        Left = 474
        Top = 445
        Width = 95
        Height = 18
        Size.Values = (
          47.625000000000000000
          1254.125000000000000000
          1177.395833333333000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'NUMRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel15: TQRLabel
        Left = 622
        Top = 463
        Width = 55
        Height = 18
        Size.Values = (
          47.625000000000000000
          1645.708333333333000000
          1225.020833333333000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText15: TQRDBText
        Left = 680
        Top = 463
        Width = 86
        Height = 18
        Size.Values = (
          47.625000000000000000
          1799.166666666667000000
          1225.020833333333000000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'ESTRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRDBText14: TQRDBText
        Left = 519
        Top = 463
        Width = 88
        Height = 18
        Size.Values = (
          47.625000000000000000
          1373.187500000000000000
          1225.020833333333000000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'CEPRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel14: TQRLabel
        Left = 476
        Top = 463
        Width = 40
        Height = 18
        Size.Values = (
          47.625000000000000000
          1259.416666666667000000
          1225.020833333333000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText11: TQRDBText
        Left = 64
        Top = 463
        Width = 86
        Height = 18
        Size.Values = (
          47.625000000000000000
          169.333333333333300000
          1225.020833333333000000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = FrmMalaSel.QRelCobranca
        DataField = 'BAIRES_CLI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel12: TQRLabel
        Left = 6
        Top = 463
        Width = 52
        Height = 18
        Size.Values = (
          47.625000000000000000
          15.875000000000000000
          1225.020833333333000000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
    end
  end
end
