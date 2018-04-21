object FrmConsRegEntradas: TFrmConsRegEntradas
  Left = 320
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta do Registro de Entradas'
  ClientHeight = 554
  ClientWidth = 737
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
    Width = 737
    Height = 73
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 280
      Top = 8
      Width = 257
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 20
        Width = 97
        Height = 21
        Date = 39290.622549363400000000
        Time = 39290.622549363400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 144
        Top = 20
        Width = 97
        Height = 21
        Date = 39290.622549363400000000
        Time = 39290.622549363400000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 265
      Height = 49
      Caption = 'CNPJ'
      TabOrder = 0
      object EdtCNPJ: TEdit
        Left = 8
        Top = 20
        Width = 241
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Fornecedor'
        Alignment = taRightJustify
        Color = clSilver
        MaxLength = 14
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object BtnOK: TButton
      Left = 552
      Top = 27
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TButton
      Left = 640
      Top = 27
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 737
    Height = 462
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 733
      Height = 423
      Align = alTop
      Color = clSilver
      DataSource = DSCons
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Width = 47
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 73
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FORNECEDOR'
          Width = 269
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CNPJ'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'INSCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'INSC.EST.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'UF'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIFICACAO_FISCAL'
          Title.Alignment = taCenter
          Title.Caption = 'MODELO'
          Width = 55
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_NOTA'
          Title.Alignment = taCenter
          Title.Caption = 'NOTA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SERIE_NOTA'
          Title.Alignment = taCenter
          Title.Caption = 'S'#201'RIE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SITUACAO'
          Title.Alignment = taCenter
          Title.Caption = 'SIT.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CODIGO_ENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'COD.ENTRADA'
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 338
      Top = 433
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 535
    Width = 737
    Height = 19
    Panels = <>
  end
  object QCons: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, F.RAZAO_FOR, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_ENTRADAS R'
      'INNER JOIN FORNECEDOR F'
      'ON (R.COD_FOR = F.COD_FOR)'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)')
    Left = 248
    Top = 192
    object QConsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QConsDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QConsCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QConsSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QConsNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QConsEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QConsCODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object QConsINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QConsUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object QConsRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELO_NOTA_FISCAL.DESCRICAO'
      Required = True
      Size = 80
    end
    object QConsSUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object QConsCIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object QConsCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object DSCons: TDataSource
    AutoEdit = False
    DataSet = QCons
    Left = 248
    Top = 256
  end
end
