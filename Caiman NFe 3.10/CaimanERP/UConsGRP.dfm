inherited FrmConsGRP: TFrmConsGRP
  Top = 171
  Caption = 'Consulta de Grupo de ICMS'
  ClientHeight = 466
  ClientWidth = 531
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 531
    ExplicitWidth = 531
    inherited BtnOK: TBitBtn
      OnClick = BtnOkClick
    end
  end
  inherited Panel2: TPanel
    Width = 531
    Height = 325
    ExplicitWidth = 531
    ExplicitHeight = 325
    inherited DBGrid: TDBGrid
      Width = 531
      DataSource = DM.DSGRP
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_GRP'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_ICMS_SERVICO'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS/SERVI'#199'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GRP'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 269
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQUOTA_GRP'
          Title.Alignment = taCenter
          Title.Caption = 'AL'#205'Q.(%)'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_GRP'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CST'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    inherited BtnLocalizar: TBitBtn
      Left = 168
      OnClick = BtnLocalizarClick
      ExplicitLeft = 168
    end
    inherited BtnSair: TBitBtn
      Left = 296
      ExplicitLeft = 296
    end
  end
  inherited Panel3: TPanel
    Width = 531
    ExplicitWidth = 531
    inherited Label1: TLabel
      Width = 531
    end
    inherited GroupBox1: TGroupBox
      Width = 531
      ExplicitWidth = 531
    end
  end
  inherited StatusBar1: TdxStatusBar
    Top = 446
    Width = 531
    ExplicitTop = 446
    ExplicitWidth = 531
  end
end
