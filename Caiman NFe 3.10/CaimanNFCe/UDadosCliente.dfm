object FrmDadosCliente: TFrmDadosCliente
  Left = 491
  Top = 163
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es do Cliente'
  ClientHeight = 525
  ClientWidth = 551
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
    Width = 551
    Height = 196
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnConsTPV: TsSpeedButton
      Left = 113
      Top = 35
      Width = 23
      Height = 21
      Hint = 'Consultar Tipo de Venda'
      Flat = True
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
      OnClick = BtnConsTPVClick
    end
    object Label1: TLabel
      Left = 8
      Top = 67
      Width = 94
      Height = 20
      Caption = 'Cod.Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 67
      Width = 167
      Height = 20
      Caption = 'Descri'#231#227'o do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 129
      Height = 20
      Caption = 'Cod.Tipo Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnConsCli: TsSpeedButton
      Left = 113
      Top = 95
      Width = 23
      Height = 21
      Hint = 'Consultar Vendedor Cliente'
      Flat = True
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
      OnClick = BtnConsCliClick
    end
    object Label4: TLabel
      Left = 168
      Top = 8
      Width = 227
      Height = 20
      Caption = 'Descri'#231#227'o do Tipo de Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 273
      Top = 125
      Width = 48
      Height = 13
      Caption = 'Conv'#234'nio:'
    end
    object LConvenio: TLabel
      Left = 329
      Top = 125
      Width = 129
      Height = 13
      AutoSize = False
      Caption = 'LConvenio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCredito: TLabel
      Left = 73
      Top = 125
      Width = 193
      Height = 13
      AutoSize = False
      Caption = 'LCredito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 9
      Top = 125
      Width = 60
      Height = 13
      Caption = 'Tipo Cr'#233'dito:'
    end
    object Autorizado: TLabel
      Left = 9
      Top = 144
      Width = 50
      Height = 13
      Caption = 'Autorizado'
    end
    object EdtCodTPV: TEdit
      Left = 9
      Top = 33
      Width = 97
      Height = 28
      Hint = 'Pressione F2 para Consultar Tipo de Venda'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodTPVEnter
      OnExit = EdtCodTPVExit
      OnKeyDown = EdtCodTPVKeyDown
      OnKeyPress = EdtCodTPVKeyPress
    end
    object EdtNomeTPV: TEdit
      Left = 143
      Top = 32
      Width = 394
      Height = 28
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdtCodCli: TEdit
      Left = 9
      Top = 91
      Width = 97
      Height = 28
      Hint = 'Pressione F2 para Consultar Cliente'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodTPVKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 143
      Top = 91
      Width = 394
      Height = 28
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object EdtAutorizado: TEdit
      Left = 9
      Top = 160
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
      OnKeyDown = EdtAutorizadoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 196
    Width = 551
    Height = 120
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 78
      Height = 13
      Caption = 'Limite de Cr'#233'dito'
    end
    object Label6: TLabel
      Left = 2
      Top = 2
      Width = 547
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Dados do Cliente'
      Color = 14667965
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 98
    end
    object Label7: TLabel
      Left = 120
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Saldo Devedor'
    end
    object Label8: TLabel
      Left = 232
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Saldo Atual'
    end
    object Label9: TLabel
      Left = 344
      Top = 16
      Width = 71
      Height = 13
      Caption = 'Dias em Atraso'
    end
    object Label10: TLabel
      Left = 8
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object MemoObs: TMemo
      Left = 2
      Top = 72
      Width = 547
      Height = 46
      TabStop = False
      Align = alBottom
      ReadOnly = True
      TabOrder = 0
    end
    object EdtDev: TCurrencyEdit
      Left = 120
      Top = 32
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtLimite: TCurrencyEdit
      Left = 8
      Top = 32
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtSaldo: TCurrencyEdit
      Left = 232
      Top = 32
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtDias: TEdit
      Left = 344
      Top = 32
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 356
    Width = 551
    Height = 150
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label12: TLabel
      Left = 2
      Top = 2
      Width = 64
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Presta'#231#245'es'
      Color = 14667965
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object BtnSair: TBitBtn
      Left = 285
      Top = 120
      Width = 65
      Height = 25
      Caption = '&sair'
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
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object BtnExcluir: TBitBtn
      Left = 205
      Top = 120
      Width = 65
      Height = 25
      Caption = '&Exclui'
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
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object Btnalterar: TBitBtn
      Left = 125
      Top = 120
      Width = 65
      Height = 25
      Caption = '&Alterar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FFFF00FFFF00FFB78183FEEED4D3D8A9DFD9ABF5DBB4ED
        D6A7EED29FF1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
        B78183FDEFD9AECE9046AD3889BE6936A72937A7287AB553D6C78AEECC97EECC
        97F3D199B78183FF00FFFF00FFFF00FFB48176FEF3E3CDD9AE20A31C029A0302
        9A03029A03029A0341A82EE6CA95EECC97F3D199B78183FF00FFFF00FFFF00FF
        B48176FFF7EBCCDCB324A51F029A032FA726BBCC8E8CBD680C9C0A90BB63EFCD
        99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF4CBDFBA17A116029A030C
        9D0C9AC57AF4DBBBB8C78887BF69F0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        BA8E85FFFFFDE8EDDBB7D8A6AED399A9CF90AECE90F2DEC0F4DBBAB3D092F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFBAE2B7FBF3ECF7EEDFB1
        D39CAACF90ACCD8EB3CC8EEFDAB6F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        CB9A82FFFFFF8DD28EC1E1BBFBF3EC9CCF8F0D9D0C029A0317A014F6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFF99D69A0D9D0E93D18EC0
        DEB430AA2C029A0324A41FF6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        DCA887FFFFFFF6FBF645B546029A03029A03029A03029A0321A41EFCEFD9E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFE5F5E581CD813B
        B03B38AE378ECD8545AE3DAA8771B8857AB8857AB78183FF00FFFF00FFFF00FF
        E3B18EFFFFFFFFFFFFFFFFFFFFFFFFE8F6E8E7F5E5FFFEF9BEC6A8A2886CE8B2
        70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
        A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = BtnalterarClick
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 547
      Height = 100
      Align = alTop
      DataSource = DSQBuscaParc
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMDOCUMENTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'PARC.'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPAGTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO'
          Width = 67
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 316
    Width = 551
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnOK: TBitBtn
      Left = 136
      Top = 5
      Width = 73
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
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 270
      Top = 5
      Width = 73
      Height = 25
      Caption = '&Cancelar'
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
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
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 506
    Width = 551
    Height = 19
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
  end
  object QConsCTR: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT COD_CTR, VALOR_CTR, VENCTO_CTR'
      'FROM CONTAS_RECEBER'
      'WHERE COD_CLI = :CODCLI AND DTPAGTO_CTR IS NULL'
      'ORDER BY VENCTO_CTR')
    Left = 96
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
    object QConsCTRVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QConsCTRVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsCTRCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
  end
  object IBTRParc: TFDTransaction
    Connection = DM.IBDatabase
    Left = 16
    Top = 376
  end
  object QBuscaParc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParc
    SQL.Strings = (
      
        'SELECT COD_CTR, SEQUENCIA_CTR, COD_EMP, DATA_CTR, COD_VENDA, COD' +
        '_CLI, VENCTO_CTR, VALOR_CTR, DTPAGTO_CTR,'
      'NUMDOCUMENTO_CTR, PARCELA_CTR'
      'FROM CONTAS_RECEBER'
      'WHERE COD_VENDA = :CODVENDA'
      'ORDER BY SEQUENCIA_CTR')
    Left = 296
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptUnknown
      end>
    object QBuscaParcCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QBuscaParcSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QBuscaParcCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QBuscaParcDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QBuscaParcCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QBuscaParcCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QBuscaParcVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QBuscaParcVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaParcDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QBuscaParcNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QBuscaParcPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
  end
  object DSQBuscaParc: TDataSource
    AutoEdit = False
    DataSet = QBuscaParc
    Left = 392
    Top = 376
  end
  object QDelParcelas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParc
    SQL.Strings = (
      '')
    Left = 152
    Top = 376
  end
  object QAtualizaVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'UPDATE VENDAS SET COD_TPV = :CODTPV, COD_CLI = :CODCLI,'
      'DESC_PESSOA_AUTORIZADA = :PESSOA'
      'WHERE COD_VEN = :CODVEN')
    Left = 80
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODTPV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODVEN'
        ParamType = ptUnknown
      end>
  end
  object QGeraParc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParc
    SQL.Strings = (
      'INSERT INTO CONTAS_RECEBER(COD_CTR, SEQUENCIA_CTR, '
      
        'COD_EMP, DATA_CTR, COD_VENDA, COD_CLI, VENCTO_CTR, VALOR_CTR, CA' +
        'IXA_EMISSAO_CTR, PARCELA_CTR, DTPAGTO_CTR, VLRPAGO_CTR, COD_COB,' +
        ' NUMDOCUMENTO_CTR, CODIGO_CLASSIFICACAO)'
      
        'VALUES(GEN_ID(GNT_COD_CONTAS_RECEBER, 1), :SEQ, :CODEMP, :DATACT' +
        'R, :CODVENDA, :CODCLI, :VENCTOCTR, :VALORCTR, :CODCAI, :PARC, :D' +
        'TPAGTOCTR, :VLRPAGOCTR, :CODCOB, :DOCUMENTO, :CODCLA)')
    Left = 80
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SEQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODEMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATACTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'VENCTOCTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORCTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODCAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PARC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTPAGTOCTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VLRPAGOCTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODCLA'
        ParamType = ptUnknown
      end>
  end
  object QBuscaTPV: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_VENDA'
      'WHERE COD_TPV = :CODTPV')
    Left = 224
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODTPV'
        ParamType = ptUnknown
      end>
    object QBuscaTPVCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'TIPO_VENDA.COD_TPV'
      Required = True
    end
    object QBuscaTPVNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
    object QBuscaTPVQTDPARCELAS_TPV: TIntegerField
      FieldName = 'QTDPARCELAS_TPV'
      Origin = 'TIPO_VENDA.QTDPARCELAS_TPV'
      Required = True
    end
    object QBuscaTPVDIASPRIPARC_TPV: TIntegerField
      FieldName = 'DIASPRIPARC_TPV'
      Origin = 'TIPO_VENDA.DIASPRIPARC_TPV'
    end
    object QBuscaTPVDIASENTREPARC_TPV: TIntegerField
      FieldName = 'DIASENTREPARC_TPV'
      Origin = 'TIPO_VENDA.DIASENTREPARC_TPV'
    end
    object QBuscaTPVPOSSUI_ENTRADA: TStringField
      FieldName = 'POSSUI_ENTRADA'
      Origin = 'TIPO_VENDA.POSSUI_ENTRADA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaTPVPERC_ENTRADA: TBCDField
      FieldName = 'PERC_ENTRADA'
      Origin = 'TIPO_VENDA.PERC_ENTRADA'
      Precision = 18
      Size = 2
    end
    object QBuscaTPVTABELA_PRECO_TPV: TStringField
      FieldName = 'TABELA_PRECO_TPV'
      Origin = 'TIPO_VENDA.TABELA_PRECO_TPV'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT NOME_CLI, ENDRES_CLI, CNPJ_CLI, BAIRES_CLI, CIDRES_CLI, E' +
        'STRES_CLI, DOC_CLI'
      'FROM CLIENTE'
      'WHERE COD_CLI = :COD')
    Left = 16
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
  object QNumeroCupom: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT CUPOM_FISCAL_VEN'
      'FROM VENDAS'
      'WHERE COD_VEN = :CODVEN')
    Left = 392
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODVEN'
        ParamType = ptUnknown
      end>
  end
end
