inherited FrmConsAdmCartaoCredito: TFrmConsAdmCartaoCredito
  Left = 368
  Top = 179
  Caption = 'Consulta de Adm.Cart'#227'o Cr'#233'dito'
  ClientWidth = 450
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 456
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 450
    ExplicitWidth = 450
    inherited BtnOK: TBitBtn
      Left = 368
      OnClick = BtnOkClick
      ExplicitLeft = 368
    end
  end
  inherited Panel2: TPanel
    Width = 450
    ExplicitWidth = 450
    inherited DBGrid: TDBGrid
      Width = 450
      DataSource = DM.DSAdmCartao
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 263
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_TEF'
          Title.Alignment = taCenter
          Title.Caption = 'COD.TEF'
          Width = 120
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 128
      OnClick = BtnLocalizarClick
      ExplicitLeft = 128
    end
    inherited BtnSair: TBitBtn
      Left = 248
      ExplicitLeft = 248
    end
  end
  inherited Panel3: TPanel
    Width = 450
    ExplicitWidth = 450
    inherited Label1: TLabel
      Width = 450
    end
    inherited GroupBox1: TGroupBox
      Width = 450
      ExplicitWidth = 450
    end
  end
  inherited StatusBar1: TdxStatusBar
    Width = 450
    ExplicitWidth = 450
  end
end
