object FrmConsMesasAbertas: TFrmConsMesasAbertas
  Left = 203
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Mesas Abertas'
  ClientHeight = 439
  ClientWidth = 638
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 638
    Height = 311
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 634
      Height = 307
      Align = alClient
      Color = clGradientInactiveCaption
      DataSource = DSConta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'MESA'
          Width = 81
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DATA_ABERTURA'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Width = 81
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'HORA_ABERTURA'
          Title.Alignment = taCenter
          Title.Caption = 'HORA'
          Width = 76
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CALC_TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'TEMPO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 102
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CALC_STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 102
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 420
    Width = 638
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Sair'
        Width = 100
      end
      item
        Text = '[F10] Menu Fiscal'
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 638
    Height = 52
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label1: TLabel
      Left = 352
      Top = 23
      Width = 37
      Height = 16
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtTotal: TCurrencyEdit
      Left = 400
      Top = 17
      Width = 129
      Height = 25
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object BtnAbertas: TBitBtn
      Left = 291
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Abertas'
      TabOrder = 1
      OnClick = BtnAbertasClick
    end
    object BtnFechadas: TBitBtn
      Left = 376
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Fechadas'
      TabOrder = 2
      OnClick = BtnAbertasClick
    end
    object BtnTodas: TBitBtn
      Left = 547
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Todas'
      TabOrder = 4
      OnClick = BtnAbertasClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 265
      Height = 45
      Caption = 'Per'#237'odo para Fechadas ou Todas'
      TabOrder = 0
      object Label2: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 20
        Width = 89
        Height = 21
        Date = 40099.446574247700000000
        Time = 40099.446574247700000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 20
        Width = 89
        Height = 21
        Date = 40099.446574247700000000
        Time = 40099.446574247700000000
        TabOrder = 1
      end
    end
    object BtnCanceladas: TBitBtn
      Left = 461
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Canceladas'
      TabOrder = 3
      OnClick = BtnAbertasClick
    end
  end
  object QConsConta: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRCons
    OnCalcFields = QConsContaCalcFields
    SQL.Strings = (
      'SELECT C.CONTA, C.DATA_ABERTURA, C.DATA_FECHAMENTO,'
      'C.HORA_ABERTURA, C.HORA_FECHAMENTO, C.STATUS, C.TOTAL,'
      'AD.descricao'
      'FROM CONTA_CLIENTE C'
      'left outer join mesas_adicionais AD'
      'on( AD.cod = C.conta )')
    Left = 184
    Top = 176
    object QConsContaCONTA: TIntegerField
      FieldName = 'CONTA'
      Origin = 'CONTA_CLIENTE.CONTA'
      Required = True
    end
    object QConsContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'CONTA_CLIENTE.DATA_ABERTURA'
      Required = True
    end
    object QConsContaDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'CONTA_CLIENTE.DATA_FECHAMENTO'
    end
    object QConsContaHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = 'CONTA_CLIENTE.HORA_ABERTURA'
      Required = True
    end
    object QConsContaHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = 'CONTA_CLIENTE.HORA_FECHAMENTO'
    end
    object QConsContaSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'CONTA_CLIENTE.STATUS'
      Required = True
    end
    object QConsContaTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'CONTA_CLIENTE.TOTAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsContaCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 30
      Calculated = True
    end
    object QConsContaCALC_TEMPO: TTimeField
      FieldKind = fkCalculated
      FieldName = 'CALC_TEMPO'
      Calculated = True
    end
    object QConsContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"MESAS_ADICIONAIS"."DESCRICAO"'
      Size = 50
    end
  end
  object DSConta: TDataSource
    AutoEdit = False
    DataSet = QConsConta
    Left = 184
    Top = 232
  end
  object IBTRCons: TFDTransaction
    Connection = DM.IBDatabaseServer
    Left = 272
    Top = 176
  end
end
