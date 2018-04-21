inherited FrmCadClassifCliente: TFrmCadClassifCliente
  Caption = 'Cadastro de Classifica'#231#227'o de Cliente'
  ClientHeight = 173
  ClientWidth = 419
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 425
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 419
    ExplicitWidth = 419
  end
  inherited Panel1: TPanel
    Width = 419
    Height = 92
    ExplicitWidth = 419
    ExplicitHeight = 92
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
    object cod_cla: TEdit
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
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 30
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 419
    ExplicitWidth = 419
    inherited ToolBar1: TToolBar
      Width = 419
      Height = 112
      ExplicitWidth = 419
      ExplicitHeight = 112
      inherited BtnGravar: TToolButton
        Left = 162
        ExplicitLeft = 162
      end
      inherited BtnCancelar: TToolButton
        Left = 243
        ExplicitLeft = 243
      end
      inherited BtnAlterar: TToolButton
        Left = 81
        Top = 60
        OnClick = BtnAlterarClick
        ExplicitLeft = 81
        ExplicitTop = 60
      end
      inherited BtnExcluir: TToolButton
        Left = 162
        Top = 60
        ExplicitLeft = 162
        ExplicitTop = 60
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
      end
      inherited BtnConsultar: TToolButton
        Left = 81
        OnClick = BtnConsultarClick
        ExplicitLeft = 81
      end
      inherited BtnSair: TToolButton
        Left = 0
        Top = 60
        ExplicitLeft = 0
        ExplicitTop = 60
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 153
    Width = 419
    ExplicitTop = 153
    ExplicitWidth = 419
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCla: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCla
    Left = 152
    Top = 48
  end
  object IBTRCla: TFDTransaction
    Connection = DM.IBDatabase
    Left = 232
    Top = 48
  end
end
