object FrmRelEntradas: TFrmRelEntradas
  Left = 393
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Entradas'
  ClientHeight = 271
  ClientWidth = 435
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
    Width = 435
    Height = 217
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object CheckEmp: TCheckBox
      Left = 200
      Top = 192
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object GB3: TGroupBox
      Left = 8
      Top = 144
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
        Color = clSilver
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
      Left = 184
      Top = 96
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
    object GroupBox1: TGroupBox
      Left = 8
      Top = 96
      Width = 169
      Height = 49
      Caption = 'Impress'#227'o por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'DATA EMISS'#195'O'
          'DATA ENTRADA')
      end
    end
    object CheckFor: TCheckBox
      Left = 8
      Top = 192
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todos os Fornecedores'
      TabOrder = 4
      OnClick = CheckForClick
    end
    object RdgTipo: TRadioGroup
      Left = 2
      Top = 49
      Width = 431
      Height = 47
      Align = alTop
      Columns = 3
      Items.Strings = (
        'A Vista'
        'A Prazo'
        'Todas')
      TabOrder = 5
    end
    object RDG: TRadioGroup
      Left = 2
      Top = 2
      Width = 431
      Height = 47
      Align = alTop
      Columns = 2
      Items.Strings = (
        'Nota Fiscal de Entrada'
        'Itens da Nota Fiscal de Entrada'
        'Agrupada por Grupo de Icms'
        'Duplicatas [Contas a Pagar]')
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 435
    Height = 35
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 60
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 180
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 300
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 252
    Width = 435
    Height = 19
    Panels = <>
  end
  object QRelNota: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT E.COD_ENT, E.COD_EMP, E.DATAEMI_ENT, E.DATAENT_ENT, E.TOT' +
        'AL_ENT, E.NUMNF_ENT, E.TIPO_ENT, F.RAZAO_FOR'
      'FROM ENTRADAS E'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)')
    Left = 192
    Top = 144
    object QRelNotaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ENTRADAS.COD_EMP'
      Required = True
    end
    object QRelNotaDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Origin = 'ENTRADAS.DATAEMI_ENT'
      Required = True
    end
    object QRelNotaDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = 'ENTRADAS.DATAENT_ENT'
      Required = True
    end
    object QRelNotaTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Origin = 'ENTRADAS.TOTAL_ENT'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelNotaNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Origin = 'ENTRADAS.NUMNF_ENT'
      Size = 15
    end
    object QRelNotaRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QRelNotaTIPO_ENT: TStringField
      FieldName = 'TIPO_ENT'
      Origin = 'ENTRADAS.TIPO_ENT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelNotaCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ENTRADAS.COD_ENT'
      Required = True
    end
  end
  object QRelItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.COD_PRO, I.CUSTO, I.QTD_PRO, E.DATAENT_ENT, E.DATAEMI_E' +
        'NT, E.NUMNF_ENT, F.RAZAO_FOR, P.NOME_PRO'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)')
    Left = 128
    Top = 144
    object QRelItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ENTRADA.COD_PRO'
      Required = True
    end
    object QRelItensCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'ITENS_ENTRADA.CUSTO'
      DisplayFormat = ',#0.000'
      Precision = 18
    end
    object QRelItensQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'ITENS_ENTRADA.QTD_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QRelItensDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = 'ENTRADAS.DATAENT_ENT'
      Required = True
    end
    object QRelItensNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Origin = 'ENTRADAS.NUMNF_ENT'
      Size = 15
    end
    object QRelItensRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QRelItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelItensDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Origin = 'ENTRADAS.DATAEMI_ENT'
      Required = True
    end
  end
  object QRelAgrupadaICMS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) TOTAL, G.NOME_GRP'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE I.VALOR_TOTAL > 0'
      'GROUP BY P.ICMS_CF_EST, G.NOME_GRP')
    Left = 280
    Top = 144
    object QRelAgrupadaICMSTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QRelAgrupadaICMSNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
  end
  object QRelDuplicatas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT E.COD_ENT, E.COD_EMP, E.DATAEMI_ENT,                     ' +
        ' '
      
        'E.DATAENT_ENT, E.TOTAL_ENT, E.NUMNF_ENT, E.TIPO_ENT, F.RAZAO_FOR' +
        ', P.TIPO_DOC_CTP, P.NUM_DOC_CTP, P.VALOR_CTP, P.DTVENCTO_CTP, P.' +
        'DTPAGTO_CTP              '
      'FROM ENTRADAS E            '
      'INNER JOIN FORNECEDOR F    '
      'ON (E.COD_FOR = F.COD_FOR) '
      'LEFT JOIN CONTAS_PAGAR P   '
      'ON (E.COD_ENT = P.COD_ENTRADA)')
    Left = 376
    Top = 144
    object QRelDuplicatasCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ENTRADAS.COD_ENT'
      Required = True
    end
    object QRelDuplicatasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ENTRADAS.COD_EMP'
      Required = True
    end
    object QRelDuplicatasDATAEMI_ENT: TDateField
      FieldName = 'DATAEMI_ENT'
      Origin = 'ENTRADAS.DATAEMI_ENT'
      Required = True
    end
    object QRelDuplicatasDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = 'ENTRADAS.DATAENT_ENT'
      Required = True
    end
    object QRelDuplicatasTOTAL_ENT: TBCDField
      FieldName = 'TOTAL_ENT'
      Origin = 'ENTRADAS.TOTAL_ENT'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelDuplicatasNUMNF_ENT: TStringField
      FieldName = 'NUMNF_ENT'
      Origin = 'ENTRADAS.NUMNF_ENT'
      Size = 15
    end
    object QRelDuplicatasTIPO_ENT: TStringField
      FieldName = 'TIPO_ENT'
      Origin = 'ENTRADAS.TIPO_ENT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRelDuplicatasRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QRelDuplicatasTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
      Origin = 'CONTAS_PAGAR.TIPO_DOC_CTP'
    end
    object QRelDuplicatasNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QRelDuplicatasVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelDuplicatasDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
    end
    object QRelDuplicatasDTPAGTO_CTP: TDateField
      FieldName = 'DTPAGTO_CTP'
      Origin = 'CONTAS_PAGAR.DTPAGTO_CTP'
    end
  end
end
