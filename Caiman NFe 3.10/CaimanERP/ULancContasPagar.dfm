object FrmLancContasPagar: TFrmLancContasPagar
  Left = 281
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento Contas a Pagar'
  ClientHeight = 521
  ClientWidth = 620
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
    Width = 620
    Height = 257
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 197
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label21: TLabel
      Left = 8
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label3: TLabel
      Left = 8
      Top = 168
      Width = 101
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object Label4: TLabel
      Left = 144
      Top = 168
      Width = 121
      Height = 13
      Caption = 'N'#250'mero do Documento'
    end
    object Label5: TLabel
      Left = 352
      Top = 168
      Width = 26
      Height = 13
      Caption = 'Valor'
    end
    object Label6: TLabel
      Left = 448
      Top = 168
      Width = 60
      Height = 13
      Caption = 'Vencimento'
    end
    object Label7: TLabel
      Left = 8
      Top = 208
      Width = 60
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label10: TLabel
      Left = 8
      Top = 88
      Width = 60
      Height = 13
      Caption = 'Cod.Classif.'
    end
    object BtnConsClassif: TsSpeedButton
      Left = 148
      Top = 104
      Width = 23
      Height = 22
      Hint = 'Consultar Fornecedor'
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
      OnClick = BtnConsClassifClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnAddClassif: TsSpeedButton
      Left = 173
      Top = 104
      Width = 25
      Height = 22
      Hint = 'Cadastrar Fornecedor'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
        1335000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
        39A1000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000111F0F2A4074
        389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
        51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
        2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
        4ED83765318837653188376531883765318836623085101D0E27000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
        389E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
        0F2A000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnAddClassifClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label11: TLabel
      Left = 202
      Top = 88
      Width = 128
      Height = 13
      Caption = 'Descri'#231#227'o do Fornecedor'
    end
    object Label8: TLabel
      Left = 8
      Top = 128
      Width = 84
      Height = 13
      Caption = 'Centro de Custo'
    end
    object BtnConsCentroCusto: TsSpeedButton
      Left = 148
      Top = 144
      Width = 23
      Height = 22
      Hint = 'Consultar Fornecedor'
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
      OnClick = BtnConsCentroCustoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnAddCentroCusto: TsSpeedButton
      Left = 173
      Top = 144
      Width = 25
      Height = 22
      Hint = 'Cadastrar Fornecedor'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
        1335000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
        39A1000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000111F0F2A4074
        389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
        51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
        5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
        2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
        4ED83765318837653188376531883765318836623085101D0E27000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
        3DAC000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
        389E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
        0F2A000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnAddCentroCustoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label9: TLabel
      Left = 202
      Top = 128
      Width = 153
      Height = 13
      Caption = 'Descri'#231#227'o do Centro de Custo'
    end
    object EdtCodCentroCusto: TEdit
      Left = 8
      Top = 144
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Fornecedor'
      TabStop = False
      Alignment = taRightJustify
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 17
    end
    object EdtCodigo: TEdit
      Tag = 1
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtCodFor: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Fornecedor'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object EdtNomeFor: TEdit
      Left = 150
      Top = 64
      Width = 383
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
      TabOrder = 14
    end
    object EdtTipoDoc: TEdit
      Left = 8
      Top = 184
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 7
    end
    object EdtNumDoc: TEdit
      Left = 144
      Top = 184
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 8
    end
    object EdtValor: TCurrencyEdit
      Left = 352
      Top = 184
      Width = 81
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 9
      ZeroEmpty = False
    end
    object EdtObs: TEdit
      Left = 8
      Top = 224
      Width = 521
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 11
    end
    object EdtEmissao: TMaskEdit
      Left = 197
      Top = 24
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = EdtEmissaoExit
    end
    object EdtVencimento: TMaskEdit
      Left = 448
      Top = 184
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 10
      Text = '  /  /    '
      OnExit = EdtEmissaoExit
    end
    object BtnGravar: TBitBtn
      Left = 544
      Top = 64
      Width = 71
      Height = 28
      Caption = '&Gravar'
      TabOrder = 12
      OnClick = BtnGravarClick
    end
    object BtnSair: TBitBtn
      Left = 544
      Top = 104
      Width = 71
      Height = 28
      Caption = '&Sair'
      TabOrder = 13
      OnClick = BtnSairClick
    end
    object EdtSequencia: TEdit
      Tag = 1
      Left = 149
      Top = 24
      Width = 33
      Height = 21
      TabStop = False
      Alignment = taRightJustify
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
    object EdtCodClassif: TEdit
      Left = 8
      Top = 104
      Width = 121
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Fornecedor'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnEnter = EdtCodClassifEnter
      OnExit = EdtCodClassifExit
      OnKeyDown = EdtCodClassifKeyDown
      OnKeyPress = EdtCodClassifKeyPress
    end
    object EdtNomeClassif: TEdit
      Left = 202
      Top = 104
      Width = 327
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
      TabOrder = 15
    end
    object EdtCentroCusto: TMaskEdit
      Left = 8
      Top = 144
      Width = 121
      Height = 21
      Color = clSilver
      EditMask = '9.99.999;0;_'
      MaxLength = 8
      TabOrder = 6
      Text = ''
      OnExit = EdtCentroCustoExit
      OnKeyDown = EdtCentroCustoKeyDown
    end
    object EdtNomeCentroCusto: TEdit
      Left = 202
      Top = 144
      Width = 327
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
      TabOrder = 16
    end
    object CheckPendente: TCheckBox
      Left = 309
      Top = 24
      Width = 161
      Height = 17
      Caption = 'Duplicata Pendente'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 620
    Height = 245
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 616
      Height = 207
      Align = alTop
      Color = clSilver
      DataSource = DSQConsCTP
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CPT'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEQUENCIA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ.'
          Width = 36
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DTVENCTO_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TIPO_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DOC.'
          Width = 92
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUM_DOC_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'NUM.DOC.'
          Width = 84
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 73
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CTP'
          Title.Alignment = taCenter
          Title.Caption = 'OBSERVA'#199#195'O'
          Width = 313
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'CLASSIFICA'#199#195'O'
          Width = 263
          Visible = True
        end>
    end
    object BtnAlterar: TBitBtn
      Left = 222
      Top = 214
      Width = 65
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 332
      Top = 214
      Width = 65
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 502
    Width = 620
    Height = 19
    Panels = <>
  end
  object QConsCTP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREntCTP
    SQL.Strings = (
      
        'SELECT CP.COD_CPT, CP.COD_EMP, CP.DATA_CTP, CP.COD_FOR, CP.TIPO_' +
        'DOC_CTP, CP.NUM_DOC_CTP, CP.VALOR_CTP, CP.DTVENCTO_CTP, CP.OBS_C' +
        'TP, CP.COD_ENTRADA,  CP.DTPAGTO_CTP, CP.SEQUENCIA_CTP, CP.DUPLIC' +
        'ATA_PENDENTE, CP.COD_CLASSIFICACAO, CL.DESCRICAO'
      'FROM CONTAS_PAGAR CP'
      'INNER JOIN CLASSIFICACAO_CONTAS_PAGAR CL'
      'ON (CP.COD_CLASSIFICACAO = CL.CODIGO)'
      'WHERE CP.COD_ENTRADA = :CODENTRADA'
      'ORDER BY COD_CPT')
    Left = 80
    Top = 312
    ParamData = <
      item
        Name = 'CODENTRADA'
        DataType = ftInteger
      end>
    object QConsCTPCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Origin = 'CONTAS_PAGAR.COD_CPT'
      Required = True
    end
    object QConsCTPCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_PAGAR.COD_EMP'
      Required = True
    end
    object QConsCTPDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Origin = 'CONTAS_PAGAR.DATA_CTP'
      Required = True
    end
    object QConsCTPCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'CONTAS_PAGAR.COD_FOR'
      Required = True
    end
    object QConsCTPTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
      Origin = 'CONTAS_PAGAR.TIPO_DOC_CTP'
    end
    object QConsCTPNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QConsCTPVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsCTPDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
      Required = True
    end
    object QConsCTPOBS_CTP: TStringField
      FieldName = 'OBS_CTP'
      Origin = 'CONTAS_PAGAR.OBS_CTP'
      Size = 60
    end
    object QConsCTPCOD_ENTRADA: TIntegerField
      FieldName = 'COD_ENTRADA'
      Origin = 'CONTAS_PAGAR.COD_ENTRADA'
    end
    object QConsCTPSEQUENCIA_CTP: TIntegerField
      FieldName = 'SEQUENCIA_CTP'
      Origin = 'CONTAS_PAGAR.SEQUENCIA_CTP'
      Required = True
    end
    object QConsCTPDTPAGTO_CTP: TDateField
      FieldName = 'DTPAGTO_CTP'
      Origin = 'CONTAS_PAGAR.DTPAGTO_CTP'
    end
    object QConsCTPCOD_CLASSIFICACAO: TIntegerField
      FieldName = 'COD_CLASSIFICACAO'
      Origin = 'CONTAS_PAGAR.COD_CLASSIFICACAO'
      Required = True
    end
    object QConsCTPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_PAGAR.DESCRICAO'
      Required = True
      Size = 80
    end
    object QConsCTPDUPLICATA_PENDENTE: TStringField
      FieldName = 'DUPLICATA_PENDENTE'
      Origin = 'CONTAS_PAGAR.DUPLICATA_PENDENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSQConsCTP: TDataSource
    AutoEdit = False
    DataSet = QConsCTP
    Left = 80
    Top = 360
  end
  object IBTREntCTP: TFDTransaction
    Connection = DM.IBDatabase
    Left = 160
    Top = 312
  end
  object IBSQLCTP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREntCTP
    Left = 360
    Top = 312
  end
  object QInsCTP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREntCTP
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_CONTAS_PAGAR(:SEQ, :CODEMP, :DATA, :CODFOR, :TIPO' +
        'DOC, :NUMDOC, :VALOR, :DTVENCTO, :OBS, :CODENTRADA, :DTPAGTO, :V' +
        'ALORPAGO, :CODCLA, :ACRESCIMO, :DESCONTO, :CENTROCUSTO, :DUPPEND' +
        'ENTE)')
    Left = 264
    Top = 312
    ParamData = <
      item
        Name = 'SEQ'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'CODFOR'
        DataType = ftInteger
      end
      item
        Name = 'TIPODOC'
        DataType = ftString
      end
      item
        Name = 'NUMDOC'
        DataType = ftString
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'DTVENCTO'
        DataType = ftDate
      end
      item
        Name = 'OBS'
        DataType = ftString
      end
      item
        Name = 'CODENTRADA'
        DataType = ftInteger
      end
      item
        Name = 'DTPAGTO'
        DataType = ftDate
      end
      item
        Name = 'VALORPAGO'
        DataType = ftFloat
      end
      item
        Name = 'CODCLA'
        DataType = ftInteger
      end
      item
        Name = 'ACRESCIMO'
      end
      item
        Name = 'DESCONTO'
      end
      item
        Name = 'CENTROCUSTO'
      end
      item
        Name = 'DUPPENDENTE'
      end>
    object QInsCTPCODCTP: TIntegerField
      FieldName = 'CODCTP'
      Origin = 'INS_CONTAS_PAGAR.CODCTP'
    end
  end
end
