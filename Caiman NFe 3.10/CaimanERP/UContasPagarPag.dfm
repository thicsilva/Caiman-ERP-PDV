object FrmContasPagarPag: TFrmContasPagarPag
  Left = 277
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar - Pagamento'
  ClientHeight = 562
  ClientWidth = 836
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
    Top = 543
    Width = 836
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clBtnHighlight
    TabOrder = 1
    object Label2: TLabel
      Left = 448
      Top = 112
      Width = 68
      Height = 13
      Caption = 'Total a Pagar:'
    end
    object LTotal: TLabel
      Left = 547
      Top = 112
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'LTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
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
          'DATA'
          'FORNECEDOR')
      end
    end
    object GB2: TGroupBox
      Left = 416
      Top = 8
      Width = 233
      Height = 49
      Caption = 'Vencimento'
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
      Left = 456
      Top = 72
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 544
      Top = 72
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 107
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 5
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 393
      Height = 49
      Caption = 'Fornecedor'
      TabOrder = 1
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
        Width = 287
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
    object CheckPendente: TCheckBox
      Left = 216
      Top = 107
      Width = 185
      Height = 17
      Caption = 'Somente os T'#237'tulos Pendentes'
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 836
    Height = 414
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clBtnHighlight
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 836
      Height = 375
      Align = alTop
      BorderStyle = bsNone
      Color = clSilver
      DataSource = DSQConsContasPagar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CPT'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEQUENCIA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'M.DOC.'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENCTO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VENCIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 293
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DOCUMENTO'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENTRO_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'CENTRO DE CUSTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'OBS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 33
          Visible = True
        end>
    end
    object BtnPagar: TButton
      Left = 160
      Top = 384
      Width = 154
      Height = 25
      Caption = '&Pagar'
      TabOrder = 1
      OnClick = BtnPagarClick
    end
    object BtnItens: TButton
      Left = 341
      Top = 384
      Width = 154
      Height = 25
      Caption = '&Itens Entradas'
      TabOrder = 2
      OnClick = BtnItensClick
    end
    object BtnPendente: TButton
      Left = 522
      Top = 384
      Width = 154
      Height = 25
      Caption = '&Marcar como Pendente'
      TabOrder = 3
      OnClick = BtnPendenteClick
    end
  end
  object QConsContasPagar: TFDQuery
    AfterScroll = QConsContasPagarAfterScroll
    Connection = DM.IBDatabase
    Transaction = IBTRConsPagar
    SQL.Strings = (
      
        'SELECT C.COD_CPT, C.COD_EMP, C.DATA_CTP, C.COD_FOR, C.TIPO_DOC_C' +
        'TP, C.NUM_DOC_CTP, C.OBS_CTP, C.VALOR_CTP, C.DTVENCTO_CTP, C.COD' +
        '_ENTRADA, C.SEQUENCIA_CTP,'
      'C.CODIGO_CENTRO_CUSTO, C.DUPLICATA_PENDENTE,'
      'F.RAZAO_FOR, CC.DESCRICAO CENTRO_CUSTO, CC.CONTA'
      'FROM CONTAS_PAGAR C'
      'INNER JOIN FORNECEDOR F'
      'ON (C.COD_FOR = F.COD_FOR)'
      'LEFT OUTER JOIN CENTRO_CUSTO CC'
      'ON (C.CODIGO_CENTRO_CUSTO = CC.CODIGO)'
      'WHERE C.DTVENCTO_CTP BETWEEN :DATAINI AND :DATAFIN')
    Left = 96
    Top = 208
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object QConsContasPagarCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Origin = 'CONTAS_PAGAR.COD_CPT'
      Required = True
    end
    object QConsContasPagarCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_PAGAR.COD_EMP'
      Required = True
    end
    object QConsContasPagarDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Origin = 'CONTAS_PAGAR.DATA_CTP'
      Required = True
    end
    object QConsContasPagarCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'CONTAS_PAGAR.COD_FOR'
      Required = True
    end
    object QConsContasPagarTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
      Origin = 'CONTAS_PAGAR.TIPO_DOC_CTP'
    end
    object QConsContasPagarNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QConsContasPagarOBS_CTP: TStringField
      FieldName = 'OBS_CTP'
      Origin = 'CONTAS_PAGAR.OBS_CTP'
      Size = 60
    end
    object QConsContasPagarRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsContasPagarVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsContasPagarDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
      Required = True
    end
    object QConsContasPagarCOD_ENTRADA: TIntegerField
      FieldName = 'COD_ENTRADA'
      Origin = 'CONTAS_PAGAR.COD_ENTRADA'
    end
    object QConsContasPagarSEQUENCIA_CTP: TIntegerField
      FieldName = 'SEQUENCIA_CTP'
      Origin = 'CONTAS_PAGAR.SEQUENCIA_CTP'
      Required = True
    end
    object QConsContasPagarCODIGO_CENTRO_CUSTO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO'
      Origin = 'CONTAS_PAGAR.CODIGO_CENTRO_CUSTO'
    end
    object QConsContasPagarCENTRO_CUSTO: TStringField
      FieldName = 'CENTRO_CUSTO'
      Origin = 'CENTRO_CUSTO.DESCRICAO'
      Size = 60
    end
    object QConsContasPagarCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CENTRO_CUSTO.CONTA'
      EditMask = '9.99.999;0;_'
      Size = 6
    end
    object QConsContasPagarDUPLICATA_PENDENTE: TStringField
      FieldName = 'DUPLICATA_PENDENTE'
      Origin = 'CONTAS_PAGAR.DUPLICATA_PENDENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSQConsContasPagar: TDataSource
    AutoEdit = False
    DataSet = QConsContasPagar
    Left = 96
    Top = 264
  end
  object IBTRConsPagar: TFDTransaction
    Connection = DM.IBDatabase
    Left = 96
    Top = 320
  end
  object QPendente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE CONTAS_PAGAR'
      'SET DUPLICATA_PENDENTE = :PEND'
      'WHERE COD_CPT = :COD AND SEQUENCIA_CTP = :SEQ')
    Left = 96
    Top = 392
    ParamData = <
      item
        Name = 'PEND'
      end
      item
        Name = 'COD'
      end
      item
        Name = 'SEQ'
      end>
  end
end
