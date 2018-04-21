object FrmRelEtiqueta: TFrmRelEtiqueta
  Left = 230
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Etiqueta'
  ClientHeight = 512
  ClientWidth = 745
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 185
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label17: TLabel
      Left = 8
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Cod.Barra'
    end
    object BtnConsPro: TsSpeedButton
      Left = 116
      Top = 80
      Width = 23
      Height = 22
      Hint = 'Consultar Produto'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000502020B4B201CB1662A26F032151275000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
        0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
        052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
        00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
        27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
        12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
        23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
        26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
        04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
        28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
        090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
        23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
        4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
        1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
        69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
        22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
        527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
        28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
        0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
        28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
        020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
        14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
        20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
        0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
        26F92F14116F0000000000000000000000000000000000000000000000000000
        0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
        0625000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsProClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnAddPro: TsSpeedButton
      Left = 141
      Top = 80
      Width = 25
      Height = 22
      Hint = 'Cadastrar Produto'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
        1335000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
        39A1000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000111F0F2A4074
        389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
        51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
        2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
        4ED83765318837653188376531883765318836623085101D0E27000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
        389E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
        0F2A000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnAddProClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label18: TLabel
      Left = 170
      Top = 64
      Width = 111
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
    end
    object Label1: TLabel
      Left = 448
      Top = 104
      Width = 35
      Height = 13
      Caption = 'Quant.'
    end
    object Label2: TLabel
      Left = 10
      Top = 104
      Width = 125
      Height = 13
      Caption = 'Decri'#231#227'o para Impress'#227'o'
    end
    object EdtCodPro: TEdit
      Left = 8
      Top = 80
      Width = 105
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = EdtCodProEnter
      OnExit = EdtCodProExit
      OnKeyDown = EdtCodProKeyDown
    end
    object EdtNomePro: TEdit
      Left = 170
      Top = 80
      Width = 335
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
    end
    object BtnOK: TBitBtn
      Left = 170
      Top = 149
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 288
      Top = 149
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object EdtQuant: TEdit
      Left = 448
      Top = 120
      Width = 57
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      TabOrder = 3
      OnEnter = EdtQuantEnter
    end
    object RdgImp: TRadioGroup
      Left = 8
      Top = 8
      Width = 497
      Height = 49
      Caption = 'Buscar no Produto'
      Columns = 2
      Items.Strings = (
        'Nome Produto'
        'Desc.Cupom')
      TabOrder = 0
    end
    object EdtDescEtiqueta: TEdit
      Left = 10
      Top = 120
      Width = 391
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 185
    Width = 745
    Height = 327
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 745
      Height = 274
      Align = alClient
      Color = clSilver
      DataSource = DSQBuscaETQ
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANT_ETQ'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROMOCAO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PROMO'#199#195'O'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_PRAZO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PRAZO'
          Width = 66
          Visible = True
        end>
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 293
      Width = 745
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnEtiquetas: TsSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 32
        Height = 28
        Hint = 'Cadastrar Produto'
        Align = alLeft
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEtiquetasClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnExc: TBitBtn
        AlignWithMargins = True
        Left = 374
        Top = 3
        Width = 81
        Height = 28
        Align = alLeft
        Caption = '&Excluir'
        TabOrder = 0
        OnClick = BtnExcClick
      end
      object BtnImp: TBitBtn
        AlignWithMargins = True
        Left = 461
        Top = 3
        Width = 81
        Height = 28
        Align = alLeft
        Caption = '&Imprimir'
        TabOrder = 1
        OnClick = BtnImpClick
      end
      object BtnLimpar: TBitBtn
        AlignWithMargins = True
        Left = 287
        Top = 3
        Width = 81
        Height = 28
        Align = alLeft
        Caption = '&Limpar'
        TabOrder = 2
        OnClick = BtnLimparClick
      end
      object cbbModelo: TComboBox
        AlignWithMargins = True
        Left = 41
        Top = 5
        Width = 240
        Height = 25
        Margins.Top = 5
        Align = alLeft
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object cxProgres: TcxProgressBar
      Left = 0
      Top = 272
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 312
      ExplicitTop = 152
      Width = 745
    end
  end
  object IBSQLETQ: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRETQ
    Left = 408
    Top = 248
  end
  object IBTRETQ: TFDTransaction
    Connection = DM.IBDatabase
    Left = 408
    Top = 304
  end
  object DSQBuscaETQ: TDataSource
    AutoEdit = False
    DataSet = QbuscaETQ
    Left = 72
    Top = 296
  end
  object QbuscaETQ: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRETQ
    SQL.Strings = (
      'SELECT E.*, P.VALOR_PRO, P.PROMOCAO_PRO,'
      'P.REFERENCIA_PRO, P.PRECO_PRAZO_PRO, U.DESCRICAO UNIDADE_SAIDA,'
      'P.codigo_barra_pro,'
      
        'P.VALOR_ATACADO, p.cor, p.tamanho, p.referencia_pro, s.descricao' +
        ' desc_setor FROM ETIQUETA E'
      'INNER JOIN PRODUTO P'
      'ON (E.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'INNER JOIN SETORES_ESTOQUE S'
      'ON (S.codigo = P.codigo_setor_estoque )'
      'ORDER BY E.COD_ETQ')
    Left = 72
    Top = 248
    object QbuscaETQCOD_ETQ: TIntegerField
      FieldName = 'COD_ETQ'
      Origin = 'ETIQUETA.COD_ETQ'
      Required = True
    end
    object QbuscaETQCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ETIQUETA.COD_PRO'
      Required = True
    end
    object QbuscaETQQUANT_ETQ: TIntegerField
      FieldName = 'QUANT_ETQ'
      Origin = 'ETIQUETA.QUANT_ETQ'
      Required = True
    end
    object QbuscaETQVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QbuscaETQPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QbuscaETQREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QbuscaETQPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRODUTO.PRECO_PRAZO_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QbuscaETQDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'ETIQUETA.DESCRICAO'
      Size = 80
    end
    object QbuscaETQUNIDADE_SAIDA: TStringField
      FieldName = 'UNIDADE_SAIDA'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QbuscaETQVALOR_ATACADO: TBCDField
      FieldName = 'VALOR_ATACADO'
      Origin = '"PRODUTO"."VALOR_ATACADO"'
      Precision = 18
      Size = 2
    end
    object QbuscaETQCOR: TStringField
      FieldName = 'COR'
      Origin = '"PRODUTO"."COR"'
      Size = 40
    end
    object QbuscaETQTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Origin = '"PRODUTO"."TAMANHO"'
      Size = 10
    end
    object QbuscaETQREFERENCIA_PRO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA_PRO_1'
      Origin = 'REFERENCIA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QbuscaETQDESC_SETOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_SETOR'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QbuscaETQCODIGO_BARRA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
  end
  object frxDBEtiquetas: TfrxDBDataset
    UserName = 'ESTIQUETAS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_AUT=COD_AUT'
      'COD_ETQ=COD_ETQ'
      'COD_PRO=COD_PRO'
      'QUANT_ETQ=QUANT_ETQ'
      'VALOR_PRO=VALOR_PRO'
      'PROMOCAO_PRO=PROMOCAO_PRO'
      'REFERENCIA_PRO=REFERENCIA_PRO'
      'PRECO_PRAZO_PRO=PRECO_PRAZO_PRO'
      'DESCRICAO=DESCRICAO'
      'UNIDADE_SAIDA=UNIDADE_SAIDA'
      'VALOR_ATACADO=VALOR_ATACADO'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'DESC_SETOR=DESC_SETOR'
      'CODIGO_BARRA_PRO=CODIGO_BARRA_PRO')
    DataSet = dsTempEtiquetas
    BCDToCurrency = False
    Left = 72
    Top = 352
  end
  object frxEtiquetas: TfrxReport
    Version = '4.15.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42326.587852314800000000
    ReportOptions.LastChange = 42326.640844548610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 160
    Top = 248
    Datasets = <
      item
        DataSet = frxDBEtiquetas
        DataSetName = 'ESTIQUETAS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 110.000000000000000000
      PaperHeight = 152.000000000000000000
      PaperSize = 256
      RightMargin = 2.000000000000000000
      Columns = 3
      ColumnWidth = 36.666666666666700000
      ColumnPositions.Strings = (
        '0'
        '36,6666666666667'
        '73,3333333333333')
      EndlessHeight = True
      object dbMaster: TfrxMasterData
        Height = 83.149606300000000000
        Top = 18.897650000000000000
        Width = 138.582766666666800000
        Columns = 3
        ColumnWidth = 11.338582677165400000
        ColumnGap = 124.724409448819000000
        DataSet = frxDBEtiquetas
        DataSetName = 'ESTIQUETAS'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 10.338590000000000000
          Top = 5.559060000000000000
          Width = 113.385900000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxDBEtiquetas
          DataSetName = 'ESTIQUETAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ESTIQUETAS."DESCRICAO"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 10.338590000000000000
          Top = 38.354360000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'COD_PRO'
          DataSet = frxDBEtiquetas
          DataSetName = 'ESTIQUETAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ESTIQUETAS."COD_PRO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 54.913420000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'VALOR_PRO'
          DataSet = frxDBEtiquetas
          DataSetName = 'ESTIQUETAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ESTIQUETAS."VALOR_PRO"]')
          ParentFont = False
        end
      end
    end
  end
  object QEtiqModelos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRETQ
    UpdateTransaction = IBTRETQ
    UpdateObject = upEtiModelos
    SQL.Strings = (
      'select * from relatorios'
      'where cod_emp=:cod_emp'
      'and NOME_REL='#39'REL_ETIQUETAS'#39)
    Left = 224
    Top = 232
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QEtiqModelosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEtiqModelosNOME_REL: TStringField
      FieldName = 'NOME_REL'
      Origin = 'NOME_REL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 60
    end
    object QEtiqModelosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEtiqModelosREL: TMemoField
      FieldName = 'REL'
      Origin = 'REL'
      BlobType = ftMemo
    end
    object QEtiqModelosPADRAO: TIntegerField
      FieldName = 'PADRAO'
      Origin = 'PADRAO'
    end
  end
  object upEtiModelos: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO RELATORIOS'
      '(COD_EMP, NOME_REL, TIPO, REL, PADRAO)'
      
        'VALUES (:NEW_COD_EMP, :NEW_NOME_REL, :NEW_TIPO, :NEW_REL, :NEW_P' +
        'ADRAO)')
    ModifySQL.Strings = (
      'UPDATE RELATORIOS'
      
        'SET COD_EMP = :NEW_COD_EMP, NOME_REL = :NEW_NOME_REL, TIPO = :NE' +
        'W_TIPO, '
      '  REL = :NEW_REL, PADRAO = :NEW_PADRAO'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND NOME_REL = :OLD_NOME_REL AND TI' +
        'PO = :OLD_TIPO')
    DeleteSQL.Strings = (
      'DELETE FROM RELATORIOS'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND NOME_REL = :OLD_NOME_REL AND TI' +
        'PO = :OLD_TIPO')
    FetchRowSQL.Strings = (
      'SELECT COD_EMP, NOME_REL, TIPO, REL, PADRAO'
      'FROM RELATORIOS'
      
        'WHERE COD_EMP = :COD_EMP AND NOME_REL = :NOME_REL AND TIPO = :TI' +
        'PO')
    Left = 240
    Top = 296
  end
  object dsEtiModelos: TDataSource
    DataSet = QEtiqModelos
    Left = 240
    Top = 352
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = [drDontDeletePage, drDontCreatePage, drDontSaveReport]
    RTLLanguage = False
    MemoParentFont = False
    Left = 312
    Top = 232
  end
  object QEmpresa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRETQ
    SQL.Strings = (
      'select * from EMPRESA where COD_EMP=:COD_EMP')
    Left = 152
    Top = 304
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QEmpresaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEmpresaRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'RAZAO_EMP'
      Required = True
      Size = 50
    end
    object QEmpresaEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = 'END_EMP'
      Size = 50
    end
    object QEmpresaBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = 'BAI_EMP'
      Size = 30
    end
    object QEmpresaCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = 'CID_EMP'
      Size = 30
    end
    object QEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = 'CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object QEmpresaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = 'EST_EMP'
      FixedChar = True
      Size = 2
    end
    object QEmpresaINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = 'INSC_EMP'
    end
    object QEmpresaTEL_EMP: TStringField
      FieldName = 'TEL_EMP'
      Origin = 'TEL_EMP'
      Size = 13
    end
    object QEmpresaFAX_EMP: TStringField
      FieldName = 'FAX_EMP'
      Origin = 'FAX_EMP'
      Size = 13
    end
    object QEmpresaNOME_EMP_ETIQUETA: TStringField
      FieldName = 'NOME_EMP_ETIQUETA'
      Origin = 'NOME_EMP_ETIQUETA'
      Size = 15
    end
    object QEmpresaNUMERO_EMP: TStringField
      FieldName = 'NUMERO_EMP'
      Origin = 'NUMERO_EMP'
      Size = 10
    end
    object QEmpresaRESP_EMP: TStringField
      FieldName = 'RESP_EMP'
      Origin = 'RESP_EMP'
      Size = 50
    end
    object QEmpresaCAMINHO_FOTO_EMP: TStringField
      FieldName = 'CAMINHO_FOTO_EMP'
      Origin = 'CAMINHO_FOTO_EMP'
      Size = 150
    end
    object QEmpresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      Size = 50
    end
    object QEmpresaMOSTRAR_SITCLI_PREVENDA: TStringField
      FieldName = 'MOSTRAR_SITCLI_PREVENDA'
      Origin = 'MOSTRAR_SITCLI_PREVENDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpresaCADASTRAR_CLIENTE_SEM_CPF: TStringField
      FieldName = 'CADASTRAR_CLIENTE_SEM_CPF'
      Origin = 'CADASTRAR_CLIENTE_SEM_CPF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QEmpresaTIPO_EMP: TIntegerField
      FieldName = 'TIPO_EMP'
      Origin = 'TIPO_EMP'
      Required = True
    end
    object QEmpresaTIPO_CARGA_BALANCA: TIntegerField
      FieldName = 'TIPO_CARGA_BALANCA'
      Origin = 'TIPO_CARGA_BALANCA'
      Required = True
    end
    object QEmpresaCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = 'CNPJ_EMP'
      Size = 14
    end
    object QEmpresaCAMINHO_VALIDADOR_SINTEGRA: TStringField
      FieldName = 'CAMINHO_VALIDADOR_SINTEGRA'
      Origin = 'CAMINHO_VALIDADOR_SINTEGRA'
      Size = 80
    end
    object QEmpresaINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'INSCRICAO_MUNICIPAL'
    end
    object QEmpresaPERFIL_EFD: TStringField
      FieldName = 'PERFIL_EFD'
      Origin = 'PERFIL_EFD'
      FixedChar = True
      Size = 1
    end
    object QEmpresaCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      Size = 7
    end
    object QEmpresaTIPO_ATIVIDADE_EFD: TIntegerField
      FieldName = 'TIPO_ATIVIDADE_EFD'
      Origin = 'TIPO_ATIVIDADE_EFD'
    end
    object QEmpresaNOME_CONTADOR: TStringField
      FieldName = 'NOME_CONTADOR'
      Origin = 'NOME_CONTADOR'
      Size = 80
    end
    object QEmpresaCPF_CONTADOR: TStringField
      FieldName = 'CPF_CONTADOR'
      Origin = 'CPF_CONTADOR'
      Size = 14
    end
    object QEmpresaCRC_CONTADOR: TStringField
      FieldName = 'CRC_CONTADOR'
      Origin = 'CRC_CONTADOR'
      Size = 15
    end
    object QEmpresaCNPJ_CONTADOR: TStringField
      FieldName = 'CNPJ_CONTADOR'
      Origin = 'CNPJ_CONTADOR'
      Size = 18
    end
    object QEmpresaCEP_CONTADOR: TStringField
      FieldName = 'CEP_CONTADOR'
      Origin = 'CEP_CONTADOR'
      FixedChar = True
      Size = 9
    end
    object QEmpresaEND_CONTADOR: TStringField
      FieldName = 'END_CONTADOR'
      Origin = 'END_CONTADOR'
      Size = 60
    end
    object QEmpresaNUMERO_CONTADOR: TStringField
      FieldName = 'NUMERO_CONTADOR'
      Origin = 'NUMERO_CONTADOR'
      Size = 10
    end
    object QEmpresaBAIRRO_CONTADOR: TStringField
      FieldName = 'BAIRRO_CONTADOR'
      Origin = 'BAIRRO_CONTADOR'
      Size = 50
    end
    object QEmpresaTEL_CONTADOR: TStringField
      FieldName = 'TEL_CONTADOR'
      Origin = 'TEL_CONTADOR'
      Size = 10
    end
    object QEmpresaFAX_CONTADOR: TStringField
      FieldName = 'FAX_CONTADOR'
      Origin = 'FAX_CONTADOR'
      Size = 10
    end
    object QEmpresaCODIGO_MUNICIPIO_CONTADOR: TStringField
      FieldName = 'CODIGO_MUNICIPIO_CONTADOR'
      Origin = 'CODIGO_MUNICIPIO_CONTADOR'
      Size = 7
    end
    object QEmpresaVERSAO_EFD: TIntegerField
      FieldName = 'VERSAO_EFD'
      Origin = 'VERSAO_EFD'
    end
    object QEmpresaEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Origin = 'EMAIL_CONTADOR'
      Size = 255
    end
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QEmpresa
    BCDToCurrency = False
    Left = 152
    Top = 352
  end
  object dsTempEtiquetas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'dsTempEtiquetasIndex1'
        Fields = 'COD_AUT'
        Options = [ixPrimary]
      end>
    IndexName = 'dsTempEtiquetasIndex1'
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 344
    object dsTempEtiquetasCOD_AUT: TAutoIncField
      FieldName = 'COD_AUT'
    end
    object dsTempEtiquetasCOD_ETQ: TIntegerField
      FieldName = 'COD_ETQ'
    end
    object dsTempEtiquetasCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
    end
    object dsTempEtiquetasQUANT_ETQ: TIntegerField
      FieldName = 'QUANT_ETQ'
    end
    object dsTempEtiquetasVALOR_PRO: TCurrencyField
      FieldName = 'VALOR_PRO'
    end
    object dsTempEtiquetasPROMOCAO_PRO: TCurrencyField
      FieldName = 'PROMOCAO_PRO'
    end
    object dsTempEtiquetasREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Size = 30
    end
    object dsTempEtiquetasPRECO_PRAZO_PRO: TCurrencyField
      FieldName = 'PRECO_PRAZO_PRO'
    end
    object dsTempEtiquetasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object dsTempEtiquetasUNIDADE_SAIDA: TStringField
      FieldName = 'UNIDADE_SAIDA'
      Size = 10
    end
    object dsTempEtiquetasVALOR_ATACADO: TCurrencyField
      FieldName = 'VALOR_ATACADO'
    end
    object dsTempEtiquetasCOR: TStringField
      FieldName = 'COR'
      Size = 40
    end
    object dsTempEtiquetasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object dsTempEtiquetasDESC_SETOR: TStringField
      FieldName = 'DESC_SETOR'
      Size = 60
    end
    object dsTempEtiquetasCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Size = 14
    end
  end
end
