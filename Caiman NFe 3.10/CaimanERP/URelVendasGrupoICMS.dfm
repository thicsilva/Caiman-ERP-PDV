object FrmRelVendasGrupoICMS: TFrmRelVendasGrupoICMS
  Left = 443
  Top = 399
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Vendas por Grupo de ICMS'
  ClientHeight = 131
  ClientWidth = 337
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 112
    Width = 337
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 337
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 37
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 133
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 226
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 73
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 333
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
      Width = 225
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
  end
  object QRelVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, G.NOME_GRP'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      
        'WHERE V.TOTAL_VEN > 0 AND I.CANCELADO = 0 AND I.VENDA_CANCELADA ' +
        '= 0'
      'GROUP BY P.ICMS_CF_EST, G.NOME_GRP')
    Left = 288
    Top = 24
    object QRelVendasTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QRelVendasNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
  end
end
