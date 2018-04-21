object FrmConsProdCodBarra: TFrmConsProdCodBarra
  Left = 292
  Top = 288
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta por C'#243'digo de Barras'
  ClientHeight = 303
  ClientWidth = 625
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 201
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 621
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Descri'#231#227'o do Produto'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 124
    end
    object LabelPromocao: TLabel
      Left = 200
      Top = 104
      Width = 233
      Height = 24
      Alignment = taCenter
      AutoSize = False
    end
    object LUnid: TLabel
      Left = 392
      Top = 140
      Width = 153
      Height = 29
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNome: TEdit
      Left = 11
      Top = 40
      Width = 604
      Height = 49
      TabStop = False
      Alignment = taCenter
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtValor: TCurrencyEdit
      Left = 80
      Top = 136
      Width = 297
      Height = 49
      Margins.Left = 9
      Margins.Top = 0
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      CheckOnExit = True
      Color = clBtnFace
      DisplayFormat = 'R$ ,#0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 625
    Height = 83
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 621
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'C'#243'digo de Barra'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 92
    end
    object EdtCodBarra: TEdit
      Left = 172
      Top = 36
      Width = 281
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtCodBarraKeyPress
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 284
    Width = 625
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Pressione ESC para sair              [ALT + M] Menu Fiscal'
  end
  object QConsProd: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO,  U.DE' +
        'SCRICAO'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADE_MEDIDA U'
      'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)'
      'WHERE P.CODIGO_BARRA_PRO = :CODBAR')
    Left = 552
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CODBAR'
        ParamType = ptUnknown
      end>
    object QConsProdNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QConsProdVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QConsProdPROMOCAO_PRO: TBCDField
      FieldName = 'PROMOCAO_PRO'
      Origin = 'PRODUTO.PROMOCAO_PRO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QConsProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADE_MEDIDA.DESCRICAO'
      Required = True
      Size = 10
    end
    object QConsProdCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'PRODUTO.COD_PRO'
      Required = True
    end
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    Left = 552
    Top = 80
  end
end
