inherited FrmConsLocaisEstoque: TFrmConsLocaisEstoque
  Left = 417
  Top = 170
  Caption = 'Consulta de Locais de Estoque'
  ClientHeight = 508
  ClientWidth = 453
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 459
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 453
    ExplicitWidth = 453
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Width = 453
    Height = 367
    ExplicitWidth = 453
    ExplicitHeight = 367
    inherited DBGrid: TDBGrid
      Width = 453
      Height = 319
      DataSource = DM.DSLocaisEstoque
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 347
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 149
      Top = 336
      OnClick = BtnLocalizarClick
      ExplicitLeft = 149
      ExplicitTop = 336
    end
    inherited BtnSair: TBitBtn
      Left = 269
      Top = 336
      ExplicitLeft = 269
      ExplicitTop = 336
    end
  end
  inherited Panel3: TPanel
    Width = 453
    ExplicitWidth = 453
    inherited Label1: TLabel
      Width = 453
    end
    inherited GroupBox1: TGroupBox
      Width = 453
      ExplicitWidth = 453
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 488
    Width = 453
    ExplicitTop = 488
    ExplicitWidth = 453
  end
end
