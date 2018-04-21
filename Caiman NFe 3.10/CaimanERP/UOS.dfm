inherited frmCadOS: TfrmCadOS
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 585
  ClientWidth = 881
  ExplicitWidth = 897
  ExplicitHeight = 624
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Width = 881
    ExplicitWidth = 800
  end
  object Label16: TLabel [1]
    Left = 542
    Top = 176
    Width = 41
    Height = 15
    Caption = 'T'#233'cnico'
  end
  inherited ToolBar1: TToolBar
    Width = 881
    ExplicitWidth = 881
    object btnFinalizar: TToolButton
      Left = 482
      Top = 0
      Caption = 'Finalizar'
      ImageIndex = 7
      OnClick = btnFinalizarClick
    end
    object btnImprimir: TToolButton
      Left = 561
      Top = 0
      Caption = 'Imprimir'
      ImageIndex = 8
      OnClick = btnImprimirClick
    end
    object btnTransmitirNFSe: TToolButton
      Left = 640
      Top = 0
      Caption = 'NFSe'
      ImageIndex = 9
      OnClick = btnTransmitirNFSeClick
    end
    object ToolButton2: TToolButton
      Left = 719
      Top = 0
      Caption = 'NFe'
      ImageIndex = 9
      OnClick = ToolButton2Click
    end
  end
  inherited pnlGeral: TPanel
    Width = 881
    Height = 522
    ExplicitWidth = 881
    ExplicitHeight = 522
    inherited cxPaginas: TcxPageControl
      Width = 881
      Height = 522
      ExplicitWidth = 881
      ExplicitHeight = 522
      ClientRectBottom = 520
      ClientRectRight = 879
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 877
        ExplicitHeight = 490
        inherited cxVisualiza: TcxGrid
          Width = 871
          Height = 443
          ExplicitWidth = 871
          ExplicitHeight = 443
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            object cxVisualizaDBTableView1Column1: TcxGridDBColumn
              Caption = 'T'#233'cnico'
              DataBinding.FieldName = 'NOME_FUN'
            end
            object cxVisualizaDBTableView1Column2: TcxGridDBColumn
              AlternateCaption = 'Defeito'
              Caption = 'Defeito'
              DataBinding.FieldName = 'DEFEITO'
            end
            object cxVisualizaDBTableView1Column3: TcxGridDBColumn
              Caption = 'Data Fechamento'
              DataBinding.FieldName = 'DATA_FECHAMENTO'
              Width = 100
            end
            object cxVisualizaDBTableView1Column4: TcxGridDBColumn
              Caption = 'Situa'#231#227'o'
              DataBinding.FieldName = 'SIT'
              MinWidth = 25
              Width = 55
            end
            object cxVisualizaDBTableView1Column5: TcxGridDBColumn
              Caption = 'Valor Total OS'
              DataBinding.FieldName = 'TOTAL_OS'
              Width = 200
            end
          end
        end
        inherited Panel1: TPanel
          Width = 877
          ExplicitWidth = 877
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
        end
      end
      inherited PageEdit: TcxTabSheet
        OnShow = PageEditShow
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 877
        ExplicitHeight = 490
        object cxPageControl1: TcxPageControl
          Left = 0
          Top = 0
          Width = 877
          Height = 490
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxTabOS
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 488
          ClientRectLeft = 2
          ClientRectRight = 875
          ClientRectTop = 30
          object cxTabOS: TcxTabSheet
            Caption = 'Ordem de Servi'#231'o'
            ImageIndex = 0
            object Label1: TLabel
              Left = 12
              Top = 8
              Width = 57
              Height = 15
              Caption = 'C'#243'digo OS'
            end
            object Label3: TLabel
              Left = 186
              Top = 5
              Width = 37
              Height = 15
              Caption = 'Cliente'
            end
            object Label4: TLabel
              Left = 12
              Top = 64
              Width = 74
              Height = 15
              Caption = 'Data Cadastro'
              FocusControl = dbDataCadastro
            end
            object Label6: TLabel
              Left = 146
              Top = 64
              Width = 67
              Height = 15
              Caption = 'Data Entrada'
              FocusControl = cxDBDateEdit3
            end
            object Label7: TLabel
              Left = 282
              Top = 64
              Width = 67
              Height = 15
              Caption = 'Data Entrega'
              FocusControl = cxDBDateEdit4
            end
            object Label8: TLabel
              Left = 615
              Top = 5
              Width = 41
              Height = 15
              Caption = 'T'#233'cnico'
            end
            object Label9: TLabel
              Left = 12
              Top = 301
              Width = 62
              Height = 15
              Caption = 'Observa'#231#227'o'
              FocusControl = cxDBMemo1
            end
            object Label11: TLabel
              Left = 12
              Top = 181
              Width = 38
              Height = 15
              Caption = 'Defeito'
              FocusControl = cxDBMemo2
            end
            object BtnAddCliFor: TsSpeedButton
              Left = 160
              Top = 25
              Width = 23
              Height = 21
              Hint = 'Cadastrar Cliente'
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
              OnClick = BtnAddCliForClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object BtnConsCliFor: TsSpeedButton
              Left = 135
              Top = 25
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
                C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
                F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
                FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
                C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
                FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
                EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
                BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
                FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
                D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
                FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
                B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnConsCliForClick
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label14: TLabel
              Left = 83
              Top = 8
              Width = 36
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object sSpeedButton1: TsSpeedButton
              Left = 559
              Top = 25
              Width = 23
              Height = 21
              Hint = 'Consultar Cliente'
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
                C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
                F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
                FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
                C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
                FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
                EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
                BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
                FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
                D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
                FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
                B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
              ParentShowHint = False
              ShowHint = True
              OnClick = sSpeedButton1Click
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object sSpeedButton2: TsSpeedButton
              Left = 584
              Top = 25
              Width = 23
              Height = 21
              Hint = 'Cadastrar Cliente'
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
              OnClick = sSpeedButton2Click
              SkinData.SkinSection = 'SPEEDBUTTON'
            end
            object Label17: TLabel
              Left = 507
              Top = 5
              Width = 41
              Height = 15
              Caption = 'T'#233'cnico'
            end
            object Label5: TLabel
              Left = 419
              Top = 61
              Width = 48
              Height = 15
              Caption = 'Aparelho'
            end
            object Label18: TLabel
              Left = 534
              Top = 61
              Width = 41
              Height = 15
              Caption = 'Modelo'
            end
            object Label19: TLabel
              Left = 652
              Top = 61
              Width = 87
              Height = 15
              Caption = 'N'#250'mero de s'#233'rie'
            end
            object Label20: TLabel
              Left = 12
              Top = 117
              Width = 108
              Height = 15
              Caption = 'Total Itens / Servi'#231'os'
            end
            object Label21: TLabel
              Left = 136
              Top = 117
              Width = 50
              Height = 15
              Caption = 'Desconto'
            end
            object Label22: TLabel
              Left = 239
              Top = 117
              Width = 44
              Height = 15
              Caption = 'Total OS'
            end
            object Label23: TLabel
              Left = 382
              Top = 117
              Width = 56
              Height = 15
              Caption = 'Valor Pago'
            end
            object Label24: TLabel
              Left = 484
              Top = 117
              Width = 74
              Height = 15
              Caption = 'Valor Restante'
            end
            object dbDataCadastro: TcxDBDateEdit
              Left = 12
              Top = 80
              DataBinding.DataField = 'DATA_CADASATRO'
              DataBinding.DataSource = dsPrincipal
              TabOrder = 5
              Width = 121
            end
            object cxDBDateEdit3: TcxDBDateEdit
              Left = 146
              Top = 80
              DataBinding.DataField = 'DATA_ENTRADA'
              DataBinding.DataSource = dsPrincipal
              TabOrder = 6
              Width = 121
            end
            object cxDBDateEdit4: TcxDBDateEdit
              Left = 282
              Top = 80
              DataBinding.DataField = 'DATA_ENTREGA'
              DataBinding.DataSource = dsPrincipal
              TabOrder = 7
              Width = 121
            end
            object cxDBMemo1: TcxDBMemo
              Left = 12
              Top = 319
              DataBinding.DataField = 'OBSERVACAO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 16
              Height = 129
              Width = 757
            end
            object cxDBMemo2: TcxDBMemo
              Left = 12
              Top = 198
              DataBinding.DataField = 'DEFEITO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 15
              Height = 98
              Width = 757
            end
            object dbedtID_OS: TDBEdit
              Left = 11
              Top = 24
              Width = 63
              Height = 23
              TabStop = False
              CharCase = ecUpperCase
              DataField = 'ID_OS'
              DataSource = dsPrincipal
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 16744448
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object cxDBCODIGO_CLI: TcxDBLookupComboBox
              Left = 186
              Top = 24
              DataBinding.DataField = 'ID_CLIENTE'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              Properties.DropDownAutoSize = True
              Properties.GridMode = True
              Properties.KeyFieldNames = 'COD_CLI'
              Properties.ListColumns = <
                item
                  FieldName = 'NOME_CLI'
                end>
              Properties.ListSource = dsCliente
              Properties.ReadOnly = True
              TabOrder = 2
              Width = 304
            end
            object edtCodCliente: TcxDBTextEdit
              Left = 83
              Top = 24
              DataBinding.DataField = 'ID_CLIENTE'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 1
              OnExit = edtCodClienteExit
              Width = 46
            end
            object edtTecnico: TcxDBTextEdit
              Left = 507
              Top = 24
              DataBinding.DataField = 'TECNICO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 3
              OnExit = edtTecnicoExit
              Width = 46
            end
            object cxDBLookupComboBox2: TcxDBLookupComboBox
              Left = 613
              Top = 24
              DataBinding.DataField = 'TECNICO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              Properties.DropDownAutoSize = True
              Properties.GridMode = True
              Properties.KeyFieldNames = 'COD_FUN'
              Properties.ListColumns = <
                item
                  FieldName = 'NOME_FUN'
                end>
              Properties.ListSource = dsFuncionario
              Properties.ReadOnly = True
              TabOrder = 4
              Width = 156
            end
            object cxDBTextEdit2: TcxDBTextEdit
              Left = 419
              Top = 80
              DataBinding.DataField = 'APARELHO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 8
              Width = 109
            end
            object cxDBTextEdit7: TcxDBTextEdit
              Left = 534
              Top = 80
              DataBinding.DataField = 'MODELO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 9
              Width = 109
            end
            object cxDBTextEdit8: TcxDBTextEdit
              Left = 649
              Top = 80
              DataBinding.DataField = 'NUMERO_SERIE'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 10
              Width = 109
            end
            object cxDBTextEdit1: TcxDBTextEdit
              Left = 12
              Top = 134
              DataBinding.DataField = 'VLR_ITENS'
              DataBinding.DataSource = dsQTotalItens
              Properties.CharCase = ecUpperCase
              Properties.ReadOnly = True
              TabOrder = 11
              Width = 117
            end
            object cxDBTextEdit5: TcxDBTextEdit
              Left = 135
              Top = 134
              DataBinding.DataField = 'VALOR_DESCONTO'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              TabOrder = 12
              Width = 98
            end
            object cxDBTextEdit6: TcxDBTextEdit
              Left = 239
              Top = 134
              DataBinding.DataField = 'TOTAL_OS'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              Properties.ReadOnly = True
              TabOrder = 13
              Width = 137
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 613
              Top = 109
              Width = 156
              Height = 65
              Caption = 'Situa'#231#227'o'
              Columns = 2
              DataField = 'SITUACAO'
              DataSource = dsPrincipal
              Items.Strings = (
                'Aberto'
                'Fechado')
              ReadOnly = True
              TabOrder = 14
              Values.Strings = (
                'A'
                'F')
            end
            object cxDBTextEdit9: TcxDBTextEdit
              Left = 382
              Top = 134
              DataBinding.DataField = 'VALOR_SERVICOS'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              Properties.ReadOnly = True
              TabOrder = 17
              Width = 96
            end
            object cxDBTextEdit10: TcxDBTextEdit
              Left = 484
              Top = 134
              DataBinding.DataField = 'TOTAL_RESTANTE'
              DataBinding.DataSource = dsPrincipal
              Properties.CharCase = ecUpperCase
              Properties.ReadOnly = True
              TabOrder = 18
              Width = 96
            end
          end
          object cxTabServico: TcxTabSheet
            Caption = 'Itens / Servi'#231'o'
            ImageIndex = 1
            OnShow = cxTabServicoShow
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 873
              Height = 55
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Label2: TLabel
                Left = 3
                Top = 9
                Width = 79
                Height = 15
                Caption = 'Itens / Servi'#231'os'
              end
              object Label10: TLabel
                Left = 416
                Top = 9
                Width = 62
                Height = 15
                Caption = 'Quantidade'
                FocusControl = edtQuantidade
              end
              object Label12: TLabel
                Left = 482
                Top = 9
                Width = 26
                Height = 15
                Caption = 'Valor'
                FocusControl = cxDBTextEdit3
              end
              object Label13: TLabel
                Left = 610
                Top = 9
                Width = 55
                Height = 15
                Caption = 'Valor Total'
                FocusControl = cxDBTextEdit4
              end
              object BtnConsPro: TsSpeedButton
                Left = 53
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
                Left = 78
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
              object Label15: TLabel
                Left = 104
                Top = 9
                Width = 51
                Height = 15
                Caption = 'Descri'#231#227'o'
              end
              object cxDBLookupComboBox1: TcxDBLookupComboBox
                Left = 104
                Top = 28
                DataBinding.DataField = 'COD_PRO'
                DataBinding.DataSource = dsItens
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
                Properties.OnValidate = cxDBLookupComboBox1PropertiesValidate
                TabOrder = 1
                OnExit = edtProdutoExit
                Width = 306
              end
              object edtQuantidade: TcxDBTextEdit
                Left = 416
                Top = 28
                DataBinding.DataField = 'QUANTIDADE'
                DataBinding.DataSource = dsItens
                Properties.CharCase = ecUpperCase
                TabOrder = 2
                OnExit = edtQuantidadeExit
                Width = 62
              end
              object cxDBTextEdit3: TcxDBTextEdit
                Left = 482
                Top = 28
                DataBinding.DataField = 'VALOR_UNITARIO'
                DataBinding.DataSource = dsItens
                Properties.CharCase = ecUpperCase
                TabOrder = 3
                OnExit = cxDBTextEdit3Exit
                Width = 121
              end
              object cxDBTextEdit4: TcxDBTextEdit
                Left = 609
                Top = 28
                DataBinding.DataField = 'VALOR_TOTAL'
                DataBinding.DataSource = dsItens
                Properties.CharCase = ecUpperCase
                TabOrder = 4
                Width = 121
              end
              object edtProduto: TcxDBTextEdit
                Left = 3
                Top = 29
                DataBinding.DataField = 'COD_PRO'
                DataBinding.DataSource = dsItens
                Properties.CharCase = ecUpperCase
                TabOrder = 0
                OnExit = edtProdutoExit
                Width = 48
              end
            end
            object cxGrid1: TcxGrid
              AlignWithMargins = True
              Left = 3
              Top = 58
              Width = 867
              Height = 356
              Align = alClient
              TabOrder = 1
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
              RootLevelOptions.DetailFrameColor = clNone
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                OnCellDblClick = cxVisualizaDBTableView1CellDblClick
                DataController.DataSource = dsItens
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
                object cxGridDBTableView1Column1: TcxGridDBColumn
                  Caption = 'Produto'
                  DataBinding.FieldName = 'COD_PRO'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'COD_PRO'
                  Properties.ListColumns = <
                    item
                      FieldName = 'NOME_PRO'
                    end>
                  Properties.ListSource = dsProduto
                  Width = 430
                end
                object cxGridDBTableView1Column2: TcxGridDBColumn
                  Caption = 'Quantidade'
                  DataBinding.FieldName = 'QUANTIDADE'
                  Width = 100
                end
                object cxGridDBTableView1Column3: TcxGridDBColumn
                  Caption = 'Valor'
                  DataBinding.FieldName = 'VALOR_UNITARIO'
                  Width = 100
                end
                object cxGridDBTableView1Column4: TcxGridDBColumn
                  Caption = 'Valor Total'
                  DataBinding.FieldName = 'VALOR_TOTAL'
                  Width = 100
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
            object pnl3: TPanel
              Left = 0
              Top = 417
              Width = 873
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object DBText1: TDBText
                Left = 683
                Top = 5
                Width = 74
                Height = 25
                Alignment = taRightJustify
                AutoSize = True
                DataField = 'VLR_ITENS'
                DataSource = dsQTotalItens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object RzDBNavigator1: TRzDBNavigator
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 151
                Height = 35
                DataSource = dsItens
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
                OnClick = RzDBNavigator1Click
                Align = alLeft
                BorderOuter = fsNone
                GradientColorStyle = gcsCustom
                TabOrder = 0
                Transparent = True
                VisualStyle = vsClassic
              end
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 19988744
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000001000000010000
          0000000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001010100152116005C55380194845600B8A36B01CCA36B01CC8456
          00B8553801942116005C01010015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000906
          0031714A01AAF29F02F9FCA302FEFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFCA302FEF29F02F9714A01AA0906003100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C593B0197F8A2
          02FCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FC593B01970000000C0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000004020021AF7401D4FFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFAF7401D40402
          0021000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000004020021C58202E1FFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFC582
          02E1040200210000000000000000000000000000000000000000000000000000
          000000000000000000000000000CAF7401D4FFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFAF7401D40000000C00000000000000000000000000000000000000000000
          00000000000000000001593A0197FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FF593A019700000001000000000000000000000000000000000000
          00000000000009060032F8A202FCFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFF8A202FC09060032000000000000000000000000000000000000
          000000000001714A01AAFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FCF8A202FCFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FF714A01AA000000010000000000000000000000000000
          000001010014F29F02F9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFD78F02EB0000000C0000000BD78F
          02EBFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFF29F02F9010100140000000000000000000000000000
          00002116005CFCA402FEFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC78502E20000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFCA402FE2115005C0000000000000000000000000000
          000155380194FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC78502E20000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF553801940000000100000000000000000000
          0000845600B8FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFDF9302EFD28B02E8D28B02E8A56F01CE0000000100000001A56F
          01CED28B02E8D28B02E8DF9302EFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF845600B80000000000000000000000000000
          0001A36B01CCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFF8A202FC0000000C00000001000000010000000100000000000000000000
          000100000001000000010000000CF8A202FCFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFA36B01CC0000000100000000000000000000
          0001A36B01CCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFF8A202FC0000000900000001000000010000000100000000000000000000
          0001000000010000000100000009F8A102FCFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFA36B01CC0000000100000000000000000000
          0000845600B8FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFCB8502E4B77A02D9B77A02D9906101C000000001000000019061
          01C0B67802D8B67802D8C98502E3FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF845600B80000000000000000000000000000
          000155380194FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC58202E10000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FF553801940000000100000000000000000000
          00002116005CFCA402FEFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFC58202E10000000100000001C785
          02E2FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFCA402FE2116005C0000000000000000000000000000
          000001010014F29F02F9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFD48D02E90000000500000005D48D
          02E9FFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFF29F02F9010100140000000000000000000000000000
          000000000001714A01AAFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFE49602F2E49602F2FFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FF714A01AA000000010000000000000000000000000000
          00000000000009060032F8A202FCFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFF8A202FC09060032000000000000000000000000000000000000
          00000000000000000001593A0197FFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FF593A019700000001000000000000000000000000000000000000
          000000000000000000000000000CAF7401D4FFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFAF7401D40000000C00000000000000000000000000000000000000000000
          000000000000000000000000000004020021C58202E1FFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFC582
          02E1040200210000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000004020021AF7401D4FFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFAF7401D40402
          0021000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C593B0197F8A2
          02FCFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFFA602FFFFA602FFFFA602FFF8A202FC593B01970000000C0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000906
          0031714A01AAF29F02F9FCA302FEFFA602FFFFA602FFFFA602FFFFA602FFFFA6
          02FFFFA602FFFCA302FEF29F02F9714A01AA0906003100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001010100152116005C55380194845600B8A36B01CCA36B01CC8456
          00B8553801942116005C01010015000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000000000001000000010000
          0000000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000404032324211C63292620692926206929262069292620692926
          2069292620692926206929262069292620692926206929262069292620692926
          2069292620692926206929262069292620692926206929262069292620692926
          20692926206924211C6304040323000000000000000000000000000000000000
          000023190067E8D4A6FAF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EBD2FFF9EB
          D2FFF9EBD2FFF9EBD2FFE8D3A6FA231800670000000000000000000000000302
          0020D7A203FAF3DEACFFF9ECD5FFF9ECD5FFF9ECD5FFF9ECD4FFF9ECD4FFF9EC
          D4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9EC
          D4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9ECD4FFF9EC
          D5FFF9ECD5FFF9ECD5FFF3DEACFFD59E02FA0302002000000000000000001F17
          015FE2AC05FFF4E0AFFFFAEED9FFFAEED9FFEAD09BFFE7CB90FFE7CA8EFFE6C9
          8CFFE6C889FFE5C787FFE5C685FFE4C584FFE4C482FFE4C481FFE4C480FFE4C4
          80FFE4C480FFE4C480FFE4C480FFE4C480FFE4C480FFE4C480FFE3C27DFFF5E4
          C5FFFAEED9FFFAEED9FFF4E0AFFFE1AB05FF1F17015F0000000000000000231B
          0166E2AD09FFF5E2B3FFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0DDFFFAF0
          DDFFFAF0DDFFFAF0DDFFF5E2B3FFE2AD09FF231B01660000000000000000231B
          0266E3AF0DFFF5E3B6FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1E0FFFBF1
          E0FFFBF1E0FFFBF1E0FFF5E3B6FFE3AF0DFF231B02660000000000000000241B
          0266E4B111FFF6E5BAFFFBF3E5FFFBF3E5FFF9EEDBFFF8EDD8FFF8EDD8FFF8ED
          D7FFF8EDD7FFF8ECD7FFF8ECD6FFF8ECD6FFF8ECD6FFF8ECD6FFF8ECD5FFF8EC
          D5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF7ECD5FFFBF2
          E2FFFBF3E5FFFBF3E5FFF6E5BAFFE4B111FF241B02660000000000000000241B
          0366E6B215FFF6E6BDFFFCF5E8FFFCF5E9FFEEDAAFFFECD6A6FFEBD4A4FFEBD4
          A2FFEBD3A1FFEAD29FFFEAD19DFFE9D09BFFE9D09AFFE9CF99FFE9CF99FFE9CF
          99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE9CF99FFE8CE97FFF7EC
          D5FFFCF5E8FFFCF5E8FFF6E6BDFFE6B215FF241B03660000000000000000241C
          0466E7B41AFFF7E8C0FFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7ECFFFCF7
          ECFFFCF7ECFFFCF7ECFFF7E8C0FFE7B41AFF241C04660000000000000000241C
          0566E8B61EFFF8E9C4FFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFF8E9C4FFE8B61EFF241C05660000000000000000251D
          0566E9B823FFF8EBC7FFFDFAF3FFFDFAF3FFF6EBD5FFF5E9D0FFF5E8CFFFF4E8
          CEFFF4E7CDFFF4E7CCFFF4E7CBFFF4E6CAFFF4E6C9FFF3E6C9FFF3E6C9FFF3E6
          C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E6C9FFF3E5C8FFFBF5
          EAFFFDFAF3FFFDFAF3FFF8EBC7FFE9B823FF251D05660000000000000000251D
          0666EABA28FFF9ECCBFFFEFBF6FFFEFBF7FFF4E7CCFFF2E4C5FFF2E3C4FFF1E2
          C2FFF1E2C1FFF1E1C0FFF1E1BFFFF0E0BEFFF0E0BDFFF0DFBCFFF0DFBCFFF0DF
          BCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBCFFF0DFBBFFFBF5
          E9FFFEFBF6FFFEFBF6FFF9ECCBFFEABA28FF251D06660000000000000000251D
          0766EBBD2EFFF9EECEFFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFF9EECEFFEBBD2EFF251D07660000000000000000251D
          0766EDBF33FFFAEFD1FFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFEFCFFFFFE
          FCFFFFFEFCFFFFFEFCFFFAEFD1FFEDBF33FF251D07660000000000000000251E
          0866EEC139FFF9ECC8FFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFF9ECC8FFEEC139FF251E08660000000000000000251E
          0966EFC43FFFF0C94FFFF3D477FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D578FFF3D5
          78FFF3D578FFF3D477FFF0C94FFFEFC43FFF251E09660000000000000000261F
          0A66F0C644FFF0C745FFF0C745FFF0C745FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C747FFF1C7
          47FFF0C745FFF0C745FFF0C745FFF0C644FF261F0A660000000000000000261F
          0B66F2C949FFF2C94AFFF2C94AFFEAC24FFFE4BB4DFFE4BA4BFFE3B949FFE5BE
          56FFECCD84FFECCD85FFECCD84FFECCD83FFEBCC83FFEBCC82FFEBCC82FFEBCC
          82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCC82FFEBCB
          7DFFE9BF4CFFF2C94AFFF2C94AFFF2C949FF261F0B660000000000000000261F
          0B66F3CB4EFFF3CB4FFFF3CB51FFE5BD51FFE4BB4FFFE4BB4CFFE3BA4AFFF0D7
          9FFFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6C6FFF7E6
          C6FFF7E6C6FFF7E6C6FFF7E5C5FFF4E0BBFFF4E0BAFFF4E0BAFFF6E3C0FFF7E5
          C6FFEBCD84FFF2CB50FFF3CB4FFFF3CB4EFF261F0B660000000000000000261F
          0C66F4CD54FFF4CD54FFF4CD56FFE5BD53FFE5BC51FFE5BC4FFFE4BB4DFFF2DA
          A7FFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7CAFFF8E7
          CAFFF8E7CAFFF8E7CAFFE2C17AFFD2A33CFFCF9D2FFFCF9C2DFFD09F33FFF7E6
          C8FFEDCF8BFFF4CD56FFF4CD54FFF4CD54FF261F0C6600000000000000002720
          0D66F5CF58FFF5D059FFF5D05BFFE6BF56FFE5BE54FFE5BD52FFE5BC50FFF2DB
          ABFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9CEFFF9E9
          CEFFF9E9CEFFF9E9CFFFE0BD71FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF7E7
          C9FFEDD18FFFF5D05AFFF5D059FFF5CF58FF27200D6600000000000000002720
          0E66F6D15DFFF6D25EFFF6D260FFE7C058FFE6BF56FFE6BE54FFE5BD52FFF3DD
          AEFFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EBD3FFF9EB
          D3FFF9EBD3FFF9EBD4FFE0BD73FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF8E9
          CEFFEED292FFF6D25FFFF6D25EFFF6D15DFF27200E6600000000000000002721
          0F66F8D362FFF8D463FFF7D464FFE7C15AFFE7C058FFE6BF56FFE6BE54FFF3DF
          B2FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEED9FFFAEE
          D9FFFAEED9FFFAEED9FFE0BE74FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFF9EB
          D3FFEED496FFF7D364FFF8D463FFF8D362FF27210F6600000000000000002721
          0F66F9D466FFF9D567FFF8D568FFE8C15CFFE7C05AFFE7C058FFE6BF56FFF4E1
          B6FFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0DEFFFBF0
          DEFFFBF0DEFFFBF1DFFFE0BF76FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFAEE
          D9FFEFD699FFF8D568FFF9D567FFF9D466FF27210F6600000000000000002721
          1066FAD66AFFFAD76BFFF9D76CFFE8C25EFFE8C15CFFE7C05AFFE7BF58FFF4E3
          BAFFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3E4FFFBF3
          E4FFFBF3E4FFFBF3E4FFE1C077FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFAF0
          DEFFEFD79DFFF9D76BFFFAD76BFFFAD66AFF2721106600000000000000002721
          1066FAD86EFFFAD96FFFFAD970FFE9C360FFE8C25EFFE8C15CFFE7C05AFFF5E4
          BEFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5EAFFFCF5
          EAFFFCF5EAFFFCF6EAFFE1C078FFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFBF2
          E3FFF0D9A0FFFAD86FFFFAD96FFFFAD86EFF272110660000000000000000221C
          0E5FFBD86FFFFBDA72FFFBDA74FFE9C462FFE8C360FFE8C25EFFE8C15CFFF6E6
          C2FFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8EFFFFDF8
          EFFFFDF8EFFFFDF8EFFFE1C17AFFD3A43EFFD09E32FFCF9D2FFFCE9B2BFFFCF5
          E8FFF1DAA4FFFBDA73FFFBDA72FFFBDA72FF221E0F5F00000000000000000303
          0120EECB65FAFCDA74FFFCDB76FFE9C464FFE9C362FFE9C360FFE8C25EFFF6E8
          C6FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFAF4FFFEFA
          F4FFFEFAF4FFFEFAF4FFE3C584FFD1A136FFCE9B2AFFCD9927FFCE9B2BFFFDF8
          F1FFF1DBA6FFFCDB75FFFCDB74FFF0D06CFA0403012000000000000000000000
          000027200E67EEC963FAFBD872FFE9C361FFE8C25FFFE8C15DFFE7C05BFFF6E8
          C7FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFCF9FFFEFC
          F9FFFEFCF9FFFEFCF9FFFDFAF4FFF8F0E0FFF8F0DEFFF8EFDEFFFAF5EAFFFEFC
          F9FFF1DBA7FFFBD872FFEFCC67FA282110670000000000000000000000000000
          00000000000003030120211B0C5F251E0E66251E0D66251E0D66251E0D662926
          1E692B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29
          266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29266A2B29
          266A28231A68221B0C5F03030120000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01110D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2C488A0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C01060A35010508300105083001050830010508300105
          08300105083001050830010508300105083002080D3D2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C62898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2B6B0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E70B6DC2898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF103B
          5FA00000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000D0303
          1A5501010D3C000000000000000000000000000000000C304E902898F5FF103B
          5FA000000000000000000000000C03031A5502010D3D000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D1A17AFDB231E
          EDFF231EEDFF0C0A4F930000000100000000000000000C304E902486D9F00107
          0B37000000000000021C1A16ADDA231EEDFF231EEDFF09083F842898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004031A56231EEDFF231E
          EDFF231EEDFF231EEDFF0C0A529600000001000000000616246301070B370000
          00000000021C1A17AFDB231EEDFF231EEDFF231EEDFF1D1AC9EB2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010D3C231EEDFF231E
          EDFF231EEDFF231EEDFF231EEDFF0C0A52960000000100000000000000000000
          021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF1815A3D42898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C0A5094231E
          EDFF231EEDFF231EEDFF231EEDFF231EEDFF0C0A5296000000010000021C1A17
          AFDB231EEDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A362898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010C0A
          5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF0D0B5C9F1A17AFDB231E
          EDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A37000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF231EEDFF1F1AD1F001010A3700000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF1F1AD1F001010A370000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000010D0B5C9F231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF211EE4FB01010B38000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF0C0A5296000000010000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF231E
          EDFF231EEDFF231EEDFF0C0A52960000000100000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          021C1A17AFDB231EEDFF231EEDFF231EEDFF231EEDFF211EE4FB231EEDFF231E
          EDFF231EEDFF231EEDFF231EEDFF0C0A529600000001000000002694ECFB2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000021C1A17
          AFDB231EEDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010B380C0A5296231E
          EDFF231EEDFF231EEDFF231EEDFF231EEDFF0C0A5296000000011E78BFE22898
          F5FF071A2A6B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000C1A16ADDA231E
          EDFF231EEDFF231EEDFF231EEDFF1F1AD1F001010A3700000000000000010C0A
          5296231EEDFF231EEDFF231EEDFF231EEDFF231EEDFF09083C820D304F912898
          F5FF2488DDF2071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F40000204240000000003031A55231EEDFF231E
          EDFF231EEDFF231EEDFF1F1AD1F001010A370000000000000000000000000000
          00010C0A5296231EEDFF231EEDFF231EEDFF231EEDFF1D1AC9EC000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF103E65A40000000002010D3D231EEDFF231E
          EDFF231EEDFF1F1AD1F001010A37000000000000000000000000000000000000
          0000000000010C0A5296231EEDFF231EEDFF231EEDFF1815A5D5000000000000
          01110D304F911E78BFE22385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF1C6FB2DA0000000600000000090840851D1A
          C9EB1815A3D401010A3600000000000000000000000000000000000000000000
          0000000000000000000109083D831D1AC9EC1815A5D501010B39}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01110D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2D498B0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071A2A6A01060A34010508300105083001050830010508300105
          08300105083001050830010508300105083002080D3D2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071A2A6B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000102898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C52898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2A6B0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E70B6DC2898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000040101330100001F000000000000000000000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000100001F652B25F72D1310A50401013400000000000000000000
          000000000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000002D1310A56B2D27FF6B2D27FF3B1916BE0903034B0000
          000100000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000040101336B2D27FF6B2D27FF5B2521EB1207076B0000
          000B00000000000000000000000000000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000003A1815BC5B2521EB02010025180A08795623
          20E4652B24F9371614B70201002600000000000000000C304E902898F5FF0C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000803034A1207076B180A08796B2D27FF6B2D
          27FF6B2D27FF6B2D27FF592521EA0301012D00000000000204241F77C1E30C30
          4E900000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000B562320E46B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D0000000000020424081F
          32740000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000652B24F96B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D000000000000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000371614B76B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D0000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000002010026592521EA6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301
          012D0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000301012D5925
          21EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF5925
          21EA0301012D00000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000301
          012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF592521EA0301012D000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF592521EA0301012D0000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF592521EA0301012D00000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000301012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF592521EA0301012D000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000301012D592521EA6B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF592521EA020100252694ECFB2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000301012D592521EA6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF361714B61E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000301012D592521EA6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF5F2823F10C2F4E902898
          F5FF248ADEF3071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F4002090F4002090F4002090F4002090F400209
          0F4002090F4002090F4002090F40020A104300020421000000000301012D5925
          21EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF51211EDF000001111D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF1F77C1E300020424000000000301
          012D592521EA6B2D27FF6B2D27FF6B2D27FF6B2D27FF15090872000000000000
          01110C2E4B8E1E75BDE12385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385D7EF2385
          D7EF2385D7EF2385D7EF2385D7EF2385D7EF195E99CA040E174F000000000000
          000002000024361714B65F2723F051211EDF1509087200000001}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000096346
          1BAFCD9238FCD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFFD3973AFFD3973AFFCD9238FC62451BAE00000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000022180968674A
          1CB3000000060000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000006694B1DB422180967000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000003C2B11892E21
          0C77000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002E210C783C2B1189000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000004A3614992218
          096800000000000000000F0B086F0000000000000000000000000F0B086F0000
          000000000000050402410201012E00000000221909684A341498000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005B4019A81911
          06580000000000000000140F0B80000000000000000000000000140F0B800000
          000000000000050402420403023E00000000191106585B4019A8000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000006D4E1EB8100C
          04480000000000000000140F0B80000000000000000000000000140F0B800000
          000000000000030301380604034800000000100C04486D4E1EB8000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000815C23C80A07
          02380000000000000000140F0B80000000000000000000000000140F0B800000
          0000000000000201012E08060452000000000A070239815B22C7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000966A29D70503
          01290000000000000003130E0A7D000000000000000000000000140F0B800000
          000000000000010100240A07055B0000000005030129966929D7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AC7C2FE70201
          0019000000000000000E100C0872000000000000000000000000140F0B800000
          0000000000000000001B0C0906650000000002010019AC7B2FE7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C48C36F70000
          000900000000000000190C0A0767000000000000000000000000140F0B800000
          000000000000000000110F0B086F000000000000000AC48D36F6000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000007C68F36F80000
          000000000000010100240A07055C000000000000000000000000140F0B800000
          00000000000000000007110D09790000000000000000C88E38F9000000070000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010017AF7E31E90000
          0000000000000202012F08060451000000000000000000000000140F0B800000
          00000000000000000000130F0B800000000000000000B07E31E9010100160000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000004030127986D29D90000
          0000000000000403023A06040346000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000009A6D2ADA040301260000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000009060237835C24C90000
          000000000000050403450403023B000000000000000000000000140F0B800000
          00000000000000000000140F0B800000000000000000835E25CA090602360000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000F0B04466F4F1EBA0000
          0000000000000705045002020130000000000000000000000000140F0B800000
          00000000000000000000140F0B800000000000000000704F1EBA0F0B04450000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000171106565D4319AA0000
          0000000000000A07055B01010025000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000005E431AAB171006550000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000211709664C36159A0000
          0000000000000C0907660000001A000000000000000000000000140F0B800000
          00000000000000000000140F0B8000000000000000004E37159B201708640000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000002C1F0C753D2C118A0000
          0000000000000E0A086C0000000D000000000000000000000000120D0A7A0000
          00000000000000000000110D097900000000000000003D2C118B2B1F0C740000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000003928108530220D7A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000031230E7C38280F840000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000100001430220D7A35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803022
          0D7A010000140000000000000000000000000000000000000000000000000000
          000000000000000000000000000030220D7A755320BF35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F807553
          20BF30220D7A0000000000000000000000000000000000000000000000000000
          000000000000000000000000000035260F8035260F8000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003526
          0F8035260F800000000000000000000000000000000000000000000000000000
          000000000000000000000000000030220D7A755320BF35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F807553
          20BF30220D7A0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000100001430220D7A35260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803526
          0F8035260F8035260F8035260F8035260F8035260F8035260F8035260F803022
          0D7A010000140000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000072511FBC130D054D0000000000000000000000000000
          000000000001876024CC0B08033C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000016100654BE8934F3D3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFF785421C000000007000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          01120D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2694ECFB0B2D498B0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000001121D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34
          5496000000010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C01060A35010508300105083001050830010508300105
          083001050830010508300105083001050830030C144A2898F5FF2898F5FF2898
          F5FF0E3454960000000100000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF0E34549600000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002893EEFC2898
          F5FF01060A350000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF0E345496000000010000000000000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF0E3454960000000100000000000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E34549600000001000000000000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000203202898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E345496000000010000
          00000000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000101152898F5FF2898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF0E3454960000
          00010000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000185A92C62898F5FF2898
          F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF071A
          2A6A0000000000000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000001140D3150921247
          74AF124774AF124774AF124774AF124774AF124774AF1E75BDE12898F5FF0C30
          4E9000000000000000000000000B0904034D04020137000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000103B5FA02486D9F00106
          0A36000000000100001C4C201CD86B2D27FF6B2D27FF1B0B0A802898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D304F9101070B370000
          00000100001C4F221CDB6B2D27FF6B2D27FF6B2D27FF5B2521EB2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000009000000000100
          001C4F221CDB6B2D27FF6B2D27FF6B2D27FF6B2D27FF4C201CD62898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000E00000011000000040000000000000000000000000100001C4F22
          1CDB6B2D27FF6B2D27FF6B2D27FF6B2D27FF632923F50602023E2898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000070302442F1411AA5C27
          21EC6B2D27FF6B2D27FF672A25FA3F1B17C51308076E020100264F221CDB6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF632923F507030242000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000013341513B26B2D27FF6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FE6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF632923F50703024200000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000000000000000000000000184D201CDA6B2D27FF6B2D27FF361713B50C05
          045602010025010000200602023E200D0B8B602923F26B2D27FF6B2D27FF6B2D
          27FF6B2D27FF632923F5070302420000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000000000033E1A17C46B2D27FF5F2823F10A04034F000000000000
          0000000000000000000000000000000000000100001B3F1B17C56B2D27FF6B2D
          27FF632923F507030242000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000100706646B2D27FF692B27FC07030242000000000000000D3731
          287E8B7A65C699876ED05B5041A00706052F000000000000000C491F1BD26B2D
          27FF401B17C600000000000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000004A1E1AD46B2D27FF250F0E960000000001010013A38F77D7E6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFDBC09EF91714105100000000050201386B2D
          27FF6B2D27FF04010133000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000100001F6B2D27FF6B2D27FF02010029000000005B5041A0E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFCAB193EF0000001000000000421B
          18C86B2D27FF1A0B097F000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000803034A6B2D27FF5B2521EB0000000000000005D8BF9DF7E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF1D1A155C00000000200D
          0C8C6B2D27FF2F1311A9000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          00000B0404546B2D27FF4F221EDC0000000001010013E6CBA7FFE6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF2C261F70000000001B0B
          0A806B2D27FF311512AF000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000080303476B2D27FF5D2722EF0000000100000003CEB796F2E6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF1815125400000000220E
          0C906B2D27FF2D1310A6000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          0000000000186B2D27FF6B2D27FF0401013400000000483E338EE6CBA7FFE6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFB8A284E40000000A00000000491E
          1AD36B2D27FF170A0878000000000000000000000000000000002898F5FF2898
          F5FF010508300000000000000000000000000000000000000000000000000000
          000000000000411B17C76B2D27FF2E1210A7000000000000000A81735EC0E6CB
          A7FFE6CBA7FFE6CBA7FFE6CBA7FFC8B091EE0C0B093C00000000080303486B2D
          27FF6B2D27FE02010129000000000000000000000000000000002893EEFC2898
          F5FF01060A340000000000000000000000000000000000000000000000000000
          0000000000000B0404546B2D27FF6B2D27FF0D05045900000000000000041E1B
          165E615546A66B5F4DAE3A332A810202011A000000000000001752241DE16B2D
          27FF351612B300000000000000000000000000000000000000001E78BFE22898
          F5FF071B2B6C0000000000000000000000000000000000000000000000000000
          00000000000000000000311512AF6B2D27FF672A25FA1408076F000000020000
          000000000000000000000000000000000000040101314D201CDA6B2D27FF5D27
          21EE0100002000000000000000000000000000000000000000000D304F912898
          F5FF2488DDF2071B2B6C02090F4002090F4002090F4002090F4002090F400209
          0F4001050933000000000000000D3F1B17C56B2D27FF6B2D27FF491E1AD31709
          0876070302450602023E0E06055E301412AB692B27FC6B2D27FF602923F20603
          0240000000000000000000000000000000000000000000000000000001121D6A
          AED72898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2896F0FD040F19530000000000000008230F0C93692B27FC6B2D27FF6B2D
          27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF6B2D27FF441D19CC0301012B0000
          0000000000000000000000000000000000000000000000000000000000000000
          01120D304F911E78BFE22694ECFB2898F5FF2898F5FF2898F5FF2898F5FF2898
          F5FF2898F5FF258FE8F90514215F0000000000000000020100271F0D0B8A441D
          19CC5B2721ED5F2823F150211EDE2D1310A60A04034F00000002000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000060A0702380D0903400D0903400D0903400D0903400D09
          03400D0903400D0903400D0903400D0903400D0903400C09033F0202001E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000202001E9A702ADB876024CC755320BF755320BF755320BF755320BF7553
          20BF755320BF755320BF755320BF755320BF755320BF785521C0B07E31E93123
          0E7C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00004E38159C34250E7F00000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000001000014B07E
          31E90202001E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007855
          21C00C09033F0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000271C0B6F0403012500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000140E0A086C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001435281CD1130E0A7D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000001535281CD114100B8200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000001535291CD115100B840000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000D34291CD23E3022E2140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B800D0A076B000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000B31261ACB3E3022E2140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F0B80140F
          0B80140F0B80140F0B800E0A076B000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000001132261ACB15100B850000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000001133271BCC15100B8500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001233281CCD140F0B82000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000120F0B0870000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000271B0B6E0403012500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000755320BF0D09034000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007553
          20BF0D0903400000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000735220BD0E0A044300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007B57
          21C30C08033D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000038280F845E431AAB0000000C000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000D090340B37F
          30EB000000110000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000009543C17A2C68E36F8D3973AFFD3973AFFD3973AFFD3973AFFD397
          3AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFFD3973AFF9C6F2BDC100B
          0447000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000001B0000001E0000001D0000001D0000001D0000001D0000001D0000
          001D0000001D0000001D0000001D0000001D0000001F0000000C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000908
          0839413838D72C2627DA25201FD9342E2ED93B3434D93D3636D9352E2ED9312B
          2BD92E2828D9302929D93C3636D9323736D9493F3FDC1F1B1C7D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001412
          12617F7272FF4D4545FF504747FF675C5CFF736666FF796D6DFF5D5555FF554E
          4DFF4E4747FF504948FF7A7271FF727877FF897878FF443D3DB4000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004240
          4084908A8AFFA19C9BFF9F9A9AFF9D9898FFA19B9BFFA6A2A2FFA39F9FFFA09D
          9DFF989494FF949090FFA09999FFA39999FF989393FF6A6565D4020202050000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000514E
          4E81A8A3A2FFAFA9A9FFA19C9BFF9F9B9BFF979595FF858485FF7A7A7CFF7E7D
          7FFF868384FF827D7DFF807B7BFF837E7EFF807A7AFF635E5ED4020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000F000000210000000B0000000000000001000000004745
          4567C3BDBDFF9A9595FF8A898BFF525459FF302F32FF312A25FF3A2D24FF3028
          21FF252324FF34343AFF636163FF777271FF898484FF5E5B5BB9000000000000
          000000000000000000020000000A000000170000000000000000000000000000
          0000251E1B7F8B7C75EA9F9089FE564C48C7000000510000001400000005312F
          2F56B2ACACFF87888DFF605B59FF7E644CFFBF966CFFE6B986FFF7C791FFEBBE
          89FFC9A172FF886D50FF47403AFF555559FF837E7EFF4F4C4CA1000000000000
          00070000000A000000150010169B053A52E20316217300000000000000002822
          1F54BFA69AFF827168C565554DA6AC9790F6675A56E3000000240000000D2524
          234EA5A6ACFF917C6CFFDEA877FFFFD399FFFFE0A3FFFFEAAEFFFFEDAFFFFFF0
          C0FFFFF3D1FFFFE0A8FFEED4B3FF927F6FFF706F72FF4745468F000000010000
          000C000000090113209C0A587AFF0C7399FF0A79A0FF021E274E000000006D63
          5FA8A3968DE900000000000000000200002DA5928BFF1D171677000000000D13
          1820B69882F4E7A261FFFFC68EFFFFD292FFFFE49EFFFFF5C4FFFFF8D0FFFFF0
          B2FFFFEDB7FFFFDA9DFFFFD19DFFF9C38CFFBB9A7DFF32353A6D000000000000
          0007021D31A40D688EFF0E7AA0FF0C8AB3FF087FA4FF01212CA1000000004439
          3689E6D8CEFF504A4693120F0D4E40383496CDB5A6FF816B62F90000024E1E0F
          052AD08138F7EEAF71FFFDC084FFFFD18CFFFFE29CFFFFF2C9FFFFF0C3FFFFE7
          A0FFFFE1A0FFFFDBA0FFFDC17FFFF9CFA3FFFCC48EFF50361F63000000150424
          36C10F7096FF0C7EA6FF0C8FB9FF076989FF00161FB30000001C000000000D09
          0723BEADA3E8FFFEF4FFEBDED7FFF5E9DFFFCAB3A3FFAC9183FF574C4DF98848
          1BE2E08F41FFE6AB6FFFF8B576FFFFC583FFFFDBA0FFFFDB9AFFFFDB9BFFFFD5
          8FFFFFD28FFFFFC886FFFDD09FFFF4D0ABFFEDB377FFB16D2FE00A1318DE095C
          7AFF0D83ACFF0C8BB4FF04485FF5000306700000000000000000000000000000
          0000110D0B21695B558A826D64BEA79288FFE4D6CDFFB0A196FF7D5F55FFC066
          25FFD28438FFE1A468FFEAA562FFFABE83FFFEC587FFFFC17AFFFFDAAEFFFFD1
          9BFFFFC182FFFBBE82FFF3C08AFFEDC190FFE9BF92FFDA8333FF403629FF0069
          91FF0A80A5FF022837CD00000032000000000000000000000000000000000000
          00000000000000000000000000000601003B746159C5DACFC6FFA07162FFBC59
          13FFCA792AFFD99656FFDD9651FFEEB77EFFF3B778FFF7BC82FFFDEFE2FFFBE4
          CEFFF3B87FFFEFBF8DFFE5AA6DFFE9B983FFEED0ADFFDF8A39FF6D482DFF004B
          69FF00161DA30000000C00000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000004534C478EA8695AFDB94E
          0BFFC16610FFD89A5BFFE6B989FFE7B57FFFE4A668FFE4A364FFE7A769FFE9AE
          74FFE29F5DFFDC9958FFD68A40FFDA9347FFD18D49FFD67A2AFF7F4226FA0000
          047E000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000051161195B742
          0AFFC06718FFDDAC76FFDAA264FFD08135FFD6873DFFD68C48FFD5883FFFE5B5
          85FFEFD3B7FFCE7E33FFCE7E31FFD17E30FFC36F20FFC25307FF742819BB0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000033040661AF3D
          1FFFB6510EFFDAA56FFFE9C8A3FFCD7D2EFFD18840FFCE843DFFCA7729FFD495
          57FFE9C7A2FFC57123FFC96B16FFC87022FFBD6119FFB53E07FF561510940000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001405072D9327
          1EFFB34D1DFFDDAE87FFF2E2CAFFC66F1EFFCF813BFFD18E4CFFD18D4AFFDCA8
          70FFD08A3EFFCD7F3AFFBF5801FFBF641BFFB24D0EFFA42A0CFF2C0709580000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005F1E
          1FBEA32B13FFAC4607FFD29454FFC77528FFC8772BFFC87D36FFCA7F39FFE0B4
          87FFD7A168FFD28A3EFFCA803BFFCB8452FFA12802FF700D08E60501020D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001110102A00000011000000000000000000000000000000001204
          0536720403FEA02B0EFFC8864EFFD7A26DFFCE8D4CFFD09154FFD09154FFD498
          5EFFD59351FFD39354FFD9A974FFC1775EFF8A1914FF27030460000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00026E6B668EC2BCB5FC696967D2040404160000000000000000000000000000
          00002001005D710000F7BF6849FFDAAB84FFE3BA93FFD5A375FFD7A779FFDBAF
          83FFD6A375FFCB9061FFDDB29EFF6A0000FF2700008D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000007776
          748BFFFFFFFFCFC5BCFF88827BFF2A2A2A850000000000000000000000000000
          0000000C19431C3D5BF26C2E2DFFB2604BFFE7C1B1FFF6DECBFFEFD1BCFFECCE
          B8FFE6C3B0FFB88073FF762924FF906663FF443B36AA00000026000000000000
          0000000000000000000000000000000000000000000000000000000000008980
          79B2FFFFFDFFCCC0B5FF968A7EFF615E5BBF121110282625243D837F7BAC7572
          6EC11984AAF506ABE8FF1295C1FF2F4E62FF5D3739FF906867F9A48683FF966C
          6AF9815352F59D706DFFB59C96FFE4D9CDFFCFB7A9FF5E4841F0130C0B8A0000
          003D0400003E0000003100000001000000000000000000000000000000000A07
          061C837265CEC2B2A5FFFCF7F1FFEDE7E0FFCAC4BDFCCDC6BFFFDCD6CFFFCFC4
          BAFF9ABCBAFF34C9F1FF0BA4D2FF025C78FF0002077800000024010000390000
          0026070000247D6E64B3DBC9BCFFDFD2CBFFE0D0C3FFAE8D7DFF8C7771FFA99D
          99FFBEB0ACFFAC9C99FC635552C60D0909450000000000000000000000000000
          00000000000817131142E1DBD4F4E7DCD2FFC7BAAEFFC0B4AAFFBCB3AAFFBFB8
          B2FFC2AFA2FF719095FF033F56E4000000550000000000000000000000000000
          0000000000000000000034282287D1C3B9FFF8F0E9FFD1BDB0FFF7EFEBFFFCF7
          F4FFF9F4F0FFFFFCFAFFF7ECEAFFAE9C99FC1915155100000000000000000000
          00000000000000000000827D79B4E3D1C0FFB6A392FFB1A091FFB5A79BFFB7AD
          A2FF968D84FF514946FF02000031000000000000000000000000000000000000
          00000000000000000000000000002B221D8ADBCDC4FFFCF9F6FFFBF6F3FFE5DA
          D2FFB9A89FFB857A77D6CCC2C0FFFFFFFEFF978A88ED01000016000000000000
          0000000000000000000004060A3E8F9093FFCBB098FFAE9884FFB8A697FFA192
          84FF4F4640FF131112AC00000000000000000000000000000000000000000000
          000000000000000000000000000000000001746660D4FFFFFFFFFDFBF8FFF4EB
          E5FF3D37336100000002160F0E41807574B1C2B3B2FF211E1D4E000000000000
          000000000000000000000000000009101D9CA69C9AFFCEB49FFFB7A08FFFA18B
          7BFF483D37DC0000000600000000000000000000000000000000000000000000
          0000000000000000000000000000000000004239358CFFFFFFFFFFFFFFFFEFE9
          E6FF0904021D000000000000000000000000130F0F3109080810000000000000
          000000000000000000000000000000000006161C2ABFCDC3BAFFEEE3D8FFBBA3
          91FF857260EC0202011F00000000000000000000000000000000000000000000
          00000000000000000000000000000000000019120E48E3D7D0FFFFFFFFFFFFFF
          FEFF99928DB51A17153100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000E362E289CDCCFC3FFF1E6
          DCFFD4C2B2FF8E7E73DA2D272357080604160000000006050508060505100000
          000000000000000000000000000000000000000000016C5C52AFFFF9F2FFFFFF
          FFFFFFFFFFFFE8E1DDFC807A76A72825243E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000332A23639F8C
          80E1CDBCAFFFE1CFBFFFD4C1B2FFB09F92F9918175E1776A60F02E2824A90000
          000000000000000000000000000000000000000000000100000B6F5F56A2E5D9
          D2FFFFFEFAFFFFFFFFFFF6EDE9FF5A55539F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          001029231F5C4F463E9C675E57C2726861D8635952D938322CB10C0A09430000
          0000000000000000000000000000000000000000000000000000000000001B15
          123650454075574D4880221D1C50000000050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF0F0F
          0FFFA7A7A7FFACACACFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFAAAAAAFFAAAAAAFFADADADFFA0A0A0FF131313FF000000FF000000FFA2A2
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF484848FF1D1D
          1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABABFF000000FF000000FFA2A2
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFCFCFCFFFCFCFCFFB7B7B7FFADADADFFAEAEAEFFAEAEAEFFAEAEAEFFAEAE
          AEFFAEAEAEFFAEAEAEFFADADADFFB3B3B3FFFFFFFFFF6D6D6DFF000000FFA2A2
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFFFFFFFFF6F6F6FF0C0C0CFF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FFF9F9F9FFD4D4D4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFCFCFCFFFCFCFCFFBBBBBBFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
          B2FFB2B2B2FFB2B2B2FFB2B2B2FFB7B7B7FFFEFEFEFFC7C7C7FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF8F8F8FFD5D5D5FFD4D4D4FFD5D5D5FFD6D6D6FFFAFAFAFF4B4B4BFF1B1B
          1BFFFEFEFEFFF8F8F8FF3E3E3EFF212121FF232323FF232323FF232323FF2323
          23FF232323FF232323FF222222FF303030FFFAFAFAFFCACACAFF000000FFA2A2
          A2FFF0F0F0FFD3D3D3FFD5D5D5FFD3D3D3FFDBDBDBFFFFFFFFFFFFFFFFFFF1F1
          F1FF404040FF070707FF070707FF070707FF0B0B0BFFDBDBDBFF555555FF1B1B
          1BFFFEFEFEFFF9F9F9FF454545FF282828FF292929FF292929FF292929FF2929
          29FF292929FF292929FF282828FF353535FFFAFAFAFFCACACAFF000000FFB0B0
          B0FF9A9A9AFF050505FF070707FF080808FF0B0B0BFF808080FFFFFFFFFFC5C5
          C5FF000000FF000000FF000000FF000000FF010101FFE9E9E9FF5B5B5BFF1D1D
          1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D2FF000000FFBDBD
          BDFFA0A0A0FF000000FF000000FF000000FF000000FF232323FFFFFFFFFFC2C2
          C2FF000000FF000000FF000000FF000000FF030303FF767676FF2E2E2EFF1010
          10FF878787FF8A8A8AFF8C8C8CFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF8D8D8DFF8D8D8DFF8D8D8DFF8C8C8CFF8C8C8CFF6A6A6AFF000000FF5F5F
          5FFF525252FF000000FF000000FF000000FF000000FF282828FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF010101FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC3C3
          C3FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF292929FFFFFFFFFFC0C0
          C0FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF262626FFFFFFFFFFD2D2
          D2FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF2F2F2FFFFFFFFFFFFCFC
          FCFF838383FF353535FF353535FF353535FF363636FF373737FF0F0F0FFF0606
          06FF353535FF363636FF353535FF353535FF353535FF353535FF353535FF3535
          35FF353535FF353535FF353535FF353535FF373737FF292929FF000000FF2121
          21FF373737FF353535FF353535FF343434FF3D3D3DFFB9B9B9FFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4AFF1B1B
          1BFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF000000FFA1A1
          A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4AFF1B1B
          1BFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFA1A1
          A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1B1B
          1BFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF494949FF1C1C
          1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACAFF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4AFF1717
          17FFE4E4E4FFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
          E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFECECECFFB3B3B3FF000000FF9F9F
          9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF535353FF0101
          01FF181818FF191919FF181818FF181818FF181818FF181818FF181818FF1818
          18FF181818FF181818FF181818FF181818FF1B1B1BFF121212FF000000FFA2A2
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF545454FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFA2A2
          A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002D16
          042E000000002D16042E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000E674
          12EA572C0759E67412EA00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FB7E
          15FFFB7E15FFFB7E15FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FB7E
          15FFFB7E15FFFB7E15FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004E270750E47212E9FB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF00000000FB7E
          15FFFB7E15FFFB7E15FF00000000FB7E15FFFB7E15FFE37312E84E2707500000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000E47312E8FB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF000000002814
          0329030200032814032900000000FB7E15FFFB7E15FFFB7E15FFE37312E80000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA522110323C161
          0FC4F57B15FAC0600FC322110322A3510EA6FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF27140328C1610FC4FB7E
          15FFFB7E15FFFB7E15FFC0600FC328140329FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF03020003F57B15FBFB7E
          15FFFB7E15FFFB7E15FFF57B15FA04020004FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF28140329C1610FC4FB7E
          15FFFB7E15FFFB7E15FFC1610FC42915032AFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA523110323C161
          0FC4F57B15FBC1610FC422110323A3510EA6FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFA2520EA52814
          03290402000428140329A3510EA6FB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000FB7E15FFFB7E
          15FFAC560EAF160B021700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF160B0216C56310C8FB7E15FFFB7E15FFFB7E15FFFB7E15FF8F480B920000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFFB7E15FFFB7E15FFAF580FB3030200030000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FF0000
          0000000000000000000000000000000000000000000000000000FB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFFB7E15FFCB6611CE0C06010C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFFB7E15FFE07013E41B0E021B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FB7E15FFFB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000FB7E15FFEE7713F3301804310000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000E27112E7FB7E15FFFB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF00000000F77D15FC4B25064C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004D27064FE27112E7FB7E15FFFB7E
          15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E15FFFB7E
          15FF000000006B36096D00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  inherited dsPrincipal: TDataSource
    OnDataChange = dsPrincipalDataChange
    Left = 688
    Top = 312
  end
  inherited TRPrincipal: TFDTransaction
    Left = 432
    Top = 296
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 24
    Top = 176
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    OnCalcFields = QPrincipalCalcFields
    OnNewRecord = QPrincipalNewRecord
    SQL.Strings = (
      
        'SELECT OS.*, F.NOME_FUN, C.NOME_CLI, CASE WHEN OS.SITUACAO = '#39'F'#39 +
        ' THEN '#39'Fechado'#39' ELSE '#39'Aberto'#39' END SIT'
      '  FROM OS'
      '       LEFT OUTER JOIN CLIENTE C ON(C.COD_CLI = OS.ID_CLIENTE)'
      '       LEFT OUTER JOIN FUNCIONARIO F ON(F.COD_FUN = OS.TECNICO)'
      '   ORDER BY F.NOME_FUN, OS.DATA_CADASATRO')
    Left = 65360
    Top = 200
    object QPrincipalID_OS: TIntegerField
      FieldName = 'ID_OS'
      Origin = 'ID_OS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPrincipalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object QPrincipalID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object QPrincipalDATA_CADASATRO: TDateField
      FieldName = 'DATA_CADASATRO'
      Origin = 'DATA_CADASATRO'
    end
    object QPrincipalDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'DATA_FECHAMENTO'
    end
    object QPrincipalDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
    end
    object QPrincipalDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object QPrincipalOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      BlobType = ftMemo
    end
    object QPrincipalCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
    end
    object QPrincipalDEFEITO: TMemoField
      FieldName = 'DEFEITO'
      Origin = 'DEFEITO'
      BlobType = ftMemo
    end
    object QPrincipalTECNICO: TIntegerField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
    end
    object QPrincipalAPARELHO: TStringField
      FieldName = 'APARELHO'
      Origin = 'APARELHO'
      Size = 80
    end
    object QPrincipalMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 80
    end
    object QPrincipalNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      Size = 80
    end
    object QPrincipalNOME_FUN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FUN'
      Origin = 'NOME_FUN'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QPrincipalNOME_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QPrincipalSIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIT'
      Origin = 'SIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object QPrincipalVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      currency = True
    end
    object QPrincipalTOTAL_OS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_OS'
      currency = True
      Calculated = True
    end
    object QPrincipalVALOR_SERVICOS: TFloatField
      FieldName = 'VALOR_SERVICOS'
      Origin = 'VALOR_SERVICOS'
      currency = True
    end
    object QPrincipalTOTAL_RESTANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_RESTANTE'
      currency = True
      Calculated = True
    end
    object QPrincipalNOTA_FISCAL_SERVICO: TIntegerField
      FieldName = 'NOTA_FISCAL_SERVICO'
      Origin = 'NOTA_FISCAL_SERVICO'
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 24183104
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
    DesignInfo = 22544576
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_CLI, NOME_CLI FROM CLIENTE ORDER BY NOME_CLI')
    Left = 496
    Top = 352
    object QClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object QClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object dsCliente: TDataSource
    DataSet = QCliente
    Left = 516
    Top = 355
  end
  object dsProduto: TDataSource
    DataSet = QProdutos
    Left = 460
    Top = 371
  end
  object QProdutos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_PRO, NOME_PRO, VALOR_PRO'
      '  FROM PRODUTO'
      'ORDER BY NOME_PRO')
    Left = 440
    Top = 368
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
  object QItens: TFDQuery
    AfterPost = QItensAfterPost
    AfterScroll = QItensAfterScroll
    OnNewRecord = QItensNewRecord
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'SELECT *'
      '  FROM OS_ITEM'
      ' WHERE ID_OS = :ID_OS')
    Left = 648
    Top = 360
    ParamData = <
      item
        Name = 'ID_OS'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QItensID_OS_ITEM: TIntegerField
      FieldName = 'ID_OS_ITEM'
      Origin = 'ID_OS_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensID_OS: TIntegerField
      FieldName = 'ID_OS'
      Origin = 'ID_OS'
    end
    object QItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QItensVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      currency = True
    end
    object QItensVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      currency = True
    end
    object QItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
    end
  end
  object dsItens: TDataSource
    DataSet = QItens
    Left = 692
    Top = 363
  end
  object QFuncionario: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_FUN, NOME_FUN'
      'FROM FUNCIONARIO'
      'ORDER BY NOME_FUN')
    Left = 512
    Top = 400
    object QFuncionarioCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Origin = 'COD_FUN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QFuncionarioNOME_FUN: TStringField
      FieldName = 'NOME_FUN'
      Origin = 'NOME_FUN'
      Required = True
      Size = 60
    end
  end
  object dsFuncionario: TDataSource
    DataSet = QFuncionario
    Left = 532
    Top = 403
  end
  object QTotalItens: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT  SUM(OS.VALOR_TOTAL) AS VLR_ITENS'
      '  FROM OS_ITEM OS'
      ' WHERE OS.ID_OS = :ID_OS')
    Left = 648
    Top = 411
    ParamData = <
      item
        Name = 'ID_OS'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QTotalItensVLR_ITENS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_ITENS'
      Origin = 'VLR_ITENS'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object dsQTotalItens: TDataSource
    DataSet = QTotalItens
    Left = 692
    Top = 411
  end
  object frxOS: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o   '
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39646.594642766200000000
    ReportOptions.LastChange = 42759.837246169000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'RelatorioOnReportPrint'
    Left = 555
    Top = 195
    Datasets = <
      item
        DataSetName = 'DBEmpresa'
      end
      item
        DataSetName = 'DBVendaParcelaCliente'
      end
      item
        DataSetName = 'DBVendaParcelas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 559.370076300000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSetName = 'DBVendaParcelas'
        RowCount = 0
        object Shape2: TfrxShapeView
          Top = 166.299320000000000000
          Width = 718.110700000000000000
          Height = 370.393700790000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape7: TfrxShapeView
          Left = 7.559060000000000000
          Top = 245.669450000000000000
          Width = 139.842251180000000000
          Height = 283.464647480000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape6: TfrxShapeView
          Left = 154.960730000000000000
          Top = 301.953000000000000000
          Width = 555.590551180000000000
          Height = 158.740157480000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape1: TfrxShapeView
          Top = 37.795300000000000000
          Width = 445.984322760000000000
          Height = 128.503937010000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape3: TfrxShapeView
          Left = 445.984540000000000000
          Top = 37.795300000000000000
          Width = 272.126160000000000000
          Height = 128.503937010000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object DBEmpresaEMP_NOMEFANTASIA: TfrxMemoView
          Left = 7.559060000000000000
          Top = 49.133890000000000000
          Width = 430.866420000000000000
          Height = 30.236240000000000000
          DataField = 'EMP_NOMEFANTASIA'
          DataSetName = 'DBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[DBEmpresa."EMP_NOMEFANTASIA"]')
          ParentFont = False
        end
        object DBEmpresaEMP_ENDERECO: TfrxMemoView
          Left = 7.559060000000000000
          Top = 83.149660000000000000
          Width = 430.866420000000000000
          Height = 75.590600000000000000
          DataSetName = 'DBEmpresa'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 10.000000000000000000
          Memo.UTF8W = (
            
              '[DBEmpresa."EMP_ENDERECO"], [DBEmpresa."EMP_NUMERO"] [DBEmpresa.' +
              '"EMP_COMPLEMENTO"] [DBEmpresa."EMP_BAIRRO"] '
            
              '[FormatMaskText('#39'99.999-999;0;_'#39', <DBEmpresa."EMP_CEP">)] - [DBE' +
              'mpresa."EMP_CIDADE"] - [DBEmpresa."EMP_UF"]'
            
              'Telefone: [FormatMaskText('#39'\(\0\x\x99\) 9999\.9999;0;_'#39', <DBEmpr' +
              'esa."EMP_FONE">)]')
          ParentFont = False
          WordWrap = False
        end
        object DBVendaParcelasVENCIMENTO: TfrxMemoView
          Left = 453.543600000000000000
          Top = 132.283550000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          DataField = 'EMISSAO'
          DataSetName = 'DBVendaParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy   '
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelas."EMISSAO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo1: TfrxMemoView
          Left = 162.519790000000000000
          Top = 347.716760000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Left = 551.811380000000000000
          Top = 173.858380000000000000
          Width = 158.740159920000000000
          Height = 94.488188980000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 555.590910000000000000
          Top = 177.637910000000000000
          Width = 151.181200000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PARA USO DA '
            'INSTITUI'#199#195'O FINANCEIRA')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          Left = 7.559060000000000000
          Top = 173.858380000000000000
          Width = 536.693159920000000000
          Height = 64.251948980000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo9: TfrxMemoView
          Left = 162.519790000000000000
          Top = 309.921460000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'SACADO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 162.519790000000000000
          Top = 366.614410000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'MUNIC'#205'PIO')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 162.519790000000000000
          Top = 385.512060000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'PRA'#199'A DE PAGTO.')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 162.519790000000000000
          Top = 328.819110000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CPF / CNPJ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 268.346630000000000000
          Top = 309.921460000000000000
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_RAZAOSOCIAL'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_RAZAOSOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 268.346630000000000000
          Top = 347.716760000000000000
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_ENDERECO'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_ENDERECO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 268.346630000000000000
          Top = 366.614410000000000000
          Width = 222.992270000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_ENDCIDADE'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_ENDCIDADE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 268.346630000000000000
          Top = 385.512060000000000000
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ': [DBEmpresa."EMP_PRACAPGTO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 268.346630000000000000
          Top = 328.819110000000000000
          Width = 170.078850000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_CNPJCPF'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_CNPJCPF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 442.205010000000000000
          Top = 328.819110000000000000
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_INSCESTRG'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_INSCESTRG"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 495.118430000000000000
          Top = 366.614410000000000000
          Width = 90.708720000000000000
          Height = 18.897637800000000000
          DataField = 'CLI_ENDUF'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_ENDUF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 589.606680000000000000
          Top = 366.614410000000000000
          Width = 117.165430000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'CEP : [FormatMaskText('#39'99.999-999;0;_'#39', <DBVendaParcelaCliente."' +
              'CLI_ENDCEP">)]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 154.960730000000000000
          Top = 464.882190000000000000
          Width = 555.590910000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Reconhe'#231'o(emos) a exatid'#227'o desta duplicata de venda mercantil / ' +
              'presta'#231#227'o de servi'#231'os, na import'#226'ncia acima que pagarei(emos) '#224' ' +
              '[DBEmpresa."EMP_RAZAOSOCIAL"], ou '#224' sua ordem na pra'#231'a e vencime' +
              'nto indicados.')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 154.960730000000000000
          Top = 411.968770000000000000
          Width = 555.590910000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 264.567100000000000000
          Top = 411.968770000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          Left = 162.519790000000000000
          Top = 415.748300000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'POR'
            'EXTENSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 7.559060000000000000
          Top = 211.653680000000000000
          Width = 536.693260000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 7.559060000000000000
          Top = 192.756030000000000000
          Width = 423.307360000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 430.866420000000000000
          Top = 173.858380000000000000
          Height = 64.252010000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 139.842610000000000000
          Top = 192.756030000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 113.385900000000000000
          Top = 257.008040000000000000
          Height = 264.567100000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 313.700990000000000000
          Top = 192.756030000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 483.779840000000000000
          Top = 517.795610000000000000
          Width = 226.771653540000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo23: TfrxMemoView
          Left = 483.779840000000000000
          Top = 521.575140000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          DataField = 'CLI_RAZAOSOCIAL'
          DataSetName = 'DBVendaParcelaCliente'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DBVendaParcelaCliente."CLI_RAZAOSOCIAL"]')
          ParentFont = False
          WordWrap = False
        end
        object DBVendaParcelasID: TfrxMemoView
          Left = 317.480520000000000000
          Top = 215.433210000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBVendaParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatFloat('#39'000000'#39', <DBVendaParcelas."ID_VENDA">)]-[FormatFlo' +
              'at('#39'00'#39', <DBVendaParcelas."ID">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object DBVendaParcelasVALOR: TfrxMemoView
          Left = 143.622140000000000000
          Top = 215.433210000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSetName = 'DBVendaParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n   '
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DBVendaParcelas."VALOR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 434.645950000000000000
          Top = 215.433210000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'VENCIMENTO'
          DataSetName = 'DBVendaParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy   '
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DBVendaParcelas."VENCIMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 434.645950000000000000
          Top = 181.417440000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 143.622140000000000000
          Top = 196.535560000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor R$')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line12: TfrxLineView
          Left = 154.960730000000000000
          Top = 517.795610000000000000
          Width = 120.944881889764000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo24: TfrxMemoView
          Left = 154.960730000000000000
          Top = 521.575140000000000000
          Width = 120.944960000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA DO ACEITE')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          Left = 188.976500000000000000
          Top = 498.118430000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '/')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          Left = 226.771800000000000000
          Top = 498.118430000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '/')
          ParentFont = False
          WordWrap = False
        end
        object Memo27: TfrxMemoView
          Left = 11.338590000000000000
          Top = 215.433210000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'ID_VENDA'
          DataSetName = 'DBVendaParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DBVendaParcelas."ID_VENDA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 11.338590000000000000
          Top = 196.535560000000000000
          Width = 124.724490000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Venda N'#250'mero')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 317.480520000000000000
          Top = 196.535560000000000000
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N. de Ordem')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 11.338590000000000000
          Top = 177.637910000000000000
          Width = 415.748300000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DUPLICATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object DBEmpresaEMP_CONDICOES: TfrxMemoView
          Left = 154.960730000000000000
          Top = 275.905690000000000000
          Width = 555.590910000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBEmpresa'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'COND. ESPECIAIS : [DBEmpresa."EMP_CONDICOES"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 154.960730000000000000
          Top = 249.448980000000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          DataSetName = 'DBEmpresa'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'DESCONTO DE :           % sobre                                 ' +
              '  at'#233)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 268.346630000000000000
          Top = 415.748300000000000000
          Width = 438.425480000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'courier new'
          Font.Style = []
          Memo.UTF8W = (
            '[DBVendaParcelas."calc_ExtensoValor"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 453.543600000000000000
          Top = 49.133890000000000000
          Width = 253.228510000000000000
          Height = 52.913420000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ : [DBEmpresa."calc_CNPJCPF"]'
            'Inscri'#231#227'o Estadual : [DBEmpresa."calc_INSCESTRG"]'
            '[DBEmpresa."EMP_CIDADE"] - [DBEmpresa."EMP_UF"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo34: TfrxMemoView
          Left = 608.504330000000000000
          Top = 132.283550000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          DataSetName = 'DBVendaParcelas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy   '
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'DUPLICATA')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 15.118120000000000000
          Top = 257.008040000000000000
          Width = 41.574830000000000000
          Height = 264.567100000000000000
          DataSetName = 'DBEmpresa'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DBEmpresa."EMP_RAZAOSOCIAL"]')
          ParentFont = False
          Rotation = 90
        end
        object Memo36: TfrxMemoView
          Left = 117.165430000000000000
          Top = 257.008040000000000000
          Width = 11.338590000000000000
          Height = 264.567100000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ASSINATURA DO EMITENTE')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
    end
  end
  object QItensOS: TFDQuery
    AfterPost = QItensAfterPost
    AfterScroll = QItensAfterScroll
    OnNewRecord = QItensNewRecord
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      
        'SELECT OI.COD_PRO, OI.QUANTIDADE, OI.VALOR_UNITARIO, OI.VALOR_TO' +
        'TAL , P.NOME_PRO, U.DESCRICAO'
      '  FROM OS_ITEM OI'
      '   LEFT OUTER JOIN PRODUTO P ON(P.COD_PRO = OI.COD_PRO)'
      
        '   LEFT OUTER JOIN UNIDADE_MEDIDA U ON(P.CODIGO_UNIDADE_SAIDA = ' +
        'U.CODIGO)'
      ' WHERE OI.ID_OS = :ID_OS')
    Left = 616
    Top = 192
    ParamData = <
      item
        Name = 'ID_OS'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QItensOSCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
    end
    object QItensOSQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QItensOSVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      currency = True
    end
    object QItensOSVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      currency = True
    end
    object QItensOSNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QItensOSDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object frxItensos: TfrxDBDataset
    UserName = 'ITENSOS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRO=COD_PRO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'NOME_PRO=NOME_PRO'
      'DESCRICAO=DESCRICAO')
    DataSet = QItensOS
    BCDToCurrency = False
    Left = 656
    Top = 192
  end
  object QTotalServico: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT SUM(VALOR_TOTAL) AS TOTALNFSE'
      ' FROM OS_ITEM OSI'
      '      LEFT OUTER JOIN PRODUTO P ON(OSI.COD_PRO = P.COD_PRO)'
      
        '      LEFT OUTER JOIN TIPO_PRODUTO TP ON(P.CODIGO_TIPO = TP.CODI' +
        'GO)'
      'WHERE OSI.ID_OS = :ID_OS'
      '  AND TP.SERVICO = '#39'S'#39)
    Left = 64
    Top = 208
    ParamData = <
      item
        Name = 'ID_OS'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QTotalServicoTOTALNFSE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALNFSE'
      Origin = 'TOTALNFSE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QDescricaoServico: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT P.NOME_PRO, P.CODIGO_SERVICO, P.SERVICO_CODIGO'
      ' FROM OS_ITEM OSI'
      '      LEFT OUTER JOIN PRODUTO P ON(OSI.COD_PRO = P.COD_PRO)'
      
        '      LEFT OUTER JOIN TIPO_PRODUTO TP ON(P.CODIGO_TIPO = TP.CODI' +
        'GO)'
      'WHERE OSI.ID_OS = :ID_OS'
      '  AND TP.SERVICO = '#39'S'#39)
    Left = 65400
    Top = 392
    ParamData = <
      item
        Name = 'ID_OS'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QDescricaoServicoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      Size = 80
    end
    object QDescricaoServicoCODIGO_SERVICO: TIntegerField
      FieldName = 'CODIGO_SERVICO'
      Origin = 'CODIGO_SERVICO'
    end
    object QDescricaoServicoSERVICO_CODIGO: TStringField
      FieldName = 'SERVICO_CODIGO'
      Origin = 'SERVICO_CODIGO'
      FixedChar = True
      Size = 8
    end
  end
  object qParametro: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS'
      'WHERE COD_EMP = :COD_EMP')
    Left = 446
    Top = 116
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qParametroNUMERO_INICIO_NFS: TIntegerField
      FieldName = 'NUMERO_INICIO_NFS'
      Origin = 'NUMERO_INICIO_NFS'
    end
    object qParametroALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
      Origin = 'ALIQUOTA'
    end
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT I.ID_OS_ITEM, P.COD_PRO, I.COD_EMP, I.QUANTIDADE AS QUANT' +
        '_ITEM,'
      
        '       I.VALOR_UNITARIO AS VALOR_CUSTO, P.CFOP_VENDAS_CONT_EST A' +
        'S CFOP,'
      '       P.CST_CONT_EST AS CST, P.IPI,P.NOME_PRO, U.DESCRICAO'
      'FROM OS_ITEM I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      ' LEFT OUTER JOIN TIPO_PRODUTO TP ON(P.CODIGO_TIPO = TP.CODIGO)'
      'WHERE I.ID_OS = :COD'
      '  AND TP.SERVICO = '#39'N'#39)
    Left = 152
    Top = 192
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensID_OS_ITEM: TIntegerField
      FieldName = 'ID_OS_ITEM'
      Origin = 'ID_OS_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
    end
    object QBuscaItensQUANT_ITEM: TFloatField
      FieldName = 'QUANT_ITEM'
      Origin = 'QUANTIDADE'
    end
    object QBuscaItensVALOR_CUSTO: TFloatField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_UNITARIO'
    end
    object QBuscaItensCFOP: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP_VENDAS_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensCST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST'
      Origin = 'CST_CONT_EST'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object QBuscaItensIPI: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'IPI'
      Origin = 'IPI'
      ProviderFlags = []
      ReadOnly = True
    end
    object QBuscaItensNOME_PRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PRO'
      Origin = 'NOME_PRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object QBuscaItensDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
end
