inherited frmCadSNGPC: TfrmCadSNGPC
  Caption = 'SNGPC Sa'#237'da'
  ClientHeight = 528
  ExplicitTop = -32
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlGeral: TPanel
    Height = 465
    ExplicitHeight = 465
    inherited cxPaginas: TcxPageControl
      Height = 465
      ExplicitHeight = 465
      ClientRectBottom = 461
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 4
        ExplicitTop = 26
        ExplicitWidth = 876
        ExplicitHeight = 435
        inherited cxVisualiza: TcxGrid
          Height = 388
          ExplicitWidth = 870
          ExplicitHeight = 388
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            object cxVisualizaDBTableView1Column1: TcxGridDBColumn
              Caption = 'Nome Paciente'
              DataBinding.FieldName = 'NOME_PACIENTE'
            end
          end
        end
        inherited Panel1: TPanel
          ExplicitWidth = 876
          inherited lblPesquisa: TcxLabel
            Style.IsFontAssigned = True
            AnchorX = 34
            AnchorY = 21
          end
          inherited Panel2: TPanel
            inherited edtCurr: TcxCurrencyEdit
              ExplicitHeight = 23
            end
            inherited edtMask: TMaskEdit
              Text = ''
            end
          end
          inherited btnPesquisar: TcxButton
            OnClick = btnPesquisarClick
          end
        end
      end
      inherited PageEdit: TcxTabSheet
        ExplicitLeft = 4
        ExplicitTop = 26
        ExplicitWidth = 876
        ExplicitHeight = 435
        object cxPageControl1: TcxPageControl
          Left = 0
          Top = 0
          Width = 876
          Height = 435
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxTabSheet1
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 431
          ClientRectLeft = 4
          ClientRectRight = 872
          ClientRectTop = 26
          object cxTabSheet1: TcxTabSheet
            Caption = 'Receita'
            ImageIndex = 0
            object GroupBox1: TGroupBox
              Left = 7
              Top = 9
              Width = 868
              Height = 69
              Caption = 'Dados Receita'
              TabOrder = 0
              object Label1: TLabel
                Left = 16
                Top = 18
                Width = 65
                Height = 15
                Caption = 'Data Receita'
                FocusControl = cxDBDateEdit1
              end
              object Label2: TLabel
                Left = 143
                Top = 18
                Width = 14
                Height = 15
                Caption = 'UF'
                FocusControl = cxDBTextEdit1
              end
              object Label3: TLabel
                Left = 240
                Top = 18
                Width = 55
                Height = 15
                Caption = 'N'#186' Receita'
                FocusControl = cxDBTextEdit2
              end
              object Label4: TLabel
                Left = 367
                Top = 18
                Width = 86
                Height = 15
                Caption = 'Tipo Receituario'
              end
              object cxDBDateEdit1: TcxDBDateEdit
                Left = 16
                Top = 34
                DataBinding.DataField = 'DATA_RECEITA'
                DataBinding.DataSource = dsPrincipal
                TabOrder = 0
                Width = 121
              end
              object cxDBTextEdit1: TcxDBTextEdit
                Left = 143
                Top = 34
                DataBinding.DataField = 'ESTADO_RECEITA'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 1
                Width = 88
              end
              object cxDBTextEdit2: TcxDBTextEdit
                Left = 240
                Top = 34
                DataBinding.DataField = 'NUMERO_RECEITA'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                Width = 121
              end
              object JvDBComboBox1: TJvDBComboBox
                Left = 367
                Top = 34
                Width = 500
                Height = 23
                DataField = 'TIPO_RECEITUARIO'
                DataSource = dsPrincipal
                Items.Strings = (
                  '1 - Receita de Controle Especial em 2 vias (Receita Branca)'
                  '2 - Notifica'#231#227'o de Receita B (Notifica'#231#227'o Azul)'
                  '3 - Notifica'#231#227'o de Receita Especial (Notifica'#231#227'o Branca)'
                  '4 - Notifica'#231#227'o de Receita A (Notifica'#231#227'o Amarela)'
                  '5 - Receita Antimicrobiano em 2 vias')
                TabOrder = 3
                Values.Strings = (
                  '1'
                  '2'
                  '3'
                  '4'
                  '5')
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
            end
            object GroupBox2: TGroupBox
              Left = 7
              Top = 87
              Width = 868
              Height = 74
              Caption = 'Dados M'#233'dico'
              TabOrder = 1
              object Label5: TLabel
                Left = 9
                Top = 19
                Width = 50
                Height = 15
                Caption = 'Conselho'
              end
              object Label6: TLabel
                Left = 259
                Top = 19
                Width = 14
                Height = 15
                Caption = 'UF'
                FocusControl = cxDBTextEdit5
              end
              object Label7: TLabel
                Left = 513
                Top = 19
                Width = 76
                Height = 15
                Caption = 'Nome M'#233'dico'
                FocusControl = cxDBTextEdit6
              end
              object Label15: TLabel
                Left = 386
                Top = 19
                Width = 44
                Height = 15
                Caption = 'N'#250'mero'
              end
              object cxDBTextEdit5: TcxDBTextEdit
                Left = 259
                Top = 36
                DataBinding.DataField = 'ESTADO_MEDIDO'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 1
                Width = 121
              end
              object cxDBTextEdit6: TcxDBTextEdit
                Left = 513
                Top = 36
                DataBinding.DataField = 'NOME_MEDIDO'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                Width = 344
              end
              object JvDBComboBox2: TJvDBComboBox
                Left = 10
                Top = 36
                Width = 243
                Height = 23
                DataField = 'CONSELHO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'CRM=Conselho Regional de Medicina'
                  'CRMV=Conselho Regional de Medicina Veterin'#225'ria'
                  'CRO=Conselho Regional de Odontologia'
                  'COREN=Conselho Regional de Enfermagem')
                TabOrder = 0
                Values.Strings = (
                  '1'
                  '2'
                  '3'
                  '4'
                  '5')
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object cxDBTextEdit3: TcxDBTextEdit
                Left = 386
                Top = 36
                DataBinding.DataField = 'NUMERO_MEDICO'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                Width = 121
              end
            end
            object GroupBox3: TGroupBox
              Left = 7
              Top = 167
              Width = 858
              Height = 217
              Caption = 'Dados Comprador e Paciente'
              TabOrder = 2
              object Label8: TLabel
                Left = 15
                Top = 20
                Width = 97
                Height = 15
                Caption = 'Nome Comprador'
                FocusControl = cxDBTextEdit7
              end
              object Label9: TLabel
                Left = 15
                Top = 66
                Width = 90
                Height = 15
                Caption = 'Tipo Documento'
              end
              object Label10: TLabel
                Left = 126
                Top = 66
                Width = 88
                Height = 15
                Caption = #211'rg'#227'o Expedidor'
                FocusControl = cxDBTextEdit9
              end
              object Label11: TLabel
                Left = 223
                Top = 66
                Width = 14
                Height = 15
                Caption = 'UF'
                FocusControl = cxDBTextEdit10
              end
              object Label12: TLabel
                Left = 15
                Top = 118
                Width = 81
                Height = 15
                Caption = 'Nome Paciente'
                FocusControl = cxDBTextEdit11
              end
              object Label14: TLabel
                Left = 558
                Top = 118
                Width = 91
                Height = 15
                Caption = 'Data Nascimento'
                FocusControl = cxDBDateEdit2
              end
              object Label16: TLabel
                Left = 311
                Top = 66
                Width = 110
                Height = 15
                Caption = 'N'#250'mero Documento'
                FocusControl = cxDBTextEdit4
              end
              object Label18: TLabel
                Left = 686
                Top = 119
                Width = 29
                Height = 15
                Caption = 'Idade'
                FocusControl = cxDBTextEdit8
              end
              object Label19: TLabel
                Left = 548
                Top = 66
                Width = 19
                Height = 15
                Caption = 'CID'
                FocusControl = cxDBTextEdit12
              end
              object Label21: TLabel
                Left = 700
                Top = 66
                Width = 136
                Height = 15
                Caption = 'Data Venda Medicamento'
                FocusControl = cxDBDateEdit3
              end
              object cxDBTextEdit7: TcxDBTextEdit
                Left = 15
                Top = 37
                DataBinding.DataField = 'NOME_COMPRADOR'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                Width = 826
              end
              object cxDBTextEdit9: TcxDBTextEdit
                Left = 126
                Top = 84
                DataBinding.DataField = 'ORGAO_EXPEDIDOS'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                Width = 88
              end
              object cxDBTextEdit10: TcxDBTextEdit
                Left = 222
                Top = 84
                DataBinding.DataField = 'ESTADO_COMPRADOR'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                Width = 85
              end
              object cxDBTextEdit11: TcxDBTextEdit
                Left = 15
                Top = 137
                DataBinding.DataField = 'NOME_PACIENTE'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 7
                Width = 343
              end
              object cxDBDateEdit2: TcxDBDateEdit
                Left = 558
                Top = 137
                DataBinding.DataField = 'DATA_NASCIMENTO'
                DataBinding.DataSource = dsPrincipal
                TabOrder = 9
                Width = 114
              end
              object JvDBComboBox3: TJvDBComboBox
                Left = 15
                Top = 84
                Width = 90
                Height = 23
                DataField = 'TIPO_DOCUMENTO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'CPF'
                  'RG')
                TabOrder = 1
                Values.Strings = (
                  '1'
                  '2')
                ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
                ListSettings.OutfilteredValueFont.Color = clRed
                ListSettings.OutfilteredValueFont.Height = -11
                ListSettings.OutfilteredValueFont.Name = 'Tahoma'
                ListSettings.OutfilteredValueFont.Style = []
              end
              object cxDBTextEdit4: TcxDBTextEdit
                Left = 311
                Top = 84
                DataBinding.DataField = 'NUMERO_DOCUMENTO'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 4
                Width = 231
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 364
                Top = 118
                Width = 185
                Height = 48
                Caption = 'Sexo'
                Columns = 2
                DataField = 'SEXO'
                DataSource = dsPrincipal
                Items.Strings = (
                  'Masculino'
                  'Feminino')
                TabOrder = 8
                Values.Strings = (
                  '1'
                  '2')
              end
              object cxDBTextEdit8: TcxDBTextEdit
                Left = 686
                Top = 137
                DataBinding.DataField = 'IDADE_PACIENTE'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 10
                Width = 67
              end
              object cxDBTextEdit12: TcxDBTextEdit
                Left = 548
                Top = 84
                DataBinding.DataField = 'CID'
                DataBinding.DataSource = dsPrincipal
                Properties.CharCase = ecUpperCase
                TabOrder = 5
                Width = 141
              end
              object cxDBDateEdit3: TcxDBDateEdit
                Left = 700
                Top = 84
                DataBinding.DataField = 'DATA_CHEGADA_MEDICAMENTO'
                DataBinding.DataSource = dsPrincipal
                TabOrder = 6
                Width = 136
              end
            end
          end
          object cxTabITens: TcxTabSheet
            Caption = 'Medicamentos'
            ImageIndex = 1
            OnShow = cxTabITensShow
            object pnl3: TPanel
              Left = 0
              Top = 364
              Width = 868
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object RzDBNavigator1: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsItensReceita
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
                Align = alLeft
                BorderOuter = fsNone
                GradientColorStyle = gcsCustom
                TabOrder = 0
                Transparent = True
                VisualStyle = vsClassic
              end
            end
            object cxGrid1: TcxGrid
              AlignWithMargins = True
              Left = 3
              Top = 58
              Width = 862
              Height = 303
              Align = alClient
              TabOrder = 1
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailFrameColor = clNone
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                OnCellDblClick = cxVisualizaDBTableView1CellDblClick
                DataController.DataSource = dsItensReceita
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnHiding = True
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                object cxGridDBTableView1Column5: TcxGridDBColumn
                  Caption = 'Produto'
                  DataBinding.FieldName = 'COD_PRO'
                  Width = 120
                end
                object cxGridDBTableView1Column3: TcxGridDBColumn
                  Caption = 'Nome Produto'
                  DataBinding.FieldName = 'NOME_PRO'
                end
                object cxGridDBTableView1Column2: TcxGridDBColumn
                  Caption = 'Quantidade'
                  DataBinding.FieldName = 'QUANTIDADE'
                  Width = 100
                end
                object cxGridDBTableView1Column4: TcxGridDBColumn
                  Caption = 'Lote'
                  DataBinding.FieldName = 'NUMERO_LOTE'
                end
              end
              object cxNCMs: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.KeyFieldNames = 'NCM'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
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
              object cxCEST: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
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
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 868
              Height = 55
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object Label13: TLabel
                Left = 3
                Top = 9
                Width = 48
                Height = 15
                Caption = 'Produtos'
              end
              object Label17: TLabel
                Left = 769
                Top = 9
                Width = 62
                Height = 15
                Caption = 'Quantidade'
                FocusControl = edtQuantidade
              end
              object BtnConsPro: TsSpeedButton
                Left = 179
                Top = 29
                Width = 23
                Height = 21
                Hint = 'Consultar Produto'
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF314B62
                  AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
                  106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
                  00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
                  B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
                  EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
                  FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
                  B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
                  FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
                  E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
                  A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
                  FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
                  C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
                  FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
                  A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = BtnConsProClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object BtnAddPro: TsSpeedButton
                Left = 204
                Top = 29
                Width = 25
                Height = 21
                Hint = 'Cadastrar Produto'
                Glyph.Data = {
                  DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                  0400000000006800000000000000000000001000000010000000000000000000
                  BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                  700077777777777770007777700077777000777770C077777000777770C07777
                  7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
                  7000777770C07777700077777000777770007777777777777000777777777777
                  7000}
                ParentShowHint = False
                ShowHint = True
                OnClick = BtnAddProClick
                SkinData.SkinSection = 'SPEEDBUTTON'
              end
              object Label20: TLabel
                Left = 236
                Top = 9
                Width = 51
                Height = 15
                Caption = 'Descri'#231#227'o'
              end
              object cxDBLookupComboBox1: TcxDBLookupComboBox
                Left = 236
                Top = 28
                DataBinding.DataField = 'COD_PRO'
                DataBinding.DataSource = dsItensReceita
                Properties.CharCase = ecUpperCase
                Properties.DropDownAutoSize = True
                Properties.GridMode = True
                Properties.KeyFieldNames = 'COD_PRO'
                Properties.ListColumns = <
                  item
                    FieldName = 'NOME_PRO'
                  end>
                Properties.ListSource = dsProduto
                Properties.ReadOnly = True
                TabOrder = 1
                Width = 521
              end
              object edtQuantidade: TcxDBTextEdit
                Left = 769
                Top = 29
                DataBinding.DataField = 'QUANTIDADE'
                DataBinding.DataSource = dsItensReceita
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                Width = 62
              end
              object edtProduto: TcxDBTextEdit
                Left = 3
                Top = 29
                DataBinding.DataField = 'COD_PRO'
                DataBinding.DataSource = dsItensReceita
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                Width = 170
              end
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 3212016
  end
  inherited dsPrincipal: TDataSource
    Left = 632
    Top = 16
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    OnNewRecord = QPrincipalNewRecord
    SQL.Strings = (
      'SELECT *'
      'FROM SNGPC'
      ' WHERE ENTRADA_SAIDA = '#39'S'#39)
    object QPrincipalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalDATA_RECEITA: TDateField
      FieldName = 'DATA_RECEITA'
      Origin = 'DATA_RECEITA'
    end
    object QPrincipalESTADO_RECEITA: TStringField
      FieldName = 'ESTADO_RECEITA'
      Origin = 'ESTADO_RECEITA'
      FixedChar = True
      Size = 2
    end
    object QPrincipalNUMERO_RECEITA: TStringField
      FieldName = 'NUMERO_RECEITA'
      Origin = 'NUMERO_RECEITA'
      Size = 255
    end
    object QPrincipalTIPO_USO: TStringField
      FieldName = 'TIPO_USO'
      Origin = 'TIPO_USO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalCONSELHO: TStringField
      FieldName = 'CONSELHO'
      Origin = 'CONSELHO'
      FixedChar = True
      Size = 5
    end
    object QPrincipalESTADO_MEDIDO: TStringField
      FieldName = 'ESTADO_MEDIDO'
      Origin = 'ESTADO_MEDIDO'
      FixedChar = True
      Size = 2
    end
    object QPrincipalNOME_MEDIDO: TStringField
      FieldName = 'NOME_MEDIDO'
      Origin = 'NOME_MEDIDO'
      Size = 255
    end
    object QPrincipalNOME_COMPRADOR: TStringField
      FieldName = 'NOME_COMPRADOR'
      Origin = 'NOME_COMPRADOR'
      Size = 255
    end
    object QPrincipalTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalORGAO_EXPEDIDOS: TStringField
      FieldName = 'ORGAO_EXPEDIDOS'
      Origin = 'ORGAO_EXPEDIDOS'
      FixedChar = True
      Size = 4
    end
    object QPrincipalESTADO_COMPRADOR: TStringField
      FieldName = 'ESTADO_COMPRADOR'
      Origin = 'ESTADO_COMPRADOR'
      FixedChar = True
      Size = 2
    end
    object QPrincipalNOME_PACIENTE: TStringField
      FieldName = 'NOME_PACIENTE'
      Origin = 'NOME_PACIENTE'
      Size = 255
    end
    object QPrincipalSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object QPrincipalNUMERO_MEDICO: TLargeintField
      FieldName = 'NUMERO_MEDICO'
      Origin = 'NUMERO_MEDICO'
    end
    object QPrincipalTIPO_RECEITUARIO: TStringField
      FieldName = 'TIPO_RECEITUARIO'
      Origin = 'TIPO_RECEITUARIO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 25
    end
    object QPrincipalNUMERO_NOTAFISCAL: TIntegerField
      FieldName = 'NUMERO_NOTAFISCAL'
      Origin = 'NUMERO_NOTAFISCAL'
    end
    object QPrincipalTIPO_OPERACAO_NF: TStringField
      FieldName = 'TIPO_OPERACAO_NF'
      Origin = 'TIPO_OPERACAO_NF'
      FixedChar = True
      Size = 1
    end
    object QPrincipalDATA_NOTA_FISCAL: TDateField
      FieldName = 'DATA_NOTA_FISCAL'
      Origin = 'DATA_NOTA_FISCAL'
    end
    object QPrincipalCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      Origin = 'CNPJ_ORIGEM'
      Size = 14
    end
    object QPrincipalCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      Origin = 'CNPJ_DESTINO'
      Size = 14
    end
    object QPrincipalENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Origin = 'ENTRADA_SAIDA'
      FixedChar = True
      Size = 1
    end
    object QPrincipalDATA_CHEGADA_MEDICAMENTO: TDateField
      FieldName = 'DATA_CHEGADA_MEDICAMENTO'
      Origin = 'DATA_CHEGADA_MEDICAMENTO'
    end
    object QPrincipalCID: TStringField
      FieldName = 'CID'
      Origin = 'CID'
      Size = 150
    end
    object QPrincipalIDADE_PACIENTE: TIntegerField
      FieldName = 'IDADE_PACIENTE'
      Origin = 'IDADE_PACIENTE'
    end
    object QPrincipalDATA_VENDA_MEDICAMENTO: TDateField
      FieldName = 'DATA_VENDA_MEDICAMENTO'
      Origin = 'DATA_VENDA_MEDICAMENTO'
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 4784968
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
    DesignInfo = 4719384
  end
  object QItensReceita: TFDQuery
    OnNewRecord = QItensReceitaNewRecord
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      
        'SELECT SI.CODIGO_SNGPC,SI.COD_PRO, SI.QUANTIDADE, P.NOME_PRO, P.' +
        'NUMERO_LOTE'
      '  FROM SNGPC_ITENS SI'
      '   LEFT OUTER JOIN PRODUTO P ON(P.COD_PRO = SI.COD_PRO)'
      ' WHERE SI.CODIGO_SNGPC = :CODIGO_SNGPC')
    Left = 616
    Top = 176
    ParamData = <
      item
        Name = 'CODIGO_SNGPC'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QItensReceitaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QItensReceitaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QItensReceitaNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QItensReceitaNUMERO_LOTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_LOTE'
      Origin = 'NUMERO_LOTE'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QItensReceitaCODIGO_SNGPC: TIntegerField
      FieldName = 'CODIGO_SNGPC'
      Origin = 'CODIGO_SNGPC'
    end
  end
  object dsItensReceita: TDataSource
    DataSet = QItensReceita
    Left = 652
    Top = 187
  end
  object dsProduto: TDataSource
    DataSet = QProdutos
    Left = 404
    Top = 283
  end
  object QProdutos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_PRO, NOME_PRO, VALOR_PRO'
      '  FROM PRODUTO'
      'ORDER BY NOME_PRO')
    Left = 384
    Top = 280
    object QProdutosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Required = True
      Size = 80
    end
    object QProdutosVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'VALOR_PRO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
