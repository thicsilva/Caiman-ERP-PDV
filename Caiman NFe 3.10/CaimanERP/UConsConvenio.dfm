inherited FrmConsConvenio: TFrmConsConvenio
  Caption = 'Consulta de Conv'#234'nio'
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
      DataSource = DM.DSConv
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CON'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CON'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL_CON'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAX_CON'
          Title.Alignment = taCenter
          Title.Caption = 'FAX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESPONSAVEL_CON'
          Title.Alignment = taCenter
          Title.Caption = 'RESPONS'#193'VEL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIA_REFERENCIA_CON'
          Title.Alignment = taCenter
          Title.Caption = 'DIA REF.'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
