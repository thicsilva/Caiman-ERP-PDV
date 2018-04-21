inherited FrmRelClaCliente: TFrmRelClaCliente
  Caption = 'Relat'#243'rio de Classifica'#231#227'o de Cliente'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnVis: TButton
      OnClick = BtnVisClick
    end
    inherited BtnImp: TButton
      OnClick = BtnVisClick
    end
  end
  object QRelClassif: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM CLASSIF_CLIENTE')
    Left = 88
    Top = 16
    object QRelClassifCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'CLASSIF_CLIENTE.COD_CLA'
      Required = True
    end
    object QRelClassifNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'CLASSIF_CLIENTE.NOME_CLA'
      Required = True
      Size = 30
    end
  end
  object DSQRelClassif: TDataSource
    AutoEdit = False
    DataSet = QRelClassif
    Left = 256
    Top = 16
  end
end
