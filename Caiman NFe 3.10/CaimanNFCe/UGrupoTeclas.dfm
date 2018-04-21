object frmGrupoTeclas: TfrmGrupoTeclas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Grupo'
  ClientHeight = 296
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 8
    Top = 253
    Width = 41
    Height = 18
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object P0: TCurvyPanel
    Left = 8
    Top = 8
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '0 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C0: TCheckBox
      Left = 40
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E0: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q0: TCurrencyEdit
      Left = 305
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P1: TCurvyPanel
    Left = 8
    Top = 55
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '1 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C1: TCheckBox
      Left = 40
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E1: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q1: TCurrencyEdit
      Left = 305
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P2: TCurvyPanel
    Left = 8
    Top = 102
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '2 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C2: TCheckBox
      Left = 40
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E2: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q2: TCurrencyEdit
      Left = 305
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P3: TCurvyPanel
    Left = 8
    Top = 149
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '3 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C3: TCheckBox
      Left = 40
      Top = 12
      Width = 261
      Height = 17
      Caption = 'C3'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E3: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q3: TCurrencyEdit
      Left = 305
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P4: TCurvyPanel
    Left = 8
    Top = 196
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '4 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C4: TCheckBox
      Left = 40
      Top = 13
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E4: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q4: TCurrencyEdit
      Left = 304
      Top = 13
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P5: TCurvyPanel
    Left = 383
    Top = 8
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 5
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '5 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C5: TCheckBox
      Left = 41
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E5: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q5: TCurrencyEdit
      Left = 306
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P6: TCurvyPanel
    Left = 383
    Top = 55
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 6
    object Label7: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '6 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C6: TCheckBox
      Left = 41
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E6: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q6: TCurrencyEdit
      Left = 306
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P7: TCurvyPanel
    Left = 383
    Top = 102
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 7
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '7 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C7: TCheckBox
      Left = 41
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E7: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q7: TCurrencyEdit
      Left = 306
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P8: TCurvyPanel
    Left = 383
    Top = 149
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 8
    object Label9: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '8 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C8: TCheckBox
      Left = 41
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E8: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q8: TCurrencyEdit
      Left = 306
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object P9: TCurvyPanel
    Left = 383
    Top = 196
    Width = 369
    Height = 41
    Color = clBtnFace
    TabOrder = 9
    object Label10: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 23
      Caption = '9 -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object C9: TCheckBox
      Left = 41
      Top = 12
      Width = 261
      Height = 17
      Caption = 'COCA COLA DOCE'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = C0Click
    end
    object E9: TEdit
      Left = 48
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'E0'
      Visible = False
    end
    object Q9: TCurrencyEdit
      Left = 306
      Top = 10
      Width = 54
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      DecimalPlaces = 3
      DisplayFormat = ' ,0.000;- ,0.000'
      Enabled = False
      TabOrder = 2
      OnKeyPress = Q0KeyPress
    end
  end
  object QConsulta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRTeclas
    Left = 168
    Top = 152
  end
  object TRTeclas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 104
    Top = 144
  end
end
