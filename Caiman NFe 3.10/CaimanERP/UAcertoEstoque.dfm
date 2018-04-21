inherited FrmAcertoEstoque: TFrmAcertoEstoque
  Left = 514
  Top = 195
  Caption = 'Acerto de Estoque'
  ClientHeight = 586
  ClientWidth = 605
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 611
  ExplicitHeight = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 605
  end
  inherited Panel1: TPanel
    Width = 605
    Height = 505
    ExplicitWidth = 605
    ExplicitHeight = 509
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 605
      Height = 199
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 122
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 8
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Cod.Acerto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnConsMot: TsSpeedButton
        Left = 68
        Top = 64
        Width = 23
        Height = 22
        Hint = 'Consultar C'#243'digo do Acerto'
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
        OnClick = BtnConsMotClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddMot: TsSpeedButton
        Left = 93
        Top = 64
        Width = 25
        Height = 22
        Hint = 'Cadastrar C'#243'digo do Acerto'
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
        OnClick = BtnAddMotClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label22: TLabel
        Left = 122
        Top = 48
        Width = 160
        Height = 13
        Caption = 'Descri'#231#227'o do Motivo de Acerto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 134
        Width = 60
        Height = 13
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnConsLocal: TsSpeedButton
        Left = 68
        Top = 109
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
      object BtnAddLocal: TsSpeedButton
        Left = 93
        Top = 109
        Width = 25
        Height = 22
        Hint = 'Cadastrar'
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
        OnClick = BtnAddLocalClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label6: TLabel
        Left = 8
        Top = 93
        Width = 96
        Height = 13
        Caption = 'Cod.Local Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 122
        Top = 93
        Width = 158
        Height = 13
        Caption = 'Descri'#231#227'o do Local do Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cod_ace: TEdit
        Left = 8
        Top = 24
        Width = 73
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
      object EdtData: TDateTimePicker
        Left = 122
        Top = 24
        Width = 105
        Height = 21
        Date = 37998.698417858800000000
        Time = 37998.698417858800000000
        Color = clSilver
        TabOrder = 1
      end
      object EdtCodMot: TEdit
        Left = 8
        Top = 64
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodMotEnter
        OnExit = EdtCodMotExit
        OnKeyDown = EdtCodMotKeyDown
        OnKeyPress = EdtCodMotKeyPress
      end
      object EdtNomeMot: TEdit
        Left = 122
        Top = 64
        Width = 474
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
      object MemoOBS: TMemo
        Left = 10
        Top = 150
        Width = 588
        Height = 41
        Color = clSilver
        MaxLength = 200
        TabOrder = 4
        OnEnter = MemoOBSEnter
        OnExit = MemoOBSExit
        OnKeyPress = MemoOBSKeyPress
      end
      object EdtCodLocal: TEdit
        Left = 8
        Top = 109
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = EdtCodLocalEnter
        OnExit = EdtCodLocalExit
        OnKeyDown = EdtCodLocalKeyDown
        OnKeyPress = EdtCodMotKeyPress
      end
      object EdtNomeLocal: TEdit
        Left = 122
        Top = 109
        Width = 476
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
        TabOrder = 6
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 199
      Width = 605
      Height = 121
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      ExplicitHeight = 125
      object Label5: TLabel
        Left = 8
        Top = 72
        Width = 61
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 24
        Width = 67
        Height = 13
        Caption = 'Cod.Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnConsPro: TsSpeedButton
        Left = 116
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
        OnClick = BtnConsProClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddPro: TsSpeedButton
        Left = 141
        Top = 40
        Width = 25
        Height = 21
        Hint = 'Cadastrar Produto'
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
        OnClick = BtnAddProClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label11: TLabel
        Left = 170
        Top = 24
        Width = 112
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 0
        Top = 0
        Width = 605
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Itens do Acerto'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 79
      end
      object Label4: TLabel
        Left = 518
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 185
        Top = 72
        Width = 71
        Height = 13
        Caption = 'Data Validade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 106
        Top = 72
        Width = 55
        Height = 13
        Caption = 'Quant. Ent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 89
        Top = 91
        Width = 6
        Height = 13
        Caption = 'X'
      end
      object EdtQuant: TCurrencyEdit
        Left = 8
        Top = 88
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 3
        DisplayFormat = ',#0.000'
        FormatOnEditing = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtNomePro: TEdit
        Left = 170
        Top = 40
        Width = 329
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
      object BtnGrava: TBitBtn
        Left = 286
        Top = 84
        Width = 65
        Height = 25
        Caption = '&Grava'
        TabOrder = 4
        OnClick = BtnGravaClick
      end
      object BtnExclui: TBitBtn
        Left = 357
        Top = 84
        Width = 65
        Height = 25
        Caption = '&Exclui'
        TabOrder = 5
        OnClick = BtnExcluiClick
      end
      object EdtCodPro: TEdit
        Left = 8
        Top = 40
        Width = 105
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodProEnter
        OnExit = EdtCodProExit
        OnKeyDown = EdtCodProKeyDown
      end
      object EdtEstoque: TCurrencyEdit
        Left = 517
        Top = 40
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 3
        DisplayFormat = ',#0.000'
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
      object BtnColetor: TButton
        Left = 341
        Top = 18
        Width = 148
        Height = 17
        Caption = 'Importar Coletor'
        TabOrder = 8
        TabStop = False
        OnClick = BtnColetorClick
      end
      object EdtDataValidade: TMaskEdit
        Left = 185
        Top = 88
        Width = 89
        Height = 21
        Color = clSilver
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnExit = EdtDataValidadeExit
      end
      object CheckFator: TCheckBox
        Left = 464
        Top = 92
        Width = 135
        Height = 17
        Caption = 'Usar fator convers'#227'o'
        TabOrder = 9
      end
      object QuantEnt: TCurrencyEdit
        Left = 106
        Top = 88
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DecimalPlaces = 3
        DisplayFormat = ',#0.000'
        FormatOnEditing = True
        TabOrder = 2
        ZeroEmpty = False
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 320
      Width = 605
      Height = 185
      Align = alBottom
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 2
      ExplicitTop = 324
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 605
        Height = 185
        Align = alClient
        Color = clSilver
        DataSource = DSQBuscaItens
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
            Expanded = False
            FieldName = 'ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'Ord.'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.Prod.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o do Produto'
            Width = 392
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT'
            Title.Alignment = taCenter
            Title.Caption = 'Quant.'
            Width = 70
            Visible = True
          end>
      end
      object PanelPB: TPanel
        Left = 94
        Top = 60
        Width = 441
        Height = 41
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 1
        object PB: TProgressBar
          Left = 2
          Top = 2
          Width = 437
          Height = 37
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 605
    ExplicitWidth = 605
    inherited ToolBar1: TToolBar
      Width = 605
      ExplicitWidth = 605
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 566
    Width = 605
    ExplicitTop = 566
    ExplicitWidth = 605
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object QInsAce: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      
        'INSERT INTO ACERTO_ESTOQUE (COD_ACE, COD_MOT, DATA_ACE, COD_EMP,' +
        ' OBSERVACAO, CODIGO_LOCAL_ESTOQUE)'
      'VALUES (:CODACE, :CODMOT, :DATAACE, :CODEMP, :OBS, :LOCAL)')
    Left = 392
    Top = 40
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end
      item
        Name = 'CODMOT'
        DataType = ftInteger
      end
      item
        Name = 'DATAACE'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'OBS'
        DataType = ftString
      end
      item
        Name = 'LOCAL'
      end>
  end
  object QUpdAce: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      'UPDATE ACERTO_ESTOQUE SET DATA_ACE = :DATAACE, OBSERVACAO = :OBS'
      'WHERE COD_ACE = :CODACE')
    Left = 456
    Top = 40
    ParamData = <
      item
        Name = 'DATAACE'
        DataType = ftDate
      end
      item
        Name = 'OBS'
        DataType = ftString
      end
      item
        Name = 'CODACE'
        DataType = ftInteger
      end>
  end
  object QDelAce: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      'DELETE FROM ACERTO_ESTOQUE'
      'WHERE COD_ACE = :CODACE')
    Left = 520
    Top = 40
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end>
  end
  object IBTRAce: TFDTransaction
    Connection = DM.IBDatabase
    Left = 392
    Top = 104
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      'SELECT I.*, P.NOME_PRO'
      'FROM ITENS_ACERTO_ESTOQUE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE COD_ACE = :CODACE'
      'ORDER BY I.ORDEM')
    Left = 288
    Top = 432
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end>
    object QBuscaItensCOD_ACE: TIntegerField
      FieldName = 'COD_ACE'
      Origin = 'ITENS_ACERTO_ESTOQUE.COD_ACE'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ACERTO_ESTOQUE.COD_PRO'
      Required = True
    end
    object QBuscaItensCOD_MOT: TIntegerField
      FieldName = 'COD_MOT'
      Origin = 'ITENS_ACERTO_ESTOQUE.COD_MOT'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_ACERTO_ESTOQUE.QUANT'
      Required = True
      DisplayFormat = ',#0.000'
      EditFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_ACERTO_ESTOQUE.COD_EMP'
      Required = True
    end
    object QBuscaItensNOME_PRO: TStringField
      DisplayWidth = 80
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_ACERTO_ESTOQUE.ORDEM'
      Required = True
    end
    object QBuscaItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_ACERTO_ESTOQUE.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
  end
  object DSQBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 368
    Top = 432
  end
  object InsItem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      
        'INSERT INTO ITENS_ACERTO_ESTOQUE (COD_ACE, COD_PRO, COD_MOT, QUA' +
        'NT, COD_EMP, ORDEM, VALOR_CUSTO, CODIGO_LOCAL_ESTOQUE)'
      
        'VALUES (:CODACE, :CODPRO, :CODMOT, :QUANT, :CODEMP, :ORDEM, :CUS' +
        'TO, :LOCAL)')
    Left = 456
    Top = 432
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'CODMOT'
        DataType = ftInteger
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'ORDEM'
        DataType = ftInteger
      end
      item
        Name = 'CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'LOCAL'
      end>
  end
  object DelItem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      'DELETE FROM ITENS_ACERTO_ESTOQUE'
      'WHERE COD_ACE = :CODACE AND ORDEM = :ORDEM')
    Left = 520
    Top = 432
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end
      item
        Name = 'ORDEM'
        DataType = ftInteger
      end>
  end
  object QOrdem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT MAX(ORDEM) AS ORDEM'
      'FROM ITENS_ACERTO_ESTOQUE'
      'WHERE COD_ACE = :CODACE')
    Left = 576
    Top = 432
    ParamData = <
      item
        Name = 'CODACE'
        DataType = ftInteger
      end>
    object QOrdemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object OP: TOpenDialog
    Left = 40
    Top = 408
  end
  object QInsColetor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAce
    SQL.Strings = (
      'INSERT INTO ITENS_ACERTO_ESTOQUE (COD_ACE, COD_EMP, '
      'COD_MOT, COD_PRO, ORDEM, QUANT, VALOR_CUSTO)'
      
        'VALUES(:CODACE, :CODEMP, :CODMOT, :CODPRO, :ORDEM, :QUANT, :CUST' +
        'O)')
    Left = 192
    Top = 436
    ParamData = <
      item
        Name = 'CODACE'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODMOT'
      end
      item
        Name = 'CODPRO'
      end
      item
        Name = 'ORDEM'
      end
      item
        Name = 'QUANT'
      end
      item
        Name = 'CUSTO'
      end>
  end
end
