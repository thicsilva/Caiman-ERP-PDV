object FrmVendasProduto: TFrmVendasProduto
  Left = 319
  Top = 304
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto/Venda'
  ClientHeight = 263
  ClientWidth = 337
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 201
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 333
      Height = 197
      Align = alClient
      Color = clSilver
      DataSource = DSQConsProdVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
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
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 88
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 337
    Height = 43
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 114
      Top = 9
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 244
    Width = 337
    Height = 19
    Panels = <>
  end
  object QConsProdVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRProdVenda
    SQL.Strings = (
      'SELECT V.COD_VEN, V.DATA_VEN, I.VALOR, I.QUANT'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      
        'WHERE V.COD_CLI = :CODCLI AND I.COD_PRO = :CODPRO AND V.DATA_VEN' +
        ' BETWEEN :DATAINI AND :DATAFIN AND'
      'I.CANCELADO = 0'
      'ORDER BY V.DATA_VEN')
    Left = 152
    Top = 64
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QConsProdVendaCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QConsProdVendaDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsProdVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBTRProdVenda: TFDTransaction
    Connection = DM.IBDatabase
    Left = 248
    Top = 64
  end
  object DSQConsProdVenda: TDataSource
    AutoEdit = False
    DataSet = QConsProdVenda
    Left = 152
    Top = 112
  end
end
