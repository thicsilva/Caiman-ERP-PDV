object FrmRelVendasLucro: TFrmRelVendasLucro
  Left = 500
  Top = 349
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Vendas/Lucro'
  ClientHeight = 157
  ClientWidth = 303
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 299
      Height = 47
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 144
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 80
      Width = 289
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
    object RDG: TRadioGroup
      Left = 2
      Top = 49
      Width = 299
      Height = 32
      Align = alTop
      Columns = 2
      Items.Strings = (
        '1'
        '2')
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 303
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 138
    Width = 303
    Height = 19
    Panels = <>
  end
  object QRelVendas: TFDQuery
    OnCalcFields = QRelVendasCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT SUM(TOTAL_VEN) TOTAL, SUM(TOTAL_CUSTO_VEN) TOTALCUSTO, DA' +
        'TA_VEN, EXTRACT (WEEKDAY FROM DATA_VEN) DIASEMANA'
      'FROM VENDAS'
      'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN'
      'GROUP BY DATA_VEN'
      'ORDER BY DATA_VEN')
    Left = 224
    Top = 40
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QRelVendasTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelVendasTOTALCUSTO: TBCDField
      FieldName = 'TOTALCUSTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Required = True
    end
    object QRelVendasDIASEMANA: TSmallintField
      FieldName = 'DIASEMANA'
      Required = True
    end
    object QRelVendasDIASTRING: TStringField
      FieldKind = fkCalculated
      FieldName = 'DIASTRING'
      Calculated = True
    end
  end
  object QRelDespRec: TFDQuery
    OnCalcFields = QRelDespRecCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_REL_DESPESA_RECEITA(:DATAINI, :DATAFIN, :CODEMP)'
      'ORDER BY DATA')
    Left = 112
    Top = 40
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
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QRelDespRecDATA: TDateField
      FieldName = 'DATA'
      Origin = 'SP_REL_DESPESA_RECEITA.DATA'
    end
    object QRelDespRecRECEITA: TBCDField
      FieldName = 'RECEITA'
      Origin = 'SP_REL_DESPESA_RECEITA.RECEITA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelDespRecDESPESA: TBCDField
      FieldName = 'DESPESA'
      Origin = 'SP_REL_DESPESA_RECEITA.DESPESA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelDespRecDIASEMANA: TIntegerField
      FieldName = 'DIASEMANA'
      Origin = 'SP_REL_DESPESA_RECEITA.DIASEMANA'
    end
    object QRelDespRecSTRINGDIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'STRINGDIA'
      Calculated = True
    end
  end
end
