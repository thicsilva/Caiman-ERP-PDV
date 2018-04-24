object DMCONEXAO: TDMCONEXAO
  OldCreateOrder = False
  Height = 293
  Width = 533
  object CONEXAO_INT: TUniConnection
    ProviderName = 'SQLite'
    Database = 'D:\Projetos\Android Vendas Movel Berlin\firebird\DB\banco.s3db'
    Connected = True
    LoginPrompt = False
    Left = 144
    Top = 8
  end
  object SQLiteUniProvider1: TSQLiteUniProvider
    Left = 144
    Top = 56
  end
  object IdSMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 52
    Top = 120
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 84
    Top = 120
  end
  object CONEXAO_EXT: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Connected = True
    Left = 296
    Top = 112
  end
  object CDS_AUX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AUX'
    RemoteServer = DSProviderConnection1
    Left = 296
    Top = 160
  end
  object CDS_AUX2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_AUX2'
    RemoteServer = DSProviderConnection1
    Left = 296
    Top = 224
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = CONEXAO_EXT
    Left = 424
    Top = 224
  end
end
