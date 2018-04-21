object FrmConsCli: TFrmConsCli
  Left = 352
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Cliente'
  ClientHeight = 480
  ClientWidth = 719
  Color = clWhite
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
    Width = 719
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GBCons: TGroupBox
      Left = 8
      Top = 5
      Width = 177
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 161
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'NOME'
          'CONV'#202'NIO'
          'CLASSIFICA'#199#195'O'
          'BLOQUEADOS'
          'PALAVRA CHAVE'
          'CIDADE'
          'CNPJ/CPF')
      end
    end
    object GB2: TGroupBox
      Left = 192
      Top = 5
      Width = 385
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
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 369
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
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
        Width = 289
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
    end
    object BtnOk: TButton
      Left = 616
      Top = 42
      Width = 65
      Height = 31
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object RdgAtivo: TRadioGroup
      Left = 312
      Top = 53
      Width = 265
      Height = 33
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ativos'
        'Destivados'
        'Todos')
      TabOrder = 3
    end
    object RdgTipo: TRadioGroup
      Left = 8
      Top = 53
      Width = 297
      Height = 33
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Promiss'#243'ria'
        'Cheque'
        'Todos')
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 719
    Height = 391
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Shape1: TShape
      Left = 8
      Top = 345
      Width = 19
      Height = 19
      Brush.Color = 9211135
    end
    object Label1: TLabel
      Left = 33
      Top = 347
      Width = 125
      Height = 17
      Caption = 'Clientes dependentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object BtnSair: TButton
      Left = 399
      Top = 340
      Width = 65
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object BtnLocalizar: TButton
      Left = 255
      Top = 340
      Width = 65
      Height = 25
      Caption = 'Localizar'
      TabOrder = 2
      OnClick = BtnLocalizarClick
    end
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 719
      Height = 335
      Align = alTop
      Color = clSilver
      DataSource = DSQConsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      OnDblClick = BtnLocalizarClick
      OnKeyDown = DBGridKeyDown
      OnKeyPress = DBGridKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'C'#211'D.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_CREDITO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TP'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_SITUACAO'
          Title.Alignment = taCenter
          Title.Caption = 'SITUA'#199#195'O'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELRES_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NASCIMENTO_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'NASCIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_CLI'
          Title.Alignment = taCenter
          Title.Caption = 'CPF/CNPJ'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CON'
          Title.Alignment = taCenter
          Title.Caption = 'CONV'#202'NIO'
          Width = 235
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLA'
          Title.Alignment = taCenter
          Title.Caption = 'CLASSIFICA'#199#195'O'
          Width = 124
          Visible = True
        end>
    end
  end
  object QDias: TFDQuery
    OnCalcFields = QDiasCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT MIN(VENCTO_CTR) VENC'
      'FROM CONTAS_RECEBER R'
      'WHERE R.COD_CLI = :CODCLI AND'
      'R.DTPAGTO_CTR IS NULL')
    Left = 216
    Top = 200
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
    object QDiasVENC: TDateField
      FieldName = 'VENC'
    end
    object QDiasDIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIAS'
      Calculated = True
    end
  end
  object QConsCliente: TFDQuery
    OnCalcFields = QConsClienteCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT C.*, O.NOME_CON, S.NOME_CLA'
      'FROM CLIENTE C'
      'INNER JOIN CONVENIO O'
      'ON (C.COD_CON = O.COD_CON)'
      'INNER JOIN CLASSIF_CLIENTE S'
      'ON (C.COD_CLA = S.COD_CLA)')
    Left = 144
    Top = 200
    object QConsClienteCOD_CLI: TIntegerField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTE.COD_CLI'
      Required = True
    end
    object QConsClienteFJ_CLI: TStringField
      FieldName = 'FJ_CLI'
      Origin = 'CLIENTE.FJ_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Origin = 'CLIENTE.NOME_CLI'
      Required = True
      Size = 60
    end
    object QConsClienteCOD_CLA: TIntegerField
      FieldName = 'COD_CLA'
      Origin = 'CLIENTE.COD_CLA'
      Required = True
    end
    object QConsClienteENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QConsClienteBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QConsClienteCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QConsClienteESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QConsClienteCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CLIENTE.CEPRES_CLI'
      FixedChar = True
      Size = 9
    end
    object QConsClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsClienteENDCOM_CLI: TStringField
      FieldName = 'ENDCOM_CLI'
      Origin = 'CLIENTE.ENDCOM_CLI'
      Size = 50
    end
    object QConsClienteBAICOM_CLI: TStringField
      FieldName = 'BAICOM_CLI'
      Origin = 'CLIENTE.BAICOM_CLI'
      Size = 30
    end
    object QConsClienteCIDCOM_CLI: TStringField
      FieldName = 'CIDCOM_CLI'
      Origin = 'CLIENTE.CIDCOM_CLI'
      Size = 30
    end
    object QConsClienteESTCOM_CLI: TStringField
      FieldName = 'ESTCOM_CLI'
      Origin = 'CLIENTE.ESTCOM_CLI'
      FixedChar = True
      Size = 2
    end
    object QConsClienteCEPCOM_CLI: TStringField
      FieldName = 'CEPCOM_CLI'
      Origin = 'CLIENTE.CEPCOM_CLI'
      FixedChar = True
      Size = 9
    end
    object QConsClienteTELCOM_CLI: TStringField
      FieldName = 'TELCOM_CLI'
      Origin = 'CLIENTE.TELCOM_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsClienteCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QConsClienteDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QConsClientePAI_CLI: TStringField
      FieldName = 'PAI_CLI'
      Origin = 'CLIENTE.PAI_CLI'
      Size = 50
    end
    object QConsClienteMAE_CLI: TStringField
      FieldName = 'MAE_CLI'
      Origin = 'CLIENTE.MAE_CLI'
      Size = 50
    end
    object QConsClienteCONJUGE_CLI: TStringField
      FieldName = 'CONJUGE_CLI'
      Origin = 'CLIENTE.CONJUGE_CLI'
      Size = 50
    end
    object QConsClienteESTCIVIL_CLI: TStringField
      FieldName = 'ESTCIVIL_CLI'
      Origin = 'CLIENTE.ESTCIVIL_CLI'
      FixedChar = True
      Size = 1
    end
    object QConsClienteRENDA_CLI: TBCDField
      FieldName = 'RENDA_CLI'
      Origin = 'CLIENTE.RENDA_CLI'
      Precision = 18
      Size = 2
    end
    object QConsClienteLIMITE_CLI: TBCDField
      FieldName = 'LIMITE_CLI'
      Origin = 'CLIENTE.LIMITE_CLI'
      Precision = 18
      Size = 2
    end
    object QConsClientePROFISSAO_CLI: TStringField
      FieldName = 'PROFISSAO_CLI'
      Origin = 'CLIENTE.PROFISSAO_CLI'
      Size = 50
    end
    object QConsClienteEMPRESA_TRAB_CLI: TStringField
      FieldName = 'EMPRESA_TRAB_CLI'
      Origin = 'CLIENTE.EMPRESA_TRAB_CLI'
      Size = 50
    end
    object QConsClienteATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Origin = 'CLIENTE.ATIVO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteCOD_CON: TIntegerField
      FieldName = 'COD_CON'
      Origin = 'CLIENTE.COD_CON'
      Required = True
    end
    object QConsClienteOBS_VENDA: TStringField
      FieldName = 'OBS_VENDA'
      Origin = 'CLIENTE.OBS_VENDA'
      Size = 200
    end
    object QConsClienteOBS_CLI: TStringField
      FieldName = 'OBS_CLI'
      Origin = 'CLIENTE.OBS_CLI'
      Size = 500
    end
    object QConsClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QConsClienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'CLIENTE.DATACADASTRO_CLI'
      Required = True
    end
    object QConsClienteATRAZO_MAXIMO_CLI: TIntegerField
      FieldName = 'ATRAZO_MAXIMO_CLI'
      Origin = 'CLIENTE.ATRAZO_MAXIMO_CLI'
    end
    object QConsClienteCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CLIENTE.CELULAR_CLI'
      Size = 13
    end
    object QConsClienteIMP_SALDO_PENDENTE_CLI: TStringField
      FieldName = 'IMP_SALDO_PENDENTE_CLI'
      Origin = 'CLIENTE.IMP_SALDO_PENDENTE_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteLIMITE_CHEQUE: TBCDField
      FieldName = 'LIMITE_CHEQUE'
      Origin = 'CLIENTE.LIMITE_CHEQUE'
      Precision = 18
      Size = 2
    end
    object QConsClienteDATA_CONSULTA_SPC: TDateField
      FieldName = 'DATA_CONSULTA_SPC'
      Origin = 'CLIENTE.DATA_CONSULTA_SPC'
    end
    object QConsClienteDATA_REGISTRO_SPC: TDateField
      FieldName = 'DATA_REGISTRO_SPC'
      Origin = 'CLIENTE.DATA_REGISTRO_SPC'
    end
    object QConsClienteDATA_REABILITACAO_SPC: TDateField
      FieldName = 'DATA_REABILITACAO_SPC'
      Origin = 'CLIENTE.DATA_REABILITACAO_SPC'
    end
    object QConsClienteSELECIONADO_CLI: TStringField
      FieldName = 'SELECIONADO_CLI'
      Origin = 'CLIENTE.SELECIONADO_CLI'
      FixedChar = True
      Size = 1
    end
    object QConsClienteRENDA_CONJUGE: TBCDField
      FieldName = 'RENDA_CONJUGE'
      Origin = 'CLIENTE.RENDA_CONJUGE'
      Precision = 18
      Size = 2
    end
    object QConsClienteTRABALHO_CONJUGE: TStringField
      FieldName = 'TRABALHO_CONJUGE'
      Origin = 'CLIENTE.TRABALHO_CONJUGE'
      Size = 50
    end
    object QConsClientePROF_CONJUGE: TStringField
      FieldName = 'PROF_CONJUGE'
      Origin = 'CLIENTE.PROF_CONJUGE'
      Size = 50
    end
    object QConsClienteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTE.NOME_FANTASIA'
      Size = 60
    end
    object QConsClientePONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = 'CLIENTE.PONTO_REFERENCIA'
      Size = 80
    end
    object QConsClienteCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
      Origin = 'CLIENTE.CONTATO_CLI'
      Size = 70
    end
    object QConsClienteROTA_CLI: TIntegerField
      FieldName = 'ROTA_CLI'
      Origin = 'CLIENTE.ROTA_CLI'
    end
    object QConsClienteTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = 'CLIENTE.TIPO_CREDITO_CLI'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QConsClienteCONTROLAR_LIMITE: TStringField
      FieldName = 'CONTROLAR_LIMITE'
      Origin = 'CLIENTE.CONTROLAR_LIMITE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteBAICOB_CLI: TStringField
      FieldName = 'BAICOB_CLI'
      Origin = 'CLIENTE.BAICOB_CLI'
      Size = 30
    end
    object QConsClienteCIDCOB_CLI: TStringField
      FieldName = 'CIDCOB_CLI'
      Origin = 'CLIENTE.CIDCOB_CLI'
      Size = 30
    end
    object QConsClienteESTCOB_CLI: TStringField
      FieldName = 'ESTCOB_CLI'
      Origin = 'CLIENTE.ESTCOB_CLI'
      FixedChar = True
      Size = 2
    end
    object QConsClienteCEPCOB_CLI: TStringField
      FieldName = 'CEPCOB_CLI'
      Origin = 'CLIENTE.CEPCOB_CLI'
      FixedChar = True
      Size = 9
    end
    object QConsClienteTELCOB_CLI: TStringField
      FieldName = 'TELCOB_CLI'
      Origin = 'CLIENTE.TELCOB_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsClienteENDCOB_CLI: TStringField
      FieldName = 'ENDCOB_CLI'
      Origin = 'CLIENTE.ENDCOB_CLI'
      Size = 50
    end
    object QConsClienteBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = 'CLIENTE.BLOQUEADO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteNOME_CON: TStringField
      FieldName = 'NOME_CON'
      Origin = 'CONVENIO.NOME_CON'
      Required = True
      Size = 60
    end
    object QConsClienteNOME_CLA: TStringField
      FieldName = 'NOME_CLA'
      Origin = 'CLASSIF_CLIENTE.NOME_CLA'
      Required = True
      Size = 30
    end
    object QConsClienteCALC_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_SITUACAO'
      Size = 30
      Calculated = True
    end
    object QConsClienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      Origin = 'CLIENTE.INSC_ESTADUAL'
      Size = 30
    end
    object QConsClienteNUMRES_CLI: TStringField
      FieldName = 'NUMRES_CLI'
      Origin = 'CLIENTE.NUMRES_CLI'
      Size = 10
    end
    object QConsClienteNUMCOM_CLI: TStringField
      FieldName = 'NUMCOM_CLI'
      Origin = 'CLIENTE.NUMCOM_CLI'
      Size = 10
    end
    object QConsClienteNUMCOB_CLI: TStringField
      FieldName = 'NUMCOB_CLI'
      Origin = 'CLIENTE.NUMCOB_CLI'
      Size = 10
    end
    object QConsClienteCODIGO_IBGE: TIntegerField
      FieldName = 'CODIGO_IBGE'
      Origin = 'CLIENTE.CODIGO_IBGE'
    end
    object QConsClienteEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Origin = 'CLIENTE.EMAIL_CLI'
      Size = 100
    end
    object QConsClienteCOD_DEPENDENTE: TIntegerField
      FieldName = 'COD_DEPENDENTE'
      Origin = '"CLIENTE"."COD_DEPENDENTE"'
    end
    object QConsClienteNOME_DEPENDENTE: TStringField
      FieldName = 'NOME_DEPENDENTE'
      Origin = '"CLIENTE"."NOME_DEPENDENTE"'
      Size = 60
    end
    object QConsClienteGRAU_PARENTESCO: TStringField
      FieldName = 'GRAU_PARENTESCO'
      Origin = '"CLIENTE"."GRAU_PARENTESCO"'
    end
    object QConsClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = '"CLIENTE"."COD_VENDEDOR"'
    end
  end
  object DSQConsCliente: TDataSource
    AutoEdit = False
    DataSet = QConsCliente
    Left = 144
    Top = 256
  end
  object QAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAux
    Left = 352
    Top = 240
  end
  object IBTRAux: TFDTransaction
    Connection = DM.IBDatabase
    Left = 408
    Top = 240
  end
end
