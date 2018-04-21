inherited FrmConsTransp: TFrmConsTransp
  Left = 312
  Top = 111
  Caption = 'Consulta de Transportadora'
  ClientHeight = 478
  ClientWidth = 454
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 460
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 454
    ExplicitWidth = 454
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Width = 454
    Height = 337
    ExplicitWidth = 454
    ExplicitHeight = 337
    inherited DBGrid: TDBGrid
      Width = 454
      Height = 295
      Color = clSilver
      DataSource = DM.DSTransp
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLACA_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'PLACA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_PLACA_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'UF PLACA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'END_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'ENDERE'#199'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CID_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'CIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EST_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'EST'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ/CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSC_TRA'
          Title.Alignment = taCenter
          Title.Caption = 'INSC.ESTADUAL'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 130
      Top = 304
      OnClick = BtnLocalizarClick
      ExplicitLeft = 130
      ExplicitTop = 304
    end
    inherited BtnSair: TBitBtn
      Left = 250
      Top = 303
      ExplicitLeft = 250
      ExplicitTop = 303
    end
  end
  inherited Panel3: TPanel
    Width = 454
    ExplicitWidth = 454
    inherited Label1: TLabel
      Width = 454
    end
    inherited GroupBox1: TGroupBox
      Width = 454
      ExplicitWidth = 454
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 458
    Width = 454
    ExplicitTop = 458
    ExplicitWidth = 454
  end
end
