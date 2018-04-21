object FrmRelPisCofins: TFrmRelPisCofins
  Left = 409
  Top = 266
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rel.de Vendas isentas de Pis/Cofins'
  ClientHeight = 211
  ClientWidth = 345
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 153
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 49
      Width = 341
      Height = 55
      Align = alClient
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 144
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
        Date = 38482.688474780100000000
        Time = 38482.688474780100000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 16
        Width = 97
        Height = 21
        Date = 38482.688474780100000000
        Time = 38482.688474780100000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 104
      Width = 341
      Height = 47
      Align = alBottom
      Caption = 'Origem do Dados'
      TabOrder = 2
      object ComboOrigem: TComboBox
        Left = 8
        Top = 18
        Width = 329
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'VENDAS CHECKOUT'
          'NOTA FISCAL')
      end
    end
    object Rdg: TRadioGroup
      Left = 2
      Top = 2
      Width = 341
      Height = 47
      Align = alTop
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Produto'
        'Resumido por Se'#231#227'o')
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 345
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Caption = #39
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 39
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 135
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 231
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
    Top = 192
    Width = 345
    Height = 19
    Panels = <>
  end
  object QRelVendasSecao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, S.NOME_SEC'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE V.TOTAL_VEN > 0'
      'GROUP BY P.COD_SEC, S.NOME_SEC')
    Left = 176
    Top = 120
    object QRelVendasSecaoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QRelVendasSecaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Required = True
      Size = 50
    end
  end
  object QRelProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) -'
      
        '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((' +
        'I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, P.NOME_PRO,'
      'S.NOME_SEC'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE V.TOTAL_VEN > 0'
      'GROUP BY I.COD_PRO, P.NOME_PRO, S.NOME_SEC')
    Left = 96
    Top = 120
    object QRelProdTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QRelProdNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelProdNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Required = True
      Size = 50
    end
  end
end
