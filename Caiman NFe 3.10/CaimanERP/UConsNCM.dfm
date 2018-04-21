inherited frmConsNCM: TfrmConsNCM
  Caption = 'Consulta de NCM'
  ClientHeight = 461
  ClientWidth = 693
  OnDestroy = FormDestroy
  ExplicitWidth = 699
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 693
    ExplicitWidth = 693
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Width = 693
    Height = 320
    ExplicitWidth = 693
    ExplicitHeight = 320
    inherited DBGrid: TDBGrid
      Width = 693
      DataSource = dsNCM
      Columns = <
        item
          Expanded = False
          FieldName = 'NCM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EX'
          Title.Caption = 'Exce'#231#227'o(EX)'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 550
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
    inherited BtnSair: TBitBtn
      Left = 220
      ExplicitLeft = 220
    end
  end
  inherited Panel3: TPanel
    Width = 693
    ExplicitWidth = 693
    inherited Label1: TLabel
      Width = 693
    end
    inherited GroupBox1: TGroupBox
      Width = 693
      ExplicitWidth = 693
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 441
    Width = 693
    ExplicitTop = 441
    ExplicitWidth = 693
  end
  object QNCM: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRNCM
    SQL.Strings = (
      'SELECT * FROM NCM')
    Left = 456
    Top = 64
    object QNCMCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNCMNCM: TIntegerField
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNCMEX: TIntegerField
      FieldName = 'EX'
      Origin = 'EX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNCMTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNCMDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object QNCMNACIONAL: TBCDField
      FieldName = 'NACIONAL'
      Origin = 'NACIONAL'
      Precision = 18
      Size = 2
    end
    object QNCMIMPORTADO: TBCDField
      FieldName = 'IMPORTADO'
      Origin = 'IMPORTADO'
      Precision = 18
      Size = 2
    end
    object QNCMESTADUAL: TBCDField
      FieldName = 'ESTADUAL'
      Origin = 'ESTADUAL'
      Precision = 18
      Size = 2
    end
    object QNCMMUNICIPAL: TBCDField
      FieldName = 'MUNICIPAL'
      Origin = 'MUNICIPAL'
      Precision = 18
      Size = 2
    end
    object QNCMDT_INI: TDateField
      FieldName = 'DT_INI'
      Origin = 'DT_INI'
    end
    object QNCMDT_FIM: TDateField
      FieldName = 'DT_FIM'
      Origin = 'DT_FIM'
    end
  end
  object TRNCM: TFDTransaction
    Connection = DM.IBDatabase
    Left = 512
    Top = 64
  end
  object dsNCM: TDataSource
    DataSet = QNCM
    Left = 336
    Top = 232
  end
end
