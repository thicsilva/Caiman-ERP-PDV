object frmRelProdutoCliente: TfrmRelProdutoCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Produtos X Clientes'
  ClientHeight = 554
  ClientWidth = 750
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
    Top = -24
    Width = 794
    Height = 1123
    DataSet = QCliente
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
      Height = 112
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        296.333333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object Shape1: TShape
        Left = 0
        Top = 111
        Width = 718
        Height = 1
      end
      object QRLabel1: TQRLabel
        Left = 7
        Top = 38
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          100.541666666666700000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome do Cliente :'
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
        Left = 2
        Top = 4
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333330000
          5.291666666666667000
          10.583333333333330000
          1886.479166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Produtos X Clientes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object Cliente: TQRLabel
        Left = 128
        Top = 38
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          100.541666666666700000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome do Cliente :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object Intervalo: TQRLabel
        Left = 7
        Top = 61
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          161.395833333333300000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Intervalo das vendas :'
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
      object IntervaloVendas: TQRLabel
        Left = 153
        Top = 61
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          404.812500000000000000
          161.395833333333300000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nome do Cliente :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 56
        Top = 120
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          317.500000000000000000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'QRDBText1'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 7
        Top = 92
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          243.416666666666700000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'd. Ven.'
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
      object QRLabel4: TQRLabel
        Left = 84
        Top = 92
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          243.416666666666700000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data Ven.'
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
      object QRLabel5: TQRLabel
        Left = 170
        Top = 92
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          449.791666666666700000
          243.416666666666700000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cod. Pro.'
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
      object QRLabel6: TQRLabel
        Left = 257
        Top = 92
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          679.979166666666700000
          243.416666666666700000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Produto'
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
      object QRLabel7: TQRLabel
        Left = 595
        Top = 92
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          1574.270833333333000000
          243.416666666666700000
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
      object QRLabel8: TQRLabel
        Left = 651
        Top = 92
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          1722.437500000000000000
          243.416666666666700000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor'
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
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 150
      Width = 718
      Height = 23
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 7
        Top = 3
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'COD_VEN'
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
      object QRDBText3: TQRDBText
        Left = 170
        Top = 3
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          449.791666666666700000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'COD_PRO'
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
      object QRDBText4: TQRDBText
        Left = 257
        Top = 3
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          679.979166666666700000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'NOME_PRO'
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
      object QRDBText5: TQRDBText
        Left = 84
        Top = 3
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          7.937500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'DATA_VEN'
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
      object QRDBText6: TQRDBText
        Left = 595
        Top = 3
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1574.270833333333000000
          7.937500000000000000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
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
      object QRDBText7: TQRDBText
        Left = 661
        Top = 3
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          1748.895833333333000000
          7.937500000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QCliente
        DataField = 'TOTAL'
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
      object QRLabel10: TQRLabel
        Left = 645
        Top = 3
        Width = 14
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          7.937500000000000000
          37.041666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 173
      Width = 718
      Height = 44
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object Shape2: TShape
        Left = 0
        Top = 3
        Width = 718
        Height = 1
      end
      object QRLabel9: TQRLabel
        Left = 583
        Top = 6
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          1542.520833333333000000
          15.875000000000000000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total dos produtos'
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
        Left = 597
        Top = 23
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          1579.562500000000000000
          60.854166666666670000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QTotal
        DataField = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 578
        Top = 23
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          1529.291666666667000000
          60.854166666666670000
          44.979166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'select V.cod_cli, V.data_ven, I.*, p.Nome_PRO, ( I.quant * I.val' +
        'or ) TOTAL from vendas V inner join itens_venda I on( I.cod_ven ' +
        '= V.cod_ven )'
      
        'inner join Produto P on ( P.cod_pro = I.cod_pro ) where COD_CLI ' +
        '=:CODCLI and V.data_ven between :DATA_INI and :DATA_FIN;')
    Left = 344
    Top = 48
    ParamData = <
      item
        Name = 'CODCLI'
      end
      item
        Name = 'DATA_INI'
      end
      item
        Name = 'DATA_FIN'
      end>
    object QClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"VENDAS"."COD_CLI"'
      Required = True
    end
    object QClienteCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"ITENS_VENDA"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QClienteCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QClienteORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QClienteDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_VENDA"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object QClienteCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_VENDA"."COD_EMP"'
      Required = True
    end
    object QClienteQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QClienteVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_VENDA"."VALOR"'
      Required = True
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 3
    end
    object QClienteVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = '"ITENS_VENDA"."VALOR_CUSTO"'
      Precision = 18
      Size = 2
    end
    object QClientePRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_VENDA"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_VENDA"."CANCELADO"'
      Required = True
    end
    object QClienteVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = '"ITENS_VENDA"."VENDA_CANCELADA"'
      Required = True
    end
    object QClienteCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ITENS_VENDA"."COD_VEND"'
      Required = True
    end
    object QClienteSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_VENDA"."STATUS_EXPORTA"'
    end
    object QClienteNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QClienteDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object QClienteTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
  end
  object QTotal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'select  SUM( (I.valor * I.quant) ) TOTAL from vendas V inner joi' +
        'n itens_venda I on( I.cod_ven = V.cod_ven )'
      
        'inner join Produto P on ( P.cod_pro = I.cod_pro ) where COD_CLI ' +
        '=:CODCLI and V.data_ven between :DATA_INI and :DATA_FIN;')
    Left = 440
    Top = 80
    ParamData = <
      item
        Name = 'CODCLI'
      end
      item
        Name = 'DATA_INI'
      end
      item
        Name = 'DATA_FIN'
      end>
    object QTotalTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
  end
end
