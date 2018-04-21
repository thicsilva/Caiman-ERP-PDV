object FrmRelPMV: TFrmRelPMV
  Left = 321
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Prazo M'#233'dio de Vendas'
  ClientHeight = 122
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 344
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnSair: TBitBtn
      Left = 239
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object BtnImp: TBitBtn
      Left = 135
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnVis: TBitBtn
      Left = 31
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 340
      Height = 47
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 184
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 48
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 216
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 7
      Top = 50
      Width = 161
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 103
    Width = 344
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      '')
    Left = 184
    Top = 16
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT DIAS, VALOR, (VALOR * DIAS) TOTAL'
      'FROM PRAZO_ATRASO_MEDIO WHERE TIPO = 1 AND VALOR > 0'
      'ORDER BY DIAS')
    Left = 248
    Top = 16
    object QRelDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'PRAZO_ATRASO_MEDIO.DIAS'
      Required = True
    end
    object QRelVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'PRAZO_ATRASO_MEDIO.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
end
