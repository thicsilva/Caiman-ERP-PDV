object FrmMenuFiscal: TFrmMenuFiscal
  Left = 874
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu Fiscal'
  ClientHeight = 334
  ClientWidth = 222
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 222
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object StatusBar1: TStatusBar
      Left = 0
      Top = 315
      Width = 222
      Height = 19
      Panels = <>
      SimplePanel = True
      SimpleText = 'ESC p/Sair'
    end
    object BtnLX: TButton
      Left = 36
      Top = 10
      Width = 150
      Height = 25
      Caption = 'LX'
      TabOrder = 1
      OnClick = BtnLXClick
    end
    object BtnLMFC: TButton
      Left = 36
      Top = 35
      Width = 150
      Height = 25
      Caption = 'LMFC'
      TabOrder = 2
      OnClick = BtnLMFCClick
    end
    object BtnLMFS: TButton
      Left = 36
      Top = 60
      Width = 150
      Height = 25
      Caption = 'LMFS'
      TabOrder = 3
      OnClick = BtnLMFSClick
    end
    object BtnEspelhoMFD: TButton
      Left = 36
      Top = 85
      Width = 150
      Height = 25
      Caption = 'Arq. MF'
      TabOrder = 4
      OnClick = BtnEspelhoMFDClick
    end
    object BtnArquivoMFD: TButton
      Left = 36
      Top = 110
      Width = 150
      Height = 25
      Caption = 'Arq. MFD'
      TabOrder = 5
      OnClick = BtnArquivoMFDClick
    end
    object btnRegistrosPafEcf: TButton
      Left = 36
      Top = 261
      Width = 150
      Height = 25
      Caption = 'Registros do PAF-ECF'
      TabOrder = 11
      OnClick = btnRegistrosPafEcfClick
    end
    object BtnIdentificacao: TButton
      Left = 36
      Top = 135
      Width = 150
      Height = 25
      Caption = 'Identifica'#231#227'o PAF-ECF'
      TabOrder = 6
      OnClick = BtnIdentificacaoClick
    end
    object BtnVendasPeriodo: TButton
      Left = 36
      Top = 160
      Width = 150
      Height = 25
      Caption = 'Vendas do Per'#237'odo'
      TabOrder = 7
      OnClick = BtnVendasPeriodoClick
    end
    object BtnProducao: TButton
      Left = 36
      Top = 211
      Width = 150
      Height = 25
      Caption = 'Tab.'#205'ndice T'#233'cnico Produ'#231#227'o'
      TabOrder = 9
      OnClick = BtnProducaoClick
    end
    object btnParametros: TButton
      Left = 36
      Top = 236
      Width = 150
      Height = 25
      Caption = 'Parametros de Configura'#231#227'o'
      TabOrder = 10
      OnClick = btnParametrosClick
    end
    object BtnTransfMesa: TButton
      Left = 36
      Top = 186
      Width = 150
      Height = 25
      Caption = 'Transf. Mesas'
      TabOrder = 8
      OnClick = BtnTransfMesaClick
    end
  end
  object QComposicao: TFDQuery
    SQL.Strings = (
      'SELECT C.*, P.NOME_PRO'
      'FROM PRODUTOS_COMPOSICAO C'
      'INNER JOIN PRODUTO P'
      'ON (C.COD_PRO_COMPOSICAO = P.COD_PRO)'
      'WHERE C.COD_PRO = :CODPRO'
      'ORDER BY C.COD_PRO_COMPOSICAO')
    Left = 16
    Top = 8
    ParamData = <
      item
        Name = 'CODPRO'
      end>
    object QComposicaoCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTOS_COMPOSICAO.COD_PRO'
      Required = True
    end
    object QComposicaoCOD_PRO_COMPOSICAO: TIntegerField
      FieldName = 'COD_PRO_COMPOSICAO'
      Origin = 'PRODUTOS_COMPOSICAO.COD_PRO_COMPOSICAO'
      Required = True
    end
    object QComposicaoQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'PRODUTOS_COMPOSICAO.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QComposicaoNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
  end
  object QItensMesa: TFDQuery
    SQL.Strings = (
      
        'SELECT I.ORDEM, I.QUANT, I.VALOR, I.CANCELADO,  P.CODIGO_BARRA_P' +
        'RO, P.DESC_CUPOM'
      'FROM ITENS_CONTA_CLIENTE I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.CODIGO = :CODIGO AND I.CONTA_ORIGEM = :ORIGEM'
      'ORDER BY ORDEM')
    Left = 144
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
      end
      item
        Name = 'ORIGEM'
      end>
    object QItensMesaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_CONTA_CLIENTE.ORDEM'
      Required = True
    end
    object QItensMesaQUANT: TBCDField
      FieldName = 'QUANT'
      Origin = 'ITENS_CONTA_CLIENTE.QUANT'
      Required = True
      Precision = 18
      Size = 3
    end
    object QItensMesaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_CONTA_CLIENTE.VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensMesaCODIGO_BARRA_PRO: TStringField
      FieldName = 'CODIGO_BARRA_PRO'
      Origin = 'PRODUTO.CODIGO_BARRA_PRO'
      Required = True
      Size = 14
    end
    object QItensMesaDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'PRODUTO.DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QItensMesaCANCELADO: TIntegerField
      FieldName = 'CANCELADO'
      Origin = 'ITENS_CONTA_CLIENTE.CANCELADO'
      Required = True
    end
  end
end
