object frmGerenciamentoNFSE: TfrmGerenciamentoNFSE
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gerenciamento NFSe'
  ClientHeight = 417
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 780
    Height = 344
    Align = alClient
    DataSource = dsConsNfse
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = clWindow
        Expanded = False
        FieldName = 'CHAVE'
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero '
        Width = 100
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'DATA_LANCAMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Emiss'#227'o '
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'VALOR'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 72
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NOME_CLI'
        Title.Alignment = taCenter
        Title.Caption = 'Destinat'#225'rio/Emitente'
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 265
      Height = 57
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 123
        Top = 27
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TsDateEdit
        Left = 9
        Top = 21
        Width = 105
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Segoe UI'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        CheckOnExit = True
      end
      object EdtDataFin: TsDateEdit
        Left = 139
        Top = 21
        Width = 113
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Segoe UI'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        CheckOnExit = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 288
      Top = 8
      Width = 305
      Height = 57
      TabOrder = 1
      object Combo: TComboBox
        Left = 8
        Top = 21
        Width = 289
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Todas'
        Items.Strings = (
          'Todas'
          'Canceladas'
          'N'#227'o Enviadas'
          'Enviadas')
      end
    end
    object BtnOk: TButton
      Left = 616
      Top = 24
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
    object BtnSair: TButton
      Left = 704
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object QConsNfse: TFDQuery
    Connection = DM.IBDatabase
    SQL.Strings = (
      
        'SELECT ID_NF_SERVICO, NFS.CHAVE, NFS.DATA_LANCAMENTO, NFS.VALOR,' +
        ' C.NOME_CLI,'
      '       CASE WHEN NFS.GERADA = '#39'V'#39' THEN '#39'Validada'#39
      '            WHEN NFS.GERADA = '#39'E'#39' THEN '#39'Enviada'#39
      '            WHEN NFS.GERADA = '#39'C'#39' THEN '#39'Cancelado'#39
      '            ELSE '#39'Em Digita'#231#227'o'#39' END SITUACAO'
      '  FROM NOTA_FISCAL_SERVICO NFS'
      '       LEFT OUTER JOIN CLIENTE C ON(NFS.ID_CADASTRO = C.COD_CLI)')
    Left = 96
    Top = 121
    object QConsNfseCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 90
    end
    object QConsNfseDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'DATA_LANCAMENTO'
    end
    object QConsNfseVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
    end
    object QConsNfseNOME_CLI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLI'
      Origin = 'NOME_CLI'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QConsNfseSITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object QConsNfseID_NF_SERVICO: TIntegerField
      FieldName = 'ID_NF_SERVICO'
      Origin = 'ID_NF_SERVICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsConsNfse: TDataSource
    DataSet = QConsNfse
    Left = 168
    Top = 120
  end
end
