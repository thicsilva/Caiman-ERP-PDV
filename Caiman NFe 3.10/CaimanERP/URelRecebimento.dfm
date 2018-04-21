object FrmRelRecebimento: TFrmRelRecebimento
  Left = 366
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio de Recebimento'
  ClientHeight = 300
  ClientWidth = 417
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 241
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 160
      Top = 120
      Width = 249
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 2
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
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        Color = clSilver
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 16
        Width = 97
        Height = 21
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        Color = clSilver
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 120
      Width = 153
      Height = 49
      Caption = 'Caixa'
      TabOrder = 1
      object ComboCaixa: TComboBox
        Left = 8
        Top = 16
        Width = 137
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 216
      Width = 177
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
    object RdgOrdem: TRadioGroup
      Left = 9
      Top = 168
      Width = 400
      Height = 41
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'Alfab'#233'tica'
        'Data Pagamento')
      TabOrder = 3
    end
    object GBConvenio: TGroupBox
      Left = 2
      Top = 41
      Width = 413
      Height = 49
      Align = alTop
      Caption = 'Conv'#234'nio'
      TabOrder = 0
      object BtnConsConv: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Conv'#234'nio'
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
        OnClick = BtnConsConvClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodConv: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Conv'#234'nio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = EdtCodConvExit
        OnKeyDown = EdtCodConvKeyDown
        OnKeyPress = EdtCodConvKeyPress
      end
      object EdtNomeConv: TEdit
        Left = 88
        Top = 18
        Width = 315
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object RdgTipo: TRadioGroup
      Left = 2
      Top = 2
      Width = 413
      Height = 39
      Align = alTop
      Columns = 2
      Items.Strings = (
        'Detalhada'
        'Resumida')
      TabOrder = 5
      OnClick = RdgTipoClick
    end
    object CheckConvenio: TCheckBox
      Left = 8
      Top = 90
      Width = 305
      Height = 17
      Caption = 'Todos os Conv'#234'nios'
      TabOrder = 6
      OnClick = CheckConvenioClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 417
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 417
    Height = 19
    Panels = <>
  end
  object QRecDet: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.VENCTO_CTR, R.DTPAGTO_CTR, ' +
        'R.VALOR_CTR, R.ACRESCIMO_RECEBIDO_CTR,'
      
        'R.VLRPAGO_CTR, R.DEVOLUCAO_CTR, R.DESCONTO_CONCEDIDO_CTR, C.NOME' +
        '_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)')
    Left = 360
    Top = 112
    object QRecDetCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QRecDetSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QRecDetVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QRecDetDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QRecDetVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDetACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDetVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDetNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRecDetDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDetDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object QRecRes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT R.COD_CLI, SUM(R.VALOR_CTR) VALOR_BRUTO, SUM(R.ACRESCIMO_' +
        'RECEBIDO_CTR) ACRES_RECEBIDO,'
      'SUM(R.VLRPAGO_CTR) VALOR_PAGO, '
      
        'SUM(R.DEVOLUCAO_CTR) DEVOLUCAO, SUM(R.DESCONTO_CONCEDIDO_CTR) DE' +
        'SC_CONCEDIDO, C.NOME_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)')
    Left = 360
    Top = 176
    object QRecResVALOR_BRUTO: TBCDField
      FieldName = 'VALOR_BRUTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecResACRES_RECEBIDO: TBCDField
      FieldName = 'ACRES_RECEBIDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecResVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecResDEVOLUCAO: TBCDField
      FieldName = 'DEVOLUCAO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecResDESC_CONCEDIDO: TBCDField
      FieldName = 'DESC_CONCEDIDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecResNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Required = True
      Size = 60
    end
    object QRecResCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
  end
end
