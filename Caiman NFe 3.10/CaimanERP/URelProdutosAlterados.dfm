object FrmRelProdutosAlterados: TFrmRelProdutosAlterados
  Left = 393
  Top = 326
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Produtos Alterados'
  ClientHeight = 173
  ClientWidth = 301
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
    Width = 301
    Height = 113
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 297
      Height = 87
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object EdtHoraIni: TMaskEdit
        Left = 128
        Top = 23
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
        Top = 55
        Width = 65
        Height = 21
        Color = clSilver
        EditMask = '!90:00:00;1;_'
        MaxLength = 8
        TabOrder = 3
        Text = '  :  :  '
        OnExit = EdtHoraIniExit
      end
      object EdtDataIni: TMaskEdit
        Left = 16
        Top = 23
        Width = 88
        Height = 21
        Color = clSilver
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = EdtDataIniExit
      end
      object EdtDataFin: TMaskEdit
        Left = 16
        Top = 55
        Width = 89
        Height = 21
        Color = clSilver
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnExit = EdtDataIniExit
      end
    end
    object CheckSecao: TCheckBox
      Left = 8
      Top = 88
      Width = 265
      Height = 17
      TabStop = False
      Caption = 'Agrupar por Se'#231#227'o'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 301
    Height = 41
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 108
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 154
    Width = 301
    Height = 19
    Panels = <>
  end
  object QRel: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT DISTINCT(A.COD_PRO), P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_' +
        'PRO, P.COD_SEC, S.NOME_SEC'
      'FROM PRODUTOS_ALTERADOS A'
      'INNER JOIN PRODUTO P'
      'ON (A.COD_PRO = P.COD_PRO)'
      'INNER JOIN SECAO S'
      'ON (P.COD_SEC = S.COD_SEC)'
      'WHERE A.DATA_HORA BETWEEN :DATAINI AND :DATAFIN'
      'ORDER BY P.COD_SEC, P.NOME_PRO')
    Left = 240
    Top = 40
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QRelCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTOS_ALTERADOS.COD_PRO'
      Required = True
    end
    object QRelNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QRelVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QRelCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'PRODUTO.COD_SEC'
      Required = True
    end
    object QRelNOME_SEC: TStringField
      FieldName = 'NOME_SEC'
      Origin = 'SECAO.NOME_SEC'
      Required = True
      Size = 50
    end
  end
end
