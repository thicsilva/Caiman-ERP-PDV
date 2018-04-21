object FrmRelProd: TFrmRelProd
  Left = 383
  Top = 212
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 451
  ClientWidth = 352
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 393
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object RdgOrdem: TRadioGroup
      Left = 2
      Top = 352
      Width = 348
      Height = 39
      Align = alBottom
      Caption = 'Ordem de Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 3
    end
    object GB: TGroupBox
      Left = 2
      Top = 113
      Width = 348
      Height = 80
      Align = alTop
      Caption = 'Produto Inicial/Final'
      TabOrder = 2
      object BtnConsIni: TsSpeedButton
        Left = 61
        Top = 18
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
        OnClick = BtnConsIniClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnConsFin: TsSpeedButton
        Left = 61
        Top = 50
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
        OnClick = BtnConsFinClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCodIni: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodIniEnter
        OnExit = EdtCodIniExit
        OnKeyDown = EdtCodIniKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
      object EdtNomeIni: TEdit
        Left = 88
        Top = 18
        Width = 249
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
      object EdtCodFin: TEdit
        Left = 8
        Top = 50
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodFinEnter
        OnExit = EdtCodFinExit
        OnKeyDown = EdtCodFinKeyDown
        OnKeyPress = EdtCodIniKeyPress
      end
      object EdtNomeFin: TEdit
        Left = 88
        Top = 50
        Width = 249
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
        TabOrder = 3
      end
    end
    object RdgTipo: TRadioGroup
      Left = 2
      Top = 2
      Width = 348
      Height = 63
      Align = alTop
      Caption = 'Produtos'
      Columns = 2
      Items.Strings = (
        'Pesados'
        'N'#227'o Pesados'
        'Todos'
        'Intervalo'
        'Sec'#231#227'o/Grupo/Subgrupo'
        'Tipo de Produto')
      TabOrder = 0
      OnClick = RdgTipoClick
    end
    object RdgEstoque: TRadioGroup
      Left = 2
      Top = 65
      Width = 348
      Height = 48
      Align = alTop
      Columns = 2
      Items.Strings = (
        'Controla Estoque'
        'N'#227'o Controla Estoque'
        'Todos')
      TabOrder = 1
    end
    object GBGrupo: TGroupBox
      Left = 2
      Top = 193
      Width = 348
      Height = 99
      Align = alClient
      Caption = 'Sec'#231#227'o/Grupo/Subgrupo'
      TabOrder = 4
      object Label1: TLabel
        Left = 14
        Top = 21
        Width = 41
        Height = 13
        Caption = 'Sec'#231#227'o :'
      end
      object Label2: TLabel
        Left = 14
        Top = 48
        Width = 39
        Height = 13
        Caption = 'Grupo :'
      end
      object Label3: TLabel
        Left = 14
        Top = 75
        Width = 58
        Height = 13
        Caption = 'Subgrupo :'
      end
      object Sec: TComboBox
        Left = 88
        Top = 18
        Width = 249
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = SecChange
      end
      object Grupo: TComboBox
        Left = 88
        Top = 45
        Width = 249
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = GrupoChange
      end
      object Subgrupo: TComboBox
        Left = 88
        Top = 72
        Width = 249
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
    end
    object gbTipo: TGroupBox
      Left = 2
      Top = 292
      Width = 348
      Height = 60
      Align = alBottom
      Caption = ' Tipo do Produto '
      TabOrder = 5
      object Label4: TLabel
        Left = 14
        Top = 27
        Width = 73
        Height = 13
        Caption = 'Tipo Produto :'
      end
      object TipoProduto: TComboBox
        Left = 88
        Top = 23
        Width = 249
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 393
    Width = 352
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 43
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 139
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
    end
    object BtnSair: TBitBtn
      Left = 235
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 352
    Height = 19
    Panels = <>
  end
  object QRelProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_PRO, NOME_PRO, VALOR_PRO, PROMOCAO_PRO, REFERENCIA_PR' +
        'O, U.DESCRICAO'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)')
    Left = 312
    Top = 16
    object QRelProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QRelProdNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelProdVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelProdPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelProdREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'PRODUTO.REFERENCIA_PRO'
      Size = 30
    end
    object QRelProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object QSecao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from secao;')
    Left = 296
    Top = 112
    object QSecaoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"SECAO"."COD_SEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSecaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = '"SECAO"."NOME_SEC"'
      Required = True
      Size = 50
    end
    object QSecaoCAMINHO_FOTO_SEC: TStringField
      FieldName = 'CAMINHO_FOTO_SEC'
      Origin = '"SECAO"."CAMINHO_FOTO_SEC"'
      Size = 150
    end
    object QSecaoBEBIDAS_FUMO_SEC: TStringField
      FieldName = 'BEBIDAS_FUMO_SEC'
      Origin = '"SECAO"."BEBIDAS_FUMO_SEC"'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QGrupo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from secao_grupo where COD_SEC=:COD_SEC;')
    Left = 296
    Top = 168
    ParamData = <
      item
        Name = 'COD_SEC'
      end>
    object QGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"SECAO_GRUPO"."COD_SEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = '"SECAO_GRUPO"."COD_GRUPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"SECAO_GRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
  end
  object QSubgrupo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'select * from secao_grupo_subgrupo where COD_GRUPO=:COD_GRUPO;')
    Left = 296
    Top = 224
    ParamData = <
      item
        Name = 'COD_GRUPO'
      end>
    object QSubgrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."COD_SEC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubgrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."COD_GRUPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubgrupoCOD_SUBGRUPO: TIntegerField
      FieldName = 'COD_SUBGRUPO'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."COD_SUBGRUPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubgrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"SECAO_GRUPO_SUBGRUPO"."DESCRICAO"'
      Required = True
      Size = 80
    end
  end
end
