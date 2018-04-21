object FrmSenhaLiberaVenda: TFrmSenhaLiberaVenda
  Left = 649
  Top = 372
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Senha para Liberar Venda'
  ClientHeight = 97
  ClientWidth = 298
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
    Width = 298
    Height = 78
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 74
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object EdtSenha: TEdit
      Left = 76
      Top = 31
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
    Top = 78
    Width = 298
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Panels = <>
    SimplePanel = True
    SimpleText = '[ALT + M] Menu Fiscal'
    UseSystemFont = False
  end
  object QSenha: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRSenha
    SQL.Strings = (
      'SELECT SENHA_EXCLUIR_VENDA'
      'FROM PARAMETROS'
      'WHERE COD_EMP = :CODEMP')
    Left = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end>
  end
  object IBTRSenha: TFDTransaction
    Connection = DM.IBDatabase
    Left = 56
    Top = 40
  end
end
