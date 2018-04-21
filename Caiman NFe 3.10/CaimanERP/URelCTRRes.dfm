object FrmRelAReceberRes: TFrmRelAReceberRes
  Left = 468
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rel.Contas a Receber [Resumido]'
  ClientHeight = 203
  ClientWidth = 340
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
    Top = 184
    Width = 340
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 145
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GB: TGroupBox
      Left = 2
      Top = 35
      Width = 336
      Height = 49
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 132
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 16
        Width = 97
        Height = 21
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 160
        Top = 16
        Width = 97
        Height = 21
        Date = 38092.661706886600000000
        Time = 38092.661706886600000000
        TabOrder = 1
      end
      object EdtDias: TEdit
        Left = 8
        Top = 16
        Width = 313
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 2
      end
    end
    object RdgOrdem: TRadioGroup
      Left = 2
      Top = 84
      Width = 336
      Height = 41
      Align = alTop
      Caption = 'Ordem para Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'Alfab'#233'tica'
        'C'#243'digo')
      TabOrder = 1
    end
    object CheckEmp: TCheckBox
      Left = 7
      Top = 128
      Width = 153
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 2
    end
    object Rdg: TRadioGroup
      Left = 2
      Top = 2
      Width = 336
      Height = 33
      Align = alTop
      Columns = 2
      Items.Strings = (
        'Por Per'#237'odo'
        'Por Dias')
      TabOrder = 3
      OnClick = RdgClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 340
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnVis: TBitBtn
      Left = 36
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 132
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 228
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object QRelCTR: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT SUM(R.VALOR_CTR - R.DEVOLUCAO_CTR) TOTAL, R.COD_CLI, C.NO' +
        'ME_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'WHERE R.DTPAGTO_CTR IS NULL'
      'GROUP BY R.COD_CLI, C.NOME_CLI '
      '')
    Left = 296
    Top = 64
    object QRelCTRTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCTRCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object QRelCTRNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Required = True
      Size = 60
    end
  end
end
