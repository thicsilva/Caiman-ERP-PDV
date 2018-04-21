object FrmRelResumoVendas: TFrmRelResumoVendas
  Left = 439
  Top = 325
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resumo das Vendas'
  ClientHeight = 123
  ClientWidth = 304
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 300
      Height = 47
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 140
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 24
        Top = 16
        Width = 97
        Height = 21
        Date = 38574.765455370400000000
        Time = 38574.765455370400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 168
        Top = 16
        Width = 97
        Height = 21
        Date = 38574.765455370400000000
        Time = 38574.765455370400000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 48
      Width = 129
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 304
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 20
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 116
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 209
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
    Top = 104
    Width = 304
    Height = 19
    Panels = <>
  end
  object QRelVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(VF.VALOR) TOTAL, VF.COD_FORMA, F.DESCRICAO'
      'FROM VENDAS_FORMAS_PAGAMENTO VF'
      'INNER JOIN VENDAS V'
      'ON (VF.COD_VENDA = V.COD_VEN)'
      'INNER JOIN FORMAS_PAGAMENTO F'
      'ON (VF.COD_FORMA = F.CODIGO)'
      'GROUP BY VF.COD_FORMA, F.DESCRICAO'
      ''
      ''
      ''
      ''
      '')
    Left = 176
    Top = 16
    object QRelVendasTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelVendasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Required = True
    end
    object QRelVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
  end
end
