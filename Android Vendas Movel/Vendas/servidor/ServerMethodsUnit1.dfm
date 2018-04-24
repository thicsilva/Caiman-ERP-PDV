object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 175
  Width = 358
  object DSP_AUX: TDataSetProvider
    DataSet = QRYAUX
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 72
  end
  object DSP_AUX2: TDataSetProvider
    DataSet = QRYAUX2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 248
    Top = 72
  end
  object COENXAO_FB: TIBDatabase
    Connected = True
    DatabaseName = 'C:\AligatorERP\DataBase\BANCO.FDB'
    Params.Strings = (
      'password=masterkey'
      'user_name=sysdba')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 56
    Top = 24
  end
  object QRYAUX: TIBQuery
    Database = COENXAO_FB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 184
    Top = 24
  end
  object QRYAUX2: TIBQuery
    Database = COENXAO_FB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 248
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Left = 56
    Top = 72
  end
end
