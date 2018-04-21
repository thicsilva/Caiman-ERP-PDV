inherited FrmRelFor: TFrmRelFor
  Caption = 'Relat'#243'rio de Fornecedor'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnVis: TButton
      OnClick = BtnvisClick
    end
    inherited BtnImp: TButton
      OnClick = BtnvisClick
    end
  end
  object QRelFor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_FOR, RAZAO_FOR, TEL_FOR, FAX_FOR, CONTATO_FOR'
      'FROM FORNECEDOR')
    Left = 96
    Top = 16
    object QRelForCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'FORNECEDOR.COD_FOR'
      Required = True
    end
    object QRelForRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QRelForTEL_FOR: TStringField
      FieldName = 'TEL_FOR'
      Origin = 'FORNECEDOR.TEL_FOR'
      Size = 13
    end
    object QRelForFAX_FOR: TStringField
      FieldName = 'FAX_FOR'
      Origin = 'FORNECEDOR.FAX_FOR'
      Size = 13
    end
    object QRelForCONTATO_FOR: TStringField
      FieldName = 'CONTATO_FOR'
      Origin = 'FORNECEDOR.CONTATO_FOR'
      Size = 50
    end
  end
  object DSQRelFor: TDataSource
    AutoEdit = False
    DataSet = QRelFor
    Left = 256
    Top = 16
  end
end
