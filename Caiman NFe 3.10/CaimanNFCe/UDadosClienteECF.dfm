object FrmDadosClienteECF: TFrmDadosClienteECF
  Left = 378
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Cliente [ECF]'
  ClientHeight = 194
  ClientWidth = 452
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 137
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 52
      Height = 13
      Caption = 'CNPJ/CPF'
    end
    object EdtNome: TEdit
      Left = 8
      Top = 24
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 84
      TabOrder = 0
    end
    object EdtEnd: TEdit
      Left = 8
      Top = 64
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 84
      TabOrder = 1
    end
    object EdtCNPJ: TEdit
      Left = 8
      Top = 104
      Width = 433
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 84
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 452
    Height = 38
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TBitBtn
      Left = 189
      Top = 8
      Width = 75
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
      TabOrder = 0
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 175
    Width = 452
    Height = 19
    Panels = <>
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CLI, NOME_CLI, ENDRES_CLI, CNPJ_CLI, CIDRES_CLI, ESTR' +
        'ES_CLI'
      'FROM CLIENTE'
      'WHERE COD_CLI = :COD')
    Left = 376
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD'
        ParamType = ptUnknown
      end>
  end
end
