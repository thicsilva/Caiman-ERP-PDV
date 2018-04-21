inherited FrmCadLab: TFrmCadLab
  Caption = 'Cadastro de Fabricante'
  ClientHeight = 271
  ClientWidth = 630
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 636
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 630
  end
  inherited Panel1: TPanel
    Width = 630
    Height = 190
    ExplicitTop = 61
    ExplicitWidth = 386
    ExplicitHeight = 90
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
    object cod_lab: TEdit
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
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 630
    ExplicitWidth = 386
    inherited ToolBar1: TToolBar
      Width = 630
      ExplicitWidth = 386
      ExplicitHeight = 104
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 251
    Width = 630
    ExplicitTop = 151
    ExplicitWidth = 386
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLLab: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLab
    Left = 200
    Top = 48
  end
  object IBTRLab: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 48
  end
end
