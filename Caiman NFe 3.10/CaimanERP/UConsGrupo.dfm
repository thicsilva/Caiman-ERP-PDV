inherited FrmConsGrupo: TFrmConsGrupo
  Left = 364
  Top = 175
  Caption = 'FrmConsGrupo'
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      Top = 17
      OnClick = BtnOKClick
      ExplicitTop = 17
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid: TDBGrid
      DataSource = DM.DSGrupo
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_GRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 347
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Top = 295
      OnClick = BtnLocalizarClick
      ExplicitTop = 295
    end
  end
end
