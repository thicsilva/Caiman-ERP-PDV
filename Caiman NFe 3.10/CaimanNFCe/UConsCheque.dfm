object FrmConsCheque: TFrmConsCheque
  Left = 330
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cheque'
  ClientHeight = 516
  ClientWidth = 665
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
    Width = 665
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 77
      Height = 13
      Align = alTop
      Caption = 'Consultar Por'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object BtnConsCli: TsSpeedButton
      Left = 67
      Top = 48
      Width = 23
      Height = 21
      Hint = 'Consultar Vendedor Cliente'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
        B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
        EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
        FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
        B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
        FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
        E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
        A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
        FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
        C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
        FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
        A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsCliClick
    end
    object LTipoCredito: TLabel
      Left = 512
      Top = 24
      Width = 137
      Height = 20
      AutoSize = False
      Caption = 'LTipoCredito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LAtivo: TLabel
      Left = 512
      Top = 57
      Width = 137
      Height = 17
      AutoSize = False
      Caption = 'LAtivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 54
      Height = 13
      Caption = 'Cod.Cliente'
    end
    object Label4: TLabel
      Left = 94
      Top = 32
      Width = 98
      Height = 13
      Caption = 'Descri'#231#227'o do Cliente'
    end
    object EdtCodCli: TEdit
      Left = 8
      Top = 48
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar Cliente'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = EdtCodCliEnter
      OnExit = EdtCodCliExit
      OnKeyDown = EdtCodCliKeyDown
      OnKeyPress = EdtCodCliKeyPress
    end
    object EdtNomeCli: TEdit
      Left = 94
      Top = 48
      Width = 395
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 497
    Width = 665
    Height = 19
    Panels = <
      item
        Text = '( ALT + M ) Menu Fiscal'
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 209
    Width = 665
    Height = 288
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 661
      Height = 247
      Align = alTop
      Color = clGradientInactiveCaption
      DataSource = DSConsCheque
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESC_CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 247
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'DESC_EMITENTE'
          Title.Alignment = taCenter
          Title.Caption = 'EMITENTE'
          Width = 212
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 65
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Width = 84
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Width = 66
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCTO'
          Width = 63
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = '1'#186' DEP.'
          Width = 65
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = '1'#170' DEV.'
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'SEGDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = '2'#186' DEP.'
          Width = 63
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'SEGDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = '2'#170' DEV.'
          Width = 63
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'PAGTODEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO.'
          Width = 67
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Width = 57
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Width = 56
          Visible = True
        end
        item
          Color = 16776176
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Width = 190
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 167
      Top = 255
      Width = 98
      Height = 25
      Caption = '&Localizar'
      TabOrder = 2
      OnClick = BtnLocalizarClick
    end
    object BtnCliente: TButton
      Left = 283
      Top = 255
      Width = 98
      Height = 25
      Caption = '&Cliente'
      TabOrder = 3
      OnClick = BtnClienteClick
    end
    object BtnSair: TButton
      Left = 515
      Top = 255
      Width = 98
      Height = 25
      Caption = '&Sair'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object BtnSelecionarCliente: TButton
      Left = 51
      Top = 255
      Width = 98
      Height = 25
      Caption = '&Selecionar Cliente'
      TabOrder = 1
      OnClick = BtnSelecionarClienteClick
    end
    object BtnCancelar: TButton
      Left = 399
      Top = 255
      Width = 98
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 665
    Height = 120
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 3
    object Label5: TLabel
      Left = 192
      Top = 8
      Width = 82
      Height = 13
      Caption = 'Limite de Cheque'
    end
    object Label7: TLabel
      Left = 400
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Cheques Aberto'
    end
    object Label8: TLabel
      Left = 512
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Saldo Atual'
    end
    object Label10: TLabel
      Left = 8
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label11: TLabel
      Left = 296
      Top = 8
      Width = 72
      Height = 13
      Caption = 'Ch. Devolvidos'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Cheques OK'
    end
    object MemoObs: TMemo
      Left = 8
      Top = 64
      Width = 641
      Height = 46
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtChequesDev: TCurrencyEdit
      Left = 296
      Top = 24
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object EdtLimite: TCurrencyEdit
      Left = 192
      Top = 24
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ZeroEmpty = False
    end
    object EdtSaldo: TCurrencyEdit
      Left = 512
      Top = 24
      Width = 81
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      ZeroEmpty = False
    end
    object EdtChequesAberto: TCurrencyEdit
      Left = 400
      Top = 24
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      ZeroEmpty = False
    end
    object EdtChequesOK: TCurrencyEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      ZeroEmpty = False
    end
  end
  object DSConsCheque: TDataSource
    AutoEdit = False
    DataSet = QConsCheque
    Left = 280
    Top = 256
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    OnCalcFields = QConsChequeCalcFields
    SQL.Strings = (
      
        'SELECT CH.*, CLI.NOME_CLI DESC_CLIENTE , E.NOME_CLI DESC_EMITENT' +
        'E, B.NOME_BAN'
      'FROM CHEQUE CH'
      'INNER JOIN CLIENTE CLI'
      'ON (CH.COD_CLI = CLI.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (CH.COD_EMITENTE = E.COD_CLI)'
      'INNER JOIN BANCO B'
      'ON (CH.COD_BANCO = B.COD_BAN)'
      'WHERE CH.COD_CLI = :CODCLI OR CH.COD_EMITENTE = :CODEMI'
      'ORDER BY CH.EMISSAO_CHE DESC')
    Left = 368
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODEMI'
        ParamType = ptUnknown
      end>
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
    object QConsChequeCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUE.COD_BANCO'
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
    object QConsChequeEMITENTE_CHE: TStringField
      FieldName = 'EMITENTE_CHE'
      Origin = 'CHEQUE.EMITENTE_CHE'
      Size = 50
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
    object QConsChequeCOD_CONTA: TIntegerField
      FieldName = 'COD_CONTA'
      Origin = 'CHEQUE.COD_CONTA'
    end
    object QConsChequePRIDEP_CHE: TDateField
      FieldName = 'PRIDEP_CHE'
      Origin = 'CHEQUE.PRIDEP_CHE'
    end
    object QConsChequeSEGDEP_CHE: TDateField
      FieldName = 'SEGDEP_CHE'
      Origin = 'CHEQUE.SEGDEP_CHE'
    end
    object QConsChequePRIDEV_CHE: TDateField
      FieldName = 'PRIDEV_CHE'
      Origin = 'CHEQUE.PRIDEV_CHE'
    end
    object QConsChequeSEGDEV_CHE: TDateField
      FieldName = 'SEGDEV_CHE'
      Origin = 'CHEQUE.SEGDEV_CHE'
    end
    object QConsChequePAGTODEV_CHE: TDateField
      FieldName = 'PAGTODEV_CHE'
      Origin = 'CHEQUE.PAGTODEV_CHE'
    end
    object QConsChequeOBS_CHE: TStringField
      FieldName = 'OBS_CHE'
      Origin = 'CHEQUE.OBS_CHE'
      Size = 50
    end
    object QConsChequeCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CHEQUE.COD_EMP'
      Required = True
    end
    object QConsChequeCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Origin = 'CHEQUE.COD_VENDA'
    end
    object QConsChequeDESTINO_CHE: TStringField
      FieldName = 'DESTINO_CHE'
      Origin = 'CHEQUE.DESTINO_CHE'
      Size = 60
    end
    object QConsChequeCOD_REPASSE: TIntegerField
      FieldName = 'COD_REPASSE'
      Origin = 'CHEQUE.COD_REPASSE'
    end
    object QConsChequeSELECIONADO_CHE: TStringField
      FieldName = 'SELECIONADO_CHE'
      Origin = 'CHEQUE.SELECIONADO_CHE'
      FixedChar = True
      Size = 1
    end
    object QConsChequeCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CHEQUE.COD_CTR'
    end
    object QConsChequeCOD_EMITENTE: TIntegerField
      FieldName = 'COD_EMITENTE'
      Origin = 'CHEQUE.COD_EMITENTE'
      Required = True
    end
    object QConsChequeCOD_CAIXA: TIntegerField
      FieldName = 'COD_CAIXA'
      Origin = 'CHEQUE.COD_CAIXA'
      Required = True
    end
    object QConsChequeCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CHEQUE.COD_USUARIO'
      Required = True
    end
    object QConsChequeCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = 'CHEQUE.CODIGO_PAF'
    end
    object QConsChequeDESC_CLIENTE: TStringField
      FieldName = 'DESC_CLIENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsChequeDESC_EMITENTE: TStringField
      FieldName = 'DESC_EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsChequeCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Calculated = True
    end
    object QConsChequeNOME_BAN: TStringField
      FieldName = 'NOME_BAN'
      Origin = 'BANCO.NOME_BAN'
      Required = True
      Size = 50
    end
  end
  object QCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT COD_CLI, CONTROLAR_LIMITE, LIMITE_CHEQUE, BLOQUEADO_CLI, ' +
        'NOME_CLI, OBS_VENDA, TIPO_CREDITO_CLI'
      
        'FROM CLIENTE WHERE COD_CLI = :CODCLI AND TIPO_CREDITO_CLI IN ('#39'C' +
        'H'#39', '#39'PC'#39')')
    Left = 368
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
  end
end
