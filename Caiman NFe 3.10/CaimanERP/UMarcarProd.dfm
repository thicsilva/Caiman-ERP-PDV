object FrmMarcarProd: TFrmMarcarProd
  Left = 276
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Marcar produto para sair na Tabela de Pre'#231'o'
  ClientHeight = 433
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 89
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RDGTipo: TRadioGroup
      Left = 8
      Top = 8
      Width = 209
      Height = 73
      Caption = 'Tipo'
      Items.Strings = (
        'S'#243' Marcados'
        'N'#227'o Marcados'
        'Todos')
      TabOrder = 0
    end
    object BtnOK: TButton
      Left = 432
      Top = 16
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 432
      Top = 48
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object RDGOrdem: TRadioGroup
      Left = 224
      Top = 8
      Width = 137
      Height = 73
      Caption = 'Ordem'
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 563
    Height = 325
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 559
      Height = 321
      Align = alClient
      Color = clSilver
      DataSource = DSQConsProd
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 343
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_REVENDA'
          Title.Alignment = taCenter
          Title.Caption = 'ATACADO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SAIR_TABELA_PRECO'
          Title.Alignment = taCenter
          Title.Caption = 'T'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 563
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Use um duplo click ou enter para marcar ou desmarcar o produto'
  end
  object QConsProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_PRO, NOME_PRO, SAIR_TABELA_PRECO, VALOR_PRO, PRECO_RE' +
        'VENDA'
      'FROM PRODUTO')
    Left = 272
    Top = 200
    object QConsProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QConsProdNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsProdSAIR_TABELA_PRECO: TStringField
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = 'PRODUTO.SAIR_TABELA_PRECO'
      FixedChar = True
      Size = 1
    end
    object QConsProdVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdPRECO_REVENDA: TBCDField
      FieldName = 'PRECO_REVENDA'
      Origin = 'PRODUTO.PRECO_REVENDA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsProd: TDataSource
    AutoEdit = False
    DataSet = QConsProd
    Left = 272
    Top = 256
  end
  object IBSQLTabela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTabela
    Left = 376
    Top = 200
  end
  object IBTRTabela: TFDTransaction
    Connection = DM.IBDatabase
    Left = 376
    Top = 256
  end
end
