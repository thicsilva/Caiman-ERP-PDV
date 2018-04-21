object FrmConsNovo: TFrmConsNovo
  Left = 361
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 471
  ClientWidth = 451
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 451
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object LTipo: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'LTipo'
    end
    object EdtCons: TEdit
      Left = 8
      Top = 24
      Width = 337
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      TabOrder = 0
    end
    object BtnOK: TBitBtn
      Left = 365
      Top = 21
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 451
    Height = 330
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 451
      Height = 287
      Align = alTop
      Color = clWhite
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnColumnMoved = DBGridColumnMoved
      OnKeyDown = DBGridKeyDown
    end
    object BtnLocalizar: TBitBtn
      Left = 124
      Top = 296
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 252
      Top = 296
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 451
      Height = 13
      Align = alTop
      Caption = 'Consultar Por'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 71
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 13
      Width = 451
      Height = 52
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 9
        Top = 14
        Width = 433
        Height = 21
        Style = csDropDownList
        Color = clWhite
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'Palavra Chave'
          'Nome'
          'C'#243'digo')
      end
    end
  end
  object StatusBar1: TdxStatusBar
    Left = 0
    Top = 451
    Width = 451
    Height = 20
    Panels = <>
    PaintStyle = stpsUseLookAndFeel
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Metropolis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
end
