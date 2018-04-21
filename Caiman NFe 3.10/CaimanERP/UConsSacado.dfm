inherited frmConsSacado: TfrmConsSacado
  Caption = 'Consulta de Cedentes'
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.DSSacado
      Columns = <
        item
          Expanded = False
          FieldName = 'COD'
          Title.Caption = ' C'#243'digo '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO'
          Title.Caption = ' Banco '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CEDENTE'
          Title.Caption = ' C'#243'd. Cedente '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SACADO_NOME'
          Title.Caption = ' Nome'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited Panel3: TPanel
    inherited GroupBox1: TGroupBox
      inherited ComboCons: TComboBox
        Items.Strings = (
          'Palavra Chave'
          'C'#243'digo Cedente'
          'C'#243'digo')
      end
    end
  end
end
