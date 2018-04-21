object frmCadCartaCorrecao: TfrmCadCartaCorrecao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o Carta de corre'#231#227'o'
  ClientHeight = 224
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Data :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 52
    Height = 13
    Caption = 'Corre'#231#227'o :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Data: TsDateEdit
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    AutoSize = False
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Segoe UI'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
  end
  object Correcao: TMemo
    Left = 8
    Top = 72
    Width = 346
    Height = 113
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 198
    Top = 191
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 279
    Top = 191
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
