inherited frmConsRegiao: TfrmConsRegiao
  Caption = 'Consulta Regi'#227'o'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      Top = 20
      OnClick = BtnOKClick
      ExplicitTop = 20
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.dsRegiao
      Columns = <
        item
          Expanded = False
          FieldName = 'COD'
          Title.Caption = ' C'#243'digo'
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
      Top = 295
      OnClick = BtnLocalizarClick
      ExplicitTop = 295
    end
  end
  inherited Panel3: TPanel
    inherited GroupBox1: TGroupBox
      inherited ComboCons: TComboBox
        Items.Strings = (
          'Palavra Chave')
      end
    end
  end
end
