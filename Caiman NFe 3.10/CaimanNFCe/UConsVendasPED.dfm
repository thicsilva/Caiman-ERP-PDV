object FrmConsVendasPED: TFrmConsVendasPED
  Left = 286
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Vendas [PED]'
  ClientHeight = 447
  ClientWidth = 660
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 428
    Width = 660
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Duplo Clique ou Enter para Cancelar a Nota Fiscal'
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 660
    Height = 307
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 656
      Height = 303
      Align = alClient
      Color = clGradientInactiveCaption
      DataSource = DSVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DATA_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NUMERO_NOTA_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO NF.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CODIFICACAO_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'MODELO'
          Width = 49
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'SERIE_NOTA_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'S'#201'RIE'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TOTAL_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 68
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 121
    Align = alTop
    BevelInner = bvLowered
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
          'PER'#205'ODO'
          'N'#218'MERO DA NOTA FISCAL')
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
        Left = 128
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
        TabOrder = 0
        OnKeyPress = EdtConsKeyPress
      end
      object EdtDataInicio: TDateTimePicker
        Left = 8
        Top = 16
        Width = 97
        Height = 21
        Date = 40163.469262511600000000
        Time = 40163.469262511600000000
        TabOrder = 1
      end
      object EdtDataFinal: TDateTimePicker
        Left = 152
        Top = 16
        Width = 97
        Height = 21
        Date = 40163.469262511600000000
        Time = 40163.469262511600000000
        TabOrder = 2
      end
    end
    object BtnOk: TButton
      Left = 514
      Top = 36
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 514
      Top = 76
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object QConsVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRVenda
    SQL.Strings = (
      
        'SELECT V.COD_VEN, V.DATA_VEN, V.NUMERO_NOTA_FISCAL, V.SERIE_NOTA' +
        '_FISCAL, V.CODIFICACAO_FISCAL,'
      'V.TOTAL_VEN, V.CANCELADA_VEN, C.NOME_CLI'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      '')
    Left = 176
    Top = 208
    object QConsVendaCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QConsVendaDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsVendaNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'VENDAS.NUMERO_NOTA_FISCAL'
    end
    object QConsVendaSERIE_NOTA_FISCAL: TStringField
      FieldName = 'SERIE_NOTA_FISCAL'
      Origin = 'VENDAS.SERIE_NOTA_FISCAL'
      Size = 3
    end
    object QConsVendaTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsVendaNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsVendaCANCELADA_VEN: TIntegerField
      FieldName = 'CANCELADA_VEN'
      Origin = 'VENDAS.CANCELADA_VEN'
      Required = True
    end
    object QConsVendaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'VENDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object IBTRVenda: TFDTransaction
    Connection = DM.IBDatabase
    Left = 96
    Top = 208
  end
  object DSVenda: TDataSource
    AutoEdit = False
    DataSet = QConsVenda
    Left = 176
    Top = 264
  end
end
