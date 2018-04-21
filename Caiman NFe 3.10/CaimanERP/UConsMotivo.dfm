inherited FrmConsMotivo: TFrmConsMotivo
  Caption = 'Consulta de Motivo de Acerto'
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
      DataSource = DM.DSMotivo
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_MOT'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_MOT'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTSAI_MOT'
          Title.Alignment = taCenter
          Title.Caption = 'ENT/SAI'
          Width = 60
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
