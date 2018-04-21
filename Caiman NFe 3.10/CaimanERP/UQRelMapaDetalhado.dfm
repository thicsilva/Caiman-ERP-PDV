object FrmRelMapaDetalhado: TFrmRelMapaDetalhado
  Left = 403
  Top = 384
  BorderIcons = [biMaximize]
  BorderStyle = bsSingle
  Caption = 'Rel.Mapa Resumo'
  ClientHeight = 164
  ClientWidth = 280
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 145
    Width = 280
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 280
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 15
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
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 191
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
    Width = 280
    Height = 105
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label7: TLabel
      Left = 8
      Top = 60
      Width = 19
      Height = 13
      Caption = 'ECF'
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 276
      Height = 55
      Align = alTop
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
    object ComboCaixa: TComboBox
      Left = 8
      Top = 76
      Width = 265
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  object QRelMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.COD_GRP,  SUM(I.VALOR) TOTAL, G.NOME_GRP, G.TIPO_GRP '
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN MAPA_RESUMO M'
      'ON (I.CODIGO = M.CODIGO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      
        'WHERE M.CHECKOUT = :CHECK AND M.DATA BETWEEN :DATAINI AND :DATAF' +
        'IN AND M.COD_EMP = :CODEMP'
      'GROUP BY I.COD_GRP, G.NOME_GRP, G.TIPO_GRP'
      'ORDER BY G.NOME_GRP')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'CHECK'
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QRelMapaCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Required = True
    end
    object QRelMapaTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelMapaNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
    object QRelMapaTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
  end
end
