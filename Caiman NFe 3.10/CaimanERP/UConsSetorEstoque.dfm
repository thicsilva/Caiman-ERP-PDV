inherited FrmConsSetorEstoque: TFrmConsSetorEstoque
  Left = 345
  Top = 54
  Caption = 'Consulta de Setores de Estoque'
  ClientHeight = 532
  ClientWidth = 574
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 580
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 574
    ExplicitWidth = 574
    inherited BtnOK: TBitBtn
      OnClick = BtnOKClick
    end
  end
  inherited Panel2: TPanel
    Width = 574
    Height = 391
    ExplicitWidth = 574
    ExplicitHeight = 391
    inherited DBGrid: TDBGrid
      Width = 574
      Height = 351
      Color = clSilver
      DataSource = DM.DSSetorEstoque
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_USU'
          Title.Alignment = taCenter
          Title.Caption = 'USU'#193'RIO'
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_INICIO_ESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'DATA INICIO ESTOQUE'
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 183
      Top = 360
      OnClick = BtnLocalizarClick
      ExplicitLeft = 183
      ExplicitTop = 360
    end
    inherited BtnSair: TBitBtn
      Left = 303
      Top = 360
      ExplicitLeft = 303
      ExplicitTop = 360
    end
  end
  inherited Panel3: TPanel
    Width = 574
    ExplicitWidth = 574
    inherited Label1: TLabel
      Width = 574
    end
    inherited GroupBox1: TGroupBox
      Width = 574
      ExplicitWidth = 574
      inherited ComboCons: TComboBox
        Width = 553
        ExplicitWidth = 553
      end
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 512
    Width = 574
    ExplicitTop = 512
    ExplicitWidth = 574
  end
end
