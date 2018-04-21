object FrmSitCli: TFrmSitCli
  Left = 335
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Situa'#231#227'o do Cliente'
  ClientHeight = 240
  ClientWidth = 460
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
    Width = 460
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Cliente:'
    end
    object LCliente: TLabel
      Left = 80
      Top = 8
      Width = 353
      Height = 13
      AutoSize = False
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 52
      Width = 47
      Height = 13
      Caption = 'Situa'#231#227'o:'
    end
    object LSit: TLabel
      Left = 80
      Top = 52
      Width = 265
      Height = 17
      AutoSize = False
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 29
      Width = 66
      Height = 13
      Caption = 'Tipo Cr'#233'dito:'
    end
    object LTipoCredito: TLabel
      Left = 80
      Top = 29
      Width = 337
      Height = 17
      AutoSize = False
      Caption = 'Tipo de Cr'#233'dito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 72
      Width = 460
      Height = 149
      Align = alBottom
      Enabled = False
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 70
      ExplicitWidth = 456
      object EdtSaldo: TLabel
        Left = 8
        Top = 88
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Atual:'
      end
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Limite Cr'#233'dito:'
      end
      object Label7: TLabel
        Left = 232
        Top = 24
        Width = 105
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Limite Cheque:'
      end
      object Label8: TLabel
        Left = 224
        Top = 88
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Atual Cheque:'
      end
      object Label9: TLabel
        Left = 216
        Top = 120
        Width = 121
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cheques Devolvidos:'
      end
      object Label10: TLabel
        Left = 8
        Top = 120
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Dias Atraso:'
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 89
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Devedor:'
      end
      object Label4: TLabel
        Left = 224
        Top = 56
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Devedor Cheque:'
      end
      object EdtLimiteCredito: TCurrencyEdit
        Left = 104
        Top = 16
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
      object EdtSaldoAtual: TCurrencyEdit
        Left = 104
        Top = 80
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ZeroEmpty = False
      end
      object EdtLimiteCheque: TCurrencyEdit
        Left = 344
        Top = 16
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
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
      object EdtSaldoCheque: TCurrencyEdit
        Left = 344
        Top = 80
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
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
      object EdtChequesDev: TCurrencyEdit
        Left = 344
        Top = 112
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
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
      object EdtDiasAtraso: TEdit
        Left = 104
        Top = 112
        Width = 97
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EdtSaldoDev: TCurrencyEdit
        Left = 104
        Top = 48
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
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
      object EdtSaldoDevCheque: TCurrencyEdit
        Left = 344
        Top = 48
        Width = 97
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = cl3DLight
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        FormatOnEditing = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        ZeroEmpty = False
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 221
    Width = 460
    Height = 19
    Panels = <>
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT NOME_CLI, LIMITE_CHEQUE, LIMITE_CLI, BLOQUEADO_CLI, TIPO_' +
        'CREDITO_CLI'
      'FROM CLIENTE'
      'WHERE COD_CLI = :CODCLI')
    Left = 112
    Top = 192
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
  end
  object QCredito: TFDQuery
    OnCalcFields = QCreditoCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_SALDO_CREDITO_CLIENTE (:CODCLI)')
    Left = 160
    Top = 192
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
    object QCreditoVALOR_BRUTO: TBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.VALOR_BRUTO'
      Precision = 18
      Size = 2
    end
    object QCreditoDIAS_ATRASO: TBCDField
      FieldName = 'DIAS_ATRASO'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.DIAS_ATRASO'
      Precision = 18
      Size = 2
    end
    object QCreditoTAXA_JUROS: TBCDField
      FieldName = 'TAXA_JUROS'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.TAXA_JUROS'
      Precision = 18
      Size = 2
    end
    object QCreditoDIAS_CARENCIA: TIntegerField
      FieldName = 'DIAS_CARENCIA'
      Origin = 'SP_SALDO_CREDITO_CLIENTE.DIAS_CARENCIA'
    end
    object QCreditoTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
  end
  object QCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_SALDO_CHEQUE_CLIENTE (:CODCLI, :TIPO)')
    Left = 208
    Top = 192
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end>
    object QChequeTOTAL_CHEQUES: TBCDField
      FieldName = 'TOTAL_CHEQUES'
      Origin = 'SP_SALDO_CHEQUE_CLIENTE.TOTAL_CHEQUES'
      Precision = 18
      Size = 2
    end
  end
end
