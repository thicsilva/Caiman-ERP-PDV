object FrmSaldoCC: TFrmSaldoCC
  Left = 308
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Saldo das Contas'
  ClientHeight = 300
  ClientWidth = 522
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 241
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 518
      Height = 237
      Align = alClient
      Color = clSilver
      DataSource = DSQSaldoCC
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
          Expanded = False
          FieldName = 'CODIGO_CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DA CONTA'
          Width = 283
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO_CONCILIADO'
          Title.Alignment = taCenter
          Title.Caption = 'SALDO CONC.'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Title.Alignment = taCenter
          Width = 82
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 241
    Width = 522
    Height = 40
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 218
      Top = 7
      Width = 55
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 522
    Height = 19
    Panels = <>
  end
  object QSaldoCC: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_SALDO_CONTAS_CORRENTE'
      'ORDER BY CODIGO_CONTA')
    Left = 224
    Top = 88
    object QSaldoCCCODIGO_CONTA: TIntegerField
      FieldName = 'CODIGO_CONTA'
      Origin = 'SP_SALDO_CONTAS_CORRENTE.CODIGO_CONTA'
    end
    object QSaldoCCNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Origin = 'SP_SALDO_CONTAS_CORRENTE.NOME_CONTA'
      Size = 50
    end
    object QSaldoCCSALDO_CONCILIADO: TBCDField
      FieldName = 'SALDO_CONCILIADO'
      Origin = 'SP_SALDO_CONTAS_CORRENTE.SALDO_CONCILIADO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QSaldoCCSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SP_SALDO_CONTAS_CORRENTE.SALDO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQSaldoCC: TDataSource
    AutoEdit = False
    DataSet = QSaldoCC
    Left = 224
    Top = 144
  end
end
