inherited frmConsTeclasAtalho: TfrmConsTeclasAtalho
  Caption = 'Consulta Teclas Atalhos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.DSTeclas
      Columns = <
        item
          Expanded = False
          FieldName = 'TECLA'
          Title.Caption = ' Tecla '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = ' Descri'#231#227'o'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
