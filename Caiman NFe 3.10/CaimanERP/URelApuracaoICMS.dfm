object FrmRelApuracaoICMS: TFrmRelApuracaoICMS
  Left = 546
  Top = 333
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Apura'#231#227'o ICMS'
  ClientHeight = 114
  ClientWidth = 283
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
    Width = 283
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 283
    Height = 38
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
    Width = 283
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
      Width = 279
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
      'FROM SP_APURACAO_ICMS(:DATAINI, :DATAFIN, :CODEMP)'
      'ORDER BY TIPO, CFOP')
    Left = 136
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
    object QRelCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'SP_APURACAO_ICMS.CFOP'
    end
    object QRelVALORCONTABIL: TBCDField
      FieldName = 'VALORCONTABIL'
      Origin = 'SP_APURACAO_ICMS.VALORCONTABIL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      Origin = 'SP_APURACAO_ICMS.BASECALCULO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Origin = 'SP_APURACAO_ICMS.VALORICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'SP_APURACAO_ICMS.ISENTAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'SP_APURACAO_ICMS.OUTRAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'SP_APURACAO_ICMS.TIPO'
      FixedChar = True
      Size = 1
    end
  end
end
