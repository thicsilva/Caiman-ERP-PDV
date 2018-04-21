inherited FrmCadReceitas: TFrmCadReceitas
  Caption = 'Cadastro de Receitas'
  ClientHeight = 236
  ClientWidth = 425
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 431
  ExplicitHeight = 265
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 425
    Height = 159
    ExplicitWidth = 425
    ExplicitHeight = 159
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label30: TLabel
      Left = 8
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Ingredientes'
    end
    object cod_receita: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object MemoIngredientes: TMemo
      Left = 8
      Top = 73
      Width = 409
      Height = 80
      Color = clSilver
      Lines.Strings = (
        '')
      MaxLength = 200
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 425
    ExplicitWidth = 425
    inherited ToolBar1: TToolBar
      Width = 425
      ExplicitWidth = 425
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 216
    Width = 425
    ExplicitTop = 216
    ExplicitWidth = 425
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLRec: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRec
    Left = 184
    Top = 56
  end
  object IBTRRec: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 56
  end
end
