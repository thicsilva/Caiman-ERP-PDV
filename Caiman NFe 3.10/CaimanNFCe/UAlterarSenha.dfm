object FrmAlterarSenha: TFrmAlterarSenha
  Left = 436
  Top = 312
  Caption = 'Alterar Senha'
  ClientHeight = 221
  ClientWidth = 261
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 261
    Height = 202
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Senha Atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 60
      Height = 13
      Caption = 'Nova Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 144
      Width = 97
      Height = 13
      Caption = 'Repetir Nova Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EdtUsuario: TEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object EdtSenhaAtual: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object EdtNovaSenha: TEdit
      Left = 8
      Top = 120
      Width = 121
      Height = 21
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 2
    end
    object EdtNovaSenha1: TEdit
      Left = 8
      Top = 160
      Width = 121
      Height = 21
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 3
    end
    object BtnOK: TButton
      Left = 168
      Top = 70
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOKClick
    end
    object BtnCancelar: TButton
      Left = 168
      Top = 110
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 5
      OnClick = BtnCancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 202
    Width = 261
    Height = 19
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
  end
end
