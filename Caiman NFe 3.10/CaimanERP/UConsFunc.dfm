inherited FrmConsFunc: TFrmConsFunc
  Left = 331
  Top = 182
  Caption = 'Consulta de Funcion'#225'rio'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.DSFunc
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEL_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'CELULAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ADM_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA ADM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_DEM_FUN'
          Title.Alignment = taCenter
          Title.Caption = 'DATA DEM'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
