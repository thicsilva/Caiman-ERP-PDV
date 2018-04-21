object FrmRepasseCheque: TFrmRepasseCheque
  Left = 243
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Repasse de Cheques'
  ClientHeight = 485
  ClientWidth = 667
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
    Width = 667
    Height = 57
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 263
      Height = 53
      Align = alLeft
      Caption = 'Vencimento'
      TabOrder = 0
      object Label1: TLabel
        Left = 128
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 16
        Top = 20
        Width = 97
        Height = 21
        Date = 38225.764695949100000000
        Time = 38225.764695949100000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 152
        Top = 20
        Width = 97
        Height = 21
        Date = 38225.764695949100000000
        Time = 38225.764695949100000000
        TabOrder = 1
      end
    end
    object BtnOK: TBitBtn
      Left = 480
      Top = 24
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 560
      Top = 24
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
    object CheckDev: TCheckBox
      Left = 280
      Top = 32
      Width = 185
      Height = 17
      Caption = 'Incluir Cheques Devolvidos'
      TabOrder = 1
    end
    object CheckEmp: TCheckBox
      Left = 280
      Top = 8
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 667
    Height = 308
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 663
      Height = 304
      Align = alClient
      Color = clSilver
      DataSource = DSQConsCheque
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 60
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Width = 59
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CONTA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Width = 62
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 78
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 207
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 345
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Alignment = taCenter
          Width = 280
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEP.'
          Width = 87
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEV.'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEGDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG DEP'
          Width = 74
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEGDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG DEV'
          Width = 77
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PAGTODEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO'
          Width = 76
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'EMP'
          Width = 37
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'OSBSERVA'#199#195'O'
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 466
    Width = 667
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 365
    Width = 667
    Height = 101
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Destino'
    end
    object Label3: TLabel
      Left = 128
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Data p/Repasse'
    end
    object Label5: TLabel
      Left = 240
      Top = 8
      Width = 66
      Height = 13
      Caption = 'C'#243'd.Repasse'
    end
    object EdtDestino: TEdit
      Left = 8
      Top = 64
      Width = 649
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object EdtTotal: TCurrencyEdit
      Left = 128
      Top = 24
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
    object EdtDataRepasse: TDateTimePicker
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      Date = 38225.764695949100000000
      Time = 38225.764695949100000000
      TabOrder = 0
    end
    object BtnGrava: TBitBtn
      Left = 336
      Top = 21
      Width = 73
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnGravaClick
    end
    object EdtCod: TEdit
      Left = 240
      Top = 24
      Width = 65
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
      TabOrder = 4
    end
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRConsCheque
    SQL.Strings = (
      
        'SELECT CHE.COD_CHE, CHE.COD_CLI, CHE.AGENCIA_CHE, CHE.CONTA_CHE,' +
        ' CHE.NUMERO_CHE, CHE.EMISSAO_CHE, CHE.VENCTO_CHE, CHE.VALOR_CHE,' +
        ' CHE.PRIDEP_CHE, CHE.PRIDEV_CHE, CHE.SEGDEP_CHE, CHE.SEGDEV_CHE,' +
        ' CHE.OBS_CHE, CLI.NOME_CLI, CHE.SELECIONADO_CHE, BAN.NOME_BAN, E' +
        '.NOME_CLI EMITENTE,'
      'CHE.PAGTODEV_CHE, CHE.COD_EMP'
      'FROM CHEQUE CHE'
      'INNER JOIN CLIENTE CLI'
      'ON (CHE.COD_CLI = CLI.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (CHE.COD_EMITENTE = E.COD_CLI)'
      'INNER JOIN BANCO BAN'
      'ON (CHE.COD_BANCO = BAN.COD_BAN)'
      '')
    Left = 136
    Top = 144
    object QConsChequeCOD_CHE: TIntegerField
      FieldName = 'COD_CHE'
      Origin = 'CHEQUE.COD_CHE'
      Required = True
    end
    object QConsChequeCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CHEQUE.COD_CLI'
      Required = True
    end
    object QConsChequeAGENCIA_CHE: TStringField
      FieldName = 'AGENCIA_CHE'
      Origin = 'CHEQUE.AGENCIA_CHE'
      Size = 10
    end
    object QConsChequeCONTA_CHE: TStringField
      FieldName = 'CONTA_CHE'
      Origin = 'CHEQUE.CONTA_CHE'
      Size = 10
    end
    object QConsChequeNUMERO_CHE: TStringField
      FieldName = 'NUMERO_CHE'
      Origin = 'CHEQUE.NUMERO_CHE'
      Size = 10
    end
    object QConsChequeEMISSAO_CHE: TDateField
      FieldName = 'EMISSAO_CHE'
      Origin = 'CHEQUE.EMISSAO_CHE'
      Required = True
    end
    object QConsChequeVENCTO_CHE: TDateField
      FieldName = 'VENCTO_CHE'
      Origin = 'CHEQUE.VENCTO_CHE'
      Required = True
    end
    object QConsChequeVALOR_CHE: TBCDField
      FieldName = 'VALOR_CHE'
      Origin = 'CHEQUE.VALOR_CHE'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QConsChequePRIDEP_CHE: TDateField
      FieldName = 'PRIDEP_CHE'
      Origin = 'CHEQUE.PRIDEP_CHE'
    end
    object QConsChequePRIDEV_CHE: TDateField
      FieldName = 'PRIDEV_CHE'
      Origin = 'CHEQUE.PRIDEV_CHE'
    end
    object QConsChequeSEGDEP_CHE: TDateField
      FieldName = 'SEGDEP_CHE'
      Origin = 'CHEQUE.SEGDEP_CHE'
    end
    object QConsChequeSEGDEV_CHE: TDateField
      FieldName = 'SEGDEV_CHE'
      Origin = 'CHEQUE.SEGDEV_CHE'
    end
    object QConsChequeOBS_CHE: TStringField
      FieldName = 'OBS_CHE'
      Origin = 'CHEQUE.OBS_CHE'
      Size = 50
    end
    object QConsChequeNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsChequeNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
    object QConsChequePAGTODEV_CHE: TDateField
      FieldName = 'PAGTODEV_CHE'
      Origin = 'CHEQUE.PAGTODEV_CHE'
    end
    object QConsChequeCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CHEQUE.COD_EMP'
      Required = True
    end
    object QConsChequeSELECIONADO_CHE: TStringField
      FieldName = 'SELECIONADO_CHE'
      Origin = 'CHEQUE.SELECIONADO_CHE'
      FixedChar = True
      Size = 1
    end
    object QConsChequeEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object DSQConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 136
    Top = 256
  end
  object IBTRConsCheque: TFDTransaction
    Connection = DM.IBDatabase
    Left = 136
    Top = 200
  end
  object QRepassa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRRepassa
    SQL.Strings = (
      '')
    Left = 232
    Top = 144
  end
  object IBTRRepassa: TFDTransaction
    Connection = DM.IBDatabase
    Left = 232
    Top = 200
  end
end
