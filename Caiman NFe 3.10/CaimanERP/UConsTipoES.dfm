inherited FrmConsTipoES: TFrmConsTipoES
  Left = 385
  Top = 145
  Caption = 'Consulta de Classifica'#231#227'o de Entradas/Sa'#237'das'
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
      Color = clSilver
      DataSource = DM.DSTipoES
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_ES'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_ES'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 315
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TIPO_ES'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
end
