object FrmCancelaPagto: TFrmCancelaPagto
  Left = 338
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar - Cancelamento de Pagamento '
  ClientHeight = 279
  ClientWidth = 505
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 260
    Width = 505
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 217
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 59
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label3: TLabel
      Left = 8
      Top = 84
      Width = 101
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object Label4: TLabel
      Left = 152
      Top = 84
      Width = 121
      Height = 13
      Caption = 'N'#250'mero do Documento'
    end
    object Label5: TLabel
      Left = 296
      Top = 84
      Width = 37
      Height = 13
      Caption = 'Valor(*)'
    end
    object Label6: TLabel
      Left = 399
      Top = 84
      Width = 71
      Height = 13
      Caption = 'Vencimento(*)'
    end
    object Label7: TLabel
      Left = 8
      Top = 124
      Width = 60
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label2: TLabel
      Left = 133
      Top = 164
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label8: TLabel
      Left = 258
      Top = 164
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object Label9: TLabel
      Left = 384
      Top = 164
      Width = 55
      Height = 13
      Caption = 'Valor Pago'
    end
    object Label10: TLabel
      Left = 8
      Top = 4
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label11: TLabel
      Left = 432
      Top = 44
      Width = 43
      Height = 13
      Caption = 'Empresa'
    end
    object Label12: TLabel
      Left = 96
      Top = 4
      Width = 22
      Height = 13
      Caption = 'Seq.'
    end
    object Label13: TLabel
      Left = 8
      Top = 164
      Width = 40
      Height = 13
      Caption = 'Cheque'
    end
    object EdtCodFor: TEdit
      Left = 8
      Top = 60
      Width = 56
      Height = 21
      Hint = 'Pressione F2 para Consultar Fornecedor'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object EdtNomeFor: TEdit
      Left = 74
      Top = 60
      Width = 351
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
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
      TabOrder = 4
    end
    object EdtTipoDoc: TEdit
      Left = 8
      Top = 100
      Width = 136
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      ReadOnly = True
      TabOrder = 5
    end
    object EdtNumDoc: TEdit
      Left = 152
      Top = 100
      Width = 136
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      ReadOnly = True
      TabOrder = 6
    end
    object EdtValor: TCurrencyEdit
      Left = 296
      Top = 100
      Width = 96
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
      TabOrder = 7
      ZeroEmpty = False
    end
    object EdtVenc: TMaskEdit
      Left = 400
      Top = 100
      Width = 80
      Height = 21
      TabStop = False
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 8
      Text = '  /  /    '
    end
    object EdtObs: TEdit
      Left = 8
      Top = 140
      Width = 473
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      ReadOnly = True
      TabOrder = 9
    end
    object EdtDesc: TCurrencyEdit
      Left = 133
      Top = 180
      Width = 97
      Height = 19
      Margins.Left = 4
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      ReadOnly = True
      TabOrder = 10
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 258
      Top = 180
      Width = 97
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
      TabOrder = 11
      ZeroEmpty = False
    end
    object EdtValorPago: TCurrencyEdit
      Left = 384
      Top = 180
      Width = 97
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
      TabOrder = 12
      ZeroEmpty = False
    end
    object EdtCod: TEdit
      Left = 8
      Top = 20
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Color = clYellow
      TabOrder = 0
      OnEnter = EdtCodEnter
      OnKeyPress = EdtCodKeyPress
    end
    object EdtCodEmp: TEdit
      Left = 432
      Top = 60
      Width = 49
      Height = 21
      Hint = 'Pressione F2 para Consultar Fornecedor'
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 13
    end
    object EdtSeq: TEdit
      Left = 96
      Top = 20
      Width = 41
      Height = 21
      Alignment = taRightJustify
      Color = clSilver
      TabOrder = 1
      OnEnter = EdtSeqEnter
      OnKeyPress = EdtCodKeyPress
    end
    object EdtCheque: TEdit
      Left = 8
      Top = 180
      Width = 105
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      ReadOnly = True
      TabOrder = 14
    end
    object BtnBuscaDados: TBitBtn
      Left = 168
      Top = 16
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnBuscaDadosClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 505
    Height = 43
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnOk: TButton
      Left = 132
      Top = 12
      Width = 89
      Height = 25
      Caption = '&Cancela Pagto.'
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancela: TButton
      Left = 284
      Top = 12
      Width = 89
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnCancelaClick
    end
  end
  object QConsPagar: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT C.*, F.RAZAO_FOR'
      'FROM CONTAS_PAGAR C'
      'INNER JOIN FORNECEDOR F'
      'ON (C.COD_FOR = F.COD_FOR)'
      'WHERE C.COD_CPT = :CODCPT AND C.SEQUENCIA_CTP = :SEQCTP'
      'AND C.DTPAGTO_CTP IS NOT NULL')
    Left = 24
    Top = 216
    ParamData = <
      item
        Name = 'CODCPT'
        DataType = ftInteger
      end
      item
        Name = 'SEQCTP'
        DataType = ftInteger
      end>
    object QConsPagarCOD_CPT: TIntegerField
      FieldName = 'COD_CPT'
      Origin = 'CONTAS_PAGAR.COD_CPT'
      Required = True
    end
    object QConsPagarCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CONTAS_PAGAR.COD_EMP'
      Required = True
    end
    object QConsPagarDATA_CTP: TDateField
      FieldName = 'DATA_CTP'
      Origin = 'CONTAS_PAGAR.DATA_CTP'
      Required = True
    end
    object QConsPagarCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'CONTAS_PAGAR.COD_FOR'
      Required = True
    end
    object QConsPagarTIPO_DOC_CTP: TStringField
      FieldName = 'TIPO_DOC_CTP'
      Origin = 'CONTAS_PAGAR.TIPO_DOC_CTP'
    end
    object QConsPagarNUM_DOC_CTP: TStringField
      FieldName = 'NUM_DOC_CTP'
      Origin = 'CONTAS_PAGAR.NUM_DOC_CTP'
    end
    object QConsPagarVALOR_CTP: TBCDField
      FieldName = 'VALOR_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_CTP'
      Required = True
      Precision = 18
      Size = 2
    end
    object QConsPagarDTVENCTO_CTP: TDateField
      FieldName = 'DTVENCTO_CTP'
      Origin = 'CONTAS_PAGAR.DTVENCTO_CTP'
      Required = True
    end
    object QConsPagarDTPAGTO_CTP: TDateField
      FieldName = 'DTPAGTO_CTP'
      Origin = 'CONTAS_PAGAR.DTPAGTO_CTP'
    end
    object QConsPagarVALOR_PAGO_CTP: TBCDField
      FieldName = 'VALOR_PAGO_CTP'
      Origin = 'CONTAS_PAGAR.VALOR_PAGO_CTP'
      Precision = 18
      Size = 2
    end
    object QConsPagarDESCONTO_CTP: TBCDField
      FieldName = 'DESCONTO_CTP'
      Origin = 'CONTAS_PAGAR.DESCONTO_CTP'
      Precision = 18
      Size = 2
    end
    object QConsPagarACRESCIMO_CTP: TBCDField
      FieldName = 'ACRESCIMO_CTP'
      Origin = 'CONTAS_PAGAR.ACRESCIMO_CTP'
      Precision = 18
      Size = 2
    end
    object QConsPagarOBS_CTP: TStringField
      FieldName = 'OBS_CTP'
      Origin = 'CONTAS_PAGAR.OBS_CTP'
      Size = 60
    end
    object QConsPagarRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QConsPagarCOD_ENTRADA: TIntegerField
      FieldName = 'COD_ENTRADA'
      Origin = 'CONTAS_PAGAR.COD_ENTRADA'
    end
    object QConsPagarSEQUENCIA_CTP: TIntegerField
      FieldName = 'SEQUENCIA_CTP'
      Origin = 'CONTAS_PAGAR.SEQUENCIA_CTP'
      Required = True
    end
    object QConsPagarCOD_CLASSIFICACAO: TIntegerField
      FieldName = 'COD_CLASSIFICACAO'
      Origin = 'CONTAS_PAGAR.COD_CLASSIFICACAO'
      Required = True
    end
    object QConsPagarCODIGO_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'CODIGO_FORMA_PAGAMENTO'
      Origin = 'CONTAS_PAGAR.CODIGO_FORMA_PAGAMENTO'
    end
    object QConsPagarCODIGO_CENTRO_CUSTO: TIntegerField
      FieldName = 'CODIGO_CENTRO_CUSTO'
      Origin = 'CONTAS_PAGAR.CODIGO_CENTRO_CUSTO'
    end
    object QConsPagarCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CONTAS_PAGAR.CHEQUE'
      Size = 10
    end
  end
  object QCancela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'UPDATE CONTAS_PAGAR SET DTPAGTO_CTP = NULL, VALOR_PAGO_CTP = NUL' +
        'L, DESCONTO_CTP = NULL, ACRESCIMO_CTP = NULL, CODIGO_FORMA_PAGAM' +
        'ENTO = NULL,'
      'CHEQUE = NULL'
      'WHERE COD_CPT = :CODCPT AND SEQUENCIA_CTP = :SEQCTP')
    Left = 88
    Top = 216
    ParamData = <
      item
        Name = 'CODCPT'
        DataType = ftInteger
      end
      item
        Name = 'SEQCTP'
        DataType = ftInteger
      end>
  end
end
