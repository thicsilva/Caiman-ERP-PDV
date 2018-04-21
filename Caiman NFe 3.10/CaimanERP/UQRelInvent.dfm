object FrmQRelInvent: TFrmQRelInvent
  Left = 348
  Top = 113
  Caption = 'FrmQRelInvent'
  ClientHeight = 530
  ClientWidth = 830
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
  object QRInvent: TQuickRep
    Tag = 1
    Left = 0
    Top = -2
    Width = 816
    Height = 1056
    Frame.DrawTop = True
    Frame.DrawBottom = True
    DataSet = FrmRelInventario.QItensInventario
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
      Top = 181
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
        Left = 0
        Top = 1
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          0.000000000000000000
          2.645833333333330000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'COD_PRO'
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
      object QRDBText2: TQRDBText
        Left = 64
        Top = 1
        Width = 369
        Height = 16
        Size.Values = (
          42.333333333333300000
          169.333333333333000000
          2.645833333333330000
          976.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'NOME_PRO'
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
        Left = 448
        Top = 1
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          1185.333333333330000000
          2.645833333333330000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'DESCRICAO'
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
      object QRDBCusto: TQRDBText
        Left = 584
        Top = 1
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1545.166666666670000000
          2.645833333333330000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'CUSTO'
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
        Left = 504
        Top = 1
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1333.500000000000000000
          2.645833333333330000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'QUANT'
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
        Left = 664
        Top = 1
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1756.833333333330000000
          2.645833333333330000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'TOTAL'
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
      Height = 115
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLNomeEmpresa: TQRLabel
        Left = 72
        Top = 32
        Width = 657
        Height = 16
        Size.Values = (
          42.333333333333300000
          190.500000000000000000
          84.666666666666700000
          1738.312500000000000000)
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
      object QRShape1: TQRShape
        Left = 0
        Top = 85
        Width = 737
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          224.895833333333000000
          1949.979166666670000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 92
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          0.000000000000000000
          243.416666666667000000
          150.812500000000000000)
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
      object QRLabel6: TQRLabel
        Left = 64
        Top = 92
        Width = 369
        Height = 16
        Size.Values = (
          42.333333333333300000
          169.333333333333000000
          243.416666666667000000
          976.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Descri'#231#227'o do Produto'
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
        Left = 448
        Top = 92
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          1185.333333333330000000
          243.416666666667000000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Unidade'
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
      object QRLabel4: TQRLabel
        Left = 584
        Top = 92
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1545.166666666670000000
          243.416666666667000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Custo'
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
      object QRLabel7: TQRLabel
        Left = 504
        Top = 92
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1333.500000000000000000
          243.416666666667000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Estoque'
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
        Left = 664
        Top = 92
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1756.833333333330000000
          243.416666666667000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total'
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
      object QRLCNPJ: TQRLabel
        Left = 576
        Top = 48
        Width = 153
        Height = 16
        Size.Values = (
          42.333333333333300000
          1524.000000000000000000
          127.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CNPJ'
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
      object QRExpr3: TQRExpr
        Left = 72
        Top = 64
        Width = 249
        Height = 16
        Size.Values = (
          42.333333333333300000
          190.500000000000000000
          169.333333333333000000
          658.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'pagenumber + 1'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 32
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          84.666666666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma:'
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 8
        Width = 721
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          21.166666666666700000
          1907.645833333330000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'LIVRO REGISTRO DE INVENT'#193'RIO - RI - MODELO P7'
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
      object QRLabel14: TQRLabel
        Left = 8
        Top = 48
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          127.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Insc.Est:'
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
      object QRLInscEstadual: TQRLabel
        Left = 72
        Top = 48
        Width = 249
        Height = 16
        Size.Values = (
          42.333333333333300000
          190.500000000000000000
          127.000000000000000000
          658.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLInscEstadual'
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
      object QRLabel16: TQRLabel
        Left = 520
        Top = 48
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333300000
          1375.833333333330000000
          127.000000000000000000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CNPJ:'
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
      object QRLabel17: TQRLabel
        Left = 8
        Top = 64
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          169.333333333333000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'P'#225'gina:'
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
      object QRLabel3: TQRLabel
        Left = 432
        Top = 64
        Width = 137
        Height = 16
        Size.Values = (
          42.333333333333300000
          1143.000000000000000000
          169.333333333333000000
          362.479166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Estoque existente em:'
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
      object QRLData: TQRLabel
        Left = 576
        Top = 64
        Width = 153
        Height = 16
        Size.Values = (
          42.333333333333300000
          1524.000000000000000000
          169.333333333333000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Data'
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
      Top = 224
      Width = 740
      Height = 233
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        616.479166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 280
        Top = 7
        Width = 153
        Height = 16
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          18.520833333333300000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAL GERAL:'
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
      object QRExpr1: TQRExpr
        Left = 600
        Top = 7
        Width = 129
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          18.520833333333300000
          341.312500000000000000)
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
        Expression = 'SUM(TOTAL)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLGrupo1: TQRLabel
        Left = 280
        Top = 47
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          124.354166666667000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 1'
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
      object QRLGrupo2: TQRLabel
        Left = 280
        Top = 63
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          166.687500000000000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 2'
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
      object QRLGrupo3: TQRLabel
        Left = 280
        Top = 79
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          209.020833333333000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 3'
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
      object QRLGrupo4: TQRLabel
        Left = 280
        Top = 95
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          251.354166666667000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 4'
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
      object QRLGrupo5: TQRLabel
        Left = 280
        Top = 111
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          293.687500000000000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 5'
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
      object QRLGrupo6: TQRLabel
        Left = 280
        Top = 127
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          336.020833333333000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 6'
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
      object QRLGrupo7: TQRLabel
        Left = 280
        Top = 143
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          378.354166666667000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 7'
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
      object QRLGrupo8: TQRLabel
        Left = 280
        Top = 159
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          420.687500000000000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 8'
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
      object QRLGrupo9: TQRLabel
        Left = 280
        Top = 175
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          463.020833333333000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 9'
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
      object QRLGrupo10: TQRLabel
        Left = 280
        Top = 191
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          505.354166666667000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Grupo 10'
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
      object QRLTotalGrupo1: TQRLabel
        Left = 600
        Top = 47
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          124.354166666667000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 1'
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
      object QRLTotalGrupo2: TQRLabel
        Left = 600
        Top = 63
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          166.687500000000000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 2'
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
      object QRLTotalGrupo3: TQRLabel
        Left = 600
        Top = 79
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          209.020833333333000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 3'
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
      object QRLTotalGrupo4: TQRLabel
        Left = 600
        Top = 95
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          251.354166666667000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 4'
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
      object QRLTotalGrupo5: TQRLabel
        Left = 600
        Top = 111
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          293.687500000000000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 5'
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
      object QRLTotalGrupo6: TQRLabel
        Left = 600
        Top = 127
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          336.020833333333000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 6'
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
      object QRLTotalGrupo7: TQRLabel
        Left = 600
        Top = 143
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          378.354166666667000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 7'
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
      object QRLTotalGrupo8: TQRLabel
        Left = 600
        Top = 159
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          420.687500000000000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 8'
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
      object QRLTotalGrupo9: TQRLabel
        Left = 600
        Top = 175
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          463.020833333333000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 9'
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
      object QRLTotalGrupo10: TQRLabel
        Left = 600
        Top = 191
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          505.354166666667000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Grupo 10'
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
      object QRLabel15: TQRLabel
        Left = 280
        Top = 31
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          82.020833333333300000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '****** Resumo ******'
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
      object QRLTotalGrupo: TQRLabel
        Left = 280
        Top = 207
        Width = 153
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          740.833333333333000000
          547.687500000000000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object QRLTotalGrupos: TQRLabel
        Left = 600
        Top = 207
        Width = 129
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          547.687500000000000000
          341.312500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total dos Grupos'
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
    object QRGroup1: TQRGroup
      Left = 38
      Top = 153
      Width = 740
      Height = 28
      Frame.DrawTop = True
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'ICMS_CF_EST'
      FooterBand = QRBand1
      Master = QRInvent
      ReprintOnNewPage = True
      object QRDBText6: TQRDBText
        Left = 0
        Top = 5
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333300000
          0.000000000000000000
          13.229166666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'ICMS_CF_EST'
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
      object QRDBText7: TQRDBText
        Left = 64
        Top = 5
        Width = 505
        Height = 16
        Size.Values = (
          42.333333333333300000
          169.333333333333000000
          13.229166666666700000
          1336.145833333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = FrmRelInventario.QItensInventario
        DataField = 'NOME_GRP'
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
      Top = 196
      Width = 740
      Height = 28
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel11: TQRLabel
        Left = 528
        Top = 7
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333300000
          1397.000000000000000000
          18.520833333333300000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAL:'
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
      object QRExpr2: TQRExpr
        Left = 600
        Top = 7
        Width = 129
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          18.520833333333300000
          341.312500000000000000)
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
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(TOTAL)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 457
      Width = 740
      Height = 56
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel12: TQRLabel
        Left = 360
        Top = 7
        Width = 233
        Height = 16
        Size.Values = (
          42.333333333333300000
          952.500000000000000000
          18.520833333333300000
          616.479166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total da P'#225'gina:'
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
        Left = 360
        Top = 31
        Width = 233
        Height = 16
        Size.Values = (
          42.333333333333300000
          952.500000000000000000
          82.020833333333300000
          616.479166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Subtotal do Invent'#225'rio:'
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
      object QRExpr4: TQRExpr
        Left = 600
        Top = 7
        Width = 129
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          18.520833333333300000
          341.312500000000000000)
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
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(TOTAL)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRExpr5: TQRExpr
        Left = 600
        Top = 31
        Width = 129
        Height = 16
        Size.Values = (
          42.333333333333300000
          1587.500000000000000000
          82.020833333333300000
          341.312500000000000000)
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
        Expression = 'SUM(TOTAL)'
        Mask = ',#0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
  end
end
