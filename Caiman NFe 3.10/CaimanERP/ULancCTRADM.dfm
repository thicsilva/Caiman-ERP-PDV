inherited FrmLancCTRADM: TFrmLancCTRADM
  Left = 439
  Top = 282
  Caption = 'Lan'#231'amentos Contas a Receber Adm.Cart'#227'o Cr'#233'dito'
  ClientHeight = 266
  ClientWidth = 498
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 498
    Height = 189
    ExplicitWidth = 498
    ExplicitHeight = 189
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label6: TLabel
      Left = 8
      Top = 144
      Width = 60
      Height = 13
      Caption = 'Vencimento'
    end
    object Label4: TLabel
      Left = 304
      Top = 8
      Width = 121
      Height = 13
      Caption = 'N'#250'mero do Documento'
    end
    object Label5: TLabel
      Left = 104
      Top = 144
      Width = 26
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 208
      Top = 144
      Width = 36
      Height = 13
      Caption = 'Taxa(%)'
    end
    object Label7: TLabel
      Left = 8
      Top = 56
      Width = 46
      Height = 13
      Caption = 'Bandeira'
    end
    object BtnConsBandeira: TsSpeedButton
      Left = 76
      Top = 72
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
      OnClick = BtnConsBandeiraClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label8: TLabel
      Left = 106
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object BtnConsCli: TsSpeedButton
      Left = 76
      Top = 112
      Width = 23
      Height = 22
      Hint = 'Consultar Cliente'
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
      OnClick = BtnConsCliClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label22: TLabel
      Left = 106
      Top = 96
      Width = 105
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object Label9: TLabel
      Left = 8
      Top = 96
      Width = 60
      Height = 13
      Caption = 'Cod.Cliente'
    end
    object Label10: TLabel
      Left = 424
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Parcela'
    end
    object Label11: TLabel
      Left = 200
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Cod.Venda'
    end
    object BtnConsVenda: TsSpeedButton
      Left = 276
      Top = 24
      Width = 23
      Height = 21
      Hint = 'Consultar Cliente'
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
      OnClick = BtnConsVendaClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object EdtCodigo: TEdit
      Tag = 1
      Left = 8
      Top = 24
      Width = 71
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
    object EdtEmissao: TMaskEdit
      Left = 104
      Top = 24
      Width = 80
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = EdtEmissaoExit
    end
    object EdtVenc: TMaskEdit
      Left = 8
      Top = 160
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 7
      Text = '  /  /    '
      OnExit = EdtVencExit
    end
    object EdtNumDoc: TEdit
      Left = 304
      Top = 24
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 3
    end
    object EdtValor: TCurrencyEdit
      Left = 104
      Top = 160
      Width = 86
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 8
      ZeroEmpty = False
    end
    object EdtTaxa: TCurrencyEdit
      Left = 208
      Top = 160
      Width = 57
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 9
      ZeroEmpty = False
    end
    object EdtCodBandeira: TEdit
      Left = 8
      Top = 72
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnEnter = EdtCodBandeiraEnter
      OnExit = EdtCodBandeiraExit
      OnKeyDown = EdtCodBandeiraKeyDown
      OnKeyPress = EdtCodBandeiraKeyPress
    end
    object EdtNomeBandeira: TEdit
      Left = 104
      Top = 72
      Width = 385
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
      TabOrder = 10
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 112
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Cliente'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodBandeiraKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 106
      Top = 112
      Width = 383
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
      TabOrder = 11
    end
    object EdtParcela: TEdit
      Left = 424
      Top = 24
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 4
      OnKeyPress = EdtCodBandeiraKeyPress
    end
    object EdtCodVenda: TEdit
      Left = 200
      Top = 24
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 2
      OnKeyPress = EdtCodBandeiraKeyPress
    end
  end
  inherited Panel2: TPanel
    Width = 498
    ExplicitWidth = 498
    inherited ToolBar1: TToolBar
      Width = 498
      ExplicitWidth = 498
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 246
    Width = 498
    ExplicitTop = 246
    ExplicitWidth = 498
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCartao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCartao
    Left = 304
    Top = 176
  end
  object IBTRCartao: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 176
  end
  object QInsert: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCartao
    SQL.Strings = (
      'SELECT *'
      'FROM SP_INSERT_CTR_ADM ('
      ':CODIGO_BANDEIRA,'
      ':DOCUMENTO,'
      ':EMISSAO,'
      ':VENCIMENTO,'
      ':CODCAI,'
      ':CODEMP,'
      ':CODVEN,'
      ':VALOR,'
      ':TAXA,'
      ':CODCLI,'
      ':PARCELA)')
    Left = 424
    Top = 176
    ParamData = <
      item
        Name = 'CODIGO_BANDEIRA'
      end
      item
        Name = 'DOCUMENTO'
      end
      item
        Name = 'EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'VENCIMENTO'
      end
      item
        Name = 'CODCAI'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'CODVEN'
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'TAXA'
        DataType = ftCurrency
      end
      item
        Name = 'CODCLI'
      end
      item
        Name = 'PARCELA'
      end>
    object QInsertCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_CTR_ADM.CODIGO'
    end
  end
end
