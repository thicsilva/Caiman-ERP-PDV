object FrmMapaResumo: TFrmMapaResumo
  Left = 336
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mapa Resumo'
  ClientHeight = 573
  ClientWidth = 612
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
  object Panel4: TPanel
    Left = 0
    Top = 55
    Width = 612
    Height = 499
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 608
      Height = 495
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 13
        Caption = 'CheckOUT'
      end
      object Label6: TLabel
        Left = 112
        Top = 88
        Width = 58
        Height = 13
        Caption = 'COO Inicial'
      end
      object Label21: TLabel
        Left = 258
        Top = 48
        Width = 20
        Height = 13
        Caption = 'CRZ'
      end
      object Label8: TLabel
        Left = 8
        Top = 128
        Width = 46
        Height = 13
        Caption = 'GT Inicial'
      end
      object Label9: TLabel
        Left = 136
        Top = 128
        Width = 41
        Height = 13
        Caption = 'GT Final'
      end
      object Label22: TLabel
        Left = 8
        Top = 88
        Width = 79
        Height = 13
        Caption = 'Cont.Doc.Canc.'
      end
      object Label7: TLabel
        Left = 235
        Top = 88
        Width = 53
        Height = 13
        Caption = 'COO Final'
      end
      object Label1: TLabel
        Left = 90
        Top = 8
        Width = 107
        Height = 13
        Caption = 'N'#250'mero de S'#233'rie ECF'
      end
      object Label2: TLabel
        Left = 176
        Top = 48
        Width = 23
        Height = 13
        Caption = 'CRO'
      end
      object Label29: TLabel
        Left = 8
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Emiss'#227'o Red.Z'
      end
      object Label30: TLabel
        Left = 90
        Top = 48
        Width = 57
        Height = 13
        Caption = 'Hora Red.Z'
      end
      object PanelTotalizadores: TPanel
        Left = 2
        Top = 184
        Width = 604
        Height = 309
        Align = alBottom
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelWidth = 2
        Color = 16710131
        TabOrder = 14
        object Label17: TLabel
          Left = 8
          Top = 32
          Width = 33
          Height = 13
          Caption = 'Grupo'
        end
        object BtnConsGRP: TsSpeedButton
          Left = 68
          Top = 48
          Width = 23
          Height = 21
          Hint = 'Consultar Produto'
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
          OnClick = BtnConsGRPClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label18: TLabel
          Left = 98
          Top = 32
          Width = 102
          Height = 13
          Caption = 'Descri'#231#227'o do Grupo'
        end
        object Label15: TLabel
          Left = 371
          Top = 32
          Width = 26
          Height = 13
          Caption = 'Valor'
        end
        object Label4: TLabel
          Left = 2
          Top = 2
          Width = 600
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'TOTALIZADORES'
          Color = 12615680
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 86
        end
        object EdtCodGrp: TEdit
          Left = 8
          Top = 48
          Width = 57
          Height = 21
          Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
          Alignment = taRightJustify
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = EdtCodGrpEnter
          OnExit = EdtCodGrpExit
          OnKeyDown = EdtCodGrpKeyDown
          OnKeyPress = EdtCodGrpKeyPress
        end
        object EdtNomeGrp: TEdit
          Left = 98
          Top = 48
          Width = 263
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
        end
        object EdtValor: TCurrencyEdit
          Left = 371
          Top = 48
          Width = 86
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 2
          ZeroEmpty = False
        end
        object DBGrid2: TDBGrid
          Left = 2
          Top = 85
          Width = 600
          Height = 222
          TabStop = False
          Align = alBottom
          Color = clGradientInactiveCaption
          DataSource = DSItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Color = clWhite
              Expanded = False
              FieldName = 'COD_GRP'
              Title.Alignment = taCenter
              Title.Caption = 'GRUPO'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'NOME_GRP'
              Title.Alignment = taCenter
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 345
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Width = 89
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'INDICE_R03'
              Title.Alignment = taCenter
              Title.Caption = 'R03'
              Width = 79
              Visible = True
            end>
        end
        object BtnGravaItem: TBitBtn
          Left = 488
          Top = 44
          Width = 73
          Height = 25
          Caption = '&Gravar'
          TabOrder = 4
          OnClick = BtnGravaItemClick
        end
        object BtnExcluiItem: TBitBtn
          Left = 576
          Top = 44
          Width = 73
          Height = 25
          Caption = '&Excluir'
          TabOrder = 5
          OnClick = BtnExcluiItemClick
        end
      end
      object EdtCheck: TEdit
        Left = 8
        Top = 24
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        OnEnter = EdtCheckEnter
        OnExit = EdtCheckExit
      end
      object EdtCOOIni: TEdit
        Left = 112
        Top = 104
        Width = 97
        Height = 21
        Alignment = taRightJustify
        TabOrder = 7
        OnEnter = EdtCOOIniEnter
      end
      object EdtCRZ: TEdit
        Left = 258
        Top = 64
        Width = 73
        Height = 21
        Alignment = taRightJustify
        TabOrder = 5
        OnEnter = EdtCRZEnter
      end
      object EdtGTIni: TCurrencyEdit
        Left = 8
        Top = 144
        Width = 113
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 9
        ZeroEmpty = False
        OnExit = EdtGTIniExit
      end
      object EdtGTFin: TCurrencyEdit
        Left = 136
        Top = 144
        Width = 113
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 10
        ZeroEmpty = False
        OnExit = EdtGTIniExit
      end
      object EdtContCanc: TEdit
        Left = 8
        Top = 104
        Width = 81
        Height = 21
        Alignment = taRightJustify
        TabOrder = 6
        OnEnter = EdtContCancEnter
      end
      object EdtCOOFin: TEdit
        Left = 235
        Top = 104
        Width = 97
        Height = 21
        Alignment = taRightJustify
        TabOrder = 8
        OnEnter = EdtCOOFinEnter
      end
      object BtnGravar: TBitBtn
        Left = 360
        Top = 142
        Width = 73
        Height = 25
        Caption = '&Gravar'
        TabOrder = 11
        OnClick = BtnGravarClick
      end
      object BtnVoltar: TBitBtn
        Left = 440
        Top = 142
        Width = 73
        Height = 25
        Caption = '&Voltar'
        TabOrder = 12
        OnClick = BtnVoltarClick
      end
      object EdtNumSerie: TEdit
        Left = 90
        Top = 24
        Width = 241
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        MaxLength = 20
        ReadOnly = True
        TabOrder = 1
      end
      object EdtCRO: TEdit
        Left = 176
        Top = 64
        Width = 72
        Height = 21
        Alignment = taRightJustify
        MaxLength = 2
        TabOrder = 4
        OnEnter = EdtCROEnter
      end
      object GroupBox2: TGroupBox
        Left = 368
        Top = 18
        Width = 249
        Height = 73
        TabOrder = 13
        object Label23: TLabel
          Left = 8
          Top = 12
          Width = 65
          Height = 13
          AutoSize = False
          Caption = 'Total do Dia:'
        end
        object Label26: TLabel
          Left = 8
          Top = 28
          Width = 73
          Height = 13
          AutoSize = False
          Caption = 'Total Digitado:'
        end
        object LTotalDia: TLabel
          Left = 96
          Top = 12
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LTotalDia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LTotalDigitado: TLabel
          Left = 96
          Top = 28
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LTotalDigitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 8
          Top = 52
          Width = 73
          Height = 13
          AutoSize = False
          Caption = 'Diferen'#231'a:'
        end
        object LDiferenca: TLabel
          Left = 96
          Top = 52
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LDiferenca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 96
          Top = 42
          Width = 97
          Height = 8
          AutoSize = False
          Caption = '------------------------------------'
        end
      end
      object EdtDataEmissao: TMaskEdit
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object EdtHoraEmissao: TMaskEdit
        Left = 90
        Top = 64
        Width = 71
        Height = 21
        EditMask = '!90:00:00;1;_'
        MaxLength = 8
        TabOrder = 3
        Text = '  :  :  '
      end
      object BtnNovo: TBitBtn
        Left = 520
        Top = 142
        Width = 73
        Height = 25
        Caption = '&Incluir'
        TabOrder = 15
        OnClick = BtnNovoClick
      end
      object EdtCodigo: TEdit
        Left = 448
        Top = 96
        Width = 81
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 16
        Visible = False
        OnEnter = EdtCheckEnter
        OnExit = EdtCheckExit
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 608
      Height = 495
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 604
        Height = 447
        Align = alTop
        Color = clSilver
        DataSource = DSQMapa
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
            FieldName = 'CHECKOUT'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'R01_NUMERO_SERIE'
            Title.Alignment = taCenter
            Title.Caption = 'N'#218'MERO S'#201'RIE'
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'COO_INICIAL'
            Title.Alignment = taCenter
            Title.Caption = 'COO INICIAL'
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'COO_FINAL'
            Title.Alignment = taCenter
            Title.Caption = 'COO FINAL'
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'GT_INICIAL'
            Title.Alignment = taCenter
            Title.Caption = 'GT INICIAL'
            Width = 79
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'GT_FINAL'
            Title.Alignment = taCenter
            Title.Caption = 'GT FINAL'
            Width = 81
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CONT_REDUCAO'
            Title.Alignment = taCenter
            Title.Caption = 'CRZ'
            Width = 47
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'CONTADOR_REINICIO_OPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'CRO'
            Width = 51
            Visible = True
          end>
      end
      object BtnInc: TBitBtn
        Left = 149
        Top = 464
        Width = 75
        Height = 25
        Caption = '&Incluir'
        TabOrder = 1
        OnClick = BtnIncClick
      end
      object BtnAlt: TBitBtn
        Left = 254
        Top = 464
        Width = 75
        Height = 25
        Caption = '&Alterar'
        TabOrder = 2
        OnClick = BtnAltClick
      end
      object BtnExc: TBitBtn
        Left = 359
        Top = 464
        Width = 75
        Height = 25
        Caption = '&Excluir'
        TabOrder = 3
        OnClick = BtnExcClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 55
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Data Movimento'
    end
    object EdtDataMovimento: TMaskEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '00/00/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object BtnOK: TBitBtn
      Left = 120
      Top = 20
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 208
      Top = 20
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 554
    Width = 612
    Height = 19
    Panels = <>
  end
  object IBSQLMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMapa
    Left = 360
    Top = 8
  end
  object IBTRMapa: TFDTransaction
    Connection = DM.IBDatabase
    Left = 424
    Top = 8
  end
  object QMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMapa
    SQL.Strings = (
      'SELECT M.*, C.R01_NUMERO_SERIE'
      'FROM MAPA_RESUMO M'
      'INNER JOIN CAIXA C'
      'ON (M.CHECKOUT = C.COD_CAI AND M.COD_EMP = C.COD_EMP)'
      'WHERE M.DATA = :DATA AND M.COD_EMP = :CODEMP'
      'ORDER BY M.CHECKOUT')
    Left = 480
    Top = 8
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
    object QMapaCHECKOUT: TIntegerField
      FieldName = 'CHECKOUT'
      Origin = 'MAPA_RESUMO.CHECKOUT'
      Required = True
    end
    object QMapaDATA: TDateField
      FieldName = 'DATA'
      Origin = 'MAPA_RESUMO.DATA'
      Required = True
    end
    object QMapaCOO_INICIAL: TIntegerField
      FieldName = 'COO_INICIAL'
      Origin = 'MAPA_RESUMO.COO_INICIAL'
      Required = True
    end
    object QMapaCOO_FINAL: TIntegerField
      FieldName = 'COO_FINAL'
      Origin = 'MAPA_RESUMO.COO_FINAL'
      Required = True
    end
    object QMapaGT_INICIAL: TBCDField
      FieldName = 'GT_INICIAL'
      Origin = 'MAPA_RESUMO.GT_INICIAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QMapaGT_FINAL: TBCDField
      FieldName = 'GT_FINAL'
      Origin = 'MAPA_RESUMO.GT_FINAL'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QMapaCONT_REDUCAO: TIntegerField
      FieldName = 'CONT_REDUCAO'
      Origin = 'MAPA_RESUMO.CONT_REDUCAO'
      Required = True
    end
    object QMapaCONT_CANCEL: TIntegerField
      FieldName = 'CONT_CANCEL'
      Origin = 'MAPA_RESUMO.CONT_CANCEL'
      Required = True
    end
    object QMapaCONTADOR_REINICIO_OPERACAO: TIntegerField
      FieldName = 'CONTADOR_REINICIO_OPERACAO'
      Origin = 'MAPA_RESUMO.CONTADOR_REINICIO_OPERACAO'
      Required = True
    end
    object QMapaCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QMapaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QMapaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'MAPA_RESUMO.DATA_EMISSAO'
    end
    object QMapaHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'MAPA_RESUMO.HORA_EMISSAO'
    end
    object QMapaCODIGO_PAF: TIntegerField
      FieldName = 'CODIGO_PAF'
      Origin = 'MAPA_RESUMO.CODIGO_PAF'
    end
    object QMapaR01_NUMERO_SERIE: TStringField
      FieldName = 'R01_NUMERO_SERIE'
      Origin = 'CAIXA.R01_NUMERO_SERIE'
    end
  end
  object DSQMapa: TDataSource
    AutoEdit = False
    DataSet = QMapa
    Left = 296
    Top = 8
  end
  object QItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMapa
    SQL.Strings = (
      'SELECT I.*, G.NOME_GRP, G.ICMS_SERVICO_GRP, G.TIPO_GRP'
      'FROM ITENS_MAPA_RESUMO I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'WHERE I.CODIGO = :COD'
      'ORDER BY I.COD_GRP')
    Left = 616
    Top = 8
    ParamData = <
      item
        Name = 'COD'
      end>
    object QItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ITENS_MAPA_RESUMO.CODIGO'
      Required = True
    end
    object QItensCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_MAPA_RESUMO.COD_GRP'
      Required = True
    end
    object QItensVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'ITENS_MAPA_RESUMO.VALOR'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QItensNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = 'GRUPO_ICMS.NOME_GRP'
      Required = True
      Size = 50
    end
    object QItensICMS_SERVICO_GRP: TStringField
      FieldName = 'ICMS_SERVICO_GRP'
      Origin = 'GRUPO_ICMS.ICMS_SERVICO_GRP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItensTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_MAPA_RESUMO.COD_EMP'
      Required = True
    end
    object QItensINDICE_R03: TStringField
      FieldName = 'INDICE_R03'
      Origin = 'ITENS_MAPA_RESUMO.INDICE_R03'
      Required = True
      Size = 10
    end
  end
  object DSItens: TDataSource
    AutoEdit = False
    DataSet = QItens
    Left = 576
    Top = 8
  end
  object QinsMapa: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRMapa
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_MAPA_RESUMO (:CHECKOUT, :DATA, :COO_INICIAL, :COO' +
        '_FINAL, :GT_INICIAL, :GT_FINAL, :CRZ, :CONT_CANCEL, :CRO, :COD_E' +
        'MP, :DATA_EMISSAO, :HORA_EMISSAO)')
    Left = 528
    Top = 8
    ParamData = <
      item
        Name = 'CHECKOUT'
      end
      item
        Name = 'DATA'
      end
      item
        Name = 'COO_INICIAL'
      end
      item
        Name = 'COO_FINAL'
      end
      item
        Name = 'GT_INICIAL'
      end
      item
        Name = 'GT_FINAL'
      end
      item
        Name = 'CRZ'
      end
      item
        Name = 'CONT_CANCEL'
      end
      item
        Name = 'CRO'
      end
      item
        Name = 'COD_EMP'
      end
      item
        Name = 'DATA_EMISSAO'
      end
      item
        Name = 'HORA_EMISSAO'
      end>
    object QinsMapaCODMAPA: TIntegerField
      FieldName = 'CODMAPA'
      Origin = 'SP_INSERT_MAPA_RESUMO.CODMAPA'
    end
  end
end
