object FrmConsEntradasProduto: TFrmConsEntradasProduto
  Left = 341
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Produtos por Entrada'
  ClientHeight = 435
  ClientWidth = 689
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
    Width = 689
    Height = 113
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object CheckEmp: TCheckBox
      Left = 8
      Top = 96
      Width = 137
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
    object GB3: TGroupBox
      Left = 8
      Top = 0
      Width = 497
      Height = 49
      Caption = 'Produto'
      TabOrder = 0
      object BtnConsPro: TsSpeedButton
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
        OnClick = BtnConsProClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodPro: TEdit
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
        OnEnter = EdtCodProEnter
        OnExit = EdtCodProExit
        OnKeyDown = EdtCodProKeyDown
        OnKeyPress = EdtCodProKeyPress
      end
      object EdtNomePro: TEdit
        Left = 98
        Top = 16
        Width = 391
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
      Left = 8
      Top = 48
      Width = 265
      Height = 49
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
    object BtnOk: TBitBtn
      Left = 320
      Top = 64
      Width = 81
      Height = 29
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TBitBtn
      Left = 424
      Top = 64
      Width = 81
      Height = 29
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 689
    Height = 273
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 685
      Height = 269
      Align = alClient
      Color = clSilver
      DataSource = DSQConsEnt
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAENT_ENT'
          Title.Alignment = taCenter
          Title.Caption = 'DATA ENT.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 289
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QTD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 54
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_UNIT_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR UNIT.'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_ICMS'
          Title.Alignment = taCenter
          Title.Caption = '% ICMS'
          Width = 44
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_IPI'
          Title.Alignment = taCenter
          Title.Caption = '% IPI'
          Width = 38
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_DESC'
          Title.Alignment = taCenter
          Title.Caption = '% DESC.'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_ACRES'
          Title.Alignment = taCenter
          Title.Caption = '% ACRES.'
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 416
    Width = 689
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 386
    Width = 689
    Height = 30
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object LQtdEntradas: TLabel
      Left = 40
      Top = 6
      Width = 83
      Height = 17
      Caption = 'LQtdEntradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LQtdItens: TLabel
      Left = 320
      Top = 6
      Width = 83
      Height = 17
      Caption = 'LQtdEntradas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object QConsEnt: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, F.RAZAO_FOR, E.DATAENT_ENT, U.DESCRICAO'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)')
    Left = 128
    Top = 168
    object QConsEntCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ITENS_ENTRADA.COD_ENT'
      Required = True
    end
    object QConsEntCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ENTRADA.COD_PRO'
      Required = True
    end
    object QConsEntQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'ITENS_ENTRADA.QTD_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsEntPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = 'ITENS_ENTRADA.PERC_ICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = 'ITENS_ENTRADA.PERC_IPI'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = 'ITENS_ENTRADA.QTDUND_ENT'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = 'ITENS_ENTRADA.PERC_DESC'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = 'ITENS_ENTRADA.PERC_ACRES'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsEntCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_ENTRADA.COD_EMP'
      Required = True
    end
    object QConsEntVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = 'ITENS_ENTRADA.VALOR_UNIT_PRO'
      Required = True
      DisplayFormat = ',#0.0000'
      Precision = 18
    end
    object QConsEntCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'ITENS_ENTRADA.CUSTO'
      DisplayFormat = ',#0.0000'
      Precision = 18
    end
    object QConsEntRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsEntDATAENT_ENT: TDateField
      FieldName = 'DATAENT_ENT'
      Origin = 'ENTRADAS.DATAENT_ENT'
      Required = True
    end
    object QConsEntCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_ENTRADA.COD_GRP'
    end
    object QConsEntCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = 'ITENS_ENTRADA.COD_CFOP'
    end
    object QConsEntVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'ITENS_ENTRADA.VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object QConsEntVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'ITENS_ENTRADA.VALOR_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object QConsEntPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = 'ITENS_ENTRADA.PERC_BCR'
      Precision = 18
      Size = 2
    end
    object QConsEntCST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_ENTRADA.CST'
      FixedChar = True
      Size = 3
    end
    object QConsEntVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_ENTRADA.VALOR_TOTAL'
      Precision = 18
    end
    object QConsEntBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_ENTRADA.BASE_CALCULO'
      Precision = 18
    end
    object QConsEntVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_ENTRADA.VALOR_ICMS'
      Precision = 18
    end
    object QConsEntORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_ENTRADA.ORDEM'
      Required = True
    end
    object QConsEntPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = 'ITENS_ENTRADA.PERC_ST'
      Precision = 18
    end
    object QConsEntVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = 'ITENS_ENTRADA.VALOR_SUB_TRIBUTARIA'
      Precision = 18
      Size = 2
    end
    object QConsEntVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'ITENS_ENTRADA.VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QConsEntDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DSQConsEnt: TDataSource
    AutoEdit = False
    DataSet = QConsEnt
    Left = 216
    Top = 168
  end
end
