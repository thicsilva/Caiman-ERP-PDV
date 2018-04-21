object FrmLMF: TFrmLMF
  Left = 406
  Top = 306
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 186
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 167
    Width = 376
    Height = 19
    Panels = <
      item
        Text = 'ESC p/sair'
        Width = 70
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object RdgPeriodo: TRadioButton
      Left = 40
      Top = 16
      Width = 113
      Height = 17
      Caption = '&Per'#237'odo de data'
      TabOrder = 0
      OnClick = RdgPeriodoClick
    end
    object RdgCRZ: TRadioButton
      Left = 208
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Intervalo CR&Z'
      TabOrder = 1
      OnClick = RdgCRZClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 376
    Height = 126
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object LabelTitulo: TLabel
      Left = 2
      Top = 2
      Width = 372
      Height = 13
      Align = alTop
      Alignment = taCenter
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 5
    end
    object GBData: TGroupBox
      Left = 2
      Top = 15
      Width = 372
      Height = 74
      TabOrder = 0
      object Label1: TLabel
        Left = 184
        Top = 32
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 46
        Top = 24
        Width = 113
        Height = 24
        Date = 40030.635904039400000000
        Time = 40030.635904039400000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 214
        Top = 24
        Width = 113
        Height = 24
        Date = 40030.635904039400000000
        Time = 40030.635904039400000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GBCRZ: TGroupBox
      Left = 2
      Top = 15
      Width = 372
      Height = 74
      TabOrder = 1
      object Label2: TLabel
        Left = 89
        Top = 16
        Width = 52
        Height = 13
        Caption = 'CRZ Inicial'
      end
      object Label3: TLabel
        Left = 209
        Top = 16
        Width = 47
        Height = 13
        Caption = 'CRZ Final'
      end
      object EdtCRZInicial: TEdit
        Left = 89
        Top = 32
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        OnEnter = EdtCRZInicialEnter
        OnKeyPress = EdtCRZInicialKeyPress
      end
      object EdtCRZFinal: TEdit
        Left = 209
        Top = 32
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        OnEnter = EdtCRZFinalEnter
        OnKeyPress = EdtCRZInicialKeyPress
      end
    end
    object BtnImprimir: TButton
      Left = 58
      Top = 95
      Width = 106
      OnClick = BtnImprimirClick
      Caption = '&Impress'#227'o no ECF'
      TabOrder = 2
    end
    object BtnGravarEspelho: TButton
      Left = 208
      Top = 95
      Width = 106
      OnClick = BtnGravarEspelhoClick
      Caption = 'Gravar &Arquivo'
      TabOrder = 3
    end
  end
end
