object frmConfereCaixa: TfrmConfereCaixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confere Caixa'
  ClientHeight = 322
  ClientWidth = 640
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
  object sLabelFX1: TsLabelFX
    Left = 8
    Top = 8
    Width = 112
    Height = 31
    Caption = 'Acrescenta :'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object tvConfere: TVirtualStringTree
    Left = 0
    Top = 48
    Width = 640
    Height = 232
    Align = alBottom
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -19
    Header.Font.Name = 'Segoe UI'
    Header.Font.Style = [fsBold]
    Header.Height = 25
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    ParentFont = False
    TabOrder = 0
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnGetText = tvConfereGetText
    OnKeyDown = tvConfereKeyDown
    Columns = <
      item
        Position = 0
        Width = 300
        WideText = 'Moeda'
      end
      item
        Alignment = taRightJustify
        Position = 1
        Width = 300
        WideText = 'Valor'
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 640
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 10
      Width = 65
      Height = 29
      Margins.Top = 10
      Align = alLeft
      Caption = 'Caixa :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 23
    end
    object lblTotCaixa: TLabel
      AlignWithMargins = True
      Left = 81
      Top = 10
      Width = 65
      Height = 29
      Margins.Left = 10
      Margins.Top = 10
      Align = alLeft
      Caption = 'Caixa :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 23
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 486
      Top = 10
      Width = 66
      Height = 29
      Margins.Top = 10
      Align = alRight
      Caption = 'Soma :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 23
    end
    object lblSOma: TLabel
      AlignWithMargins = True
      Left = 565
      Top = 10
      Width = 65
      Height = 29
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Align = alRight
      Caption = 'Caixa :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 23
    end
  end
  object cbbMoedas: TRzComboBox
    Left = 126
    Top = 8
    Width = 178
    Height = 31
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyDown = cbbMoedasKeyDown
  end
  object edtValor: TCurrencyEdit
    Left = 311
    Top = 8
    Width = 177
    Height = 31
    Margins.Left = 6
    Margins.Top = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyDown = edtValorKeyDown
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = IBTRA
    Left = 296
    Top = 208
  end
  object IBTRA: TFDTransaction
    Connection = DM.IBDatabaseServer
    Left = 72
    Top = 32
  end
end
