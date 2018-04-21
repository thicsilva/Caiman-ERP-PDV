object FrmQRelVendas: TFrmQRelVendas
  Left = 229
  Top = 402
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 343
  ClientWidth = 838
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
  object QRVendas: TQuickRep
    Tag = 1
    Left = -2
    Top = -6
    Width = 816
    Height = 1056
    Frame.DrawTop = True
    Frame.DrawBottom = True
    DataSet = FrmRelVendas.QRelVendas
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
      Height = 15
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = -4
        Top = 1
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          -10.583333333333300000
          2.645833333333330000
          140.229166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'COD_VEN'
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
        Left = 54
        Top = 1
        Width = 67
        Height = 16
        Size.Values = (
          42.333333333333300000
          142.875000000000000000
          2.645833333333330000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'DATA_VEN'
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
        Left = 126
        Top = 1
        Width = 291
        Height = 16
        Size.Values = (
          42.333333333333300000
          333.375000000000000000
          2.645833333333330000
          769.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'NOME_CLI'
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
        Left = 704
        Top = 1
        Width = 25
        Height = 16
        Size.Values = (
          42.333333333333300000
          1862.666666666670000000
          2.645833333333330000
          66.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'COD_EMP'
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
      object QRDBValor: TQRDBText
        Left = 432
        Top = 1
        Width = 145
        Height = 16
        Size.Values = (
          42.333333333333300000
          1143.000000000000000000
          2.645833333333330000
          383.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'NOME_TPV'
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
        Left = 592
        Top = 1
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333300000
          1566.333333333330000000
          2.645833333333330000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelVendas.QRelVendas
        DataField = 'TOTAL_VEN'
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
        Caption = 'Relat'#243'rio de Vendas'
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
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          148.166666666667000000
          153.458333333333000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Data'
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
      object QRLabel9: TQRLabel
        Left = 128
        Top = 58
        Width = 289
        Height = 16
        Size.Values = (
          42.333333333333300000
          338.666666666667000000
          153.458333333333000000
          764.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cliente'
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
        Left = 704
        Top = 58
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333300000
          1862.666666666670000000
          153.458333333333000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Emp.'
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
      object QRLTipoVenda: TQRLabel
        Left = 432
        Top = 58
        Width = 145
        Height = 16
        Size.Values = (
          42.333333333333300000
          1143.000000000000000000
          153.458333333333000000
          383.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo de Venda'
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
        Left = 592
        Top = 58
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333300000
          1566.333333333330000000
          153.458333333333000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total'
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
      object QRLCaixa: TQRLabel
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
        Caption = 'Caixa:'
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
    object SummaryBand1: TQRBand
      Left = 38
      Top = 129
      Width = 740
      Height = 32
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel12: TQRLabel
        Left = 519
        Top = 8
        Width = 33
        Height = 16
        Size.Values = (
          42.333333333333330000
          1373.187500000000000000
          21.166666666666670000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total:'
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
      object QRExpr: TQRExpr
        Left = 568
        Top = 8
        Width = 103
        Height = 16
        Size.Values = (
          42.333333333333300000
          1502.833333333330000000
          21.166666666666700000
          272.520833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(TOTAL_VEN)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object Totais: TQRLabel
        Left = 8
        Top = 7
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          18.520833333333330000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totais'
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
    end
  end
end
