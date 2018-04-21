inherited FrmCadCarta: TFrmCadCarta
  Left = 312
  Top = 177
  Caption = 'Cadastro de Cartas'
  ClientHeight = 421
  ClientWidth = 606
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 612
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 606
    Height = 344
    ExplicitWidth = 606
    ExplicitHeight = 344
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
    object cod_carta: TEdit
      Left = 8
      Top = 24
      Width = 81
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
      Width = 592
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 93
      Width = 606
      Height = 251
      Align = alBottom
      Caption = 'Conte'#250'do da Carta'
      TabOrder = 2
      object Editor: TRichEdit
        Left = 8
        Top = 16
        Width = 585
        Height = 225
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Zoom = 100
        OnEnter = EditorEnter
        OnExit = EditorExit
      end
    end
  end
  inherited Panel2: TPanel
    Width = 606
    ExplicitWidth = 606
    inherited ToolBar1: TToolBar
      Width = 606
      ExplicitWidth = 606
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 401
    Width = 606
    ExplicitTop = 401
    ExplicitWidth = 606
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCarta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCarta
    Left = 184
    Top = 56
  end
  object IBTRCarta: TFDTransaction
    Connection = DM.IBDatabase
    Left = 272
    Top = 56
  end
end
