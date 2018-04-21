object FrmRecebimento: TFrmRecebimento
  Left = 328
  Top = 360
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recebimento'
  ClientHeight = 175
  ClientWidth = 506
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Valor Bruto'
    end
    object Label2: TLabel
      Left = 192
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Acr'#233'scimo'
    end
    object Label3: TLabel
      Left = 272
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Desconto'
    end
    object Label4: TLabel
      Left = 344
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Valor L'#237'quido'
    end
    object Label8: TLabel
      Left = 104
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Devol.'
    end
    object EdtTotalBruto: TCurrencyEdit
      Left = 8
      Top = 24
      Width = 81
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
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtAcres: TCurrencyEdit
      Left = 192
      Top = 24
      Width = 65
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
      OnExit = EdtAcresExit
    end
    object EdtDesc: TCurrencyEdit
      Left = 272
      Top = 24
      Width = 65
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 1
      ZeroEmpty = False
      OnExit = EdtAcresExit
    end
    object EdtTotalLiq: TCurrencyEdit
      Left = 344
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
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtDevol: TCurrencyEdit
      Left = 104
      Top = 24
      Width = 73
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
      TabOrder = 4
      ZeroEmpty = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 506
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Valor Recebido'
    end
    object Label6: TLabel
      Left = 132
      Top = 8
      Width = 111
      Height = 13
      Caption = 'Data do Recebimento'
    end
    object Label7: TLabel
      Left = 264
      Top = 8
      Width = 109
      Height = 13
      Caption = 'Forma de Pagamento'
    end
    object EdtValorRec: TCurrencyEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = False
    end
    object EdtData: TDateTimePicker
      Left = 132
      Top = 24
      Width = 97
      Height = 21
      Date = 37981.618029594900000000
      Time = 37981.618029594900000000
      Color = clSilver
      TabOrder = 1
    end
    object ComboForma: TComboBox
      Left = 264
      Top = 24
      Width = 233
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 156
    Width = 506
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 506
    Height = 43
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object BtnOK: TBitBtn
      Left = 160
      Top = 8
      Width = 73
      Height = 27
      Caption = '&OK'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnCancelar: TBitBtn
      Left = 288
      Top = 8
      Width = 73
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object IBQRecebe: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTR
    SQL.Strings = (
      'UPDATE CONTAS_RECEBER '
      'SET DTPAGTO_CTR = :DTPAGTOCTR, VLRPAGO_CTR = :VLRPAGOCTR, '
      
        'ACRESCIMO_CTR = :ACRESCIMOCTR, DESCONTO_CTR = :DESCONTOCTR, ACRE' +
        'SCIMO_RECEBIDO_CTR = :ACRESREC, '
      
        'DESCONTO_CONCEDIDO_CTR = :DESCONTOCONC, COD_CAI = :CODCAI, CODIG' +
        'O_FORMA_PAGAMENTO = :CODFORMA'
      'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ')
    Left = 96
    Top = 120
    ParamData = <
      item
        Name = 'DTPAGTOCTR'
        DataType = ftDate
      end
      item
        Name = 'VLRPAGOCTR'
        DataType = ftFloat
      end
      item
        Name = 'ACRESCIMOCTR'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTOCTR'
        DataType = ftFloat
      end
      item
        Name = 'ACRESREC'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTOCONC'
        DataType = ftFloat
      end
      item
        Name = 'CODCAI'
        DataType = ftInteger
      end
      item
        Name = 'CODFORMA'
      end
      item
        Name = 'CODCTR'
        DataType = ftInteger
      end
      item
        Name = 'SEQ'
        DataType = ftInteger
      end>
  end
  object IBTR: TFDTransaction
    Connection = DM.IBDatabase
    Left = 384
    Top = 120
  end
  object QInsParcela: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTR
    SQL.Strings = (
      
        'INSERT INTO CONTAS_RECEBER (COD_CTR, SEQUENCIA_CTR, COD_EMP, DAT' +
        'A_CTR, COD_VENDA, COD_CLI, VENCTO_CTR,'
      
        'VALOR_CTR, NUMDOCUMENTO_CTR, OBS_CTR, COD_COB, PARCELA_CTR, DEVO' +
        'LUCAO_CTR, CAIXA_EMISSAO_CTR, CODIGO_CLASSIFICACAO) '
      
        'VALUES (:CODCTR, :SEQUENCIACTR, :CODEMP, :DATACTR, :CODVENDA, :C' +
        'ODCLI, :VENCTOCTR, :VALORCTR, :NUMDOCUMENTOCTR, :OBSCTR, :CODCOB' +
        ', :PARC, :DEVOL, :CX, :CODCLASSIF)')
    Left = 24
    Top = 120
    ParamData = <
      item
        Name = 'CODCTR'
        DataType = ftInteger
      end
      item
        Name = 'SEQUENCIACTR'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATACTR'
        DataType = ftDate
      end
      item
        Name = 'CODVENDA'
        DataType = ftInteger
      end
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'VENCTOCTR'
        DataType = ftDate
      end
      item
        Name = 'VALORCTR'
        DataType = ftCurrency
      end
      item
        Name = 'NUMDOCUMENTOCTR'
        DataType = ftString
      end
      item
        Name = 'OBSCTR'
        DataType = ftString
      end
      item
        Name = 'CODCOB'
        DataType = ftInteger
      end
      item
        Name = 'PARC'
        DataType = ftInteger
      end
      item
        Name = 'DEVOL'
        DataType = ftCurrency
      end
      item
        Name = 'CX'
      end
      item
        Name = 'CODCLASSIF'
      end>
  end
end
