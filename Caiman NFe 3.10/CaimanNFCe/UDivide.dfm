object frmDivide: TfrmDivide
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Divide Pagamentos'
  ClientHeight = 194
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabelFX1: TsLabelFX
    Left = 8
    Top = 8
    Width = 185
    Height = 31
    Caption = 'N'#250'mero de Pessoas :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object sLabelFX2: TsLabelFX
    Left = 8
    Top = 45
    Width = 157
    Height = 31
    Caption = 'Total Por Pessoa :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object Label1: TLabel
    Left = 305
    Top = 16
    Width = 26
    Height = 13
    Caption = '[ F3 ]'
  end
  object sLabelFX3: TsLabelFX
    Left = 8
    Top = 141
    Width = 141
    Height = 31
    Caption = 'Valor recebido :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object Label2: TLabel
    Left = 194
    Top = 117
    Width = 51
    Height = 18
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumPessoas: TCurrencyEdit
    Left = 194
    Top = 8
    Width = 105
    Height = 31
    Margins.Left = 6
    Margins.Top = 1
    DisplayFormat = '0;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtNumPessoasKeyPress
  end
  object edtTotal: TCurrencyEdit
    Left = 194
    Top = 43
    Width = 240
    Height = 37
    Margins.Left = 1
    Margins.Top = 1
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtRecebido: TCurrencyEdit
    Left = 194
    Top = 139
    Width = 240
    Height = 37
    Margins.Left = 1
    Margins.Top = 1
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnKeyPress = edtRecebidoKeyPress
  end
end
