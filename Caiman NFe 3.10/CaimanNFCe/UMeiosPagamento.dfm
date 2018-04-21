object FrmMeiosPagamento: TFrmMeiosPagamento
  Left = 423
  Top = 384
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Meios de Pagamento'
  ClientHeight = 127
  ClientWidth = 318
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
    Top = 108
    Width = 318
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 108
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TButton
      Left = 70
      Top = 77
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 190
      Top = 77
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 314
      Height = 65
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Data Incial'
      end
      object Label2: TLabel
        Left = 176
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 32
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 0
      end
      object EdtDataIni: TDateTimePicker
        Left = 32
        Top = 32
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 1
      end
    end
  end
  object QMeiosPagamentos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(VALOR_PAGO) VALOR_ACUMULADO,'
      '                    TIPO_DOCUMENTO, MEIO_PAGAMENTO, DATA'
      '                    FROM MEIOS_PAGAMENTOS_ECF'
      '                    WHERE DATA BETWEEN :DATAINI AND :DATAFIN'
      
        '                    GROUP BY DATA, MEIO_PAGAMENTO, TIPO_DOCUMENT' +
        'O'
      
        '                    ORDER BY DATA, MEIO_PAGAMENTO, TIPO_DOCUMENT' +
        'O')
    Left = 152
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end>
    object QMeiosPagamentosVALOR_ACUMULADO: TBCDField
      FieldName = 'VALOR_ACUMULADO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QMeiosPagamentosTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."TIPO_DOCUMENTO"'
      Required = True
      Size = 30
    end
    object QMeiosPagamentosMEIO_PAGAMENTO: TStringField
      FieldName = 'MEIO_PAGAMENTO'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."MEIO_PAGAMENTO"'
      Required = True
      Size = 15
    end
    object QMeiosPagamentosDATA: TDateField
      FieldName = 'DATA'
      Origin = '"MEIOS_PAGAMENTOS_ECF"."DATA"'
      Required = True
    end
  end
end
