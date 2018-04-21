object FrmCancelaCupomFiscal: TFrmCancelaCupomFiscal
  Left = 372
  Top = 314
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Cupom Fiscal'
  ClientHeight = 114
  ClientWidth = 380
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
    Top = 95
    Width = 380
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Sair'
        Width = 70
      end
      item
        Text = 'F10 Menu Fiscal'
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 95
    Align = alClient
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 23
      Height = 13
      Caption = 'COO'
    end
    object EdtCOO: TEdit
      Left = 32
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
      OnKeyPress = EdtCOOKeyPress
    end
    object Button1: TButton
      Left = 152
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Confirma'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 264
      Top = 32
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
