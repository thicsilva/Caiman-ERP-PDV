inherited FrmConsBandeiraCartao: TFrmConsBandeiraCartao
  Left = 386
  Top = 126
  Caption = 'FrmConsBandeiraCartao'
  ClientHeight = 498
  ClientWidth = 685
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 685
    ExplicitWidth = 685
    inherited EdtCons: TEdit
      Width = 433
      ExplicitWidth = 433
    end
    inherited BtnOK: TBitBtn
      Left = 461
      OnClick = BtnOKClick
      ExplicitLeft = 461
    end
  end
  inherited Panel2: TPanel
    Width = 685
    Height = 357
    ExplicitWidth = 685
    ExplicitHeight = 357
    inherited DBGrid: TDBGrid
      Width = 685
      Height = 319
      DataSource = DM.DSBandeira
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 45
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO CART'#195'O'
          Width = 84
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 243
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ADMINISTRADORA'
          Title.Alignment = taCenter
          Width = 129
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TAXA_CREDITO'
          Title.Alignment = taCenter
          Title.Caption = 'TX CR'#201'DITO'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TAXA_DEBITO'
          Title.Alignment = taCenter
          Title.Caption = 'TX D'#201'BITO'
          Width = 74
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 241
      Top = 328
      OnClick = BtnLocalizarClick
      ExplicitLeft = 241
      ExplicitTop = 328
    end
    inherited BtnSair: TBitBtn
      Left = 369
      Top = 328
      ExplicitLeft = 369
      ExplicitTop = 328
    end
  end
  inherited Panel3: TPanel
    Width = 685
    ExplicitWidth = 685
    inherited Label1: TLabel
      Width = 685
    end
    inherited GroupBox1: TGroupBox
      Width = 685
      ExplicitWidth = 685
      inherited ComboCons: TComboBox
        Width = 657
        ExplicitWidth = 657
      end
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 478
    Width = 685
    ExplicitTop = 478
    ExplicitWidth = 685
  end
end
