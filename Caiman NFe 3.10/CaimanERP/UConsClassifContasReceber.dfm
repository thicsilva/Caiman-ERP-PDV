inherited FrmConsClassifContasReceber: TFrmConsClassifContasReceber
  Left = 459
  Top = 172
  Caption = 'FrmConsClassifContasReceber'
  ClientHeight = 467
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 457
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Height = 326
    ExplicitHeight = 326
    inherited DBGrid: TDBGrid
      DataSource = DM.DSClaCTR
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Width = 347
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 447
    ExplicitTop = 447
  end
end
