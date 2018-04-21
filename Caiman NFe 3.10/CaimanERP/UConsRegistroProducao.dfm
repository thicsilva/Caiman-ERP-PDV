object FrmConsRegistroProducao: TFrmConsRegistroProducao
  Left = 315
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Registro de Produ'#231#227'o'
  ClientHeight = 503
  ClientWidth = 654
  Color = clWhite
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 654
    Height = 422
    Align = alClient
    BevelOuter = bvNone
    Color = 16710131
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 654
      Height = 360
      Align = alTop
      Color = clSilver
      DataSource = DSCons
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'LOCAL DO ESTOQUE'
          Width = 465
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 294
      Top = 368
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object GB2: TGroupBox
      Left = 8
      Top = 8
      Width = 353
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 144
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
        Left = 184
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
      Top = 61
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
    object BtnOk: TButton
      Left = 386
      Top = 24
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 466
      Top = 24
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object QCons: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, L.DESCRICAO'
      'FROM REGISTRO_PRODUCAO R'
      'INNER JOIN LOCAIS_ESTOQUE L'
      'ON (R.CODIGO_LOCAL_ESTOQUE = L.CODIGO)'
      'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN'
      'ORDER BY R.DATA, R.CODIGO')
    Left = 176
    Top = 120
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
    object QConsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_PRODUCAO.CODIGO'
      Required = True
    end
    object QConsDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_PRODUCAO.DATA'
      Required = True
    end
    object QConsCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'REGISTRO_PRODUCAO.COD_EMP'
      Required = True
    end
    object QConsCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = 'REGISTRO_PRODUCAO.CODIGO_LOCAL_ESTOQUE'
      Required = True
    end
    object QConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'LOCAIS_ESTOQUE.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSCons: TDataSource
    AutoEdit = False
    DataSet = QCons
    Left = 176
    Top = 176
  end
end
