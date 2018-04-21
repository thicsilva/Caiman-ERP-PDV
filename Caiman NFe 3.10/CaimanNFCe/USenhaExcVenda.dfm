object FrmSenhaExcVenda: TFrmSenhaExcVenda
  Left = 396
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Senha para Excluir Venda'
  ClientHeight = 95
  ClientWidth = 271
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 271
    Height = 76
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 63
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object EdtSenha: TEdit
      Left = 63
      Top = 34
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = EdtSenhaKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 76
    Width = 271
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair    [ALT + M] Menu Fiscal'
  end
  object QSenha: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SENHA_EXCLUIR_VENDA'
      'FROM PARAMETROS'
      'WHERE COD_EMP = :CODEMP')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
  end
end
