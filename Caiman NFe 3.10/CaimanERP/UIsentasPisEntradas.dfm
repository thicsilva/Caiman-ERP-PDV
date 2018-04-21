object FrmIsentasPisEntradas: TFrmIsentasPisEntradas
  Left = 307
  Top = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rel.Isentos Pis/Cofins nas Entradas'
  ClientHeight = 153
  ClientWidth = 333
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 134
    Width = 333
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 333
    Height = 37
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Caption = #39
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 33
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 129
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 225
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
    Width = 333
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 2
      Top = 49
      Width = 329
      Height = 46
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
    object Rdg: TRadioGroup
      Left = 2
      Top = 2
      Width = 329
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
  object QRelProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) TOTAL, P.NOME_PRO,'
      'S.NOME_SEC'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN AND'
      'P.ISENTO_PIS_COFINS_PRO = '#39'S'#39' AND E.COD_EMP = :CODEMP'
      'GROUP BY I.COD_PRO, P.NOME_PRO, S.NOME_SEC'
      'ORDER BY S.NOME_SEC, P.NOME_PRO')
    Left = 88
    Top = 8
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
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
    object QRelProdTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
  end
  object QRelSecao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) TOTAL, S.NOME_SEC'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFOP = CF.COD_CFO)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN AND '
      
        'P.ISENTO_PIS_COFINS_PRO = '#39'S'#39' AND CF.SAIR_REL_RESUMO_ALIQ = '#39'S'#39' ' +
        'AND E.COD_EMP = :CODEMP'
      'GROUP BY P.COD_SEC, S.NOME_SEC'
      'ORDER BY S.NOME_SEC')
    Left = 152
    Top = 8
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
    object QRelSecaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object QRelSecaoTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
  end
end
