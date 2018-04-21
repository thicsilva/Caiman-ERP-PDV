inherited FrmCadSetor: TFrmCadSetor
  Left = 419
  Top = 321
  Caption = 'Cadastro de Setor de Balan'#231'a'
  ClientHeight = 176
  ClientWidth = 402
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 408
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 402
  end
  inherited Panel1: TPanel
    Width = 402
    Height = 95
    ExplicitWidth = 402
    ExplicitHeight = 99
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
    object cod_set: TEdit
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
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 402
    ExplicitWidth = 402
    inherited ToolBar1: TToolBar
      Width = 402
      ExplicitWidth = 402
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 156
    Width = 402
    ExplicitTop = 156
    ExplicitWidth = 402
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLSetor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRSetor
    Left = 144
    Top = 48
  end
  object IBTRSetor: TFDTransaction
    Connection = DM.IBDatabase
    Left = 232
    Top = 48
  end
end
