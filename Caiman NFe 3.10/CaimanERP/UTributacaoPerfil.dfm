inherited frmCadTributacaoPerfil: TfrmCadTributacaoPerfil
  Caption = 'Tributa'#231#245'es Perfil por NCM'
  ClientHeight = 504
  ExplicitTop = 3
  ExplicitWidth = 900
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlGeral: TPanel
    Height = 441
    ExplicitHeight = 441
    inherited cxPaginas: TcxPageControl
      Height = 441
      Properties.ActivePage = PageEdit
      ExplicitHeight = 441
      ClientRectBottom = 439
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 880
        ExplicitHeight = 409
        inherited cxVisualiza: TcxGrid
          Height = 362
          ExplicitHeight = 362
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            OptionsView.ColumnAutoWidth = True
            object cxVisualizaDBTableView1COD_PERFIL: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_PERFIL'
            end
            object cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 200
            end
            object cxVisualizaDBTableView1ORIGEM_PROD: TcxGridDBColumn
              Caption = 'Origem'
              DataBinding.FieldName = 'ORIGEM_PROD'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              OnGetDataText = cxVisualizaDBTableView1ORIGEM_PRODGetDataText
            end
            object cxVisualizaDBTableView1INCIDE_PISCOFINS: TcxGridDBColumn
              Caption = ' Inside Pis Cofins '
              DataBinding.FieldName = 'INCIDE_PISCOFINS'
              Width = 60
            end
            object cxVisualizaDBTableView1COD_NAO_INSIDENTE: TcxGridDBColumn
              Caption = 'Cod Pis Cofins N Inc.'
              DataBinding.FieldName = 'COD_NAO_INSIDENTE'
              Width = 100
            end
          end
          object cxVisualizaDBTableView2: TcxGridDBTableView [1]
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxVisualizaDBTableView3: TcxGridDBTableView [2]
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsPrincipal
            DataController.DetailKeyFieldNames = 'COD_PERFIL'
            DataController.KeyFieldNames = 'COD_PERFIL'
            DataController.MasterKeyFieldNames = 'COD_PERFIL'
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
            OptionsView.HeaderAutoHeight = True
            Styles.Content = cxstylPadrao
            Styles.ContentOdd = cxstylOdd
            Styles.Header = cxstylHeader2
            Styles.OnGetHeaderStyle = cxVisualizaDBTableView1StylesGetHeaderStyle
            OnColumnHeaderClick = cxVisualizaDBTableView1ColumnHeaderClick
            object cxVisualizaDBTableView3DENTRO_CONT_CFOP: TcxGridDBColumn
              Caption = 'CFOP Dentro Cont.'
              DataBinding.FieldName = 'DENTRO_CONT_CFOP'
            end
            object cxVisualizaDBTableView3DENTRO_CONT_CST_IPI: TcxGridDBColumn
              Caption = 'CST IPI Dentro Cont.'
              DataBinding.FieldName = 'DENTRO_CONT_CST_IPI'
            end
            object cxVisualizaDBTableView3DENTRO_CONT_IPI: TcxGridDBColumn
              Caption = 'IPI  Dentro Cont.'
              DataBinding.FieldName = 'DENTRO_CONT_IPI'
            end
            object cxVisualizaDBTableView3DENTRO_NCONT_CFOP: TcxGridDBColumn
              Caption = 'CFOP  Dentro N. Cont.'
              DataBinding.FieldName = 'DENTRO_NCONT_CFOP'
            end
            object cxVisualizaDBTableView3DENTRO_NCONT_CST_IPI: TcxGridDBColumn
              Caption = 'CST IPI Dentro N. Cont.'
              DataBinding.FieldName = 'DENTRO_NCONT_CST_IPI'
            end
            object cxVisualizaDBTableView3DENTRO_NCONT_IPI: TcxGridDBColumn
              Caption = 'IPI Dentro N. Cont.'
              DataBinding.FieldName = 'DENTRO_NCONT_IPI'
            end
            object cxVisualizaDBTableView3FORA_CONT_CFOP: TcxGridDBColumn
              Caption = 'CFOP Fora Cont.'
              DataBinding.FieldName = 'FORA_CONT_CFOP'
            end
            object cxVisualizaDBTableView3FORA_CONT_CST_IPI: TcxGridDBColumn
              Caption = 'CST IPI Fora Cont.'
              DataBinding.FieldName = 'FORA_CONT_CST_IPI'
            end
            object cxVisualizaDBTableView3FORA_CONT_IPI: TcxGridDBColumn
              Caption = 'IPI Fora Cont.'
              DataBinding.FieldName = 'FORA_CONT_IPI'
            end
            object cxVisualizaDBTableView3FORA_NCONT_CFOP: TcxGridDBColumn
              Caption = 'CFOP Fora N. Cont.'
              DataBinding.FieldName = 'FORA_NCONT_CFOP'
            end
            object cxVisualizaDBTableView3FORA_NCONT_CST_IPI: TcxGridDBColumn
              Caption = 'CST IPI  Fora N. Cont.'
              DataBinding.FieldName = 'FORA_NCONT_CST_IPI'
            end
            object cxVisualizaDBTableView3FORA_NCONT_IPI: TcxGridDBColumn
              Caption = 'IPI Fora N. Cont.'
              DataBinding.FieldName = 'FORA_NCONT_IPI'
            end
            object cxVisualizaDBTableView3ISENTO_PISCOFINS: TcxGridDBColumn
              Caption = 'Isento Pis Cofins'
              DataBinding.FieldName = 'ISENTO_PISCOFINS'
            end
            object cxVisualizaDBTableView3CST_PIS: TcxGridDBColumn
              Caption = 'CST PIS'
              DataBinding.FieldName = 'CST_PIS'
            end
            object cxVisualizaDBTableView3PIS: TcxGridDBColumn
              DataBinding.FieldName = 'PIS'
            end
            object cxVisualizaDBTableView3CST_COFINS: TcxGridDBColumn
              Caption = 'CST COFINS'
              DataBinding.FieldName = 'CST_COFINS'
            end
            object cxVisualizaDBTableView3COFINS: TcxGridDBColumn
              DataBinding.FieldName = 'COFINS'
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
        OnShow = cxTabSheet2Show
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 880
        ExplicitHeight = 409
        object cxPaginas2: TcxPageControl
          Left = 0
          Top = 147
          Width = 880
          Height = 262
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxTabSheet3
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 260
          ClientRectLeft = 2
          ClientRectRight = 878
          ClientRectTop = 30
          object cxTabSheet3: TcxTabSheet
            Caption = 'NCMs'
            ImageIndex = 0
            OnShow = cxTabSheet3Show
            object cxGridNCM: TcxGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 870
              Height = 183
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailFrameColor = clNone
              object cxGridNCMView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsNcm
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
                Styles.OnGetHeaderStyle = cxVisualizaDBTableView1StylesGetHeaderStyle
                OnColumnHeaderClick = cxVisualizaDBTableView1ColumnHeaderClick
                object cxGridNCMView1NCM: TcxGridDBColumn
                  Caption = 'NCMs Associados ao Perfil'
                  DataBinding.FieldName = 'NCM'
                  Width = 400
                end
                object cxGridNCMView1Column1: TcxGridDBColumn
                  DataBinding.FieldName = 'EX'
                  Options.Editing = False
                end
                object cxGridNCMView1DESCRICAO: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o do NCM'
                  DataBinding.FieldName = 'DESCRICAO'
                  Options.Editing = False
                end
              end
              object cxGridNCMLevel1: TcxGridLevel
                GridView = cxGridNCMView1
              end
            end
            object pnlBootonNCm: TPanel
              Left = 0
              Top = 189
              Width = 876
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
                DataSource = dsNcm
                ConfirmDelete = False
                VisibleButtons = [nbInsert, nbDelete]
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
          object cxTabSheet4: TcxTabSheet
            Caption = 'Estados'
            ImageIndex = 1
            OnShow = cxTabSheet4Show
            object cxEstados: TcxGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 870
              Height = 183
              Align = alClient
              TabOrder = 0
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailFrameColor = clNone
              object cxEstadosView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsEstados
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Appending = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Content = cxstylPadrao
                Styles.ContentOdd = cxstylOdd
                Styles.Inactive = cxstylInactive
                Styles.Header = cxstylHeader
                Styles.OnGetHeaderStyle = cxVisualizaDBTableView1StylesGetHeaderStyle
                OnColumnHeaderClick = cxVisualizaDBTableView1ColumnHeaderClick
                object cxEstadosView1UF: TcxGridDBColumn
                  DataBinding.FieldName = 'UF'
                  PropertiesClassName = 'TcxComboBoxProperties'
                  Properties.DropDownListStyle = lsFixedList
                  Properties.DropDownWidth = 100
                  Properties.Items.Strings = (
                    'AC'
                    'AL'
                    'AM'
                    'AP'
                    'BA'
                    'CE'
                    'DF'
                    'ES'
                    'GO'
                    'MA'
                    'MG'
                    'MS'
                    'MT'
                    'PA'
                    'PB'
                    'PE'
                    'PI'
                    'PR'
                    'RJ'
                    'RN'
                    'RO'
                    'RR'
                    'RS'
                    'SC'
                    'SE'
                    'SP'
                    'TO')
                end
                object cxEstadosView1ICMS_ENTRADA: TcxGridDBColumn
                  Caption = 'ICMS Ent.'
                  DataBinding.FieldName = 'ICMS_ENTRADA'
                  PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                  Properties.DropDownAutoSize = True
                  Properties.DropDownSizeable = True
                  Properties.DropDownWidth = 600
                  Properties.GridMode = True
                  Properties.View = cxEstadosICMSView
                  Properties.KeyFieldNames = 'COD_ICMS'
                  Properties.ListFieldItem = cxEstadosICMSViewDESCRICAO
                end
                object cxEstadosView1ENTRADA: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o ICMS Ent.'
                  DataBinding.FieldName = 'ENTRADA'
                  Visible = False
                  Options.Editing = False
                  Width = 250
                end
                object cxEstadosView1ICMS_SAIDA: TcxGridDBColumn
                  Caption = 'ICMS Saida'
                  DataBinding.FieldName = 'ICMS_SAIDA'
                  PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                  Properties.DropDownAutoSize = True
                  Properties.DropDownSizeable = True
                  Properties.DropDownWidth = 600
                  Properties.GridMode = True
                  Properties.View = cxEstadosICMSView
                  Properties.KeyFieldNames = 'COD_ICMS'
                  Properties.ListFieldItem = cxEstadosICMSViewDESCRICAO
                end
                object cxEstadosView1SAIDA: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o ICMS Saida'
                  DataBinding.FieldName = 'SAIDA'
                  Visible = False
                  Options.Editing = False
                  Width = 250
                end
              end
              object cxEstadosICMSView: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataModeController.GridMode = True
                DataController.DataSource = dsICMS
                DataController.KeyFieldNames = 'COD_ICMS'
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
                object cxEstadosICMSViewCOD_ICMS: TcxGridDBColumn
                  Caption = 'C'#243'd'
                  DataBinding.FieldName = 'COD_ICMS'
                end
                object cxEstadosICMSViewDESCRICAO: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'DESCRICAO'
                  Width = 250
                end
                object cxEstadosICMSViewCST: TcxGridDBColumn
                  DataBinding.FieldName = 'CST'
                end
                object cxEstadosICMSViewICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'ICMS'
                end
                object cxEstadosICMSViewREDUCAO: TcxGridDBColumn
                  DataBinding.FieldName = 'REDUCAO'
                end
                object cxEstadosICMSViewDIF: TcxGridDBColumn
                  Caption = 'DIFERIDO'
                  DataBinding.FieldName = 'DIF'
                end
                object cxEstadosICMSViewMVA: TcxGridDBColumn
                  DataBinding.FieldName = 'MVA'
                end
              end
              object cxEstadosLevel1: TcxGridLevel
                GridView = cxEstadosView1
              end
            end
            object pnlEstados: TPanel
              Left = 0
              Top = 189
              Width = 876
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object RzDBNavigator2: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsEstados
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
          object cxTabSheet5: TcxTabSheet
            Caption = 'Saidas'
            ImageIndex = 2
            OnShow = cxTabSheet5Show
            object cxPageControl1: TcxPageControl
              Left = 0
              Top = 0
              Width = 876
              Height = 230
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxTabSheet1
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 228
              ClientRectLeft = 2
              ClientRectRight = 874
              ClientRectTop = 30
              object cxTabSheet1: TcxTabSheet
                Caption = 'Dentro do Estado'
                ImageIndex = 0
                object grpDSCont: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 866
                  Height = 94
                  Align = alTop
                  Caption = ' Contribuintes '
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel3: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox1: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'DENTRO_CONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox1PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel8: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpDENTRO_CONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 75
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'DENTRO_CONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '50 - Tributada'
                        '51 - Trib. com Al'#237'q. Zero'
                        '52 - Isenta'
                        '53 - N'#227'o-Tributada'
                        '54 - Imune'
                        '55 - Suspens'#227'o'
                        '99 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '50'
                        '51'
                        '52'
                        '53'
                        '54'
                        '55'
                        '99')
                    end
                  end
                  object Panel10: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel5: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtDENTRO_CONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'DENTRO_CONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox1: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 103
                  Width = 866
                  Height = 90
                  Align = alTop
                  Caption = ' N'#227'o Contribuintes '
                  TabOrder = 1
                  object Panel7: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel4: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox2: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'DENTRO_NCONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox2PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel9: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpDENTRO_NCONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 71
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'DENTRO_NCONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '50 - Tributada'
                        '51 - Trib. com Al'#237'q. Zero'
                        '52 - Isenta'
                        '53 - N'#227'o-Tributada'
                        '54 - Imune'
                        '55 - Suspens'#227'o'
                        '99 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '50'
                        '51'
                        '52'
                        '53'
                        '54'
                        '55'
                        '99')
                    end
                  end
                  object Panel11: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel6: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtDENTRO_NCONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'DENTRO_NCONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
              end
              object cxTabSheet2: TcxTabSheet
                Caption = 'Fora do Estado'
                ImageIndex = 1
                object GroupBox2: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 866
                  Height = 94
                  Align = alTop
                  Caption = ' Contribuintes '
                  TabOrder = 0
                  object Panel12: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel7: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox3: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'FORA_CONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox3PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel13: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpFORA_CONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 75
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'FORA_CONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '50 - Tributada'
                        '51 - Trib. com Al'#237'q. Zero'
                        '52 - Isenta'
                        '53 - N'#227'o-Tributada'
                        '54 - Imune'
                        '55 - Suspens'#227'o'
                        '99 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '50'
                        '51'
                        '52'
                        '53'
                        '54'
                        '55'
                        '99')
                    end
                  end
                  object Panel14: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel8: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtFORA_CONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'FORA_CONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox3: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 103
                  Width = 866
                  Height = 90
                  Align = alTop
                  Caption = ' N'#227'o Contribuintes '
                  TabOrder = 1
                  object Panel15: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel9: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox4: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'FORA_NCONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox4PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel16: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpFORA_NCONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 71
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'FORA_NCONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '50 - Tributada'
                        '51 - Trib. com Al'#237'q. Zero'
                        '52 - Isenta'
                        '53 - N'#227'o-Tributada'
                        '54 - Imune'
                        '55 - Suspens'#227'o'
                        '99 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '50'
                        '51'
                        '52'
                        '53'
                        '54'
                        '55'
                        '99')
                    end
                  end
                  object Panel17: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel10: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtFORA_NCONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'FORA_NCONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
              end
              object cxTabSheet9: TcxTabSheet
                Caption = 'Pis/Cofins'
                ImageIndex = 2
                object Panel30: TPanel
                  Left = 0
                  Top = 0
                  Width = 872
                  Height = 33
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object dbchkISENTO_PISCOFINS: TDBCheckBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 149
                    Height = 27
                    Align = alLeft
                    Caption = 'Isento de Pis Cofins'
                    DataField = 'ISENTO_PISCOFINS'
                    DataSource = dsPrincipal
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object Panel31: TPanel
                  Left = 0
                  Top = 33
                  Width = 872
                  Height = 55
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object cxLabel19: TcxLabel
                    Left = 3
                    Top = 2
                    Caption = 'CST PIS :'
                    Transparent = True
                  end
                  object JvDBComboBox1: TJvDBComboBox
                    Left = 6
                    Top = 23
                    Width = 406
                    Height = 23
                    DataField = 'CST_PIS'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                      '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                      
                        '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                        'roduto'
                      '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                      '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                      '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                      '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                      '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                      '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                      '49 - Outras Opera'#231#245'es de Sa'#237'da'
                      
                        '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                        ' Receita Tributada no Mercado Interno'
                      
                        '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
                        ' Receita N'#227'o Tributada no Mercado Interno'
                      
                        '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                        ' Receita de Exporta'#231#227'o'
                      
                        '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas e N'#227'o-Tributadas no Mercado Interno'
                      
                        '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                        'ributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                      '99 - Outras Opera'#231#245'es')
                    TabOrder = 1
                    Values.Strings = (
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08'
                      '09'
                      '49'
                      '50'
                      '51'
                      '52'
                      '53'
                      '54'
                      '55'
                      '56'
                      '99')
                    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                    ListSettings.OutfilteredValueFont.Color = clRed
                    ListSettings.OutfilteredValueFont.Height = -11
                    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                    ListSettings.OutfilteredValueFont.Style = []
                  end
                  object cxLabel20: TcxLabel
                    Left = 430
                    Top = 2
                    Caption = 'Aliquota PIS :'
                    Transparent = True
                  end
                  object dbedtPIS: TDBEdit
                    Left = 430
                    Top = 23
                    Width = 121
                    Height = 23
                    DataField = 'PIS'
                    DataSource = dsPrincipal
                    TabOrder = 3
                  end
                end
                object Panel32: TPanel
                  Left = 0
                  Top = 88
                  Width = 872
                  Height = 55
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object cxLabel21: TcxLabel
                    Left = 3
                    Top = 2
                    Caption = 'CST COFINS :'
                    Transparent = True
                  end
                  object JvDBComboBox2: TJvDBComboBox
                    Left = 6
                    Top = 23
                    Width = 406
                    Height = 23
                    DataField = 'CST_COFINS'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                      '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                      
                        '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                        'roduto'
                      '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                      '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                      '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                      '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                      '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                      '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                      '49 - Outras Opera'#231#245'es de Sa'#237'da'
                      
                        '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                        ' Receita Tributada no Mercado Interno'
                      
                        '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
                        ' Receita N'#227'o Tributada no Mercado Interno'
                      
                        '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                        ' Receita de Exporta'#231#227'o'
                      
                        '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas e N'#227'o-Tributadas no Mercado Interno'
                      
                        '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                        'ributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                        'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                      '99 - Outras Opera'#231#245'es')
                    TabOrder = 1
                    Values.Strings = (
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08'
                      '09'
                      '49'
                      '50'
                      '51'
                      '52'
                      '53'
                      '54'
                      '55'
                      '56'
                      '99')
                    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                    ListSettings.OutfilteredValueFont.Color = clRed
                    ListSettings.OutfilteredValueFont.Height = -11
                    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                    ListSettings.OutfilteredValueFont.Style = []
                  end
                  object cxLabel22: TcxLabel
                    Left = 430
                    Top = 2
                    Caption = 'Aliquota COFINS :'
                    Transparent = True
                  end
                  object dbedtCOFINS: TDBEdit
                    Left = 430
                    Top = 23
                    Width = 121
                    Height = 23
                    DataField = 'COFINS'
                    DataSource = dsPrincipal
                    TabOrder = 3
                  end
                end
              end
            end
          end
          object cxTabSheet6: TcxTabSheet
            Caption = 'Entradas'
            ImageIndex = 3
            OnShow = cxTabSheet6Show
            object cxPageControl2: TcxPageControl
              Left = 0
              Top = 0
              Width = 876
              Height = 230
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxTabSheet7
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 228
              ClientRectLeft = 2
              ClientRectRight = 874
              ClientRectTop = 30
              object cxTabSheet7: TcxTabSheet
                Caption = 'Dentro do Estado'
                ImageIndex = 0
                object GroupBox4: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 866
                  Height = 94
                  Align = alTop
                  Caption = ' Contribuintes '
                  TabOrder = 0
                  object Panel18: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel11: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox5: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'ENT_DENTRO_CONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox5PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel19: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpENT_DENTRO_CONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 75
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'ENT_DENTRO_CONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '00 - Recup. de Cr'#233'd.'
                        '01 - Trib. com Al'#237'q. Zero'
                        '02 - Isenta'
                        '03 - N'#227'o-Tributada'
                        '04 - Imune'
                        '05 - Suspens'#227'o'
                        '49 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '00'
                        '01'
                        '02'
                        '03'
                        '04'
                        '05'
                        '49')
                    end
                  end
                  object Panel20: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel12: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtENT_DENTRO_CONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'ENT_DENTRO_CONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox5: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 103
                  Width = 866
                  Height = 90
                  Align = alTop
                  Caption = ' N'#227'o Contribuintes '
                  TabOrder = 1
                  object Panel21: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel13: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox6: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'ENT_DENTRO_NCONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox6PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel22: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpENT_DENTRO_NCONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 71
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'ENT_DENTRO_NCONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '00 - Recup. de Cr'#233'd.'
                        '01 - Trib. com Al'#237'q. Zero'
                        '02 - Isenta'
                        '03 - N'#227'o-Tributada'
                        '04 - Imune'
                        '05 - Suspens'#227'o'
                        '49 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '00'
                        '01'
                        '02'
                        '03'
                        '04'
                        '05'
                        '49')
                    end
                  end
                  object Panel23: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel14: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtENT_DENTRO_NCONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'ENT_DENTRO_NCONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
              end
              object cxTabSheet8: TcxTabSheet
                Caption = 'Fora do Estado'
                ImageIndex = 1
                object GroupBox6: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 866
                  Height = 94
                  Align = alTop
                  Caption = ' Contribuintes '
                  TabOrder = 0
                  object Panel24: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel15: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox7: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'ENT_FORA_CONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox7PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel25: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpENT_FORA_CONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 75
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'ENT_FORA_CONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '00 - Recup. de Cr'#233'd.'
                        '01 - Trib. com Al'#237'q. Zero'
                        '02 - Isenta'
                        '03 - N'#227'o-Tributada'
                        '04 - Imune'
                        '05 - Suspens'#227'o'
                        '49 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '00'
                        '01'
                        '02'
                        '03'
                        '04'
                        '05'
                        '49')
                    end
                  end
                  object Panel26: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 75
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel16: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtENT_FORA_CONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'ENT_FORA_CONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
                object GroupBox7: TGroupBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 103
                  Width = 866
                  Height = 90
                  Align = alTop
                  Caption = ' N'#227'o Contribuintes '
                  TabOrder = 1
                  object Panel27: TPanel
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 0
                    object cxLabel17: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'CFOP :'
                      Transparent = True
                    end
                    object cxDBLookupComboBox8: TcxDBLookupComboBox
                      Left = 8
                      Top = 25
                      DataBinding.DataField = 'ENT_FORA_NCONT_CFOP'
                      DataBinding.DataSource = dsPrincipal
                      Properties.DropDownAutoSize = True
                      Properties.DropDownSizeable = True
                      Properties.DropDownWidth = 500
                      Properties.GridMode = True
                      Properties.KeyFieldNames = 'COD_CFO'
                      Properties.ListColumns = <
                        item
                          Caption = 'CFOP'
                          Width = 100
                          FieldName = 'COD_CFO'
                        end
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'NOME_CFO'
                        end>
                      Properties.ListSource = dsCFOP
                      Properties.OnPopup = cxDBLookupComboBox8PropertiesPopup
                      TabOrder = 1
                      Width = 129
                    end
                  end
                  object Panel28: TPanel
                    Left = 149
                    Top = 17
                    Width = 460
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 1
                    object dbrgrpENT_FORA_NCONT_CST_IPI: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 460
                      Height = 71
                      Align = alClient
                      Caption = ' CST IPI '
                      Columns = 3
                      DataField = 'ENT_FORA_NCONT_CST_IPI'
                      DataSource = dsPrincipal
                      Items.Strings = (
                        '00 - Recup. de Cr'#233'd.'
                        '01 - Trib. com Al'#237'q. Zero'
                        '02 - Isenta'
                        '03 - N'#227'o-Tributada'
                        '04 - Imune'
                        '05 - Suspens'#227'o'
                        '49 - Outras')
                      TabOrder = 0
                      Values.Strings = (
                        '00'
                        '01'
                        '02'
                        '03'
                        '04'
                        '05'
                        '49')
                    end
                  end
                  object Panel29: TPanel
                    Left = 609
                    Top = 17
                    Width = 147
                    Height = 71
                    Align = alLeft
                    BevelOuter = bvNone
                    TabOrder = 2
                    object cxLabel18: TcxLabel
                      Left = 9
                      Top = 4
                      Caption = 'Aliquota IPI:'
                      Transparent = True
                    end
                    object dbedtENT_FORA_NCONT_IPI: TDBEdit
                      Left = 9
                      Top = 25
                      Width = 121
                      Height = 23
                      DataField = 'ENT_FORA_NCONT_IPI'
                      DataSource = dsPrincipal
                      TabOrder = 1
                    end
                  end
                end
              end
              object cxTabSheet10: TcxTabSheet
                Caption = 'Pis/Cofins'
                ImageIndex = 2
                object Panel33: TPanel
                  Left = 0
                  Top = 0
                  Width = 872
                  Height = 33
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object dbchkENT_ISENTO_PISCOFINS: TDBCheckBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 3
                    Width = 149
                    Height = 27
                    Align = alLeft
                    Caption = 'Isento de Pis Cofins'
                    DataField = 'ENT_ISENTO_PISCOFINS'
                    DataSource = dsPrincipal
                    TabOrder = 0
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                  end
                end
                object Panel34: TPanel
                  Left = 0
                  Top = 33
                  Width = 872
                  Height = 55
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object cxLabel23: TcxLabel
                    Left = 3
                    Top = 2
                    Caption = 'CST PIS :'
                    Transparent = True
                  end
                  object JvDBComboBox3: TJvDBComboBox
                    Left = 6
                    Top = 23
                    Width = 406
                    Height = 23
                    DataField = 'ENT_CST_PIS'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      
                        '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita Tributada no Mercado Interno'
                      
                        '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                      
                        '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita de Exporta'#231#227'o'
                      
                        '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                      
                        '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                        #231#227'o'
                      '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                      '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                      '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                      '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                      '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                      '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                      '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                      '98 - Outras Opera'#231#245'es de Entrada')
                    TabOrder = 1
                    Values.Strings = (
                      '60'
                      '61'
                      '62'
                      '63'
                      '64'
                      '65'
                      '66'
                      '67'
                      '70'
                      '71'
                      '72'
                      '73'
                      '74'
                      '75'
                      '98')
                    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                    ListSettings.OutfilteredValueFont.Color = clRed
                    ListSettings.OutfilteredValueFont.Height = -11
                    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                    ListSettings.OutfilteredValueFont.Style = []
                  end
                  object cxLabel24: TcxLabel
                    Left = 430
                    Top = 2
                    Caption = 'Aliquota PIS :'
                    Transparent = True
                  end
                  object dbedtENT_PIS: TDBEdit
                    Left = 430
                    Top = 23
                    Width = 121
                    Height = 23
                    DataField = 'ENT_PIS'
                    DataSource = dsPrincipal
                    TabOrder = 3
                  end
                end
                object Panel35: TPanel
                  Left = 0
                  Top = 88
                  Width = 872
                  Height = 55
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object cxLabel25: TcxLabel
                    Left = 3
                    Top = 2
                    Caption = 'CST COFINS :'
                    Transparent = True
                  end
                  object JvDBComboBox4: TJvDBComboBox
                    Left = 6
                    Top = 23
                    Width = 406
                    Height = 23
                    DataField = 'ENT_CST_COFINS'
                    DataSource = dsPrincipal
                    Items.Strings = (
                      
                        '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita Tributada no Mercado Interno'
                      
                        '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                      
                        '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                        'vamente a Receita de Exporta'#231#227'o'
                      
                        '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                      
                        '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                      
                        '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                        'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                        #231#227'o'
                      '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                      '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                      '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                      '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                      '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                      '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                      '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                      '98 - Outras Opera'#231#245'es de Entrada')
                    TabOrder = 1
                    Values.Strings = (
                      '60'
                      '61'
                      '62'
                      '63'
                      '64'
                      '65'
                      '66'
                      '67'
                      '70'
                      '71'
                      '72'
                      '73'
                      '74'
                      '75'
                      '98')
                    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                    ListSettings.OutfilteredValueFont.Color = clRed
                    ListSettings.OutfilteredValueFont.Height = -11
                    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                    ListSettings.OutfilteredValueFont.Style = []
                  end
                  object cxLabel26: TcxLabel
                    Left = 430
                    Top = 2
                    Caption = 'Aliquota COFINS :'
                    Transparent = True
                  end
                  object dbedtENT_COFINS: TDBEdit
                    Left = 430
                    Top = 23
                    Width = 121
                    Height = 23
                    DataField = 'ENT_COFINS'
                    DataSource = dsPrincipal
                    TabOrder = 3
                  end
                end
              end
            end
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 880
          Height = 147
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 880
            Height = 46
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object cxLabel1: TcxLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'C'#243'digo     :'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Transparent = True
              AnchorY = 10
            end
            object dbedtCOD_PERFIL: TDBEdit
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 95
              Height = 23
              Margins.Top = 6
              TabStop = False
              CharCase = ecUpperCase
              DataField = 'COD_PERFIL'
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
            Top = 46
            Width = 880
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object cxLabel2: TcxLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Descri'#231#227'o :'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Properties.Alignment.Horz = taLeftJustify
              Properties.Alignment.Vert = taVCenter
              Transparent = True
              AnchorY = 10
            end
            object dbedtDESCRICAO: TDBEdit
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 360
              Height = 23
              Margins.Top = 6
              CharCase = ecUpperCase
              DataField = 'DESCRICAO'
              DataSource = dsPrincipal
              TabOrder = 1
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 94
            Width = 880
            Height = 47
            Align = alTop
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object dbrgrpORIGEM_PROD: TDBRadioGroup
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 185
              Height = 41
              Align = alLeft
              Caption = ' Origem do Produto '
              Columns = 2
              DataField = 'ORIGEM_PROD'
              DataSource = dsPrincipal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Items.Strings = (
                'Nacional'
                'Importado')
              ParentFont = False
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
            end
            object dbrgrpINCIDE_PISCOFINS: TDBRadioGroup
              AlignWithMargins = True
              Left = 194
              Top = 3
              Width = 185
              Height = 41
              Align = alLeft
              Caption = 'Incide Pis/Cofins'
              Columns = 2
              DataField = 'INCIDE_PISCOFINS'
              DataSource = dsPrincipal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Items.Strings = (
                'Sim'
                'N'#227'o')
              ParentFont = False
              TabOrder = 1
              Values.Strings = (
                'S'
                'N')
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 3735944
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxstylHeader2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 16744448
    end
  end
  inherited QPrincipal: TFDQuery
    AfterPost = QPrincipalAfterPost
    UpdateTransaction = TRPrincipal
    UpdateObject = upPrincipal
    SQL.Strings = (
      'SELECT * FROM TRIBUTACAO_PERFIL WHERE COD_EMP=:COD_EMP')
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QPrincipalCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Origin = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object QPrincipalORIGEM_PROD: TIntegerField
      FieldName = 'ORIGEM_PROD'
      Origin = 'ORIGEM_PROD'
    end
    object QPrincipalINCIDE_PISCOFINS: TStringField
      FieldName = 'INCIDE_PISCOFINS'
      Origin = 'INCIDE_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCOD_NAO_INSIDENTE: TIntegerField
      FieldName = 'COD_NAO_INSIDENTE'
      Origin = 'COD_NAO_INSIDENTE'
    end
    object QPrincipalDENTRO_CONT_CFOP: TIntegerField
      FieldName = 'DENTRO_CONT_CFOP'
      Origin = 'DENTRO_CONT_CFOP'
    end
    object QPrincipalDENTRO_CONT_CST_IPI: TStringField
      FieldName = 'DENTRO_CONT_CST_IPI'
      Origin = 'DENTRO_CONT_CST_IPI'
      Size = 2
    end
    object QPrincipalDENTRO_CONT_IPI: TBCDField
      FieldName = 'DENTRO_CONT_IPI'
      Origin = 'DENTRO_CONT_IPI'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalDENTRO_NCONT_CFOP: TIntegerField
      FieldName = 'DENTRO_NCONT_CFOP'
      Origin = 'DENTRO_NCONT_CFOP'
    end
    object QPrincipalDENTRO_NCONT_CST_IPI: TStringField
      FieldName = 'DENTRO_NCONT_CST_IPI'
      Origin = 'DENTRO_NCONT_CST_IPI'
      Size = 2
    end
    object QPrincipalDENTRO_NCONT_IPI: TBCDField
      FieldName = 'DENTRO_NCONT_IPI'
      Origin = 'DENTRO_NCONT_IPI'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalFORA_CONT_CFOP: TIntegerField
      FieldName = 'FORA_CONT_CFOP'
      Origin = 'FORA_CONT_CFOP'
    end
    object QPrincipalFORA_CONT_CST_IPI: TStringField
      FieldName = 'FORA_CONT_CST_IPI'
      Origin = 'FORA_CONT_CST_IPI'
      Size = 2
    end
    object QPrincipalFORA_CONT_IPI: TBCDField
      FieldName = 'FORA_CONT_IPI'
      Origin = 'FORA_CONT_IPI'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalFORA_NCONT_CFOP: TIntegerField
      FieldName = 'FORA_NCONT_CFOP'
      Origin = 'FORA_NCONT_CFOP'
    end
    object QPrincipalFORA_NCONT_CST_IPI: TStringField
      FieldName = 'FORA_NCONT_CST_IPI'
      Origin = 'FORA_NCONT_CST_IPI'
      Size = 2
    end
    object QPrincipalFORA_NCONT_IPI: TBCDField
      FieldName = 'FORA_NCONT_IPI'
      Origin = 'FORA_NCONT_IPI'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalISENTO_PISCOFINS: TStringField
      FieldName = 'ISENTO_PISCOFINS'
      Origin = 'ISENTO_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QPrincipalPIS: TBCDField
      FieldName = 'PIS'
      Origin = 'PIS'
      Precision = 18
      Size = 2
    end
    object QPrincipalCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QPrincipalCOFINS: TBCDField
      FieldName = 'COFINS'
      Origin = 'COFINS'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_DENTRO_CONT_CFOP: TIntegerField
      FieldName = 'ENT_DENTRO_CONT_CFOP'
      Origin = 'ENT_DENTRO_CONT_CFOP'
    end
    object QPrincipalENT_DENTRO_CONT_CST_IPI: TStringField
      FieldName = 'ENT_DENTRO_CONT_CST_IPI'
      Origin = 'ENT_DENTRO_CONT_CST_IPI'
      Size = 2
    end
    object QPrincipalENT_DENTRO_CONT_IPI: TBCDField
      FieldName = 'ENT_DENTRO_CONT_IPI'
      Origin = 'ENT_DENTRO_CONT_IPI'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_DENTRO_NCONT_CFOP: TIntegerField
      FieldName = 'ENT_DENTRO_NCONT_CFOP'
      Origin = 'ENT_DENTRO_NCONT_CFOP'
    end
    object QPrincipalENT_DENTRO_NCONT_CST_IPI: TStringField
      FieldName = 'ENT_DENTRO_NCONT_CST_IPI'
      Origin = 'ENT_DENTRO_NCONT_CST_IPI'
      Size = 2
    end
    object QPrincipalENT_DENTRO_NCONT_IPI: TBCDField
      FieldName = 'ENT_DENTRO_NCONT_IPI'
      Origin = 'ENT_DENTRO_NCONT_IPI'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_FORA_CONT_CFOP: TIntegerField
      FieldName = 'ENT_FORA_CONT_CFOP'
      Origin = 'ENT_FORA_CONT_CFOP'
    end
    object QPrincipalENT_FORA_CONT_CST_IPI: TStringField
      FieldName = 'ENT_FORA_CONT_CST_IPI'
      Origin = 'ENT_FORA_CONT_CST_IPI'
      Size = 2
    end
    object QPrincipalENT_FORA_CONT_IPI: TBCDField
      FieldName = 'ENT_FORA_CONT_IPI'
      Origin = 'ENT_FORA_CONT_IPI'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_FORA_NCONT_CFOP: TIntegerField
      FieldName = 'ENT_FORA_NCONT_CFOP'
      Origin = 'ENT_FORA_NCONT_CFOP'
    end
    object QPrincipalENT_FORA_NCONT_CST_IPI: TStringField
      FieldName = 'ENT_FORA_NCONT_CST_IPI'
      Origin = 'ENT_FORA_NCONT_CST_IPI'
      Size = 2
    end
    object QPrincipalENT_FORA_NCONT_IPI: TBCDField
      FieldName = 'ENT_FORA_NCONT_IPI'
      Origin = 'ENT_FORA_NCONT_IPI'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_ISENTO_PISCOFINS: TStringField
      FieldName = 'ENT_ISENTO_PISCOFINS'
      Origin = 'ENT_ISENTO_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object QPrincipalENT_CST_PIS: TStringField
      FieldName = 'ENT_CST_PIS'
      Origin = 'ENT_CST_PIS'
      Size = 2
    end
    object QPrincipalENT_PIS: TBCDField
      FieldName = 'ENT_PIS'
      Origin = 'ENT_PIS'
      Precision = 18
      Size = 2
    end
    object QPrincipalENT_CST_COFINS: TStringField
      FieldName = 'ENT_CST_COFINS'
      Origin = 'ENT_CST_COFINS'
      Size = 2
    end
    object QPrincipalENT_COFINS: TBCDField
      FieldName = 'ENT_COFINS'
      Origin = 'ENT_COFINS'
      Precision = 18
      Size = 2
    end
  end
  object upPrincipal: TFDUpdateSQL [8]
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO TRIBUTACAO_PERFIL'
      '(COD_PERFIL, COD_EMP, DESCRICAO, ORIGEM_PROD, '
      '  INCIDE_PISCOFINS, COD_NAO_INSIDENTE, DENTRO_CONT_CFOP, '
      '  DENTRO_CONT_CST_IPI, DENTRO_CONT_IPI, DENTRO_NCONT_CFOP, '
      '  DENTRO_NCONT_CST_IPI, DENTRO_NCONT_IPI, FORA_CONT_CFOP, '
      '  FORA_CONT_CST_IPI, FORA_CONT_IPI, FORA_NCONT_CFOP, '
      '  FORA_NCONT_CST_IPI, FORA_NCONT_IPI, ISENTO_PISCOFINS, '
      '  CST_PIS, PIS, CST_COFINS, COFINS, ENT_DENTRO_CONT_CFOP, '
      '  ENT_DENTRO_CONT_CST_IPI, ENT_DENTRO_CONT_IPI, '
      '  ENT_DENTRO_NCONT_CFOP, ENT_DENTRO_NCONT_CST_IPI, '
      
        '  ENT_DENTRO_NCONT_IPI, ENT_FORA_CONT_CFOP, ENT_FORA_CONT_CST_IP' +
        'I, '
      
        '  ENT_FORA_CONT_IPI, ENT_FORA_NCONT_CFOP, ENT_FORA_NCONT_CST_IPI' +
        ', '
      '  ENT_FORA_NCONT_IPI, ENT_ISENTO_PISCOFINS, ENT_CST_PIS, '
      '  ENT_PIS, ENT_CST_COFINS, ENT_COFINS)'
      
        'VALUES (:NEW_COD_PERFIL, :NEW_COD_EMP, :NEW_DESCRICAO, :NEW_ORIG' +
        'EM_PROD, '
      
        '  :NEW_INCIDE_PISCOFINS, :NEW_COD_NAO_INSIDENTE, :NEW_DENTRO_CON' +
        'T_CFOP, '
      
        '  :NEW_DENTRO_CONT_CST_IPI, :NEW_DENTRO_CONT_IPI, :NEW_DENTRO_NC' +
        'ONT_CFOP, '
      
        '  :NEW_DENTRO_NCONT_CST_IPI, :NEW_DENTRO_NCONT_IPI, :NEW_FORA_CO' +
        'NT_CFOP, '
      
        '  :NEW_FORA_CONT_CST_IPI, :NEW_FORA_CONT_IPI, :NEW_FORA_NCONT_CF' +
        'OP, '
      
        '  :NEW_FORA_NCONT_CST_IPI, :NEW_FORA_NCONT_IPI, :NEW_ISENTO_PISC' +
        'OFINS, '
      
        '  :NEW_CST_PIS, :NEW_PIS, :NEW_CST_COFINS, :NEW_COFINS, :NEW_ENT' +
        '_DENTRO_CONT_CFOP, '
      '  :NEW_ENT_DENTRO_CONT_CST_IPI, :NEW_ENT_DENTRO_CONT_IPI, '
      '  :NEW_ENT_DENTRO_NCONT_CFOP, :NEW_ENT_DENTRO_NCONT_CST_IPI, '
      
        '  :NEW_ENT_DENTRO_NCONT_IPI, :NEW_ENT_FORA_CONT_CFOP, :NEW_ENT_F' +
        'ORA_CONT_CST_IPI, '
      
        '  :NEW_ENT_FORA_CONT_IPI, :NEW_ENT_FORA_NCONT_CFOP, :NEW_ENT_FOR' +
        'A_NCONT_CST_IPI, '
      
        '  :NEW_ENT_FORA_NCONT_IPI, :NEW_ENT_ISENTO_PISCOFINS, :NEW_ENT_C' +
        'ST_PIS, '
      '  :NEW_ENT_PIS, :NEW_ENT_CST_COFINS, :NEW_ENT_COFINS)'
      
        'RETURNING COD_PERFIL, COD_EMP, DESCRICAO, ORIGEM_PROD, INCIDE_PI' +
        'SCOFINS, COD_NAO_INSIDENTE, DENTRO_CONT_CFOP, DENTRO_CONT_CST_IP' +
        'I, DENTRO_CONT_IPI, DENTRO_NCONT_CFOP, DENTRO_NCONT_CST_IPI, DEN' +
        'TRO_NCONT_IPI, FORA_CONT_CFOP, FORA_CONT_CST_IPI, FORA_CONT_IPI,' +
        ' FORA_NCONT_CFOP, FORA_NCONT_CST_IPI, FORA_NCONT_IPI, ISENTO_PIS' +
        'COFINS, CST_PIS, PIS, CST_COFINS, COFINS, ENT_DENTRO_CONT_CFOP, ' +
        'ENT_DENTRO_CONT_CST_IPI, ENT_DENTRO_CONT_IPI, ENT_DENTRO_NCONT_C' +
        'FOP, ENT_DENTRO_NCONT_CST_IPI, ENT_DENTRO_NCONT_IPI, ENT_FORA_CO' +
        'NT_CFOP, ENT_FORA_CONT_CST_IPI, ENT_FORA_CONT_IPI, ENT_FORA_NCON' +
        'T_CFOP, ENT_FORA_NCONT_CST_IPI, ENT_FORA_NCONT_IPI, ENT_ISENTO_P' +
        'ISCOFINS, ENT_CST_PIS, ENT_PIS, ENT_CST_COFINS, ENT_COFINS')
    ModifySQL.Strings = (
      'UPDATE TRIBUTACAO_PERFIL'
      
        'SET COD_PERFIL = :NEW_COD_PERFIL, COD_EMP = :NEW_COD_EMP, DESCRI' +
        'CAO = :NEW_DESCRICAO, '
      
        '  ORIGEM_PROD = :NEW_ORIGEM_PROD, INCIDE_PISCOFINS = :NEW_INCIDE' +
        '_PISCOFINS, '
      
        '  COD_NAO_INSIDENTE = :NEW_COD_NAO_INSIDENTE, DENTRO_CONT_CFOP =' +
        ' :NEW_DENTRO_CONT_CFOP, '
      
        '  DENTRO_CONT_CST_IPI = :NEW_DENTRO_CONT_CST_IPI, DENTRO_CONT_IP' +
        'I = :NEW_DENTRO_CONT_IPI, '
      
        '  DENTRO_NCONT_CFOP = :NEW_DENTRO_NCONT_CFOP, DENTRO_NCONT_CST_I' +
        'PI = :NEW_DENTRO_NCONT_CST_IPI, '
      
        '  DENTRO_NCONT_IPI = :NEW_DENTRO_NCONT_IPI, FORA_CONT_CFOP = :NE' +
        'W_FORA_CONT_CFOP, '
      
        '  FORA_CONT_CST_IPI = :NEW_FORA_CONT_CST_IPI, FORA_CONT_IPI = :N' +
        'EW_FORA_CONT_IPI, '
      
        '  FORA_NCONT_CFOP = :NEW_FORA_NCONT_CFOP, FORA_NCONT_CST_IPI = :' +
        'NEW_FORA_NCONT_CST_IPI, '
      
        '  FORA_NCONT_IPI = :NEW_FORA_NCONT_IPI, ISENTO_PISCOFINS = :NEW_' +
        'ISENTO_PISCOFINS, '
      
        '  CST_PIS = :NEW_CST_PIS, PIS = :NEW_PIS, CST_COFINS = :NEW_CST_' +
        'COFINS, '
      
        '  COFINS = :NEW_COFINS, ENT_DENTRO_CONT_CFOP = :NEW_ENT_DENTRO_C' +
        'ONT_CFOP, '
      '  ENT_DENTRO_CONT_CST_IPI = :NEW_ENT_DENTRO_CONT_CST_IPI, '
      
        '  ENT_DENTRO_CONT_IPI = :NEW_ENT_DENTRO_CONT_IPI, ENT_DENTRO_NCO' +
        'NT_CFOP = :NEW_ENT_DENTRO_NCONT_CFOP, '
      '  ENT_DENTRO_NCONT_CST_IPI = :NEW_ENT_DENTRO_NCONT_CST_IPI, '
      
        '  ENT_DENTRO_NCONT_IPI = :NEW_ENT_DENTRO_NCONT_IPI, ENT_FORA_CON' +
        'T_CFOP = :NEW_ENT_FORA_CONT_CFOP, '
      
        '  ENT_FORA_CONT_CST_IPI = :NEW_ENT_FORA_CONT_CST_IPI, ENT_FORA_C' +
        'ONT_IPI = :NEW_ENT_FORA_CONT_IPI, '
      
        '  ENT_FORA_NCONT_CFOP = :NEW_ENT_FORA_NCONT_CFOP, ENT_FORA_NCONT' +
        '_CST_IPI = :NEW_ENT_FORA_NCONT_CST_IPI, '
      
        '  ENT_FORA_NCONT_IPI = :NEW_ENT_FORA_NCONT_IPI, ENT_ISENTO_PISCO' +
        'FINS = :NEW_ENT_ISENTO_PISCOFINS, '
      '  ENT_CST_PIS = :NEW_ENT_CST_PIS, ENT_PIS = :NEW_ENT_PIS, '
      
        '  ENT_CST_COFINS = :NEW_ENT_CST_COFINS, ENT_COFINS = :NEW_ENT_CO' +
        'FINS'
      'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP'
      
        'RETURNING COD_PERFIL, COD_EMP, DESCRICAO, ORIGEM_PROD, INCIDE_PI' +
        'SCOFINS, COD_NAO_INSIDENTE, DENTRO_CONT_CFOP, DENTRO_CONT_CST_IP' +
        'I, DENTRO_CONT_IPI, DENTRO_NCONT_CFOP, DENTRO_NCONT_CST_IPI, DEN' +
        'TRO_NCONT_IPI, FORA_CONT_CFOP, FORA_CONT_CST_IPI, FORA_CONT_IPI,' +
        ' FORA_NCONT_CFOP, FORA_NCONT_CST_IPI, FORA_NCONT_IPI, ISENTO_PIS' +
        'COFINS, CST_PIS, PIS, CST_COFINS, COFINS, ENT_DENTRO_CONT_CFOP, ' +
        'ENT_DENTRO_CONT_CST_IPI, ENT_DENTRO_CONT_IPI, ENT_DENTRO_NCONT_C' +
        'FOP, ENT_DENTRO_NCONT_CST_IPI, ENT_DENTRO_NCONT_IPI, ENT_FORA_CO' +
        'NT_CFOP, ENT_FORA_CONT_CST_IPI, ENT_FORA_CONT_IPI, ENT_FORA_NCON' +
        'T_CFOP, ENT_FORA_NCONT_CST_IPI, ENT_FORA_NCONT_IPI, ENT_ISENTO_P' +
        'ISCOFINS, ENT_CST_PIS, ENT_PIS, ENT_CST_COFINS, ENT_COFINS')
    DeleteSQL.Strings = (
      'DELETE FROM TRIBUTACAO_PERFIL'
      'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      
        'SELECT COD_PERFIL, COD_EMP, DESCRICAO, ORIGEM_PROD, INCIDE_PISCO' +
        'FINS, '
      '  COD_NAO_INSIDENTE, DENTRO_CONT_CFOP, DENTRO_CONT_CST_IPI, '
      '  DENTRO_CONT_IPI, DENTRO_NCONT_CFOP, DENTRO_NCONT_CST_IPI, '
      
        '  DENTRO_NCONT_IPI, FORA_CONT_CFOP, FORA_CONT_CST_IPI, FORA_CONT' +
        '_IPI, '
      
        '  FORA_NCONT_CFOP, FORA_NCONT_CST_IPI, FORA_NCONT_IPI, ISENTO_PI' +
        'SCOFINS, '
      '  CST_PIS, PIS, CST_COFINS, COFINS, ENT_DENTRO_CONT_CFOP, '
      
        '  ENT_DENTRO_CONT_CST_IPI, ENT_DENTRO_CONT_IPI, ENT_DENTRO_NCONT' +
        '_CFOP, '
      
        '  ENT_DENTRO_NCONT_CST_IPI, ENT_DENTRO_NCONT_IPI, ENT_FORA_CONT_' +
        'CFOP, '
      
        '  ENT_FORA_CONT_CST_IPI, ENT_FORA_CONT_IPI, ENT_FORA_NCONT_CFOP,' +
        ' '
      
        '  ENT_FORA_NCONT_CST_IPI, ENT_FORA_NCONT_IPI, ENT_ISENTO_PISCOFI' +
        'NS, '
      '  ENT_CST_PIS, ENT_PIS, ENT_CST_COFINS, ENT_COFINS'
      'FROM TRIBUTACAO_PERFIL'
      'WHERE COD_PERFIL = :COD_PERFIL AND COD_EMP = :COD_EMP')
    Left = 584
    Top = 72
  end
  object QNcm: TFDQuery [9]
    AfterInsert = QNcmAfterInsert
    AfterPost = QNcmAfterPost
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upNCM
    SQL.Strings = (
      
        'SELECT TRIBUTACAO_PERFIL_NCM.*, NCM.descricao FROM TRIBUTACAO_PE' +
        'RFIL_NCM'
      'INNER JOIN NCM'
      'ON( NCM.cod_emp = TRIBUTACAO_PERFIL_NCM.cod_emp'
      
        'AND NCM.ncm = TRIBUTACAO_PERFIL_NCM.ncm and ncm.ex=  TRIBUTACAO_' +
        'PERFIL_NCM.ex)'
      'WHERE TRIBUTACAO_PERFIL_NCM.COD_EMP=:COD_EMP'
      'AND TRIBUTACAO_PERFIL_NCM.COD_PERFIL=:COD_PERFIL')
    Left = 664
    Top = 80
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'COD_PERFIL'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QNcmNCM: TIntegerField
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNcmDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object QNcmCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Origin = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNcmCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QNcmEX: TIntegerField
      FieldName = 'EX'
      Origin = 'EX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsNcm: TDataSource [10]
    DataSet = QNcm
    Left = 704
    Top = 80
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
  end
  object upNCM: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO TRIBUTACAO_PERFIL_NCM'
      '(COD_PERFIL, COD_EMP, NCM, EX)'
      'VALUES (:NEW_COD_PERFIL, :NEW_COD_EMP, :NEW_NCM, :NEW_EX)'
      'RETURNING COD_PERFIL, COD_EMP, NCM, EX')
    ModifySQL.Strings = (
      'UPDATE TRIBUTACAO_PERFIL_NCM'
      
        'SET COD_PERFIL = :NEW_COD_PERFIL, COD_EMP = :NEW_COD_EMP, NCM = ' +
        ':NEW_NCM, '
      '  EX = :NEW_EX'
      
        'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP AN' +
        'D '
      '  NCM = :OLD_NCM AND EX = :OLD_EX'
      'RETURNING COD_PERFIL, COD_EMP, NCM, EX')
    DeleteSQL.Strings = (
      'DELETE FROM TRIBUTACAO_PERFIL_NCM'
      
        'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP AN' +
        'D '
      '  NCM = :OLD_NCM AND EX = :OLD_EX')
    FetchRowSQL.Strings = (
      'SELECT COD_PERFIL, COD_EMP, NCM, EX'
      'FROM TRIBUTACAO_PERFIL_NCM'
      
        'WHERE COD_PERFIL = :COD_PERFIL AND COD_EMP = :COD_EMP AND NCM = ' +
        ':NCM AND '
      '  EX = :EX')
    Left = 664
    Top = 136
  end
  object QEstados: TFDQuery
    AfterInsert = QEstadosAfterInsert
    AfterPost = QEstadosAfterPost
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    UpdateObject = upEstados
    SQL.Strings = (
      
        'select TE.*, TIENT.descricao ENTRADA, TISAI.descricao SAIDA FROM' +
        ' TRIBUTACAO_ESTADOS TE'
      'inner join tributacao_icms TIENT'
      
        'on( TIENT.cod_icms = TE.icms_entrada and TIENT.cod_emp=TE.cod_em' +
        'p )'
      'inner join tributacao_icms TISAI'
      
        'on( TISAI.cod_icms = TE.icms_entrada and TISAI.cod_emp=TE.cod_em' +
        'p )'
      'WHERE TE.cod_emp=:COD_EMP and TE.cod_perfil =:COD_PERFIL')
    Left = 408
    Top = 224
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD_PERFIL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QEstadosCOD_PERFIL: TIntegerField
      FieldName = 'COD_PERFIL'
      Origin = 'COD_PERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QEstadosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QEstadosUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object QEstadosICMS_ENTRADA: TIntegerField
      FieldName = 'ICMS_ENTRADA'
      Origin = 'ICMS_ENTRADA'
    end
    object QEstadosICMS_SAIDA: TIntegerField
      FieldName = 'ICMS_SAIDA'
      Origin = 'ICMS_SAIDA'
    end
    object QEstadosENTRADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENTRADA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QEstadosSAIDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SAIDA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object upEstados: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO TRIBUTACAO_ESTADOS'
      '(COD_PERFIL, COD_EMP, UF, ICMS_ENTRADA, ICMS_SAIDA)'
      
        'VALUES (:NEW_COD_PERFIL, :NEW_COD_EMP, :NEW_UF, :NEW_ICMS_ENTRAD' +
        'A, :NEW_ICMS_SAIDA)'
      'RETURNING COD_PERFIL, COD_EMP, UF, ICMS_ENTRADA, ICMS_SAIDA')
    ModifySQL.Strings = (
      'UPDATE TRIBUTACAO_ESTADOS'
      
        'SET COD_PERFIL = :NEW_COD_PERFIL, COD_EMP = :NEW_COD_EMP, UF = :' +
        'NEW_UF, '
      '  ICMS_ENTRADA = :NEW_ICMS_ENTRADA, ICMS_SAIDA = :NEW_ICMS_SAIDA'
      
        'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP AN' +
        'D '
      '  UF = :OLD_UF'
      'RETURNING COD_PERFIL, COD_EMP, UF, ICMS_ENTRADA, ICMS_SAIDA')
    DeleteSQL.Strings = (
      'DELETE FROM TRIBUTACAO_ESTADOS'
      
        'WHERE COD_PERFIL = :OLD_COD_PERFIL AND COD_EMP = :OLD_COD_EMP AN' +
        'D '
      '  UF = :OLD_UF')
    FetchRowSQL.Strings = (
      
        'select TE.*, TIENT.descricao ENTRADA, TISAI.descricao SAIDA FROM' +
        ' TRIBUTACAO_ESTADOS TE'
      'inner join tributacao_icms TIENT'
      
        'on( TIENT.cod_icms = TE.icms_entrada and TIENT.cod_emp=TE.cod_em' +
        'p )'
      'inner join tributacao_icms TISAI'
      
        'on( TISAI.cod_icms = TE.icms_entrada and TISAI.cod_emp=TE.cod_em' +
        'p )'
      
        'WHERE TE.COD_PERFIL = :COD_PERFIL AND TE.COD_EMP = :COD_EMP AND ' +
        'TE.UF = :UF')
    Left = 464
    Top = 232
  end
  object dsEstados: TDataSource
    DataSet = QEstados
    Left = 496
    Top = 264
  end
  object QICMS: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM TRIBUTACAO_ICMS WHERE COD_EMP=:COD_EMP')
    Left = 560
    Top = 184
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QICMSCOD_ICMS: TIntegerField
      FieldName = 'COD_ICMS'
      Origin = 'COD_ICMS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QICMSCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QICMSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object QICMSCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 2
    end
    object QICMSICMS: TBCDField
      FieldName = 'ICMS'
      Origin = 'ICMS'
      Precision = 18
      Size = 2
    end
    object QICMSREDUCAO: TBCDField
      FieldName = 'REDUCAO'
      Origin = 'REDUCAO'
      Precision = 18
      Size = 2
    end
    object QICMSDIF: TBCDField
      FieldName = 'DIF'
      Origin = 'DIF'
      Precision = 18
      Size = 2
    end
    object QICMSMVA: TBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      Precision = 18
      Size = 2
    end
  end
  object dsICMS: TDataSource
    DataSet = QICMS
    Left = 616
    Top = 184
  end
  object QCFOP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT * FROM CFOP')
    Left = 408
    Top = 152
    object QCFOPCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Origin = 'COD_CFO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCFOPNOME_CFO: TStringField
      FieldName = 'NOME_CFO'
      Origin = 'NOME_CFO'
      Required = True
      Size = 200
    end
    object QCFOPINF_COMPL_NF: TMemoField
      FieldName = 'INF_COMPL_NF'
      Origin = 'INF_COMPL_NF'
      BlobType = ftMemo
    end
    object QCFOPDESTACA_ICMS: TStringField
      FieldName = 'DESTACA_ICMS'
      Origin = 'DESTACA_ICMS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPSAIR_REL_RESUMO_ALIQ: TStringField
      FieldName = 'SAIR_REL_RESUMO_ALIQ'
      Origin = 'SAIR_REL_RESUMO_ALIQ'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPREGISTRADO_ECF: TStringField
      FieldName = 'REGISTRADO_ECF'
      Origin = 'REGISTRADO_ECF'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPCALCULA_PIS_COFINS: TStringField
      FieldName = 'CALCULA_PIS_COFINS'
      Origin = 'CALCULA_PIS_COFINS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QCFOPUSA_CSOSN: TStringField
      FieldName = 'USA_CSOSN'
      Origin = 'USA_CSOSN'
      FixedChar = True
      Size = 1
    end
  end
  object dsCFOP: TDataSource
    DataSet = QCFOP
    Left = 464
    Top = 184
  end
end
