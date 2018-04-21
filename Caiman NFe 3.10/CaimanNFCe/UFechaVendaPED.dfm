object FrmFechaVendaPED: TFrmFechaVendaPED
  Left = 639
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formas Pagamento'
  ClientHeight = 533
  ClientWidth = 397
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
    Top = 514
    Width = 397
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'F2 [Total Produtos]   F3 [Desconto]   F4 [Desc.c/senha]'
  end
  object Panel4: TPanel
    Left = 0
    Top = 473
    Width = 397
    Height = 41
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 128
      Top = 8
      Width = 129
      Height = 29
      Caption = '&OK'
      DoubleBuffered = True
      Glyph.Data = {
        02030000424D0203000000000000360100002800000013000000170000000100
        080000000000CC010000C30E0000C30E000040000000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C0003F3F3F3F3F3F
        191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
        3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
        11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
        3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
        3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
        221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
        3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
        08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
        2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
        110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
        3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
        3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
        3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F373F3F00}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 473
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object PanelTroco: TPanel
      Left = 2
      Top = 400
      Width = 393
      Height = 71
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label5: TLabel
        Left = 2
        Top = 2
        Width = 389
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'TROCO'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 54
      end
      object EdtTroco: TCurrencyEdit
        Left = 112
        Top = 26
        Width = 169
        Height = 35
        Margins.Left = 8
        Margins.Top = 1
        TabStop = False
        AutoSize = False
        CheckOnExit = True
        Color = 8454143
        DisplayFormat = ',#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ZeroEmpty = False
      end
    end
    object PanelDesconto: TPanel
      Left = 2
      Top = 2
      Width = 393
      Height = 97
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label1: TLabel
        Left = 44
        Top = 67
        Width = 71
        Height = 16
        Caption = 'Valor (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 35
        Width = 98
        Height = 16
        Caption = 'Percentual(%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 2
        Top = 2
        Width = 389
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Descontos'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 75
      end
      object EdtPercentualDesconto: TCurrencyEdit
        Left = 128
        Top = 27
        Width = 129
        Height = 27
        Margins.Left = 7
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = 13810835
        DisplayFormat = ',#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ZeroEmpty = False
        OnExit = EdtPercentualDescontoExit
        OnKeyUp = EdtValorDescontoKeyUp
      end
      object EdtValorDesconto: TCurrencyEdit
        Left = 128
        Top = 59
        Width = 129
        Height = 27
        Margins.Left = 7
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = 13810835
        DisplayFormat = ',#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ZeroEmpty = False
        OnExit = EdtValorDescontoExit
        OnKeyUp = EdtValorDescontoKeyUp
      end
    end
    object PanelFormas: TPanel
      Left = 2
      Top = 99
      Width = 393
      Height = 301
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16710131
      TabOrder = 2
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 166
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Formas de Pagamentos'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object DBGridFormas: TDBGrid
        Left = 1
        Top = 17
        Width = 391
        Height = 283
        Align = alClient
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        Color = 16710131
        DataSource = DSFormas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnColEnter = DBGridFormasColEnter
        OnEnter = DBGridFormasEnter
        OnExit = DBGridFormasExit
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object QAtualizaVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAtualiza
    SQL.Strings = (
      'UPDATE VENDAS SET DESCONTO_VEN = :2,'
      'DINHEIRO_VEN = :3, PROMISSORIA_VEN = :4,'
      'CHEQUE_VEN = :5, CHEQUEPRE_VEN = :6, CARTAO_VEN = :7,'
      'TROCO_VEN = :8, TOTAL_VEN = :9, BOLETO_VEN = :11 '
      'WHERE COD_VEN = :10')
    Left = 240
    Top = 144
    ParamData = <
      item
        DataType = ftCurrency
        Name = '2'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '3'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '4'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '5'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '6'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '7'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '8'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '9'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = '11'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = '10'
        ParamType = ptUnknown
      end>
  end
  object IBTRAtualiza: TFDTransaction
    Connection = DM.IBDatabase
    Left = 248
    Top = 200
  end
  object DSFormas: TDataSource
    DataSet = CDSFormas
    Left = 136
    Top = 208
  end
  object CDSFormas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterOpen = CDSFormasAfterOpen
    Left = 136
    Top = 264
    object CDSFormasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CDSFormasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object CDSFormasVALOR: TCurrencyField
      FieldName = 'VALOR'
      DisplayFormat = ',#0.00'
    end
    object CDSFormasUSA_TEF: TStringField
      FieldName = 'USA_TEF'
      Size = 1
    end
    object CDSFormasABRE_GAVETA: TStringField
      FieldName = 'ABRE_GAVETA'
      Size = 1
    end
    object CDSFormasINDICE: TStringField
      FieldName = 'INDICE'
    end
    object CDSFormasTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object CDSFormasDESCRICAO_ECF: TStringField
      FieldName = 'DESCRICAO_ECF'
    end
    object CDSFormasCONCEDER_DESCONTO: TStringField
      FieldName = 'CONCEDER_DESCONTO'
      Size = 1
    end
  end
end
