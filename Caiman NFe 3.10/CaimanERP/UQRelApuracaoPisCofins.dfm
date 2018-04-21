object FrmQRelApuracaoPisCofins: TFrmQRelApuracaoPisCofins
  Left = 343
  Top = 21
  Caption = 'FrmQRelApuracaoPisCofins'
  ClientHeight = 588
  ClientWidth = 827
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
  object QRApuracao: TQuickRep
    Tag = 1
    Left = -2
    Top = -4
    Width = 794
    Height = 1123
    Frame.DrawTop = True
    Frame.DrawBottom = True
    DataSet = FrmRelApuracaoICMS.QRel
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
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      150.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
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
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 715
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1891.770833333333000000
        1899.708333333333000000)
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
        Top = 32
        Width = 561
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          84.666666666666700000
          1484.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Apura'#231#227'o Pis/Cofins'
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
      object QRShape2: TQRShape
        Left = 0
        Top = 85
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          224.895833333333000000
          1899.708333333330000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = -8
        Top = 317
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          -21.166666666666670000
          838.729166666666700000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 349
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          923.395833333333300000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = -8
        Top = 501
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          -21.166666666666670000
          1325.562500000000000000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 533
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          1410.229166666667000000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 96
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          254.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Isentas:'
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
      object QRLabel5: TQRLabel
        Left = 16
        Top = 113
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          298.979166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tributadas'
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
      object QRLabel6: TQRLabel
        Left = 16
        Top = 144
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          381.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pis:'
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
      object QRLabel7: TQRLabel
        Left = 16
        Top = 161
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          425.979166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cofins'
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
      object QRLabel8: TQRLabel
        Left = 16
        Top = 360
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          952.500000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Isentas:'
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
      object QRLabel9: TQRLabel
        Left = 16
        Top = 382
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          1010.708333333333000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tributadas'
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
      object QRLabel10: TQRLabel
        Left = 16
        Top = 414
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          1095.375000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pis:'
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
      object QRLabel11: TQRLabel
        Left = 16
        Top = 438
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          1158.875000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cofins'
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
      object QRLabel12: TQRLabel
        Left = 16
        Top = 544
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          1439.333333333333000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pis:'
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
      object QRLabel13: TQRLabel
        Left = 16
        Top = 568
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          1502.833333333333000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cofins'
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
      object QRLIsentasEntrada: TQRLabel
        Left = 96
        Top = 96
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          254.000000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLIsentasEntrada'
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
      object QRLNormalEntradas: TQRLabel
        Left = 96
        Top = 113
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          298.979166666666700000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLNormalEntradas'
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
      object QRLPisEntradas: TQRLabel
        Left = 96
        Top = 144
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          381.000000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLPisEntradas'
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
      object QRLCofinsEntradas: TQRLabel
        Left = 96
        Top = 161
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          425.979166666666700000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLCofinsEntradas'
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
      object QRLIsentasSaidas: TQRLabel
        Left = 88
        Top = 360
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          232.833333333333300000
          952.500000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLIsentasSaidas'
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
      object QRLNormalSaidas: TQRLabel
        Left = 88
        Top = 382
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          232.833333333333300000
          1010.708333333333000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLNormalSaidas'
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
      object QRLPisSaidas: TQRLabel
        Left = 88
        Top = 414
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          232.833333333333300000
          1095.375000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLPisSaidas'
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
      object QRLCofinsSaidas: TQRLabel
        Left = 88
        Top = 438
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          232.833333333333300000
          1158.875000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLCofinsSaidas'
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
      object QRLPis: TQRLabel
        Left = 96
        Top = 544
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          1439.333333333333000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLPis'
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
      object QRLCofins: TQRLabel
        Left = 96
        Top = 568
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          1502.833333333333000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLCofins'
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
      object QRLabel14: TQRLabel
        Left = 16
        Top = 64
        Width = 153
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          169.333333333333300000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ENTRADAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel15: TQRLabel
        Left = 24
        Top = 328
        Width = 153
        Height = 20
        Size.Values = (
          52.916666666666670000
          63.500000000000000000
          867.833333333333300000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'SA'#205'DAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel16: TQRLabel
        Left = 24
        Top = 512
        Width = 153
        Height = 20
        Size.Values = (
          52.916666666666670000
          63.500000000000000000
          1354.666666666667000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RESULTADO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 189
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          500.062500000000000000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 16
        Top = 200
        Width = 153
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          529.166666666666700000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'FRETES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape8: TQRShape
        Left = 0
        Top = 221
        Width = 718
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          584.729166666666700000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 16
        Top = 233
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          616.479166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tributadas'
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
      object QRLabel20: TQRLabel
        Left = 16
        Top = 264
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          698.500000000000000000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pis:'
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
      object QRLabel21: TQRLabel
        Left = 16
        Top = 283
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          748.770833333333300000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cofins'
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
      object QRLCofinsFrete: TQRLabel
        Left = 96
        Top = 283
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          748.770833333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLCofinsFrete'
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
      object QRLPisFrete: TQRLabel
        Left = 96
        Top = 264
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          698.500000000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLPisFrete'
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
      object QRLFrete: TQRLabel
        Left = 96
        Top = 233
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          616.479166666666700000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLFrete'
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
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 753
      Width = 718
      Height = 40
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
  end
end
