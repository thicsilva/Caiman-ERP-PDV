object FrmFichaCliente: TFrmFichaCliente
  Left = 264
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ficha do Cliente'
  ClientHeight = 450
  ClientWidth = 667
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
    Width = 667
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 60
      Height = 13
      Caption = 'C'#243'd.Cliente'
    end
    object BtnConsCli: TsSpeedButton
      Left = 68
      Top = 22
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
      OnClick = BtnConsCliClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label2: TLabel
      Left = 95
      Top = 6
      Width = 105
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 22
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Cliente'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodCliKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 95
      Top = 22
      Width = 370
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
    object BtnOk: TButton
      Left = 472
      Top = 20
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 552
      Top = 20
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 48
      Width = 121
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 667
    Height = 120
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cliente Desde:'
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #218'ltima Consulta SPC:'
    end
    object Label5: TLabel
      Left = 8
      Top = 64
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Compras:'
    end
    object Label6: TLabel
      Left = 8
      Top = 80
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Atraso M'#233'dio:'
    end
    object Label7: TLabel
      Left = 8
      Top = 96
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'N'#186' de Cheques:'
    end
    object Label8: TLabel
      Left = 368
      Top = 32
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Renda:'
    end
    object Label9: TLabel
      Left = 368
      Top = 48
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pend'#234'ncias:'
    end
    object Label10: TLabel
      Left = 368
      Top = 64
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Limite de Cr'#233'dito:'
    end
    object Label11: TLabel
      Left = 368
      Top = 80
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A Depositar:'
    end
    object Label12: TLabel
      Left = 352
      Top = 96
      Width = 121
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cheques Devolvidos:'
    end
    object Label13: TLabel
      Left = 8
      Top = 8
      Width = 105
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Situa'#231#227'o:'
    end
    object LSit: TLabel
      Left = 128
      Top = 8
      Width = 23
      Height = 17
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCD: TLabel
      Left = 128
      Top = 32
      Width = 19
      Height = 13
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LSPC: TLabel
      Left = 128
      Top = 48
      Width = 19
      Height = 13
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LCompras: TLabel
      Left = 128
      Top = 64
      Width = 19
      Height = 13
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LAM: TLabel
      Left = 128
      Top = 80
      Width = 19
      Height = 13
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNC: TLabel
      Left = 128
      Top = 96
      Width = 19
      Height = 13
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LRenda: TLabel
      Left = 480
      Top = 32
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LPend: TLabel
      Left = 480
      Top = 48
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LLimite: TLabel
      Left = 480
      Top = 64
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LADep: TLabel
      Left = 480
      Top = 80
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LChequeDev: TLabel
      Left = 480
      Top = 96
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LSit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 390
    Width = 667
    Height = 41
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnPrest: TBitBtn
      Left = 93
      Top = 8
      Width = 72
      Height = 25
      Caption = '&Presta'#231#245'es'
      TabOrder = 0
      OnClick = BtnPrestClick
    end
    object BtnAvulsa: TBitBtn
      Left = 193
      Top = 8
      Width = 74
      Height = 25
      Caption = '&Avulsas'
      TabOrder = 1
      OnClick = BtnAvulsaClick
    end
    object BtnItens: TBitBtn
      Left = 294
      Top = 8
      Width = 76
      Height = 25
      Caption = '&Itens'
      TabOrder = 2
      OnClick = BtnItensClick
    end
    object BtnCheques: TBitBtn
      Left = 395
      Top = 8
      Width = 78
      Height = 25
      Caption = '&Cheques'
      TabOrder = 3
      OnClick = BtnChequesClick
    end
    object BtnCadastro: TBitBtn
      Left = 501
      Top = 8
      Width = 72
      Height = 25
      Caption = 'C&adastro'
      TabOrder = 4
      OnClick = BtnCadastroClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 431
    Width = 667
    Height = 19
    Panels = <>
  end
  object Panel4: TPanel
    Left = 0
    Top = 185
    Width = 667
    Height = 205
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 4
    object DBGVendas: TDBGrid
      Left = 2
      Top = 2
      Width = 663
      Height = 201
      Align = alClient
      Color = clSilver
      DataSource = DSQConsVendas
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
          FieldName = 'DATA_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL VENDA'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'T.VENDA'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TPV'
          Title.Alignment = taCenter
          Title.Caption = 'TIPO DE VENDA'
          Width = 259
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_VEND'
          Title.Alignment = taCenter
          Title.Caption = 'VENDEDOR'
          Width = 201
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_VEN'
          Title.Alignment = taCenter
          Title.Caption = 'COD.VENDA'
          Visible = True
        end>
    end
    object DBGPrest: TDBGrid
      Left = 1
      Top = 40
      Width = 665
      Height = 160
      DataSource = DSQConsPrest
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'PAR'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEQUENCIA_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'SEQ.'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEVOLUCAO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DEVOL.'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VENC.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPAGTO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DT PAGTO.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO_CONCEDIDO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'DESC.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACRESCIMO_RECEBIDO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'ACRESC.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRPAGO_CTR'
          Title.Alignment = taCenter
          Title.Caption = 'VL.PAGO'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    object DBGItens: TDBGrid
      Left = 2
      Top = 41
      Width = 665
      Height = 160
      DataSource = DSQConsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGItensDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'ITEM'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENDA_TROCA'
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO'
          Width = 311
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 73
          Visible = True
        end>
    end
    object DBGCheque: TDBGrid
      Left = 2
      Top = 41
      Width = 665
      Height = 160
      Color = clSilver
      DataSource = DSQConsCheque
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
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
          Title.Caption = 'VENC.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 166
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
          Width = 276
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = '1'#186' DEP.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = '1'#170' DEV.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEGDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = '2'#186' DEP.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEGDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = '2'#170' DEV.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGTODEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end>
    end
  end
  object QPendencia: TFDQuery
    OnCalcFields = QPendenciaCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_SALDO_CREDITO_CLIENTE (:CODCLI)')
    Left = 120
    Top = 264
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
    object QPendenciaVALOR_BRUTO: TBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object QPendenciaTAXA_JUROS: TBCDField
      FieldName = 'TAXA_JUROS'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.TAXA_JUROS'
      Precision = 18
      Size = 2
    end
    object QPendenciaTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
    object QPendenciaDIAS_ATRASO: TBCDField
      FieldName = 'DIAS_ATRASO'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.DIAS_ATRASO'
      Precision = 18
      Size = 2
    end
    object QPendenciaDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.DIAS_CARENCIA'
    end
  end
  object QCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_SALDO_CHEQUE_CLIENTE (:CODCLI, :TIPO)')
    Left = 200
    Top = 264
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end>
    object QChequeTOTAL_CHEQUES: TBCDField
      FieldName = 'TOTAL_CHEQUES'
      Origin = 'SP_SALDO_CHEQUE_CLIENTE.TOTAL_CHEQUES'
      Precision = 18
      Size = 2
    end
  end
  object QConsVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRVendas
    SQL.Strings = (
      'SELECT V.COD_VEN, V.DATA_VEN, V.COD_TPV, V.TOTAL_VEN,'
      'T.NOME_TPV'
      'FROM VENDAS V'
      'INNER JOIN TIPO_VENDA T'
      'ON (V.COD_TPV = T.COD_TPV)'
      'WHERE  V.COD_CLI = :CODCLI AND V.CANCELADA_VEN = 0')
    Left = 280
    Top = 264
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
    object QConsVendasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QConsVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsVendasCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'VENDAS.COD_TPV'
      Required = True
    end
    object QConsVendasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsVendasNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Required = True
      Size = 50
    end
  end
  object IBTRVendas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 264
  end
  object DSQConsVendas: TDataSource
    AutoEdit = False
    DataSet = QConsVendas
    Left = 280
    Top = 320
  end
  object QConsPrest: TFDQuery
    OnCalcFields = QConsPrestCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CTR, PARCELA_CTR, SEQUENCIA_CTR, VENCTO_CTR, VALOR_CT' +
        'R, VLRPAGO_CTR, DTPAGTO_CTR, DEVOLUCAO_CTR, DESCONTO_CONCEDIDO_C' +
        'TR, ACRESCIMO_RECEBIDO_CTR'
      'FROM CONTAS_RECEBER')
    Left = 40
    Top = 264
    object QConsPrestCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsPrestPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QConsPrestSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsPrestVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsPrestVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPrestVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPrestDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QConsPrestDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPrestACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsPrestSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 50
      Calculated = True
    end
    object QConsPrestDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsPrest: TDataSource
    AutoEdit = False
    DataSet = QConsPrest
    Left = 40
    Top = 312
  end
  object QConsItens: TFDQuery
    OnCalcFields = QConsItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.ORDEM, I.COD_PRO, I.QUANT, I.VALOR, I.CANCELADO,'
      'P.NOME_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY I.ORDEM')
    Left = 624
    Top = 264
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QConsItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QConsItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QConsItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsItensTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QConsItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
  end
  object DSQConsItens: TDataSource
    AutoEdit = False
    DataSet = QConsItens
    Left = 624
    Top = 320
  end
  object QConsCheque: TFDQuery
    OnCalcFields = QConsItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.AGENCIA_CHE, C.COD_CHE, C.CONTA_CHE, C.EMISSAO_CHE, C.E' +
        'MITENTE_CHE, C.NUMERO_CHE, C.PAGTODEV_CHE, C.PRIDEP_CHE, C.PRIDE' +
        'V_CHE, C.SEGDEP_CHE, C.SEGDEV_CHE, C.VALOR_CHE, C.VENCTO_CHE, B.' +
        'NOME_BAN'
      'FROM CHEQUE C'
      'INNER JOIN BANCO B'
      'ON (C.COD_BANCO = B.COD_BAN)'
      'WHERE C.COD_CLI = :CODCLI')
    Left = 456
    Top = 264
    ParamData = <
      item
        Name = 'CODCLI'
      end>
    object QConsChequeAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QConsChequeCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QConsChequeCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QConsChequeEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QConsChequeEMITENTE_CHE: TStringField
      FieldName = 'EMITENTE_CHE'
      Origin = 'CHEQUE.EMITENTE_CHE'
      Size = 50
    end
    object QConsChequeNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QConsChequePAGTODEV_CHE: TDateField
      FieldName = 'PAGTODEV_CHE'
      Origin = 'CHEQUE.PAGTODEV_CHE'
    end
    object QConsChequePRIDEP_CHE: TDateField
      FieldName = 'PRIDEP_CHE'
      Origin = 'CHEQUE.PRIDEP_CHE'
    end
    object QConsChequePRIDEV_CHE: TDateField
      FieldName = 'PRIDEV_CHE'
      Origin = 'CHEQUE.PRIDEV_CHE'
    end
    object QConsChequeSEGDEP_CHE: TDateField
      FieldName = 'SEGDEP_CHE'
      Origin = 'CHEQUE.SEGDEP_CHE'
    end
    object QConsChequeSEGDEV_CHE: TDateField
      FieldName = 'SEGDEV_CHE'
      Origin = 'CHEQUE.SEGDEV_CHE'
    end
    object QConsChequeVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChequeNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QConsChequeVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
  end
  object DSQConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 544
    Top = 264
  end
end
