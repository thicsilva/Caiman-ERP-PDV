inherited FrmConsTipoProduto: TFrmConsTipoProduto
  Left = 350
  Top = 184
  Caption = 'Consulta de Tipo de Produto'
  ClientHeight = 466
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Height = 325
    ExplicitHeight = 325
    inherited DBGrid: TDBGrid
      DataSource = DM.DSTPProd
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
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
    Top = 446
    ExplicitTop = 446
  end
end
