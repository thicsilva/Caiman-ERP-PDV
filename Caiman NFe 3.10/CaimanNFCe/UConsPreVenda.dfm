object FrmConsPreVenda: TFrmConsPreVenda
  Left = 391
  Top = 324
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Pr'#233'-Venda'
  ClientHeight = 447
  ClientWidth = 657
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
    Width = 657
    Height = 121
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
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
          'PRE-VENDA EM ABERTO')
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
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 657
    Height = 307
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 653
      Height = 271
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSQConsPre
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'SEQUENCIA_PAF'
          Title.Alignment = taCenter
          Title.Caption = 'SEQU'#202'NCIA'
          Width = 71
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CALC_STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 84
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DATA_PRE'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'HORA_PRE'
          Title.Alignment = taCenter
          Title.Caption = 'HORA'
          Width = 58
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TOTAL_PRE'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 61
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO VENDA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Visible = True
        end>
    end
    object BtnCancelar: TButton
      Left = 268
      Top = 276
      Width = 121
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 428
    Width = 657
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
  object DSQConsPre: TDataSource
    AutoEdit = False
    DataSet = QConsPre
    Left = 208
    Top = 264
  end
  object QConsPre: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRConsPre
    OnCalcFields = QConsPreCalcFields
    SQL.Strings = (
      
        'SELECT P.*, C.NOME_CLI, C.CIDRES_CLI, C.CNPJ_CLI, C.ESTRES_CLI, ' +
        'T.NOME_TPV, V.NOME_VEND'
      'FROM PRE_VENDA P'
      'INNER JOIN CLIENTE C'
      'ON (P.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (P.COD_TPV = T.COD_TPV)'
      'INNER JOIN VENDEDOR V'
      'ON (P.COD_VEND = V.COD_VEND)')
    Left = 136
    Top = 208
    object QConsPreCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = 'PRE_VENDA.COD_PRE'
      Required = True
    end
    object QConsPreDATA_PRE: TDateField
      FieldName = 'DATA_PRE'
      Origin = 'PRE_VENDA.DATA_PRE'
      Required = True
    end
    object QConsPreCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'PRE_VENDA.COD_CLI'
      Required = True
    end
    object QConsPreCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'PRE_VENDA.COD_TPV'
      Required = True
    end
    object QConsPreCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'PRE_VENDA.COD_EMP'
      Required = True
    end
    object QConsPreSTATUS_PRE: TIntegerField
      FieldName = 'STATUS_PRE'
      Origin = 'PRE_VENDA.STATUS_PRE'
      Required = True
    end
    object QConsPreTOTAL_PRE: TBCDField
      FieldName = 'TOTAL_PRE'
      Origin = 'PRE_VENDA.TOTAL_PRE'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsPreHORA_PRE: TTimeField
      FieldName = 'HORA_PRE'
      Origin = 'PRE_VENDA.HORA_PRE'
    end
    object QConsPreCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'PRE_VENDA.COD_VENDA'
    end
    object QConsPreDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'PRE_VENDA.DOCUMENTO'
    end
    object QConsPreOBS_PRE: TStringField
      FieldName = 'OBS_PRE'
      Origin = 'PRE_VENDA.OBS_PRE'
      Size = 500
    end
    object QConsPreDESCONTO_PRE: TBCDField
      FieldName = 'DESCONTO_PRE'
      Origin = 'PRE_VENDA.DESCONTO_PRE'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPreCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'PRE_VENDA.COD_VEND'
      Required = True
    end
    object QConsPreSEQUENCIA_PAF: TLargeintField
      FieldName = 'SEQUENCIA_PAF'
      Origin = 'PRE_VENDA.SEQUENCIA_PAF'
      Required = True
    end
    object QConsPreSENHA_FECHAR_VENDA: TStringField
      FieldName = 'SENHA_FECHAR_VENDA'
      Origin = 'PRE_VENDA.SENHA_FECHAR_VENDA'
    end
    object QConsPreNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsPreNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QConsPreNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'VENDEDOR.NOME_VEND'
      Required = True
      Size = 50
    end
    object QConsPreCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 30
      Calculated = True
    end
    object QConsPreCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QConsPreCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QConsPreESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
  end
  object IBTRConsPre: TFDTransaction
    Connection = DM.IBDatabaseServer
    Left = 64
    Top = 208
  end
  object QItensPreVenda: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      
        'SELECT I.*, P.DESC_CUPOM, P.ICMS_CF_EST,   P.CODIGO_BARRA_PRO, U' +
        '.DESCRICAO'
      'FROM ITENS_PRE_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_PRE = :CODPRE'
      'ORDER BY ORDEM')
    Left = 208
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODPRE'
        ParamType = ptUnknown
      end>
    object QItensPreVendaCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = 'ITENS_PRE_VENDA.COD_PRE'
      Required = True
    end
    object QItensPreVendaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_PRE_VENDA.ORDEM'
      Required = True
    end
    object QItensPreVendaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_PRE_VENDA.COD_PRO'
      Required = True
    end
    object QItensPreVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_PRE_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QItensPreVendaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_PRE_VENDA.COD_EMP'
      Required = True
    end
    object QItensPreVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_PRE_VENDA.QUANT'
      Precision = 18
      Size = 3
    end
    object QItensPreVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_PRE_VENDA.VALOR'
      Precision = 18
      Size = 3
    end
    object QItensPreVendaPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_PRE_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensPreVendaCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_PRE_VENDA.CANCELADO'
      Required = True
    end
    object QItensPreVendaDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'PRODUTO.DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QItensPreVendaICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = 'PRODUTO.ICMS_CF_EST'
      Required = True
    end
    object QItensPreVendaCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QItensPreVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object QBuscaIndice: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT INDICE_ECF'
      'FROM INDICE_ECF'
      
        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :COD' +
        'GRP')
    Left = 288
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODGRP'
        ParamType = ptUnknown
      end>
    object QBuscaIndiceINDICE_ECF: TStringField
      FieldName = 'INDICE_ECF'
      Origin = 'INDICE_ECF.INDICE_ECF'
      Required = True
      Size = 5
    end
  end
end
