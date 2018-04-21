object FrmContasRecItens: TFrmContasRecItens
  Left = 249
  Top = 225
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Itens da Venda'
  ClientHeight = 375
  ClientWidth = 673
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 356
    Width = 673
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 321
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 669
      Height = 317
      Align = alClient
      Color = clSilver
      DataSource = DSQConsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Width = 48
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 53
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
          Width = 294
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QUANT'
          Title.Alignment = taCenter
          Title.Caption = 'QTD.'
          Width = 48
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'UNIT'#193'RIO'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CALC_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 71
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 673
    Height = 35
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnSair: TButton
      Left = 364
      Top = 7
      Width = 73
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object BtnComp: TButton
      Left = 236
      Top = 7
      Width = 73
      Height = 25
      Caption = '&Comprovante'
      TabOrder = 1
      OnClick = BtnCompClick
    end
  end
  object QConsItens: TFDQuery
    OnCalcFields = QConsItensCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRItens
    SQL.Strings = (
      
        'SELECT I.*, P.NOME_PRO, V.DATA_VEN, V.COD_CAI, V.DATA_HORA_VEN, ' +
        'V.DESCONTO_VEN'
      'FROM ITENS_VENDA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'WHERE I.COD_VEN = :CODVEN'
      'ORDER BY ORDEM')
    Left = 48
    Top = 72
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end>
    object QConsItensCOD_VEN: TIntegerField
      FieldName = 'COD_VEN'
      Origin = 'ITENS_VENDA.COD_VEN'
      Required = True
    end
    object QConsItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_VENDA.COD_PRO'
      Required = True
    end
    object QConsItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_VENDA.ORDEM'
      Required = True
    end
    object QConsItensQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_VENDA.QUANT'
      DisplayFormat = ',#0.000'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_VENDA.VALOR'
      DisplayFormat = ',#0.000'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 3
    end
    object QConsItensDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'ITENS_VENDA.DESCONTO'
      Precision = 18
      Size = 2
    end
    object QConsItensNOME_PRO: TStringField
      DisplayWidth = 80
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_VENDA.COD_EMP'
      Required = True
    end
    object QConsItensDATA_VEN: TDateField
      FieldName = 'DATA_VEN'
      Origin = 'VENDAS.DATA_VEN'
      Required = True
    end
    object QConsItensCOD_CAI: TIntegerField
      FieldName = 'COD_CAI'
      Origin = 'VENDAS.COD_CAI'
      Required = True
    end
    object QConsItensDATA_HORA_VEN: TSQLTimeStampField
      FieldName = 'DATA_HORA_VEN'
      Origin = 'VENDAS.DATA_HORA_VEN'
    end
    object QConsItensDESCONTO_VEN: TBCDField
      FieldName = 'DESCONTO_VEN'
      Origin = 'VENDAS.DESCONTO_VEN'
      Precision = 18
      Size = 2
    end
    object QConsItensVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_VENDA.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object QConsItensCALC_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL'
      DisplayFormat = ',#0.00'
      Calculated = True
    end
    object QConsItensPRODUTO_PROMOCAO: TStringField
      FieldName = 'PRODUTO_PROMOCAO'
      Origin = 'ITENS_VENDA.PRODUTO_PROMOCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsItensCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_VENDA.CANCELADO'
      Required = True
    end
    object QConsItensVENDA_CANCELADA: TIntegerField
      FieldName = 'VENDA_CANCELADA'
      Origin = 'ITENS_VENDA.VENDA_CANCELADA'
      Required = True
    end
    object QConsItensCOD_VEND: TIntegerField
      FieldName = 'COD_VEND'
      Origin = 'ITENS_VENDA.COD_VEND'
      Required = True
    end
  end
  object DSQConsItens: TDataSource
    AutoEdit = False
    DataSet = QConsItens
    Left = 48
    Top = 128
  end
  object IBTRItens: TFDTransaction
    Connection = DM.IBDatabase
    Left = 112
    Top = 72
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
    Left = 120
    Top = 128
  end
end
