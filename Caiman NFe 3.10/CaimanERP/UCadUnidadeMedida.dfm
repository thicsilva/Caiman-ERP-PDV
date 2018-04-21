inherited FrmCadUnidadeMedida: TFrmCadUnidadeMedida
  Caption = 'Cadastro de Unidade de Medida'
  ClientHeight = 179
  ClientWidth = 440
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 446
  ExplicitHeight = 208
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 440
    Height = 102
    ExplicitWidth = 440
    ExplicitHeight = 102
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
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 440
    ExplicitWidth = 440
    inherited ToolBar1: TToolBar
      Width = 440
      ExplicitWidth = 440
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 159
    Width = 440
    ExplicitTop = 159
    ExplicitWidth = 440
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLUM: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRUM
    Left = 184
    Top = 56
  end
  object IBTRUM: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 56
  end
end
