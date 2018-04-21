object frmDeletaOS: TfrmDeletaOS
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Senha de exclus'#227'o'
  ClientHeight = 112
  ClientWidth = 302
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 112
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 101
      Height = 13
      Caption = 'Senha de exclus'#227'o :'
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 300
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Excluir OS'
      Color = 8404992
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object senha: TEdit
      Left = 127
      Top = 37
      Width = 154
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'senha'
    end
    object Button1: TButton
      Left = 125
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Default = True
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 206
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
end
