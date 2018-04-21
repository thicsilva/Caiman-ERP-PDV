inherited FrmCadMotivo: TFrmCadMotivo
  Left = 352
  Top = 279
  Caption = 'Cadastro de Motivo de Acerto de Estoque'
  ClientHeight = 215
  ClientWidth = 435
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 435
    Height = 138
    ExplicitWidth = 435
    ExplicitHeight = 138
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
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 72
      Height = 13
      Caption = 'Entrada/Sa'#237'da'
    end
    object cod_mot: TEdit
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
      Width = 417
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
    object ComboMotivo: TComboBox
      Left = 8
      Top = 104
      Width = 97
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'ENTRADA'
        'SA'#205'DA')
    end
  end
  inherited Panel2: TPanel
    Width = 435
    ExplicitWidth = 435
    inherited ToolBar1: TToolBar
      Width = 435
      ExplicitWidth = 435
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 195
    Width = 435
    ExplicitTop = 195
    ExplicitWidth = 435
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLMot: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMot
    Left = 216
    Top = 48
  end
  object IBTRMot: TFDTransaction
    Connection = DM.IBDatabase
    Left = 312
    Top = 56
  end
end
