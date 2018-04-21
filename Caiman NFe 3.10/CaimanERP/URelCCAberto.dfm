object FrmRelCCAberto: TFrmRelCCAberto
  Left = 343
  Top = 334
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Cheques em Aberto'
  ClientHeight = 203
  ClientWidth = 424
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 184
    Width = 424
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GB3: TGroupBox
      Left = 0
      Top = 0
      Width = 424
      Height = 47
      Align = alTop
      Caption = 'Conta Corrente'
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 420
      object BtnConsCC: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Fornecedor'
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
        OnClick = BtnConsCCClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodCC: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar Fornecedor'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodCCEnter
        OnExit = EdtCodCCExit
        OnKeyDown = EdtCodCCKeyDown
        OnKeyPress = EdtCodCCKeyPress
      end
      object EdtNomeCC: TEdit
        Left = 98
        Top = 16
        Width = 311
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
    object GB2: TGroupBox
      Left = 2
      Top = 67
      Width = 420
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 192
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 72
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 224
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object CheckConta: TCheckBox
      Left = 8
      Top = 48
      Width = 273
      Height = 17
      TabStop = False
      Caption = 'Todas as Contas'
      TabOrder = 2
      OnClick = CheckContaClick
    end
    object CheckData: TCheckBox
      Left = 8
      Top = 120
      Width = 121
      Height = 17
      Caption = 'Usar Per'#237'odo'
      TabOrder = 3
      OnClick = CheckDataClick
    end
    object CheckEmp: TCheckBox
      Left = 176
      Top = 120
      Width = 161
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 424
    Height = 39
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnVis: TBitBtn
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object QRelChequesAberto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT L.COD_LAN, L.COD_CONTA, L.DATAEMI_LAN, L.DATAVENC_LAN, L.' +
        'NUM_CHEQUE_LAN, L.VALOR_LAN, L.HISTORICO_LAN, C.NOME_CONTA'
      'FROM LANCAMENTOS_CONTAS_CORRENTE L'
      'INNER JOIN CONTAS_CORRENTE C'
      'ON (L.COD_CONTA = C.COD_CONTA)')
    Left = 312
    Top = 32
    object QRelChequesAbertoCOD_LAN: TIntegerField
      FieldName = 'COD_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.COD_LAN'
      Required = True
    end
    object QRelChequesAbertoCOD_CONTA: TIntegerField
      FieldName = 'COD_CONTA'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.COD_CONTA'
      Required = True
    end
    object QRelChequesAbertoDATAEMI_LAN: TDateField
      FieldName = 'DATAEMI_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAEMI_LAN'
      Required = True
    end
    object QRelChequesAbertoDATAVENC_LAN: TDateField
      FieldName = 'DATAVENC_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAVENC_LAN'
      Required = True
    end
    object QRelChequesAbertoNUM_CHEQUE_LAN: TStringField
      FieldName = 'NUM_CHEQUE_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.NUM_CHEQUE_LAN'
      Size = 10
    end
    object QRelChequesAbertoVALOR_LAN: TBCDField
      FieldName = 'VALOR_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.VALOR_LAN'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelChequesAbertoHISTORICO_LAN: TStringField
      FieldName = 'HISTORICO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.HISTORICO_LAN'
      Required = True
      Size = 100
    end
    object QRelChequesAbertoNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Origin = 'CONTAS_CORRENTE.NOME_CONTA'
      Required = True
      Size = 50
    end
  end
end
