inherited FrmCadClassifContasPagar: TFrmCadClassifContasPagar
  Left = 360
  Top = 276
  Caption = 'Cadastro de Classifica'#231#227'o do Contas a Pagar'
  ClientHeight = 172
  ClientWidth = 430
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 436
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 430
    Height = 95
    ExplicitWidth = 430
    ExplicitHeight = 95
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
      Width = 412
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 430
    ExplicitWidth = 430
    inherited ToolBar1: TToolBar
      Width = 430
      ExplicitWidth = 430
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 152
    Width = 430
    ExplicitTop = 152
    ExplicitWidth = 430
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCla: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCla
    Left = 184
    Top = 56
  end
  object IBTRCla: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 56
  end
end
