inherited FrmCadTipoProduto: TFrmCadTipoProduto
  Left = 366
  Top = 272
  Caption = 'Cadastro de Tipo de Produto'
  ClientHeight = 176
  ClientWidth = 399
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 405
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Top = 115
    Width = 399
  end
  inherited Panel1: TPanel
    Top = 121
    Width = 399
    Height = 35
    ExplicitWidth = 399
    ExplicitHeight = 35
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
      Left = 322
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Cod. EFD'
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
      Width = 308
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 1
    end
    object CheckServico: TCheckBox
      Left = 75
      Top = 26
      Width = 97
      Height = 17
      Caption = 'Servi'#231'o'
      TabOrder = 2
    end
    object edtCodEFD: TEdit
      Left = 322
      Top = 64
      Width = 45
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 3
    end
  end
  inherited Panel2: TPanel
    Width = 399
    Height = 112
    ExplicitWidth = 399
    ExplicitHeight = 112
    inherited ToolBar1: TToolBar
      Width = 399
      Height = 112
      ExplicitWidth = 399
      ExplicitHeight = 112
      inherited BtnConsultar: TToolButton [1]
        Left = 81
        OnClick = BtnConsultarClick
        ExplicitLeft = 81
      end
      inherited BtnGravar: TToolButton [2]
        Left = 162
        ExplicitLeft = 162
      end
      inherited BtnCancelar: TToolButton [3]
        Left = 243
        ExplicitLeft = 243
      end
      inherited ToolButton6: TToolButton [4]
        Left = 0
        Wrap = True
      end
      inherited BtnSair: TToolButton [5]
        Left = 0
        Top = 60
        ExplicitLeft = 0
        ExplicitTop = 60
      end
      inherited BtnAlterar: TToolButton [6]
        Left = 81
        Top = 60
        OnClick = BtnAlterarClick
        ExplicitLeft = 81
        ExplicitTop = 60
      end
      inherited BtnExcluir: TToolButton [7]
        Left = 162
        Top = 60
        ExplicitLeft = 162
        ExplicitTop = 60
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 156
    Width = 399
    ExplicitTop = 156
    ExplicitWidth = 399
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLTipo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTipo
    Left = 240
    Top = 48
  end
  object IBTRTipo: TFDTransaction
    Connection = DM.IBDatabase
    Left = 304
    Top = 48
  end
end
