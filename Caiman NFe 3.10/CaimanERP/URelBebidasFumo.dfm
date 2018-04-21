object FrmRelBebidasFumo: TFrmRelBebidasFumo
  Left = 396
  Top = 310
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rel.Vendas Bebidas e Fumo'
  ClientHeight = 114
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 95
    Width = 304
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 304
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Caption = #39
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 18
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 114
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 210
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
    Width = 304
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 300
      Height = 53
      Align = alClient
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
  end
  object QNFBebidas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_REL_BEBIDAS_FUMO(:CODEMP, :DATAINI, :DATAFIN)')
    Left = 136
    Top = 16
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QNFBebidasCODPRO: TIntegerField
      FieldName = 'CODPRO'
      Origin = 'SP_REL_BEBIDAS_FUMO.CODPRO'
    end
    object QNFBebidasNOMEPRO: TStringField
      FieldName = 'NOMEPRO'
      Origin = 'SP_REL_BEBIDAS_FUMO.NOMEPRO'
      Size = 80
    end
    object QNFBebidasQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'SP_REL_BEBIDAS_FUMO.QUANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QNFBebidasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'SP_REL_BEBIDAS_FUMO.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
end
