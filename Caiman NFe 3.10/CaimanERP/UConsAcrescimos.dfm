object FrmConsAcrescimos: TFrmConsAcrescimos
  Left = 315
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Acr'#233'scimos nas Vendas'
  ClientHeight = 364
  ClientWidth = 576
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 73
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GB2: TGroupBox
      Left = 8
      Top = 6
      Width = 241
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 56
      Width = 121
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
    object BtnOK: TBitBtn
      Left = 269
      Top = 31
      Width = 65
      Height = 25
      Caption = '&Ok'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 349
      Top = 31
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 576
    Height = 272
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label2: TLabel
      Left = 288
      Top = 248
      Width = 130
      Height = 17
      Caption = 'Total dos Acr'#233'scimos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 572
      Height = 231
      Align = alTop
      Color = clSilver
      DataSource = DSQConsAcres
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 58
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 290
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACRESCIMO_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'SCIMO'
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'VL.VENDA'
          Width = 68
          Visible = True
        end>
    end
    object EdtTotal: TCurrencyEdit
      Left = 448
      Top = 244
      Width = 113
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 1
      ZeroEmpty = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 345
    Width = 576
    Height = 19
    Panels = <>
  end
  object QConsAcres: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT V.COD_VEN, V.ACRESCIMO_VEN, V.DATA_VEN, V.COD_CLI, V.TOTA' +
        'L_VEN, C.NOME_CLI'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      '')
    Left = 80
    Top = 168
    object QConsAcresACRESCIMO_VEN: TBCDField
      FieldName = 'ACRESCIMO_VEN'
      Origin = 'VENDAS.ACRESCIMO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsAcresDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsAcresCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'VENDAS.COD_CLI'
      Required = True
    end
    object QConsAcresNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsAcresCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QConsAcresTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsAcres: TDataSource
    AutoEdit = False
    DataSet = QConsAcres
    Left = 80
    Top = 224
  end
end
