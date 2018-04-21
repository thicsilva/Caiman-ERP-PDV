object FrmItensEntradas: TFrmItensEntradas
  Left = 351
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Itens da Entrada'
  ClientHeight = 475
  ClientWidth = 683
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
    Width = 683
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 168
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label3: TLabel
      Left = 264
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Entrada'
    end
    object Label35: TLabel
      Left = 360
      Top = 8
      Width = 86
      Height = 13
      Caption = 'Num. Nota Fiscal'
    end
    object Label22: TLabel
      Left = 10
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label8: TLabel
      Left = 586
      Top = 8
      Width = 57
      Height = 13
      Caption = 'Total da NF'
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 134
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
      TabOrder = 0
    end
    object EdtEmissao: TMaskEdit
      Left = 168
      Top = 24
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
      TabOrder = 1
      Text = '  /  /    '
    end
    object EdtEnt: TMaskEdit
      Left = 264
      Top = 24
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
      TabOrder = 2
      Text = '  /  /    '
    end
    object EdtNumNF: TEdit
      Left = 360
      Top = 24
      Width = 219
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object EdtCodFor: TEdit
      Left = 8
      Top = 64
      Width = 134
      Height = 21
      Hint = 'Pressione F2 para Consultar ou F3 para Fornecedor'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object EdtNomeFor: TEdit
      Left = 168
      Top = 64
      Width = 507
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
    end
    object EdtTotalNF: TCurrencyEdit
      Left = 586
      Top = 24
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
      TabOrder = 6
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 683
    Height = 378
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 2
      Top = 357
      Width = 679
      Height = 19
      Panels = <
        item
          Text = 'ESC para sair'
          Width = 50
        end>
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 679
      Height = 355
      Align = alClient
      Color = clSilver
      DataSource = DSQItensEntradas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
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
          Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
          Width = 450
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QTD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'QUANT.'
          Width = 60
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_UNIT_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'UNIT'#193'RIO'
          Width = 69
          Visible = True
        end>
    end
  end
  object QEntradas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRItens
    SQL.Strings = (
      
        'SELECT E.COD_ENT, E.DATAEMI_ENT, E.DATAENT_ENT, E.NUMNF_ENT, E.C' +
        'OD_FOR, F.RAZAO_FOR, E.TOTAL_ENT'
      'FROM ENTRADAS E'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)'
      'WHERE E.COD_ENT = :CODENT')
    Left = 280
    Top = 144
    ParamData = <
      item
        Name = 'CODENT'
        DataType = ftInteger
      end>
  end
  object IBTRItens: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 144
  end
  object QItensEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRItens
    SQL.Strings = (
      'SELECT I.COD_PRO, I.QTD_PRO, I.VALOR_UNIT_PRO, P.NOME_PRO'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'WHERE I.COD_ENT = :CODENT')
    Left = 280
    Top = 208
    ParamData = <
      item
        Name = 'CODENT'
        DataType = ftInteger
      end>
    object QItensEntradaCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ENTRADA.COD_PRO'
      Required = True
    end
    object QItensEntradaQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'ITENS_ENTRADA.QTD_PRO'
      Required = True
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QItensEntradaVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = 'ITENS_ENTRADA.VALOR_UNIT_PRO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QItensEntradaNOME_PRO: TStringField
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
  end
  object DSQItensEntradas: TDataSource
    AutoEdit = False
    DataSet = QItensEntrada
    Left = 280
    Top = 256
  end
end
