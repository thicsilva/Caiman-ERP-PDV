inherited FrmConsSecao: TFrmConsSecao
  Left = 792
  Top = 167
  Caption = 'Consulta de Se'#231#227'o'
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
      DataSource = DM.DSSec
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_SEC'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_SEC'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 347
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
