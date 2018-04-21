object FrmConsNFCFOP: TFrmConsNFCFOP
  Left = 332
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Resumo por CFOP'
  ClientHeight = 433
  ClientWidth = 495
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
    Width = 495
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 10
      Top = 2
      Width = 303
      Height = 47
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 144
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 24
        Top = 16
        Width = 97
        Height = 21
        Date = 38482.688474780100000000
        Time = 38482.688474780100000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 176
        Top = 16
        Width = 97
        Height = 21
        Date = 38482.688474780100000000
        Time = 38482.688474780100000000
        TabOrder = 1
      end
    end
    object BtnOK: TBitBtn
      Left = 336
      Top = 16
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 416
      Top = 16
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 495
    Height = 357
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 491
      Height = 311
      Align = alTop
      Color = clSilver
      DataSource = DSQConsNF
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'COD_CFO'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CFO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 325
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 85
          Visible = True
        end>
    end
    object BtnImp: TBitBtn
      Left = 225
      Top = 320
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnImpClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 495
    Height = 19
    Panels = <>
  end
  object QConsNF: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(N.VALOR_TOTAL_NF) TOTAL, I.COD_CFO, C.NOME_CFO'
      'FROM itens_nota_fiscal I'
      'INNER JOIN nota_fiscal N'
      'on ( I.cod_nf = N.cod_nf )'
      'INNER JOIN cfop C'
      'ON( I.cod_cfo = C.cod_cfo )'
      'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN'
      'AND N.COD_EMP = :CODEMP'
      'GROUP BY I.COD_CFO, C.NOME_CFO'
      'ORDER BY I.COD_CFO')
    Left = 248
    Top = 192
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QConsNFCOD_CFO: TIntegerField
      FieldName = 'COD_CFO'
      Required = True
    end
    object QConsNFNOME_CFO: TStringField
      FieldName = 'NOME_CFO'
      Required = True
      Size = 50
    end
    object QConsNFTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQConsNF: TDataSource
    AutoEdit = False
    DataSet = QConsNF
    Left = 248
    Top = 248
  end
end
