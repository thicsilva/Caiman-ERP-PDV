inherited FrmConsTipoVenda: TFrmConsTipoVenda
  Left = 310
  Top = 215
  Caption = 'Consulta Tipo de Venda'
  ClientHeight = 450
  ClientWidth = 522
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 528
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 522
    ExplicitWidth = 522
    inherited EdtCons: TEdit
      Width = 409
      ExplicitWidth = 409
    end
    inherited BtnOK: TBitBtn
      Left = 432
      Width = 78
      OnClick = BtnOkClick
      ExplicitLeft = 432
      ExplicitWidth = 78
    end
  end
  inherited Panel2: TPanel
    Width = 522
    Height = 310
    ExplicitWidth = 522
    ExplicitHeight = 310
    inherited DBGrid: TDBGrid
      Width = 518
      Height = 271
      DataSource = DM.DSQTipoVenda
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 45
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 275
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESCONTO_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'DESCONTO(%)'
          Width = 87
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'ACRESCIMO_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'SCIMO(%)'
          Width = 93
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 165
      Top = 280
      OnClick = BtnLocalizarClick
      ExplicitLeft = 165
      ExplicitTop = 280
    end
    inherited BtnSair: TBitBtn
      Left = 282
      Top = 280
      ExplicitLeft = 282
      ExplicitTop = 280
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 431
    Width = 522
    Panels = <
      item
        Text = '  [ALT + M] Menu Fiscal'
        Width = 50
      end>
    ExplicitTop = 432
    ExplicitWidth = 522
  end
  inherited Panel3: TPanel
    Width = 522
    ExplicitWidth = 522
    inherited Label1: TLabel
      Width = 518
    end
    inherited GroupBox1: TGroupBox
      Width = 518
      ExplicitWidth = 518
      inherited ComboCons: TComboBox
        Width = 497
        ExplicitWidth = 497
      end
    end
  end
end
