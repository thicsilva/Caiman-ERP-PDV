object FrmApuracaoPisCofins: TFrmApuracaoPisCofins
  Left = 724
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Apura'#231#227'o Pis/Cofins'
  ClientHeight = 117
  ClientWidth = 288
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
    Top = 98
    Width = 288
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 288
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
      Left = 104
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GBPeriodo: TGroupBox
      Left = 2
      Top = 2
      Width = 284
      Height = 53
      Align = alClient
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 128
        Top = 26
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 22
        Width = 97
        Height = 21
        Date = 38475.460671956000000000
        Time = 38475.460671956000000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 22
        Width = 97
        Height = 21
        Date = 38475.460671956000000000
        Time = 38475.460671956000000000
        TabOrder = 1
      end
    end
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_REL_PIS_COFINS(:DATAINI, :DATAFIN, :CODEMP)'
      '')
    Left = 120
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
    object QRelISENTAS_ENTRADAS: TBCDField
      FieldName = 'ISENTAS_ENTRADAS'
      Origin = 'SP_REL_PIS_COFINS.ISENTAS_ENTRADAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelISENTAS_VENDAS: TBCDField
      FieldName = 'ISENTAS_VENDAS'
      Origin = 'SP_REL_PIS_COFINS.ISENTAS_VENDAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelTRIBUTADA_ENTRADAS: TBCDField
      FieldName = 'TRIBUTADA_ENTRADAS'
      Origin = 'SP_REL_PIS_COFINS.TRIBUTADA_ENTRADAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelTRIBUTADA_VENDAS: TBCDField
      FieldName = 'TRIBUTADA_VENDAS'
      Origin = 'SP_REL_PIS_COFINS.TRIBUTADA_VENDAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelTRIBUTADO_FRETE: TBCDField
      FieldName = 'TRIBUTADO_FRETE'
      Origin = 'SP_REL_PIS_COFINS.TRIBUTADO_FRETE'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
end
