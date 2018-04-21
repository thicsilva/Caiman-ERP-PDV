inherited FrmConsUsu: TFrmConsUsu
  Left = 353
  Top = 184
  Caption = 'Consulta de Usu'#225'rio'
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      Color = clSilver
      DataSource = DSQConsUsu
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_USU'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_USU'
          Title.Alignment = taCenter
          Title.Caption = 'USUARIO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'GRUPO'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERADOR_CAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'OP.CX'
          Width = 40
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  object QConsUsu: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT U.*, G.NOME_GRUPO'
      'FROM USUARIO U'
      'INNER JOIN GRUPO_USUARIO G'
      'ON (U.COD_GRUPO = G.COD_GRUPO)')
    Left = 248
    Top = 120
    object QConsUsuCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'USUARIO.COD_USU'
      Required = True
    end
    object QConsUsuNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QConsUsuSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'USUARIO.SENHA_USU'
      Required = True
      Size = 6
    end
    object QConsUsuCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'USUARIO.COD_GRUPO'
      Required = True
    end
    object QConsUsuNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Origin = 'GRUPO_USUARIO.NOME_GRUPO'
      Required = True
      Size = 50
    end
    object QConsUsuOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'USUARIO.OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSQConsUsu: TDataSource
    AutoEdit = False
    DataSet = QConsUsu
    Left = 248
    Top = 184
  end
end
