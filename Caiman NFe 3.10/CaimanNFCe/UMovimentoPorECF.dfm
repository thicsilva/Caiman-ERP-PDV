object FrmMovimentoPorECF: TFrmMovimentoPorECF
  Left = 424
  Top = 284
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimento por ECF'
  ClientHeight = 163
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
    Top = 144
    Width = 376
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 144
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 1
    object BtnOK: TButton
      Left = 116
      Top = 113
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 210
      Top = 113
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 372
      Height = 55
      Align = alTop
      Caption = 'Per'#237'odo'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object Label1: TLabel
        Left = 182
        Top = 29
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataFin: TDateTimePicker
        Left = 217
        Top = 24
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 0
      end
      object EdtDataIni: TDateTimePicker
        Left = 57
        Top = 24
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 57
      Width = 372
      Height = 48
      Align = alTop
      Caption = 'ECF'
      TabOrder = 3
      object ComboECF: TComboBox
        Left = 8
        Top = 16
        Width = 361
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
    end
  end
end
