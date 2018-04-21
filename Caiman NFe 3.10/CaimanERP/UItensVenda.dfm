object FrmItensVenda: TFrmItensVenda
  Left = 195
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Itens da Venda'
  ClientHeight = 423
  ClientWidth = 780
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 404
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 776
      Height = 400
      Align = alClient
      Color = clSilver
      DataSource = DSQItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'ORD'
          Width = 33
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO_BARRA_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.BARRA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO'
          Width = 352
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 46
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Alignment = taCenter
          Title.Caption = 'DESC.'
          Width = 51
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 404
    Width = 780
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC para sair'
  end
  object QItens: TFDQuery
    OnCalcFields = QItensCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRItens
    SQL.Strings = (
      'SELECT I.*, P.NOME_PRO, P.CODIGO_BARRA_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY ORDEM')
    Left = 152
    Top = 176
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QItensDESCRICAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO'
      Size = 150
      Calculated = True
    end
    object QItensTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ITENS_VENDA.COD_VEND'
      Required = True
    end
    object QItensCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
  end
  object DSQItens: TDataSource
    AutoEdit = False
    DataSet = QItens
    Left = 152
    Top = 232
  end
  object IBTRItens: TFDTransaction
    Connection = DM.IBDatabase
    Left = 216
    Top = 176
  end
end
