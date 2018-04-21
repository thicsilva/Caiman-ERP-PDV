object FrmCTRDuplicata: TFrmCTRDuplicata
  Left = 328
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber [Duplicata]'
  ClientHeight = 476
  ClientWidth = 692
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 692
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 692
    Height = 457
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Vendas'
      object Panel2: TPanel
        Left = 0
        Top = 137
        Width = 684
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 684
          Height = 255
          Align = alTop
          Color = clSilver
          DataSource = DSQParcelas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
              FieldName = 'PARCELA_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'PARC'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCTO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'VENCTO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMDOCUMENTO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'DOCUMENTO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_DUPLICATA'
              Title.Alignment = taCenter
              Title.Caption = 'DUPLICATA'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'TIPO'
              Width = 175
              Visible = True
            end>
        end
        object PanelDoc: TPanel
          Left = 233
          Top = 80
          Width = 217
          Height = 97
          BevelOuter = bvNone
          BevelWidth = 2
          TabOrder = 4
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 217
            Height = 97
            Align = alClient
            Caption = 'N'#250'mero do Documento'
            Color = 16710131
            ParentColor = False
            TabOrder = 0
            object EdtDoc: TEdit
              Left = 16
              Top = 24
              Width = 169
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 20
              TabOrder = 0
            end
            object BtnOK: TButton
              Left = 24
              Top = 56
              Width = 73
              Height = 25
              Caption = '&OK'
              TabOrder = 1
              OnClick = BtnOKClick
            end
            object BtnCancelar: TButton
              Left = 112
              Top = 56
              Width = 73
              Height = 25
              Caption = '&Cancelar'
              TabOrder = 2
              OnClick = BtnCancelarClick
            end
          end
        end
        object BtnDoc: TButton
          Left = 116
          Top = 262
          Width = 105
          Height = 25
          Caption = '&Num.Documento'
          Enabled = False
          TabOrder = 2
          OnClick = BtnDocClick
        end
        object BtnImpressao: TButton
          Left = 223
          Top = 262
          Width = 107
          Height = 25
          Caption = '&Impress'#227'o Duplicata'
          Enabled = False
          TabOrder = 3
          OnClick = BtnImpressaoClick
        end
        object BtnSelecionar: TButton
          Left = 8
          Top = 262
          Width = 105
          Height = 25
          Caption = 'Selecionar Totas'
          Enabled = False
          TabOrder = 1
          OnClick = BtnSelecionarClick
        end
        object BtnAltera: TButton
          Left = 331
          Top = 262
          Width = 105
          Height = 25
          Caption = '&Alterar Parcela'
          Enabled = False
          TabOrder = 5
          OnClick = BtnAlteraClick
        end
        object Button1: TButton
          Left = 438
          Top = 262
          Width = 105
          Height = 25
          Caption = '&Gerar Carn'#234
          TabOrder = 6
          OnClick = Button1Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 684
        Height = 137
        Align = alTop
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Venda'
        end
        object BtnConsVenda: TsSpeedButton
          Left = 113
          Top = 24
          Width = 22
          Height = 22
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
          OnClick = BtnConsVendaClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label2: TLabel
          Left = 529
          Top = 38
          Width = 59
          Height = 13
          Caption = 'Data Venda'
        end
        object Label7: TLabel
          Left = 525
          Top = 110
          Width = 68
          Height = 13
          Caption = 'Cupom Fiscal'
        end
        object Label6: TLabel
          Left = 533
          Top = 86
          Width = 56
          Height = 13
          Caption = 'Nota Fiscal'
        end
        object Label3: TLabel
          Left = 529
          Top = 62
          Width = 59
          Height = 13
          Caption = 'Total Venda'
        end
        object Label4: TLabel
          Left = 8
          Top = 48
          Width = 36
          Height = 13
          Caption = 'Cliente'
        end
        object Label5: TLabel
          Left = 8
          Top = 88
          Width = 73
          Height = 13
          Caption = 'Tipo de Venda'
        end
        object EdtCodVenda: TEdit
          Left = 8
          Top = 24
          Width = 95
          Height = 21
          Alignment = taRightJustify
          Color = clSilver
          TabOrder = 0
          OnEnter = EdtCodVendaEnter
          OnKeyDown = EdtCodVendaKeyDown
        end
        object BtnConfirma: TButton
          Left = 149
          Top = 20
          Width = 64
          Height = 25
          Caption = '&OK'
          TabOrder = 1
          OnClick = BtnConfirmaClick
        end
        object BtnSair: TButton
          Left = 219
          Top = 20
          Width = 64
          Height = 25
          Caption = '&Sair'
          TabOrder = 2
          OnClick = BtnSairClick
        end
        object EdtData: TMaskEdit
          Left = 593
          Top = 32
          Width = 89
          Height = 21
          TabStop = False
          Color = clSilver
          EditMask = '99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '  /  /    '
        end
        object EdtTotalVenda: TCurrencyEdit
          Left = 593
          Top = 56
          Width = 89
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          ZeroEmpty = False
        end
        object EdtNF: TEdit
          Left = 593
          Top = 80
          Width = 89
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object EdtCOO: TEdit
          Left = 593
          Top = 104
          Width = 89
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object EdtNomeCli: TEdit
          Left = 115
          Top = 64
          Width = 399
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object EdtNomeTPV: TEdit
          Left = 115
          Top = 104
          Width = 399
          Height = 21
          TabStop = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object EdtCodTPV: TEdit
          Left = 8
          Top = 104
          Width = 96
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object EdtCodCli: TEdit
          Left = 8
          Top = 64
          Width = 95
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Avulsa'
      ImageIndex = 1
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 38
        Height = 13
        Caption = 'Codigo'
      end
      object Label9: TLabel
        Left = 8
        Top = 56
        Width = 36
        Height = 13
        Caption = 'Cliente'
      end
      object Label10: TLabel
        Left = 8
        Top = 102
        Width = 41
        Height = 13
        Caption = 'Emiss'#227'o'
      end
      object Label11: TLabel
        Left = 336
        Top = 102
        Width = 26
        Height = 13
        Caption = 'Valor'
      end
      object Label12: TLabel
        Left = 112
        Top = 102
        Width = 60
        Height = 13
        Caption = 'Vencimento'
      end
      object Documento: TLabel
        Left = 216
        Top = 102
        Width = 60
        Height = 13
        Caption = 'Documento'
      end
      object Label13: TLabel
        Left = 8
        Top = 142
        Width = 49
        Height = 13
        Caption = 'Duplicata'
      end
      object Label14: TLabel
        Left = 88
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Sequ'#234'ncia'
      end
      object Label15: TLabel
        Left = 160
        Top = 14
        Width = 36
        Height = 13
        Caption = 'Parcela'
      end
      object EdtCodCTR: TEdit
        Left = 8
        Top = 32
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 0
        OnEnter = EdtCodVendaEnter
        OnKeyDown = EdtCodVendaKeyDown
      end
      object BtnOKCTR: TButton
        Left = 256
        Top = 28
        Width = 63
        Height = 25
        Caption = '&OK'
        TabOrder = 2
        OnClick = BtnOKCTRClick
      end
      object BtnSair1: TButton
        Left = 328
        Top = 28
        Width = 63
        Height = 25
        Caption = '&Sair'
        TabOrder = 3
        OnClick = BtnSairClick
      end
      object EdtCodCliente: TEdit
        Left = 8
        Top = 72
        Width = 48
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object EdtNomeCliente: TEdit
        Left = 64
        Top = 72
        Width = 360
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object EdtEmissao: TMaskEdit
        Left = 8
        Top = 117
        Width = 89
        Height = 21
        TabStop = False
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '  /  /    '
      end
      object EdtValor: TCurrencyEdit
        Left = 336
        Top = 117
        Width = 89
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        ZeroEmpty = False
      end
      object EdtVencto: TMaskEdit
        Left = 112
        Top = 117
        Width = 89
        Height = 21
        TabStop = False
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = '  /  /    '
      end
      object BtnImprimir: TButton
        Left = 128
        Top = 204
        Width = 105
        Height = 25
        Caption = '&Impress'#227'o Duplicata'
        TabOrder = 5
        OnClick = BtnImprimirClick
      end
      object BtnLancar: TButton
        Left = 8
        Top = 204
        Width = 105
        Height = 25
        Caption = 'Lan'#231'amento'
        TabOrder = 4
        OnClick = BtnLancarClick
      end
      object EdtDocumento: TEdit
        Left = 216
        Top = 117
        Width = 105
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object EdtDuplicata: TEdit
        Left = 8
        Top = 157
        Width = 105
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object EdtSeq: TEdit
        Left = 88
        Top = 32
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 1
        OnEnter = EdtCodVendaEnter
        OnKeyDown = EdtCodVendaKeyDown
      end
      object EdtParcela: TEdit
        Left = 160
        Top = 29
        Width = 57
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
    end
  end
  object QParcelas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParcelas
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.VALOR_CTR, R.DATA_CTR, R.VE' +
        'NCTO_CTR, R.PARCELA_CTR, R.COD_CLI,'
      
        '       R.NUMDOCUMENTO_CTR, R.COD_VENDA, R.CODIGO_DUPLICATA, R.vl' +
        'rpago_ctr, R.dtpagto_ctr,'
      
        '       C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI, C.C' +
        'EPRES_CLI, C.ESTRES_CLI, C.CNPJ_CLI,'
      
        '       C.DOC_CLI, C.INSC_ESTADUAL, C.FJ_CLI, CL.DESCRICAO, C.num' +
        'res_cli, VV.total_ven,'
      
        '       E.fantasia_emp, e.insc_emp, e.end_emp, e.numero_emp, e.ba' +
        'i_emp, e.cep_emp, e.tel_emp, E.est_emp,'
      '       e.cnpj_emp, e.cid_emp'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER CL'
      'ON (R.CODIGO_CLASSIFICACAO = CL.CODIGO)'
      'INNER JOIN EMPRESA E'
      'on ( E.cod_emp = R.cod_emp )'
      'INNER JOIN VENDAS VV'
      'ON ( VV.cod_ven = R.cod_venda )'
      'WHERE R.COD_VENDA = :CODVEN'
      'ORDER BY R.COD_CTR'
      '')
    Left = 304
    Top = 336
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QParcelasCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QParcelasPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QParcelasDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QParcelasVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QParcelasVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QParcelasNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QParcelasSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QParcelasCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QParcelasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QParcelasENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QParcelasBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QParcelasCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QParcelasCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CLIENTE.CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QParcelasESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QParcelasCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QParcelasDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QParcelasCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER.CODIGO_DUPLICATA'
    end
    object QParcelasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QParcelasINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = 'CLIENTE.INSC_ESTADUAL'
      Size = 30
    end
    object QParcelasFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = 'CLIENTE.FJ_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QParcelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
    object QParcelasNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object QParcelasVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = '"CONTAS_RECEBER"."VLRPAGO_CTR"'
      DisplayFormat = ',R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QParcelasDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = '"CONTAS_RECEBER"."DTPAGTO_CTR"'
    end
    object QParcelasFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Origin = '"EMPRESA"."FANTASIA_EMP"'
      Size = 50
    end
    object QParcelasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = '"VENDAS"."TOTAL_VEN"'
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 2
    end
    object QParcelasINSC_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSC_EMP'
      Origin = 'INSC_EMP'
      ProviderFlags = []
      ReadOnly = True
    end
    object QParcelasEND_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'END_EMP'
      Origin = 'END_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QParcelasNUMERO_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_EMP'
      Origin = 'NUMERO_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QParcelasBAI_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAI_EMP'
      Origin = 'BAI_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QParcelasCEP_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP_EMP'
      Origin = 'CEP_EMP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object QParcelasTEL_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TEL_EMP'
      Origin = 'TEL_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object QParcelasEST_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EST_EMP'
      Origin = 'EST_EMP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QParcelasCNPJ_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ_EMP'
      Origin = 'CNPJ_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QParcelasCID_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CID_EMP'
      Origin = 'CID_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object IBTRParcelas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 240
    Top = 336
  end
  object DSQParcelas: TDataSource
    AutoEdit = False
    DataSet = QParcelas
    Left = 368
    Top = 336
  end
  object RDprint: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.MostrarSETUP = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Duplicatas'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'CARLOS JORGE MARTINS DOS SANTOS JUNIOR'
    RegistroUsuario.SerieProduto = 'SINGLE 6.1 - 1651/0616 (DX101)'
    RegistroUsuario.AutorizacaoKey = 'C0H3Y-SZPXG-TEWNN-69VHR-SXMQ3-5GWHT-6K59B'
    About = 'RDprint 6.1'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Duplicatas'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 36
    TamanhoQteColunas = 140
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    Left = 120
    Top = 336
  end
  object QDuplicata: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_DUPLICATA(:COD, :SEQ)')
    Left = 176
    Top = 336
    ParamData = <
      item
        Name = 'COD'
      end
      item
        Name = 'SEQ'
      end>
    object QDuplicataCOD_DUPLICATA: TIntegerField
      FieldName = 'COD_DUPLICATA'
      Origin = 'SP_DUPLICATA.COD_DUPLICATA'
    end
  end
  object carnes: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41211.410382476900000000
    ReportOptions.LastChange = 41324.408991886570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'Var'
      
        '   ENDERECO: String;                                            ' +
        '     '
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   ENDERECO := TRIM(<PARCELAS."ENDRES_CLI"> + '#39','#39' + <PARCELAS."N' +
        'UMRES_CLI"> + #13 +'
      
        '    <PARCELAS."BAIRES_CLI"> + '#39','#39' +  <PARCELAS."CIDRES_CLI"> + '#39 +
        '/'#39' +  <PARCELAS."ESTRES_CLI"> + '
      '    '#39'-'#39' +  <PARCELAS."CEPRES_CLI"> );'
      'end;'
      ''
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <PARCELAS."VLRPAGO_CTR"> > 0 then'
      '      Memo10.Visible := True'
      '   else'
      
        '      Memo10.Visible := false;                                  ' +
        '                                                      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 520
    Top = 248
    Datasets = <
      item
        DataSet = ItensVenda
        DataSetName = 'ITENSVENDA'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'PARCELAS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 290.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'PARCELAS'
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = 3.779530000000000000
          Top = 14.779530000000000000
          Width = 359.055081500000000000
          Height = 128.503873540000000000
        end
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 19.338590000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'FANTASIA_EMP'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[PARCELAS."FANTASIA_EMP"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 63.913420000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Total :')
        end
        object Memo3: TfrxMemoView
          Left = 60.472480000000000000
          Top = 63.913420000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_VEN'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."TOTAL_VEN"]')
        end
        object Memo4: TfrxMemoView
          Left = 185.196970000000000000
          Top = 63.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Parcela :')
        end
        object Memo5: TfrxMemoView
          Left = 248.669450000000000000
          Top = 63.913420000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'PARCELA_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."PARCELA_CTR"]')
        end
        object Memo6: TfrxMemoView
          Left = 11.338590000000000000
          Top = 41.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Cliente :')
        end
        object Memo7: TfrxMemoView
          Left = 71.811070000000000000
          Top = 41.236240000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'COD_CLI'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."COD_CLI"]')
        end
        object Memo8: TfrxMemoView
          Left = 120.724490000000000000
          Top = 41.236240000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '-')
        end
        object Memo9: TfrxMemoView
          Left = 128.504020000000000000
          Top = 41.236240000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CLI'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."NOME_CLI"]')
        end
        object Memo10: TfrxMemoView
          Left = 11.338590000000000000
          Top = 82.811070000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Vencimento :')
        end
        object Memo11: TfrxMemoView
          Left = 102.047310000000000000
          Top = 82.811070000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VENCTO_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."VENCTO_CTR"]')
        end
        object Memo13: TfrxMemoView
          Left = 215.433210000000000000
          Top = 82.811070000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Valor :')
        end
        object Memo14: TfrxMemoView
          Left = 260.787570000000000000
          Top = 82.811070000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."VALOR_CTR"]')
        end
        object Memo15: TfrxMemoView
          Left = 11.338590000000000000
          Top = 105.488250000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Pagamento :')
        end
        object Memo16: TfrxMemoView
          Left = 128.504020000000000000
          Top = 105.488250000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'DTPAGTO_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."DTPAGTO_CTR"]')
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 125.385900000000000000
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produtos da Venda ( Cod / Descri'#231#227'o / Quant / Valor )')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 297.598640000000000000
          Top = 64.252010000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO_PARCELAS'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."NUMERO_PARCELAS"]')
        end
        object Memo22: TfrxMemoView
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '1'#170' Via')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 286.260050000000000000
          Top = 64.252010000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '/')
        end
        object Shape2: TfrxShapeView
          Left = 374.173470000000000000
          Top = 15.118120000000000000
          Width = 359.055081500000000000
          Height = 128.503873540000000000
        end
        object Memo25: TfrxMemoView
          Left = 381.732530000000000000
          Top = 19.677180000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'FANTASIA_EMP'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[PARCELAS."FANTASIA_EMP"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 381.732530000000000000
          Top = 64.252010000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Total :')
        end
        object Memo27: TfrxMemoView
          Left = 430.866420000000000000
          Top = 64.252010000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_VEN'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."TOTAL_VEN"]')
        end
        object Memo28: TfrxMemoView
          Left = 555.590910000000000000
          Top = 64.252010000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Parcela :')
        end
        object Memo29: TfrxMemoView
          Left = 619.063390000000000000
          Top = 64.252010000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'PARCELA_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."PARCELA_CTR"]')
        end
        object Memo30: TfrxMemoView
          Left = 381.732530000000000000
          Top = 41.574830000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Cliente :')
        end
        object Memo31: TfrxMemoView
          Left = 442.205010000000000000
          Top = 41.574830000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'COD_CLI'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."COD_CLI"]')
        end
        object Memo32: TfrxMemoView
          Left = 491.118430000000000000
          Top = 41.574830000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '-')
        end
        object Memo33: TfrxMemoView
          Left = 498.897960000000000000
          Top = 41.574830000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CLI'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."NOME_CLI"]')
        end
        object Memo34: TfrxMemoView
          Left = 381.732530000000000000
          Top = 83.149660000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Vencimento :')
        end
        object Memo35: TfrxMemoView
          Left = 472.441250000000000000
          Top = 83.149660000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VENCTO_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."VENCTO_CTR"]')
        end
        object Memo36: TfrxMemoView
          Left = 585.827150000000000000
          Top = 83.149660000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Valor :')
        end
        object Memo37: TfrxMemoView
          Left = 631.181510000000000000
          Top = 83.149660000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."VALOR_CTR"]')
        end
        object Memo38: TfrxMemoView
          Left = 381.732530000000000000
          Top = 105.826840000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Pagamento :')
        end
        object Memo39: TfrxMemoView
          Left = 498.897960000000000000
          Top = 105.826840000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'DTPAGTO_CTR'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."DTPAGTO_CTR"]')
        end
        object Memo40: TfrxMemoView
          Left = 381.732530000000000000
          Top = 125.724490000000000000
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produtos da Venda ( Cod / Descri'#231#227'o / Quant / Valor )')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 667.992580000000000000
          Top = 64.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO_PARCELAS'
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '[PARCELAS."NUMERO_PARCELAS"]')
        end
        object Memo42: TfrxMemoView
          Left = 619.842920000000000000
          Top = 19.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '2'#170' Via')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 656.653990000000000000
          Top = 64.590600000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'PARCELAS'
          Memo.UTF8W = (
            '/')
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 185.196970000000000000
        Width = 755.906000000000000000
        DataSet = ItensVenda
        DataSetName = 'ITENSVENDA'
        RowCount = 0
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 362.834880000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 200.315090000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 262.567100000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 359.055350000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo12: TfrxMemoView
          Left = 59.795300000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DataField = 'NOME_PRO'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."NOME_PRO"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'COD_PRO'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."COD_PRO"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 203.315090000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'QUANT'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."QUANT"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 264.567100000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."VALOR"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 50.913420000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 374.173470000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 733.228820000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 570.709030000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line9: TfrxLineView
          Left = 632.961040000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line10: TfrxLineView
          Left = 374.173470000000000000
          Top = 15.118120000000000000
          Width = 359.055350000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo44: TfrxMemoView
          Left = 430.189240000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DataField = 'NOME_PRO'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."NOME_PRO"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 374.173470000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'COD_PRO'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."COD_PRO"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 573.709030000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataField = 'QUANT'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."QUANT"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 634.961040000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR'
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ITENSVENDA."VALOR"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 421.307360000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSet = ItensVenda
          DataSetName = 'ITENSVENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '-')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'PARCELAS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CTR=COD_CTR'
      'PARCELA_CTR=PARCELA_CTR'
      'DATA_CTR=DATA_CTR'
      'VENCTO_CTR=VENCTO_CTR'
      'VALOR_CTR=VALOR_CTR'
      'NUMDOCUMENTO_CTR=NUMDOCUMENTO_CTR'
      'SEQUENCIA_CTR=SEQUENCIA_CTR'
      'COD_VENDA=COD_VENDA'
      'NOME_CLI=NOME_CLI'
      'ENDRES_CLI=ENDRES_CLI'
      'BAIRES_CLI=BAIRES_CLI'
      'CIDRES_CLI=CIDRES_CLI'
      'CEPRES_CLI=CEPRES_CLI'
      'ESTRES_CLI=ESTRES_CLI'
      'CNPJ_CLI=CNPJ_CLI'
      'DOC_CLI=DOC_CLI'
      'CODIGO_DUPLICATA=CODIGO_DUPLICATA'
      'COD_CLI=COD_CLI'
      'INSC_ESTADUAL=INSC_ESTADUAL'
      'FJ_CLI=FJ_CLI'
      'DESCRICAO=DESCRICAO'
      'NUMRES_CLI=NUMRES_CLI'
      'VLRPAGO_CTR=VLRPAGO_CTR'
      'DTPAGTO_CTR=DTPAGTO_CTR'
      'FANTASIA_EMP=FANTASIA_EMP'
      'TOTAL_VEN=TOTAL_VEN'
      'VIA=VIA'
      'COD_AUT=COD_AUT'
      'NUMERO_PARCELAS=NUMERO_PARCELAS')
    DataSet = CDSParcelas
    BCDToCurrency = False
    Left = 520
    Top = 304
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 576
    Top = 256
  end
  object QItensVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRParcelas
    SQL.Strings = (
      
        'select P.cod_pro, P.nome_pro, V.Quant, V.valor, VV.total_ven  fr' +
        'om itens_venda V'
      'inner join PRODUTO P'
      'on ( P.cod_pro = V.cod_pro )'
      'inner join VENDAS VV'
      'on ( VV.cod_ven = V.cod_ven )'
      'where V.cancelado = 0 and v.cod_ven=:codven')
    Left = 448
    Top = 336
    ParamData = <
      item
        Name = 'codven'
      end>
    object QItensVendaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"PRODUTO"."COD_PRO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItensVendaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = '"PRODUTO"."NOME_PRO"'
      Required = True
      Size = 80
    end
    object QItensVendaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = '"ITENS_VENDA"."QUANT"'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensVendaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = '"ITENS_VENDA"."VALOR"'
      Required = True
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 3
    end
    object QItensVendaTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = '"VENDAS"."TOTAL_VEN"'
      Precision = 18
      Size = 2
    end
  end
  object ItensVenda: TfrxDBDataset
    UserName = 'ITENSVENDA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRO=COD_PRO'
      'NOME_PRO=NOME_PRO'
      'QUANT=QUANT'
      'VALOR=VALOR'
      'TOTAL_VEN=TOTAL_VEN')
    DataSet = QItensVenda
    BCDToCurrency = False
    Left = 592
    Top = 312
  end
  object CDSParcelas: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CDSParcelasIndex1'
        Fields = 'COD_AUT'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 240
    object CDSParcelasCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
    end
    object CDSParcelasPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
    end
    object CDSParcelasDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
    end
    object CDSParcelasVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
    end
    object CDSParcelasVALOR_CTR: TCurrencyField
      FieldName = 'VALOR_CTR'
    end
    object CDSParcelasNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Size = 100
    end
    object CDSParcelasSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
    end
    object CDSParcelasCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
    end
    object CDSParcelasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 100
    end
    object CDSParcelasENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Size = 255
    end
    object CDSParcelasBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Size = 100
    end
    object CDSParcelasCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Size = 100
    end
    object CDSParcelasCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
    end
    object CDSParcelasESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Size = 2
    end
    object CDSParcelasCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Size = 30
    end
    object CDSParcelasDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Size = 30
    end
    object CDSParcelasCODIGO_DUPLICATA: TStringField
      FieldName = 'CODIGO_DUPLICATA'
    end
    object CDSParcelasCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
    end
    object CDSParcelasINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Size = 30
    end
    object CDSParcelasFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Size = 1
    end
    object CDSParcelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object CDSParcelasNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Size = 50
    end
    object CDSParcelasVLRPAGO_CTR: TCurrencyField
      FieldName = 'VLRPAGO_CTR'
    end
    object CDSParcelasDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
    end
    object CDSParcelasFANTASIA_EMP: TStringField
      FieldName = 'FANTASIA_EMP'
      Size = 255
    end
    object CDSParcelasTOTAL_VEN: TCurrencyField
      FieldName = 'TOTAL_VEN'
    end
    object CDSParcelasVIA: TStringField
      FieldName = 'VIA'
      Size = 4
    end
    object CDSParcelasCOD_AUT: TAutoIncField
      FieldName = 'COD_AUT'
    end
    object CDSParcelasNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
  end
  object frxDuplicata: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o   '
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39646.594642766200000000
    ReportOptions.LastChange = 42760.859417534730000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'RelatorioOnReportPrint'
    Left = 459
    Top = 203
    Datasets = <
      item
        DataSet = Duplicata
        DataSetName = 'DUPLICATA'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'VALOREXTENSO'
        Value = Null
      end>
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
        DataSet = Duplicata
        DataSetName = 'DUPLICATA'
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
          Left = 7.779530000000000000
          Top = 49.133889999999990000
          Width = 430.866420000000000000
          Height = 30.236240000000000000
          DataSetName = 'DBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[DUPLICATA."FANTASIA_EMP"]')
          ParentFont = False
        end
        object DBEmpresaEMP_ENDERECO: TfrxMemoView
          Left = 7.559060000000000000
          Top = 83.149660000000000000
          Width = 430.866420000000000000
          Height = 75.590600000000000000
          DataSetName = 'DBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          LineSpacing = 10.000000000000000000
          Memo.UTF8W = (
            
              '[DUPLICATA."END_EMP"], [DUPLICATA."NUMERO_EMP"] [DUPLICATA."BAI_' +
              'EMP"] '
            
              '[FormatMaskText('#39'99.999-999;0;_'#39', <DUPLICATA."CEP_EMP">)] - [DUP' +
              'LICATA."BAI_EMP"] - [DUPLICATA."EST_EMP"]'
            
              'Telefone: [FormatMaskText('#39'\(\0\x\x99\) 9999\.9999;0;_'#39', <DUPLIC' +
              'ATA."TEL_EMP">)]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object DBVendaParcelasVENCIMENTO: TfrxMemoView
          Left = 453.543600000000000000
          Top = 132.283550000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
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
            '[DUPLICATA."DATA_CTR"]')
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
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."NOME_CLI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 268.346630000000000000
          Top = 347.716760000000000000
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."ENDRES_CLI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 268.346630000000000000
          Top = 366.614410000000000000
          Width = 222.992270000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."CIDRES_CLI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 268.346630000000000000
          Top = 385.512060000000000000
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ': [DUPLICATA."CID_EMP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 268.346630000000000000
          Top = 328.819110000000000000
          Width = 170.078850000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."CNPJ_CLI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 442.205010000000000000
          Top = 328.819110000000000000
          Width = 264.567100000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."INSC_ESTADUAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 495.118430000000000000
          Top = 366.614410000000000000
          Width = 90.708720000000000000
          Height = 18.897637800000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DUPLICATA."ESTRES_CLI"]')
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
            
              'CEP : [FormatMaskText('#39'99.999-999;0;_'#39', <DUPLICATA."CEPRES_CLI">' +
              ')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 154.960730000000000000
          Top = 464.882190000000000000
          Width = 555.590910000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Reconhe'#231'o(emos) a exatid'#227'o desta duplicata de venda mercantil / ' +
              'presta'#231#227'o de servi'#231'os, na import'#226'ncia acima que pagarei(emos) '#224' ' +
              '[DUPLICATA."FANTASIA_EMP"], ou '#224' sua ordem na pra'#231'a e vencimento' +
              ' indicados.')
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
          Top = 521.575140000000100000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          DataSetName = 'DBVendaParcelaCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DUPLICATA."NOME_CLI"]')
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
            
              '[FormatFloat('#39'000000'#39', <DUPLICATA."COD_VENDA">)]-[FormatFloat('#39'0' +
              '0'#39', <DUPLICATA."COD_CTR">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object DBVendaParcelasVALOR: TfrxMemoView
          Left = 143.622140000000000000
          Top = 215.433210000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
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
            '[DUPLICATA."VALOR_CTR"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 434.645950000000000000
          Top = 215.433210000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
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
            '[DUPLICATA."VENCTO_CTR"]')
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
          Top = 521.575140000000100000
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
          DataSetName = 'DBVendaParcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DUPLICATA."COD_VENDA"]')
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
        object Memo32: TfrxMemoView
          Left = 268.346630000000000000
          Top = 415.748300000000000000
          Width = 438.425480000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'courier new'
          Font.Style = []
          Memo.UTF8W = (
            '[VALOREXTENSO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 453.543600000000000000
          Top = 49.133890000000010000
          Width = 253.228510000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ : [DUPLICATA."CNPJ_EMP"]'
            'Inscri'#231#227'o Estadual : [DUPLICATA."INSC_EMP"]'
            '[DUPLICATA."CID_EMP"] - [DUPLICATA."EST_EMP"]')
          ParentFont = False
          WordWrap = False
          Formats = <
            item
            end
            item
            end
            item
            end>
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DUPLICATA."FANTASIA_EMP"]')
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
  object Duplicata: TfrxDBDataset
    UserName = 'DUPLICATA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CTR=COD_CTR'
      'SEQUENCIA_CTR=SEQUENCIA_CTR'
      'VALOR_CTR=VALOR_CTR'
      'DATA_CTR=DATA_CTR'
      'VENCTO_CTR=VENCTO_CTR'
      'PARCELA_CTR=PARCELA_CTR'
      'COD_CLI=COD_CLI'
      'NUMDOCUMENTO_CTR=NUMDOCUMENTO_CTR'
      'COD_VENDA=COD_VENDA'
      'CODIGO_DUPLICATA=CODIGO_DUPLICATA'
      'VLRPAGO_CTR=VLRPAGO_CTR'
      'DTPAGTO_CTR=DTPAGTO_CTR'
      'NOME_CLI=NOME_CLI'
      'ENDRES_CLI=ENDRES_CLI'
      'BAIRES_CLI=BAIRES_CLI'
      'CIDRES_CLI=CIDRES_CLI'
      'CEPRES_CLI=CEPRES_CLI'
      'ESTRES_CLI=ESTRES_CLI'
      'CNPJ_CLI=CNPJ_CLI'
      'DOC_CLI=DOC_CLI'
      'INSC_ESTADUAL=INSC_ESTADUAL'
      'FJ_CLI=FJ_CLI'
      'NUMRES_CLI=NUMRES_CLI'
      'FANTASIA_EMP=FANTASIA_EMP'
      'INSC_EMP=INSC_EMP'
      'END_EMP=END_EMP'
      'NUMERO_EMP=NUMERO_EMP'
      'BAI_EMP=BAI_EMP'
      'CEP_EMP=CEP_EMP'
      'TEL_EMP=TEL_EMP'
      'EST_EMP=EST_EMP'
      'CNPJ_EMP=CNPJ_EMP'
      'CID_EMP=CID_EMP')
    DataSet = qDupli
    BCDToCurrency = False
    Left = 504
    Top = 192
  end
  object qDupli: TFDQuery
    ObjectView = False
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.VALOR_CTR, R.DATA_CTR, R.VE' +
        'NCTO_CTR, R.PARCELA_CTR, R.COD_CLI,'
      
        '       R.NUMDOCUMENTO_CTR, R.COD_VENDA, R.CODIGO_DUPLICATA, R.vl' +
        'rpago_ctr, R.dtpagto_ctr,'
      
        '       C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI, C.C' +
        'EPRES_CLI, C.ESTRES_CLI, C.CNPJ_CLI,'
      '       C.DOC_CLI, C.INSC_ESTADUAL, C.FJ_CLI,  C.numres_cli,'
      
        '       E.fantasia_emp, e.insc_emp, e.end_emp, e.numero_emp, e.ba' +
        'i_emp, e.cep_emp, e.tel_emp, E.est_emp,'
      '       e.cnpj_emp, e.cid_emp'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN EMPRESA E'
      'on ( E.cod_emp = R.cod_emp )')
    Left = 544
    Top = 144
    object qDupliCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'COD_CTR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDupliSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'SEQUENCIA_CTR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDupliVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'VALOR_CTR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qDupliDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'DATA_CTR'
      Required = True
    end
    object qDupliVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'VENCTO_CTR'
      Required = True
    end
    object qDupliPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'PARCELA_CTR'
      Required = True
    end
    object qDupliCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'COD_CLI'
      Required = True
    end
    object qDupliNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'NUMDOCUMENTO_CTR'
    end
    object qDupliCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'COD_VENDA'
    end
    object qDupliCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CODIGO_DUPLICATA'
    end
    object qDupliVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'VLRPAGO_CTR'
      Precision = 18
      Size = 2
    end
    object qDupliDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'DTPAGTO_CTR'
    end
    object qDupliNOME_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qDupliENDRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDRES_CLI'
      Origin = 'ENDRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDupliBAIRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRES_CLI'
      Origin = 'BAIRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDupliCIDRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDRES_CLI'
      Origin = 'CIDRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDupliCEPRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEPRES_CLI'
      Origin = 'CEPRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object qDupliESTRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTRES_CLI'
      Origin = 'ESTRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qDupliCNPJ_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ_CLI'
      Origin = 'CNPJ_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qDupliDOC_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DOC_CLI'
      Origin = 'DOC_CLI'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDupliINSC_ESTADUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSC_ESTADUAL'
      Origin = 'INSC_ESTADUAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDupliFJ_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FJ_CLI'
      Origin = 'FJ_CLI'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qDupliNUMRES_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMRES_CLI'
      Origin = 'NUMRES_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qDupliFANTASIA_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA_EMP'
      Origin = 'FANTASIA_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDupliINSC_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSC_EMP'
      Origin = 'INSC_EMP'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDupliEND_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'END_EMP'
      Origin = 'END_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qDupliNUMERO_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_EMP'
      Origin = 'NUMERO_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qDupliBAI_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAI_EMP'
      Origin = 'BAI_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDupliCEP_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP_EMP'
      Origin = 'CEP_EMP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object qDupliTEL_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TEL_EMP'
      Origin = 'TEL_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object qDupliEST_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EST_EMP'
      Origin = 'EST_EMP'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qDupliCNPJ_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ_EMP'
      Origin = 'CNPJ_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qDupliCID_EMP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CID_EMP'
      Origin = 'CID_EMP'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
end
