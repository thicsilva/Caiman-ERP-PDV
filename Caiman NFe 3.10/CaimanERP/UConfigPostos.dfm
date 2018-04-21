object frmConfigPostos: TfrmConfigPostos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configurador Postos'
  ClientHeight = 378
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TPageControl
    Left = 0
    Top = 0
    Width = 773
    Height = 378
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Concentrador'
      OnShow = TabSheet1Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 11
        Top = 98
        Width = 173
        Height = 13
        Caption = 'Porta de Comunica'#231#227'o Serial/TCP :'
      end
      object Label2: TLabel
        Left = 11
        Top = 137
        Width = 89
        Height = 13
        Caption = 'IP Concentrador :'
      end
      object Label3: TLabel
        Left = 11
        Top = 177
        Width = 121
        Height = 13
        Caption = 'Velocidade Porta COM :'
      end
      object btnSalvaCon: TsSpeedButton
        Left = 192
        Top = 232
        Width = 113
        Height = 33
        Caption = 'Salvar'
        OnClick = btnSalvaConClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnCancelaCon: TsSpeedButton
        Left = 73
        Top = 232
        Width = 113
        Height = 33
        Caption = 'Cancelar'
        OnClick = btnCancelaConClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object dbrgrpConcentrador: TDBRadioGroup
        Left = 11
        Top = 4
        Width = 294
        Height = 41
        Caption = ' Concentrador '
        Columns = 2
        DataField = 'CONCENTRADOR'
        DataSource = dsConcentrador
        Items.Strings = (
          'CompanyTec'
          'VW Tech')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object dbrgrpTIPO_COMUNICAO: TDBRadioGroup
        Left = 11
        Top = 51
        Width = 294
        Height = 41
        Caption = ' Tipo de Comunica'#231#227'o '
        Columns = 2
        DataField = 'TIPO_COMUNICAO'
        DataSource = dsConcentrador
        Items.Strings = (
          'Serial'
          'TCP/IP')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object dbedtPORTA: TDBEdit
        Left = 11
        Top = 113
        Width = 159
        Height = 21
        DataField = 'PORTA'
        DataSource = dsConcentrador
        TabOrder = 2
      end
      object dbedtIPCONCENTRADOR: TDBEdit
        Left = 11
        Top = 152
        Width = 159
        Height = 21
        DataField = 'IPCONCENTRADOR'
        DataSource = dsConcentrador
        TabOrder = 3
      end
      object dbedtVELOCIDADE: TDBEdit
        Left = 11
        Top = 192
        Width = 159
        Height = 21
        DataField = 'VELOCIDADE'
        DataSource = dsConcentrador
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tanques'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object btnCancTaq: TsSpeedButton
        Left = 402
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Cancelar'
        OnClick = btnCancTaqClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnSalvaTaq: TsSpeedButton
        Left = 521
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Salvar'
        OnClick = btnSalvaTaqClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label4: TLabel
        Left = 10
        Top = 170
        Width = 101
        Height = 13
        Caption = 'C'#243'digo do tanque :'
      end
      object btnNovoTaq: TsSpeedButton
        Left = 640
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Novo'
        OnClick = btnNovoTaqClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label5: TLabel
        Left = 127
        Top = 170
        Width = 106
        Height = 13
        Caption = 'C'#243'digo do Produto :'
      end
      object Label6: TLabel
        Left = 276
        Top = 170
        Width = 48
        Height = 13
        Caption = 'Produto :'
      end
      object BtnConsProdEstoque: TsSpeedButton
        Left = 244
        Top = 185
        Width = 23
        Height = 21
        Hint = 'Consultar'
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
        OnClick = BtnConsProdEstoqueClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label7: TLabel
        Left = 10
        Top = 210
        Width = 66
        Height = 13
        Caption = 'Capacidade :'
      end
      object Label8: TLabel
        Left = 127
        Top = 210
        Width = 68
        Height = 13
        Caption = 'Saldo Inicial :'
      end
      object DBGrid1: TDBGrid
        Left = 10
        Top = 8
        Width = 745
        Height = 158
        DataSource = dsTanques
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_TAQ'
            Title.Caption = ' Tanque  '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PRO'
            Title.Caption = ' Cod. Produto '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CUPOM'
            Title.Caption = ' Descri'#231#227'o '
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAPACIDADE'
            Title.Caption = ' Capacidade '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO_INICIAL'
            Title.Caption = ' Saldo Inicial '
            Visible = True
          end>
      end
      object dbedtCOD_TAQ: TDBEdit
        Left = 10
        Top = 185
        Width = 111
        Height = 21
        DataField = 'COD_TAQ'
        DataSource = dsTanques
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtCOD_PRO: TDBEdit
        Left = 127
        Top = 185
        Width = 111
        Height = 21
        DataField = 'COD_PRO'
        DataSource = dsTanques
        ReadOnly = True
        TabOrder = 2
      end
      object dbedtDESC_CUPOM: TDBEdit
        Left = 276
        Top = 185
        Width = 309
        Height = 21
        DataField = 'DESC_CUPOM'
        DataSource = dsTanques
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtCAPACIDADE: TDBEdit
        Left = 10
        Top = 225
        Width = 111
        Height = 21
        DataField = 'CAPACIDADE'
        DataSource = dsTanques
        TabOrder = 4
      end
      object dbedtSALDO_INICIAL: TDBEdit
        Left = 127
        Top = 225
        Width = 111
        Height = 21
        DataField = 'SALDO_INICIAL'
        DataSource = dsTanques
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Bicos'
      ImageIndex = 2
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 5
        Top = 130
        Width = 86
        Height = 13
        Caption = 'C'#243'digo do Bico :'
      end
      object btnCancBico: TsSpeedButton
        Left = 402
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Cancelar'
        OnClick = btnCancBicoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnSalvaBico: TsSpeedButton
        Left = 521
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Salvar'
        OnClick = btnSalvaBicoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnNovoBico: TsSpeedButton
        Left = 640
        Top = 244
        Width = 113
        Height = 33
        Caption = 'Novo'
        OnClick = btnNovoBicoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label10: TLabel
        Left = 122
        Top = 130
        Width = 104
        Height = 13
        Caption = 'C'#243'digo do Tanque  :'
      end
      object Label11: TLabel
        Left = 239
        Top = 131
        Width = 93
        Height = 13
        Caption = 'C'#243'digo do Fisico :'
      end
      object Label12: TLabel
        Left = 3
        Top = 179
        Width = 56
        Height = 13
        Caption = 'Dec. Pre'#231'o '
      end
      object Label13: TLabel
        Left = 120
        Top = 179
        Width = 63
        Height = 13
        Caption = 'Dec. Volume'
      end
      object Label14: TLabel
        Left = 237
        Top = 179
        Width = 86
        Height = 13
        Caption = 'Dec. Encerrante :'
      end
      object DBGrid2: TDBGrid
        Left = 5
        Top = 5
        Width = 740
        Height = 120
        DataSource = DsBicos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_BICO'
            Title.Caption = ' Bico '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_TAQ'
            Title.Caption = ' Tanque '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_FISICO'
            Title.Caption = ' Cod Fisico do Bico '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CASA_PRECO'
            Title.Caption = ' Dec. Pre'#231'o '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CASA_VOLUME'
            Title.Caption = ' Dec. Volume '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CASA_ENCERRANTE'
            Title.Caption = ' Dec. Encerrante '
            Visible = True
          end>
      end
      object dbedtCODIGO_BICO: TDBEdit
        Left = 3
        Top = 149
        Width = 111
        Height = 21
        DataField = 'CODIGO_BICO'
        DataSource = DsBicos
        TabOrder = 1
      end
      object dbedtCOD_TAQ1: TDBEdit
        Left = 120
        Top = 149
        Width = 111
        Height = 21
        DataField = 'COD_TAQ'
        DataSource = DsBicos
        TabOrder = 2
      end
      object dbedtCODIGO_FISICO: TDBEdit
        Left = 239
        Top = 149
        Width = 111
        Height = 21
        DataField = 'CODIGO_FISICO'
        DataSource = DsBicos
        TabOrder = 3
      end
      object dbedtCASA_PRECO: TDBEdit
        Left = 3
        Top = 197
        Width = 111
        Height = 21
        DataField = 'CASA_PRECO'
        DataSource = DsBicos
        TabOrder = 4
      end
      object dbedtCASA_VOLUME: TDBEdit
        Left = 120
        Top = 197
        Width = 111
        Height = 21
        DataField = 'CASA_VOLUME'
        DataSource = DsBicos
        TabOrder = 5
      end
      object dbedtCASA_ENCERRANTE: TDBEdit
        Left = 237
        Top = 197
        Width = 111
        Height = 21
        DataField = 'CASA_ENCERRANTE'
        DataSource = DsBicos
        TabOrder = 6
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Bombas'
      ImageIndex = 3
      OnShow = TabSheet4Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label15: TLabel
        Left = 5
        Top = 130
        Width = 99
        Height = 13
        Caption = 'C'#243'digo da Bomba :'
      end
      object Label16: TLabel
        Left = 122
        Top = 130
        Width = 31
        Height = 13
        Caption = 'S'#233'rie :'
      end
      object Label17: TLabel
        Left = 239
        Top = 130
        Width = 60
        Height = 13
        Caption = 'Fabricante :'
      end
      object Label18: TLabel
        Left = 356
        Top = 130
        Width = 46
        Height = 13
        Caption = 'Modelo :'
      end
      object Label19: TLabel
        Left = 473
        Top = 130
        Width = 29
        Height = 13
        Caption = 'Lacre '
      end
      object Label20: TLabel
        Left = 590
        Top = 130
        Width = 82
        Height = 13
        Caption = 'Data Aplica'#231#227'o :'
      end
      object btnCancBomba: TsSpeedButton
        Left = 352
        Top = 176
        Width = 113
        Height = 33
        Caption = 'Cancelar'
        OnClick = btnCancBombaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnSalvaBomba: TsSpeedButton
        Left = 471
        Top = 176
        Width = 113
        Height = 33
        Caption = 'Salvar'
        OnClick = btnSalvaBombaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btnNovoBomba: TsSpeedButton
        Left = 590
        Top = 176
        Width = 113
        Height = 33
        Caption = 'Novo'
        OnClick = btnNovoBombaClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object DBGrid3: TDBGrid
        Left = 4
        Top = 5
        Width = 748
        Height = 120
        DataSource = DsBombas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_BOMBA'
            Title.Caption = ' Cod. Bomba'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Title.Caption = ' S'#233'rie '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FABRICANTE'
            Title.Caption = ' Fabricante '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODELO'
            Title.Caption = ' Modelo '
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_MEDICAO'
            Title.Caption = ' Tipo Medi'#231#227'o '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_LACRE'
            Title.Caption = ' Lacre '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_APLICACAO'
            Title.Caption = ' Data da Aplica'#231#227'o '
            Visible = True
          end>
      end
      object dbedtCOD_BOMBA: TDBEdit
        Left = 3
        Top = 149
        Width = 111
        Height = 21
        DataField = 'COD_BOMBA'
        DataSource = DsBombas
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtSERIE: TDBEdit
        Left = 120
        Top = 149
        Width = 111
        Height = 21
        DataField = 'SERIE'
        DataSource = DsBombas
        TabOrder = 2
      end
      object dbedtFABRICANTE: TDBEdit
        Left = 237
        Top = 149
        Width = 111
        Height = 21
        DataField = 'FABRICANTE'
        DataSource = DsBombas
        TabOrder = 3
      end
      object dbedtMODELO: TDBEdit
        Left = 354
        Top = 149
        Width = 111
        Height = 21
        DataField = 'MODELO'
        DataSource = DsBombas
        TabOrder = 4
      end
      object dbedtNUM_LACRE: TDBEdit
        Left = 471
        Top = 149
        Width = 111
        Height = 21
        DataField = 'NUM_LACRE'
        DataSource = DsBombas
        TabOrder = 5
      end
      object dbedtDT_APLICACAO: TDBEdit
        Left = 588
        Top = 149
        Width = 111
        Height = 21
        DataField = 'DT_APLICACAO'
        DataSource = DsBombas
        TabOrder = 6
      end
      object dbrgrpTIPO_MEDICAO: TDBRadioGroup
        Left = 3
        Top = 176
        Width = 270
        Height = 41
        Caption = 'Tipo Medi'#231#227'o : '
        Columns = 2
        DataField = 'TIPO_MEDICAO'
        DataSource = DsBombas
        Items.Strings = (
          'Digital'
          'Anal'#243'gica')
        TabOrder = 7
        Values.Strings = (
          '0'
          '1')
      end
    end
  end
  object QConcentrador: TFDQuery
    BeforePost = QConcentradorBeforePost
    Connection = DM.IBDatabase
    Transaction = TRConfigPostos
    UpdateObject = UpConcentrador
    SQL.Strings = (
      'select * from POSTO_CONFIG where cod_emp=:cod_emp')
    Left = 184
    Top = 24
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object QConcentradorCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"POSTO_CONFIG"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConcentradorCONCENTRADOR: TIntegerField
      FieldName = 'CONCENTRADOR'
      Origin = '"POSTO_CONFIG"."CONCENTRADOR"'
    end
    object QConcentradorTIPO_COMUNICAO: TIntegerField
      FieldName = 'TIPO_COMUNICAO'
      Origin = '"POSTO_CONFIG"."TIPO_COMUNICAO"'
    end
    object QConcentradorPORTA: TStringField
      FieldName = 'PORTA'
      Origin = '"POSTO_CONFIG"."PORTA"'
      Size = 10
    end
    object QConcentradorIPCONCENTRADOR: TStringField
      FieldName = 'IPCONCENTRADOR'
      Origin = '"POSTO_CONFIG"."IPCONCENTRADOR"'
      Size = 15
    end
    object QConcentradorVELOCIDADE: TIntegerField
      FieldName = 'VELOCIDADE'
      Origin = '"POSTO_CONFIG"."VELOCIDADE"'
    end
  end
  object UpConcentrador: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into POSTO_CONFIG'
      
        '  (COD_EMP, CONCENTRADOR, IPCONCENTRADOR, PORTA, TIPO_COMUNICAO,' +
        ' VELOCIDADE)'
      'values'
      
        '  (:COD_EMP, :CONCENTRADOR, :IPCONCENTRADOR, :PORTA, :TIPO_COMUN' +
        'ICAO, :VELOCIDADE)')
    ModifySQL.Strings = (
      'update POSTO_CONFIG'
      'set'
      '  COD_EMP = :COD_EMP,'
      '  CONCENTRADOR = :CONCENTRADOR,'
      '  IPCONCENTRADOR = :IPCONCENTRADOR,'
      '  PORTA = :PORTA,'
      '  TIPO_COMUNICAO = :TIPO_COMUNICAO,'
      '  VELOCIDADE = :VELOCIDADE'
      'where'
      '  COD_EMP = :OLD_COD_EMP')
    DeleteSQL.Strings = (
      'delete from POSTO_CONFIG'
      'where'
      '  COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_EMP,'
      '  CONCENTRADOR,'
      '  TIPO_COMUNICAO,'
      '  PORTA,'
      '  IPCONCENTRADOR,'
      '  VELOCIDADE'
      'from POSTO_CONFIG '
      'where'
      '  COD_EMP = :COD_EMP')
    Left = 232
    Top = 24
  end
  object dsConcentrador: TDataSource
    DataSet = QConcentrador
    OnStateChange = dsConcentradorStateChange
    Left = 136
    Top = 24
  end
  object dsTanques: TDataSource
    DataSet = QTanques
    OnStateChange = dsTanquesStateChange
    Left = 128
    Top = 80
  end
  object QTanques: TFDQuery
    BeforePost = QTanquesBeforePost
    Connection = DM.IBDatabase
    Transaction = TRConfigPostos
    UpdateObject = upTanques
    SQL.Strings = (
      'select TQ.*, P.desc_cupom from POSTO_TANQUES TQ'
      'left outer join PRODUTO P'
      'on ( P.cod_pro = TQ.cod_pro )'
      'where TQ.cod_emp=:cod_emp')
    Left = 184
    Top = 80
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object QTanquesCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"POSTO_TANQUES"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QTanquesCOD_TAQ: TIntegerField
      FieldName = 'COD_TAQ'
      Origin = '"POSTO_TANQUES"."COD_TAQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QTanquesCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = '"POSTO_TANQUES"."COD_PRO"'
    end
    object QTanquesCAPACIDADE: TBCDField
      FieldName = 'CAPACIDADE'
      Origin = '"POSTO_TANQUES"."CAPACIDADE"'
      Precision = 18
      Size = 3
    end
    object QTanquesSALDO_INICIAL: TBCDField
      FieldName = 'SALDO_INICIAL'
      Origin = '"POSTO_TANQUES"."SALDO_INICIAL"'
      Precision = 18
      Size = 3
    end
    object QTanquesDESC_CUPOM: TStringField
      FieldName = 'DESC_CUPOM'
      Origin = '"PRODUTO"."DESC_CUPOM"'
      Size = 80
    end
  end
  object upTanques: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into POSTO_TANQUES'
      '  (CAPACIDADE, COD_EMP, COD_PRO, COD_TAQ, SALDO_INICIAL)'
      'values'
      
        '  (:CAPACIDADE, :COD_EMP, :COD_PRO, ( coalesce(( select max( COD' +
        '_TAQ ) from POSTO_TANQUES where COD_EMP=:COD_EMP), 0 ) + 1), :SA' +
        'LDO_INICIAL)')
    ModifySQL.Strings = (
      'update POSTO_TANQUES'
      'set'
      '  CAPACIDADE = :CAPACIDADE,'
      '  COD_EMP = :COD_EMP,'
      '  COD_PRO = :COD_PRO,'
      '  COD_TAQ = :COD_TAQ,'
      '  SALDO_INICIAL = :SALDO_INICIAL'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_TAQ = :OLD_COD_TAQ')
    DeleteSQL.Strings = (
      'delete from POSTO_TANQUES'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_TAQ = :OLD_COD_TAQ')
    FetchRowSQL.Strings = (
      'select TQ.*, P.desc_cupom from POSTO_TANQUES TQ'
      'left outer join PRODUTO P'
      'on ( P.cod_pro = TQ.cod_pro )'
      'where TQ.cod_emp=:cod_emp'
      ' and'
      '  COD_TAQ = :COD_TAQ')
    Left = 232
    Top = 80
  end
  object TRConfigPostos: TFDTransaction
    Connection = DM.IBDatabase
    Left = 376
    Top = 72
  end
  object DsBicos: TDataSource
    DataSet = QBicos
    OnStateChange = DsBicosStateChange
    Left = 456
    Top = 56
  end
  object QBicos: TFDQuery
    BeforePost = QBicosBeforePost
    Connection = DM.IBDatabase
    Transaction = TRConfigPostos
    UpdateObject = UpBicos
    SQL.Strings = (
      'select * from POSTO_BICOS where cod_emp=:cod_emp')
    Left = 512
    Top = 56
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object QBicosCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"POSTO_BICOS"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBicosCOD_TAQ: TIntegerField
      FieldName = 'COD_TAQ'
      Origin = '"POSTO_BICOS"."COD_TAQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBicosCODIGO_BICO: TIntegerField
      FieldName = 'CODIGO_BICO'
      Origin = '"POSTO_BICOS"."CODIGO_BICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBicosCODIGO_FISICO: TStringField
      FieldName = 'CODIGO_FISICO'
      Origin = '"POSTO_BICOS"."CODIGO_FISICO"'
      Size = 3
    end
    object QBicosCASA_PRECO: TIntegerField
      FieldName = 'CASA_PRECO'
      Origin = '"POSTO_BICOS"."CASA_PRECO"'
    end
    object QBicosCASA_VOLUME: TIntegerField
      FieldName = 'CASA_VOLUME'
      Origin = '"POSTO_BICOS"."CASA_VOLUME"'
    end
    object QBicosCASA_ENCERRANTE: TIntegerField
      FieldName = 'CASA_ENCERRANTE'
      Origin = '"POSTO_BICOS"."CASA_ENCERRANTE"'
    end
  end
  object UpBicos: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into POSTO_BICOS'
      
        '  (CASA_ENCERRANTE, CASA_PRECO, CASA_VOLUME, COD_EMP, COD_TAQ, C' +
        'ODIGO_BICO, '
      '   CODIGO_FISICO)'
      'values'
      
        '  (:CASA_ENCERRANTE, :CASA_PRECO, :CASA_VOLUME, :COD_EMP, :COD_T' +
        'AQ, :CODIGO_BICO, '
      '   :CODIGO_FISICO)')
    ModifySQL.Strings = (
      'update POSTO_BICOS'
      'set'
      '  CASA_ENCERRANTE = :CASA_ENCERRANTE,'
      '  CASA_PRECO = :CASA_PRECO,'
      '  CASA_VOLUME = :CASA_VOLUME,'
      '  COD_EMP = :COD_EMP,'
      '  COD_TAQ = :COD_TAQ,'
      '  CODIGO_BICO = :CODIGO_BICO,'
      '  CODIGO_FISICO = :CODIGO_FISICO'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_TAQ = :OLD_COD_TAQ and'
      '  CODIGO_BICO = :OLD_CODIGO_BICO')
    DeleteSQL.Strings = (
      'delete from POSTO_BICOS'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_TAQ = :OLD_COD_TAQ and'
      '  CODIGO_BICO = :OLD_CODIGO_BICO')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_EMP,'
      '  COD_TAQ,'
      '  CODIGO_BICO,'
      '  CODIGO_FISICO,'
      '  CASA_PRECO,'
      '  CASA_VOLUME,'
      '  CASA_ENCERRANTE'
      'from POSTO_BICOS '
      'where'
      '  COD_EMP = :COD_EMP and'
      '  COD_TAQ = :COD_TAQ and'
      '  CODIGO_BICO = :CODIGO_BICO')
    Left = 560
    Top = 56
  end
  object DsBombas: TDataSource
    DataSet = QBombas
    OnStateChange = DsBombasStateChange
    Left = 456
    Top = 120
  end
  object QBombas: TFDQuery
    BeforePost = QBombasBeforePost
    Connection = DM.IBDatabase
    Transaction = TRConfigPostos
    UpdateObject = upBombas
    SQL.Strings = (
      'select * from POSTO_BOMBAS where cod_emp=:cod_emp')
    Left = 512
    Top = 120
    ParamData = <
      item
        Name = 'cod_emp'
      end>
    object QBombasCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"POSTO_BOMBAS"."COD_EMP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBombasCOD_BOMBA: TIntegerField
      FieldName = 'COD_BOMBA'
      Origin = '"POSTO_BOMBAS"."COD_BOMBA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBombasSERIE: TStringField
      FieldName = 'SERIE'
      Origin = '"POSTO_BOMBAS"."SERIE"'
      Size = 50
    end
    object QBombasFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Origin = '"POSTO_BOMBAS"."FABRICANTE"'
      Size = 60
    end
    object QBombasMODELO: TStringField
      FieldName = 'MODELO'
      Origin = '"POSTO_BOMBAS"."MODELO"'
      Size = 50
    end
    object QBombasTIPO_MEDICAO: TIntegerField
      FieldName = 'TIPO_MEDICAO'
      Origin = '"POSTO_BOMBAS"."TIPO_MEDICAO"'
    end
    object QBombasNUM_LACRE: TStringField
      FieldName = 'NUM_LACRE'
      Origin = '"POSTO_BOMBAS"."NUM_LACRE"'
    end
    object QBombasDT_APLICACAO: TDateField
      FieldName = 'DT_APLICACAO'
      Origin = '"POSTO_BOMBAS"."DT_APLICACAO"'
      EditMask = '!99/99/00;1;_'
    end
  end
  object upBombas: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into POSTO_BOMBAS'
      
        '  (COD_BOMBA, COD_EMP, DT_APLICACAO, FABRICANTE, MODELO, NUM_LAC' +
        'RE, SERIE, '
      '   TIPO_MEDICAO)'
      'values'
      
        '  (( coalesce(( select max( COD_BOMBA ) from POSTO_BOMBAS where ' +
        'COD_EMP=:COD_EMP), 0 ) + 1), :COD_EMP, :DT_APLICACAO, :FABRICANT' +
        'E, :MODELO, :NUM_LACRE,'
      '   :SERIE, :TIPO_MEDICAO)'
      '')
    ModifySQL.Strings = (
      'update POSTO_BOMBAS'
      'set'
      '  COD_BOMBA = :COD_BOMBA,'
      '  COD_EMP = :COD_EMP,'
      '  DT_APLICACAO = :DT_APLICACAO,'
      '  FABRICANTE = :FABRICANTE,'
      '  MODELO = :MODELO,'
      '  NUM_LACRE = :NUM_LACRE,'
      '  SERIE = :SERIE,'
      '  TIPO_MEDICAO = :TIPO_MEDICAO'
      'where'
      '  COD_BOMBA = :OLD_COD_BOMBA and'
      '  COD_EMP = :OLD_COD_EMP')
    DeleteSQL.Strings = (
      'delete from POSTO_BOMBAS'
      'where'
      '  COD_BOMBA = :OLD_COD_BOMBA and'
      '  COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      'Select '
      '  COD_EMP,'
      '  COD_BOMBA,'
      '  SERIE,'
      '  FABRICANTE,'
      '  MODELO,'
      '  TIPO_MEDICAO,'
      '  NUM_LACRE,'
      '  DT_APLICACAO'
      'from POSTO_BOMBAS '
      'where'
      '  COD_BOMBA = :COD_BOMBA and'
      '  COD_EMP = :COD_EMP')
    Left = 560
    Top = 120
  end
end
