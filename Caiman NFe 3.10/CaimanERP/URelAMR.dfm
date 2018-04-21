object FrmRelAMR: TFrmRelAMR
  Left = 426
  Top = 388
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Atraso M'#233'dio de Recebimento'
  ClientHeight = 124
  ClientWidth = 364
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 364
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
      Width = 360
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
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 364
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object BtnImp: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnVis: TBitBtn
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 105
    Width = 364
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT (DTPAGTO_CTR - VENCTO_CTR) DIAS, (VLRPAGO_CTR - ACRESCIMO' +
        '_RECEBIDO_CTR) VALOR'
      'FROM CONTAS_RECEBER'
      'WHERE DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN'
      'AND DTPAGTO_CTR > VENCTO_CTR')
    Left = 320
    Top = 32
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QAuxDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object QAuxVALOR: TBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT DIAS, VALOR, (VALOR * DIAS) TOTAL'
      'FROM PRAZO_ATRASO_MEDIO WHERE TIPO = 2 AND VALOR > 0'
      'ORDER BY DIAS')
    Left = 248
    Top = 24
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
