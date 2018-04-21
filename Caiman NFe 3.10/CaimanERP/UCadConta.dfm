inherited FrmCadConta: TFrmCadConta
  Left = 352
  Top = 364
  Caption = 'Cadastro de Contas Contas Corrente'
  ClientHeight = 175
  ClientWidth = 490
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 496
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 490
    Height = 98
    ExplicitWidth = 490
    ExplicitHeight = 98
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object cod_conta: TEdit
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
    object EdtNome: TEdit
      Left = 8
      Top = 64
      Width = 465
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 490
    ExplicitWidth = 490
    inherited ToolBar1: TToolBar
      Width = 490
      ExplicitWidth = 490
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 155
    Width = 490
    ExplicitTop = 155
    ExplicitWidth = 490
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLConta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConta
    Left = 184
    Top = 56
  end
  object IBTRConta: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 56
  end
end
