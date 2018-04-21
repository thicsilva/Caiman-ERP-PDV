object FrmConsOrcamento: TFrmConsOrcamento
  Left = 316
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Or'#231'amento'
  ClientHeight = 613
  ClientWidth = 680
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 594
    Width = 680
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Sair'
        Width = 130
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 680
    Height = 473
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 432
      Width = 91
      Height = 13
      Caption = 'Total Abertos>>>'
    end
    object Label4: TLabel
      Left = 248
      Top = 432
      Width = 100
      Height = 13
      Caption = 'Total Fechados>>>'
    end
    object Label5: TLabel
      Left = 357
      Top = 432
      Width = 116
      Height = 13
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 488
      Top = 432
      Width = 78
      Height = 13
      Caption = 'Total Geral>>>'
    end
    object Label7: TLabel
      Left = 573
      Top = 432
      Width = 100
      Height = 13
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 125
      Top = 432
      Width = 116
      Height = 13
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 676
      Height = 407
      Align = alTop
      Color = clSilver
      DataSource = DSQOrcamento
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'SEQUENCIA_DAV'
          Title.Alignment = taCenter
          Title.Caption = 'SEQU'#202'NCIA'
          Width = 71
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'STATUS'
          Width = 84
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO VENDA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'COO VENDA'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GB1: TGroupBox
      Left = 8
      Top = 8
      Width = 449
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'DATA'
          'OR'#199'AMENTO EM ABERTO')
      end
    end
    object GB2: TGroupBox
      Left = 8
      Top = 64
      Width = 449
      Height = 49
      Caption = 'Chave da Consulta'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtCons: TEdit
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
        OnKeyPress = EdtConsKeyPress
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.713713645800000000
        Time = 40196.713713645800000000
        TabOrder = 1
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 16
        Width = 97
        Height = 21
        Date = 40196.713713645800000000
        Time = 40196.713713645800000000
        TabOrder = 2
      end
    end
    object BtnOk: TButton
      Left = 490
      Top = 28
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 594
      Top = 76
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object BtnImprimir: TButton
      Left = 490
      Top = 76
      Width = 65
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 3
      OnClick = BtnImprimirClick
    end
  end
  object QConsOrcamento: TFDQuery
    OnCalcFields = QConsOrcamentoCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT O.*, C.NOME_CLI, T.NOME_TPV, V.NOME_VEND'
      'FROM ORCAMENTO O'
      'INNER JOIN CLIENTE C'
      'ON (O.COD_CLI = C.COD_CLI)'
      'INNER JOIN TIPO_VENDA T'
      'ON (O.COD_TPV = T.COD_TPV)'
      'INNER JOIN VENDEDOR V'
      'ON (O.COD_VEND = V.COD_VEND)')
    Left = 168
    Top = 208
    object QConsOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ORCAMENTO.CODIGO'
      Required = True
    end
    object QConsOrcamentoSEQUENCIA_DAV: TLargeintField
      FieldName = 'SEQUENCIA_DAV'
      Origin = 'ORCAMENTO.SEQUENCIA_DAV'
      Required = True
    end
    object QConsOrcamentoCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ORCAMENTO.COD_EMP'
      Required = True
    end
    object QConsOrcamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = 'ORCAMENTO.DATA'
      Required = True
    end
    object QConsOrcamentoCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'ORCAMENTO.COD_CLI'
      Required = True
    end
    object QConsOrcamentoCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'ORCAMENTO.COD_TPV'
      Required = True
    end
    object QConsOrcamentoCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ORCAMENTO.COD_VEND'
      Required = True
    end
    object QConsOrcamentoTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'ORCAMENTO.TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsOrcamentoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'ORCAMENTO.STATUS'
      Required = True
    end
    object QConsOrcamentoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsOrcamentoNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QConsOrcamentoNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'VENDEDOR.NOME_VEND'
      Required = True
      Size = 50
    end
    object QConsOrcamentoCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 15
      Calculated = True
    end
    object QConsOrcamentoCOO: TIntegerField
      FieldName = 'COO'
      Origin = 'ORCAMENTO.COO'
    end
    object QConsOrcamentoCOO_VENDA: TIntegerField
      FieldName = 'COO_VENDA'
      Origin = 'ORCAMENTO.COO_VENDA'
    end
  end
  object DSQOrcamento: TDataSource
    AutoEdit = False
    DataSet = QConsOrcamento
    Left = 168
    Top = 264
  end
end
