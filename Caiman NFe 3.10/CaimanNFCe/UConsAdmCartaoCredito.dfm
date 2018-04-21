inherited FrmConsAdmCartaoCredito: TFrmConsAdmCartaoCredito
  Left = 438
  Top = 167
  Caption = 'Consulta Bandeiras de Cart'#227'o'
  ClientHeight = 501
  ClientWidth = 689
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitTop = -116
  ExplicitWidth = 695
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 689
    ExplicitWidth = 689
    inherited EdtCons: TEdit
      Width = 425
      ExplicitWidth = 425
    end
    inherited BtnOK: TBitBtn
      Left = 453
      Width = 76
      OnClick = BtnOkClick
      ExplicitLeft = 453
      ExplicitWidth = 76
    end
  end
  inherited Panel2: TPanel
    Width = 689
    Height = 361
    ExplicitWidth = 689
    ExplicitHeight = 361
    inherited DBGrid: TDBGrid
      Width = 685
      Height = 319
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 34
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 197
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'ADMINISTRADORA'
          Title.Alignment = taCenter
          Width = 134
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CALC_TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO CART'#195'O'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TAXA_CREDITO'
          Title.Alignment = taCenter
          Title.Caption = 'TX CR'#201'DITO'
          Width = 75
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'TAXA_DEBITO'
          Title.Alignment = taCenter
          Title.Caption = 'TX D'#201'BITO'
          Width = 66
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DIAS_CREDITO'
          Title.Alignment = taCenter
          Title.Caption = 'DIAS CR'#201'DITO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DIAS_DEBITO'
          Title.Alignment = taCenter
          Title.Caption = 'DIAS D'#201'BITO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CODIGO_TEF'
          Title.Alignment = taCenter
          Title.Caption = 'TEF'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 243
      Top = 328
      OnClick = BtnLocalizarClick
      ExplicitLeft = 243
      ExplicitTop = 328
    end
    inherited BtnSair: TBitBtn
      Left = 371
      Top = 328
      ExplicitLeft = 371
      ExplicitTop = 328
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 482
    Width = 689
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
    ExplicitTop = 482
    ExplicitWidth = 689
  end
  inherited Panel3: TPanel
    Width = 689
    ExplicitWidth = 689
    inherited Label1: TLabel
      Width = 685
    end
    inherited GroupBox1: TGroupBox
      Width = 685
      ExplicitWidth = 685
      inherited ComboCons: TComboBox
        Width = 665
        ExplicitWidth = 665
      end
    end
  end
end
