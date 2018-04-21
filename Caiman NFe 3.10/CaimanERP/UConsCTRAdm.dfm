object FrmConsCTRAdm: TFrmConsCTRAdm
  Left = 399
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Contas a Receber Administradora'
  ClientHeight = 538
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 161
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
          'BANDEIRA'
          'CLIENTE')
      end
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 393
      Height = 73
      Caption = 'Consultar por'
      TabOrder = 1
      object BtnCons: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar'
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
        OnClick = BtnConsClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCod: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar '
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodEnter
        OnExit = EdtCodExit
        OnKeyDown = EdtCodKeyDown
        OnKeyPress = EdtConsKeyPress
      end
      object EdtNome: TEdit
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
      object EdtCons: TEdit
        Left = 8
        Top = 16
        Width = 377
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 2
        OnKeyPress = EdtConsKeyPress
      end
      object ComboBandeira: TComboBox
        Left = 8
        Top = 44
        Width = 377
        Height = 21
        Style = csDropDownList
        TabOrder = 3
      end
    end
    object GB2: TGroupBox
      Left = 424
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
      Left = 472
      Top = 96
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 560
      Top = 96
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 16
      Top = 136
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 773
    Height = 358
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 769
      Height = 319
      Align = alTop
      Color = clSilver
      DataSource = DSQConsRecAdm
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
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'PARC.'
          Width = 41
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMISSAO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 261
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ADMINISTRADORA'
          Title.Alignment = taCenter
          Width = 139
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'BANDEIRA'
          Title.Alignment = taCenter
          Width = 113
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TAXA'
          Title.Alignment = taCenter
          Width = 54
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'LIQUIDO'
          Title.Alignment = taCenter
          Title.Caption = 'L'#205'QUIDO'
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DOCUMENTO'
          Title.Alignment = taCenter
          Width = 91
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_PAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'DT PAGAMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'CAIXA'
          Width = 47
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
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.VENDA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR PAGO'
          Width = 78
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 341
      Top = 327
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 519
    Width = 773
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object QConsRecAdm: TFDQuery
    OnCalcFields = QConsRecAdmCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT C.*, (C.VALOR -  ((C.VALOR * C.TAXA) / 100)) LIQUIDO, A.D' +
        'ESCRICAO ADMINISTRADORA, B.DESCRICAO BANDEIRA, B.TIPO_CARTAO, B.' +
        'CODIGO_ADMINISTRADORA, CLI.NOME_CLI'
      'FROM CONTAS_RECEBER_ADM_CARTAO C'
      'INNER JOIN BANDEIRAS_CARTAO B'
      'ON (C.CODIGO_BANDEIRA = B.CODIGO)'
      'INNER JOIN ADMINISTRADORA_CARTAO A '
      'ON (B.CODIGO_ADMINISTRADORA = A.CODIGO)'
      'INNER JOIN CLIENTE CLI'
      'ON (C.COD_CLI = CLI.COD_CLI)')
    Left = 304
    Top = 208
    object QConsRecAdmCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO'
      Required = True
    end
    object QConsRecAdmCODIGO_BANDEIRA: TIntegerField
      FieldName = 'CODIGO_BANDEIRA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO_BANDEIRA'
      Required = True
    end
    object QConsRecAdmDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DOCUMENTO'
    end
    object QConsRecAdmEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.EMISSAO'
      Required = True
    end
    object QConsRecAdmVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecAdmVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VENCIMENTO'
      Required = True
    end
    object QConsRecAdmDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DATA_PAGAMENTO'
    end
    object QConsRecAdmCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_CAI'
      Required = True
    end
    object QConsRecAdmCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_EMP'
      Required = True
    end
    object QConsRecAdmCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_VEN'
    end
    object QConsRecAdmVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR_PAGO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecAdmACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.ACRESCIMO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecAdmDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DESCONTO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecAdmTAXA: TBCDField
      FieldName = 'TAXA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.TAXA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecAdmLIQUIDO: TBCDField
      FieldName = 'LIQUIDO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QConsRecAdmADMINISTRADORA: TStringField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QConsRecAdmBANDEIRA: TStringField
      FieldName = 'BANDEIRA'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QConsRecAdmTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Origin = 'BANDEIRAS_CARTAO.TIPO_CARTAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsRecAdmCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Calculated = True
    end
    object QConsRecAdmCODIGO_ADMINISTRADORA: TIntegerField
      FieldName = 'CODIGO_ADMINISTRADORA'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_ADMINISTRADORA'
      Required = True
    end
    object QConsRecAdmCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO_DUPLICATA'
    end
    object QConsRecAdmCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_CLI'
      Required = True
    end
    object QConsRecAdmNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsRecAdmPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.PARCELA'
      Required = True
    end
  end
  object DSQConsRecAdm: TDataSource
    AutoEdit = False
    DataSet = QConsRecAdm
    Left = 304
    Top = 272
  end
end
