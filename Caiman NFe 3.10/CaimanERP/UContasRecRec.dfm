object FrmContasRecRec: TFrmContasRecRec
  Left = 283
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber [Recebimento]'
  ClientHeight = 587
  ClientWidth = 984
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnConsCli: TsSpeedButton
      Left = 68
      Top = 22
      Width = 23
      Height = 21
      Hint = 'Consultar Cliente'
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
      OnClick = BtnConsCliClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 60
      Height = 13
      Caption = 'C'#243'd.Cliente'
    end
    object Label2: TLabel
      Left = 95
      Top = 6
      Width = 105
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object Label13: TLabel
      Left = 464
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Recebidas Ap'#243's'
    end
    object Label15: TLabel
      Left = 560
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Data.Ref.p/Juros'
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 22
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Cliente'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodCliKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 95
      Top = 22
      Width = 354
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
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
      TabOrder = 5
    end
    object BtnOk: TButton
      Left = 680
      Top = 20
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 744
      Top = 20
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object CheckEmp: TCheckBox
      Left = 328
      Top = 48
      Width = 121
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 6
    end
    object EdtDataRecebidas: TDateTimePicker
      Left = 464
      Top = 24
      Width = 89
      Height = 21
      Date = 38540.682679930600000000
      Time = 38540.682679930600000000
      TabOrder = 2
    end
    object EdtDataJuros: TDateTimePicker
      Left = 560
      Top = 24
      Width = 89
      Height = 21
      Date = 38540.682679930600000000
      Time = 38540.682679930600000000
      TabOrder = 7
      OnExit = EdtDataJurosExit
    end
    object BtnAlterarSituacao: TButton
      Left = 464
      Top = 48
      Width = 185
      Height = 17
      Caption = '&Alterar Situa'#231#227'o Cliente'
      TabOrder = 8
      OnClick = BtnAlterarSituacaoClick
    end
    object RdgCliente: TRadioButton
      Left = 8
      Top = 48
      Width = 81
      Height = 17
      Caption = 'Cliente'
      TabOrder = 9
      OnClick = RdgClienteClick
    end
    object RdgDocumento: TRadioButton
      Left = 104
      Top = 48
      Width = 89
      Height = 17
      Caption = 'Documento'
      TabOrder = 10
      OnClick = RdgDocumentoClick
    end
    object EdtDocumento: TEdit
      Left = 8
      Top = 22
      Width = 441
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      Color = clSilver
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 68
    Width = 984
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object PCPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 984
      Height = 519
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PCPrincipalChange
      object TabSheet1: TTabSheet
        Caption = 'Credi'#225'rio Pr'#243'prio'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 976
          Height = 491
          Align = alClient
          BevelOuter = bvNone
          BevelWidth = 2
          Color = 16710131
          TabOrder = 0
          object PcCred: TPageControl
            Left = 0
            Top = 109
            Width = 976
            Height = 382
            ActivePage = TabSheet3
            Align = alClient
            TabOrder = 0
            OnChange = PcCredChange
            object TabSheet3: TTabSheet
              Caption = 'A Receber'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGridARec: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 281
                Align = alTop
                BorderStyle = bsNone
                DataSource = DSQConsARec
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnDrawColumnCell = DBGridARecDrawColumnCell
                OnDblClick = DBGridARecDblClick
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Title.Caption = ' Boleto'
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'COD_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'C'#211'D.'
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'NUMDOCUMENTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'DOCUMENTO'
                    Width = 82
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'PARCELA_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'PAR'
                    Width = 31
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'SEQUENCIA_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'SEQ.'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'TIPO'
                    Width = 167
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'NOME_TPV'
                    Title.Alignment = taCenter
                    Title.Caption = 'TIPO VENDA'
                    Width = 177
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'DATA_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMISS'#195'O'
                    Width = 71
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'VENCTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENCTO'
                    Width = 75
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'VALOR_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'VLR. BRUTO'
                    Width = 72
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'DEVOLUCAO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'DEVOL.'
                    Width = 63
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'ACRESCIMO'
                    Title.Alignment = taCenter
                    Title.Caption = 'ACR'#201'SCIMO'
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'TOTAL'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'JUROS_ATRASO'
                    Title.Alignment = taCenter
                    Title.Caption = 'JUROS(%)'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'DIAS'
                    Title.Alignment = taCenter
                    Width = 40
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'CODIGO_DUPLICATA'
                    Title.Alignment = taCenter
                    Title.Caption = 'DUPLICATA'
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'COD_COB'
                    Title.Alignment = taCenter
                    Title.Caption = 'COB'
                    Width = 30
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'COD_VENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 68
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'DESC_PESSOA_AUTORIZADA'
                    Title.Alignment = taCenter
                    Title.Caption = 'AUTORIZADO'
                    Width = 231
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'OBS_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'OBSERVA'#199#195'O'
                    Width = 301
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'CAIXA_EMISSAO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'CX'
                    Width = 32
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'COD_EMP'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 30
                    Visible = True
                  end>
              end
              object PanelObs: TPanel
                Left = 324
                Top = 152
                Width = 441
                Height = 89
                BevelOuter = bvNone
                BevelWidth = 2
                Color = 16710131
                TabOrder = 1
                Visible = False
                object Label16: TLabel
                  Left = 0
                  Top = 0
                  Width = 60
                  Height = 13
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'Observa'#231#227'o'
                  Color = 14602172
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object EdtObs: TEdit
                  Left = 8
                  Top = 24
                  Width = 425
                  Height = 21
                  CharCase = ecUpperCase
                  Color = clSilver
                  MaxLength = 60
                  TabOrder = 0
                end
                object Button1: TButton
                  Left = 128
                  Top = 56
                  Width = 75
                  Height = 25
                  Caption = '&Gravar'
                  TabOrder = 1
                  OnClick = Button1Click
                end
                object Button2: TButton
                  Left = 240
                  Top = 56
                  Width = 75
                  Height = 25
                  Caption = '&Cancelar'
                  TabOrder = 2
                  OnClick = Button2Click
                end
              end
              object btnExcluiBoleto: TButton
                Left = 324
                Top = 316
                Width = 113
                Height = 25
                Caption = 'Excluir Boleto'
                TabOrder = 2
                OnClick = btnExcluiBoletoClick
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Recebidas'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGridRec: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 281
                Align = alTop
                BorderStyle = bsNone
                Color = clGradientInactiveCaption
                DataSource = DSQConsRec
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 59
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMDOCUMENTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'DOCUMENTO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARCELA_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'PAR'
                    Width = 26
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SEQUENCIA_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'SEQ.'
                    Width = 27
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'TIPO'
                    Width = 174
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_TPV'
                    Title.Alignment = taCenter
                    Title.Caption = 'TIPO VENDA'
                    Width = 168
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
                    FieldName = 'VENCTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENCTO'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DTPAGTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'PAGTO.'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'VALOR'
                    Width = 69
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEVOLUCAO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'DEVOL.'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACRESCIMO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'ACR'#201'SCIMO'
                    Width = 69
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ACRESCIMO_RECEBIDO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'ACR'#201'SC.REC.'
                    Width = 76
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCONTO_CONCEDIDO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'DESC.CONC.'
                    Width = 71
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VLRPAGO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'VLR. PAGO'
                    Width = 71
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_RECEBIMENTO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'TP REC.'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESC_PESSOA_AUTORIZADA'
                    Title.Alignment = taCenter
                    Title.Caption = 'AUTORIZADO'
                    Width = 248
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBS_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'OBSERVA'#199#195'O'
                    Width = 221
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_VENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 56
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CAI'
                    Title.Alignment = taCenter
                    Title.Caption = 'CX'
                    Width = 34
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAIXA_EMISSAO_CTR'
                    Title.Alignment = taCenter
                    Title.Caption = 'CX EMISS'#195'O'
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
            object TabSheet12: TTabSheet
              Caption = 'Boletos'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGridBoletos: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 281
                Align = alTop
                BorderStyle = bsNone
                DataSource = DSQBoletos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnDrawColumnCell = DBGridARecDrawColumnCell
                OnDblClick = DBGridARecDblClick
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_CEDENTE'
                    Title.Caption = ' Cedente'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SACADO_NOME'
                    Title.Caption = 'Cedente'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CTR'
                    Title.Caption = 'C. Receber'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_DOCUMENTO'
                    Title.Caption = ' Data Emiss'#227'o '
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VENCIMENTO'
                    Title.Caption = ' Vencimento '
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOSSO_NUMERO'
                    Title.Caption = ' Nosso N'#250'mero '
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_DOCUMENTO'
                    Title.Caption = ' Valor '
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_RECEBIDO'
                    Title.Caption = ' Valor Pago '
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_PAGAMENTO'
                    Title.Caption = ' Data Pagamento '
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OCORRENCIA'
                    Title.Caption = ' Ocorr'#234'ncia '
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Title.Caption = ' Status '
                    Visible = True
                  end>
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 976
            Height = 109
            Align = alTop
            BevelOuter = bvNone
            BevelWidth = 2
            Color = clNavy
            TabOrder = 1
            object Label3: TLabel
              Left = 0
              Top = 0
              Width = 123
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Informa'#231#245'es do CLiente'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label4: TLabel
              Left = 16
              Top = 24
              Width = 60
              Height = 13
              Caption = 'Total Bruto:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label5: TLabel
              Left = 16
              Top = 40
              Width = 56
              Height = 13
              Caption = 'Acr'#233'scimo:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label6: TLabel
              Left = 16
              Top = 56
              Width = 52
              Height = 13
              Caption = 'Desconto:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label7: TLabel
              Left = 16
              Top = 88
              Width = 71
              Height = 13
              Caption = 'Total L'#237'quido:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label8: TLabel
              Left = 264
              Top = 40
              Width = 76
              Height = 13
              Caption = 'Limite Cr'#233'dito:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label9: TLabel
              Left = 264
              Top = 56
              Width = 79
              Height = 13
              Caption = 'Saldo Devedor:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Left = 264
              Top = 72
              Width = 63
              Height = 13
              Caption = 'Saldo Atual:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label11: TLabel
              Left = 264
              Top = 24
              Width = 78
              Height = 13
              Caption = 'Total Atrasado:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label12: TLabel
              Left = 512
              Top = 48
              Width = 56
              Height = 17
              Caption = 'Situa'#231#227'o:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LLiquido: TLabel
              Left = 120
              Top = 88
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LLiquido'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LDesc: TLabel
              Left = 120
              Top = 56
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LDesc'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LAcres: TLabel
              Left = 120
              Top = 40
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LAcres'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LBruto: TLabel
              Left = 120
              Top = 24
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LBruto'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LAtrasado: TLabel
              Left = 360
              Top = 24
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LAtrasado'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LLimiteCred: TLabel
              Left = 360
              Top = 40
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LLimiteCred'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LSaldoDev: TLabel
              Left = 360
              Top = 56
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LSaldoDev'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LSaldoAtual: TLabel
              Left = 360
              Top = 72
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LSaldoAtual'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LSit: TLabel
              Left = 592
              Top = 48
              Width = 177
              Height = 13
              AutoSize = False
              Caption = 'LSit'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label14: TLabel
              Left = 16
              Top = 72
              Width = 58
              Height = 13
              Caption = 'Devolu'#231#227'o:'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LDevol: TLabel
              Left = 120
              Top = 72
              Width = 97
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'LDevol'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
          end
          object BtnRec: TButton
            Left = 93
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Receber '
            TabOrder = 2
            OnClick = BtnRecClick
          end
          object BtnDev: TButton
            Left = 171
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Devolu'#231#227'o'
            TabOrder = 3
            OnClick = BtnDevClick
          end
          object BtnExt: TButton
            Left = 249
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Extrato'
            TabOrder = 4
            OnClick = BtnExtClick
          end
          object BtnRecibo: TButton
            Left = 327
            Top = 421
            Width = 75
            Height = 25
            Caption = 'Rec.&Pagto.'
            TabOrder = 5
            OnClick = BtnReciboClick
          end
          object BtnItens: TButton
            Left = 406
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Itens'
            TabOrder = 6
            OnClick = BtnItensClick
          end
          object BtnDadosVendas: TButton
            Left = 484
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Dados Venda'
            TabOrder = 7
            OnClick = BtnDadosVendasClick
          end
          object BtnFicha: TButton
            Left = 562
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Ficha'
            TabOrder = 8
            OnClick = BtnFichaClick
          end
          object BtnLancar: TButton
            Left = 640
            Top = 421
            Width = 75
            Height = 25
            Caption = '&Lan'#231'ar'
            TabOrder = 9
            OnClick = BtnLancarClick
          end
          object BtnObs: TButton
            Left = 719
            Top = 421
            Width = 75
            Height = 25
            Caption = 'O&bserva'#231#227'o'
            TabOrder = 10
            OnClick = BtnObsClick
          end
          object BtnSel: TButton
            Left = 15
            Top = 421
            Width = 73
            Height = 25
            Caption = 'Se&lecionar'
            TabOrder = 11
            OnClick = BtnSelClick
          end
          object btnBoletos: TButton
            Left = 15
            Top = 451
            Width = 153
            Height = 25
            Caption = 'Gerar Boletos'
            TabOrder = 12
            OnClick = btnBoletosClick
          end
          object btnImprime: TButton
            Left = 174
            Top = 451
            Width = 153
            Height = 25
            Caption = 'Imprimir Boletos'
            TabOrder = 13
            Visible = False
            OnClick = btnImprimeClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Cheque'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel8: TPanel
          Left = 0
          Top = 129
          Width = 976
          Height = 321
          Align = alClient
          BevelOuter = bvNone
          BevelWidth = 2
          Color = 16710131
          TabOrder = 0
          object PCCheque: TPageControl
            Left = 0
            Top = 0
            Width = 976
            Height = 321
            ActivePage = TabSheet11
            Align = alClient
            TabOrder = 0
            OnChange = PCChequeChange
            object TabSheet5: TTabSheet
              Caption = 'A Depositar'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 171
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 280
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 266
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Depositados 1'#186
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid2: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 163
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 281
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 288
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Depositados 2'#186
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 164
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 272
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 265
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Pagos Carteira'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid4: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 175
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 268
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 248
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Devolvidos 1'#170' Dev.'
              ImageIndex = 4
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid5: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 171
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 265
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 257
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'Devolvidos 2'#170' Dev.'
              ImageIndex = 5
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid6: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clGradientInactiveCaption
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 173
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 274
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 256
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
            object TabSheet11: TTabSheet
              Caption = 'Todos'
              ImageIndex = 6
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object DBGrid7: TDBGrid
                Left = 0
                Top = 0
                Width = 968
                Height = 293
                Align = alClient
                Color = clSilver
                DataSource = DSConsCheque
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 5575969
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnKeyDown = DBGridARecKeyDown
                Columns = <
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODCHE'
                    Title.Alignment = taCenter
                    Title.Caption = 'COD.'
                    Width = 58
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VALOR'
                    Title.Alignment = taCenter
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMISSAO'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMIS'#195'O'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'VENCTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PRIDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '1'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEP'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#186' DEP.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'SEGDEV'
                    Title.Alignment = taCenter
                    Title.Caption = '2'#170' DEV.'
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'PAGTO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'BANCO'
                    Title.Alignment = taCenter
                    Width = 174
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'AGENCIA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CONTA'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NUMERO'
                    Title.Alignment = taCenter
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMP'
                    Width = 34
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'CODVENDA'
                    Title.Alignment = taCenter
                    Title.Caption = 'VENDA'
                    Width = 65
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_CLIENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'CLIENTE'
                    Width = 269
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'NOME_EMITENTE'
                    Title.Alignment = taCenter
                    Title.Caption = 'EMITENTE'
                    Width = 282
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'OBS'
                    Title.Alignment = taCenter
                    Width = 551
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 976
          Height = 129
          Align = alTop
          BevelOuter = bvNone
          BevelWidth = 2
          Color = clNavy
          TabOrder = 1
          object Label17: TLabel
            Left = 0
            Top = 0
            Width = 123
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Informa'#231#245'es do CLiente'
            Color = 14602172
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label18: TLabel
            Left = 16
            Top = 24
            Width = 105
            Height = 13
            Caption = 'A Depositar 1'#186' Dep.:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 16
            Top = 88
            Width = 115
            Height = 13
            Caption = 'Ch.Devolvidos 1'#170' Dev:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label21: TLabel
            Left = 16
            Top = 72
            Width = 117
            Height = 13
            Caption = 'Ch. Pagos em Carteira:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label22: TLabel
            Left = 312
            Top = 24
            Width = 76
            Height = 13
            Caption = 'Limite Cr'#233'dito:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LLimCh: TLabel
            Left = 408
            Top = 24
            Width = 89
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LLimCh'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label24: TLabel
            Left = 312
            Top = 40
            Width = 79
            Height = 13
            Caption = 'Saldo Devedor:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LDevCh: TLabel
            Left = 408
            Top = 40
            Width = 89
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LDevCh'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label26: TLabel
            Left = 312
            Top = 64
            Width = 63
            Height = 13
            Caption = 'Saldo Atual:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LSaldoCH: TLabel
            Left = 408
            Top = 64
            Width = 89
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LSaldoCH'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label28: TLabel
            Left = 568
            Top = 64
            Width = 56
            Height = 17
            Caption = 'Situa'#231#227'o:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LSitCh: TLabel
            Left = 648
            Top = 64
            Width = 137
            Height = 13
            AutoSize = False
            Caption = 'LSitCh'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label30: TLabel
            Left = 16
            Top = 40
            Width = 122
            Height = 13
            Caption = 'Ch.depositados 1'#186' Dep:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LAbertos: TLabel
            Left = 160
            Top = 24
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LAbertos'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LDepositadosPri: TLabel
            Left = 160
            Top = 40
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LDepositadosPri'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LPagos: TLabel
            Left = 160
            Top = 72
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LPagos'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LDev1: TLabel
            Left = 160
            Top = 88
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LDev1'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label23: TLabel
            Left = 568
            Top = 24
            Width = 83
            Height = 13
            Caption = 'Quant.Cheques:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LQuant: TLabel
            Left = 672
            Top = 24
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'LQuant'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label25: TLabel
            Left = 16
            Top = 104
            Width = 115
            Height = 13
            Caption = 'Ch.Devolvidos 2'#170' Dev:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LDev2: TLabel
            Left = 160
            Top = 104
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LDev2'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label19: TLabel
            Left = 16
            Top = 56
            Width = 122
            Height = 13
            Caption = 'Ch.depositados 2'#186' Dep:'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object LDepositadosSeg: TLabel
            Left = 160
            Top = 56
            Width = 97
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LDepositadosSeg'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 450
          Width = 976
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          BevelWidth = 2
          Color = 16710131
          TabOrder = 2
          object BtnFichaCheque: TButton
            Left = 299
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Ficha'
            TabOrder = 0
            OnClick = BtnFichaChequeClick
          end
          object BtnLancarCheque: TButton
            Left = 433
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Lan'#231'ar'
            TabOrder = 1
            OnClick = BtnLancarChequeClick
          end
        end
      end
    end
  end
  object QConsARec: TFDQuery
    OnCalcFields = QConsARecCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRCTR
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.COD_EMP, R.DATA_CTR, R.COD_' +
        'VENDA, R.COD_CLI, R.VENCTO_CTR, R.VALOR_CTR, R.OBS_CTR, R.NUMDOC' +
        'UMENTO_CTR, R.COD_COB, '
      'P.JUROS_ATRASO, R.PARCELA_CTR, R.CAIXA_EMISSAO_CTR, '
      
        'R.CODIGO_DUPLICATA, R.DEVOLUCAO_CTR, R.CODIGO_CLASSIFICACAO,  P.' +
        'DIAS_CARENCIA, C.NOME_CLI, VE.DESC_PESSOA_AUTORIZADA, TV.NOME_TP' +
        'V,'
      
        'CL.DESCRICAO, C.endres_cli, C.numres_cli, C.baires_cli, C.cidres' +
        '_cli, C.estres_cli, C.cnpj_cli, R. COD_BOLETO, C.cepres_cli'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLIENTE C'
      'ON (R.COD_CLI = C.COD_CLI)'
      'INNER JOIN PARAMETROS P'
      'ON (R.COD_EMP = P.COD_EMP)'
      'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER CL'
      'ON (R.CODIGO_CLASSIFICACAO = CL.CODIGO)'
      'LEFT JOIN VENDAS VE'
      'ON (R.COD_VENDA = VE.COD_VEN)'
      'LEFT JOIN TIPO_VENDA TV'
      'ON (VE.COD_TPV = TV.COD_TPV)')
    Left = 104
    Top = 368
    object QConsARecCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsARecSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsARecCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QConsARecDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QConsARecCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QConsARecCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CONTAS_RECEBER.COD_CLI'
      Required = True
    end
    object QConsARecVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsARecVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsARecNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QConsARecDIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIAS'
      Calculated = True
    end
    object QConsARecACRESCIMO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ACRESCIMO'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Calculated = True
    end
    object QConsARecTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Calculated = True
    end
    object QConsARecOBS_CTR: TStringField
      FieldName = 'OBS_CTR'
      Origin = 'CONTAS_RECEBER.OBS_CTR'
      Size = 60
    end
    object QConsARecJUROS_ATRASO: TBCDField
      FieldName = 'JUROS_ATRASO'
      Origin = 'PARAMETROS.JUROS_ATRASO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsARecDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'PARAMETROS.DIAS_CARENCIA'
    end
    object QConsARecCOD_COB: TIntegerField
      FieldName = 'COD_COB'
      Origin = 'CONTAS_RECEBER.COD_COB'
      Required = True
    end
    object QConsARecPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QConsARecCAIXA_EMISSAO_CTR: TIntegerField
      FieldName = 'CAIXA_EMISSAO_CTR'
      Origin = 'CONTAS_RECEBER.CAIXA_EMISSAO_CTR'
    end
    object QConsARecDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsARecNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsARecCALC_AUTORIZADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_AUTORIZADO'
      Calculated = True
    end
    object QConsARecDESC_PESSOA_AUTORIZADA: TStringField
      FieldName = 'DESC_PESSOA_AUTORIZADA'
      Origin = 'VENDAS.DESC_PESSOA_AUTORIZADA'
      Size = 60
    end
    object QConsARecNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Size = 50
    end
    object QConsARecCODIGO_DUPLICATA: TIntegerField
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CONTAS_RECEBER.CODIGO_DUPLICATA'
    end
    object QConsARecDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
    object QConsARecCODIGO_CLASSIFICACAO: TIntegerField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Origin = 'CONTAS_RECEBER.CODIGO_CLASSIFICACAO'
      Required = True
    end
    object QConsARecENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QConsARecNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object QConsARecBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QConsARecCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QConsARecESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QConsARecCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QConsARecSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Calculated = True
    end
    object QConsARecCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QConsARecCOD_BOLETO: TIntegerField
      FieldName = 'COD_BOLETO'
      Origin = '"CONTAS_RECEBER"."COD_BOLETO"'
    end
  end
  object DSQConsARec: TDataSource
    AutoEdit = False
    DataSet = QConsARec
    Left = 104
    Top = 416
  end
  object IBTRCTR: TFDTransaction
    Connection = DM.IBDatabase
    Left = 40
    Top = 368
  end
  object QRelPendente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CTR, SEQUENCIA_CTR, VALOR_CTR,  DEVOLUCAO_CTR, VENCTO' +
        '_CTR, '
      'COD_VENDA, PARCELA_CTR'
      'FROM CONTAS_RECEBER '
      'WHERE COD_CLI = :CODCLI AND DTPAGTO_CTR IS NULL'
      'ORDER BY VENCTO_CTR, COD_CTR')
    Left = 184
    Top = 320
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
  end
  object QTotalPagto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(VLRPAGO_CTR) TOTAL'
      'FROM CONTAS_RECEBER'
      'WHERE COD_CLI = :CODCLI AND DTPAGTO_CTR = :DATA')
    Left = 40
    Top = 320
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end>
  end
  object QConsRec: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCTR
    SQL.Strings = (
      
        'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.COD_EMP, R.PARCELA_CTR, R.D' +
        'ATA_CTR, R.COD_VENDA, R.VENCTO_CTR, R.VALOR_CTR, R.DTPAGTO_CTR, ' +
        'R.VLRPAGO_CTR, R.ACRESCIMO_CTR, R.DESCONTO_CTR, R.NUMDOCUMENTO_C' +
        'TR, R.ACRESCIMO_RECEBIDO_CTR, R.DESCONTO_CONCEDIDO_CTR, R.COD_CA' +
        'I, R.CAIXA_EMISSAO_CTR,   R.DEVOLUCAO_CTR, R.OBS_CTR, VE.DESC_PE' +
        'SSOA_AUTORIZADA,'
      'TV.NOME_TPV, CL.DESCRICAO'
      'FROM CONTAS_RECEBER R'
      'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER CL'
      'ON (R.CODIGO_CLASSIFICACAO = CL.CODIGO)'
      'LEFT JOIN VENDAS VE'
      'ON (R.COD_VENDA = VE.COD_VEN)'
      'LEFT JOIN TIPO_VENDA TV'
      'ON (VE.COD_TPV = TV.COD_TPV)'
      '')
    Left = 184
    Top = 368
    object QConsRecCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CONTAS_RECEBER.COD_CTR'
      Required = True
    end
    object QConsRecSEQUENCIA_CTR: TIntegerField
      FieldName = 'SEQUENCIA_CTR'
      Origin = 'CONTAS_RECEBER.SEQUENCIA_CTR'
      Required = True
    end
    object QConsRecCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_RECEBER.COD_EMP'
      Required = True
    end
    object QConsRecPARCELA_CTR: TIntegerField
      FieldName = 'PARCELA_CTR'
      Origin = 'CONTAS_RECEBER.PARCELA_CTR'
      Required = True
    end
    object QConsRecDATA_CTR: TDateField
      FieldName = 'DATA_CTR'
      Origin = 'CONTAS_RECEBER.DATA_CTR'
      Required = True
    end
    object QConsRecCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CONTAS_RECEBER.COD_VENDA'
    end
    object QConsRecVENCTO_CTR: TDateField
      FieldName = 'VENCTO_CTR'
      Origin = 'CONTAS_RECEBER.VENCTO_CTR'
      Required = True
    end
    object QConsRecVALOR_CTR: TBCDField
      FieldName = 'VALOR_CTR'
      Origin = 'CONTAS_RECEBER.VALOR_CTR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecDTPAGTO_CTR: TDateField
      FieldName = 'DTPAGTO_CTR'
      Origin = 'CONTAS_RECEBER.DTPAGTO_CTR'
    end
    object QConsRecVLRPAGO_CTR: TBCDField
      FieldName = 'VLRPAGO_CTR'
      Origin = 'CONTAS_RECEBER.VLRPAGO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecACRESCIMO_CTR: TBCDField
      FieldName = 'ACRESCIMO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecDESCONTO_CTR: TBCDField
      FieldName = 'DESCONTO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecACRESCIMO_RECEBIDO_CTR: TBCDField
      FieldName = 'ACRESCIMO_RECEBIDO_CTR'
      Origin = 'CONTAS_RECEBER.ACRESCIMO_RECEBIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecDESCONTO_CONCEDIDO_CTR: TBCDField
      FieldName = 'DESCONTO_CONCEDIDO_CTR'
      Origin = 'CONTAS_RECEBER.DESCONTO_CONCEDIDO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'CONTAS_RECEBER.COD_CAI'
    end
    object QConsRecCAIXA_EMISSAO_CTR: TIntegerField
      FieldName = 'CAIXA_EMISSAO_CTR'
      Origin = 'CONTAS_RECEBER.CAIXA_EMISSAO_CTR'
    end
    object QConsRecDEVOLUCAO_CTR: TBCDField
      FieldName = 'DEVOLUCAO_CTR'
      Origin = 'CONTAS_RECEBER.DEVOLUCAO_CTR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsRecDESC_PESSOA_AUTORIZADA: TStringField
      FieldName = 'DESC_PESSOA_AUTORIZADA'
      Origin = 'VENDAS.DESC_PESSOA_AUTORIZADA'
      Size = 60
    end
    object QConsRecOBS_CTR: TStringField
      FieldName = 'OBS_CTR'
      Origin = 'CONTAS_RECEBER.OBS_CTR'
      Size = 60
    end
    object QConsRecNUMDOCUMENTO_CTR: TStringField
      FieldName = 'NUMDOCUMENTO_CTR'
      Origin = 'CONTAS_RECEBER.NUMDOCUMENTO_CTR'
    end
    object QConsRecNOME_TPV: TStringField
      FieldName = 'NOME_TPV'
      Origin = 'TIPO_VENDA.NOME_TPV'
      Size = 50
    end
    object QConsRecDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSIFICACAO_CONTAS_RECEBER.DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object DSQConsRec: TDataSource
    AutoEdit = False
    DataSet = QConsRec
    Left = 184
    Top = 416
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
    RegistroUsuario.NomeRegistro = 'CARLOS JORGE MARTINS DOS SANTOS JUNIOR'
    RegistroUsuario.SerieProduto = 'SINGLE 6.1 - 1651/0616 (DX101)'
    RegistroUsuario.AutorizacaoKey = 'C0H3Y-SZPXG-TEWNN-69VHR-SXMQ3-5GWHT-6K59B'
    About = 'RDprint 6.1'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Extrato'
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
    FonteGrafica = sCourierNew
    ReduzParaCaber = True
    Left = 40
    Top = 416
  end
  object QTotaisCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_TOTAIS_CHEQUE(:CODCLI, :CODEMP)')
    Left = 544
    Top = 296
    ParamData = <
      item
        Name = 'CODCLI'
      end
      item
        Name = 'CODEMP'
      end>
    object QTotaisChequeABERTOS: TBCDField
      FieldName = 'ABERTOS'
      Origin = 'SP_TOTAIS_CHEQUE.ABERTOS'
      Precision = 18
      Size = 2
    end
    object QTotaisChequeDEPOSITADOSPRI: TBCDField
      FieldName = 'DEPOSITADOSPRI'
      Origin = 'SP_TOTAIS_CHEQUE.DEPOSITADOSPRI'
      Precision = 18
      Size = 2
    end
    object QTotaisChequeDEPOSITADOSSEG: TBCDField
      FieldName = 'DEPOSITADOSSEG'
      Origin = 'SP_TOTAIS_CHEQUE.DEPOSITADOSSEG'
      Precision = 18
      Size = 2
    end
    object QTotaisChequePAGOS: TBCDField
      FieldName = 'PAGOS'
      Origin = 'SP_TOTAIS_CHEQUE.PAGOS'
      Precision = 18
      Size = 2
    end
    object QTotaisChequeDEVOLVIDOSPRI: TBCDField
      FieldName = 'DEVOLVIDOSPRI'
      Origin = 'SP_TOTAIS_CHEQUE.DEVOLVIDOSPRI'
      Precision = 18
      Size = 2
    end
    object QTotaisChequeDEVOLVIDOSSEG: TBCDField
      FieldName = 'DEVOLVIDOSSEG'
      Origin = 'SP_TOTAIS_CHEQUE.DEVOLVIDOSSEG'
      Precision = 18
      Size = 2
    end
    object QTotaisChequeQTDCHEQUE: TIntegerField
      FieldName = 'QTDCHEQUE'
      Origin = 'SP_TOTAIS_CHEQUE.QTDCHEQUE'
    end
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCTR
    SQL.Strings = (
      'SELECT *'
      'FROM SP_CONTAS_RECEBER_CHEQUES (:CODCLI, :CODEMP, :OPCAO)')
    Left = 624
    Top = 296
    ParamData = <
      item
        Name = 'CODCLI'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'OPCAO'
      end>
    object QConsChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.AGENCIA'
      Size = 10
    end
    object QConsChequeCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.CONTA'
      Size = 10
    end
    object QConsChequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.NUMERO'
      Size = 10
    end
    object QConsChequeEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.EMISSAO'
    end
    object QConsChequeVENCTO: TDateField
      FieldName = 'VENCTO'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.VENCTO'
    end
    object QConsChequeVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.VALOR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChequePRIDEP: TDateField
      FieldName = 'PRIDEP'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.PRIDEP'
    end
    object QConsChequeSEGDEP: TDateField
      FieldName = 'SEGDEP'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.SEGDEP'
    end
    object QConsChequePRIDEV: TDateField
      FieldName = 'PRIDEV'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.PRIDEV'
    end
    object QConsChequeSEGDEV: TDateField
      FieldName = 'SEGDEV'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.SEGDEV'
    end
    object QConsChequePAGTO: TDateField
      FieldName = 'PAGTO'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.PAGTO'
    end
    object QConsChequeEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.EMPRESA'
    end
    object QConsChequeCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.CODVENDA'
    end
    object QConsChequeOBS: TStringField
      FieldName = 'OBS'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.OBS'
      Size = 200
    end
    object QConsChequeCODCHE: TIntegerField
      FieldName = 'CODCHE'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.CODCHE'
    end
    object QConsChequeBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.BANCO'
      Size = 50
    end
    object QConsChequeNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.NOME_CLIENTE'
      Size = 60
    end
    object QConsChequeNOME_EMITENTE: TStringField
      FieldName = 'NOME_EMITENTE'
      Origin = 'SP_CONTAS_RECEBER_CHEQUES.NOME_EMITENTE'
      Size = 60
    end
  end
  object DSConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 704
    Top = 296
  end
  object RDprintDuplicata: TRDprint
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
    Left = 280
    Top = 320
  end
  object QDuplicata: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_DUPLICATA(:COD, :SEQ)')
    Left = 376
    Top = 280
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
  object Imagens: TsAlphaImageList
    Items = <
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000D24944415478DAEDD3BB0E014114C6719BE8351A974AA849B65510B7
          97102FC0BAC5ED154443A25308F11EBC84845EA8352AACFF49CE2653E8466993
          5F663299F9E6243BC7F17D3F64F339AEEBAE194515096C50C20D3984651FB628
          E28E08F66848809430C004518C757E44DEB84CD646B82089A9908007933E5A48
          61080F6754F0D42AE470532B8B61895950811CEE20A3631727D4F0D600596BE3
          8A38162208F0F4605A379A012F0DE87D0998FF037E1860F51B7FF290AC9EF24A
          1BA5ACA5EDB469E4A6ACD14CB25E309AE980BA63DBCE1F5C8C79851E445B1300
          00000049454E44AE426082}
      end>
    Left = 272
    Top = 400
    Bitmap = {}
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCTR
    Left = 48
    Top = 480
  end
  object QBoletos: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCTR
    SQL.Strings = (
      'select B.*, BB.sacado_nome, CL.nome_cli, CL.cnpj_cli,'
      'CL.endres_cli, CL.numres_cli, CL.baires_cli,'
      'CL.cidres_cli, CL.cepres_cli, CL.estres_cli from BOLETOS B'
      'inner join boletos_sacado BB'
      'ON ( BB.cod = B.cod_cedente )'
      'inner join CLIENTE CL'
      'ON( CL.cod_cli = B.cod_cli )')
    Left = 104
    Top = 320
    object QBoletosCOD: TIntegerField
      FieldName = 'COD'
      Origin = '"BOLETOS"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBoletosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"BOLETOS"."COD_EMP"'
      Required = True
    end
    object QBoletosCOD_CEDENTE: TIntegerField
      FieldName = 'COD_CEDENTE'
      Origin = '"BOLETOS"."COD_CEDENTE"'
      Required = True
    end
    object QBoletosCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = '"BOLETOS"."COD_CTR"'
    end
    object QBoletosDATA_DOCUMENTO: TDateField
      FieldName = 'DATA_DOCUMENTO'
      Origin = '"BOLETOS"."DATA_DOCUMENTO"'
    end
    object QBoletosVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = '"BOLETOS"."VENCIMENTO"'
    end
    object QBoletosNUMERO_DOC: TStringField
      FieldName = 'NUMERO_DOC'
      Origin = '"BOLETOS"."NUMERO_DOC"'
      Size = 30
    end
    object QBoletosESPECIE_DOC: TStringField
      FieldName = 'ESPECIE_DOC'
      Origin = '"BOLETOS"."ESPECIE_DOC"'
      Size = 30
    end
    object QBoletosACEITE: TStringField
      FieldName = 'ACEITE'
      Origin = '"BOLETOS"."ACEITE"'
      Size = 3
    end
    object QBoletosDATA_PROCESSAMENTO: TDateField
      FieldName = 'DATA_PROCESSAMENTO'
      Origin = '"BOLETOS"."DATA_PROCESSAMENTO"'
    end
    object QBoletosCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = '"BOLETOS"."CARTEIRA"'
      Size = 30
    end
    object QBoletosNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = '"BOLETOS"."NOSSO_NUMERO"'
      Size = 30
    end
    object QBoletosVALOR_DOCUMENTO: TBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = '"BOLETOS"."VALOR_DOCUMENTO"'
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 3
    end
    object QBoletosCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = '"BOLETOS"."COD_CLI"'
      Required = True
    end
    object QBoletosVALOR_ABATIMENTO: TBCDField
      FieldName = 'VALOR_ABATIMENTO'
      Origin = '"BOLETOS"."VALOR_ABATIMENTO"'
      DisplayFormat = 'R$ 0.00'
      Precision = 18
      Size = 3
    end
    object QBoletosLOCAL_PAGAMENTO: TStringField
      FieldName = 'LOCAL_PAGAMENTO'
      Origin = '"BOLETOS"."LOCAL_PAGAMENTO"'
      Size = 200
    end
    object QBoletosVALOR_MORA_JURUS: TBCDField
      FieldName = 'VALOR_MORA_JURUS'
      Origin = '"BOLETOS"."VALOR_MORA_JURUS"'
      Precision = 18
      Size = 3
    end
    object QBoletosVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"BOLETOS"."VALOR_DESCONTO"'
      Precision = 18
      Size = 3
    end
    object QBoletosDATA_MORA_JUROS: TDateField
      FieldName = 'DATA_MORA_JUROS'
      Origin = '"BOLETOS"."DATA_MORA_JUROS"'
    end
    object QBoletosDATA_DESCONTO: TDateField
      FieldName = 'DATA_DESCONTO'
      Origin = '"BOLETOS"."DATA_DESCONTO"'
    end
    object QBoletosDATA_ABATIMENTO: TDateField
      FieldName = 'DATA_ABATIMENTO'
      Origin = '"BOLETOS"."DATA_ABATIMENTO"'
    end
    object QBoletosDATA_PROTESTO: TDateField
      FieldName = 'DATA_PROTESTO'
      Origin = '"BOLETOS"."DATA_PROTESTO"'
    end
    object QBoletosPORCENTUAL_MULTA: TBCDField
      FieldName = 'PORCENTUAL_MULTA'
      Origin = '"BOLETOS"."PORCENTUAL_MULTA"'
      Precision = 18
      Size = 3
    end
    object QBoletosOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      Origin = '"BOLETOS"."OCORRENCIA"'
      Size = 200
    end
    object QBoletosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = '"BOLETOS"."STATUS"'
      Size = 2
    end
    object QBoletosSACADO_NOME: TStringField
      FieldName = 'SACADO_NOME'
      Origin = '"BOLETOS_SACADO"."SACADO_NOME"'
      Size = 60
    end
    object QBoletosNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = '"CLIENTE"."NOME_CLI"'
      Required = True
      Size = 60
    end
    object QBoletosCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = '"CLIENTE"."CNPJ_CLI"'
      Size = 18
    end
    object QBoletosENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = '"CLIENTE"."ENDRES_CLI"'
      Size = 50
    end
    object QBoletosNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = '"CLIENTE"."NUMRES_CLI"'
      Size = 10
    end
    object QBoletosBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = '"CLIENTE"."BAIRES_CLI"'
      Size = 30
    end
    object QBoletosCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = '"CLIENTE"."CIDRES_CLI"'
      Size = 30
    end
    object QBoletosCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = '"CLIENTE"."CEPRES_CLI"'
      FixedChar = True
      Size = 9
    end
    object QBoletosESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = '"CLIENTE"."ESTRES_CLI"'
      FixedChar = True
      Size = 2
    end
    object QBoletosREMESSA: TIntegerField
      FieldName = 'REMESSA'
      Origin = '"BOLETOS"."REMESSA"'
    end
    object QBoletosVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = '"BOLETOS"."VALOR_RECEBIDO"'
      Precision = 18
      Size = 3
    end
    object QBoletosDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = '"BOLETOS"."DATA_PAGAMENTO"'
    end
  end
  object DSQBoletos: TDataSource
    DataSet = QBoletos
    Left = 112
    Top = 280
  end
  object frxRecibo: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41541.473408611100000000
    ReportOptions.LastChange = 41541.501713078700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 416
    Top = 336
    Datasets = <>
    Variables = <
      item
        Name = ' dados_rel'
        Value = Null
      end
      item
        Name = 'empresa'
        Value = ''
      end
      item
        Name = 'valor'
        Value = ''
      end
      item
        Name = 'numero'
        Value = ''
      end
      item
        Name = 'recebido'
        Value = ''
      end
      item
        Name = 'local'
        Value = ''
      end
      item
        Name = 'data_extenso'
        Value = ''
      end
      item
        Name = 'valor_extenso'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 366.614410000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 366.614410000000000000
        end
        object Shape2: TfrxShapeView
          Width = 740.787401570000000000
          Height = 34.015770000000000000
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.559059999999999000
          Width = 733.228820000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Top = 49.133889999999990000
          Width = 117.165430000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'RECIBO')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 241.889920000000000000
          Top = 56.692949999999990000
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'N.'#186)
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 284.023810000000000000
          Top = 54.472480000000010000
          Width = 132.283550000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo4: TfrxMemoView
          Left = 428.323130000000000000
          Top = 56.692949999999990000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8W = (
            'Valor R$ :')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Left = 523.913730000000000000
          Top = 53.913420000000000000
          Width = 207.874150000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 289.141930000000000000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[numero]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
          Top = 60.472480000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[valor]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 18.897650000000000000
          Top = 102.385900000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Recebi (emos) de:')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          Left = 18.897650000000000000
          Top = 124.724490000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo8: TfrxMemoView
          Left = 24.015770000000000000
          Top = 128.724490000000000000
          Width = 699.213050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[recebido]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 18.897650000000000000
          Top = 158.740260000000000000
          Width = 185.196970000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'A quantia subra de :')
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 18.897650000000000000
          Top = 181.078850000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Fill.BackColor = 15000804
          Shape = skRoundRectangle
        end
        object Memo10: TfrxMemoView
          Left = 24.015770000000000000
          Top = 185.078850000000000000
          Width = 699.213050000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[valor_extenso]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 18.897650000000000000
          Top = 219.212740000000000000
          Width = 287.244280000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Referente ao parcelamento : [numero]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 132.283550000000000000
          Top = 257.905690000000000000
          Width = 597.165740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[local], [data_extenso]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 181.417440000000000000
          Top = 328.819110000000000000
          Width = 389.291590000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 302.362400000000000000
          Top = 336.378170000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'EMITENTE')
          ParentFont = False
        end
      end
    end
  end
end
