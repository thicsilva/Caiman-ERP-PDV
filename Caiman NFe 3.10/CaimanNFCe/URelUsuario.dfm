object frmRelUsuario: TfrmRelUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Completo por Usu'#225'rio'
  ClientHeight = 151
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 57
    Height = 16
    Caption = 'Usu'#225'rio :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbUsuario: TRzComboBox
    Left = 8
    Top = 30
    Width = 409
    Height = 24
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 60
    Width = 305
    Height = 77
    Caption = ' Periodo '
    TabOrder = 1
    object edtTIni: TMaskEdit
      Left = 9
      Top = 44
      Width = 120
      Height = 21
      EditMask = '!99:99:99;1;_'
      MaxLength = 8
      TabOrder = 0
      Text = '  :  :  '
    end
    object edtTFim: TMaskEdit
      Left = 161
      Top = 44
      Width = 120
      Height = 21
      EditMask = '!99:99:99;1;_'
      MaxLength = 8
      TabOrder = 1
      Text = '  :  :  '
    end
  end
  object Button1: TButton
    Left = 319
    Top = 66
    Width = 98
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = Button1Click
  end
  object edtData: TDateEdit
    Left = 16
    Top = 77
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object QConsulta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 280
  end
end
