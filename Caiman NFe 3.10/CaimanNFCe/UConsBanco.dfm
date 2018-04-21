inherited FrmConsBanco: TFrmConsBanco
  Left = 323
  Top = 185
  Caption = 'Consulta de Banco'
  ClientHeight = 465
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Height = 325
    ExplicitHeight = 325
    inherited DBGrid: TDBGrid
      DataSource = DM.DSQBanco
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 305
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 446
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
    ExplicitTop = 446
  end
end
