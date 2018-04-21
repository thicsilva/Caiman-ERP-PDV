object FrmSobre: TFrmSobre
  Left = 464
  Top = 277
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Sig Light - Gest'#227'o empresarial'
  ClientHeight = 451
  ClientWidth = 427
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 451
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label5: TLabel
      Left = 152
      Top = 120
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object RzPanel1: TRzPanel
      Left = 8
      Top = 7
      Width = 409
      Height = 281
      BorderOuter = fsFlat
      BorderColor = clActiveCaption
      BorderWidth = 2
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 8
        Height = 34
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LSistema: TLabel
        Left = 32
        Top = 134
        Width = 116
        Height = 13
        Caption = 'Vers'#227'o do sistema 7.10'
      end
      object Label3: TLabel
        Left = 32
        Top = 73
        Width = 203
        Height = 13
        Caption = 'NFe 2.0 - PDV - PAF 1.10 - Sintegra - ECF'
      end
      object Label4: TLabel
        Left = 32
        Top = 92
        Width = 180
        Height = 13
        Caption = 'TEF( Discado e Dedicado ) - Boletos'
      end
      object Label7: TLabel
        Left = 391
        Top = 239
        Width = 3
        Height = 13
        Alignment = taRightJustify
      end
      object Lbanco: TLabel
        Left = 32
        Top = 151
        Width = 131
        Height = 13
        Caption = 'Vers'#227'o da base de dados '
      end
      object Image1: TImage
        Left = 250
        Top = 96
        Width = 127
        Height = 137
        Hint = 'Kadoshi System'
        Center = True
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object Label2: TLabel
        Left = 8
        Top = 37
        Width = 3
        Height = 13
      end
    end
  end
end
