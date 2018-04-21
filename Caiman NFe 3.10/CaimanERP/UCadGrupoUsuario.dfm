inherited FrmCadGrupoUsuario: TFrmCadGrupoUsuario
  Left = 425
  Caption = 'Cadastro de Grupo de Usu'#225'rio'
  ClientHeight = 188
  ClientWidth = 410
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 416
  ExplicitHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 410
    Height = 111
    ExplicitWidth = 410
    ExplicitHeight = 111
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
    object cod_grupo: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
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
    object CheckGrupo: TCheckBox
      Left = 8
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Super Grupo'
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Width = 410
    ExplicitWidth = 410
    inherited ToolBar1: TToolBar
      Width = 410
      ExplicitWidth = 410
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 168
    Width = 410
    ExplicitTop = 168
    ExplicitWidth = 410
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLGRU: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGRU
    Left = 216
    Top = 56
  end
  object IBTRGRU: TFDTransaction
    Connection = DM.IBDatabase
    Left = 296
    Top = 48
  end
end
