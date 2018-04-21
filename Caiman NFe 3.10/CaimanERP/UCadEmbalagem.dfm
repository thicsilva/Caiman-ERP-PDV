inherited FrmCadEmbalagem: TFrmCadEmbalagem
  Left = 314
  Top = 268
  Caption = 'Cadastro de Embalagens'
  ClientHeight = 252
  ClientWidth = 521
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 527
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 521
    Height = 175
    ExplicitWidth = 521
    ExplicitHeight = 175
    object Label17: TLabel
      Left = 8
      Top = 88
      Width = 62
      Height = 13
      Caption = 'Cod.Prod.(*)'
    end
    object BtnConsPro: TsSpeedButton
      Left = 84
      Top = 104
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
    object Label18: TLabel
      Left = 138
      Top = 88
      Width = 111
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
    end
    object BtnAddPro: TsSpeedButton
      Left = 109
      Top = 104
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
    object Label19: TLabel
      Left = 8
      Top = 128
      Width = 35
      Height = 13
      Caption = 'Quant.'
    end
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
      Left = 104
      Top = 128
      Width = 44
      Height = 13
      Caption = 'Unidade'
    end
    object Label4: TLabel
      Left = 88
      Top = 8
      Width = 51
      Height = 13
      Caption = 'C'#243'd.Barra'
    end
    object Label5: TLabel
      Left = 184
      Top = 128
      Width = 29
      Height = 13
      Caption = 'Valor '
    end
    object EdtCodPro: TEdit
      Left = 8
      Top = 104
      Width = 73
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnEnter = EdtCodProEnter
      OnExit = EdtCodProExit
      OnKeyDown = EdtCodProKeyDown
      OnKeyPress = EdtCodProKeyPress
    end
    object EdtNomePro: TEdit
      Left = 138
      Top = 104
      Width = 373
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
    object EdtQuant: TCurrencyEdit
      Left = 8
      Top = 144
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
    object codigo: TEdit
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
    object EdtNome: TEdit
      Left = 8
      Top = 64
      Width = 503
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 2
    end
    object EdtUnidade: TEdit
      Left = 104
      Top = 144
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 4
      TabOrder = 5
    end
    object EdtCodBarra: TEdit
      Left = 88
      Top = 24
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 14
      TabOrder = 1
      OnExit = EdtCodBarraExit
    end
    object edtValor: TCurrencyEdit
      Left = 184
      Top = 144
      Width = 73
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 7
      ZeroEmpty = False
    end
  end
  inherited Panel2: TPanel
    Width = 521
    ExplicitWidth = 521
    inherited ToolBar1: TToolBar
      Width = 521
      ExplicitWidth = 521
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 232
    Width = 521
    ExplicitTop = 232
    ExplicitWidth = 521
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLEmbalagem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREmbalagem
    Left = 352
    Top = 48
  end
  object IBTREmbalagem: TFDTransaction
    Connection = DM.IBDatabase
    Left = 440
    Top = 48
  end
end
