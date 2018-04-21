object FrmDadosNotaFiscal: TFrmDadosNotaFiscal
  Left = 463
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Nota Fiscal'
  ClientHeight = 436
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 377
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label24: TLabel
      Left = 96
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Data Saida'
    end
    object Label9: TLabel
      Left = 192
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Hora Sa'#237'da'
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object GB4: TGroupBox
      Left = 8
      Top = 128
      Width = 489
      Height = 65
      Caption = 'Volumes Transportados'
      TabOrder = 4
      object Label32: TLabel
        Left = 8
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Quantidade'
      end
      object Label33: TLabel
        Left = 88
        Top = 16
        Width = 38
        Height = 13
        Caption = 'Esp'#233'cie'
      end
      object Label34: TLabel
        Left = 168
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Marca'
      end
      object Label35: TLabel
        Left = 248
        Top = 16
        Width = 41
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label36: TLabel
        Left = 328
        Top = 16
        Width = 56
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label37: TLabel
        Left = 408
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Peso L'#237'quido'
      end
      object EdtQuantidade: TEdit
        Left = 8
        Top = 32
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 0
        OnKeyPress = EdtCodTranspKeyPress
      end
      object EdtEspecie: TEdit
        Left = 88
        Top = 32
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 1
      end
      object EdtMarca: TEdit
        Left = 168
        Top = 32
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 2
      end
      object EdtNum: TEdit
        Left = 248
        Top = 32
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 3
      end
      object EdtPesoBruto: TCurrencyEdit
        Left = 328
        Top = 32
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 4
        ZeroEmpty = False
      end
      object EdtPesoLiquido: TCurrencyEdit
        Left = 408
        Top = 32
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 5
        ZeroEmpty = False
      end
    end
    object GB5: TGroupBox
      Left = 8
      Top = 200
      Width = 489
      Height = 169
      Caption = 'Informa'#231#245'es Complementares'
      TabOrder = 5
      object MemoObs: TMemo
        Left = 2
        Top = 15
        Width = 485
        Height = 152
        Align = alClient
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        TabOrder = 0
      end
    end
    object EdtDataSaida: TDateTimePicker
      Left = 96
      Top = 32
      Width = 89
      Height = 21
      Date = 40275.552292743100000000
      Time = 40275.552292743100000000
      TabOrder = 0
    end
    object EdtHoraSaida: TDateTimePicker
      Left = 192
      Top = 32
      Width = 81
      Height = 21
      Date = 40275.552677222200000000
      Time = 40275.552677222200000000
      Kind = dtkTime
      TabOrder = 1
    end
    object RdgFrete: TRadioGroup
      Left = 296
      Top = 16
      Width = 201
      Height = 41
      Caption = 'Frete'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '1 Emitente'
        '2 Destinat'#225'rio')
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 64
      Width = 489
      Height = 57
      Caption = 'Transportadora'
      TabOrder = 3
      object BtnConsTransp: TsSpeedButton
        Left = 68
        Top = 19
        Width = 23
        Height = 21
        Hint = 'Consultar Tipo de Venda'
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
        OnClick = BtnConsTranspClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddTransp: TsSpeedButton
        Left = 93
        Top = 19
        Width = 25
        Height = 21
        Hint = 'Cadastrar Tipo de Venda'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddTranspClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtNomeTransp: TEdit
        Left = 122
        Top = 19
        Width = 359
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
        TabOrder = 0
      end
      object EdtCodTransp: TEdit
        Left = 8
        Top = 19
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Tipo de Venda'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = EdtCodTranspEnter
        OnExit = EdtCodTranspExit
        OnKeyDown = EdtCodTranspKeyDown
        OnKeyPress = EdtCodTranspKeyPress
      end
    end
    object EdtDataEmissao: TMaskEdit
      Left = 8
      Top = 32
      Width = 80
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 6
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 505
    Height = 59
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnGeraNF: TButton
      Left = 216
      Top = 9
      Width = 81
      Height = 25
      Caption = 'Gerar NF'
      TabOrder = 0
      OnClick = BtnGeraNFClick
    end
  end
  object QInsertNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_NOTA_FISCAL(:CODEMP, :CODCLI, :DATAEMISSAO, :DATA' +
        'SAIDA, :HORASAIDA, :CODTRANSP, :TIPONF,'
      ':FRETECONTA, :CODFOR, :TIPOCLIENTE, :CODTPV, :SERIE,'
      ':CF, :QUANTIDADE, :ESPECIE, :MARCA, :NUMERO, :PESOBRUTO,'
      ':PESOLIQUIDO, :DESCONTO, :INFORMACOES)')
    Left = 136
    Top = 232
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODCLI'
      end
      item
        Name = 'DATAEMISSAO'
      end
      item
        Name = 'DATASAIDA'
      end
      item
        Name = 'HORASAIDA'
      end
      item
        Name = 'CODTRANSP'
      end
      item
        Name = 'TIPONF'
      end
      item
        Name = 'FRETECONTA'
      end
      item
        Name = 'CODFOR'
      end
      item
        Name = 'TIPOCLIENTE'
      end
      item
        Name = 'CODTPV'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'CF'
      end
      item
        Name = 'QUANTIDADE'
      end
      item
        Name = 'ESPECIE'
      end
      item
        Name = 'MARCA'
      end
      item
        Name = 'NUMERO'
      end
      item
        Name = 'PESOBRUTO'
      end
      item
        Name = 'PESOLIQUIDO'
      end
      item
        Name = 'DESCONTO'
      end
      item
        Name = 'INFORMACOES'
      end>
    object QInsertNFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_NOTA_FISCAL.CODIGO'
    end
    object QInsertNFNUMERONF: TIntegerField
      FieldName = 'NUMERONF'
      Origin = 'SP_INSERT_NOTA_FISCAL.NUMERONF'
    end
  end
  object QInsertItensNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRNota
    UpdateTransaction = TRNota
    SQL.Strings = (
      'INSERT INTO ITENS_NOTA_FISCAL(ORDEM, COD_NF, COD_PRO,'
      
        'CST, QUANT, UNIT, ALIQ, COD_EMP, COD_GRP, ALIQ_IPI,             ' +
        '  '
      
        'REDUCAO_ICMS, COD_CFO, SUB_TRIBUTARIA, VR_AGREGADO, ALIQUOTA_FOR' +
        'A_ESTADO, UNIDADE, VALOR_TOTAL,  BASE_CALCULO, VALOR_ICMS, BASE_' +
        'SUBTRIB, VALOR_SUBTRIB, VALOR_IPI, CLASSIFICACAO_FISCAL,'
      
        'CST_IPI, CSOSN, CST_COFINS, CST_PIS, ALIQ_COFINS, ALIQ_PIS, DESC' +
        'ONTO)'
      
        ' VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :12, :13, :14, ' +
        ':15, :16, :18, :19, :20, :21, :22, :23, :24, :25,'
      
        ' :CST_IPI, :CSOSN, :CST_COFINS, :CST_PIS, :ALIQ_COFINS, :ALIQ_PI' +
        'S, :DESCONTO)')
    Left = 216
    Top = 232
    ParamData = <
      item
        Name = '1'
        ParamType = ptInput
      end
      item
        Name = '2'
        ParamType = ptInput
      end
      item
        Name = '3'
        ParamType = ptInput
      end
      item
        Name = '4'
        ParamType = ptInput
      end
      item
        Name = '5'
        ParamType = ptInput
      end
      item
        Name = '6'
        ParamType = ptInput
      end
      item
        Name = '7'
        ParamType = ptInput
      end
      item
        Name = '8'
        ParamType = ptInput
      end
      item
        Name = '9'
        ParamType = ptInput
      end
      item
        Name = '10'
        ParamType = ptInput
      end
      item
        Name = '12'
        ParamType = ptInput
      end
      item
        Name = '13'
        ParamType = ptInput
      end
      item
        Name = '14'
        ParamType = ptInput
      end
      item
        Name = '15'
        ParamType = ptInput
      end
      item
        Name = '16'
        ParamType = ptInput
      end
      item
        Name = '18'
        ParamType = ptInput
      end
      item
        Name = '19'
        ParamType = ptInput
      end
      item
        Name = '20'
        ParamType = ptInput
      end
      item
        Name = '21'
        ParamType = ptInput
      end
      item
        Name = '22'
        ParamType = ptInput
      end
      item
        Name = '23'
        ParamType = ptInput
      end
      item
        Name = '24'
        ParamType = ptInput
      end
      item
        Name = '25'
        ParamType = ptInput
      end
      item
        Name = 'CST_IPI'
        ParamType = ptInput
      end
      item
        Name = 'CSOSN'
        ParamType = ptInput
      end
      item
        Name = 'CST_COFINS'
        ParamType = ptInput
      end
      item
        Name = 'CST_PIS'
        ParamType = ptInput
      end
      item
        Name = 'ALIQ_COFINS'
        ParamType = ptInput
      end
      item
        Name = 'ALIQ_PIS'
        ParamType = ptInput
      end
      item
        Name = 'DESCONTO'
        ParamType = ptInput
      end>
  end
  object QBuscaItensNF: TFDQuery
    OnCalcFields = QBuscaItensNFCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT I.*, TS.descricao NOME_GRP,'
      'TS.TIPO_GRP,'
      'CF.DESTACA_ICMS,'
      'CF.USA_CSOSN,'
      'P.NOME_PRO,'
      'P.COD_NCM,'
      'TS.origem_prod ORIG,'
      'TS.cst_pis CST_PIS,'
      'TS.cst_cofins CST_COFINS,'
      'P.CODIGO_BARRA_PRO,'
      'P.DESC_CUPOM,'
      'TS.isento_piscofins ISENTO_PIS_COFINS_PRO,'
      'NCM.nacional ALIQ_IBPT_NAC'
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'LEFT OUTER join TRIBUTACOES_NCMS_SAIDA TS'
      'ON ( TS.ncm = P.cod_ncm and TS.ex = p.ncm_ex and ts.uf=:UF )'
      'left outer join NCM'
      
        'on( NCM.cod_emp = I.cod_emp and NCM.ncm = P.cod_ncm and NCM.ex =' +
        ' P.ncm_ex )'
      'WHERE I.COD_NF = :CODNF'
      'ORDER BY I.ORDEM')
    Left = 48
    Top = 232
    ParamData = <
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CODNF'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensNFCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      Calculated = True
    end
    object QBuscaItensNFISENTO_PIS_COFINS_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = 'ISENTO_PISCOFINS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'COD_NF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensNFCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensNFALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ALIQ'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QBuscaItensNFCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      Required = True
    end
    object QBuscaItensNFQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensNFALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'COD_CFO'
      Required = True
    end
    object QBuscaItensNFSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object QBuscaItensNFCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QBuscaItensNFVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensNFISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'FRETE'
    end
    object QBuscaItensNFDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object QBuscaItensNFBC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = 'BC_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFBC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = 'BC_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNFCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
    end
    object QBuscaItensNFNF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = 'NF_CANCELADA'
    end
    object QBuscaItensNFCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QBuscaItensNFCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QBuscaItensNFCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object QBuscaItensNFCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object QBuscaItensNFNOME_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QBuscaItensNFTIPO_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_GRP'
      Origin = 'TIPO_GRP'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object QBuscaItensNFDESTACA_ICMS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTACA_ICMS'
      Origin = 'DESTACA_ICMS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFUSA_CSOSN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USA_CSOSN'
      Origin = 'USA_CSOSN'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNFNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensNFCOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object QBuscaItensNFORIG: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ORIG'
      Origin = 'ORIGEM_PROD'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensNFCST_PIS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS_1'
      Origin = 'CST_PIS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensNFCST_COFINS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS_1'
      Origin = 'CST_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensNFCODIGO_BARRA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QBuscaItensNFDESC_CUPOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensNFALIQ_IBPT_NAC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = 'NACIONAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object QInsRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_SAIDAS(:DATA, :CNPJ, :CODMODELO, :SERIE, :NUM' +
        'ERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, :CODSAIDA, ' +
        ':UF, :INSC, :NFINAL, :CODMAPA)')
    Left = 48
    Top = 296
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERONOTA'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALORTOTAL'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODSAIDA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'NFINAL'
      end
      item
        Name = 'CODMAPA'
      end>
    object QInsRegistroSaidaCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QItensRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CFO, ALIQ, SUM(VALOR_TOTAL) VALORTOTAL, SUM(BASE_CALC' +
        'ULO) BASECALCULO, SUM(VALOR_ICMS) VALORICMS, SUM(BASE_SUBTRIB) B' +
        'ASE_ST, SUM(VALOR_SUBTRIB) VALOR_ST, SUM(ISENTAS) ISENTAS, SUM(O' +
        'UTRAS) OUTRAS, SUM(VALOR_IPI) VALOR_IPI'
      'FROM ITENS_NOTA_FISCAL'
      'WHERE COD_NF = :CODNF'
      'GROUP BY COD_CFO, ALIQ')
    Left = 136
    Top = 296
    ParamData = <
      item
        Name = 'CODNF'
      end>
    object QItensRegistroCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Required = True
    end
    object QItensRegistroVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object QItensRegistroBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroBASE_ST: TBCDField
      FieldName = 'BASE_ST'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALOR_ST: TBCDField
      FieldName = 'VALOR_ST'
      Precision = 18
      Size = 2
    end
    object QItensRegistroISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QItensRegistroALIQ: TBCDField
      FieldName = 'ALIQ'
      Precision = 18
      Size = 2
    end
  end
  object QInsItensRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'INSERT INTO ITENS_REGISTRO_LIVRO_SAIDAS ('
      
        'CODIGO, ORDEM, CFOP, BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUT' +
        'ADA, OUTRAS, ALIQUOTA, CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO,' +
        ' BASE_CALCULO_RETIDO)'
      'VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 240
    Top = 296
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QBuscaRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_SAIDAS R'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)'
      'WHERE R.CODIGO = :COD'
      '')
    Left = 312
    Top = 232
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaRegistroSaidaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaRegistroSaidaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QBuscaRegistroSaidaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QBuscaRegistroSaidaSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QBuscaRegistroSaidaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QBuscaRegistroSaidaEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroSaidaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaRegistroSaidaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroSaidaCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaRegistroSaidaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QBuscaRegistroSaidaUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroSaidaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELO_NOTA_FISCAL.DESCRICAO'
      Required = True
      Size = 80
    end
    object QBuscaRegistroSaidaCODIGO_SAIDA: TIntegerField
      FieldName = 'CODIGO_SAIDA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_SAIDA'
    end
    object QBuscaRegistroSaidaNUMERO_NOTA_FINAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FINAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA_FINAL'
    end
    object QBuscaRegistroSaidaCODIGO_MAPA_RESUMO: TIntegerField
      FieldName = 'CODIGO_MAPA_RESUMO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_MAPA_RESUMO'
    end
    object QBuscaRegistroSaidaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QInsRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_ENTRADAS(:DATA, :CODFOR, :CNPJ, :CODMODELO, :' +
        'SERIE, :NUMERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, ' +
        ':CODENTRADA, :UF, :INSC, :SUBSERIE, :CIFFOB, :CODNF)')
    Left = 448
    Top = 216
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODFOR'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERONOTA'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALORTOTAL'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODENTRADA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'SUBSERIE'
      end
      item
        Name = 'CIFFOB'
      end
      item
        Name = 'CODNF'
      end>
    object QInsRegistroEntradaCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QInsItensRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'INSERT INTO ITENS_REGISTRO_LIVRO_ENTRADAS (CODIGO, ORDEM, CFOP,'
      
        'BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA' +
        ',                          CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RET' +
        'IDO, BASE_CALCULO_RETIDO)                           '
      'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 448
    Top = 272
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QBuscaRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_ENTRADAS R'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)'
      'WHERE R.CODIGO = :COD'
      '')
    Left = 448
    Top = 328
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaRegistroEntradaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaRegistroEntradaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QBuscaRegistroEntradaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QBuscaRegistroEntradaSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QBuscaRegistroEntradaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QBuscaRegistroEntradaEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroEntradaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaRegistroEntradaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroEntradaCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaRegistroEntradaCODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object QBuscaRegistroEntradaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QBuscaRegistroEntradaUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroEntradaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object QBuscaRegistroEntradaSUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object QBuscaRegistroEntradaCIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object QBuscaRegistroEntradaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroEntradaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CODIFICACAO_DOCUMENTOS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object IBTRFatura: TFDTransaction
    Connection = DM.IBDatabase
    Left = 280
    Top = 128
  end
  object QAuxFatura: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRFatura
    Left = 208
    Top = 136
  end
  object TRNota: TFDTransaction
    Connection = DM.IBDatabase
    Left = 424
    Top = 112
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT I.ID_OS_ITEM, P.COD_PRO, I.COD_EMP, I.QUANTIDADE AS QUANT' +
        '_ITEM,'
      
        '       I.VALOR_UNITARIO AS VALOR_CUSTO, P.CFOP_VENDAS_CONT_EST A' +
        'S CFOP,'
      
        '       P.CST_CONT_EST AS CST, P.IPI,P.NOME_PRO, U.DESCRICAO, P.R' +
        'ED_CF_EST'
      'FROM OS_ITEM I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      ' LEFT OUTER JOIN TIPO_PRODUTO TP ON(P.CODIGO_TIPO = TP.CODIGO)'
      'WHERE I.ID_OS = :COD'
      '  AND TP.SERVICO = '#39'N'#39)
    Left = 96
    Top = 144
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensID_OS_ITEM: TIntegerField
      FieldName = 'ID_OS_ITEM'
      Origin = 'ID_OS_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
    end
    object QBuscaItensQUANT_ITEM: TFloatField
      FieldName = 'QUANT_ITEM'
      Origin = 'QUANTIDADE'
    end
    object QBuscaItensVALOR_CUSTO: TFloatField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_UNITARIO'
    end
    object QBuscaItensCFOP: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP_VENDAS_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensCST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST'
      Origin = 'CST_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object QBuscaItensIPI: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'IPI'
      Origin = 'IPI'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QBuscaItensRED_CF_EST: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RED_CF_EST'
      Origin = 'RED_CF_EST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
