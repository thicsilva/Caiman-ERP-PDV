object FrmCtrAdmRec: TFrmCtrAdmRec
  Left = 399
  Top = 335
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber Adm.Cart'#227'o [Recebimento]'
  ClientHeight = 288
  ClientWidth = 410
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 225
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Valor Bruto'
    end
    object Label2: TLabel
      Left = 146
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object Label3: TLabel
      Left = 279
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 68
      Height = 13
      Caption = 'Valor L'#237'quido'
    end
    object Label6: TLabel
      Left = 145
      Top = 56
      Width = 111
      Height = 13
      Caption = 'Data do Recebimento'
    end
    object EdtTotalBruto: TCurrencyEdit
      Left = 8
      Top = 24
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 146
      Top = 24
      Width = 127
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
      TabOrder = 0
      ZeroEmpty = False
      OnExit = EdtAcresExit
    end
    object EdtDesc: TCurrencyEdit
      Left = 279
      Top = 24
      Width = 127
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
      TabOrder = 1
      ZeroEmpty = False
      OnExit = EdtAcresExit
    end
    object EdtTotalLiq: TCurrencyEdit
      Left = 8
      Top = 72
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      ZeroEmpty = False
    end
    object EdtData: TDateTimePicker
      Left = 145
      Top = 72
      Width = 97
      Height = 21
      Date = 37981.618029594900000000
      Time = 37981.618029594900000000
      TabOrder = 2
    end
    object GBCentroCusto: TGroupBox
      Left = 8
      Top = 120
      Width = 393
      Height = 89
      Caption = 'Conta/Centro de Custo'
      TabOrder = 3
      object BtnConsCentroCusto: TsSpeedButton
        Left = 76
        Top = 56
        Width = 23
        Height = 22
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
        OnClick = BtnConsCentroCustoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnConsConta: TsSpeedButton
        Left = 76
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Consultar'
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
        OnClick = BtnConsContaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodCentroCusto: TEdit
        Left = 8
        Top = 56
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Fornecedor'
        TabStop = False
        Alignment = taRightJustify
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
      end
      object EdtCentroCusto: TMaskEdit
        Left = 8
        Top = 56
        Width = 65
        Height = 21
        Color = clSilver
        EditMask = '9.99.999;0;_'
        MaxLength = 8
        TabOrder = 1
        Text = ''
        OnExit = EdtCentroCustoExit
      end
      object EdtNomeCentroCusto: TEdit
        Left = 104
        Top = 56
        Width = 273
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
        TabOrder = 2
      end
      object EdtCodConta: TEdit
        Left = 8
        Top = 24
        Width = 65
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodContaEnter
        OnExit = EdtCodContaExit
        OnKeyDown = EdtCodContaKeyDown
        OnKeyPress = EdtCodContaKeyPress
      end
      object EdtNomeConta: TEdit
        Left = 104
        Top = 24
        Width = 273
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
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 225
    Width = 410
    Height = 44
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 113
      Top = 13
      Width = 73
      Height = 27
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 233
      Top = 13
      Width = 73
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 269
    Width = 410
    Height = 19
    Panels = <>
  end
  object QBaixa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAdm
    SQL.Strings = (
      'UPDATE CONTAS_RECEBER_ADM_CARTAO'
      
        'SET DATA_PAGAMENTO = :DATA, ACRESCIMO = :ACRES, DESCONTO = :DESC' +
        ', VALOR_PAGO = :VALORPAGO'
      'WHERE CODIGO = :CODIGO')
    Left = 264
    Top = 80
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'ACRES'
        DataType = ftCurrency
      end
      item
        Name = 'DESC'
        DataType = ftCurrency
      end
      item
        Name = 'VALORPAGO'
        DataType = ftCurrency
      end
      item
        Name = 'CODIGO'
      end>
  end
  object IBTRAdm: TFDTransaction
    Connection = DM.IBDatabase
    Left = 320
    Top = 56
  end
  object QInsertCC: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_CONTAS_CORRENTE(:CODCONTA, :DATAEMI, :DATAVENC, :' +
        'NUMCHEQUE, :VALOR, :CONC, :DC, :HIST, :CODDOC, :DOC, :CODEMP)')
    Left = 232
    Top = 56
    ParamData = <
      item
        Name = 'CODCONTA'
        DataType = ftInteger
      end
      item
        Name = 'DATAEMI'
        DataType = ftDate
      end
      item
        Name = 'DATAVENC'
        DataType = ftDate
      end
      item
        Name = 'NUMCHEQUE'
        DataType = ftString
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'CONC'
        DataType = ftInteger
      end
      item
        Name = 'DC'
        DataType = ftInteger
      end
      item
        Name = 'HIST'
        DataType = ftString
      end
      item
        Name = 'CODDOC'
        DataType = ftInteger
      end
      item
        Name = 'DOC'
        DataType = ftString
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QInsertCCCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'SP_INSERT_CONTAS_CORRENTE.CODIGO'
    end
  end
end
