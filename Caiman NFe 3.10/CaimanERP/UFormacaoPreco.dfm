object FrmFormacaoPreco: TFrmFormacaoPreco
  Left = 386
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Forma'#231#227'o de Pre'#231'o de Venda'
  ClientHeight = 489
  ClientWidth = 711
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 711
    Height = 19
    Panels = <
      item
        Text = 'ESC p/sair'
        Width = 100
      end
      item
        Text = '[F4] p/Alterar o Cr'#233'dito de ICMS'
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 41
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object EdtCodProd: TEdit
      Left = 8
      Top = 10
      Width = 57
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 0
    end
    object EdtNomeProd: TEdit
      Left = 72
      Top = 10
      Width = 633
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 711
    Height = 72
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 130
      Height = 13
      Caption = 'Pre'#231'o de Venda >>>>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 133
      Height = 13
      Caption = 'Pre'#231'o Promo'#231#227'o >>>>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 296
      Top = 32
      Width = 97
      Height = 13
      Caption = 'Grupo ICMS >>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 296
      Top = 16
      Width = 124
      Height = 13
      Caption = 'Margem de Lucro >>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LGrupoICMS: TLabel
      Left = 395
      Top = 32
      Width = 150
      Height = 13
      AutoSize = False
      Caption = 'LGrupoICMS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LMargem: TLabel
      Left = 411
      Top = 16
      Width = 62
      Height = 13
      AutoSize = False
      Caption = 'LMargem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 48
      Width = 129
      Height = 13
      Caption = 'Pre'#231'o Programado >>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LIsentoPisCofins: TLabel
      Left = 395
      Top = 48
      Width = 105
      Height = 13
      AutoSize = False
      Caption = 'LIsentoPisCofins'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 296
      Top = 48
      Width = 93
      Height = 13
      Caption = 'PIS/COFINS >>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EdtAuxPrecoVenda: TCurrencyEdit
      Left = 135
      Top = 16
      Width = 82
      Height = 18
      Margins.Top = 0
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      CheckOnExit = True
      Color = 16710131
      DisplayFormat = 'R$ ,#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtAuxPromocao: TCurrencyEdit
      Left = 135
      Top = 32
      Width = 82
      Height = 18
      Margins.Top = 0
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      CheckOnExit = True
      Color = 16710131
      DisplayFormat = 'R$ ,#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtAuxProgramado: TCurrencyEdit
      Left = 135
      Top = 48
      Width = 82
      Height = 18
      Margins.Top = 0
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      CheckOnExit = True
      Color = 16710131
      DisplayFormat = 'R$ ,#0.00'
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 711
    Height = 55
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label5: TLabel
      Left = 16
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Custo (R$)'
    end
    object Label6: TLabel
      Left = 103
      Top = 8
      Width = 56
      Height = 13
      Caption = 'M.Lucro(%)'
    end
    object Label7: TLabel
      Left = 175
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Sugest'#227'o'
    end
    object Label8: TLabel
      Left = 246
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Pr.Venda'
    end
    object Label10: TLabel
      Left = 478
      Top = 8
      Width = 56
      Height = 13
      Caption = 'OFF Venda'
    end
    object Label27: TLabel
      Left = 318
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Promo'#231#227'o'
    end
    object Label29: TLabel
      Left = 390
      Top = 8
      Width = 38
      Height = 13
      Caption = 'A Prazo'
    end
    object Label31: TLabel
      Left = 550
      Top = 8
      Width = 61
      Height = 13
      Caption = 'OFF a Prazo'
    end
    object EdtCusto: TCurrencyEdit
      Left = 16
      Top = 24
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DecimalPlaces = 4
      DisplayFormat = ',#0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtMargemLucro: TCurrencyEdit
      Left = 103
      Top = 24
      Width = 66
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
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
      OnExit = EdtMargemLucroExit
    end
    object EdtSugestao: TCurrencyEdit
      Left = 175
      Top = 24
      Width = 66
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
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
    object EdtPrecoVenda: TCurrencyEdit
      Left = 246
      Top = 24
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtPrecoOFF: TCurrencyEdit
      Left = 478
      Top = 24
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 6
      ZeroEmpty = False
    end
    object EdtPromocao: TCurrencyEdit
      Left = 318
      Top = 24
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 4
      ZeroEmpty = False
    end
    object EdtPrazo: TCurrencyEdit
      Left = 390
      Top = 24
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 5
      ZeroEmpty = False
    end
    object EdtPrazoOFF: TCurrencyEdit
      Left = 550
      Top = 24
      Width = 67
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 7
      ZeroEmpty = False
    end
    object BtnGrava: TButton
      Left = 627
      Top = 19
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 8
      OnClick = BtnGravaClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 168
    Width = 711
    Height = 302
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 4
    object Label30: TLabel
      Left = 2
      Top = 2
      Width = 707
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Impostos Federais e Estaduais'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 155
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 96
      Width = 169
      Height = 201
      Caption = 'Cr'#233'ditos'
      TabOrder = 0
      object Label11: TLabel
        Left = 8
        Top = 28
        Width = 29
        Height = 13
        Caption = 'ICMS:'
      end
      object Label12: TLabel
        Left = 8
        Top = 60
        Width = 18
        Height = 13
        Caption = 'PIS:'
      end
      object Label13: TLabel
        Left = 8
        Top = 92
        Width = 42
        Height = 13
        Caption = 'COFINS:'
      end
      object EdtCredICMS: TCurrencyEdit
        Left = 56
        Top = 24
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtCredPis: TCurrencyEdit
        Left = 56
        Top = 56
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtCredCofins: TCurrencyEdit
        Left = 56
        Top = 88
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        ZeroEmpty = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 200
      Top = 96
      Width = 169
      Height = 201
      Caption = 'D'#233'bitos'
      TabOrder = 1
      object Label14: TLabel
        Left = 8
        Top = 28
        Width = 29
        Height = 13
        Caption = 'ICMS:'
      end
      object Label15: TLabel
        Left = 8
        Top = 60
        Width = 18
        Height = 13
        Caption = 'PIS:'
      end
      object Label16: TLabel
        Left = 8
        Top = 92
        Width = 42
        Height = 13
        Caption = 'COFINS:'
      end
      object EdtDebICMS: TCurrencyEdit
        Left = 56
        Top = 24
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtDebPis: TCurrencyEdit
        Left = 56
        Top = 56
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtDebCofins: TCurrencyEdit
        Left = 56
        Top = 88
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        ZeroEmpty = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 471
      Top = 24
      Width = 217
      Height = 273
      Caption = 'Resultado'
      TabOrder = 2
      object Label17: TLabel
        Left = 8
        Top = 28
        Width = 95
        Height = 13
        Caption = 'Receita L'#237'quida (+)'
      end
      object Label18: TLabel
        Left = 8
        Top = 52
        Width = 85
        Height = 13
        Caption = 'Custo L'#237'quido (-)'
      end
      object Label19: TLabel
        Left = 8
        Top = 84
        Width = 60
        Height = 13
        Caption = 'Lucro Bruto'
      end
      object Label20: TLabel
        Left = 8
        Top = 108
        Width = 110
        Height = 13
        Caption = 'Desp.Operacionais (-)'
      end
      object Label21: TLabel
        Left = 8
        Top = 140
        Width = 110
        Height = 13
        Caption = 'Lucro Antes Previs'#245'es'
      end
      object Label22: TLabel
        Left = 8
        Top = 164
        Width = 85
        Height = 13
        Caption = 'Contrib.Social (-)'
      end
      object Label23: TLabel
        Left = 8
        Top = 188
        Width = 107
        Height = 13
        Caption = 'Imposto de Renda (-)'
      end
      object Label24: TLabel
        Left = 8
        Top = 220
        Width = 99
        Height = 13
        Caption = 'LUCRO L'#205'QUIDO R$'
      end
      object Label26: TLabel
        Left = 8
        Top = 244
        Width = 98
        Height = 13
        Caption = 'LUCRO LIQUIDO(%)'
      end
      object EdtReceitaLiq: TCurrencyEdit
        Left = 120
        Top = 24
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtCustoLiq: TCurrencyEdit
        Left = 120
        Top = 48
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtLucroBruto: TCurrencyEdit
        Left = 120
        Top = 80
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        ZeroEmpty = False
      end
      object EdtDespOper: TCurrencyEdit
        Left = 120
        Top = 104
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        ZeroEmpty = False
      end
      object EdtLucroAntes: TCurrencyEdit
        Left = 120
        Top = 136
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        ZeroEmpty = False
      end
      object EdtCSLL: TCurrencyEdit
        Left = 120
        Top = 160
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        ZeroEmpty = False
      end
      object EdtIR: TCurrencyEdit
        Left = 120
        Top = 184
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        ZeroEmpty = False
      end
      object EdtLucroLiq: TCurrencyEdit
        Left = 120
        Top = 216
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        ZeroEmpty = False
      end
      object EdtPercLucroLiq: TCurrencyEdit
        Left = 120
        Top = 240
        Width = 81
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        ZeroEmpty = False
      end
    end
    object RdgPreco: TRadioGroup
      Left = 16
      Top = 24
      Width = 353
      Height = 65
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sugest'#227'o'
        'Pr.Venda'
        'Promo'#231#227'o'
        'A Prazo'
        'Pre'#231'o OFF'
        'Prazo OFF')
      TabOrder = 3
      OnClick = RdgPrecoClick
    end
    object PanelCreditoICMS: TPanel
      Left = 16
      Top = 200
      Width = 305
      Height = 97
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16575452
      TabOrder = 4
      Visible = False
      object Label28: TLabel
        Left = 1
        Top = 1
        Width = 303
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Cr'#233'dito ICMS'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 68
      end
      object EdtValorCredICMS: TCurrencyEdit
        Left = 32
        Top = 32
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 4
        DisplayFormat = ',#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        TabOrder = 0
        ZeroEmpty = False
      end
      object StatusBar2: TStatusBar
        Left = 1
        Top = 77
        Width = 303
        Height = 19
        Color = clWhite
        Panels = <>
        SimplePanel = True
        SimpleText = 'ESC P/CANCELAR'
      end
      object BtnGravar: TButton
        Left = 168
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Gra&var'
        TabOrder = 2
        OnClick = BtnGravarClick
      end
    end
  end
end
