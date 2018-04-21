inherited FrmConsEmp: TFrmConsEmp
  Left = 368
  Top = 184
  Caption = 'Consulta de Empresa'
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
      DataSource = DM.DSEmp
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'RAZ'#195'O SOCIAL'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TEL_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'FAX_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'FAX'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Top = 298
      OnClick = BtnLocalizarClick
      ExplicitTop = 298
    end
    inherited BtnSair: TBitBtn
      Top = 297
      ExplicitTop = 297
    end
  end
end
