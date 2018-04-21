object FrmRelConv: TFrmRelConv
  Left = 371
  Top = 326
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Convenio'
  ClientHeight = 189
  ClientWidth = 452
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
    Width = 452
    Height = 129
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 448
      Height = 49
      Align = alTop
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
        Width = 345
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
    object RDG: TRadioGroup
      Left = 232
      Top = 56
      Width = 201
      Height = 49
      Caption = 'Tipo '
      Columns = 2
      Items.Strings = (
        'Detalhado'
        'Resumido')
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 56
      Width = 217
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 101
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TMaskEdit
        Left = 8
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
        Left = 120
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
    object CheckEmp: TCheckBox
      Left = 8
      Top = 104
      Width = 257
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 452
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 80
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnvisClick
    end
    object BtnImp: TBitBtn
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnvisClick
    end
    object BtnSair: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnsairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 170
    Width = 452
    Height = 19
    Panels = <>
  end
  object QConvDet: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM REL_CONVENIO_DETALHADO (:CODCON, :CODEMP, :DATAINI, :DATAFI' +
        'N)'
      'ORDER BY NOMECLI, DATACTR')
    Left = 224
    Top = 8
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
    object QConvDetCODCTR: TIntegerField
      FieldName = 'CODCTR'
      Origin = 'REL_CONVENIO_DETALHADO.CODCTR'
    end
    object QConvDetSEQCTR: TIntegerField
      FieldName = 'SEQCTR'
      Origin = 'REL_CONVENIO_DETALHADO.SEQCTR'
    end
    object QConvDetDATACTR: TDateField
      FieldName = 'DATACTR'
      Origin = 'REL_CONVENIO_DETALHADO.DATACTR'
    end
    object QConvDetVALORCTR: TBCDField
      FieldName = 'VALORCTR'
      Origin = 'REL_CONVENIO_DETALHADO.VALORCTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConvDetNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Origin = 'REL_CONVENIO_DETALHADO.NOMECLI'
      Size = 60
    end
    object QConvDetCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = 'REL_CONVENIO_DETALHADO.CODCLI'
    end
    object QConvDetDOCCLI: TStringField
      FieldName = 'DOCCLI'
      Origin = 'REL_CONVENIO_DETALHADO.DOCCLI'
    end
  end
  object DSQConvDet: TDataSource
    AutoEdit = False
    DataSet = QConvDet
    Left = 328
    Top = 8
  end
  object QConvRes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM REL_CONVENIO_RESUMIDO (:CODCON, :CODEMP, :DATAINI, :DATAFIN' +
        ')'
      'ORDER BY NOMECLI')
    Left = 144
    Top = 8
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
    object QConvResCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Origin = 'REL_CONVENIO_RESUMIDO.CODCLI'
    end
    object QConvResNOMECLI: TStringField
      FieldName = 'NOMECLI'
      Origin = 'REL_CONVENIO_RESUMIDO.NOMECLI'
      Size = 60
    end
    object QConvResTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'REL_CONVENIO_RESUMIDO.TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConvResDOCCLI: TStringField
      FieldName = 'DOCCLI'
      Origin = 'REL_CONVENIO_RESUMIDO.DOCCLI'
    end
  end
  object DSQConvRes: TDataSource
    AutoEdit = False
    DataSet = QConvRes
    Left = 392
    Top = 112
  end
  object QConsConv: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT NOME_CON, DIA_REFERENCIA_CON'
      'FROM CONVENIO'
      'WHERE COD_CON = :CODCON')
    Left = 32
    Top = 128
    ParamData = <
      item
        Name = 'CODCON'
        DataType = ftInteger
      end>
    object QConsConvNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QConsConvDIA_REFERENCIA_CON: TIntegerField
      FieldName = 'DIA_REFERENCIA_CON'
      Origin = 'CONVENIO.DIA_REFERENCIA_CON'
    end
  end
end
