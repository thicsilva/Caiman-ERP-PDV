object frmIMEI: TfrmIMEI
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe o IMEI'
  ClientHeight = 85
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Informe o IMEI :'
  end
  object edtImei: TEdit
    Left = 8
    Top = 27
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtImei'
  end
  object BitBtn1: TBitBtn
    Left = 77
    Top = 54
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 158
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
