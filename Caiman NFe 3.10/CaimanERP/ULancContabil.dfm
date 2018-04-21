object FrmLancContabil: TFrmLancContabil
  Left = 462
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento Cont'#225'bil'
  ClientHeight = 536
  ClientWidth = 546
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 216
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Data'
    end
    object Label7: TLabel
      Left = 344
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Valor Total'
    end
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Codigo'
    end
    object LTitulo: TLabel
      Left = 2
      Top = 2
      Width = 542
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Dados'
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 33
    end
    object Label12: TLabel
      Left = 112
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Seq.'
    end
    object EdtData: TMaskEdit
      Left = 216
      Top = 32
      Width = 89
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '  /  /    '
    end
    object EdtTotal: TCurrencyEdit
      Left = 344
      Top = 32
      Width = 105
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
    object EdtCodigo: TEdit
      Left = 8
      Top = 32
      Width = 89
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdtSeq: TEdit
      Left = 112
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 355
    Width = 546
    Height = 162
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 542
      Height = 120
      Align = alTop
      Color = clSilver
      DataSource = DSQBuscaLan
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CTA'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CTA'
          Title.Alignment = taCenter
          Title.Caption = 'CLASSIF.'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBCRED'
          Title.Alignment = taCenter
          Title.Caption = 'DEB/CRED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CTA'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DA CONTA'
          Width = 368
          Visible = True
        end>
    end
    object BtnExcluir: TBitBtn
      Left = 240
      Top = 128
      Width = 65
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 517
    Width = 546
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 546
    Height = 290
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 69
      Height = 13
      Caption = 'Conta D'#233'bito'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 72
      Height = 13
      Caption = 'Conta Cr'#233'dito'
    end
    object Label4: TLabel
      Left = 8
      Top = 138
      Width = 37
      Height = 13
      Caption = 'Valor(*)'
    end
    object Label5: TLabel
      Left = 8
      Top = 178
      Width = 57
      Height = 13
      Caption = 'Hist'#243'rico(*)'
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 101
      Height = 13
      Caption = 'Lan'#231'amento Padr'#227'o'
    end
    object BtnCons: TsSpeedButton
      Left = 61
      Top = 32
      Width = 23
      Height = 21
      Hint = 'Consultar Classifica'#231#227'o de Cliente'
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
    object Label9: TLabel
      Left = 2
      Top = 2
      Width = 542
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Lan'#231'amento'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 64
    end
    object Label10: TLabel
      Left = 440
      Top = 58
      Width = 65
      Height = 13
      Caption = 'Total Cr'#233'dito'
    end
    object Label11: TLabel
      Left = 440
      Top = 18
      Width = 62
      Height = 13
      Caption = 'Total D'#233'bito'
    end
    object EdtContaDeb: TEdit
      Left = 8
      Top = 72
      Width = 49
      Height = 21
      Hint = 
        'Pressione F2 para Consultar ou F3 para Cadastrar Classifica'#231#227'o d' +
        'e Cliente'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
    end
    object EdtNomeDeb: TEdit
      Left = 58
      Top = 72
      Width = 369
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
      TabOrder = 6
    end
    object EdtContaCred: TEdit
      Left = 8
      Top = 112
      Width = 49
      Height = 21
      Hint = 
        'Pressione F2 para Consultar ou F3 para Cadastrar Classifica'#231#227'o d' +
        'e Cliente'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 7
    end
    object EdtNomeCred: TEdit
      Left = 58
      Top = 112
      Width = 369
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
      TabOrder = 8
    end
    object EdtValor: TCurrencyEdit
      Left = 8
      Top = 154
      Width = 89
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object MemoHist: TMemo
      Left = 8
      Top = 194
      Width = 433
      Height = 89
      Color = clSilver
      Lines.Strings = (
        '')
      MaxLength = 200
      TabOrder = 2
      OnEnter = MemoHistEnter
      OnExit = MemoHistExit
      OnKeyPress = MemoHistKeyPress
    end
    object BtnOK: TBitBtn
      Left = 464
      Top = 208
      Width = 65
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 464
      Top = 240
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object EdtCod: TEdit
      Left = 8
      Top = 32
      Width = 49
      Height = 21
      Hint = 
        'Pressione F2 para Consultar ou F3 para Cadastrar Classifica'#231#227'o d' +
        'e Cliente'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodEnter
      OnExit = EdtcodExit
      OnKeyDown = EdtCodKeyDown
      OnKeyPress = EdtCodKeyPress
    end
    object EdtNomeLanc: TEdit
      Left = 88
      Top = 32
      Width = 337
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
      TabOrder = 9
    end
    object EdtTotalDeb: TCurrencyEdit
      Left = 440
      Top = 34
      Width = 89
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
      TabOrder = 10
      ZeroEmpty = False
    end
    object EdtTotalCred: TCurrencyEdit
      Left = 440
      Top = 74
      Width = 89
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
      TabOrder = 11
      ZeroEmpty = False
    end
  end
  object IBTRLan: TFDTransaction
    Connection = DM.IBDatabase
    Left = 144
    Top = 280
  end
  object QBuscaLan: TFDQuery
    OnCalcFields = QBuscaLanCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRLan
    SQL.Strings = (
      'SELECT L.*, P.NUMERO_CTA, P.NOME_CTA'
      'FROM LANCAMENTOS_CONTABEIS L'
      'INNER JOIN PLANO_CONTAS P'
      'ON (L.COD_CTA = P.COD_CTA)'
      '')
    Left = 160
    Top = 408
    object QBuscaLanCOD_LAN: TIntegerField
      FieldName = 'COD_LAN'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_LAN'
      Required = True
    end
    object QBuscaLanCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_EMP'
      Required = True
    end
    object QBuscaLanDC_LAN: TIntegerField
      FieldName = 'DC_LAN'
      Origin = 'LANCAMENTOS_CONTABEIS.DC_LAN'
      Required = True
    end
    object QBuscaLanDATA_LAN: TDateField
      FieldName = 'DATA_LAN'
      Origin = 'LANCAMENTOS_CONTABEIS.DATA_LAN'
      Required = True
    end
    object QBuscaLanCOD_CTA: TIntegerField
      FieldName = 'COD_CTA'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_CTA'
      Required = True
    end
    object QBuscaLanVALOR_LAN: TBCDField
      FieldName = 'VALOR_LAN'
      Origin = 'LANCAMENTOS_CONTABEIS.VALOR_LAN'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaLanHISTORICO_LAN: TStringField
      FieldName = 'HISTORICO_LAN'
      Origin = 'LANCAMENTOS_CONTABEIS.HISTORICO_LAN'
      Required = True
      Size = 200
    end
    object QBuscaLanCOD_CONTAS_PAGAR: TIntegerField
      FieldName = 'COD_CONTAS_PAGAR'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_CONTAS_PAGAR'
    end
    object QBuscaLanCOD_CONTAS_RECEBER: TIntegerField
      FieldName = 'COD_CONTAS_RECEBER'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_CONTAS_RECEBER'
    end
    object QBuscaLanCOD_SEQ_CONTAS_PAGAR: TIntegerField
      FieldName = 'COD_SEQ_CONTAS_PAGAR'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_SEQ_CONTAS_PAGAR'
    end
    object QBuscaLanCOD_SEQ_CONTAS_RECEBER: TIntegerField
      FieldName = 'COD_SEQ_CONTAS_RECEBER'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_SEQ_CONTAS_RECEBER'
    end
    object QBuscaLanCOD_FLUXO_CAIXA: TIntegerField
      FieldName = 'COD_FLUXO_CAIXA'
      Origin = 'LANCAMENTOS_CONTABEIS.COD_FLUXO_CAIXA'
    end
    object QBuscaLanNUMERO_CTA: TStringField
      FieldName = 'NUMERO_CTA'
      Origin = 'PLANO_CONTAS.NUMERO_CTA'
      Required = True
      Size = 14
    end
    object QBuscaLanNOME_CTA: TStringField
      FieldName = 'NOME_CTA'
      Origin = 'PLANO_CONTAS.NOME_CTA'
      Required = True
      Size = 80
    end
    object QBuscaLanDEBCRED: TStringField
      FieldKind = fkCalculated
      FieldName = 'DEBCRED'
      Size = 15
      Calculated = True
    end
  end
  object DSQBuscaLan: TDataSource
    AutoEdit = False
    DataSet = QBuscaLan
    Left = 248
    Top = 408
  end
  object QInsLan: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLan
    SQL.Strings = (
      'SELECT *'
      
        'FROM INSERT_LANCAMENTOS_CONTABEIS (:1, :2, :3, :4, :5, :6, :7, :' +
        '8, :9, :10, :11, :12, :13, :14, :15, :16, :17, :18)')
    Left = 256
    Top = 280
    ParamData = <
      item
        Name = '1'
        DataType = ftDate
      end
      item
        Name = '2'
        DataType = ftInteger
      end
      item
        Name = '3'
        DataType = ftInteger
      end
      item
        Name = '4'
        DataType = ftFloat
      end
      item
        Name = '5'
        DataType = ftString
      end
      item
        Name = '6'
        DataType = ftInteger
      end
      item
        Name = '7'
        DataType = ftInteger
      end
      item
        Name = '8'
        DataType = ftInteger
      end
      item
        Name = '9'
        DataType = ftInteger
      end
      item
        Name = '10'
        DataType = ftInteger
      end
      item
        Name = '11'
        DataType = ftInteger
      end
      item
        Name = '12'
        DataType = ftInteger
      end
      item
        Name = '13'
        DataType = ftInteger
      end
      item
        Name = '14'
        DataType = ftInteger
      end
      item
        Name = '15'
        DataType = ftInteger
      end
      item
        Name = '16'
        DataType = ftInteger
      end
      item
        Name = '17'
        DataType = ftInteger
      end
      item
        Name = '18'
        DataType = ftInteger
      end>
    object QInsLanCODLAN: TIntegerField
      FieldName = 'CODLAN'
      Origin = 'INSERT_LANCAMENTOS_CONTABEIS.CODLAN'
    end
  end
  object IBSQLLan: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLan
    Left = 352
    Top = 408
  end
end
