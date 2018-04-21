object FrmConsOrcamento: TFrmConsOrcamento
  Left = 283
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Or'#231'amento'
  ClientHeight = 431
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 412
    Width = 661
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Sair'
        Width = 130
      end
      item
        Text = '[F10] Menu Fiscal'
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 661
    Height = 250
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 661
      Height = 250
      Align = alClient
      DataSource = DSQOrcamento
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWindow
          Expanded = False
          FieldName = 'SEQUENCIA_DAV'
          Title.Alignment = taCenter
          Title.Caption = 'SEQU'#202'NCIA'
          Width = 71
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'CALC_STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 84
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO VENDA'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'COO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'COO VENDA'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 2
    object GB1: TGroupBox
      Left = 8
      Top = 8
      Width = 449
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'DATA'
          'OR'#199'AMENTO EM ABERTO')
      end
    end
    object GB2: TGroupBox
      Left = 8
      Top = 64
      Width = 449
      Height = 49
      Caption = 'Chave da Consulta'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtCons: TEdit
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyPress = EdtConsKeyPress
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.713713645800000000
        Time = 40196.713713645800000000
        TabOrder = 1
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.713713645800000000
        Time = 40196.713713645800000000
        TabOrder = 2
      end
    end
    object BtnOk: TButton
      Left = 514
      Top = 36
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 514
      Top = 76
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 371
    Width = 661
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 488
      Top = 8
      Width = 163
      Height = 25
      Caption = 'Imprimir DAV'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object IBTRConsOrcamento: TFDTransaction
    Connection = DM.IBDatabase
    Left = 64
    Top = 208
  end
  object QConsOrcamento: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsOrcamento
    OnCalcFields = QConsOrcamentoCalcFields
    SQL.Strings = (
      
        'SELECT O.*, C.NOME_CLI, T.NOME_TPV, V.NOME_VEND, C.ENDRES_CLI, C' +
        '.cnpj_cli, E.razao_emp, E.cnpj_emp'
      'FROM ORCAMENTO O'
      'INNER JOIN CLIENTE C'
      'ON (O.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (O.COD_TPV = T.COD_TPV)'
      'INNER JOIN VENDEDOR V'
      'ON (O.COD_VEND = V.COD_VEND)'
      'inner JOIN EMPRESA E'
      'ON ( E.cod_emp = O.cod_emp )')
    Left = 168
    Top = 208
    object QConsOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ORCAMENTO"."CODIGO"'
      Required = True
    end
    object QConsOrcamentoSEQUENCIA_DAV: TLargeintField
      FieldName = 'SEQUENCIA_DAV'
      Origin = '"ORCAMENTO"."SEQUENCIA_DAV"'
      Required = True
    end
    object QConsOrcamentoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ORCAMENTO"."COD_EMP"'
      Required = True
    end
    object QConsOrcamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"ORCAMENTO"."DATA"'
      Required = True
    end
    object QConsOrcamentoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"ORCAMENTO"."COD_CLI"'
      Required = True
    end
    object QConsOrcamentoCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"ORCAMENTO"."COD_TPV"'
      Required = True
    end
    object QConsOrcamentoCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ORCAMENTO"."COD_VEND"'
      Required = True
    end
    object QConsOrcamentoTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = '"ORCAMENTO"."TOTAL"'
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QConsOrcamentoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = '"ORCAMENTO"."STATUS"'
      Required = True
    end
    object QConsOrcamentoCOO: TIntegerField
      FieldName = 'COO'
      Origin = '"ORCAMENTO"."COO"'
    end
    object QConsOrcamentoCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = '"ORCAMENTO"."COO_VENDA"'
    end
    object QConsOrcamentoCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"ORCAMENTO"."COD_CAI"'
      Required = True
    end
    object QConsOrcamentoCCF_VENDA: TIntegerField
      FieldName = 'CCF_VENDA'
      Origin = '"ORCAMENTO"."CCF_VENDA"'
    end
    object QConsOrcamentoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QConsOrcamentoNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = '"TIPO_VENDA"."NOME_TPV"'
      Required = True
      Size = 50
    end
    object QConsOrcamentoNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = '"VENDEDOR"."NOME_VEND"'
      Required = True
      Size = 50
    end
    object QConsOrcamentoENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QConsOrcamentoCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 50
      Calculated = True
    end
    object QConsOrcamentoCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QConsOrcamentoRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = '"EMPRESA"."RAZAO_EMP"'
      Required = True
      Size = 50
    end
    object QConsOrcamentoCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = '"EMPRESA"."CNPJ_EMP"'
      Size = 14
    end
    object QConsOrcamentoSEQ_PROC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SEQ_PROC'
      Size = 14
      Calculated = True
    end
  end
  object DSQOrcamento: TDataSource
    AutoEdit = False
    DataSet = QConsOrcamento
    Left = 176
    Top = 264
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsOrcamento
    OnCalcFields = QBuscaItensCalcFields
    SQL.Strings = (
      
        'SELECT I.*, P.NOME_PRO, P.DESC_CUPOM, U.DESCRICAO, P.codigo_barr' +
        'a_pro'
      'FROM ITENS_ORCAMENTO I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.CODIGO = :COD'
      'ORDER BY I.ORDEM')
    Left = 344
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD'
        ParamType = ptUnknown
      end>
    object QBuscaItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ITENS_ORCAMENTO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_ORCAMENTO"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_ORCAMENTO"."COD_PRO"'
      Required = True
    end
    object QBuscaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_ORCAMENTO"."DESCONTO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_ORCAMENTO"."COD_EMP"'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_ORCAMENTO"."QUANT"'
      Required = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_ORCAMENTO"."VALOR"'
      Required = True
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 3
    end
    object QBuscaItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_ORCAMENTO"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_ORCAMENTO"."CANCELADO"'
      Required = True
    end
    object QBuscaItensCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = '"ITENS_ORCAMENTO"."CHAVE"'
      Size = 100
    end
    object QBuscaItensDATA_INCLUSAO: TDateField
      FieldName = 'DATA_INCLUSAO'
      Origin = '"ITENS_ORCAMENTO"."DATA_INCLUSAO"'
    end
    object QBuscaItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QBuscaItensDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Required = True
      Size = 80
    end
    object QBuscaItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QBuscaItensCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = '"PRODUTO"."CODIGO_BARRA_PRO"'
      Required = True
      Size = 14
    end
    object QBuscaItensSUB_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SUB_TOTAL'
      DisplayFormat = 'R$ 0.00'
      Calculated = True
    end
    object QBuscaItensSTATUS2: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS2'
      Calculated = True
    end
  end
  object QConsulta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsOrcamento
    Left = 320
    Top = 216
  end
  object RelatorioDAV: TfrxReport
    Tag = 1
    Version = '4.12.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'DAV'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40368.383915983800000000
    ReportOptions.LastChange = 41184.620159791670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '//var'
      '  //S : String;                                     '
      'begin'
      '     {  dav.open;'
      '       IF <DAV."TIPO"> = '#39'PD'#39' THEN'
      '         mmTipo.text := '#39'DOCUMENTO AUXILIAR DE VENDA - PEDIDO'#39';'
      '       IF <DAV."TIPO"> = '#39'CC'#39' THEN'
      
        '         mmTipo.text := '#39'DOCUMENTO AUXILIAR DE VENDA - CONSIGNA'#199 +
        #195'O'#39';'
      '       IF <DAV."TIPO"> = '#39'OC'#39' THEN'
      
        '         mmTipo.text := '#39'DOCUMENTO AUXILIAR DE VENDA - OR'#199'AMENTO' +
        #39';'
      '                                            }  '
      
        '    {  S := inttostr(<DAVITEM."SEQUENCIA_DAV">);                ' +
        '      '
      '      while (length(S) < 10) do'
      '        S := '#39'0'#39' + S;'
      
        '      mmDocumento.text := '#39'N'#186' do Documento: '#39' + S;}             ' +
        '                                           '
      'end.  ')
    Left = 472
    Top = 224
    Datasets = <
      item
        DataSet = DAV
        DataSetName = 'DAV'
      end
      item
        DataSet = DAVItem
        DataSetName = 'DAVITEM'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 256
      LeftMargin = 15.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 166.299320000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object mmTipo: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTO AUXILIAR DE VENDA - OR'#199'AMENTO')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              'N'#195'O '#201' DOCUMENTO FISCAL - N'#195'O '#201' V'#193'LIDO COMO RECIBO E COMO GARANTI' +
              'A DE MERCADORIA - N'#195'O COMPROVA PAGAMENTO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Top = 52.913420000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Identifica'#231#227'o do Estabelecimento Emitente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 71.811070000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Denomina'#231#227'o: [DAV."RAZAO_EMP"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baWidth
          Top = 90.708720000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Identifica'#231#227'o do Destinat'#225'rio')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 359.055350000000000000
          Top = 71.811070000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'CNPJ: [DAV."CNPJ_EMP"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Top = 109.606370000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Nome: [DAV."NOME_CLI"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 359.055350000000000000
          Top = 109.606370000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'CNPJ/CPF: [DAV."CNPJ_CLI"]')
          ParentFont = False
        end
        object mmDocumento: TfrxMemoView
          Align = baLeft
          Top = 128.504020000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'N'#186' do Documento: [DAV."SEQ_PROC"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Left = 317.480520000000000000
          Top = 128.504020000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'N'#186' do Documento Fiscal:___________')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          Top = 147.401670000000000000
          Width = 49.133828980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baWidth
          Left = 49.133828980000000000
          Top = 147.401670000000000000
          Width = 257.008284080000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 306.142113060000000000
          Top = 147.401670000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vlr Unit'#225'rio')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 400.630363060000000000
          Top = 147.401670000000000000
          Width = 90.708658980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Qtde')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baRight
          Left = 491.339022040000000000
          Top = 147.401670000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Vlr Total')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 585.827211020000000000
          Top = 147.401670000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Ind. Canc.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 680.315400000000000000
        DataSet = DAVItem
        DataSetName = 'DAVITEM'
        RowCount = 0
        object Line1: TfrxLineView
          Left = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 491.338900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 0.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 680.535870000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object DAVITEMORDEM: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ORDEM'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          Memo.UTF8W = (
            '[DAVITEM."ORDEM"]')
        end
        object DAVITEMDESC_CUPOM: TfrxMemoView
          Left = 49.133890000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESC_CUPOM'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          Memo.UTF8W = (
            '[DAVITEM."DESC_CUPOM"]')
        end
        object DAVITEMVALOR: TfrxMemoView
          Left = 308.141930000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VALOR'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          HAlign = haRight
          Memo.UTF8W = (
            '[DAVITEM."VALOR"]')
        end
        object DAVITEMQUANT: TfrxMemoView
          Left = 401.630180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QUANT'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          HAlign = haRight
          Memo.UTF8W = (
            '[DAVITEM."QUANT"]')
        end
        object DAVITEMSUB_TOTAL: TfrxMemoView
          Left = 492.338900000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SUB_TOTAL'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          HAlign = haRight
          Memo.UTF8W = (
            '[DAVITEM."SUB_TOTAL"]')
        end
        object DAVITEMSTATUS2: TfrxMemoView
          Left = 585.827150000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'STATUS2'
          DataSet = DAVItem
          DataSetName = 'DAVITEM'
          HAlign = haRight
          Memo.UTF8W = (
            '[DAVITEM."STATUS2"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 442.205010000000000000
        Width = 680.315400000000000000
        object Memo25: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #201' VEDADA A AUTENTICA'#199#195'O DESTE DOCUMENTO')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 94.488250000000000000
        Top = 287.244280000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Itens: ')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baWidth
          Top = 22.677180000000000000
          Width = 680.315400000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Observa'#231#227'o: ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 173.858380000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT( Masterdata1 )]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 470.764070000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Total : ')
          ParentFont = False
        end
        object DAVTOTAL: TfrxMemoView
          Left = 569.472790000000000000
          Top = 3.779530000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TOTAL'
          DataSet = DAV
          DataSetName = 'DAV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DAV."TOTAL"]')
          ParentFont = False
        end
      end
    end
  end
  object DAVItem: TfrxDBDataset
    UserName = 'DAVITEM'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'ORDEM=ORDEM'
      'COD_PRO=COD_PRO'
      'DESCONTO=DESCONTO'
      'COD_EMP=COD_EMP'
      'QUANT=QUANT'
      'VALOR=VALOR'
      'PRODUTO_PROMOCAO=PRODUTO_PROMOCAO'
      'CANCELADO=CANCELADO'
      'CHAVE=CHAVE'
      'DATA_INCLUSAO=DATA_INCLUSAO'
      'NOME_PRO=NOME_PRO'
      'DESC_CUPOM=DESC_CUPOM'
      'DESCRICAO=DESCRICAO'
      'CODIGO_BARRA_PRO=CODIGO_BARRA_PRO'
      'SUB_TOTAL=SUB_TOTAL'
      'STATUS2=STATUS2')
    DataSet = QBuscaItens
    BCDToCurrency = False
    Left = 536
    Top = 208
  end
  object DAV: TfrxDBDataset
    UserName = 'DAV'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'SEQUENCIA_DAV=SEQUENCIA_DAV'
      'COD_EMP=COD_EMP'
      'DATA=DATA'
      'COD_CLI=COD_CLI'
      'COD_TPV=COD_TPV'
      'COD_VEND=COD_VEND'
      'TOTAL=TOTAL'
      'STATUS=STATUS'
      'COO=COO'
      'COO_VENDA=COO_VENDA'
      'COD_CAI=COD_CAI'
      'CCF_VENDA=CCF_VENDA'
      'NOME_CLI=NOME_CLI'
      'NOME_TPV=NOME_TPV'
      'NOME_VEND=NOME_VEND'
      'ENDRES_CLI=ENDRES_CLI'
      'CALC_STATUS=CALC_STATUS'
      'CNPJ_CLI=CNPJ_CLI'
      'RAZAO_EMP=RAZAO_EMP'
      'CNPJ_EMP=CNPJ_EMP'
      'SEQ_PROC=SEQ_PROC')
    DataSet = QConsOrcamento
    BCDToCurrency = False
    Left = 536
    Top = 264
  end
  object DataSource1: TDataSource
    Left = 424
    Top = 168
  end
end
