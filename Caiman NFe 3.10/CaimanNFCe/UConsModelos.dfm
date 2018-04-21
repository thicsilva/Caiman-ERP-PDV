inherited FrmConsModelos: TFrmConsModelos
  Caption = 'Consulta de Modelo'
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitTop = -86
  ExplicitWidth = 457
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DSModelos
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 327
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TStatusBar
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
  end
  object QModelos: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM MODELOS')
    Left = 96
    Top = 192
    object QModelosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MODELOS.CODIGO'
      Required = True
    end
    object QModelosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELOS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSModelos: TDataSource
    AutoEdit = False
    DataSet = QModelos
    Left = 96
    Top = 248
  end
end
