object FrmConsCli: TFrmConsCli
  Left = 328
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cliente'
  ClientHeight = 434
  ClientWidth = 698
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 201
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 185
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'C'#243'digo'
          'Nome'
          'CPF/CNPJ')
      end
    end
    object GB2: TGroupBox
      Left = 224
      Top = 5
      Width = 337
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyPress = EdtConsKeyPress
      end
    end
    object BtnOk: TButton
      Left = 600
      Top = 18
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 698
    Height = 377
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 380
      Top = 325
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 694
      Height = 319
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSQConsCli
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NOME DO CLIENTE'
          Width = 327
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TIPO_CREDITO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TP'
          Width = 21
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CON'
          Title.Alignment = taCenter
          Title.Caption = 'CONV'#202'NIO'
          Width = 224
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CNPJ_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CPF/CNPJ'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'ENDRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'ENDERE'#199'O RESID'#202'NCIAL'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'BAIRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'BAIRRO '
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TELRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TELEF.RESID'#202'CIAL'
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 252
      Top = 325
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 2
      OnClick = BtnLocalizarClick
    end
    object Panel3: TPanel
      Left = 2
      Top = 355
      Width = 694
      Height = 20
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 3
      object Shape1: TShape
        Left = 8
        Top = 3
        Width = 15
        Height = 15
        Brush.Color = clBlack
      end
      object Label1: TLabel
        Left = 24
        Top = 5
        Width = 53
        Height = 13
        Caption = 'Promissoria'
      end
      object Shape2: TShape
        Left = 120
        Top = 3
        Width = 15
        Height = 15
        Brush.Color = clRed
        Pen.Color = clRed
      end
      object Label2: TLabel
        Left = 136
        Top = 5
        Width = 51
        Height = 13
        Caption = 'Bloqueado'
      end
      object Shape3: TShape
        Left = 232
        Top = 3
        Width = 15
        Height = 15
        Brush.Color = clBackground
        Pen.Color = clBackground
      end
      object Label3: TLabel
        Left = 253
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Cheque'
      end
      object Label4: TLabel
        Left = 557
        Top = 5
        Width = 113
        Height = 13
        Caption = '( ALT + M ) Menu Fiscal'
      end
    end
  end
  object QConsCli: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.BLOQUEADO_CLI, C.NOME_CLI, C.CNPJ_CLI, C.ENDRES_CLI, C.' +
        'BAIRES_CLI, C.COD_CON, C.TELRES_CLI, CO.NOME_CON, C.COD_CLI, C.O' +
        'BS_VENDA, C.LIMITE_CLI, C.TIPO_CREDITO_CLI, C.ATIVO_CLI, C.DOC_C' +
        'LI, C.LIMITE_CHEQUE'
      'FROM CLIENTE C'
      'INNER JOIN CONVENIO CO'
      'ON (C.COD_CON = CO.COD_CON)'
      'WHERE C.ATIVO_CLI = '#39'S'#39)
    Left = 128
    Top = 136
    object QConsCliNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsCliCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QConsCliENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QConsCliBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QConsCliCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'CLIENTE.COD_CON'
      Required = True
    end
    object QConsCliTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsCliNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QConsCliCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QConsCliOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = 'CLIENTE.OBS_VENDA'
      Size = 200
    end
    object QConsCliLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'CLIENTE.LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object QConsCliTIPO_CREDITO_CLI: TStringField
      DisplayWidth = 2
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = 'CLIENTE.TIPO_CREDITO_CLI'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsCliDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QConsCliBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = 'CLIENTE.BLOQUEADO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsCliATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'CLIENTE.ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsCliLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'CLIENTE.LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsCli: TDataSource
    AutoEdit = False
    DataSet = QConsCli
    Left = 128
    Top = 200
  end
end
