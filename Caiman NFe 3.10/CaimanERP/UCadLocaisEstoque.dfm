inherited FrmCadLocaisEstoque: TFrmCadLocaisEstoque
  Left = 423
  Top = 308
  Caption = 'Cadastro de Locais de Estoque'
  ClientHeight = 171
  ClientWidth = 673
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 679
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 673
    Height = 94
    ExplicitWidth = 386
    ExplicitHeight = 94
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
    object codigo: TEdit
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
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 673
    ExplicitWidth = 386
    inherited ToolBar1: TToolBar
      Width = 673
      ExplicitWidth = 386
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 151
    Width = 673
    ExplicitTop = 151
    ExplicitWidth = 386
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLLE: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLE
    Left = 184
    Top = 48
  end
  object IBTRLE: TFDTransaction
    Connection = DM.IBDatabase
    Left = 256
    Top = 48
  end
end
