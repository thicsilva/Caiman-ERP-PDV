inherited FrmConsMarcas: TFrmConsMarcas
  Caption = 'Consulta de Marcas'
  ClientHeight = 466
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Height = 326
    ExplicitHeight = 326
    inherited DBGrid: TDBGrid
      DataSource = DSMarcas
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
          Width = 331
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 447
    ExplicitTop = 447
  end
  object QMarcas: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT *'
      'FROM MARCAS')
    Left = 136
    Top = 192
    object QMarcasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MARCAS.CODIGO'
      Required = True
    end
    object QMarcasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MARCAS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSMarcas: TDataSource
    AutoEdit = False
    DataSet = QMarcas
    Left = 136
    Top = 248
  end
end
