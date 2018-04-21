object FrmConsVendasCF: TFrmConsVendasCF
  Left = 330
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Vendas'
  ClientHeight = 539
  ClientWidth = 738
  Color = clBtnFace
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
    Width = 738
    Height = 129
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 225
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 209
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'DATA'
          'CLIENTE'
          'COO'
          'CCF'
          'NOTA FISCAL')
      end
    end
    object GB2: TGroupBox
      Left = 248
      Top = 8
      Width = 241
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 481
      Height = 49
      TabOrder = 2
      object BtnConsCli: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Flat = True
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
        OnClick = BtnConsCliClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodCli: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodCliEnter
        OnExit = EdtCodCliExit
        OnKeyDown = EdtCodCliKeyDown
        OnKeyPress = EdtCodigoKeyPress
      end
      object EdtNomeCli: TEdit
        Left = 98
        Top = 16
        Width = 311
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
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
        TabOrder = 1
      end
      object EdtCodigo: TEdit
        Left = 8
        Top = 16
        Width = 465
        Height = 21
        Color = clSilver
        TabOrder = 2
        OnKeyPress = EdtCodigoKeyPress
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 104
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object BtnOK: TBitBtn
      Left = 557
      Top = 30
      Width = 65
      Height = 25
      Caption = '&Ok'
      TabOrder = 4
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 557
      Top = 70
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 738
    Height = 391
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Shape1: TShape
      Left = 8
      Top = 359
      Width = 21
      Height = 20
      Brush.Color = 6184703
    end
    object Label2: TLabel
      Left = 34
      Top = 363
      Width = 107
      Height = 13
      Caption = 'Vendas Consignadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 170
      Top = 363
      Width = 98
      Height = 13
      Caption = 'Vendas Importadas'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Shape2: TShape
      Left = 144
      Top = 359
      Width = 21
      Height = 20
      Brush.Color = 16753828
    end
    object BtnSegundaVia: TButton
      Left = 449
      Top = 360
      Width = 80
      Height = 25
      Caption = '2'#170' &Via Cupom'
      TabOrder = 2
      OnClick = BtnSegundaViaClick
    end
    object BtnLocalizar: TButton
      Left = 353
      Top = 360
      Width = 80
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 734
      Height = 351
      Align = alTop
      Color = clSilver
      DataSource = DSQConsVendas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 289
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CUPOM_FISCAL_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'R04_CCF'
          Title.Alignment = taCenter
          Title.Caption = 'CCF'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO VENDA'
          Width = 151
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_NOTA_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'NOTA FISCAL'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'CAIXA'
          Width = 48
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'HORA'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 42
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Width = 163
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_USU'
          Title.Alignment = taCenter
          Title.Caption = 'USU'#193'RIO'
          Width = 149
          Visible = True
        end>
    end
    object BtnItens: TButton
      Left = 542
      Top = 360
      Width = 80
      Height = 25
      Caption = '&Itens'
      TabOrder = 3
      OnClick = BtnItensClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 520
    Width = 738
    Height = 19
    Panels = <>
  end
  object QConsVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsVendas
    SQL.Strings = (
      
        'SELECT V.*, C.NOME_CLI, T.NOME_TPV, VE.NOME_VEND, CAI.R01_NUMERO' +
        '_SERIE,'
      'CAST (V.DATA_HORA_VEN AS TIME) HORA, CO.NOME_CON,  U.NOME_USU'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (V.COD_TPV = T.COD_TPV)'
      'INNER JOIN CONVENIO CO'
      'ON (C.COD_CON = CO.COD_CON)'
      'INNER JOIN USUARIO U'
      'ON (V.COD_USU = U.COD_USU)'
      'INNER JOIN VENDEDOR VE'
      'ON (V.COD_VEND = VE.COD_VEND)'
      'inner join caixa CAI'
      'ON ( V.cod_cai = CAI.cod_cai )')
    Left = 32
    Top = 176
    object QConsVendasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QConsVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsVendasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'VENDAS.COD_EMP'
      Required = True
    end
    object QConsVendasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QConsVendasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'VENDAS.COD_CLI'
      Required = True
    end
    object QConsVendasDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsVendasCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'VENDAS.COD_TPV'
      Required = True
    end
    object QConsVendasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsVendasCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
    object QConsVendasTOTAL_CUSTO_VEN: TBCDField
      FieldName = 'TOTAL_CUSTO_VEN'
      Origin = 'VENDAS.TOTAL_CUSTO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsVendasDATA_HORA_VEN: TSQLTimeStampField
      FieldName = 'DATA_HORA_VEN'
      Origin = 'VENDAS.DATA_HORA_VEN'
    end
    object QConsVendasDESC_PESSOA_AUTORIZADA: TStringField
      FieldName = 'DESC_PESSOA_AUTORIZADA'
      Origin = 'VENDAS.DESC_PESSOA_AUTORIZADA'
      Size = 60
    end
    object QConsVendasCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'VENDAS.COD_NF'
    end
    object QConsVendasCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'VENDAS.COD_USU'
      Required = True
    end
    object QConsVendasCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = 'VENDAS.CANCELADA_VEN'
      Required = True
    end
    object QConsVendasCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = 'VENDAS.CODIGO_PAF'
    end
    object QConsVendasR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = 'VENDAS.R04_CCF'
    end
    object QConsVendasR04_NOME_CLIENTE: TStringField
      FieldName = 'R04_NOME_CLIENTE'
      Origin = 'VENDAS.R04_NOME_CLIENTE'
      Size = 40
    end
    object QConsVendasR04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = 'VENDAS.R04_CNPJ_CLIENTE'
      Size = 18
    end
    object QConsVendasCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'VENDAS.COD_VEND'
      Required = True
    end
    object QConsVendasSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'VENDAS.SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QConsVendasCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'VENDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsVendasCER: TIntegerField
      FieldName = 'CER'
      Origin = 'VENDAS.CER'
    end
    object QConsVendasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsVendasNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QConsVendasHORA: TTimeField
      FieldName = 'HORA'
    end
    object QConsVendasNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QConsVendasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'VENDAS.NUMERO_NOTA_FISCAL'
    end
    object QConsVendasNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QConsVendasNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'VENDEDOR.NOME_VEND'
      Required = True
      Size = 50
    end
    object QConsVendasCONSIGNADA: TStringField
      FieldName = 'CONSIGNADA'
      Origin = '"VENDAS"."CONSIGNADA"'
      Size = 1
    end
    object QConsVendasIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Origin = '"VENDAS"."IMPORTADO_NFE"'
      Size = 1
    end
    object QConsVendasR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = '"CAIXA"."R01_NUMERO_SERIE"'
    end
  end
  object DSQConsVendas: TDataSource
    AutoEdit = False
    DataSet = QConsVendas
    Left = 32
    Top = 232
  end
  object IBTRConsVendas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 32
    Top = 288
  end
  object QBuscaItens: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, (I.QUANT * I.VALOR) TOTAL, P.NOME_PRO,  P.CODIGO_BAR' +
        'RA_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE COD_VEN = :CODVEN'
      'ORDER BY ORDEM')
    Left = 432
    Top = 184
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QBuscaItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QBuscaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      Calculated = True
    end
    object QBuscaItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QBuscaItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QBuscaItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ITENS_VENDA.COD_VEND'
      Required = True
    end
    object QBuscaItensCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QBuscaItensSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_VENDA"."STATUS_EXPORTA"'
    end
    object QBuscaItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
  end
  object QBuscaItensNotaFiscal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.COD_PRO, I.ORDEM, I.QUANT, I.VALOR, U.DESCRICAO, P.NOME' +
        '_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY I.ORDEM')
    Left = 432
    Top = 296
    ParamData = <
      item
        Name = 'CODVEN'
      end>
  end
  object QinsItensNotaFiscal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'INSERT INTO ITENS_NOTA_FISCAL(ORDEM, COD_NF, COD_PRO,     '
      'CST, QUANT, UNIT, ALIQ, COD_EMP, COD_GRP, ALIQ_IPI,'
      
        'REDUCAO_ICMS, COD_CFO, SUB_TRIBUTARIA, VR_AGREGADO, ALIQUOTA_FOR' +
        'A_ESTADO, UNIDADE, VALOR_TOTAL, BASE_CALCULO, VALOR_ICMS, BASE_S' +
        'UBTRIB, VALOR_SUBTRIB, VALOR_IPI, CLASSIFICACAO_FISCAL,'
      'CST_PIS, CST_COFINS, CST_IPI, CSOSN)'
      
        'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :12, :13, :14, :' +
        '15, :16, :18, :19, :20, :21, :22, :23, :24, :25,'
      ':CST_PIS, :CST_COFINS, :CST_IPI, :CSOSN)')
    Left = 432
    Top = 240
    ParamData = <
      item
        Name = '1'
        DataType = ftInteger
      end
      item
        Name = '2'
        DataType = ftInteger
      end
      item
        Name = '3'
        DataType = ftInteger
      end
      item
        Name = '4'
        DataType = ftString
      end
      item
        Name = '5'
        DataType = ftFloat
      end
      item
        Name = '6'
        DataType = ftFloat
      end
      item
        Name = '7'
        DataType = ftFloat
      end
      item
        Name = '8'
        DataType = ftInteger
      end
      item
        Name = '9'
        DataType = ftInteger
      end
      item
        Name = '10'
        DataType = ftCurrency
      end
      item
        Name = '12'
        DataType = ftCurrency
      end
      item
        Name = '13'
      end
      item
        Name = '14'
      end
      item
        Name = '15'
      end
      item
        Name = '16'
      end
      item
        Name = '18'
      end
      item
        Name = '19'
      end
      item
        Name = '20'
      end
      item
        Name = '21'
      end
      item
        Name = '22'
      end
      item
        Name = '23'
      end
      item
        Name = '24'
      end
      item
        Name = '25'
      end
      item
        Name = 'CST_PIS'
      end
      item
        Name = 'CST_COFINS'
      end
      item
        Name = 'CST_IPI'
      end
      item
        Name = 'CSOSN'
      end>
  end
  object QBuscaDadosCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CLI, NOME_CLI, ENDRES_CLI, BAIRES_CLI, CIDRES_CLI, ES' +
        'TRES_CLI, CEPRES_CLI, TELRES_CLI, PONTO_REFERENCIA, CNPJ_CLI, DO' +
        'C_CLI'
      'FROM CLIENTE '
      'WHERE COD_CLI = :CODCLI')
    Left = 224
    Top = 280
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
  end
  object RDprint: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Extrado'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'DATACAMP LTDA'
    RegistroUsuario.SerieProduto = 'SINGLE-0714/01190'
    RegistroUsuario.AutorizacaoKey = '9HHM-SS2W-455Y-ZASZ-9VI8'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Comprovante'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 10
    TamanhoQteColunas = 55
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S20cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 224
    Top = 224
  end
end
