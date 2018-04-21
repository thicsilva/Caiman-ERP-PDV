object FrmMalaSel: TFrmMalaSel
  Left = 316
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mala Direta [Registros Selecionados]'
  ClientHeight = 426
  ClientWidth = 522
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 137
    Width = 522
    Height = 229
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnADD: TBitBtn
      Left = 20
      Top = 198
      Width = 53
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = BtnADDClick
    end
    object BtnExc: TBitBtn
      Left = 84
      Top = 198
      Width = 53
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BtnExcClick
    end
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 518
      Height = 191
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 2
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 514
        Height = 188
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 60
          Height = 13
          Caption = 'Cod.Cliente'
        end
        object BtnConsCli: TsSpeedButton
          Left = 68
          Top = 32
          Width = 23
          Height = 22
          Hint = 'Consultar Carta'
          Flat = True
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
        object Label2: TLabel
          Left = 96
          Top = 16
          Width = 105
          Height = 13
          Caption = 'Descri'#231#227'o do Cliente'
        end
        object EdtCodCli: TEdit
          Left = 8
          Top = 32
          Width = 57
          Height = 21
          Hint = 'Pressione F2 para Consultar Carta'
          Alignment = taRightJustify
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodCliEnter
          OnExit = EdtCodCliExit
          OnKeyDown = EdtCodCliKeyDown
          OnKeyPress = EdtCodCartaKeyPress
        end
        object EdtNomeCli: TEdit
          Left = 96
          Top = 32
          Width = 353
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = cl3DLight
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
        object BtnOK: TBitBtn
          Left = 20
          Top = 74
          Width = 53
          Height = 25
          Caption = '&OK'
          TabOrder = 2
          OnClick = BtnOKClick
        end
        object BtnVolta: TBitBtn
          Left = 92
          Top = 74
          Width = 53
          Height = 25
          Caption = '&Volta'
          TabOrder = 3
          OnClick = BtnVoltaClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 514
        Height = 187
        Align = alClient
        Color = clSilver
        DataSource = DSQConsSel
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_CLI'
            Title.Alignment = taCenter
            Title.Caption = 'COD.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLI'
            Title.Alignment = taCenter
            Title.Caption = 'NOME'
            Width = 290
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDRES_CLI'
            Title.Alignment = taCenter
            Title.Caption = 'ENDERE'#199'O'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRES_CLI'
            Title.Alignment = taCenter
            Title.Caption = 'BAIRRO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDRES_CLI'
            Title.Alignment = taCenter
            Title.Caption = 'CIDADE'
            Width = 173
            Visible = True
          end>
      end
    end
    object BtnLimpar: TBitBtn
      Left = 148
      Top = 198
      Width = 53
      Height = 25
      Caption = '&Limpar'
      TabOrder = 3
      OnClick = BtnLimparClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 81
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RDG: TRadioGroup
      Left = 2
      Top = 2
      Width = 518
      Height = 55
      Align = alTop
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
      OnClick = RDGClick
    end
    object CheckParcelas: TCheckBox
      Left = 8
      Top = 62
      Width = 185
      Height = 17
      Caption = 'Imprimir as Parcelas'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 522
    Height = 56
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label21: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Cod.Carta'
    end
    object BtnConsCarta: TsSpeedButton
      Left = 68
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Consultar Carta'
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
      OnClick = BtnConsCartaClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label22: TLabel
      Left = 96
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Descri'#231#227'o da Carta'
    end
    object EdtCodCarta: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Carta'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodCartaEnter
      OnExit = EdtCodCartaExit
      OnKeyDown = EdtCodCartaKeyDown
      OnKeyPress = EdtCodCartaKeyPress
    end
    object EdtNomeCarta: TEdit
      Left = 96
      Top = 24
      Width = 417
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
  object Panel4: TPanel
    Left = 0
    Top = 366
    Width = 522
    Height = 41
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object BtnVis: TBitBtn
      Left = 164
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 284
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 407
    Width = 522
    Height = 19
    Panels = <>
  end
  object QConsSel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCarta
    SQL.Strings = (
      'SELECT COD_CLI, NOME_CLI, ENDRES_CLI, BAIRES_CLI, CIDRES_CLI'
      'FROM CLIENTE'
      'WHERE SELECIONADO_CLI = '#39'S'#39)
    Left = 160
    Top = 224
    object QConsSelCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QConsSelNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsSelENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QConsSelBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QConsSelCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
  end
  object DSQConsSel: TDataSource
    AutoEdit = False
    DataSet = QConsSel
    Left = 56
    Top = 224
  end
  object QRelCobranca: TFDQuery
    OnCalcFields = QRelCobrancaCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.PARCELA_CTR, R.SEQUENCIA_CTR, R.DATA_CTR,  R' +
        '.VENCTO_CTR, R.VALOR_CTR, R.DEVOLUCAO_CTR,'
      
        'C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI,C.ESTRES_CL' +
        'I, C.CEPRES_CLI, C.TELRES_CLI, C.NUMRES_CLI , R.COD_CLI, (CURREN' +
        'T_DATE - R.VENCTO_CTR) DIAS, P.DIAS_CARENCIA, P.JUROS_ATRASO'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN PARAMETROS P'
      'ON (R.COD_EMP = P.COD_EMP)'
      
        'WHERE R.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND R.DTPAGTO_C' +
        'TR IS NULL AND C.SELECIONADO_CLI = '#39'S'#39
      'ORDER BY C.NOME_CLI, R.VENCTO_CTR'
      '')
    Left = 248
    Top = 224
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QRelCobrancaCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QRelCobrancaPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QRelCobrancaSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QRelCobrancaDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QRelCobrancaVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QRelCobrancaVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCobrancaNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRelCobrancaCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QRelCobrancaDIAS: TIntegerField
      FieldName = 'DIAS'
      Required = True
    end
    object QRelCobrancaDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'PARAMETROS.DIAS_CARENCIA'
    end
    object QRelCobrancaJUROS_ATRASO: TBCDField
      FieldName = 'JUROS_ATRASO'
      Origin = 'PARAMETROS.JUROS_ATRASO'
      Precision = 18
      Size = 2
    end
    object QRelCobrancaCALC_JUROS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_JUROS'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QRelCobrancaDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCobrancaCALC_VALORLIQ: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALORLIQ'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QRelCobrancaENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QRelCobrancaBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QRelCobrancaCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QRelCobrancaESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QRelCobrancaCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QRelCobrancaTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = '"CLIENTE"."TELRES_CLI"'
      FixedChar = True
      Size = 13
    end
    object QRelCobrancaNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
  end
  object IBTRCarta: TFDTransaction
    Connection = DM.IBDatabase
    Left = 352
    Top = 224
  end
  object QCarta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT CONTEUDO_CARTA'
      'FROM CARTAS'
      'WHERE COD_CARTA = :CODCARTA')
    Left = 248
    Top = 168
    ParamData = <
      item
        Name = 'CODCARTA'
        DataType = ftInteger
      end>
    object QCartaCONTEUDO_CARTA: TMemoField
      FieldName = 'CONTEUDO_CARTA'
      Origin = 'CARTAS.CONTEUDO_CARTA'
      BlobType = ftMemo
      Size = 8
    end
  end
  object QDadosEmpresa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT FANTASIA_EMP, END_EMP, EST_EMP, CID_EMP, CEP_EMP, BAI_EMP'
      'FROM EMPRESA'
      'WHERE COD_EMP = :CODEMP')
    Left = 440
    Top = 224
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QDadosEmpresaFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = 'EMPRESA.FANTASIA_EMP'
      Size = 50
    end
    object QDadosEmpresaEND_EMP: TStringField
      FieldName = 'END_EMP'
      Origin = 'EMPRESA.END_EMP'
      Size = 50
    end
    object QDadosEmpresaEST_EMP: TStringField
      FieldName = 'EST_EMP'
      Origin = 'EMPRESA.EST_EMP'
      FixedChar = True
      Size = 2
    end
    object QDadosEmpresaCID_EMP: TStringField
      FieldName = 'CID_EMP'
      Origin = 'EMPRESA.CID_EMP'
      Size = 30
    end
    object QDadosEmpresaCEP_EMP: TStringField
      FieldName = 'CEP_EMP'
      Origin = 'EMPRESA.CEP_EMP'
      FixedChar = True
      Size = 9
    end
    object QDadosEmpresaBAI_EMP: TStringField
      FieldName = 'BAI_EMP'
      Origin = 'EMPRESA.BAI_EMP'
      Size = 30
    end
  end
end
