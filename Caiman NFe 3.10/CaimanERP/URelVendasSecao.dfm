object FrmRelVendasSecao: TFrmRelVendasSecao
  Left = 497
  Top = 355
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resumo das Vendas por Se'#231#227'o'
  ClientHeight = 125
  ClientWidth = 281
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
    Top = 65
    Width = 281
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnVis: TBitBtn
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 103
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GB2: TGroupBox
      Left = 2
      Top = 2
      Width = 277
      Height = 45
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 136
        Top = 22
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 24
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 160
        Top = 16
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 4
      Top = 48
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 106
    Width = 281
    Height = 19
    Panels = <>
  end
  object QRelVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM((I.QUANT * I.VALOR) - I.DESCONTO) TOTAL,'
      'P.COD_SEC, S.NOME_SEC'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'GROUP BY P.COD_SEC, S.NOME_SEC')
    Left = 216
    Top = 16
    object QRelVendasTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QRelVendasNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object QRelVendasCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Required = True
    end
  end
end
