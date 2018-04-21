inherited frmCadNewFormas: TfrmCadNewFormas
  Caption = 'Cadastro Formas de Pagamento'
  ClientHeight = 480
  ExplicitWidth = 900
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlGeral: TPanel
    Height = 417
    ExplicitHeight = 417
    inherited cxPaginas: TcxPageControl
      Height = 417
      ExplicitHeight = 417
      ClientRectBottom = 415
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 880
        ExplicitHeight = 385
        inherited cxVisualiza: TcxGrid
          Height = 338
          ExplicitHeight = 338
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            OptionsView.ColumnAutoWidth = True
            object cxVisualizaDBTableView1TIPO: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'TIPO'
              PropertiesClassName = 'TcxTextEditProperties'
              OnCustomDrawCell = cxVisualizaDBTableView1TIPOCustomDrawCell
              OnGetDisplayText = cxVisualizaDBTableView1TIPOGetDisplayText
              Options.Moving = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
              Width = 140
            end
            object cxVisualizaDBTableView1CODIGO: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO'
              Width = 133
            end
            object cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 587
            end
            object cxVisualizaDBTableView1TIPO2: TcxGridDBColumn
              DataBinding.FieldName = 'TIPO'
              Visible = False
              VisibleForCustomization = False
              VisibleForEditForm = bFalse
            end
          end
        end
        inherited Panel1: TPanel
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
            Visible = False
          end
        end
      end
      inherited PageEdit: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 880
        ExplicitHeight = 385
        object cxPaginas2: TcxPageControl
          Left = 0
          Top = 0
          Width = 880
          Height = 385
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxPageGeral
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 383
          ClientRectLeft = 2
          ClientRectRight = 878
          ClientRectTop = 30
          object cxPageGeral: TcxTabSheet
            Caption = 'Dados Forma'
            ImageIndex = 0
            OnShow = cxPageGeralShow
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object pnl1: TPanel
              Left = 0
              Top = 0
              Width = 876
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
              object dbedtCODIGO: TDBEdit
                Left = 5
                Top = 19
                Width = 121
                Height = 23
                TabStop = False
                CharCase = ecUpperCase
                DataField = 'CODIGO'
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
            end
            object pnl2: TPanel
              Left = 0
              Top = 45
              Width = 876
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object cxLabel2: TcxLabel
                Left = 3
                Top = -2
                Caption = 'Descri'#231#227'o :'
                Transparent = True
              end
              object dbedtDESCRICAO: TDBEdit
                Left = 5
                Top = 18
                Width = 524
                Height = 23
                CharCase = ecUpperCase
                DataField = 'DESCRICAO'
                DataSource = dsPrincipal
                TabOrder = 1
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 90
              Width = 876
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object cxLabel3: TcxLabel
                Left = 3
                Top = -2
                Caption = 'Tipo da Forma :'
                Transparent = True
              end
              object cbbTIPO: TRxDBComboBox
                Left = 5
                Top = 18
                Width = 307
                Height = 23
                DataField = 'TIPO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'DINHEIRO'
                  'PROMISS'#211'RIA'
                  'CHEQUE'
                  'CART'#195'O'
                  'BOLETO'
                  'TICKET'
                  'CONTRA VALE'
                  'TROCO'
                  'CONSULTA CHEQUE'
                  'TROCO VALE')
                TabOrder = 1
                Values.Strings = (
                  'DN'
                  'PR'
                  'CH'
                  'CA'
                  'BO'
                  'TI'
                  'CV'
                  'TR'
                  'CC'
                  'TV')
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 135
              Width = 876
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 3
              object cxLabel4: TcxLabel
                Left = 3
                Top = -2
                Caption = 'Tabela de Pre'#231'o :'
                Transparent = True
              end
              object cbbTABELA_PRECO: TRxDBComboBox
                Left = 5
                Top = 18
                Width = 307
                Height = 23
                DataField = 'TABELA_PRECO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'A VISTA'
                  'A PRAZO')
                TabOrder = 1
                Values.Strings = (
                  '0'
                  '1')
              end
            end
            object Panel5: TPanel
              Left = 0
              Top = 180
              Width = 876
              Height = 157
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 4
              object grpOpcoes: TGroupBox
                AlignWithMargins = True
                Left = 5
                Top = 3
                Width = 307
                Height = 151
                Margins.Left = 5
                Align = alLeft
                Caption = 'Op'#231#245'es do Caixa '
                TabOrder = 0
                object dbchkUSA_TEF: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 20
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'Usar TEF'
                  DataField = 'USA_TEF'
                  DataSource = dsPrincipal
                  TabOrder = 0
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkABRE_GAVETA: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 41
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'Abrir Gaveta'
                  DataField = 'ABRE_GAVETA'
                  DataSource = dsPrincipal
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkUSAR_PAF_ECF: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 62
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'Usar no PAF-ECF ( Frente de Loja / PDV )'
                  DataField = 'USAR_PAF_ECF'
                  DataSource = dsPrincipal
                  TabOrder = 2
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkUSAR_CONTAS_RECEBER: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 83
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'Usar Contas a Receber'
                  DataField = 'USAR_CONTAS_RECEBER'
                  DataSource = dsPrincipal
                  TabOrder = 3
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkUSAR_CONTAS_PAGAR: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 104
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'usar Contas a Pagar'
                  DataField = 'USAR_CONTAS_PAGAR'
                  DataSource = dsPrincipal
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkCONCEDER_DESCONTO: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 125
                  Width = 297
                  Height = 17
                  Margins.Bottom = 1
                  Align = alTop
                  Caption = 'Conceder Desconto'
                  DataField = 'CONCEDER_DESCONTO'
                  DataSource = dsPrincipal
                  TabOrder = 5
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
            end
          end
          object cxPageFluxo: TcxTabSheet
            Caption = 'Fluxo Caixa / Planos de Conta'
            ImageIndex = 1
            OnShow = cxPageFluxoShow
            object Panel34: TPanel
              Left = 0
              Top = 0
              Width = 876
              Height = 105
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Panel35: TPanel
                Left = 0
                Top = 0
                Width = 265
                Height = 105
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBox8: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 26
                  Width = 259
                  Height = 76
                  Align = alClient
                  Caption = ' Contas a Receber '
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  object cxLabel36: TcxLabel
                    AlignWithMargins = True
                    Left = 5
                    Top = 17
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alTop
                    Caption = 'Plano Contas '
                    Transparent = True
                  end
                  object DBbFLUXO_RECEBER_CHAVE: TcxDBButtonEdit
                    AlignWithMargins = True
                    Left = 5
                    Top = 36
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alTop
                    DataBinding.DataField = 'FLUXO_RECEBER_CHAVE'
                    DataBinding.DataSource = dsHistoricos
                    Properties.Buttons = <
                      item
                        Default = True
                        ImageIndex = 0
                        Kind = bkGlyph
                      end
                      item
                        ImageIndex = 1
                        Kind = bkGlyph
                      end>
                    Properties.Images = cxImgButtons
                    Properties.OnButtonClick = FluxosPlanos
                    TabOrder = 1
                    Width = 249
                  end
                end
                object dbchkFLUXO_RECEBER: TDBCheckBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 259
                  Height = 17
                  Align = alTop
                  Caption = 'Contas a Receber'
                  DataField = 'FLUXO_RECEBER'
                  DataSource = dsHistoricos
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
              object Panel36: TPanel
                Left = 265
                Top = 0
                Width = 320
                Height = 105
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object GroupBox9: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 26
                  Width = 270
                  Height = 76
                  Align = alLeft
                  Caption = ' Contas a Pagar '
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 2
                    Top = 17
                    Width = 263
                    Height = 57
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel38: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 0
                      Margins.Top = 0
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Plano Contas '
                      Transparent = True
                    end
                    object DBbFLUXO_PAGAR_CHAVE: TcxDBButtonEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 19
                      Margins.Top = 0
                      Margins.Bottom = 0
                      Align = alTop
                      DataBinding.DataField = 'FLUXO_PAGAR_CHAVE'
                      DataBinding.DataSource = dsHistoricos
                      Properties.Buttons = <
                        item
                          Default = True
                          ImageIndex = 0
                          Kind = bkGlyph
                        end>
                      Properties.Images = cxImgButtons
                      Properties.OnButtonClick = FluxosPlanos
                      TabOrder = 1
                      Width = 257
                    end
                  end
                end
                object dbchkFLUXO_PAGAR: TDBCheckBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 314
                  Height = 17
                  Align = alTop
                  Caption = 'Contas a Pagar'
                  DataField = 'FLUXO_PAGAR'
                  DataSource = dsHistoricos
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
            end
            object Panel7: TPanel
              Left = 0
              Top = 105
              Width = 876
              Height = 105
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 265
                Height = 105
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBox1: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 26
                  Width = 259
                  Height = 76
                  Align = alClient
                  Caption = ' Vendas '
                  Color = clWhite
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  object cxLabel5: TcxLabel
                    AlignWithMargins = True
                    Left = 5
                    Top = 17
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alTop
                    Caption = 'Plano Contas '
                    Transparent = True
                  end
                  object DBbFLUXO_VENDAS_CHAVE: TcxDBButtonEdit
                    AlignWithMargins = True
                    Left = 5
                    Top = 36
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alTop
                    DataBinding.DataField = 'FLUXO_VENDAS_CHAVE'
                    DataBinding.DataSource = dsHistoricos
                    Properties.Buttons = <
                      item
                        Default = True
                        ImageIndex = 0
                        Kind = bkGlyph
                      end>
                    Properties.Images = cxImgButtons
                    Properties.OnButtonClick = FluxosPlanos
                    TabOrder = 1
                    Width = 249
                  end
                end
                object dbchkFLUXO_VENDAS: TDBCheckBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 259
                  Height = 17
                  Align = alTop
                  Caption = 'Vendas'
                  DataField = 'FLUXO_VENDAS'
                  DataSource = dsHistoricos
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM FORMAS_PAGAMENTO')
    object QPrincipalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
    end
    object QPrincipalUSA_TEF: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'USA_TEF'
      Origin = 'USA_TEF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalABRE_GAVETA: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'ABRE_GAVETA'
      Origin = 'ABRE_GAVETA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalUSAR_CONTAS_RECEBER: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'USAR_CONTAS_RECEBER'
      Origin = 'USAR_CONTAS_RECEBER'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalUSAR_CONTAS_PAGAR: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'USAR_CONTAS_PAGAR'
      Origin = 'USAR_CONTAS_PAGAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalTIPO: TStringField
      DefaultExpression = 'UPPER('#39'DN'#39')'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QPrincipalTABELA_PRECO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'TABELA_PRECO'
      Origin = 'TABELA_PRECO'
      Required = True
    end
    object QPrincipalCONCEDER_DESCONTO: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'CONCEDER_DESCONTO'
      Origin = 'CONCEDER_DESCONTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalCODIGO_CONTA_VENDAS: TIntegerField
      FieldName = 'CODIGO_CONTA_VENDAS'
      Origin = 'CODIGO_CONTA_VENDAS'
    end
    object QPrincipalCODIGO_CENTRO_CUSTO_VENDAS: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_VENDAS'
      Origin = 'CODIGO_CENTRO_CUSTO_VENDAS'
    end
    object QPrincipalUSAR_PAF_ECF: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'USAR_PAF_ECF'
      Origin = 'USAR_PAF_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalCODIGO_CONTA_CTR: TIntegerField
      FieldName = 'CODIGO_CONTA_CTR'
      Origin = 'CODIGO_CONTA_CTR'
    end
    object QPrincipalCODIGO_CENTRO_CUSTO_CTR: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTR'
      Origin = 'CODIGO_CENTRO_CUSTO_CTR'
    end
    object QPrincipalCODIGO_CONTA_CTP: TIntegerField
      FieldName = 'CODIGO_CONTA_CTP'
      Origin = 'CODIGO_CONTA_CTP'
    end
    object QPrincipalCODIGO_CONTA_CTR_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_CTR_ESTORNO'
      Origin = 'CODIGO_CONTA_CTR_ESTORNO'
    end
    object QPrincipalCODIGO_CENTRO_CUSTO_CTR_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTR_ESTORNO'
      Origin = 'CODIGO_CENTRO_CUSTO_CTR_ESTORNO'
    end
    object QPrincipalCODIGO_CONTA_CTP_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_CTP_ESTORNO'
      Origin = 'CODIGO_CONTA_CTP_ESTORNO'
    end
    object QPrincipalCODIGO_CENTRO_CUSTO_CTP_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_CTP_ESTORNO'
      Origin = 'CODIGO_CENTRO_CUSTO_CTP_ESTORNO'
    end
    object QPrincipalCODIGO_CONTA_VEN_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CONTA_VEN_ESTORNO'
      Origin = 'CODIGO_CONTA_VEN_ESTORNO'
    end
    object QPrincipalCODIGO_CENTRO_CUSTO_VEN_ESTORNO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO_VEN_ESTORNO'
      Origin = 'CODIGO_CENTRO_CUSTO_VEN_ESTORNO'
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
  end
  object upPrincipal: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO FORMAS_PAGAMENTO'
      '(CODIGO, DESCRICAO, USA_TEF, ABRE_GAVETA,'
      '  USAR_CONTAS_RECEBER, USAR_CONTAS_PAGAR, TIPO, '
      '  TABELA_PRECO, CONCEDER_DESCONTO, CODIGO_CONTA_VENDAS, '
      '  CODIGO_CENTRO_CUSTO_VENDAS, USAR_PAF_ECF, CODIGO_CONTA_CTR, '
      
        '  CODIGO_CENTRO_CUSTO_CTR, CODIGO_CONTA_CTP, CODIGO_CONTA_CTR_ES' +
        'TORNO, '
      '  CODIGO_CENTRO_CUSTO_CTR_ESTORNO, CODIGO_CONTA_CTP_ESTORNO, '
      '  CODIGO_CENTRO_CUSTO_CTP_ESTORNO, CODIGO_CONTA_VEN_ESTORNO, '
      '  CODIGO_CENTRO_CUSTO_VEN_ESTORNO)'
      
        'VALUES ((SELECT ( COALESCE( MAX(CODIGO), 0 ) + 1 ) FROM FORMAS_P' +
        'AGAMENTO ), :NEW_DESCRICAO, :NEW_USA_TEF, :NEW_ABRE_GAVETA,'
      '  :NEW_USAR_CONTAS_RECEBER, :NEW_USAR_CONTAS_PAGAR, :NEW_TIPO, '
      
        '  :NEW_TABELA_PRECO, :NEW_CONCEDER_DESCONTO, :NEW_CODIGO_CONTA_V' +
        'ENDAS, '
      
        '  :NEW_CODIGO_CENTRO_CUSTO_VENDAS, :NEW_USAR_PAF_ECF, :NEW_CODIG' +
        'O_CONTA_CTR, '
      
        '  :NEW_CODIGO_CENTRO_CUSTO_CTR, :NEW_CODIGO_CONTA_CTP, :NEW_CODI' +
        'GO_CONTA_CTR_ESTORNO, '
      
        '  :NEW_CODIGO_CENTRO_CUSTO_CTR_ESTORNO, :NEW_CODIGO_CONTA_CTP_ES' +
        'TORNO, '
      
        '  :NEW_CODIGO_CENTRO_CUSTO_CTP_ESTORNO, :NEW_CODIGO_CONTA_VEN_ES' +
        'TORNO, '
      '  :NEW_CODIGO_CENTRO_CUSTO_VEN_ESTORNO) returning CODIGO')
    ModifySQL.Strings = (
      'UPDATE FORMAS_PAGAMENTO'
      
        'SET CODIGO = :NEW_CODIGO, DESCRICAO = :NEW_DESCRICAO, USA_TEF = ' +
        ':NEW_USA_TEF, '
      
        '  ABRE_GAVETA = :NEW_ABRE_GAVETA, USAR_CONTAS_RECEBER = :NEW_USA' +
        'R_CONTAS_RECEBER, '
      '  USAR_CONTAS_PAGAR = :NEW_USAR_CONTAS_PAGAR, TIPO = :NEW_TIPO, '
      
        '  TABELA_PRECO = :NEW_TABELA_PRECO, CONCEDER_DESCONTO = :NEW_CON' +
        'CEDER_DESCONTO, '
      
        '  CODIGO_CONTA_VENDAS = :NEW_CODIGO_CONTA_VENDAS, CODIGO_CENTRO_' +
        'CUSTO_VENDAS = :NEW_CODIGO_CENTRO_CUSTO_VENDAS, '
      
        '  USAR_PAF_ECF = :NEW_USAR_PAF_ECF, CODIGO_CONTA_CTR = :NEW_CODI' +
        'GO_CONTA_CTR, '
      '  CODIGO_CENTRO_CUSTO_CTR = :NEW_CODIGO_CENTRO_CUSTO_CTR, '
      
        '  CODIGO_CONTA_CTP = :NEW_CODIGO_CONTA_CTP, CODIGO_CONTA_CTR_EST' +
        'ORNO = :NEW_CODIGO_CONTA_CTR_ESTORNO, '
      
        '  CODIGO_CENTRO_CUSTO_CTR_ESTORNO = :NEW_CODIGO_CENTRO_CUSTO_CTR' +
        '_ESTORNO, '
      '  CODIGO_CONTA_CTP_ESTORNO = :NEW_CODIGO_CONTA_CTP_ESTORNO, '
      
        '  CODIGO_CENTRO_CUSTO_CTP_ESTORNO = :NEW_CODIGO_CENTRO_CUSTO_CTP' +
        '_ESTORNO, '
      '  CODIGO_CONTA_VEN_ESTORNO = :NEW_CODIGO_CONTA_VEN_ESTORNO, '
      
        '  CODIGO_CENTRO_CUSTO_VEN_ESTORNO = :NEW_CODIGO_CENTRO_CUSTO_VEN' +
        '_ESTORNO'
      'WHERE CODIGO = :OLD_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM FORMAS_PAGAMENTO'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT CODIGO, DESCRICAO, USA_TEF, ABRE_GAVETA, USAR_CONTAS_RECE' +
        'BER, '
      '  USAR_CONTAS_PAGAR, TIPO, TABELA_PRECO, CONCEDER_DESCONTO, '
      
        '  CODIGO_CONTA_VENDAS, CODIGO_CENTRO_CUSTO_VENDAS, USAR_PAF_ECF,' +
        ' '
      '  CODIGO_CONTA_CTR, CODIGO_CENTRO_CUSTO_CTR, CODIGO_CONTA_CTP, '
      '  CODIGO_CONTA_CTR_ESTORNO, CODIGO_CENTRO_CUSTO_CTR_ESTORNO, '
      '  CODIGO_CONTA_CTP_ESTORNO, CODIGO_CENTRO_CUSTO_CTP_ESTORNO, '
      '  CODIGO_CONTA_VEN_ESTORNO, CODIGO_CENTRO_CUSTO_VEN_ESTORNO'
      'FROM FORMAS_PAGAMENTO'
      'WHERE CODIGO = :CODIGO')
    Left = 528
    Top = 72
  end
  object cxGridImg: TcxImageList
    DrawingStyle = dsTransparent
    FormatVersion = 1
    DesignInfo = 9961832
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000020240A3163711E978CA22BD9A1BA31F9A1BA31F98CA2
          2BD962711E9720240A3100000000000000000000000000000000000000000000
          00000607020964731E9AA4BC32FEA6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE
          32FFA6BE32FFA4BC32FE64721E9A060702090000000000000000000000000607
          02097E9026C1A6BE32FFA6BE32FFA6BE32FFA6BE32FFB1C64CFF9DAF46FFA2B9
          31FFA6BE32FFA6BE32FFA6BE32FF7E9026C10607020900000000000000006473
          1E9AA6BE32FFA6BE32FFA6BE32FFA6BE32FFB1C64CFFF4F6E6FFF0F3E5FF99AB
          45FFA2B931FFA6BE32FFA6BE32FFA6BE32FF64721E9A0000000020250A31A4BC
          32FEA6BE32FFA6BE32FFA6BE32FFB1C64DFFF4F7E7FFFFFFFFFFFFFFFFFFF0F3
          E5FF99AB46FFA2B931FFA6BE32FFA6BE32FFA4BC32FE20240A3163711E98A6BE
          32FFA6BE32FFA6BE32FFB2C74EFFF4F7E7FFFFFFFFFFD4DF9DFFD5E09DFFFFFF
          FFFFF1F3E6FF9AAC46FFA6BE32FFA6BE32FFA6BE32FF62711E978EA22BDAA6BE
          32FFA6BE32FFA6BE32FFD0DD93FFFFFFFFFFD3DF9CFFB0C549FF9CAF43FFD0DB
          9BFFFFFFFFFFC0CA8EFFA6BE32FFA6BE32FFA6BE32FF8CA22BD9A1BA31F9A6BE
          32FFA6BE32FFA6BE32FFD0DD93FFD3DE9AFFB0C54AFFF3F6E3FFEFF1E2FF98AA
          43FFD0DB9AFFC4CF8FFFA6BE32FFA6BE32FFA6BE32FFA1BA31F9A2B930FAA6BE
          32FFA6BE32FFA6BE32FFB0C54AFFB0C54BFFF3F6E4FFFFFFFFFFFFFFFFFFEFF2
          E3FF98AA43FFACC148FFA6BE32FFA6BE32FFA6BE32FFA1BA31F98EA22BDAA6BE
          32FFA6BE32FFA6BE32FFB1C64CFFF3F6E5FFFFFFFFFFD6E1A2FFD7E2A2FFFFFF
          FFFFEFF2E4FF99AB44FFA6BE32FFA6BE32FFA6BE32FF8CA22BD963711E98A6BE
          32FFA6BE32FFA6BE32FFD0DD93FFFFFFFFFFD5E0A0FFA6BE32FFA6BE32FFD6E1
          A1FFFFFFFFFFC0CA8EFFA6BE32FFA6BE32FFA6BE32FF63711E9720250A31A4BC
          32FEA6BE32FFA6BE32FFD0DD93FFD5E09FFFA6BE32FFA6BE32FFA6BE32FFA6BE
          32FFD6E1A0FFC4CF8FFFA6BE32FFA6BE32FFA4BC32FE20240A31000000006573
          1E9BA6BE32FFA6BE32FFB1C64CFFA6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE
          32FFA6BE32FFB1C64CFFA6BE32FFA6BE32FF64731E9A00000000000000000607
          02097E9025C2A6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE
          32FFA6BE32FFA6BE32FFA6BE32FF7E9026C10607020900000000000000000000
          00000607020965731E9BA4BC32FEA6BE32FFA6BE32FFA6BE32FFA6BE32FFA6BE
          32FFA6BE32FFA4BC32FE64731E9A060702090000000000000000000000000000
          0000000000000000000020250A3163711E988EA22BDAA2B930FAA1BA31F98EA2
          2BDA63711E9820250A3100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000100C223130246A97453498D94E3CAFF94E3CAFFA4433
          98DA30246B98100C233200000000000000000000000000000000000000000000
          00000302060931256B9A513DB1FE513DB3FF513DB3FF513DB3FF513DB3FF513D
          B3FF513DB3FF513DB1FE31246D9B030207090000000000000000000000000302
          06093D2D87C1513DB3FF513DB3FF513DB3FF513DB3FF513DB3FF513DB3FF513D
          B3FF513DB3FF513DB3FF513DB3FF3E2E87C20302070900000000000000003125
          6B9A513DB3FF513DB3FF6857BBFF513DB3FF513DB3FF513DB3FF513DB3FF513D
          B3FF513DB3FF6857BBFF513DB3FF513DB3FF31246D9B000000000F0C2231513D
          B1FE513DB3FF513DB3FF9F97C6FFAFA7DAFF513DB3FF513DB3FF513DB3FF513D
          B3FFAEA5D9FFA59BD5FF513DB3FF513DB3FF513DB1FE100C233130246A97513D
          B3FF513DB3FF513DB3FF9E96C1FFFFFFFFFFB0A8DBFF513DB3FF513DB3FFAFA7
          DAFFFFFFFFFFA59BD5FF513DB3FF513DB3FF513DB3FF30246B98453497D9513D
          B3FF513DB3FF513DB3FF5E509FFFE8E6F0FFFFFFFFFFB1A9DBFFB0A8DAFFFFFF
          FFFFE9E7F4FF6756BCFF513DB3FF513DB3FF513DB3FF443398DA4E3CAFF9513D
          B3FF513DB3FF513DB3FF6453B6FF5D509EFFE7E5EFFFFFFFFFFFFFFFFFFFE8E6
          F4FF6655BBFF6654BBFF513DB3FF513DB3FF513DB3FF4E3CAFFA4E3CAFF9513D
          B3FF513DB3FF513DB3FFA097C7FFAAA1D4FF5D4F9EFFE6E4EFFFE8E5F4FF6654
          BBFFAAA1D7FFA49AD5FF513DB3FF513DB3FF513DB3FF4E3CAFF9453497D9513D
          B3FF513DB3FF513DB3FF9E96C2FFFFFFFFFFABA2D4FF5D4FA3FF6553BBFFACA2
          D8FFFFFFFFFFA49AD5FF513DB3FF513DB3FF513DB3FF443398DA30246A97513D
          B3FF513DB3FF513DB3FF60539FFFEAE8F1FFFFFFFFFFADA4D9FFACA4D8FFFFFF
          FFFFEBE9F5FF6958BDFF513DB3FF513DB3FF513DB3FF30246A980F0C2231513D
          B1FE513DB3FF513DB3FF4F3CAEFF5F529FFFE9E8F1FFFFFFFFFFFFFFFFFFEBE9
          F5FF6958BCFF513DB3FF513DB3FF513DB3FF513DB1FE100C2231000000003125
          6B9A513DB3FF513DB3FF513DB3FF4F3CAEFF5F529EFFE9E7F0FFEAE8F4FF6857
          BCFF513DB3FF513DB3FF513DB3FF513DB3FF31256B9A00000000000000000302
          06093D2D87C1513DB3FF513DB3FF513DB3FF4F3CAEFF6052A3FF6756BBFF513D
          B3FF513DB3FF513DB3FF513DB3FF3D2D87C10302060900000000000000000000
          00000302060931256B9A513DB1FE513DB3FF513DB3FF513DB3FF513DB3FF513D
          B3FF513DB3FF513DB1FE31256B9A030206090000000000000000000000000000
          000000000000000000000F0C223130246A97453497D94E3CAFF94E3CAFF94534
          97D930246A970F0C223100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000191919314C4C4C976E6E6ED97E7E7EF97E7E7EF96E6E
          6ED94C4C4C971919193100000000000000000000000000000000000000000000
          0000050505094E4E4E9A7F7F7FFE818181FF818181FF818181FF818181FF8181
          81FF818181FF7F7F7FFE4E4E4E9A050505090000000000000000000000000505
          0509626262C1818181FF818181FF818181FF818181FF919191FF818181FF7E7E
          7EFF818181FF818181FF818181FF626262C10505050900000000000000004E4E
          4E9A818181FF818181FF818181FF818181FF919191FFEFEFEFFFEDEDEDFF7F7F
          7FFF7E7E7EFF818181FF818181FF818181FF4E4E4E9A00000000191919317F7F
          7FFE818181FF818181FF818181FF919191FFF0F0F0FFFFFFFFFFFFFFFFFFEDED
          EDFF7F7F7FFF7E7E7EFF818181FF818181FF7F7F7FFE191919314D4D4D988181
          81FF818181FF818181FF929292FFF0F0F0FFFFFFFFFFC2C2C2FFC3C3C3FFFFFF
          FFFFEEEEEEFF808080FF818181FF818181FF818181FF4C4C4C976D6D6DDA8181
          81FF818181FF818181FFBDBDBDFFFFFFFFFFC1C1C1FF8F8F8FFF808080FFBFBF
          BFFFFFFFFFFFB0B0B0FF818181FF818181FF818181FF6E6E6ED97E7E7EF98181
          81FF818181FF818181FFBDBDBDFFC1C1C1FF8F8F8FFFEEEEEEFFEBEBEBFF7D7D
          7DFFBFBFBFFFB3B3B3FF818181FF818181FF818181FF7E7E7EF97D7D7DFA8181
          81FF818181FF818181FF8F8F8FFF909090FFEEEEEEFFFFFFFFFFFFFFFFFFEBEB
          EBFF7D7D7DFF8C8C8CFF818181FF818181FF818181FF7E7E7EF96D6D6DDA8181
          81FF818181FF818181FF919191FFEFEFEFFFFFFFFFFFC5C5C5FFC6C6C6FFFFFF
          FFFFECECECFF7E7E7EFF818181FF818181FF818181FF6E6E6ED94D4D4D988181
          81FF818181FF818181FFBDBDBDFFFFFFFFFFC4C4C4FF818181FF818181FFC5C5
          C5FFFFFFFFFFB0B0B0FF818181FF818181FF818181FF4C4C4C97191919317F7F
          7FFE818181FF818181FFBDBDBDFFC4C4C4FF818181FF818181FF818181FF8181
          81FFC5C5C5FFB3B3B3FF818181FF818181FF7F7F7FFE19191931000000004E4E
          4E9B818181FF818181FF919191FF818181FF818181FF818181FF818181FF8181
          81FF818181FF919191FF818181FF818181FF4E4E4E9A00000000000000000505
          0509616161C2818181FF818181FF818181FF818181FF818181FF818181FF8181
          81FF818181FF818181FF818181FF626262C10505050900000000000000000000
          0000050505094E4E4E9B7F7F7FFE818181FF818181FF818181FF818181FF8181
          81FF818181FF7F7F7FFE4E4E4E9A050505090000000000000000000000000000
          00000000000000000000191919314D4D4D986D6D6DDA7D7D7DFA7E7E7EF96D6D
          6DDA4D4D4D981919193100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000001616163145454597636363D9707070F9717171FA6262
          62DA454545981717173200000000000000000000000000000000000000000000
          0000040404094545459A737373FE747474FF747474FF747474FF747474FF7474
          74FF747474FF747474FE4646469B040404090000000000000000000000000404
          0409585858C1747474FF747474FF747474FF747474FF747474FF747474FF7474
          74FF747474FF747474FF747474FF575757C20404040900000000000000004545
          459A747474FF747474FF868686FF747474FF747474FF747474FF747474FF7474
          74FF747474FF868686FF747474FF747474FF4646469B00000000161616317373
          73FE747474FF747474FFADADADFFBFBFBFFF747474FF747474FF747474FF7474
          74FFBEBEBEFFB6B6B6FF747474FF747474FF747474FE17171731454545977474
          74FF747474FF747474FFAAAAAAFFFFFFFFFFBFBFBFFF747474FF747474FFBEBE
          BEFFFFFFFFFFB6B6B6FF747474FF747474FF747474FF45454598636363D97474
          74FF747474FF747474FF757575FFEAEAEAFFFFFFFFFFC0C0C0FFBFBFBFFFFFFF
          FFFFEDEDEDFF868686FF747474FF747474FF747474FF626262DA707070F97474
          74FF747474FF747474FF818181FF747474FFEAEAEAFFFFFFFFFFFFFFFFFFEDED
          EDFF858585FF848484FF747474FF747474FF747474FF717171FA707070F97474
          74FF747474FF747474FFAEAEAEFFB9B9B9FF747474FFE9E9E9FFECECECFF8484
          84FFBBBBBBFFB6B6B6FF747474FF747474FF747474FF707070F9636363D97474
          74FF747474FF747474FFABABABFFFFFFFFFFBABABAFF767676FF848484FFBBBB
          BBFFFFFFFFFFB6B6B6FF747474FF747474FF747474FF626262DA454545977474
          74FF747474FF747474FF777777FFECECECFFFFFFFFFFBDBDBDFFBCBCBCFFFFFF
          FFFFEFEFEFFF878787FF747474FF747474FF747474FF45454598161616317373
          73FE747474FF747474FF717171FF767676FFECECECFFFFFFFFFFFFFFFFFFEEEE
          EEFF868686FF747474FF747474FF747474FF737373FE16161631000000004545
          459A747474FF747474FF747474FF717171FF767676FFEBEBEBFFEEEEEEFF8686
          86FF747474FF747474FF747474FF747474FF4545459A00000000000000000404
          0409585858C1747474FF747474FF747474FF717171FF787878FF858585FF7474
          74FF747474FF747474FF747474FF585858C10404040900000000000000000000
          0000040404094545459A737373FE747474FF747474FF747474FF747474FF7474
          74FF747474FF737373FE4545459A040404090000000000000000000000000000
          000000000000000000001616163145454597636363D9707070F9707070F96363
          63D9454545971616163100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000101050317
          102B0419122E0419122E0419122E0419122E0419122E0419122E0419122E0419
          122E0419112E0417102C0002010A000000070000000700000001106E499C2EC7
          8CFF36CA90FF36CA90FF36CA90FF36CA90FF36CA90FF36CA90FF30C58BFF1BBC
          7EFF18B378FF27C487FF17855BBB0105040E00000005000000011E9C6BD164D7
          AAFF65D7AAFF65D7AAFF61D6A9FF3BCC94FF3DC691FF29C086FF2BC388FF20BC
          80FF3CCB94FF63D7AAFF54D3A2FF1E8860B80105040900000000269D6FD16AD9
          AEFF5BD5A5FF5BD1A3FF37C48EFF21BE82FF36CA90FF46CE99FF38C28DFF3CCB
          94FF63D7AAFF67D8ACFF6BD9AEFF5DD6A7FF258B64B8010504092BA073D15BCF
          A2FF28C085FF2CC489FF48CF9BFF5AD4A4FF4BD09DFF3EC390FF3CCB94FF63D7
          AAFF67D8ACFF4FD29FFF4AD19DFF74DCB4FF65D9ACFF2D7B5D9F2B9D72D124C1
          85FF57D3A3FF64D7AAFF65D7ABFF49D09BFF3BC38FFF38CA91FF43CE98FF40CD
          97FF40CE97FF69D9ADFF6EDBB1FF79DEB6FF81E0BBFF52967CB53D9A76C433C4
          8CFF66D7ACFF64D7AAFF5CD5A6FF36C28CFF3CCB94FF40CD96FFBBEDDAFFCFF3
          E5FF36CC92FF55D4A3FF79DEB6FF84E1BDFF6EB79CD704110C1A0A1F172B278B
          66BD5ED6A7FF5DD6A7FF24BD82FF3CCB94FF63D7AAFF3ECD96FF55D3A2FFBDEE
          DBFFAFEBD4FF55D5A3FF84E1BDFF6EB79CD704110C1A0000000000000000051B
          132A4BCE9BFE45C795FF3BCB93FF63D7AAFF67D8ACFF5DD5A7FF34CB90FF8AE2
          C0FF85E1BDFF78DEB6FF6EB79CD704110C1A0000000000000000000000000000
          00002C966DC32AC187FF5BD4A5FF67D8ACFF4BD19DFF5AD5A5FF6DDAB0FF65D9
          ACFF7DDFB9FF6EB79CD704110C1A000000000000000000000000000000000000
          00000F33254751B891EC31C088F868D8ACFF62D7AAFF6CDAAFFF79DEB6FF84E1
          BDFF6EB79CD704110C1A00000000000000000000000000000000000000000000
          0000000000000000000008281C3A3ABF8BF170DBB2FF79DEB6FF84E1BDFF6EB7
          9CD704110C1A0000000000000000000000000000000000000000000000000000
          000000000000000000000000000009281D3A46C292F17DDFB9FF6EB79CD70411
          0C1A000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000092218303063507C040F0B170000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000020A02102663299725682A9F25682A9F25682A9F2267289F1F66279F1B63
          259F1A5F239F195C209F18591E9F16581B9F16551B9F15451780000000000000
          0000142E134055BE64FF54BF63FF51BE61FF4CBD5CFF45BA54FF3AB54AFF2AA8
          3CFF1F9B33FF1A922BFF2A9746FF359B63FF339961FF258C2FFF221711283728
          1E4042412870648E54FF759463FF799666FF749462FF5E8F4EFF568845FF4E80
          3AFF467834FF417130FF6A8367FF75697CFFADA7BAFF3F9647FFF1BE91F7F8C6
          99FFF7C598FFF7C496FFF6C293FFF6BF8FFFF5BA86FFF4B279FFF3AC71FFF3A8
          6CFFF2A467FFF1A265FFF1A267FF6F6545FF727E54FF33933CFFF9C495FFF5CE
          AAFFF6CFACFFF6D0AEFFF8C8A0FFF7C397FFF6BA88FFF4B07AFFF3A86DFFDA93
          78FF7854BEFF7DA7C3FFC2A387FF97937EFFB0C7B4FF349A42FFFAC79AFFF6D1
          AEFFF6D2B0FFF5D8BEFFF8D4B6FFF7CFAEFFF6C49CFFF4BE93FFF3B788FFD296
          8CFF7D76F3FF82C7F9FFB9B6ADFFA5958AFFC5C5C5FF3C9D4BFFFAC798FFF9CD
          A2FFF9CFA5FFF9D1ABFFF9CFAAFFF8C8A0FFF6BE90FFF5B480FFF4AD75FFEFAA
          74FFD9B19BFFDDBBA0FFECAE7DFF65804BFF4E9C4DFF369437FFFAC492FFF9CA
          9AFFFACEA2FFFAD1A9FFF9CFA8FFF8CCA6FFF7C59BFFF6BA8AFFF5B683FFEAB5
          8AFFD2D2D2FFD4D4D4FFDFB695FF5D7E41FF3C993AFF399434FFFBCA9DFFF9CD
          9FFFFACEA0FFFACEA2FFF9CBA0FFF8C99EFFF8C89DFFF7C59AFFF8C497FFF2C1
          96FFDDC1A8FFD4B197FFE4A77BFF5E7C41FF3C913AFF388532F7FDE3CDFFE3B7
          8FFFF0CFADFFF0CAA2FFF8D4ADFFF8CEA3FFF7C99BFFF8CAA2FFF9CAA1FFF8C6
          99FFF4B682FFF1A76CFFEFA164FF423E2570142C1140091A0828FDDFC6FFF7DC
          C1FFF9DCBEFFF7D3ADFFF8CFA4FFF8CA9DFFF8C798FFF9CDA4FFF9CFA8FFF8C7
          9BFFF4B481FFF0A469FFED9B5DFF37261B4000000000000000007E634F809E83
          6C9F9E836B9F9D7E629F9D795A9F9C78599F9C785A9F9D7D629F9D7E649F9C7A
          5F9F9B71549F9969499F906041970D0805100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000776647C07766
          47C0776647C0776647C0776647C0776647C0776647C0776647C0776647C07766
          47C0776647C0776647C0776647C0776647C0776647C0766646BF1A17102B7363
          43B99E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF9E885EFF9E885EFF9E885EFF726343B91A17102B000000000A09
          0610473E2B734A402C774A402C771D19112F322B1E514A402C774A402C77322B
          1E511D19112F4A402C774A402C77473D2A730A09061000000000000000000000
          0000514630839E885EFF716144B80504030815120C229E885EFF9E885EFF1512
          0C2105040308716144B89E885EFF514630830000000000000000000000000000
          0000443A286D9E885EFF69593EA9000000000706040C9E885EFF9E885EFF0706
          040C0000000069593EA99E885EFF433A286D0000000000000000000000000000
          0000443A286D9E885EFF69593EA9000000000706040C9E885EFF9E885EFF0706
          040C0000000069593EA99E885EFF433A286D0000000000000000000000000000
          0000443A286D9E885EFF69593EA9000000000706040C9E885EFF9E885EFF0706
          040C0000000069593EA99E885EFF433A286D0000000000000000000000000000
          000066573CA49E885EFF816F4DD20907050E292419439E885EFF9E885EFF2923
          18420908050E816F4DD29E885EFF65573BA30000000000000000000000000000
          00004C412D7B594D3590574B348C0A0906102A241944594D3590594D35902A24
          19440A090611574B348C594D35904C412D7A0000000000000000776748C28E7B
          55E68E7B55E68E7B55E68E7B55E68E7B55E68E7B55E68E7B55E68E7B55E68E7B
          55E68E7B55E68E7B55E68E7B55E68E7B55E68E7B55E6776747C214110C217E6D
          4ACC9E885EFF9E885EFF9D875CFD98845AF798845AF798845AF798845AF79884
          5AF798845AF79D875CFD9E885EFF9E885EFF7E6D4ACC14110C20000000000504
          03085F51399B9E885EFF9B845BFA443B296E0000000000000000000000000000
          0000453B296F9B845BFA9E885EFF5F52399A0504030800000000000000000000
          0000000000003C34246197825BF69E885EFF67593EA80807050C0807050C675A
          3EA89E885EFF97825BF63C332460000000000000000000000000000000000000
          000000000000000000001E1A1230877450DC9E885EFF84714FD684714FD69E88
          5EFF877450DC1E19123000000000000000000000000000000000000000000000
          00000000000000000000000000000A0906106E5F41B29E885EFF9E885EFF6E5E
          41B10A0906100000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000001010001493F2C77493F2C760101
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002121
          212B7574739F7574739F7574739F7574739F7574739F7574739F7574739F7574
          739F7574739F7574739F7574739F7574739F2121212B00000000000000004E4E
          4D60A9A8A7FF858483FF898887FF60605FFFD2D1D0FFA6A5A4FF959493FFA1A0
          9FFF989797FFBBBAB9FF767574FF9C9A99FF4E4E4D6000000000000000005252
          5260A6A6A5FF71706FFF787777FF3C3C3BFFE3E2E1FFA3A2A1FF9A9998FF8787
          86FF908F8FFF8E8D8CFF5D5C5CFF939291FF5252526000000000000000005353
          5260ABAAA9FF777676FF7F7E7DFF464545FFE5E4E3FF878685FF797978FF5E5E
          5DFF6C6B6BFF737272FF646362FF989796FF5353526000000000000000005353
          5360AFAEADFF7D7C7CFF858484FF504F4FFFE7E6E6FF8C8C8BFF807F7FFF6766
          66FF747372FF7A7979FF6B6A69FF9D9C9CFF5353536000000000000000005454
          5360B3B2B2FF838282FF8C8B8AFF595858FFE9E8E8FF939291FF878685FF6F6E
          6EFF7B7A7AFF818080FF727170FFA2A1A1FF5454536000000000000000005454
          5460B7B6B6FF8A8888FF929190FF636261FFECEBEAFF999897FF8E8D8CFF7776
          76FF838281FF888787FF797877FFA7A6A6FF5454546000000000000000005555
          5560BBBABAFF908F8EFF989796FF6B6A69FFEEEDECFF9F9E9DFF949393FF7F7E
          7DFF8A8989FF8F8E8DFF807F7EFFACABABFF5555556000000000000000005655
          5560CDCCCBFFAEADADFFB3B2B2FF939291FFF0EFEFFFB9B8B8FFB2B1B0FFA3A2
          A1FFABAAAAFFB1B0AFFFA4A3A3FFC2C1C1FF5555556000000000000000002525
          252B918F8F9F918F8F9F918F8F9F918F8F9F918F8F9F918F8F9F918F8F9F918F
          8F9F918F8F9F918F8F9F918F8F9F918F8F9F2525252B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000026543B85397D56C3347550B70307050B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000101012046306E439366DD53B87FFF4FAE79FF377A54C00307050B0000
          0000000000000000000000000000000000000000000000000000000000000001
          0101102418384DAA76FF55BE83FF56BF84FF56BF84FF4FAF79FF377A54C00307
          050B000000000000000000000000000000000000000000000000000000001D41
          2D664DAA76FF55BE83FF56BF84FF56BF84FF56BF84FF56BF84FF4FAF79FF377A
          54C00307050B000000000000000000000000000000000000000027563C874395
          67DF55BE83FF56BF84FF56BF84FF56BF84FF56BF84FF54BA80FF56BF84FF4FAF
          79FF377A54C00307050B00000000000000000000000000000000357451B653B7
          7FFF56BF84FF56BF84FF56BF84FF56BF84FF52B67EFF50B27BFF52B67EFF56BF
          84FF4FAF79FF377A54C00307050B0000000000000000000000002F6949A44EAC
          77FF56BE84FF56BF84FF57C192FF5AC6AEFF56BE85FF4FAF79FF50B27BFF52B6
          7EFF56BF84FF4FAF79FF377A54C00307050B000000000000000001030205326E
          4CAC4EAC77FF56BE84FF59C39EFF5ECBD2FF57C08AFF56BE84FF4FAF79FF50B2
          7BFF54BA81FF56BF84FF4FAF79FF377A54C00307050B00000000000000000103
          0205326E4CAC4EAC77FF56BE84FF56BF85FF5AC5AAFF5CC8BFFF56BE84FF4FAF
          79FF55BC82FF56BF84FF56BF84FF4FAF79FF377A54C00307050B000000000000
          000001030205326F4CAD4EAC77FF56BE84FF59C4A4FF5AC5AAFF57C08AFF56BE
          85FF52B77EFF56BF84FF56BF84FF56BF84FF4FAE79FF347550B7000000000000
          00000000000001030205326F4CAD4EAC77FF56BE84FF56BF85FF5ECBD2FF5AC6
          AEFF56BF84FF56BF84FF56BF84FF56BF84FF53B87FFF397D56C3000000000000
          0000000000000000000001030205326E4DAD4EAC77FF56BE84FF59C39FFF57C1
          92FF56BF84FF56BF84FF56BF84FF55BE83FF429466DC26543B85000000000000
          000000000000000000000000000001030205326E4DAD4EAC77FF56BE84FF56BF
          84FF56BF84FF56BF84FF55BE83FF4DAA76FF2046306D00000000000000000000
          00000000000000000000000000000000000001030205326E4DAD4EAC77FF56BE
          84FF56BF84FF55BE83FF4DAA76FF102418380001010100000000000000000000
          0000000000000000000000000000000000000000000001030205326E4DAD4EAC
          77FF53B77FFF439667DF1D412D66000101010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010302053069
          49A4357451B627573C8700000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005B4F36947464
          45BB746445BB7D6A49C9746445BC796748C3776747C2736244BA7B6A49C67565
          45BE746445BB50453082433A286D16130D2400000000000000009C875CFD8977
          51DF897751DF937F57EF8B7753E18F7B56E98F7B55E8867350DA7E6D4CCD8673
          50DA8B7753E18D7854E300000000463C2A7100000000000000009E885EFF5E50
          3798564A338B564A338B564A338B8F7B55E68B7852E2322B1E5118150E270807
          050D766545BE8C7A53E42E281C4B867350DA1C18112E0000000099855CF9322B
          1E513C33246119160F293A31225D786746C14339286C5A4E3692776647C00000
          00004F442F808C7A53E46F6143B59E885EFF6C5D3FAE000000009A835AF81916
          0F292721173F0000000018150E276F5F42B3483E2B743A32225E0C0B07142923
          1842867250D88C7A53E46F6143B59E885EFF988359F51F1B12329D875EFE5247
          31854C412D7A4A402C784B402C788B7752E0948059F15D5036970706040C3730
          21598E7954E58C7A53E46A5C3FAC574B348D0E0C0816463C2A719B855DFC816F
          4CD1796847C47B6949C784714ED58E7A54E79E885EFF97825AF3746546BD8673
          50DA9E885EFF8C7A53E4040403070000000000000000443B296E7E6B4BCB8875
          51DB927D57EB897651DD8B7852E2968058F29E885EFF9E885EFF9E885EFF9E88
          5EFF9E885EFF6E5F41B20000000019150F28463C2A712621173D020201040D0B
          08150D0B0815100E09195C4F37955F52399A5C4F3796241F163B0D0B08150D0B
          08150D0B081517140E26463C29712E271B4A0000000100000000000000000000
          000000000000000000005F53399C65573BA316130D2300000000000000001411
          0C20453C297030291D4E01010001000000000000000000000000000000000000
          0000000000000000000014110C20332C1E5200000000120F0B1D453B296F322B
          1E51010101020000000000000000000000000000000000000000000000000000
          00000000000000000000000000003830225B4239276B342D1F55020101030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000001220132F01010102020402050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000508050C8EC592F17BB181DE71A576D33553377000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000039583B769FDBA7FF8CCB92FF97D69FFF9ED7A5FF395F3C86050A060F0000
          0000000000000000000000000000000000000000000000000000000000000203
          020484BA8BE48ECC94FF9EDBA6FF98D8A0FF97D89FFF9FD8A6FF74B579F44266
          458B0811081D0000000000000000000000000000000000000000000000002B47
          2D6294CF99FF9DDAA5FF83C98AFF8BCF93FF98D8A0FF98D8A0FF9DD7A4FF83C4
          89FF94CF9AFB4C764EA00A190B2A0000000000000000000000000204030678AC
          7CD997D69FFF98D8A0FF8CCF93FF92D499FF93D29BFFA2D8A8FF9BD5A2FF95D1
          9BFF7FC485FFA0DCA8FF97D39DFF568559B20F23103900000000243A265097D1
          9DFF9DD8A4FF97D89FFF98D8A0FF96D39DFFD3EED7FFC4E7C8FFBAE4C0FFACDE
          B3FF94D09AFF7FC486FF9AD9A2FF9BDAA3FF87C48DF6040A05100508050C3A57
          3C7272AB76E1A0DAA7FF98D8A0FFB9E1BEFFD7EFDAFFA7D4ABFFA8D4ACFFBDE5
          C2FF98D49FFF9BD6A2FF7DC384FFA2DEAAFF3E653F8E00000000000000000000
          0000010201033E5F417FA1DAA8FFBAE1BEFFE4F4E6FFABD5AEFFADD7B0FFC9EA
          CDFF9BD5A2FF98D8A0FF9AD5A1FF74B978FC0712081F00000000000000000000
          0000000000000000000038573B759CD5A2FFEAF6ECFFE8F6EAFFDFF3E1FFC4E7
          C9FF91D399FF98D8A0FF97D8A0FF9CD6A2FF2B4C2E7000000000000000000000
          00000000000000000000000000003655397499D39FFFAFDDB4FFA8DAAEFF91D3
          99FF8BCF93FF8CCF94FF97D89FFF98D49EFF39603C8B00000000000000000000
          00000000000000000000000000000000000034543774A0D9A7FF98D8A0FF98D8
          A0FF8CCF93FF8CD094FFA0DAA7FF365D39890000000000000000000000000000
          00000000000000000000000000000000000000000000355537769FD9A6FF97D8
          9FFF97D8A0FFA0DAA7FF355D3887000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000325335759DD8
          A4FF98D49EFF375C398600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003354
          36783A603D870000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000102
          0103020302050000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010100000000000000000101
          0101000000000000000000000000000000000000000000000000000000000000
          000000000000706F6F932524242F2524242FAFAEADEB2524242F2524242FAFAE
          ADEB2524242F2524242F706F6F93000000000000000000000000000000000000
          0000000000008483829FB5B4B4DBB5B4B4DBD4D3D1FFB5B4B4DBB5B4B4DBD4D3
          D1FFB5B4B4DBB5B4B4DB8483829F000000000000000000000000000000000000
          0000000000008A8A8A9FE3E2E1FFE3E2E1FFE3E2E1FFE3E2E1FFE3E2E1FFE3E2
          E1FFE3E2E1FFE3E2E1FF8A8A8A9F000000000000000000000000000000000000
          0000000000008C8A8A9FD7D7D6FFCFCECEFFE0DFDEFFE4E3E3FFE4E3E3FFE2E1
          E0FFCFCECEFFD7D6D5FF8C8A8A9F000000000000000000000000000000000000
          0000000000008C8C8C9FE2E1E0FFDFDEDEFFE0DFDEFFDFDFDEFFE0DFDEFFE0DF
          DEFFE0DFDEFFE1E0E0FF8C8C8C9F000000000000000000000000000000000000
          0000000000008D8D8C9FD9D8D7FFD3D2D2FFDCDBDBFFE8E7E6FFE8E7E6FFE6E5
          E4FFD2D1D0FFD9D8D8FF8D8D8C9F000000000000000000000000000000000000
          0000000000008E8E8D9FDAD9D9FFD4D3D3FFDFDEDEFFE9E8E8FFE9E8E8FFE8E7
          E6FFD5D4D3FFDBDBDAFF8E8E8D9F000000000000000000000000000000000000
          0000000000008F8E8E9FDDDCDCFFD6D5D5FFE4E3E3FFEBEAE9FFEBEAE9FFEAE9
          E9FFDAD9D9FFDFDEDEFF8F8E8E9F000000000000000000000000000000000000
          0000000000008F8F8F9FE6E5E4FFE5E4E4FFE3E2E2FFE5E4E4FFE5E4E4FFE5E4
          E4FFE0DFDEFFE4E3E2FF8F8F8F9F000000000000000000000000000000000000
          000000000000918F8F9FEEEDEDFFEEEDEDFFE4E3E3FFE4E3E3FFE5E4E4FFDFDE
          DEFFEDECEBFFEEEDEDFF918F8F9F000000000000000000000000000000000000
          0000000000009191919FF0EFEFFFF0EFEFFFD1D0D0FFDEDEDDFFD9D8D8FFD8D7
          D7FFEEEDEDFFF0EFEFFF9191919F000000000000000000000000000000000000
          0000000000008080808FEDECECFFEDECECFFEDECECFFEDECECFFEDECECFFEDEC
          ECFFEDECECFFEDECECFF8080808F000000000000000000000000000000000000
          0000000000000101010106060608060606080606060806060608060606080606
          0608060606080606060801010101000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000102
          02030A2B33360A2E373B0A2E373B0A2E373B0A2E373B0A2E373B0A2E373B0A2E
          373B0A2E373B0A2E373B0A2E373B0A2B33360102020200000000000000000A4A
          595E0FC4F1FF0FC4F1FF0FC4F1FF0FC4F1FF0FC4F1FF0FC4F1FF0FC4F1FF0FC4
          F1FF0FC4F1FF0FC4F1FF0FC4F1FF0FC4F1FF0A49585E00000000000000003E5B
          616897DEEEFF97DEEEFF97DEEEFF97DEEEFF97DEEEFF97DEEEFF97DEEEFF97DE
          EEFF97DEEEFF97DEEEFF97DEEEFF97DEEEFF3E5A616800000000000000006160
          5F66F1F0ECFFF1F0ECFFB5ACA1FFE0DDD7FFB8AFA4FFC8C1B8FF9D9183FFC1BA
          B0FFCAC3BBFFCFCAC2FFD7D2CBFFF1F0ECFF60605E6600000000000000006160
          5F66F1F0ECFFEEEDE8FF715F4CFFA3988BFF938576FFD5D0C9FFB8B0A5FF8E7F
          70FF6E5B48FF786755FFD6D1CAFFF1F0ECFF60605E6600000000000000006160
          5F66F1F0ECFFD0CCC4FF91B2B4FF80705FFFA69B8EFFB5ACA1FF7E6D5CFFDFDB
          D5FF9D9082FF796755FFEFEDE9FFF1F0ECFF60605E6600000000000000006160
          5F66ECEFECFF9BDDEBFFBFE6EDFFC1BAB0FFBFB7ADFFCFC9C1FFA99E92FFADA2
          97FFDDD9D3FFAEA398FFF1F0ECFFF1F0ECFF60605E6600000000000000004B47
          4368B7AEA3FFB7AEA3FFB7AEA3FFB7AEA3FFB7AEA3FFB7AEA3FFB7AEA3FFB7AE
          A3FFB7AEA3FFB7AEA3FFB7AEA3FFB7AEA3FF4B4743680000000000000000261F
          175F5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF5E4934FF5E49
          34FF5E4934FF5E4934FF5E4934FF5E4934FF261E175E00000000000000000201
          0103181410371A16123B1A16123B1A16123B1A16123B1A16123B1A16123B1A16
          123B1A16123B1A16123B1A16123B181410370201010300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101050D0D
          0D2B0F0F0F2E0F0F0F2E0F0F0F2E0F0F0F2E0F0F0F2E0F0F0F2E0F0F0F2E0F0F
          0F2E0F0F0F2E0E0E0E2C0101010A0000000700000007000000014141419C7E7E
          7EFF838383FF838383FF838383FF838383FF838383FF838383FF7E7E7EFF6F6F
          6FFF696969FF797979FF515151BB0303030E0000000500000001606060D1A0A0
          A0FFA0A0A0FFA0A0A0FF9E9E9EFF878787FF858585FF787878FF7A7A7AFF7272
          72FF878787FFA0A0A0FF969696FF565656B80303030900000000646464D1A4A4
          A4FF9B9B9BFF999999FF818181FF737373FF838383FF8D8D8DFF808080FF8787
          87FFA0A0A0FFA2A2A2FFA4A4A4FF9C9C9CFF5A5A5AB803030309686868D19898
          98FF777777FF7B7B7BFF8F8F8FFF9A9A9AFF919191FF848484FF878787FFA0A0
          A0FFA2A2A2FF939393FF919191FFAAAAAAFFA2A2A2FF5555559F666666D17676
          76FF989898FFA0A0A0FFA1A1A1FF8F8F8FFF828282FF848484FF8C8C8CFF8A8A
          8AFF8A8A8AFFA3A3A3FFA7A7A7FFAEAEAEFFB3B3B3FF767676B56D6D6DC47F7F
          7FFFA1A1A1FFA0A0A0FF9B9B9BFF7F7F7FFF878787FF8A8A8AFFD5D5D5FFE2E2
          E2FF848484FF979797FFAEAEAEFFB5B5B5FF949494D70B0B0B1A1515152B5B5B
          5BBD9D9D9DFF9C9C9CFF747474FF878787FFA0A0A0FF898989FF979797FFD7D7
          D7FFCECECEFF989898FFB5B5B5FF949494D70B0B0B1A00000000000000001010
          102A8F8F8FFE898989FF868686FFA0A0A0FFA2A2A2FF9C9C9CFF838383FFB8B8
          B8FFB5B5B5FFADADADFF949494D70B0B0B1A0000000000000000000000000000
          0000636363C3797979FF9A9A9AFFA2A2A2FF919191FF9A9A9AFFA6A6A6FFA2A2
          A2FFB0B0B0FF949494D70B0B0B1A000000000000000000000000000000000000
          000022222247878787EC7C7C7CF8A2A2A2FF9F9F9FFFA5A5A5FFAEAEAEFFB5B5
          B5FF949494D70B0B0B1A00000000000000000000000000000000000000000000
          000000000000000000001919193A808080F1A8A8A8FFAEAEAEFFB5B5B5FF9494
          94D70B0B0B1A0000000000000000000000000000000000000000000000000000
          00000000000000000000000000001919193A868686F1B0B0B0FF949494D70B0B
          0B1A000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000161616304A4A4A7C0A0A0A170000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          0203212121362323233B2323233B2323233B2323233B2323233B2323233B2323
          233B2323233B2323233B2323233B212121360202020200000000000000003636
          365E8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E
          8EFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E8EFF3636365E00000000000000005252
          5268C8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
          C8FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8C8FF5252526800000000000000006060
          6066EFEFEFFFEFEFEFFFA9A9A9FFDBDBDBFFACACACFFBFBFBFFF8E8E8EFFB7B7
          B7FFC1C1C1FFC8C8C8FFD0D0D0FFEFEFEFFF5F5F5F6600000000000000006060
          6066EFEFEFFFEBEBEBFF5B5B5BFF959595FF828282FFCECECEFFADADADFF7C7C
          7CFF575757FF636363FFCFCFCFFFEFEFEFFF5F5F5F6600000000000000006060
          6066EFEFEFFFCACACAFFA6A6A6FF6C6C6CFF989898FFA9A9A9FF6A6A6AFFD9D9
          D9FF8D8D8DFF636363FFECECECFFEFEFEFFF5F5F5F6600000000000000006060
          6066EDEDEDFFC8C8C8FFD9D9D9FFB7B7B7FFB5B5B5FFC7C7C7FF9B9B9BFFA0A0
          A0FFD7D7D7FFA1A1A1FFEFEFEFFFEFEFEFFF5F5F5F6600000000000000004646
          4668ABABABFFABABABFFABABABFFABABABFFABABABFFABABABFFABABABFFABAB
          ABFFABABABFFABABABFFABABABFFABABABFF4646466800000000000000001D1D
          1D5F454545FF454545FF454545FF454545FF454545FF454545FF454545FF4545
          45FF454545FF454545FF454545FF454545FF1D1D1D5E00000000000000000101
          0103131313371515153B1515153B1515153B1515153B1515153B1515153B1515
          153B1515153B1515153B1515153B131313370101010300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000050505103F3F3F974141419F4141419F4040409F3E3E3E9F3C3C3C9F3A3A
          3A9F3737379F3535359F3333339F3232329F3030309F28282880000000000000
          00001E1E1E40828282FF828282FF808080FF7C7C7CFF777777FF6E6E6EFF6060
          60FF555555FF4D4D4DFF5B5B5BFF676767FF656565FF505050FF171717282727
          2740373737706E6E6EFF7A7A7AFF7D7D7DFF7A7A7AFF6B6B6BFF636363FF5A5A
          5AFF535353FF4D4D4DFF737373FF757575FFB1B1B1FF636363FFB6B6B6F7BEBE
          BEFFBDBDBDFFBCBCBCFFBABABAFFB7B7B7FFB1B1B1FFA8A8A8FFA3A3A3FF9F9F
          9FFF9B9B9BFF999999FF9A9A9AFF5A5A5AFF6B6B6BFF5B5B5BFFBCBCBCFFC7C7
          C7FFC9C9C9FFCACACAFFC2C2C2FFBCBCBCFFB2B2B2FFA8A8A8FF9F9F9FFF9696
          96FF8D8D8DFFA1A1A1FF9E9E9EFF8B8B8BFFBABABAFF606060FFBFBFBFFFCACA
          CAFFCCCCCCFFD3D3D3FFCFCFCFFFCACACAFFBEBEBEFFB8B8B8FFB0B0B0FF9E9E
          9EFFABABABFFBFBFBFFFB3B3B3FF949494FFC5C5C5FF666666FFBEBEBEFFC5C5
          C5FFC7C7C7FFCACACAFFC9C9C9FFC2C2C2FFB7B7B7FFACACACFFA5A5A5FFA2A2
          A2FFB0B0B0FFB7B7B7FFA7A7A7FF656565FF6D6D6DFF5C5C5CFFBBBBBBFFC0C0
          C0FFC5C5C5FFC9C9C9FFC8C8C8FFC6C6C6FFBEBEBEFFB3B3B3FFAEAEAEFFAEAE
          AEFFD2D2D2FFD4D4D4FFB1B1B1FF5F5F5FFF606060FF5B5B5BFFC2C2C2FFC3C3
          C3FFC4C4C4FFC5C5C5FFC3C3C3FFC1C1C1FFC0C0C0FFBEBEBEFFBCBCBCFFBABA
          BAFFBDBDBDFFAEAEAEFFA2A2A2FF5E5E5EFF5D5D5DFF545454F7DFDFDFFFB0B0
          B0FFC8C8C8FFC2C2C2FFCCCCCCFFC5C5C5FFC0C0C0FFC3C3C3FFC3C3C3FFBEBE
          BEFFAEAEAEFF9E9E9EFF989898FF353535701C1C1C400F0F0F28DBDBDBFFD7D7
          D7FFD6D6D6FFCBCBCBFFC6C6C6FFC1C1C1FFBEBEBEFFC5C5C5FFC8C8C8FFBFBF
          BFFFACACACFF9C9C9CFF939393FF252525400000000000000000606060807F7F
          7F9F7F7F7F9F7979799F7373739F7373739F7373739F7878789F7A7A7A9F7676
          769F6E6E6E9F6666669F5D5D5D97080808100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000005D5D5DC05D5D
          5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05D5D
          5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05D5D5DC05C5C5CBF1515152B5959
          59B97C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C
          7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF595959B91515152B000000000808
          0810383838733A3A3A773A3A3A771616162F272727513A3A3A773A3A3A772727
          27511616162F3A3A3A773A3A3A77373737730808081000000000000000000000
          00003F3F3F837C7C7CFF595959B804040408101010227C7C7CFF7C7C7CFF1010
          102104040408595959B87C7C7CFF3F3F3F830000000000000000000000000000
          00003535356D7C7C7CFF525252A9000000000505050C7C7C7CFF7C7C7CFF0505
          050C00000000525252A97C7C7CFF3434346D0000000000000000000000000000
          00003535356D7C7C7CFF525252A9000000000505050C7C7C7CFF7C7C7CFF0505
          050C00000000525252A97C7C7CFF3434346D0000000000000000000000000000
          00003535356D7C7C7CFF525252A9000000000505050C7C7C7CFF7C7C7CFF0505
          050C00000000525252A97C7C7CFF3434346D0000000000000000000000000000
          00004F4F4FA47C7C7CFF656565D20707070E212121437C7C7CFF7C7C7CFF2020
          20420707070E656565D27C7C7CFF4F4F4FA30000000000000000000000000000
          00003B3B3B7B454545904444448C080808102121214445454590454545902121
          2144080808114444448C454545903B3B3B7A00000000000000005E5E5EC26F6F
          6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE66F6F
          6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE66F6F6FE65E5E5EC2101010216262
          62CC7C7C7CFF7C7C7CFF7A7A7AFD777777F7777777F7777777F7777777F77777
          77F7777777F77A7A7AFD7C7C7CFF7C7C7CFF626262CC10101020000000000404
          04084A4A4A9B7C7C7CFF797979FA3535356E0000000000000000000000000000
          00003636366F797979FA7C7C7CFF4A4A4A9A0404040800000000000000000000
          0000000000002F2F2F61777777F67C7C7CFF515151A80606060C0606060C5151
          51A87C7C7CFF777777F62F2F2F60000000000000000000000000000000000000
          00000000000000000000181818306A6A6ADC7C7C7CFF676767D6676767D67C7C
          7CFF6A6A6ADC1717173000000000000000000000000000000000000000000000
          000000000000000000000000000008080810565656B27C7C7CFF7C7C7CFF5555
          55B1080808100000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010139393977393939760101
          0101000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002121
          212B7373739F7373739F7373739F7373739F7373739F7373739F7373739F7373
          739F7373739F7373739F7373739F7373739F2121212B00000000000000004E4E
          4E60A8A8A8FF848484FF888888FF606060FFD1D1D1FFA5A5A5FF949494FFA0A0
          A0FF979797FFBABABAFF757575FF9A9A9AFF4E4E4E6000000000000000005252
          5260A6A6A6FF707070FF777777FF3C3C3CFFE2E2E2FFA2A2A2FF999999FF8787
          87FF8F8F8FFF8D8D8DFF5C5C5CFF929292FF5252526000000000000000005252
          5260AAAAAAFF767676FF7E7E7EFF454545FFE4E4E4FF868686FF797979FF5E5E
          5EFF6B6B6BFF727272FF636363FF979797FF5252526000000000000000005353
          5360AEAEAEFF7C7C7CFF848484FF4F4F4FFFE6E6E6FF8C8C8CFF7F7F7FFF6666
          66FF737373FF797979FF6A6A6AFF9C9C9CFF5353536000000000000000005454
          5460B2B2B2FF828282FF8B8B8BFF585858FFE8E8E8FF929292FF868686FF6E6E
          6EFF7A7A7AFF808080FF717171FFA1A1A1FF5454546000000000000000005454
          5460B6B6B6FF888888FF919191FF626262FFEBEBEBFF989898FF8D8D8DFF7676
          76FF828282FF878787FF787878FFA6A6A6FF5454546000000000000000005555
          5560BABABAFF8F8F8FFF979797FF6A6A6AFFEDEDEDFF9E9E9EFF939393FF7E7E
          7EFF898989FF8E8E8EFF7F7F7FFFABABABFF5555556000000000000000005555
          5560CCCCCCFFADADADFFB2B2B2FF929292FFEFEFEFFFB8B8B8FFB1B1B1FFA2A2
          A2FFAAAAAAFFB0B0B0FFA3A3A3FFC1C1C1FF5555556000000000000000002525
          252B8F8F8F9F8F8F8F9F8F8F8F9F8F8F8F9F8F8F8F9F8F8F8F9F8F8F8F9F8F8F
          8F9F8F8F8F9F8F8F8F9F8F8F8F9F8F8F8F9F2525252B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000003D3D3D85595959C3545454B70505050B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101013232326E6A6A6ADD848484FF7D7D7DFF575757C00505050B0000
          0000000000000000000000000000000000000000000000000000000000000101
          0101191919387A7A7AFF888888FF898989FF898989FF7E7E7EFF575757C00505
          050B000000000000000000000000000000000000000000000000000000002E2E
          2E667A7A7AFF888888FF898989FF898989FF898989FF898989FF7E7E7EFF5757
          57C00505050B00000000000000000000000000000000000000003E3E3E876B6B
          6BDF888888FF898989FF898989FF898989FF898989FF868686FF898989FF7E7E
          7EFF575757C00505050B00000000000000000000000000000000545454B68484
          84FF898989FF898989FF898989FF898989FF838383FF808080FF838383FF8989
          89FF7E7E7EFF575757C00505050B0000000000000000000000004B4B4BA47C7C
          7CFF898989FF898989FF8D8D8DFF969696FF898989FF7E7E7EFF808080FF8383
          83FF898989FF7E7E7EFF575757C00505050B0000000000000000020202054F4F
          4FAC7C7C7CFF898989FF919191FFA2A2A2FF8B8B8BFF898989FF7E7E7EFF8080
          80FF868686FF898989FF7E7E7EFF575757C00505050B00000000000000000202
          02054F4F4FAC7C7C7CFF898989FF898989FF959595FF9B9B9BFF898989FF7E7E
          7EFF878787FF898989FF898989FF7E7E7EFF575757C00505050B000000000000
          0000020202054F4F4FAD7C7C7CFF898989FF939393FF959595FF8B8B8BFF8989
          89FF838383FF898989FF898989FF898989FF7D7D7DFF545454B7000000000000
          000000000000020202054F4F4FAD7C7C7CFF898989FF898989FFA2A2A2FF9696
          96FF898989FF898989FF898989FF898989FF848484FF595959C3000000000000
          00000000000000000000020202054F4F4FAD7C7C7CFF898989FF919191FF8D8D
          8DFF898989FF898989FF898989FF888888FF6A6A6ADC3D3D3D85000000000000
          0000000000000000000000000000020202054F4F4FAD7C7C7CFF898989FF8989
          89FF898989FF898989FF888888FF7A7A7AFF3232326D00000000000000000000
          000000000000000000000000000000000000020202054F4F4FAD7C7C7CFF8989
          89FF898989FF888888FF7A7A7AFF191919380101010100000000000000000000
          00000000000000000000000000000000000000000000020202054F4F4FAD7C7C
          7CFF848484FF6C6C6CDF2E2E2E66010101010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020202054B4B
          4BA4545454B63E3E3E8700000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010100000000000000000101
          0101000000000000000000000000000000000000000000000000000000000000
          0000000000006F6F6F932424242F2424242FAEAEAEEB2424242F2424242FAEAE
          AEEB2424242F2424242F6F6F6F93000000000000000000000000000000000000
          0000000000008282829FB4B4B4DBB4B4B4DBD2D2D2FFB4B4B4DBB4B4B4DBD2D2
          D2FFB4B4B4DBB4B4B4DB8282829F000000000000000000000000000000000000
          0000000000008A8A8A9FE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2
          E2FFE2E2E2FFE2E2E2FF8A8A8A9F000000000000000000000000000000000000
          0000000000008A8A8A9FD7D7D7FFCECECEFFDFDFDFFFE3E3E3FFE3E3E3FFE1E1
          E1FFCECECEFFD6D6D6FF8A8A8A9F000000000000000000000000000000000000
          0000000000008C8C8C9FE1E1E1FFDEDEDEFFDFDFDFFFDFDFDFFFDFDFDFFFDFDF
          DFFFDFDFDFFFE0E0E0FF8C8C8C9F000000000000000000000000000000000000
          0000000000008C8C8C9FD8D8D8FFD2D2D2FFDBDBDBFFE7E7E7FFE7E7E7FFE5E5
          E5FFD1D1D1FFD8D8D8FF8C8C8C9F000000000000000000000000000000000000
          0000000000008E8E8E9FD9D9D9FFD3D3D3FFDEDEDEFFE8E8E8FFE8E8E8FFE7E7
          E7FFD4D4D4FFDBDBDBFF8E8E8E9F000000000000000000000000000000000000
          0000000000008E8E8E9FDCDCDCFFD5D5D5FFE3E3E3FFEAEAEAFFEAEAEAFFE9E9
          E9FFD9D9D9FFDEDEDEFF8E8E8E9F000000000000000000000000000000000000
          0000000000008F8F8F9FE5E5E5FFE4E4E4FFE2E2E2FFE4E4E4FFE4E4E4FFE4E4
          E4FFDFDFDFFFE3E3E3FF8F8F8F9F000000000000000000000000000000000000
          0000000000008F8F8F9FEDEDEDFFEDEDEDFFE3E3E3FFE3E3E3FFE4E4E4FFDEDE
          DEFFECECECFFEDEDEDFF8F8F8F9F000000000000000000000000000000000000
          0000000000009191919FEFEFEFFFEFEFEFFFD0D0D0FFDEDEDEFFD8D8D8FFD7D7
          D7FFEDEDEDFFEFEFEFFF9191919F000000000000000000000000000000000000
          0000000000008080808FECECECFFECECECFFECECECFFECECECFFECECECFFECEC
          ECFFECECECFFECECECFF8080808F000000000000000000000000000000000000
          0000000000000101010106060608060606080606060806060608060606080606
          0608060606080606060801010101000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object QHistoricos: TFDQuery
    AfterInsert = QHistoricosAfterInsert
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upHistoricos
    SQL.Strings = (
      
        'SELECT * FROM FORMAS_PAGAMENTO_FLUXO WHERE COD_EMP=:COD_EMP AND ' +
        'COD_FORMA=:COD_FORMA')
    Left = 464
    Top = 200
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_FORMA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QHistoricosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QHistoricosCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = 'COD_FORMA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QHistoricosFLUXO_VENDAS: TStringField
      FieldName = 'FLUXO_VENDAS'
      Origin = 'FLUXO_VENDAS'
      FixedChar = True
      Size = 1
    end
    object QHistoricosFLUXO_VENDAS_CHAVE: TStringField
      FieldName = 'FLUXO_VENDAS_CHAVE'
      Origin = 'FLUXO_VENDAS_CHAVE'
    end
    object QHistoricosFLUXO_RECEBER: TStringField
      FieldName = 'FLUXO_RECEBER'
      Origin = 'FLUXO_RECEBER'
      FixedChar = True
      Size = 1
    end
    object QHistoricosFLUXO_RECEBER_CHAVE: TStringField
      FieldName = 'FLUXO_RECEBER_CHAVE'
      Origin = 'FLUXO_RECEBER_CHAVE'
    end
    object QHistoricosFLUXO_PAGAR: TStringField
      FieldName = 'FLUXO_PAGAR'
      Origin = 'FLUXO_PAGAR'
      FixedChar = True
      Size = 1
    end
    object QHistoricosFLUXO_PAGAR_CHAVE: TStringField
      FieldName = 'FLUXO_PAGAR_CHAVE'
      Origin = 'FLUXO_PAGAR_CHAVE'
    end
  end
  object upHistoricos: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO FORMAS_PAGAMENTO_FLUXO'
      '(COD_EMP, COD_FORMA, FLUXO_VENDAS, FLUXO_VENDAS_CHAVE, '
      '  FLUXO_RECEBER, FLUXO_RECEBER_CHAVE, FLUXO_PAGAR, '
      '  FLUXO_PAGAR_CHAVE)'
      
        'VALUES (:NEW_COD_EMP, :NEW_COD_FORMA, :NEW_FLUXO_VENDAS, :NEW_FL' +
        'UXO_VENDAS_CHAVE, '
      
        '  :NEW_FLUXO_RECEBER, :NEW_FLUXO_RECEBER_CHAVE, :NEW_FLUXO_PAGAR' +
        ', '
      '  :NEW_FLUXO_PAGAR_CHAVE)')
    ModifySQL.Strings = (
      'UPDATE FORMAS_PAGAMENTO_FLUXO'
      
        'SET COD_EMP = :NEW_COD_EMP, COD_FORMA = :NEW_COD_FORMA, FLUXO_VE' +
        'NDAS = :NEW_FLUXO_VENDAS, '
      
        '  FLUXO_VENDAS_CHAVE = :NEW_FLUXO_VENDAS_CHAVE, FLUXO_RECEBER = ' +
        ':NEW_FLUXO_RECEBER, '
      
        '  FLUXO_RECEBER_CHAVE = :NEW_FLUXO_RECEBER_CHAVE, FLUXO_PAGAR = ' +
        ':NEW_FLUXO_PAGAR, '
      '  FLUXO_PAGAR_CHAVE = :NEW_FLUXO_PAGAR_CHAVE'
      'WHERE COD_EMP = :OLD_COD_EMP AND COD_FORMA = :OLD_COD_FORMA')
    DeleteSQL.Strings = (
      'DELETE FROM FORMAS_PAGAMENTO_FLUXO'
      'WHERE COD_EMP = :OLD_COD_EMP AND COD_FORMA = :OLD_COD_FORMA')
    FetchRowSQL.Strings = (
      
        'SELECT COD_EMP, COD_FORMA, FLUXO_VENDAS, FLUXO_VENDAS_CHAVE, FLU' +
        'XO_RECEBER, '
      '  FLUXO_RECEBER_CHAVE, FLUXO_PAGAR, FLUXO_PAGAR_CHAVE'
      'FROM FORMAS_PAGAMENTO_FLUXO'
      'WHERE COD_EMP = :COD_EMP AND COD_FORMA = :COD_FORMA')
    Left = 528
    Top = 192
  end
  object dsHistoricos: TDataSource
    DataSet = QHistoricos
    Left = 440
    Top = 248
  end
  object cxImgButtons: TcxImageList
    FormatVersion = 1
    DesignInfo = 9961992
    ImageInfo = <
      item
        Image.Data = {
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
      end
      item
        Image.Data = {
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
      end>
  end
end
