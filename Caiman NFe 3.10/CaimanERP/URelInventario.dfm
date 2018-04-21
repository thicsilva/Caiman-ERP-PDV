object FrmRelInventario: TFrmRelInventario
  Left = 375
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio do Invent'#225'rio'
  ClientHeight = 447
  ClientWidth = 382
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 393
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 378
      Height = 65
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 374
        Height = 13
        Align = alTop
        Caption = 'Consultar Por'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 71
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 15
        Width = 374
        Height = 48
        Align = alClient
        TabOrder = 0
        object ComboCons: TComboBox
          Left = 8
          Top = 16
          Width = 261
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboConsChange
          Items.Strings = (
            'C'#243'digo'
            'Data')
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 67
      Width = 378
      Height = 102
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object LTipo: TLabel
        Left = 8
        Top = 6
        Width = 26
        Height = 13
        Caption = 'LTipo'
      end
      object Label2: TLabel
        Left = 155
        Top = 24
        Width = 68
        Height = 13
        Caption = 'P'#225'gina Inicial'
      end
      object BtnOK: TBitBtn
        Left = 213
        Top = 69
        Width = 65
        Height = 25
        Caption = '&OK'
        TabOrder = 5
        OnClick = BtnOKClick
      end
      object EdtCons: TMaskEdit
        Left = 8
        Top = 24
        Width = 143
        Height = 21
        Color = clSilver
        TabOrder = 0
        Text = ''
      end
      object CheckPrecoVenda: TCheckBox
        Left = 8
        Top = 48
        Width = 121
        Height = 17
        Caption = 'Incluir Preco Venda'
        TabOrder = 1
      end
      object EdtPagInicial: TEdit
        Left = 227
        Top = 16
        Width = 49
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 4
        OnKeyPress = EdtPagInicialKeyPress
      end
      object CheckImpSubTotal: TCheckBox
        Left = 8
        Top = 64
        Width = 177
        Height = 17
        Caption = 'Imprimir SubTotal nas P'#225'ginas'
        TabOrder = 2
      end
      object CheckResumoPisCofins: TCheckBox
        Left = 8
        Top = 80
        Width = 169
        Height = 17
        Caption = 'Imprimir Resumo Pis/Cofins'
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 169
      Width = 378
      Height = 222
      Align = alClient
      Color = clSilver
      DataSource = DSInvent
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_INVENTARIO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.INVENTARIO'
          Width = 140
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA_INVENTARIO'
          Title.Alignment = taCenter
          Title.Caption = 'DATA INVENT'#193'RIO'
          Width = 123
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 393
    Width = 382
    Height = 35
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnImp: TBitBtn
      Left = 95
      Top = 8
      Width = 75
      Height = 23
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BtnImpClick
    end
    object BtnSair: TBitBtn
      Left = 186
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object BtnExcluir: TBitBtn
      Left = 4
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 428
    Width = 382
    Height = 19
    Panels = <>
  end
  object QBuscaEmp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT CNPJ_EMP, INSC_EMP'
      'FROM EMPRESA'
      'WHERE COD_EMP = :CODEMP')
    Left = 120
    Top = 224
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QBuscaEmpCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Origin = 'EMPRESA.CNPJ_EMP'
      Size = 18
    end
    object QBuscaEmpINSC_EMP: TStringField
      FieldName = 'INSC_EMP'
      Origin = 'EMPRESA.INSC_EMP'
    end
  end
  object QConsInvent: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM INVENTARIO_ESTOQUE')
    Left = 40
    Top = 224
    object QConsInventCOD_INVENTARIO: TIntegerField
      FieldName = 'COD_INVENTARIO'
      Origin = 'INVENTARIO_ESTOQUE.COD_INVENTARIO'
      Required = True
    end
    object QConsInventDATA_INVENTARIO: TDateField
      FieldName = 'DATA_INVENTARIO'
      Origin = 'INVENTARIO_ESTOQUE.DATA_INVENTARIO'
      Required = True
    end
    object QConsInventCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'INVENTARIO_ESTOQUE.COD_EMP'
      Required = True
    end
  end
  object DSInvent: TDataSource
    AutoEdit = False
    DataSet = QConsInvent
    Left = 40
    Top = 280
  end
  object QItensInventario: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT I.COD_PRO, I.CUSTO, I.PRECO_VENDA, I.QUANT, (I.CUSTO * I.' +
        'QUANT) TOTAL, (I.PRECO_VENDA * I.QUANT) TOTAL_PRECO_VENDA, P.NOM' +
        'E_PRO, P.ICMS_CF_EST, G.NOME_GRP, U.DESCRICAO'
      'FROM ITENS_INVENTARIO_ESTOQUE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_INVENTARIO = :COD'
      '')
    Left = 200
    Top = 224
    ParamData = <
      item
        Name = 'COD'
      end>
    object QItensInventarioCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"ITENS_INVENTARIO_ESTOQUE"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensInventarioCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = '"ITENS_INVENTARIO_ESTOQUE"."CUSTO"'
      Precision = 18
      Size = 2
    end
    object QItensInventarioPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = '"ITENS_INVENTARIO_ESTOQUE"."PRECO_VENDA"'
      Precision = 18
      Size = 2
    end
    object QItensInventarioQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_INVENTARIO_ESTOQUE"."QUANT"'
      Precision = 18
      Size = 3
    end
    object QItensInventarioTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = []
    end
    object QItensInventarioTOTAL_PRECO_VENDA: TFMTBCDField
      FieldName = 'TOTAL_PRECO_VENDA'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
    object QItensInventarioNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QItensInventarioICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = '"PRODUTO"."ICMS_CF_EST"'
    end
    object QItensInventarioNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = '"GRUPO_ICMS"."NOME_GRP"'
      Required = True
      Size = 50
    end
    object QItensInventarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE_MEDIDA"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object QTotaisGrupo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT SUM(I.CUSTO * I.QUANT) TOTAL, G.NOME_GRP'
      'FROM ITENS_INVENTARIO_ESTOQUE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (P.ICMS_CF_EST = G.COD_GRP)'
      'WHERE I.COD_INVENTARIO = :COD'
      'GROUP BY P.ICMS_CF_EST, G.NOME_GRP'
      'ORDER BY P.ICMS_CF_EST')
    Left = 120
    Top = 280
    ParamData = <
      item
        Name = 'COD'
      end>
    object QTotaisGrupoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
    end
    object QTotaisGrupoNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Required = True
      Size = 50
    end
  end
  object QResumoPis: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    Left = 280
    Top = 224
  end
end
