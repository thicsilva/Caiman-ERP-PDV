object FrmConsAniversario: TFrmConsAniversario
  Left = 306
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Aniversariantes'
  ClientHeight = 451
  ClientWidth = 563
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 563
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 105
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 208
      Top = 8
      Width = 121
      Height = 89
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 57
        Top = 38
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 12
        Top = 15
        Width = 97
        Height = 21
        Date = 37510.491043391200000000
        Time = 37510.491043391200000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 12
        Top = 55
        Width = 97
        Height = 21
        Date = 37510.491216909700000000
        Time = 37510.491216909700000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 56
      Width = 185
      Height = 41
      Caption = 'Ordenado por'
      TabOrder = 1
      object ComboCons: TComboBox
        Left = 8
        Top = 15
        Width = 169
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'NOME'
          'CODIGO'
          'DATA')
      end
    end
    object BtnOk: TButton
      Left = 393
      Top = 23
      Width = 64
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 393
      Top = 63
      Width = 64
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 41
      Columns = 2
      Items.Strings = (
        'Clientes'
        'Filhos')
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 563
    Height = 327
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object DBGridCliente: TDBGrid
      Left = 2
      Top = 2
      Width = 559
      Height = 287
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DO CLIENTE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NASCIMENTO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NASCIMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TELRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TEL.RES.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TELCOM_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TEL.COM.'
          Visible = True
        end>
    end
    object DBGridFilho: TDBGrid
      Left = 2
      Top = 1
      Width = 559
      Height = 287
      Color = clSilver
      DataSource = DSFilho
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'FILHO'
          Width = 373
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_NASCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'NASCIMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 272
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TELRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TEL. RES.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TELCOM_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TEL.COM.'
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 244
      Top = 295
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_CLI, NOME_CLI, TELRES_CLI, TELCOM_CLI, NASCIMENTO_CLI'
      'FROM CLIENTE'
      'WHERE EXTRACT(DAY FROM NASCIMENTO_CLI)  >= :DIA1  AND'
      '               EXTRACT(DAY FROM NASCIMENTO_CLI) <=  :DIA2  AND'
      '               EXTRACT(MONTH FROM NASCIMENTO_CLI) >= :MES1 AND'
      '               EXTRACT(MONTH FROM NASCIMENTO_CLI) <= :MES2')
    Left = 136
    Top = 200
    ParamData = <
      item
        Name = 'DIA1'
        DataType = ftInteger
      end
      item
        Name = 'DIA2'
        DataType = ftInteger
      end
      item
        Name = 'MES1'
        DataType = ftInteger
      end
      item
        Name = 'MES2'
        DataType = ftInteger
      end>
    object QClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QClienteTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = 'CLIENTE.TELCOM_CLI'
      FixedChar = True
      Size = 13
    end
    object QClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
  end
  object DSCliente: TDataSource
    AutoEdit = False
    DataSet = QCliente
    Left = 136
    Top = 256
  end
  object QFilho: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT F.NOME, F.DATA_NASCIMENTO, C.NOME_CLI, C.COD_CLI, C.TELRE' +
        'S_CLI, C.TELCOM_CLI'
      'FROM FILHOS F'
      'INNER JOIN CLIENTE C'
      'ON (F.COD_CLI = C.COD_CLI)'
      'WHERE EXTRACT(DAY FROM F.DATA_NASCIMENTO)  >= :DIA1  AND'
      
        '               EXTRACT(DAY FROM F.DATA_NASCIMENTO) <=  :DIA2  AN' +
        'D'
      
        '               EXTRACT(MONTH FROM F.DATA_NASCIMENTO) >= :MES1 AN' +
        'D       EXTRACT(MONTH FROM F.DATA_NASCIMENTO) <= :MES2')
    Left = 200
    Top = 200
    ParamData = <
      item
        Name = 'DIA1'
        DataType = ftInteger
      end
      item
        Name = 'DIA2'
        DataType = ftInteger
      end
      item
        Name = 'MES1'
        DataType = ftInteger
      end
      item
        Name = 'MES2'
        DataType = ftInteger
      end>
    object QFilhoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'FILHOS.NOME'
      Required = True
      Size = 80
    end
    object QFilhoDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'FILHOS.DATA_NASCIMENTO'
      Required = True
    end
    object QFilhoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QFilhoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QFilhoTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QFilhoTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = 'CLIENTE.TELCOM_CLI'
      FixedChar = True
      Size = 13
    end
  end
  object DSFilho: TDataSource
    AutoEdit = False
    DataSet = QFilho
    Left = 200
    Top = 256
  end
end
