inherited FrmConsReceitas: TFrmConsReceitas
  Caption = 'Consulta de Receitas'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.DSReceita
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_RECEITA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'INGREDIENTES'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
