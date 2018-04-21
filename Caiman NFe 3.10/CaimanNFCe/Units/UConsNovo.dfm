object FrmConsNovo: TFrmConsNovo
  Left = 361
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 471
  ClientWidth = 451
  Color = clBtnFace
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
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object LTipo: TLabel
      Left = 8
      Top = 8
      Width = 27
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
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 451
    Height = 331
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 447
      Height = 287
      Align = alTop
      Color = clSilver
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyDown = DBGridKeyDown
    end
    object BtnLocalizar: TBitBtn
      Left = 124
      Top = 296
      Width = 75
      Height = 25
      Caption = '&Localizar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 252
      Top = 296
      Width = 75
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 452
    Width = 451
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 447
      Height = 13
      Align = alTop
      Caption = 'Consultar Por'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 77
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 15
      Width = 447
      Height = 48
      Align = alClient
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 433
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'Palavra Chave'
          'Nome'
          'C'#243'digo')
      end
    end
  end
end
