object FrmConsLancReceber: TFrmConsLancReceber
  Left = 265
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Lan'#231'amento do Contas a Receber'
  ClientHeight = 534
  ClientWidth = 818
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
    Width = 818
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 393
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 377
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'DATA EMISS'#195'O'
          'DATA VENCIMENTO'
          'C'#211'DIGO'
          'CLIENTE'
          'N'#218'MERO DOCUMENTO')
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 393
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
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
      end
      object EdtNomeCli: TEdit
        Left = 98
        Top = 16
        Width = 287
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
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
      object EdtCod: TEdit
        Left = 8
        Top = 16
        Width = 377
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 2
      end
    end
    object GB2: TGroupBox
      Left = 408
      Top = 8
      Width = 233
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 2
      object Label1: TLabel
        Left = 112
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
        Date = 37920.469548946800000000
        Time = 37920.469548946800000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 128
        Top = 16
        Width = 97
        Height = 21
        Date = 37920.469548946800000000
        Time = 37920.469548946800000000
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 448
      Top = 80
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 536
      Top = 80
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 104
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 818
    Height = 394
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnLocalizar: TButton
      Left = 377
      Top = 361
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 814
      Height = 351
      Align = alTop
      Color = clSilver
      DataSource = DSQConsReceber
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PARCELA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'PARC'
          Width = 40
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEQUENCIA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ.'
          Width = 35
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 30
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO'
          Width = 191
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO.'
          Width = 69
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DTPAGTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DATA PAGTO.'
          Width = 82
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VLR. BRUTO'
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DEVOLUCAO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DEVOL.'
          Width = 71
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 325
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'SCIMO'
          Width = 78
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DESCONTO'
          Width = 72
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_RECEBIDO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'S.REC.'
          Width = 72
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
          Title.Caption = 'VALOR PAGO'
          Width = 90
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMDOCUMENTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Width = 91
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'VENDA'
          Width = 57
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'OBSERVA'#199#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_COB'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO COBRAN'#199'A'
          Width = 224
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 515
    Width = 818
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object QConsReceber: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT C.*, L.NOME_CLI, T.NOME_COB, CL.DESCRICAO'
      'FROM CONTAS_RECEBER C'
      'INNER JOIN CLIENTE L '
      'ON (C.COD_CLI = L.COD_CLI)'
      'INNER JOIN TIPO_COBRANCA T'
      'ON (C.COD_COB = T.COD_COB)'
      'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER CL'
      'ON (C.CODIGO_CLASSIFICACAO = CL.CODIGO)')
    Left = 256
    Top = 224
    object QConsReceberCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsReceberSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsReceberCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QConsReceberDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QConsReceberCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QConsReceberCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QConsReceberVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsReceberVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QConsReceberVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberACRESCIMO_CTR: TBCDField
      FieldName = 'ACRESCIMO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_CTR'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberDESCONTO_CTR: TBCDField
      FieldName = 'DESCONTO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CTR'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QConsReceberOBS_CTR: TStringField
      FieldName = 'OBS_CTR'
      Origin = 'CONTAS_RECEBER.OBS_CTR'
      Size = 60
    end
    object QConsReceberACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsReceberCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER.COD_CAI'
    end
    object QConsReceberCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'CONTAS_RECEBER.COD_COB'
      Required = True
    end
    object QConsReceberNOME_COB: TStringField
      FieldName = 'NOME_COB'
      Origin = 'TIPO_COBRANCA.NOME_COB'
      Required = True
      Size = 50
    end
    object QConsReceberCAIXA_EMISSAO_CTR: TIntegerField
      FieldName = 'CAIXA_EMISSAO_CTR'
      Origin = 'CONTAS_RECEBER.CAIXA_EMISSAO_CTR'
    end
    object QConsReceberPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QConsReceberDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsReceberCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER.CODIGO_DUPLICATA'
    end
    object QConsReceberCODIGO_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_FORMA_PAGAMENTO'
      Origin = 'CONTAS_RECEBER.CODIGO_FORMA_PAGAMENTO'
    end
    object QConsReceberCODIGO_CLASSIFICACAO: TIntegerField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Origin = 'CONTAS_RECEBER.CODIGO_CLASSIFICACAO'
      Required = True
    end
    object QConsReceberDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSQConsReceber: TDataSource
    AutoEdit = False
    DataSet = QConsReceber
    Left = 256
    Top = 296
  end
end
