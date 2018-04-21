inherited FrmNotaFiscal: TFrmNotaFiscal
  Left = 316
  Top = 0
  Caption = 'Emiss'#227'o de Nota Fiscal'
  ClientHeight = 599
  ClientWidth = 878
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 884
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 878
    ExplicitWidth = 738
  end
  inherited Panel1: TPanel
    Width = 878
    Height = 518
    ExplicitWidth = 878
    ExplicitHeight = 518
    object PC: TPageControl
      Left = 0
      Top = 0
      Width = 878
      Height = 518
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PCChange
      object TabSheet1: TTabSheet
        Caption = 'Nota Fiscal'
        object RxLabel1: TRxLabel
          Left = 3
          Top = 149
          Width = 188
          Height = 20
          Caption = 'Itens da Nota Fiscal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ShadowColor = clWindowFrame
          ShadowPos = spLeftBottom
          Transparent = True
        end
        object GB1: TGroupBox
          Left = 0
          Top = 0
          Width = 870
          Height = 137
          Align = alTop
          Color = clWhite
          ParentBackground = False
          ParentColor = False
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
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 72
            Top = 8
            Width = 50
            Height = 13
            Caption = 'Tipo Nota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 520
            Top = 8
            Width = 58
            Height = 13
            Caption = 'N'#250'mero NF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 48
            Width = 36
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 280
            Top = 88
            Width = 33
            Height = 13
            Caption = 'Transp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BtnConsTra: TsSpeedButton
            Left = 333
            Top = 104
            Width = 23
            Height = 21
            Hint = 'Consultar Transportadora'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
              BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
              2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
              00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
              C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
              F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
              FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
              C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
              FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
              EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
              BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
              FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
              D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
              FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
              B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnConsTraClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object BtnAddTra: TsSpeedButton
            Left = 358
            Top = 104
            Width = 23
            Height = 21
            Hint = 'Cadastrar Transportadora'
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              700077777777777770007777700077777000777770C077777000777770C07777
              7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
              7000777770C07777700077777000777770007777777777777000777777777777
              7000}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnAddTraClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object BtnAddCliFor: TsSpeedButton
            Left = 86
            Top = 64
            Width = 23
            Height = 21
            Hint = 'Cadastrar Cliente'
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              700077777777777770007777700077777000777770C077777000777770C07777
              7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
              7000777770C07777700077777000777770007777777777777000777777777777
              7000}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnAddCliForClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object BtnConsCliFor: TsSpeedButton
            Left = 61
            Top = 64
            Width = 23
            Height = 21
            Hint = 'Consultar Cliente'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
              BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
              2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
              00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
              C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
              F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
              FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
              C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
              FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
              EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
              BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
              FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
              D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
              FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
              B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnConsCliForClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object Label12: TLabel
            Left = 384
            Top = 88
            Width = 127
            Height = 13
            Caption = 'Nome da Transportadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 112
            Top = 48
            Width = 86
            Height = 13
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label39: TLabel
            Left = 272
            Top = 8
            Width = 99
            Height = 13
            Caption = 'Cliente/Fornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label48: TLabel
            Left = 448
            Top = 48
            Width = 78
            Height = 13
            Caption = 'Tipo do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label50: TLabel
            Left = 8
            Top = 88
            Width = 57
            Height = 13
            Caption = 'Tipo Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BtnConsTPV: TsSpeedButton
            Left = 63
            Top = 104
            Width = 23
            Height = 21
            Hint = 'Consultar Tipo de Venda'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
              BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
              2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
              00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
              C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
              F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
              FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
              C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
              FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
              EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
              BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
              FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
              D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
              FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
              B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnConsTPVClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object BtnAddTPV: TsSpeedButton
            Left = 86
            Top = 104
            Width = 23
            Height = 21
            Hint = 'Cadastrar Tipo de Venda'
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              700077777777777770007777700077777000777770C077777000777770C07777
              7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
              7000777770C07777700077777000777770007777777777777000777777777777
              7000}
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnAddTPVClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object Label51: TLabel
            Left = 112
            Top = 88
            Width = 142
            Height = 13
            Caption = 'Descri'#231#227'o do Tipo de Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label52: TLabel
            Left = 472
            Top = 8
            Width = 25
            Height = 13
            Caption = 'Serie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 416
            Top = 8
            Width = 40
            Height = 13
            Caption = 'Modelo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EdtCod: TEdit
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
          object ComboTipo: TComboBox
            Left = 72
            Top = 24
            Width = 193
            Height = 21
            Style = csDropDownList
            Color = clWhite
            TabOrder = 1
            OnChange = ComboTipoChange
            Items.Strings = (
              'VENDAS'
              'VENDAS COM CUPOM'
              'TRANSFER'#202'NCIA'
              'DEVOLU'#199#195'O SAIDA'
              'OUTRAS SAIDAS'
              'ENTRADAS'
              'ESTORNO'
              'DEVOLU'#199#195'O ENTRADA')
          end
          object EdtNumero: TEdit
            Left = 520
            Top = 24
            Width = 81
            Height = 21
            TabStop = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnKeyPress = EdtCliForKeyPress
          end
          object EdtCliFor: TEdit
            Left = 8
            Top = 64
            Width = 49
            Height = 21
            Hint = 'Pressione F2 para Consultar ou F3 para cadastrar Cliente'
            Alignment = taRightJustify
            Color = clWhite
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnEnter = EdtCliForEnter
            OnExit = EdtCliForExit
            OnKeyDown = EdtCliForKeyDown
            OnKeyPress = EdtCliForKeyPress
          end
          object cod_tra: TEdit
            Left = 280
            Top = 104
            Width = 49
            Height = 21
            Hint = 'Pressione F2 para Consultar ou F3 para cadastrar Transportadora'
            Alignment = taRightJustify
            Color = clWhite
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnEnter = cod_traEnter
            OnExit = cod_traExit
            OnKeyDown = cod_traKeyDown
            OnKeyPress = EdtCliForKeyPress
          end
          object EdtNomeCliFor: TEdit
            Left = 112
            Top = 64
            Width = 329
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object EdtNomeTra: TEdit
            Left = 384
            Top = 104
            Width = 217
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object ComboCliFor: TComboBox
            Left = 272
            Top = 24
            Width = 137
            Height = 21
            Style = csDropDownList
            Color = clWhite
            TabOrder = 2
            OnChange = ComboCliForChange
            Items.Strings = (
              'CLIENTE'
              'FORNECEDOR')
          end
          object ComboTipoCliente: TComboBox
            Left = 448
            Top = 64
            Width = 153
            Height = 21
            Style = csDropDownList
            Color = clWhite
            TabOrder = 7
            Items.Strings = (
              'CONTRIBUINTE'
              'CONSUMIDOR FINAL')
          end
          object EdtCodTPV: TEdit
            Left = 8
            Top = 104
            Width = 49
            Height = 21
            Hint = 'Pressione F2 para Consultar ou F3 para cadastrar Tipo de  Venda'
            Alignment = taRightJustify
            Color = clWhite
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnEnter = EdtCodTPVEnter
            OnExit = EdtCodTPVExit
            OnKeyDown = EdtCodTPVKeyDown
            OnKeyPress = EdtCliForKeyPress
          end
          object EdtNomeTPV: TEdit
            Left = 112
            Top = 104
            Width = 161
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clWhite
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
            Left = 472
            Top = 24
            Width = 33
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 3
            TabOrder = 4
          end
          object GroupBox1: TGroupBox
            Left = 616
            Top = 8
            Width = 106
            Height = 127
            TabOrder = 13
            object Label24: TLabel
              Left = 8
              Top = 81
              Width = 56
              Height = 13
              Caption = 'Hora Sa'#237'da'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 41
              Height = 13
              Caption = 'Emiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 8
              Top = 44
              Width = 28
              Height = 13
              Caption = 'Sa'#237'da'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EdtEmissao: TDateTimePicker
              Left = 8
              Top = 22
              Width = 89
              Height = 21
              Date = 38336.720972106500000000
              Time = 38336.720972106500000000
              Color = clWhite
              TabOrder = 0
            end
            object EdtDataSaida: TDateTimePicker
              Left = 8
              Top = 58
              Width = 89
              Height = 21
              Date = 38336.720972106500000000
              Time = 38336.720972106500000000
              Color = clWhite
              TabOrder = 1
            end
            object EdtHora: TMaskEdit
              Left = 8
              Top = 95
              Width = 57
              Height = 21
              Color = clWhite
              EditMask = '99:99;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
              OnExit = EdtHoraExit
            end
          end
          object EdtModelo: TEdit
            Left = 416
            Top = 24
            Width = 41
            Height = 21
            Hint = 'Pressione F2 para Consultar ou F3 para cadastrar Transportadora'
            Alignment = taRightJustify
            Color = clWhite
            MaxLength = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnExit = EdtModeloExit
            OnKeyDown = EdtModeloKeyDown
          end
        end
        object GB3: TGroupBox
          Left = 0
          Top = 171
          Width = 870
          Height = 319
          Align = alBottom
          Color = clSilver
          ParentColor = False
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 2
            Top = 39
            Width = 720
            Height = 265
            Color = clGradientInactiveCaption
            DataSource = DSQBuscaItens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Color = 16776176
                Expanded = False
                FieldName = 'ORDEM'
                Title.Alignment = taCenter
                Title.Caption = 'ORD'
                Width = 30
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'COD_PRO'
                Title.Alignment = taCenter
                Title.Caption = 'COD.'
                Width = 55
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'NOME_PRO'
                Title.Alignment = taCenter
                Title.Caption = 'PRODUTO'
                Width = 317
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'CLASSIFICACAO_FISCAL'
                Title.Alignment = taCenter
                Title.Caption = 'C.F.'
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'UNIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'UND'
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'QUANT'
                Title.Alignment = taCenter
                Title.Caption = 'QUANT.'
                Width = 53
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'UNIT'
                Title.Alignment = taCenter
                Title.Caption = 'VALOR UNIT.'
                Width = 75
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'COD_CFO'
                Title.Alignment = taCenter
                Title.Caption = 'CFOP'
                Width = 38
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'CST'
                Title.Alignment = taCenter
                Width = 27
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'NOME_GRP'
                Title.Alignment = taCenter
                Title.Caption = 'GRUPO ICMS'
                Width = 167
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'ALIQ'
                Title.Alignment = taCenter
                Title.Caption = 'ICMS(%)'
                Width = 50
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'REDUCAO_ICMS'
                Title.Alignment = taCenter
                Title.Caption = 'BCR(%)'
                Width = 44
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'ALIQ_IPI'
                Title.Alignment = taCenter
                Title.Caption = 'IPI(%)'
                Width = 43
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'SUB_TRIBUTARIA'
                Title.Alignment = taCenter
                Title.Caption = 'ST'
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'VR_AGREGADO'
                Title.Alignment = taCenter
                Title.Caption = 'VR.AGREGADO(%)'
                Width = 95
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'ALIQUOTA_FORA_ESTADO'
                Title.Alignment = taCenter
                Title.Caption = 'ALIQ.EST.DESTINO'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_PIS'
                Title.Caption = 'CST PIS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_COFINS'
                Title.Caption = 'CST COFINS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_IPI'
                Title.Caption = 'CST IPI'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CSOSN'
                Visible = True
              end>
          end
          object PanelItens: TPanel
            Left = 1
            Top = 39
            Width = 728
            Height = 276
            BevelOuter = bvNone
            BevelWidth = 2
            Color = clSilver
            TabOrder = 1
            object BtnConsPro: TsSpeedButton
              Left = 179
              Top = 17
              Width = 23
              Height = 21
              Hint = 'Consultar Produto'
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
              OnClick = BtnConsProClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object BtnAddPro: TsSpeedButton
              Left = 204
              Top = 17
              Width = 25
              Height = 21
              Hint = 'Cadastrar Produto'
              Glyph.Data = {
                DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                0400000000006800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                700077777777777770007777700077777000777770C077777000777770C07777
                7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
                7000777770C07777700077777000777770007777777777777000777777777777
                7000}
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnAddProClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label8: TLabel
              Left = 231
              Top = 1
              Width = 111
              Height = 13
              Caption = 'Descri'#231#227'o do Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 231
              Top = 41
              Width = 24
              Height = 13
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 79
              Top = 41
              Width = 71
              Height = 13
              Caption = 'Valor Unit'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 7
              Top = 41
              Width = 35
              Height = 13
              Caption = 'Quant.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 167
              Top = 41
              Width = 44
              Height = 13
              Caption = 'Unidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 55
              Top = 1
              Width = 66
              Height = 13
              Caption = 'Cod.Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 7
              Top = 1
              Width = 25
              Height = 13
              Caption = 'Itens'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 649
              Top = 1
              Width = 42
              Height = 13
              Caption = 'Estoque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EdtValorUnit: TCurrencyEdit
              Left = 79
              Top = 57
              Width = 73
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              CheckOnExit = True
              Color = clWhite
              DecimalPlaces = 3
              DisplayFormat = ',#0.000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              FormatOnEditing = True
              ParentFont = False
              TabOrder = 2
              ZeroEmpty = False
              OnExit = EdtValorUnitExit
            end
            object EdtQuant: TCurrencyEdit
              Left = 7
              Top = 57
              Width = 57
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              AutoSize = False
              CheckOnExit = True
              Color = clWhite
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
            object EdtTotal: TCurrencyEdit
              Left = 231
              Top = 57
              Width = 89
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              CheckOnExit = True
              Color = clWhite
              DisplayFormat = ',#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              FormatOnEditing = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              ZeroEmpty = False
            end
            object EdtUnidade: TEdit
              Left = 167
              Top = 57
              Width = 49
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 4
              ReadOnly = True
              TabOrder = 3
            end
            object EdtCodPro: TEdit
              Left = 55
              Top = 17
              Width = 121
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
              Alignment = taRightJustify
              Color = clWhite
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EdtCodProEnter
              OnExit = EdtCodProExit
              OnKeyDown = EdtCodProKeyDown
              OnKeyPress = EdtCliForKeyPress
            end
            object EdtItens: TEdit
              Left = 7
              Top = 17
              Width = 41
              Height = 21
              Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
              TabStop = False
              Alignment = taRightJustify
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 5
            end
            object EdtEstoque: TCurrencyEdit
              Left = 649
              Top = 17
              Width = 65
              Height = 21
              Margins.Left = 4
              Margins.Top = 1
              TabStop = False
              AutoSize = False
              CheckOnExit = True
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
            object EdtNomeProduto: TEdit
              Left = 231
              Top = 17
              Width = 409
              Height = 21
              TabStop = False
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object gbImpostos: TGroupBox
              Left = 7
              Top = 81
              Width = 707
              Height = 185
              Caption = ' Impostos '
              TabOrder = 8
              object BtnAddCFOP: TsSpeedButton
                Left = 94
                Top = 76
                Width = 25
                Height = 21
                Hint = 'Cadastrar CFOP'
                Glyph.Data = {
                  DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                  0400000000006800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  700077777777777770007777700077777000777770C077777000777770C07777
                  7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
                  7000777770C07777700077777000777770007777777777777000777777777777
                  7000}
                ParentShowHint = False
                ShowHint = True
                OnClick = BtnAddCFOPClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object BtnAddGRP: TsSpeedButton
                Left = 94
                Top = 36
                Width = 25
                Height = 21
                Hint = 'Cadastrar Grupo de ICMS'
                Glyph.Data = {
                  DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                  0400000000006800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  700077777777777770007777700077777000777770C077777000777770C07777
                  7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
                  7000777770C07777700077777000777770007777777777777000777777777777
                  7000}
                ParentShowHint = False
                ShowHint = True
                OnClick = BtnAddGRPClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object BtnConsCFOP: TsSpeedButton
                Left = 69
                Top = 76
                Width = 23
                Height = 21
                Hint = 'Consultar CFOP'
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
                OnClick = BtnConsCFOPClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object BtnConsGRP: TsSpeedButton
                Left = 69
                Top = 36
                Width = 23
                Height = 21
                Hint = 'Consultar Grupo de ICMS'
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
                OnClick = BtnConsGRPClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object Label26: TLabel
                Left = 17
                Top = 100
                Width = 18
                Height = 13
                Caption = 'CST'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label27: TLabel
                Left = 121
                Top = 100
                Width = 41
                Height = 13
                Caption = 'ICMS(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label29: TLabel
                Left = 545
                Top = 100
                Width = 33
                Height = 13
                Caption = 'PIS.(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label41: TLabel
                Left = 257
                Top = 100
                Width = 27
                Height = 13
                Caption = 'IPI(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label42: TLabel
                Left = 614
                Top = 100
                Width = 57
                Height = 13
                Caption = 'COFINS.(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label44: TLabel
                Left = 377
                Top = 100
                Width = 80
                Height = 13
                Caption = 'Vr.Agregado(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label45: TLabel
                Left = 17
                Top = 60
                Width = 28
                Height = 13
                Caption = 'CFOP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label46: TLabel
                Left = 17
                Top = 20
                Width = 78
                Height = 13
                Caption = 'Grupo de ICMS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label47: TLabel
                Left = 123
                Top = 20
                Width = 147
                Height = 13
                Caption = 'Descri'#231#227'o do Grupo de ICMS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label49: TLabel
                Left = 457
                Top = 100
                Width = 80
                Height = 13
                Caption = 'Aliq.UF Destino'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 123
                Top = 60
                Width = 97
                Height = 13
                Caption = 'Descri'#231#227'o do CFOP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label54: TLabel
                Left = 73
                Top = 100
                Width = 19
                Height = 13
                Caption = 'C.F.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label61: TLabel
                Left = 17
                Top = 140
                Width = 35
                Height = 13
                Caption = 'CST Pis'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label62: TLabel
                Left = 88
                Top = 140
                Width = 54
                Height = 13
                Caption = 'CST Cofins'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label63: TLabel
                Left = 185
                Top = 100
                Width = 38
                Height = 13
                Caption = 'Red.(%)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label64: TLabel
                Left = 220
                Top = 140
                Width = 36
                Height = 13
                Caption = 'CSOSN'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object Label65: TLabel
                Left = 155
                Top = 140
                Width = 33
                Height = 13
                Caption = 'CST IPI'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object CheckST: TCheckBox
                Left = 329
                Top = 120
                Width = 41
                Height = 17
                Caption = 'ST'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
                OnClick = CheckSTClick
              end
              object EdtAliqEstDestino: TCurrencyEdit
                Left = 457
                Top = 116
                Width = 73
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
                FormatOnEditing = True
                TabOrder = 9
                ZeroEmpty = False
              end
              object EdtAliqICMS: TCurrencyEdit
                Left = 121
                Top = 116
                Width = 49
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
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
              object EdtAliqIPI: TCurrencyEdit
                Left = 257
                Top = 116
                Width = 49
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
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
              object EdtBCR: TCurrencyEdit
                Left = 185
                Top = 116
                Width = 57
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
                FormatOnEditing = True
                TabOrder = 5
                ZeroEmpty = False
              end
              object EdtCF: TEdit
                Left = 73
                Top = 116
                Width = 25
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 1
                TabOrder = 3
              end
              object EdtCFOP: TEdit
                Left = 17
                Top = 76
                Width = 49
                Height = 21
                Hint = 'Pressione F2 para Consultar ou F3 para cadastrar CFOP'
                Alignment = taRightJustify
                Color = clWhite
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnEnter = EdtCFOPEnter
                OnExit = EdtCFOPExit
                OnKeyDown = EdtCFOPKeyDown
                OnKeyPress = EdtCliForKeyPress
              end
              object EdtCodGRP: TEdit
                Left = 17
                Top = 36
                Width = 49
                Height = 21
                Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Grupo de ICMS'
                Alignment = taRightJustify
                Color = clWhite
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnEnter = EdtCodGRPEnter
                OnExit = EdtCodGRPExit
                OnKeyDown = EdtCodGRPKeyDown
                OnKeyPress = EdtCliForKeyPress
              end
              object edtCofins: TCurrencyEdit
                Left = 614
                Top = 116
                Width = 57
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
                FormatOnEditing = True
                TabOrder = 11
                ZeroEmpty = False
              end
              object edtCSOSN: TEdit
                Left = 220
                Top = 156
                Width = 54
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 3
                TabOrder = 15
                OnExit = EdtCSTExit
                OnKeyPress = EdtCliForKeyPress
              end
              object EdtCST: TEdit
                Left = 17
                Top = 116
                Width = 41
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 3
                TabOrder = 2
                OnExit = EdtCSTExit
                OnKeyPress = EdtCliForKeyPress
              end
              object edtCSTCofins: TEdit
                Left = 88
                Top = 156
                Width = 56
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 3
                TabOrder = 13
                OnExit = EdtCSTExit
                OnKeyPress = EdtCliForKeyPress
              end
              object edtCstIPI: TEdit
                Left = 155
                Top = 156
                Width = 56
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 3
                TabOrder = 14
                OnExit = EdtCSTExit
                OnKeyPress = EdtCliForKeyPress
              end
              object edtCSTPis: TEdit
                Left = 17
                Top = 156
                Width = 60
                Height = 21
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 3
                TabOrder = 12
                OnExit = EdtCSTExit
                OnKeyPress = EdtCliForKeyPress
              end
              object EdtNomeCFOP: TEdit
                Left = 125
                Top = 76
                Width = 409
                Height = 21
                TabStop = False
                CharCase = ecUpperCase
                Color = clWhite
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
              object EdtNomeGRP: TEdit
                Left = 121
                Top = 36
                Width = 409
                Height = 21
                TabStop = False
                CharCase = ecUpperCase
                Color = clWhite
                Enabled = False
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
                TabOrder = 17
              end
              object edtPis: TCurrencyEdit
                Left = 545
                Top = 116
                Width = 57
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
                FormatOnEditing = True
                TabOrder = 10
                ZeroEmpty = False
              end
              object EdtVrAgregado: TCurrencyEdit
                Left = 377
                Top = 116
                Width = 73
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                AutoSize = False
                CheckOnExit = True
                Color = clWhite
                DisplayFormat = ',#0.00'
                FormatOnEditing = True
                TabOrder = 8
                ZeroEmpty = False
              end
            end
          end
          object BtnGrava: TBitBtn
            Left = 77
            Top = 11
            Width = 65
            Height = 25
            Caption = '&Grava'
            TabOrder = 2
            OnClick = BtnGravaClick
          end
          object BtnNew: TBitBtn
            Left = 5
            Top = 11
            Width = 65
            Height = 25
            Caption = '&Novo'
            TabOrder = 3
            OnClick = BtnNewClick
          end
          object BtnExclui: TBitBtn
            Left = 149
            Top = 11
            Width = 65
            Height = 25
            Caption = '&Exclui'
            TabOrder = 4
            OnClick = BtnExcluiClick
          end
          object BtnItens: TBitBtn
            Left = 221
            Top = 11
            Width = 65
            Height = 25
            Caption = '&Itens'
            NumGlyphs = 2
            TabOrder = 5
            OnClick = BtnItensClick
          end
          object BtnConsVendas: TBitBtn
            Left = 358
            Top = 8
            Width = 110
            Height = 25
            Caption = '&Cupom Fiscal'
            Enabled = False
            NumGlyphs = 2
            TabOrder = 6
            OnClick = BtnConsVendasClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dados Complementares'
        ImageIndex = 1
        object GB4: TGroupBox
          Left = 8
          Top = 8
          Width = 713
          Height = 105
          Caption = 'Volumes Transportados'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label32: TLabel
            Left = 8
            Top = 16
            Width = 61
            Height = 13
            Caption = 'Quantidade'
          end
          object Label33: TLabel
            Left = 112
            Top = 16
            Width = 38
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          object Label34: TLabel
            Left = 216
            Top = 16
            Width = 31
            Height = 13
            Caption = 'Marca'
          end
          object Label35: TLabel
            Left = 8
            Top = 56
            Width = 41
            Height = 13
            Caption = 'N'#250'mero'
          end
          object Label36: TLabel
            Left = 112
            Top = 56
            Width = 56
            Height = 13
            Caption = 'Peso Bruto'
          end
          object Label37: TLabel
            Left = 216
            Top = 56
            Width = 66
            Height = 13
            Caption = 'Peso L'#237'quido'
          end
          object EdtQuantidade: TEdit
            Left = 8
            Top = 32
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 0
            OnKeyPress = EdtCliForKeyPress
          end
          object EdtEspecie: TEdit
            Left = 112
            Top = 32
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 1
          end
          object EdtMarca: TEdit
            Left = 216
            Top = 32
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 2
          end
          object EdtNum: TEdit
            Left = 8
            Top = 72
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxLength = 10
            ParentFont = False
            TabOrder = 3
          end
          object EdtPesoBruto: TCurrencyEdit
            Left = 112
            Top = 72
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
          object EdtPesoLiquido: TCurrencyEdit
            Left = 216
            Top = 72
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 5
            ZeroEmpty = False
          end
        end
        object GB5: TGroupBox
          Left = 8
          Top = 120
          Width = 711
          Height = 169
          Caption = 'Informa'#231#245'es Complementares'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object MemoObs: TMemo
            Left = 2
            Top = 15
            Width = 707
            Height = 152
            Align = alClient
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            TabOrder = 0
            OnChange = MemoObsChange
            OnEnter = MemoObsEnter
            OnExit = MemoObsExit
            OnKeyPress = MemoObsKeyPress
          end
        end
        object grpRefrencias: TGroupBox
          Left = 10
          Top = 293
          Width = 707
          Height = 175
          Caption = ' Notas Refer'#234'nciadas ( Devolu'#231#245'es ) '
          TabOrder = 2
          Visible = False
          object Label66: TLabel
            Left = 13
            Top = 151
            Width = 327
            Height = 13
            Caption = 
              '( F3 ) - Consultar Notas     ( DEL ) Apagar Nota    ( ENTER ) - ' +
              'Salvar'
          end
          object GridReferencias: TDBGrid
            Left = 11
            Top = 21
            Width = 632
            Height = 120
            DataSource = dsBuscaReferencias
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyDown = GridReferenciasKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CHAVE'
                Title.Caption = ' Chave da NF-e'
                Width = 400
                Visible = True
              end>
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Fatura'
        ImageIndex = 2
        object TGroupBox
          Left = 10
          Top = 24
          Width = 704
          Height = 257
          Caption = 'Fatura'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label56: TLabel
            Left = 424
            Top = 24
            Width = 89
            Height = 13
            Caption = 'Total das Parcelas'
          end
          object Label57: TLabel
            Left = 424
            Top = 72
            Width = 68
            Height = 13
            Caption = 'Total da Nota'
          end
          object Label58: TLabel
            Left = 424
            Top = 120
            Width = 49
            Height = 13
            Caption = 'Diferen'#231'a'
          end
          object DBGrid2: TDBGrid
            Left = 2
            Top = 15
            Width = 365
            Height = 194
            Color = clSilver
            DataSource = DSFatura
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Color = 16776176
                Expanded = False
                FieldName = 'PARCELA'
                Title.Alignment = taCenter
                Title.Caption = 'Parcela'
                Width = 60
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'CALC_VENCIMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Vencimento'
                Width = 82
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'VALOR'
                Title.Alignment = taCenter
                Title.Caption = 'Valor'
                Width = 98
                Visible = True
              end>
          end
          object BtnGerarFatura: TButton
            Left = 15
            Top = 216
            Width = 75
            Height = 25
            Caption = '&Gerar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = BtnGerarFaturaClick
          end
          object BtnExcluirFatura: TButton
            Left = 185
            Top = 216
            Width = 75
            Height = 25
            Caption = '&Excluir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = BtnExcluirFaturaClick
          end
          object BtnExcluirTodasFaturas: TButton
            Left = 271
            Top = 216
            Width = 75
            Height = 25
            Caption = '&Excluir Tudo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = BtnExcluirTodasFaturasClick
          end
          object BtnAlterarFatura: TButton
            Left = 100
            Top = 216
            Width = 75
            Height = 25
            Caption = '&Alterar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = BtnAlterarFaturaClick
          end
          object EdtTotalParcelas: TCurrencyEdit
            Left = 424
            Top = 40
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            TabStop = False
            AutoSize = False
            CheckOnExit = True
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtAuxTotal: TCurrencyEdit
            Left = 424
            Top = 88
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            TabStop = False
            AutoSize = False
            CheckOnExit = True
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtDiferenca: TCurrencyEdit
            Left = 424
            Top = 136
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            TabStop = False
            AutoSize = False
            CheckOnExit = True
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
        end
        object PanelFatura: TPanel
          Left = 40
          Top = 128
          Width = 305
          Height = 81
          BevelInner = bvLowered
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 16710131
          ParentBiDiMode = False
          TabOrder = 1
          Visible = False
          object Label59: TLabel
            Left = 8
            Top = 16
            Width = 60
            Height = 13
            Caption = 'Vencimento'
          end
          object Label60: TLabel
            Left = 113
            Top = 16
            Width = 65
            Height = 13
            Caption = 'Valor Parcela'
          end
          object EdtVenc: TDateTimePicker
            Left = 8
            Top = 32
            Width = 97
            Height = 21
            Date = 38336.720972106500000000
            Time = 38336.720972106500000000
            TabOrder = 0
          end
          object EdtValorParcela: TCurrencyEdit
            Left = 112
            Top = 32
            Width = 89
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            DisplayFormat = ',#0.00'
            FormatOnEditing = True
            TabOrder = 1
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object Button1: TButton
            Left = 224
            Top = 16
            Width = 65
            Height = 25
            Caption = '&OK'
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 224
            Top = 48
            Width = 65
            Height = 25
            Caption = '&Cancelar'
            TabOrder = 3
            OnClick = Button2Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Totais'
        ImageIndex = 3
        object GB2: TGroupBox
          Left = 0
          Top = 0
          Width = 870
          Height = 145
          Align = alTop
          Caption = 'C'#225'lculo do Imposto'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label13: TLabel
            Left = 120
            Top = 16
            Width = 53
            Height = 13
            Caption = 'Base ICMS'
          end
          object Label14: TLabel
            Left = 212
            Top = 16
            Width = 55
            Height = 13
            Caption = 'Valor ICMS'
          end
          object Label15: TLabel
            Left = 304
            Top = 16
            Width = 50
            Height = 13
            Caption = 'Base Sub.'
          end
          object Label16: TLabel
            Left = 396
            Top = 16
            Width = 52
            Height = 13
            Caption = 'Valor Sub.'
          end
          object Label17: TLabel
            Left = 488
            Top = 16
            Width = 76
            Height = 13
            Caption = 'Valor Produtos'
          end
          object Label18: TLabel
            Left = 24
            Top = 56
            Width = 55
            Height = 13
            Caption = 'Valor Frete'
          end
          object Label19: TLabel
            Left = 120
            Top = 56
            Width = 66
            Height = 13
            Caption = 'Valor Seguro'
          end
          object Label20: TLabel
            Left = 213
            Top = 56
            Width = 67
            Height = 13
            Caption = 'Outras Desp.'
          end
          object Label21: TLabel
            Left = 305
            Top = 56
            Width = 58
            Height = 13
            Caption = 'Valor do IPI'
          end
          object Label22: TLabel
            Left = 398
            Top = 56
            Width = 70
            Height = 13
            Caption = 'Valor Total NF'
          end
          object Label40: TLabel
            Left = 24
            Top = 16
            Width = 49
            Height = 13
            Caption = 'Desconto'
          end
          object Label43: TLabel
            Left = 24
            Top = 96
            Width = 44
            Height = 13
            Caption = 'Valor PIS'
          end
          object Label55: TLabel
            Left = 119
            Top = 96
            Width = 68
            Height = 13
            Caption = 'Valor COFINS'
          end
          object EdtBaseICMS: TCurrencyEdit
            Left = 120
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
          object EdtValorICMS: TCurrencyEdit
            Left = 212
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
          object EdtBaseSub: TCurrencyEdit
            Left = 304
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
          object EdtValorSub: TCurrencyEdit
            Left = 396
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
          object EdtTotalProd: TCurrencyEdit
            Left = 488
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 5
            ZeroEmpty = False
          end
          object EdtFrete: TCurrencyEdit
            Left = 24
            Top = 72
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 6
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtSeguro: TCurrencyEdit
            Left = 120
            Top = 72
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 7
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtDesp: TCurrencyEdit
            Left = 213
            Top = 72
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 8
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtIPI: TCurrencyEdit
            Left = 305
            Top = 72
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 9
            ZeroEmpty = False
            OnExit = EdtFreteExit
          end
          object EdtTotalNF: TCurrencyEdit
            Left = 398
            Top = 72
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 10
            ZeroEmpty = False
          end
          object EdtDesconto: TCurrencyEdit
            Left = 24
            Top = 32
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
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
            OnExit = EdtFreteExit
          end
          object RdgFrete: TRadioGroup
            Left = 584
            Top = 16
            Width = 129
            Height = 81
            Caption = 'Frete por Conta'
            Items.Strings = (
              '(1) Emitente'
              '(2) Destinat'#225'rio'
              '(3) Terceiros'
              '(4) Sem Frete')
            TabOrder = 11
          end
          object edtTotalPIS: TCurrencyEdit
            Left = 24
            Top = 112
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 12
            ZeroEmpty = False
          end
          object edtTotalCofins: TCurrencyEdit
            Left = 119
            Top = 112
            Width = 81
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            Color = clWhite
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 13
            ZeroEmpty = False
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 878
    ExplicitWidth = 878
    inherited ToolBar1: TToolBar
      Width = 878
      ExplicitWidth = 878
      inherited BtnNovo: TToolButton
        ExplicitWidth = 68
      end
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
      object ToolButton1: TToolButton
        Left = 575
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object BtnFinaliza: TToolButton
        Left = 583
        Top = 0
        Caption = 'Finalizar '
        ImageIndex = 7
        OnClick = BtnFinalizaClick
      end
      object btnEnvia: TToolButton
        Left = 664
        Top = 0
        Caption = 'Enviar NF-e'
        ImageIndex = 8
        OnClick = btnEnviaClick
      end
      object btnEmail: TToolButton
        Left = 745
        Top = 0
        Caption = 'Enviar Email'
        ImageIndex = 9
        OnClick = btnEmailClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 579
    Width = 878
    ExplicitTop = 579
    ExplicitWidth = 878
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000001000000010000
          0000000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001010100152116005C55380194845600B8A36B01CCA36B01CC8456
          00B8553801942116005C01010015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000906
          0031714A01AAF29F02F9FCA302FEFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFCA302FEF29F02F9714A01AA0906003100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C593B0197F8A2
          02FCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FC593B01970000000C0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000004020021AF7401D4FFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFAF7401D40402
          0021000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000004020021C58202E1FFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFC582
          02E1040200210000000000000000000000000000000000000000000000000000
          000000000000000000000000000CAF7401D4FFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFAF7401D40000000C00000000000000000000000000000000000000000000
          00000000000000000001593A0197FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FF593A019700000001000000000000000000000000000000000000
          00000000000009060032F8A202FCFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFF8A202FC09060032000000000000000000000000000000000000
          000000000001714A01AAFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FCF8A202FCFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FF714A01AA000000010000000000000000000000000000
          000001010014F29F02F9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFD78F02EB0000000C0000000BD78F
          02EBFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFF29F02F9010100140000000000000000000000000000
          00002116005CFCA402FEFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC78502E20000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFCA402FE2115005C0000000000000000000000000000
          000155380194FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC78502E20000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF553801940000000100000000000000000000
          0000845600B8FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFDF9302EFD28B02E8D28B02E8A56F01CE0000000100000001A56F
          01CED28B02E8D28B02E8DF9302EFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF845600B80000000000000000000000000000
          0001A36B01CCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFF8A202FC0000000C00000001000000010000000100000000000000000000
          000100000001000000010000000CF8A202FCFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFA36B01CC0000000100000000000000000000
          0001A36B01CCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFF8A202FC0000000900000001000000010000000100000000000000000000
          0001000000010000000100000009F8A102FCFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFA36B01CC0000000100000000000000000000
          0000845600B8FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFCB8502E4B77A02D9B77A02D9906101C000000001000000019061
          01C0B67802D8B67802D8C98502E3FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF845600B80000000000000000000000000000
          000155380194FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC58202E10000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF553801940000000100000000000000000000
          00002116005CFCA402FEFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC58202E10000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFCA402FE2116005C0000000000000000000000000000
          000001010014F29F02F9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFD48D02E90000000500000005D48D
          02E9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFF29F02F9010100140000000000000000000000000000
          000000000001714A01AAFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFE49602F2E49602F2FFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FF714A01AA000000010000000000000000000000000000
          00000000000009060032F8A202FCFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFF8A202FC09060032000000000000000000000000000000000000
          00000000000000000001593A0197FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FF593A019700000001000000000000000000000000000000000000
          000000000000000000000000000CAF7401D4FFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFAF7401D40000000C00000000000000000000000000000000000000000000
          000000000000000000000000000004020021C58202E1FFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFC582
          02E1040200210000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000004020021AF7401D4FFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFAF7401D40402
          0021000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C593B0197F8A2
          02FCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FC593B01970000000C0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000906
          0031714A01AAF29F02F9FCA302FEFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFCA302FEF29F02F9714A01AA0906003100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001010100152116005C55380194845600B8A36B01CCA36B01CC8456
          00B8553801942116005C01010015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000001000000010000
          0000000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000404032324211C63292620692926206929262069292620692926
          2069292620692926206929262069292620692926206929262069292620692926
          2069292620692926206929262069292620692926206929262069292620692926
          20692926206924211C6304040323000000000000000000000000000000000000
          000023190067E8D4A6FAF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFE8D3A6FA231800670000000000000000000000000302
          0020D7A203FAF3DEACFFF9ECD5FFF9ECD5FFF9ECD5FFF9ECD4FFF9ECD4FFF9EC
          D4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9EC
          D4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9EC
          D5FFF9ECD5FFF9ECD5FFF3DEACFFD59E02FA0302002000000000000000001F17
          015FE2AC05FFF4E0AFFFFAEED9FFFAEED9FFEAD09BFFE7CB90FFE7CA8EFFE6C9
          8CFFE6C889FFE5C787FFE5C685FFE4C584FFE4C482FFE4C481FFE4C480FFE4C4
          80FFE4C480FFE4C480FFE4C480FFE4C480FFE4C480FFE4C480FFE3C27DFFF5E4
          C5FFFAEED9FFFAEED9FFF4E0AFFFE1AB05FF1F17015F0000000000000000231B
          0166E2AD09FFF5E2B3FFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFF5E2B3FFE2AD09FF231B01660000000000000000231B
          0266E3AF0DFFF5E3B6FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFF5E3B6FFE3AF0DFF231B02660000000000000000241B
          0266E4B111FFF6E5BAFFFBF3E5FFFBF3E5FFF9EEDBFFF8EDD8FFF8EDD8FFF8ED
          D7FFF8EDD7FFF8ECD7FFF8ECD6FFF8ECD6FFF8ECD6FFF8ECD6FFF8ECD5FFF8EC
          D5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF7ECD5FFFBF2
          E2FFFBF3E5FFFBF3E5FFF6E5BAFFE4B111FF241B02660000000000000000241B
          0366E6B215FFF6E6BDFFFCF5E8FFFCF5E9FFEEDAAFFFECD6A6FFEBD4A4FFEBD4
          A2FFEBD3A1FFEAD29FFFEAD19DFFE9D09BFFE9D09AFFE9CF99FFE9CF99FFE9CF
          99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE8CE97FFF7EC
          D5FFFCF5E8FFFCF5E8FFF6E6BDFFE6B215FF241B03660000000000000000241C
          0466E7B41AFFF7E8C0FFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFF7E8C0FFE7B41AFF241C04660000000000000000241C
          0566E8B61EFFF8E9C4FFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFF8E9C4FFE8B61EFF241C05660000000000000000251D
          0566E9B823FFF8EBC7FFFDFAF3FFFDFAF3FFF6EBD5FFF5E9D0FFF5E8CFFFF4E8
          CEFFF4E7CDFFF4E7CCFFF4E7CBFFF4E6CAFFF4E6C9FFF3E6C9FFF3E6C9FFF3E6
          C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E5C8FFFBF5
          EAFFFDFAF3FFFDFAF3FFF8EBC7FFE9B823FF251D05660000000000000000251D
          0666EABA28FFF9ECCBFFFEFBF6FFFEFBF7FFF4E7CCFFF2E4C5FFF2E3C4FFF1E2
          C2FFF1E2C1FFF1E1C0FFF1E1BFFFF0E0BEFFF0E0BDFFF0DFBCFFF0DFBCFFF0DF
          BCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBBFFFBF5
          E9FFFEFBF6FFFEFBF6FFF9ECCBFFEABA28FF251D06660000000000000000251D
          0766EBBD2EFFF9EECEFFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFF9EECEFFEBBD2EFF251D07660000000000000000251D
          0766EDBF33FFFAEFD1FFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFAEFD1FFEDBF33FF251D07660000000000000000251E
          0866EEC139FFF9ECC8FFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFF9ECC8FFEEC139FF251E08660000000000000000251E
          0966EFC43FFFF0C94FFFF3D477FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D477FFF0C94FFFEFC43FFF251E09660000000000000000261F
          0A66F0C644FFF0C745FFF0C745FFF0C745FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF0C745FFF0C745FFF0C745FFF0C644FF261F0A660000000000000000261F
          0B66F2C949FFF2C94AFFF2C94AFFEAC24FFFE4BB4DFFE4BA4BFFE3B949FFE5BE
          56FFECCD84FFECCD85FFECCD84FFECCD83FFEBCC83FFEBCC82FFEBCC82FFEBCC
          82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCB
          7DFFE9BF4CFFF2C94AFFF2C94AFFF2C949FF261F0B660000000000000000261F
          0B66F3CB4EFFF3CB4FFFF3CB51FFE5BD51FFE4BB4FFFE4BB4CFFE3BA4AFFF0D7
          9FFFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6
          C6FFF7E6C6FFF7E6C6FFF7E5C5FFF4E0BBFFF4E0BAFFF4E0BAFFF6E3C0FFF7E5
          C6FFEBCD84FFF2CB50FFF3CB4FFFF3CB4EFF261F0B660000000000000000261F
          0C66F4CD54FFF4CD54FFF4CD56FFE5BD53FFE5BC51FFE5BC4FFFE4BB4DFFF2DA
          A7FFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7
          CAFFF8E7CAFFF8E7CAFFE2C17AFFD2A33CFFCF9D2FFFCF9C2DFFD09F33FFF7E6
          C8FFEDCF8BFFF4CD56FFF4CD54FFF4CD54FF261F0C6600000000000000002720
          0D66F5CF58FFF5D059FFF5D05BFFE6BF56FFE5BE54FFE5BD52FFE5BC50FFF2DB
          ABFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9
          CEFFF9E9CEFFF9E9CFFFE0BD71FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF7E7
          C9FFEDD18FFFF5D05AFFF5D059FFF5CF58FF27200D6600000000000000002720
          0E66F6D15DFFF6D25EFFF6D260FFE7C058FFE6BF56FFE6BE54FFE5BD52FFF3DD
          AEFFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EB
          D3FFF9EBD3FFF9EBD4FFE0BD73FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF8E9
          CEFFEED292FFF6D25FFFF6D25EFFF6D15DFF27200E6600000000000000002721
          0F66F8D362FFF8D463FFF7D464FFE7C15AFFE7C058FFE6BF56FFE6BE54FFF3DF
          B2FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEE
          D9FFFAEED9FFFAEED9FFE0BE74FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF9EB
          D3FFEED496FFF7D364FFF8D463FFF8D362FF27210F6600000000000000002721
          0F66F9D466FFF9D567FFF8D568FFE8C15CFFE7C05AFFE7C058FFE6BF56FFF4E1
          B6FFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0
          DEFFFBF0DEFFFBF1DFFFE0BF76FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFAEE
          D9FFEFD699FFF8D568FFF9D567FFF9D466FF27210F6600000000000000002721
          1066FAD66AFFFAD76BFFF9D76CFFE8C25EFFE8C15CFFE7C05AFFE7BF58FFF4E3
          BAFFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3
          E4FFFBF3E4FFFBF3E4FFE1C077FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFAF0
          DEFFEFD79DFFF9D76BFFFAD76BFFFAD66AFF2721106600000000000000002721
          1066FAD86EFFFAD96FFFFAD970FFE9C360FFE8C25EFFE8C15CFFE7C05AFFF5E4
          BEFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5
          EAFFFCF5EAFFFCF6EAFFE1C078FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFBF2
          E3FFF0D9A0FFFAD86FFFFAD96FFFFAD86EFF272110660000000000000000221C
          0E5FFBD86FFFFBDA72FFFBDA74FFE9C462FFE8C360FFE8C25EFFE8C15CFFF6E6
          C2FFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFE1C17AFFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFCF5
          E8FFF1DAA4FFFBDA73FFFBDA72FFFBDA72FF221E0F5F00000000000000000303
          0120EECB65FAFCDA74FFFCDB76FFE9C464FFE9C362FFE9C360FFE8C25EFFF6E8
          C6FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFA
          F4FFFEFAF4FFFEFAF4FFE3C584FFD1A136FFCE9B2AFFCD9927FFCE9B2BFFFDF8
          F1FFF1DBA6FFFCDB75FFFCDB74FFF0D06CFA0403012000000000000000000000
          000027200E67EEC963FAFBD872FFE9C361FFE8C25FFFE8C15DFFE7C05BFFF6E8
          C7FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFDFAF4FFF8F0E0FFF8F0DEFFF8EFDEFFFAF5EAFFFEFC
          F9FFF1DBA7FFFBD872FFEFCC67FA282110670000000000000000000000000000
          00000000000003030120211B0C5F251E0E66251E0D66251E0D66251E0D662926
          1E692B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29
          266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29
          266A28231A68221B0C5F03030120000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01110D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2C488A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C01060A35010508300105083001050830010508300105
          08300105083001050830010508300105083002080D3D2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C62898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2B6B0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E70B6DC2898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000D0303
          1A5501010D3C000000000000000000000000000000000C304E902898F5FF103B
          5FA000000000000000000000000C03031A5502010D3D000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D1A17AFDB231E
          EDFF231EEDFF0C0A4F930000000100000000000000000C304E902486D9F00107
          0B37000000000000021C1A16ADDA231EEDFF231EEDFF09083F842898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004031A56231EEDFF231E
          EDFF231EEDFF231EEDFF0C0A529600000001000000000616246301070B370000
          00000000021C1A17AFDB231EEDFF231EEDFF231EEDFF1D1AC9EB2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010D3C231EEDFF231E
          EDFF231EEDFF231EEDFF231EEDFF0C0A52960000000100000000000000000000
          021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF1815A3D42898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C0A5094231E
          EDFF231EEDFF231EEDFF231EEDFF231EEDFF0C0A5296000000010000021C1A17
          AFDB231EEDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A362898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010C0A
          5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF0D0B5C9F1A17AFDB231E
          EDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A37000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF231EEDFF1F1AD1F001010A3700000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF1F1AD1F001010A370000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000010D0B5C9F231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF211EE4FB01010B38000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF0C0A5296000000010000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF231EEDFF0C0A52960000000100000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF211EE4FB231EEDFF231E
          EDFF231EEDFF231EEDFF231EEDFF0C0A529600000001000000002694ECFB2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000021C1A17
          AFDB231EEDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010B380C0A5296231E
          EDFF231EEDFF231EEDFF231EEDFF231EEDFF0C0A5296000000011E78BFE22898
          F5FF071A2A6B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C1A16ADDA231E
          EDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A3700000000000000010C0A
          5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF09083C820D304F912898
          F5FF2488DDF2071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F40000204240000000003031A55231EEDFF231E
          EDFF231EEDFF231EEDFF1F1AD1F001010A370000000000000000000000000000
          00010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF1D1AC9EC000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF103E65A40000000002010D3D231EEDFF231E
          EDFF231EEDFF1F1AD1F001010A37000000000000000000000000000000000000
          0000000000010C0A5296231EEDFF231EEDFF231EEDFF1815A5D5000000000000
          01110D304F911E78BFE22385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF1C6FB2DA0000000600000000090840851D1A
          C9EB1815A3D401010A3600000000000000000000000000000000000000000000
          0000000000000000000109083D831D1AC9EC1815A5D501010B39}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01110D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2D498B0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071A2A6A01060A34010508300105083001050830010508300105
          08300105083001050830010508300105083002080D3D2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071A2A6B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C52898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2A6B0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E70B6DC2898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000040101330100001F000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000100001F652B25F72D1310A50401013400000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000002D1310A56B2D27FF6B2D27FF3B1916BE0903034B0000
          000100000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000040101336B2D27FF6B2D27FF5B2521EB1207076B0000
          000B00000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000003A1815BC5B2521EB02010025180A08795623
          20E4652B24F9371614B70201002600000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000803034A1207076B180A08796B2D27FF6B2D
          27FF6B2D27FF6B2D27FF592521EA0301012D00000000000204241F77C1E30C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000B562320E46B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D0000000000020424081F
          32740000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000652B24F96B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D000000000000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000371614B76B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D0000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000002010026592521EA6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301
          012D0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000301012D5925
          21EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF5925
          21EA0301012D00000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000301
          012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF592521EA0301012D000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF592521EA0301012D0000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF592521EA0301012D00000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000301012D592521EA6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA020100252694ECFB2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000301012D592521EA6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF361714B61E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000301012D592521EA6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF5F2823F10C2F4E902898
          F5FF248ADEF3071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F40020A104300020421000000000301012D5925
          21EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF51211EDF000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF1F77C1E300020424000000000301
          012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF15090872000000000000
          01110C2E4B8E1E75BDE12385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF2385D7EF195E99CA040E174F000000000000
          000002000024361714B65F2723F051211EDF1509087200000001}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000096346
          1BAFCD9238FCD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFFD3973AFFD3973AFFCD9238FC62451BAE00000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000022180968674A
          1CB3000000060000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000006694B1DB422180967000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000003C2B11892E21
          0C77000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002E210C783C2B1189000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000004A3614992218
          096800000000000000000F0B086F0000000000000000000000000F0B086F0000
          000000000000050402410201012E00000000221909684A341498000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005B4019A81911
          06580000000000000000140F0B80000000000000000000000000140F0B800000
          000000000000050402420403023E00000000191106585B4019A8000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000006D4E1EB8100C
          04480000000000000000140F0B80000000000000000000000000140F0B800000
          000000000000030301380604034800000000100C04486D4E1EB8000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000815C23C80A07
          02380000000000000000140F0B80000000000000000000000000140F0B800000
          0000000000000201012E08060452000000000A070239815B22C7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000966A29D70503
          01290000000000000003130E0A7D000000000000000000000000140F0B800000
          000000000000010100240A07055B0000000005030129966929D7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AC7C2FE70201
          0019000000000000000E100C0872000000000000000000000000140F0B800000
          0000000000000000001B0C0906650000000002010019AC7B2FE7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C48C36F70000
          000900000000000000190C0A0767000000000000000000000000140F0B800000
          000000000000000000110F0B086F000000000000000AC48D36F6000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000007C68F36F80000
          000000000000010100240A07055C000000000000000000000000140F0B800000
          00000000000000000007110D09790000000000000000C88E38F9000000070000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010017AF7E31E90000
          0000000000000202012F08060451000000000000000000000000140F0B800000
          00000000000000000000130F0B800000000000000000B07E31E9010100160000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004030127986D29D90000
          0000000000000403023A06040346000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000009A6D2ADA040301260000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000009060237835C24C90000
          000000000000050403450403023B000000000000000000000000140F0B800000
          00000000000000000000140F0B800000000000000000835E25CA090602360000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000F0B04466F4F1EBA0000
          0000000000000705045002020130000000000000000000000000140F0B800000
          00000000000000000000140F0B800000000000000000704F1EBA0F0B04450000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000171106565D4319AA0000
          0000000000000A07055B01010025000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000005E431AAB171006550000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000211709664C36159A0000
          0000000000000C0907660000001A000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000004E37159B201708640000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000002C1F0C753D2C118A0000
          0000000000000E0A086C0000000D000000000000000000000000120D0A7A0000
          00000000000000000000110D097900000000000000003D2C118B2B1F0C740000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000003928108530220D7A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000031230E7C38280F840000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000100001430220D7A35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803022
          0D7A010000140000000000000000000000000000000000000000000000000000
          000000000000000000000000000030220D7A755320BF35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F807553
          20BF30220D7A0000000000000000000000000000000000000000000000000000
          000000000000000000000000000035260F8035260F8000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003526
          0F8035260F800000000000000000000000000000000000000000000000000000
          000000000000000000000000000030220D7A755320BF35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F807553
          20BF30220D7A0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000100001430220D7A35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803022
          0D7A010000140000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000072511FBC130D054D0000000000000000000000000000
          000000000001876024CC0B08033C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000016100654BE8934F3D3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFF785421C000000007000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01120D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2D498B0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001121D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C01060A35010508300105083001050830010508300105
          083001050830010508300105083001050830030C144A2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000101152898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C62898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2A6A0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E75BDE12898F5FF0C30
          4E9000000000000000000000000B0904034D04020137000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000103B5FA02486D9F00106
          0A36000000000100001C4C201CD86B2D27FF6B2D27FF1B0B0A802898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D304F9101070B370000
          00000100001C4F221CDB6B2D27FF6B2D27FF6B2D27FF5B2521EB2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000009000000000100
          001C4F221CDB6B2D27FF6B2D27FF6B2D27FF6B2D27FF4C201CD62898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000E00000011000000040000000000000000000000000100001C4F22
          1CDB6B2D27FF6B2D27FF6B2D27FF6B2D27FF632923F50602023E2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000070302442F1411AA5C27
          21EC6B2D27FF6B2D27FF672A25FA3F1B17C51308076E020100264F221CDB6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF632923F507030242000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000013341513B26B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FE6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF632923F50703024200000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000184D201CDA6B2D27FF6B2D27FF361713B50C05
          045602010025010000200602023E200D0B8B602923F26B2D27FF6B2D27FF6B2D
          27FF6B2D27FF632923F5070302420000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000033E1A17C46B2D27FF5F2823F10A04034F000000000000
          0000000000000000000000000000000000000100001B3F1B17C56B2D27FF6B2D
          27FF632923F507030242000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000100706646B2D27FF692B27FC07030242000000000000000D3731
          287E8B7A65C699876ED05B5041A00706052F000000000000000C491F1BD26B2D
          27FF401B17C600000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000004A1E1AD46B2D27FF250F0E960000000001010013A38F77D7E6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFDBC09EF91714105100000000050201386B2D
          27FF6B2D27FF04010133000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000100001F6B2D27FF6B2D27FF02010029000000005B5041A0E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFCAB193EF0000001000000000421B
          18C86B2D27FF1A0B097F000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000803034A6B2D27FF5B2521EB0000000000000005D8BF9DF7E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF1D1A155C00000000200D
          0C8C6B2D27FF2F1311A9000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000B0404546B2D27FF4F221EDC0000000001010013E6CBA7FFE6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF2C261F70000000001B0B
          0A806B2D27FF311512AF000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000080303476B2D27FF5D2722EF0000000100000003CEB796F2E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF1815125400000000220E
          0C906B2D27FF2D1310A6000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000186B2D27FF6B2D27FF0401013400000000483E338EE6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFB8A284E40000000A00000000491E
          1AD36B2D27FF170A0878000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000411B17C76B2D27FF2E1210A7000000000000000A81735EC0E6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFC8B091EE0C0B093C00000000080303486B2D
          27FF6B2D27FE02010129000000000000000000000000000000002893EEFC2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          0000000000000B0404546B2D27FF6B2D27FF0D05045900000000000000041E1B
          165E615546A66B5F4DAE3A332A810202011A000000000000001752241DE16B2D
          27FF351612B300000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          00000000000000000000311512AF6B2D27FF672A25FA1408076F000000020000
          000000000000000000000000000000000000040101314D201CDA6B2D27FF5D27
          21EE0100002000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4001050933000000000000000D3F1B17C56B2D27FF6B2D27FF491E1AD31709
          0876070302450602023E0E06055E301412AB692B27FC6B2D27FF602923F20603
          0240000000000000000000000000000000000000000000000000000001121D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2896F0FD040F19530000000000000008230F0C93692B27FC6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF441D19CC0301012B0000
          0000000000000000000000000000000000000000000000000000000000000000
          01120D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF258FE8F90514215F0000000000000000020100271F0D0B8A441D
          19CC5B2721ED5F2823F150211EDE2D1310A60A04034F00000002000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000060A0702380D0903400D0903400D0903400D0903400D09
          03400D0903400D0903400D0903400D0903400D0903400C09033F0202001E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000202001E9A702ADB876024CC755320BF755320BF755320BF755320BF7553
          20BF755320BF755320BF755320BF755320BF755320BF785521C0B07E31E93123
          0E7C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004E38159C34250E7F00000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000001000014B07E
          31E90202001E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007855
          21C00C09033F0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000271C0B6F0403012500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000140E0A086C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001435281CD1130E0A7D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000001535281CD114100B8200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000001535291CD115100B840000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000D34291CD23E3022E2140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B800D0A076B000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000B31261ACB3E3022E2140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B800E0A076B000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000001132261ACB15100B850000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000001133271BCC15100B8500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001233281CCD140F0B82000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000120F0B0870000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000271B0B6E0403012500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000735220BD0E0A044300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007B57
          21C30C08033D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000038280F845E431AAB0000000C000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D090340B37F
          30EB000000110000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000009543C17A2C68E36F8D3973AFFD3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFF9C6F2BDC100B
          0447000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000306010C13270954234710962E5C16C6346B18E638701AF1387119F0346B
          18E62E5C16C623471096132709540306010C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000081004232348
          119838731BF43B781CFF3B781CFF3B781CFF3B781CFF3B781CFF3B781CFF3B78
          1CFF3B781CFF3B781CFF3B781CFF38731BF42348119808100423000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000020401081F400F883A741AF93B78
          1CFF3B781CFF37711BF3285113AC1B360D741225094E0F1E07400F1E073F1225
          094E1B370D75285113AC37711BF33B781CFF3B781CFF3A741AF91F400F880204
          0108000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000081004212F6217D03B781CFF3B781CFF3266
          18D8162D0B600204010900000000000000000000000000000000000000000000
          0000000000000000000002040109172E0B62326618D83B781CFF3B781CFF2F62
          17D0081004210000000000000000000000000000000000000000000000000000
          000000000000000000000A15052D366E1AE93B781CFF38751AF81B370D760102
          000400000000060A050E203A1C4F1F391C4E060A050E00000000000000000000
          000000000000000000000000000000000000010200041B370D7638751AF83B78
          1CFF366E1AE90A15052D00000000000000000000000000000000000000000000
          00000000000008100421366E1AE93B781CFF346B18E60C190635000000000000
          00001A3017415EAE54EC67BC5CFF67BC5CFF5FAC55EB1A2F1740000000000000
          00000000000000000000000000000000000000000000000000000C190635356D
          18E73B781CFF366E1AE908100421000000000000000000000000000000000000
          0000020401082F6217D03B781CFF346B18E60811042400000000000000001B31
          184263B557F567BC5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B3118420000
          0000000000000000000000000000000000000000000000000000000000000811
          0424356D18E73B781CFF2F6217D0020401080000000000000000000000000000
          000020400F893B781CFF38751AF80C19063500000000000000001B31184263B5
          57F567BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B31
          1842000000000000000000000000000000000000000000000000000000000000
          00000C19063538751AF83B781CFF1F400F880000000000000000000000000810
          04233A741AF93B781CFF1B370D7600000000000000001B31184263B557F567BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B5
          57F51B3118420000000000000000000000000000000000000000000000000000
          0000000000001B370D763B781CFF3A741AF90810042300000000000000002347
          11993B781CFF326618D801020004000000001B31184263B557F567BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF63B557F51B31184200000000000000000000000000000000000000000000
          00000000000001020004326618D83B781CFF23481198000000000306010C3873
          1BF43B781CFF162D0B60000000001B31184263B557F567BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF63B557F51B311842000000000000000000000000000000000000
          00000000000000000000162E0B613B781CFF38731BF40306010C132709543B78
          1CFF37711BF302040109192E173F63B557F567BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF63B557F51B3118420000000000000000000000000000
          000000000000000000000204010937711BF33B781CFF13270954234710963B78
          1CFF285113AC030503075CA953E567BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF559B4CD258A14EDB67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B31184200000000000000000000
          0000000000000000000000000000285113AC3B781CFF234710962E5C16C63B78
          1CFF1B360D741628133667BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF559B4CD2080F08150B150A1C58A14EDB67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B311842000000000000
          00000000000000000000000000001B370D753B781CFF2E5C16C6346B18E63B78
          1CFF1225094E1220102C67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF559B4CD2080F081500000000000000000B150A1C58A14EDB67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B3118420000
          00000000000000000000000000001225094E3B781CFF346B18E638701AF13B78
          1CFF0F1E073F00010001509349C967BC5CFF67BC5CFF67BC5CFF67BC5CFF559B
          4CD2080F0815000000000000000000000000000000000B150A1C58A14EDB67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B557F51B31
          18420000000000000000000000000F1E07403B781CFF38701AF138701AF13B78
          1CFF0E1D073D000000000B140A1B4A8842BA67BA5CFE65BB5AFD488541B5080F
          08150000000000000000000000000000000000000000000000000B150A1C58A1
          4EDB67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF63B5
          57F51B31184200000000000000000F1E073F3B781CFF367019EF346B18E63B78
          1CFF1225094E0000000000000000000000000408040B0407040A000000000000
          0000000000000000000000000000000000000000000000000000000000000B15
          0A1C58A14EDB67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF63B557F5192E163E000000001225094E3B781CFF346B18E62E5C16C63B78
          1CFF1B360D740000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000B150A1C58A14EDB67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF5CA953E5020402051B370D753B781CFF2E5C16C6234710963B78
          1CFF285113AC0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000B150A1C58A14EDB67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF15271335285113AC3B781CFF23471096132709543B78
          1CFF38721BF20204010900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000B150A1C58A14EDB67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF1425113537711BF33B781CFF132709540306010C3873
          1BF43B781CFF162D0B6000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000B150A1C58A14EDB67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF509349C9172E0B623B781CFF38731BF40306010C000000002348
          11983B781CFF326618D801020004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000A1209194A8842B867BA5CFE67BA
          5CFE4A8842BA0C170B20326618D83B781CFF2348119800000000000000000810
          04233A741AF93B781CFF1B370D76000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060B050F070D
          0611000000001B370D763B781CFF3A741AF90810042300000000000000000000
          000020400F893B781CFF38751AF80C1906350000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000C19063538751AF83B781CFF1F400F880000000000000000000000000000
          0000020401082F6217D03B781CFF346B18E60811042400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000811
          0424356D18E73B781CFF2F6217D0020401080000000000000000000000000000
          00000000000008100421366E1AE93B781CFF346B18E60C190635000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C190635356D
          18E73B781CFF366E1AE908100421000000000000000000000000000000000000
          000000000000000000000A15052D366E1AE93B781CFF38751AF81B370D760102
          0004000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000010200041B370D7638751AF83B78
          1CFF366E1AE90A15052D00000000000000000000000000000000000000000000
          0000000000000000000000000000081004212F6217D03B781CFF3B781CFF3266
          18D8162D0B600204010900000000000000000000000000000000000000000000
          0000000000000000000002040109162D0B60326618D83B781CFF3B781CFF2F62
          17D0081004210000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000204010820400F893A741AF93B78
          1CFF3B781CFF37711BF3285113AC1B360D741225094E0F1E073F0E1D073D1225
          094E1B360D74285113AC37711BF33B781CFF3B781CFF3A741AF920400F890204
          0108000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000081004232347
          119938731BF43B781CFF3B781CFF3B781CFF3B781CFF3B781CFF3B781CFF3B78
          1CFF3B781CFF3B781CFF3B781CFF38731BF42348119808100423000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000306010C13270954234710962E5C16C6346B18E638701AF138701AF1346B
          18E62E5C16C623471096132709540306010C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002D16
          042E000000002D16042E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000E674
          12EA572C0759E67412EA00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FB7E
          15FFFB7E15FFFB7E15FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FB7E
          15FFFB7E15FFFB7E15FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004E270750E47212E9FB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF00000000FB7E
          15FFFB7E15FFFB7E15FF00000000FB7E15FFFB7E15FFE37312E84E2707500000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000E47312E8FB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF000000002814
          0329030200032814032900000000FB7E15FFFB7E15FFFB7E15FFE37312E80000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA522110323C161
          0FC4F57B15FAC0600FC322110322A3510EA6FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF27140328C1610FC4FB7E
          15FFFB7E15FFFB7E15FFC0600FC328140329FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF03020003F57B15FBFB7E
          15FFFB7E15FFFB7E15FFF57B15FA04020004FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF28140329C1610FC4FB7E
          15FFFB7E15FFFB7E15FFC1610FC42915032AFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA523110323C161
          0FC4F57B15FBC1610FC422110323A3510EA6FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA52814
          03290402000428140329A3510EA6FB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000FB7E15FFFB7E
          15FFAC560EAF160B021700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF160B0216C56310C8FB7E15FFFB7E15FFFB7E15FFFB7E15FF8F480B920000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFFB7E15FFFB7E15FFAF580FB3030200030000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000FB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFFB7E15FFCB6611CE0C06010C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFE07013E41B0E021B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFEE7713F3301804310000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000E27112E7FB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000F77D15FC4B25064C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004D27064FE27112E7FB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF000000006B36096D00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          200000000000001000000000000000000000000000000000000000000000030A
          101117568B912387D8E22796F0FB2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2796F0FB2387D8E217568B91030A101100000000030A1011237F
          CFD72998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF2998F5FF237FCFD7030A101117558A902998
          F5FF2691EAF41140676C0A263D400A263D400A263D400A263D400A263D400A26
          3D400A263D400A263D400A263D400A263D400A263D400A263D400A263D400A26
          3D400A263D400A263D400A263D400A263D400A263D400A263D400A263D400A26
          3D400A263D400A263D401140676C2691EAF42998F5FF1755898F2387D8E22998
          F5FF1140676C00000000010E131301090C0C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001090C0C010E1313000000001140676C2998F5FF2387D8E22995F1FC2998
          F5FF091F3335010F14140FB2EFF10FAAE6E803212D2D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000321
          2D2D0FAAE6E80FB1F0F2010F1414092034362998F5FF2796F0FB2998F5FF2998
          F5FF081D2E30010A0E0E10ACE7E911BCFEFF10ADE8EA03212D2D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000021A242410AC
          E7E911BCFEFF10ACE7E9010A0E0E081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E300000000003212D2D10ADE8EA11BCFEFF10ADE8EA03212D2D0000
          00000000000000000000000000000004060606475F600A729B9C0A729B9C0647
          5F600004060600000000000000000000000000000000021A24240EA6E1E311BC
          FEFF10ADE8EA03212D2D00000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E30000000000000000003212D2D10ADE8EA11BCFEFF10ADE8EA0321
          2D2D000000000000000002151C1C0E99CDCF11BCFEFF11BCFEFF11BCFEFF11BC
          FEFF0E99CFD102151C1C0000000000000000021A24240EA6E1E311BCFEFF10AD
          E8EA03212D2D0000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E3000000000000000000000000003212D2D10ADE8EA11BCFEFF0EA9
          E5E70106080802151C1C0FA1D9DB11BCFEFF10B5F5F70B77A0A10B77A0A110B5
          F5F711BCFEFF0FA1D9DB02151C1C010608080EA7E0E211BCFEFF10ADE8EA0321
          2D2D000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E300000000000000000000000000000000003212D2D0EA9E5E70EAA
          E4E6021B24240FA1D9DB11BCFEFF0FB5F3F5043142420000000000000000042B
          3A3A10B1EEF011BCFEFF0FA1D9DB021B24240EAAE4E60FAAE6E803212D2D0000
          0000000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E30000000000000000000000000000000000000000001060808021B
          25250FA1D9DB11BCFEFF0FB5F3F5043142420000000000000000000000000000
          00000428373710B1EEF011BCFEFF0FA1D9DB021B242401060808000000000000
          0000000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E30000000000000000000000000000000000000000002151C1C0FA1
          D9DB11BCFEFF0FB5F3F504314242000000000000000000000000000000000000
          0000000000000428373710B1EEF011BCFEFF0FA1D9DB02151C1C000000000000
          0000000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E300000000000000000000000000000000002151C1C0FA1D9DB11BC
          FEFF0FB5F3F50431424200000000000000000000000000000000000000000000
          000000000000000000000428373710B1EEF011BCFEFF0FA1D9DB02151C1C0000
          0000000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E3000000000000000000000000002151C1C0FA1D9DB11BCFEFF0FB5
          F3F5043142420000000000000000000000000000000000000000000000000000
          00000000000000000000000000000428373710B1EEF011BCFEFF0FA1D9DB0215
          1C1C000000000000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E30000000000000000002151C1C0FA1D9DB11BCFEFF0FB5F3F50431
          4242000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000428373710B1EEF011BCFEFF0FA1
          D9DB02151C1C0000000000000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E300000000002141B1B0FA1D9DB11BCFEFF10B1EEF0043142420000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000428373710B1EEF011BC
          FEFF0FA1D9DB02141B1B00000000081D2E302998F5FF2998F5FF2998F5FF2998
          F5FF081D2E30000000000A6C929311BCFEFF10B1EEF004283737000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000428373710B1
          EEF011BCFEFF0A6D939400000000081D2E302998F5FF2998F5FF258EE5EE2998
          F5FF0C2D494C00000000042B3A3A0C84B2B30428373700000000000000000000
          0000000000000000000021481072429221E8449822EF449822EF449822EF4498
          22EF429221E82148107200000000000000000000000000000000000000000428
          37370B85B3B4042B3A3A000000000C2D494C2998F5FF258EE5EE1E6EB1B82998
          F5FF1F76BFC8030B121300000000000000000000000000000000000000000000
          0000000000000B19062849A024FE49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A024FE0B190628000000000000000000000000000000000000
          00000000000000000000030B12131F76BFC82998F5FF1E6EB1B80922373A2794
          EFFA2998F5FF2893EBF6227ECBD3207BC7CF207BC7CF207BC7CF207BC7CF154D
          7D820000000017320B4F49A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF16310B4E00000000154D7D82207BC7CF207BC7CF207B
          C7CF207BC7CF227ECBD32893EBF62998F5FF2796F0FB0922373A000000000D2F
          4C4F258BE0E92998F5FF2998F5FF2998F5FF2998F5FF2998F5FF2998F5FF1A5F
          98A00000000017330B5049A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF17330B50000000001A5F98A02998F5FF2998F5FF2998
          F5FF2998F5FF2998F5FF2998F5FF258BE0E90D304D5000000000000000000000
          0000010508080B2840430F37595D10395C6010395C6010395C600F385A5E081E
          30320000000017330B5049A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF17330B5000000000081E30320F385A5E10395C601039
          5C6010395C600F37595D0B284043010508080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000017330B5049A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF17330B50000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B1906282858148D295B
          1490295B1490337018B249A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF337018B2295B1490295B14902858148D0B1906280000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001F450F6D49A224FF49A2
          24FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF204710700000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001030105306918A749A2
          24FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF49A224FF49A224FF49A224FF306B18A9010301050000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010200032F68
          17A449A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF49A224FF49A224FF2F6817A401020003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000102
          00032F6817A449A224FF49A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF49A224FF2F6817A40102000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010200032B60159649A224FF49A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF49A224FF2C621699010200030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000100012B60159649A224FF49A224FF49A224FF49A224FF49A2
          24FF49A224FF2B60159600010001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000100012B5F149549A224FF49A224FF49A224FF49A2
          24FF2B6015960001000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000224B1177419321E7419321E7224C
          1178000100010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object QDadosProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      '')
    Left = 560
    Top = 328
  end
  object QBuscaItens: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRNF
    SQL.Strings = (
      'SELECT I.*, TS.descricao NOME_GRP,'
      'TS.TIPO_GRP,'
      'CF.DESTACA_ICMS,'
      'CF.USA_CSOSN,'
      'P.NOME_PRO,'
      'P.COD_NCM,'
      'TS.origem_prod ORIG,'
      'TS.cst_pis CST_PIS,'
      'TS.cst_cofins CST_COFINS,'
      'P.CODIGO_BARRA_PRO,'
      'P.DESC_CUPOM,'
      'TS.isento_piscofins ISENTO_PIS_COFINS_PRO,'
      'NCM.nacional ALIQ_IBPT_NAC'
      'FROM ITENS_NOTA_FISCAL I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN CFOP CF'
      'ON (I.COD_CFO = CF.COD_CFO)'
      'LEFT OUTER join TRIBUTACOES_NCMS_SAIDA TS'
      'ON ( TS.ncm = P.cod_ncm and TS.ex = p.ncm_ex and ts.uf=:UF )'
      'left outer join NCM'
      
        'on( NCM.cod_emp = I.cod_emp and NCM.ncm = P.cod_ncm and NCM.ex =' +
        ' P.ncm_ex )'
      'WHERE I.COD_NF = :CODNF'
      'ORDER BY I.ORDEM')
    Left = 344
    Top = 344
    ParamData = <
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CODNF'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'COD_NF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensALIQ: TBCDField
      FieldName = 'ALIQ'
      Origin = 'ALIQ'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QBuscaItensCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensREDUCAO_ICMS: TBCDField
      FieldName = 'REDUCAO_ICMS'
      Origin = 'REDUCAO_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'COD_CFO'
      Required = True
    end
    object QBuscaItensSUB_TRIBUTARIA: TStringField
      FieldName = 'SUB_TRIBUTARIA'
      Origin = 'SUB_TRIBUTARIA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensALIQUOTA_FORA_ESTADO: TBCDField
      FieldName = 'ALIQUOTA_FORA_ESTADO'
      Origin = 'ALIQUOTA_FORA_ESTADO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QBuscaItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QBuscaItensBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensBASE_SUBTRIB: TBCDField
      FieldName = 'BASE_SUBTRIB'
      Origin = 'BASE_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_SUBTRIB: TBCDField
      FieldName = 'VALOR_SUBTRIB'
      Origin = 'VALOR_SUBTRIB'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object QBuscaItensUNIT: TBCDField
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Precision = 18
      Size = 3
    end
    object QBuscaItensISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Origin = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Origin = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'FRETE'
    end
    object QBuscaItensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object QBuscaItensBC_PIS: TBCDField
      FieldName = 'BC_PIS'
      Origin = 'BC_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensBC_COFINS: TBCDField
      FieldName = 'BC_COFINS'
      Origin = 'BC_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
    end
    object QBuscaItensNF_CANCELADA: TIntegerField
      FieldName = 'NF_CANCELADA'
      Origin = 'NF_CANCELADA'
    end
    object QBuscaItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QBuscaItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QBuscaItensCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object QBuscaItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object QBuscaItensNOME_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QBuscaItensTIPO_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_GRP'
      Origin = 'TIPO_GRP'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object QBuscaItensDESTACA_ICMS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTACA_ICMS'
      Origin = 'DESTACA_ICMS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensUSA_CSOSN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USA_CSOSN'
      Origin = 'USA_CSOSN'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensCOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object QBuscaItensORIG: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ORIG'
      Origin = 'ORIGEM_PROD'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensCST_PIS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS_1'
      Origin = 'CST_PIS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensCST_COFINS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS_1'
      Origin = 'CST_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QBuscaItensCODIGO_BARRA_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QBuscaItensDESC_CUPOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensALIQ_IBPT_NAC: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = 'NACIONAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      Calculated = True
    end
    object QBuscaItensTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
    object QBuscaItensISENTO_PIS_COFINS_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = 'ISENTO_PISCOFINS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object IBSQLNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRNF
    Left = 600
    Top = 480
  end
  object IBTRNF: TFDTransaction
    Connection = DM.IBDatabase
    Left = 656
    Top = 416
  end
  object DSQBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 344
    Top = 408
  end
  object QConsCST: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(QUANT * UNIT) TOTAL, CST, ALIQ'
      'FROM ITENS_NOTA_FISCAL'
      'WHERE COD_NF = :CODNF'
      'GROUP BY CST, ALIQ'
      'ORDER BY CST')
    Left = 560
    Top = 424
    ParamData = <
      item
        Name = 'CODNF'
        DataType = ftInteger
      end>
    object QConsCSTTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QConsCSTCST: TStringField
      FieldName = 'CST'
      FixedChar = True
      Size = 3
    end
    object QConsCSTALIQ: TBCDField
      FieldName = 'ALIQ'
      Precision = 18
      Size = 2
    end
  end
  object QConsEstoque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(ESTOQUE) ESTOQUE'
      'FROM ESTOQUE'
      'WHERE COD_PRO = :CODPRO AND COD_EMP = :CODEMP')
    Left = 432
    Top = 376
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
  end
  object QForaEstado: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM ALIQUOTA_PRODUTO_ESTADO'
      'WHERE COD_PRO = :CODPRO AND ESTADO = :ESTADO')
    Left = 424
    Top = 424
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        DataType = ftString
      end>
    object QForaEstadoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.COD_PRO'
      Required = True
    end
    object QForaEstadoESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QForaEstadoALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.ALIQUOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object QForaEstadoCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.COD_CFO'
      Required = True
    end
    object QForaEstadoVR_AGREGADO: TBCDField
      FieldName = 'VR_AGREGADO'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.VR_AGREGADO'
      Precision = 18
      Size = 2
    end
    object QForaEstadoCST: TStringField
      FieldName = 'CST'
      Origin = 'ALIQUOTA_PRODUTO_ESTADO.CST'
      FixedChar = True
      Size = 3
    end
  end
  object QItensRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CFO, ALIQ, SUM(VALOR_TOTAL) VALORTOTAL, SUM(BASE_CALC' +
        'ULO) BASECALCULO, SUM(VALOR_ICMS) VALORICMS, SUM(BASE_SUBTRIB) B' +
        'ASE_ST, SUM(VALOR_SUBTRIB) VALOR_ST, SUM(ISENTAS) ISENTAS, SUM(O' +
        'UTRAS) OUTRAS, SUM(VALOR_IPI) VALOR_IPI'
      'FROM ITENS_NOTA_FISCAL'
      'WHERE COD_NF = :CODNF'
      'GROUP BY COD_CFO, ALIQ')
    Left = 432
    Top = 464
    ParamData = <
      item
        Name = 'CODNF'
      end>
    object QItensRegistroCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Required = True
    end
    object QItensRegistroVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
    object QItensRegistroBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroBASE_ST: TBCDField
      FieldName = 'BASE_ST'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALOR_ST: TBCDField
      FieldName = 'VALOR_ST'
      Precision = 18
      Size = 2
    end
    object QItensRegistroISENTAS: TBCDField
      FieldName = 'ISENTAS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroOUTRAS: TBCDField
      FieldName = 'OUTRAS'
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QItensRegistroALIQ: TBCDField
      FieldName = 'ALIQ'
      Precision = 18
      Size = 2
    end
  end
  object QInsItensRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'INSERT INTO ITENS_REGISTRO_LIVRO_SAIDAS ('
      
        'CODIGO, ORDEM, CFOP, BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUT' +
        'ADA, OUTRAS, ALIQUOTA, CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO,' +
        ' BASE_CALCULO_RETIDO)'
      'VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 536
    Top = 272
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QInsRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_SAIDAS(:DATA, :CNPJ, :CODMODELO, :SERIE, :NUM' +
        'ERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, :CODSAIDA, ' +
        ':UF, :INSC, :NFINAL, :CODMAPA)')
    Left = 640
    Top = 232
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
        Name = 'NFINAL'
      end
      item
        Name = 'CODMAPA'
      end>
    object QInsRegistroSaidaCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QBuscaRegistroSaida: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_SAIDAS R'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)'
      'WHERE R.CODIGO = :COD'
      '')
    Left = 480
    Top = 224
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaRegistroSaidaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaRegistroSaidaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QBuscaRegistroSaidaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QBuscaRegistroSaidaSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QBuscaRegistroSaidaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QBuscaRegistroSaidaEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroSaidaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaRegistroSaidaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroSaidaCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaRegistroSaidaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QBuscaRegistroSaidaUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroSaidaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELO_NOTA_FISCAL.DESCRICAO'
      Required = True
      Size = 80
    end
    object QBuscaRegistroSaidaCODIGO_SAIDA: TIntegerField
      FieldName = 'CODIGO_SAIDA'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_SAIDA'
    end
    object QBuscaRegistroSaidaNUMERO_NOTA_FINAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FINAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.NUMERO_NOTA_FINAL'
    end
    object QBuscaRegistroSaidaCODIGO_MAPA_RESUMO: TIntegerField
      FieldName = 'CODIGO_MAPA_RESUMO'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIGO_MAPA_RESUMO'
    end
    object QBuscaRegistroSaidaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_SAIDAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QBuscaFatura: TFDQuery
    OnCalcFields = QBuscaFaturaCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRFatura
    SQL.Strings = (
      'SELECT *'
      'FROM FATURAS_NOTAS_FISCAIS'
      'WHERE COD_NF = :CODNF'
      'ORDER BY PARCELA')
    Left = 680
    Top = 352
    ParamData = <
      item
        Name = 'CODNF'
      end>
    object QBuscaFaturaCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = 'FATURAS_NOTAS_FISCAIS.COD_NF'
      Required = True
    end
    object QBuscaFaturaPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'FATURAS_NOTAS_FISCAIS.PARCELA'
      Required = True
    end
    object QBuscaFaturaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'FATURAS_NOTAS_FISCAIS.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaFaturaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'FATURAS_NOTAS_FISCAIS.VENCIMENTO'
      Required = True
    end
    object QBuscaFaturaCALC_VENCIMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_VENCIMENTO'
      Size = 10
      Calculated = True
    end
  end
  object IBTRFatura: TFDTransaction
    Connection = DM.IBDatabase
    Left = 648
    Top = 480
  end
  object DSFatura: TDataSource
    AutoEdit = False
    DataSet = QBuscaFatura
    Left = 624
    Top = 352
  end
  object QAuxFatura: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRFatura
    Left = 696
    Top = 488
  end
  object QInsRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_ENTRADAS(:DATA, :CODFOR, :CNPJ, :CODMODELO, :' +
        'SERIE, :NUMERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, ' +
        ':CODENTRADA, :UF, :INSC, :SUBSERIE, :CIFFOB, :CODNF)')
    Left = 424
    Top = 272
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODFOR'
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
        Name = 'CODENTRADA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'SUBSERIE'
      end
      item
        Name = 'CIFFOB'
      end
      item
        Name = 'CODNF'
      end>
    object QInsRegistroEntradaCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QInsItensRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'INSERT INTO ITENS_REGISTRO_LIVRO_ENTRADAS (CODIGO, ORDEM, CFOP,'
      
        'BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA' +
        ',                          CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RET' +
        'IDO, BASE_CALCULO_RETIDO)                           '
      'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 432
    Top = 328
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QBuscaRegistroEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_ENTRADAS R'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)'
      'WHERE R.CODIGO = :COD'
      '')
    Left = 584
    Top = 152
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaRegistroEntradaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaRegistroEntradaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QBuscaRegistroEntradaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QBuscaRegistroEntradaSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QBuscaRegistroEntradaNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QBuscaRegistroEntradaEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroEntradaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaRegistroEntradaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroEntradaCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaRegistroEntradaCODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object QBuscaRegistroEntradaINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QBuscaRegistroEntradaUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroEntradaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object QBuscaRegistroEntradaSUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object QBuscaRegistroEntradaCIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object QBuscaRegistroEntradaCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroEntradaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CODIFICACAO_DOCUMENTOS.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object QInsertNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRNF
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_NOTA_FISCAL(:CODEMP, :CODCLI, :DATAEMISSAO, :DATA' +
        'SAIDA, :HORASAIDA, :CODTRANSP, :TIPONF,'
      ':FRETECONTA, :CODFOR, :TIPOCLIENTE, :CODTPV, :SERIE,'
      ':CF, :QUANTIDADE, :ESPECIE, :MARCA, :NUMERO, :PESOBRUTO,'
      ':PESOLIQUIDO, :DESCONTO, :INFORMACOES)')
    Left = 360
    Top = 440
    ParamData = <
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODCLI'
      end
      item
        Name = 'DATAEMISSAO'
      end
      item
        Name = 'DATASAIDA'
      end
      item
        Name = 'HORASAIDA'
      end
      item
        Name = 'CODTRANSP'
      end
      item
        Name = 'TIPONF'
      end
      item
        Name = 'FRETECONTA'
      end
      item
        Name = 'CODFOR'
      end
      item
        Name = 'TIPOCLIENTE'
      end
      item
        Name = 'CODTPV'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'CF'
      end
      item
        Name = 'QUANTIDADE'
      end
      item
        Name = 'ESPECIE'
      end
      item
        Name = 'MARCA'
      end
      item
        Name = 'NUMERO'
      end
      item
        Name = 'PESOBRUTO'
      end
      item
        Name = 'PESOLIQUIDO'
      end
      item
        Name = 'DESCONTO'
      end
      item
        Name = 'INFORMACOES'
      end>
    object QInsertNFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_NOTA_FISCAL.CODIGO'
    end
    object QInsertNFNUMERONF: TIntegerField
      FieldName = 'NUMERONF'
      Origin = 'SP_INSERT_NOTA_FISCAL.NUMERONF'
    end
  end
  object QGeraParc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'INSERT INTO CONTAS_RECEBER(COD_CTR, SEQUENCIA_CTR, '
      
        'COD_EMP, DATA_CTR, COD_VENDA, COD_CLI, VENCTO_CTR, VALOR_CTR, DT' +
        'PAGTO_CTR, VLRPAGO_CTR, COD_COB, DESCONTO_CONCEDIDO_CTR, DESCONT' +
        'O_CTR, ACRESCIMO_CTR, ACRESCIMO_RECEBIDO_CTR, CAIXA_EMISSAO_CTR,' +
        ' COD_CAI, PARCELA_CTR, DEVOLUCAO_CTR, CODIGO_CLASSIFICACAO)'
      
        'VALUES(GEN_ID(GNT_COD_CONTAS_RECEBER, 1), :SEQ, :CODEMP, :DATACT' +
        'R, :CODVENDA, :CODCLI, :VENCTOCTR, :VALORCTR,  :DTPAGTOCTR, :VLR' +
        'PAGOCTR, :CODCOB, :DESCCONC, :DESC, :ACRES, :ACRESREC, :CAIXAEMI' +
        ', :CODCAI, :PARC, :DEVOL, :CODCLA)')
    Left = 216
    Top = 136
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
        Name = 'DATACTR'
        DataType = ftDate
      end
      item
        Name = 'CODVENDA'
        DataType = ftInteger
      end
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'VENCTOCTR'
        DataType = ftDate
      end
      item
        Name = 'VALORCTR'
        DataType = ftFloat
      end
      item
        Name = 'DTPAGTOCTR'
        DataType = ftDate
      end
      item
        Name = 'VLRPAGOCTR'
        DataType = ftFloat
      end
      item
        Name = 'CODCOB'
        DataType = ftInteger
      end
      item
        Name = 'DESCCONC'
        DataType = ftFloat
      end
      item
        Name = 'DESC'
        DataType = ftFloat
      end
      item
        Name = 'ACRES'
        DataType = ftFloat
      end
      item
        Name = 'ACRESREC'
        DataType = ftFloat
      end
      item
        Name = 'CAIXAEMI'
        DataType = ftInteger
      end
      item
        Name = 'CODCAI'
        DataType = ftInteger
      end
      item
        Name = 'PARC'
        DataType = ftInteger
      end
      item
        Name = 'DEVOL'
        DataType = ftCurrency
      end
      item
        Name = 'CODCLA'
      end>
  end
  object TAB_PRECO: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from CLIENTE_PRECO')
    Left = 544
    Top = 376
    object TAB_PRECOCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"CLIENTE_PRECO"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TAB_PRECOCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = '"CLIENTE_PRECO"."COD_CLIENTE"'
    end
    object TAB_PRECOCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = '"CLIENTE_PRECO"."CLIENTE"'
      Size = 60
    end
    object TAB_PRECOCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = '"CLIENTE_PRECO"."COD_BARRA"'
      Size = 14
    end
    object TAB_PRECOCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = '"CLIENTE_PRECO"."COD_PRODUTO"'
    end
    object TAB_PRECOPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = '"CLIENTE_PRECO"."PRODUTO"'
      Size = 150
    end
    object TAB_PRECOVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = '"CLIENTE_PRECO"."VALOR_VENDA"'
      Precision = 18
      Size = 2
    end
  end
  object QBuscaReferencia: TFDQuery
    BeforePost = QBuscaReferenciaBeforePost
    AfterPost = QBuscaReferenciaAfterPost
    Connection = DM.IBDatabase
    Transaction = IBTRNF
    UpdateObject = upBuscaRefrencia
    SQL.Strings = (
      'SELECT * FROM NOTA_FISCAL_REF '
      'WHERE COD_EMP=:COD_EMP AND COD_NF=:COD_NF')
    Left = 344
    Top = 232
    ParamData = <
      item
        Name = 'COD_EMP'
      end
      item
        Name = 'COD_NF'
      end>
    object QBuscaReferenciaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"NOTA_FISCAL_REF"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QBuscaReferenciaCOD_NF: TIntegerField
      FieldName = 'COD_NF'
      Origin = '"NOTA_FISCAL_REF"."COD_NF"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QBuscaReferenciaCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = '"NOTA_FISCAL_REF"."CHAVE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
  end
  object upBuscaRefrencia: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'insert into NOTA_FISCAL_REF'
      '  (CHAVE, COD_EMP, COD_NF)'
      'values'
      '  (:CHAVE, :COD_EMP, :COD_NF)')
    ModifySQL.Strings = (
      'update NOTA_FISCAL_REF'
      'set'
      '  CHAVE = :CHAVE,'
      '  COD_EMP = :COD_EMP,'
      '  COD_NF = :COD_NF'
      'where'
      '  CHAVE = :OLD_CHAVE and'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_NF = :OLD_COD_NF')
    DeleteSQL.Strings = (
      'delete from NOTA_FISCAL_REF'
      'where'
      '  CHAVE = :OLD_CHAVE and'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_NF = :OLD_COD_NF')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_EMP,'
      '  COD_NF,'
      '  CHAVE'
      'from NOTA_FISCAL_REF '
      'where'
      '  CHAVE = :CHAVE and'
      '  COD_EMP = :COD_EMP and'
      '  COD_NF = :COD_NF')
    Left = 328
    Top = 280
  end
  object dsBuscaReferencias: TDataSource
    DataSet = QBuscaReferencia
    OnStateChange = dsBuscaReferenciasStateChange
    Left = 280
    Top = 240
  end
end
