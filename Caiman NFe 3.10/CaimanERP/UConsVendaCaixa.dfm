object FrmConsVendaCaixa: TFrmConsVendaCaixa
  Left = 336
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas/Caixa'
  ClientHeight = 579
  ClientWidth = 771
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 560
    Width = 771
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 265
    Width = 771
    Height = 295
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object PageControl: TPageControl
      Left = 2
      Top = 2
      Width = 767
      Height = 255
      ActivePage = Vista
      Align = alTop
      TabOrder = 0
      OnMouseDown = PageControlMouseDown
      object Vista: TTabSheet
        Caption = 'Vendas'
        object DBGridVendas: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSQVendas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'D.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUPOM_FISCAL_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'CUPOM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'TOTAL VENDA'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Width = 325
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USU'
              Title.Alignment = taCenter
              Title.Caption = 'OPERADOR'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA'
              Title.Alignment = taCenter
              Visible = True
            end>
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Recebimento'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid6: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          Align = alClient
          Color = clSilver
          DataSource = DSQRec
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'D.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEQUENCIA_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'SEQ.'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPAGTO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'DT PAGTO.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCTO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'VENCTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEVOLUCAO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'DEVOL.'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRPAGO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'VLR PAGO'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACRESCIMO_RECEBIDO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'ACRES.REC.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO_CONCEDIDO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'DESC.REC.'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACRESCIMO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'ACRESC.'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO_CTR'
              Title.Alignment = taCenter
              Title.Caption = 'DESC.'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'VENDA'
              Visible = True
            end>
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Vendas c/Desconto'
        ImageIndex = 7
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid8: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSVendasDesc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'COD.'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BRUTO'
              Title.Alignment = taCenter
              Title.Caption = 'VL.BRUTO'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DESC.'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'TOTAL'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAXA'
              Title.Alignment = taCenter
              Title.Caption = 'DESC.(%)'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USU'
              Title.Alignment = taCenter
              Title.Caption = 'OPERADOR'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA'
              Title.Alignment = taCenter
              Width = 53
              Visible = True
            end>
        end
      end
      object TabSheet8: TTabSheet
        Caption = 'Vendas Canceladas'
        ImageIndex = 8
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid9: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSVendasExc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'C'#211'D.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAI'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUPOM_FISCAL_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'CUPOM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DESCONTO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'TOTAL'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Width = 325
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USU'
              Title.Alignment = taCenter
              Title.Caption = 'OPERADOR'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA'
              Title.Alignment = taCenter
              Visible = True
            end>
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Itens Cancelados'
        ImageIndex = 9
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid10: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSItensExcluidos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'COD_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'VENDA'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_PRO'
              Title.Alignment = taCenter
              Title.Caption = 'PROD.'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEM'
              Title.Alignment = taCenter
              Title.Caption = 'ORD'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_PRO'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
              Width = 339
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANT'
              Title.Alignment = taCenter
              Title.Caption = 'QUANT.'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Title.Alignment = taCenter
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Alignment = taCenter
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DATA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_HORA_VEN'
              Title.Alignment = taCenter
              Title.Caption = 'DATA_HORA'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USU'
              Title.Alignment = taCenter
              Title.Caption = 'OPERADOR'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMP'
              Title.Alignment = taCenter
              Title.Caption = 'EMP'
              Width = 31
              Visible = True
            end>
        end
      end
      object TabSheet11: TTabSheet
        Caption = 'Cheques'
        ImageIndex = 11
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGridCheques: TDBGrid
          Left = 0
          Top = 0
          Width = 759
          Height = 227
          TabStop = False
          Align = alClient
          Color = clSilver
          DataSource = DSCheques
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'COD_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'COD.'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Alignment = taCenter
              Title.Caption = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMITENTE'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_BAN'
              Title.Alignment = taCenter
              Title.Caption = 'BANCO'
              Width = 274
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENCIA_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'AGENCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTA_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'CONTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMISSAO_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'EMISS'#195'O'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENCTO_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'VENCTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'VALOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBS_CHE'
              Title.Alignment = taCenter
              Title.Caption = 'OBSERVA'#199#195'O'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'COD.VENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CAIXA'
              Title.Alignment = taCenter
              Title.Caption = 'CAIXA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_USU'
              Title.Alignment = taCenter
              Title.Caption = 'USU'#193'RIO'
              Width = 99
              Visible = True
            end>
        end
      end
    end
    object BtnItens: TButton
      Left = 249
      Top = 264
      Width = 97
      Height = 25
      Caption = '&Itens'
      TabOrder = 1
      OnClick = BtnItensClick
    end
    object BtnSegundaVia: TButton
      Left = 425
      Top = 264
      Width = 97
      Height = 25
      Caption = '2'#170' &Via Cupom'
      TabOrder = 2
      OnClick = BtnSegundaViaClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 265
    Align = alTop
    TabOrder = 2
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 240
      Height = 263
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label7: TLabel
        Left = 8
        Top = 128
        Width = 27
        Height = 13
        Caption = 'Caixa'
      end
      object Label18: TLabel
        Left = 8
        Top = 168
        Width = 50
        Height = 13
        Caption = 'Operador'
      end
      object BitBtn1: TBitBtn
        Left = 159
        Top = 224
        Width = 65
        Height = 25
        Caption = '&Sair'
        TabOrder = 3
        OnClick = BitBtn1Click
      end
      object BtnImp: TBitBtn
        Left = 87
        Top = 224
        Width = 65
        Height = 25
        Caption = '&Imprimir'
        TabOrder = 4
        OnClick = BtnImpClick
      end
      object BtnOK: TBitBtn
        Left = 15
        Top = 224
        Width = 65
        Height = 25
        Caption = '&OK'
        TabOrder = 2
        OnClick = BtnOKClick
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 217
        Height = 105
        Caption = 'Per'#237'odo'
        TabOrder = 0
        object EdtDataIni: TMaskEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          Color = clSilver
          EditMask = '00/00/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object EdtDataFin: TMaskEdit
          Left = 16
          Top = 72
          Width = 89
          Height = 21
          Color = clSilver
          EditMask = '00/00/0000;1;_'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object EdtHoraIni: TMaskEdit
          Left = 128
          Top = 40
          Width = 65
          Height = 21
          Color = clSilver
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 1
          Text = '  :  :  '
          OnExit = EdtHoraIniExit
        end
        object EdtHoraFin: TMaskEdit
          Left = 128
          Top = 72
          Width = 65
          Height = 21
          Color = clSilver
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 3
          Text = '  :  :  '
          OnExit = EdtHoraIniExit
        end
        object CheckHora: TCheckBox
          Left = 16
          Top = 16
          Width = 177
          Height = 17
          Caption = 'Usar Hora'
          TabOrder = 4
          OnClick = CheckHoraClick
        end
      end
      object ComboCaixa: TComboBox
        Left = 8
        Top = 144
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
      object ComboOperador: TComboBox
        Left = 8
        Top = 184
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 5
      end
    end
    object Panel4: TPanel
      Left = 241
      Top = 1
      Width = 287
      Height = 263
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label8: TLabel
        Left = 32
        Top = 36
        Width = 67
        Height = 13
        Caption = 'Recebimento'
      end
      object Label9: TLabel
        Left = 16
        Top = 12
        Width = 85
        Height = 13
        Caption = 'Total das Vendas'
      end
      object Label10: TLabel
        Left = 64
        Top = 61
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object EdtRecebimento: TCurrencyEdit
        Left = 104
        Top = 32
        Width = 121
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtTotalVendas: TCurrencyEdit
        Left = 104
        Top = 8
        Width = 121
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
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtTotal: TCurrencyEdit
        Left = 104
        Top = 56
        Width = 121
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
        TabOrder = 2
        ZeroEmpty = False
      end
      object DBGrid2: TDBGrid
        Left = 2
        Top = 88
        Width = 283
        Height = 173
        Align = alBottom
        Color = clSilver
        DataSource = DSFormas
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Alignment = taCenter
            Width = 102
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 528
      Top = 1
      Width = 242
      Height = 263
      Align = alRight
      Alignment = taLeftJustify
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 2
      object GroupBox2: TGroupBox
        Left = 10
        Top = 82
        Width = 224
        Height = 95
        Caption = 'Cheques'
        Color = 16710131
        ParentColor = False
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 24
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ch. A Vista'
        end
        object Label13: TLabel
          Left = 8
          Top = 48
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ch.A Prazo'
        end
        object Label14: TLabel
          Left = 8
          Top = 72
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total Cheques'
        end
        object EdtChequeVista: TCurrencyEdit
          Left = 88
          Top = 16
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtChequePrazo: TCurrencyEdit
          Left = 88
          Top = 40
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
        object EdtTotalCheque: TCurrencyEdit
          Left = 88
          Top = 64
          Width = 121
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
          TabOrder = 2
          ZeroEmpty = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 10
        Top = 184
        Width = 224
        Height = 73
        Caption = 'Vendas Canceladas'
        Color = 16710131
        ParentColor = False
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 24
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vendas Canc.'
        end
        object Label16: TLabel
          Left = 8
          Top = 48
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Itens Canc.'
        end
        object EdtVendasCanceladas: TCurrencyEdit
          Left = 88
          Top = 18
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtItensCancelados: TCurrencyEdit
          Left = 88
          Top = 44
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 8
        Width = 225
        Height = 73
        Caption = 'Descontos Concedidos'
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 21
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'SubTotal'
        end
        object Label2: TLabel
          Left = 8
          Top = 45
          Width = 65
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Itens'
        end
        object EdtDescontosVendas: TCurrencyEdit
          Left = 88
          Top = 16
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtDescontosItens: TCurrencyEdit
          Left = 88
          Top = 40
          Width = 121
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
      end
    end
  end
  object QTotalFormas: TFDQuery
    AfterScroll = QTotalFormasAfterScroll
    Connection = DM.IBDatabase
    Transaction = IBTRVendas
    SQL.Strings = (
      'SELECT SUM(I.VALOR) TOTAL, I.COD_FORMA, F.DESCRICAO, F.TIPO'
      'FROM VENDAS_FORMAS_PAGAMENTO I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VENDA = V.COD_VEN)'
      'INNER JOIN FORMAS_PAGAMENTO F'
      'ON (I.COD_FORMA = F.CODIGO)'
      'GROUP BY I.COD_FORMA, F.DESCRICAO, F.TIPO'
      ''
      ''
      ''
      '')
    Left = 104
    Top = 344
    object QTotalFormasTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QTotalFormasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Required = True
    end
    object QTotalFormasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object QTotalFormasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QTotalRec: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT SUM(VLRPAGO_CTR) AS VALORPAGO'
      'FROM CONTAS_RECEBER')
    Left = 24
    Top = 344
  end
  object QVendas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT I.VALOR, F.DESCRICAO, V.COD_VEN, V.DATA_VEN, V.COD_CAI, V' +
        '.COD_EMP, V.TOTAL_VEN, V.DESCONTO_VEN, CAST(DATA_HORA_VEN AS TIM' +
        'E) HORA, V.R04_CCF, V.CUPOM_FISCAL_VEN, C.NOME_CLI, U.NOME_USU'
      'FROM VENDAS_FORMAS_PAGAMENTO I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VENDA = V.COD_VEN)'
      'INNER JOIN FORMAS_PAGAMENTO F'
      'ON (I.COD_FORMA = F.CODIGO)'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'INNER JOIN USUARIO U'
      'ON (V.COD_USU = U.COD_USU)')
    Left = 176
    Top = 344
    object QVendasCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QVendasDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QVendasCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QVendasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'VENDAS.COD_EMP'
      Required = True
    end
    object QVendasTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasHORA: TTimeField
      FieldName = 'HORA'
    end
    object QVendasNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QVendasNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QVendasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VENDAS_FORMAS_PAGAMENTO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMAS_PAGAMENTO.DESCRICAO'
      Required = True
    end
    object QVendasR04_CCF: TIntegerField
      FieldName = 'R04_CCF'
      Origin = 'VENDAS.R04_CCF'
    end
    object QVendasCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
  end
  object DSQVendas: TDataSource
    AutoEdit = False
    DataSet = QVendas
    Left = 176
    Top = 400
  end
  object QRec: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT R.*, C.NOME_CLI'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)')
    Left = 240
    Top = 344
    object QRecCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QRecSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QRecCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QRecDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QRecCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QRecCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QRecVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QRecVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QRecVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecACRESCIMO_CTR: TBCDField
      FieldName = 'ACRESCIMO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDESCONTO_CTR: TBCDField
      FieldName = 'DESCONTO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QRecOBS_CTR: TStringField
      FieldName = 'OBS_CTR'
      Origin = 'CONTAS_RECEBER.OBS_CTR'
      Size = 60
    end
    object QRecACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER.COD_CAI'
    end
    object QRecCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'CONTAS_RECEBER.COD_COB'
      Required = True
    end
    object QRecCAIXA_EMISSAO_CTR: TIntegerField
      FieldName = 'CAIXA_EMISSAO_CTR'
      Origin = 'CONTAS_RECEBER.CAIXA_EMISSAO_CTR'
    end
    object QRecPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QRecDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRecNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QRecCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER.CODIGO_DUPLICATA'
    end
    object QRecCODIGO_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_FORMA_PAGAMENTO'
      Origin = 'CONTAS_RECEBER.CODIGO_FORMA_PAGAMENTO'
    end
  end
  object DSQRec: TDataSource
    AutoEdit = False
    DataSet = QRec
    Left = 240
    Top = 400
  end
  object QVendasDesc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT (V.DESCONTO_VEN + V.TOTAL_VEN) BRUTO, V.DESCONTO_VEN, ((V' +
        '.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) TAXA, V.C' +
        'OD_VEN, V.DATA_VEN, V.COD_CAI, V.COD_EMP, V.TOTAL_VEN, CAST(DATA' +
        '_HORA_VEN AS TIME) HORA, C.NOME_CLI, U.NOME_USU'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'INNER JOIN USUARIO U'
      'ON (V.COD_USU = U.COD_USU)')
    Left = 304
    Top = 344
    object QVendasDescBRUTO: TBCDField
      FieldName = 'BRUTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasDescDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasDescTAXA: TBCDField
      FieldName = 'TAXA'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QVendasDescCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS.COD_VEN'
      Required = True
    end
    object QVendasDescDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QVendasDescCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QVendasDescCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'VENDAS.COD_EMP'
      Required = True
    end
    object QVendasDescTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasDescHORA: TTimeField
      FieldName = 'HORA'
    end
    object QVendasDescNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QVendasDescNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
  end
  object DSVendasDesc: TDataSource
    AutoEdit = False
    DataSet = QVendasDesc
    Left = 304
    Top = 400
  end
  object QBuscaItens: TFDQuery
    OnCalcFields = QBuscaItensCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.*, (I.QUANT * I.VALOR) TOTAL, P.NOME_PRO, P.CODIGO_BARR' +
        'A_PRO'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY ORDEM')
    Left = 456
    Top = 344
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QBuscaItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QBuscaItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QBuscaItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      Required = True
      Precision = 18
      Size = 3
    end
    object QBuscaItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
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
      Calculated = True
    end
    object QBuscaItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QBuscaItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QBuscaItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ITENS_VENDA.COD_VEND'
      Required = True
    end
    object QBuscaItensCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
  end
  object QVendasExc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT V.COD_VEN, V.DATA_VEN, V.COD_CAI, V.COD_EMP, '
      
        'V.CUPOM_FISCAL_VEN, V.TOTAL_VEN,  V.DESCONTO_VEN, CAST(DATA_HORA' +
        '_VEN AS TIME) HORA, C.NOME_CLI, U.NOME_USU'
      'FROM VENDAS V'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      'INNER JOIN USUARIO U'
      'ON (V.COD_USU = U.COD_USU)'
      '')
    Left = 384
    Top = 344
    object QVendasExcCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'VENDAS_EXCLUIDAS.COD_VEN'
      Required = True
    end
    object QVendasExcDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS_EXCLUIDAS.DATA_VEN'
      Required = True
    end
    object QVendasExcCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS_EXCLUIDAS.COD_CAI'
      Required = True
    end
    object QVendasExcCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'VENDAS_EXCLUIDAS.COD_EMP'
      Required = True
    end
    object QVendasExcTOTAL_VEN: TBCDField
      FieldName = 'TOTAL_VEN'
      Origin = 'VENDAS_EXCLUIDAS.TOTAL_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasExcDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS_EXCLUIDAS.DESCONTO_VEN'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QVendasExcHORA: TTimeField
      FieldName = 'HORA'
    end
    object QVendasExcNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QVendasExcNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QVendasExcCUPOM_FISCAL_VEN: TIntegerField
      FieldName = 'CUPOM_FISCAL_VEN'
      Origin = 'VENDAS.CUPOM_FISCAL_VEN'
    end
  end
  object DSVendasExc: TDataSource
    AutoEdit = False
    DataSet = QVendasExc
    Left = 384
    Top = 400
  end
  object QItensExcluidos: TFDQuery
    OnCalcFields = QItensExcluidosCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      
        'SELECT I.*, P.NOME_PRO, V.COD_CAI, V.DATA_HORA_VEN, V.DATA_VEN, ' +
        'U.NOME_USU'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN USUARIO U'
      'ON (V.COD_USU = U.COD_USU)')
    Left = 536
    Top = 344
    object QItensExcluidosCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.COD_VEN'
      Required = True
    end
    object QItensExcluidosCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.COD_PRO'
      Required = True
    end
    object QItensExcluidosORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.ORDEM'
      Required = True
    end
    object QItensExcluidosDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QItensExcluidosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.COD_EMP'
      Required = True
    end
    object QItensExcluidosQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.QUANT'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QItensExcluidosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDAS_EXCLUIDOS.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QItensExcluidosNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QItensExcluidosTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QItensExcluidosCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QItensExcluidosDATA_HORA_VEN: TSQLTimeStampField
      FieldName = 'DATA_HORA_VEN'
      Origin = 'VENDAS.DATA_HORA_VEN'
    end
    object QItensExcluidosDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QItensExcluidosNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
    object QItensExcluidosVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QItensExcluidosPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensExcluidosCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
  end
  object DSItensExcluidos: TDataSource
    AutoEdit = False
    DataSet = QItensExcluidos
    Left = 536
    Top = 400
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
    OpcoesPreview.Remalina = True
    OpcoesPreview.CaptionPreview = 'Extrado'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
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
    RegistroUsuario.NomeRegistro = 'DATACAMP LTDA'
    RegistroUsuario.SerieProduto = 'SINGLE-0714/01190'
    RegistroUsuario.AutorizacaoKey = '9HHM-SS2W-455Y-ZASZ-9VI8'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Comprovante'
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
    TamanhoQteLinhas = 10
    TamanhoQteColunas = 55
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S20cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 680
    Top = 344
  end
  object QCheques: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT CHE.COD_CHE, CHE.AGENCIA_CHE, CHE.CONTA_CHE, '
      'CHE.NUMERO_CHE, CHE.EMISSAO_CHE,'
      
        'CHE.VENCTO_CHE, CHE.VALOR_CHE, CHE.OBS_CHE, CHE.COD_VENDA, CHE.C' +
        'OD_CAIXA, CLI.NOME_CLI, BAN.NOME_BAN, EMI.NOME_CLI EMITENTE, U.N' +
        'OME_USU'
      'FROM CHEQUE CHE'
      'INNER JOIN CLIENTE CLI'
      'ON (CHE.COD_CLI = CLI.COD_CLI)'
      'INNER JOIN CLIENTE EMI'
      'ON (CHE.COD_EMITENTE = EMI.COD_CLI)'
      'INNER JOIN BANCO BAN'
      'ON (CHE.COD_BANCO = BAN.COD_BAN)'
      'INNER JOIN USUARIO U'
      'ON (CHE.COD_USUARIO = U.COD_USU)')
    Left = 616
    Top = 344
    object QChequesCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QChequesAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QChequesCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QChequesNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QChequesEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QChequesVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
    object QChequesVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QChequesOBS_CHE: TStringField
      FieldName = 'OBS_CHE'
      Origin = 'CHEQUE.OBS_CHE'
      Size = 50
    end
    object QChequesCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CHEQUE.COD_VENDA'
    end
    object QChequesCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = 'CHEQUE.COD_CAIXA'
      Required = True
    end
    object QChequesNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QChequesNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QChequesEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QChequesNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Origin = 'USUARIO.NOME_USU'
      Required = True
      Size = 10
    end
  end
  object DSCheques: TDataSource
    AutoEdit = False
    DataSet = QCheques
    Left = 616
    Top = 400
  end
  object DSFormas: TDataSource
    AutoEdit = False
    DataSet = QTotalFormas
    Left = 104
    Top = 392
  end
  object IBTRVendas: TFDTransaction
    Connection = DM.IBDatabase
    Left = 104
    Top = 448
  end
  object QTotalDesconto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT SUM(DESCONTO_VEN) TOTAL_DESCONTO'
      'FROM VENDAS')
    Left = 24
    Top = 392
    object QTotalDescontoTOTAL_DESCONTO: TBCDField
      FieldName = 'TOTAL_DESCONTO'
      Precision = 18
      Size = 2
    end
  end
end
