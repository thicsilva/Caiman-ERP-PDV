inherited FrmTransfLocaisEstoque: TFrmTransfLocaisEstoque
  Left = 504
  Top = 159
  Caption = 'Transfer'#234'ncia entre Locais de Estoque'
  ClientHeight = 599
  ClientWidth = 662
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 668
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 662
  end
  inherited Panel1: TPanel
    Width = 662
    Height = 518
    ExplicitWidth = 662
    ExplicitHeight = 522
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 662
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
        Left = 98
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Data'
      end
      object Label21: TLabel
        Left = 8
        Top = 48
        Width = 67
        Height = 13
        Caption = 'Local Origem'
      end
      object BtnConsOrigem: TsSpeedButton
        Left = 68
        Top = 64
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
        OnClick = BtnConsOrigemClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label22: TLabel
        Left = 98
        Top = 48
        Width = 152
        Height = 13
        Caption = 'Descri'#231#227'o do Local de Origem'
      end
      object Label5: TLabel
        Left = 8
        Top = 88
        Width = 69
        Height = 13
        Caption = 'Local Destino'
      end
      object BtnConsDestino: TsSpeedButton
        Left = 68
        Top = 104
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
        OnClick = BtnConsDestinoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label6: TLabel
        Left = 98
        Top = 88
        Width = 138
        Height = 13
        Caption = 'Descri'#231#227'o do Local Destino'
      end
      object LConv: TLabel
        Left = 240
        Top = 48
        Width = 241
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 551
        Top = 48
        Width = 83
        Height = 13
        Caption = 'Estoque Origem'
      end
      object Label7: TLabel
        Left = 551
        Top = 88
        Width = 85
        Height = 13
        Caption = 'Estoque Destino'
      end
      object EdtCodigo: TEdit
        Left = 8
        Top = 24
        Width = 65
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
      object EdtCodOrigem: TEdit
        Left = 8
        Top = 64
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodOrigemEnter
        OnExit = EdtCodOrigemExit
        OnKeyDown = EdtCodOrigemKeyDown
        OnKeyPress = EdtCodOrigemKeyPress
      end
      object EdtNomeOrigem: TEdit
        Left = 98
        Top = 64
        Width = 443
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
      object EdtCodDestino: TEdit
        Left = 8
        Top = 104
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Tipo de Venda'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = EdtCodDestinoEnter
        OnExit = EdtCodDestinoExit
        OnKeyDown = EdtCodDestinoKeyDown
        OnKeyPress = EdtCodOrigemKeyPress
      end
      object EdtNomeDestino: TEdit
        Left = 98
        Top = 104
        Width = 443
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
      object EdtData: TMaskEdit
        Left = 98
        Top = 24
        Width = 86
        Height = 21
        TabStop = False
        Color = clSilver
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        ReadOnly = True
        TabOrder = 1
        Text = '  /  /    '
      end
      object EdtEstoqueOrigem: TCurrencyEdit
        Left = 551
        Top = 64
        Width = 105
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
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        ZeroEmpty = False
      end
      object EdtEstoqueDestino: TCurrencyEdit
        Left = 551
        Top = 104
        Width = 105
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
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        ZeroEmpty = False
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 135
      Width = 662
      Height = 383
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 1
      ExplicitHeight = 387
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 662
        Height = 383
        Align = alClient
        BevelOuter = bvNone
        BevelWidth = 2
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 387
        object DBGrid1: TDBGrid
          Left = 0
          Top = 113
          Width = 662
          Height = 270
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSQBuscaItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              Title.Caption = 'ORD'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_PRO'
              Title.Alignment = taCenter
              Title.Caption = 'COD.PROD.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PRO'
              Title.Alignment = taCenter
              Title.Caption = 'PRODUTO'
              Width = 408
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANT'
              Title.Alignment = taCenter
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'UND.'
              Width = 50
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 662
          Height = 113
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object BtnAddPro: TsSpeedButton
            Left = 149
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
          object BtnConsPro: TsSpeedButton
            Left = 124
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
          object Label16: TLabel
            Left = 0
            Top = 0
            Width = 662
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Itens da Venda'
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            ExplicitWidth = 76
          end
          object Label18: TLabel
            Left = 178
            Top = 24
            Width = 111
            Height = 13
            Caption = 'Descri'#231#227'o do Produto'
          end
          object Label19: TLabel
            Left = 8
            Top = 64
            Width = 35
            Height = 13
            Caption = 'Quant.'
          end
          object Label3: TLabel
            Left = 8
            Top = 24
            Width = 51
            Height = 13
            Caption = 'Cod.Prod.'
          end
          object BtnExclui: TBitBtn
            Left = 197
            Top = 78
            Width = 65
            Height = 25
            Caption = '&Exclui'
            TabOrder = 0
            OnClick = BtnExcluiClick
          end
          object BtnGrava: TBitBtn
            Left = 109
            Top = 78
            Width = 65
            Height = 25
            Caption = '&Grava'
            TabOrder = 1
            OnClick = BtnGravaClick
          end
          object EdtCodPro: TEdit
            Left = 8
            Top = 40
            Width = 113
            Height = 21
            Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
            Alignment = taRightJustify
            Color = clSilver
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnEnter = EdtCodProEnter
            OnExit = EdtCodProExit
            OnKeyDown = EdtCodProKeyDown
            OnKeyPress = EdtCodOrigemKeyPress
          end
          object EdtNomePro: TEdit
            Left = 178
            Top = 40
            Width = 472
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
            TabOrder = 3
          end
          object EdtQuant: TCurrencyEdit
            Left = 8
            Top = 80
            Width = 73
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clSilver
            DecimalPlaces = 3
            DisplayFormat = ',#0.000'
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
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 662
    ExplicitWidth = 662
    inherited ToolBar1: TToolBar
      Width = 662
      ExplicitWidth = 662
      inherited BtnConsultar: TToolButton
        Visible = False
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 579
    Width = 662
    ExplicitTop = 579
    ExplicitWidth = 662
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object QOrdem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT MAX(ORDEM) AS ORDEM'
      'FROM ITENS_TRANSF_LOCAIS_ESTOQUE'
      'WHERE CODIGO = :CODIGO')
    Left = 176
    Top = 432
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QOrdemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
  end
  object IBTRTransf: TFDTransaction
    Connection = DM.IBDatabase
    Left = 176
    Top = 376
  end
  object IBSQLTransf: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTransf
    Left = 264
    Top = 376
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTransf
    SQL.Strings = (
      'SELECT I.*, P.NOME_PRO, U.DESCRICAO'
      'FROM ITENS_TRANSF_LOCAIS_ESTOQUE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.CODIGO = :CODIGO'
      'ORDER BY I.ORDEM'
      ''
      '')
    Left = 112
    Top = 376
    ParamData = <
      item
        Name = 'CODIGO'
      end>
    object QBuscaItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_TRANSF_LOCAIS_ESTOQUE.CODIGO'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_TRANSF_LOCAIS_ESTOQUE.ORDEM'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_TRANSF_LOCAIS_ESTOQUE.COD_PRO'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_TRANSF_LOCAIS_ESTOQUE.QUANT'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_TRANSF_LOCAIS_ESTOQUE.COD_EMP'
      Required = True
    end
    object QBuscaItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DSQBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 112
    Top = 432
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTransf
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_TRANSF_LOCAL_ESTOQUE (:DATA, :CODIGO_ORIGEM, :COD' +
        'IGO_DESTINO, :COD_USU, :COD_EMP)')
    Left = 344
    Top = 376
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODIGO_ORIGEM'
      end
      item
        Name = 'CODIGO_DESTINO'
      end
      item
        Name = 'COD_USU'
      end
      item
        Name = 'COD_EMP'
      end>
    object QInsertCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_TRANSF_LOCAL_ESTOQUE.CODIGO'
    end
  end
end
