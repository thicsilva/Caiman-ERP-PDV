inherited FrmConsLancPadrao: TFrmConsLancPadrao
  Left = 354
  Top = 150
  Caption = 'Consulta de Lan'#231'amento Padr'#227'o'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DSQConsLancPadrao
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRICAO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CONTA_DEBITO'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA DEBITO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CONTA_CREDITO'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA CREDITO'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  object QConsLancPadrao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM LANCAMENTO_PADRAO')
    Left = 160
    Top = 192
    object QConsLancPadraoCOD_LAN: TIntegerField
      FieldName = 'COD_LAN'
      Origin = 'LANCAMENTO_PADRAO.COD_LAN'
      Required = True
    end
    object QConsLancPadraoNOME_LAN: TStringField
      FieldName = 'NOME_LAN'
      Origin = 'LANCAMENTO_PADRAO.NOME_LAN'
      Required = True
      Size = 60
    end
    object QConsLancPadraoCONTA_DEBITO: TIntegerField
      FieldName = 'CONTA_DEBITO'
      Origin = 'LANCAMENTO_PADRAO.CONTA_DEBITO'
      Required = True
    end
    object QConsLancPadraoCONTA_CREDITO: TIntegerField
      FieldName = 'CONTA_CREDITO'
      Origin = 'LANCAMENTO_PADRAO.CONTA_CREDITO'
      Required = True
    end
    object QConsLancPadraoCOD_HIS: TIntegerField
      FieldName = 'COD_HIS'
      Origin = 'LANCAMENTO_PADRAO.COD_HIS'
      Required = True
    end
  end
  object DSQConsLancPadrao: TDataSource
    AutoEdit = False
    DataSet = QConsLancPadrao
    Left = 160
    Top = 248
  end
end
