object FrmConsCheque: TFrmConsCheque
  Left = 278
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cheques'
  ClientHeight = 427
  ClientWidth = 594
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
    Top = 408
    Width = 594
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 137
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 329
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 305
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'CLIENTE'
          'BANCO'
          'DATA EMISS'#195'O'
          'DATA VENCIMENTO'
          'NUM.CHEQUE')
      end
    end
    object GB2: TGroupBox
      Left = 8
      Top = 61
      Width = 329
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
      object BtnCons: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000502020B4B201CB1662A26F032151275000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
          0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
          052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
          00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
          27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
          12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
          23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
          26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
          04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
          28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
          090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
          23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
          4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
          1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
          69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
          22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
          527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
          28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
          0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
          28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
          020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
          14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
          20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
          0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
          26F92F14116F0000000000000000000000000000000000000000000000000000
          0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
          0625000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label7: TLabel
        Left = 160
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtcod: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = edtcodEnter
        OnExit = edtcodExit
        OnKeyDown = edtcodKeyDown
        OnKeyPress = edtcodKeyPress
      end
      object EdtNome: TEdit
        Left = 88
        Top = 18
        Width = 225
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object EdtDataIni: TDateTimePicker
        Left = 48
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        Color = clSilver
        TabOrder = 3
      end
      object EdtDataFin: TDateTimePicker
        Left = 192
        Top = 18
        Width = 97
        Height = 21
        Date = 37954.412703738400000000
        Time = 37954.412703738400000000
        Color = clSilver
        TabOrder = 4
      end
    end
    object BtnOk: TButton
      Left = 352
      Top = 82
      Width = 49
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object GroupBox2: TGroupBox
      Left = 416
      Top = 8
      Width = 169
      Height = 113
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 60
        Height = 13
        Caption = 'A Depositar'
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 65
        Height = 13
        Caption = 'Depositados'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Devolvidos'
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 31
        Height = 13
        Caption = 'Pagos'
      end
      object Label5: TLabel
        Left = 8
        Top = 88
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Ladepositar: TLabel
        Left = 91
        Top = 16
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ladepositar'
      end
      object LDepositados: TLabel
        Left = 91
        Top = 32
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ladepositar'
      end
      object Ldevolvidos: TLabel
        Left = 91
        Top = 48
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ladepositar'
      end
      object LPagos: TLabel
        Left = 91
        Top = 64
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ladepositar'
      end
      object Label6: TLabel
        Left = 88
        Top = 80
        Width = 100
        Height = 13
        Caption = '-------------------------'
      end
      object LTotal: TLabel
        Left = 91
        Top = 88
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ladepositar'
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 112
      Width = 177
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 594
    Height = 271
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 577
      Height = 225
      Color = clSilver
      DataSource = DSQConsCheque
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
          FieldName = 'COD_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
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
          FieldName = 'CLIENTE'
          Title.Alignment = taCenter
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
          Title.Caption = 'NUMERO'
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
          FieldName = 'VALOR_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'VALOR'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEP_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEP.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PRIDEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PRI DEV.'
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
          Title.Caption = 'SEG.DEV.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PAGTODEV_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'PAGAMENTO'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'OBS_CHE'
          Title.Alignment = taCenter
          Title.Caption = 'OBSERVA'#199#195'O'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'CONTA DEPOSITO'
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 192
      Top = 237
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnSair: TButton
      Left = 320
      Top = 237
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object QConsCheque: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT C.*, L.NOME_CLI CLIENTE, E.NOME_CLI EMITENTE, B.NOME_BAN,' +
        ' O.NOME_CONTA'
      'FROM CHEQUE C'
      'INNER JOIN CLIENTE L'
      'ON (C.COD_CLI = L.COD_CLI)'
      'INNER JOIN CLIENTE E'
      'ON (C.COD_EMITENTE = E.COD_CLI)'
      'INNER JOIN BANCO B'
      'ON (C.COD_BANCO = B.COD_BAN)'
      'LEFT JOIN CONTAS_CORRENTE O'
      'ON (C.COD_CONTA = O.COD_CONTA)')
    Left = 200
    Top = 216
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
    object QConsChequeCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'CHEQUE.COD_EMP'
      Required = True
    end
    object QConsChequeCOD_CTR: TIntegerField
      FieldName = 'COD_CTR'
      Origin = 'CHEQUE.COD_CTR'
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
    object QConsChequeCOD_EMITENTE: TIntegerField
      FieldName = 'COD_EMITENTE'
      Origin = 'CHEQUE.COD_EMITENTE'
      Required = True
    end
    object QConsChequeCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
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
    Left = 200
    Top = 264
  end
end
