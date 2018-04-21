inherited FrmConsCartas: TFrmConsCartas
  Caption = 'Consulta de Cartas'
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
      DataSource = DSQConsCarta
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CARTA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CARTA'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 361
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  object QConsCarta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CARTAS')
    Left = 152
    Top = 120
    object QConsCartaCOD_CARTA: TIntegerField
      FieldName = 'COD_CARTA'
      Origin = 'CARTAS.COD_CARTA'
      Required = True
    end
    object QConsCartaNOME_CARTA: TStringField
      FieldName = 'NOME_CARTA'
      Origin = 'CARTAS.NOME_CARTA'
      Required = True
      Size = 50
    end
    object QConsCartaCONTEUDO_CARTA: TMemoField
      FieldName = 'CONTEUDO_CARTA'
      Origin = 'CARTAS.CONTEUDO_CARTA'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQConsCarta: TDataSource
    AutoEdit = False
    DataSet = QConsCarta
    Left = 152
    Top = 184
  end
end
