inherited FrmCadFormaPagamento: TFrmCadFormaPagamento
  Left = 498
  Top = 201
  Caption = 'Cadastro de Formas de Pagamentos'
  ClientHeight = 552
  ClientWidth = 617
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 623
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 617
  end
  inherited Panel1: TPanel
    Width = 617
    Height = 471
    ExplicitWidth = 617
    ExplicitHeight = 471
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 617
      Height = 471
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Formas Pagamento'
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel
          Left = 8
          Top = 88
          Width = 73
          Height = 13
          Caption = 'Tipo da Forma'
        end
        object Label4: TLabel
          Left = 8
          Top = 128
          Width = 80
          Height = 13
          Caption = 'Tabela de Pre'#231'o'
        end
        object codigo: TEdit
          Left = 8
          Top = 24
          Width = 57
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
        object EdtNome: TEdit
          Left = 8
          Top = 64
          Width = 585
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 20
          TabOrder = 1
        end
        object ComboTipo: TComboBox
          Left = 8
          Top = 104
          Width = 585
          Height = 21
          Style = csDropDownList
          Color = clSilver
          TabOrder = 2
          Items.Strings = (
            'DINHEIRO'
            'PROMISS'#211'RIA'
            'CHEQUE'
            'CART'#195'O'
            'BOLETO'
            'TICKET'
            'CONTRA VALE'
            'TROCO'
            'CONSULTA CHEQUE'
            'TROCO VALE')
        end
        object ComboTabelaPreco: TComboBox
          Left = 8
          Top = 144
          Width = 585
          Height = 21
          Style = csDropDownList
          Color = clSilver
          ItemIndex = 0
          TabOrder = 3
          Text = 'A VISTA'
          Items.Strings = (
            'A VISTA'
            'A PRAZO')
        end
        object CheckTEF: TCheckBox
          Left = 8
          Top = 176
          Width = 97
          Height = 17
          Caption = 'Usa Tef'
          TabOrder = 4
        end
        object CheckGaveta: TCheckBox
          Left = 8
          Top = 192
          Width = 97
          Height = 17
          Caption = 'Abrir Gaveta'
          TabOrder = 5
        end
        object CheckPAF: TCheckBox
          Left = 8
          Top = 208
          Width = 217
          Height = 17
          Caption = 'Usar no PAF_ECF (Frente de Loja)'
          TabOrder = 6
        end
        object CheckContasReceber: TCheckBox
          Left = 8
          Top = 224
          Width = 201
          Height = 17
          Caption = 'Usar no Contas a Receber'
          TabOrder = 7
        end
        object CheckContasPagar: TCheckBox
          Left = 8
          Top = 240
          Width = 201
          Height = 17
          Caption = 'Usar no Contas a Pagar'
          TabOrder = 8
        end
        object CheckDesconto: TCheckBox
          Left = 8
          Top = 256
          Width = 201
          Height = 17
          Caption = 'Conceder Desconto'
          TabOrder = 9
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Contas Corrente'
        ImageIndex = 1
        object GroupBox4: TGroupBox
          Left = 0
          Top = 16
          Width = 289
          Height = 265
          Caption = 'Conta a Receber'
          TabOrder = 0
          object GroupBox2: TGroupBox
            Left = 8
            Top = 24
            Width = 265
            Height = 113
            Caption = 'Contas Corrente [Lan'#231'amento]'
            TabOrder = 0
            object Label5: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaCTR: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaCTRClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label6: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object Label7: TLabel
              Left = 8
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Centro Custo'
            end
            object BtnConsCentroCustoCTR: TsSpeedButton
              Left = 76
              Top = 80
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
              OnClick = BtnConsCentroCustoCTRClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label10: TLabel
              Left = 106
              Top = 64
              Width = 49
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object EdtCodCentroCustoCTR: TEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object EdtCodContaCTR: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaCTREnter
              OnExit = EdtCodContaCTRExit
              OnKeyDown = EdtCodContaCTRKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaCTR: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
            object EdtCentroCustoCTR: TMaskEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              Color = clSilver
              EditMask = '9.99.999;0;_'
              MaxLength = 8
              TabOrder = 2
              Text = ''
              OnExit = EdtCentroCustoCTRExit
            end
            object EdtNomeCentroCustoCTR: TEdit
              Left = 106
              Top = 80
              Width = 151
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
          end
          object GroupBox5: TGroupBox
            Left = 8
            Top = 144
            Width = 265
            Height = 113
            Caption = 'Contas Corrente [Estorno]'
            TabOrder = 1
            object Label17: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaCTREstorno: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaCTREstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label18: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object Label19: TLabel
              Left = 8
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Centro Custo'
            end
            object BtnConsCentroCustoCTREstorno: TsSpeedButton
              Left = 76
              Top = 80
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
              OnClick = BtnConsCentroCustoCTREstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label20: TLabel
              Left = 106
              Top = 64
              Width = 49
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object EdtCodCentroCustoCTREstorno: TEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object EdtCodContaCTREstorno: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaCTREstornoEnter
              OnExit = EdtCodContaCTREstornoExit
              OnKeyDown = EdtCodContaCTREstornoKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaCTREstorno: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
            object EdtCentroCustoCTREstorno: TMaskEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              Color = clSilver
              EditMask = '9.99.999;0;_'
              MaxLength = 8
              TabOrder = 2
              Text = ''
              OnExit = EdtCentroCustoCTREstornoExit
            end
            object EdtNomeCentroCustoCTREstorno: TEdit
              Left = 106
              Top = 80
              Width = 151
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
          end
        end
        object GroupBox6: TGroupBox
          Left = 304
          Top = 16
          Width = 289
          Height = 265
          Caption = 'Contas a Pagar'
          TabOrder = 1
          object GroupBox3: TGroupBox
            Left = 8
            Top = 24
            Width = 265
            Height = 73
            Caption = 'Contas Corrente [Lan'#231'amento]'
            TabOrder = 0
            object Label13: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaCTP: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaCTPClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label14: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object EdtCodContaCTP: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaCTPEnter
              OnExit = EdtCodContaCTPExit
              OnKeyDown = EdtCodContaCTPKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaCTP: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
          end
          object GroupBox7: TGroupBox
            Left = 8
            Top = 144
            Width = 265
            Height = 113
            Caption = 'Contas Corrente [Estorno]'
            TabOrder = 1
            object Label21: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaCTPEstorno: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaCTPEstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label22: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object Label23: TLabel
              Left = 8
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Centro Custo'
            end
            object BtnConsCentroCustoCTPEstorno: TsSpeedButton
              Left = 76
              Top = 80
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
              OnClick = BtnConsCentroCustoCTPEstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label24: TLabel
              Left = 106
              Top = 64
              Width = 49
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object EdtCodCentroCustoCTPEstorno: TEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object EdtCodContaCTPEstorno: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaCTPEstornoEnter
              OnExit = EdtCodContaCTPEstornoExit
              OnKeyDown = EdtCodContaCTPEstornoKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaCTPEstorno: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
            object EdtCentroCustoCTPEstorno: TMaskEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              Color = clSilver
              EditMask = '9.99.999;0;_'
              MaxLength = 8
              TabOrder = 2
              Text = ''
              OnExit = EdtCentroCustoCTPEstornoExit
            end
            object EdtNomeCentroCustoCTPEstorno: TEdit
              Left = 106
              Top = 80
              Width = 151
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
          end
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 288
          Width = 593
          Height = 161
          Caption = 'Vendas'
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 8
            Top = 24
            Width = 273
            Height = 129
            Caption = 'Contas Corrente [Lan'#231'amento]'
            TabOrder = 0
            object Label8: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaVendas: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaVendasClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label9: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object Label11: TLabel
              Left = 8
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Centro Custo'
            end
            object BtnConsCentroCustoVendas: TsSpeedButton
              Left = 76
              Top = 80
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
              OnClick = BtnConsCentroCustoVendasClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label12: TLabel
              Left = 106
              Top = 64
              Width = 49
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object EdtCodCentroCustoVendas: TEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object EdtCodContaVendas: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaVendasEnter
              OnExit = EdtCodContaVendasExit
              OnKeyDown = EdtCodContaVendasKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaVendas: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
            object EdtCentroCustoVendas: TMaskEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              Color = clSilver
              EditMask = '9.99.999;0;_'
              MaxLength = 8
              TabOrder = 2
              Text = ''
              OnExit = EdtCentroCustoVendasExit
            end
            object EdtNomeCentroVendas: TEdit
              Left = 106
              Top = 80
              Width = 151
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
          end
          object GroupBox9: TGroupBox
            Left = 304
            Top = 16
            Width = 273
            Height = 129
            Caption = 'Contas Corrente [Estorno]'
            TabOrder = 1
            object Label25: TLabel
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Cod.Conta'
            end
            object BtnConsContaVendasEstorno: TsSpeedButton
              Left = 76
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
              OnClick = BtnConsContaVendasEstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label26: TLabel
              Left = 106
              Top = 24
              Width = 99
              Height = 13
              Caption = 'Descri'#231#227'o da Conta'
            end
            object Label27: TLabel
              Left = 8
              Top = 64
              Width = 68
              Height = 13
              Caption = 'Centro Custo'
            end
            object BtnConsCentroCustoVendasEstorno: TsSpeedButton
              Left = 76
              Top = 80
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
              OnClick = BtnConsCentroCustoVendasEstornoClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label28: TLabel
              Left = 106
              Top = 64
              Width = 49
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object EdtCodCentroCustoVendasEstorno: TEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              TabOrder = 4
            end
            object EdtCodContaVendasEstorno: TEdit
              Left = 8
              Top = 40
              Width = 65
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar '
              Alignment = taRightJustify
              Color = clSilver
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodContaVendasEstornoEnter
              OnExit = EdtCodContaVendasEstornoExit
              OnKeyDown = EdtCodContaVendasEstornoKeyDown
              OnKeyPress = EdtCodContaVendasKeyPress
            end
            object EdtNomeContaVendasEstorno: TEdit
              Left = 104
              Top = 40
              Width = 153
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
              TabOrder = 1
            end
            object EdtCentroCustoVendasEstorno: TMaskEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              Color = clSilver
              EditMask = '9.99.999;0;_'
              MaxLength = 8
              TabOrder = 2
              Text = ''
              OnExit = EdtCentroCustoVendasEstornoExit
            end
            object EdtNomeCentroCustoVendasEstorno: TEdit
              Left = 106
              Top = 80
              Width = 151
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
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 617
    ExplicitWidth = 617
    inherited ToolBar1: TToolBar
      Width = 617
      ExplicitWidth = 617
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 532
    Width = 617
    ExplicitTop = 532
    ExplicitWidth = 617
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLForma: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRForma
    Left = 288
    Top = 8
  end
  object IBTRForma: TFDTransaction
    Connection = DM.IBDatabase
    Left = 408
    Top = 8
  end
end
