object frmMMA_ITENS: TfrmMMA_ITENS
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Visualiza'#231#227'o de itens anteriores'
  ClientHeight = 197
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid2: TDBGrid
    Left = 8
    Top = 8
    Width = 692
    Height = 177
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PROD'
        Title.Caption = '  C'#243'd. do Produto  '
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = '  Descri'#231#227'o'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNID'
        Title.Caption = '  Unid.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANT'
        Title.Caption = ' Quant.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNID'
        Title.Caption = '  Valor Unid.  '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCONTO'
        Title.Caption = '  Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = '   Valor Total  '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRAR'
        Title.Caption = 'Cobrar'
        Width = 40
        Visible = True
      end>
  end
  object itens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from MMA_ORDEM_ITENS')
    Left = 216
    Top = 104
    object itensCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"MMA_ORDEM_ITENS"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object itensCOD_OS: TIntegerField
      FieldName = 'COD_OS'
      Origin = '"MMA_ORDEM_ITENS"."COD_OS"'
      Required = True
    end
    object itensCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Origin = '"MMA_ORDEM_ITENS"."COD_PROD"'
      Required = True
    end
    object itensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"MMA_ORDEM_ITENS"."DESCRICAO"'
      Required = True
      Size = 151
    end
    object itensUNID: TStringField
      FieldName = 'UNID'
      Origin = '"MMA_ORDEM_ITENS"."UNID"'
      Size = 10
    end
    object itensQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"MMA_ORDEM_ITENS"."QUANT"'
    end
    object itensVALOR_UNID: TFloatField
      FieldName = 'VALOR_UNID'
      Origin = '"MMA_ORDEM_ITENS"."VALOR_UNID"'
    end
    object itensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = '"MMA_ORDEM_ITENS"."DESCONTO"'
    end
    object itensVALOR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
      Origin = '"MMA_ORDEM_ITENS"."VALOR_TOTAL"'
      ProviderFlags = []
      ReadOnly = True
    end
    object itensCOBRAR: TStringField
      FieldName = 'COBRAR'
      Origin = '"MMA_ORDEM_ITENS"."COBRAR"'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = itens
    Left = 292
    Top = 88
  end
end
