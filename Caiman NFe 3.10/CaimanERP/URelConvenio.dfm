inherited FrmRelConvenio: TFrmRelConvenio
  Caption = 'Relat'#243'rio de Conv'#234'nio'
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
  object QRelConv: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_CON, NOME_CON, TEL_CON, RESPONSAVEL_CON'
      'FROM CONVENIO')
    Left = 88
    Top = 16
    object QRelConvCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'CONVENIO.COD_CON'
      Required = True
    end
    object QRelConvNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QRelConvTEL_CON: TStringField
      FieldName = 'TEL_CON'
      Origin = 'CONVENIO.TEL_CON'
      FixedChar = True
      Size = 13
    end
    object QRelConvRESPONSAVEL_CON: TStringField
      FieldName = 'RESPONSAVEL_CON'
      Origin = 'CONVENIO.RESPONSAVEL_CON'
      Size = 50
    end
  end
  object DSQRelConv: TDataSource
    AutoEdit = False
    DataSet = QRelConv
    Left = 256
    Top = 16
  end
end
