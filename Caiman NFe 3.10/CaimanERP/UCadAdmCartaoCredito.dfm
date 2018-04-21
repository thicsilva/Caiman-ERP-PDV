inherited FrmCadAdmCartaoCredito: TFrmCadAdmCartaoCredito
  Left = 258
  Top = 199
  Caption = 'Cadastro Administradoras de Cart'#227'o'
  ClientHeight = 481
  ClientWidth = 752
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 758
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 752
    Height = 404
    ExplicitWidth = 752
    ExplicitHeight = 404
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 752
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label2: TLabel
        Left = 80
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label8: TLabel
        Left = 424
        Top = 8
        Width = 58
        Height = 13
        Caption = 'C'#243'digo TEF'
      end
      object codigo: TEdit
        Left = 8
        Top = 24
        Width = 57
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EdtNome: TEdit
        Left = 80
        Top = 24
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 50
        TabOrder = 1
      end
      object EdtCodTEF: TEdit
        Left = 424
        Top = 24
        Width = 89
        Height = 21
        Color = clSilver
        MaxLength = 10
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 55
      Width = 752
      Height = 349
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label3: TLabel
        Left = 128
        Top = 72
        Width = 62
        Height = 13
        Caption = 'Taxa Cr'#233'dito'
      end
      object Label4: TLabel
        Left = 304
        Top = 72
        Width = 60
        Height = 13
        Caption = 'Dias D'#233'bito'
      end
      object Label7: TLabel
        Left = 376
        Top = 72
        Width = 63
        Height = 13
        Caption = 'Dias Cr'#233'dito'
      end
      object Label30: TLabel
        Left = 0
        Top = 0
        Width = 752
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Bandeiras'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 51
      end
      object Label9: TLabel
        Left = 80
        Top = 24
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label10: TLabel
        Left = 8
        Top = 24
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label5: TLabel
        Left = 216
        Top = 72
        Width = 59
        Height = 13
        Caption = 'Taxa D'#233'bito'
      end
      object Label6: TLabel
        Left = 448
        Top = 72
        Width = 58
        Height = 13
        Caption = 'C'#243'digo TEF'
      end
      object Label11: TLabel
        Left = 8
        Top = 72
        Width = 59
        Height = 13
        Caption = 'Tipo Cart'#227'o'
      end
      object Image1: TImage
        Left = 632
        Top = 16
        Width = 100
        Height = 100
        AutoSize = True
        Center = True
      end
      object EdtTaxaCredito: TCurrencyEdit
        Left = 128
        Top = 88
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 3
        ZeroEmpty = False
      end
      object EdtDiasCredito: TEdit
        Left = 376
        Top = 88
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 7
        OnEnter = EdtDiasCreditoEnter
      end
      object EdtDiasDebito: TEdit
        Left = 304
        Top = 88
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 5
        OnEnter = EdtDiasDebitoEnter
      end
      object EdtNomeBandeira: TEdit
        Left = 80
        Top = 40
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 50
        TabOrder = 0
      end
      object EdtCodBandeira: TEdit
        Left = 8
        Top = 40
        Width = 57
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object CheckAtivo: TCheckBox
        Left = 448
        Top = 40
        Width = 73
        Height = 17
        Caption = 'Ativo'
        TabOrder = 1
      end
      object EdtTaxaDebito: TCurrencyEdit
        Left = 216
        Top = 88
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 4
        ZeroEmpty = False
      end
      object ComboTipoCartao: TComboBox
        Left = 8
        Top = 88
        Width = 105
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 2
        OnChange = ComboTipoCartaoChange
        OnExit = ComboTipoCartaoChange
        Items.Strings = (
          'CR'#201'DITO'
          'D'#201'BITO'
          'AMBOS')
      end
      object BtnGrava: TButton
        Left = 547
        Top = 33
        Width = 75
        Height = 35
        Caption = '&Gravar'
        TabOrder = 9
        OnClick = BtnGravaClick
      end
      object BtnExclui: TButton
        Left = 547
        Top = 73
        Width = 75
        Height = 35
        Caption = '&Excluir'
        TabOrder = 10
        OnClick = BtnExcluiClick
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 132
        Width = 752
        Height = 217
        Align = alBottom
        Color = clSilver
        DataSource = DSBandeiras
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'TIPO'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAXA_CREDITO'
            Title.Alignment = taCenter
            Title.Caption = 'TX CR'#201'DITO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAXA_DEBITO'
            Title.Alignment = taCenter
            Title.Caption = 'TX D'#201'BITO'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_CREDITO'
            Title.Alignment = taCenter
            Title.Caption = 'DIAS CR'#201'DITO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIAS_DEBITO'
            Title.Alignment = taCenter
            Title.Caption = 'DIAS D'#201'BITO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_TEF'
            Title.Alignment = taCenter
            Title.Caption = 'COD. TEF'
            Visible = True
          end>
      end
      object EdtCodTEFBandeira: TEdit
        Left = 448
        Top = 88
        Width = 89
        Height = 21
        Color = clSilver
        MaxLength = 10
        TabOrder = 8
      end
    end
  end
  inherited Panel2: TPanel
    Width = 752
    ExplicitWidth = 752
    inherited ToolBar1: TToolBar
      Width = 752
      ExplicitWidth = 752
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 461
    Width = 752
    ExplicitTop = 461
    ExplicitWidth = 752
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLAdm: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRAdm
    Left = 440
  end
  object IBTRAdm: TFDTransaction
    Connection = DM.IBDatabase
    Left = 312
  end
  object DSBandeiras: TDataSource
    AutoEdit = False
    DataSet = QBandeiras
    Left = 200
    Top = 328
  end
  object QBandeiras: TFDQuery
    OnCalcFields = QBandeirasCalcFields
    Connection = DM.IBDatabase
    Transaction = IBTRAdm
    SQL.Strings = (
      'SELECT *'
      'FROM BANDEIRAS_CARTAO'
      'WHERE CODIGO_ADMINISTRADORA = :COD'
      'ORDER BY CODIGO')
    Left = 200
    Top = 280
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBandeirasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BANDEIRAS_CARTAO.CODIGO'
      Required = True
    end
    object QBandeirasCODIGO_ADMINISTRADORA: TIntegerField
      FieldName = 'CODIGO_ADMINISTRADORA'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_ADMINISTRADORA'
      Required = True
    end
    object QBandeirasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BANDEIRAS_CARTAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object QBandeirasATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'BANDEIRAS_CARTAO.ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBandeirasTAXA_CREDITO: TBCDField
      FieldName = 'TAXA_CREDITO'
      Origin = 'BANDEIRAS_CARTAO.TAXA_CREDITO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBandeirasTAXA_DEBITO: TBCDField
      FieldName = 'TAXA_DEBITO'
      Origin = 'BANDEIRAS_CARTAO.TAXA_DEBITO'
      Required = True
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBandeirasDIAS_CREDITO: TIntegerField
      FieldName = 'DIAS_CREDITO'
      Origin = 'BANDEIRAS_CARTAO.DIAS_CREDITO'
      Required = True
    end
    object QBandeirasDIAS_DEBITO: TIntegerField
      FieldName = 'DIAS_DEBITO'
      Origin = 'BANDEIRAS_CARTAO.DIAS_DEBITO'
      Required = True
    end
    object QBandeirasTIPO_CARTAO: TStringField
      FieldName = 'TIPO_CARTAO'
      Origin = 'BANDEIRAS_CARTAO.TIPO_CARTAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBandeirasCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Calculated = True
    end
    object QBandeirasCODIGO_TEF: TStringField
      FieldName = 'CODIGO_TEF'
      Origin = 'BANDEIRAS_CARTAO.CODIGO_TEF'
      Required = True
      Size = 10
    end
  end
end
