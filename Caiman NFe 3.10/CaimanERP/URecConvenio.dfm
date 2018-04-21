object FrmRecConvenio: TFrmRecConvenio
  Left = 309
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recebimento de Conv'#234'nio'
  ClientHeight = 415
  ClientWidth = 523
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 113
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label2: TLabel
      Left = 328
      Top = 86
      Width = 31
      Height = 17
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 391
      Height = 49
      Caption = 'Conv'#234'nio'
      TabOrder = 0
      object BtnConsCon: TsSpeedButton
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
        OnClick = BtnConsConClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object cod_con: TEdit
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
        OnEnter = cod_conEnter
        OnExit = cod_conExit
        OnKeyDown = cod_conKeyDown
        OnKeyPress = cod_conKeyPress
      end
      object EdtNomeCon: TEdit
        Left = 88
        Top = 18
        Width = 289
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
    object GroupBox2: TGroupBox
      Left = 2
      Top = 56
      Width = 241
      Height = 47
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 117
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TMaskEdit
        Left = 24
        Top = 16
        Width = 77
        Height = 21
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = EdtDataIniExit
      end
      object EdtDataFin: TMaskEdit
        Left = 144
        Top = 16
        Width = 77
        Height = 21
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = EdtDataIniExit
      end
    end
    object BtnSair: TBitBtn
      Left = 424
      Top = 40
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object BtnOK: TBitBtn
      Left = 424
      Top = 8
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object EdtTotal: TCurrencyEdit
      Left = 368
      Top = 80
      Width = 121
      Height = 22
      Margins.Left = 5
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object CheckEmp: TCheckBox
      Left = 264
      Top = 56
      Width = 129
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 523
    Height = 231
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 519
      Height = 227
      Align = alClient
      Color = clSilver
      DataSource = DSQConsCTR
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODCLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMECLI'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DO CLIENTE'
          Width = 301
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCCLI'
          Title.Alignment = taCenter
          Title.Caption = 'RG'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 62
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 344
    Width = 523
    Height = 52
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 111
      Height = 13
      Caption = 'Data do Recebimento'
    end
    object Label7: TLabel
      Left = 128
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Tipo do Recebimento'
    end
    object EdtData: TDateTimePicker
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Date = 37981.618029594900000000
      Time = 37981.618029594900000000
      TabOrder = 0
    end
    object ComboTipo: TComboBox
      Left = 128
      Top = 24
      Width = 129
      Height = 21
      TabOrder = 1
      Items.Strings = (
        'DINHEIRO'
        'CHEQUE'
        'DEP'#211'SITO')
    end
    object BtnRec: TButton
      Left = 336
      Top = 19
      Width = 65
      Height = 25
      Caption = '&Receber '
      TabOrder = 2
      OnClick = BtnRecClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 396
    Width = 523
    Height = 19
    Panels = <>
  end
  object QConsCTR: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM REL_CONVENIO_RESUMIDO (:CODCON, :CODEMP, :DATAINI, :DATAFIN' +
        ')'
      'ORDER BY NOMECLI')
    Left = 88
    Top = 192
    ParamData = <
      item
        Name = 'CODCON'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QConsCTRCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = 'REL_CONVENIO_RESUMIDO.CODCLI'
    end
    object QConsCTRNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Origin = 'REL_CONVENIO_RESUMIDO.NOMECLI'
      Size = 60
    end
    object QConsCTRDOCCLI: TStringField
      FieldName = 'DOCCLI'
      Origin = 'REL_CONVENIO_RESUMIDO.DOCCLI'
    end
    object QConsCTRTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'REL_CONVENIO_RESUMIDO.TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsCTR: TDataSource
    AutoEdit = False
    DataSet = QConsCTR
    Left = 96
    Top = 248
  end
  object IBTRBaixa: TFDTransaction
    Connection = DM.IBDatabase
    Left = 240
    Top = 256
  end
  object IBSPBaixa: TFDStoredProc
    Connection = DM.IBDatabase
    Transaction = IBTRBaixa
    StoredProcName = 'BAIXA_PARCELAS_CONVENIO'
    Left = 240
    Top = 200
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CODCON'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TIPOREC'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODCAIXA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DTPAGTO'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
end
