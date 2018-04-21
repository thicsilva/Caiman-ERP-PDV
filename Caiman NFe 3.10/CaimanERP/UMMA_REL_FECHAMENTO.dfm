object frmREL_FECHAMENTO: TfrmREL_FECHAMENTO
  Left = 0
  Top = 0
  Caption = 'frmREL_FECHAMENTO'
  ClientHeight = 602
  ClientWidth = 786
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
  object QuickRep1: TQuickRep
    Left = 8
    Top = -41
    Width = 794
    Height = 1123
    DataSet = QOS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
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
      100.000000000000000000
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
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 171
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        452.437500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object logo: TQRImage
        Left = 8
        Top = 8
        Width = 194
        Height = 150
        Size.Values = (
          396.875000000000000000
          21.166666666666670000
          21.166666666666670000
          513.291666666666700000)
        XLColumn = 0
        Center = True
      end
      object QRDBText2: TQRDBText
        Left = 252
        Top = 100
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          666.750000000000000000
          264.583333333333300000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'CNPJ_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 208
        Top = 100
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          264.583333333333300000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 208
        Top = 45
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          119.062500000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'End.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 245
        Top = 45
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          648.229166666666700000
          119.062500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'END_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 208
        Top = 63
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          166.687500000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Numero :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 270
        Top = 63
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          714.375000000000000000
          166.687500000000000000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'NUMERO_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 368
        Top = 63
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          166.687500000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 417
        Top = 63
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1103.312500000000000000
          166.687500000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'BAI_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 208
        Top = 81
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          214.312500000000000000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 264
        Top = 81
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          214.312500000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'CID_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 464
        Top = 81
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          214.312500000000000000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 519
        Top = 81
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1373.187500000000000000
          214.312500000000000000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'EST_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 584
        Top = 81
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          214.312500000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 626
        Top = 81
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1656.291666666667000000
          214.312500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'CEP_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 206
        Top = 118
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          545.041666666666700000
          312.208333333333300000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 274
        Top = 118
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          724.958333333333300000
          312.208333333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'TEL_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 430
        Top = 118
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          312.208333333333300000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FAX :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 471
        Top = 118
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1246.187500000000000000
          312.208333333333300000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'FAX_EMP'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 16
        Top = 368
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          973.666666666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel25'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel26: TQRLabel
        Left = 8
        Top = 344
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          910.166666666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel26'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 166
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          439.208333333333300000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText46: TQRDBText
        Left = 208
        Top = 19
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666670000
          550.333333333333300000
          50.270833333333330000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qemp
        DataField = 'RAZAO_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 209
      Width = 718
      Height = 191
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        505.354166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object Label1: TLabel
        Left = 48
        Top = 440
        Width = 38
        Height = 16
        Caption = 'Label1'
      end
      object QRLabel10: TQRLabel
        Left = 8
        Top = 9
        Width = 102
        Height = 20
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          23.812500000000000000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Numero da OS :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 135
        Top = 9
        Width = 29
        Height = 20
        Size.Values = (
          52.916666666666670000
          357.187500000000000000
          23.812500000000000000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'COD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 31
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          82.020833333333320000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 278
        Top = 9
        Width = 58
        Height = 20
        Size.Values = (
          52.916666666666670000
          735.541666666666700000
          23.812500000000000000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Entrada :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 354
        Top = 9
        Width = 104
        Height = 20
        Size.Values = (
          52.916666666666670000
          936.625000000000000000
          23.812500000000000000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'DATA_ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 8
        Top = 38
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          100.541666666666700000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 68
        Top = 38
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          100.541666666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'COD_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 152
        Top = 38
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          100.541666666666700000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'CLIENTE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 8
        Top = 58
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          153.458333333333300000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'End.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 45
        Top = 58
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          153.458333333333300000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'ENDRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 8
        Top = 76
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          201.083333333333300000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Numero :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 70
        Top = 76
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          185.208333333333300000
          201.083333333333300000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'NUMRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 168
        Top = 76
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          201.083333333333300000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bairro :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText17: TQRDBText
        Left = 217
        Top = 76
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          574.145833333333300000
          201.083333333333300000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'BAIRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 8
        Top = 94
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          248.708333333333300000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cidade :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 64
        Top = 94
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          248.708333333333300000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'CIDRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 456
        Top = 114
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          301.625000000000000000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estado :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText19: TQRDBText
        Left = 511
        Top = 114
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1352.020833333333000000
          301.625000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'ESTRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 576
        Top = 114
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          301.625000000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CEP :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText20: TQRDBText
        Left = 618
        Top = 114
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1635.125000000000000000
          301.625000000000000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'CEPRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 8
        Top = 113
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          298.979166666666700000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNPJ/CPF:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText21: TQRDBText
        Left = 81
        Top = 113
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          298.979166666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'CNPJ_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 261
        Top = 113
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          690.562500000000000000
          298.979166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefone :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText22: TQRDBText
        Left = 329
        Top = 113
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          870.479166666666700000
          298.979166666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = Qcliente
        DataField = 'TELRES_CLI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 133
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          351.895833333333300000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 457
        Top = 38
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          100.541666666666700000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Modelo do v'#237'culo :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText23: TQRDBText
        Left = 580
        Top = 38
        Width = 110
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          100.541666666666700000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'CARRO_MODELO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 457
        Top = 58
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          153.458333333333300000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Marca :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 511
        Top = 58
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          1352.020833333333000000
          153.458333333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'CARRO_MARCA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 457
        Top = 96
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          254.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FAB/MOD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText25: TQRDBText
        Left = 523
        Top = 96
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          1383.770833333333000000
          254.000000000000000000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'CARRO_ANO_FAB'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 457
        Top = 77
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          203.729166666666700000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Placa :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText26: TQRDBText
        Left = 550
        Top = 77
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          203.729166666666700000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'CARRO_CHASSI'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText27: TQRDBText
        Left = 555
        Top = 9
        Width = 132
        Height = 20
        Size.Values = (
          52.916666666666670000
          1468.437500000000000000
          23.812500000000000000
          349.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'DATA_FECHAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 497
        Top = 9
        Width = 46
        Height = 20
        Size.Values = (
          52.916666666666670000
          1314.979166666667000000
          23.812500000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Saida :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object statuss: TQRLabel
        Left = 3
        Top = 139
        Width = 713
        Height = 23
        Size.Values = (
          60.854166666666670000
          7.937500000000000000
          367.770833333333300000
          1886.479166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Itens da manuten'#231#227'o ENTREGUE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel29: TQRLabel
        Left = 4
        Top = 167
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          441.854166666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cod Prod.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 80
        Top = 167
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          441.854166666666700000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descricao'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 346
        Top = 167
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          915.458333333333300000
          441.854166666666700000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unid'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel32: TQRLabel
        Left = 386
        Top = 167
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1021.291666666667000000
          441.854166666666700000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quant.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 442
        Top = 167
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1169.458333333333000000
          441.854166666666700000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'V. unid'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel34: TQRLabel
        Left = 505
        Top = 167
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          441.854166666666700000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desc.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel35: TQRLabel
        Left = 554
        Top = 167
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          441.854166666666700000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'V. total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 656
        Top = 167
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          441.854166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cobrado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBRichText1: TQRDBRichText
        Left = 176
        Top = 344
        Width = 100
        Height = 100
        Size.Values = (
          264.583333333333300000
          465.666666666666700000
          910.166666666666800000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 185
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          489.479166666666700000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 419
      Width = 718
      Height = 35
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel37: TQRLabel
        Left = 536
        Top = 9
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1418.166666666667000000
          23.812500000000000000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub Total :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText36: TQRDBText
        Left = 609
        Top = 9
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          23.812500000000000000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'SUB_TOTAL'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel38: TQRLabel
        Left = 368
        Top = 9
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          23.812500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Desconto :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText37: TQRDBText
        Left = 441
        Top = 9
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1166.812500000000000000
          23.812500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'DESCONTO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel39: TQRLabel
        Left = 192
        Top = 9
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          23.812500000000000000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total prod.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText38: TQRDBText
        Left = 265
        Top = 9
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          701.145833333333300000
          23.812500000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'TOTAL_PROD'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 7
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          18.520833333333330000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel48: TQRLabel
        Left = 7
        Top = 9
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          23.812500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total serv.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText47: TQRDBText
        Left = 77
        Top = 9
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          203.729166666666700000
          23.812500000000000000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'TOTAL_SERVICOS'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 400
      Width = 718
      Height = 19
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand2
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      DataSet = qitens
      FooterBand = QRBand3
      HeaderBand = QRBand2
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText28: TQRDBText
        Left = 4
        Top = 3
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'COD_PROD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText29: TQRDBText
        Left = 79
        Top = 3
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          209.020833333333300000
          7.937500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText30: TQRDBText
        Left = 346
        Top = 3
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          915.458333333333300000
          7.937500000000000000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'UNID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText31: TQRDBText
        Left = 386
        Top = 3
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1021.291666666667000000
          7.937500000000000000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'QUANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText32: TQRDBText
        Left = 442
        Top = 3
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          1169.458333333333000000
          7.937500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'VALOR_UNID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText33: TQRDBText
        Left = 504
        Top = 3
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'DESCONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText34: TQRDBText
        Left = 554
        Top = 3
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          7.937500000000000000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'VALOR_TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText35: TQRDBText
        Left = 657
        Top = 3
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1738.312500000000000000
          7.937500000000000000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qitens
        DataField = 'COBRAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
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
    object QRSubDetail4: TQRSubDetail
      Left = 38
      Top = 454
      Width = 718
      Height = 158
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        418.041666666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
      object termo1: TQRLabel
        Left = 3
        Top = 4
        Width = 713
        Height = 23
        Size.Values = (
          60.854166666666670000
          7.937500000000000000
          10.583333333333330000
          1886.479166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Termos de garantia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object termo2: TQRDBRichText
        Left = 4
        Top = 32
        Width = 709
        Height = 110
        Size.Values = (
          291.041666666666700000
          10.583333333333330000
          84.666666666666670000
          1875.895833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        DataField = 'TERMO_SAIDA'
        DataSet = Qconfig
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 612
      Width = 718
      Height = 57
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand2
      Size.Values = (
        150.812500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape4: TQRShape
        Left = 7
        Top = 6
        Width = 705
        Height = 39
        Size.Values = (
          103.187500000000000000
          18.520833333333330000
          15.875000000000000000
          1865.312500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 12
        Top = 16
        Width = 694
        Height = 17
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          42.333333333333330000
          1836.208333333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PARCELAMENTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 7
        Top = 16
        Width = 1
        Size.Values = (
          171.979166666666700000
          18.520833333333330000
          42.333333333333330000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 711
        Top = 16
        Width = 1
        Size.Values = (
          171.979166666666700000
          1881.187500000000000000
          42.333333333333330000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRSubDetail3: TQRSubDetail
      Left = 38
      Top = 669
      Width = 718
      Height = 57
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        150.812500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      DataSet = QReceber
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape3: TQRShape
        Left = 7
        Top = -5
        Width = 1
        Height = 60
        Size.Values = (
          158.750000000000000000
          18.520833333333330000
          -13.229166666666670000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 711
        Top = -11
        Width = 1
        Height = 67
        Size.Values = (
          177.270833333333300000
          1881.187500000000000000
          -29.104166666666670000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 128
        Top = 7
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          18.520833333333330000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parc.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 128
        Top = 24
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          63.500000000000000000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'PARCELA_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel41: TQRLabel
        Left = 176
        Top = 7
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          18.520833333333330000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Em.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText39: TQRDBText
        Left = 176
        Top = 24
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          63.500000000000000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'DATA_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel42: TQRLabel
        Left = 248
        Top = 7
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          18.520833333333330000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Venc.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText40: TQRDBText
        Left = 248
        Top = 24
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          63.500000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'VENCTO_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel43: TQRLabel
        Left = 336
        Top = 7
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          18.520833333333330000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Pag.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText41: TQRDBText
        Left = 336
        Top = 24
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          63.500000000000000000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'DTPAGTO_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel44: TQRLabel
        Left = 431
        Top = 7
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          18.520833333333330000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Parc.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText42: TQRDBText
        Left = 431
        Top = 24
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          63.500000000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'VALOR_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel45: TQRLabel
        Left = 515
        Top = 7
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1362.604166666667000000
          18.520833333333330000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Pago'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText43: TQRDBText
        Left = 515
        Top = 24
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1362.604166666667000000
          63.500000000000000000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'VLRPAGO_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText44: TQRDBText
        Left = 610
        Top = 6
        Width = 79
        Height = 44
        Size.Values = (
          116.416666666666700000
          1613.958333333333000000
          15.875000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -32
        Font.Name = 'Gill Sans Ultra Bold Condensed'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 24
      end
      object QRShape8: TQRShape
        Left = 7
        Top = 55
        Width = 705
        Height = 1
        Size.Values = (
          2.645833333333333000
          18.520833333333330000
          145.520833333333300000
          1865.312500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText45: TQRDBText
        Left = 22
        Top = 38
        Width = 88
        Height = 16
        Size.Values = (
          42.333333333333330000
          58.208333333333320000
          100.541666666666700000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'COD_CTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
    object QRSubDetail5: TQRSubDetail
      Left = 38
      Top = 726
      Width = 718
      Height = 168
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        444.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel46: TQRLabel
        Left = 12
        Top = 6
        Width = 133
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          15.875000000000000000
          351.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Servi'#231'o realizado :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBRichText2: TQRDBRichText
        Left = 151
        Top = 7
        Width = 560
        Height = 68
        Size.Values = (
          179.916666666666700000
          399.520833333333300000
          18.520833333333330000
          1481.666666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        DataField = 'DEFEITO_RECLAMADO'
        DataSet = QOS
      end
      object QRLabel47: TQRLabel
        Left = 12
        Top = 94
        Width = 46
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          248.708333333333300000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'OBS. :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBRichText3: TQRDBRichText
        Left = 64
        Top = 94
        Width = 647
        Height = 66
        Size.Values = (
          174.625000000000000000
          169.333333333333300000
          248.708333333333300000
          1711.854166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        DataField = 'OBS'
        DataSet = QOS
      end
    end
  end
  object Qemp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from empresa')
    Left = 528
    Top = 448
    object QempCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"EMPRESA"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QempRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = '"EMPRESA"."RAZAO_EMP"'
      Required = True
      Size = 50
    end
    object QempEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = '"EMPRESA"."END_EMP"'
      Size = 50
    end
    object QempCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = '"EMPRESA"."CID_EMP"'
      Size = 30
    end
    object QempBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = '"EMPRESA"."BAI_EMP"'
      Size = 30
    end
    object QempCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = '"EMPRESA"."CEP_EMP"'
      FixedChar = True
      Size = 9
    end
    object QempEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = '"EMPRESA"."EST_EMP"'
      FixedChar = True
      Size = 2
    end
    object QempINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = '"EMPRESA"."INSC_EMP"'
    end
    object QempTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = '"EMPRESA"."TEL_EMP"'
      Size = 13
    end
    object QempFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = '"EMPRESA"."FAX_EMP"'
      Size = 13
    end
    object QempNOME_EMP_ETIQUETA: TStringField
      FieldName = 'NOME_EMP_ETIQUETA'
      Origin = '"EMPRESA"."NOME_EMP_ETIQUETA"'
      Size = 15
    end
    object QempNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = '"EMPRESA"."NUMERO_EMP"'
      Size = 10
    end
    object QempRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = '"EMPRESA"."RESP_EMP"'
      Size = 50
    end
    object QempCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = '"EMPRESA"."CAMINHO_FOTO_EMP"'
      Size = 150
    end
    object QempFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = '"EMPRESA"."FANTASIA_EMP"'
      Size = 50
    end
    object QempMOSTRAR_SITCLI_PREVENDA: TStringField
      FieldName = 'MOSTRAR_SITCLI_PREVENDA'
      Origin = '"EMPRESA"."MOSTRAR_SITCLI_PREVENDA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QempCADASTRAR_CLIENTE_SEM_CPF: TStringField
      FieldName = 'CADASTRAR_CLIENTE_SEM_CPF'
      Origin = '"EMPRESA"."CADASTRAR_CLIENTE_SEM_CPF"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QempTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
      Origin = '"EMPRESA"."TIPO_EMP"'
      Required = True
    end
    object QempTIPO_CARGA_BALANCA: TIntegerField
      FieldName = 'TIPO_CARGA_BALANCA'
      Origin = '"EMPRESA"."TIPO_CARGA_BALANCA"'
      Required = True
    end
    object QempCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = '"EMPRESA"."CNPJ_EMP"'
      Size = 14
    end
    object QempCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = '"EMPRESA"."CAMINHO_VALIDADOR_SINTEGRA"'
      Size = 80
    end
    object QempINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = '"EMPRESA"."INSCRICAO_MUNICIPAL"'
    end
    object QempPERFIL_EFD: TStringField
      FieldName = 'PERFIL_EFD'
      Origin = '"EMPRESA"."PERFIL_EFD"'
      FixedChar = True
      Size = 1
    end
    object QempCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO"'
      Size = 7
    end
    object QempTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = '"EMPRESA"."TIPO_ATIVIDADE_EFD"'
    end
    object QempNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = '"EMPRESA"."NOME_CONTADOR"'
      Size = 80
    end
    object QempCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = '"EMPRESA"."CPF_CONTADOR"'
      Size = 14
    end
    object QempCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = '"EMPRESA"."CRC_CONTADOR"'
      Size = 15
    end
    object QempCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = '"EMPRESA"."CNPJ_CONTADOR"'
      Size = 18
    end
    object QempCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = '"EMPRESA"."CEP_CONTADOR"'
      FixedChar = True
      Size = 9
    end
    object QempEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = '"EMPRESA"."END_CONTADOR"'
      Size = 60
    end
    object QempNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = '"EMPRESA"."NUMERO_CONTADOR"'
      Size = 10
    end
    object QempBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = '"EMPRESA"."BAIRRO_CONTADOR"'
      Size = 50
    end
    object QempTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = '"EMPRESA"."TEL_CONTADOR"'
      Size = 10
    end
    object QempFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = '"EMPRESA"."FAX_CONTADOR"'
      Size = 10
    end
    object QempCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = '"EMPRESA"."CODIGO_MUNICIPIO_CONTADOR"'
      Size = 7
    end
  end
  object QOS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from MMA_ORDEM_SERVICO')
    Left = 488
    Top = 448
    object QOSCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"MMA_ORDEM_SERVICO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QOSDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = '"MMA_ORDEM_SERVICO"."DATA_ENTRADA"'
    end
    object QOSDATA_ORCAMENTO: TDateField
      FieldName = 'DATA_ORCAMENTO'
      Origin = '"MMA_ORDEM_SERVICO"."DATA_ORCAMENTO"'
    end
    object QOSDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = '"MMA_ORDEM_SERVICO"."DATA_FECHAMENTO"'
    end
    object QOSSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = '"MMA_ORDEM_SERVICO"."STATUS"'
      Required = True
    end
    object QOSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"MMA_ORDEM_SERVICO"."COD_EMP"'
      Required = True
    end
    object QOSCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"MMA_ORDEM_SERVICO"."COD_CAI"'
      Required = True
    end
    object QOSVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Origin = '"MMA_ORDEM_SERVICO"."VENDEDOR"'
      Size = 150
    end
    object QOSCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"MMA_ORDEM_SERVICO"."COD_CLI"'
      Required = True
    end
    object QOSCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = '"MMA_ORDEM_SERVICO"."CLIENTE"'
      Size = 150
    end
    object QOSTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = '"MMA_ORDEM_SERVICO"."TELEFONE"'
    end
    object QOSCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = '"MMA_ORDEM_SERVICO"."COD_USU"'
    end
    object QOSCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"MMA_ORDEM_SERVICO"."COD_TPV"'
    end
    object QOSTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Origin = '"MMA_ORDEM_SERVICO"."TIPO_VENDA"'
      Size = 150
    end
    object QOSRETORNO: TStringField
      FieldName = 'RETORNO'
      Origin = '"MMA_ORDEM_SERVICO"."RETORNO"'
      Size = 1
    end
    object QOSCOD_RETORNO: TIntegerField
      FieldName = 'COD_RETORNO'
      Origin = '"MMA_ORDEM_SERVICO"."COD_RETORNO"'
    end
    object QOSAPARELHO_MODELO: TStringField
      FieldName = 'APARELHO_MODELO'
      Origin = '"MMA_ORDEM_SERVICO"."APARELHO_MODELO"'
      Size = 100
    end
    object QOSAPARELHO_MARCA: TStringField
      FieldName = 'APARELHO_MARCA'
      Origin = '"MMA_ORDEM_SERVICO"."APARELHO_MARCA"'
      Size = 60
    end
    object QOSAPARELHO_SERIE: TStringField
      FieldName = 'APARELHO_SERIE'
      Origin = '"MMA_ORDEM_SERVICO"."APARELHO_SERIE"'
      Size = 150
    end
    object QOSCARRO_MODELO: TStringField
      FieldName = 'CARRO_MODELO'
      Origin = '"MMA_ORDEM_SERVICO"."CARRO_MODELO"'
      Size = 60
    end
    object QOSCARRO_MARCA: TStringField
      FieldName = 'CARRO_MARCA'
      Origin = '"MMA_ORDEM_SERVICO"."CARRO_MARCA"'
      Size = 60
    end
    object QOSCARRO_CHASSI: TStringField
      FieldName = 'CARRO_CHASSI'
      Origin = '"MMA_ORDEM_SERVICO"."CARRO_CHASSI"'
      Size = 150
    end
    object QOSCARRO_ANO_FAB: TStringField
      FieldName = 'CARRO_ANO_FAB'
      Origin = '"MMA_ORDEM_SERVICO"."CARRO_ANO_FAB"'
      Size = 50
    end
    object QOSTOTAL_PROD: TFloatField
      FieldName = 'TOTAL_PROD'
      Origin = '"MMA_ORDEM_SERVICO"."TOTAL_PROD"'
      DisplayFormat = 'R$ 0.00'
    end
    object QOSDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"MMA_ORDEM_SERVICO"."DESCONTO"'
      DisplayFormat = 'R$ 0.00'
    end
    object QOSTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = '"MMA_ORDEM_SERVICO"."TECNICO"'
      Size = 100
    end
    object QOSSUB_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUB_TOTAL'
      Origin = '"MMA_ORDEM_SERVICO"."SUB_TOTAL"'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'R$ 0.00'
    end
    object QOSDEFEITO_RECLAMADO: TWideMemoField
      FieldName = 'DEFEITO_RECLAMADO'
      Origin = '"MMA_ORDEM_SERVICO"."DEFEITO_RECLAMADO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QOSOBS: TWideMemoField
      FieldName = 'OBS'
      Origin = '"MMA_ORDEM_SERVICO"."OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QOSTOTAL_SERVICOS: TBCDField
      FieldName = 'TOTAL_SERVICOS'
      Origin = '"MMA_ORDEM_SERVICO"."TOTAL_SERVICOS"'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object Qcliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from cliente')
    Left = 616
    Top = 448
    object QclienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CLIENTE"."COD_CLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QclienteFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = '"CLIENTE"."FJ_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QclienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QclienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = '"CLIENTE"."COD_CLA"'
      Required = True
    end
    object QclienteENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QclienteBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QclienteCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QclienteESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QclienteCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QclienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object QclienteENDCOM_CLI: TStringField
      FieldName = 'ENDCOM_CLI'
      Origin = '"CLIENTE"."ENDCOM_CLI"'
      Size = 50
    end
    object QclienteBAICOM_CLI: TStringField
      FieldName = 'BAICOM_CLI'
      Origin = '"CLIENTE"."BAICOM_CLI"'
      Size = 30
    end
    object QclienteCIDCOM_CLI: TStringField
      FieldName = 'CIDCOM_CLI'
      Origin = '"CLIENTE"."CIDCOM_CLI"'
      Size = 30
    end
    object QclienteESTCOM_CLI: TStringField
      FieldName = 'ESTCOM_CLI'
      Origin = '"CLIENTE"."ESTCOM_CLI"'
      FixedChar = True
      Size = 2
    end
    object QclienteCEPCOM_CLI: TStringField
      FieldName = 'CEPCOM_CLI'
      Origin = '"CLIENTE"."CEPCOM_CLI"'
      FixedChar = True
      Size = 9
    end
    object QclienteTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = '"CLIENTE"."TELCOM_CLI"'
      FixedChar = True
      Size = 13
    end
    object QclienteCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QclienteDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = '"CLIENTE"."DOC_CLI"'
    end
    object QclientePAI_CLI: TStringField
      FieldName = 'PAI_CLI'
      Origin = '"CLIENTE"."PAI_CLI"'
      Size = 50
    end
    object QclienteMAE_CLI: TStringField
      FieldName = 'MAE_CLI'
      Origin = '"CLIENTE"."MAE_CLI"'
      Size = 50
    end
    object QclienteCONJUGE_CLI: TStringField
      FieldName = 'CONJUGE_CLI'
      Origin = '"CLIENTE"."CONJUGE_CLI"'
      Size = 50
    end
    object QclienteESTCIVIL_CLI: TStringField
      FieldName = 'ESTCIVIL_CLI'
      Origin = '"CLIENTE"."ESTCIVIL_CLI"'
      FixedChar = True
      Size = 1
    end
    object QclienteRENDA_CLI: TBCDField
      FieldName = 'RENDA_CLI'
      Origin = '"CLIENTE"."RENDA_CLI"'
      Precision = 18
      Size = 2
    end
    object QclienteLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = '"CLIENTE"."LIMITE_CLI"'
      Precision = 18
      Size = 2
    end
    object QclientePROFISSAO_CLI: TStringField
      FieldName = 'PROFISSAO_CLI'
      Origin = '"CLIENTE"."PROFISSAO_CLI"'
      Size = 50
    end
    object QclienteEMPRESA_TRAB_CLI: TStringField
      FieldName = 'EMPRESA_TRAB_CLI'
      Origin = '"CLIENTE"."EMPRESA_TRAB_CLI"'
      Size = 50
    end
    object QclienteATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = '"CLIENTE"."ATIVO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QclienteCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = '"CLIENTE"."COD_CON"'
      Required = True
    end
    object QclienteOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = '"CLIENTE"."OBS_VENDA"'
      Size = 200
    end
    object QclienteOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = '"CLIENTE"."OBS_CLI"'
      Size = 500
    end
    object QclienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = '"CLIENTE"."NASCIMENTO_CLI"'
    end
    object QclienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = '"CLIENTE"."DATACADASTRO_CLI"'
      Required = True
    end
    object QclienteATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = '"CLIENTE"."ATRAZO_MAXIMO_CLI"'
    end
    object QclienteCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = '"CLIENTE"."CELULAR_CLI"'
      Size = 13
    end
    object QclienteIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = '"CLIENTE"."IMP_SALDO_PENDENTE_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QclienteLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = '"CLIENTE"."LIMITE_CHEQUE"'
      Precision = 18
      Size = 2
    end
    object QclienteDATA_CONSULTA_SPC: TDateField
      FieldName = 'DATA_CONSULTA_SPC'
      Origin = '"CLIENTE"."DATA_CONSULTA_SPC"'
    end
    object QclienteDATA_REGISTRO_SPC: TDateField
      FieldName = 'DATA_REGISTRO_SPC'
      Origin = '"CLIENTE"."DATA_REGISTRO_SPC"'
    end
    object QclienteDATA_REABILITACAO_SPC: TDateField
      FieldName = 'DATA_REABILITACAO_SPC'
      Origin = '"CLIENTE"."DATA_REABILITACAO_SPC"'
    end
    object QclienteSELECIONADO_CLI: TStringField
      FieldName = 'SELECIONADO_CLI'
      Origin = '"CLIENTE"."SELECIONADO_CLI"'
      FixedChar = True
      Size = 1
    end
    object QclienteRENDA_CONJUGE: TBCDField
      FieldName = 'RENDA_CONJUGE'
      Origin = '"CLIENTE"."RENDA_CONJUGE"'
      Precision = 18
      Size = 2
    end
    object QclienteTRABALHO_CONJUGE: TStringField
      FieldName = 'TRABALHO_CONJUGE'
      Origin = '"CLIENTE"."TRABALHO_CONJUGE"'
      Size = 50
    end
    object QclientePROF_CONJUGE: TStringField
      FieldName = 'PROF_CONJUGE'
      Origin = '"CLIENTE"."PROF_CONJUGE"'
      Size = 50
    end
    object QclienteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"CLIENTE"."NOME_FANTASIA"'
      Size = 60
    end
    object QclientePONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = '"CLIENTE"."PONTO_REFERENCIA"'
      Size = 80
    end
    object QclienteCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = '"CLIENTE"."CONTATO_CLI"'
      Size = 70
    end
    object QclienteROTA_CLI: TIntegerField
      FieldName = 'ROTA_CLI'
      Origin = '"CLIENTE"."ROTA_CLI"'
    end
    object QclienteTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = '"CLIENTE"."TIPO_CREDITO_CLI"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QclienteCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = '"CLIENTE"."CONTROLAR_LIMITE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QclienteBAICOB_CLI: TStringField
      FieldName = 'BAICOB_CLI'
      Origin = '"CLIENTE"."BAICOB_CLI"'
      Size = 30
    end
    object QclienteCIDCOB_CLI: TStringField
      FieldName = 'CIDCOB_CLI'
      Origin = '"CLIENTE"."CIDCOB_CLI"'
      Size = 30
    end
    object QclienteESTCOB_CLI: TStringField
      FieldName = 'ESTCOB_CLI'
      Origin = '"CLIENTE"."ESTCOB_CLI"'
      FixedChar = True
      Size = 2
    end
    object QclienteCEPCOB_CLI: TStringField
      FieldName = 'CEPCOB_CLI'
      Origin = '"CLIENTE"."CEPCOB_CLI"'
      FixedChar = True
      Size = 9
    end
    object QclienteTELCOB_CLI: TStringField
      FieldName = 'TELCOB_CLI'
      Origin = '"CLIENTE"."TELCOB_CLI"'
      FixedChar = True
      Size = 13
    end
    object QclienteENDCOB_CLI: TStringField
      FieldName = 'ENDCOB_CLI'
      Origin = '"CLIENTE"."ENDCOB_CLI"'
      Size = 50
    end
    object QclienteBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = '"CLIENTE"."BLOQUEADO_CLI"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QclienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = '"CLIENTE"."INSC_ESTADUAL"'
      Size = 30
    end
    object QclienteNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object QclienteNUMCOM_CLI: TStringField
      FieldName = 'NUMCOM_CLI'
      Origin = '"CLIENTE"."NUMCOM_CLI"'
      Size = 10
    end
    object QclienteNUMCOB_CLI: TStringField
      FieldName = 'NUMCOB_CLI'
      Origin = '"CLIENTE"."NUMCOB_CLI"'
      Size = 10
    end
    object QclienteCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = '"CLIENTE"."CODIGO_IBGE"'
    end
    object QclienteEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = '"CLIENTE"."EMAIL_CLI"'
      Size = 100
    end
  end
  object Qconfig: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from MMA_CONFIG')
    Left = 664
    Top = 448
    object QconfigCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"MMA_CONFIG"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QconfigTERMO_ENTRADA: TWideMemoField
      FieldName = 'TERMO_ENTRADA'
      Origin = '"MMA_CONFIG"."TERMO_ENTRADA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object QconfigTERMO_SAIDA: TWideMemoField
      FieldName = 'TERMO_SAIDA'
      Origin = '"MMA_CONFIG"."TERMO_SAIDA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object qitens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from MMA_ORDEM_ITENS')
    Left = 464
    Top = 56
    object qitensCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"MMA_ORDEM_ITENS"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qitensCOD_OS: TIntegerField
      FieldName = 'COD_OS'
      Origin = '"MMA_ORDEM_ITENS"."COD_OS"'
      Required = True
    end
    object qitensCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Origin = '"MMA_ORDEM_ITENS"."COD_PROD"'
      Required = True
    end
    object qitensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"MMA_ORDEM_ITENS"."DESCRICAO"'
      Required = True
      Size = 151
    end
    object qitensUNID: TStringField
      FieldName = 'UNID'
      Origin = '"MMA_ORDEM_ITENS"."UNID"'
      Size = 10
    end
    object qitensQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"MMA_ORDEM_ITENS"."QUANT"'
    end
    object qitensVALOR_UNID: TFloatField
      FieldName = 'VALOR_UNID'
      Origin = '"MMA_ORDEM_ITENS"."VALOR_UNID"'
      DisplayFormat = 'R$ 0.00'
    end
    object qitensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"MMA_ORDEM_ITENS"."DESCONTO"'
      DisplayFormat = 'R$ 0.00'
    end
    object qitensVALOR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      Origin = '"MMA_ORDEM_ITENS"."VALOR_TOTAL"'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'R$ 0.00'
    end
    object qitensCOBRAR: TStringField
      FieldName = 'COBRAR'
      Origin = '"MMA_ORDEM_ITENS"."COBRAR"'
      Size = 1
    end
  end
  object QReceber: TFDQuery
    OnCalcFields = QReceberCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select *  from CONTAS_RECEBER')
    Left = 360
    Top = 384
    object QReceberCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = '"CONTAS_RECEBER"."COD_CTR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QReceberDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = '"CONTAS_RECEBER"."DATA_CTR"'
      Required = True
    end
    object QReceberVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = '"CONTAS_RECEBER"."VENCTO_CTR"'
      Required = True
    end
    object QReceberVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = '"CONTAS_RECEBER"."VALOR_CTR"'
      Required = True
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QReceberDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = '"CONTAS_RECEBER"."DTPAGTO_CTR"'
    end
    object QReceberVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = '"CONTAS_RECEBER"."VLRPAGO_CTR"'
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QReceberPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = '"CONTAS_RECEBER"."PARCELA_CTR"'
      Required = True
    end
    object QReceberPAGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Calculated = True
    end
  end
  object DReceber: TDataSource
    DataSet = QReceber
    Left = 460
    Top = 368
  end
end
