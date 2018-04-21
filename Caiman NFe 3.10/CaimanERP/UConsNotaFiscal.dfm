object FrmConsNotaFiscal: TFrmConsNotaFiscal
  Left = 348
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Nota Fiscal'
  ClientHeight = 549
  ClientWidth = 734
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 113
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 177
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 161
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'DATA EMISS'#195'O'
          'CLIENTE'
          'NUMERO DA NF'
          'CANCELADA')
      end
    end
    object GB2: TGroupBox
      Left = 200
      Top = 8
      Width = 249
      Height = 49
      Caption = 'Emiss'#227'o'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Date = 38348.512983275500000000
        Time = 38348.512983275500000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 16
        Width = 97
        Height = 21
        Date = 38348.512983275500000000
        Time = 38348.512983275500000000
        TabOrder = 1
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 57
      Width = 441
      Height = 49
      TabOrder = 2
      object BtnConsCli: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Cliente'
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
      object EdtCodCli: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar Cliente'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodCliEnter
        OnExit = EdtCodCliExit
        OnKeyDown = EdtCodCliKeyDown
        OnKeyPress = EdtNumKeyPress
      end
      object EdtNomeCli: TEdit
        Left = 98
        Top = 16
        Width = 327
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
      object EdtNum: TEdit
        Left = 5
        Top = 15
        Width = 424
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 2
        OnKeyPress = EdtNumKeyPress
      end
    end
    object BtnOk: TButton
      Left = 514
      Top = 32
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 514
      Top = 64
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 734
    Height = 417
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Shape1: TShape
      Left = 56
      Top = 381
      Width = 17
      Height = 17
      Brush.Color = clRed
      Pen.Color = clRed
    end
    object Label2: TLabel
      Left = 88
      Top = 384
      Width = 112
      Height = 13
      Caption = 'Nota Fiscal Cancelada'
    end
    object Label3: TLabel
      Left = 464
      Top = 384
      Width = 51
      Height = 13
      Caption = 'Total >>>'
    end
    object DBGridItens: TDBGrid
      Left = 2
      Top = 1
      Width = 623
      Height = 368
      Color = clGradientInactiveCaption
      DataSource = DSItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'ORD.'
          Width = 26
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.PRO'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 327
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 44
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UNIT'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 51
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'UND.'
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 730
      Height = 367
      Align = alTop
      Color = clSilver
      DataSource = DSQConsNF
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_NF'
          Title.Alignment = taCenter
          Title.Caption = 'COD'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clWhite
          Expanded = False
          FieldName = 'NOTA_IMPRESSA'
          Title.Alignment = taCenter
          Title.Caption = 'IMP'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO NOTA'
          Width = 117
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_EMISSAO_NF'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_SAIDA_NF'
          Title.Alignment = taCenter
          Title.Caption = 'SA'#205'DA'
          Width = 63
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_NOTA_NF'
          Title.Alignment = taCenter
          Title.Caption = 'NUM.'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_TOTAL_NF'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CFO'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CFO_2'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'TRANSPORTADORA'
          Width = 285
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 241
      Top = 380
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnItens: TButton
      Left = 329
      Top = 380
      Width = 65
      Height = 25
      Caption = '&Itens'
      TabOrder = 3
      OnClick = BtnItensClick
    end
    object EdtTotal: TCurrencyEdit
      Left = 520
      Top = 379
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 530
    Width = 734
    Height = 19
    Panels = <>
  end
  object QConsNF: TFDQuery
    OnCalcFields = QConsNFCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRNF
    SQL.Strings = (
      'SELECT N.*, C.NOME_CLI, T.NOME_TRA, F.RAZAO_FOR'
      'FROM NOTA_FISCAL N'
      'LEFT JOIN CLIENTE C'
      'ON (N.COD_CLI = C.COD_CLI)'
      'LEFT JOIN FORNECEDOR F'
      'ON (N.COD_FOR = F.COD_FOR)'
      'LEFT JOIN TRANSPORTADORA T'
      'ON (N.COD_TRA = T.COD_TRA)')
    Left = 264
    Top = 184
    object QConsNFCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'NOTA_FISCAL.COD_NF'
      Required = True
    end
    object QConsNFCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'NOTA_FISCAL.COD_EMP'
      Required = True
    end
    object QConsNFNUMERO_NOTA_NF: TIntegerField
      FieldName = 'NUMERO_NOTA_NF'
      Origin = 'NOTA_FISCAL.NUMERO_NOTA_NF'
      Required = True
    end
    object QConsNFCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'NOTA_FISCAL.COD_CLI'
      Required = True
    end
    object QConsNFDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'NOTA_FISCAL.DATA_EMISSAO_NF'
      Required = True
    end
    object QConsNFDATA_SAIDA_NF: TDateField
      FieldName = 'DATA_SAIDA_NF'
      Origin = 'NOTA_FISCAL.DATA_SAIDA_NF'
    end
    object QConsNFHORA_SAIDA_NF: TTimeField
      FieldName = 'HORA_SAIDA_NF'
      Origin = 'NOTA_FISCAL.HORA_SAIDA_NF'
    end
    object QConsNFCOD_TRA: TIntegerField
      FieldName = 'COD_TRA'
      Origin = 'NOTA_FISCAL.COD_TRA'
      Required = True
    end
    object QConsNFBASE_CALCULO_ICMS_NF: TBCDField
      FieldName = 'BASE_CALCULO_ICMS_NF'
      Origin = 'NOTA_FISCAL.BASE_CALCULO_ICMS_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_ICMS_NF: TBCDField
      FieldName = 'VALOR_ICMS_NF'
      Origin = 'NOTA_FISCAL.VALOR_ICMS_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFBASE_SUBST_NF: TBCDField
      FieldName = 'BASE_SUBST_NF'
      Origin = 'NOTA_FISCAL.BASE_SUBST_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_SUBST_NF: TBCDField
      FieldName = 'VALOR_SUBST_NF'
      Origin = 'NOTA_FISCAL.VALOR_SUBST_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_TOTAL_PROD_NF: TBCDField
      FieldName = 'VALOR_TOTAL_PROD_NF'
      Origin = 'NOTA_FISCAL.VALOR_TOTAL_PROD_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_FRETE_NF: TBCDField
      FieldName = 'VALOR_FRETE_NF'
      Origin = 'NOTA_FISCAL.VALOR_FRETE_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_SEGURO_NF: TBCDField
      FieldName = 'VALOR_SEGURO_NF'
      Origin = 'NOTA_FISCAL.VALOR_SEGURO_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFOUTRAS_DESPESAS_NF: TBCDField
      FieldName = 'OUTRAS_DESPESAS_NF'
      Origin = 'NOTA_FISCAL.OUTRAS_DESPESAS_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_IPI_NF: TBCDField
      FieldName = 'VALOR_IPI_NF'
      Origin = 'NOTA_FISCAL.VALOR_IPI_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_TOTAL_NF: TBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = 'NOTA_FISCAL.VALOR_TOTAL_NF'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsNFESPECIE_NF: TStringField
      FieldName = 'ESPECIE_NF'
      Origin = 'NOTA_FISCAL.ESPECIE_NF'
      Size = 10
    end
    object QConsNFMARCA_NF: TStringField
      FieldName = 'MARCA_NF'
      Origin = 'NOTA_FISCAL.MARCA_NF'
      Size = 10
    end
    object QConsNFNUMERO_NF: TStringField
      FieldName = 'NUMERO_NF'
      Origin = 'NOTA_FISCAL.NUMERO_NF'
      Size = 10
    end
    object QConsNFINF_COMPL_NF: TMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = 'NOTA_FISCAL.INF_COMPL_NF'
      BlobType = ftMemo
      Size = 8
    end
    object QConsNFCANCELADA_NF: TStringField
      FieldName = 'CANCELADA_NF'
      Origin = 'NOTA_FISCAL.CANCELADA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsNFFRETE_CONTA_NF: TStringField
      FieldName = 'FRETE_CONTA_NF'
      Origin = 'NOTA_FISCAL.FRETE_CONTA_NF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsNFNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsNFNOME_TRA: TStringField
      FieldName = 'NOME_TRA'
      Origin = 'TRANSPORTADORA.NOME_TRA'
      Required = True
      Size = 60
    end
    object QConsNFCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'NOTA_FISCAL.COD_FOR'
    end
    object QConsNFRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Size = 60
    end
    object QConsNFDESCONTO_NF: TBCDField
      FieldName = 'DESCONTO_NF'
      Origin = 'NOTA_FISCAL.DESCONTO_NF'
      Precision = 18
      Size = 2
    end
    object QConsNFTIPO_CLIENTE: TStringField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'NOTA_FISCAL.TIPO_CLIENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsNFNOTA_IMPRESSA: TStringField
      FieldName = 'NOTA_IMPRESSA'
      Origin = 'NOTA_FISCAL.NOTA_IMPRESSA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsNFCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'NOTA_FISCAL.COD_VENDA'
    end
    object QConsNFCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'NOTA_FISCAL.COD_TPV'
      Required = True
    end
    object QConsNFSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'NOTA_FISCAL.SERIE_NOTA'
      Size = 3
    end
    object QConsNFTIPO_NOTA_FISCAL: TIntegerField
      FieldName = 'TIPO_NOTA_FISCAL'
      Origin = 'NOTA_FISCAL.TIPO_NOTA_FISCAL'
      Required = True
    end
    object QConsNFCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'NOTA_FISCAL.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsNFCODIGO_OUTRA_ENTRADA: TIntegerField
      FieldName = 'CODIGO_OUTRA_ENTRADA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_ENTRADA'
    end
    object QConsNFCODIGO_OUTRA_SAIDA: TIntegerField
      FieldName = 'CODIGO_OUTRA_SAIDA'
      Origin = 'NOTA_FISCAL.CODIGO_OUTRA_SAIDA'
    end
    object QConsNFCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Size = 25
      Calculated = True
    end
    object QConsNFCHAVE_ACESSO_NFE: TStringField
      FieldName = 'CHAVE_ACESSO_NFE'
      Origin = 'NOTA_FISCAL.CHAVE_ACESSO_NFE'
      Size = 44
    end
    object QConsNFPROTOCOLO_NFE: TStringField
      FieldName = 'PROTOCOLO_NFE'
      Origin = 'NOTA_FISCAL.PROTOCOLO_NFE'
      Size = 50
    end
    object QConsNFSTATUS_TRANSMITIDA: TStringField
      FieldName = 'STATUS_TRANSMITIDA'
      Origin = 'NOTA_FISCAL.STATUS_TRANSMITIDA'
      FixedChar = True
      Size = 1
    end
    object QConsNFSTATUS_RETORNO: TStringField
      FieldName = 'STATUS_RETORNO'
      Origin = 'NOTA_FISCAL.STATUS_RETORNO'
      FixedChar = True
      Size = 1
    end
    object QConsNFSTATUS_CANCELADO: TStringField
      FieldName = 'STATUS_CANCELADO'
      Origin = 'NOTA_FISCAL.STATUS_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object QConsNFSTATUS_INUTILIZADO: TStringField
      FieldName = 'STATUS_INUTILIZADO'
      Origin = 'NOTA_FISCAL.STATUS_INUTILIZADO'
      FixedChar = True
      Size = 1
    end
    object QConsNFSTATUS_EMAIL: TStringField
      FieldName = 'STATUS_EMAIL'
      Origin = 'NOTA_FISCAL.STATUS_EMAIL'
      FixedChar = True
      Size = 1
    end
    object QConsNFJUSTIFICATIVA_CANCEL_INUTIL: TStringField
      FieldName = 'JUSTIFICATIVA_CANCEL_INUTIL'
      Origin = 'NOTA_FISCAL.JUSTIFICATIVA_CANCEL_INUTIL'
      Size = 100
    end
    object QConsNFPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NOTA_FISCAL.PLACA_TRANSP'
      FixedChar = True
      Size = 8
    end
    object QConsNFUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NOTA_FISCAL.UF_PLACA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object QConsNFPESO_BRUTO_NF: TBCDField
      FieldName = 'PESO_BRUTO_NF'
      Origin = 'NOTA_FISCAL.PESO_BRUTO_NF'
      Precision = 18
      Size = 2
    end
    object QConsNFPESO_LIQUIDO_NF: TBCDField
      FieldName = 'PESO_LIQUIDO_NF'
      Origin = 'NOTA_FISCAL.PESO_LIQUIDO_NF'
      Precision = 18
      Size = 2
    end
    object QConsNFQUANTIDADE_NF: TIntegerField
      FieldName = 'QUANTIDADE_NF'
      Origin = 'NOTA_FISCAL.QUANTIDADE_NF'
    end
    object QConsNFCHAVE2: TStringField
      FieldName = 'CHAVE2'
      Origin = '"NOTA_FISCAL"."CHAVE2"'
      Size = 255
    end
    object QConsNFDEPEC: TIntegerField
      FieldName = 'DEPEC'
      Origin = '"NOTA_FISCAL"."DEPEC"'
    end
    object QConsNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = '"NOTA_FISCAL"."VALOR_PIS"'
      Precision = 18
      Size = 2
    end
    object QConsNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = '"NOTA_FISCAL"."VALOR_COFINS"'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsNF: TDataSource
    AutoEdit = False
    DataSet = QConsNF
    Left = 264
    Top = 240
  end
  object IBTRNF: TFDTransaction
    Connection = DM.IBDatabase
    Left = 208
    Top = 184
  end
  object QItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT I.COD_PRO, I.QUANT, I.UNIT, I.UNIDADE, I.ORDEM, P.NOME_PR' +
        'O'
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.COD_NF = :CODNF'
      'ORDER BY I.ORDEM')
    Left = 320
    Top = 184
    ParamData = <
      item
        Name = 'CODNF'
      end>
    object QItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_NOTA_FISCAL.COD_PRO'
    end
    object QItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_NOTA_FISCAL.QUANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QItensUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'ITENS_NOTA_FISCAL.UNIT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'ITENS_NOTA_FISCAL.UNIDADE'
      Size = 4
    end
    object QItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_NOTA_FISCAL.ORDEM'
      Required = True
    end
    object QItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
  end
  object DSItens: TDataSource
    AutoEdit = False
    DataSet = QItens
    Left = 320
    Top = 240
  end
end
