object FrmPrecosProgramados: TFrmPrecosProgramados
  Left = 260
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pre'#231'os Programados'
  ClientHeight = 522
  ClientWidth = 690
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 465
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 686
      Height = 461
      Align = alClient
      Color = clSilver
      DataSource = DSCons
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'PRODUTO'
          Width = 425
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECO_PROGRAMADO'
          Title.Alignment = taCenter
          Title.Caption = 'PRE'#199'O OFF'
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRECO_PROGRAMADO_PRAZO'
          Title.Alignment = taCenter
          Title.Caption = 'PRAZO OFF'
          Width = 80
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 503
    Width = 690
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/ Sair'
  end
  object Panel2: TPanel
    Left = 0
    Top = 465
    Width = 690
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnSelecionar: TButton
      Left = 35
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Selecionar &Tudo'
      TabOrder = 0
      OnClick = BtnSelecionarClick
    end
    object BtnAtualizar: TButton
      Left = 246
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Atualizar Pre'#231'o'
      TabOrder = 2
      OnClick = BtnAtualizarClick
    end
    object BtnSair: TButton
      Left = 563
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object BtnExcluir: TButton
      Left = 140
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Excluir'
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
    object BtnImprimir: TButton
      Left = 351
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 3
      OnClick = BtnImprimirClick
    end
    object Button1: TButton
      Left = 457
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Etiqueta'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object QCons: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT P.COD_PRO, P.NOME_PRO, P.PRECO_PROGRAMADO, '
      
        'P.PRECO_PROGRAMADO_PRAZO, P.COD_SEC, P.DESC_CUPOM, S.NOME_SEC, U' +
        '.DESCRICAO'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE PRECO_PROGRAMADO > 0 OR PRECO_PROGRAMADO_PRAZO > 0'
      'ORDER BY NOME_PRO')
    Left = 240
    Top = 144
    object QConsCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object QConsNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsPRECO_PROGRAMADO: TBCDField
      FieldName = 'PRECO_PROGRAMADO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object QConsNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QConsDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = 'PRODUTO.DESC_CUPOM'
      Required = True
      Size = 80
    end
    object QConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QConsPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO_PRAZO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSCons: TDataSource
    AutoEdit = False
    DataSet = QCons
    Left = 288
    Top = 144
  end
  object QAtualiza: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE PRODUTO SET VALOR_PRO = :VALOR'
      'WHERE COD_PRO = :CODPRO')
    Left = 240
    Top = 208
    ParamData = <
      item
        Name = 'VALOR'
      end
      item
        Name = 'CODPRO'
      end>
  end
  object QDeleta: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE PRODUTO'
      'SET PRECO_PROGRAMADO = 0, PRECO_PROGRAMADO_PRAZO = 0'
      'WHERE COD_PRO = :CODPRO')
    Left = 288
    Top = 208
    ParamData = <
      item
        Name = 'CODPRO'
      end>
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'SELECT P.COD_PRO, P.NOME_PRO, P.PRECO_PROGRAMADO, '
      'P.PRECO_PROGRAMADO_PRAZO, P.COD_SEC, S.NOME_SEC'
      'FROM PRODUTO P'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE PRECO_PROGRAMADO > 0'
      '')
    Left = 344
    Top = 208
    object IntegerField1: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
    object IBStringField1: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object IBBCDField1: TBCDField
      FieldName = 'PRECO_PROGRAMADO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object IntegerField2: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object IBStringField2: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
    object QRelPRECO_PROGRAMADO_PRAZO: TBCDField
      FieldName = 'PRECO_PROGRAMADO_PRAZO'
      Origin = 'PRODUTO.PRECO_PROGRAMADO_PRAZO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
end
