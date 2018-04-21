inherited FrmConsVend: TFrmConsVend
  Left = 417
  Top = 175
  Caption = 'Consulta de Vendedor'
  ClientHeight = 466
  ClientWidth = 474
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 480
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 474
    ExplicitWidth = 474
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Width = 474
    Height = 326
    ExplicitWidth = 474
    ExplicitHeight = 326
    inherited DBGrid: TDBGrid
      Width = 470
      DataSource = DM.DSQVend
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 41
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Width = 294
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COMISSAO_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'COMISS'#195'O'
          Width = 66
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'ATIVO_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'ATIVO'
          Width = 44
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      OnClick = BtnLocalizarClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 447
    Width = 474
    ExplicitTop = 447
    ExplicitWidth = 474
  end
  inherited Panel3: TPanel
    Width = 474
    ExplicitWidth = 474
    inherited Label1: TLabel
      Width = 470
    end
    inherited GroupBox1: TGroupBox
      Width = 470
      ExplicitWidth = 470
    end
  end
end
