inherited FrmCadMarcas: TFrmCadMarcas
  Left = 327
  Top = 344
  Caption = 'Cadastro de Marcas'
  ClientHeight = 173
  ClientWidth = 383
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 389
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 383
    Height = 96
    ExplicitWidth = 383
    ExplicitHeight = 96
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
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 383
    ExplicitWidth = 383
    inherited ToolBar1: TToolBar
      Width = 383
      ExplicitWidth = 383
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 153
    Width = 383
    ExplicitTop = 153
    ExplicitWidth = 383
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLMarca: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMarca
    Left = 136
    Top = 40
  end
  object IBTRMarca: TFDTransaction
    Connection = DM.IBDatabase
    Left = 224
    Top = 40
  end
end
