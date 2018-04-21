object FrmConsContasRec: TFrmConsContasRec
  Left = 309
  Top = 82
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Contas a Receber'
  ClientHeight = 537
  ClientWidth = 806
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
    Width = 806
    Height = 129
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GB2: TGroupBox
      Left = 184
      Top = 8
      Width = 241
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        Color = clSilver
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        Color = clSilver
        TabOrder = 1
      end
    end
    object RDG: TRadioGroup
      Left = 8
      Top = 8
      Width = 169
      Height = 49
      Caption = 'Contas'
      Columns = 2
      Items.Strings = (
        'Recebidas'
        'A Receber')
      TabOrder = 0
      OnClick = RDGClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 104
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 417
      Height = 49
      Caption = 'Cliente'
      TabOrder = 2
      object BtnConsCli: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Cliente'
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
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodCliEnter
        OnExit = EdtCodCliExit
        OnKeyDown = EdtCodCliKeyDown
        OnKeyPress = EdtCodCliKeyPress
      end
      object EdtNomeCli: TEdit
        Left = 98
        Top = 16
        Width = 311
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
    object BtnOk: TButton
      Left = 490
      Top = 40
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 490
      Top = 72
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 518
    Width = 806
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 129
    Width = 806
    Height = 64
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Total Bruto'
    end
    object Label5: TLabel
      Left = 272
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object Label6: TLabel
      Left = 400
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label7: TLabel
      Left = 528
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Total L'#237'quido'
    end
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 802
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Totais'
      Color = 14667965
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 30
    end
    object Label3: TLabel
      Left = 144
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Devolu'#231#227'o'
    end
    object EdtTotalBruto: TCurrencyEdit
      Left = 16
      Top = 32
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 272
      Top = 32
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtDesc: TCurrencyEdit
      Left = 400
      Top = 32
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtTotalLiq: TCurrencyEdit
      Left = 528
      Top = 32
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtDevol: TCurrencyEdit
      Left = 144
      Top = 32
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
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
  object Panel2: TPanel
    Left = 0
    Top = 193
    Width = 806
    Height = 325
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object DBGridARec: TDBGrid
      Left = 2
      Top = 2
      Width = 802
      Height = 287
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSQConsAReceber
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnCobClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'COD'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEQUENCIA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ'
          Width = 45
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_COB'
          Title.Alignment = taCenter
          Title.Caption = 'COB.'
          Width = 38
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
          FieldName = 'DATA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DIAS'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 84
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DEVOLUCAO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DEVOL.'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'JUROS_ATRASO'
          Title.Alignment = taCenter
          Title.Caption = 'TX JUROS'
          Width = 68
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 84
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 40
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'VENDA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'CAIXA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Visible = True
        end>
    end
    object DBGridRec: TDBGrid
      Left = 2
      Top = 2
      Width = 799
      Height = 287
      Color = clSilver
      DataSource = DSQConsRecebidas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEQUENCIA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ'
          Width = 38
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_COB'
          Title.Alignment = taCenter
          Title.Caption = 'COB.'
          Width = 42
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 291
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DTPAGTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 87
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DEVOLUCAO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DEVOL.'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_RECEBIDO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'ACRES.PAGO'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO_CONCEDIDO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DESC.CONCEDIDO'
          Width = 105
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VLRPAGO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VLR PAGO'
          Width = 102
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'ACRESC.'
          Width = 89
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DESCONTO'
          Width = 78
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'CAIXA'
          Width = 50
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 36
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'VENDA'
          Width = 59
          Visible = True
        end>
    end
    object BtnCob: TButton
      Left = 229
      Top = 296
      Width = 144
      Height = 25
      Caption = '&Trocar Tipo de Cobran'#231'a'
      TabOrder = 2
      OnClick = BtnCobClick
    end
    object BtnItens: TButton
      Left = 433
      Top = 296
      Width = 144
      Height = 25
      Caption = '&Itens'
      TabOrder = 3
      OnClick = BtnItensClick
    end
  end
  object QConsRecebidas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsRec
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.COD_EMP, R.DATA_CTR, R.COD_' +
        'VENDA, R.VENCTO_CTR, R.VALOR_CTR, R.DTPAGTO_CTR, R.VLRPAGO_CTR, ' +
        'R.ACRESCIMO_CTR, R.DESCONTO_CTR, R.ACRESCIMO_RECEBIDO_CTR, R.DES' +
        'CONTO_CONCEDIDO_CTR, R.COD_CAI, R.COD_COB,  R.DEVOLUCAO_CTR,'
      'C.NOME_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)')
    Left = 104
    Top = 256
    object QConsRecebidasCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsRecebidasSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsRecebidasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QConsRecebidasDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QConsRecebidasCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QConsRecebidasVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsRecebidasVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QConsRecebidasVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasACRESCIMO_CTR: TBCDField
      FieldName = 'ACRESCIMO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasDESCONTO_CTR: TBCDField
      FieldName = 'DESCONTO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecebidasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER.COD_CAI'
    end
    object QConsRecebidasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsRecebidasTIPOREC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPOREC'
      Calculated = True
    end
    object QConsRecebidasCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'CONTAS_RECEBER.COD_COB'
      Required = True
    end
    object QConsRecebidasDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsRecebidas: TDataSource
    AutoEdit = False
    DataSet = QConsRecebidas
    Left = 104
    Top = 312
  end
  object QConsAReceber: TFDQuery
    OnCalcFields = QConsAReceberCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRConsRec
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.COD_EMP, R.DATA_CTR, R.COD_' +
        'VENDA, R.VENCTO_CTR, R.VALOR_CTR,    R.COD_CAI, R.DEVOLUCAO_CTR,' +
        ' C.NOME_CLI, P.DIAS_CARENCIA, P.JUROS_ATRASO, R.COD_COB'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN PARAMETROS P'
      'ON (R.COD_EMP = P.COD_EMP)')
    Left = 240
    Top = 256
    object QConsAReceberCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsAReceberSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsAReceberCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QConsAReceberDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QConsAReceberCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QConsAReceberVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsAReceberVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsAReceberCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER.COD_CAI'
    end
    object QConsAReceberNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsAReceberDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'PARAMETROS.DIAS_CARENCIA'
    end
    object QConsAReceberJUROS_ATRASO: TBCDField
      FieldName = 'JUROS_ATRASO'
      Origin = 'PARAMETROS.JUROS_ATRASO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsAReceberACRESCIMO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ACRESCIMO'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QConsAReceberTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QConsAReceberDIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIAS'
      Calculated = True
    end
    object QConsAReceberCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'CONTAS_RECEBER.COD_COB'
      Required = True
    end
    object QConsAReceberDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsAReceber: TDataSource
    AutoEdit = False
    DataSet = QConsAReceber
    Left = 240
    Top = 312
  end
  object IBTRConsRec: TFDTransaction
    Connection = DM.IBDatabase
    Left = 392
    Top = 264
  end
end
