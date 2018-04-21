inherited FrmRelClienteGeral: TFrmRelClienteGeral
  Left = 438
  Top = 310
  Caption = 'Relat'#243'rio de Cliente - Geral'
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
  object QRelCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.COD_CLI, C.NOME_CLI, C.NASCIMENTO_CLI, C.TELRES_CLI, V.' +
        'NOME_CON'
      'FROM CLIENTE C'
      'INNER JOIN CONVENIO V'
      'ON (C.COD_CON = V.COD_CON)')
    Left = 120
    Top = 16
    object QRelClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QRelClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QRelClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QRelClienteNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
  end
end
