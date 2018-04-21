object frmRel_Fechavenda: TfrmRel_Fechavenda
  Left = 0
  Top = 0
  Caption = 'frmRel_Fechavenda'
  ClientHeight = 551
  ClientWidth = 773
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
    Left = -24
    Top = -24
    Width = 816
    Height = 1056
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
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
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
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 38
      Width = 740
      Height = 57
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        150.812500000000000000
        1957.916666666667000000)
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
      Top = 95
      Width = 740
      Height = 113
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        298.979166666666700000
        1957.916666666667000000)
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
        Height = 117
        Size.Values = (
          309.562500000000000000
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
        Height = 123
        Size.Values = (
          325.437500000000000000
          1881.187500000000000000
          -29.104166666666670000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 128
        Top = 49
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          129.645833333333300000
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
        Top = 66
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          174.625000000000000000
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
        Top = 49
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          129.645833333333300000
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
        Top = 66
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          174.625000000000000000
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
        Top = 49
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          129.645833333333300000
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
        Top = 66
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          174.625000000000000000
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
        Top = 49
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          129.645833333333300000
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
        Top = 66
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          174.625000000000000000
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
        Top = 49
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          129.645833333333300000
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
        Top = 66
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          174.625000000000000000
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
        Top = 49
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1362.604166666667000000
          129.645833333333300000
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
        Top = 66
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1362.604166666667000000
          174.625000000000000000
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
      object QRShape8: TQRShape
        Left = 7
        Top = 111
        Width = 705
        Height = 1
        Size.Values = (
          2.645833333333333000
          18.520833333333330000
          293.687500000000000000
          1865.312500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText45: TQRDBText
        Left = 22
        Top = 91
        Width = 88
        Height = 16
        Size.Values = (
          42.333333333333330000
          58.208333333333320000
          240.770833333333300000
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
      object QRLabel1: TQRLabel
        Left = 22
        Top = 7
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          58.208333333333330000
          18.520833333333330000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Venda :'
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
      object QRLabel2: TQRLabel
        Left = 119
        Top = 7
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          314.854166666666700000
          18.520833333333330000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Cliente :'
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
      object QRDBText3: TQRDBText
        Left = 119
        Top = 25
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          314.854166666666700000
          66.145833333333330000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'COD_CLI'
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
      object QRDBText4: TQRDBText
        Left = 22
        Top = 25
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          58.208333333333330000
          66.145833333333330000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'COD_VENDA'
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
      object QRLabel3: TQRLabel
        Left = 226
        Top = 7
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          597.958333333333300000
          18.520833333333330000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente :'
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
      object QRDBText5: TQRDBText
        Left = 226
        Top = 25
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          597.958333333333300000
          66.145833333333330000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QReceber
        DataField = 'NOME_CLI'
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
      object QRShape1: TQRShape
        Left = 610
        Top = 13
        Width = 96
        Height = 77
        Size.Values = (
          203.729166666666700000
          1613.958333333333000000
          34.395833333333330000
          254.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText44: TQRDBText
        Left = 620
        Top = 32
        Width = 79
        Height = 44
        Size.Values = (
          116.416666666666700000
          1640.416666666667000000
          84.666666666666670000
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
    end
  end
  object QReceber: TFDQuery
    OnCalcFields = QReceberCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'select R.*, C.NOME_CLI  from CONTAS_RECEBER R INNER JOIN CLIENTE' +
        ' C ON ( R.COD_CLI = C.COD_CLI )')
    Left = 384
    Top = 304
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
    object QReceberCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"CONTAS_RECEBER"."COD_VENDA"'
    end
    object QReceberCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"CONTAS_RECEBER"."COD_CLI"'
      Required = True
    end
    object QReceberNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
  end
  object DReceber: TDataSource
    DataSet = QReceber
    Left = 452
    Top = 304
  end
end
