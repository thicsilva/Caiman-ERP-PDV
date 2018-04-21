inherited FrmConsCaixa: TFrmConsCaixa
  Caption = 'Consulta de Caixa'
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
      DataSource = DM.DSCaixa
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_CAI'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 339
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 128
      OnClick = BtnLocalizarClick
      ExplicitLeft = 128
    end
    inherited BtnSair: TBitBtn
      Left = 248
      ExplicitLeft = 248
    end
  end
end
