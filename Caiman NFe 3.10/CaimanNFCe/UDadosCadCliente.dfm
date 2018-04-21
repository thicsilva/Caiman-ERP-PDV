object FrmDadosCadCliente: TFrmDadosCadCliente
  Left = 299
  Top = 227
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do Cliente'
  ClientHeight = 359
  ClientWidth = 587
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 97
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Enabled = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Cod.Cliente'
    end
    object Label5: TLabel
      Left = 112
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Nome do Cliente'
    end
    object Label11: TLabel
      Left = 8
      Top = 48
      Width = 68
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label12: TLabel
      Left = 112
      Top = 48
      Width = 20
      Height = 13
      Caption = 'Ref.'
    end
    object Label14: TLabel
      Left = 200
      Top = 64
      Width = 209
      Height = 17
      AutoSize = False
      Caption = 'Label14'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 112
      Top = 24
      Width = 441
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object EdtDataCadastro: TEdit
      Left = 8
      Top = 64
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdtRef: TEdit
      Left = 112
      Top = 64
      Width = 49
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 340
    Width = 587
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 587
    Height = 243
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 120
      Top = 8
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Data Nasc.'
    end
    object Label3: TLabel
      Left = 288
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    object Label6: TLabel
      Left = 8
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label7: TLabel
      Left = 8
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 200
      Top = 104
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label10: TLabel
      Left = 496
      Top = 104
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label9: TLabel
      Left = 440
      Top = 104
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label13: TLabel
      Left = 8
      Top = 184
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label35: TLabel
      Left = 120
      Top = 184
      Width = 32
      Height = 13
      Caption = 'Celular'
    end
    object Label44: TLabel
      Left = 8
      Top = 144
      Width = 98
      Height = 13
      Caption = 'Ponto de Refer'#234'ncia'
    end
    object EdtCPF: TEdit
      Left = 120
      Top = 24
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtDataNasc: TEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EdtDoc: TEdit
      Left = 288
      Top = 24
      Width = 137
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EdtEndRes: TEdit
      Left = 8
      Top = 80
      Width = 384
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 3
    end
    object EdtBaiRes: TEdit
      Left = 8
      Top = 120
      Width = 168
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 4
    end
    object EdtCidRes: TEdit
      Left = 200
      Top = 120
      Width = 227
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 5
    end
    object EdtPR: TEdit
      Left = 8
      Top = 160
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 6
    end
    object EdtCel: TEdit
      Left = 120
      Top = 200
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 7
    end
    object EdtTelRes: TEdit
      Left = 8
      Top = 200
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 8
    end
    object EdtUF: TEdit
      Left = 440
      Top = 120
      Width = 41
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object EdtCepRes: TEdit
      Left = 496
      Top = 120
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object QConsCliente: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRAuxServer
    SQL.Strings = (
      
        'SELECT BLOQUEADO_CLI, BAIRES_CLI, CELULAR_CLI, CEPRES_CLI, CIDRE' +
        'S_CLI, CNPJ_CLI, DATACADASTRO_CLI, DOC_CLI, ENDRES_CLI, ESTRES_C' +
        'LI, NASCIMENTO_CLI, TIPO_CREDITO_CLI, TELRES_CLI, PONTO_REFERENC' +
        'IA'
      'FROM CLIENTE'
      'WHERE COD_CLI = :CODCLI')
    Left = 504
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODCLI'
        ParamType = ptUnknown
      end>
    object QConsClienteBAIRES_CLI: TStringField
      FieldName = 'BAIRES_CLI'
      Origin = 'CLIENTE.BAIRES_CLI'
      Size = 30
    end
    object QConsClienteCELULAR_CLI: TStringField
      FieldName = 'CELULAR_CLI'
      Origin = 'CLIENTE.CELULAR_CLI'
      Size = 13
    end
    object QConsClienteCEPRES_CLI: TStringField
      FieldName = 'CEPRES_CLI'
      Origin = 'CLIENTE.CEPRES_CLI'
      FixedChar = True
      Size = 10
    end
    object QConsClienteCIDRES_CLI: TStringField
      FieldName = 'CIDRES_CLI'
      Origin = 'CLIENTE.CIDRES_CLI'
      Size = 30
    end
    object QConsClienteCNPJ_CLI: TStringField
      FieldName = 'CNPJ_CLI'
      Origin = 'CLIENTE.CNPJ_CLI'
      Size = 18
    end
    object QConsClienteDATACADASTRO_CLI: TDateField
      FieldName = 'DATACADASTRO_CLI'
      Origin = 'CLIENTE.DATACADASTRO_CLI'
      Required = True
    end
    object QConsClienteDOC_CLI: TStringField
      FieldName = 'DOC_CLI'
      Origin = 'CLIENTE.DOC_CLI'
    end
    object QConsClienteENDRES_CLI: TStringField
      FieldName = 'ENDRES_CLI'
      Origin = 'CLIENTE.ENDRES_CLI'
      Size = 50
    end
    object QConsClienteESTRES_CLI: TStringField
      FieldName = 'ESTRES_CLI'
      Origin = 'CLIENTE.ESTRES_CLI'
      FixedChar = True
      Size = 2
    end
    object QConsClienteNASCIMENTO_CLI: TDateField
      FieldName = 'NASCIMENTO_CLI'
      Origin = 'CLIENTE.NASCIMENTO_CLI'
    end
    object QConsClienteTELRES_CLI: TStringField
      FieldName = 'TELRES_CLI'
      Origin = 'CLIENTE.TELRES_CLI'
      FixedChar = True
      Size = 13
    end
    object QConsClientePONTO_REFERENCIA: TStringField
      FieldName = 'PONTO_REFERENCIA'
      Origin = 'CLIENTE.PONTO_REFERENCIA'
      Size = 80
    end
    object QConsClienteBLOQUEADO_CLI: TStringField
      FieldName = 'BLOQUEADO_CLI'
      Origin = 'CLIENTE.BLOQUEADO_CLI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QConsClienteTIPO_CREDITO_CLI: TStringField
      FieldName = 'TIPO_CREDITO_CLI'
      Origin = 'CLIENTE.TIPO_CREDITO_CLI'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
end
