inherited frmCadNewCaixa: TfrmCadNewCaixa
  Caption = 'Cadastro Caixas'
  ClientHeight = 559
  ClientWidth = 984
  ExplicitWidth = 1000
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Width = 984
    ExplicitWidth = 984
  end
  inherited ToolBar1: TToolBar
    Width = 984
    ExplicitWidth = 984
  end
  inherited pnlGeral: TPanel
    Width = 984
    Height = 496
    ExplicitWidth = 984
    ExplicitHeight = 496
    inherited cxPaginas: TcxPageControl
      Width = 984
      Height = 496
      ExplicitWidth = 984
      ExplicitHeight = 496
      ClientRectBottom = 494
      ClientRectRight = 982
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 980
        ExplicitHeight = 464
        inherited cxVisualiza: TcxGrid
          Width = 974
          Height = 417
          ExplicitWidth = 974
          ExplicitHeight = 417
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            OptionsView.ColumnAutoWidth = True
            object cxVisualizaDBTableView1COD_CAI: TcxGridDBColumn
              Caption = 'C'#243'digo do Caixa'
              DataBinding.FieldName = 'COD_CAI'
            end
            object cxVisualizaDBTableView1DESC_CAI: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESC_CAI'
            end
          end
        end
        inherited Panel1: TPanel
          Width = 980
          ExplicitWidth = 980
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
        ExplicitWidth = 980
        ExplicitHeight = 464
        object cxPaginas2: TcxPageControl
          Left = 0
          Top = 0
          Width = 980
          Height = 464
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxPageDadosCaixa
          Properties.CustomButtons.Buttons = <>
          OnChange = cxPaginas2Change
          ClientRectBottom = 462
          ClientRectLeft = 2
          ClientRectRight = 978
          ClientRectTop = 30
          object cxPageDadosCaixa: TcxTabSheet
            Caption = 'Dados do Caixa'
            ImageIndex = 0
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 976
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
              object dbedtCOD_ICMS: TDBEdit
                Left = 5
                Top = 19
                Width = 121
                Height = 23
                TabStop = False
                CharCase = ecUpperCase
                DataField = 'COD_CAI'
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
            object Panel4: TPanel
              Left = 0
              Top = 45
              Width = 976
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
                DataField = 'DESC_CAI'
                DataSource = dsPrincipal
                TabOrder = 1
              end
            end
            object Panel5: TPanel
              Left = 0
              Top = 90
              Width = 976
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object dbrgrpCASAS_DECIMAIS: TDBRadioGroup
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 185
                Height = 39
                Align = alLeft
                Caption = ' Casas Decimais Quantidade '
                Columns = 2
                DataField = 'CASAS_DECIMAIS'
                DataSource = dsPrincipal
                Items.Strings = (
                  '2 Casas'
                  '3 Casas')
                TabOrder = 0
                Values.Strings = (
                  '2'
                  '3')
              end
              object dbrgrpCASAS_DECIMAIS_UNITARIO: TDBRadioGroup
                AlignWithMargins = True
                Left = 194
                Top = 3
                Width = 185
                Height = 39
                Align = alLeft
                Caption = ' Casas Decimais Valor Unit'#225'rio '
                Columns = 2
                DataField = 'CASAS_DECIMAIS_UNITARIO'
                DataSource = dsPrincipal
                Items.Strings = (
                  '2 Casas'
                  '3 Casas')
                TabOrder = 1
                Values.Strings = (
                  '2'
                  '3')
              end
              object cxLabel3: TcxLabel
                Left = 383
                Top = 0
                Caption = 'Tamanho da Descri'#231#227'o :'
                Transparent = True
              end
              object dbedtTAMANHO_DESC_CUPOM: TDBEdit
                Left = 385
                Top = 19
                Width = 144
                Height = 23
                CharCase = ecUpperCase
                DataField = 'TAMANHO_DESC_CUPOM'
                DataSource = dsPrincipal
                TabOrder = 3
              end
            end
            object Panel6: TPanel
              Left = 0
              Top = 135
              Width = 976
              Height = 98
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 3
              object grpConfigIniCai: TGroupBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 309
                Height = 92
                Align = alLeft
                Caption = ' Configura'#231#245'es Caixa '
                TabOrder = 0
                object dbchkTRUNCAR_CAI: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 20
                  Width = 299
                  Height = 17
                  Align = alTop
                  Caption = 'Trucar'
                  DataField = 'TRUNCAR_CAI'
                  DataSource = dsPrincipal
                  TabOrder = 0
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkIMPRIMIR_COMPROVANTE_ECF: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 43
                  Width = 299
                  Height = 17
                  Align = alTop
                  Caption = 'Imprimir Promss'#243'rias'
                  DataField = 'IMPRIMIR_COMPROVANTE_ECF'
                  DataSource = dsPrincipal
                  TabOrder = 1
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
                object dbchkCORTA_PAPEL: TDBCheckBox
                  AlignWithMargins = True
                  Left = 5
                  Top = 66
                  Width = 299
                  Height = 17
                  Align = alTop
                  Caption = 'Cortal Papel'
                  DataField = 'CORTA_PAPEL'
                  DataSource = dsPrincipal
                  TabOrder = 2
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                end
              end
            end
          end
          object cxPageFluxo: TcxTabSheet
            Caption = 'Configuracoes Fluxo'
            ImageIndex = 3
            object cxPaginasFluxo: TcxPageControl
              Left = 0
              Top = 0
              Width = 976
              Height = 432
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxPageFluxoGerais
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 430
              ClientRectLeft = 2
              ClientRectRight = 974
              ClientRectTop = 30
              object cxPageFluxoGerais: TcxTabSheet
                Caption = 'Gerais'
                ImageIndex = 0
                object Panel30: TPanel
                  Left = 0
                  Top = 49
                  Width = 972
                  Height = 184
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Panel31: TPanel
                    Left = 0
                    Top = 0
                    Width = 265
                    Height = 184
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object dbchkFLUXO_MOVCX_PAG: TDBCheckBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 259
                      Height = 17
                      Align = alTop
                      Caption = 'Gravar Pagamentos'
                      DataField = 'FLUXO_MOVCX_PAG'
                      DataSource = dsPrincipal
                      TabOrder = 0
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object GroupBox6: TGroupBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 26
                      Width = 259
                      Height = 155
                      Align = alClient
                      Caption = 'Plano de Contas - Pagamentos '
                      Color = clWhite
                      ParentBackground = False
                      ParentColor = False
                      TabOrder = 1
                      object cxLabel30: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 17
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Pagamentos'
                        Transparent = True
                      end
                      object DBbFLUXO_MOVCX_PAG_HIST: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 36
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_MOVCX_PAG_HIST'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end
                          item
                            ImageIndex = 1
                            Kind = bkGlyph
                            Tag = 1
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 1
                        Width = 249
                      end
                      object cxLabel31: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 59
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Juros'
                        Transparent = True
                      end
                      object DBbFLUXO_MOVCX_JUROS_HIST: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 78
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_MOVCX_JUROS_HIST'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 3
                        Width = 249
                      end
                      object cxLabel32: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 101
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Descontos'
                        Transparent = True
                      end
                      object DBbFLUXO_MOVCX_DESC_HIST: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 120
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_MOVCX_DESC_HIST'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 5
                        Width = 249
                      end
                    end
                  end
                  object Panel32: TPanel
                    Left = 265
                    Top = 0
                    Width = 265
                    Height = 184
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbchkFLUXO_RECEBIMENTO: TDBCheckBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 259
                      Height = 17
                      Align = alTop
                      Caption = 'Gravar Recebimentos'
                      DataField = 'FLUXO_RECEBIMENTO'
                      DataSource = dsPrincipal
                      TabOrder = 0
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object GroupBox7: TGroupBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 26
                      Width = 259
                      Height = 155
                      Align = alClient
                      Caption = 'Plano de Contas - Recebimentos'
                      Color = clWhite
                      ParentBackground = False
                      ParentColor = False
                      TabOrder = 1
                      object cxLabel33: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 17
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Recebimento'
                        Transparent = True
                      end
                      object DBbFLUXO_RECEBIMENTO_HIST: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 36
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_RECEBIMENTO_HIST'
                        DataBinding.DataSource = dsPrincipal
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
                      object cxLabel34: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 59
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Juros'
                        Transparent = True
                      end
                      object DBbFLUXO_RECEBIMENTO_JUROS: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 78
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_RECEBIMENTO_JUROS'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 3
                        Width = 249
                      end
                      object cxLabel35: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 101
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Descontos'
                        Transparent = True
                      end
                      object DBbFLUXO_RECEBIMENTO_DESC: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 120
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_RECEBIMENTO_DESC'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 5
                        Width = 249
                      end
                    end
                  end
                  object Panel38: TPanel
                    Left = 530
                    Top = 0
                    Width = 265
                    Height = 184
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object dbchkFLUXO_SANGRIA_SUPRIMETOS: TDBCheckBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 259
                      Height = 17
                      Align = alTop
                      Caption = 'Gravar Sangria/Suprimentos'
                      DataField = 'FLUXO_SANGRIA_SUPRIMETOS'
                      DataSource = dsPrincipal
                      TabOrder = 0
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object GroupBox10: TGroupBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 26
                      Width = 259
                      Height = 155
                      Align = alClient
                      Caption = 'Plano de Contas - Sangria/Suprimetos'
                      Color = clWhite
                      ParentBackground = False
                      ParentColor = False
                      TabOrder = 1
                      object cxLabel40: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 17
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Sangrias'
                        Transparent = True
                      end
                      object DBbFLUXO_SANGRIA: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 36
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_SANGRIA'
                        DataBinding.DataSource = dsPrincipal
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
                      object cxLabel41: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 59
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Suprimentos'
                        Transparent = True
                      end
                      object DBbFLUXO_SUPRIMENTOS: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 78
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_SUPRIMENTOS'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 3
                        Width = 249
                      end
                    end
                  end
                end
                object Panel33: TPanel
                  Left = 0
                  Top = 0
                  Width = 972
                  Height = 49
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object dbrgrpFLUXO_TIPO: TDBRadioGroup
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 230
                    Height = 43
                    Align = alLeft
                    Caption = ' Tipo de Caixa '
                    Columns = 3
                    DataField = 'FLUXO_TIPO'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      'ECF'
                      'Di'#225'rio'
                      'Periodo')
                    TabOrder = 0
                    Values.Strings = (
                      '0'
                      '1'
                      '2')
                    OnChange = dbrgrpFLUXO_TIPOChange
                  end
                  object dbrgrpFLUXO_SALTO_ANTERIOR: TDBRadioGroup
                    AlignWithMargins = True
                    Left = 239
                    Top = 3
                    Width = 202
                    Height = 43
                    Align = alLeft
                    Caption = ' Trazer Saldo anterior na abertura '
                    Columns = 2
                    DataField = 'FLUXO_SALTO_ANTERIOR'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      'Sim'
                      'N'#227'o')
                    TabOrder = 1
                    Values.Strings = (
                      'S'
                      'N')
                  end
                end
                object Panel34: TPanel
                  Left = 0
                  Top = 233
                  Width = 972
                  Height = 144
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Panel35: TPanel
                    Left = 0
                    Top = 0
                    Width = 265
                    Height = 144
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object GroupBox8: TGroupBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 26
                      Width = 259
                      Height = 115
                      Align = alClient
                      Caption = 'Plano de Contas - Transferencias'
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
                        Caption = 'Entradas'
                        Transparent = True
                      end
                      object DBbFLUXO_TRANS_ENTRADA: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 36
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_TRANS_ENTRADA'
                        DataBinding.DataSource = dsPrincipal
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
                      object cxLabel37: TcxLabel
                        AlignWithMargins = True
                        Left = 5
                        Top = 59
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Saidas'
                        Transparent = True
                      end
                      object DBbFLUXO_TRANS_SAIDA: TcxDBButtonEdit
                        AlignWithMargins = True
                        Left = 5
                        Top = 78
                        Margins.Top = 0
                        Margins.Bottom = 0
                        Align = alTop
                        DataBinding.DataField = 'FLUXO_TRANS_SAIDA'
                        DataBinding.DataSource = dsPrincipal
                        Properties.Buttons = <
                          item
                            Default = True
                            ImageIndex = 0
                            Kind = bkGlyph
                          end>
                        Properties.Images = cxImgButtons
                        Properties.OnButtonClick = FluxosPlanos
                        TabOrder = 3
                        Width = 249
                      end
                    end
                    object dbchkFLUXO_TRANS: TDBCheckBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 259
                      Height = 17
                      Align = alTop
                      Caption = 'Gravar Transfer'#234'ncias'
                      DataField = 'FLUXO_TRANS'
                      DataSource = dsPrincipal
                      TabOrder = 1
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                  end
                  object Panel36: TPanel
                    Left = 265
                    Top = 0
                    Width = 527
                    Height = 144
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object GroupBox9: TGroupBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 26
                      Width = 521
                      Height = 115
                      Align = alClient
                      Caption = 'Plano de Contas - Faturamento '
                      Color = clWhite
                      ParentBackground = False
                      ParentColor = False
                      TabOrder = 0
                      object pnl1: TPanel
                        Left = 2
                        Top = 17
                        Width = 263
                        Height = 96
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
                          Caption = 'Notas Fiscais'
                          Transparent = True
                        end
                        object cxLabel39: TcxLabel
                          AlignWithMargins = True
                          Left = 3
                          Top = 42
                          Margins.Top = 0
                          Margins.Bottom = 0
                          Align = alTop
                          Caption = 'Vendas'
                          Transparent = True
                          ExplicitTop = 40
                        end
                        object DBbFLUXO_FATURAMENTO_NOTAS: TcxDBButtonEdit
                          AlignWithMargins = True
                          Left = 3
                          Top = 19
                          Margins.Top = 0
                          Margins.Bottom = 0
                          Align = alTop
                          DataBinding.DataField = 'FLUXO_FATURAMENTO_NOTAS'
                          DataBinding.DataSource = dsPrincipal
                          Properties.Buttons = <
                            item
                              Default = True
                              ImageIndex = 0
                              Kind = bkGlyph
                            end>
                          Properties.Images = cxImgButtons
                          Properties.OnButtonClick = FluxosPlanos
                          TabOrder = 2
                          Width = 257
                        end
                        object DBbFLUXO_FATURAMENTO_VENDAS: TcxDBButtonEdit
                          AlignWithMargins = True
                          Left = 3
                          Top = 61
                          Margins.Top = 0
                          Margins.Bottom = 0
                          Align = alTop
                          DataBinding.DataField = 'FLUXO_FATURAMENTO_VENDAS'
                          DataBinding.DataSource = dsPrincipal
                          Properties.Buttons = <
                            item
                              Default = True
                              ImageIndex = 0
                              Kind = bkGlyph
                            end>
                          Properties.Images = cxImgButtons
                          Properties.OnButtonClick = FluxosPlanos
                          TabOrder = 3
                          Width = 257
                        end
                      end
                    end
                    object dbchkFLUXO_FATURAMENTO: TDBCheckBox
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 521
                      Height = 17
                      Align = alTop
                      Caption = 'Gravar Faturamento'
                      DataField = 'FLUXO_FATURAMENTO'
                      DataSource = dsPrincipal
                      TabOrder = 1
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                  end
                end
              end
            end
          end
          object cxPageUsuarios: TcxTabSheet
            Caption = 'Usuarios'
            ImageIndex = 4
            OnShow = cxPageUsuariosShow
            object cxGridUsuarios: TcxGrid
              Left = 0
              Top = 0
              Width = 976
              Height = 391
              Align = alClient
              TabOrder = 0
              object cxGridUsuariosDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsCaixa_Usuarios
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Content = cxstylPadrao
                Styles.ContentOdd = cxstylOdd
                Styles.Inactive = cxstylInactive
                Styles.Header = cxstylHeader
                object cxGridUsuariosDBTableView1COD_USU: TcxGridDBColumn
                  Caption = 'Usu'#225'rio'
                  DataBinding.FieldName = 'COD_USU'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.DropDownWidth = 400
                  Properties.GridMode = True
                  Properties.KeyFieldNames = 'COD_USU'
                  Properties.ListColumns = <
                    item
                      FieldName = 'COD_USU'
                    end
                    item
                      FieldName = 'NOME_USU'
                    end>
                  Properties.ListFieldIndex = 1
                  Properties.ListSource = dsUsuarios
                  Properties.OnPopup = cxGridUsuariosDBTableView1COD_USUPropertiesPopup
                end
              end
              object cxGridUsuariosLevel1: TcxGridLevel
                GridView = cxGridUsuariosDBTableView1
              end
            end
            object Panel37: TPanel
              Left = 0
              Top = 391
              Width = 976
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object RzDBNavigator1: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsCaixa_Usuarios
                ConfirmDelete = False
                VisibleButtons = [nbInsert, nbDelete, nbPost]
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
          object cxPageBalanca: TcxTabSheet
            Caption = 'Gaveta / Balan'#231'a'
            ImageIndex = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 81
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object GroupBox1: TGroupBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 566
                Height = 75
                Align = alLeft
                Caption = ' Gaveta '
                TabOrder = 0
                object cxLabel4: TcxLabel
                  Left = 11
                  Top = 17
                  Caption = 'Marca : '
                  Transparent = True
                end
                object cbbINDICE_GAVETA: TRzDBComboBox
                  Left = 11
                  Top = 37
                  Width = 219
                  Height = 23
                  DataField = 'INDICE_GAVETA'
                  DataSource = dsPrincipal
                  Style = csDropDownList
                  TabOrder = 1
                  Items.Strings = (
                    'BEMATECH'
                    'DARUMA'
                    'SEM GAVETA')
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                end
                object cxLabel5: TcxLabel
                  Left = 243
                  Top = 17
                  Caption = 'Porta :'
                  Transparent = True
                end
                object cbbPORTA_IMP: TRzDBComboBox
                  Left = 243
                  Top = 37
                  Width = 219
                  Height = 23
                  DataField = 'PORTA_IMP'
                  DataSource = dsPrincipal
                  TabOrder = 3
                  Items.Strings = (
                    'COM1'
                    'COM2'
                    'COM3'
                    'COM4'
                    'COM5'
                    'COM6'
                    'COM7'
                    'COM8'
                    'COM9'
                    'COM10'
                    'COM11'
                    'COM12')
                end
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 81
              Width = 976
              Height = 81
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object GroupBox2: TGroupBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 566
                Height = 75
                Align = alLeft
                Caption = ' Balan'#231'a '
                TabOrder = 0
                object cxLabel6: TcxLabel
                  Left = 11
                  Top = 17
                  Caption = 'Marca : '
                  Transparent = True
                end
                object cbbINDICE_BALANCA: TRzDBComboBox
                  Left = 11
                  Top = 37
                  Width = 219
                  Height = 23
                  DataField = 'INDICE_BALANCA'
                  DataSource = dsPrincipal
                  Style = csDropDownList
                  TabOrder = 1
                  Items.Strings = (
                    'Nenhuma'
                    'Filizola'
                    'Toledo'
                    'Toledo2180'
                    'Urano'
                    'LucasTec'
                    'Magna'
                    'SEM BALAN'#199'A')
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7')
                end
                object cxLabel7: TcxLabel
                  Left = 243
                  Top = 17
                  Caption = 'Porta :'
                  Transparent = True
                end
                object cbbPORTA_BALANCA: TRzDBComboBox
                  Left = 243
                  Top = 37
                  Width = 126
                  Height = 23
                  DataField = 'PORTA_BALANCA'
                  DataSource = dsPrincipal
                  TabOrder = 3
                  Items.Strings = (
                    'COM1'
                    'COM2'
                    'COM3'
                    'COM4'
                    'COM5'
                    'COM6'
                    'COM7'
                    'COM8'
                    'COM9'
                    'COM10'
                    'COM11'
                    'COM12')
                end
                object cxLabel8: TcxLabel
                  Left = 379
                  Top = 17
                  Caption = 'Baud Porta: '
                  Transparent = True
                end
                object cbbBAUD_BALANCA: TRzDBComboBox
                  Left = 379
                  Top = 37
                  Width = 126
                  Height = 23
                  DataField = 'BAUD_BALANCA'
                  DataSource = dsPrincipal
                  TabOrder = 5
                  Items.Strings = (
                    '1200'
                    '2400'
                    '4800'
                    '9600'
                    '19200'
                    '38400')
                  Values.Strings = (
                    '1200'
                    '2400'
                    '4800'
                    '9600'
                    '19200'
                    '38400')
                end
              end
            end
          end
          object cxPageECF: TcxTabSheet
            Caption = 'Dados ECF'
            ImageIndex = 2
            object cxPaginasEcf: TcxPageControl
              Left = 0
              Top = 0
              Width = 976
              Height = 432
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxPageDadosECF
              Properties.CustomButtons.Buttons = <>
              OnChange = cxPaginasEcfChange
              ClientRectBottom = 430
              ClientRectLeft = 2
              ClientRectRight = 974
              ClientRectTop = 30
              object cxPageDadosECF: TcxTabSheet
                Caption = 'Dados do ECF'
                ImageIndex = 0
                object Panel9: TPanel
                  Left = 0
                  Top = 0
                  Width = 972
                  Height = 50
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 0
                  object Panel10: TPanel
                    Left = 0
                    Top = 0
                    Width = 131
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel9: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Tipo ECF :'
                      Transparent = True
                    end
                    object dbedtR01_TIPO_ECF: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 122
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_TIPO_ECF'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel11: TPanel
                    Left = 131
                    Top = 0
                    Width = 173
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object cxLabel10: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Marca :'
                      Transparent = True
                    end
                    object dbedtR01_MARCA_ECF: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 164
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_MARCA_ECF'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel12: TPanel
                    Left = 304
                    Top = 0
                    Width = 173
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel11: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Modelo :'
                      Transparent = True
                    end
                    object dbedtR01_MODELO_ECF: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 164
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_MODELO_ECF'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel13: TPanel
                    Left = 477
                    Top = 0
                    Width = 173
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 3
                    object cxLabel12: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'C'#243'digo Nacional'
                      Transparent = True
                    end
                    object dbedtCODIGO_NACIONAL_IDENTIFICACAO: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 164
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_NACIONAL_IDENTIFICACAO'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                end
                object Panel14: TPanel
                  Left = 0
                  Top = 50
                  Width = 972
                  Height = 50
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  object Panel15: TPanel
                    Left = 0
                    Top = 0
                    Width = 304
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel13: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'N'#250'mero de S'#233'rie :'
                      Transparent = True
                    end
                    object dbedtR01_NUMERO_SERIE: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 295
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_NUMERO_SERIE'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel16: TPanel
                    Left = 304
                    Top = 0
                    Width = 173
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object cxLabel14: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Cnpj :'
                      Transparent = True
                    end
                    object dbedtR01_CNPJ_USUARIO: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 164
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_CNPJ_USUARIO'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel17: TPanel
                    Left = 477
                    Top = 0
                    Width = 173
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel15: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Insc. Estadual :'
                      Transparent = True
                    end
                    object dbedtR01_IE_USUARIO: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 164
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_IE_USUARIO'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                end
                object Panel18: TPanel
                  Left = 0
                  Top = 100
                  Width = 972
                  Height = 50
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 2
                  object Panel19: TPanel
                    Left = 0
                    Top = 0
                    Width = 131
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel16: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'MF. Adicional :'
                      Transparent = True
                    end
                    object dbedtR01_MF_ADICIONAL: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 122
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_MF_ADICIONAL'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel20: TPanel
                    Left = 131
                    Top = 0
                    Width = 171
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object cxLabel17: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Vers'#227'o SB.:'
                      Transparent = True
                    end
                    object dbedtR01_VERSAO_SB: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 162
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_VERSAO_SB'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel21: TPanel
                    Left = 302
                    Top = 0
                    Width = 171
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel18: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Data e Hora SB.:'
                      Transparent = True
                    end
                    object dbedtR01_DATAHORA_SB: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 162
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_DATAHORA_SB'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object Panel23: TPanel
                    Left = 473
                    Top = 0
                    Width = 177
                    Height = 50
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 3
                    object cxLabel20: TcxLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Num. Usuario :'
                      Transparent = True
                    end
                    object dbedtR01_NUMERO_USUARIO: TDBEdit
                      AlignWithMargins = True
                      Left = 6
                      Top = 22
                      Width = 168
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'R01_NUMERO_USUARIO'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                end
                object Panel22: TPanel
                  Left = 0
                  Top = 150
                  Width = 972
                  Height = 126
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 3
                  object grpDadosComunicador: TGroupBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 647
                    Height = 120
                    Align = alLeft
                    Caption = ' Comunicador '
                    TabOrder = 0
                    object Panel24: TPanel
                      Left = 2
                      Top = 17
                      Width = 294
                      Height = 101
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 0
                      object cxLabel19: TcxLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 26
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Caminho do Banco'
                        Transparent = True
                      end
                      object dbchkEXPORTAR_DADOS: TDBCheckBox
                        AlignWithMargins = True
                        Left = 3
                        Top = 3
                        Width = 288
                        Height = 17
                        Align = alTop
                        Caption = 'Exportar Dados'
                        DataField = 'EXPORTAR_DADOS'
                        DataSource = dsPrincipal
                        TabOrder = 1
                        ValueChecked = 'S'
                        ValueUnchecked = 'N'
                      end
                      object dbedtCAMINHO_BANCO: TDBEdit
                        AlignWithMargins = True
                        Left = 6
                        Top = 45
                        Width = 285
                        Height = 23
                        Margins.Left = 6
                        Margins.Top = 0
                        TabStop = False
                        Align = alTop
                        CharCase = ecUpperCase
                        DataField = 'CAMINHO_BANCO'
                        DataSource = dsPrincipal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 2
                      end
                    end
                    object Panel25: TPanel
                      Left = 296
                      Top = 17
                      Width = 171
                      Height = 101
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 1
                      object cxLabel21: TcxLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 3
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Intervalo RX (Seg)'
                        Transparent = True
                      end
                      object dbedtINTERVALO_RECEBE: TDBEdit
                        AlignWithMargins = True
                        Left = 6
                        Top = 22
                        Width = 162
                        Height = 23
                        Margins.Left = 6
                        Margins.Top = 0
                        TabStop = False
                        Align = alTop
                        CharCase = ecUpperCase
                        DataField = 'INTERVALO_RECEBE'
                        DataSource = dsPrincipal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 1
                      end
                      object cxLabel22: TcxLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 51
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Intervalo TX (Seg)'
                        Transparent = True
                      end
                      object dbedtINTERVALO_TRANSMITE: TDBEdit
                        AlignWithMargins = True
                        Left = 6
                        Top = 70
                        Width = 162
                        Height = 23
                        Margins.Left = 6
                        Margins.Top = 0
                        TabStop = False
                        Align = alTop
                        CharCase = ecUpperCase
                        DataField = 'INTERVALO_TRANSMITE'
                        DataSource = dsPrincipal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 3
                      end
                    end
                    object Panel26: TPanel
                      Left = 467
                      Top = 17
                      Width = 171
                      Height = 101
                      Align = alLeft
                      BevelOuter = bvNone
                      TabOrder = 2
                      object cxLabel23: TcxLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 3
                        Margins.Bottom = 0
                        Align = alTop
                        Caption = 'Dias Atualiza Paf'
                        Transparent = True
                      end
                      object dbedtDIAS_ATUALIZACAO_PAF: TDBEdit
                        AlignWithMargins = True
                        Left = 6
                        Top = 22
                        Width = 162
                        Height = 23
                        Margins.Left = 6
                        Margins.Top = 0
                        TabStop = False
                        Align = alTop
                        CharCase = ecUpperCase
                        DataField = 'DIAS_ATUALIZACAO_PAF'
                        DataSource = dsPrincipal
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 1
                      end
                    end
                  end
                end
              end
              object cxPageIndicesRel: TcxTabSheet
                Caption = 'Indices Relat'#243'rios / Mensagens'
                ImageIndex = 1
                object Panel27: TPanel
                  Left = 0
                  Top = 0
                  Width = 972
                  Height = 177
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 0
                  object GroupBox3: TGroupBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 307
                    Height = 171
                    Align = alLeft
                    Caption = ' Indices Relt'#243'rios Gerenciais '
                    TabOrder = 0
                    object cxLabel24: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 20
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Ordem de Servi'#231'o '
                      Transparent = True
                    end
                    object dbedtINDICE_GER_OS: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 39
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'INDICE_GER_OS'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object cxLabel25: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 116
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Confer'#234'ncia de Mesas'
                      Transparent = True
                    end
                    object dbedtINDICE_GER_ORCAMENTO: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 87
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'INDICE_GER_ORCAMENTO'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object cxLabel26: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 68
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Or'#231'amento'
                      Transparent = True
                    end
                    object dbedtINDICE_GER_MESA: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 135
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'INDICE_GER_MESA'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 5
                    end
                  end
                  object GroupBox4: TGroupBox
                    AlignWithMargins = True
                    Left = 316
                    Top = 3
                    Width = 307
                    Height = 171
                    Align = alLeft
                    Caption = ' Mensagens do ECF '
                    TabOrder = 1
                    object cxLabel27: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 20
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Linha 1'
                      Transparent = True
                    end
                    object dbedtLINHA1: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 39
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'LINHA1'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object cxLabel28: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 116
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Linha 3'
                      Transparent = True
                    end
                    object dbedtLINHA2: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 87
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'LINHA2'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object cxLabel29: TcxLabel
                      AlignWithMargins = True
                      Left = 5
                      Top = 68
                      Margins.Bottom = 0
                      Align = alTop
                      Caption = 'Linha 2'
                      Transparent = True
                    end
                    object dbedtLINHA3: TDBEdit
                      AlignWithMargins = True
                      Left = 8
                      Top = 135
                      Width = 294
                      Height = 23
                      Margins.Left = 6
                      Margins.Top = 0
                      TabStop = False
                      Align = alTop
                      CharCase = ecUpperCase
                      DataField = 'LINHA3'
                      DataSource = dsPrincipal
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 5
                    end
                  end
                end
              end
              object cxPageIndicesAliq: TcxTabSheet
                Caption = 'Indices Aliquotas'
                ImageIndex = 2
                OnShow = cxPageIndicesAliqShow
                object cxGrid1: TcxGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 57
                  Width = 966
                  Height = 203
                  Align = alClient
                  TabOrder = 0
                  object cxIndicesAliq: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    DataController.DataSource = dsInicesAliq
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
                    Styles.Content = cxstylPadrao
                    Styles.ContentOdd = cxstylOdd
                    Styles.Inactive = cxstylInactive
                    Styles.Header = cxstylHeader
                    object cxIndicesAliqCOD_GRP: TcxGridDBColumn
                      Caption = 'C'#243'd. Grupo'
                      DataBinding.FieldName = 'COD_GRP'
                    end
                    object cxIndicesAliqNOME_GRP: TcxGridDBColumn
                      Caption = 'Nome Grupo'
                      DataBinding.FieldName = 'NOME_GRP'
                      Options.Editing = False
                    end
                    object cxIndicesAliqINDICE_ECF: TcxGridDBColumn
                      Caption = 'Indice ECF'
                      DataBinding.FieldName = 'INDICE_ECF'
                    end
                    object cxIndicesAliqINDICE_R03: TcxGridDBColumn
                      Caption = 'Indice R03'
                      DataBinding.FieldName = 'INDICE_R03'
                    end
                    object cxIndicesAliqALIQUOTA_GRP: TcxGridDBColumn
                      Caption = 'Aliquota'
                      DataBinding.FieldName = 'ALIQUOTA_GRP'
                      Options.Editing = False
                    end
                  end
                  object cxGrid1Level1: TcxGridLevel
                    GridView = cxIndicesAliq
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 263
                  Width = 972
                  Height = 137
                  Align = alBottom
                  Caption = 'Tabela C'#243'digo dos Totalizadores Parciais [R03]'
                  TabOrder = 1
                  object Label35: TLabel
                    Left = 8
                    Top = 24
                    Width = 133
                    Height = 14
                    Caption = 'xxTnnnn - Trib.ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label36: TLabel
                    Left = 8
                    Top = 40
                    Width = 140
                    Height = 14
                    Caption = 'xxSnnnn - Trib.ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label37: TLabel
                    Left = 8
                    Top = 56
                    Width = 161
                    Height = 14
                    Caption = 'Fn      - Sub.Trib.ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label38: TLabel
                    Left = 8
                    Top = 72
                    Width = 147
                    Height = 14
                    Caption = 'In      - Isento ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label39: TLabel
                    Left = 8
                    Top = 88
                    Width = 175
                    Height = 14
                    Caption = 'Nn      - N'#227'o Incid. ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label40: TLabel
                    Left = 208
                    Top = 24
                    Width = 203
                    Height = 14
                    Caption = 'FSn  - Sub.Tribut'#225'ria - ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label41: TLabel
                    Left = 208
                    Top = 40
                    Width = 147
                    Height = 14
                    Caption = 'ISn  - Isento - ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label42: TLabel
                    Left = 208
                    Top = 56
                    Width = 203
                    Height = 14
                    Caption = 'NSn  - N'#227'o Incid'#234'ncia - ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label43: TLabel
                    Left = 208
                    Top = 72
                    Width = 196
                    Height = 14
                    Caption = 'OPNF - Opera'#231#245'es N'#227'o Fiscais'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label44: TLabel
                    Left = 208
                    Top = 88
                    Width = 154
                    Height = 14
                    Caption = 'DT   - Desconto - ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label45: TLabel
                    Left = 208
                    Top = 104
                    Width = 161
                    Height = 14
                    Caption = 'DS   - Desconto - ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label46: TLabel
                    Left = 448
                    Top = 24
                    Width = 112
                    Height = 14
                    Caption = 'AT - Acr'#233'sc.ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label47: TLabel
                    Left = 448
                    Top = 40
                    Width = 119
                    Height = 14
                    Caption = 'AS - Acr'#233'sc.ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label48: TLabel
                    Left = 448
                    Top = 56
                    Width = 133
                    Height = 14
                    Caption = 'Can-T - Cancel.ICMS'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label49: TLabel
                    Left = 448
                    Top = 72
                    Width = 140
                    Height = 14
                    Caption = 'Can-S - Cancel.ISSQN'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Courier New'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object Panel28: TPanel
                  Left = 0
                  Top = 0
                  Width = 972
                  Height = 54
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label32: TLabel
                    Left = 8
                    Top = 8
                    Width = 33
                    Height = 15
                    Caption = 'Grupo'
                  end
                  object BtnConsGRP: TsSpeedButton
                    Left = 69
                    Top = 30
                    Width = 23
                    Height = 21
                    Hint = 'Consultar Produto'
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
                    OnClick = BtnConsGRPClick
                    SkinData.SkinSection = 'SPEEDBUTTON'
                  end
                  object Label33: TLabel
                    Left = 98
                    Top = 8
                    Width = 104
                    Height = 15
                    Caption = 'Descri'#231#227'o do Grupo'
                  end
                  object Label34: TLabel
                    Left = 376
                    Top = 8
                    Width = 55
                    Height = 15
                    Caption = 'Indice ECF'
                  end
                  object Label50: TLabel
                    Left = 440
                    Top = 8
                    Width = 54
                    Height = 15
                    Caption = 'Indice R03'
                  end
                  object EdtCodGrp: TEdit
                    Left = 8
                    Top = 24
                    Width = 57
                    Height = 23
                    Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
                    Alignment = taRightJustify
                    Color = clSilver
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnEnter = EdtCodGrpEnter
                    OnExit = EdtCodGrpExit
                    OnKeyDown = EdtCodGrpKeyDown
                    OnKeyPress = EdtCodGrpKeyPress
                  end
                  object EdtNomeGrp: TEdit
                    Left = 98
                    Top = 24
                    Width = 263
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
                  object EdtIndiceECF: TEdit
                    Left = 376
                    Top = 24
                    Width = 57
                    Height = 23
                    Color = clSilver
                    MaxLength = 5
                    TabOrder = 2
                  end
                  object EdtIndiceR03: TEdit
                    Left = 440
                    Top = 24
                    Width = 57
                    Height = 23
                    Color = clSilver
                    MaxLength = 10
                    TabOrder = 3
                  end
                  object BtnGravaAliquota: TBitBtn
                    Left = 512
                    Top = 20
                    Width = 57
                    Height = 25
                    Caption = '&Gravar'
                    TabOrder = 4
                    OnClick = BtnGravaAliquotaClick
                  end
                  object BtnExcluiAliquota: TBitBtn
                    Left = 576
                    Top = 20
                    Width = 57
                    Height = 25
                    Caption = '&Excluir'
                    TabOrder = 5
                    OnClick = BtnExcluiAliquotaClick
                  end
                end
              end
              object cxPageIndicesFormas: TcxTabSheet
                Caption = 'Indices Formas'
                ImageIndex = 3
                OnShow = cxPageIndicesFormasShow
                object cxIndicesFormas: TcxGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 56
                  Width = 966
                  Height = 341
                  Align = alClient
                  TabOrder = 0
                  object cxIndicesFormasDBTableView1: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    DataController.DataSource = dsIndicesFormas
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
                    Styles.Content = cxstylPadrao
                    Styles.ContentOdd = cxstylOdd
                    Styles.Inactive = cxstylInactive
                    Styles.Header = cxstylHeader
                    object cxIndicesFormasDBTableView1COD_FORMA: TcxGridDBColumn
                      Caption = 'C'#243'd. Forma'
                      DataBinding.FieldName = 'COD_FORMA'
                    end
                    object cxIndicesFormasDBTableView1DESCRICAO: TcxGridDBColumn
                      Caption = 'Descri'#231#227'o'
                      DataBinding.FieldName = 'DESCRICAO'
                    end
                    object cxIndicesFormasDBTableView1INDICE: TcxGridDBColumn
                      Caption = 'Indice'
                      DataBinding.FieldName = 'INDICE'
                    end
                    object cxIndicesFormasDBTableView1DESCRICAO_ECF: TcxGridDBColumn
                      Caption = 'Descri'#231#227'o ECF'
                      DataBinding.FieldName = 'DESCRICAO_ECF'
                    end
                  end
                  object cxIndicesFormasLevel1: TcxGridLevel
                    GridView = cxIndicesFormasDBTableView1
                  end
                end
                object Panel29: TPanel
                  Left = 0
                  Top = 0
                  Width = 972
                  Height = 53
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label14: TLabel
                    Left = 7
                    Top = 8
                    Width = 59
                    Height = 15
                    Caption = 'C'#243'd.Forma'
                  end
                  object BtnConsForma: TsSpeedButton
                    Left = 68
                    Top = 24
                    Width = 23
                    Height = 21
                    Hint = 'Consultar Produto'
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
                    OnClick = BtnConsFormaClick
                    SkinData.SkinSection = 'SPEEDBUTTON'
                  end
                  object Label52: TLabel
                    Left = 97
                    Top = 8
                    Width = 184
                    Height = 15
                    Caption = 'Descri'#231#227'o da Forma de Pagamento'
                  end
                  object Label53: TLabel
                    Left = 320
                    Top = 8
                    Width = 55
                    Height = 15
                    Caption = #205'ndice ECF'
                  end
                  object Label54: TLabel
                    Left = 408
                    Top = 8
                    Width = 91
                    Height = 15
                    Caption = 'Descri'#231#227'o no ECF'
                  end
                  object EdtCodForma: TEdit
                    Left = 5
                    Top = 24
                    Width = 57
                    Height = 23
                    Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
                    Alignment = taRightJustify
                    Color = clSilver
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnEnter = EdtCodFormaEnter
                    OnExit = EdtCodFormaExit
                    OnKeyDown = EdtCodFormaKeyDown
                    OnKeyPress = EdtCodGrpKeyPress
                  end
                  object EdtNomeForma: TEdit
                    Left = 97
                    Top = 24
                    Width = 207
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
                  object EdtIndiceForma: TEdit
                    Left = 320
                    Top = 24
                    Width = 73
                    Height = 23
                    Color = clSilver
                    MaxLength = 20
                    TabOrder = 2
                  end
                  object EdtDescECF: TEdit
                    Left = 408
                    Top = 24
                    Width = 89
                    Height = 23
                    Color = clSilver
                    MaxLength = 20
                    TabOrder = 3
                  end
                  object BtnGravaForma: TBitBtn
                    Left = 510
                    Top = 20
                    Width = 57
                    Height = 25
                    Caption = '&Gravar'
                    TabOrder = 4
                    OnClick = BtnGravaFormaClick
                  end
                  object BtnExcluiForma: TBitBtn
                    Left = 574
                    Top = 20
                    Width = 57
                    Height = 25
                    Caption = '&Excluir'
                    TabOrder = 5
                    OnClick = BtnExcluiFormaClick
                  end
                end
              end
            end
          end
          object cxTabNFCe: TcxTabSheet
            Caption = 'NFCe'
            ImageIndex = 5
            object Panel39: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              ExplicitTop = 8
              object cxLabel42: TcxLabel
                Left = 5
                Top = -1
                Caption = 'NFCe S'#233'rie :'
                Transparent = True
              end
              object dbedtNFCE_SERIE: TDBEdit
                Left = 5
                Top = 18
                Width = 164
                Height = 23
                CharCase = ecUpperCase
                DataField = 'NFCE_SERIE'
                DataSource = dsPrincipal
                TabOrder = 1
              end
            end
            object Panel40: TPanel
              Left = 0
              Top = 45
              Width = 976
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              ExplicitTop = 53
              object cxLabel43: TcxLabel
                Left = 3
                Top = -2
                Caption = 'NFCe Numero :'
                Transparent = True
              end
              object dbedtNFCE_NUMERO: TDBEdit
                Left = 5
                Top = 18
                Width = 164
                Height = 23
                CharCase = ecUpperCase
                DataField = 'NFCE_NUMERO'
                DataSource = dsPrincipal
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 5833328
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    AfterScroll = QPrincipalAfterScroll
    UpdateTransaction = TRPrincipal
    UpdateObject = upPrincipal
    SQL.Strings = (
      'SELECT * FROM CAIXA WHERE COD_EMP=:COD_EMP')
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QPrincipalCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPrincipalCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPrincipalTAMANHO_DESC_CUPOM: TIntegerField
      DefaultExpression = '29'
      FieldName = 'TAMANHO_DESC_CUPOM'
      Origin = 'TAMANHO_DESC_CUPOM'
    end
    object QPrincipalPORTA_IMP: TStringField
      FieldName = 'PORTA_IMP'
      Origin = 'PORTA_IMP'
      FixedChar = True
      Size = 4
    end
    object QPrincipalDESC_CAI: TStringField
      FieldName = 'DESC_CAI'
      Origin = 'DESC_CAI'
      Required = True
      Size = 50
    end
    object QPrincipalINDICE_GAVETA: TIntegerField
      DefaultExpression = '2'
      FieldName = 'INDICE_GAVETA'
      Origin = 'INDICE_GAVETA'
      Required = True
    end
    object QPrincipalINDICE_BALANCA: TIntegerField
      DefaultExpression = '7'
      FieldName = 'INDICE_BALANCA'
      Origin = 'INDICE_BALANCA'
      Required = True
    end
    object QPrincipalPORTA_BALANCA: TIntegerField
      FieldName = 'PORTA_BALANCA'
      Origin = 'PORTA_BALANCA'
    end
    object QPrincipalBAUD_BALANCA: TIntegerField
      FieldName = 'BAUD_BALANCA'
      Origin = 'BAUD_BALANCA'
    end
    object QPrincipalCASAS_DECIMAIS: TIntegerField
      DefaultExpression = '3'
      FieldName = 'CASAS_DECIMAIS'
      Origin = 'CASAS_DECIMAIS'
    end
    object QPrincipalCASAS_DECIMAIS_UNITARIO: TIntegerField
      DefaultExpression = '2'
      FieldName = 'CASAS_DECIMAIS_UNITARIO'
      Origin = 'CASAS_DECIMAIS_UNITARIO'
      Required = True
    end
    object QPrincipalTRUNCAR_CAI: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'TRUNCAR_CAI'
      Origin = 'TRUNCAR_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalIMPRIMIR_COMPROVANTE_ECF: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'IMPRIMIR_COMPROVANTE_ECF'
      Origin = 'IMPRIMIR_COMPROVANTE_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalECF_MFD: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'ECF_MFD'
      Origin = 'ECF_MFD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalIP_SERVIDOR_TEF: TStringField
      FieldName = 'IP_SERVIDOR_TEF'
      Origin = 'IP_SERVIDOR_TEF'
      Size = 15
    end
    object QPrincipalID_LOJA_TEF: TStringField
      FieldName = 'ID_LOJA_TEF'
      Origin = 'ID_LOJA_TEF'
      Size = 8
    end
    object QPrincipalID_TERMINAL_TEF: TStringField
      FieldName = 'ID_TERMINAL_TEF'
      Origin = 'ID_TERMINAL_TEF'
      Size = 8
    end
    object QPrincipalTEF_CAI: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'TEF_CAI'
      Origin = 'TEF_CAI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalCAMINHO_BANCO: TStringField
      FieldName = 'CAMINHO_BANCO'
      Origin = 'CAMINHO_BANCO'
      Size = 255
    end
    object QPrincipalEXPORTAR_DADOS: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'EXPORTAR_DADOS'
      Origin = 'EXPORTAR_DADOS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QPrincipalR01_MF_ADICIONAL: TStringField
      FieldName = 'R01_MF_ADICIONAL'
      Origin = 'R01_MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QPrincipalR01_TIPO_ECF: TStringField
      FieldName = 'R01_TIPO_ECF'
      Origin = 'R01_TIPO_ECF'
      Size = 7
    end
    object QPrincipalR01_MARCA_ECF: TStringField
      FieldName = 'R01_MARCA_ECF'
      Origin = 'R01_MARCA_ECF'
    end
    object QPrincipalR01_MODELO_ECF: TStringField
      FieldName = 'R01_MODELO_ECF'
      Origin = 'R01_MODELO_ECF'
    end
    object QPrincipalR01_VERSAO_SB: TStringField
      FieldName = 'R01_VERSAO_SB'
      Origin = 'R01_VERSAO_SB'
      Size = 10
    end
    object QPrincipalR01_CNPJ_USUARIO: TStringField
      FieldName = 'R01_CNPJ_USUARIO'
      Origin = 'R01_CNPJ_USUARIO'
      Size = 14
    end
    object QPrincipalR01_IE_USUARIO: TStringField
      FieldName = 'R01_IE_USUARIO'
      Origin = 'R01_IE_USUARIO'
      Size = 14
    end
    object QPrincipalR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'R01_NUMERO_SERIE'
    end
    object QPrincipalLINHA1: TStringField
      FieldName = 'LINHA1'
      Origin = 'LINHA1'
      Size = 48
    end
    object QPrincipalLINHA2: TStringField
      FieldName = 'LINHA2'
      Origin = 'LINHA2'
      Size = 48
    end
    object QPrincipalLINHA3: TStringField
      FieldName = 'LINHA3'
      Origin = 'LINHA3'
      Size = 48
    end
    object QPrincipalINDICE_GER_OS: TStringField
      DefaultExpression = 'UPPER('#39'01'#39')'
      FieldName = 'INDICE_GER_OS'
      Origin = 'INDICE_GER_OS'
      Size = 15
    end
    object QPrincipalINDICE_GER_ORCAMENTO: TStringField
      DefaultExpression = 'UPPER('#39'01'#39')'
      FieldName = 'INDICE_GER_ORCAMENTO'
      Origin = 'INDICE_GER_ORCAMENTO'
      Size = 15
    end
    object QPrincipalINDICE_GER_MESA: TStringField
      DefaultExpression = 'UPPER('#39'01'#39')'
      FieldName = 'INDICE_GER_MESA'
      Origin = 'INDICE_GER_MESA'
      Size = 15
    end
    object QPrincipalR01_NUMERO_USUARIO: TIntegerField
      FieldName = 'R01_NUMERO_USUARIO'
      Origin = 'R01_NUMERO_USUARIO'
    end
    object QPrincipalCODIGO_NACIONAL_IDENTIFICACAO: TStringField
      FieldName = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Origin = 'CODIGO_NACIONAL_IDENTIFICACAO'
      Size = 6
    end
    object QPrincipalR01_DATAHORA_SB: TSQLTimeStampField
      FieldName = 'R01_DATAHORA_SB'
      Origin = 'R01_DATAHORA_SB'
    end
    object QPrincipalINTERVALO_RECEBE: TIntegerField
      DefaultExpression = '5'
      FieldName = 'INTERVALO_RECEBE'
      Origin = 'INTERVALO_RECEBE'
      Required = True
    end
    object QPrincipalINTERVALO_TRANSMITE: TIntegerField
      DefaultExpression = '5'
      FieldName = 'INTERVALO_TRANSMITE'
      Origin = 'INTERVALO_TRANSMITE'
      Required = True
    end
    object QPrincipalDIAS_ATUALIZACAO_PAF: TIntegerField
      DefaultExpression = '5'
      FieldName = 'DIAS_ATUALIZACAO_PAF'
      Origin = 'DIAS_ATUALIZACAO_PAF'
      Required = True
    end
    object QPrincipalCORTA_PAPEL: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'CORTA_PAPEL'
      Origin = 'CORTA_PAPEL'
      Size = 1
    end
    object QPrincipalNFCE_SERIE: TIntegerField
      FieldName = 'NFCE_SERIE'
      Origin = 'NFCE_SERIE'
    end
    object QPrincipalNFCE_NUMERO: TIntegerField
      FieldName = 'NFCE_NUMERO'
      Origin = 'NFCE_NUMERO'
    end
    object QPrincipalFLUXO_TIPO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'FLUXO_TIPO'
      Origin = 'FLUXO_TIPO'
    end
    object QPrincipalFLUXO_MOVCX_PAG: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'FLUXO_MOVCX_PAG'
      Origin = 'FLUXO_MOVCX_PAG'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_MOVCX_PAG_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_PAG_HIST'
      Origin = 'FLUXO_MOVCX_PAG_HIST'
    end
    object QPrincipalFLUXO_MOVCX_JUROS_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_JUROS_HIST'
      Origin = 'FLUXO_MOVCX_JUROS_HIST'
    end
    object QPrincipalFLUXO_MOVCX_DESC_HIST: TStringField
      FieldName = 'FLUXO_MOVCX_DESC_HIST'
      Origin = 'FLUXO_MOVCX_DESC_HIST'
    end
    object QPrincipalFLUXO_RECEBIMENTO: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'FLUXO_RECEBIMENTO'
      Origin = 'FLUXO_RECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_RECEBIMENTO_HIST: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_HIST'
      Origin = 'FLUXO_RECEBIMENTO_HIST'
    end
    object QPrincipalFLUXO_RECEBIMENTO_DESC: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_DESC'
      Origin = 'FLUXO_RECEBIMENTO_DESC'
    end
    object QPrincipalFLUXO_RECEBIMENTO_JUROS: TStringField
      FieldName = 'FLUXO_RECEBIMENTO_JUROS'
      Origin = 'FLUXO_RECEBIMENTO_JUROS'
    end
    object QPrincipalFLUXO_SALTO_ANTERIOR: TStringField
      DefaultExpression = 'UPPER('#39'S'#39')'
      FieldName = 'FLUXO_SALTO_ANTERIOR'
      Origin = 'FLUXO_SALTO_ANTERIOR'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_TRANS_SAIDA: TStringField
      FieldName = 'FLUXO_TRANS_SAIDA'
      Origin = 'FLUXO_TRANS_SAIDA'
    end
    object QPrincipalFLUXO_TRANS_ENTRADA: TStringField
      FieldName = 'FLUXO_TRANS_ENTRADA'
      Origin = 'FLUXO_TRANS_ENTRADA'
    end
    object QPrincipalFLUXO_FATURAMENTO: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'FLUXO_FATURAMENTO'
      Origin = 'FLUXO_FATURAMENTO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_FATURAMENTO_NOTAS: TStringField
      FieldName = 'FLUXO_FATURAMENTO_NOTAS'
      Origin = 'FLUXO_FATURAMENTO_NOTAS'
    end
    object QPrincipalFLUXO_FATURAMENTO_VENDAS: TStringField
      FieldName = 'FLUXO_FATURAMENTO_VENDAS'
      Origin = 'FLUXO_FATURAMENTO_VENDAS'
    end
    object QPrincipalFLUXO_TRANS: TStringField
      DefaultExpression = 'UPPER('#39'N'#39')'
      FieldName = 'FLUXO_TRANS'
      Origin = 'FLUXO_TRANS'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_SANGRIA_SUPRIMETOS: TStringField
      FieldName = 'FLUXO_SANGRIA_SUPRIMETOS'
      Origin = 'FLUXO_SANGRIA_SUPRIMETOS'
      FixedChar = True
      Size = 1
    end
    object QPrincipalFLUXO_SANGRIA: TStringField
      FieldName = 'FLUXO_SANGRIA'
      Origin = 'FLUXO_SANGRIA'
    end
    object QPrincipalFLUXO_SUPRIMENTOS: TStringField
      FieldName = 'FLUXO_SUPRIMENTOS'
      Origin = 'FLUXO_SUPRIMENTOS'
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 5833176
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
    DesignInfo = 11010744
  end
  object upPrincipal: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO CAIXA'
      '(COD_CAI, COD_EMP, TAMANHO_DESC_CUPOM, PORTA_IMP, '
      '  DESC_CAI, INDICE_GAVETA, INDICE_BALANCA, '
      '  PORTA_BALANCA, BAUD_BALANCA, CASAS_DECIMAIS, '
      
        '  CASAS_DECIMAIS_UNITARIO, TRUNCAR_CAI, IMPRIMIR_COMPROVANTE_ECF' +
        ', '
      '  ECF_MFD, IP_SERVIDOR_TEF, ID_LOJA_TEF, ID_TERMINAL_TEF, '
      '  TEF_CAI, CAMINHO_BANCO, EXPORTAR_DADOS, R01_MF_ADICIONAL, '
      '  R01_TIPO_ECF, R01_MARCA_ECF, R01_MODELO_ECF, '
      '  R01_VERSAO_SB, R01_CNPJ_USUARIO, R01_IE_USUARIO, '
      '  R01_NUMERO_SERIE, LINHA1, LINHA2, LINHA3, '
      '  INDICE_GER_OS, INDICE_GER_ORCAMENTO, INDICE_GER_MESA, '
      '  R01_NUMERO_USUARIO, CODIGO_NACIONAL_IDENTIFICACAO, '
      '  R01_DATAHORA_SB, INTERVALO_RECEBE, INTERVALO_TRANSMITE, '
      '  DIAS_ATUALIZACAO_PAF, CORTA_PAPEL, NFCE_SERIE, '
      '  NFCE_NUMERO, FLUXO_TIPO, FLUXO_MOVCX_PAG, '
      '  FLUXO_MOVCX_PAG_HIST, FLUXO_MOVCX_JUROS_HIST, '
      
        '  FLUXO_MOVCX_DESC_HIST, FLUXO_RECEBIMENTO, FLUXO_RECEBIMENTO_HI' +
        'ST, '
      '  FLUXO_RECEBIMENTO_DESC, FLUXO_RECEBIMENTO_JUROS, '
      '  FLUXO_SALTO_ANTERIOR, FLUXO_TRANS_SAIDA, FLUXO_TRANS_ENTRADA, '
      
        '  FLUXO_FATURAMENTO, FLUXO_FATURAMENTO_NOTAS, FLUXO_FATURAMENTO_' +
        'VENDAS, '
      '  FLUXO_TRANS, FLUXO_SANGRIA_SUPRIMETOS, FLUXO_SANGRIA, '
      '  FLUXO_SUPRIMENTOS)'
      
        'VALUES (:NEW_COD_CAI, :NEW_COD_EMP, :NEW_TAMANHO_DESC_CUPOM, :NE' +
        'W_PORTA_IMP, '
      '  :NEW_DESC_CAI, :NEW_INDICE_GAVETA, :NEW_INDICE_BALANCA, '
      '  :NEW_PORTA_BALANCA, :NEW_BAUD_BALANCA, :NEW_CASAS_DECIMAIS, '
      
        '  :NEW_CASAS_DECIMAIS_UNITARIO, :NEW_TRUNCAR_CAI, :NEW_IMPRIMIR_' +
        'COMPROVANTE_ECF, '
      
        '  :NEW_ECF_MFD, :NEW_IP_SERVIDOR_TEF, :NEW_ID_LOJA_TEF, :NEW_ID_' +
        'TERMINAL_TEF, '
      
        '  :NEW_TEF_CAI, :NEW_CAMINHO_BANCO, :NEW_EXPORTAR_DADOS, :NEW_R0' +
        '1_MF_ADICIONAL, '
      '  :NEW_R01_TIPO_ECF, :NEW_R01_MARCA_ECF, :NEW_R01_MODELO_ECF, '
      
        '  :NEW_R01_VERSAO_SB, :NEW_R01_CNPJ_USUARIO, :NEW_R01_IE_USUARIO' +
        ', '
      '  :NEW_R01_NUMERO_SERIE, :NEW_LINHA1, :NEW_LINHA2, :NEW_LINHA3, '
      
        '  :NEW_INDICE_GER_OS, :NEW_INDICE_GER_ORCAMENTO, :NEW_INDICE_GER' +
        '_MESA, '
      '  :NEW_R01_NUMERO_USUARIO, :NEW_CODIGO_NACIONAL_IDENTIFICACAO, '
      
        '  :NEW_R01_DATAHORA_SB, :NEW_INTERVALO_RECEBE, :NEW_INTERVALO_TR' +
        'ANSMITE, '
      '  :NEW_DIAS_ATUALIZACAO_PAF, :NEW_CORTA_PAPEL, :NEW_NFCE_SERIE, '
      '  :NEW_NFCE_NUMERO, :NEW_FLUXO_TIPO, :NEW_FLUXO_MOVCX_PAG, '
      '  :NEW_FLUXO_MOVCX_PAG_HIST, :NEW_FLUXO_MOVCX_JUROS_HIST, '
      
        '  :NEW_FLUXO_MOVCX_DESC_HIST, :NEW_FLUXO_RECEBIMENTO, :NEW_FLUXO' +
        '_RECEBIMENTO_HIST, '
      '  :NEW_FLUXO_RECEBIMENTO_DESC, :NEW_FLUXO_RECEBIMENTO_JUROS, '
      
        '  :NEW_FLUXO_SALTO_ANTERIOR, :NEW_FLUXO_TRANS_SAIDA, :NEW_FLUXO_' +
        'TRANS_ENTRADA, '
      
        '  :NEW_FLUXO_FATURAMENTO, :NEW_FLUXO_FATURAMENTO_NOTAS, :NEW_FLU' +
        'XO_FATURAMENTO_VENDAS, '
      
        '  :NEW_FLUXO_TRANS, :NEW_FLUXO_SANGRIA_SUPRIMETOS, :NEW_FLUXO_SA' +
        'NGRIA, '
      '  :NEW_FLUXO_SUPRIMENTOS)')
    ModifySQL.Strings = (
      'UPDATE CAIXA'
      
        'SET COD_CAI = :NEW_COD_CAI, COD_EMP = :NEW_COD_EMP, TAMANHO_DESC' +
        '_CUPOM = :NEW_TAMANHO_DESC_CUPOM, '
      
        '  PORTA_IMP = :NEW_PORTA_IMP, DESC_CAI = :NEW_DESC_CAI, INDICE_G' +
        'AVETA = :NEW_INDICE_GAVETA, '
      
        '  INDICE_BALANCA = :NEW_INDICE_BALANCA, PORTA_BALANCA = :NEW_POR' +
        'TA_BALANCA, '
      
        '  BAUD_BALANCA = :NEW_BAUD_BALANCA, CASAS_DECIMAIS = :NEW_CASAS_' +
        'DECIMAIS, '
      '  CASAS_DECIMAIS_UNITARIO = :NEW_CASAS_DECIMAIS_UNITARIO, '
      
        '  TRUNCAR_CAI = :NEW_TRUNCAR_CAI, IMPRIMIR_COMPROVANTE_ECF = :NE' +
        'W_IMPRIMIR_COMPROVANTE_ECF, '
      
        '  ECF_MFD = :NEW_ECF_MFD, IP_SERVIDOR_TEF = :NEW_IP_SERVIDOR_TEF' +
        ', '
      
        '  ID_LOJA_TEF = :NEW_ID_LOJA_TEF, ID_TERMINAL_TEF = :NEW_ID_TERM' +
        'INAL_TEF, '
      '  TEF_CAI = :NEW_TEF_CAI, CAMINHO_BANCO = :NEW_CAMINHO_BANCO, '
      
        '  EXPORTAR_DADOS = :NEW_EXPORTAR_DADOS, R01_MF_ADICIONAL = :NEW_' +
        'R01_MF_ADICIONAL, '
      
        '  R01_TIPO_ECF = :NEW_R01_TIPO_ECF, R01_MARCA_ECF = :NEW_R01_MAR' +
        'CA_ECF, '
      
        '  R01_MODELO_ECF = :NEW_R01_MODELO_ECF, R01_VERSAO_SB = :NEW_R01' +
        '_VERSAO_SB, '
      
        '  R01_CNPJ_USUARIO = :NEW_R01_CNPJ_USUARIO, R01_IE_USUARIO = :NE' +
        'W_R01_IE_USUARIO, '
      
        '  R01_NUMERO_SERIE = :NEW_R01_NUMERO_SERIE, LINHA1 = :NEW_LINHA1' +
        ', '
      
        '  LINHA2 = :NEW_LINHA2, LINHA3 = :NEW_LINHA3, INDICE_GER_OS = :N' +
        'EW_INDICE_GER_OS, '
      
        '  INDICE_GER_ORCAMENTO = :NEW_INDICE_GER_ORCAMENTO, INDICE_GER_M' +
        'ESA = :NEW_INDICE_GER_MESA, '
      
        '  R01_NUMERO_USUARIO = :NEW_R01_NUMERO_USUARIO, CODIGO_NACIONAL_' +
        'IDENTIFICACAO = :NEW_CODIGO_NACIONAL_IDENTIFICACAO, '
      
        '  R01_DATAHORA_SB = :NEW_R01_DATAHORA_SB, INTERVALO_RECEBE = :NE' +
        'W_INTERVALO_RECEBE, '
      
        '  INTERVALO_TRANSMITE = :NEW_INTERVALO_TRANSMITE, DIAS_ATUALIZAC' +
        'AO_PAF = :NEW_DIAS_ATUALIZACAO_PAF, '
      '  CORTA_PAPEL = :NEW_CORTA_PAPEL, NFCE_SERIE = :NEW_NFCE_SERIE, '
      '  NFCE_NUMERO = :NEW_NFCE_NUMERO, FLUXO_TIPO = :NEW_FLUXO_TIPO, '
      
        '  FLUXO_MOVCX_PAG = :NEW_FLUXO_MOVCX_PAG, FLUXO_MOVCX_PAG_HIST =' +
        ' :NEW_FLUXO_MOVCX_PAG_HIST, '
      
        '  FLUXO_MOVCX_JUROS_HIST = :NEW_FLUXO_MOVCX_JUROS_HIST, FLUXO_MO' +
        'VCX_DESC_HIST = :NEW_FLUXO_MOVCX_DESC_HIST, '
      
        '  FLUXO_RECEBIMENTO = :NEW_FLUXO_RECEBIMENTO, FLUXO_RECEBIMENTO_' +
        'HIST = :NEW_FLUXO_RECEBIMENTO_HIST, '
      
        '  FLUXO_RECEBIMENTO_DESC = :NEW_FLUXO_RECEBIMENTO_DESC, FLUXO_RE' +
        'CEBIMENTO_JUROS = :NEW_FLUXO_RECEBIMENTO_JUROS, '
      
        '  FLUXO_SALTO_ANTERIOR = :NEW_FLUXO_SALTO_ANTERIOR, FLUXO_TRANS_' +
        'SAIDA = :NEW_FLUXO_TRANS_SAIDA, '
      
        '  FLUXO_TRANS_ENTRADA = :NEW_FLUXO_TRANS_ENTRADA, FLUXO_FATURAME' +
        'NTO = :NEW_FLUXO_FATURAMENTO, '
      '  FLUXO_FATURAMENTO_NOTAS = :NEW_FLUXO_FATURAMENTO_NOTAS, '
      '  FLUXO_FATURAMENTO_VENDAS = :NEW_FLUXO_FATURAMENTO_VENDAS, '
      
        '  FLUXO_TRANS = :NEW_FLUXO_TRANS, FLUXO_SANGRIA_SUPRIMETOS = :NE' +
        'W_FLUXO_SANGRIA_SUPRIMETOS, '
      
        '  FLUXO_SANGRIA = :NEW_FLUXO_SANGRIA, FLUXO_SUPRIMENTOS = :NEW_F' +
        'LUXO_SUPRIMENTOS'
      'WHERE COD_CAI = :OLD_COD_CAI AND COD_EMP = :OLD_COD_EMP')
    DeleteSQL.Strings = (
      'DELETE FROM CAIXA'
      'WHERE COD_CAI = :OLD_COD_CAI AND COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      
        'SELECT COD_CAI, COD_EMP, TAMANHO_DESC_CUPOM, PORTA_IMP, DESC_CAI' +
        ', INDICE_GAVETA, '
      '  INDICE_BALANCA, PORTA_BALANCA, BAUD_BALANCA, CASAS_DECIMAIS, '
      
        '  CASAS_DECIMAIS_UNITARIO, TRUNCAR_CAI, IMPRIMIR_COMPROVANTE_ECF' +
        ', '
      '  ECF_MFD, IP_SERVIDOR_TEF, ID_LOJA_TEF, ID_TERMINAL_TEF, '
      '  TEF_CAI, CAMINHO_BANCO, EXPORTAR_DADOS, R01_MF_ADICIONAL, '
      '  R01_TIPO_ECF, R01_MARCA_ECF, R01_MODELO_ECF, R01_VERSAO_SB, '
      '  R01_CNPJ_USUARIO, R01_IE_USUARIO, R01_NUMERO_SERIE, LINHA1, '
      
        '  LINHA2, LINHA3, INDICE_GER_OS, INDICE_GER_ORCAMENTO, INDICE_GE' +
        'R_MESA, '
      
        '  R01_NUMERO_USUARIO, CODIGO_NACIONAL_IDENTIFICACAO, R01_DATAHOR' +
        'A_SB, '
      '  INTERVALO_RECEBE, INTERVALO_TRANSMITE, DIAS_ATUALIZACAO_PAF, '
      
        '  CORTA_PAPEL, NFCE_SERIE, NFCE_NUMERO, FLUXO_TIPO, FLUXO_MOVCX_' +
        'PAG, '
      
        '  FLUXO_MOVCX_PAG_HIST, FLUXO_MOVCX_JUROS_HIST, FLUXO_MOVCX_DESC' +
        '_HIST, '
      
        '  FLUXO_RECEBIMENTO, FLUXO_RECEBIMENTO_HIST, FLUXO_RECEBIMENTO_D' +
        'ESC, '
      
        '  FLUXO_RECEBIMENTO_JUROS, FLUXO_SALTO_ANTERIOR, FLUXO_TRANS_SAI' +
        'DA, '
      
        '  FLUXO_TRANS_ENTRADA, FLUXO_FATURAMENTO, FLUXO_FATURAMENTO_NOTA' +
        'S, '
      
        '  FLUXO_FATURAMENTO_VENDAS, FLUXO_TRANS, FLUXO_SANGRIA_SUPRIMETO' +
        'S, '
      '  FLUXO_SANGRIA, FLUXO_SUPRIMENTOS'
      'FROM CAIXA'
      'WHERE COD_CAI = :COD_CAI AND COD_EMP = :COD_EMP')
    Left = 536
    Top = 72
  end
  object QIndicesAliq: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upIndicesAliq
    SQL.Strings = (
      'select I.*, G.nome_grp, G.aliquota_grp from INDICE_ECF I'
      'inner join grupo_icms G'
      'on( G.cod_grp = I.cod_grp )'
      'where I.cod_emp=:COD_EMP and i.cod_cai=:COD_CAI')
    Left = 592
    Top = 64
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_CAI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QIndicesAliqCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesAliqCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesAliqCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'COD_GRP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesAliqINDICE_ECF: TStringField
      FieldName = 'INDICE_ECF'
      Origin = 'INDICE_ECF'
      Required = True
      Size = 5
    end
    object QIndicesAliqINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'INDICE_R03'
      Required = True
      Size = 10
    end
    object QIndicesAliqNOME_GRP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_GRP'
      Origin = 'NOME_GRP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QIndicesAliqALIQUOTA_GRP: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_GRP'
      Origin = 'ALIQUOTA_GRP'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object upIndicesAliq: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO INDICE_ECF'
      '(COD_CAI, COD_EMP, COD_GRP, INDICE_ECF, INDICE_R03)'
      
        'VALUES (:NEW_COD_CAI, :NEW_COD_EMP, :NEW_COD_GRP, :NEW_INDICE_EC' +
        'F, :NEW_INDICE_R03)')
    ModifySQL.Strings = (
      'UPDATE INDICE_ECF'
      
        'SET COD_CAI = :NEW_COD_CAI, COD_EMP = :NEW_COD_EMP, COD_GRP = :N' +
        'EW_COD_GRP, '
      '  INDICE_ECF = :NEW_INDICE_ECF, INDICE_R03 = :NEW_INDICE_R03'
      
        'WHERE COD_CAI = :OLD_COD_CAI AND COD_EMP = :OLD_COD_EMP AND COD_' +
        'GRP = :OLD_COD_GRP')
    DeleteSQL.Strings = (
      'DELETE FROM INDICE_ECF'
      
        'WHERE COD_CAI = :OLD_COD_CAI AND COD_EMP = :OLD_COD_EMP AND COD_' +
        'GRP = :OLD_COD_GRP')
    FetchRowSQL.Strings = (
      'select I.*, G.nome_grp, G.aliquota_grp from INDICE_ECF I'
      'inner join grupo_icms G'
      'on( G.cod_grp = I.cod_grp )'
      
        'WHERE I.COD_CAI = :COD_CAI AND I.COD_EMP = :COD_EMP AND I.COD_GR' +
        'P = :COD_GRP')
    Left = 656
    Top = 64
  end
  object dsInicesAliq: TDataSource
    DataSet = QIndicesAliq
    Left = 712
    Top = 64
  end
  object QIndicesFormas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upIndicesFormas
    SQL.Strings = (
      'select I.*, f.descricao from indice_forma_pagamento I'
      'inner join formas_pagamento F'
      'on( F.codigo = i.cod_forma )'
      'where i.cod_emp=:COD_EMP'
      'and i.cod_caixa=:COD_CAI')
    Left = 440
    Top = 232
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_CAI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QIndicesFormasCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = 'COD_CAIXA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesFormasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesFormasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Origin = 'COD_FORMA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QIndicesFormasINDICE: TStringField
      FieldName = 'INDICE'
      Origin = 'INDICE'
      Required = True
    end
    object QIndicesFormasDESCRICAO_ECF: TStringField
      FieldName = 'DESCRICAO_ECF'
      Origin = 'DESCRICAO_ECF'
      Required = True
    end
    object QIndicesFormasDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object upIndicesFormas: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO INDICE_FORMA_PAGAMENTO'
      '(COD_CAIXA, COD_EMP, COD_FORMA, INDICE, DESCRICAO_ECF)'
      
        'VALUES (:NEW_COD_CAIXA, :NEW_COD_EMP, :NEW_COD_FORMA, :NEW_INDIC' +
        'E, :NEW_DESCRICAO_ECF)')
    ModifySQL.Strings = (
      'UPDATE INDICE_FORMA_PAGAMENTO'
      
        'SET COD_CAIXA = :NEW_COD_CAIXA, COD_EMP = :NEW_COD_EMP, COD_FORM' +
        'A = :NEW_COD_FORMA, '
      '  INDICE = :NEW_INDICE, DESCRICAO_ECF = :NEW_DESCRICAO_ECF'
      
        'WHERE COD_CAIXA = :OLD_COD_CAIXA AND COD_EMP = :OLD_COD_EMP AND ' +
        'COD_FORMA = :OLD_COD_FORMA')
    DeleteSQL.Strings = (
      'DELETE FROM INDICE_FORMA_PAGAMENTO'
      
        'WHERE COD_CAIXA = :OLD_COD_CAIXA AND COD_EMP = :OLD_COD_EMP AND ' +
        'COD_FORMA = :OLD_COD_FORMA')
    FetchRowSQL.Strings = (
      'select I.*, f.descricao from indice_forma_pagamento I'
      'inner join formas_pagamento F'
      'on( F.codigo = i.cod_forma )'
      
        'WHERE I.COD_CAIXA = :COD_CAIXA AND I.COD_EMP = :COD_EMP AND I.CO' +
        'D_FORMA = :COD_FORMA')
    Left = 616
    Top = 168
  end
  object dsIndicesFormas: TDataSource
    DataSet = QIndicesFormas
    Left = 664
    Top = 184
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
  object QCaixa_Usuarios: TFDQuery
    AfterInsert = QCaixa_UsuariosAfterInsert
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upCaixa_Usuarios
    SQL.Strings = (
      'select C.*, U.NOME_USU from CAIXA_USUARIOS C'
      'inner join USUARIO U'
      'on( U.COD_USU = C.COD_USU )'
      'WHERE C.COD_EMP=:COD_EMP'
      'AND C.COD_CAI=:COD_CAI')
    Left = 440
    Top = 288
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_CAI'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QCaixa_UsuariosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixa_UsuariosCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'COD_CAI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixa_UsuariosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixa_UsuariosNOME_USU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object upCaixa_Usuarios: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO CAIXA_USUARIOS'
      '(COD_EMP, COD_CAI, COD_USU)'
      'VALUES (:NEW_COD_EMP, :NEW_COD_CAI, :NEW_COD_USU)')
    ModifySQL.Strings = (
      'UPDATE CAIXA_USUARIOS'
      
        'SET COD_EMP = :NEW_COD_EMP, COD_CAI = :NEW_COD_CAI, COD_USU = :N' +
        'EW_COD_USU'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND COD_CAI = :OLD_COD_CAI AND COD_' +
        'USU = :OLD_COD_USU')
    DeleteSQL.Strings = (
      'DELETE FROM CAIXA_USUARIOS'
      
        'WHERE COD_EMP = :OLD_COD_EMP AND COD_CAI = :OLD_COD_CAI AND COD_' +
        'USU = :OLD_COD_USU')
    FetchRowSQL.Strings = (
      'select C.*, U.NOME_USU from CAIXA_USUARIOS C'
      'inner join USUARIO U'
      'on( U.COD_USU = C.COD_USU )'
      
        'WHERE C.COD_EMP = :COD_EMP AND C.COD_CAI = :COD_CAI AND C.COD_US' +
        'U = :COD_USU')
    Left = 520
    Top = 288
  end
  object dsCaixa_Usuarios: TDataSource
    DataSet = QCaixa_Usuarios
    Left = 608
    Top = 280
  end
  object QUsuarios: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 440
    Top = 160
    object QUsuariosCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'COD_USU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QUsuariosNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'NOME_USU'
      Required = True
      Size = 10
    end
    object QUsuariosSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Origin = 'SENHA_USU'
      Required = True
      Size = 6
    end
    object QUsuariosCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
      Required = True
    end
    object QUsuariosOPERADOR_CAIXA: TStringField
      FieldName = 'OPERADOR_CAIXA'
      Origin = 'OPERADOR_CAIXA'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsUsuarios: TDataSource
    DataSet = QUsuarios
    Left = 576
    Top = 160
  end
end
