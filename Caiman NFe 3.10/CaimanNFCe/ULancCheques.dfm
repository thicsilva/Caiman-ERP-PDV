object FrmLancCheques: TFrmLancCheques
  Left = 297
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento dos Cheques'
  ClientHeight = 461
  ClientWidth = 633
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 257
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 13
      Caption = 'Cod.Cliente'
    end
    object BtnConsCli: TsSpeedButton
      Left = 58
      Top = 64
      Width = 21
      Height = 21
      Hint = 'Consultar Cliente'
      Flat = True
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
      OnClick = BtnConsCliClick
    end
    object Label22: TLabel
      Left = 8
      Top = 88
      Width = 63
      Height = 13
      Caption = 'Cod.Emitente'
    end
    object BtnConsEmitente: TsSpeedButton
      Left = 58
      Top = 104
      Width = 21
      Height = 21
      Hint = 'Consultar Cliente'
      Flat = True
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
      OnClick = BtnConsEmitenteClick
    end
    object Label2: TLabel
      Left = 8
      Top = 128
      Width = 53
      Height = 13
      Caption = 'Cod.Banco'
    end
    object BtnConsBanco: TsSpeedButton
      Left = 58
      Top = 144
      Width = 21
      Height = 21
      Hint = 'Consultar Banco'
      Flat = True
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
      OnClick = BtnConsBancoClick
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 39
      Height = 13
      Caption = 'Ag'#234'ncia'
    end
    object Label7: TLabel
      Left = 112
      Top = 168
      Width = 28
      Height = 13
      Caption = 'Conta'
    end
    object Label8: TLabel
      Left = 216
      Top = 168
      Width = 77
      Height = 13
      Caption = 'N'#250'mero Cheque'
    end
    object Label10: TLabel
      Left = 320
      Top = 168
      Width = 39
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label11: TLabel
      Left = 408
      Top = 168
      Width = 56
      Height = 13
      Caption = 'Vencimento'
    end
    object Label12: TLabel
      Left = 496
      Top = 168
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label13: TLabel
      Left = 8
      Top = 204
      Width = 19
      Height = 13
      Caption = 'Obs'
    end
    object Label5: TLabel
      Left = 84
      Top = 48
      Width = 98
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object Label23: TLabel
      Left = 84
      Top = 88
      Width = 107
      Height = 13
      Caption = 'Descri'#231#227'o do Emitente'
    end
    object Label3: TLabel
      Left = 84
      Top = 128
      Width = 97
      Height = 13
      Caption = 'Descri'#231#227'o do Banco'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label19: TLabel
      Left = 84
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Dias'
    end
    object BtnOK: TBitBtn
      Left = 416
      Top = 216
      Width = 65
      Height = 25
      Caption = '&OK'
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
      TabOrder = 14
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 496
      Top = 216
      Width = 65
      Height = 25
      Caption = '&Sair'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA64308C25E03AA4707FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFA13E08C66203C86402A54207FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E07C05B03C86402A54207FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E07
        BD5B09D16C03A74407FF00FFFF00FFA44108AC4906AC4906AC4906AC4906AC48
        06AC4806AC4906A33F07FF00FFAD4C0DE0831DB3510AFF00FFFF00FFFF00FFB7
        5305CF6A01CD6701CD6801CC6701CC6701CD6801C66102A33F079E3A05D47B28
        D67C259E3906FF00FFFF00FFFF00FFA64307AE4A06AD4A06AB4806B34F06CE69
        01CF6A01C56102A33F07A5420AF1A444BD621CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF9F3D08C45F03C96402BD5804C76201A23F07A9470DF4AA49
        B55818FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E08C05B03D06B01AB47
        07B45005C96401A23F07A6440CF4AB49C76D24983301FF00FFFF00FFFF00FFFF
        00FFA13E07C25D03D26C00B24E069C3909B65205C96401A23F079D3805DE8C36
        F5AA48AA490E9B36039B36039B3603AB490CCE6F12D16E05B44F05FF00FFFF00
        FFB65205C96401A23F07FF00FFAA480EF2A746F9B04CCA7026C16620D6812EF3
        A139DB8121AA490AFF00FFFF00FFFF00FFB75205C96401A23F07FF00FFFF00FF
        A9470CCF7A2CF1A344F8AB4AEEA143C86D23A4410AFF00FFFF00FFFF00FFFF00
        FFB55105C86301A23F07FF00FFFF00FFFF00FF9F3C06A8460CAF5012A7450C9D
        3905FF00FFFF00FFFF00FFFF00FFFF00FFA54208AA4707A23F07FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 15
      OnClick = BtnSairClick
    end
    object EdtCodCliente: TEdit
      Left = 8
      Top = 64
      Width = 47
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = EdtCodClienteEnter
      OnExit = EdtCodClienteExit
      OnKeyDown = EdtCodClienteKeyDown
      OnKeyPress = EdtCodClienteKeyPress
    end
    object EdtCodEmitente: TEdit
      Left = 8
      Top = 104
      Width = 47
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnEnter = EdtCodEmitenteEnter
      OnExit = EdtCodClienteExit
      OnKeyDown = EdtCodEmitenteKeyDown
      OnKeyPress = EdtCodClienteKeyPress
    end
    object EdtCodBanco: TEdit
      Left = 8
      Top = 144
      Width = 47
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Banco'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnEnter = EdtCodBancoEnter
      OnExit = EdtCodBancoExit
      OnKeyDown = EdtCodBancoKeyDown
      OnKeyPress = EdtCodClienteKeyPress
    end
    object EdtAgencia: TEdit
      Left = 8
      Top = 184
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 7
    end
    object EdtConta: TEdit
      Left = 112
      Top = 184
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 8
    end
    object EdtNumero: TEdit
      Left = 216
      Top = 184
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 9
    end
    object EdtDataEmi: TMaskEdit
      Left = 320
      Top = 184
      Width = 70
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 10
      Text = '  /  /    '
    end
    object EdtDataVenc: TMaskEdit
      Left = 408
      Top = 184
      Width = 71
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 11
      Text = '  /  /    '
    end
    object EdtValor: TCurrencyEdit
      Left = 495
      Top = 184
      Width = 90
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 12
      ZeroEmpty = False
    end
    object EdtObs: TEdit
      Left = 8
      Top = 220
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 13
    end
    object EdtNomeCliente: TEdit
      Left = 85
      Top = 61
      Width = 389
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdtNomeEmitente: TEdit
      Left = 84
      Top = 104
      Width = 389
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object EdtNomeBanco: TEdit
      Left = 84
      Top = 144
      Width = 389
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object cod_che: TEdit
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
      TabOrder = 16
    end
    object EdtDias: TEdit
      Left = 84
      Top = 24
      Width = 41
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      OnEnter = EdtDiasEnter
      OnExit = EdtDiasExit
      OnKeyPress = EdtCodClienteKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 633
    Height = 185
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 629
      Height = 151
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSQConsCheque
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
          Color = 16776176
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 56
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'COD_BANCO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.BANCO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 226
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'CONTA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 72
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 303
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Alignment = taCenter
          Width = 262
          Visible = True
        end>
    end
    object BtnExcluir: TBitBtn
      Left = 280
      Top = 157
      Width = 65
      Height = 25
      Caption = '&Excluir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 442
    Width = 633
    Height = 19
    Panels = <>
  end
  object IBSQLCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLancCheque
    Left = 240
    Top = 296
  end
  object IBTRLancCheque: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 296
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLancCheque
    SQL.Strings = (
      
        'SELECT CH.COD_CHE, CH.COD_BANCO, CH.AGENCIA_CHE, CH.CONTA_CHE, C' +
        'H.NUMERO_CHE,  CH.EMISSAO_CHE, CH.VENCTO_CHE, CH.VALOR_CHE, CH.d' +
        'esc_cli NOME_CLI,'
      'CH.desc_emi EMITENTE, CH.desc_banco NOME_BAN'
      'FROM CHEQUE CH'
      'WHERE COD_VENDA = :CODVENDA'
      'ORDER BY CH.COD_CHE')
    Left = 88
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptUnknown
      end>
    object QConsChequeCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QConsChequeCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUE.COD_BANCO'
      Required = True
    end
    object QConsChequeAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QConsChequeCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QConsChequeNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QConsChequeEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QConsChequeVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
    object QConsChequeVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChequeNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsChequeNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QConsChequeEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object DSQConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 88
    Top = 336
  end
end
