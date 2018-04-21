object FrmExtratoCC: TFrmExtratoCC
  Left = 238
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Extrato Contas Corrente'
  ClientHeight = 613
  ClientWidth = 776
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 105
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GB4: TGroupBox
      Left = 10
      Top = 2
      Width = 759
      Height = 49
      Caption = 'Conta'
      TabOrder = 0
      object BtnConsConta: TsSpeedButton
        Left = 132
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar '
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
        Top = 16
        Width = 110
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodContaEnter
        OnExit = EdtCodContaExit
        OnKeyDown = EdtCodContaKeyDown
        OnKeyPress = EdtCodContaKeyPress
      end
      object EdtNomeConta: TEdit
        Left = 162
        Top = 16
        Width = 583
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
    object GB2: TGroupBox
      Left = 10
      Top = 50
      Width = 263
      Height = 47
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 128
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
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 610
      Top = 64
      Width = 73
      Height = 28
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 690
      Top = 64
      Width = 73
      Height = 28
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 304
      Top = 78
      Width = 137
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 776
    Height = 441
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object Label10: TLabel
      Left = 248
      Top = 416
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total dos Cr'#233'ditos'
    end
    object LCredito: TLabel
      Left = 384
      Top = 416
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'LCredito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 528
      Top = 416
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Total dos D'#233'bitos'
    end
    object LDebito: TLabel
      Left = 664
      Top = 416
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'LDebito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 772
      Height = 399
      Align = alTop
      Color = clSilver
      DataSource = DSQConsCC
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CONCILIADO_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'CONC.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAEMI_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAVENC_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 71
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_DEBCRED'
          Title.Alignment = taCenter
          Title.Caption = 'D/C'
          Width = 78
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUM_CHEQUE_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'CHEQUE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'HISTORICO_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'HIST'#211'RICO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_DOC'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DE DOCUMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DOCUMENTO_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 594
    Width = 776
    Height = 19
    Panels = <
      item
        Text = 'Uses o duplo click para Conciliar os Lan'#231'amentos'
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 105
    Width = 776
    Height = 48
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 125
      Height = 13
      AutoSize = False
      Caption = 'Saldo Anterior Conciliado:'
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Saldo Anterior: '
    end
    object Label4: TLabel
      Left = 152
      Top = 8
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 152
      Top = 24
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 376
      Top = 8
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Saldo Atual:'
    end
    object Label7: TLabel
      Left = 376
      Top = 24
      Width = 125
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Saldo Atual Conciliado:'
    end
    object Label8: TLabel
      Left = 512
      Top = 8
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 512
      Top = 24
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Label9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object QConsCC: TFDQuery
    OnCalcFields = QConsCCCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT L.CONCILIADO_LAN, L.COD_LAN, L.DATAEMI_LAN, L.DATAVENC_LA' +
        'N, L.DC_LAN, L.DOCUMENTO_LAN, L.HISTORICO_LAN, L.NUM_CHEQUE_LAN,' +
        ' T.NOME_DOC, L.VALOR_LAN'
      'FROM LANCAMENTOS_CONTAS_CORRENTE L'
      'INNER JOIN TIPO_DOCUMENTO T'
      'ON (L.COD_DOC = T.COD_DOC)'
      'WHERE L.DATAVENC_LAN BETWEEN :DATAINI AND :DATAFIN'
      'AND L.COD_CONTA = :CODCONTA'
      'ORDER BY L.DATAVENC_LAN, L.COD_LAN')
    Left = 192
    Top = 232
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end
      item
        Name = 'CODCONTA'
        DataType = ftInteger
      end>
    object QConsCCCONCILIADO_LAN: TIntegerField
      FieldName = 'CONCILIADO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.CONCILIADO_LAN'
      Required = True
    end
    object QConsCCCOD_LAN: TIntegerField
      FieldName = 'COD_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.COD_LAN'
      Required = True
    end
    object QConsCCDATAEMI_LAN: TDateField
      FieldName = 'DATAEMI_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAEMI_LAN'
      Required = True
    end
    object QConsCCDATAVENC_LAN: TDateField
      FieldName = 'DATAVENC_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAVENC_LAN'
      Required = True
    end
    object QConsCCDC_LAN: TIntegerField
      FieldName = 'DC_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DC_LAN'
      Required = True
    end
    object QConsCCDOCUMENTO_LAN: TStringField
      FieldName = 'DOCUMENTO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DOCUMENTO_LAN'
    end
    object QConsCCHISTORICO_LAN: TStringField
      FieldName = 'HISTORICO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.HISTORICO_LAN'
      Required = True
      Size = 100
    end
    object QConsCCNUM_CHEQUE_LAN: TStringField
      FieldName = 'NUM_CHEQUE_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.NUM_CHEQUE_LAN'
      Size = 10
    end
    object QConsCCNOME_DOC: TStringField
      FieldName = 'NOME_DOC'
      Origin = 'TIPO_DOCUMENTO.NOME_DOC'
      Required = True
      Size = 50
    end
    object QConsCCVALOR_LAN: TBCDField
      FieldName = 'VALOR_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.VALOR_LAN'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsCCCALC_DEBCRED: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_DEBCRED'
      Size = 10
      Calculated = True
    end
  end
  object DSQConsCC: TDataSource
    AutoEdit = False
    DataSet = QConsCC
    Left = 192
    Top = 288
  end
  object IBSQLConc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConc
    Left = 352
    Top = 232
  end
  object IBTRConc: TFDTransaction
    Connection = DM.IBDatabase
    Left = 352
    Top = 288
  end
end
