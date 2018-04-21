inherited FrmConsVend: TFrmConsVend
  Caption = 'Consulta de Vendedor'
  ClientHeight = 472
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Height = 331
    ExplicitHeight = 331
    inherited DBGrid: TDBGrid
      DataSource = DM.DSVend
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISSAO_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'COMISS'#195'O'
          Width = 66
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 452
    ExplicitTop = 452
  end
end
