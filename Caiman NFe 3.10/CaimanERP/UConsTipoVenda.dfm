inherited FrmConsTipoVenda: TFrmConsTipoVenda
  Caption = 'Consulta Tipo de Venda'
  ClientWidth = 640
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 640
    ExplicitWidth = 640
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Width = 640
    ExplicitWidth = 640
    inherited DBGrid: TDBGrid
      Width = 640
      Color = clSilver
      DataSource = DM.DSTipoVenda
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_TABELA'
          Title.Alignment = taCenter
          Title.Caption = 'TABELA PRE'#199'O'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'CLASSIFICA'#199#195'O'
          Width = 163
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 218
      OnClick = BtnLocalizarClick
      ExplicitLeft = 218
    end
    inherited BtnSair: TBitBtn
      Left = 346
      ExplicitLeft = 346
    end
  end
  inherited Panel3: TPanel
    Width = 640
    ExplicitWidth = 640
    inherited Label1: TLabel
      Width = 640
    end
    inherited GroupBox1: TGroupBox
      Width = 640
      ExplicitWidth = 640
    end
  end
  inherited StatusBar1: TdxStatusBar
    Width = 640
    ExplicitWidth = 640
  end
end
