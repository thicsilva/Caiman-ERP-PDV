object FrmConsOrdemServico: TFrmConsOrdemServico
  Left = 292
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Ordem de Servi'#231'o'
  ClientHeight = 494
  ClientWidth = 667
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 475
    Width = 667
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
    Width = 667
    Height = 354
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 663
      Height = 350
      Align = alClient
      Color = clGradientInactiveCaption
      DataSource = DSOS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'SEQUENCIA_DAV'
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
          FieldName = 'DATA_ABERTURA'
          Title.Alignment = taCenter
          Title.Caption = 'DATA ABERTURA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 283
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO VENDA'
          Width = 111
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'COO VENDA'
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 121
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
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
          'DATA ABERTURA'
          'DATA FECHAMENTO')
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
  object QOS: TFDQuery
    OnCalcFields = QOSCalcFields
    SQL.Strings = (
      'SELECT O.*, C.NOME_CLI, T.NOME_TPV'
      'FROM ORDEM_SERVICO O'
      'INNER JOIN CLIENTE C'
      'ON (O.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (O.COD_TPV = T.COD_TPV)')
    Left = 208
    Top = 232
    object QOSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ORDEM_SERVICO.CODIGO'
      Required = True
    end
    object QOSSEQUENCIA_DAV: TLargeintField
      FieldName = 'SEQUENCIA_DAV'
      Origin = 'ORDEM_SERVICO.SEQUENCIA_DAV'
      Required = True
    end
    object QOSDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'ORDEM_SERVICO.DATA_ABERTURA'
      Required = True
    end
    object QOSDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'ORDEM_SERVICO.DATA_FECHAMENTO'
    end
    object QOSCODIGO_MARCA: TIntegerField
      FieldName = 'CODIGO_MARCA'
      Origin = 'ORDEM_SERVICO.CODIGO_MARCA'
      Required = True
    end
    object QOSCODIGO_MODELO: TIntegerField
      FieldName = 'CODIGO_MODELO'
      Origin = 'ORDEM_SERVICO.CODIGO_MODELO'
      Required = True
    end
    object QOSANO_FABRICACAO: TIntegerField
      FieldName = 'ANO_FABRICACAO'
      Origin = 'ORDEM_SERVICO.ANO_FABRICACAO'
    end
    object QOSPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'ORDEM_SERVICO.PLACA'
      FixedChar = True
      Size = 8
    end
    object QOSRENAVAM: TStringField
      FieldName = 'RENAVAM'
      Origin = 'ORDEM_SERVICO.RENAVAM'
    end
    object QOSCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'ORDEM_SERVICO.COD_CLI'
      Required = True
    end
    object QOSCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'ORDEM_SERVICO.COD_TPV'
      Required = True
    end
    object QOSNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Origin = 'ORDEM_SERVICO.NUMERO_SERIE'
      Size = 30
    end
    object QOSCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'ORDEM_SERVICO.COD_CAI'
      Required = True
    end
    object QOSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ORDEM_SERVICO.COD_EMP'
      Required = True
    end
    object QOSCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'ORDEM_SERVICO.COO'
    end
    object QOSCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = 'ORDEM_SERVICO.COO_VENDA'
    end
    object QOSTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'ORDEM_SERVICO.TOTAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QOSFLAG_TRANSFERIDA: TIntegerField
      FieldName = 'FLAG_TRANSFERIDA'
      Origin = 'ORDEM_SERVICO.FLAG_TRANSFERIDA'
      Required = True
    end
    object QOSNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QOSNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QOSCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 30
      Calculated = True
    end
  end
  object DSOS: TDataSource
    AutoEdit = False
    DataSet = QOS
    Left = 208
    Top = 288
  end
end
