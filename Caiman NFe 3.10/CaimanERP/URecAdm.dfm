object FrmRECADM: TFrmRECADM
  Left = 320
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber Adm.Cart'#227'o de Cr'#233'dito'
  ClientHeight = 565
  ClientWidth = 835
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
    Width = 835
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label21: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Administradora'
    end
    object BtnConsAdm: TsSpeedButton
      Left = 76
      Top = 24
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
      OnClick = BtnConsAdmClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label22: TLabel
      Left = 106
      Top = 8
      Width = 147
      Height = 13
      Caption = 'Descri'#231#227'o da Administradora'
    end
    object EdtCodAdm: TEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      Hint = 'Pressione F2 para Consultar '
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodAdmEnter
      OnExit = EdtCodAdmExit
      OnKeyDown = EdtCodAdmKeyDown
      OnKeyPress = EdtCodAdmKeyPress
    end
    object EdtNomeAdm: TEdit
      Left = 104
      Top = 24
      Width = 425
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
      TabOrder = 3
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 48
      Width = 121
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
    object BtnOk: TButton
      Left = 552
      Top = 20
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 640
      Top = 20
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 501
    Width = 835
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSel: TButton
      Left = 293
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Se&lecionar'
      TabOrder = 0
      OnClick = BtnSelClick
    end
    object BtnRec: TButton
      Left = 446
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Baixar'
      TabOrder = 1
      OnClick = BtnRecClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 546
    Width = 835
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 121
    Width = 835
    Height = 380
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object PC: TPageControl
      Left = 0
      Top = 0
      Width = 835
      Height = 380
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PCChange
      object TabSheet1: TTabSheet
        Caption = 'A Receber'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 827
          Height = 352
          Align = alClient
          Color = clSilver
          DataSource = DSQRecAdm
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'COD.'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'BANDEIRA'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARCELA'
              Title.Alignment = taCenter
              Title.Caption = 'PARC.'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'VENCTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAXA'
              Title.Alignment = taCenter
              Title.Caption = 'TAXA(%)'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Title.Alignment = taCenter
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Title.Alignment = taCenter
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Width = 297
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_TPV'
              Title.Alignment = taCenter
              Title.Caption = 'TIPO DE VENDA'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'VENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_DUPLICATA'
              Title.Alignment = taCenter
              Title.Caption = 'DUPLICATA'
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Recebidas'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 823
          Height = 348
          Align = alClient
          Color = clGradientInactiveCaption
          DataSource = DSQRecAdm
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'EMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'VENCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'VENCTO'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'DTPAGTO_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'PAGTO.'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'VALOR_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Width = 69
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'TAXA_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'TAXA'
              Width = 34
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'LIQUIDO'
              Title.Alignment = taCenter
              Width = 66
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'ACRESCIMO_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'ACR'#201'SC.'
              Width = 57
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'DESCONTO_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'DESCONTO'
              Width = 63
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'VALORPAGO_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'VL.PAGO'
              Width = 67
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'NOME_TPV'
              Title.Alignment = taCenter
              Title.Caption = 'TIPO VENDA'
              Width = 155
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'DOCUMENTO_CTRADM'
              Title.Alignment = taCenter
              Title.Caption = 'DOCUMENTO'
              Width = 89
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'VENDA'
              Width = 51
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 35
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 39
              Visible = True
            end>
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 65
    Width = 835
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 4
    object Label4: TLabel
      Left = 43
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Total Bruto'
    end
    object Label7: TLabel
      Left = 652
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Total L'#237'quido'
    end
    object Label6: TLabel
      Left = 196
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Vl. Ref.Taxa'
    end
    object Label1: TLabel
      Left = 500
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label2: TLabel
      Left = 348
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object EdtTotalBruto: TCurrencyEdit
      Left = 44
      Top = 24
      Width = 93
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
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtTotalLiq: TCurrencyEdit
      Left = 652
      Top = 24
      Width = 93
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
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtValorTaxa: TCurrencyEdit
      Left = 196
      Top = 24
      Width = 93
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
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtDesc: TCurrencyEdit
      Left = 500
      Top = 24
      Width = 93
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
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 348
      Top = 24
      Width = 93
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
  end
  object QRecAdm: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRecAdm
    SQL.Strings = (
      
        'SELECT R.*, (R.VALOR -  ((R.VALOR * R.TAXA) / 100)) AS LIQUIDO, ' +
        '  T.NOME_TPV, C.NOME_CLI, B.DESCRICAO'
      'FROM CONTAS_RECEBER_ADM_CARTAO R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN BANDEIRAS_CARTAO B'
      'ON (R.CODIGO_BANDEIRA = B.CODIGO)'
      'INNER JOIN ADMINISTRADORA_CARTAO A'
      'ON (B.CODIGO_ADMINISTRADORA = A.CODIGO)'
      'LEFT JOIN VENDAS V'
      'ON (R.COD_VEN = V.COD_VEN)'
      'LEFT JOIN TIPO_VENDA T'
      'ON (V.COD_TPV = T.COD_TPV)'
      '')
    Left = 152
    Top = 232
    object QRecAdmCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO'
      Required = True
    end
    object QRecAdmCODIGO_BANDEIRA: TIntegerField
      FieldName = 'CODIGO_BANDEIRA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO_BANDEIRA'
      Required = True
    end
    object QRecAdmDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DOCUMENTO'
    end
    object QRecAdmEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.EMISSAO'
      Required = True
    end
    object QRecAdmVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VENCIMENTO'
      Required = True
    end
    object QRecAdmDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DATA_PAGAMENTO'
    end
    object QRecAdmCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_CAI'
      Required = True
    end
    object QRecAdmCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_EMP'
      Required = True
    end
    object QRecAdmCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_VEN'
    end
    object QRecAdmVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecAdmVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.VALOR_PAGO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecAdmACRESCIMO: TBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.ACRESCIMO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecAdmDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.DESCONTO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecAdmTAXA: TBCDField
      FieldName = 'TAXA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.TAXA'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecAdmCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.CODIGO_DUPLICATA'
    end
    object QRecAdmLIQUIDO: TBCDField
      FieldName = 'LIQUIDO'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
    end
    object QRecAdmNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Size = 50
    end
    object QRecAdmCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.COD_CLI'
      Required = True
    end
    object QRecAdmNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRecAdmPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'CONTAS_RECEBER_ADM_CARTAO.PARCELA'
      Required = True
    end
    object QRecAdmDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object DSQRecAdm: TDataSource
    AutoEdit = False
    DataSet = QRecAdm
    Left = 152
    Top = 288
  end
  object IBTRRecAdm: TFDTransaction
    Connection = DM.IBDatabase
    Left = 152
    Top = 352
  end
end
