object FrmDeposito: TFrmDeposito
  Left = 260
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dep'#243'sito de Cheques'
  ClientHeight = 451
  ClientWidth = 671
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 671
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label2: TLabel
      Left = 480
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Total Geral:'
    end
    object LTotalGeral: TLabel
      Left = 544
      Top = 64
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LTotalGeral'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GB2: TGroupBox
      Left = 8
      Top = 8
      Width = 249
      Height = 49
      Caption = 'Vencimento'
      TabOrder = 0
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 616
      Top = 24
      Width = 49
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 56
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 264
      Top = 8
      Width = 345
      Height = 49
      Caption = 'Cliente'
      TabOrder = 1
      object BtnConscli: TsSpeedButton
        Left = 61
        Top = 18
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
        OnClick = BtnConscliClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object edtcodCli: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para consultar cliente'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = edtcodCliEnter
        OnExit = edtcodCliExit
        OnKeyDown = edtcodCliKeyDown
        OnKeyPress = edtcodCliKeyPress
      end
      object EdtNomecli: TEdit
        Left = 88
        Top = 18
        Width = 249
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
    object CheckDev: TCheckBox
      Left = 176
      Top = 56
      Width = 145
      Height = 17
      Caption = 'Incluir os Devolvidos'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 671
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 671
      Height = 263
      Align = alClient
      Color = clSilver
      DataSource = DSQConsChe
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'C.CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 196
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEP.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEV.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEGDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG DEP.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEGDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG DEV.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'OBS.'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 344
    Width = 671
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 8
      Top = 32
      Width = 369
      Height = 49
      Caption = 'Conta para Dep'#243'sito'
      TabOrder = 0
      object BtnConsConta: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Conta'
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
        OnClick = BtnConsContaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodConta: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para consultar Conta'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodContaEnter
        OnExit = EdtCodContaExit
        OnKeyDown = EdtCodContaKeyDown
        OnKeyPress = edtcodCliKeyPress
      end
      object EdtNomeConta: TEdit
        Left = 88
        Top = 18
        Width = 273
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
    object CheckSel: TCheckBox
      Left = 8
      Top = 7
      Width = 137
      Height = 17
      Caption = 'Selecionar Todos'
      TabOrder = 3
      OnClick = CheckSelClick
    end
    object GroupBox3: TGroupBox
      Left = 384
      Top = 31
      Width = 121
      Height = 49
      Caption = 'Data do Dep'#243'sito'
      TabOrder = 1
      object EdtDataDep: TDateTimePicker
        Left = 16
        Top = 16
        Width = 97
        Height = 21
        Date = 37955.375749201400000000
        Time = 37955.375749201400000000
        TabOrder = 0
      end
    end
    object BtnConf: TButton
      Left = 536
      Top = 21
      Width = 65
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 2
      OnClick = BtnConfClick
    end
    object BtnSair: TButton
      Left = 536
      Top = 53
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object QConsChe: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsChe
    SQL.Strings = (
      
        'SELECT CHE.COD_CHE, CHE.COD_CLI, CHE.AGENCIA_CHE, CHE.CONTA_CHE,' +
        ' CHE.NUMERO_CHE, CHE.EMISSAO_CHE, CHE.VENCTO_CHE, CHE.VALOR_CHE,' +
        ' CHE.PRIDEP_CHE, CHE.PRIDEV_CHE, CHE.SEGDEP_CHE, CHE.SEGDEV_CHE,' +
        ' CHE.OBS_CHE, CLI.NOME_CLI, BAN.NOME_BAN,'
      'CHE.PAGTODEV_CHE, CHE.COD_EMP, E.NOME_CLI EMITENTE'
      'FROM CHEQUE CHE'
      'INNER JOIN CLIENTE CLI'
      'ON (CHE.COD_CLI = CLI.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (CHE.COD_EMITENTE = E.COD_CLI)'
      'INNER JOIN BANCO BAN'
      'ON (CHE.COD_BANCO = BAN.COD_BAN)'
      '')
    Left = 232
    Top = 152
    object QConsCheCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QConsCheCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CHEQUE.COD_CLI'
      Required = True
    end
    object QConsCheAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QConsCheCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QConsCheNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QConsCheEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QConsCheVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
    object QConsCheVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChePRIDEP_CHE: TDateField
      FieldName = 'PRIDEP_CHE'
      Origin = 'CHEQUE.PRIDEP_CHE'
    end
    object QConsChePRIDEV_CHE: TDateField
      FieldName = 'PRIDEV_CHE'
      Origin = 'CHEQUE.PRIDEV_CHE'
    end
    object QConsCheSEGDEP_CHE: TDateField
      FieldName = 'SEGDEP_CHE'
      Origin = 'CHEQUE.SEGDEP_CHE'
    end
    object QConsCheSEGDEV_CHE: TDateField
      FieldName = 'SEGDEV_CHE'
      Origin = 'CHEQUE.SEGDEV_CHE'
    end
    object QConsCheOBS_CHE: TStringField
      FieldName = 'OBS_CHE'
      Origin = 'CHEQUE.OBS_CHE'
      Size = 50
    end
    object QConsCheNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsCheNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QConsChePAGTODEV_CHE: TDateField
      FieldName = 'PAGTODEV_CHE'
      Origin = 'CHEQUE.PAGTODEV_CHE'
    end
    object QConsCheCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CHEQUE.COD_EMP'
      Required = True
    end
    object QConsCheEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object DSQConsChe: TDataSource
    AutoEdit = False
    DataSet = QConsChe
    Left = 232
    Top = 208
  end
  object IBTRConsChe: TFDTransaction
    Connection = DM.IBDatabase
    Left = 304
    Top = 152
  end
  object IBTRDeposita: TFDTransaction
    Connection = DM.IBDatabase
    Left = 416
    Top = 208
  end
  object QDeposita: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRDeposita
    Left = 416
    Top = 152
  end
  object QinsCC: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRDeposita
    SQL.Strings = (
      
        'INSERT INTO LANCAMENTOS_CONTAS_CORRENTE (COD_LAN, COD_CONTA, DAT' +
        'AEMI_LAN, DATAVENC_LAN, NUM_CHEQUE_LAN, '
      
        'VALOR_LAN, CONCILIADO_LAN, DC_LAN, HISTORICO_LAN, COD_DOC, DOCUM' +
        'ENTO_LAN, COD_EMP)'
      
        'VALUES (GEN_ID(GNT_COD_CC, 1), :2, :3, :4, :5, :6, :7, :8, :9, :' +
        '10, :11, :12)')
    Left = 496
    Top = 152
    ParamData = <
      item
        Name = '2'
        DataType = ftInteger
      end
      item
        Name = '3'
        DataType = ftDate
      end
      item
        Name = '4'
        DataType = ftDate
      end
      item
        Name = '5'
        DataType = ftString
      end
      item
        Name = '6'
        DataType = ftFloat
      end
      item
        Name = '7'
        DataType = ftString
      end
      item
        Name = '8'
        DataType = ftString
      end
      item
        Name = '9'
        DataType = ftString
      end
      item
        Name = '10'
        DataType = ftInteger
      end
      item
        Name = '11'
        DataType = ftString
      end
      item
        Name = '12'
        DataType = ftInteger
      end>
  end
  object IBSPInsFluxo: TFDStoredProc
    Connection = DM.IBDatabase
    Transaction = IBTRDeposita
    StoredProcName = 'INS_FLUXO'
    Left = 568
    Top = 216
    ParamData = <
      item
        Name = 'CODCAI'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DC'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'HIST'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DOC'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODCAIXA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
