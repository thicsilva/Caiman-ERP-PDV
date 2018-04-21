object FrmRelEstoque: TFrmRelEstoque
  Left = 470
  Top = 119
  ActiveControl = GBLocal
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Estoque'
  ClientHeight = 547
  ClientWidth = 461
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 489
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GBSecaoSetor: TGroupBox
      Left = 8
      Top = 88
      Width = 449
      Height = 225
      TabOrder = 1
      object PanelSecao: TPanel
        Left = 2
        Top = 62
        Width = 431
        Height = 153
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 1
        object BtnConsSub: TsSpeedButton
          Left = 60
          Top = 88
          Width = 23
          Height = 21
          Hint = 'Consultar'
          Flat = True
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
          OnClick = BtnConsSubClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtnConsGrupo: TsSpeedButton
          Left = 60
          Top = 61
          Width = 23
          Height = 21
          Hint = 'Consultar'
          Flat = True
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
          OnClick = BtnConsGrupoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtnConsSec: TsSpeedButton
          Left = 61
          Top = 34
          Width = 23
          Height = 21
          Hint = 'Consultar'
          Flat = True
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
          OnClick = BtnConsSecClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label30: TLabel
          Left = 2
          Top = 2
          Width = 427
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Se'#231#227'o/Grupo/SubGrupo'
          Color = 12615680
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 126
        end
        object CheckSecao: TCheckBox
          Left = 8
          Top = 112
          Width = 225
          Height = 17
          Caption = 'Todas as Se'#231#245'es'
          TabOrder = 3
          OnClick = CheckSecaoClick
        end
        object EdtCodSec: TEdit
          Left = 8
          Top = 34
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar'
          Alignment = taRightJustify
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodSecEnter
          OnExit = EdtCodSecExit
          OnKeyDown = EdtCodSecKeyDown
          OnKeyPress = EdtCodSecKeyPress
        end
        object EdtCodGrupo: TEdit
          Left = 8
          Top = 61
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar '
          Alignment = taRightJustify
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnEnter = EdtCodGrupoEnter
          OnExit = EdtCodGrupoExit
          OnKeyDown = EdtCodGrupoKeyDown
          OnKeyPress = EdtCodSecKeyPress
        end
        object EdtCodSub: TEdit
          Left = 8
          Top = 88
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar '
          Alignment = taRightJustify
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnEnter = EdtCodSubEnter
          OnExit = EdtCodSubExit
          OnKeyPress = EdtCodSecKeyPress
        end
        object EdtNomeSec: TEdit
          Left = 88
          Top = 34
          Width = 321
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object EdtNomeGrupo: TEdit
          Left = 87
          Top = 61
          Width = 322
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
          TabOrder = 5
        end
        object EdtNomeSub: TEdit
          Left = 87
          Top = 88
          Width = 322
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
          TabOrder = 6
        end
      end
      object PanelSetor: TPanel
        Left = 2
        Top = 62
        Width = 431
        Height = 153
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 2
        object LabelTitulo: TLabel
          Left = 2
          Top = 2
          Width = 427
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Setores de Estoque'
          Color = 12615680
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 99
        end
        object BtnCons: TsSpeedButton
          Left = 61
          Top = 34
          Width = 23
          Height = 21
          Hint = 'Consultar'
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
          OnClick = BtnConsClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCod: TEdit
          Left = 8
          Top = 34
          Width = 49
          Height = 21
          Hint = 'Pressione F2 para Consultar'
          Alignment = taRightJustify
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodEnter
          OnExit = EdtCodExit
          OnKeyDown = EdtCodKeyDown
          OnKeyPress = EdtCodSecKeyPress
        end
        object Check: TCheckBox
          Left = 8
          Top = 64
          Width = 225
          Height = 17
          Caption = 'Todos os Setores'
          TabOrder = 1
          OnClick = CheckClick
        end
        object EdtNome: TEdit
          Left = 88
          Top = 34
          Width = 321
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
          TabOrder = 2
        end
      end
      object RDGSecaoSetorFab: TRadioGroup
        Left = 2
        Top = 15
        Width = 445
        Height = 41
        Align = alTop
        Columns = 3
        Items.Strings = (
          'Se'#231#227'o/Grupo/SubGrupo'
          'Setores de Estoque'
          'Fabricante')
        TabOrder = 0
        OnClick = RDGSecaoSetorFabClick
      end
    end
    object Rdg: TRadioGroup
      Left = 8
      Top = 330
      Width = 449
      Height = 47
      Caption = 'Ordem de Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 2
    end
    object Rdg1: TRadioGroup
      Left = 8
      Top = 386
      Width = 449
      Height = 56
      Columns = 2
      Items.Strings = (
        'Todos'
        'S'#243' zerados'
        'S'#243' negativos'
        'S'#243' com estoque')
      TabOrder = 3
    end
    object CheckPrecoVenda: TCheckBox
      Left = 200
      Top = 456
      Width = 121
      Height = 17
      Caption = 'Incluir Pre'#231'o Venda'
      TabOrder = 5
      OnClick = CheckPrecoVendaClick
    end
    object CheckCustoVenda: TCheckBox
      Left = 8
      Top = 456
      Width = 185
      Height = 17
      Caption = 'Incluir Pre'#231'o de Custo e Venda'
      TabOrder = 4
      OnClick = CheckCustoVendaClick
    end
    object GBLocal: TGroupBox
      Left = 8
      Top = 8
      Width = 449
      Height = 49
      Caption = 'Local do Estoque'
      TabOrder = 0
      object BtnConsLocal: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar'
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
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodLocalEnter
        OnExit = EdtCodLocalExit
        OnKeyDown = EdtCodLocalKeyDown
        OnKeyPress = EdtCodSecKeyPress
      end
      object EdtNomeLocal: TEdit
        Left = 88
        Top = 18
        Width = 353
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
    object CheckLocal: TCheckBox
      Left = 8
      Top = 59
      Width = 425
      Height = 17
      Caption = 'Todos os Locais de Estoque'
      TabOrder = 7
      OnClick = CheckLocalClick
    end
    object CheckValidade: TCheckBox
      Left = 336
      Top = 456
      Width = 145
      Height = 17
      Caption = 'Incluir Data Validade'
      TabOrder = 6
      OnClick = CheckPrecoVendaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 489
    Width = 461
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 95
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 203
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 311
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 528
    Width = 461
    Height = 19
    Panels = <>
  end
  object QRelEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.NOME_PRO, P.PRECO_CUSTO, P.VALOR_PRO, P.DATA' +
        '_VALIDADE, U.DESCRICAO,'
      
        '(SELECT SUM(ESTOQUE) FROM ESTOQUE WHERE COD_PRO = P.COD_PRO) EST' +
        'OQUE'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)')
    Left = 360
    Top = 24
    object QRelEstoqueCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QRelEstoqueNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelEstoquePRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRODUTO.PRECO_CUSTO'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QRelEstoqueVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QRelEstoqueESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QRelEstoqueDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'PRODUTO.DATA_VALIDADE'
    end
  end
end
