object FrmQRelExtratoCliente: TFrmQRelExtratoCliente
  Left = 200
  Top = 318
  Caption = 'Relat'#243'rio de Extrato de Cliente'
  ClientHeight = 228
  ClientWidth = 823
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
  object QRCli: TQuickRep
    Tag = 1
    Left = -2
    Top = -5
    Width = 816
    Height = 1056
    Frame.DrawTop = True
    Frame.DrawBottom = True
    DataSet = FrmRelExtratoCliente.QConsExtrato
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
      Top = 114
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
      object QRDBText1: TQRDBText
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
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'CODCTR'
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
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'SEQCTR'
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
      object QRDBText5: TQRDBText
        Left = 96
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          254.000000000000000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'DATACTR'
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
        Left = 160
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          423.333333333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'VENCTOCTR'
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
        Left = 328
        Top = 0
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          867.833333333333000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'VALORCTR'
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
      object QRDBText3: TQRDBText
        Left = 224
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          592.666666666667000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'DTPAGTOCTR'
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
        Left = 288
        Top = 0
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333300000
          762.000000000000000000
          0.000000000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'DIAS'
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
        Left = 528
        Top = 0
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1397.000000000000000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'ACRESRECCTR'
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
      object QRDBText11: TQRDBText
        Left = 664
        Top = 0
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333330000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'VLRPAGOCTR'
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
        Left = 400
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          1058.333333333330000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'DEVOLUCAO'
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
      object QRDBText9: TQRDBText
        Left = 600
        Top = 0
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'DESCCONCEDIDO'
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
      object QRDBText12: TQRDBText
        Left = 464
        Top = 0
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          1227.666666666670000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelExtratoCliente.QConsExtrato
        DataField = 'JUROS'
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
      Frame.DrawBottom = True
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
        Width = 737
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          140.229166666667000000
          1949.979166666670000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
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
        Caption = 'Cod.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 56
        Top = 58
        Width = 23
        Height = 16
        Size.Values = (
          42.333333333333300000
          148.166666666667000000
          153.458333333333000000
          60.854166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Seq.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 96
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          254.000000000000000000
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
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 160
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          423.333333333333000000
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
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 328
        Top = 58
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333300000
          867.833333333333000000
          153.458333333333000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Valor Bruto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLCli: TQRLabel
        Left = 8
        Top = 40
        Width = 45
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          105.833333333333300000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLCli'
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
      object QRLTitulo: TQRLabel
        Left = 8
        Top = 24
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          63.500000000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
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
        Left = 224
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          592.666666666667000000
          153.458333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pagto.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 288
        Top = 58
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333300000
          762.000000000000000000
          153.458333333333000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dias'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 528
        Top = 58
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1397.000000000000000000
          153.458333333333000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Acresc.Rec.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 664
        Top = 58
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333300000
          1756.833333333330000000
          153.458333333333000000
          179.916666666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Vlr.Recebido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 400
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          1058.333333333330000000
          153.458333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Devol.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 600
        Top = 58
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          153.458333333333000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Desconto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 464
        Top = 58
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          1227.666666666670000000
          153.458333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Acresc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 131
      Width = 740
      Height = 40
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel15: TQRLabel
        Left = 8
        Top = 3
        Width = 100
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          7.937500000000000000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total a Receber =>'
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
      object QRLabel16: TQRLabel
        Left = 8
        Top = 19
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          50.270833333333330000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Recebido  =>'
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
      object QRLabel17: TQRLabel
        Left = 112
        Top = 3
        Width = 35
        Height = 16
        Size.Values = (
          42.333333333333330000
          296.333333333333300000
          7.937500000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bruto:'
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
      object QRLabel18: TQRLabel
        Left = 112
        Top = 19
        Width = 35
        Height = 16
        Size.Values = (
          42.333333333333330000
          296.333333333333300000
          50.270833333333330000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bruto:'
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
      object QRLabel19: TQRLabel
        Left = 360
        Top = 3
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          952.500000000000000000
          7.937500000000000000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Acresc.:'
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
      object QRLabel20: TQRLabel
        Left = 360
        Top = 19
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          952.500000000000000000
          50.270833333333330000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Acresc.:'
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
      object QRLabel21: TQRLabel
        Left = 608
        Top = 3
        Width = 45
        Height = 16
        Size.Values = (
          42.333333333333330000
          1608.666666666667000000
          7.937500000000000000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'L'#237'quido:'
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
      object QRLabel22: TQRLabel
        Left = 608
        Top = 19
        Width = 45
        Height = 16
        Size.Values = (
          42.333333333333330000
          1608.666666666667000000
          50.270833333333330000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'L'#237'quido:'
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
      object QRLBruAReceber: TQRLabel
        Left = 152
        Top = 3
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          402.166666666667000000
          7.937500000000000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLBruAReceber'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLBruRecebido: TQRLabel
        Left = 152
        Top = 19
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          402.166666666667000000
          50.270833333333300000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLBruRecebido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLJurosAReceber: TQRLabel
        Left = 408
        Top = 3
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          1079.500000000000000000
          7.937500000000000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLJurosAReceber'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLJurosRecebido: TQRLabel
        Left = 408
        Top = 19
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          1079.500000000000000000
          50.270833333333300000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLJurosRecebido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLLiqRec: TQRLabel
        Left = 656
        Top = 19
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          1735.666666666670000000
          50.270833333333300000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLLiqRec'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLLiqARec: TQRLabel
        Left = 656
        Top = 3
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          1735.666666666670000000
          7.937500000000000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLLiqARec'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel24: TQRLabel
        Left = 232
        Top = 3
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          7.937500000000000000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Devol.:'
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
      object QRLDevARec: TQRLabel
        Left = 280
        Top = 3
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          7.937500000000000000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLDevARec'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel26: TQRLabel
        Left = 232
        Top = 19
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          50.270833333333330000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Devol.:'
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
      object QRLDevRec: TQRLabel
        Left = 280
        Top = 19
        Width = 73
        Height = 16
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          50.270833333333300000
          193.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLDevRec'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel25: TQRLabel
        Left = 488
        Top = 3
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333330000
          1291.166666666667000000
          7.937500000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desc.:'
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
      object QRLabel27: TQRLabel
        Left = 488
        Top = 19
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333330000
          1291.166666666667000000
          50.270833333333330000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desc.:'
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
      object QRLDescRec: TQRLabel
        Left = 528
        Top = 19
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1397.000000000000000000
          50.270833333333300000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLDescRec'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLDescARec: TQRLabel
        Left = 528
        Top = 3
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1397.000000000000000000
          7.937500000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLDescAReceber'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
  end
end
