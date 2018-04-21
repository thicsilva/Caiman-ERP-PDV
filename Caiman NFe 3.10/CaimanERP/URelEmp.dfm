inherited FrmRelEmp: TFrmRelEmp
  Left = 421
  Top = 292
  Caption = 'Relat'#243'rio de Empresa'
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
  object QRelEmp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_EMP, RAZAO_EMP '
      'FROM EMPRESA')
    Left = 128
    Top = 16
    object QRelEmpCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'EMPRESA.COD_EMP'
      Required = True
    end
    object QRelEmpRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'EMPRESA.RAZAO_EMP'
      Required = True
      Size = 50
    end
  end
  object DSQRelEmp: TDataSource
    AutoEdit = False
    DataSet = QRelEmp
    Left = 256
    Top = 16
  end
end
