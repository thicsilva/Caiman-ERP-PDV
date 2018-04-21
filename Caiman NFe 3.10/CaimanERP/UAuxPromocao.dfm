object FrmAuxPromocao: TFrmAuxPromocao
  Left = 598
  Top = 384
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Promo'#231#227'o'
  ClientHeight = 159
  ClientWidth = 338
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 140
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnOK: TBitBtn
      Left = 83
      Top = 110
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 179
      Top = 110
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
      TabStop = False
      OnClick = BtnCancelarClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 334
      Height = 103
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Inicio'
      end
      object Label6: TLabel
        Left = 96
        Top = 48
        Width = 40
        Height = 13
        Caption = 'T'#233'rmino'
      end
      object Label7: TLabel
        Left = 184
        Top = 48
        Width = 77
        Height = 13
        Caption = 'Pr.Promocional'
      end
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 22
        Height = 13
        Caption = 'Tipo'
      end
      object Label1: TLabel
        Left = 272
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Empresa'
      end
      object EdtTermino: TMaskEdit
        Left = 96
        Top = 64
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object EdtInicio: TMaskEdit
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object EdtPromocao: TCurrencyEdit
        Left = 184
        Top = 64
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 3
        ZeroEmpty = False
      end
      object ComboTipo: TComboBox
        Left = 8
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'PANFLETO'
          'DA CASA'
          'VENCIMENTO')
      end
      object EdtEmp: TEdit
        Left = 272
        Top = 64
        Width = 49
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 4
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 140
    Width = 338
    Height = 19
    Panels = <>
  end
  object IBSQLAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_PROMOCAO(:CODPRO, :INICIO, :TERMINO, :PROMOCAO, :' +
        'CODEMP, :TIPO)')
    Left = 280
    Top = 104
  end
end
