object frmResumoConsignado: TfrmResumoConsignado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resumo estoque consignado'
  ClientHeight = 294
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 263
    Width = 20
    Height = 20
    Brush.Color = 12303359
  end
  object Label1: TLabel
    Left = 35
    Top = 264
    Width = 199
    Height = 20
    Caption = 'Consignados a mais de 2 dias.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 722
    Height = 240
    DataSource = DEstoqueConsignado
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLI'
        Title.Caption = ' C'#243'd. Cliente '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Caption = ' Nome do Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANT'
        Title.Caption = ' Quantidade '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = ' Data da venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELRES_CLI'
        Title.Caption = ' Telefone Residencial '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR_CLI'
        Title.Caption = ' Telefone celular '
        Visible = True
      end>
  end
  object EstoqueConsignado: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRCon
    SQL.Strings = (
      
        'select e.*, c.nome_cli, c.telres_cli, c.celular_cli, p.NOME_PRO ' +
        'from estoque_consignado e inner join cliente c on ( c.cod_cli = ' +
        'e.cod_cli ) inner join produto P on ( P.cod_pro = E.cod_pro ) wh' +
        'ere  e.COD_EMP = :cod_emp order by DATA')
    Left = 400
    Top = 8
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object EstoqueConsignadoCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"ESTOQUE_CONSIGNADO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EstoqueConsignadoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ESTOQUE_CONSIGNADO"."COD_EMP"'
      Required = True
    end
    object EstoqueConsignadoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ESTOQUE_CONSIGNADO"."COD_PRO"'
      Required = True
    end
    object EstoqueConsignadoCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = '"ESTOQUE_CONSIGNADO"."CODIGO_LOCAL_ESTOQUE"'
      Required = True
    end
    object EstoqueConsignadoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"ESTOQUE_CONSIGNADO"."COD_CLI"'
      Required = True
    end
    object EstoqueConsignadoQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = '"ESTOQUE_CONSIGNADO"."QUANT"'
      Required = True
    end
    object EstoqueConsignadoCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = '"ESTOQUE_CONSIGNADO"."COD_VENDA"'
      Required = True
    end
    object EstoqueConsignadoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"ESTOQUE_CONSIGNADO"."DATA"'
    end
    object EstoqueConsignadoORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ESTOQUE_CONSIGNADO"."ORDEM"'
    end
    object EstoqueConsignadoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object EstoqueConsignadoTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object EstoqueConsignadoCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = '"CLIENTE"."CELULAR_CLI"'
      Size = 13
    end
    object EstoqueConsignadoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
  end
  object DEstoqueConsignado: TDataSource
    DataSet = EstoqueConsignado
    Left = 512
    Top = 8
  end
  object TRCon: TFDTransaction
    Connection = DM.IBDatabase
    Left = 312
    Top = 8
  end
end
