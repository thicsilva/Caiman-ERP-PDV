inherited FrmCadTipoDoc: TFrmCadTipoDoc
  Left = 722
  Top = 369
  Caption = 'Cadastro de Tipo de Documento'
  ClientHeight = 174
  ClientWidth = 380
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 386
  ExplicitHeight = 203
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 380
    Height = 97
    ExplicitWidth = 380
    ExplicitHeight = 97
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
    object cod_doc: TEdit
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
    Width = 380
    ExplicitWidth = 380
    inherited ToolBar1: TToolBar
      Width = 380
      ExplicitWidth = 380
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 154
    Width = 380
    ExplicitTop = 154
    ExplicitWidth = 380
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLDoc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRDoc
    Left = 208
    Top = 56
  end
  object IBTRDoc: TFDTransaction
    Connection = DM.IBDatabase
    Left = 280
    Top = 56
  end
end
