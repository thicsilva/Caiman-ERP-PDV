object frmNotaFiscalComcomitante: TfrmNotaFiscalComcomitante
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Notas Fiscal Manual'
  ClientHeight = 92
  ClientWidth = 185
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
    Width = 135
    Height = 13
    Caption = 'Informe o N'#250'mero da Nota :'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 54
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 89
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object edtNumNota: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtNumNota'
    OnKeyPress = edtNumNotaKeyPress
  end
end
