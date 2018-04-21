object frmAdiantamentosMesa: TfrmAdiantamentosMesa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adiantamento Mesa'
  ClientHeight = 302
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabelFX1: TsLabelFX
    Left = 24
    Top = 16
    Width = 185
    Height = 31
    Caption = 'Valor Adiantamento :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object sLabelFX2: TsLabelFX
    Left = 24
    Top = 52
    Width = 101
    Height = 31
    Caption = 'Descri'#231#227'o :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object edtValor: TCurrencyEdit
    Left = 400
    Top = 16
    Width = 177
    Height = 31
    Margins.Left = 6
    Margins.Top = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 89
    Width = 553
    Height = 176
    TabStop = False
    DataSource = DsA
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = ' Descri'#231#227'o '
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = ' Valor '
        Visible = True
      end>
  end
  object edtDescricao: TEdit
    Left = 131
    Top = 53
    Width = 262
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'EDTDESCRICAO'
    OnKeyPress = edtDescricaoKeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 283
    Width = 611
    Height = 19
    Panels = <
      item
        Text = 
          '[ F2 ] Novo   [ F3 ] Adiciona    [ F4 ] Navega    [ Del ] Apaga ' +
          '  [ESC] Sair'
        Width = 50
      end>
  end
  object cbbMoedas: TRzComboBox
    Left = 215
    Top = 16
    Width = 178
    Height = 31
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = cbbMoedasChange
  end
  object IBAd: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRA
    SQL.Strings = (
      'Select * from ADIANTAMENTO_CONTA_CLIENTE where CODIGO = :COD')
    UpdateObject = UpA
    Left = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD'
        ParamType = ptUnknown
      end>
    object IBAdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"ADIANTAMENTO_CONTA_CLIENTE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBAdORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = '"ADIANTAMENTO_CONTA_CLIENTE"."ORDEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IBAdVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ADIANTAMENTO_CONTA_CLIENTE"."VALOR"'
      currency = True
      Precision = 18
      Size = 2
    end
    object IBAdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"ADIANTAMENTO_CONTA_CLIENTE"."DESCRICAO"'
      Size = 50
    end
  end
  object IBTRA: TFDTransaction
    Connection = DM.IBDatabaseServer
  end
  object UpA: TFDUpdateSQL
    FetchRowSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  ORDEM,'
      '  VALOR,'
      '  DESCRICAO'
      'from ADIANTAMENTO_CONTA_CLIENTE '
      'where'
      '  CODIGO = :CODIGO and'
      '  ORDEM = :ORDEM')
    ModifySQL.Strings = (
      'update ADIANTAMENTO_CONTA_CLIENTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ORDEM = :ORDEM,'
      '  VALOR = :VALOR'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  ORDEM = :OLD_ORDEM')
    InsertSQL.Strings = (
      'insert into ADIANTAMENTO_CONTA_CLIENTE'
      '  (CODIGO, DESCRICAO, ORDEM, VALOR)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, ( SELECT coalesce( MAX( ORDEM ) ,0) + 1 ' +
        'FROM '
      'ADIANTAMENTO_CONTA_CLIENTE WHERE CODIGO=:CODIGO), :VALOR)')
    DeleteSQL.Strings = (
      'delete from ADIANTAMENTO_CONTA_CLIENTE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  ORDEM = :OLD_ORDEM')
    Left = 224
    Top = 104
  end
  object DsA: TDataSource
    DataSet = IBAd
    Left = 288
    Top = 136
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRA
    Left = 224
    Top = 176
  end
end
