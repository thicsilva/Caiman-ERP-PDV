object FrmConsEntrada: TFrmConsEntrada
  Left = 281
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta das Entradas'
  ClientHeight = 544
  ClientWidth = 851
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
    Width = 851
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label2: TLabel
      Left = 440
      Top = 80
      Width = 24
      Height = 13
      Caption = 'Total'
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
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtNomeFor: TEdit
        Left = 98
        Top = 16
        Width = 311
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
        Width = 121
        Height = 21
        Color = clSilver
        TabOrder = 2
      end
    end
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
      Left = 506
      Top = 40
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 594
      Top = 40
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
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
          'DATA EMISS'#195'O'
          'DATA ENTRADA'
          'FORNECEDOR'
          'NUM.NOTA FISCAL')
      end
    end
    object EdtTotal: TCurrencyEdit
      Left = 440
      Top = 96
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
      TabOrder = 6
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 851
    Height = 404
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 847
      Height = 367
      Align = alTop
      Color = clSilver
      DataSource = DSQConsEnt
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
          FieldName = 'COD_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'A VISTA/PRAZO'
          Width = 91
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_ES'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO MOVIMENTO'
          Width = 287
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMNF_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'NOTA FISCAL'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAEMI_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAENT_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'ENTRADA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 26
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 312
      Top = 374
      Width = 74
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnItens: TButton
      Left = 464
      Top = 374
      Width = 74
      Height = 25
      Caption = '&Itens'
      TabOrder = 2
      OnClick = BtnItensClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 525
    Width = 851
    Height = 19
    Panels = <>
  end
  object QConsEnt: TFDQuery
    OnCalcFields = QConsEntCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT E.*, F.RAZAO_FOR, T.NOME_ES'
      'FROM ENTRADAS E'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)'
      'INNER JOIN TIPO_ES T'
      'ON (E.CODIGO_ES = T.COD_ES)')
    Left = 344
    Top = 184
    object QConsEntCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ENTRADAS.COD_ENT'
      Required = True
    end
    object QConsEntCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ENTRADAS.COD_EMP'
      Required = True
    end
    object QConsEntDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Origin = 'ENTRADAS.DATAEMI_ENT'
      Required = True
    end
    object QConsEntDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = 'ENTRADAS.DATAENT_ENT'
      Required = True
    end
    object QConsEntCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'ENTRADAS.COD_FOR'
      Required = True
    end
    object QConsEntTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Origin = 'ENTRADAS.TOTAL_ENT'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntACRES_ENT: TBCDField
      FieldName = 'ACRES_ENT'
      Origin = 'ENTRADAS.ACRES_ENT'
      Precision = 18
      Size = 2
    end
    object QConsEntDESC_ENT: TBCDField
      FieldName = 'DESC_ENT'
      Origin = 'ENTRADAS.DESC_ENT'
      Precision = 18
      Size = 2
    end
    object QConsEntFRETE_ENT: TBCDField
      FieldName = 'FRETE_ENT'
      Origin = 'ENTRADAS.FRETE_ENT'
      Precision = 18
      Size = 2
    end
    object QConsEntICMSFRETE_ENT: TBCDField
      FieldName = 'ICMSFRETE_ENT'
      Origin = 'ENTRADAS.ICMSFRETE_ENT'
      Precision = 18
      Size = 2
    end
    object QConsEntRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsEntTIPO_ENT: TStringField
      FieldName = 'TIPO_ENT'
      Origin = 'ENTRADAS.TIPO_ENT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsEntNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Origin = 'ENTRADAS.NUMNF_ENT'
      Size = 15
    end
    object QConsEntSERIE_ENT: TStringField
      FieldName = 'SERIE_ENT'
      Origin = 'ENTRADAS.SERIE_ENT'
      Size = 3
    end
    object QConsEntBASE_SUB_TRIB: TBCDField
      FieldName = 'BASE_SUB_TRIB'
      Origin = 'ENTRADAS.BASE_SUB_TRIB'
      Precision = 18
      Size = 2
    end
    object QConsEntVALOR_ICMS_SUB: TBCDField
      FieldName = 'VALOR_ICMS_SUB'
      Origin = 'ENTRADAS.VALOR_ICMS_SUB'
      Precision = 18
      Size = 2
    end
    object QConsEntFRETE_INCLUSO: TStringField
      FieldName = 'FRETE_INCLUSO'
      Origin = 'ENTRADAS.FRETE_INCLUSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsEntICMS_SUB_INCLUSO: TStringField
      FieldName = 'ICMS_SUB_INCLUSO'
      Origin = 'ENTRADAS.ICMS_SUB_INCLUSO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsEntCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Size = 25
      Calculated = True
    end
    object QConsEntTOTAL_PRODUTOS: TBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = 'ENTRADAS.TOTAL_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object QConsEntCUSTO_SEM_DESCONTO: TStringField
      FieldName = 'CUSTO_SEM_DESCONTO'
      Origin = 'ENTRADAS.CUSTO_SEM_DESCONTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsEntCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsEntCODIGO_ES: TIntegerField
      FieldName = 'CODIGO_ES'
      Origin = 'ENTRADAS.CODIGO_ES'
      Required = True
    end
    object QConsEntNOME_ES: TStringField
      FieldName = 'NOME_ES'
      Origin = 'TIPO_ES.NOME_ES'
      Required = True
      Size = 50
    end
  end
  object DSQConsEnt: TDataSource
    AutoEdit = False
    DataSet = QConsEnt
    Left = 344
    Top = 240
  end
end
