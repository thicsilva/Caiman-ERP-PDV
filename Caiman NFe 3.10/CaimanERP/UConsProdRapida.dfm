object FrmConsProdRapida: TFrmConsProdRapida
  Left = 256
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Produto [R'#225'pida]'
  ClientHeight = 404
  ClientWidth = 710
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 710
    Height = 328
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 706
      Height = 286
      TabStop = False
      Align = alTop
      Color = clSilver
      DataSource = DSQConsPro
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      OnKeyDown = DBGridKeyDown
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 55
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 323
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UNIDADE_SAIDA_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'UNID.'
          Width = 44
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR '
          Width = 63
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PROMOCAO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PROMO'#199#195'O'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Alignment = taCenter
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'LOCALIZACAO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'LOCALIZA'#199#195'O'
          Width = 83
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 248
      Top = 293
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnPreco: TButton
      Left = 396
      Top = 293
      Width = 65
      Height = 25
      Caption = '&Pre'#231'o'
      TabOrder = 2
      OnClick = BtnPrecoClick
    end
    object DBGPreco: TDBGrid
      Left = 0
      Top = 40
      Width = 593
      Height = 224
      Color = clSilver
      DataSource = DSQPreco
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = DBGPrecoKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 340
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'DESC.(%)'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACRESCIMO_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'ACRESC.(%)'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'PRE'#199'O'
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GB: TGroupBox
      Left = 160
      Top = 2
      Width = 369
      Height = 49
      Caption = 'Descri'#231#227'o'
      TabOrder = 0
      object EdtNome: TEdit
        Left = 8
        Top = 16
        Width = 353
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
        OnKeyPress = EdtNomeKeyPress
      end
    end
    object BtnOK: TBitBtn
      Left = 552
      Top = 24
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 616
      Top = 24
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object RDG: TRadioGroup
      Left = 8
      Top = 2
      Width = 137
      Height = 49
      Caption = 'Consultar Por'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 3
      OnClick = RDGClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 385
    Width = 710
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QConsPro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.ATIVO_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOC' +
        'AO_PRO, P.UNIDADE_SAIDA_PRO, P.LOCALIZACAO_PRO,'
      
        '(SELECT SUM(ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO)' +
        ' ESTOQUE'
      'FROM PRODUTO P')
    Left = 312
    Top = 184
    object QConsProCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QConsProNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsProVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProUNIDADE_SAIDA_PRO: TStringField
      FieldName = 'UNIDADE_SAIDA_PRO'
      Origin = 'PRODUTO.UNIDADE_SAIDA_PRO'
      Size = 4
    end
    object QConsProESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QConsProLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'PRODUTO.LOCALIZACAO_PRO'
    end
    object QConsProATIVO_PRO: TStringField
      FieldName = 'ATIVO_PRO'
      Origin = 'PRODUTO.ATIVO_PRO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSQConsPro: TDataSource
    AutoEdit = False
    DataSet = QConsPro
    Left = 312
    Top = 232
  end
  object QPreco: TFDQuery
    OnCalcFields = QPrecoCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRAux
    SQL.Strings = (
      'SELECT COD_TPV, NOME_TPV, DESCONTO_TPV, ACRESCIMO_TPV'
      'FROM TIPO_VENDA'
      'ORDER BY COD_TPV')
    Left = 376
    Top = 184
    object QPrecoCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'TIPO_VENDA.COD_TPV'
      Required = True
    end
    object QPrecoNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QPrecoDESCONTO_TPV: TBCDField
      FieldName = 'DESCONTO_TPV'
      Origin = 'TIPO_VENDA.DESCONTO_TPV'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QPrecoACRESCIMO_TPV: TBCDField
      FieldName = 'ACRESCIMO_TPV'
      Origin = 'TIPO_VENDA.ACRESCIMO_TPV'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QPrecoPRECO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRECO'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
  end
  object IBTRAux: TFDTransaction
    Connection = DM.IBDatabase
    Left = 440
    Top = 184
  end
  object DSQPreco: TDataSource
    AutoEdit = False
    DataSet = QPreco
    Left = 376
    Top = 232
  end
end
