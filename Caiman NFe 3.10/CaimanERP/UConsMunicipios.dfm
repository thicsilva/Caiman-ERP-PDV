inherited FrmConsMunicipios: TFrmConsMunicipios
  Left = 402
  Top = 164
  Caption = 'Consulta de Municipios'
  ClientHeight = 467
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Height = 326
    ExplicitHeight = 326
    inherited DBGrid: TDBGrid
      DataSource = DM.DSMunicipio
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_MUNICIPIO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.IBGE'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 447
    ExplicitTop = 447
  end
end
