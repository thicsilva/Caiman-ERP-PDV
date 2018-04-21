object FrmRelEnvelope: TFrmRelEnvelope
  Left = 298
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o Envelope'
  ClientHeight = 280
  ClientWidth = 606
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 261
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 145
      Height = 49
      Caption = 'Cliente/Fornecedor'
      TabOrder = 0
      object ComboCliFor: TComboBox
        Left = 8
        Top = 19
        Width = 129
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 0
        OnChange = ComboCliForChange
        Items.Strings = (
          'CLIENTE'
          'FORNECEDOR')
      end
    end
    object GB: TGroupBox
      Left = 159
      Top = 8
      Width = 362
      Height = 49
      Caption = 'Cliente'
      TabOrder = 1
      object BtnCons: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Conv'#234'nio'
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
        OnClick = BtnConsClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCod: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Conv'#234'nio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodEnter
        OnExit = EdtCodExit
        OnKeyDown = EdtCodKeyDown
        OnKeyPress = EdtCodKeyPress
      end
      object EdtNome: TEdit
        Left = 88
        Top = 18
        Width = 265
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
        TabOrder = 1
      end
    end
    object BtnOK: TBitBtn
      Left = 533
      Top = 14
      Width = 65
      Height = 25
      Caption = '&Ok'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 533
      Top = 78
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object GBDados: TGroupBox
      Left = 8
      Top = 64
      Width = 513
      Height = 185
      Caption = 'Dados'
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label2: TLabel
        Left = 8
        Top = 96
        Width = 31
        Height = 13
        Caption = 'Bairro'
      end
      object Label3: TLabel
        Left = 248
        Top = 96
        Width = 75
        Height = 13
        Caption = 'Cidade/Estado'
      end
      object Label4: TLabel
        Left = 8
        Top = 136
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label5: TLabel
        Left = 96
        Top = 136
        Width = 42
        Height = 13
        Caption = 'Contato'
      end
      object Label6: TLabel
        Left = 8
        Top = 16
        Width = 30
        Height = 13
        Caption = 'Nome'
      end
      object EdtEnd: TEdit
        Left = 8
        Top = 72
        Width = 473
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EdtBairro: TEdit
        Left = 8
        Top = 112
        Width = 233
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EdtCid: TEdit
        Left = 248
        Top = 112
        Width = 233
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EdtCEP: TMaskEdit
        Left = 8
        Top = 152
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '99999-999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 3
        Text = '     -   '
      end
      object EdtContato: TEdit
        Left = 96
        Top = 152
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EdtNomeEmpresa: TEdit
        Left = 8
        Top = 32
        Width = 473
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object BtnImp: TBitBtn
      Left = 533
      Top = 46
      Width = 65
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = BtnImpClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 261
    Width = 606
    Height = 19
    Panels = <>
  end
  object MP: TMatrixPrinter
    Left = 552
    Top = 136
  end
end
