object FrmAlterarSenha: TFrmAlterarSenha
  Left = 436
  Top = 312
  Caption = 'Alterar Senha'
  ClientHeight = 220
  ClientWidth = 352
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 220
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Senha Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 120
      Top = 104
      Width = 63
      Height = 13
      Caption = 'Nova Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 120
      Top = 144
      Width = 103
      Height = 13
      Caption = 'Repetir Nova Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 8
      Top = 16
      Width = 100
      Height = 100
      AutoSize = True
      Center = True
    end
    object EdtUsuario: TEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      TabOrder = 0
    end
    object EdtSenhaAtual: TEdit
      Left = 120
      Top = 64
      Width = 121
      Height = 21
      Color = clSilver
      PasswordChar = '*'
      TabOrder = 1
    end
    object EdtNovaSenha: TEdit
      Left = 120
      Top = 120
      Width = 121
      Height = 21
      Color = clSilver
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 2
    end
    object EdtNovaSenha1: TEdit
      Left = 120
      Top = 160
      Width = 121
      Height = 21
      Color = clSilver
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 3
    end
    object BtnOK: TButton
      Left = 248
      Top = 22
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOKClick
    end
    object BtnCancelar: TButton
      Left = 248
      Top = 62
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 5
      OnClick = BtnCancelarClick
    end
  end
end
