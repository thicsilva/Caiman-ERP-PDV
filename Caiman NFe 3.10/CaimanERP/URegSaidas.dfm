inherited FrmRegSaidas: TFrmRegSaidas
  Left = 384
  Top = 174
  Caption = 'Registro de Sa'#237'das'
  ClientHeight = 483
  ClientWidth = 659
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 665
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 659
  end
  inherited Panel1: TPanel
    Width = 659
    Height = 402
    ExplicitWidth = 659
    ExplicitHeight = 402
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 659
      Height = 135
      Align = alTop
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
        Left = 88
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Data(*)'
      end
      object Label35: TLabel
        Left = 536
        Top = 9
        Width = 42
        Height = 13
        Caption = 'NF Final'
      end
      object Label54: TLabel
        Left = 168
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Modelo'
      end
      object BtnConsModelo: TsSpeedButton
        Left = 212
        Top = 24
        Width = 23
        Height = 21
        Hint = 'Consultar Modelo'
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
        OnClick = BtnConsModeloClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label34: TLabel
        Left = 608
        Top = 8
        Width = 25
        Height = 13
        Caption = 'S'#233'rie'
      end
      object Label21: TLabel
        Left = 8
        Top = 48
        Width = 36
        Height = 13
        Caption = 'CNPJ(*)'
      end
      object BtnAddFor: TsSpeedButton
        Left = 109
        Top = 64
        Width = 25
        Height = 21
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
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label22: TLabel
        Left = 136
        Top = 48
        Width = 105
        Height = 13
        Caption = 'Descri'#231#227'o do Cliente'
      end
      object Label8: TLabel
        Left = 8
        Top = 88
        Width = 58
        Height = 13
        Caption = 'Total da NF'
      end
      object Label3: TLabel
        Left = 504
        Top = 48
        Width = 67
        Height = 13
        Caption = 'Insc.Estadual'
      end
      object Label4: TLabel
        Left = 240
        Top = 8
        Width = 109
        Height = 13
        Caption = 'Descri'#231#227'o do Modelo'
      end
      object Label5: TLabel
        Left = 88
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Emitente'
      end
      object Label6: TLabel
        Left = 232
        Top = 88
        Width = 124
        Height = 13
        Caption = 'Situa'#231#227'o do Documento'
      end
      object Label14: TLabel
        Left = 608
        Top = 48
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object Label15: TLabel
        Left = 464
        Top = 9
        Width = 47
        Height = 13
        Caption = 'NF Inicial'
      end
      object EdtCod: TEdit
        Left = 8
        Top = 24
        Width = 73
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
      object EdtData: TMaskEdit
        Left = 88
        Top = 24
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = EdtDataExit
      end
      object EdtNFFinal: TEdit
        Left = 536
        Top = 25
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 6
        TabOrder = 4
      end
      object EdtCodModelo: TEdit
        Left = 168
        Top = 24
        Width = 41
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        MaxLength = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodModeloEnter
        OnExit = EdtCodModeloExit
        OnKeyDown = EdtCodModeloKeyDown
      end
      object EdtNomeModelo: TEdit
        Left = 240
        Top = 24
        Width = 217
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object EdtSerie: TEdit
        Left = 608
        Top = 24
        Width = 33
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 3
        TabOrder = 5
      end
      object EdtCNPJ: TEdit
        Left = 8
        Top = 64
        Width = 97
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Fornecedor'
        Alignment = taRightJustify
        Color = clSilver
        MaxLength = 14
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnEnter = EdtCNPJEnter
        OnExit = EdtCNPJExit
        OnKeyPress = EdtCNPJKeyPress
      end
      object EdtNome: TEdit
        Left = 136
        Top = 64
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
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 13
      end
      object EdtTotalNF: TCurrencyEdit
        Left = 8
        Top = 104
        Width = 73
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
      object EdtInscricao: TEdit
        Left = 504
        Top = 64
        Width = 97
        Height = 21
        Color = clSilver
        MaxLength = 14
        TabOrder = 7
      end
      object ComboEmitente: TComboBox
        Left = 88
        Top = 104
        Width = 137
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 10
        Items.Strings = (
          'Pr'#243'prio'
          'Terceiro')
      end
      object ComboSituacao: TComboBox
        Left = 232
        Top = 104
        Width = 409
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 11
        Items.Strings = (
          'Documento Fiscal Normal'
          'Documento Fiscal Cancelado')
      end
      object EdtUF: TEdit
        Left = 608
        Top = 64
        Width = 33
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 2
        TabOrder = 8
      end
      object EdtNFInicial: TEdit
        Left = 464
        Top = 25
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 6
        TabOrder = 3
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 135
      Width = 659
      Height = 267
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 60
        Width = 74
        Height = 13
        Caption = 'Valor Cont'#225'bil'
      end
      object Label9: TLabel
        Left = 88
        Top = 60
        Width = 49
        Height = 13
        Caption = 'B.C. ICMS'
      end
      object Label10: TLabel
        Left = 216
        Top = 60
        Width = 43
        Height = 13
        Caption = 'Vlr.ICMS'
      end
      object Label11: TLabel
        Left = 288
        Top = 60
        Width = 36
        Height = 13
        Caption = 'Isentas'
      end
      object Label12: TLabel
        Left = 360
        Top = 60
        Width = 35
        Height = 13
        Caption = 'Outras'
      end
      object Label13: TLabel
        Left = 160
        Top = 60
        Width = 44
        Height = 13
        Caption = 'Aliquota'
      end
      object Label30: TLabel
        Left = 0
        Top = 0
        Width = 659
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Desdobramento do Documento Fiscal'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 196
      end
      object Label38: TLabel
        Left = 8
        Top = 20
        Width = 66
        Height = 13
        Caption = 'Cod.CFOP.(*)'
      end
      object BtnConsCFOP: TsSpeedButton
        Left = 68
        Top = 36
        Width = 23
        Height = 21
        Hint = 'Consultar CFOP'
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
        OnClick = BtnConsCFOPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddCFOP: TsSpeedButton
        Left = 93
        Top = 36
        Width = 23
        Height = 21
        Hint = 'Cadastrar CFOP'
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
        OnClick = BtnAddCFOPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label39: TLabel
        Left = 122
        Top = 20
        Width = 97
        Height = 13
        Caption = 'Descri'#231#227'o do CFOP'
      end
      object Label17: TLabel
        Left = 496
        Top = 60
        Width = 63
        Height = 13
        Caption = 'ICMS Retido'
      end
      object Label18: TLabel
        Left = 432
        Top = 60
        Width = 54
        Height = 13
        Caption = 'B.C.Retido'
      end
      object EdtValorContabil: TCurrencyEdit
        Left = 8
        Top = 76
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtBaseCalculo: TCurrencyEdit
        Left = 88
        Top = 76
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 2
        ZeroEmpty = False
      end
      object EdtICMS: TCurrencyEdit
        Left = 216
        Top = 76
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 4
        ZeroEmpty = False
      end
      object EdtIsentas: TCurrencyEdit
        Left = 288
        Top = 76
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 5
        ZeroEmpty = False
      end
      object EdtOutras: TCurrencyEdit
        Left = 360
        Top = 76
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 6
        ZeroEmpty = False
      end
      object EdtAliquota: TCurrencyEdit
        Left = 160
        Top = 76
        Width = 49
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
      object DBGrid1: TDBGrid
        Left = 0
        Top = 105
        Width = 659
        Height = 162
        Align = alBottom
        Color = clSilver
        DataSource = DSBuscaItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 10
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CFOP'
            Title.Alignment = taCenter
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Alignment = taCenter
            Title.Caption = 'VL.CONT'#193'BIL'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_CALCULO'
            Title.Alignment = taCenter
            Title.Caption = 'BASE C'#193'LCULO'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'AL'#205'Q.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_ICMS'
            Title.Alignment = taCenter
            Title.Caption = 'ICMS'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ISENTA_NAO_TRIBUTADA'
            Title.Alignment = taCenter
            Title.Caption = 'ISENTAS'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OUTRAS'
            Title.Alignment = taCenter
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_CALCULO_RETIDO'
            Title.Alignment = taCenter
            Title.Caption = 'B.C. RETIDO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ICMS_RETIDO'
            Title.Alignment = taCenter
            Title.Caption = 'ICMS RETIDO'
            Width = 75
            Visible = True
          end>
      end
      object BtnGrava: TButton
        Left = 576
        Top = 37
        Width = 65
        Height = 20
        Caption = '&Gravar'
        TabOrder = 9
        OnClick = BtnGravaClick
      end
      object BtnExclui: TButton
        Left = 576
        Top = 62
        Width = 65
        Height = 20
        Caption = '&Excluir'
        TabOrder = 11
        OnClick = BtnExcluiClick
      end
      object EdtCFOP: TEdit
        Left = 8
        Top = 36
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para CFOP'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCFOPEnter
        OnExit = EdtCFOPExit
        OnKeyDown = EdtCFOPKeyDown
      end
      object EdtNomeCFOP: TEdit
        Left = 122
        Top = 36
        Width = 431
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
        TabOrder = 12
      end
      object EdtICMSRetido: TCurrencyEdit
        Left = 496
        Top = 76
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 8
        ZeroEmpty = False
      end
      object EdtBaseRetido: TCurrencyEdit
        Left = 432
        Top = 76
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 7
        ZeroEmpty = False
      end
    end
  end
  inherited Panel2: TPanel
    Width = 659
    ExplicitWidth = 659
    inherited ToolBar1: TToolBar
      Width = 659
      ExplicitWidth = 659
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 463
    Width = 659
    ExplicitTop = 463
    ExplicitWidth = 659
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBTRReg: TFDTransaction
    Connection = DM.IBDatabase
    Left = 96
    Top = 328
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRReg
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_SAIDAS(:DATA, :CNPJ, :CODMODELO, :SERIE, :NUM' +
        'ERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, :CODSAIDA, ' +
        ':UF, :INSC, :NFFINAL, :CODMAPA)')
    Left = 144
    Top = 328
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERONOTA'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALORTOTAL'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODSAIDA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'NFFINAL'
      end
      item
        Name = 'CODMAPA'
      end>
    object QInsertCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object IBSQLReg: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRReg
    Left = 192
    Top = 328
  end
  object QBuscaItens: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRReg
    SQL.Strings = (
      'SELECT I.*, C.NOME_CFO, C.REGISTRADO_ECF'
      'FROM ITENS_REGISTRO_LIVRO_SAIDAS I'
      'INNER JOIN CFOP C'
      'ON (I.CFOP = C.COD_CFO)'
      'WHERE I.CODIGO = :COD'
      'ORDER BY I.ORDEM')
    Left = 256
    Top = 328
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ORDEM'
      Required = True
    end
    object QBuscaItensCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CFOP'
      Required = True
    end
    object QBuscaItensBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_ICMS'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensISENTA_NAO_TRIBUTADA: TBCDField
      FieldName = 'ISENTA_NAO_TRIBUTADA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ISENTA_NAO_TRIBUTADA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.OUTRAS'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ALIQUOTA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNOME_CFO: TStringField
      FieldName = 'NOME_CFO'
      Origin = 'CFOP.NOME_CFO'
      Required = True
      Size = 50
    end
    object QBuscaItensICMS_RETIDO: TBCDField
      FieldName = 'ICMS_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.ICMS_RETIDO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensBASE_CALCULO_RETIDO: TBCDField
      FieldName = 'BASE_CALCULO_RETIDO'
      Origin = 'ITENS_REGISTRO_LIVRO_ENTRADAS.BASE_CALCULO_RETIDO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCALC_DIFERENCA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_DIFERENCA'
      Calculated = True
    end
    object QBuscaItensREGISTRADO_ECF: TStringField
      FieldName = 'REGISTRADO_ECF'
      Origin = 'CFOP.REGISTRADO_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 256
    Top = 376
  end
end
