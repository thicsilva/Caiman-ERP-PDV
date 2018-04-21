object frmQuantidadePreco: TfrmQuantidadePreco
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar Valores'
  ClientHeight = 132
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlQuantidade: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 498
    object Label1: TLabel
      Left = 12
      Top = 9
      Width = 105
      Height = 19
      Caption = 'Quantidade :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtQuant: TCurrencyEdit
      Left = 147
      Top = 5
      Width = 216
      Height = 30
      Margins.Left = 7
      Margins.Top = 1
      CheckOnExit = True
      Color = clWhite
      DecimalPlaces = 3
      DisplayFormat = ',#0.000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
  end
  object pnlValor: TPanel
    Left = 0
    Top = 41
    Width = 372
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 498
    object Label2: TLabel
      Left = 12
      Top = 8
      Width = 125
      Height = 19
      Caption = 'Valor Unit'#225'rio :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtValorUnitario: TCurrencyEdit
      Left = 147
      Top = 4
      Width = 216
      Height = 30
      Margins.Left = 7
      Margins.Top = 1
      CheckOnExit = True
      Color = clWhite
      DisplayFormat = ',#0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 372
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 105
      Top = 5
      Width = 126
      Height = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 237
      Top = 5
      Width = 126
      Height = 40
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
