inherited frmCadRegiao: TfrmCadRegiao
  Caption = ' Cadastro de Regi'#227'o '
  ClientHeight = 407
  ClientWidth = 671
  OnShow = FormShow
  ExplicitWidth = 677
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 671
    Height = 330
    ExplicitWidth = 671
    ExplicitHeight = 330
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 671
      Height = 330
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = ' Regi'#227'o '
        object Label1: TLabel
          Left = 15
          Top = 16
          Width = 44
          Height = 13
          Caption = 'C'#243'digo :'
        end
        object Label2: TLabel
          Left = 15
          Top = 58
          Width = 55
          Height = 13
          Caption = 'Descri'#231#227'o :'
        end
        object dbedtCOD: TDBEdit
          Left = 15
          Top = 33
          Width = 121
          Height = 21
          Color = clYellow
          DataField = 'COD'
          DataSource = dsRegiao
          ReadOnly = True
          TabOrder = 0
        end
        object dbedtDESCRICAO: TDBEdit
          Left = 15
          Top = 75
          Width = 594
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dsRegiao
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = ' Cidades '
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pAviso: TPanel
          Left = 133
          Top = 183
          Width = 404
          Height = 41
          Caption = 'Voc'#234' precisa estra com uma regi'#227'o em edi'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = False
        end
        object pCidades: TPanel
          Left = 0
          Top = 0
          Width = 659
          Height = 299
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 24
          ExplicitTop = 80
          object sSpeedButton1: TsSpeedButton
            Left = 432
            Top = 49
            Width = 105
            Height = 41
            Caption = 'Nova Cidade'
            OnClick = sSpeedButton1Click
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object sSpeedButton2: TsSpeedButton
            Left = 543
            Top = 49
            Width = 105
            Height = 41
            Caption = 'Excluir Cidade'
            OnClick = sSpeedButton2Click
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 96
            Width = 641
            Height = 193
            DataSource = dsCidades
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_MUNICIPIO'
                Title.Caption = ' C'#243'd. Munic'#237'pio  '
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = ' Munic'#237'pio'
                Width = 300
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 671
    ExplicitWidth = 671
    inherited ToolBar1: TToolBar
      Width = 671
      ExplicitWidth = 671
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 387
    Width = 671
    ExplicitTop = 387
    ExplicitWidth = 671
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object QRegiao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRegiao
    UpdateObject = upRegiao
    SQL.Strings = (
      'select * from regiao')
    Left = 344
    Top = 168
    object QRegiaoCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"REGIAO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRegiaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"REGIAO"."DESCRICAO"'
      Size = 100
    end
  end
  object IBTRRegiao: TFDTransaction
    Connection = DM.IBDatabase
    Left = 416
    Top = 184
  end
  object upRegiao: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into regiao'
      '  (COD, DESCRICAO)'
      'values'
      '  (:COD, :DESCRICAO)')
    ModifySQL.Strings = (
      'update regiao'
      'set'
      '  COD = :COD,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  COD = :OLD_COD')
    DeleteSQL.Strings = (
      'delete from regiao'
      'where'
      '  COD = :OLD_COD')
    FetchRowSQL.Strings = (
      'Select '
      '  COD,'
      '  DESCRICAO'
      'from regiao '
      'where'
      '  COD = :COD')
    Left = 400
    Top = 160
  end
  object dsRegiao: TDataSource
    DataSet = QRegiao
    OnDataChange = dsRegiaoDataChange
    Left = 480
    Top = 192
  end
  object QCidades: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRegiao
    UpdateObject = upCidades
    SQL.Strings = (
      'select * from REGIAO_CIDADES')
    Left = 464
    Top = 104
    object QCidadesCOD_REGIAO: TIntegerField
      FieldName = 'COD_REGIAO'
      Origin = '"REGIAO_CIDADES"."COD_REGIAO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCidadesCOD_MUNICIPIO: TIntegerField
      FieldName = 'COD_MUNICIPIO'
      Origin = '"REGIAO_CIDADES"."COD_MUNICIPIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"REGIAO_CIDADES"."DESCRICAO"'
      Size = 100
    end
  end
  object upCidades: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into REGIAO_CIDADES'
      '  (COD_MUNICIPIO, COD_REGIAO, DESCRICAO)'
      'values'
      '  (:COD_MUNICIPIO, :COD_REGIAO, :DESCRICAO)')
    ModifySQL.Strings = (
      'update REGIAO_CIDADES'
      'set'
      '  COD_MUNICIPIO = :COD_MUNICIPIO,'
      '  COD_REGIAO = :COD_REGIAO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  COD_MUNICIPIO = :OLD_COD_MUNICIPIO and'
      '  COD_REGIAO = :OLD_COD_REGIAO')
    DeleteSQL.Strings = (
      'delete from REGIAO_CIDADES'
      'where'
      '  COD_MUNICIPIO = :OLD_COD_MUNICIPIO and'
      '  COD_REGIAO = :OLD_COD_REGIAO')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_REGIAO,'
      '  COD_MUNICIPIO,'
      '  DESCRICAO'
      'from REGIAO_CIDADES '
      'where'
      '  COD_MUNICIPIO = :COD_MUNICIPIO and'
      '  COD_REGIAO = :COD_REGIAO')
    Left = 512
    Top = 104
  end
  object dsCidades: TDataSource
    DataSet = QCidades
    Left = 584
    Top = 104
  end
end
