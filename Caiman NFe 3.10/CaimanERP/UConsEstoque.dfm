object FrmConsEstoque: TFrmConsEstoque
  Left = 250
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Estoque'
  ClientHeight = 466
  ClientWidth = 612
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
    Width = 612
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 417
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 401
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'NOME'
          'PALAVRA CHAVE'
          'REFER'#202'NCIA')
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 417
      Height = 49
      Caption = 'Nome'
      TabOrder = 1
      object EdtCod: TEdit
        Left = 8
        Top = 16
        Width = 393
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
        OnKeyPress = EdtCodKeyPress
      end
    end
    object BtnOk: TButton
      Left = 466
      Top = 32
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 466
      Top = 64
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 104
      Width = 281
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 612
    Height = 326
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 608
      Height = 322
      Align = alClient
      Color = clSilver
      DataSource = DSQConsEstoque
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
          Width = 343
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PROMOCAO_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PROMO'#199#195'O'
          Width = 74
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 447
    Width = 612
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Use um duplo click para verificar cor e tamanho'
  end
  object QConsEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREstoque
    SQL.Strings = (
      
        'SELECT SUM(E.ESTOQUE) ESTOQUE, P.COD_PRO, P.NOME_PRO, P.VALOR_PR' +
        'O, P.PROMOCAO_PRO'
      'FROM ESTOQUE E'
      'INNER JOIN PRODUTO P'
      'ON (E.COD_PRO = P.COD_PRO)'
      'GROUP BY P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO'
      '')
    Left = 208
    Top = 200
    object QConsEstoqueCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object QConsEstoqueNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsEstoqueVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEstoquePROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEstoqueESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE.ESTOQUE'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
  end
  object DSQConsEstoque: TDataSource
    AutoEdit = False
    DataSet = QConsEstoque
    Left = 120
    Top = 200
  end
  object IBTREstoque: TFDTransaction
    Connection = DM.IBDatabase
    Left = 288
    Top = 200
  end
end
