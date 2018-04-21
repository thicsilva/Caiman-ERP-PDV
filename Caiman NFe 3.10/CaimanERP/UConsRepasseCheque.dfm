object FrmConsRepasse: TFrmConsRepasse
  Left = 264
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Repasse de Cheques'
  ClientHeight = 441
  ClientWidth = 632
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
    Top = 422
    Width = 632
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 271
      Height = 53
      Align = alLeft
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 128
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 20
        Width = 97
        Height = 21
        Date = 38225.764695949100000000
        Time = 38225.764695949100000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 20
        Width = 97
        Height = 21
        Date = 38225.764695949100000000
        Time = 38225.764695949100000000
        TabOrder = 1
      end
    end
    object BtnOK: TBitBtn
      Left = 328
      Top = 16
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 424
      Top = 16
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 632
    Height = 324
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 628
      Height = 320
      Align = alClient
      Color = clSilver
      DataSource = DSQConsRepasse
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
          FieldName = 'COD_REPASSE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 58
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 85
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESTINO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'DESTINO'
          Width = 400
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 381
    Width = 632
    Height = 41
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object BtnImp: TBitBtn
      Left = 203
      Top = 8
      Width = 81
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BtnImpClick
    end
    object BtnCancelar: TBitBtn
      Left = 347
      Top = 8
      Width = 81
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object QConsRepasse: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRepasse
    SQL.Strings = (
      
        'SELECT SUM(VALOR_CHE) TOTAL, COD_REPASSE, DESTINO_CHE, PRIDEP_CH' +
        'E'
      'FROM CHEQUE'
      'WHERE COD_REPASSE IS NOT NULL AND'
      'PRIDEP_CHE BETWEEN :DATAINI AND :DATAFIN'
      'GROUP BY COD_REPASSE, DESTINO_CHE, PRIDEP_CHE'
      'ORDER BY PRIDEP_CHE, COD_REPASSE')
    Left = 248
    Top = 144
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QConsRepasseTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRepasseCOD_REPASSE: TIntegerField
      FieldName = 'COD_REPASSE'
    end
    object QConsRepasseDESTINO_CHE: TStringField
      FieldName = 'DESTINO_CHE'
      Size = 60
    end
    object QConsRepassePRIDEP_CHE: TDateField
      FieldName = 'PRIDEP_CHE'
    end
  end
  object DSQConsRepasse: TDataSource
    AutoEdit = False
    DataSet = QConsRepasse
    Left = 248
    Top = 200
  end
  object IBTRRepasse: TFDTransaction
    Connection = DM.IBDatabase
    Left = 344
    Top = 144
  end
end
