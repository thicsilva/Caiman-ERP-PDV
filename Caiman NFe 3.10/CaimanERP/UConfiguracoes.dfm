object FrmConfiguracoes: TFrmConfiguracoes
  Left = 591
  Top = 159
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 533
  ClientWidth = 662
  Color = clWhite
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PG: TPageControl
    Left = 0
    Top = 0
    Width = 662
    Height = 497
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Vendas Caixa'
      object GroupBox9: TGroupBox
        Left = 8
        Top = 176
        Width = 425
        Height = 49
        Caption = 'Tipo de Venda Padr'#227'o Para Vendas a Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object BtnConsTVPrazo: TsSpeedButton
          Left = 61
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Tipo de Venda'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsTVPrazoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCodTVPrazo: TEdit
          Left = 8
          Top = 20
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar Tipo de Venda'
          Alignment = taRightJustify
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodTVPrazoEnter
          OnExit = EdtCodTVPrazoExit
          OnKeyDown = EdtCodTVPrazoKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeTVPrazo: TEdit
          Left = 88
          Top = 20
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 425
        Height = 49
        Caption = 'Cliente padr'#227'o para Vendas Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object BtnConsCli: TsSpeedButton
          Left = 61
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Cliente'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsCliClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object cod_cli: TEdit
          Left = 8
          Top = 20
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar Cliente'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = cod_cliEnter
          OnExit = cod_cliExit
          OnKeyDown = cod_cliKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeCli: TEdit
          Left = 88
          Top = 20
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 64
        Width = 425
        Height = 49
        Caption = 'Tipo de Venda padr'#227'o para Vendas Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object BtnCondTPV: TsSpeedButton
          Left = 61
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Tipo de Venda'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnCondTPVClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCodTPV: TEdit
          Left = 8
          Top = 20
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar Tipo de Venda'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodTPVEnter
          OnExit = EdtCodTPVExit
          OnKeyDown = EdtCodTPVKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeTPV: TEdit
          Left = 88
          Top = 20
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object CheckMostraEstoque: TCheckBox
        Left = 8
        Top = 264
        Width = 233
        Height = 17
        Caption = 'Mostrar Estoque na Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object CheckEstoqueNegativo: TCheckBox
        Left = 8
        Top = 280
        Width = 241
        Height = 17
        Caption = 'Sa'#237'das com Estoque Negativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 120
        Width = 425
        Height = 49
        Caption = 'Tipo de Cobran'#231'a para as Parcelas Geradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object BtnConsCob: TsSpeedButton
          Left = 61
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Tipo de Cobran'#231'a'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsCobClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtcodCob: TEdit
          Left = 8
          Top = 20
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar Tipo de Cobran'#231'a'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtcodCobEnter
          OnExit = EdtcodCobExit
          OnKeyDown = EdtcodCobKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeCob: TEdit
          Left = 88
          Top = 20
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 446
        Top = 8
        Width = 201
        Height = 49
        Caption = 'Senha p/Liberar e Excluir Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object EdtSenhaExcVenda: TEdit
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object CheckDescItem: TCheckBox
        Left = 8
        Top = 296
        Width = 271
        Height = 17
        Caption = 'Conceder Desconto nos Itens da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object CheckDescVenda: TCheckBox
        Left = 8
        Top = 312
        Width = 263
        Height = 17
        Caption = 'Conceder Desconto no Total da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
      end
      object GroupBox7: TGroupBox
        Left = 446
        Top = 64
        Width = 201
        Height = 49
        Caption = 'Desconto M'#225'ximo nas Vendas(%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object EdtDescMaximo: TCurrencyEdit
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 0
          ZeroEmpty = False
        end
      end
      object GroupBox8: TGroupBox
        Left = 446
        Top = 120
        Width = 201
        Height = 49
        Caption = 'Tamanho C'#243'digo Balan'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object ComboTamanho: TComboBox
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          Style = csDropDownList
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            '4'
            '5'
            '6')
        end
      end
      object CheckCheque: TCheckBox
        Left = 8
        Top = 328
        Width = 233
        Height = 17
        Caption = 'Lan'#231'ar cheques nas vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
      end
      object CheckParcelas: TCheckBox
        Left = 8
        Top = 248
        Width = 280
        Height = 18
        Caption = 'Alterar e Excluir as Parcelas (Frente de Loja)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object CheckConsProdRapida: TCheckBox
        Left = 8
        Top = 344
        Width = 255
        Height = 17
        Caption = 'Consulta de Produto R'#225'pida nas Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
      end
      object CheckMostrarPromocao: TCheckBox
        Left = 8
        Top = 360
        Width = 273
        Height = 17
        Caption = 'Mostrar a promocao dos produtos no frente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
      end
      object CheckProdEstoqueFrente: TCheckBox
        Left = 8
        Top = 376
        Width = 342
        Height = 17
        Caption = 'Mostrar somente os produtos com estoque no frente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
      end
      object GroupBox13: TGroupBox
        Left = 446
        Top = 230
        Width = 201
        Height = 49
        Caption = 'Quantidade M'#225'xima nas Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object EdtQuantMaximo: TCurrencyEdit
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 0
          ZeroEmpty = False
        end
      end
      object GroupBox14: TGroupBox
        Left = 446
        Top = 288
        Width = 201
        Height = 49
        Caption = 'Valor Unit'#225'rio M'#225'ximo nas Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object EdtValorMaximo: TCurrencyEdit
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 0
          ZeroEmpty = False
        end
      end
      object CheckOperador: TCheckBox
        Left = 8
        Top = 392
        Width = 297
        Height = 17
        Caption = 'Imprimir o Nome do Operador no Cupom Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
      end
      object CheckIniciarForma: TCheckBox
        Left = 8
        Top = 408
        Width = 279
        Height = 17
        Caption = 'Iniciar Vendas com Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
      end
      object CheckConsultarProduto: TCheckBox
        Left = 296
        Top = 248
        Width = 141
        Height = 18
        Caption = 'Consultar Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
      end
      object CheckImprimirServico: TCheckBox
        Left = 296
        Top = 264
        Width = 141
        Height = 18
        Caption = 'Imprimir Servi'#231'o ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
      end
      object GroupBox2: TGroupBox
        Left = 446
        Top = 176
        Width = 201
        Height = 49
        Caption = 'Pre'#231'o ou Peso  na etiqueta da balan'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object ComboBalanca: TComboBox
          Left = 8
          Top = 16
          Width = 185
          Height = 21
          Style = csDropDownList
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'Pre'#231'o'
            'Peso')
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contas Receber'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Dias Car'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 104
        Top = 8
        Width = 90
        Height = 13
        Caption = 'Dias Negativa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 216
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Juros por Atraso (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 48
        Width = 80
        Height = 13
        Caption = 'Atrazo M'#225'ximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCarencia: TEdit
        Left = 8
        Top = 24
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 0
        OnKeyPress = EdtCarenciaKeyPress
      end
      object EdtNegativo: TEdit
        Left = 104
        Top = 24
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 1
        OnKeyPress = cod_cliKeyPress
      end
      object EdtJuros: TCurrencyEdit
        Left = 216
        Top = 24
        Width = 81
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 2
        ZeroEmpty = False
      end
      object EdtAtrazoMaximo: TEdit
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 3
        OnKeyPress = cod_cliKeyPress
      end
      object CheckCodVenda: TCheckBox
        Left = 8
        Top = 104
        Width = 353
        Height = 17
        Caption = 'Mostrar o C'#243'digo da Venda no Inicio do Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object CheckManterDataNotinha: TCheckBox
        Left = 8
        Top = 128
        Width = 353
        Height = 17
        Caption = 'Manter a Data da Notinha no Recebimento por Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object CheckPergunta: TCheckBox
        Left = 8
        Top = 152
        Width = 273
        Height = 17
        Caption = 'Peguntar se vai gerar nota pendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object CheckFrete: TCheckBox
        Left = 8
        Top = 176
        Width = 281
        Height = 17
        Caption = 'Incluir o Valor do Frete na Primeira Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object CheckHabilitarDevolucao: TCheckBox
        Left = 8
        Top = 200
        Width = 281
        Height = 17
        Caption = 'Habilitar Devolu'#231#227'o no Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Comprovantes/Etiquetas'
      ImageIndex = 2
      object Label4: TLabel
        Left = 8
        Top = 256
        Width = 165
        Height = 13
        Caption = 'Linha no Final do Comprovante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 176
        Top = 256
        Width = 82
        Height = 13
        Caption = 'N'#250'mero de vias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CheckDadosEmp: TCheckBox
        Left = 8
        Top = 8
        Width = 417
        Height = 17
        Caption = 'Imprimir Dados da Empresa no Cabe'#231'alho dos Comprovantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EdtLinhas: TEdit
        Left = 8
        Top = 272
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 9
      end
      object RdgTamanho: TRadioGroup
        Left = 8
        Top = 200
        Width = 313
        Height = 49
        Caption = 'Tamanho do Comprovante'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Items.Strings = (
          'Bobina 89 x 60'
          'Raz'#227'o')
        ParentFont = False
        TabOrder = 8
      end
      object CheckRecibo: TCheckBox
        Left = 8
        Top = 40
        Width = 417
        Height = 17
        Caption = 'Imprimir Recibo de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckReciboClick
      end
      object CheckDadosConvenio: TCheckBox
        Left = 8
        Top = 88
        Width = 417
        Height = 17
        Caption = 'Imprimir Dados do Conv'#234'nio no Comprovante de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object CheckRecECF: TCheckBox
        Left = 8
        Top = 72
        Width = 353
        Height = 17
        Caption = 'Imprimir Recibo de Pagamento na ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object CheckParcPendente: TCheckBox
        Left = 8
        Top = 56
        Width = 417
        Height = 17
        Caption = 'Imprimir Parcelas Pendentes no Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CheckReciboClick
      end
      object Check2LinhasItens: TCheckBox
        Left = 8
        Top = 104
        Width = 417
        Height = 17
        Caption = 'Usar 2 linhas para impress'#227'o dos itens do comprovante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object CheckPromissoria: TCheckBox
        Left = 8
        Top = 24
        Width = 417
        Height = 17
        Caption = 'Imprimir Promiss'#243'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox12: TGroupBox
        Left = 448
        Top = 32
        Width = 176
        Height = 193
        Caption = 'Modelo Etiqueta Matricial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        object RDGEtiqueta: TRadioGroup
          Left = 12
          Top = 16
          Width = 152
          Height = 81
          Items.Strings = (
            'Modelo 1'
            'Modelo 2'
            'Modelo 3')
          TabOrder = 0
          OnClick = RDGEtiquetaClick
        end
        object PanelModelo1: TPanel
          Left = 12
          Top = 112
          Width = 137
          Height = 65
          Color = clWhite
          TabOrder = 1
          object Label5: TLabel
            Left = 8
            Top = 8
            Width = 95
            Height = 13
            Caption = 'Nome da Empresa'
          end
          object Label26: TLabel
            Left = 8
            Top = 26
            Width = 27
            Height = 13
            Caption = 'Cod. '
          end
          object Label27: TLabel
            Left = 40
            Top = 24
            Width = 42
            Height = 17
            Caption = '000001'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 8
            Top = 42
            Width = 112
            Height = 13
            Caption = 'Descri'#231#227'o do Produto'
          end
        end
        object PanelModelo2: TPanel
          Left = 12
          Top = 112
          Width = 137
          Height = 65
          Color = clWhite
          TabOrder = 2
          object Label29: TLabel
            Left = 8
            Top = 8
            Width = 95
            Height = 13
            Caption = 'Nome da Empresa'
          end
          object Label30: TLabel
            Left = 8
            Top = 26
            Width = 27
            Height = 13
            Caption = 'Cod. '
          end
          object Label31: TLabel
            Left = 40
            Top = 24
            Width = 36
            Height = 13
            Caption = '000001'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 8
            Top = 42
            Width = 51
            Height = 17
            Caption = 'R$ 35,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object PanelModelo3: TPanel
          Left = 12
          Top = 112
          Width = 152
          Height = 65
          Color = clWhite
          TabOrder = 3
          object Label33: TLabel
            Left = 8
            Top = 8
            Width = 95
            Height = 13
            Caption = 'Nome da Empresa'
          end
          object Label34: TLabel
            Left = 8
            Top = 24
            Width = 112
            Height = 13
            Caption = 'Descri'#231#227'o do Produto'
          end
          object Label36: TLabel
            Left = 8
            Top = 42
            Width = 102
            Height = 13
            Caption = '00631                 1,50'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object EdtNumVias: TEdit
        Left = 176
        Top = 272
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 10
      end
      object GroupBox15: TGroupBox
        Left = 8
        Top = 144
        Width = 313
        Height = 49
        Caption = 'Tipo de Comprovante [Empresa]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object ComboTipoComprovante: TComboBox
          Left = 8
          Top = 16
          Width = 297
          Height = 21
          Style = csDropDownList
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'Normal'
            'Churrasqueiras Lobo'
            'Fae Premoldados')
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Estoque'
      ImageIndex = 3
      object Label7: TLabel
        Left = 8
        Top = 16
        Width = 117
        Height = 13
        Caption = 'Data In'#237'cio do Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtIniEstoque: TMaskEdit
        Left = 8
        Top = 32
        Width = 88
        Height = 21
        Color = clSilver
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object GroupBox10: TGroupBox
        Left = 8
        Top = 66
        Width = 636
        Height = 57
        Caption = 'Local de Estoque [Vendas]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object BtnConsLocal: TsSpeedButton
          Left = 112
          Top = 24
          Width = 23
          Height = 21
          Hint = 'Consultar '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsLocalClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCodLocal: TEdit
          Left = 8
          Top = 24
          Width = 97
          Height = 21
          Hint = 'Pressione F2 para Consultar'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodLocalEnter
          OnExit = EdtCodLocalExit
          OnKeyDown = EdtCodLocalKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeLocal: TEdit
          Left = 139
          Top = 24
          Width = 485
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox11: TGroupBox
        Left = 8
        Top = 138
        Width = 636
        Height = 127
        Caption = 'Local de Vendas Default [Transfer'#234'ncia entre Locais de Estoque]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object BtnConsLocalOrigem: TsSpeedButton
          Left = 109
          Top = 40
          Width = 23
          Height = 21
          Hint = 'Consultar '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsLocalOrigemClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtnConsLocalDestino: TsSpeedButton
          Left = 109
          Top = 88
          Width = 23
          Height = 21
          Hint = 'Consultar '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsLocalDestinoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label8: TLabel
          Left = 8
          Top = 24
          Width = 129
          Height = 13
          Caption = 'Local de Estoque Origem'
        end
        object Label9: TLabel
          Left = 8
          Top = 72
          Width = 131
          Height = 13
          Caption = 'Local de Estoque Destino'
        end
        object EdtCodLocalOrigem: TEdit
          Left = 8
          Top = 40
          Width = 96
          Height = 21
          Hint = 'Pressione F2 para Consultar'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodLocalOrigemEnter
          OnExit = EdtCodLocalOrigemExit
          OnKeyDown = EdtCodLocalOrigemKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeLocalOrigem: TEdit
          Left = 136
          Top = 40
          Width = 489
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EdtCodLocalDestino: TEdit
          Left = 8
          Top = 88
          Width = 96
          Height = 21
          Hint = 'Pressione F2 para Consultar'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnEnter = EdtCodLocalDestinoEnter
          OnExit = EdtCodLocalDestinoExit
          OnKeyDown = EdtCodLocalDestinoKeyDown
          OnKeyPress = cod_cliKeyPress
        end
        object EdtNomeLocalDestino: TEdit
          Left = 136
          Top = 88
          Width = 489
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Contas Corrente'
      ImageIndex = 4
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 642
        Height = 49
        Caption = 
          'Tipo de Documento para Lan'#231'amentos autom'#225'ticos no Contas Corrent' +
          'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object BtnConsTipodoc: TsSpeedButton
          Left = 117
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Tipo de Documento'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnConsTipodocClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object cod_doc: TEdit
          Left = 8
          Top = 20
          Width = 105
          Height = 21
          Hint = 'Pressione F2 para Consultar Tipo de Documento'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = cod_docExit
          OnKeyDown = cod_docKeyDown
          OnKeyPress = EdtCarenciaKeyPress
        end
        object EdtNomeTipoDoc: TEdit
          Left = 144
          Top = 20
          Width = 490
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object CheckCC: TCheckBox
        Left = 8
        Top = 64
        Width = 433
        Height = 17
        Caption = 'Lan'#231'ar automaticamente os cheques depositados no Contas Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object CheckSaldoConciliado: TCheckBox
        Left = 8
        Top = 80
        Width = 433
        Height = 17
        Caption = 'Usar saldo concilidado no contas corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Contabilidade'
      ImageIndex = 5
      object CheckContabil: TCheckBox
        Left = 8
        Top = 8
        Width = 162
        Height = 17
        Caption = 'Lan'#231'amentos Cont'#225'beis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object CheckSintegra: TCheckBox
        Left = 176
        Top = 8
        Width = 111
        Height = 17
        Caption = 'Gerar Sintegra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object RdgIsentasOutrasLivros: TRadioGroup
        Left = 8
        Top = 40
        Width = 374
        Height = 41
        Caption = 'Dif.entre Valor Cont'#225'bil e Base de C'#225'lculo nos Livros Fiscais'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Items.Strings = (
          'Isentas'
          'Outras')
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Nota Fiscal'
      ImageIndex = 6
      object Label18: TLabel
        Left = 8
        Top = 144
        Width = 91
        Height = 13
        Caption = #205'ndice Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 232
        Top = 144
        Width = 41
        Height = 13
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 288
        Top = 144
        Width = 25
        Height = 13
        Caption = 'S'#233'rie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 360
        Top = 144
        Width = 38
        Height = 13
        Caption = 'Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label42: TLabel
        Left = 464
        Top = 144
        Width = 32
        Height = 13
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 253
        Top = 88
        Width = 242
        Height = 13
        Caption = 'CFOP para vendas com cupom fiscal no Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 253
        Top = 112
        Width = 266
        Height = 13
        Caption = 'CFOP para vendas com cupom fiscal fora do Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 144
        Top = 144
        Width = 76
        Height = 13
        Caption = 'N'#250'mero Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CheckCSTNF: TCheckBox
        Left = 8
        Top = 16
        Width = 322
        Height = 17
        Caption = 'Destacar nas observa'#231#245'es a soma dos itens por CST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ComboIndiceNota: TComboBox
        Left = 8
        Top = 160
        Width = 121
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 4
        Items.Strings = (
          'SUP.BETTIN'
          'GASPARINI'
          'NEGRIS'
          'ALEMPEQ')
      end
      object CheckSomarQtdItens: TCheckBox
        Left = 8
        Top = 40
        Width = 200
        Height = 17
        Caption = 'Somar a quantidade dos itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object CheckGerarNFVendas: TCheckBox
        Left = 8
        Top = 64
        Width = 200
        Height = 17
        Caption = 'Gerar Nota Fiscal nas Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object EdtCodModelo: TEdit
        Left = 232
        Top = 160
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        MaxLength = 2
        TabOrder = 6
      end
      object EdtSerieNotaFiscal: TEdit
        Left = 288
        Top = 160
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 3
        TabOrder = 7
      end
      object RdgFrete: TRadioGroup
        Left = 366
        Top = 16
        Width = 113
        Height = 57
        Caption = 'Frete por Conta'
        Items.Strings = (
          '(1) Emitente'
          '(2) Destinat'#225'rio')
        TabOrder = 10
      end
      object EdtEspecie: TEdit
        Left = 360
        Top = 160
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 8
      end
      object EdtMarca: TEdit
        Left = 464
        Top = 160
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 9
      end
      object CheckFatura: TCheckBox
        Left = 8
        Top = 88
        Width = 180
        Height = 17
        Caption = 'Imprimir Fatura Nota Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object EdtCFOPCupomEstado: TEdit
        Left = 552
        Top = 84
        Width = 49
        Height = 21
        Color = clSilver
        TabOrder = 11
      end
      object EdtCFOPCupomFora: TEdit
        Left = 552
        Top = 109
        Width = 49
        Height = 21
        Color = clSilver
        TabOrder = 12
      end
      object EdtNumNFInicial: TEdit
        Left = 144
        Top = 160
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 5
        OnKeyPress = cod_cliKeyPress
      end
      object GroupBox18: TGroupBox
        Left = 3
        Top = 199
        Width = 617
        Height = 249
        Caption = 
          'NFe - Nota Fiscal Eletr'#244'nica / NFSe - Nota Fiscal Servi'#231'o Eletr'#244 +
          'nica'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 13
        object PageControl1: TPageControl
          Left = 2
          Top = 15
          Width = 613
          Height = 232
          ActivePage = TabSheet16
          Align = alClient
          TabOrder = 0
          object TabSheet12: TTabSheet
            Caption = 'Certificado'
            object sbtnCaminhoCert: TsSpeedButton
              Left = 563
              Top = 39
              Width = 30
              Height = 21
              Caption = '...'
              NumGlyphs = 2
              Transparent = False
              Visible = False
              OnClick = sbtnCaminhoCertClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object sbtnGetCert: TsSpeedButton
              Left = 563
              Top = 118
              Width = 30
              Height = 21
              Caption = '...'
              NumGlyphs = 2
              Transparent = False
              Visible = False
              OnClick = sbtnGetCertClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Image1: TImage
              Left = 452
              Top = 24
              Width = 150
              Height = 133
              AutoSize = True
              Center = True
            end
            object Label10: TLabel
              Left = 10
              Top = 16
              Width = 47
              Height = 13
              Caption = 'Caminho'
            end
            object Label11: TLabel
              Left = 10
              Top = 56
              Width = 32
              Height = 13
              Caption = 'Senha'
            end
            object Label12: TLabel
              Left = 10
              Top = 96
              Width = 87
              Height = 13
              Caption = 'N'#250'mero de S'#233'rie'
            end
            object Label13: TLabel
              Left = 10
              Top = 144
              Width = 58
              Height = 13
              Caption = 'UF da NF-e'
            end
            object EdtCaminhoCertificado: TEdit
              Left = 8
              Top = 32
              Width = 310
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 0
            end
            object EdtSenhaCertificado: TEdit
              Left = 8
              Top = 72
              Width = 310
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 80
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 1
            end
            object EdtNumeroSerieCertificado: TEdit
              Left = 8
              Top = 112
              Width = 310
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 80
              ParentFont = False
              TabOrder = 2
            end
            object AdvGlowButton1: TAdvGlowButton
              Left = 534
              Top = 13
              Width = 47
              Height = 24
              Caption = '...'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Segoe UI'
              NotesFont.Style = []
              TabOrder = 3
              Visible = False
              OnClick = AdvGlowButton1Click
              Appearance.BorderColor = 14727579
              Appearance.BorderColorHot = 10079963
              Appearance.BorderColorDown = 4548219
              Appearance.Color = 15653832
              Appearance.ColorTo = 16178633
              Appearance.ColorChecked = 7915518
              Appearance.ColorCheckedTo = 11918331
              Appearance.ColorDisabled = 15921906
              Appearance.ColorDisabledTo = 15921906
              Appearance.ColorDown = 7778289
              Appearance.ColorDownTo = 4296947
              Appearance.ColorHot = 15465983
              Appearance.ColorHotTo = 11332863
              Appearance.ColorMirror = 15586496
              Appearance.ColorMirrorTo = 16245200
              Appearance.ColorMirrorHot = 5888767
              Appearance.ColorMirrorHotTo = 10807807
              Appearance.ColorMirrorDown = 946929
              Appearance.ColorMirrorDownTo = 5021693
              Appearance.ColorMirrorChecked = 10480637
              Appearance.ColorMirrorCheckedTo = 5682430
              Appearance.ColorMirrorDisabled = 11974326
              Appearance.ColorMirrorDisabledTo = 15921906
              Appearance.GradientHot = ggVertical
              Appearance.GradientMirrorHot = ggVertical
              Appearance.GradientDown = ggVertical
              Appearance.GradientMirrorDown = ggVertical
              Appearance.GradientChecked = ggVertical
            end
            object AdvGlowButton2: TAdvGlowButton
              Left = 510
              Top = 140
              Width = 47
              Height = 24
              Caption = '...'
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Segoe UI'
              NotesFont.Style = []
              TabOrder = 4
              Visible = False
              OnClick = AdvGlowButton2Click
              Appearance.BorderColor = 14727579
              Appearance.BorderColorHot = 10079963
              Appearance.BorderColorDown = 4548219
              Appearance.Color = 15653832
              Appearance.ColorTo = 16178633
              Appearance.ColorChecked = 7915518
              Appearance.ColorCheckedTo = 11918331
              Appearance.ColorDisabled = 15921906
              Appearance.ColorDisabledTo = 15921906
              Appearance.ColorDown = 7778289
              Appearance.ColorDownTo = 4296947
              Appearance.ColorHot = 15465983
              Appearance.ColorHotTo = 11332863
              Appearance.ColorMirror = 15586496
              Appearance.ColorMirrorTo = 16245200
              Appearance.ColorMirrorHot = 5888767
              Appearance.ColorMirrorHotTo = 10807807
              Appearance.ColorMirrorDown = 946929
              Appearance.ColorMirrorDownTo = 5021693
              Appearance.ColorMirrorChecked = 10480637
              Appearance.ColorMirrorCheckedTo = 5682430
              Appearance.ColorMirrorDisabled = 11974326
              Appearance.ColorMirrorDisabledTo = 15921906
              Appearance.GradientHot = ggVertical
              Appearance.GradientMirrorHot = ggVertical
              Appearance.GradientDown = ggVertical
              Appearance.GradientMirrorDown = ggVertical
              Appearance.GradientChecked = ggVertical
            end
            object Button1: TButton
              Left = 318
              Top = 31
              Width = 70
              Height = 21
              Caption = 'Carregar'
              TabOrder = 5
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 318
              Top = 111
              Width = 70
              Height = 21
              Caption = 'Carregar'
              TabOrder = 6
              OnClick = Button2Click
            end
            object estado_nfe: TComboBox
              Left = 8
              Top = 160
              Width = 121
              Height = 21
              Color = clSilver
              TabOrder = 7
              Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PI'
                'PR'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO')
            end
          end
          object TabSheet13: TTabSheet
            Caption = 'Geral'
            ImageIndex = 1
            object Label56: TLabel
              Left = 280
              Top = 7
              Width = 62
              Height = 13
              Caption = 'Logo Marca'
            end
            object sbtnPathSalvar: TsSpeedButton
              Left = 523
              Top = 23
              Width = 23
              Height = 21
              Caption = '...'
              Transparent = False
              OnClick = sbtnPathSalvarClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label68: TLabel
              Left = 280
              Top = 88
              Width = 97
              Height = 13
              Caption = 'Caminho Relat'#243'rio'
            end
            object SpeedButton1: TsSpeedButton
              Left = 523
              Top = 103
              Width = 23
              Height = 21
              Caption = '...'
              NumGlyphs = 2
              Transparent = False
              OnClick = SpeedButton1Click
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label80: TLabel
              Left = 280
              Top = 129
              Width = 34
              Height = 13
              Caption = 'Vers'#227'o'
            end
            object RdgTipoDanfe: TRadioGroup
              Left = 8
              Top = 8
              Width = 249
              Height = 49
              Caption = 'DANFE'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Retrato'
                'Paisagem')
              TabOrder = 0
            end
            object RdgFormaEmissaoDanfe: TRadioGroup
              Left = 8
              Top = 64
              Width = 249
              Height = 81
              Caption = 'Forma de Emiss'#227'o'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Normal'
                'Conting'#234'ncia'
                'SCAN'
                'DPEC'
                'FSDA')
              TabOrder = 1
            end
            object EdtLogoMarcaDanfe: TEdit
              Left = 280
              Top = 23
              Width = 241
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 3
            end
            object CheckSalvarLogDanfe: TCheckBox
              Left = 280
              Top = 46
              Width = 209
              Height = 15
              Caption = 'Salvar Arquivos de Envio e Resposta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object RdgAmbienteDanfe: TRadioGroup
              Left = 8
              Top = 152
              Width = 249
              Height = 41
              Caption = 'Ambiente de Destino'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Produ'#231#227'o'
                'Homologa'#231#227'o')
              TabOrder = 2
            end
            object EdtPathLogsDanfe: TDirectoryEdit
              Left = 280
              Top = 65
              Width = 265
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 5
              Text = ''
            end
            object EdtCaminhoRelatorio: TEdit
              Left = 280
              Top = 104
              Width = 241
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 6
            end
            object chkSincrono: TCheckBox
              Left = 431
              Top = 149
              Width = 111
              Height = 15
              Caption = 'Envio Sincrono'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object cbbVersaoNFe: TComboBox
              Left = 280
              Top = 146
              Width = 145
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              Items.Strings = (
                '2.00'
                '3.00'
                '3.10')
            end
          end
          object TabSheet14: TTabSheet
            Caption = 'Email'
            ImageIndex = 2
            object Label57: TLabel
              Left = 0
              Top = 8
              Width = 76
              Height = 13
              Caption = 'Servidor SMTP'
            end
            object Label58: TLabel
              Left = 222
              Top = 8
              Width = 28
              Height = 13
              Caption = 'Porta'
            end
            object Label59: TLabel
              Left = 145
              Top = 48
              Width = 32
              Height = 13
              Caption = 'Senha'
            end
            object Label60: TLabel
              Left = 0
              Top = 48
              Width = 40
              Height = 13
              Caption = 'Usu'#225'rio'
            end
            object Label61: TLabel
              Left = 0
              Top = 128
              Width = 136
              Height = 13
              Caption = 'Assunto do email enviado'
            end
            object Label62: TLabel
              Left = 288
              Top = 68
              Width = 106
              Height = 13
              Caption = 'Mensagem do Email'
            end
            object Label66: TLabel
              Left = 0
              Top = 88
              Width = 27
              Height = 13
              Caption = 'From'
            end
            object Label79: TLabel
              Left = 288
              Top = 8
              Width = 109
              Height = 13
              Caption = 'Nome Do Remetente'
            end
            object EdtSmtpHost: TEdit
              Left = 0
              Top = 24
              Width = 209
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 0
            end
            object EdtSmtpPort: TEdit
              Left = 222
              Top = 24
              Width = 51
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
            end
            object EdtSmtpPass: TEdit
              Left = 144
              Top = 64
              Width = 129
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 60
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 3
            end
            object EdtSmtpUser: TEdit
              Left = 0
              Top = 64
              Width = 129
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 80
              ParentFont = False
              TabOrder = 2
            end
            object EdtEmailAssunto: TEdit
              Left = 0
              Top = 144
              Width = 273
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 150
              ParentFont = False
              TabOrder = 5
            end
            object CheckEmailSSL: TCheckBox
              Left = 288
              Top = 48
              Width = 207
              Height = 17
              Caption = 'Requer Autentica'#231#227'o'
              TabOrder = 7
            end
            object MemoEmailMsg: TMemo
              Left = 288
              Top = 84
              Width = 273
              Height = 81
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 200
              ParentFont = False
              TabOrder = 8
            end
            object EdtSMTPFrom: TEdit
              Left = 0
              Top = 104
              Width = 273
              Height = 21
              CharCase = ecLowerCase
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 4
            end
            object rbTipoEnvio: TRadioGroup
              Left = 3
              Top = 168
              Width = 558
              Height = 33
              Caption = ' Tipo Envio '
              Columns = 4
              Items.Strings = (
                'Normal'
                'SSL'
                'Nehuma'
                'TLS')
              TabOrder = 9
            end
            object edtEmail_Nome: TEdit
              Left = 288
              Top = 24
              Width = 273
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 150
              ParentFont = False
              TabOrder = 6
            end
          end
          object TabSheet15: TTabSheet
            Caption = 'Arquivos'
            ImageIndex = 3
            object Label63: TLabel
              Left = 7
              Top = 2
              Width = 129
              Height = 13
              Caption = 'Pasta Danfes Cancelados'
            end
            object Label64: TLabel
              Left = 7
              Top = 42
              Width = 130
              Height = 13
              Caption = 'Pasta Danfes Inutilizados'
            end
            object Label65: TLabel
              Left = 7
              Top = 82
              Width = 136
              Height = 13
              Caption = 'Pasta Danfes Transmitidos'
            end
            object Label67: TLabel
              Left = 7
              Top = 122
              Width = 102
              Height = 13
              Caption = 'Pasta Arquivos PDF'
            end
            object Label24: TLabel
              Left = 7
              Top = 162
              Width = 101
              Height = 13
              Caption = 'Pasta TXT Servi'#231'os :'
            end
            object EdtPastaCanceladasDanfe: TDirectoryEdit
              Left = 8
              Top = 21
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 0
              Text = ''
            end
            object EdtPastaInutilizadosDanfe: TDirectoryEdit
              Left = 7
              Top = 58
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 1
              Text = ''
            end
            object EdtPastaTransmitidosDanfe: TDirectoryEdit
              Left = 7
              Top = 98
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 2
              Text = ''
            end
            object EdtPastaPDFDanfe: TDirectoryEdit
              Left = 7
              Top = 138
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 3
              Text = ''
            end
            object edtPastaTxtServ: TDirectoryEdit
              Left = 8
              Top = 180
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 4
              Text = ''
            end
          end
          object TabSheet16: TTabSheet
            Caption = 'NFSe'
            ImageIndex = 4
            object Label81: TLabel
              Left = 15
              Top = 10
              Width = 45
              Height = 13
              Caption = 'Schemas'
            end
            object Label82: TLabel
              Left = 15
              Top = 53
              Width = 50
              Height = 13
              Caption = 'Al'#237'quotas'
            end
            object Label83: TLabel
              Left = 15
              Top = 101
              Width = 51
              Height = 13
              Caption = 'Prefeitura'
            end
            object Label84: TLabel
              Left = 15
              Top = 143
              Width = 96
              Height = 13
              Caption = 'Imagem Prefeitura'
            end
            object sSpeedButton1: TsSpeedButton
              Left = 258
              Top = 159
              Width = 23
              Height = 21
              Caption = '...'
              Transparent = False
              OnClick = sSpeedButton1Click
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label85: TLabel
              Left = 392
              Top = 13
              Width = 76
              Height = 13
              Caption = 'N'#250'mero Inicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtPastaSchemas: TDirectoryEdit
              Left = 15
              Top = 27
              Width = 353
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              NumGlyphs = 1
              ParentFont = False
              TabOrder = 0
              Text = ''
            end
            object cbAliquota: TComboBox
              Left = 15
              Top = 70
              Width = 145
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Items.Strings = (
                '2'
                '2,79'
                '3,50'
                '3,84'
                '3,87'
                '4,23'
                '4,26'
                '4,31'
                '4,61'
                '4,65'
                '5')
            end
            object edtPrefeitura: TEdit
              Left = 15
              Top = 115
              Width = 209
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 2
            end
            object edtImagemPrefeitura: TEdit
              Left = 15
              Top = 159
              Width = 241
              Height = 21
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 100
              ParentFont = False
              TabOrder = 3
            end
            object edtNumeroInicialNFS: TEdit
              Left = 392
              Top = 27
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              TabOrder = 4
              OnKeyPress = cod_cliKeyPress
            end
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Boleto Banc'#225'rio'
      ImageIndex = 7
      object Label22: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Instru'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 8
        Top = 142
        Width = 158
        Height = 13
        Caption = 'Extens'#227'o do arquivo remessa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 8
        Top = 185
        Width = 142
        Height = 13
        Caption = 'Pasta do arquivo Remessa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 7
        Top = 225
        Width = 139
        Height = 13
        Caption = 'Pasta do arquivo Retorno :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MemoBoleto: TMemo
        Left = 8
        Top = 24
        Width = 641
        Height = 57
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox17: TGroupBox
        Left = 8
        Top = 87
        Width = 425
        Height = 49
        Caption = ' Cedente Padr'#227'o Para Boletos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object SpeedButton2: TsSpeedButton
          Left = 61
          Top = 20
          Width = 23
          Height = 21
          Hint = 'Consultar Cliente'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000502020B4B201CB1662A26F032151275000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
            0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
            052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
            00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
            27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
            12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
            23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
            26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
            04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
            28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
            090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
            23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
            4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
            1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
            69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
            22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
            527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
            28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
            0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
            28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
            020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
            14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
            20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
            0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
            26F92F14116F0000000000000000000000000000000000000000000000000000
            0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
            0625000000000000000000000000000000000000000000000000}
          ParentShowHint = False
          ShowHint = True
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object edtCodCedente: TEdit
          Left = 8
          Top = 20
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar Cliente'
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtCodCedenteExit
        end
        object edtDescricaoCedente: TEdit
          Left = 88
          Top = 20
          Width = 329
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object edtEstRemessa: TEdit
        Left = 3
        Top = 158
        Width = 186
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 2
      end
      object edtPastaRemessa: TsDirectoryEdit
        Left = 8
        Top = 201
        Width = 417
        Height = 21
        AutoSize = False
        Color = clSilver
        MaxLength = 255
        TabOrder = 3
        Text = ''
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Segoe UI'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        Root = 'rfDesktop'
      end
      object edtPastaRetorno: TsDirectoryEdit
        Left = 7
        Top = 241
        Width = 417
        Height = 21
        AutoSize = False
        Color = clSilver
        MaxLength = 255
        TabOrder = 4
        Text = ''
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Segoe UI'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        Root = 'rfDesktop'
      end
    end
    object TabSheet11: TTabSheet
      Caption = '&Impostos'
      ImageIndex = 10
      object GroupBox16: TGroupBox
        Left = 8
        Top = 16
        Width = 217
        Height = 233
        Caption = 'Lucro Real/Presumido Saidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label44: TLabel
          Left = 8
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Pis (%)'
        end
        object Label45: TLabel
          Left = 8
          Top = 64
          Width = 54
          Height = 13
          Caption = 'Cofins (%)'
        end
        object Label46: TLabel
          Left = 8
          Top = 104
          Width = 31
          Height = 13
          Caption = 'IR (%)'
        end
        object Label47: TLabel
          Left = 8
          Top = 144
          Width = 93
          Height = 13
          Caption = 'Contrib.Social (%)'
        end
        object Label48: TLabel
          Left = 8
          Top = 184
          Width = 55
          Height = 13
          Caption = 'Outras (%)'
        end
        object EdtAliqPis: TCurrencyEdit
          Left = 8
          Top = 40
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtAliqCofins: TCurrencyEdit
          Left = 8
          Top = 80
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 1
          ZeroEmpty = False
        end
        object EdtAliqIR: TCurrencyEdit
          Left = 8
          Top = 120
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 2
          ZeroEmpty = False
        end
        object EdtAliqCSLL: TCurrencyEdit
          Left = 8
          Top = 160
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 3
          ZeroEmpty = False
        end
        object EdtAliqOutras: TCurrencyEdit
          Left = 8
          Top = 200
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 4
          ZeroEmpty = False
        end
      end
      object GroupBox19: TGroupBox
        Left = 251
        Top = 16
        Width = 209
        Height = 233
        Caption = 'Lucro Real/Presumido Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label14: TLabel
          Left = 8
          Top = 24
          Width = 36
          Height = 13
          Caption = 'Pis (%)'
        end
        object Label15: TLabel
          Left = 8
          Top = 64
          Width = 54
          Height = 13
          Caption = 'Cofins (%)'
        end
        object Label16: TLabel
          Left = 8
          Top = 104
          Width = 31
          Height = 13
          Caption = 'IR (%)'
        end
        object Label17: TLabel
          Left = 8
          Top = 144
          Width = 93
          Height = 13
          Caption = 'Contrib.Social (%)'
        end
        object Label19: TLabel
          Left = 8
          Top = 184
          Width = 55
          Height = 13
          Caption = 'Outras (%)'
        end
        object edtPisEntrada: TCurrencyEdit
          Left = 8
          Top = 40
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 0
          ZeroEmpty = False
        end
        object edtCofinsEntrada: TCurrencyEdit
          Left = 8
          Top = 80
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 1
          ZeroEmpty = False
        end
        object edtIREntrada: TCurrencyEdit
          Left = 8
          Top = 120
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 2
          ZeroEmpty = False
        end
        object edtContSocialEntrada: TCurrencyEdit
          Left = 8
          Top = 160
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 3
          ZeroEmpty = False
        end
        object edtOutrasEntrada: TCurrencyEdit
          Left = 8
          Top = 200
          Width = 104
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 4
          ZeroEmpty = False
        end
      end
    end
    object tsNFCe: TTabSheet
      Caption = 'NFC-e'
      ImageIndex = 9
      object Label25: TLabel
        Left = 8
        Top = 8
        Width = 76
        Height = 13
        Caption = 'N'#250'mero Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label53: TLabel
        Left = 112
        Top = 8
        Width = 25
        Height = 13
        Caption = 'S'#233'rie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 8
        Top = 260
        Width = 51
        Height = 13
        Caption = 'ID Token :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 8
        Top = 300
        Width = 37
        Height = 13
        Caption = 'Token :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox20: TGroupBox
        Left = 8
        Top = 51
        Width = 400
        Height = 201
        Caption = ' Locais dos Arquivos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label37: TLabel
          Left = 15
          Top = 26
          Width = 129
          Height = 13
          Caption = 'Pasta Danfes Cancelados'
        end
        object Label50: TLabel
          Left = 15
          Top = 66
          Width = 130
          Height = 13
          Caption = 'Pasta Danfes Inutilizados'
        end
        object Label51: TLabel
          Left = 15
          Top = 106
          Width = 136
          Height = 13
          Caption = 'Pasta Danfes Transmitidos'
        end
        object Label52: TLabel
          Left = 15
          Top = 146
          Width = 102
          Height = 13
          Caption = 'Pasta Arquivos PDF'
        end
        object NFCeCancelados: TDirectoryEdit
          Left = 16
          Top = 45
          Width = 353
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object NFCeInutilizados: TDirectoryEdit
          Left = 15
          Top = 82
          Width = 353
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 1
          Text = ''
        end
        object NFCeTransmitidos: TDirectoryEdit
          Left = 15
          Top = 122
          Width = 353
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 2
          Text = ''
        end
        object NFCePDF: TDirectoryEdit
          Left = 15
          Top = 162
          Width = 353
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 3
          Text = ''
        end
      end
      object NFCeNumero: TEdit
        Left = 8
        Top = 24
        Width = 73
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 1
        OnKeyPress = cod_cliKeyPress
      end
      object NFCeSerie: TEdit
        Left = 112
        Top = 24
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 3
        TabOrder = 2
      end
      object NFCeAmbiente: TRadioGroup
        Left = 161
        Top = 4
        Width = 247
        Height = 41
        Caption = 'Ambiente de Destino'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        ParentFont = False
        TabOrder = 3
      end
      object edtIDtoken: TEdit
        Left = 8
        Top = 277
        Width = 400
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
      end
      object edtToken: TEdit
        Left = 8
        Top = 317
        Width = 400
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 5
      end
      object opTipoFrente: TRadioGroup
        Left = 8
        Top = 344
        Width = 400
        Height = 57
        Caption = ' Tipo Frente Caixa '
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Com'#233'rcio'
          'Restaurante'
          'Postos de Combust'#237'veis')
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Configura'#231#245'es Padr'#245'es'
      ImageIndex = 10
      object PageControl2: TPageControl
        Left = 3
        Top = 3
        Width = 648
        Height = 445
        ActivePage = TabSheet10
        TabOrder = 0
        object TabSheet10: TTabSheet
          Caption = 'Cadastro de produtos'
          object Label69: TLabel
            Left = 456
            Top = 75
            Width = 19
            Height = 13
            Caption = 'CST'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label70: TLabel
            Left = 456
            Top = 209
            Width = 19
            Height = 13
            Caption = 'CST'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox21: TGroupBox
            Left = 16
            Top = 150
            Width = 425
            Height = 49
            Caption = ' ICMS Fora do Estado '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object btnConsIcmsF: TsSpeedButton
              Left = 61
              Top = 20
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000502020B4B201CB1662A26F032151275000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
                0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
                052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
                00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
                27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
                12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
                23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
                26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
                04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
                28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
                090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
                23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
                4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
                1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
                69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
                22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
                527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
                28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
                0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
                28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
                020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
                14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
                20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
                0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
                26F92F14116F0000000000000000000000000000000000000000000000000000
                0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
                0625000000000000000000000000000000000000000000000000}
              ParentShowHint = False
              ShowHint = True
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object edtIcmsF: TEdit
              Left = 7
              Top = 20
              Width = 49
              Height = 21
              Hint = 'Pressione F2 para Consultar Cliente'
              Alignment = taRightJustify
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = cod_cliEnter
              OnExit = edtIcmsFExit
              OnKeyPress = cod_cliKeyPress
            end
            object edtDescIcmsF: TEdit
              Left = 88
              Top = 20
              Width = 329
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox22: TGroupBox
            Left = 16
            Top = 71
            Width = 425
            Height = 49
            Caption = ' CFOP Dentro do Estado '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object btnConsCfopD: TsSpeedButton
              Left = 61
              Top = 20
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000502020B4B201CB1662A26F032151275000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
                0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
                052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
                00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
                27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
                12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
                23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
                26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
                04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
                28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
                090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
                23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
                4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
                1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
                69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
                22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
                527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
                28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
                0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
                28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
                020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
                14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
                20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
                0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
                26F92F14116F0000000000000000000000000000000000000000000000000000
                0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
                0625000000000000000000000000000000000000000000000000}
              ParentShowHint = False
              ShowHint = True
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object edtCfopD: TEdit
              Left = 8
              Top = 20
              Width = 49
              Height = 21
              Hint = 'Pressione F2 para Consultar Cliente'
              Alignment = taRightJustify
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = cod_cliEnter
              OnExit = edtCfopDExit
              OnKeyPress = cod_cliKeyPress
            end
            object edtDescCfopD: TEdit
              Left = 90
              Top = 20
              Width = 329
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox23: TGroupBox
            Left = 16
            Top = 16
            Width = 425
            Height = 49
            Caption = ' ICMS Dentro do estado '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object btnConsIcmsD: TsSpeedButton
              Left = 61
              Top = 20
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000502020B4B201CB1662A26F032151275000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
                0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
                052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
                00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
                27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
                12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
                23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
                26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
                04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
                28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
                090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
                23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
                4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
                1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
                69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
                22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
                527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
                28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
                0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
                28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
                020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
                14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
                20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
                0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
                26F92F14116F0000000000000000000000000000000000000000000000000000
                0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
                0625000000000000000000000000000000000000000000000000}
              ParentShowHint = False
              ShowHint = True
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object edtIcmsD: TEdit
              Left = 8
              Top = 20
              Width = 49
              Height = 21
              Hint = 'Pressione F2 para Consultar Cliente'
              Alignment = taRightJustify
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = cod_cliEnter
              OnExit = edtIcmsDExit
              OnKeyPress = cod_cliKeyPress
            end
            object edtDescIcmsD: TEdit
              Left = 88
              Top = 20
              Width = 329
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GroupBox24: TGroupBox
            Left = 16
            Top = 205
            Width = 425
            Height = 49
            Caption = ' CFOP Fora do Estado '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object btnConsCfopF: TsSpeedButton
              Left = 61
              Top = 20
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000502020B4B201CB1662A26F032151275000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
                0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
                052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
                00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
                27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
                12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
                23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
                26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
                04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
                28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
                090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
                23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
                4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
                1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
                69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
                22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
                527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
                28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
                0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
                28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
                020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
                14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
                20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
                0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
                26F92F14116F0000000000000000000000000000000000000000000000000000
                0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
                0625000000000000000000000000000000000000000000000000}
              ParentShowHint = False
              ShowHint = True
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object edtCfopF: TEdit
              Left = 8
              Top = 20
              Width = 49
              Height = 21
              Hint = 'Pressione F2 para Consultar Cliente'
              Alignment = taRightJustify
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = cod_cliEnter
              OnExit = edtCfopFExit
              OnKeyPress = cod_cliKeyPress
            end
            object edtDescCfopF: TEdit
              Left = 88
              Top = 20
              Width = 329
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object edtCstD: TEdit
            Left = 456
            Top = 91
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Color = clSilver
            TabOrder = 2
            OnKeyPress = EdtCarenciaKeyPress
          end
          object edtCstF: TEdit
            Left = 456
            Top = 228
            Width = 73
            Height = 21
            Alignment = taRightJustify
            Color = clSilver
            TabOrder = 5
            OnKeyPress = EdtCarenciaKeyPress
          end
        end
      end
    end
    object tsRestaurante: TTabSheet
      Caption = 'Restaurante'
      ImageIndex = 11
      object chkRest_comissao: TCheckBox
        Left = 12
        Top = 11
        Width = 280
        Height = 18
        Caption = 'Restaurante Utiliza Comiss'#227'o?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = chkRest_comissaoClick
      end
      object pnlRestComissoes: TPanel
        Left = 12
        Top = 35
        Width = 445
        Height = 118
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox25: TGroupBox
          Left = 8
          Top = 4
          Width = 201
          Height = 49
          Caption = ' Comiss'#227'o % '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object edtRestComissao: TCurrencyEdit
            Left = 8
            Top = 16
            Width = 185
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clSilver
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 0
            ZeroEmpty = False
          end
        end
        object GroupBox26: TGroupBox
          Left = 8
          Top = 59
          Width = 425
          Height = 49
          Caption = ' Servi'#231'o Utilizado para Comiss'#227'o : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnRest_conspro: TsSpeedButton
            Left = 61
            Top = 20
            Width = 23
            Height = 21
            Hint = 'Consultar Cliente'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000502020B4B201CB1662A26F032151275000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
              0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
              052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
              00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
              27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
              12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
              23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
              26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
              04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
              28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
              090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
              23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
              4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
              1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
              69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
              22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
              527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
              28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
              0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
              28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
              020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
              14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
              20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
              0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
              26F92F14116F0000000000000000000000000000000000000000000000000000
              0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
              0625000000000000000000000000000000000000000000000000}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnRest_consproClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object edtRest_codpro: TEdit
            Left = 7
            Top = 20
            Width = 49
            Height = 21
            Hint = 'Pressione F2 para Consultar Cliente'
            Alignment = taRightJustify
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnEnter = edtRest_codproEnter
            OnExit = edtRest_codproExit
            OnKeyDown = edtRest_codproKeyDown
            OnKeyPress = edtRest_codproKeyPress
          end
          object edtRest_descpro: TEdit
            Left = 88
            Top = 20
            Width = 329
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object GroupBox27: TGroupBox
        Left = 12
        Top = 149
        Width = 621
        Height = 284
        Caption = 'Restaurante Modul Touch : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label71: TLabel
          Left = 16
          Top = 46
          Width = 152
          Height = 13
          Caption = 'Tempo Restante Para Atrazo :'
        end
        object Label72: TLabel
          Left = 16
          Top = 94
          Width = 148
          Height = 13
          Caption = 'Tempo Restante Para Piscar :'
        end
        object edtChkPiscar: TCheckBox
          Left = 16
          Top = 24
          Width = 289
          Height = 17
          Caption = 'Piscar Quadros pedidos ap'#243's segundo tempo'
          TabOrder = 0
        end
        object edtTempoAtrazo: TAdvDateTimePicker
          Left = 16
          Top = 65
          Width = 172
          Height = 21
          Date = 42058.657210648150000000
          Format = ''
          Time = 42058.657210648150000000
          DoubleBuffered = True
          Kind = dkTime
          ParentDoubleBuffered = False
          TabOrder = 1
          TabStop = True
          BorderStyle = bsSingle
          Ctl3D = True
          DateTime = 42058.657210648150000000
          Version = '1.2.2.2'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Segoe UI'
          LabelFont.Style = []
        end
        object edtTempoPiscar: TAdvDateTimePicker
          Left = 16
          Top = 113
          Width = 172
          Height = 21
          Date = 42058.657210648150000000
          Format = ''
          Time = 42058.657210648150000000
          DoubleBuffered = True
          Kind = dkTime
          ParentDoubleBuffered = False
          TabOrder = 2
          TabStop = True
          BorderStyle = bsSingle
          Ctl3D = True
          DateTime = 42058.657210648150000000
          Version = '1.2.2.2'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Segoe UI'
          LabelFont.Style = []
        end
        object GroupBox28: TGroupBox
          Left = 16
          Top = 140
          Width = 172
          Height = 99
          Caption = ' Colora'#231#227'o Itens '
          TabOrder = 3
          object Label73: TLabel
            Left = 11
            Top = 23
            Width = 53
            Height = 13
            Caption = 'Cor Item  :'
          end
          object Label74: TLabel
            Left = 11
            Top = 48
            Width = 53
            Height = 13
            Caption = 'Atrazado :'
          end
          object Label75: TLabel
            Left = 11
            Top = 73
            Width = 51
            Height = 13
            Caption = 'Pronto    :'
          end
          object edt_cor_it: TRzColorEdit
            Left = 80
            Top = 20
            Width = 44
            Height = 21
            TabOrder = 0
          end
          object edt_cor_ia: TRzColorEdit
            Left = 80
            Top = 45
            Width = 44
            Height = 21
            TabOrder = 1
          end
          object edt_cor_ip: TRzColorEdit
            Left = 80
            Top = 70
            Width = 44
            Height = 21
            TabOrder = 2
          end
        end
        object GroupBox29: TGroupBox
          Left = 208
          Top = 140
          Width = 172
          Height = 99
          Caption = ' Colora'#231#227'o Pedidos '
          TabOrder = 4
          object Label76: TLabel
            Left = 11
            Top = 23
            Width = 52
            Height = 13
            Caption = 'Pedido    :'
          end
          object Label77: TLabel
            Left = 11
            Top = 48
            Width = 53
            Height = 13
            Caption = 'Atrazado :'
          end
          object Label78: TLabel
            Left = 11
            Top = 73
            Width = 51
            Height = 13
            Caption = 'Pronto    :'
          end
          object edt_cor_pt: TRzColorEdit
            Left = 80
            Top = 20
            Width = 44
            Height = 21
            TabOrder = 0
          end
          object edt_cor_pa: TRzColorEdit
            Left = 80
            Top = 45
            Width = 44
            Height = 21
            TabOrder = 1
          end
          object edt_cor_pp: TRzColorEdit
            Left = 80
            Top = 70
            Width = 44
            Height = 21
            TabOrder = 2
          end
        end
      end
    end
    object tsParametros: TTabSheet
      Caption = 'Parametros'
      ImageIndex = 12
      OnHide = tsParametrosHide
      OnShow = tsParametrosShow
      object cxParametros: TcxGrid
        Left = 0
        Top = 30
        Width = 654
        Height = 421
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object cxParametrosDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnEditChanged = cxParametrosDBTableView1EditChanged
          OnEditKeyDown = cxParametrosDBTableView1EditKeyDown
          DataController.DataSource = dsVarParametros
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsList = False
          Filtering.ColumnMRUItemsList = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Styles.Content = cxstylContetParametros
          Styles.Group = cxstylGrupoParametros
          Styles.Header = cxstylHeaderParametros
          object cxParametrosDBTableView1MODULO: TcxGridDBColumn
            DataBinding.FieldName = 'MODULO'
            Visible = False
            GroupIndex = 0
            Options.Editing = False
          end
          object cxParametrosDBTableView1VARIAVEL: TcxGridDBColumn
            Caption = 'Parametro'
            DataBinding.FieldName = 'VARIAVEL'
            Options.Editing = False
            Styles.Content = cxstylvarColuna
            Width = 250
          end
          object cxParametrosDBTableView1VALOR: TcxGridDBColumn
            Caption = 'Valor'
            DataBinding.FieldName = 'VALOR'
            OnGetPropertiesForEdit = cxParametrosDBTableView1VALORGetPropertiesForEdit
            Styles.Content = cxstylValorParametros
            Width = 150
          end
          object cxParametrosDBTableView1DESCRICAO_VARIAVEL: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRICAO_VARIAVEL'
            Options.Editing = False
            Styles.Content = cxstylDemaisParametros
            Width = 500
          end
          object cxParametrosDBTableView1VALORES_POSSIVEIS: TcxGridDBColumn
            Caption = 'Valores Poss'#237'veis'
            DataBinding.FieldName = 'VALORES_POSSIVEIS'
            Options.Editing = False
            Styles.Content = cxstylDemaisParametros
            Width = 250
          end
          object cxParametrosDBTableView1DESCRICAO_MODULO: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRICAO_MODULO'
            Options.Editing = False
            Styles.Content = cxstylDemaisParametros
            Width = 250
          end
        end
        object cxParametrosDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsVarParametros
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxParametrosDBTableView2COD_EMP: TcxGridDBColumn
            DataBinding.FieldName = 'COD_EMP'
          end
          object cxParametrosDBTableView2MODULO: TcxGridDBColumn
            DataBinding.FieldName = 'MODULO'
          end
          object cxParametrosDBTableView2VARIAVEL: TcxGridDBColumn
            DataBinding.FieldName = 'VARIAVEL'
          end
          object cxParametrosDBTableView2DESCRICAO_MODULO: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRICAO_MODULO'
          end
          object cxParametrosDBTableView2DESCRICAO_VARIAVEL: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRICAO_VARIAVEL'
          end
          object cxParametrosDBTableView2TIPO: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO'
          end
          object cxParametrosDBTableView2VALORES_POSSIVEIS: TcxGridDBColumn
            DataBinding.FieldName = 'VALORES_POSSIVEIS'
          end
          object cxParametrosDBTableView2VALOR: TcxGridDBColumn
            DataBinding.FieldName = 'VALOR'
          end
        end
        object cxParametrosLevel1: TcxGridLevel
          GridView = cxParametrosDBTableView1
        end
      end
      object pnlSearchParametros: TPanel
        Left = 0
        Top = 0
        Width = 654
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object cxLabel1: TcxLabel
          Left = 0
          Top = 0
          Align = alLeft
          Caption = 'Filtro de Parametros : '
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 58
          AnchorY = 15
        end
        object edtSearchParametros: TEdit
          AlignWithMargins = True
          Left = 119
          Top = 3
          Width = 322
          Height = 24
          Align = alLeft
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'EDTSEARCHPARAMETROS'
          OnEnter = edtSearchParametrosEnter
          OnExit = edtSearchParametrosExit
          OnKeyPress = edtSearchParametrosKeyPress
          ExplicitHeight = 25
        end
      end
    end
    object TabSheet17: TTabSheet
      Caption = 'Ordem de Servi'#231'o'
      ImageIndex = 13
      object Label86: TLabel
        Left = 10
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Instru'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtobsOS: TMemo
        Left = 7
        Top = 32
        Width = 641
        Height = 228
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet18: TTabSheet
      Caption = 'Menu'
      ImageIndex = 14
      ExplicitLeft = 980
      ExplicitTop = 186
      object ckOS: TCheckBox
        Left = 24
        Top = 16
        Width = 129
        Height = 17
        Caption = 'Ordem de Servi'#231'o'
        TabOrder = 0
      end
      object ckNFSE: TCheckBox
        Left = 24
        Top = 39
        Width = 209
        Height = 17
        Caption = 'Nota Fiscal Servi'#231'o Eletr'#244'nica'
        TabOrder = 1
      end
      object ckSNGPC: TCheckBox
        Left = 24
        Top = 62
        Width = 129
        Height = 17
        Caption = 'SNGPC'
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 497
    Width = 662
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    Color = 16710131
    TabOrder = 1
    object BtnOk1: TButton
      Left = 244
      Top = 6
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOk1Click
    end
    object BtnCanelar1: TButton
      Left = 359
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCanelar1Click
    end
  end
  object QBuscaPara: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS'
      'WHERE COD_EMP = :CODEMP')
    Left = 480
    Top = 48
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object IBSQLPara: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    Left = 552
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*|Arquivos Relat'#243'rios (*.fr3)|*.fr3'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Selecione a NFe'
    Left = 616
    Top = 48
  end
  object QVarParametros: TFDQuery
    AfterPost = QVarParametrosAfterPost
    Connection = DM.IBDatabase
    Transaction = TRVarParametros
    UpdateObject = upVarParametros
    SQL.Strings = (
      
        'select * from VAR_PARAMETROS WHERE COD_EMP=:COD_EMP AND VARIAVEL' +
        ' LIKE :VAR')
    Left = 344
    Top = 112
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'VAR'
        ParamType = ptInput
      end>
    object QVarParametrosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVarParametrosMODULO: TStringField
      FieldName = 'MODULO'
      Origin = 'MODULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 60
    end
    object QVarParametrosVARIAVEL: TStringField
      FieldName = 'VARIAVEL'
      Origin = 'VARIAVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object QVarParametrosDESCRICAO_MODULO: TStringField
      FieldName = 'DESCRICAO_MODULO'
      Origin = 'DESCRICAO_MODULO'
      Size = 255
    end
    object QVarParametrosDESCRICAO_VARIAVEL: TStringField
      FieldName = 'DESCRICAO_VARIAVEL'
      Origin = 'DESCRICAO_VARIAVEL'
      Size = 255
    end
    object QVarParametrosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object QVarParametrosVALORES_POSSIVEIS: TMemoField
      FieldName = 'VALORES_POSSIVEIS'
      Origin = 'VALORES_POSSIVEIS'
      BlobType = ftMemo
    end
    object QVarParametrosVALOR: TStringField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Size = 200
    end
  end
  object TRVarParametros: TFDTransaction
    Connection = DM.IBDatabase
    Left = 448
    Top = 112
  end
  object dsVarParametros: TDataSource
    DataSet = QVarParametros
    Left = 600
    Top = 184
  end
  object upVarParametros: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO VAR_PARAMETROS'
      '(VALOR)'
      'VALUES (:NEW_VALOR)'
      'RETURNING VALOR')
    ModifySQL.Strings = (
      'UPDATE VAR_PARAMETROS'
      'SET VALOR = :NEW_VALOR'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND MODULO = :OLD_MODULO AND VARIAV' +
        'EL = :OLD_VARIAVEL'
      'RETURNING VALOR')
    DeleteSQL.Strings = (
      'DELETE FROM VAR_PARAMETROS'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND MODULO = :OLD_MODULO AND VARIAV' +
        'EL = :OLD_VARIAVEL')
    FetchRowSQL.Strings = (
      
        'SELECT COD_EMP, MODULO, VARIAVEL, DESCRICAO_MODULO, DESCRICAO_VA' +
        'RIAVEL, '
      '  TIPO, VALORES_POSSIVEIS, VALOR'
      'FROM VAR_PARAMETROS'
      
        'WHERE COD_EMP = :COD_EMP AND MODULO = :MODULO AND VARIAVEL = :VA' +
        'RIAVEL')
    Left = 296
    Top = 136
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxstylContetParametros: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxstylvarColuna: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxstylHeaderParametros: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxstylValorParametros: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlue
    end
    object cxstylDemaisParametros: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
    end
    object cxstylGrupoParametros: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 191
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = 191
    end
  end
end
