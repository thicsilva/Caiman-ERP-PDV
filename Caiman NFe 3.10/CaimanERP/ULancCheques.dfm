object FrmLancCheques: TFrmLancCheques
  Left = 288
  Top = 225
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento dos Cheques'
  ClientHeight = 410
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
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
      Width = 67
      Height = 13
      Caption = 'Cod.Banco(*)'
    end
    object BtnConsBanco: TsSpeedButton
      Left = 61
      Top = 64
      Width = 21
      Height = 21
      Hint = 'Consultar Banco'
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
      OnClick = BtnConsBancoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnAddBanco: TsSpeedButton
      Left = 86
      Top = 64
      Width = 21
      Height = 21
      Hint = 'Cadastrar Banco'
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
      OnClick = BtnAddBancoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label3: TLabel
      Left = 112
      Top = 48
      Width = 100
      Height = 13
      Caption = 'Descri'#231#227'o da Banco'
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 41
      Height = 13
      Caption = 'Ag'#234'ncia'
    end
    object Label7: TLabel
      Left = 112
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Conta'
    end
    object Label8: TLabel
      Left = 216
      Top = 88
      Width = 84
      Height = 13
      Caption = 'N'#250'mero Cheque'
    end
    object Label10: TLabel
      Left = 320
      Top = 88
      Width = 52
      Height = 13
      Caption = 'Emiss'#227'o(*)'
    end
    object Label11: TLabel
      Left = 408
      Top = 88
      Width = 71
      Height = 13
      Caption = 'Vencimento(*)'
    end
    object Label12: TLabel
      Left = 496
      Top = 88
      Width = 37
      Height = 13
      Caption = 'Valor(*)'
    end
    object Label9: TLabel
      Left = 8
      Top = 128
      Width = 56
      Height = 13
      Caption = 'Emitente(*)'
    end
    object Label13: TLabel
      Left = 8
      Top = 168
      Width = 21
      Height = 13
      Caption = 'Obs'
    end
    object cod_che: TEdit
      Left = 8
      Top = 24
      Width = 55
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object cod_ban: TEdit
      Left = 8
      Top = 64
      Width = 47
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Banco'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = cod_banEnter
      OnExit = cod_banExit
      OnKeyDown = cod_banKeyDown
      OnKeyPress = cod_banKeyPress
    end
    object EdtNomeBanco: TEdit
      Left = 112
      Top = 64
      Width = 281
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
      TabOrder = 12
    end
    object EdtAgencia: TEdit
      Left = 8
      Top = 104
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 10
      TabOrder = 2
    end
    object EdtConta: TEdit
      Left = 112
      Top = 104
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 10
      TabOrder = 3
    end
    object EdtNumero: TEdit
      Left = 216
      Top = 104
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 10
      TabOrder = 4
    end
    object EdtDataEmi: TMaskEdit
      Left = 320
      Top = 104
      Width = 70
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
      OnExit = EdtDataEmiExit
    end
    object EdtDataVenc: TMaskEdit
      Left = 408
      Top = 104
      Width = 71
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
      OnExit = EdtDataEmiExit
    end
    object EdtValor: TCurrencyEdit
      Left = 497
      Top = 104
      Width = 90
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 7
      ZeroEmpty = False
    end
    object EdtEmitente: TEdit
      Left = 8
      Top = 144
      Width = 471
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 8
      OnEnter = EdtEmitenteEnter
    end
    object EdtObs: TEdit
      Left = 8
      Top = 184
      Width = 471
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 9
    end
    object BtnOK: TBitBtn
      Left = 488
      Top = 184
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 10
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 568
      Top = 184
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 11
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 633
    Height = 174
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 633
      Height = 135
      Align = alTop
      Color = clSilver
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
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_BANCO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.BANCO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 226
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMITENTE_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMITENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Visible = True
        end>
    end
    object BtnExcluir: TBitBtn
      Left = 280
      Top = 141
      Width = 65
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 391
    Width = 633
    Height = 19
    Panels = <>
  end
  object IBSQLCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLancCheque
    Left = 240
    Top = 248
  end
  object IBTRLancCheque: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 248
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRLancCheque
    SQL.Strings = (
      
        'SELECT CH.COD_CHE, CH.COD_BANCO, CH.AGENCIA_CHE, CH.CONTA_CHE, C' +
        'H.NUMERO_CHE, CH.EMITENTE_CHE, CH.EMISSAO_CHE, CH.VENCTO_CHE, CH' +
        '.VALOR_CHE, C.NOME_CLI, B.NOME_BAN'
      'FROM CHEQUE CH'
      'INNER JOIN CLIENTE C'
      'ON (CH.COD_CLI = C.COD_CLI)'
      'INNER JOIN BANCO B'
      'ON (CH.COD_BANCO = B.COD_BAN)'
      'WHERE COD_CTR = :CODCTR'
      'ORDER BY CH.COD_CHE')
    Left = 112
    Top = 248
    ParamData = <
      item
        Name = 'CODCTR'
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
    object QConsChequeEMITENTE_CHE: TStringField
      FieldName = 'EMITENTE_CHE'
      Origin = 'CHEQUE.EMITENTE_CHE'
      Size = 50
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
  end
  object DSQConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 112
    Top = 304
  end
end
