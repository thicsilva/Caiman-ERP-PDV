object FrmRelVendas: TFrmRelVendas
  Left = 441
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 490
  ClientWidth = 505
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 401
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnConsCli: TsSpeedButton
      Left = 68
      Top = 216
      Width = 23
      Height = 21
      Hint = 'Consultar Fornecedor'
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
    object Label2: TLabel
      Left = 8
      Top = 200
      Width = 36
      Height = 13
      Caption = 'Cliente'
    end
    object CheckCli: TCheckBox
      Left = 8
      Top = 240
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Clientes'
      TabOrder = 4
      OnClick = CheckCliClick
    end
    object GB2: TGroupBox
      Left = 8
      Top = 8
      Width = 415
      Height = 45
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 200
        Top = 22
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 56
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 248
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 216
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Fornecedor'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodCliKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 98
      Top = 216
      Width = 324
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
      TabOrder = 5
    end
    object CheckEmp: TCheckBox
      Left = 240
      Top = 240
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 6
    end
    object GBTipoVenda: TGroupBox
      Left = 8
      Top = 56
      Width = 415
      Height = 45
      Caption = 'Tipo de Venda'
      TabOrder = 1
      object ComboTipoVenda: TComboBox
        Left = 8
        Top = 16
        Width = 399
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
    object CheckTipoVenda: TCheckBox
      Left = 8
      Top = 102
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Tipos de Venda'
      TabOrder = 7
      OnClick = CheckTipoVendaClick
    end
    object GBCaixa: TGroupBox
      Left = 8
      Top = 128
      Width = 415
      Height = 45
      Caption = 'Caixa'
      TabOrder = 2
      object ComboCaixa: TComboBox
        Left = 8
        Top = 16
        Width = 397
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          '')
      end
    end
    object CheckCaixa: TCheckBox
      Left = 8
      Top = 174
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Caixas'
      TabOrder = 8
      OnClick = CheckCaixaClick
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 264
      Width = 415
      Height = 45
      Caption = 'Operador'
      TabOrder = 9
      object Operador: TComboBox
        Left = 8
        Top = 16
        Width = 399
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
    object todosop: TCheckBox
      Left = 8
      Top = 312
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos operadores'
      TabOrder = 10
      OnClick = todosopClick
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 330
      Width = 415
      Height = 45
      Caption = ' Vendedor '
      TabOrder = 11
      object cbVendedor: TComboBox
        Left = 8
        Top = 16
        Width = 399
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
    object opVendedor: TCheckBox
      Left = 7
      Top = 378
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos Vendedores'
      TabOrder = 12
      OnClick = opVendedorClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 401
    Width = 505
    Height = 70
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object Button1: TButton
      Left = 176
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Gerar TXT'
      TabOrder = 3
      OnClick = Button1Click
    end
    object btnDetalhado: TBitBtn
      Left = 64
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Detalhado'
      TabOrder = 4
      OnClick = BtnVisClick
    end
    object Button3: TButton
      Left = 392
      Top = 39
      Width = 97
      Height = 25
      Caption = 'Romaneio Regi'#227'o'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 392
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Romaneio Vendas'
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 471
    Width = 505
    Height = 19
    Panels = <>
  end
  object Button2: TButton
    Left = 288
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Romaneio'
    TabOrder = 3
    OnClick = Button2Click
  end
  object QRelVendas: TFDQuery
    AfterScroll = QRelVendasAfterScroll
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT V.COD_VEN, V.DATA_VEN, V.COD_EMP, V.cancelada_ven, V.TOTA' +
        'L_VEN,  C.NOME_CLI, T.NOME_TPV'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (V.COD_TPV = T.COD_TPV)'
      '')
    Left = 304
    Top = 168
    object QRelVendasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QRelVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QRelVendasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'VENDAS.COD_EMP'
      Required = True
    end
    object QRelVendasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      currency = True
      Precision = 18
      Size = 2
    end
    object QRelVendasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelVendasNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QRelVendasCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = '"VENDAS"."CANCELADA_VEN"'
      Required = True
    end
  end
  object Vendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select sum( TOTAL_VEN ) TOTAL from VENDAS')
    Left = 208
    Top = 200
    object VendasTOTAL: TBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object QItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from ITENS_VENDA')
    Left = 128
    Top = 160
    object QItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"ITENS_VENDA"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_VENDA"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object QItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_VENDA"."COD_EMP"'
      Required = True
    end
    object QItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_VENDA"."VALOR"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = '"ITENS_VENDA"."VALOR_CUSTO"'
      Precision = 18
      Size = 2
    end
    object QItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_VENDA"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_VENDA"."CANCELADO"'
      Required = True
    end
    object QItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = '"ITENS_VENDA"."VENDA_CANCELADA"'
      Required = True
    end
    object QItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ITENS_VENDA"."COD_VEND"'
      Required = True
    end
    object QItensSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_VENDA"."STATUS_EXPORTA"'
    end
  end
  object QVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from VENDAS')
    Left = 192
    Top = 152
    object QVendasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"VENDAS"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object QVendasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"VENDAS"."COD_EMP"'
      Required = True
    end
    object QVendasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"VENDAS"."COD_CAI"'
      Required = True
    end
    object QVendasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"VENDAS"."COD_CLI"'
      Required = True
    end
    object QVendasDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = '"VENDAS"."DESCONTO_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"VENDAS"."COD_TPV"'
      Required = True
    end
    object QVendasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = '"VENDAS"."TOTAL_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = '"VENDAS"."CUPOM_FISCAL_VEN"'
    end
    object QVendasTOTAL_CUSTO_VEN: TBCDField
      FieldName = 'TOTAL_CUSTO_VEN'
      Origin = '"VENDAS"."TOTAL_CUSTO_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasDATA_HORA_VEN: TSQLTimeStampField
      FieldName = 'DATA_HORA_VEN'
      Origin = '"VENDAS"."DATA_HORA_VEN"'
    end
    object QVendasDESC_PESSOA_AUTORIZADA: TStringField
      FieldName = 'DESC_PESSOA_AUTORIZADA'
      Origin = '"VENDAS"."DESC_PESSOA_AUTORIZADA"'
      Size = 60
    end
    object QVendasCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"VENDAS"."COD_NF"'
    end
    object QVendasCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = '"VENDAS"."COD_USU"'
      Required = True
    end
    object QVendasCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = '"VENDAS"."CANCELADA_VEN"'
      Required = True
    end
    object QVendasCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = '"VENDAS"."CODIGO_PAF"'
    end
    object QVendasR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = '"VENDAS"."R04_CCF"'
    end
    object QVendasR04_NOME_CLIENTE: TStringField
      FieldName = 'R04_NOME_CLIENTE'
      Origin = '"VENDAS"."R04_NOME_CLIENTE"'
      Size = 40
    end
    object QVendasR04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = '"VENDAS"."R04_CNPJ_CLIENTE"'
      Size = 18
    end
    object QVendasNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = '"VENDAS"."NUMERO_NOTA_FISCAL"'
    end
    object QVendasCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDAS"."COD_VEND"'
      Required = True
    end
    object QVendasSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = '"VENDAS"."SERIE_NOTA_FISCAL"'
      Size = 3
    end
    object QVendasCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"VENDAS"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QVendasCER: TIntegerField
      FieldName = 'CER'
      Origin = '"VENDAS"."CER"'
    end
  end
  object RelDetalhado: TfrxReport
    Version = '4.15.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41370.374426620370000000
    ReportOptions.LastChange = 41776.349323668980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <VENDAS."CANCELADA_VEN"> = 1 then'
      '      begin'
      
        '         VENDASCOD_VEN.Font.Color := clRed;                     ' +
        '                       '
      '         VENDASDATA_VEN.Font.Color := clRed;  '
      '         VENDASNOME_CLI.Font.Color := clRed;  '
      '         VENDASNOME_TPV.Font.Color := clRed;  '
      
        '         VENDASTOTAL_VEN.Font.Color := clRed;                   ' +
        '                       '
      '      end'
      '   else'
      '      begin'
      
        '         VENDASCOD_VEN.Font.Color := $00A40000;                 ' +
        '                           '
      '         VENDASDATA_VEN.Font.Color := $00A40000;  '
      '         VENDASNOME_CLI.Font.Color := $00A40000;  '
      '         VENDASNOME_TPV.Font.Color := $00A40000;  '
      '         VENDASTOTAL_VEN.Font.Color := $00A40000;          '
      '      end;                '
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <ITENS."CANCELADO"> = 1 then'
      '       begin'
      '          Memo15.Font.Color := clGray;  '
      '          Memo16.Font.Color := clGray;  '
      '          Memo18.Font.Color := clGray;  '
      '          Memo19.Font.Color := clGray;  '
      '          Memo21.Font.Color := clGray;  '
      '          Memo20.Font.Color := clGray;             '
      '       end'
      '    else'
      '       begin'
      '          Memo15.Font.Color := clBlack;  '
      '          Memo16.Font.Color := clBlack;  '
      '          Memo18.Font.Color := clBlack;  '
      '          Memo19.Font.Color := clBlack;  '
      '          Memo21.Font.Color := clBlack;  '
      '          Memo20.Font.Color := clBlack;           '
      '       end;'
      '    if <ITENS."VENDA_CANCELADA"> = 1 then'
      '       begin'
      '          Memo15.Font.Color := clGray;  '
      '          Memo16.Font.Color := clGray;  '
      '          Memo18.Font.Color := clGray;  '
      '          Memo19.Font.Color := clGray;  '
      '          Memo21.Font.Color := clGray;  '
      '          Memo20.Font.Color := clGray;           '
      '       end;                 '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 328
    Top = 248
    Datasets = <
      item
        DataSet = frxFormas
        DataSetName = 'FORMAS'
      end
      item
        DataSet = frxFormasVendas
        DataSetName = 'FORMASVENDAS'
      end
      item
        DataSet = frxItens
        DataSetName = 'ITENS'
      end
      item
        DataSet = frxVendas
        DataSetName = 'VENDAS'
      end>
    Variables = <
      item
        Name = ' MINHAS'
        Value = Null
      end
      item
        Name = 'EMPRESA'
        Value = ''
      end
      item
        Name = 'DATAINI'
        Value = ''
      end
      item
        Name = 'DATAFIM'
        Value = ''
      end
      item
        Name = 'CAIXA'
        Value = ''
      end
      item
        Name = 'OPERADOR'
        Value = ''
      end
      item
        Name = 'CLIENTE'
        Value = ''
      end
      item
        Name = 'TIPO_VENDA'
        Value = ''
      end
      item
        Name = 'VENDEDOR'
        Value = ''
      end
      item
        Name = 'SUBTOTAL'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 45.354360000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxVendas
        DataSetName = 'VENDAS'
        RowCount = 0
        Stretched = True
        object VENDASCOD_VEN: TfrxMemoView
          Left = 2.779530000000000000
          Top = 9.338590000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'COD_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10747904
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[VENDAS."COD_VEN"]')
          ParentFont = False
        end
        object VENDASDATA_VEN: TfrxMemoView
          Left = 68.031540000000000000
          Top = 9.338590000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATA_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10747904
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[VENDAS."DATA_VEN"]')
          ParentFont = False
        end
        object VENDASNOME_CLI: TfrxMemoView
          Left = 154.960730000000000000
          Top = 9.338590000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NOME_CLI'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10747904
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[VENDAS."NOME_CLI"]')
          ParentFont = False
        end
        object VENDASNOME_TPV: TfrxMemoView
          Left = 446.984540000000000000
          Top = 9.338590000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NOME_TPV'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10747904
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[VENDAS."NOME_TPV"]')
          ParentFont = False
        end
        object VENDASTOTAL_VEN: TfrxMemoView
          Left = 619.504330000000000000
          Top = 9.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TOTAL_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10747904
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[VENDAS."TOTAL_VEN"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Top = 30.236240000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd Prod.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 96.826840000000000000
          Top = 30.236240000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quant')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 465.984540000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 632.638220000000000000
          Top = 30.236240000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 551.457020000000000000
          Top = 30.236240000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 5.000000000000000000
          Top = 3.779530000000000000
          Width = 706.772110000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.007874020000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = frxItens
        DataSetName = 'ITENS'
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          Left = 22.677180000000000000
          Top = 0.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'COD_PRO'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENS."COD_PRO"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 96.826840000000000000
          Top = 0.779530000000000000
          Width = 294.803340000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NOME_PRO'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENS."NOME_PRO"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 400.630180000000000000
          Top = 0.779530000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'QUANT'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ITENS."QUANT"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 465.984540000000000000
          Top = 0.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'VALOR'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ITENS."VALOR"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 632.638220000000000000
          Top = 0.779530000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'TOTAL'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ITENS."TOTAL"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 551.457020000000000000
          Top = 0.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DESCONTO'
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ITENS."DESCONTO"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        DataSet = frxFormas
        DataSetName = 'FORMAS'
        RowCount = 0
        object FORMASforma: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'forma'
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[FORMAS."forma"]')
          ParentFont = False
        end
        object FORMASvalor: TfrxMemoView
          Left = 502.677490000000000000
          Top = 0.779530000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor'
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          HAlign = haRight
          Memo.UTF8W = (
            '[FORMAS."valor"]')
        end
      end
      object Header1: TfrxHeader
        Height = 34.015770000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Shape2: TfrxShapeView
          Left = 3.779530000000000000
          Top = 12.000000000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 13.779530000000000000
          Width = 702.992580000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAIS')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 34.015770000000000000
        Top = 472.441250000000000000
        Width = 718.110700000000000000
        object Shape3: TfrxShapeView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 8.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Subtotal :')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 498.897960000000000000
          Top = 8.000000000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUBTOTAL]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object EMPRESA: TfrxMemoView
          Left = 10.559060000000000000
          Top = 3.000000000000000000
          Width = 536.693260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[EMPRESA]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Left = 9.779530000000000000
          Top = 23.897650000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31303234307D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382052
            656C61745C27663372696F2064652056656E646173207065725C2765646F646F
            206465205C6230205B44415441494E495D205C625C276530205C6230205B4441
            544146494D5D5C667331365C7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          Left = 11.559060000000000000
          Top = 46.574830000000000000
          Width = 695.433520000000000000
          Height = 34.015770000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31303234307D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382043
            61697861203D5C623020205B43414958415D20202020202020202020205C6220
            4F70657261646F72203D5C623020205B4F50455241444F525D205C7061720D0A
            5C6220436C69656E7465203D205C6230205B434C49454E54455D202020202020
            202020205C62205469706F2056656E6461203D205C6230205B5449504F5F5645
            4E44415D20205C622056656E6465646F72205C6230203D205B56454E4445444F
            525D5C667331365C7061720D0A7D0D0A00}
        end
        object Memo1: TfrxMemoView
          Left = 559.677490000000000000
          Top = 5.000000000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o :')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 628.401980000000000000
          Top = 5.000000000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 4.000000000000000000
          Top = 84.370130000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo3: TfrxMemoView
          Left = 9.559060000000000000
          Top = 85.370130000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 73.370130000000000000
          Top = 86.149660000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 159.299320000000000000
          Top = 86.149660000000000000
          Width = 287.244280000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 450.205010000000000000
          Top = 86.149660000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de Venda')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 628.622450000000000000
          Top = 86.149660000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 566.929500000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 634.520100000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 565.929500000000000000
          Top = 4.338590000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina :')
          ParentFont = False
        end
      end
      object DetailData2: TfrxDetailData
        Height = 15.118120000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSet = frxFormasVendas
        DataSetName = 'FORMASVENDAS'
        RowCount = 0
        object Memo23: TfrxMemoView
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'VALOR'
          DataSet = frxFormasVendas
          DataSetName = 'FORMASVENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FORMASVENDAS."VALOR"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 404.409710000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxFormasVendas
          DataSetName = 'FORMASVENDAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[FORMASVENDAS."DESCRICAO"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 15.118120000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
        end
        object Memo25: TfrxMemoView
          Left = 1.000000000000000000
          Top = 1.000000000000000000
          Width = 714.331170000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxItens
          DataSetName = 'ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'FORMAS DE PAGAMENTO DA VENDA')
          ParentFont = False
        end
      end
    end
  end
  object frxVendas: TfrxDBDataset
    UserName = 'VENDAS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VEN=COD_VEN'
      'DATA_VEN=DATA_VEN'
      'COD_EMP=COD_EMP'
      'TOTAL_VEN=TOTAL_VEN'
      'NOME_CLI=NOME_CLI'
      'NOME_TPV=NOME_TPV'
      'CANCELADA_VEN=CANCELADA_VEN')
    DataSet = QRelVendas
    BCDToCurrency = False
    Left = 264
    Top = 256
  end
  object frxItens: TfrxDBDataset
    UserName = 'ITENS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VEN=COD_VEN'
      'COD_PRO=COD_PRO'
      'ORDEM=ORDEM'
      'DESCONTO=DESCONTO'
      'COD_EMP=COD_EMP'
      'QUANT=QUANT'
      'VALOR=VALOR'
      'VALOR_CUSTO=VALOR_CUSTO'
      'PRODUTO_PROMOCAO=PRODUTO_PROMOCAO'
      'CANCELADO=CANCELADO'
      'VENDA_CANCELADA=VENDA_CANCELADA'
      'COD_VEND=COD_VEND'
      'STATUS_EXPORTA=STATUS_EXPORTA'
      'NOME_PRO=NOME_PRO'
      'UNID=UNID'
      'TOTAL=TOTAL')
    DataSet = QRelItens
    BCDToCurrency = False
    Left = 192
    Top = 264
  end
  object QRelItens: TFDQuery
    OnCalcFields = QRelItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select I.*, P.nome_pro, U.descricao UNID from ITENS_VENDA I'
      'inner join PRODUTO P'
      'on ( P.cod_pro = I.cod_pro )'
      'inner join unidade_medida U'
      'on ( U.codigo = P.codigo_unidade_saida )'
      'where COD_VEN=:COD_VEN and COD_EMP=:COD_EMP')
    Left = 120
    Top = 232
    ParamData = <
      item
        Name = 'COD_VEN'
      end
      item
        Name = 'COD_EMP'
      end>
    object QRelItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"ITENS_VENDA"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QRelItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRelItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_VENDA"."DESCONTO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object QRelItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_VENDA"."COD_EMP"'
      Required = True
    end
    object QRelItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      DisplayFormat = '0.000'
      Precision = 18
      Size = 3
    end
    object QRelItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_VENDA"."VALOR"'
      Required = True
      currency = True
      Precision = 18
      Size = 3
    end
    object QRelItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = '"ITENS_VENDA"."VALOR_CUSTO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object QRelItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_VENDA"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_VENDA"."CANCELADO"'
      Required = True
    end
    object QRelItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = '"ITENS_VENDA"."VENDA_CANCELADA"'
      Required = True
    end
    object QRelItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ITENS_VENDA"."COD_VEND"'
      Required = True
    end
    object QRelItensSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_VENDA"."STATUS_EXPORTA"'
    end
    object QRelItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QRelItensUNID: TStringField
      FieldName = 'UNID'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QRelItensTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
  end
  object frxRichObject1: TfrxRichObject
    Left = 72
    Top = 272
  end
  object QVendedor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from vendedor')
    Left = 144
    Top = 304
    object QVendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDEDOR"."COD_VEND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendedorNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = '"VENDEDOR"."NOME_VEND"'
      Required = True
      Size = 50
    end
    object QVendedorATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Origin = '"VENDEDOR"."ATIVO_VEND"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QVendedorCOMISSAO_VEND: TBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = '"VENDEDOR"."COMISSAO_VEND"'
      Precision = 18
      Size = 2
    end
  end
  object QRomaneio: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'select i.cod_pro, p.desc_cupom, sum (i.quant ) from itens_venda ' +
        'i'
      'inner join vendas v'
      'on ( v.cod_ven = I.cod_ven )'
      'inner join produto p'
      'on ( p.cod_pro = i.cod_pro )'
      'inner join cliente cli'
      'on ( cli.cod_cli = v.cod_cli )'
      
        'where v.data_ven between :dataini and :datafim and v.cod_emp = :' +
        'cod_emp and cli.cidres_cli like :cidade group by i.cod_pro, p.de' +
        'sc_cupom')
    Left = 296
    Top = 320
    ParamData = <
      item
        Name = 'dataini'
      end
      item
        Name = 'datafim'
      end
      item
        Name = 'cod_emp'
      end
      item
        Name = 'cidade'
      end>
    object QRomaneioCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QRomaneioDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QRomaneioSUM: TBCDField
      FieldName = 'SUM'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object RelRomaneio: TfrxReport
    Version = '4.15.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41435.879263356480000000
    ReportOptions.LastChange = 41529.652601180550000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 232
    Top = 320
    Datasets = <
      item
        DataSet = frxQRomaneio
        DataSetName = 'ROMANEIO'
      end>
    Variables = <
      item
        Name = ' CABE'#199'ALHO'
        Value = Null
      end
      item
        Name = 'DATAINI'
        Value = ''
      end
      item
        Name = 'DATAFIM'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Romaneio de Carga')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 706.772110000000000000
          Height = 22.677180000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31303234307D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667332342050
            65725C2765646F646F206465205C6230205B44415441494E495D205C625C2765
            30205C6230205B4441544146494D5D5C667331365C7061720D0A7D0D0A00}
        end
        object Shape1: TfrxShapeView
          Left = 3.677180000000000000
          Top = 64.252010000000000000
          Width = 710.551640000000000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object Memo2: TfrxMemoView
          Left = 14.015770000000000000
          Top = 67.252010000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd Prod.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 117.165430000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 604.724800000000000000
          Top = 68.031540000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quant Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = frxQRomaneio
        DataSetName = 'ROMANEIO'
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 117.165430000000000000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESC_CUPOM'
          DataSet = frxQRomaneio
          DataSetName = 'ROMANEIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ROMANEIO."DESC_CUPOM"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 600.945270000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SUM'
          DataSet = frxQRomaneio
          DataSetName = 'ROMANEIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ROMANEIO."SUM"]')
          ParentFont = False
        end
        object ROMANEIOCOD_PRO: TfrxMemoView
          Left = 9.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'COD_PRO'
          DataSet = frxQRomaneio
          DataSetName = 'ROMANEIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ROMANEIO."COD_PRO"]')
          ParentFont = False
        end
      end
    end
  end
  object frxQRomaneio: TfrxDBDataset
    UserName = 'ROMANEIO'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRO=COD_PRO'
      'DESC_CUPOM=DESC_CUPOM'
      'SUM=SUM')
    DataSet = QRomaneio
    BCDToCurrency = False
    Left = 376
    Top = 336
  end
  object Qdvendas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 160
    object Qdvendascod_venda: TIntegerField
      FieldName = 'cod_venda'
    end
  end
  object dsQdVendas: TDataSource
    DataSet = Qdvendas
    Left = 448
    Top = 208
  end
  object cdsFormas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsFormasIndex1'
        Fields = 'valor'
      end>
    IndexName = 'cdsFormasIndex1'
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 280
    object cdsFormasforma: TStringField
      FieldName = 'forma'
      Size = 200
    end
    object cdsFormasvalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object frxFormas: TfrxDBDataset
    UserName = 'FORMAS'
    CloseDataSource = False
    DataSet = cdsFormas
    BCDToCurrency = False
    Left = 392
    Top = 216
  end
  object RelSimples: TfrxReport
    Version = '4.15.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41370.374426620400000000
    ReportOptions.LastChange = 41776.333087037030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <VENDAS."CANCELADA_VEN"> = 1 then'
      '      begin'
      
        '         VENDASCOD_VEN.Font.Color := clRed;                     ' +
        '                       '
      '         VENDASDATA_VEN.Font.Color := clRed;  '
      '         VENDASNOME_CLI.Font.Color := clRed;  '
      '         VENDASNOME_TPV.Font.Color := clRed;  '
      
        '         VENDASTOTAL_VEN.Font.Color := clRed;                   ' +
        '                       '
      '      end'
      '   else'
      '      begin'
      
        '         VENDASCOD_VEN.Font.Color := clBlack;                   ' +
        '                         '
      '         VENDASDATA_VEN.Font.Color := clBlack;  '
      '         VENDASNOME_CLI.Font.Color := clBlack;  '
      '         VENDASNOME_TPV.Font.Color := clBlack;  '
      '         VENDASTOTAL_VEN.Font.Color := clBlack;          '
      '      end;                '
      'end;'
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 320
    Top = 208
    Datasets = <
      item
        DataSet = frxFormas
        DataSetName = 'FORMAS'
      end
      item
        DataSet = frxVendas
        DataSetName = 'VENDAS'
      end>
    Variables = <
      item
        Name = ' MINHAS'
        Value = Null
      end
      item
        Name = 'EMPRESA'
        Value = Null
      end
      item
        Name = 'DATAINI'
        Value = Null
      end
      item
        Name = 'DATAFIM'
        Value = Null
      end
      item
        Name = 'CAIXA'
        Value = Null
      end
      item
        Name = 'OPERADOR'
        Value = Null
      end
      item
        Name = 'CLIENTE'
        Value = Null
      end
      item
        Name = 'TIPO_VENDA'
        Value = Null
      end
      item
        Name = 'VENDEDOR'
        Value = Null
      end
      item
        Name = 'SUBTOTAL'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxVendas
        DataSetName = 'VENDAS'
        RowCount = 0
        Stretched = True
        object VENDASCOD_VEN: TfrxMemoView
          Left = 2.779530000000000000
          Top = 2.338590000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'COD_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[VENDAS."COD_VEN"]')
          ParentFont = False
        end
        object VENDASDATA_VEN: TfrxMemoView
          Left = 68.031540000000000000
          Top = 2.338590000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'DATA_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[VENDAS."DATA_VEN"]')
          ParentFont = False
        end
        object VENDASNOME_CLI: TfrxMemoView
          Left = 154.960730000000000000
          Top = 2.338590000000000000
          Width = 287.244280000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NOME_CLI'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[VENDAS."NOME_CLI"]')
          ParentFont = False
        end
        object VENDASNOME_TPV: TfrxMemoView
          Left = 446.984540000000000000
          Top = 2.338590000000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NOME_TPV'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[VENDAS."NOME_TPV"]')
          ParentFont = False
        end
        object VENDASTOTAL_VEN: TfrxMemoView
          Left = 619.504330000000000000
          Top = 2.338590000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'TOTAL_VEN'
          DataSet = frxVendas
          DataSetName = 'VENDAS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VENDAS."TOTAL_VEN"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        DataSet = frxFormas
        DataSetName = 'FORMAS'
        RowCount = 0
        object FORMASforma: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'forma'
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[FORMAS."forma"]')
          ParentFont = False
        end
        object FORMASvalor: TfrxMemoView
          Left = 502.677490000000000000
          Top = 0.779530000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'valor'
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          HAlign = haRight
          Memo.UTF8W = (
            '[FORMAS."valor"]')
        end
      end
      object Header1: TfrxHeader
        Height = 34.015770000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object Shape2: TfrxShapeView
          Left = 3.779530000000000000
          Top = 12.000000000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 13.779530000000000000
          Width = 702.992580000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAIS')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 37.795300000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Shape3: TfrxShapeView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 8.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Subtotal :')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 498.897960000000000000
          Top = 8.000000000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxFormas
          DataSetName = 'FORMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUBTOTAL]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object EMPRESA: TfrxMemoView
          Left = 10.559060000000000000
          Top = 2.779530000000000000
          Width = 536.693260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[EMPRESA]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Left = 9.779530000000000000
          Top = 23.677180000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31303234307D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382052
            656C61745C27663372696F2064652056656E646173207065725C2765646F646F
            206465205C6230205B44415441494E495D205C625C276530205C6230205B4441
            544146494D5D5C667331365C7061720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          Left = 11.559060000000000000
          Top = 46.354360000000000000
          Width = 695.433520000000000000
          Height = 34.015770000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31303234307D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382043
            61697861203D5C623020205B43414958415D20202020202020202020205C6220
            4F70657261646F72203D5C623020205B4F50455241444F525D205C7061720D0A
            5C6220436C69656E7465203D205C6230205B434C49454E54455D202020202020
            202020205C62205469706F2056656E6461203D205C6230205B5449504F5F5645
            4E44415D20205C622056656E6465646F72205C6230203D205B56454E4445444F
            525D5C667331365C7061720D0A7D0D0A00}
        end
        object Memo1: TfrxMemoView
          Left = 559.677490000000000000
          Top = 4.779530000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o :')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 628.401980000000000000
          Top = 4.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 4.000000000000000000
          Top = 84.149660000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clSilver
        end
        object Memo3: TfrxMemoView
          Left = 9.559060000000000000
          Top = 85.149660000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 73.370130000000000000
          Top = 85.929190000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 159.299320000000000000
          Top = 85.929190000000000000
          Width = 287.244280000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 450.205010000000000000
          Top = 85.929190000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de Venda')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 628.622450000000000000
          Top = 85.929190000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 634.740570000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 566.149970000000000000
          Top = 4.338590000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina :')
          ParentFont = False
        end
      end
    end
  end
  object QFormasVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select F.*, FF.DESCRICAO from VENDAS_FORMAS_PAGAMENTO F'
      'inner join FORMAS_PAGAMENTO FF'
      'on ( FF.CODIGO = F.COD_FORMa )'
      'where cod_venda=:cod_venda')
    Left = 264
    Top = 104
    ParamData = <
      item
        Name = 'cod_venda'
      end>
    object QFormasVendasCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."COD_VENDA"'
      Required = True
    end
    object QFormasVendasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."COD_FORMA"'
      Required = True
    end
    object QFormasVendasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"VENDAS_FORMAS_PAGAMENTO"."VALOR"'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QFormasVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"FORMAS_PAGAMENTO"."DESCRICAO"'
      Required = True
    end
  end
  object frxFormasVendas: TfrxDBDataset
    UserName = 'FORMASVENDAS'
    CloseDataSource = False
    DataSet = QFormasVendas
    BCDToCurrency = False
    Left = 360
    Top = 72
  end
end
