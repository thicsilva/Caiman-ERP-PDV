inherited FrmCadModelo: TFrmCadModelo
  Caption = 'Cadastro de Modelo'
  ClientHeight = 175
  ClientWidth = 398
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 404
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 398
    Height = 98
    ExplicitWidth = 398
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
      Width = 377
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 398
    ExplicitWidth = 398
    inherited ToolBar1: TToolBar
      Width = 398
      ExplicitWidth = 398
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
    Width = 398
    ExplicitTop = 155
    ExplicitWidth = 398
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLModelo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRModelo
    Left = 136
    Top = 48
  end
  object IBTRModelo: TFDTransaction
    Connection = DM.IBDatabase
    Left = 224
    Top = 48
  end
end
