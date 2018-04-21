inherited frmCadPreVenda: TfrmCadPreVenda
  Caption = 'Pr'#233' Venda'
  ClientHeight = 560
  ExplicitHeight = 599
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlGeral: TPanel
    Height = 497
    ExplicitHeight = 497
    inherited cxPaginas: TcxPageControl
      Height = 497
      Properties.ActivePage = PageEdit
      ExplicitHeight = 497
      ClientRectBottom = 493
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 4
        ExplicitTop = 26
        ExplicitWidth = 876
        ExplicitHeight = 467
        inherited cxVisualiza: TcxGrid
          Height = 420
          ExplicitWidth = 870
          ExplicitHeight = 420
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            object cxVisualizaDBTableView1Column4: TcxGridDBColumn
              Caption = 'C'#243'digo Pr'#233
              DataBinding.FieldName = 'COD_PRE'
              Width = 80
            end
            object cxVisualizaDBTableView1Column1: TcxGridDBColumn
              Caption = 'Nome Cliente'
              DataBinding.FieldName = 'NOME_CLI'
              Width = 400
            end
            object cxVisualizaDBTableView1Column2: TcxGridDBColumn
              Caption = 'Data Pr'#233
              DataBinding.FieldName = 'DATA_PRE'
              Width = 100
            end
            object cxVisualizaDBTableView1Column3: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'TOTAL_PRE'
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
        OnShow = PageEditShow
        ExplicitLeft = 4
        ExplicitTop = 26
        ExplicitWidth = 876
        ExplicitHeight = 467
        object Label14: TLabel
          Left = 11
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
        object BtnConsCliFor: TsSpeedButton
          Left = 63
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
        object BtnAddCliFor: TsSpeedButton
          Left = 88
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
        object Label3: TLabel
          Left = 114
          Top = 5
          Width = 37
          Height = 15
          Caption = 'Cliente'
        end
        object Label1: TLabel
          Left = 11
          Top = 56
          Width = 50
          Height = 13
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object BtnConsVend: TsSpeedButton
          Left = 63
          Top = 73
          Width = 23
          Height = 21
          Hint = 'Consultar Vendedor'
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
          OnClick = BtnConsVendClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtnAddVend: TsSpeedButton
          Left = 88
          Top = 73
          Width = 23
          Height = 21
          Hint = 'Cadastrar Vendedor'
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
          OnClick = BtnAddVendClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label2: TLabel
          Left = 114
          Top = 53
          Width = 50
          Height = 15
          Caption = 'Vendedor'
        end
        object Label4: TLabel
          Left = 11
          Top = 104
          Width = 57
          Height = 13
          Caption = 'Tipo Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object BtnConsTipoVenda: TsSpeedButton
          Left = 63
          Top = 121
          Width = 23
          Height = 21
          Hint = 'Consultar Tipo Venda'
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
          OnClick = BtnConsTipoVendaClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object BtnAddTipoVenda: TsSpeedButton
          Left = 88
          Top = 121
          Width = 23
          Height = 21
          Hint = 'Cadastrar Tipo Venda'
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
          OnClick = BtnAddTipoVendaClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label5: TLabel
          Left = 114
          Top = 101
          Width = 59
          Height = 15
          Caption = 'Tipo Venda'
        end
        object Label7: TLabel
          Left = 688
          Top = 5
          Width = 81
          Height = 15
          Caption = 'Total Pr'#233' Venda'
        end
        object edtCodCliente: TcxDBTextEdit
          Left = 11
          Top = 24
          DataBinding.DataField = 'COD_CLI'
          DataBinding.DataSource = dsPrincipal
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 46
        end
        object cxDBCODIGO_CLI: TcxDBLookupComboBox
          Left = 114
          Top = 24
          TabStop = False
          DataBinding.DataField = 'COD_CLI'
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
          TabOrder = 1
          Width = 375
        end
        object edtCodVendedor: TcxDBTextEdit
          Left = 11
          Top = 72
          DataBinding.DataField = 'COD_VEND'
          DataBinding.DataSource = dsPrincipal
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          Width = 46
        end
        object cxDBCODIGO_VEND: TcxDBLookupComboBox
          Left = 114
          Top = 72
          TabStop = False
          DataBinding.DataField = 'COD_VEND'
          DataBinding.DataSource = dsPrincipal
          Properties.CharCase = ecUpperCase
          Properties.DropDownAutoSize = True
          Properties.GridMode = True
          Properties.KeyFieldNames = 'COD_VEND'
          Properties.ListColumns = <
            item
              FieldName = 'NOME_VEND'
            end>
          Properties.ListSource = dsVendedor
          Properties.ReadOnly = True
          TabOrder = 3
          Width = 375
        end
        object edtCodTipoVenda: TcxDBTextEdit
          Left = 11
          Top = 120
          DataBinding.DataField = 'COD_TPV'
          DataBinding.DataSource = dsPrincipal
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          OnExit = edtCodTipoVendaExit
          Width = 46
        end
        object cxDBCODIGO_TIPOVENDA: TcxDBLookupComboBox
          Left = 117
          Top = 120
          TabStop = False
          DataBinding.DataField = 'COD_TPV'
          DataBinding.DataSource = dsPrincipal
          Properties.CharCase = ecUpperCase
          Properties.DropDownAutoSize = True
          Properties.GridMode = True
          Properties.KeyFieldNames = 'COD_TPV'
          Properties.ListColumns = <
            item
              FieldName = 'NOME_TPV'
            end>
          Properties.ListSource = dsTipoVenda
          Properties.ReadOnly = True
          TabOrder = 5
          Width = 375
        end
        object Panel4: TPanel
          Left = 0
          Top = 151
          Width = 876
          Height = 316
          Align = alBottom
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelWidth = 2
          ParentBackground = False
          TabOrder = 6
          ExplicitTop = 149
          object Label16: TLabel
            Left = 2
            Top = 2
            Width = 872
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Itens'
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            ExplicitWidth = 30
          end
          object Label17: TLabel
            Left = 11
            Top = 21
            Width = 53
            Height = 15
            Caption = 'Cod.Prod.'
          end
          object Label18: TLabel
            Left = 227
            Top = 21
            Width = 114
            Height = 15
            Caption = 'Descri'#231#227'o do Produto'
          end
          object Label19: TLabel
            Left = 11
            Top = 64
            Width = 62
            Height = 15
            Caption = 'Quantidade'
          end
          object Label20: TLabel
            Left = 86
            Top = 64
            Width = 55
            Height = 15
            Caption = 'Vl.Unit'#225'rio'
          end
          object Label23: TLabel
            Left = 292
            Top = 64
            Width = 49
            Height = 15
            Caption = 'Desc.(R$)'
          end
          object Label24: TLabel
            Left = 360
            Top = 64
            Width = 26
            Height = 15
            Caption = 'Total'
          end
          object Label10: TLabel
            Left = 225
            Top = 64
            Width = 46
            Height = 15
            Caption = 'Desc.(%)'
          end
          object Label6: TLabel
            Left = 158
            Top = 64
            Width = 26
            Height = 15
            Caption = 'Total'
          end
          object BtnConsPro: TsSpeedButton
            Left = 174
            Top = 36
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
            Left = 199
            Top = 36
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
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object DBGrid1: TDBGrid
            Left = 2
            Top = 110
            Width = 872
            Height = 204
            TabStop = False
            Align = alBottom
            Color = clGradientInactiveCaption
            DataSource = DSBuscaItens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Color = 16776176
                Expanded = False
                FieldName = 'ORDEM'
                Title.Alignment = taCenter
                Title.Caption = 'ORD'
                Width = 29
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'COD_PRO'
                Title.Alignment = taCenter
                Title.Caption = 'COD.'
                Width = 54
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'NOME_PRO'
                Title.Alignment = taCenter
                Title.Caption = 'PRODUTO'
                Width = 316
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'QUANT'
                Title.Alignment = taCenter
                Width = 42
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Alignment = taCenter
                Title.Caption = 'UND'
                Width = 30
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'VALOR'
                Title.Alignment = taCenter
                Width = 58
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'CALC_TOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'TOTAL'
                Width = 66
                Visible = True
              end
              item
                Color = 16776176
                Expanded = False
                FieldName = 'DESCONTO'
                Title.Alignment = taCenter
                Width = 65
                Visible = True
              end>
          end
          object edtProduto: TcxDBTextEdit
            Left = 9
            Top = 35
            DataBinding.DataField = 'COD_PRO'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            TabOrder = 1
            OnExit = edtProdutoExit
            Width = 159
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 225
            Top = 35
            TabStop = False
            DataBinding.DataField = 'COD_PRO'
            DataBinding.DataSource = dsItensPre
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
            TabOrder = 2
            Width = 416
          end
          object EdtQuant: TcxDBTextEdit
            Left = 11
            Top = 80
            DataBinding.DataField = 'QUANT'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            TabOrder = 3
            Width = 66
          end
          object EdtValorUnit: TcxDBTextEdit
            Left = 86
            Top = 80
            DataBinding.DataField = 'VALOR'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            TabOrder = 4
            OnExit = EdtValorUnitExit
            Width = 66
          end
          object EdtDescPerc: TCurrencyEdit
            Left = 225
            Top = 81
            Width = 56
            Height = 21
            Margins.Left = 1
            Margins.Top = 1
            AutoSize = False
            CheckOnExit = True
            DisplayFormat = ',#0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            FormatOnEditing = True
            ParentFont = False
            TabOrder = 6
            ZeroEmpty = False
            OnExit = EdtDescPercExit
          end
          object EdtDescVr: TcxDBTextEdit
            Left = 292
            Top = 80
            DataBinding.DataField = 'DESCONTO'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            TabOrder = 7
            OnExit = EdtDescVrExit
            Width = 61
          end
          object RzDBNavigator1: TRzDBNavigator
            AlignWithMargins = True
            Left = 463
            Top = 64
            Width = 148
            Height = 40
            DataSource = dsItensPre
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
            BorderOuter = fsNone
            GradientColorStyle = gcsCustom
            TabOrder = 9
            Transparent = True
            VisualStyle = vsClassic
          end
          object EdtTotalProd: TcxDBTextEdit
            Left = 359
            Top = 81
            DataBinding.DataField = 'TOTAL_GERAL'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            Properties.ReadOnly = True
            TabOrder = 8
            OnExit = EdtTotalProdExit
            Width = 98
          end
          object EdtTotalBR: TcxDBTextEdit
            Left = 159
            Top = 80
            DataBinding.DataField = 'TOTAL'
            DataBinding.DataSource = dsItensPre
            Properties.CharCase = ecUpperCase
            Properties.ReadOnly = True
            TabOrder = 5
            OnExit = EdtTotalBRExit
            Width = 61
          end
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 688
          Top = 26
          DataBinding.DataField = 'TOTAL_PRE'
          DataBinding.DataSource = dsPrincipal
          Properties.ReadOnly = True
          TabOrder = 7
          Width = 153
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 1114880
  end
  inherited dsPrincipal: TDataSource
    Left = 560
    Top = 16
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    OnNewRecord = QPrincipalNewRecord
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'SELECT P.*, C.NOME_CLI'
      
        '  FROM PRE_VENDA P LEFT OUTER JOIN CLIENTE C ON(P.COD_CLI = C.CO' +
        'D_CLI)')
    object QPrincipalCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPrincipalDATA_PRE: TDateField
      FieldName = 'DATA_PRE'
      Required = True
    end
    object QPrincipalCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Required = True
    end
    object QPrincipalCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Required = True
    end
    object QPrincipalCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Required = True
    end
    object QPrincipalSTATUS_PRE: TIntegerField
      FieldName = 'STATUS_PRE'
      Required = True
    end
    object QPrincipalTOTAL_PRE: TBCDField
      FieldName = 'TOTAL_PRE'
      currency = True
      Precision = 18
      Size = 3
    end
    object QPrincipalHORA_PRE: TTimeField
      FieldName = 'HORA_PRE'
    end
    object QPrincipalCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
    end
    object QPrincipalDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object QPrincipalOBS_PRE: TStringField
      FieldName = 'OBS_PRE'
      Size = 500
    end
    object QPrincipalDESCONTO_PRE: TBCDField
      FieldName = 'DESCONTO_PRE'
      Precision = 18
      Size = 2
    end
    object QPrincipalCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Required = True
    end
    object QPrincipalSEQUENCIA_PAF: TLargeintField
      FieldName = 'SEQUENCIA_PAF'
      Required = True
    end
    object QPrincipalSENHA_FECHAR_VENDA: TStringField
      FieldName = 'SENHA_FECHAR_VENDA'
    end
    object QPrincipalCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 100
    end
    object QPrincipalNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 1114928
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
    DesignInfo = 1049424
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_CLI, NOME_CLI FROM CLIENTE ORDER BY NOME_CLI')
    Left = 512
    Top = 120
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
    Left = 532
    Top = 123
  end
  object dsVendedor: TDataSource
    DataSet = QVendedor
    Left = 524
    Top = 171
  end
  object QVendedor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_VEND, NOME_VEND FROM VENDEDOR ORDER BY NOME_VEND')
    Left = 504
    Top = 168
    object QVendedorCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'COD_VEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendedorNOME_VEND: TStringField
      FieldName = 'NOME_VEND'
      Origin = 'NOME_VEND'
      Required = True
      Size = 50
    end
  end
  object QTipoVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_TPV, NOME_TPV FROM TIPO_VENDA ORDER BY NOME_TPV')
    Left = 504
    Top = 208
    object QTipoVendaCOD_TPV: TIntegerField
      FieldName = 'COD_TPV'
      Origin = 'COD_TPV'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTipoVendaNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'NOME_TPV'
      Required = True
      Size = 50
    end
  end
  object dsTipoVenda: TDataSource
    DataSet = QTipoVenda
    Left = 524
    Top = 211
  end
  object QBuscaItens: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    SQL.Strings = (
      'SELECT I.*, P.NOME_PRO, U.DESCRICAO'
      'FROM ITENS_PRE_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE I.COD_PRE = :CODPRE'
      'ORDER BY I.ORDEM')
    Left = 816
    Top = 224
    ParamData = <
      item
        Name = 'CODPRE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QBuscaItensCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = 'ITENS_PRE_VENDA.COD_PRE'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_PRE_VENDA.ORDEM'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_PRE_VENDA.COD_PRO'
      Required = True
    end
    object QBuscaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_PRE_VENDA.DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_PRE_VENDA.COD_EMP'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_PRE_VENDA.QUANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_PRE_VENDA.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QBuscaItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_PRE_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_PRE_VENDA.CANCELADO'
      Required = True
    end
    object QBuscaItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
  end
  object DSBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 848
    Top = 224
  end
  object QItensPre: TFDQuery
    AfterInsert = QPrincipalAfterInsert
    AfterEdit = QPrincipalAfterEdit
    BeforeCancel = QPrincipalBeforeCancel
    BeforeDelete = QPrincipalBeforeDelete
    OnCalcFields = QItensPreCalcFields
    OnNewRecord = QItensPreNewRecord
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    UpdateTransaction = TRPrincipal
    SQL.Strings = (
      'SELECT *'
      '  FROM ITENS_PRE_VENDA'
      ' WHERE COD_PRE = :COD_PRE')
    Left = 520
    Top = 64
    ParamData = <
      item
        Name = 'COD_PRE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QItensPreCOD_PRE: TIntegerField
      FieldName = 'COD_PRE'
      Origin = 'COD_PRE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensPreORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensPreCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'COD_PRO'
      Required = True
    end
    object QItensPreDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QItensPreCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object QItensPreQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'QUANT'
      Precision = 18
      Size = 3
    end
    object QItensPreVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 3
    end
    object QItensPrePRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensPreCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'CANCELADO'
      Required = True
    end
    object QItensPreCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 100
    end
    object QItensPreTOTAL_GERAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_GERAL'
      currency = True
      Calculated = True
    end
    object QItensPreTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      currency = True
      Calculated = True
    end
  end
  object dsItensPre: TDataSource
    DataSet = QItensPre
    OnStateChange = dsPrincipalStateChange
    Left = 552
    Top = 64
  end
  object QProdutos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRPrincipal
    SQL.Strings = (
      'SELECT COD_PRO, NOME_PRO, VALOR_PRO'
      '  FROM PRODUTO'
      'ORDER BY NOME_PRO')
    Left = 808
    Top = 264
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
  object dsProduto: TDataSource
    DataSet = QProdutos
    Left = 844
    Top = 259
  end
  object qTotal: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT SUM((QUANT * VALOR) - DESCONTO) AS TOTAL  FROM ITENS_PRE_' +
        'VENDA WHERE COD_PRE = :COD_PRE')
    Left = 840
    Top = 176
    ParamData = <
      item
        Name = 'COD_PRE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qTotalTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
  end
end
