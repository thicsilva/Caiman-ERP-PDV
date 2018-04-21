object fmConsultaReceita: TfmConsultaReceita
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consultar Receita'
  ClientHeight = 221
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 9
    Top = 198
    Width = 4
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 634
    Height = 187
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 361
      Top = 12
      Width = 85
      Height = 16
      Caption = 'Digite o CNPJ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 361
      Top = 78
      Width = 96
      Height = 16
      Caption = 'Digite o Captcha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ButBuscar: TBitBtn
      Left = 504
      Top = 80
      Width = 121
      Height = 58
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFDFDFD
        C1C1C1A7A7A7F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D4D6C8C6C89F
        9F9FAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBECD4CBCEC9C7C89595
        95CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE7E8D4CCCFBAB9B98D8D8D
        EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCDDD3CBCEAEAEAE949494FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D0D2CDC7C99A9A9AB4B4B4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CCCEC6C0C2868686E3E3E3FFFFFF
        FBFBFBEDEDEDECECECF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED7CFD1B6B3B3808081A2A2A2949496A3
        A3A49E9EA089898AABABABF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B8B9B7B7B9E4E3E4FCFCFDFFFFFFFFFF
        FFFAFAFAD2D2D2838384E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF1F1F1ADADAFF3F3F3F9F9F9F8F8F8FAFAFAFAFAFAFAFAFA
        FBFBFBECECEC878788F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFAFAFB1ECEBEBF3F3F3F4F4F4F6F6F6F6F6F6F7F7F7F6F6F6F6F6F6F8
        F8F8D8D8D9AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
        BAB9BBF0F0F0EFEFEFF4F4F4F4F4F4F4F4F4F5F5F5F4F4F4F5F5F5F4F4F4F6F6
        F6929293DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEBC8C7C8ED
        EDEDEFEFEFF3F3F3F2F2F2F2F2F2F3F3F3F3F3F3F3F3F3F4F4F4F7F7F7B1B1B2
        C0C0C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BFBEBEEAEAEAEDED
        EDF0F0F0F1F1F1F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F4F4F4B5B5B7C2C2C3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F3ADACACE4E5E4E7E7E7E8E8E8
        E8E8E8E8E8E8EAEAEAEAEAEAECECECEEEEEEF2F2F2AFAFB0DBDBDCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B0B0CACACAF1F1F1EEEEEEEDEDEDEB
        EBEBECECECEEEEEEEFEFEFF2F2F2EBEAEBB1B1B2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7969695DFDFDFF2F3F3EEEEEEEDEDEDEFEF
        EFEFEFEFF2F2F2F0F0F0B2B2B4F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD6D6D69C9B9BCFCFCFE8E8E8EEEEEEF0F0F0ECECEC
        DDDDDDB3B3B4D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E9E9B0B0AFA4A3A3ACACABB0B0AFB0AFAFAEAEAFE5
        E5E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAFAFAE6E6E6D9D8D8DADADAE4E3E4FCFCFCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 2
      OnClick = ButBuscarClick
    end
    object EditCaptcha: TEdit
      Left = 361
      Top = 97
      Width = 137
      Height = 45
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditCNPJ: TMaskEdit
      Left = 361
      Top = 31
      Width = 264
      Height = 45
      EditMask = '00.000.000/0000-00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '  .   .   /    -  '
    end
    object Panel3: TPanel
      Left = 9
      Top = 11
      Width = 346
      Height = 127
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 344
        Height = 106
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        ExplicitLeft = 2
        ExplicitTop = -5
      end
      object LabAtualizarCaptcha: TLabel
        Left = 1
        Top = 107
        Width = 344
        Height = 19
        Cursor = crHandPoint
        Align = alBottom
        Alignment = taCenter
        AutoSize = False
        Caption = 'Atualizar Captcha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        OnClick = LabAtualizarCaptchaClick
      end
    end
    object ckRemoverEspacosDuplos: TCheckBox
      Left = 10
      Top = 150
      Width = 368
      Height = 17
      Caption = 'Remover espa'#231'os duplos dos dados retornados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object ConsultaCNPJ: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 384
    Top = 72
  end
  object ConsultaCPF: TACBrConsultaCPF
    ProxyPort = '8080'
    Left = 384
    Top = 16
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 320
    Top = 104
  end
end
