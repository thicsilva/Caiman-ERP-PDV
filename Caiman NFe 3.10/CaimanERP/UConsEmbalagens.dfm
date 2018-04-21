inherited FrmConsEmbalagens: TFrmConsEmbalagens
  Caption = 'Consulta de Embalagens'
  ClientHeight = 492
  ClientWidth = 491
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 491
    ExplicitWidth = 491
    inherited EdtCons: TEdit
      Width = 385
      ExplicitWidth = 385
    end
    inherited BtnOK: TBitBtn
      Left = 405
      OnClick = BtnOKClick
      ExplicitLeft = 405
    end
  end
  inherited Panel2: TPanel
    Width = 491
    Height = 351
    ExplicitWidth = 491
    ExplicitHeight = 351
    inherited DBGrid: TDBGrid
      Width = 491
      Height = 311
      DataSource = DM.DSEmb
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 52
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Width = 320
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Width = 57
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'UND'
          Width = 36
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 152
      Top = 320
      OnClick = BtnLocalizarClick
      ExplicitLeft = 152
      ExplicitTop = 320
    end
    inherited BtnSair: TBitBtn
      Left = 264
      Top = 320
      ExplicitLeft = 264
      ExplicitTop = 320
    end
  end
  inherited Panel3: TPanel
    Width = 491
    ExplicitWidth = 491
    inherited Label1: TLabel
      Width = 491
    end
    inherited GroupBox1: TGroupBox
      Width = 491
      ExplicitWidth = 491
      inherited ComboCons: TComboBox
        Width = 465
        ExplicitWidth = 465
      end
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 472
    Width = 491
    ExplicitTop = 472
    ExplicitWidth = 491
  end
end
