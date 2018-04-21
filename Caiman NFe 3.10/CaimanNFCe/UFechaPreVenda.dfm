object FrmFechaPreVenda: TFrmFechaPreVenda
  Left = 452
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Pre_Venda'
  ClientHeight = 301
  ClientWidth = 375
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
    Width = 375
    Height = 241
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label38: TLabel
      Left = 10
      Top = 128
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label1: TLabel
      Left = 10
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object MemoOBS: TMemo
      Left = 10
      Top = 144
      Width = 351
      Height = 81
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      MaxLength = 500
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object EdtSenha: TEdit
      Left = 10
      Top = 104
      Width = 351
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 371
      Height = 71
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Sub Total'
      end
      object Label3: TLabel
        Left = 104
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Desconto (%)'
      end
      object Label4: TLabel
        Left = 184
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Desconto (R$)'
      end
      object Label5: TLabel
        Left = 272
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Total L'#237'quido'
      end
      object EdtSubTotal: TCurrencyEdit
        Left = 9
        Top = 32
        Width = 81
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clInactiveCaptionText
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        ZeroEmpty = False
      end
      object EdtDescPerc: TCurrencyEdit
        Left = 105
        Top = 32
        Width = 72
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        TabOrder = 0
        ZeroEmpty = False
        OnExit = EdtDescPercExit
      end
      object EdtDescValor: TCurrencyEdit
        Left = 185
        Top = 32
        Width = 72
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        TabOrder = 1
        ZeroEmpty = False
        OnExit = EdtDescValorExit
      end
      object EdtTotalLiquido: TCurrencyEdit
        Left = 273
        Top = 32
        Width = 81
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clYellow
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        ZeroEmpty = False
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 241
    Width = 375
    Height = 41
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 83
      Top = 9
      Width = 73
      Height = 25
      Caption = '&OK'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888777777
        777777770000774448877777777777770000772244887777777777770000A222
        22488777777777770000A22222248877777777770000A2222222488777777777
        0000A22222222488777777770000A22222222248877777770000A22248A22224
        887777770000A222488A2222488777770000A2224887A2224488777700007A22
        48877A222488777700007A22477777A222488777000077777777777A22244877
        0000777777777777A222488700007777777777777A2224870000777777777777
        77A224480000777777777777777A224800007777777777777777A24800007777
        7777777777777A270000}
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 203
      Top = 9
      Width = 73
      Height = 25
      Caption = '&Voltar'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888877777
        8877777700007770888777778887777700007911088877910888777700007911
        0088879100888777000079111008891110087777000079911108911111007777
        0000779111101111110777770000777911111111077777770000777991111111
        8777777700007777991111108877777700007777791111108887777700007777
        7911111088877777000077777911111108887777000077779111991100888777
        0000777911108991100888770000777911187799110088870000777111187779
        1110888700007771110777779111087700007779997777777991777700007777
        77777777779977770000}
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 282
    Width = 375
    Height = 19
    Panels = <
      item
        Text = 'ESC p/Voltar'
        Width = 130
      end
      item
        Text = '[F10] Menu Fiscal'
        Width = 50
      end>
  end
end
