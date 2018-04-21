object FrmConsPagar: TFrmConsPagar
  Left = 176
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Contas a Pagar'
  ClientHeight = 583
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 808
    Height = 19
    AutoHint = True
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 129
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GB2: TGroupBox
      Left = 152
      Top = 8
      Width = 273
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 136
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
        Left = 160
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object RDG: TRadioGroup
      Left = 8
      Top = 8
      Width = 137
      Height = 49
      Caption = 'Contas'
      Columns = 2
      Items.Strings = (
        'Pagas'
        'A Pagar')
      TabOrder = 1
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 107
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 2
    end
    object GB3: TGroupBox
      Left = 8
      Top = 56
      Width = 417
      Height = 49
      Caption = 'Fornecedor'
      TabOrder = 3
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
    object BtnOk: TButton
      Left = 450
      Top = 32
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 450
      Top = 64
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object CheckPendente: TCheckBox
      Left = 232
      Top = 107
      Width = 185
      Height = 17
      Caption = 'Somente os T'#237'tulos Pendentes'
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 160
    Width = 808
    Height = 404
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Shape1: TShape
      Left = 32
      Top = 381
      Width = 17
      Height = 17
      Brush.Color = clRed
      Pen.Color = clRed
    end
    object Label2: TLabel
      Left = 64
      Top = 384
      Width = 101
      Height = 13
      Caption = 'Duplicata Pendente'
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 804
      Height = 367
      Align = alTop
      Color = clSilver
      DataSource = DSQConsPagar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CPT'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEQUENCIA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ'
          Width = 33
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUM_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'NUM.DOC.'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DTVENCTO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VENCIMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DTPAGTO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'DATA PAGTO.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 312
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 77
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TIPO_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DOCUMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_PAGO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR PAGO'
          Width = 93
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'DESCONTO'
          Width = 75
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'SCIMO'
          Width = 81
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO_FORMA_PAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CHEQUE'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO_CENTRO_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'CENTRO CUSTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'OBS'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 34
          Visible = True
        end>
    end
    object BtnItens: TButton
      Left = 223
      Top = 371
      Width = 154
      Height = 25
      Caption = '&Itens'
      TabOrder = 1
      OnClick = BtnItensClick
    end
    object BtnPendente: TButton
      Left = 431
      Top = 371
      Width = 154
      Height = 25
      Caption = '&Marcar como Pendente'
      TabOrder = 2
      OnClick = BtnPendenteClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 129
    Width = 808
    Height = 31
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Total:'
    end
    object LTotal: TLabel
      Left = 58
      Top = 8
      Width = 183
      Height = 13
      AutoSize = False
      Caption = 'LTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object QConsPagar: TFDQuery
    AfterScroll = QConsPagarAfterScroll
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT C.*, F.RAZAO_FOR'
      'FROM CONTAS_PAGAR C'
      'INNER JOIN FORNECEDOR F'
      'ON (C.COD_FOR = F.COD_FOR)')
    Left = 96
    Top = 352
    object QConsPagarCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Origin = 'CONTAS_PAGAR.COD_CPT'
      Required = True
    end
    object QConsPagarCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_PAGAR.COD_EMP'
      Required = True
    end
    object QConsPagarDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Origin = 'CONTAS_PAGAR.DATA_CTP'
      Required = True
    end
    object QConsPagarCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'CONTAS_PAGAR.COD_FOR'
      Required = True
    end
    object QConsPagarTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
      Origin = 'CONTAS_PAGAR.TIPO_DOC_CTP'
    end
    object QConsPagarNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QConsPagarVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPagarDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
      Required = True
    end
    object QConsPagarDTPAGTO_CTP: TDateField
      FieldName = 'DTPAGTO_CTP'
      Origin = 'CONTAS_PAGAR.DTPAGTO_CTP'
    end
    object QConsPagarVALOR_PAGO_CTP: TBCDField
      FieldName = 'VALOR_PAGO_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_PAGO_CTP'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPagarDESCONTO_CTP: TBCDField
      FieldName = 'DESCONTO_CTP'
      Origin = 'CONTAS_PAGAR.DESCONTO_CTP'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPagarACRESCIMO_CTP: TBCDField
      FieldName = 'ACRESCIMO_CTP'
      Origin = 'CONTAS_PAGAR.ACRESCIMO_CTP'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPagarOBS_CTP: TStringField
      FieldName = 'OBS_CTP'
      Origin = 'CONTAS_PAGAR.OBS_CTP'
      Size = 60
    end
    object QConsPagarRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsPagarCOD_ENTRADA: TIntegerField
      FieldName = 'COD_ENTRADA'
      Origin = 'CONTAS_PAGAR.COD_ENTRADA'
    end
    object QConsPagarSEQUENCIA_CTP: TIntegerField
      FieldName = 'SEQUENCIA_CTP'
      Origin = 'CONTAS_PAGAR.SEQUENCIA_CTP'
      Required = True
    end
    object QConsPagarCOD_CLASSIFICACAO: TIntegerField
      FieldName = 'COD_CLASSIFICACAO'
      Origin = 'CONTAS_PAGAR.COD_CLASSIFICACAO'
      Required = True
    end
    object QConsPagarCODIGO_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_FORMA_PAGAMENTO'
      Origin = 'CONTAS_PAGAR.CODIGO_FORMA_PAGAMENTO'
    end
    object QConsPagarCODIGO_CENTRO_CUSTO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO'
      Origin = 'CONTAS_PAGAR.CODIGO_CENTRO_CUSTO'
      DisplayFormat = '9.99.999'
    end
    object QConsPagarCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CONTAS_PAGAR.CHEQUE'
      Size = 10
    end
    object QConsPagarDUPLICATA_PENDENTE: TStringField
      FieldName = 'DUPLICATA_PENDENTE'
      Origin = 'CONTAS_PAGAR.DUPLICATA_PENDENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSQConsPagar: TDataSource
    AutoEdit = False
    DataSet = QConsPagar
    Left = 208
    Top = 352
  end
  object QPendente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE CONTAS_PAGAR'
      'SET DUPLICATA_PENDENTE = :PEND'
      'WHERE COD_CPT = :COD AND SEQUENCIA_CTP = :SEQ')
    Left = 312
    Top = 352
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
