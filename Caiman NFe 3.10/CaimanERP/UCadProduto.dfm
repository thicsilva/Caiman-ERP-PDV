inherited FrmCadProduto: TFrmCadProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 557
  ClientWidth = 1030
  ExplicitWidth = 1046
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Width = 1030
    ExplicitWidth = 884
  end
  inherited ToolBar1: TToolBar
    Width = 1030
    ExplicitWidth = 1030
  end
  inherited pnlGeral: TPanel
    Width = 1030
    Height = 494
    ExplicitWidth = 1030
    ExplicitHeight = 494
    inherited cxPaginas: TcxPageControl
      Width = 1030
      Height = 494
      Properties.ActivePage = PageEdit
      ExplicitWidth = 1030
      ExplicitHeight = 494
      ClientRectBottom = 492
      ClientRectRight = 1028
      inherited PageConsulta: TcxTabSheet
        OnShow = PageConsultaShow
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 1026
        ExplicitHeight = 462
        inherited cxVisualiza: TcxGrid
          Width = 1020
          Height = 415
          ExplicitWidth = 1020
          ExplicitHeight = 415
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            Styles.OnGetContentStyle = cxVisualizaDBTableView1StylesGetContentStyle
            object cxVisualizaDBTableView1STATUS: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'STATUS'
              OnCustomDrawCell = cxVisualizaDBTableView1STATUSCustomDrawCell
              Options.Moving = False
              VisibleForCustomization = False
              Width = 50
            end
            object cxVisualizaDBTableView1COD_PRO: TcxGridDBColumn
              Caption = 'C'#243'd'
              DataBinding.FieldName = 'COD_PRO'
            end
            object cxVisualizaDBTableView1CODIGO_BARRA_PRO: TcxGridDBColumn
              Caption = 'C'#243'd. de Barras'
              DataBinding.FieldName = 'CODIGO_BARRA_PRO'
            end
            object cxVisualizaDBTableView1NOME_PRO: TcxGridDBColumn
              Caption = 'Nome do Produto'
              DataBinding.FieldName = 'NOME_PRO'
              Width = 350
            end
            object cxVisualizaDBTableView1CODIGO_UNIDADE_SAIDA: TcxGridDBColumn
              Caption = 'Un. Saida'
              DataBinding.FieldName = 'UNID_SAI'
            end
            object cxVisualizaDBTableView1CODIGO_UNIDADE_ENTRADA: TcxGridDBColumn
              Caption = 'Un. Ent.'
              DataBinding.FieldName = 'UNID_ENT'
            end
            object cxVisualizaDBTableView1VALOR_PRO: TcxGridDBColumn
              Caption = 'Valor a V'#237'sta'
              DataBinding.FieldName = 'VALOR_PRO'
            end
            object cxVisualizaDBTableView1PRECO_PRAZO_PRO: TcxGridDBColumn
              Caption = 'Valor a Prazo'
              DataBinding.FieldName = 'PRECO_PRAZO_PRO'
            end
            object cxVisualizaDBTableView1PROMOCAO_PRO: TcxGridDBColumn
              Caption = 'Valor Promo'#231#227'o'
              DataBinding.FieldName = 'PROMOCAO_PRO'
            end
            object cxVisualizaDBTableView1ESTOQUE: TcxGridDBColumn
              Caption = 'Estoque'
              DataBinding.FieldName = 'ESTOQUE'
            end
            object cxVisualizaDBTableView1DESC_CUPOM: TcxGridDBColumn
              Caption = 'Descri'#231#227'o do Cupom'
              DataBinding.FieldName = 'DESC_CUPOM'
            end
            object cxVisualizaDBTableView1REFERENCIA_PRO: TcxGridDBColumn
              Caption = 'Refer'#234'ncia Interna'
              DataBinding.FieldName = 'REFERENCIA_PRO'
            end
            object cxVisualizaDBTableView1CODIGO_TIPO: TcxGridDBColumn
              Caption = 'Tipo Produto'
              DataBinding.FieldName = 'CODIGO_TIPO'
              Visible = False
              VisibleForCustomization = False
            end
            object cxVisualizaDBTableView1NOME_TIPO: TcxGridDBColumn
              Caption = 'Nome Tipo Produto'
              DataBinding.FieldName = 'NOME_TIPO'
            end
            object cxVisualizaDBTableView1TIPO_PRODUCAO: TcxGridDBColumn
              Caption = 'Tipo Produ'#231#227'o'
              DataBinding.FieldName = 'TIPO_PRODUCAO'
            end
            object cxVisualizaDBTableView1COD_SEC: TcxGridDBColumn
              Caption = 'Se'#231#227'o'
              DataBinding.FieldName = 'COD_SEC'
            end
            object cxVisualizaDBTableView1NOME_SEC: TcxGridDBColumn
              Caption = 'Nome Se'#231#227'o'
              DataBinding.FieldName = 'NOME_SEC'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1COD_GRUPO: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'COD_GRUPO'
            end
            object cxVisualizaDBTableView1NOME_GRUPO: TcxGridDBColumn
              Caption = 'Nome Grupo'
              DataBinding.FieldName = 'NOME_GRUPO'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1SUB_GRUPO: TcxGridDBColumn
              Caption = 'Subgrupo'
              DataBinding.FieldName = 'SUB_GRUPO'
            end
            object cxVisualizaDBTableView1NOME_SUBGRUPO: TcxGridDBColumn
              Caption = 'Nome Subgrupo'
              DataBinding.FieldName = 'NOME_SUBGRUPO'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1COD_LAB: TcxGridDBColumn
              Caption = 'Fabricante'
              DataBinding.FieldName = 'COD_LAB'
            end
            object cxVisualizaDBTableView1NOME_LAB: TcxGridDBColumn
              DataBinding.FieldName = 'NOME_LAB'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1CONTROLA_ESTOQUE_PRO: TcxGridDBColumn
              Caption = 'Controla Estoque'
              DataBinding.FieldName = 'CONTROLA_ESTOQUE_PRO'
            end
            object cxVisualizaDBTableView1COMISSAO_PRO: TcxGridDBColumn
              Caption = 'Comiss'#227'o Produto'
              DataBinding.FieldName = 'COMISSAO_PRO'
            end
            object cxVisualizaDBTableView1QUANT_UNIDADE_ENTRADA: TcxGridDBColumn
              Caption = 'Qt. Un. Ent'
              DataBinding.FieldName = 'QUANT_UNIDADE_ENTRADA'
              Width = 70
            end
            object cxVisualizaDBTableView1ESTOQUE_MINIMO_PRO: TcxGridDBColumn
              Caption = 'Estoque Min.'
              DataBinding.FieldName = 'ESTOQUE_MINIMO_PRO'
              Width = 70
            end
            object cxVisualizaDBTableView1ATIVO_PRO: TcxGridDBColumn
              Caption = 'Produto Ativo'
              DataBinding.FieldName = 'ATIVO_PRO'
            end
            object cxVisualizaDBTableView1MARGEM_LUCRO_PRO: TcxGridDBColumn
              Caption = 'Margem de Lucro'
              DataBinding.FieldName = 'MARGEM_LUCRO_PRO'
            end
            object cxVisualizaDBTableView1LOCALIZACAO_PRO: TcxGridDBColumn
              Caption = 'Localizacao do Produto'
              DataBinding.FieldName = 'LOCALIZACAO_PRO'
            end
            object cxVisualizaDBTableView1PRODUTO_PESADO_PRO: TcxGridDBColumn
              Caption = 'Produto Pesado'
              DataBinding.FieldName = 'PRODUTO_PESADO_PRO'
            end
            object cxVisualizaDBTableView1COD_SETOR: TcxGridDBColumn
              Caption = 'Setor de Balan'#231'a'
              DataBinding.FieldName = 'COD_SETOR'
            end
            object cxVisualizaDBTableView1NOME_SETOR_BAL: TcxGridDBColumn
              Caption = 'Nome Setor de Balan'#231'a'
              DataBinding.FieldName = 'NOME_SETOR_BAL'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1TECLA_ATALHO_PRO: TcxGridDBColumn
              Caption = 'Tecla de Atalho'
              DataBinding.FieldName = 'TECLA_ATALHO_PRO'
            end
            object cxVisualizaDBTableView1INDICE_RECEITA_PRO: TcxGridDBColumn
              Caption = 'Receita'
              DataBinding.FieldName = 'INDICE_RECEITA_PRO'
            end
            object cxVisualizaDBTableView1DIAS_VALIDADE_PRO: TcxGridDBColumn
              Caption = 'Dias de Validade'
              DataBinding.FieldName = 'DIAS_VALIDADE_PRO'
            end
            object cxVisualizaDBTableView1COMPLEMENTO_PRO: TcxGridDBColumn
              Caption = 'Complemento no Produto'
              DataBinding.FieldName = 'COMPLEMENTO_PRO'
            end
            object cxVisualizaDBTableView1SAIR_TABELA_PRECO: TcxGridDBColumn
              Caption = 'Mostra Tabela pre'#231'o'
              DataBinding.FieldName = 'SAIR_TABELA_PRECO'
            end
            object cxVisualizaDBTableView1COD_NCM: TcxGridDBColumn
              Caption = 'C'#243'digo NCM'
              DataBinding.FieldName = 'COD_NCM'
            end
            object cxVisualizaDBTableView1COD_PRODUTO_ESTOQUE: TcxGridDBColumn
              Caption = 'Usa estoque Produto'
              DataBinding.FieldName = 'COD_PRODUTO_ESTOQUE'
            end
            object cxVisualizaDBTableView1NOME_PRO_ESTOQUE: TcxGridDBColumn
              Caption = 'Nome Produto Usando Estoque'
              DataBinding.FieldName = 'NOME_PRO_ESTOQUE'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1PRECO_PROGRAMADO: TcxGridDBColumn
              Caption = 'Valor Programado'
              DataBinding.FieldName = 'PRECO_PROGRAMADO'
            end
            object cxVisualizaDBTableView1PRECO_CUSTO: TcxGridDBColumn
              Caption = 'Pre'#231'o de Custo'
              DataBinding.FieldName = 'PRECO_CUSTO'
            end
            object cxVisualizaDBTableView1PRECO_PROGRAMADO_PRAZO: TcxGridDBColumn
              Caption = 'Pre'#231'o Programado'
              DataBinding.FieldName = 'PRECO_PROGRAMADO_PRAZO'
            end
            object cxVisualizaDBTableView1DATA_VALIDADE: TcxGridDBColumn
              Caption = 'Validade'
              DataBinding.FieldName = 'DATA_VALIDADE'
            end
            object cxVisualizaDBTableView1CODIGO_SETOR_ESTOQUE: TcxGridDBColumn
              Caption = 'Setor Estoque'
              DataBinding.FieldName = 'CODIGO_SETOR_ESTOQUE'
            end
            object cxVisualizaDBTableView1NOME_SETOR_ESTOQUE: TcxGridDBColumn
              Caption = 'Nome Setor do Estoque'
              DataBinding.FieldName = 'NOME_SETOR_ESTOQUE'
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1TAMANHO: TcxGridDBColumn
              Caption = 'Tamanho'
              DataBinding.FieldName = 'TAMANHO'
            end
            object cxVisualizaDBTableView1COR: TcxGridDBColumn
              Caption = 'Cor'
              DataBinding.FieldName = 'COR'
            end
            object cxVisualizaDBTableView1OBS: TcxGridDBColumn
              Caption = 'Observa'#231#245'es'
              DataBinding.FieldName = 'OBS'
            end
            object cxVisualizaDBTableView1ULTIMA_ALTERACAO: TcxGridDBColumn
              Caption = 'Ultima Altera'#231#227'o'
              DataBinding.FieldName = 'ULTIMA_ALTERACAO'
            end
            object cxVisualizaDBTableView1VALOR_ATACADO: TcxGridDBColumn
              Caption = 'Valor Atacado'
              DataBinding.FieldName = 'VALOR_ATACADO'
            end
            object cxVisualizaDBTableView1ALERTA_COPA: TcxGridDBColumn
              Caption = 'Alerta Copa'
              DataBinding.FieldName = 'ALERTA_COPA'
            end
            object cxVisualizaDBTableView1ALERTA_COZINHA: TcxGridDBColumn
              Caption = 'Alerta Cozinha'
              DataBinding.FieldName = 'ALERTA_COZINHA'
            end
            object cxVisualizaDBTableView1ANDROID_VISUALIZA: TcxGridDBColumn
              Caption = 'Visualiza Mobile'
              DataBinding.FieldName = 'ANDROID_VISUALIZA'
            end
            object cxVisualizaDBTableView1TEMPO_PREPARO: TcxGridDBColumn
              Caption = 'Tempo de Preparo'
              DataBinding.FieldName = 'TEMPO_PREPARO'
            end
            object cxVisualizaDBTableView1NAO_PERMITE_FRAC: TcxGridDBColumn
              Caption = 'Vend. Frac.'
              DataBinding.FieldName = 'NAO_PERMITE_FRAC'
            end
            object cxVisualizaDBTableView1SABORES: TcxGridDBColumn
              Caption = 'Sabores'
              DataBinding.FieldName = 'SABORES'
            end
            object cxVisualizaDBTableView1UNID_ENT: TcxGridDBColumn
              DataBinding.FieldName = 'UNID_ENT'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
            object cxVisualizaDBTableView1UNID_SAI: TcxGridDBColumn
              DataBinding.FieldName = 'UNID_SAI'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
          end
          object cxNCMs: TcxGridDBTableView [1]
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsNCMs
            DataController.KeyFieldNames = 'NCM'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            Styles.Content = cxstylPadrao
            Styles.ContentOdd = cxstylOdd
            Styles.Inactive = cxstylInactive
            Styles.Header = cxstylHeader
            object cxNCMsNCM: TcxGridDBColumn
              DataBinding.FieldName = 'NCM'
              Width = 100
            end
            object cxNCMsEX: TcxGridDBColumn
              Caption = 'Ex.'
              DataBinding.FieldName = 'EX'
            end
            object cxNCMsDESC_NCM: TcxGridDBColumn
              Caption = 'Descri'#231#227'o do NCM'
              DataBinding.FieldName = 'DESC_NCM'
              Width = 200
            end
            object cxNCMsDESCRICAO: TcxGridDBColumn
              Caption = 'Descri'#231#227'o do Perfil'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 300
            end
          end
          object cxCEST: TcxGridDBTableView [2]
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsCEST
            DataController.KeyFieldNames = 'CEST'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxCESTCEST: TcxGridDBColumn
              DataBinding.FieldName = 'CEST'
              Width = 100
            end
            object cxCESTDescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
            end
          end
        end
        inherited Panel1: TPanel
          Width = 1026
          ExplicitWidth = 1026
          inherited lblPesquisa: TcxLabel
            Style.IsFontAssigned = True
            AnchorX = 34
            AnchorY = 21
          end
          inherited Panel2: TPanel
            inherited edtCurr: TcxCurrencyEdit
              ExplicitHeight = 23
            end
          end
          inherited btnPesquisar: TcxButton
            OnClick = btnPesquisarClick
          end
          inherited rgOptionGrid: TRadioGroup
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Ativos'
              'Inativos')
          end
        end
      end
      inherited PageEdit: TcxTabSheet
        OnShow = PageEditShow
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 1026
        ExplicitHeight = 462
        object cxPaginas2: TcxPageControl
          Left = 0
          Top = 0
          Width = 1026
          Height = 462
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = tabComposicao
          Properties.CustomButtons.Buttons = <>
          OnChange = cxPaginas2Change
          ClientRectBottom = 460
          ClientRectLeft = 2
          ClientRectRight = 1024
          ClientRectTop = 30
          object cxDadosProduto: TcxTabSheet
            Caption = 'Dados do produto'
            ImageIndex = 0
            object pnlLateral1: TPanel
              Left = 665
              Top = 0
              Width = 204
              Height = 430
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object grpAtivoCont: TGroupBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 198
                Height = 140
                Align = alTop
                Caption = ' Op'#231#245'es do Produto '
                TabOrder = 0
                object dbchkATIVO_PRO: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 20
                  Width = 188
                  Height = 17
                  Align = alTop
                  Caption = 'Ativo'
                  DataField = 'ATIVO_PRO'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkCOMPLEMENTO_PRO: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 43
                  Width = 188
                  Height = 17
                  Align = alTop
                  Caption = 'Complemento na Descri'#231#227'o'
                  DataField = 'COMPLEMENTO_PRO'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkCONTROLA_ESTOQUE_PRO: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 66
                  Width = 188
                  Height = 17
                  Align = alTop
                  Caption = 'Controla Estoque'
                  DataField = 'CONTROLA_ESTOQUE_PRO'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkSAIR_TABELA_PRECO: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 89
                  Width = 188
                  Height = 17
                  Align = alTop
                  Caption = 'Sair na tabela de Pre'#231'o'
                  DataField = 'SAIR_TABELA_PRECO'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object DBCheckBox1: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 112
                  Width = 188
                  Height = 17
                  Align = alTop
                  Caption = 'Visualiza Mobile'
                  DataField = 'ANDROID_VISUALIZA'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 146
                Width = 204
                Height = 47
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object cxLabel25: TcxLabel
                  Left = 3
                  Top = 0
                  Caption = 'Data de Validade :'
                  Transparent = True
                end
                object cxDBDATA_VALIDADE: TcxDBDateEdit
                  Left = 3
                  Top = 19
                  DataBinding.DataField = 'DATA_VALIDADE'
                  DataBinding.DataSource = dsPrincipal
                  TabOrder = 1
                  Width = 121
                end
              end
            end
            object pnlCentral1: TPanel
              Left = 0
              Top = 0
              Width = 665
              Height = 430
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object cxLabel1: TcxLabel
                  Left = 3
                  Top = -1
                  Caption = 'C'#243'digo :'
                  Transparent = True
                end
                object dbedtCOD_PRO: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 121
                  Height = 23
                  TabStop = False
                  CharCase = ecUpperCase
                  DataField = 'COD_PRO'
                  DataSource = dsPrincipal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 16744448
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object cxLabel3: TcxLabel
                  Left = 134
                  Top = 0
                  Caption = 'C'#243'digo de Barras :'
                  Transparent = True
                end
                object dbedtCODIGO_BARRA_PRO: TDBEdit
                  Left = 134
                  Top = 16
                  Width = 121
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'CODIGO_BARRA_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 3
                  OnExit = dbedtCODIGO_BARRA_PROExit
                  OnKeyDown = dbedtCODIGO_BARRA_PROKeyDown
                end
                object cxLabel4: TcxLabel
                  Left = 261
                  Top = 0
                  Caption = 'Tipo produto :'
                  Transparent = True
                end
                object cxDBLTipo: TcxDBLookupComboBox
                  Left = 264
                  Top = 19
                  DataBinding.DataField = 'CODIGO_TIPO'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'CODIGO'
                    end
                    item
                      Caption = 'Descri'#231#227'o'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsTipos
                  Properties.OnChange = cxDBLTipoPropertiesChange
                  TabOrder = 5
                  Width = 145
                end
                object dbrgrpTIPO_PRODUCAO: TDBRadioGroup
                  Left = 415
                  Top = 3
                  Width = 154
                  Height = 39
                  Caption = ' Tipo Produ'#231#227'o '
                  Columns = 2
                  DataField = 'TIPO_PRODUCAO'
                  DataSource = dsPrincipal
                  Items.Strings = (
                    'Terceiro'
                    'Pr'#243'pria')
                  TabOrder = 6
                  Values.Strings = (
                    'T'
                    'P')
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 90
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                object cxLabel2: TcxLabel
                  Left = 3
                  Top = -2
                  Caption = 'Descri'#231#227'o :'
                  Transparent = True
                end
                object dbedtNOME_PRO: TDBEdit
                  Left = 5
                  Top = 18
                  Width = 655
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'NOME_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                  OnExit = dbedtNOME_PROExit
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 135
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 3
                object cxLabel5: TcxLabel
                  Left = 3
                  Top = -2
                  Caption = 'Descri'#231#227'o do Cupom :'
                  Transparent = True
                end
                object dbedtDESC_CUPOM: TDBEdit
                  Left = 5
                  Top = 18
                  Width = 655
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'DESC_CUPOM'
                  DataSource = dsPrincipal
                  TabOrder = 1
                end
              end
              object Panel6: TPanel
                Left = 0
                Top = 45
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                object BtnConsNcm: TsSpeedButton
                  Left = 496
                  Top = 19
                  Width = 23
                  Height = 21
                  Hint = 'Consultar'
                  Flat = True
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
                  OnClick = BtnConsNcmClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object dbtxtEX: TDBText
                  Left = 474
                  Top = 20
                  Width = 20
                  Height = 17
                  DataField = 'NCM_EX'
                  DataSource = dsPrincipal
                end
                object cxLabel6: TcxLabel
                  Left = 3
                  Top = -2
                  Caption = 'Est. Minimo:'
                  Transparent = True
                end
                object dbedtESTOQUE_MINIMO_PRO: TDBEdit
                  Left = 5
                  Top = 18
                  Width = 69
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'ESTOQUE_MINIMO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                end
                object cxLabel7: TcxLabel
                  Left = 80
                  Top = -2
                  Caption = 'Localiza'#231#227'o :'
                  Transparent = True
                end
                object dbedtLOCALIZACAO_PRO: TDBEdit
                  Left = 80
                  Top = 18
                  Width = 153
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'LOCALIZACAO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 3
                end
                object cxLabel8: TcxLabel
                  Left = 239
                  Top = -3
                  Caption = 'Refer'#234'ncia Interna :'
                  Transparent = True
                end
                object dbedtREFERENCIA_PRO: TDBEdit
                  Left = 239
                  Top = 18
                  Width = 120
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'REFERENCIA_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 5
                end
                object cxLabel9: TcxLabel
                  Left = 366
                  Top = -1
                  Caption = 'NCM :'
                  Transparent = True
                end
                object cxDBNCM: TcxDBExtLookupComboBox
                  Left = 366
                  Top = 18
                  DataBinding.DataField = 'COD_NCM'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownListStyle = lsEditList
                  Properties.DropDownRows = 15
                  Properties.DropDownSizeable = True
                  Properties.DropDownWidth = 600
                  Properties.View = cxNCMs
                  Properties.KeyFieldNames = 'NCM'
                  Properties.ListFieldItem = cxNCMsNCM
                  Properties.OnChange = cxDBNCMPropertiesChange
                  Properties.OnPopup = cxDBNCMPropertiesPopup
                  TabOrder = 7
                  OnEnter = dbedtCOD_NCMEnter
                  OnExit = dbedtCOD_NCMExit
                  OnKeyDown = dbedtCOD_NCMKeyDown
                  Width = 105
                end
                object cxLabel32: TcxLabel
                  Left = 470
                  Top = 0
                  Caption = 'EX.:'
                  Transparent = True
                end
                object cxLabel33: TcxLabel
                  Left = 525
                  Top = -1
                  Caption = 'CEST :'
                  Transparent = True
                end
                object cxDBExtCEST: TcxDBExtLookupComboBox
                  Left = 525
                  Top = 18
                  DataBinding.DataField = 'CEST'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownListStyle = lsEditList
                  Properties.DropDownRows = 15
                  Properties.DropDownSizeable = True
                  Properties.DropDownWidth = 600
                  Properties.View = cxCEST
                  Properties.KeyFieldNames = 'CEST'
                  Properties.ListFieldItem = cxCESTCEST
                  TabOrder = 10
                  Width = 105
                end
              end
              object Panel7: TPanel
                Left = 0
                Top = 180
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 4
                object cxLabel10: TcxLabel
                  Left = 387
                  Top = -3
                  Caption = 'Tamanho : '
                  Transparent = True
                end
                object dbedtTAMANHO: TDBEdit
                  Left = 389
                  Top = 17
                  Width = 127
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'TAMANHO'
                  DataSource = dsPrincipal
                  TabOrder = 3
                end
                object dbedtCOR: TDBEdit
                  Left = 525
                  Top = 17
                  Width = 135
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'COR'
                  DataSource = dsPrincipal
                  TabOrder = 4
                end
                object cxLabel11: TcxLabel
                  Left = 525
                  Top = -3
                  Caption = 'Cor :'
                  Transparent = True
                end
                object cxDBCODIGO_UNIDADE_SAIDA: TcxDBLookupComboBox
                  Left = 5
                  Top = 17
                  DataBinding.DataField = 'CODIGO_UNIDADE_SAIDA'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'CODIGO'
                    end
                    item
                      Caption = 'Unidade de Medida'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsUnidade
                  TabOrder = 1
                  Width = 176
                end
                object cxLabel12: TcxLabel
                  Left = 2
                  Top = -3
                  Caption = 'Un. Medida Saidas :'
                  Transparent = True
                end
                object cxDBCODIGO_UNIDADE_ENTRADA: TcxDBLookupComboBox
                  Left = 189
                  Top = 17
                  DataBinding.DataField = 'CODIGO_UNIDADE_ENTRADA'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'CODIGO'
                    end
                    item
                      Caption = 'Unidade de Medida'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsUnidade
                  TabOrder = 2
                  Width = 176
                end
                object cxLabel13: TcxLabel
                  Left = 189
                  Top = -3
                  Caption = 'Un. Medida Entradas :'
                  Transparent = True
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 225
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 5
                object cxLabel14: TcxLabel
                  Left = 3
                  Top = -2
                  Caption = 'Pre'#231'o a Vista'
                  Transparent = True
                end
                object dbedtVALOR_PRO: TDBEdit
                  Left = 5
                  Top = 18
                  Width = 119
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'VALOR_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                  OnExit = dbedtVALOR_PROExit
                end
                object cxLabel15: TcxLabel
                  Left = 131
                  Top = -2
                  Caption = 'Pre'#231'o a Prazo :'
                  Transparent = True
                end
                object dbedtPRECO_PRAZO_PRO: TDBEdit
                  Left = 133
                  Top = 18
                  Width = 119
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'PRECO_PRAZO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 3
                end
                object cxLabel16: TcxLabel
                  Left = 261
                  Top = -2
                  Caption = 'Pre'#231'o Promo'#231#227'o :'
                  Transparent = True
                end
                object dbedtPROMOCAO_PRO: TDBEdit
                  Left = 261
                  Top = 18
                  Width = 119
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'PROMOCAO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 5
                end
                object cxLabel18: TcxLabel
                  Left = 388
                  Top = -2
                  Caption = 'Margem de Lucro :'
                  Transparent = True
                end
                object dbedtMARGEM_LUCRO_PRO: TDBEdit
                  Left = 388
                  Top = 18
                  Width = 104
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'MARGEM_LUCRO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 7
                end
                object cxLabel19: TcxLabel
                  Left = 499
                  Top = -2
                  Caption = 'Quant. Ent.:'
                  Transparent = True
                end
                object dbedtQUANT_UNIDADE_ENTRADA: TDBEdit
                  Left = 499
                  Top = 18
                  Width = 70
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'QUANT_UNIDADE_ENTRADA'
                  DataSource = dsPrincipal
                  TabOrder = 9
                end
                object cxLabel20: TcxLabel
                  Left = 575
                  Top = -2
                  Caption = 'Comiss'#227'o :'
                  Transparent = True
                end
                object dbedtCOMISSAO_PRO: TDBEdit
                  Left = 575
                  Top = 18
                  Width = 85
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'COMISSAO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 11
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 270
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 6
                object btnConsLab: TsSpeedButton
                  Left = 240
                  Top = 16
                  Width = 23
                  Height = 21
                  Hint = 'Consultar'
                  Flat = True
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
                  OnClick = btnConsLabClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object BtnAddLab: TsSpeedButton
                  Left = 269
                  Top = 16
                  Width = 23
                  Height = 21
                  Hint = 'Cadastrar'
                  Flat = True
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
                  OnClick = BtnAddLabClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object btnConsSetorEstoque: TsSpeedButton
                  Left = 585
                  Top = 18
                  Width = 23
                  Height = 21
                  Hint = 'Consultar'
                  Flat = True
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
                  OnClick = btnConsSetorEstoqueClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object btnAddSetorEstoque: TsSpeedButton
                  Left = 614
                  Top = 16
                  Width = 23
                  Height = 21
                  Hint = 'Cadastrar'
                  Flat = True
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
                  OnClick = btnAddSetorEstoqueClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object cxLabel17: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Fabricante :'
                  Transparent = True
                end
                object cxDBCOD_LAB: TcxDBLookupComboBox
                  Left = 5
                  Top = 16
                  DataBinding.DataField = 'COD_LAB'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_LAB'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_LAB'
                    end
                    item
                      Caption = 'Fabricante'
                      FieldName = 'NOME_LAB'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsLaboratorios
                  Properties.OnPopup = cxDBCOD_LABPropertiesPopup
                  TabOrder = 1
                  OnEnter = cxDBCOD_LABEnter
                  OnExit = cxDBCOD_LABExit
                  OnKeyDown = cxDBCOD_LABKeyDown
                  Width = 228
                end
                object cxLabel21: TcxLabel
                  Left = 297
                  Top = 0
                  Caption = 'Setor do Estoque :'
                  Transparent = True
                end
                object cxDBCODIGO_SETOR_ESTOQUE: TcxDBLookupComboBox
                  Left = 298
                  Top = 16
                  DataBinding.DataField = 'CODIGO_SETOR_ESTOQUE'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'CODIGO'
                    end
                    item
                      Caption = 'Descri'#231#227'o Setor'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsSetorEstoque
                  Properties.OnPopup = cxDBCODIGO_SETOR_ESTOQUEPropertiesPopup
                  TabOrder = 3
                  OnEnter = cxDBCOD_LABEnter
                  OnExit = cxDBCOD_LABExit
                  OnKeyDown = cxDBCODIGO_SETOR_ESTOQUEKeyDown
                  Width = 281
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 315
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 7
                object btnConsSecao: TsSpeedButton
                  Left = 165
                  Top = 18
                  Width = 23
                  Height = 21
                  Hint = 'Consultar'
                  Flat = True
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
                  OnClick = btnConsSecaoClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object btnAddSecao: TsSpeedButton
                  Left = 194
                  Top = 18
                  Width = 23
                  Height = 21
                  Hint = 'Cadastrar'
                  Flat = True
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
                  OnClick = btnAddSecaoClick
                  SkinData.SkinSection = 'SPEEDBUTTON'
                end
                object cxLabel22: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Se'#231#227'o :'
                  Transparent = True
                end
                object cxDBLookupComboBox1: TcxDBLookupComboBox
                  Left = 5
                  Top = 18
                  DataBinding.DataField = 'COD_SEC'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_SEC'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_SEC'
                    end
                    item
                      Caption = 'Se'#231#227'o'
                      FieldName = 'NOME_SEC'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListOptions.SyncMode = True
                  Properties.ListSource = dsSecao
                  TabOrder = 1
                  OnEnter = cxDBCOD_LABEnter
                  OnExit = cxDBCOD_LABExit
                  OnKeyDown = KeyDownLookCombo
                  Width = 156
                end
                object cxLabel23: TcxLabel
                  Left = 225
                  Top = 0
                  Caption = 'Grupo :'
                  Transparent = True
                end
                object cxDBLookupComboBox2: TcxDBLookupComboBox
                  Left = 225
                  Top = 18
                  DataBinding.DataField = 'COD_GRUPO'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_GRUPO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_GRUPO'
                    end
                    item
                      Caption = 'Grupo'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListOptions.SyncMode = True
                  Properties.ListSource = dsGrupo
                  TabOrder = 3
                  OnKeyDown = KeyDownLookCombo
                  Width = 215
                end
                object cxDBLookupComboBox3: TcxDBLookupComboBox
                  Left = 446
                  Top = 18
                  DataBinding.DataField = 'SUB_GRUPO'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_SUBGRUPO'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_SUBGRUPO'
                    end
                    item
                      Caption = 'Subgrupo'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListOptions.SyncMode = True
                  Properties.ListSource = dsSubGrupo
                  TabOrder = 4
                  OnKeyDown = KeyDownLookCombo
                  Width = 214
                end
                object cxLabel24: TcxLabel
                  Left = 452
                  Top = 0
                  Caption = 'Subgrupo :'
                  Transparent = True
                end
              end
              object Panel20: TPanel
                Left = 0
                Top = 360
                Width = 665
                Height = 45
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 8
                object cxLabel31: TcxLabel
                  Left = 3
                  Top = -2
                  Caption = 'Pre'#231'o de Custo :'
                  Transparent = True
                end
                object dbedtPRECO_CUSTO: TDBEdit
                  Left = 5
                  Top = 18
                  Width = 119
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'PRECO_CUSTO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                  OnExit = dbedtVALOR_PROExit
                end
                object dbCodigo: TDBEdit
                  Left = 144
                  Top = 18
                  Width = 174
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'CODIGO_SERVICO'
                  DataSource = dsPrincipal
                  TabOrder = 2
                  OnExit = dbedtVALOR_PROExit
                end
                object lbCodigo: TcxLabel
                  Left = 142
                  Top = 0
                  Caption = 'C'#243'digo :'
                  Transparent = True
                end
                object dbServico: TDBEdit
                  Left = 337
                  Top = 18
                  Width = 119
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'SERVICO_CODIGO'
                  DataSource = dsPrincipal
                  TabOrder = 4
                  OnExit = dbedtVALOR_PROExit
                end
                object lbServico: TcxLabel
                  Left = 338
                  Top = 0
                  Caption = 'Servi'#231'o :'
                  Transparent = True
                end
              end
            end
          end
          object cxBalanca: TcxTabSheet
            Caption = 'Balan'#231'a'
            ImageIndex = 1
            object pnl1: TPanel
              Left = 0
              Top = 0
              Width = 1022
              Height = 47
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object dbrgrpPRODUTO_PESADO_PRO: TDBRadioGroup
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 286
                Height = 41
                Align = alLeft
                Caption = ' Produto Pes'#225'vel '
                Columns = 3
                DataField = 'PRODUTO_PESADO_PRO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'N'#227'o Pes'#225'vel'
                  'Por Peso'
                  'Por Unidade')
                TabOrder = 0
                Values.Strings = (
                  'N'
                  'P'
                  'U')
              end
              object pnl2: TPanel
                Left = 292
                Top = 0
                Width = 316
                Height = 47
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object cxLabel26: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Setor da Balan'#231'a :'
                  Transparent = True
                end
                object cxDBCOD_SETOR: TcxDBLookupComboBox
                  Left = 5
                  Top = 20
                  DataBinding.DataField = 'COD_SETOR'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_SET'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_SET'
                    end
                    item
                      Caption = 'Setor Balan'#231'a'
                      FieldName = 'NOME_SET'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsSetorBal
                  TabOrder = 1
                  Width = 300
                end
              end
            end
            object Panel12: TPanel
              Left = 0
              Top = 47
              Width = 1022
              Height = 47
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object Panel13: TPanel
                Left = 133
                Top = 0
                Width = 185
                Height = 47
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object cxLabel27: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Receita :'
                  Transparent = True
                end
                object cxDBINDICE_RECEITA_PRO: TcxDBLookupComboBox
                  Left = 5
                  Top = 20
                  DataBinding.DataField = 'INDICE_RECEITA_PRO'
                  DataBinding.DataSource = dsPrincipal
                  Properties.DropDownAutoSize = True
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_RECEITA'
                  Properties.ListColumns = <
                    item
                      Caption = 'C'#243'digo'
                      FieldName = 'COD_RECEITA'
                    end
                    item
                      Caption = 'Ingredientes'
                      FieldName = 'INGREDIENTES'
                    end>
                  Properties.ListSource = dsReceita
                  TabOrder = 1
                  Width = 174
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 0
                Width = 133
                Height = 47
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object cxLabel28: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Dias de Validade :'
                  Transparent = True
                end
                object dbedtDIAS_VALIDADE_PRO: TDBEdit
                  Left = 5
                  Top = 20
                  Width = 121
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'DIAS_VALIDADE_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                end
              end
              object Panel15: TPanel
                Left = 318
                Top = 0
                Width = 133
                Height = 47
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 2
                object cxLabel29: TcxLabel
                  Left = 5
                  Top = 0
                  Caption = 'Tecla de Atalho :'
                  Transparent = True
                end
                object dbedtTECLA_ATALHO_PRO: TDBEdit
                  Left = 6
                  Top = 25
                  Width = 121
                  Height = 23
                  CharCase = ecUpperCase
                  DataField = 'TECLA_ATALHO_PRO'
                  DataSource = dsPrincipal
                  TabOrder = 1
                end
              end
            end
          end
          object cxObs: TcxTabSheet
            Caption = 'Observa'#231#245'es'
            ImageIndex = 2
            object dbmmoOBS: TDBMemo
              Left = 0
              Top = 0
              Width = 1022
              Height = 430
              Align = alClient
              BorderStyle = bsNone
              DataField = 'OBS'
              DataSource = dsPrincipal
              TabOrder = 0
            end
          end
          object cxFoto: TcxTabSheet
            Caption = 'Foto'
            ImageIndex = 3
            OnShow = cxFotoShow
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 1022
              Height = 209
              Align = alTop
              Caption = 'Foto'
              TabOrder = 0
              object Panel16: TPanel
                Left = 8
                Top = 16
                Width = 225
                Height = 185
                BevelOuter = bvNone
                BevelWidth = 4
                TabOrder = 0
                object Image: TImage
                  Left = 0
                  Top = 0
                  Width = 225
                  Height = 185
                  Align = alClient
                  Stretch = True
                  ExplicitLeft = 4
                  ExplicitTop = 4
                  ExplicitWidth = 217
                  ExplicitHeight = 177
                end
              end
              object btnNovaFoto: TcxButton
                Left = 239
                Top = 16
                Width = 170
                Height = 25
                Caption = 'Nova Foto'
                TabOrder = 1
                OnClick = btnNovaFotoClick
              end
              object btnLimparFoto: TcxButton
                Left = 239
                Top = 47
                Width = 170
                Height = 25
                Caption = 'Limpar'
                TabOrder = 2
                OnClick = btnLimparFotoClick
              end
            end
          end
          object cxCompra: TcxTabSheet
            Caption = 'Compras / Venda'
            ImageIndex = 4
            OnShow = cxCompraShow
            object Panel17: TPanel
              Left = 0
              Top = 217
              Width = 1022
              Height = 213
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object shp2: TShape
                AlignWithMargins = True
                Left = 0
                Top = 31
                Width = 1022
                Height = 3
                Margins.Left = 0
                Margins.Right = 0
                Align = alTop
                Brush.Color = 16755285
                Pen.Style = psClear
                ExplicitLeft = -190
                ExplicitTop = 27
                ExplicitWidth = 884
              end
              object Shape1: TShape
                AlignWithMargins = True
                Left = 0
                Top = 3
                Width = 1022
                Height = 3
                Margins.Left = 0
                Margins.Right = 0
                Align = alTop
                Brush.Color = 16755285
                Pen.Style = psClear
                ExplicitLeft = -190
                ExplicitTop = 27
                ExplicitWidth = 884
              end
              object cxCompras: TcxGrid
                AlignWithMargins = True
                Left = 3
                Top = 40
                Width = 1016
                Height = 170
                Align = alClient
                TabOrder = 0
                object cxComprasDBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsCompras
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.ColumnAutoWidth = True
                  object cxComprasDBTableView1RAZAO_EMP: TcxGridDBColumn
                    Caption = 'Empresa'
                    DataBinding.FieldName = 'RAZAO_EMP'
                  end
                  object cxComprasDBTableView1DATAEMI_ENT: TcxGridDBColumn
                    Caption = 'Data Emiss'#227'o'
                    DataBinding.FieldName = 'DATAEMI_ENT'
                  end
                  object cxComprasDBTableView1DATAENT_ENT: TcxGridDBColumn
                    Caption = 'Data Entrada'
                    DataBinding.FieldName = 'DATAENT_ENT'
                  end
                  object cxComprasDBTableView1RAZAO_FOR: TcxGridDBColumn
                    Caption = 'Fornecedor'
                    DataBinding.FieldName = 'RAZAO_FOR'
                  end
                  object cxComprasDBTableView1NUMNF_ENT: TcxGridDBColumn
                    Caption = 'Num. Nota'
                    DataBinding.FieldName = 'NUMNF_ENT'
                  end
                  object cxComprasDBTableView1QTD_PRO: TcxGridDBColumn
                    Caption = 'Qaunt.'
                    DataBinding.FieldName = 'QTD_PRO'
                  end
                  object cxComprasDBTableView1VALOR_UNIT_PRO: TcxGridDBColumn
                    Caption = 'Vl. Unid.'
                    DataBinding.FieldName = 'VALOR_UNIT_PRO'
                  end
                  object cxComprasDBTableView1FRETE_ENT: TcxGridDBColumn
                    Caption = 'Frete'
                    DataBinding.FieldName = 'FRETE_ENT'
                  end
                  object cxComprasDBTableView1VALOR_DESCONTO: TcxGridDBColumn
                    Caption = 'Desconto'
                    DataBinding.FieldName = 'VALOR_DESCONTO'
                  end
                  object cxComprasDBTableView1VALOR_ACRESCIMO: TcxGridDBColumn
                    Caption = 'Acr'#233'scimo'
                    DataBinding.FieldName = 'VALOR_ACRESCIMO'
                  end
                  object cxComprasDBTableView1CUSTO: TcxGridDBColumn
                    Caption = 'Custo'
                    DataBinding.FieldName = 'CUSTO'
                  end
                  object cxComprasDBTableView1VALOR_ICMS_SUB: TcxGridDBColumn
                    Caption = 'Vl. Sub. ICMS'
                    DataBinding.FieldName = 'VALOR_ICMS_SUB'
                  end
                  object cxComprasDBTableView1VALOR_ICMS: TcxGridDBColumn
                    Caption = 'ICMS'
                    DataBinding.FieldName = 'VALOR_ICMS'
                  end
                  object cxComprasDBTableView1VL_IPI: TcxGridDBColumn
                    Caption = 'IPI'
                    DataBinding.FieldName = 'VL_IPI'
                  end
                end
                object cxComprasLevel1: TcxGridLevel
                  GridView = cxComprasDBTableView1
                end
              end
              object cxLabel30: TcxLabel
                Left = 0
                Top = 9
                Align = alTop
                Caption = 'Vendas do Produto'
                Style.TextColor = 16744448
                Style.TextStyle = [fsBold, fsItalic]
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                AnchorX = 511
                AnchorY = 19
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 1022
              Height = 217
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object GroupBox3: TGroupBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 392
                Height = 211
                Align = alLeft
                Caption = 'Compras'
                TabOrder = 0
                object Label14: TLabel
                  Left = 8
                  Top = 37
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Data Emiss'#227'o:'
                end
                object Label15: TLabel
                  Left = 8
                  Top = 64
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Fornecedor:'
                end
                object Label16: TLabel
                  Left = 8
                  Top = 78
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Nota Fiscal:'
                end
                object Label17: TLabel
                  Left = 8
                  Top = 90
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Qaunt.:'
                end
                object Label18: TLabel
                  Left = 8
                  Top = 102
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Valor Unit'#225'rio:'
                end
                object Label19: TLabel
                  Left = 8
                  Top = 114
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Frete:'
                end
                object Label20: TLabel
                  Left = 8
                  Top = 164
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'ICMS:'
                end
                object Label21: TLabel
                  Left = 8
                  Top = 177
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'IPI:'
                end
                object Label22: TLabel
                  Left = 8
                  Top = 126
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Vl.Desconto:'
                end
                object Label23: TLabel
                  Left = 8
                  Top = 139
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Vl.Acr'#233'scimo:'
                end
                object Label24: TLabel
                  Left = 8
                  Top = 51
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Data Entrada:'
                end
                object Label25: TLabel
                  Left = 8
                  Top = 151
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Vl.Sub.Trib.:'
                end
                object Label26: TLabel
                  Left = 8
                  Top = 24
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Empresa:'
                end
                object cxDBLabel1: TcxDBLabel
                  Left = 89
                  Top = 22
                  DataBinding.DataField = 'RAZAO_EMP'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel2: TcxDBLabel
                  Left = 89
                  Top = 35
                  DataBinding.DataField = 'DATAEMI_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 121
                end
                object cxDBLabel3: TcxDBLabel
                  Left = 89
                  Top = 49
                  DataBinding.DataField = 'DATAENT_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 121
                end
                object cxDBLabel4: TcxDBLabel
                  Left = 89
                  Top = 62
                  DataBinding.DataField = 'RAZAO_FOR'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel5: TcxDBLabel
                  Left = 89
                  Top = 76
                  DataBinding.DataField = 'NUMNF_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel6: TcxDBLabel
                  Left = 89
                  Top = 88
                  DataBinding.DataField = 'QTD_PRO'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel7: TcxDBLabel
                  Left = 89
                  Top = 100
                  DataBinding.DataField = 'VALOR_UNIT_PRO'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel8: TcxDBLabel
                  Left = 89
                  Top = 112
                  DataBinding.DataField = 'FRETE_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel9: TcxDBLabel
                  Left = 89
                  Top = 124
                  DataBinding.DataField = 'DESC_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel10: TcxDBLabel
                  Left = 89
                  Top = 137
                  DataBinding.DataField = 'ACRES_ENT'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel11: TcxDBLabel
                  Left = 89
                  Top = 149
                  DataBinding.DataField = 'VALOR_SUB_TRIBUTARIA'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel12: TcxDBLabel
                  Left = 89
                  Top = 162
                  DataBinding.DataField = 'VALOR_ICMS'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
                object cxDBLabel13: TcxDBLabel
                  Left = 89
                  Top = 175
                  DataBinding.DataField = 'VALOR_IPI'
                  DataBinding.DataSource = dsCompras
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 294
                end
              end
              object GroupBox2: TGroupBox
                AlignWithMargins = True
                Left = 401
                Top = 3
                Width = 297
                Height = 211
                Align = alLeft
                Caption = #218'ltima Venda'
                TabOrder = 1
                object Label1: TLabel
                  Left = 8
                  Top = 24
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Data:'
                end
                object Label2: TLabel
                  Left = 8
                  Top = 40
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Cliente:'
                end
                object Label3: TLabel
                  Left = 8
                  Top = 56
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                end
                object Label4: TLabel
                  Left = 8
                  Top = 88
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Quant.:'
                end
                object Label5: TLabel
                  Left = 8
                  Top = 104
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Valor Unit'#225'rio:'
                end
                object Label6: TLabel
                  Left = 8
                  Top = 56
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Cupom Fiscal:'
                end
                object Label7: TLabel
                  Left = 8
                  Top = 72
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Nota Fiscal:'
                end
                object cxDBLabel14: TcxDBLabel
                  Left = 95
                  Top = 22
                  DataBinding.DataField = 'DATA_VEN'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
                object cxDBLabel15: TcxDBLabel
                  Left = 95
                  Top = 38
                  DataBinding.DataField = 'NOME_CLI'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
                object cxDBLabel16: TcxDBLabel
                  Left = 95
                  Top = 54
                  DataBinding.DataField = 'CUPOM_FISCAL_VEN'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
                object cxDBLabel17: TcxDBLabel
                  Left = 95
                  Top = 70
                  DataBinding.DataField = 'NUMERO_NOTA_FISCAL'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
                object cxDBLabel18: TcxDBLabel
                  Left = 95
                  Top = 86
                  DataBinding.DataField = 'QUANT'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
                object cxDBLabel19: TcxDBLabel
                  Left = 95
                  Top = 102
                  DataBinding.DataField = 'VALOR'
                  DataBinding.DataSource = dsUltimaVenda
                  Style.TextColor = 16744448
                  Style.TextStyle = [fsBold]
                  Height = 19
                  Width = 193
                end
              end
            end
          end
          object tabFornecedores: TcxTabSheet
            Caption = 'Fornecedores'
            ImageIndex = 5
            OnShow = tabFornecedoresShow
            object cxFornecedores: TcxGrid
              Left = 0
              Top = 0
              Width = 1022
              Height = 389
              Align = alClient
              TabOrder = 0
              object cxFornecedoresDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsFornecedoresPro
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Content = cxstylPadrao
                Styles.ContentOdd = cxstylOdd
                Styles.Inactive = cxstylInactive
                Styles.Header = cxstylHeader
                object cxFornecedoresDBTableView1COD_FOR: TcxGridDBColumn
                  Caption = 'C'#243'd For.'
                  DataBinding.FieldName = 'COD_FOR'
                  Options.Editing = False
                end
                object cxFornecedoresDBTableView1RAZAO_FOR: TcxGridDBColumn
                  Caption = 'Nome do Fornecedor'
                  DataBinding.FieldName = 'RAZAO_FOR'
                  Options.Editing = False
                end
                object cxFornecedoresDBTableView1REFERENCIA: TcxGridDBColumn
                  Caption = 'Refer'#234'ncia'
                  DataBinding.FieldName = 'REFERENCIA'
                end
              end
              object cxFornecedoresLevel1: TcxGridLevel
                GridView = cxFornecedoresDBTableView1
              end
            end
            object pnl3: TPanel
              Left = 0
              Top = 389
              Width = 1022
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object RzDBNavigator1: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsFornecedoresPro
                ConfirmDelete = False
                VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
                ImageIndexes.Insert = 0
                ImageIndexes.InsertDisabled = 5
                ImageIndexes.Delete = 4
                ImageIndexes.DeleteDisabled = 9
                ImageIndexes.Edit = 3
                ImageIndexes.EditDisabled = 8
                ImageIndexes.Post = 1
                ImageIndexes.PostDisabled = 6
                ImageIndexes.Cancel = 2
                ImageIndexes.CancelDisabled = 7
                Images = BarraSubMenu
                BeforeAction = RzDBNavigator1BeforeAction
                Align = alLeft
                BorderOuter = fsNone
                GradientColorStyle = gcsCustom
                TabOrder = 0
                Transparent = True
                VisualStyle = vsClassic
              end
            end
          end
          object tabComposicao: TcxTabSheet
            Caption = 'Composi'#231#227'o'
            ImageIndex = 6
            OnShow = tabComposicaoShow
            object cxComposicao: TcxGrid
              Left = 0
              Top = 0
              Width = 1022
              Height = 389
              Align = alClient
              TabOrder = 0
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsFornecedoresPro
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Content = cxstylPadrao
                Styles.ContentOdd = cxstylOdd
                Styles.Inactive = cxstylInactive
                Styles.Header = cxstylHeader
              end
              object cxComposicaoDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsComposicao
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Content = cxstylPadrao
                Styles.ContentOdd = cxstylOdd
                Styles.Inactive = cxstylInactive
                Styles.Header = cxstylHeader
                object cxComposicaoDBTableView1COD_PRO_COMPOSICAO: TcxGridDBColumn
                  Caption = 'C'#243'd. Prod.'
                  DataBinding.FieldName = 'COD_PRO_COMPOSICAO'
                  Options.Editing = False
                end
                object cxComposicaoDBTableView1NOME_PRO: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o do produto'
                  DataBinding.FieldName = 'NOME_PRO'
                  Options.Editing = False
                  Width = 300
                end
                object cxComposicaoDBTableView1QUANT: TcxGridDBColumn
                  Caption = 'Quantidade'
                  DataBinding.FieldName = 'QUANT'
                end
                object cxComposicaoDBTableView1ESTOQUE: TcxGridDBColumn
                  Caption = 'Estoque Atual'
                  DataBinding.FieldName = 'ESTOQUE'
                end
              end
              object cxComposicaoLevel1: TcxGridLevel
                GridView = cxComposicaoDBTableView1
              end
            end
            object Panel19: TPanel
              Left = 0
              Top = 389
              Width = 1022
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object RzDBNavigator2: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsComposicao
                ConfirmDelete = False
                VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
                ImageIndexes.Insert = 0
                ImageIndexes.InsertDisabled = 5
                ImageIndexes.Delete = 4
                ImageIndexes.DeleteDisabled = 9
                ImageIndexes.Edit = 3
                ImageIndexes.EditDisabled = 8
                ImageIndexes.Post = 1
                ImageIndexes.PostDisabled = 6
                ImageIndexes.Cancel = 2
                ImageIndexes.CancelDisabled = 7
                Images = BarraSubMenu
                BeforeAction = RzDBNavigator1BeforeAction
                Align = alLeft
                BorderOuter = fsNone
                GradientColorStyle = gcsCustom
                TabOrder = 0
                Transparent = True
                VisualStyle = vsClassic
              end
            end
          end
          object cxTabSheet1: TcxTabSheet
            Caption = 'Cupom Fiscal'
            ImageIndex = 7
            object pnl4: TPanel
              Left = 0
              Top = 0
              Width = 1022
              Height = 46
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object cxLabel34: TcxLabel
                Left = 9
                Top = 0
                Caption = 'ICMS CF Est.'
                Transparent = True
              end
              object cxDBLookupComboBox4: TcxDBLookupComboBox
                Left = 9
                Top = 18
                DataBinding.DataField = 'ICMS_CF_EST'
                DataBinding.DataSource = dsPrincipal
                Properties.DropDownAutoSize = True
                Properties.GridMode = True
                Properties.KeyFieldNames = 'COD_GRP'
                Properties.ListColumns = <
                  item
                    FieldName = 'COD_GRP'
                  end
                  item
                    FieldName = 'NOME_GRP'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListSource = dsGrupoICMS
                TabOrder = 1
                Width = 296
              end
              object cxLabel36: TcxLabel
                Left = 311
                Top = 0
                Caption = 'CST Est.:'
                Transparent = True
              end
              object dbedtCST_CF_EST: TDBEdit
                Left = 311
                Top = 18
                Width = 121
                Height = 23
                DataField = 'CST_CF_EST'
                DataSource = dsPrincipal
                TabOrder = 3
              end
            end
            object Panel21: TPanel
              Left = 0
              Top = 46
              Width = 1022
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object cxLabel35: TcxLabel
                Left = 9
                Top = 0
                Caption = 'ICMS CF Fora Est.'
                Transparent = True
              end
              object cxDBLookupComboBox5: TcxDBLookupComboBox
                Left = 9
                Top = 18
                DataBinding.DataField = 'ICMS_CF_FORA'
                DataBinding.DataSource = dsPrincipal
                Properties.DropDownAutoSize = True
                Properties.GridMode = True
                Properties.KeyFieldNames = 'COD_GRP'
                Properties.ListColumns = <
                  item
                    FieldName = 'COD_GRP'
                  end
                  item
                    FieldName = 'NOME_GRP'
                  end>
                Properties.ListFieldIndex = 1
                Properties.ListSource = dsGrupoICMS
                TabOrder = 1
                Width = 296
              end
              object cxLabel37: TcxLabel
                Left = 311
                Top = 0
                Caption = 'CST Est.:'
                Transparent = True
              end
              object dbedtCST_CF_FORA: TDBEdit
                Left = 311
                Top = 18
                Width = 121
                Height = 23
                DataField = 'CST_CF_FORA'
                DataSource = dsPrincipal
                TabOrder = 3
              end
            end
          end
          object cxTabSheet2: TcxTabSheet
            Caption = 'Medicamento'
            ImageIndex = 8
            object Label8: TLabel
              Left = 16
              Top = 16
              Width = 104
              Height = 15
              Caption = 'Classe Teurapeutica'
            end
            object Label9: TLabel
              Left = 16
              Top = 64
              Width = 120
              Height = 15
              Caption = 'Registro Medicamento'
              FocusControl = cxDBTextEdit2
            end
            object Label10: TLabel
              Left = 16
              Top = 112
              Width = 70
              Height = 15
              Caption = 'N'#250'mero Lote'
              FocusControl = cxDBTextEdit3
            end
            object Label11: TLabel
              Left = 16
              Top = 160
              Width = 121
              Height = 15
              Caption = 'Unidade Medicamento'
            end
            object Label12: TLabel
              Left = 358
              Top = 16
              Width = 85
              Height = 15
              Caption = 'Uso Prolongado'
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 16
              Top = 80
              DataBinding.DataField = 'REGISTRO_MEDICAMENTO'
              DataBinding.DataSource = dsPrincipal
              TabOrder = 2
              Width = 121
            end
            object cxDBTextEdit3: TcxDBTextEdit
              Left = 16
              Top = 128
              DataBinding.DataField = 'NUMERO_LOTE'
              DataBinding.DataSource = dsPrincipal
              TabOrder = 3
              Width = 121
            end
            object JvDBComboBox2: TJvDBComboBox
              Left = 17
              Top = 33
              Width = 336
              Height = 23
              DataField = 'CLASSE_TERAPEUTICA'
              DataSource = dsPrincipal
              Items.Strings = (
                '1 - Antimicrobianos '
                '2 - Controlados')
              TabOrder = 0
              Values.Strings = (
                '1'
                '2')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object JvDBComboBox1: TJvDBComboBox
              Left = 17
              Top = 181
              Width = 336
              Height = 23
              DataField = 'UNIDADE_MEDICAMENTO'
              DataSource = dsPrincipal
              Items.Strings = (
                '1 - Caixa'
                '2 - Frascos')
              TabOrder = 4
              Values.Strings = (
                '1'
                '2')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object JvDBComboBox3: TJvDBComboBox
              Left = 359
              Top = 33
              Width = 154
              Height = 23
              DataField = 'USO_PROLONGADO'
              DataSource = dsPrincipal
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 1
              Values.Strings = (
                'S'
                'N')
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 4260216
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    AfterScroll = QPrincipalAfterScroll
    UpdateTransaction = TRPrincipal
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    UpdateObject = upPrincipal
    SQL.Strings = (
      'SELECT P.*, '
      'LA.nome_lab,'
      'SEC.nome_sec,'
      'SEC_G.descricao NOME_GRUPO,'
      'SEC_S.descricao NOME_SUBGRUPO,'
      'UNENT.descricao UNID_ENT,'
      'UNSAI.descricao UNID_SAI,'
      'SE.descricao NOME_SETOR_ESTOQUE,'
      'PE.nome_pro NOME_PRO_ESTOQUE,'
      'SB.nome_set NOME_SETOR_BAL,'
      'coalesce( EST.estoque, 0 ) estoque,'
      'TP.descricao NOME_TIPO'
      'FROM  PRODUTO P'
      'LEFT OUTER JOIN laboratorio LA'
      'ON ( LA.cod_lab = P.cod_lab )'
      'LEFT OUTER JOIN secao SEC'
      'ON ( SEC.cod_sec=P.cod_sec )'
      'LEFT OUTER JOIN secao_grupo SEC_G'
      'ON ( SEC_G.cod_sec=P.cod_sec AND SEC_G.cod_grupo=P.cod_grupo )'
      'LEFT OUTER JOIN secao_grupo_subgrupo SEC_S'
      
        'ON ( SEC_S.cod_sec=P.cod_sec AND SEC_S.cod_grupo=P.cod_grupo AND' +
        ' SEC_S.cod_subgrupo=P.sub_grupo )'
      'LEFT OUTER JOIN unidade_medida UNENT'
      'ON( UNENT.codigo=P.codigo_unidade_entrada )'
      'LEFT OUTER JOIN unidade_medida UNSAI'
      'ON( UNSAI.codigo=P.codigo_unidade_saida )'
      'LEFT OUTER JOIN setores_estoque SE'
      'ON( SE.codigo=P.codigo_setor_estoque )'
      'LEFT OUTER JOIN PRODUTO PE'
      'ON( PE.cod_pro=P.cod_pro )'
      'LEFT OUTER JOIN setor_balanca SB'
      'on( SB.cod_set=P.cod_setor )'
      'LEFT OUTER JOIN ESTOQUE EST'
      'ON( EST.cod_pro=P.cod_pro AND EST.cod_emp=:COD_EMP )'
      'LEFT outer JOIN TIPO_PRODUTO TP'
      'ON( TP.codigo=P.codigo_tipo )'
      '')
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QPrincipalCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalCOD_LAB: TIntegerField
      DefaultExpression = '1'
      FieldName = 'COD_LAB'
      Origin = 'COD_LAB'
    end
    object QPrincipalCOD_SEC: TIntegerField
      DefaultExpression = '1'
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      OnChange = QPrincipalCOD_SECChange
    end
    object QPrincipalVALOR_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_PRO'
      Origin = 'VALOR_PRO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalPROMOCAO_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PROMOCAO_PRO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalCONTROLA_ESTOQUE_PRO: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'CONTROLA_ESTOQUE_PRO'
      Origin = 'CONTROLA_ESTOQUE_PRO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCOMISSAO_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'COMISSAO_PRO'
      Origin = 'COMISSAO_PRO'
      DisplayFormat = '0.00 %'
      Precision = 18
      Size = 2
    end
    object QPrincipalQUANT_UNIDADE_ENTRADA: TBCDField
      DefaultExpression = '1'
      FieldName = 'QUANT_UNIDADE_ENTRADA'
      Origin = 'QUANT_UNIDADE_ENTRADA'
      DisplayFormat = '0.000'
      Precision = 18
      Size = 2
    end
    object QPrincipalESTOQUE_MINIMO_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'ESTOQUE_MINIMO_PRO'
      Origin = 'ESTOQUE_MINIMO_PRO'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Size = 80
    end
    object QPrincipalDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'DESC_CUPOM'
      Size = 80
    end
    object QPrincipalATIVO_PRO: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'ATIVO_PRO'
      Origin = 'ATIVO_PRO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalMARGEM_LUCRO_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = 'MARGEM_LUCRO_PRO'
      DisplayFormat = '0.00 %'
      Precision = 18
      Size = 2
    end
    object QPrincipalLOCALIZACAO_PRO: TStringField
      FieldName = 'LOCALIZACAO_PRO'
      Origin = 'LOCALIZACAO_PRO'
    end
    object QPrincipalPRODUTO_PESADO_PRO: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'PRODUTO_PESADO_PRO'
      Origin = 'PRODUTO_PESADO_PRO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCOD_SETOR: TIntegerField
      DefaultExpression = '1'
      FieldName = 'COD_SETOR'
      Origin = 'COD_SETOR'
    end
    object QPrincipalTECLA_ATALHO_PRO: TIntegerField
      FieldName = 'TECLA_ATALHO_PRO'
      Origin = 'TECLA_ATALHO_PRO'
    end
    object QPrincipalINDICE_RECEITA_PRO: TIntegerField
      FieldName = 'INDICE_RECEITA_PRO'
      Origin = 'INDICE_RECEITA_PRO'
    end
    object QPrincipalDIAS_VALIDADE_PRO: TIntegerField
      FieldName = 'DIAS_VALIDADE_PRO'
      Origin = 'DIAS_VALIDADE_PRO'
    end
    object QPrincipalREFERENCIA_PRO: TStringField
      FieldName = 'REFERENCIA_PRO'
      Origin = 'REFERENCIA_PRO'
      Size = 30
    end
    object QPrincipalCOMPLEMENTO_PRO: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'COMPLEMENTO_PRO'
      Origin = 'COMPLEMENTO_PRO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalICMS_CONT_EST: TIntegerField
      FieldName = 'ICMS_CONT_EST'
      Origin = 'ICMS_CONT_EST'
    end
    object QPrincipalICMS_CONT_FORA: TIntegerField
      FieldName = 'ICMS_CONT_FORA'
      Origin = 'ICMS_CONT_FORA'
    end
    object QPrincipalICMS_CF_EST: TIntegerField
      FieldName = 'ICMS_CF_EST'
      Origin = 'ICMS_CF_EST'
    end
    object QPrincipalICMS_CF_FORA: TIntegerField
      FieldName = 'ICMS_CF_FORA'
      Origin = 'ICMS_CF_FORA'
    end
    object QPrincipalCST_CONT_EST: TStringField
      FieldName = 'CST_CONT_EST'
      Origin = 'CST_CONT_EST'
      FixedChar = True
      Size = 3
    end
    object QPrincipalCST_CONT_FORA: TStringField
      FieldName = 'CST_CONT_FORA'
      Origin = 'CST_CONT_FORA'
      FixedChar = True
      Size = 3
    end
    object QPrincipalCST_CF_EST: TStringField
      FieldName = 'CST_CF_EST'
      Origin = 'CST_CF_EST'
      FixedChar = True
      Size = 3
    end
    object QPrincipalCST_CF_FORA: TStringField
      FieldName = 'CST_CF_FORA'
      Origin = 'CST_CF_FORA'
      FixedChar = True
      Size = 3
    end
    object QPrincipalCAMINHO_FOTO_PRO: TStringField
      FieldName = 'CAMINHO_FOTO_PRO'
      Origin = 'CAMINHO_FOTO_PRO'
      Size = 150
    end
    object QPrincipalSAIR_TABELA_PRECO: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'SAIR_TABELA_PRECO'
      Origin = 'SAIR_TABELA_PRECO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCFOP_VENDAS_CONT_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_EST'
      Origin = 'CFOP_VENDAS_CONT_EST'
    end
    object QPrincipalCFOP_VENDAS_CF_EST: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_EST'
      Origin = 'CFOP_VENDAS_CF_EST'
    end
    object QPrincipalCFOP_VENDAS_CONT_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CONT_FORA'
      Origin = 'CFOP_VENDAS_CONT_FORA'
    end
    object QPrincipalCFOP_VENDAS_CF_FORA: TIntegerField
      FieldName = 'CFOP_VENDAS_CF_FORA'
      Origin = 'CFOP_VENDAS_CF_FORA'
    end
    object QPrincipalST_CONT_EST: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'ST_CONT_EST'
      Origin = 'ST_CONT_EST'
      FixedChar = True
      Size = 1
    end
    object QPrincipalVR_AGREG_CONT_EST: TBCDField
      FieldName = 'VR_AGREG_CONT_EST'
      Origin = 'VR_AGREG_CONT_EST'
      Precision = 18
      Size = 2
    end
    object QPrincipalIPI_CONT_EST: TBCDField
      FieldName = 'IPI_CONT_EST'
      Origin = 'IPI_CONT_EST'
      Precision = 18
      Size = 2
    end
    object QPrincipalIPI_CF_EST: TBCDField
      FieldName = 'IPI_CF_EST'
      Origin = 'IPI_CF_EST'
      Precision = 18
      Size = 2
    end
    object QPrincipalIPI_CONT_FORA: TBCDField
      FieldName = 'IPI_CONT_FORA'
      Origin = 'IPI_CONT_FORA'
      Precision = 18
      Size = 2
    end
    object QPrincipalIPI_CF_FORA: TBCDField
      FieldName = 'IPI_CF_FORA'
      Origin = 'IPI_CF_FORA'
      Precision = 18
      Size = 2
    end
    object QPrincipalCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      OnChange = QPrincipalCOD_NCMChange
      Size = 8
    end
    object QPrincipalCLASSIFICACAO_FISCAL: TStringField
      FieldName = 'CLASSIFICACAO_FISCAL'
      Origin = 'CLASSIFICACAO_FISCAL'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCODIGO_TIPO: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CODIGO_TIPO'
      Origin = 'CODIGO_TIPO'
    end
    object QPrincipalCOD_PRODUTO_ESTOQUE: TIntegerField
      FieldName = 'COD_PRODUTO_ESTOQUE'
      Origin = 'COD_PRODUTO_ESTOQUE'
    end
    object QPrincipalCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      OnChange = QPrincipalCOD_GRUPOChange
    end
    object QPrincipalSUB_GRUPO: TIntegerField
      FieldName = 'SUB_GRUPO'
      Origin = 'SUB_GRUPO'
    end
    object QPrincipalPRECO_PROGRAMADO: TBCDField
      DefaultExpression = '0'
      FieldName = 'PRECO_PROGRAMADO'
      Origin = 'PRECO_PROGRAMADO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQUOTA_IR: TBCDField
      FieldName = 'ALIQUOTA_IR'
      Origin = 'ALIQUOTA_IR'
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQUOTA_CSLL: TBCDField
      FieldName = 'ALIQUOTA_CSLL'
      Origin = 'ALIQUOTA_CSLL'
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQUOTA_OUTRAS: TBCDField
      FieldName = 'ALIQUOTA_OUTRAS'
      Origin = 'ALIQUOTA_OUTRAS'
      Precision = 18
      Size = 2
    end
    object QPrincipalISENTO_PIS_COFINS_PRO: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'ISENTO_PIS_COFINS_PRO'
      Origin = 'ISENTO_PIS_COFINS_PRO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalPRECO_CUSTO: TBCDField
      DefaultExpression = '0'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      currency = True
      Precision = 18
    end
    object QPrincipalCREDITO_ICMS: TBCDField
      FieldName = 'CREDITO_ICMS'
      Origin = 'CREDITO_ICMS'
      Precision = 18
    end
    object QPrincipalPRECO_PRAZO_PRO: TBCDField
      DefaultExpression = '0'
      FieldName = 'PRECO_PRAZO_PRO'
      Origin = 'PRECO_PRAZO_PRO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalTIPO_PRODUCAO: TStringField
      DefaultExpression = 'UPPER('#39'T'#39')'
      FieldName = 'TIPO_PRODUCAO'
      Origin = 'TIPO_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'CODIGO_BARRA_PRO'
      Size = 14
    end
    object QPrincipalCODIGO_UNIDADE_SAIDA: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CODIGO_UNIDADE_SAIDA'
      Origin = 'CODIGO_UNIDADE_SAIDA'
    end
    object QPrincipalCODIGO_UNIDADE_ENTRADA: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CODIGO_UNIDADE_ENTRADA'
      Origin = 'CODIGO_UNIDADE_ENTRADA'
    end
    object QPrincipalPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = 'PRECO_PROGRAMADO_PRAZO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalRED_CF_EST: TBCDField
      FieldName = 'RED_CF_EST'
      Origin = 'RED_CF_EST'
      Precision = 18
      Size = 2
    end
    object QPrincipalRED_CF_FORA: TBCDField
      FieldName = 'RED_CF_FORA'
      Origin = 'RED_CF_FORA'
      Precision = 18
      Size = 2
    end
    object QPrincipalRED_CONT_EST: TBCDField
      FieldName = 'RED_CONT_EST'
      Origin = 'RED_CONT_EST'
      Precision = 18
      Size = 2
    end
    object QPrincipalRED_CONT_FORA: TBCDField
      FieldName = 'RED_CONT_FORA'
      Origin = 'RED_CONT_FORA'
      Precision = 18
      Size = 2
    end
    object QPrincipalDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
    end
    object QPrincipalCODIGO_SETOR_ESTOQUE: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CODIGO_SETOR_ESTOQUE'
      Origin = 'CODIGO_SETOR_ESTOQUE'
    end
    object QPrincipalORIG: TIntegerField
      FieldName = 'ORIG'
      Origin = 'ORIG'
    end
    object QPrincipalCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object QPrincipalIPI: TFloatField
      FieldName = 'IPI'
      Origin = 'IPI'
    end
    object QPrincipalICMS: TFloatField
      FieldName = 'ICMS'
      Origin = 'ICMS'
    end
    object QPrincipalRICMS: TFloatField
      FieldName = 'RICMS'
      Origin = 'RICMS'
    end
    object QPrincipalIVA: TFloatField
      FieldName = 'IVA'
      Origin = 'IVA'
    end
    object QPrincipalPIS: TFloatField
      FieldName = 'PIS'
      Origin = 'PIS'
    end
    object QPrincipalCONFINS: TFloatField
      FieldName = 'CONFINS'
      Origin = 'CONFINS'
    end
    object QPrincipalTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Origin = 'TAMANHO'
      Size = 10
    end
    object QPrincipalCOR: TStringField
      FieldName = 'COR'
      Origin = 'COR'
      Size = 40
    end
    object QPrincipalOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object QPrincipalCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object QPrincipalCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 3
    end
    object QPrincipalCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object QPrincipalULTIMA_ALTERACAO: TDateField
      FieldName = 'ULTIMA_ALTERACAO'
      Origin = 'ULTIMA_ALTERACAO'
    end
    object QPrincipalVALOR_ATACADO: TBCDField
      FieldName = 'VALOR_ATACADO'
      Origin = 'VALOR_ATACADO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQ_IBPT_NAC: TBCDField
      FieldName = 'ALIQ_IBPT_NAC'
      Origin = 'ALIQ_IBPT_NAC'
      Precision = 18
      Size = 2
    end
    object QPrincipalALIQ_IBPT_IMP: TBCDField
      FieldName = 'ALIQ_IBPT_IMP'
      Origin = 'ALIQ_IBPT_IMP'
      Precision = 18
      Size = 2
    end
    object QPrincipalFATOR_CONVERSAO: TBCDField
      DefaultExpression = '1'
      FieldName = 'FATOR_CONVERSAO'
      Origin = 'FATOR_CONVERSAO'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 3
    end
    object QPrincipalALERTA_COPA: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'ALERTA_COPA'
      Origin = 'ALERTA_COPA'
      FixedChar = True
      Size = 1
    end
    object QPrincipalALERTA_COZINHA: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'ALERTA_COZINHA'
      Origin = 'ALERTA_COZINHA'
      FixedChar = True
      Size = 1
    end
    object QPrincipalANDROID_VISUALIZA: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'ANDROID_VISUALIZA'
      Origin = 'ANDROID_VISUALIZA'
      FixedChar = True
      Size = 1
    end
    object QPrincipalTEMPO_PREPARO: TTimeField
      FieldName = 'TEMPO_PREPARO'
      Origin = 'TEMPO_PREPARO'
    end
    object QPrincipalNAO_PERMITE_FRAC: TIntegerField
      DefaultExpression = '0'
      FieldName = 'NAO_PERMITE_FRAC'
      Origin = 'NAO_PERMITE_FRAC'
    end
    object QPrincipalSABORES: TIntegerField
      FieldName = 'SABORES'
      Origin = 'SABORES'
    end
    object QPrincipalNOME_LAB: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_LAB'
      Origin = 'NOME_LAB'
      ProviderFlags = []
      Size = 50
    end
    object QPrincipalNOME_SEC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      ProviderFlags = []
      Size = 50
    end
    object QPrincipalNOME_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object QPrincipalNOME_SUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SUBGRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object QPrincipalUNID_ENT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNID_ENT'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 10
    end
    object QPrincipalUNID_SAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNID_SAI'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 10
    end
    object QPrincipalNOME_SETOR_ESTOQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SETOR_ESTOQUE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 60
    end
    object QPrincipalNOME_PRO_ESTOQUE: TStringField
      FieldName = 'NOME_PRO_ESTOQUE'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      Size = 80
    end
    object QPrincipalNOME_SETOR_BAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SETOR_BAL'
      Origin = 'NOME_SET'
      ProviderFlags = []
      Size = 50
    end
    object QPrincipalESTOQUE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      ProviderFlags = []
      DisplayFormat = '0.000'
      Precision = 18
      Size = 3
    end
    object QPrincipalNOME_TIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_TIPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 60
    end
    object QPrincipalSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      ReadOnly = True
      Calculated = True
    end
    object QPrincipalCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 7
    end
    object QPrincipalNCM_EX: TIntegerField
      FieldName = 'NCM_EX'
      Origin = 'NCM_EX'
    end
    object QPrincipalCODIGO_SERVICO: TIntegerField
      FieldName = 'CODIGO_SERVICO'
      Origin = 'CODIGO_SERVICO'
    end
    object QPrincipalSERVICO_CODIGO: TStringField
      FieldName = 'SERVICO_CODIGO'
      Origin = 'SERVICO_CODIGO'
      FixedChar = True
      Size = 8
    end
    object QPrincipalCLASSE_TERAPEUTICA: TStringField
      FieldName = 'CLASSE_TERAPEUTICA'
      Origin = 'CLASSE_TERAPEUTICA'
      FixedChar = True
      Size = 1
    end
    object QPrincipalREGISTRO_MEDICAMENTO: TStringField
      FieldName = 'REGISTRO_MEDICAMENTO'
      Origin = 'REGISTRO_MEDICAMENTO'
      FixedChar = True
      Size = 15
    end
    object QPrincipalNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Origin = 'NUMERO_LOTE'
      FixedChar = True
      Size = 15
    end
    object QPrincipalUNIDADE_MEDICAMENTO: TStringField
      FieldName = 'UNIDADE_MEDICAMENTO'
      Origin = 'UNIDADE_MEDICAMENTO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalUSO_PROLONGADO: TStringField
      FieldName = 'USO_PROLONGADO'
      Origin = 'USO_PROLONGADO'
      FixedChar = True
      Size = 1
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 4260288
  end
  object upPrincipal: TFDUpdateSQL [9]
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO PRODUTO'
      '(COD_PRO, COD_LAB, COD_SEC, VALOR_PRO, PROMOCAO_PRO, '
      '  CONTROLA_ESTOQUE_PRO, COMISSAO_PRO, QUANT_UNIDADE_ENTRADA, '
      '  ESTOQUE_MINIMO_PRO, NOME_PRO, DESC_CUPOM, '
      '  ATIVO_PRO, MARGEM_LUCRO_PRO, LOCALIZACAO_PRO, '
      '  PRODUTO_PESADO_PRO, COD_SETOR, TECLA_ATALHO_PRO, '
      '  INDICE_RECEITA_PRO, DIAS_VALIDADE_PRO, REFERENCIA_PRO, '
      '  COMPLEMENTO_PRO, ICMS_CONT_EST, ICMS_CONT_FORA, '
      '  ICMS_CF_EST, ICMS_CF_FORA, CST_CONT_EST, '
      '  CST_CONT_FORA, CST_CF_EST, CST_CF_FORA, CAMINHO_FOTO_PRO, '
      '  SAIR_TABELA_PRECO, CFOP_VENDAS_CONT_EST, CFOP_VENDAS_CF_EST, '
      '  CFOP_VENDAS_CONT_FORA, CFOP_VENDAS_CF_FORA, ST_CONT_EST, '
      '  VR_AGREG_CONT_EST, IPI_CONT_EST, IPI_CF_EST, '
      '  IPI_CONT_FORA, IPI_CF_FORA, COD_NCM, CLASSIFICACAO_FISCAL, '
      '  CODIGO_TIPO, COD_PRODUTO_ESTOQUE, COD_GRUPO, '
      '  SUB_GRUPO, PRECO_PROGRAMADO, ALIQUOTA_PIS, '
      '  ALIQUOTA_COFINS, ALIQUOTA_IR, ALIQUOTA_CSLL, '
      '  ALIQUOTA_OUTRAS, ISENTO_PIS_COFINS_PRO, PRECO_CUSTO, '
      '  CREDITO_ICMS, PRECO_PRAZO_PRO, TIPO_PRODUCAO, '
      
        '  CODIGO_BARRA_PRO, CODIGO_UNIDADE_SAIDA, CODIGO_UNIDADE_ENTRADA' +
        ', '
      '  PRECO_PROGRAMADO_PRAZO, RED_CF_EST, RED_CF_FORA, '
      '  RED_CONT_EST, RED_CONT_FORA, DATA_VALIDADE, '
      '  CODIGO_SETOR_ESTOQUE, ORIG, CSOSN, IPI, '
      '  ICMS, RICMS, IVA, PIS, CONFINS, '
      '  TAMANHO, COR, OBS, CST_PIS, CST_COFINS, '
      '  CST_IPI, ULTIMA_ALTERACAO, VALOR_ATACADO, '
      '  ALIQ_IBPT_NAC, ALIQ_IBPT_IMP, FATOR_CONVERSAO, '
      '  ALERTA_COPA, ALERTA_COZINHA, ANDROID_VISUALIZA, '
      '  TEMPO_PREPARO, NAO_PERMITE_FRAC, SABORES, '
      '  CEST, NCM_EX, CODIGO_SERVICO, SERVICO_CODIGO,'
      
        '   CLASSE_TERAPEUTICA, REGISTRO_MEDICAMENTO,NUMERO_LOTE, UNIDADE' +
        '_MEDICAMENTO)'
      
        'VALUES (:NEW_COD_PRO, :NEW_COD_LAB, :NEW_COD_SEC, :NEW_VALOR_PRO' +
        ', :NEW_PROMOCAO_PRO, '
      
        '  :NEW_CONTROLA_ESTOQUE_PRO, :NEW_COMISSAO_PRO, :NEW_QUANT_UNIDA' +
        'DE_ENTRADA, '
      '  :NEW_ESTOQUE_MINIMO_PRO, :NEW_NOME_PRO, :NEW_DESC_CUPOM, '
      '  :NEW_ATIVO_PRO, :NEW_MARGEM_LUCRO_PRO, :NEW_LOCALIZACAO_PRO, '
      
        '  :NEW_PRODUTO_PESADO_PRO, :NEW_COD_SETOR, :NEW_TECLA_ATALHO_PRO' +
        ', '
      
        '  :NEW_INDICE_RECEITA_PRO, :NEW_DIAS_VALIDADE_PRO, :NEW_REFERENC' +
        'IA_PRO, '
      
        '  :NEW_COMPLEMENTO_PRO, :NEW_ICMS_CONT_EST, :NEW_ICMS_CONT_FORA,' +
        ' '
      '  :NEW_ICMS_CF_EST, :NEW_ICMS_CF_FORA, :NEW_CST_CONT_EST, '
      
        '  :NEW_CST_CONT_FORA, :NEW_CST_CF_EST, :NEW_CST_CF_FORA, :NEW_CA' +
        'MINHO_FOTO_PRO, '
      
        '  :NEW_SAIR_TABELA_PRECO, :NEW_CFOP_VENDAS_CONT_EST, :NEW_CFOP_V' +
        'ENDAS_CF_EST, '
      
        '  :NEW_CFOP_VENDAS_CONT_FORA, :NEW_CFOP_VENDAS_CF_FORA, :NEW_ST_' +
        'CONT_EST, '
      '  :NEW_VR_AGREG_CONT_EST, :NEW_IPI_CONT_EST, :NEW_IPI_CF_EST, '
      
        '  :NEW_IPI_CONT_FORA, :NEW_IPI_CF_FORA, :NEW_COD_NCM, :NEW_CLASS' +
        'IFICACAO_FISCAL, '
      '  :NEW_CODIGO_TIPO, :NEW_COD_PRODUTO_ESTOQUE, :NEW_COD_GRUPO, '
      '  :NEW_SUB_GRUPO, :NEW_PRECO_PROGRAMADO, :NEW_ALIQUOTA_PIS, '
      '  :NEW_ALIQUOTA_COFINS, :NEW_ALIQUOTA_IR, :NEW_ALIQUOTA_CSLL, '
      
        '  :NEW_ALIQUOTA_OUTRAS, :NEW_ISENTO_PIS_COFINS_PRO, :NEW_PRECO_C' +
        'USTO, '
      '  :NEW_CREDITO_ICMS, :NEW_PRECO_PRAZO_PRO, :NEW_TIPO_PRODUCAO, '
      
        '  :NEW_CODIGO_BARRA_PRO, :NEW_CODIGO_UNIDADE_SAIDA, :NEW_CODIGO_' +
        'UNIDADE_ENTRADA, '
      
        '  :NEW_PRECO_PROGRAMADO_PRAZO, :NEW_RED_CF_EST, :NEW_RED_CF_FORA' +
        ', '
      '  :NEW_RED_CONT_EST, :NEW_RED_CONT_FORA, :NEW_DATA_VALIDADE, '
      '  :NEW_CODIGO_SETOR_ESTOQUE, :NEW_ORIG, :NEW_CSOSN, :NEW_IPI, '
      '  :NEW_ICMS, :NEW_RICMS, :NEW_IVA, :NEW_PIS, :NEW_CONFINS, '
      
        '  :NEW_TAMANHO, :NEW_COR, :NEW_OBS, :NEW_CST_PIS, :NEW_CST_COFIN' +
        'S, '
      '  :NEW_CST_IPI, :NEW_ULTIMA_ALTERACAO, :NEW_VALOR_ATACADO, '
      '  :NEW_ALIQ_IBPT_NAC, :NEW_ALIQ_IBPT_IMP, :NEW_FATOR_CONVERSAO, '
      
        '  :NEW_ALERTA_COPA, :NEW_ALERTA_COZINHA, :NEW_ANDROID_VISUALIZA,' +
        ' '
      '  :NEW_TEMPO_PREPARO, :NEW_NAO_PERMITE_FRAC, :NEW_SABORES, '
      '  :NEW_CEST, :NEW_NCM_EX, :CODIGO_SERVICO, :SERVICO_CODIGO,'
      
        '  :CLASSE_TERAPEUTICA, :REGISTRO_MEDICAMENTO, :NUMERO_LOTE, :UNI' +
        'DADE_MEDICAMENTO)')
    ModifySQL.Strings = (
      'UPDATE PRODUTO'
      
        'SET COD_PRO = :NEW_COD_PRO, COD_LAB = :NEW_COD_LAB, COD_SEC = :N' +
        'EW_COD_SEC, '
      '  VALOR_PRO = :NEW_VALOR_PRO, PROMOCAO_PRO = :NEW_PROMOCAO_PRO, '
      
        '  CONTROLA_ESTOQUE_PRO = :NEW_CONTROLA_ESTOQUE_PRO, COMISSAO_PRO' +
        ' = :NEW_COMISSAO_PRO, '
      
        '  QUANT_UNIDADE_ENTRADA = :NEW_QUANT_UNIDADE_ENTRADA, ESTOQUE_MI' +
        'NIMO_PRO = :NEW_ESTOQUE_MINIMO_PRO, '
      '  NOME_PRO = :NEW_NOME_PRO, DESC_CUPOM = :NEW_DESC_CUPOM, '
      
        '  ATIVO_PRO = :NEW_ATIVO_PRO, MARGEM_LUCRO_PRO = :NEW_MARGEM_LUC' +
        'RO_PRO, '
      
        '  LOCALIZACAO_PRO = :NEW_LOCALIZACAO_PRO, PRODUTO_PESADO_PRO = :' +
        'NEW_PRODUTO_PESADO_PRO, '
      
        '  COD_SETOR = :NEW_COD_SETOR, TECLA_ATALHO_PRO = :NEW_TECLA_ATAL' +
        'HO_PRO, '
      
        '  INDICE_RECEITA_PRO = :NEW_INDICE_RECEITA_PRO, DIAS_VALIDADE_PR' +
        'O = :NEW_DIAS_VALIDADE_PRO, '
      
        '  REFERENCIA_PRO = :NEW_REFERENCIA_PRO, COMPLEMENTO_PRO = :NEW_C' +
        'OMPLEMENTO_PRO, '
      
        '  ICMS_CONT_EST = :NEW_ICMS_CONT_EST, ICMS_CONT_FORA = :NEW_ICMS' +
        '_CONT_FORA, '
      
        '  ICMS_CF_EST = :NEW_ICMS_CF_EST, ICMS_CF_FORA = :NEW_ICMS_CF_FO' +
        'RA, '
      
        '  CST_CONT_EST = :NEW_CST_CONT_EST, CST_CONT_FORA = :NEW_CST_CON' +
        'T_FORA, '
      '  CST_CF_EST = :NEW_CST_CF_EST, CST_CF_FORA = :NEW_CST_CF_FORA, '
      
        '  CAMINHO_FOTO_PRO = :NEW_CAMINHO_FOTO_PRO, SAIR_TABELA_PRECO = ' +
        ':NEW_SAIR_TABELA_PRECO, '
      
        '  CFOP_VENDAS_CONT_EST = :NEW_CFOP_VENDAS_CONT_EST, CFOP_VENDAS_' +
        'CF_EST = :NEW_CFOP_VENDAS_CF_EST, '
      
        '  CFOP_VENDAS_CONT_FORA = :NEW_CFOP_VENDAS_CONT_FORA, CFOP_VENDA' +
        'S_CF_FORA = :NEW_CFOP_VENDAS_CF_FORA, '
      
        '  ST_CONT_EST = :NEW_ST_CONT_EST, VR_AGREG_CONT_EST = :NEW_VR_AG' +
        'REG_CONT_EST, '
      
        '  IPI_CONT_EST = :NEW_IPI_CONT_EST, IPI_CF_EST = :NEW_IPI_CF_EST' +
        ', '
      
        '  IPI_CONT_FORA = :NEW_IPI_CONT_FORA, IPI_CF_FORA = :NEW_IPI_CF_' +
        'FORA, '
      
        '  COD_NCM = :NEW_COD_NCM, CLASSIFICACAO_FISCAL = :NEW_CLASSIFICA' +
        'CAO_FISCAL, '
      
        '  CODIGO_TIPO = :NEW_CODIGO_TIPO, COD_PRODUTO_ESTOQUE = :NEW_COD' +
        '_PRODUTO_ESTOQUE, '
      '  COD_GRUPO = :NEW_COD_GRUPO, SUB_GRUPO = :NEW_SUB_GRUPO, '
      
        '  PRECO_PROGRAMADO = :NEW_PRECO_PROGRAMADO, ALIQUOTA_PIS = :NEW_' +
        'ALIQUOTA_PIS, '
      
        '  ALIQUOTA_COFINS = :NEW_ALIQUOTA_COFINS, ALIQUOTA_IR = :NEW_ALI' +
        'QUOTA_IR, '
      
        '  ALIQUOTA_CSLL = :NEW_ALIQUOTA_CSLL, ALIQUOTA_OUTRAS = :NEW_ALI' +
        'QUOTA_OUTRAS, '
      
        '  ISENTO_PIS_COFINS_PRO = :NEW_ISENTO_PIS_COFINS_PRO, PRECO_CUST' +
        'O = :NEW_PRECO_CUSTO, '
      
        '  CREDITO_ICMS = :NEW_CREDITO_ICMS, PRECO_PRAZO_PRO = :NEW_PRECO' +
        '_PRAZO_PRO, '
      
        '  TIPO_PRODUCAO = :NEW_TIPO_PRODUCAO, CODIGO_BARRA_PRO = :NEW_CO' +
        'DIGO_BARRA_PRO, '
      
        '  CODIGO_UNIDADE_SAIDA = :NEW_CODIGO_UNIDADE_SAIDA, CODIGO_UNIDA' +
        'DE_ENTRADA = :NEW_CODIGO_UNIDADE_ENTRADA, '
      
        '  PRECO_PROGRAMADO_PRAZO = :NEW_PRECO_PROGRAMADO_PRAZO, RED_CF_E' +
        'ST = :NEW_RED_CF_EST, '
      
        '  RED_CF_FORA = :NEW_RED_CF_FORA, RED_CONT_EST = :NEW_RED_CONT_E' +
        'ST, '
      
        '  RED_CONT_FORA = :NEW_RED_CONT_FORA, DATA_VALIDADE = :NEW_DATA_' +
        'VALIDADE, '
      
        '  CODIGO_SETOR_ESTOQUE = :NEW_CODIGO_SETOR_ESTOQUE, ORIG = :NEW_' +
        'ORIG, '
      
        '  CSOSN = :NEW_CSOSN, IPI = :NEW_IPI, ICMS = :NEW_ICMS, RICMS = ' +
        ':NEW_RICMS, '
      '  IVA = :NEW_IVA, PIS = :NEW_PIS, CONFINS = :NEW_CONFINS, '
      '  TAMANHO = :NEW_TAMANHO, COR = :NEW_COR, OBS = :NEW_OBS, '
      
        '  CST_PIS = :NEW_CST_PIS, CST_COFINS = :NEW_CST_COFINS, CST_IPI ' +
        '= :NEW_CST_IPI, '
      
        '  ULTIMA_ALTERACAO = :NEW_ULTIMA_ALTERACAO, VALOR_ATACADO = :NEW' +
        '_VALOR_ATACADO, '
      
        '  ALIQ_IBPT_NAC = :NEW_ALIQ_IBPT_NAC, ALIQ_IBPT_IMP = :NEW_ALIQ_' +
        'IBPT_IMP, '
      
        '  FATOR_CONVERSAO = :NEW_FATOR_CONVERSAO, ALERTA_COPA = :NEW_ALE' +
        'RTA_COPA, '
      
        '  ALERTA_COZINHA = :NEW_ALERTA_COZINHA, ANDROID_VISUALIZA = :NEW' +
        '_ANDROID_VISUALIZA, '
      
        '  TEMPO_PREPARO = :NEW_TEMPO_PREPARO, NAO_PERMITE_FRAC = :NEW_NA' +
        'O_PERMITE_FRAC, '
      
        '  SABORES = :NEW_SABORES, CEST = :NEW_CEST, NCM_EX = :NEW_NCM_EX' +
        ', CODIGO_SERVICO = :CODIGO_SERVICO, SERVICO_CODIGO = :SERVICO_CO' +
        'DIGO'
      
        '  , CLASSE_TERAPEUTICA = :CLASSE_TERAPEUTICA, REGISTRO_MEDICAMEN' +
        'TO = :REGISTRO_MEDICAMENTO, NUMERO_LOTE = :NUMERO_LOTE, UNIDADE_' +
        'MEDICAMENTO  = :UNIDADE_MEDICAMENTO '
      'WHERE COD_PRO = :OLD_COD_PRO')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTO'
      'WHERE COD_PRO = :OLD_COD_PRO')
    FetchRowSQL.Strings = (
      
        'SELECT COD_PRO, COD_LAB, COD_SEC, VALOR_PRO, PROMOCAO_PRO, CONTR' +
        'OLA_ESTOQUE_PRO, '
      '  COMISSAO_PRO, QUANT_UNIDADE_ENTRADA, ESTOQUE_MINIMO_PRO, '
      
        '  NOME_PRO, DESC_CUPOM, ATIVO_PRO, MARGEM_LUCRO_PRO, LOCALIZACAO' +
        '_PRO, '
      
        '  PRODUTO_PESADO_PRO, COD_SETOR, TECLA_ATALHO_PRO, INDICE_RECEIT' +
        'A_PRO, '
      
        '  DIAS_VALIDADE_PRO, REFERENCIA_PRO, COMPLEMENTO_PRO, ICMS_CONT_' +
        'EST, '
      '  ICMS_CONT_FORA, ICMS_CF_EST, ICMS_CF_FORA, CST_CONT_EST, '
      '  CST_CONT_FORA, CST_CF_EST, CST_CF_FORA, CAMINHO_FOTO_PRO, '
      '  SAIR_TABELA_PRECO, CFOP_VENDAS_CONT_EST, CFOP_VENDAS_CF_EST, '
      '  CFOP_VENDAS_CONT_FORA, CFOP_VENDAS_CF_FORA, ST_CONT_EST, '
      '  VR_AGREG_CONT_EST, IPI_CONT_EST, IPI_CF_EST, IPI_CONT_FORA, '
      '  IPI_CF_FORA, COD_NCM, CLASSIFICACAO_FISCAL, CODIGO_TIPO, '
      '  COD_PRODUTO_ESTOQUE, COD_GRUPO, SUB_GRUPO, PRECO_PROGRAMADO, '
      '  ALIQUOTA_PIS, ALIQUOTA_COFINS, ALIQUOTA_IR, ALIQUOTA_CSLL, '
      
        '  ALIQUOTA_OUTRAS, ISENTO_PIS_COFINS_PRO, PRECO_CUSTO, CREDITO_I' +
        'CMS, '
      
        '  PRECO_PRAZO_PRO, TIPO_PRODUCAO, CODIGO_BARRA_PRO, CODIGO_UNIDA' +
        'DE_SAIDA, '
      '  CODIGO_UNIDADE_ENTRADA, PRECO_PROGRAMADO_PRAZO, RED_CF_EST, '
      '  RED_CF_FORA, RED_CONT_EST, RED_CONT_FORA, DATA_VALIDADE, '
      '  CODIGO_SETOR_ESTOQUE, ORIG, CSOSN, IPI, ICMS, RICMS, IVA, '
      
        '  PIS, CONFINS, TAMANHO, COR, OBS, CST_PIS, CST_COFINS, CST_IPI,' +
        ' '
      
        '  ULTIMA_ALTERACAO, VALOR_ATACADO, ALIQ_IBPT_NAC, ALIQ_IBPT_IMP,' +
        ' '
      
        '  FATOR_CONVERSAO, ALERTA_COPA, ALERTA_COZINHA, ANDROID_VISUALIZ' +
        'A, '
      
        '  TEMPO_PREPARO, NAO_PERMITE_FRAC, SABORES, CEST, NCM_EX, CODIGO' +
        '_SERVICO, '
      
        '  SERVICO_CODIGO,CLASSE_TERAPEUTICA, REGISTRO_MEDICAMENTO,NUMERO' +
        '_LOTE, UNIDADE_MEDICAMENTO'
      'FROM PRODUTO'
      'WHERE COD_PRO = :COD_PRO')
    Left = 528
    Top = 64
  end
  object QTipos: TFDQuery [10]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM  TIPO_PRODUTO')
    Left = 720
    Top = 472
    object QTiposCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTiposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QTiposSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QTiposEFD_TIPO: TStringField
      FieldName = 'EFD_TIPO'
      Origin = 'EFD_TIPO'
      Size = 2
    end
  end
  object dsTipos: TDataSource [11]
    DataSet = QTipos
    Left = 768
    Top = 472
  end
  object QUnidades: TFDQuery [12]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'select * from UNIDADE_MEDIDA')
    Left = 712
    Top = 360
    object QUnidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object dsUnidade: TDataSource [13]
    DataSet = QUnidades
    Left = 768
    Top = 360
  end
  object QLaboratorios: TFDQuery [14]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM LABORATORIO')
    Left = 712
    Top = 424
    object QLaboratoriosCOD_LAB: TIntegerField
      FieldName = 'COD_LAB'
      Origin = 'COD_LAB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QLaboratoriosNOME_LAB: TStringField
      FieldName = 'NOME_LAB'
      Origin = 'NOME_LAB'
      Required = True
      Size = 50
    end
    object QLaboratoriosCOMISSAO_FIXA: TStringField
      FieldName = 'COMISSAO_FIXA'
      Origin = 'COMISSAO_FIXA'
      Size = 1
    end
    object QLaboratoriosCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
    end
    object QLaboratoriosREDUCAO: TFloatField
      FieldName = 'REDUCAO'
      Origin = 'REDUCAO'
    end
  end
  object dsLaboratorios: TDataSource [15]
    DataSet = QLaboratorios
    Left = 776
    Top = 424
  end
  object QSetorEstoque: TFDQuery [16]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM SETORES_ESTOQUE')
    Left = 704
    Top = 304
    object QSetorEstoqueCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSetorEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QSetorEstoqueCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      Required = True
    end
    object QSetorEstoqueDATA_INICIO_ESTOQUE: TDateField
      FieldName = 'DATA_INICIO_ESTOQUE'
      Origin = 'DATA_INICIO_ESTOQUE'
    end
  end
  object dsSetorEstoque: TDataSource [17]
    DataSet = QSetorEstoque
    Left = 776
    Top = 304
  end
  object QSecao: TFDQuery [18]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM SECAO')
    Left = 696
    Top = 80
    object QSecaoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSecaoNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'NOME_SEC'
      Required = True
      Size = 50
    end
    object QSecaoCAMINHO_FOTO_SEC: TStringField
      FieldName = 'CAMINHO_FOTO_SEC'
      Origin = 'CAMINHO_FOTO_SEC'
      Size = 150
    end
    object QSecaoBEBIDAS_FUMO_SEC: TStringField
      FieldName = 'BEBIDAS_FUMO_SEC'
      Origin = 'BEBIDAS_FUMO_SEC'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QGrupo: TFDQuery [19]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM SECAO_GRUPO')
    Left = 744
    Top = 80
    object QGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object QSubGrupo: TFDQuery [20]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM SECAO_GRUPO_SUBGRUPO')
    Left = 800
    Top = 80
    object QSubGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'COD_SEC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubGrupoCOD_SUBGRUPO: TIntegerField
      FieldName = 'COD_SUBGRUPO'
      Origin = 'COD_SUBGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object dsSecao: TDataSource [21]
    DataSet = QSecao
    Left = 696
    Top = 128
  end
  object dsGrupo: TDataSource [22]
    DataSet = QGrupo
    Left = 744
    Top = 128
  end
  object dsSubGrupo: TDataSource [23]
    DataSet = QSubGrupo
    Left = 800
    Top = 128
  end
  object QSetorBal: TFDQuery [24]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM SETOR_BALANCA')
    Left = 648
    Top = 80
    object QSetorBalCOD_SET: TIntegerField
      FieldName = 'COD_SET'
      Origin = 'COD_SET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSetorBalNOME_SET: TStringField
      FieldName = 'NOME_SET'
      Origin = 'NOME_SET'
      Required = True
      Size = 50
    end
  end
  object dsSetorBal: TDataSource [25]
    DataSet = QSetorBal
    Left = 648
    Top = 128
  end
  object QReceita: TFDQuery [26]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM RECEITAS')
    Left = 824
    Top = 288
    object QReceitaCOD_RECEITA: TIntegerField
      FieldName = 'COD_RECEITA'
      Origin = 'COD_RECEITA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QReceitaINGREDIENTES: TStringField
      FieldName = 'INGREDIENTES'
      Origin = 'INGREDIENTES'
      Required = True
      Size = 200
    end
  end
  object dsReceita: TDataSource [27]
    DataSet = QReceita
    Left = 648
    Top = 224
  end
  object dlgOpenPic: TOpenPictureDialog [28]
    Left = 432
    Top = 168
  end
  object QCompras: TFDQuery [29]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT I.*, E.*, F.RAZAO_FOR, EMP.RAZAO_EMP'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)'
      'INNER JOIN EMPRESA EMP'
      'ON (I.COD_EMP = EMP.COD_EMP)'
      'WHERE I.COD_PRO = :CODPRO'
      'AND I.COD_EMP = :CODEMP'
      'ORDER BY E.DATAENT_ENT')
    Left = 832
    Top = 320
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QComprasCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'COD_ENT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QComprasCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      Required = True
    end
    object QComprasPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = 'PERC_ICMS'
      Precision = 18
      Size = 2
    end
    object QComprasPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = 'PERC_IPI'
      Precision = 18
      Size = 2
    end
    object QComprasQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = 'QTDUND_ENT'
      Precision = 18
      Size = 2
    end
    object QComprasPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = 'PERC_DESC'
      Precision = 18
      Size = 2
    end
    object QComprasPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = 'PERC_ACRES'
      Precision = 18
      Size = 2
    end
    object QComprasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QComprasVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = 'VALOR_UNIT_PRO'
      Required = True
      Precision = 18
    end
    object QComprasCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      Precision = 18
    end
    object QComprasQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'QTD_PRO'
      Precision = 18
      Size = 3
    end
    object QComprasCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
    end
    object QComprasCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = 'COD_CFOP'
    end
    object QComprasVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'VALOR_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object QComprasPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = 'PERC_BCR'
      Precision = 18
      Size = 2
    end
    object QComprasCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object QComprasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
    end
    object QComprasBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'BASE_CALCULO'
      Precision = 18
    end
    object QComprasVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
    end
    object QComprasORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QComprasPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = 'PERC_ST'
      Precision = 18
    end
    object QComprasVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = 'VALOR_SUB_TRIBUTARIA'
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object QComprasCODIGO_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CODIGO_LOCAL_ESTOQUE'
      Origin = 'CODIGO_LOCAL_ESTOQUE'
      Required = True
    end
    object QComprasBC_ST: TBCDField
      FieldName = 'BC_ST'
      Origin = 'BC_ST'
      Precision = 18
      Size = 2
    end
    object QComprasCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object QComprasCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object QComprasALIQ_PIS: TBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Origin = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object QComprasCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 3
    end
    object QComprasALIQ_COFINS: TBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Origin = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object QComprasCOD_ENT_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_ENT_1'
      Origin = 'COD_ENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasCOD_EMP_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_EMP_1'
      Origin = 'COD_EMP'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasDATAEMI_ENT: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATAEMI_ENT'
      Origin = 'DATAEMI_ENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasDATAENT_ENT: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATAENT_ENT'
      Origin = 'DATAENT_ENT'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasCOD_FOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasTOTAL_ENT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ENT'
      Origin = 'TOTAL_ENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasACRES_ENT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ACRES_ENT'
      Origin = 'ACRES_ENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasDESC_ENT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_ENT'
      Origin = 'DESC_ENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasFRETE_ENT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE_ENT'
      Origin = 'FRETE_ENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasICMSFRETE_ENT: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ICMSFRETE_ENT'
      Origin = 'ICMSFRETE_ENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasTIPO_ENT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_ENT'
      Origin = 'TIPO_ENT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QComprasNUMNF_ENT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMNF_ENT'
      Origin = 'NUMNF_ENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object QComprasSERIE_ENT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SERIE_ENT'
      Origin = 'SERIE_ENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object QComprasBASE_SUB_TRIB: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_SUB_TRIB'
      Origin = 'BASE_SUB_TRIB'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_ICMS_SUB: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ICMS_SUB'
      Origin = 'VALOR_ICMS_SUB'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasFRETE_INCLUSO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE_INCLUSO'
      Origin = 'FRETE_INCLUSO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QComprasICMS_SUB_INCLUSO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ICMS_SUB_INCLUSO'
      Origin = 'ICMS_SUB_INCLUSO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QComprasTOTAL_PRODUTOS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_PRODUTOS'
      Origin = 'TOTAL_PRODUTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasCUSTO_SEM_DESCONTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CUSTO_SEM_DESCONTO'
      Origin = 'CUSTO_SEM_DESCONTO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QComprasCODIFICACAO_FISCAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'CODIFICACAO_FISCAL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QComprasCODIGO_ES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_ES'
      Origin = 'CODIGO_ES'
      ProviderFlags = []
      ReadOnly = True
    end
    object QComprasCHAVE_NFE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CHAVE_NFE'
      Origin = 'CHAVE_NFE'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QComprasVALOR_PIS_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PIS_1'
      Origin = 'VALOR_PIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasVALOR_COFINS_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_COFINS_1'
      Origin = 'VALOR_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QComprasCODIGO_ESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_ESTADO'
      Origin = 'CODIGO_ESTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object QComprasBC_ICMS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BC_ICMS'
      Origin = 'BC_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QComprasVL_ICMS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QComprasVL_IPI: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QComprasVL_SEG: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_SEG'
      Origin = 'VL_SEG'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QComprasRAZAO_FOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QComprasRAZAO_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_EMP'
      Origin = 'RAZAO_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsCompras: TDataSource [30]
    DataSet = QCompras
    Left = 832
    Top = 368
  end
  object QUltimaVenda: TFDQuery [31]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      
        'SELECT FIRST 1 I.QUANT, I.VALOR, V.DATA_VEN, V.CUPOM_FISCAL_VEN,' +
        ' V.NUMERO_NOTA_FISCAL, C.NOME_CLI'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'WHERE I.COD_VEN = ( SELECT MAX(COD_VEN) CODVENDA'
      '                        FROM ITENS_VENDA'
      
        '                        WHERE COD_PRO = :CODPRO AND COD_EMP = :C' +
        'ODEMP'
      
        '                        AND CANCELADO = 0 AND VENDA_CANCELADA = ' +
        '0 )'
      
        'AND I.COD_PRO = :CODPRO AND I.COD_EMP = :CODEMP AND CANCELADO = ' +
        '0 AND VENDA_CANCELADA = 0')
    Left = 576
    Top = 176
    ParamData = <
      item
        Name = 'CODPRO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QUltimaVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QUltimaVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
      Size = 3
    end
    object QUltimaVendaDATA_VEN: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_VEN'
      Origin = 'DATA_VEN'
      ProviderFlags = []
      ReadOnly = True
    end
    object QUltimaVendaCUPOM_FISCAL_VEN: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'CUPOM_FISCAL_VEN'
      ProviderFlags = []
      ReadOnly = True
    end
    object QUltimaVendaNUMERO_NOTA_FISCAL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_NOTA_FISCAL'
      Origin = 'NUMERO_NOTA_FISCAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QUltimaVendaNOME_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsUltimaVenda: TDataSource [32]
    DataSet = QUltimaVenda
    Left = 584
    Top = 232
  end
  object QNcms: TFDQuery [33]
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      
        'SELECT PN.*, TP.descricao, n.descricao DESC_NCM FROM TRIBUTACAO_' +
        'PERFIL_NCM PN'
      'INNER JOIN TRIBUTACAO_PERFIL TP'
      'ON( TP.cod_perfil = PN.cod_perfil and TP.cod_emp = PN.cod_emp )'
      'INNER JOIN NCM N'
      'ON( N.ncm = PN.ncm AND n.cod_emp=PN.cod_emp and n.ex = pn.ex )'
      'where PN.cod_emp = :COD_EMP')
    Left = 632
    Top = 288
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QNcmsCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Origin = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNcmsCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNcmsNCM: TIntegerField
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QNcmsDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object QNcmsDESC_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_NCM'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object QNcmsEX: TIntegerField
      FieldName = 'EX'
      Origin = 'EX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsNCMs: TDataSource [34]
    DataSet = QNcms
    Left = 664
    Top = 304
  end
  object QFornecedoresPro: TFDQuery [35]
    AfterInsert = QFornecedoresProAfterInsert
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upFornecedoresPro
    SQL.Strings = (
      
        'SELECT PRODUTO_FORNECEDORES.*, fornecedor.razao_for FROM PRODUTO' +
        '_FORNECEDORES'
      'INNER JOIN FORNECEDOR'
      'ON( FORNECEDOR.cod_for=PRODUTO_FORNECEDORES.cod_for )'
      'WHERE COD_PRO=:COD_PRO')
    Left = 640
    Top = 392
    ParamData = <
      item
        Name = 'COD_PRO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QFornecedoresProCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QFornecedoresProCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QFornecedoresProREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object QFornecedoresProRAZAO_FOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_FOR'
      Origin = 'RAZAO_FOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsFornecedoresPro: TDataSource [36]
    DataSet = QFornecedoresPro
    Left = 640
    Top = 440
  end
  object upFornecedoresPro: TFDUpdateSQL [37]
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO PRODUTO_FORNECEDORES'
      '(COD_PRO, COD_FOR, REFERENCIA)'
      'VALUES (:NEW_COD_PRO, :NEW_COD_FOR, :NEW_REFERENCIA)')
    ModifySQL.Strings = (
      'UPDATE PRODUTO_FORNECEDORES'
      
        'SET COD_PRO = :NEW_COD_PRO, COD_FOR = :NEW_COD_FOR, REFERENCIA =' +
        ' :NEW_REFERENCIA'
      'WHERE COD_PRO = :OLD_COD_PRO AND COD_FOR = :OLD_COD_FOR')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTO_FORNECEDORES'
      'WHERE COD_PRO = :OLD_COD_PRO AND COD_FOR = :OLD_COD_FOR')
    FetchRowSQL.Strings = (
      
        'SELECT PRODUTO_FORNECEDORES.*, fornecedor.razao_for FROM PRODUTO' +
        '_FORNECEDORES'
      'INNER JOIN FORNECEDOR'
      'ON( FORNECEDOR.cod_for=PRODUTO_FORNECEDORES.cod_for )'
      'WHERE PRODUTO_FORNECEDORES.COD_PRO = :COD_PRO '
      'AND PRODUTO_FORNECEDORES.COD_FOR = :COD_FOR')
    Left = 640
    Top = 488
  end
  object QComposicao: TFDQuery [38]
    AfterInsert = QComposicaoAfterInsert
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upComposicao
    SQL.Strings = (
      'SELECT PC.*, P.nome_pro, E.estoque FROM PRODUTOS_COMPOSICAO PC'
      'INNER JOIN PRODUTO P'
      'ON( P.cod_pro=PC.cod_pro_composicao )'
      'LEFT OUTER JOIN ESTOQUE E'
      'ON( E.cod_emp=:COD_EMP AND E.cod_pro=PC.cod_pro )'
      'WHERE PC.cod_pro=:COD_PRO')
    Left = 952
    Top = 328
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_PRO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QComposicaoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QComposicaoCOD_PRO_COMPOSICAO: TIntegerField
      FieldName = 'COD_PRO_COMPOSICAO'
      Origin = 'COD_PRO_COMPOSICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QComposicaoQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Required = True
      DisplayFormat = '0.000'
      Precision = 18
      Size = 3
    end
    object QComposicaoNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QComposicaoESTOQUE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.000'
      Precision = 18
      Size = 3
    end
  end
  object dsComposicao: TDataSource [39]
    DataSet = QComposicao
    Left = 952
    Top = 376
  end
  object upComposicao: TFDUpdateSQL [40]
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO PRODUTOS_COMPOSICAO'
      '(COD_PRO, COD_PRO_COMPOSICAO, QUANT)'
      'VALUES (:NEW_COD_PRO, :NEW_COD_PRO_COMPOSICAO, :NEW_QUANT)')
    ModifySQL.Strings = (
      'UPDATE PRODUTOS_COMPOSICAO'
      
        'SET COD_PRO = :NEW_COD_PRO, COD_PRO_COMPOSICAO = :NEW_COD_PRO_CO' +
        'MPOSICAO, '
      '  QUANT = :NEW_QUANT'
      
        'WHERE COD_PRO = :OLD_COD_PRO AND COD_PRO_COMPOSICAO = :OLD_COD_P' +
        'RO_COMPOSICAO')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS_COMPOSICAO'
      
        'WHERE COD_PRO = :OLD_COD_PRO AND COD_PRO_COMPOSICAO = :OLD_COD_P' +
        'RO_COMPOSICAO')
    FetchRowSQL.Strings = (
      'SELECT PC.*, P.nome_pro, E.estoque FROM PRODUTOS_COMPOSICAO PC'
      'INNER JOIN PRODUTO P'
      'ON( P.cod_pro=PC.cod_pro_composicao )'
      'LEFT OUTER JOIN ESTOQUE E'
      'ON( E.cod_emp=:COD_EMP AND E.cod_pro=PC.cod_pro )'
      'WHERE PC.COD_PRO = :COD_PRO '
      'AND PC.COD_PRO_COMPOSICAO = :COD_PRO_COMPOSICAO')
    Left = 944
    Top = 424
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
    DesignInfo = 7864720
  end
  object cxGridImg: TcxImageList
    DrawingStyle = dsTransparent
    FormatVersion = 1
    DesignInfo = 8389072
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000010101010101
          0101010101010101010101010101010101010101010104040407030303070101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101030303052626266F3B3B3BAE3B3B3BB22121
          2160010101020101010101010101010101010101010101010101010101010101
          0101010101010101010118181843464646D3535353FF3F3F3FBE414141C65353
          53FF404040C00F0F0F2A01010101010101010101010101010101010101010101
          010101010101292929742C2C2C7F4B4B4BE5535353FF3F3F3FBE414141C65353
          53FF4D4D4DE93333339522222262010101010101010101010101010101010101
          01010404040A2F2F2F8A505050F72F2F2F87454545D53F3F3FBE414141C64646
          46D5383838A4505050F62C2C2C81030303070101010101010101010101011717
          1740484848DA535353FF535353FF535353FF3636369F2D2D2D822F2F2F863B3B
          3BB2535353FF535353FF535353FF464646D31515153A010101013030308C5353
          53FE535353FF535353FF535353FF535353FF4D4D4DED141414391B1B1B4C4F4F
          4FF4535353FF535353FF535353FF535353FF525252FD2B2B2B7C1010102D4A4A
          4AE0535353FF535353FF535353FF383838AB0A0A0A1901010101010101010C0C
          0C213C3C3CB7535353FF535353FF535353FF434343CF0A0A0A1B010101010909
          0919424242C94A4A4AE41C1C1C50010101010101010101010101010101010101
          0101010101011F1F1F5A4C4C4CE83C3C3CB50606060D01010101010101010101
          0101080808140C0C0C2001010101010101010101010101010101010101010101
          010101010101010101010E0E0E26040404090101010101010101010101010909
          0917424242C84B4B4BE71E1E1E56010101010101010101010101010101010101
          010101010102222222614D4D4DED3C3C3CB70606060F010101010F0F0F294949
          49DD535353FF535353FF535353FF3C3C3CB30C0C0C1F01010101010101010D0D
          0D233E3E3EBB535353FF535353FF535353FF454545D20C0C0C202F2F2F885252
          52FD535353FF535353FF535353FF535353FF4F4F4FF3171717401B1B1B4D5050
          50F5535353FF535353FF535353FF535353FF525252FB28282874010101011616
          163D464646D6535353FF535353FF535353FF3030308D02020203040404093636
          36A5535353FF535353FF535353FF444444CD1212123201010101010101010101
          0101040404082B2B2B7F4F4F4FF42525256B0101010101010101010101010101
          01022C2C2C80505050F528282877030303050101010101010101010101010101
          010101010101010101010606060E010101010101010101010101010101010101
          0101010101010707071101010101010101010101010101010101}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000010101010101
          0101010101010101010101010101010101010101010103060207030602070101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101020401052058036F308803AE338C03B21C4C
          0360010201020101010101010101010101010101010101010101010101010101
          01010101010101010101143603433AA602D345C900FF359601BE369B02C645C9
          00FF359702C00D22022A01010101010101010101010101010101010101010101
          010101010101235C04742564047F3FB401E545C900FF359601BE369B02C645C9
          00FF40B801E92C7505951D4E0462010101010101010101010101010101010101
          01010408020A276D038A43C201F7286B04873AA602D5359601BE369B02C63AA8
          02D52F8204A443C201F626660481030502070101010101010101010101011333
          03403CAC02DA45C900FF45C900FF44C800FF2E7D049F27670582286A0586338C
          03B245C900FF45C900FF45C900FF3AA602D3122E033A01010101286F038C44C7
          00FE45C900FF45C900FF45C900FF45C900FF40BB01ED112D0339173D034C41BF
          01F445C900FF45C900FF45C900FF45C900FF43C600FD2462037C0E24022D3DB0
          01E045C900FF45C900FF45C900FF308703AB0814021901010101010101010B1B
          0221339001B744C800FF45C900FF45C900FF39A202CF0916021B010101010814
          0219369E02C93EB401E418400350010101010101010101010101010101010101
          0101010101011B47035A3FB701E8328F01B5050B020D01010101010101010101
          0101071002140B1A032001010101010101010101010101010101010101010101
          010101010101010101010C1E0326040702090101010101010101010101010812
          0217379D02C83FB401E719440356010101010101010101010101010101010101
          0101010201021C4D036140BB01ED339001B7050C020F010101010D2002293DAD
          02DD45C900FF45C900FF45C900FF328E03B30A19021F01010101010101010B1C
          0223339301BB45C900FF45C900FF45C900FF3AA602D20A190220286C048844C7
          00FD44C800FF44C800FF45C900FF45C900FF42C001F314330340173D034D42C0
          01F545C900FF45C900FF45C900FF45C900FF44C500FB225B0374010101011231
          023D3BA802D644C800FF45C900FF45C900FF286F038D02030103040702092E81
          03A545C900FF45C900FF45C900FF38A202CD0F28023201010101010101010101
          0101030602082464037F43BF01F41F55036B0101010101010101010101010102
          01022565038042C001F5225E0377020401050101010101010101010101010101
          01010101010101010101050B020E010101010101010101010101010101010101
          010101010101060E021101010101010101010101010101010101}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000010101010101
          0101010101010101010101010101010101010101010102020607020206070101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101020204050603586F090388AE08038CB20503
          4C60010102020101010101010101010101010101010101010101010101010101
          01010101010101010101050335430702A6D30700C9FF070394BE08029BC60700
          C9FF080297C00303212A01010101010101010101010101010101010101010101
          01010101010108055C740704647F0701B4E50700C9FF070394BE08029BC60700
          C9FF0701B8E90905759506044E62010101010101010101010101010101010101
          01010202080A06036D8A0801C2F708056B870802A6D5070394BE08029BC60802
          A8D5080481A40801C2F607046581020205070101010101010101010101010403
          33400802ABDA0700C9FF0700C9FF0700C8FF07047D9F0805668209056A860803
          8CB20700C9FF0700C9FF0700C9FF0702A5D304032E3A0101010107046E8C0800
          C7FE0700C9FF0700C9FF0700C9FF0700C9FF0701BBED04032D3905033C4C0801
          BFF40700C9FF0700C9FF0700C9FF0700C9FF0800C6FD0704627C0402242D0801
          B0E00700C9FF0700C9FF0700C9FF070387AB0302141901010101010101010303
          1A21080190B70800C8FF0700C9FF0700C9FF0702A2CF0302161B010101010302
          131906029EC90701B4E405033F50010101010101010101010101010101010101
          0101010101010503475A0701B7E808018FB502020B0D01010101010101010101
          0101030210140403192001010101010101010101010101010101010101010101
          0101010101010101010104031E26020207090101010101010101010101010302
          121706029DC80701B4E705034456010101010101010101010101010101010101
          01010101010206034D610701BBED060190B702020C0F01010101030220290802
          ADDD0700C9FF0700C9FF0700C9FF08038CB30302191F01010101010101010302
          1C23070193BB0700C9FF0700C9FF0700C9FF0702A6D20302192007046C880700
          C7FD0800C8FF0800C8FF0700C9FF0700C9FF0801C0F30503324005033D4D0801
          C0F50700C9FF0700C9FF0700C9FF0700C9FF0800C5FB06045B74010101010403
          313D0802A8D60800C8FF0700C9FF0700C9FF07036F8D01010303020207090603
          81A50700C9FF0700C9FF0700C9FF0702A2CD0403273201010101010101010101
          0101020206080603647F0801BFF40603556B0101010101010101010101010101
          0202060365800801C0F506035E77020104050101010101010101010101010101
          0101010101010101010102020B0E010101010101010101010101010101010101
          01010101010103020E1101010101010101010101010101010101}
      end>
  end
  object QCest: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'select cest, descricao from tab_cest'
      
        '                  where ncm in ( :NCM, :NCM1, :NCM2, :NCM3, :NCM' +
        '4, :NCM5, :NCM6 )'
      '                  group by cest, descricao')
    Left = 392
    Top = 288
    ParamData = <
      item
        Name = 'NCM'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM1'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM2'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM3'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM4'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM5'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'NCM6'
        ParamType = ptInput
      end>
    object QCestCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Required = True
      Size = 7
    end
    object QCestDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 512
    end
  end
  object dsCEST: TDataSource
    DataSet = QCest
    Left = 512
    Top = 288
  end
  object QGrupoICMS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM GRUPO_ICMS')
    Left = 520
    Top = 216
    object QGrupoICMSCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QGrupoICMSNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = 'NOME_GRP'
      Required = True
      Size = 50
    end
    object QGrupoICMSALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'ALIQUOTA_GRP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QGrupoICMSTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QGrupoICMSCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      FixedChar = True
      Size = 3
    end
    object QGrupoICMSICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = 'ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QGrupoICMSECF: TStringField
      FieldName = 'ECF'
      Origin = 'ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsGrupoICMS: TDataSource
    DataSet = QGrupoICMS
    Left = 464
    Top = 224
  end
end
