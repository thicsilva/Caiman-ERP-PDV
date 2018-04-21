object FrmVendasPED: TFrmVendasPED
  Left = 358
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas [PED]'
  ClientHeight = 529
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 752
    Height = 19
    Panels = <
      item
        Text = '[CTRL + P]  Consultar Pre'#231'o'
        Width = 180
      end
      item
        Text = '[F5] Fechar Nota Fiscal'
        Width = 180
      end
      item
        Text = '[F10] Menu Fiscal'
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 33
    Align = alTop
    Color = 16710131
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 750
      Height = 31
      Align = alClient
      ButtonHeight = 31
      ButtonWidth = 43
      Caption = 'ToolBar1'
      Color = clBtnFace
      Images = ImageList
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object BtnGravar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Salvar Registro (F6)'
        Caption = 'BtnGravar'
        ImageIndex = 0
        OnClick = BtnGravarClick
      end
      object BtnAlterar: TToolButton
        Left = 43
        Top = 0
        Hint = 'Alterar Registro (F8)'
        Caption = 'BtnAlterar'
        ImageIndex = 1
      end
      object ToolButton1: TToolButton
        Left = 86
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object BtnFechar: TToolButton
        Left = 94
        Top = 0
        Caption = 'BtnFechar'
        ImageIndex = 3
        OnClick = BtnFecharClick
      end
      object BtnSair: TToolButton
        Left = 137
        Top = 0
        Hint = 'Sair [ESC]'
        Caption = 'BtnSair'
        ImageIndex = 2
        OnClick = BtnSairClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 752
    Height = 477
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 750
      Height = 176
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 98
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label21: TLabel
        Left = 8
        Top = 48
        Width = 54
        Height = 13
        Caption = 'Cod.Cliente'
      end
      object BtnConsCli: TsSpeedButton
        Left = 68
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Consultar Cliente'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
          B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
          EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
          FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
          B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
          FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
          E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
          A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
          FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
          C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
          FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
          A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsCliClick
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 68
        Height = 13
        Caption = 'Cod.Vendedor'
      end
      object BtnConsVend: TsSpeedButton
        Left = 68
        Top = 104
        Width = 23
        Height = 21
        Hint = 'Consultar Vendedor'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
          B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
          EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
          FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
          B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
          FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
          E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
          A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
          FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
          C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
          FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
          A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsVendClick
      end
      object Label4: TLabel
        Left = 98
        Top = 88
        Width = 112
        Height = 13
        Caption = 'Descri'#231#227'o do Vendedor'
      end
      object Label5: TLabel
        Left = 8
        Top = 128
        Width = 77
        Height = 13
        Caption = 'Cod.Tipo Venda'
      end
      object BtnConsTPV: TsSpeedButton
        Left = 68
        Top = 144
        Width = 23
        Height = 21
        Hint = 'Consultar Tipo de Venda'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
          B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
          EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
          FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
          B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
          FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
          E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
          A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
          FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
          C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
          FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
          A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsTPVClick
      end
      object Label6: TLabel
        Left = 98
        Top = 128
        Width = 136
        Height = 13
        Caption = 'Descri'#231#227'o do Tipo de Venda'
      end
      object Label22: TLabel
        Left = 98
        Top = 48
        Width = 98
        Height = 13
        Caption = 'Descri'#231#227'o do Cliente'
      end
      object Label9: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label12: TLabel
        Left = 192
        Top = 8
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label13: TLabel
        Left = 280
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Modelo'
      end
      object Label15: TLabel
        Left = 352
        Top = 8
        Width = 24
        Height = 13
        Caption = 'S'#233'rie'
      end
      object EdtCodcli: TEdit
        Left = 8
        Top = 64
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnEnter = EdtCodcliEnter
        OnExit = EdtCodcliExit
        OnKeyDown = EdtCodcliKeyDown
        OnKeyPress = EdtCodcliKeyPress
      end
      object EdtNomecli: TEdit
        Left = 98
        Top = 64
        Width = 351
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 8
      end
      object EdtCodVend: TEdit
        Left = 8
        Top = 104
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Vendedor'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnEnter = EdtCodVendEnter
        OnExit = EdtCodVendExit
        OnKeyDown = EdtCodVendKeyDown
        OnKeyPress = EdtCodcliKeyPress
      end
      object EdtNomeVend: TEdit
        Left = 98
        Top = 104
        Width = 351
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 9
      end
      object EdtCodTPV: TEdit
        Left = 8
        Top = 144
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Tipo de Venda'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnEnter = EdtCodTPVEnter
        OnExit = EdtCodTPVExit
        OnKeyDown = EdtCodTPVKeyDown
        OnKeyPress = EdtCodcliKeyPress
      end
      object EdtNomeTPV: TEdit
        Left = 98
        Top = 144
        Width = 351
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 10
      end
      object GBTotal: TGroupBox
        Left = 480
        Top = 70
        Width = 193
        Height = 96
        TabOrder = 11
        object Label11: TLabel
          Left = 8
          Top = 14
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Bruto:'
        end
        object Label7: TLabel
          Left = 8
          Top = 38
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Desconto Item:'
        end
        object Label8: TLabel
          Left = 8
          Top = 72
          Width = 81
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total L'#237'quido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 122
          Top = 58
          Width = 65
          Height = 1
        end
        object EdtTotalBruto: TCurrencyEdit
          Left = 88
          Top = 14
          Width = 97
          Height = 18
          Margins.Left = 0
          Margins.Top = 0
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          CheckOnExit = True
          Color = 16710131
          DisplayFormat = ',#0.00'
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
        object EdtTotalDesc: TCurrencyEdit
          Left = 88
          Top = 38
          Width = 97
          Height = 18
          Margins.Left = 0
          Margins.Top = 0
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          CheckOnExit = True
          Color = 16710131
          DisplayFormat = ',#0.00'
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
        object EdtTotalLiq: TCurrencyEdit
          Left = 104
          Top = 72
          Width = 81
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          CheckOnExit = True
          Color = 16710131
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
      end
      object EdtCodigo: TEdit
        Left = 8
        Top = 24
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EdtData: TMaskEdit
        Left = 98
        Top = 24
        Width = 81
        Height = 21
        TabStop = False
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object EdtNumero: TEdit
        Left = 192
        Top = 24
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
      end
      object EdtModelo: TEdit
        Left = 280
        Top = 24
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
      end
      object EdtSerie: TEdit
        Left = 352
        Top = 24
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 177
      Width = 750
      Height = 299
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      ParentBackground = False
      TabOrder = 1
      object Label16: TLabel
        Left = 2
        Top = 2
        Width = 746
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Itens'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 34
      end
      object Label17: TLabel
        Left = 8
        Top = 24
        Width = 47
        Height = 13
        Caption = 'Cod.Prod.'
      end
      object BtnConsPro: TsSpeedButton
        Left = 132
        Top = 40
        Width = 23
        Height = 21
        Hint = 'Consultar Produto'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
          B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
          EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
          FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
          B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
          FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
          E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
          A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
          FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
          C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
          FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
          A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
      end
      object Label18: TLabel
        Left = 162
        Top = 24
        Width = 103
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
      end
      object Label19: TLabel
        Left = 11
        Top = 64
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label20: TLabel
        Left = 86
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Vl.Unit'#225'rio'
      end
      object Label23: TLabel
        Left = 292
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Desc.(R$)'
      end
      object Label24: TLabel
        Left = 360
        Top = 64
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label10: TLabel
        Left = 225
        Top = 64
        Width = 42
        Height = 13
        Caption = 'Desc.(%)'
      end
      object Label14: TLabel
        Left = 158
        Top = 64
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 112
        Width = 746
        Height = 185
        TabStop = False
        Align = alBottom
        DataSource = DSBuscaItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Color = 16776176
            Expanded = False
            FieldName = 'ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'ORD'
            Width = 29
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'COD_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'COD.'
            Width = 54
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'NOME_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'PRODUTO'
            Width = 316
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'QUANT'
            Title.Alignment = taCenter
            Width = 42
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'UND'
            Width = 34
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Width = 58
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'CALC_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'TOTAL'
            Width = 66
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'DESCONTO'
            Title.Alignment = taCenter
            Width = 65
            Visible = True
          end>
      end
      object EdtTotalBR: TCurrencyEdit
        Left = 158
        Top = 80
        Width = 59
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        ZeroEmpty = False
      end
      object EdtDescPerc: TCurrencyEdit
        Left = 225
        Top = 80
        Width = 56
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
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
      object EdtCodPro: TEdit
        Left = 8
        Top = 40
        Width = 121
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
        Alignment = taRightJustify
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodProEnter
        OnExit = EdtCodProExit
        OnKeyDown = EdtCodProKeyDown
        OnKeyPress = EdtCodcliKeyPress
      end
      object EdtNomePro: TEdit
        Left = 162
        Top = 40
        Width = 479
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
      end
      object EdtQuant: TCurrencyEdit
        Left = 11
        Top = 80
        Width = 62
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        DecimalPlaces = 3
        DisplayFormat = ',#0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtValorUnit: TCurrencyEdit
        Left = 86
        Top = 80
        Width = 59
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        DisplayFormat = ',#0.00'
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
      object EdtDescVr: TCurrencyEdit
        Left = 292
        Top = 80
        Width = 61
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
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
      object EdtTotalProd: TCurrencyEdit
        Left = 360
        Top = 80
        Width = 81
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
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
      object BtnGrava: TBitBtn
        Left = 477
        Top = 79
        Width = 76
        Height = 25
        Caption = '&Grava'
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
        TabOrder = 5
        OnClick = BtnGravaClick
      end
      object BtnCancelar: TBitBtn
        Left = 565
        Top = 79
        Width = 76
        Height = 25
        Caption = '&Cancelar'
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
        TabOrder = 6
        OnClick = BtnCancelarClick
      end
      object PanelJuntarPreVenda: TPanel
        Left = 208
        Top = 184
        Width = 281
        Height = 73
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 11
        Visible = False
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Senha'
        end
        object EdtSenhaPreVenda: TEdit
          Left = 16
          Top = 24
          Width = 153
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
        end
        object BtnOK: TButton
          Left = 192
          Top = 20
          Width = 75
          Height = 25
          Caption = 'OK'
          TabOrder = 1
        end
        object StatusBar2: TStatusBar
          Left = 2
          Top = 52
          Width = 277
          Height = 19
          Panels = <>
          SimplePanel = True
          SimpleText = 'ESC p/Cancelar'
        end
      end
    end
  end
  object ImageList: TImageList
    Height = 25
    Width = 25
    Left = 488
    Top = 64
    Bitmap = {
      494C010104000900040019001900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000064000000320000000100200000000000204E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009254
      1F0092541F0092541F0092541F0092541F0092541F0092541F0092541F009254
      1F0092541F0092541F0092541F0092541F0092541F0092541F0092541F009254
      1F0092541F0092541F0092541F00000000000000000000000000000000000000
      0000D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DA
      D900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DA
      D900D9DAD900D9DAD900D9DAD900000000000000000000000000000000000000
      0000000000007C592700D0A67600D0A67600D0A67600D0A67600D0A67600D0A6
      7600D0A67600D0A67600D0A67600D0A67600D0A67600D0A67600D0A67600D0A6
      7600D0A67600D0A67600D0A676007C5927000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0791D00AE771D00AE771D00AF771C00A27B4A00B3B5
      B500CBCDCD00AA9D7B00B3A98E00FBFCFC00FDFEFE00FEFFFF00FFFFFF00F0EE
      EE00D4CECE00B7AEAF0094857F00906D13008D6C1300AF781F00AE771D009254
      1F00000000000000000000000000FFFFFF00D9DAD900E5E5E500E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400D7D7D700DCDCDC00E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E5E5E500D9DAD9000000
      000000000000000000000000000000000000A6804F00B6895700B8885700B888
      5700B8885700B8885700B8885700B8885700B8885700B8885700B8885700B888
      5700B8885700B8885700B8885700B8885700B8885700B8885700B8885700B689
      5700A07A49000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092541F00B06D2000B06D
      2000B06D2000B16D1F00A27B4A00AEB0B100B4B8BC00906B16008A630A00F4F6
      FB00FAFBFB00FDFDFD00FFFFFF00FEFEFE00E5E1E200C9C1C200A39690008F6A
      13008C6A1400B26E2200B06D200092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900E5E5E500E5E5E500E5E5E500E6E6E600E6E6E600E5E5E500CDCD
      CD0093372300C9C9C900E6E6E600E5E5E500E5E5E500E4E4E400E4E4E400E4E4
      E400E4E4E400E5E5E500D9DAD90000000000000000000000000000000000835F
      2D00A3744100A7744100A7744100A7744100A7744100A7744100A7744100A774
      4100A7744100A7744100A7744100A7744100A7744100A7744100A7744100A774
      4100A7744100A7744100A7744100A7744100A37442007F5C2A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000092541F00B2642300B2642300B2642300B3642200A27B4A00B1B3
      B300B2B6B9008F67170089600D00EDF0F400F6F7F700FAFAFA00FEFEFE00FFFF
      FF00F7F6F600DAD5D600B2A7A1008E6615008C661600B3652500B26423009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900E7E7E700E7E7E700E7E7
      E700E8E8E800E5E5E500B5ADAD00A7491F0093372300C1C1C100DEDEDE00E4E4
      E400E7E7E700E6E6E600E5E5E500E5E5E500E4E4E400E5E5E500D9DAD9000000
      0000000000000000000000000000966633009C6734009C6734009C6734009C67
      34009C6734009C6734009C663300996533009965330099653300996533009965
      33009965330099653300996533009B6633009C6734009C6734009C6734009C67
      34009C6734008763310000000000000000000000000052ADFF00006BCE00005A
      AD000063BD000063BD000063BD000063BD000063BD000063BD000063B5000063
      B5000063BD000063B5000063BD000063B500005AAD000063B50052ADFF000000
      0000000000000000000000000000000000000000000092541F00B45B2600B45B
      2600B45B2600B55A2500A27B4A00B6B8B800B5B8BC008E631800895C0E00E5E8
      EC00F1F1F100F6F6F600FCFCFC00FEFEFE00FFFFFF00ECE9EA00C2B8B2008D61
      16008B621700B65C2800B45B260092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900E9E9E900E9E9E900E9E9E900E2E2E2009E6D6D00B9622700B459
      26009337230087665C00846F6D0098989800BDBDBD00E0E0E000E7E7E700E7E7
      E700E6E6E600E5E5E500D9DAD900000000000000000000000000000000009861
      2D0098612D0098612D0098612D0098612D00935D2C0098795800DFDCD700E0DE
      DC00E6E5E300EEECEA00EFEDEB00ECEAE800E5E4E200E0DEDC00E4E3E100E9E9
      E90098612D0098612D0098612D0098612D0098612D0098612D00000000000000
      000000000000007BE700007BE7000084EF000084F7000084F7000084F7000084
      F7000084F7000084F7000084EF000084F7000084EF000084EF00007BE700007B
      DE000073D600006BC6000063BD00000000000000000000000000000000000000
      00000000000092541F00AC582400AC582400AC582400AD572300A27B4A00BFC1
      C100BBBFC2008D5F190089591000D6DADE00E9E9E900EFF0F000F8F8F800FDFD
      FD00FFFFFF00FDFCFC00D1C9C3008C5D17008A5E1800AE592600AC5824009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900EBEBEB00EBEBEB00EBEB
      EB00B95E3800D18C2600C5762400BC672500B55B2600B55B2700B75E2800B358
      2500772F280096969600D8D8D800E9E9E900E8E8E800E7E7E700D9DAD9000000
      000000000000000000000000000099612D0099612D0099612D0099612D008D59
      2900E6E4E000E5E5E500E1E1E100E8E8E800F0F0F000EFEFEF00E8E8E800E5E5
      E500E0E0E000E6E6E600ECECEC00E9E9E90099612D0099612D0099612D009961
      2D0099612D0099612D00000000000000000000000000007BDE00008CFF001094
      FF001894FF001894FF001894FF001894FF001894FF00088CFF001094FF001094
      FF00088CFF00008CFF00008CFF000084F700007BE700007BDE00005AAD000000
      0000000000000000000000000000000000000000000092541F00A3562300A356
      2300A3562300A3552200A27B4A00CECFCF00C6CACC008E5B19008A551000C7CB
      CE00DFDFDF00E7E8E800F3F4F400FAFAFA00FEFEFE00FFFFFF00E0DBD5008B58
      18008B5A1A00A4572500A356230092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900EDEDED00EDEDED00EDEDED00ECD49B00DC9A1E00D38D2300CA7E
      2400C16E2300B75E2300B45A2500B45A2600B8602800A7421C0095959500E1E1
      E100E9E9E900E9E9E900D9DAD900000000000000000000000000000000009C65
      31009C6531009C6531009B643000D6CFC600E4E4E400E2E2E200E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E9009C642F009C642F009C642F009C642F009C642F009C642F00000000000000
      0000000000000084EF00088CFF001094FF00299CFF00299CFF0031A5FF00299C
      FF00299CFF00219CFF001094FF001094FF00088CFF00088CFF00008CFF000084
      EF000084F700007BDE00005AAD00000000000000000000000000000000000000
      00000000000092541F009A5421009A5421009A5421009A532000A27B4A00E8ED
      F000C7CDD0009F9F9D009D9F9F00BBC0C200D5DADD00E0E5E700F1F5F700FCFF
      FF00FFFFFF00FFFFFF00E3DAD1008A5519008A571C009B5422009A5421009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900EEEEEE00EEEEEE00EFEF
      EF00EFEFEF00EDE4CD00E1A52600D8952300C9802C00CEB9A400DABBA000C685
      5800C06C2D00CC813400B4592600B7B7B700EBEBEB00EAEAEA00D9DAD9000000
      0000000000000000000000000000A06A3600A06A3600A06A36008F5E3000E3E3
      E300E3E3E300E3E1DE00A06A3600A06A3600A06A3600A06A3600A06A3600A06A
      3600A06A3600A06A3600A06A3600A06A3600A06A3600A06A3600A06A3600A06A
      3600A06A3600A06A36000000000000000000000000000084EF001094FF00219C
      FF0031A5FF0031A5FF0031A5FF00299CFF0084C6FF00219CFF001894FF001094
      FF00088CFF00088CFF00088CFF00008CFF000084F700007BE700005AAD000000
      0000000000000000000000000000000000000000000092541F00915220009152
      2000915220009152200091522000915220009152200091522000915220009152
      2000915220009152200091522000915220009152200091522000915220009152
      200091522000915220009152200092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F1F0EF00E8B5
      3900C9802C00D5D5D500F1F1F100F0F0F000F0F0F000E3BD8C00E8AE45009390
      8F00E5E5E500ECECEC00D9DAD90000000000000000000000000000000000A46E
      3B00A46E3B00A46E3B0097745000E4E4E400ECECEC009E714100A46E3B00A46E
      3B00A46E3B00A46E3B00A46E3B00A46E3B00A46E3B00A27C5500A46E3B00A46E
      3B00A46E3B00A46E3B00A46E3B00A46E3B00A46E3B00A46E3B00000000000000
      0000000000000084EF00219CFF0031A5FF0031A5FF0031A5FF0031A5FF0084C6
      FF00FFFFFF0084C6FF001894FF001094FF001094FF00088CFF00008CFF000084
      F700008CFF00007BE7000063BD00000000000000000000000000000000000000
      00000000000092541F008B511E008B511E00894E1A00894E1A00894E1A00894E
      1A00894E1A00894E1A00894E1A00894E1A00894E1A00894E1A00894E1A00894E
      1A00894E1A00894E1A00894E1A00894E1A00894E1A008B511E008B511E009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900F2F2F200F1F1F100F2F2
      F200C9C9C900E7E7E700F3F3F300F3F3F300EED48C00EDEDED00F2F2F200F0F0
      F000F1F1F100F1F1F100EDDDBF00C6855100D8D8D800EDEDED00D9DAD9000000
      0000000000000000000000000000A8713F00A8713F00A8713F009F805E00EDED
      ED00F2F2F200A7713F00A8713F00A8713F00A8713F00A8713F00A8713F00A871
      3F00A7713F00E1E1E100AB8C6B00A8713F00A8713F00A8713F00A8713F00A871
      3F00A8713F00A8713F000000000000000000000000001894FF00299CFF0039A5
      FF0039A5FF0039A5FF0084C6FF00FFFFFF0084C6FF00FFFFFF0084C6FF001894
      FF001094FF00088CFF00008CFF00008CFF00008CFF000084EF000063BD000000
      0000000000000000000000000000000000000000000092541F008E561E008E56
      1E00E3DED900E4E5E500E4E5E500E5E6E600E9E9E900ECECEC00EEEEEE00EFEF
      EF00EFF0F000EFEFF000EEEEEF00ECEDED00EAEAEA00E6E6E600E4E5E500E4E5
      E500E3DED9008D551D008E561E0092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900F3F3F300F3F3F300F3F3F300D67C2A00A6A6A600E9E9E900F4F4
      F400F4F4F400F4F4F400F4F4F400B3B3B300D6D6D600F1F1F100F1F1F100E7C0
      8B00EAEAEA00EFEFEF00D9DAD90000000000000000000000000000000000AC76
      4400AC764400AC764400A5856300F1F1F100EAEAEA00A7734100AC764400AC76
      4400AC764400AC764400AC764400AC764400AB764400E4E4E400EAEAEA00B599
      7B00AC764400AC764400AC764400AC764400AC764400AC764400000000000000
      0000000000001894FF0039A5FF0039A5FF0039A5FF0084C6FF00FFFFFF0084C6
      FF0031A5FF00219CFF00FFFFFF0084C6FF001094FF00088CFF00008CFF000084
      F700088CFF000084F700006BC600000000000000000000000000000000000000
      00000000000092541F0090591D0090591D00E3DED900E4E4E400E4E4E400E7E7
      E700EBEBEB00EEEEEE00F0F0F000F1F1F100F1F1F100F1F1F100F0F0F000EEEE
      EE00EBEBEB00E8E8E800E4E4E400E4E4E400E3DED9008F581C0090591D009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900F4F4F400F3F3F300F4F4
      F400E6A8490093887F00C5C5C500EEEEEE00F5F5F500F5F5F500F4F4F4008246
      4300AAAAAA00E7E7E700F2F2F200F1F1F100F0F0F000EFEFEF00D9DAD9000000
      0000000000000000000000000000AD784600AD784600AD7846009F785000EDED
      ED00E6E6E600A37A5000AD784600AD784600AD784600AD784600AD784600AD78
      4600AD784600E8E8E800EEEEEE00F2F2F200AA764500AD784600AD784600AD78
      4600AD784600AD7846000000000000000000000000001894FF0042ADFF0039A5
      FF0084C6FF00FFFFFF0084C6FF0031A5FF0031A5FF00219CFF001894FF00FFFF
      FF0084C6FF00088CFF00008CFF00088CFF001094FF000084F7000063BD000000
      0000000000000000000000000000000000000000000092541F00945E1D00945E
      1D00E3DED900E4E4E400E5E5E500EAEAEA00EDEDED00F0F0F000F3F3F300F4F4
      F400F4F4F400F4F4F400F3F3F300F1F1F100EFEFEF00EBEBEB00E6E6E600E4E4
      E400E3DED900945D1C00945E1D0092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900F5F5F500F5F5F500F5F5F500EED5AA00E4A5400094483A009A9A
      9A00C2C2C200D6D6D600D7D7D700BB622A00802A1B0098989800DBDBDB00F1F1
      F100F1F1F100F0F0F000D9DAD90000000000000000000000000000000000B17C
      4B00B17C4B00B17C4B00AC794900E5E5E500E0E0E000E6E6E600A0754A00AE7A
      4A00AF7B4B00AF7B4B00AF7B4B00AF7B4B00AF7B4A00EFEFEF00F1F1F100EBEB
      EB00E4E4E400AD7A4A00B17C4B00B17C4B00B17C4B00B17C4B00000000000000
      00000000000031A5FF0039A5FF0042ADFF0042ADFF0084C6FF0031A5FF0031A5
      FF0031A5FF00219CFF001894FF001894FF00FFFFFF0084C6FF001094FF00088C
      FF00088CFF00008CFF00006BC600000000000000000000000000000000000000
      00000000000092541F0097631C0097631C00E3DED900E4E4E400E9E9E900EDED
      ED00F1F1F100F4F4F400F6F6F600F8F8F800F8F8F800F8F8F800F7F7F700F5F5
      F500F2F2F200EEEEEE00EAEAEA00E4E4E400E3DED90097631B0097631C009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900F6F6F600F6F6F600F6F6
      F600F7F7F700E2A64200D7943000C7772700983A1A009337230093372300B75E
      2800B55B27009D3E1A008A868600CBCBCB00EFEFEF00F1F1F100D9DAD9000000
      0000000000000000000000000000B4805000B4805000B4805000B4805000B9A5
      8D00E7E7E700EDEDED00F2F2F200EBEBEB00E4E4E400E1E1E100E7E7E700EAEA
      EA00F0F0F000F0F0F000EAEAEA00E3E3E300E1E1E100E7E7E700B37F5000B480
      5000B4805000B4805000000000000000000000000000299CFF004AADFF0042AD
      FF0042ADFF0039A5FF0031A5FF0031A5FF0031A5FF00299CFF001894FF001094
      FF001094FF00FFFFFF0084C6FF000084F700088CFF00008CFF00006BC6000000
      0000000000000000000000000000000000000000000092541F009B681C009B68
      1C00E3DED900E5E5E500EBEBEB00EFEFEF00F3F3F300F6F6F600F9F9F900FAFA
      FA00FAFAFA00FAFAFA00F9F9F900F7F7F700F4F4F400F0F0F000ECECEC00E7E7
      E700E3DED9009B681B009B681C0092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900F7F7F700F7F7F700F7F7F700F8F8F800F6F3ED00E0A32C00D591
      2300CD832400C5752500C16F2500B75F2600B4592600B45A2600B2572500896C
      6D00E5E5E500F2F2F200D9DAD90000000000000000000000000000000000B885
      5700B7845500B7845500B7845500B7845500C2AD9500F1F1F100EAEAEA00E3E3
      E300E1E1E100E8E8E800EEEEEE00F1F1F100EFEFEF00E9E9E900E2E2E200E2E2
      E200E8E8E800EEEEEE00B6947000B8865800BA895D00BC8C6100000000000000
      00000000000031A5FF0052ADFF004AADFF004AADFF0042ADFF0039A5FF0031A5
      FF0031A5FF00299CFF001894FF001094FF00088CFF00088CFF00FFFFFF0084C6
      FF001094FF00088CFF000063BD00000000000000000000000000000000000000
      00000000000092541F009E6D1B009E6D1B00E3DED900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00E3DED9009E6D1A009E6D1B009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900F8F8F800F8F8F800F8F8
      F800F9F9F900F9F9F900F9F9F900EBC56B00DE9F2300D48F1F00D0872000C87B
      2400BF6C2500B65E2500BA663600DBD7D500F3F3F300F3F3F300D9DAD9000000
      0000000000000000000000000000C3986F00C3986F00C3986F00C3986F00C398
      6F00C3986F00C2976E00C2AA9000D5CFC700EAEAEA00F0F0F000F3F3F300F0F0
      F000EAEAEA00E5E5E500E6E6E600EBEBEB00F0F0F000EEECEA00C3986F00C398
      6F00C3986F00C3986F0000000000000000000000000031A5FF005AB5FF0063B5
      FF0052ADFF004AADFF0039A5FF0031A5FF0039A5FF00299CFF00219CFF001894
      FF001094FF00088CFF001094FF00FFFFFF001094FF00008CFF00006BC6000000
      0000000000000000000000000000000000000000000092541F00A2721B00A272
      1B00E3DED900E7E7E700EBEBEB00F0F0F000F4F4F400F7F7F700F9F9F900FBFB
      FB00FBFBFB00FBFBFB00FAFAFA00F8F8F800F5F5F500F0F0F000ECECEC00E7E7
      E700E3DED900A2721A00A2721B0092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900F9F9F900F9F9F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00D8952100CF862000CE965800E9E9E900F6F6
      F600F5F5F500F4F4F400D9DAD90000000000000000000000000000000000C8A0
      7A00C8A07A00C8A07A00C8A07A00C8A07A00C8A07A00C8A07A00C8A07A00C8A0
      7A00C8A07A00C8A07A00C8A07A00C8A07A00C89F7A00E9E9E900EDEDED00F1F1
      F100F5F5F500C8A07A00C8A07A00C8A07A00C8A07A00C8A07A00000000000000
      00000000000039A5FF006BBDFF0063B5FF005AB5FF004AADFF0042ADFF0039A5
      FF0031A5FF00299CFF00219CFF00219CFF001894FF001894FF00088CFF00088C
      FF001094FF00088CFF00006BCE00000000000000000000000000000000000000
      00000000000092541F00A5761B00A5761B00E3DED900E6E6E600ECECEC00F1F1
      F100F5F5F500F8F8F800FAFAFA00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F8F8
      F800F5F5F500F2F2F200EDEDED00E8E8E800E3DED900A5761A00A5761B009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900F9F9F900F9F9F900FAFA
      FA00FAFAFA00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FAFAFA00FAFAFA00E8AF
      1A00D7BE8800F3F3F300F8F8F800F8F8F800F6F6F600F3F3F300D9DAD9000000
      0000000000000000000000000000CEA88500CEA88500CEA88500CEA88500CEA8
      8500CEA88500CEA88500CEA88500CEA88500CEA88500CEA88500CEA88500CEA8
      8500CDA88500EFEFEF00F3F3F300F5F5F500CEA88500CEA88500CEA88500CEA8
      8500CEA88500CEA8850000000000000000000000000042ADFF007BC6FF0073C6
      FF0063B5FF005AB5FF0052ADFF004AADFF0042ADFF0039A5FF0031A5FF0031A5
      FF00299CFF0031A5FF00219CFF00219CFF001894FF00008CFF00006BC6000000
      0000000000000000000000000000000000000000000092541F00AE832900AC82
      2600E3DED900E5E5E500EBEBEB00EFEFEF00F3F3F300F6F6F600F8F8F800FAFA
      FA00FAFAFA00FAFAFA00F9F9F900F7F7F700F3F3F300EFEFEF00EBEBEB00E5E5
      E500E3DED900A7791700A779180092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00F0E6CC00F8F8F800F5F5F50099999900A9A9
      A900B9B9B900D5D5D5000000000000000000000000000000000000000000D0AE
      8E00D3B08F00D3B08F00D3B08F00D3B08F00D3B08F00D3B08F00D3B08F00D3B0
      8F00D3B08F00D3B08F00D3B08F00D3B08F00D2B08F00F4F4F400F6F6F600D3B0
      8F00D3B08F00D3B08F00D3B08F00D3B08F00D4B08F00CCAC8C00000000000000
      0000000000004AADFF008CCEFF008CCEFF0073C6FF0063B5FF0063B5FF005AB5
      FF0052ADFF004AADFF004AADFF004AADFF0042ADFF0039A5FF0031A5FF0031A5
      FF00219CFF00088CFF000063BD00000000000000000000000000000000000000
      00000000000092541F00BC994800BC994800E3DED900E8E8E800ECECEC00F0F0
      F000F3F3F300F5F5F500F7F7F700F9F9F900F9F9F900F9F9F900F8F8F800F6F6
      F600F3F3F300F0F0F000ECECEC00E7E7E700E3DED900BD9A4900BD9A4A009254
      1F000000000000000000FFFFFF00FFFFFF00D9DAD900FAFAFA00FAFAFA00FBFB
      FB00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFA
      FA00FAFAFA00F8F8F800CCCCCC00FFFFFF00EAEAEA0000000000000000000000
      0000000000000000000000000000CFAF9300D8B89B00D8B89B00D8B89B00D8B8
      9B00D8B89B00D8B89B00D8B89B00D8B89B00D8B89B00D8B89B00D8B89B00D8B8
      9B00D7B89B00F7F7F700D8B89B00D8B89B00D8B89B00D8B89B00D8B89B00D8B8
      9B00D8B89B00CFAF93000000000000000000000000005AB5FF0084C6FF008CCE
      FF0073C6FF0063B5FF0052ADFF0052ADFF004AADFF004AADFF004AADFF004AAD
      FF0042ADFF0039A5FF0031A5FF00299CFF001894FF000084F7000073D6000000
      0000000000000000000000000000000000000000000092541F0000000000A474
      4C003535B3003838B3003838B7003939BA003A3ABB003A3ABC003A3ABC003939
      BA003838B8003838B6003737B2003636AE003535AA003434A5003434A1003333
      9E002A2BA300A4744C000000000092541F000000000000000000FFFFFF00FFFF
      FF00D9DAD900FAFAFA00FAFAFA00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FBFBFB00FBFBFB00FBFBFB00FAFAFA00F8F8F800E2E2E200E8E8
      E800000000000000000000000000000000000000000000000000000000008453
      3500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0
      A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0
      A500DCC0A500DCC0A500DCC0A500DCC0A500DCC0A50086663800000000000000
      0000000000005AB5FF005AB5FF004AADFF0039A5FF0031A5FF0031A5FF00299C
      FF00299CFF00299CFF0031A5FF00219CFF001094FF001894FF001894FF000084
      EF000084EF000084EF0052ADFF00000000000000000000000000000000000000
      00000000000092541F00A4744C00A4744C003535B3004142BA004343BE004344
      C1004444C3004445C5004445C4004444C2004343BF004243BE004141BA004141
      B6004040B1003E3EAC003D3DA7003C3CA20032329F00A4744C00A4744C009254
      1F00000000000000000000000000FFFFFF00D9DAD900FAFAFA00FAFAFA00FBFB
      FB00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FAFAFA00ECECEC00E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000008A6B3E00E1C8B000E1C8B000E1C8
      B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8
      B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8B000E1C8
      B0008A6B3E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092541F009254
      1F0092541F0092541F0092541F0092541F0092541F0092541F0092541F009254
      1F0092541F0092541F0092541F0092541F0092541F0092541F0092541F009254
      1F0092541F0092541F0092541F00000000000000000000000000000000000000
      0000D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DA
      D900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900D9DAD900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C592700A58C6A00C9B79F00D4C2AD00D4C2AD00D4C2AD00D4C2
      AD00D4C2AD00D4C2AD00D4C2AD00D4C2AD00D4C2AD00D4C2AD00D4C2AD00D4C2
      AD00D4C2AD00C9B79F00A0866100866638000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000064000000320000000100010000000000200300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFF0000000E00001F00001F80000FFFFFFF0000000
      C00000E00001F000007FFFFFF0000000800000C00001E000003FFFFFF0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00001E00000380001F0000000
      800000C00001E00000380001F0000000800000C00003E00000380001F0000000
      800000C00007E00000380001F0000000A00002C0000FE00000380001F0000000
      800000E0001FF000007FFFFFF0000000C00001F0003FF80000FFFFFFF0000000
      FFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000
      000000000000}
  end
  object IBSQLVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRVenda
    Left = 24
    Top = 376
  end
  object IBTRVenda: TFDTransaction
    Connection = DM.IBDatabase
    Left = 88
    Top = 376
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRVenda
    OnCalcFields = QBuscaItensCalcFields
    SQL.Strings = (
      'SELECT I.*, P.NOME_PRO, U.DESCRICAO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY I.ORDEM')
    Left = 24
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODVEN'
        ParamType = ptUnknown
      end>
    object QBuscaItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QBuscaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QBuscaItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QBuscaItensSTATUS_EXPORTA: TIntegerField
      FieldName = 'STATUS_EXPORTA'
      Origin = 'ITENS_VENDA.STATUS_EXPORTA'
      Required = True
    end
    object QBuscaItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ITENS_VENDA.COD_VEND'
      Required = True
    end
    object QBuscaItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QBuscaItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QBuscaItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DSBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 96
    Top = 432
  end
  object QAbreVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRVenda
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INICIA_VENDA(:DATAVEN, :CODEMP, :CODCAI, :DATAHORA, :COD' +
        'USU, :CUPOM, :CODCLI, :CODVEND, :CODTPV, :MODELO, :SERIE, :NUMER' +
        'O, :CANCELADA, :CCF, :CER, :CONSIGNADA)')
    Left = 152
    Top = 376
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAVEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODCAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAHORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODUSU'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CUPOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODVEND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTPV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MODELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANCELADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CCF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONSIGNADA'
        ParamType = ptUnknown
      end>
    object QAbreVendaCODVEN: TIntegerField
      FieldName = 'CODVEN'
      Origin = 'ABRE_VENDA_CAIXA.CODVEN'
    end
  end
end
