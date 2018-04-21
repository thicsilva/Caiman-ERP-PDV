object FrmConsProd: TFrmConsProd
  Left = 304
  Top = 94
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Produtos'
  ClientHeight = 538
  ClientWidth = 815
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
    Width = 815
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 264
      Top = 3
      Width = 369
      Height = 49
      Caption = 'Descri'#231#227'o'
      TabOrder = 0
      object EdtConsulta: TEdit
        Left = 8
        Top = 16
        Width = 353
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyDown = EdtConsultaKeyDown
        OnKeyPress = EdtConsultaKeyPress
      end
    end
    object BtnSair: TButton
      Left = 680
      Top = 20
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object RDG: TRadioGroup
      Left = 8
      Top = 3
      Width = 241
      Height = 49
      Caption = 'Consultar por'
      Columns = 3
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Refer'#234'ncia')
      TabOrder = 2
      OnClick = RDGClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 815
    Height = 462
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 815
      Height = 462
      TabStop = False
      Align = alClient
      DataSource = DSQConsProd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      Columns = <
        item
          Color = clWindow
          Expanded = False
          FieldName = 'CODIGO_BARRA_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 109
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'NOME_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 335
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'REFERENCIA_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'REFER'#202'NCIA'
          Width = 86
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'ESTOQUE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Width = 59
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'UNID.'
          Width = 42
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'VALOR_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'VALOR UNIT.'
          Width = 79
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'PRECO_PRAZO_PRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'VALOR UNIT.'
          Width = 71
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'CST_CF_EST'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'CST'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'TIPO_PRODUCAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'IPPT'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'IAT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Width = 43
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'LOCALIZACAO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'LOCALIZA'#199#195'O'
          Width = 118
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 519
    Width = 815
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 
      '[F3] Nova Consulta       [ESC]  Sair              [ALT + M] Menu' +
      ' Fiscal       [F2] Consulta c'#243'digo de barras'
  end
  object DSQConsProd: TDataSource
    AutoEdit = False
    DataSet = QConsProd
    Left = 296
    Top = 240
  end
  object QConsProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, P.PRE' +
        'CO_PRAZO_PRO, P.CODIGO_BARRA_PRO, P.CST_CF_EST, P.TIPO_PRODUCAO,' +
        ' P.REFERENCIA_PRO, P.LOCALIZACAO_PRO, U.DESCRICAO, '#39'T'#39' IAT,'
      
        '(SELECT SUM(E.ESTOQUE) ESTOQUE FROM ESTOQUE E WHERE E.COD_PRO = ' +
        'P.COD_PRO AND E.COD_EMP = :CODEMP) ESTOQUE'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      '')
    Left = 296
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object QConsProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QConsProdNOME_PRO: TStringField
      DisplayWidth = 80
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsProdVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE_PRODUTO.ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QConsProdPRECO_PRAZO_PRO: TBCDField
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRODUTO.PRECO_PRAZO_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QConsProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QConsProdTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'PRODUTO.TIPO_PRODUCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsProdREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QConsProdCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = 'PRODUTO.CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QConsProdLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'PRODUTO.LOCALIZACAO_PRO'
    end
    object QConsProdIAT: TStringField
      FieldName = 'IAT'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
  end
  object QParametros: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT MOSTRAR_ESTOQUE_VENDA, MOSTRAR_SOMENTE_PROD_COM_EST'
      'FROM PARAMETROS'
      'WHERE COD_EMP = :CODEMP')
    Left = 224
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
    object QParametrosMOSTRAR_ESTOQUE_VENDA: TStringField
      FieldName = 'MOSTRAR_ESTOQUE_VENDA'
      Origin = 'PARAMETROS.MOSTRAR_ESTOQUE_VENDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QParametrosMOSTRAR_SOMENTE_PROD_COM_EST: TStringField
      FieldName = 'MOSTRAR_SOMENTE_PROD_COM_EST'
      Origin = 'PARAMETROS.MOSTRAR_SOMENTE_PROD_COM_EST'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
