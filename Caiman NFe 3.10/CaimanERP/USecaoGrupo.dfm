object FrmSecaoGrupo: TFrmSecaoGrupo
  Left = 409
  Top = 132
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Grupo/SubGrupo'
  ClientHeight = 480
  ClientWidth = 543
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
    Width = 543
    Height = 231
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label30: TLabel
      Left = 2
      Top = 2
      Width = 539
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Grupos'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 38
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 56
      Width = 539
      Height = 173
      Align = alBottom
      Color = clSilver
      DataSource = DSGrupo
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_GRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 49
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 470
          Visible = True
        end>
    end
    object EdtNomeGrupo: TEdit
      Left = 64
      Top = 24
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 80
      TabOrder = 1
    end
    object EdtCodGrupo: TEdit
      Left = 8
      Top = 24
      Width = 49
      Height = 21
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtCodGrupoKeyPress
    end
    object BtnGravaGrupo: TButton
      Left = 408
      Top = 24
      Width = 57
      Height = 21
      Caption = '&Gravar'
      TabOrder = 2
      OnClick = BtnGravaGrupoClick
    end
    object BtnExcluiGrupo: TButton
      Left = 472
      Top = 24
      Width = 57
      Height = 21
      Caption = '&Excluir'
      TabOrder = 3
      OnClick = BtnExcluiGrupoClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 461
    Width = 543
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Duplo Clique para Alterar'
  end
  object Panel2: TPanel
    Left = 0
    Top = 231
    Width = 543
    Height = 230
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 539
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Sub-Grupos'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 62
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 55
      Width = 539
      Height = 173
      Align = alBottom
      Color = clSilver
      DataSource = DSSub
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_SUBGRUPO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 455
          Visible = True
        end>
    end
    object EdtCodSubGrupo: TEdit
      Left = 8
      Top = 24
      Width = 49
      Height = 21
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtCodGrupoKeyPress
    end
    object EdtNomeSubGrupo: TEdit
      Left = 64
      Top = 24
      Width = 351
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 80
      TabOrder = 1
    end
    object Button1: TButton
      Left = 417
      Top = 24
      Width = 57
      Height = 21
      Caption = '&Gravar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 481
      Top = 24
      Width = 57
      Height = 21
      Caption = '&Excluir'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object QGrupo: TFDQuery
    AfterScroll = QGrupoAfterScroll
    Connection = DM.IBDatabase
    Transaction = IBTRGrupo
    SQL.Strings = (
      'SELECT *'
      'FROM SECAO_GRUPO'
      'WHERE COD_SEC = :CODSEC'
      'ORDER BY COD_GRUPO')
    Left = 64
    Top = 112
    ParamData = <
      item
        Name = 'CODSEC'
      end>
    object QGrupoCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'SECAO_GRUPO.COD_SEC'
      Required = True
    end
    object QGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'SECAO_GRUPO.COD_GRUPO'
      Required = True
    end
    object QGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SECAO_GRUPO.DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object DSGrupo: TDataSource
    AutoEdit = False
    DataSet = QGrupo
    Left = 120
    Top = 112
  end
  object IBTRGrupo: TFDTransaction
    Connection = DM.IBDatabase
    Left = 192
    Top = 112
  end
  object QSub: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRSub
    SQL.Strings = (
      'SELECT *'
      'FROM SECAO_GRUPO_SUBGRUPO'
      'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO'
      'ORDER BY COD_SUBGRUPO')
    Left = 80
    Top = 320
    ParamData = <
      item
        Name = 'CODSEC'
      end
      item
        Name = 'CODGRUPO'
      end>
    object QSubCOD_SEC: TIntegerField
      FieldName = 'COD_SEC'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_SEC'
      Required = True
    end
    object QSubCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_GRUPO'
      Required = True
    end
    object QSubCOD_SUBGRUPO: TIntegerField
      FieldName = 'COD_SUBGRUPO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.COD_SUBGRUPO'
      Required = True
    end
    object QSubDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'SECAO_GRUPO_SUBGRUPO.DESCRICAO'
      Required = True
      Size = 80
    end
  end
  object DSSub: TDataSource
    AutoEdit = False
    DataSet = QSub
    Left = 128
    Top = 320
  end
  object IBTRSub: TFDTransaction
    Connection = DM.IBDatabase
    Left = 176
    Top = 320
  end
  object QOrdem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    Left = 424
    Top = 120
  end
end
