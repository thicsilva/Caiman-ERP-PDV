object FrmConsOutrasEntradas: TFrmConsOutrasEntradas
  Left = 362
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Outras Entradas'
  ClientHeight = 567
  ClientWidth = 744
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
    Width = 744
    Height = 177
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 169
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'FORNECEDOR'
          'DATA')
      end
    end
    object GB2: TGroupBox
      Left = 184
      Top = 8
      Width = 305
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
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 481
      Height = 49
      Caption = 'Fornecedor'
      TabOrder = 2
      object BtnConsFor: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Fornecedor'
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
        OnClick = BtnConsForClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodFor: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar Fornecedor'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodForEnter
        OnExit = EdtCodForExit
        OnKeyDown = EdtCodForKeyDown
        OnKeyPress = EdtCodTipoKeyPress
      end
      object EdtNomeFor: TEdit
        Left = 98
        Top = 16
        Width = 375
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
        Width = 465
        Height = 21
        Color = clSilver
        TabOrder = 2
        OnKeyPress = EdtCodKeyPress
      end
    end
    object CheckEmp: TCheckBox
      Left = 272
      Top = 155
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object BtnOk: TButton
      Left = 554
      Top = 72
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 554
      Top = 112
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object GB4: TGroupBox
      Left = 8
      Top = 104
      Width = 481
      Height = 49
      Caption = 'Tipo de Outras Entradas'
      TabOrder = 6
      object BtnConsTipo: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Tipo de Outras Sa'#237'das'
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
        OnClick = BtnConsTipoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodTipo: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 
          'Pressione F2 para Consultar Tipo de Outras Sa'#237'das ou deixa vazio' +
          ' para todos os tipos'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodTipoEnter
        OnExit = EdtCodTipoExit
        OnKeyDown = EdtCodTipoKeyDown
        OnKeyPress = EdtCodTipoKeyPress
      end
      object EdtNomeTipo: TEdit
        Left = 98
        Top = 16
        Width = 375
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
    object CheckOutrasEntradas: TCheckBox
      Left = 8
      Top = 152
      Width = 233
      Height = 17
      Caption = 'Todos os Tipos de Outras Entradas'
      TabOrder = 7
      OnClick = CheckOutrasEntradasClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 744
    Height = 371
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 740
      Height = 335
      Align = alTop
      Color = clSilver
      DataSource = DSQConsOE
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
          FieldName = 'COD_OUTRA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_NOTA_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'NOTA FISCAL'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_OUTRA'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 293
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_ES'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DE OUTRAS ENTRADAS'
          Width = 173
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL_OUTRA'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 68
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 37
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 339
      Top = 342
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 548
    Width = 744
    Height = 19
    Panels = <>
  end
  object QConsOE: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT OE.*, F.RAZAO_FOR, T.NOME_ES'
      'FROM OUTRAS_ENTRADAS OE'
      'INNER JOIN FORNECEDOR F'
      'ON (OE.COD_FOR = F.COD_FOR)'
      'INNER JOIN TIPO_ES T'
      'ON (OE.COD_ES = T.COD_ES)')
    Left = 256
    Top = 296
    object QConsOECOD_OUTRA: TIntegerField
      FieldName = 'COD_OUTRA'
      Origin = 'OUTRAS_ENTRADAS.COD_OUTRA'
      Required = True
    end
    object QConsOEDATA_OUTRA: TDateField
      FieldName = 'DATA_OUTRA'
      Origin = 'OUTRAS_ENTRADAS.DATA_OUTRA'
      Required = True
    end
    object QConsOECOD_ES: TIntegerField
      FieldName = 'COD_ES'
      Origin = 'OUTRAS_ENTRADAS.COD_ES'
      Required = True
    end
    object QConsOECOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'OUTRAS_ENTRADAS.COD_FOR'
      Required = True
    end
    object QConsOECOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'OUTRAS_ENTRADAS.COD_EMP'
      Required = True
    end
    object QConsOETOTAL_OUTRA: TBCDField
      FieldName = 'TOTAL_OUTRA'
      Origin = 'OUTRAS_ENTRADAS.TOTAL_OUTRA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsOERAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsOENOME_ES: TStringField
      FieldName = 'NOME_ES'
      Origin = 'TIPO_ES.NOME_ES'
      Required = True
      Size = 50
    end
    object QConsOENUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'OUTRAS_ENTRADAS.NUMERO_NOTA_FISCAL'
    end
    object QConsOESERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'OUTRAS_ENTRADAS.SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QConsOECODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'OUTRAS_ENTRADAS.CODIFICACAO_FISCAL'
      FixedChar = True
      Size = 2
    end
    object QConsOECOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'OUTRAS_ENTRADAS.COD_NF'
    end
    object QConsOECANCELADA: TIntegerField
      FieldName = 'CANCELADA'
      Origin = 'OUTRAS_ENTRADAS.CANCELADA'
      Required = True
    end
  end
  object DSQConsOE: TDataSource
    AutoEdit = False
    DataSet = QConsOE
    Left = 256
    Top = 352
  end
end
