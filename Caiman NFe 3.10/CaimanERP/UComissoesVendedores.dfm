object frmComissoesVendedores: TfrmComissoesVendedores
  Left = 0
  Top = 0
  Caption = 'Gera Comiss'#245'es de Vendedores'
  ClientHeight = 278
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Status: TLabel
    Left = 224
    Top = 148
    Width = 102
    Height = 13
    Caption = 'Gerando Aguarde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 155
    Width = 85
    Height = 13
    Caption = 'Log da gera'#231#227'o :'
  end
  object SelVend: TGroupBox
    Left = 8
    Top = 80
    Width = 486
    Height = 57
    Caption = ' Selecione o Vendedor '
    TabOrder = 1
    Visible = False
    object BtnConsCli: TsSpeedButton
      Left = 72
      Top = 20
      Width = 23
      Height = 21
      Hint = 'Consultar Fornecedor'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000502020B4B201CB1662A26F032151275000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
        0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
        052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
        00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
        27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
        12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
        23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
        26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
        04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
        28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
        090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
        23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
        4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
        1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
        69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
        22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
        527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
        28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
        0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
        28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
        020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
        14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
        20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
        0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
        26F92F14116F0000000000000000000000000000000000000000000000000000
        0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
        0625000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsCliClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object EdtCodVend: TEdit
      Left = 9
      Top = 20
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Fornecedor'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = EdtCodVendExit
    end
    object EdtNomeVend: TEdit
      Left = 102
      Top = 20
      Width = 324
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 17
    Width = 486
    Height = 57
    Caption = ' Periodo e Tipo de gera'#231#227'o '
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 27
      Width = 63
      Height = 13
      Caption = 'Data Inicial :'
    end
    object Label2: TLabel
      Left = 172
      Top = 27
      Width = 58
      Height = 13
      Caption = 'Data Final :'
    end
    object DataIni: TsDateEdit
      Left = 77
      Top = 24
      Width = 86
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Segoe UI'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object DataFim: TsDateEdit
      Left = 237
      Top = 24
      Width = 86
      Height = 21
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Segoe UI'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object TipoGeracao: TRadioGroup
      Left = 331
      Top = 9
      Width = 146
      Height = 43
      Caption = ' Tipo Gera'#231#227'o '
      Columns = 2
      Items.Strings = (
        'Todos'
        'Selecionar')
      TabOrder = 2
      OnClick = TipoGeracaoClick
    end
  end
  object Button1: TButton
    Left = 338
    Top = 143
    Width = 156
    Height = 25
    Caption = 'Gerar as Comiss'#245'es'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Log: TListBox
    Left = 8
    Top = 173
    Width = 486
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object IBTRGeraComissoes: TFDTransaction
    Connection = DM.IBDatabase
    Left = 240
    Top = 16
  end
  object QVendasVendedor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    SQL.Strings = (
      
        'select * from Vendas V where V.COD_EMP=:CODEMP and V.COD_VEND=:C' +
        'ODVEND and v.data_ven between :dataini and :datafim and v.cancel' +
        'ada_ven = 0 and not exists ( select * from comissoes_vendas CV w' +
        'here CV.venda=V.cod_ven );')
    Left = 392
    Top = 8
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODVEND'
      end
      item
        Name = 'dataini'
      end
      item
        Name = 'datafim'
      end>
    object QVendasVendedorCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"VENDAS"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendasVendedorDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = '"VENDAS"."DATA_VEN"'
      Required = True
    end
    object QVendasVendedorCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"VENDAS"."COD_EMP"'
      Required = True
    end
    object QVendasVendedorCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = '"VENDAS"."COD_CAI"'
      Required = True
    end
    object QVendasVendedorCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"VENDAS"."COD_CLI"'
      Required = True
    end
    object QVendasVendedorDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = '"VENDAS"."DESCONTO_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasVendedorCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = '"VENDAS"."COD_TPV"'
      Required = True
    end
    object QVendasVendedorTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = '"VENDAS"."TOTAL_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasVendedorCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = '"VENDAS"."CUPOM_FISCAL_VEN"'
    end
    object QVendasVendedorTOTAL_CUSTO_VEN: TBCDField
      FieldName = 'TOTAL_CUSTO_VEN'
      Origin = '"VENDAS"."TOTAL_CUSTO_VEN"'
      Precision = 18
      Size = 2
    end
    object QVendasVendedorDATA_HORA_VEN: TSQLTimeStampField
      FieldName = 'DATA_HORA_VEN'
      Origin = '"VENDAS"."DATA_HORA_VEN"'
    end
    object QVendasVendedorDESC_PESSOA_AUTORIZADA: TStringField
      FieldName = 'DESC_PESSOA_AUTORIZADA'
      Origin = '"VENDAS"."DESC_PESSOA_AUTORIZADA"'
      Size = 60
    end
    object QVendasVendedorCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"VENDAS"."COD_NF"'
    end
    object QVendasVendedorCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = '"VENDAS"."COD_USU"'
      Required = True
    end
    object QVendasVendedorCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = '"VENDAS"."CANCELADA_VEN"'
      Required = True
    end
    object QVendasVendedorCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = '"VENDAS"."CODIGO_PAF"'
    end
    object QVendasVendedorR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = '"VENDAS"."R04_CCF"'
    end
    object QVendasVendedorR04_NOME_CLIENTE: TStringField
      FieldName = 'R04_NOME_CLIENTE'
      Origin = '"VENDAS"."R04_NOME_CLIENTE"'
      Size = 40
    end
    object QVendasVendedorR04_CNPJ_CLIENTE: TStringField
      FieldName = 'R04_CNPJ_CLIENTE'
      Origin = '"VENDAS"."R04_CNPJ_CLIENTE"'
      Size = 18
    end
    object QVendasVendedorNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = '"VENDAS"."NUMERO_NOTA_FISCAL"'
    end
    object QVendasVendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDAS"."COD_VEND"'
      Required = True
    end
    object QVendasVendedorSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = '"VENDAS"."SERIE_NOTA_FISCAL"'
      Size = 3
    end
    object QVendasVendedorCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = '"VENDAS"."CODIFICACAO_FISCAL"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QVendasVendedorCER: TIntegerField
      FieldName = 'CER'
      Origin = '"VENDAS"."CER"'
    end
    object QVendasVendedorCONSIGNADA: TStringField
      FieldName = 'CONSIGNADA'
      Origin = '"VENDAS"."CONSIGNADA"'
      Size = 1
    end
    object QVendasVendedorIMPORTADO_NFE: TStringField
      FieldName = 'IMPORTADO_NFE'
      Origin = '"VENDAS"."IMPORTADO_NFE"'
      Size = 1
    end
  end
  object IBSQL1: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 184
    Top = 120
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    Left = 248
    Top = 144
  end
  object QVendedores: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    SQL.Strings = (
      'select * from VENDEDOR')
    Left = 128
    Top = 184
    object QVendedoresCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDEDOR"."COD_VEND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendedoresNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = '"VENDEDOR"."NOME_VEND"'
      Required = True
      Size = 50
    end
    object QVendedoresATIVO_VEND: TStringField
      FieldName = 'ATIVO_VEND'
      Origin = '"VENDEDOR"."ATIVO_VEND"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QVendedoresCOMISSAO_VEND: TBCDField
      FieldName = 'COMISSAO_VEND'
      Origin = '"VENDEDOR"."COMISSAO_VEND"'
      Precision = 18
      Size = 2
    end
  end
  object QComissoes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    SQL.Strings = (
      
        'select * from VENDEDOR_DESC_COMISSAO where COD_VEND=:COD_VEND or' +
        'der by PORC_DESCONTO')
    Left = 200
    Top = 200
    ParamData = <
      item
        Name = 'COD_VEND'
      end>
    object QComissoesCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"VENDEDOR_DESC_COMISSAO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QComissoesCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"VENDEDOR_DESC_COMISSAO"."COD_VEND"'
    end
    object QComissoesPORC_DESCONTO: TBCDField
      FieldName = 'PORC_DESCONTO'
      Origin = '"VENDEDOR_DESC_COMISSAO"."PORC_DESCONTO"'
      Precision = 18
      Size = 3
    end
    object QComissoesPORC_COMISSAO: TBCDField
      FieldName = 'PORC_COMISSAO'
      Origin = '"VENDEDOR_DESC_COMISSAO"."PORC_COMISSAO"'
      Precision = 18
      Size = 3
    end
  end
  object QPegaDesconto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    SQL.Strings = (
      
        'select  SUM( i.desconto ) itens_descontos, SUM( v.desconto_ven )' +
        ' desconto_venda from itens_venda i'
      'inner join vendas v'
      'on ( v.cod_ven = i.cod_ven )'
      'where i.cod_ven=:codven')
    Left = 352
    Top = 208
    ParamData = <
      item
        Name = 'codven'
      end>
    object QPegaDescontoITENS_DESCONTOS: TBCDField
      FieldName = 'ITENS_DESCONTOS'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QPegaDescontoDESCONTO_VENDA: TBCDField
      FieldName = 'DESCONTO_VENDA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object QItensVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGeraComissoes
    SQL.Strings = (
      
        'select * from itens_venda where cod_emp=:cod_emp and cod_ven=:co' +
        'd_ven')
    Left = 400
    Top = 72
    ParamData = <
      item
        Name = 'cod_emp'
      end
      item
        Name = 'cod_ven'
      end>
    object QItensVendaCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = '"ITENS_VENDA"."COD_VEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensVendaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_VENDA"."COD_PRO"'
      Required = True
    end
    object QItensVendaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ITENS_VENDA"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = '"ITENS_VENDA"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object QItensVendaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"ITENS_VENDA"."COD_EMP"'
      Required = True
    end
    object QItensVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_VENDA"."VALOR"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensVendaVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = '"ITENS_VENDA"."VALOR_CUSTO"'
      Precision = 18
      Size = 2
    end
    object QItensVendaPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = '"ITENS_VENDA"."PRODUTO_PROMOCAO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensVendaCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = '"ITENS_VENDA"."CANCELADO"'
      Required = True
    end
    object QItensVendaVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = '"ITENS_VENDA"."VENDA_CANCELADA"'
      Required = True
    end
    object QItensVendaCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = '"ITENS_VENDA"."COD_VEND"'
      Required = True
    end
    object QItensVendaSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = '"ITENS_VENDA"."STATUS_EXPORTA"'
    end
  end
end
