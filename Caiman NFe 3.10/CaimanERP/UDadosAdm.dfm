object FrmDadosAdm: TFrmDadosAdm
  Left = 337
  Top = 232
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cart'#227'o'
  ClientHeight = 408
  ClientWidth = 590
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
    Width = 590
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label21: TLabel
      Left = 8
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Bandeira'
    end
    object BtnConsBandeira: TsSpeedButton
      Left = 76
      Top = 24
      Width = 23
      Height = 21
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
      OnClick = BtnConsBandeiraClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label22: TLabel
      Left = 101
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Descri'#231#227'o Bandeira'
    end
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 22
      Height = 13
      Caption = 'Tipo'
    end
    object Label5: TLabel
      Left = 160
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Valor'
    end
    object Label2: TLabel
      Left = 264
      Top = 56
      Width = 69
      Height = 13
      Caption = 'Parcelamento'
    end
    object EdtCodBandeira: TEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodBandeiraEnter
      OnExit = EdtCodBandeiraExit
      OnKeyDown = EdtCodBandeiraKeyDown
      OnKeyPress = EdtCodBandeiraKeyPress
    end
    object EdtNomeBandeira: TEdit
      Left = 101
      Top = 24
      Width = 476
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
    object BtnOK: TBitBtn
      Left = 360
      Top = 69
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 4
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 440
      Top = 69
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object EdtTipo: TEdit
      Left = 8
      Top = 72
      Width = 129
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object EdtValor: TCurrencyEdit
      Left = 160
      Top = 72
      Width = 89
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
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtParcelamento: TEdit
      Left = 264
      Top = 72
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      TabOrder = 3
      OnEnter = EdtParcelamentoEnter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 590
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 586
      Height = 247
      Align = alTop
      Color = clSilver
      DataSource = DSQBuscaParc
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
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 60
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMISSAO'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TAXA'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'BANDEIRA'
          Width = 182
          Visible = True
        end>
    end
    object BtnExcluir: TBitBtn
      Left = 324
      Top = 254
      Width = 77
      Height = 25
      Caption = '&Exclui'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 188
      Top = 254
      Width = 77
      Height = 25
      Caption = '&Alterar'
      TabOrder = 2
      OnClick = BtnAlterarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 590
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/ Finalizar'
  end
  object QBuscaParcelas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT C.CODIGO, C.EMISSAO, C.VENCIMENTO, C.VALOR, C.TAXA,'
      'B.DESCRICAO'
      'FROM CONTAS_RECEBER_ADM_CARTAO C'
      'INNER JOIN BANDEIRAS_CARTAO B'
      'ON (C.CODIGO_BANDEIRA = B.CODIGO)'
      'WHERE C.COD_VEN = :CODVEN'
      'ORDER BY C.CODIGO')
    Left = 248
    Top = 224
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QBuscaParcelasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO'
      Required = True
    end
    object QBuscaParcelasEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.EMISSAO'
      Required = True
    end
    object QBuscaParcelasVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VENCIMENTO'
      Required = True
    end
    object QBuscaParcelasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaParcelasTAXA: TBCDField
      FieldName = 'TAXA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.TAXA'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaParcelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object QDelParcela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'DELETE FROM CONTAS_RECEBER_ADM_CARTAO'
      'WHERE CODIGO = :CODIGO')
    Left = 168
    Top = 272
    ParamData = <
      item
        Name = 'CODIGO'
      end>
  end
  object QGravaParcela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'INSERT INTO CONTAS_RECEBER_ADM_CARTAO (CODIGO,'
      
        'CODIGO_BANDEIRA, EMISSAO, VENCIMENTO, COD_CAI, COD_EMP, COD_VEN,' +
        ' VALOR, VALOR_PAGO, ACRESCIMO, DESCONTO, TAXA, COD_CLI, DOCUMENT' +
        'O, PARCELA)'
      
        'VALUES(GEN_ID(GNT_COD_CTR_ADM, 1), :BAND, :EMISSAO, :VENCTO, :CA' +
        'I, :EMP, :VEN, :VALOR, 0,  0, 0, :TAXA,'
      ':CODCLI, :DOCUMENTO, :PARCELA)')
    Left = 248
    Top = 272
    ParamData = <
      item
        Name = 'BAND'
      end
      item
        Name = 'EMISSAO'
      end
      item
        Name = 'VENCTO'
      end
      item
        Name = 'CAI'
      end
      item
        Name = 'EMP'
      end
      item
        Name = 'VEN'
      end
      item
        Name = 'VALOR'
      end
      item
        Name = 'TAXA'
      end
      item
        Name = 'CODCLI'
      end
      item
        Name = 'DOCUMENTO'
      end
      item
        Name = 'PARCELA'
      end>
  end
  object DSQBuscaParc: TDataSource
    AutoEdit = False
    DataSet = QBuscaParcelas
    Left = 168
    Top = 224
  end
end
