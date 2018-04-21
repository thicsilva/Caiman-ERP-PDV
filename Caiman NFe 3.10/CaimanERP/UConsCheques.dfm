object FrmConsCheques: TFrmConsCheques
  Left = 262
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cheques'
  ClientHeight = 459
  ClientWidth = 696
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 440
    Width = 696
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 81
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label2: TLabel
      Left = 376
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Total:'
    end
    object LTotal: TLabel
      Left = 416
      Top = 64
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'LTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GB2: TGroupBox
      Left = 8
      Top = 8
      Width = 249
      Height = 49
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 120
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 8
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 136
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 60
      Width = 153
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
    object RDG: TRadioGroup
      Left = 264
      Top = 8
      Width = 257
      Height = 49
      Caption = 'Cheques'
      Columns = 2
      Items.Strings = (
        'Em aberto'
        'Devolvidos'
        'Pagos'
        'Depositados')
      TabOrder = 2
    end
    object BtnOk: TButton
      Left = 544
      Top = 24
      Width = 57
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 616
      Top = 24
      Width = 57
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 696
    Height = 359
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 692
      Height = 355
      Align = alClient
      Color = clSilver
      DataSource = DSQConsCheque
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
          FieldName = 'COD_EMP'
          Title.Alignment = taCenter
          Title.Caption = 'COD.EMP'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'COD.CHE'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Width = 73
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Width = 296
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMITENTE'
          Title.Alignment = taCenter
          Width = 300
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_BAN'
          Title.Alignment = taCenter
          Title.Caption = 'BANCO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'AGENCIA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'AG'#202'NCIA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CONTA_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NUMERO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'EMISSAO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'EMISS'#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VENCTO_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VENCIMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI.DEP'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI.DEV'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEGDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG.DEP'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'SEGDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'SEG.DEV'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PAGTODEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PAGTO.DEV'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA DEPOSITO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'OBS'
          Visible = True
        end>
    end
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT CHE.*, CLI.NOME_CLI, BAN.NOME_BAN, CON.NOME_CONTA,'
      'E.NOME_CLI EMITENTE'
      'FROM CHEQUE CHE'
      'INNER JOIN CLIENTE CLI'
      'ON (CHE.COD_CLI = CLI.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (CHE.COD_EMITENTE = E.COD_CLI)'
      'INNER JOIN BANCO BAN'
      'ON (CHE.COD_BANCO = BAN.COD_BAN)'
      'LEFT JOIN CONTAS_CORRENTE CON'
      'ON (CHE.COD_CONTA = CON.COD_CONTA)')
    Left = 176
    Top = 152
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
      EditFormat = ',#0.00'
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
    object QConsChequeNOME_CONTA: TStringField
      FieldName = 'NOME_CONTA'
      Origin = 'CONTAS_CORRENTE.NOME_CONTA'
      Size = 50
    end
    object QConsChequeEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
  end
  object DSQConsCheque: TDataSource
    DataSet = QConsCheque
    Left = 176
    Top = 208
  end
end
