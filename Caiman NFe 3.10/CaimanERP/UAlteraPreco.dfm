object FrmAlteraPreco: TFrmAlteraPreco
  Left = 301
  Top = 91
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Altera'#231#227'o de Pre'#231'o'
  ClientHeight = 550
  ClientWidth = 916
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
    Width = 916
    Height = 531
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid: TDBGrid
      Left = 2
      Top = 105
      Width = 912
      Height = 424
      Align = alClient
      Color = clSilver
      DataSource = DSQConsPro
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = DBGridDblClick
      OnEnter = DBGridEnter
      OnExit = DBGridExit
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODPRO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.'
          Width = 58
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMEPRO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 287
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DIASVALIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Val.'
          Width = 34
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Und.'
          Width = 33
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ESTOQUEMIN'
          Title.Alignment = taCenter
          Title.Caption = 'Est.M'#237'nimo'
          Width = 73
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Estoque'
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECOPROGRAMADO'
          Title.Alignment = taCenter
          Title.Caption = 'Off Pre'#231'o'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECOPRAZO'
          Title.Alignment = taCenter
          Title.Caption = 'A PRAZO'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECOPROGRAMADOPRAZO'
          Title.Alignment = taCenter
          Title.Caption = 'Off Prazo'
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PROMOCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Promo'#231#227'o'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECOCUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Custo'
          Width = 72
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'MARGEMLUCRO'
          Title.Alignment = taCenter
          Title.Caption = 'M.Lucro(%)'
          Width = 71
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERCLUCROLIQ'
          Title.Alignment = taCenter
          Title.Caption = 'Lucro Liq(%)'
          Width = 79
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMESECAO'
          Title.Alignment = taCenter
          Title.Caption = 'Se'#231#227'o'
          Width = 242
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMEGRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'Grupo'
          Width = 260
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMESUBGRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'Sub-Grupo'
          Width = 255
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMEALIQUOTA'
          Title.Alignment = taCenter
          Title.Caption = 'Grupo ICMS'
          Width = 189
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_PIS_COFINS'
          Title.Alignment = taCenter
          Title.Caption = 'PIS/COFINS'
          Width = 68
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PIS'
          Title.Alignment = taCenter
          Title.Caption = 'PIS(%)'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COFINS'
          Title.Alignment = taCenter
          Title.Caption = 'COFINS(%)'
          Width = 58
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'IR'
          Title.Alignment = taCenter
          Title.Caption = 'IR(%)'
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CSLL'
          Title.Alignment = taCenter
          Title.Caption = 'C.SOCIAL(%)'
          Width = 66
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESPESAS'
          Title.Alignment = taCenter
          Title.Caption = 'Desp.(%)'
          Width = 63
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAVALIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Validade'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOMESETORESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Setor Estoque'
          Visible = True
        end>
    end
    object PanelEstoque: TPanel
      Left = 640
      Top = 427
      Width = 257
      Height = 73
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 3
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 251
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Estoque M'#237'nimo'
        ExplicitWidth = 84
      end
      object EdtEstMin: TCurrencyEdit
        Left = 24
        Top = 32
        Width = 113
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 0
        ZeroEmpty = False
        OnKeyPress = ComboConsKeyPress
      end
      object BtnConfirma: TButton
        Left = 168
        Top = 24
        Width = 75
        Height = 20
        Caption = '&Confirma'
        TabOrder = 1
        OnClick = BtnConfirmaClick
      end
      object BtnCancela: TButton
        Left = 168
        Top = 48
        Width = 75
        Height = 20
        Caption = '&Cancela'
        TabOrder = 2
        OnClick = BtnCancelaClick
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 912
      Height = 103
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 2
      object GroupBox1: TGroupBox
        Left = 8
        Top = 6
        Width = 249
        Height = 49
        Caption = 'Consultar por'
        TabOrder = 0
        object ComboCons: TComboBox
          Left = 8
          Top = 16
          Width = 233
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboConsChange
          OnKeyPress = ComboConsKeyPress
          Items.Strings = (
            'PALAVRA CHAVE'
            'NOME'
            'C'#211'D.BARRA'
            'COD.INTERNO'
            'SE'#199#195'O'
            'FABRICANTE'
            'GRUPO ICMS'
            'SETOR DE ESTOQUE')
        end
      end
      object RdgAtivo: TRadioGroup
        Left = 8
        Top = 56
        Width = 249
        Height = 41
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Ativos'
          'Destivados'
          'Todos')
        TabOrder = 1
      end
      object GB2: TGroupBox
        Left = 264
        Top = 6
        Width = 531
        Height = 92
        Caption = 'Consultar por'
        TabOrder = 2
        object BtnConsSub: TsSpeedButton
          Left = 68
          Top = 64
          Width = 23
          Height = 21
          Hint = 'Consultar Produto'
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
          Left = 68
          Top = 40
          Width = 23
          Height = 21
          Hint = 'Consultar Produto'
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
        object BtnCons: TsSpeedButton
          Left = 68
          Top = 16
          Width = 23
          Height = 21
          Hint = 'Consultar Produto'
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
          OnClick = BtnConsClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCons: TEdit
          Left = 8
          Top = 16
          Width = 409
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = ComboConsKeyPress
        end
        object EdtCodGrupo: TEdit
          Left = 8
          Top = 40
          Width = 57
          Height = 21
          Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
          Alignment = taRightJustify
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnEnter = EdtCodGrupoEnter
          OnExit = EdtCodGrupoExit
          OnKeyDown = EdtCodGrupoKeyDown
          OnKeyPress = EdtCodGrupoKeyPress
        end
        object EdtCodSub: TEdit
          Left = 8
          Top = 64
          Width = 57
          Height = 21
          Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
          Alignment = taRightJustify
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnEnter = EdtCodSubEnter
          OnExit = EdtCodSubExit
          OnKeyDown = EdtCodSubKeyDown
          OnKeyPress = EdtCodGrupoKeyPress
        end
        object EdtNomeGrupo: TEdit
          Left = 95
          Top = 40
          Width = 429
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
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
          TabOrder = 4
        end
        object EdtNomeSub: TEdit
          Left = 95
          Top = 64
          Width = 429
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
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
        object EdtCod: TEdit
          Left = 8
          Top = 16
          Width = 57
          Height = 21
          Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
          Alignment = taRightJustify
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnEnter = EdtCodEnter
          OnExit = EdtCodExit
          OnKeyDown = EdtCodKeyDown
          OnKeyPress = EdtCodGrupoKeyPress
        end
        object EdtNome: TEdit
          Left = 95
          Top = 16
          Width = 429
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
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
      object BtnOk: TButton
        Left = 800
        Top = 20
        Width = 65
        Height = 23
        Caption = '&OK'
        TabOrder = 3
        OnClick = BtnOkClick
        OnKeyPress = ComboConsKeyPress
      end
      object BtnSair: TButton
        Left = 800
        Top = 52
        Width = 65
        Height = 23
        Caption = '&Sair'
        TabOrder = 4
        OnClick = BtnSairClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 531
    Width = 916
    Height = 19
    Panels = <
      item
        Text = '[ENTER] Forma'#231#227'o Pre'#231'o'
        Width = 135
      end
      item
        Text = '[F2] Consultar'
        Width = 90
      end
      item
        Text = '[F3] '#218'ltima Compra/Venda'
        Width = 150
      end
      item
        Text = '[F7] Alterar Se'#231#227'o/Setor Estoque'
        Width = 200
      end
      item
        Text = '[F8] Impostos'
        Width = 110
      end
      item
        Text = '[F9] Composi'#231#227'o'
        Width = 110
      end
      item
        Text = '[F11] Est.M'#237'nimo'
        Width = 115
      end
      item
        Text = '[F12] Ativar/Desativar'
        Width = 120
      end>
  end
  object QConsProd: TFDQuery
    OnCalcFields = QConsProdCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRLocal
    SQL.Strings = (
      'SELECT *'
      'FROM SP_CONSUTA_PRODUTO (:SCRIPT, :DATAINI, :DATAFIN, :CODEMP)')
    Left = 304
    Top = 216
    ParamData = <
      item
        Name = 'SCRIPT'
      end
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end
      item
        Name = 'CODEMP'
      end>
    object QConsProdCODPRO: TIntegerField
      FieldName = 'CODPRO'
      Origin = 'SP_CONSUTA_PRODUTO.CODPRO'
    end
    object QConsProdNOMEPRO: TStringField
      FieldName = 'NOMEPRO'
      Origin = 'SP_CONSUTA_PRODUTO.NOMEPRO'
      Size = 80
    end
    object QConsProdATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'SP_CONSUTA_PRODUTO.ATIVO'
      FixedChar = True
      Size = 1
    end
    object QConsProdVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'SP_CONSUTA_PRODUTO.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdPROMOCAO: TBCDField
      FieldName = 'PROMOCAO'
      Origin = 'SP_CONSUTA_PRODUTO.PROMOCAO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdMARGEMLUCRO: TBCDField
      FieldName = 'MARGEMLUCRO'
      Origin = 'SP_CONSUTA_PRODUTO.MARGEMLUCRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdCODSEC: TIntegerField
      FieldName = 'CODSEC'
      Origin = 'SP_CONSUTA_PRODUTO.CODSEC'
    end
    object QConsProdCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Origin = 'SP_CONSUTA_PRODUTO.CODGRUPO'
    end
    object QConsProdSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
      Origin = 'SP_CONSUTA_PRODUTO.SUBGRUPO'
    end
    object QConsProdDIASVALIDADE: TIntegerField
      FieldName = 'DIASVALIDADE'
      Origin = 'SP_CONSUTA_PRODUTO.DIASVALIDADE'
    end
    object QConsProdISENTOPIS: TStringField
      FieldName = 'ISENTOPIS'
      Origin = 'SP_CONSUTA_PRODUTO.ISENTOPIS'
      FixedChar = True
      Size = 1
    end
    object QConsProdPIS: TBCDField
      FieldName = 'PIS'
      Origin = 'SP_CONSUTA_PRODUTO.PIS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdCOFINS: TBCDField
      FieldName = 'COFINS'
      Origin = 'SP_CONSUTA_PRODUTO.COFINS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdIR: TBCDField
      FieldName = 'IR'
      Origin = 'SP_CONSUTA_PRODUTO.IR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdCSLL: TBCDField
      FieldName = 'CSLL'
      Origin = 'SP_CONSUTA_PRODUTO.CSLL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdDESPESAS: TBCDField
      FieldName = 'DESPESAS'
      Origin = 'SP_CONSUTA_PRODUTO.DESPESAS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdPRECOPROGRAMADO: TBCDField
      FieldName = 'PRECOPROGRAMADO'
      Origin = 'SP_CONSUTA_PRODUTO.PRECOPROGRAMADO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdCREDITOICMS: TBCDField
      FieldName = 'CREDITOICMS'
      Origin = 'SP_CONSUTA_PRODUTO.CREDITOICMS'
      DisplayFormat = ',#0.000'
      Precision = 18
    end
    object QConsProdNOMEALIQUOTA: TStringField
      FieldName = 'NOMEALIQUOTA'
      Origin = 'SP_CONSUTA_PRODUTO.NOMEALIQUOTA'
      Size = 50
    end
    object QConsProdALIQUOTAGRP: TBCDField
      FieldName = 'ALIQUOTAGRP'
      Origin = 'SP_CONSUTA_PRODUTO.ALIQUOTAGRP'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdPERCLUCROLIQ: TBCDField
      FieldName = 'PERCLUCROLIQ'
      Origin = 'SP_CONSUTA_PRODUTO.PERCLUCROLIQ'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdNOMESECAO: TStringField
      FieldName = 'NOMESECAO'
      Origin = 'SP_CONSUTA_PRODUTO.NOMESECAO'
      Size = 50
    end
    object QConsProdNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      Origin = 'SP_CONSUTA_PRODUTO.NOMEGRUPO'
      Size = 80
    end
    object QConsProdNOMESUBGRUPO: TStringField
      FieldName = 'NOMESUBGRUPO'
      Origin = 'SP_CONSUTA_PRODUTO.NOMESUBGRUPO'
      Size = 80
    end
    object QConsProdESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      Origin = 'SP_CONSUTA_PRODUTO.ESTOQUE'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QConsProdESTOQUEMIN: TBCDField
      FieldName = 'ESTOQUEMIN'
      Origin = 'SP_CONSUTA_PRODUTO.ESTOQUEMIN'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QConsProdPRECOCUSTO: TBCDField
      FieldName = 'PRECOCUSTO'
      Origin = 'SP_CONSUTA_PRODUTO.PRECOCUSTO'
      DisplayFormat = ',#0.0000'
      Precision = 18
    end
    object QConsProdCALC_PIS_COFINS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_PIS_COFINS'
      Size = 30
      Calculated = True
    end
    object QConsProdPRECOPRAZO: TBCDField
      FieldName = 'PRECOPRAZO'
      Origin = 'SP_CONSUTA_PRODUTO.PRECOPRAZO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'SP_CONSUTA_PRODUTO.UNIDADE'
      Size = 10
    end
    object QConsProdPRECOPROGRAMADOPRAZO: TBCDField
      FieldName = 'PRECOPROGRAMADOPRAZO'
      Origin = 'SP_CONSUTA_PRODUTO.PRECOPROGRAMADOPRAZO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsProdNOMESETORESTOQUE: TStringField
      FieldName = 'NOMESETORESTOQUE'
      Origin = 'SP_CONSUTA_PRODUTO.NOMESETORESTOQUE'
      Size = 60
    end
    object QConsProdDATAVALIDADE: TDateField
      FieldName = 'DATAVALIDADE'
      Origin = 'SP_CONSUTA_PRODUTO.DATAVALIDADE'
    end
    object QConsProdCODIGOSETORESTOQUE: TIntegerField
      FieldName = 'CODIGOSETORESTOQUE'
      Origin = 'SP_CONSUTA_PRODUTO.CODIGOSETORESTOQUE'
    end
  end
  object DSQConsPro: TDataSource
    AutoEdit = False
    DataSet = QConsProd
    Left = 304
    Top = 272
  end
  object IBTRLocal: TFDTransaction
    Connection = DM.IBDatabase
    Left = 384
    Top = 216
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    Left = 448
    Top = 216
  end
end
