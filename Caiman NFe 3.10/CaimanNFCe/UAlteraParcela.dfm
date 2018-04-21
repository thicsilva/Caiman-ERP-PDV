object FrmAlteraParcela: TFrmAlteraParcela
  Left = 406
  Top = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alterar Parcelas'
  ClientHeight = 162
  ClientWidth = 328
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 105
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Seq.'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 75
      Height = 13
      Caption = 'Data Emiss'#227'o(*)'
    end
    object Label4: TLabel
      Left = 104
      Top = 48
      Width = 64
      Height = 13
      Caption = 'Data Venc.(*)'
    end
    object Label6: TLabel
      Left = 200
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Valor(*)'
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtSeq: TEdit
      Left = 88
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdtDataEmi: TMaskEdit
      Left = 8
      Top = 64
      Width = 81
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = EdtDataEmiExit
    end
    object EdtDataVen: TMaskEdit
      Left = 104
      Top = 64
      Width = 81
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = EdtDataVenExit
    end
    object EdtValor: TCurrencyEdit
      Left = 200
      Top = 64
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 4
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 328
    Height = 38
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 77
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Ok'
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 173
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 143
    Width = 328
    Height = 19
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
  end
  object QUpdParc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'UPDATE CONTAS_RECEBER '
      
        'SET DATA_CTR = :DATACTR, VENCTO_CTR = :VENCTOCTR, VALOR_CTR = :V' +
        'ALORCTR '
      'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ')
    Left = 176
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATACTR'
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
        Name = 'CODCTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQ'
        ParamType = ptUnknown
      end>
  end
end
