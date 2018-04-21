object FrmConsCCChequesAberto: TFrmConsCCChequesAberto
  Left = 310
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cheque em Aberto [Contas Corrente]'
  ClientHeight = 422
  ClientWidth = 577
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 121
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label2: TLabel
      Left = 352
      Top = 96
      Width = 31
      Height = 17
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GB4: TGroupBox
      Left = 10
      Top = 2
      Width = 407
      Height = 49
      Caption = 'Conta'
      TabOrder = 0
      object BtnConsConta: TsSpeedButton
        Left = 68
        Top = 16
        Width = 23
        Height = 21
        Hint = 'Consultar Tipo de Outras Sa'#237'das'
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
      object cod_conta: TEdit
        Left = 8
        Top = 16
        Width = 57
        Height = 21
        Hint = 
          'Pressione F2 para Consultar Tipo de Outras Sa'#237'das ou deixa vazio' +
          ' para todos os tipos'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = cod_contaEnter
        OnExit = cod_contaExit
        OnKeyDown = cod_contaKeyDown
        OnKeyPress = cod_contaKeyPress
      end
      object EdtNomeConta: TEdit
        Left = 98
        Top = 16
        Width = 287
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
      Left = 10
      Top = 50
      Width = 263
      Height = 47
      Caption = 'Vencimento'
      TabOrder = 1
      object Label1: TLabel
        Left = 128
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object BtnOk: TButton
      Left = 450
      Top = 8
      Width = 63
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 450
      Top = 40
      Width = 63
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object EdtTotal: TCurrencyEdit
      Left = 400
      Top = 91
      Width = 105
      Height = 22
      Margins.Left = 5
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 4
      ZeroEmpty = False
    end
    object CheckTodos: TCheckBox
      Left = 8
      Top = 96
      Width = 265
      Height = 17
      Caption = 'Todos'
      TabOrder = 5
      OnClick = CheckTodosClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 577
    Height = 282
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 573
      Height = 239
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
          Color = clWhite
          Expanded = False
          FieldName = 'COD_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAEMI_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATAVENC_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUM_CHEQUE_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'CHEQUE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 72
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'HISTORICO_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'HIST'#211'RICO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DOCUMENTO_LAN'
          Title.Alignment = taCenter
          Title.Caption = 'DOCUMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_DOC'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DOCUMENTO'
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 232
      Top = 248
      Width = 97
      Height = 25
      Caption = 'Baixar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 403
    Width = 577
    Height = 19
    Panels = <>
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.COD_LAN, C.DATAEMI_LAN, C.DATAVENC_LAN, C.NUM_CHEQUE_LA' +
        'N, C.VALOR_LAN, C.HISTORICO_LAN, C.DOCUMENTO_LAN, D.NOME_DOC'
      'FROM LANCAMENTOS_CONTAS_CORRENTE C'
      'INNER JOIN TIPO_DOCUMENTO D'
      'ON (C.COD_DOC = D.COD_DOC)')
    Left = 168
    Top = 184
    object QConsChequeCOD_LAN: TIntegerField
      FieldName = 'COD_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.COD_LAN'
      Required = True
    end
    object QConsChequeDATAEMI_LAN: TDateField
      FieldName = 'DATAEMI_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAEMI_LAN'
      Required = True
    end
    object QConsChequeDATAVENC_LAN: TDateField
      FieldName = 'DATAVENC_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DATAVENC_LAN'
      Required = True
    end
    object QConsChequeNUM_CHEQUE_LAN: TStringField
      FieldName = 'NUM_CHEQUE_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.NUM_CHEQUE_LAN'
      Size = 10
    end
    object QConsChequeVALOR_LAN: TBCDField
      FieldName = 'VALOR_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.VALOR_LAN'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChequeHISTORICO_LAN: TStringField
      FieldName = 'HISTORICO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.HISTORICO_LAN'
      Required = True
      Size = 100
    end
    object QConsChequeDOCUMENTO_LAN: TStringField
      FieldName = 'DOCUMENTO_LAN'
      Origin = 'LANCAMENTOS_CONTAS_CORRENTE.DOCUMENTO_LAN'
    end
    object QConsChequeNOME_DOC: TStringField
      FieldName = 'NOME_DOC'
      Origin = 'TIPO_DOCUMENTO.NOME_DOC'
      Required = True
      Size = 50
    end
  end
  object DSQConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 168
    Top = 248
  end
  object QBaixa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRBaixa
    SQL.Strings = (
      'UPDATE LANCAMENTOS_CONTAS_CORRENTE'
      'SET CONCILIADO_LAN = 0'
      'WHERE COD_LAN = :COD')
    Left = 432
    Top = 192
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
      end>
  end
  object IBTRBaixa: TFDTransaction
    Connection = DM.IBDatabase
    Left = 432
    Top = 248
  end
end
