object frmMMAREL_OS_ABERTURA: TfrmMMAREL_OS_ABERTURA
  Left = 0
  Top = 0
  Caption = 'frmMMAREL_OS_ABERTURA'
  ClientHeight = 745
  ClientWidth = 1008
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
    Left = -16
    Top = 168
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
    Units = MM
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
        Width = 198
        Height = 150
        Size.Values = (
          396.875000000000000000
          21.166666666666670000
          21.166666666666670000
          523.875000000000000000)
        XLColumn = 0
        Center = True
      end
      object QRDBText2: TQRDBText
        Left = 265
        Top = 91
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          701.145833333333300000
          240.770833333333300000
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
        Left = 221
        Top = 91
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          240.770833333333300000
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
        Left = 221
        Top = 36
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          95.250000000000000000
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
        Left = 258
        Top = 36
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          682.625000000000000000
          95.250000000000000000
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
        Left = 221
        Top = 54
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          142.875000000000000000
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
        Left = 283
        Top = 54
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          748.770833333333300000
          142.875000000000000000
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
        Left = 381
        Top = 54
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          142.875000000000000000
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
        Left = 430
        Top = 54
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          142.875000000000000000
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
        Left = 221
        Top = 72
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          190.500000000000000000
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
        Left = 277
        Top = 72
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          732.895833333333300000
          190.500000000000000000
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
        Left = 477
        Top = 72
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          1262.062500000000000000
          190.500000000000000000
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
        Left = 532
        Top = 72
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1407.583333333333000000
          190.500000000000000000
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
        Left = 597
        Top = 72
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1579.562500000000000000
          190.500000000000000000
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
        Left = 639
        Top = 72
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1690.687500000000000000
          190.500000000000000000
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
        Left = 221
        Top = 126
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          333.375000000000000000
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
        Left = 289
        Top = 126
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          764.645833333333300000
          333.375000000000000000
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
        Left = 445
        Top = 126
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1177.395833333333000000
          333.375000000000000000
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
        Left = 486
        Top = 126
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          333.375000000000000000
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
    end
    object QRDBText1: TQRDBText
      Left = 259
      Top = 50
      Width = 80
      Height = 17
      Size.Values = (
        44.979166666666670000
        685.270833333333300000
        132.291666666666700000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = Qemp
      DataField = 'RAZAO_EMP'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 209
      Width = 718
      Height = 736
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1947.333333333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRLabel10: TQRLabel
        Left = 8
        Top = 9
        Width = 122
        Height = 20
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          23.812500000000000000
          322.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Numero da OS :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText11: TQRDBText
        Left = 135
        Top = 9
        Width = 37
        Height = 20
        Size.Values = (
          52.916666666666670000
          357.187500000000000000
          23.812500000000000000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'COD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
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
        Left = 479
        Top = 9
        Width = 46
        Height = 20
        Size.Values = (
          52.916666666666670000
          1267.354166666667000000
          23.812500000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText12: TQRDBText
        Left = 531
        Top = 9
        Width = 129
        Height = 20
        Size.Values = (
          52.916666666666670000
          1404.937500000000000000
          23.812500000000000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QOS
        DataField = 'DATA_ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRLabel12: TQRLabel
        Left = 8
        Top = 46
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          121.708333333333300000
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
        Top = 46
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          121.708333333333300000
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
        Top = 46
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          121.708333333333300000
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
        Top = 66
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          174.625000000000000000
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
        Top = 66
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          119.062500000000000000
          174.625000000000000000
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
        Top = 84
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          222.250000000000000000
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
        Top = 84
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          185.208333333333300000
          222.250000000000000000
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
        Top = 84
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          222.250000000000000000
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
        Top = 84
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          574.145833333333400000
          222.250000000000000000
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
        Top = 102
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          269.875000000000000000
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
        Top = 102
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          269.875000000000000000
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
        Left = 264
        Top = 102
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          269.875000000000000000
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
        Left = 319
        Top = 102
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          844.020833333333500000
          269.875000000000000000
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
        Left = 384
        Top = 102
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          269.875000000000000000
          92.604166666666680000)
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
        Left = 426
        Top = 102
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1127.125000000000000000
          269.875000000000000000
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
        Top = 121
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          320.145833333333400000
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
        Top = 121
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          320.145833333333400000
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
        Left = 8
        Top = 140
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          370.416666666666700000
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
        Left = 76
        Top = 140
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          201.083333333333300000
          370.416666666666700000
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
        Top = 167
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          441.854166666666700000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 8
        Top = 174
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          460.375000000000000000
          312.208333333333400000)
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
        Left = 131
        Top = 174
        Width = 110
        Height = 17
        Size.Values = (
          44.979166666666670000
          346.604166666666700000
          460.375000000000000000
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
        Left = 392
        Top = 174
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          460.375000000000000000
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
        Left = 446
        Top = 174
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          1180.041666666667000000
          460.375000000000000000
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
        Left = 8
        Top = 193
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          510.645833333333300000
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
        Left = 74
        Top = 193
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          195.791666666666700000
          510.645833333333300000
          304.270833333333400000)
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
        Left = 261
        Top = 193
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          690.562500000000000000
          510.645833333333300000
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
        Left = 312
        Top = 193
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          510.645833333333300000
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
      object QRLabel25: TQRLabel
        Left = 0
        Top = 386
        Width = 713
        Height = 23
        Size.Values = (
          60.854166666666680000
          0.000000000000000000
          1021.291666666667000000
          1886.479166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Contrato de Servi'#231'o'
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
      object QRLabel26: TQRLabel
        Left = 8
        Top = 223
        Width = 61
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          590.020833333333400000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Defeito :'
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
      object QRDBRichText1: TQRDBRichText
        Left = 75
        Top = 224
        Width = 632
        Height = 68
        Size.Values = (
          179.916666666666700000
          198.437500000000000000
          592.666666666666800000
          1672.166666666667000000)
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
      object QRDBRichText2: TQRDBRichText
        Left = 60
        Top = 311
        Width = 647
        Height = 66
        Size.Values = (
          174.625000000000000000
          158.750000000000000000
          822.854166666666800000
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
      object QRDBRichText3: TQRDBRichText
        Left = 8
        Top = 415
        Width = 697
        Height = 42
        Size.Values = (
          111.125000000000000000
          21.166666666666670000
          1098.020833333333000000
          1844.145833333333000000)
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
        DataField = 'TERMO_ENTRADA'
        DataSet = Qconfig
      end
      object QRLabel27: TQRLabel
        Left = 8
        Top = 311
        Width = 46
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          822.854166666666800000
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
      object QRShape3: TQRShape
        Left = 0
        Top = 215
        Width = 718
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          568.854166666666700000
          1899.708333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object Qemp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from empresa')
    Left = 520
    Top = 8
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
    Left = 568
    Top = 8
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
    end
    object QOSDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"MMA_ORDEM_SERVICO"."DESCONTO"'
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
  end
  object Qcliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from cliente')
    Left = 608
    Top = 8
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
    Left = 656
    Top = 8
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
end
