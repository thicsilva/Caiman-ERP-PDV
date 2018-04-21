inherited frmCadICMS: TfrmCadICMS
  Caption = 'Cadastro de ICMS'
  ClientHeight = 440
  ClientWidth = 743
  ExplicitWidth = 759
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 15
  inherited shp1: TShape
    Width = 743
    ExplicitWidth = 743
  end
  inherited ToolBar1: TToolBar
    Width = 743
    ExplicitWidth = 743
  end
  inherited pnlGeral: TPanel
    Width = 743
    Height = 377
    ExplicitWidth = 743
    ExplicitHeight = 377
    inherited cxPaginas: TcxPageControl
      Width = 743
      Height = 377
      ExplicitWidth = 743
      ExplicitHeight = 377
      ClientRectBottom = 375
      ClientRectRight = 741
      inherited PageConsulta: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 739
        ExplicitHeight = 345
        inherited cxVisualiza: TcxGrid
          Width = 733
          Height = 298
          ExplicitWidth = 733
          ExplicitHeight = 298
          inherited cxVisualizaDBTableView1: TcxGridDBTableView
            OptionsView.ColumnAutoWidth = True
            object cxVisualizaDBTableView1COD_ICMS: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_ICMS'
              Width = 75
            end
            object cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 300
            end
            object cxVisualizaDBTableView1CST: TcxGridDBColumn
              DataBinding.FieldName = 'CST'
              Width = 30
            end
            object cxVisualizaDBTableView1ICMS: TcxGridDBColumn
              Caption = 'Aliquota'
              DataBinding.FieldName = 'ICMS'
            end
            object cxVisualizaDBTableView1REDUCAO: TcxGridDBColumn
              Caption = 'Redu'#231#227'o'
              DataBinding.FieldName = 'REDUCAO'
            end
            object cxVisualizaDBTableView1DIF: TcxGridDBColumn
              Caption = 'Diferido'
              DataBinding.FieldName = 'DIF'
            end
            object cxVisualizaDBTableView1MVA: TcxGridDBColumn
              DataBinding.FieldName = 'MVA'
            end
          end
        end
        inherited Panel1: TPanel
          Width = 739
          ExplicitWidth = 739
          inherited lblPesquisa: TcxLabel
            Style.IsFontAssigned = True
            AnchorX = 34
            AnchorY = 21
          end
          inherited Panel2: TPanel
            inherited edtCurr: TcxCurrencyEdit
              ExplicitHeight = 23
            end
          end
          inherited btnPesquisar: TcxButton
            OnClick = btnPesquisarClick
          end
          inherited rgOptionGrid: TRadioGroup
            Visible = False
          end
        end
      end
      inherited PageEdit: TcxTabSheet
        ExplicitLeft = 2
        ExplicitTop = 30
        ExplicitWidth = 739
        ExplicitHeight = 345
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 739
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object cxLabel1: TcxLabel
            Left = 3
            Top = -1
            Caption = 'C'#243'digo :'
            Transparent = True
          end
          object dbedtCOD_ICMS: TDBEdit
            Left = 5
            Top = 19
            Width = 121
            Height = 23
            TabStop = False
            CharCase = ecUpperCase
            DataField = 'COD_ICMS'
            DataSource = dsPrincipal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 16744448
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 45
          Width = 739
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object cxLabel2: TcxLabel
            Left = 3
            Top = -2
            Caption = 'Descri'#231#227'o :'
            Transparent = True
          end
          object dbedtDESCRICAO: TDBEdit
            Left = 5
            Top = 18
            Width = 524
            Height = 23
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = dsPrincipal
            TabOrder = 1
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 90
          Width = 739
          Height = 135
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object dbrgrpCST: TDBRadioGroup
            AlignWithMargins = True
            Left = 5
            Top = 3
            Width = 716
            Height = 129
            Margins.Left = 5
            Margins.Right = 7
            Align = alLeft
            Caption = 'CST'
            Columns = 2
            DataField = 'CST'
            DataSource = dsPrincipal
            Items.Strings = (
              '00 - Tributado'
              '10 - Tributado e com cobran'#231'a por Substitui'#231#227'o'
              '20 - Redu'#231#227'o'
              '30 - Isento / N'#227'o Tribuatado com cobran'#231'a por Subs.'
              '40 - Isento'
              '41 - N'#227'o Tributado'
              '50 - Suspens'#227'o'
              '51 - Diferido'
              '60 - ICMS cobrado ant. por Substitui'#231#227'o'
              '70 - Redu'#231#227'o e com Cobran'#231'a por Substitui'#231#227'o'
              '90 - Outras')
            TabOrder = 0
            Values.Strings = (
              '00'
              '10'
              '20'
              '30'
              '40'
              '41'
              '50'
              '51'
              '60'
              '70'
              '90')
            OnChange = dbrgrpCSTChange
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 225
          Width = 739
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
          object pnlIcms: TPanel
            Left = 0
            Top = 0
            Width = 134
            Height = 48
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object cxLabel3: TcxLabel
              Left = 3
              Top = -1
              Caption = 'ICMS(%)'
              Transparent = True
            end
            object dbedtICMS: TDBEdit
              Left = 5
              Top = 19
              Width = 121
              Height = 23
              CharCase = ecUpperCase
              DataField = 'ICMS'
              DataSource = dsPrincipal
              TabOrder = 1
            end
          end
          object pnlReducao: TPanel
            Left = 134
            Top = 0
            Width = 134
            Height = 48
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cxLabel4: TcxLabel
              Left = 3
              Top = -1
              Caption = 'Redu'#231#227'o(%)'
              Transparent = True
            end
            object dbedtREDUCAO: TDBEdit
              Left = 5
              Top = 19
              Width = 121
              Height = 23
              CharCase = ecUpperCase
              DataField = 'REDUCAO'
              DataSource = dsPrincipal
              TabOrder = 1
            end
          end
          object pnlDiferido: TPanel
            Left = 268
            Top = 0
            Width = 134
            Height = 48
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            object cxLabel5: TcxLabel
              Left = 3
              Top = -1
              Caption = 'Diferido(%)'
              Transparent = True
            end
            object dbedtDIF: TDBEdit
              Left = 5
              Top = 19
              Width = 121
              Height = 23
              CharCase = ecUpperCase
              DataField = 'DIF'
              DataSource = dsPrincipal
              TabOrder = 1
            end
          end
          object pnlMva: TPanel
            Left = 402
            Top = 0
            Width = 134
            Height = 48
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 3
            object cxLabel6: TcxLabel
              Left = 3
              Top = -1
              Caption = 'MVA(%)'
              Transparent = True
            end
            object dbedtMVA: TDBEdit
              Left = 5
              Top = 19
              Width = 121
              Height = 23
              CharCase = ecUpperCase
              DataField = 'MVA'
              DataSource = dsPrincipal
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 6357392
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QPrincipal: TFDQuery
    AfterInsert = QPrincipalAfterInsert
    AfterScroll = QPrincipalAfterScroll
    UpdateTransaction = TRPrincipal
    UpdateObject = upPrincipal
    SQL.Strings = (
      'SELECT * FROM TRIBUTACAO_ICMS WHERE COD_EMP=:COD_EMP')
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QPrincipalCOD_ICMS: TIntegerField
      FieldName = 'COD_ICMS'
      Origin = 'COD_ICMS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QPrincipalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object QPrincipalCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 2
    end
    object QPrincipalICMS: TBCDField
      FieldName = 'ICMS'
      Origin = 'ICMS'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalREDUCAO: TBCDField
      FieldName = 'REDUCAO'
      Origin = 'REDUCAO'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalDIF: TBCDField
      FieldName = 'DIF'
      Origin = 'DIF'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QPrincipalMVA: TBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  inherited BarraSubMenu: TcxImageList
    FormatVersion = 1
    DesignInfo = 5308896
  end
  inherited cxImgsGrid: TcxImageList
    FormatVersion = 1
  end
  object upPrincipal: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'INSERT INTO TRIBUTACAO_ICMS'
      '(COD_ICMS, COD_EMP, DESCRICAO, CST, ICMS, '
      '  REDUCAO, DIF, MVA)'
      
        'VALUES (:NEW_COD_ICMS, :NEW_COD_EMP, :NEW_DESCRICAO, :NEW_CST, :' +
        'NEW_ICMS, '
      '  :NEW_REDUCAO, :NEW_DIF, :NEW_MVA)'
      
        'RETURNING COD_ICMS, COD_EMP, DESCRICAO, CST, ICMS, REDUCAO, DIF,' +
        ' MVA')
    ModifySQL.Strings = (
      'UPDATE TRIBUTACAO_ICMS'
      
        'SET COD_ICMS = :NEW_COD_ICMS, COD_EMP = :NEW_COD_EMP, DESCRICAO ' +
        '= :NEW_DESCRICAO, '
      '  CST = :NEW_CST, ICMS = :NEW_ICMS, REDUCAO = :NEW_REDUCAO, '
      '  DIF = :NEW_DIF, MVA = :NEW_MVA'
      'WHERE COD_ICMS = :OLD_COD_ICMS AND COD_EMP = :OLD_COD_EMP'
      
        'RETURNING COD_ICMS, COD_EMP, DESCRICAO, CST, ICMS, REDUCAO, DIF,' +
        ' MVA')
    DeleteSQL.Strings = (
      'DELETE FROM TRIBUTACAO_ICMS'
      'WHERE COD_ICMS = :OLD_COD_ICMS AND COD_EMP = :OLD_COD_EMP')
    FetchRowSQL.Strings = (
      
        'SELECT COD_ICMS, COD_EMP, DESCRICAO, CST, ICMS, REDUCAO, DIF, MV' +
        'A'
      'FROM TRIBUTACAO_ICMS'
      'WHERE COD_ICMS = :COD_ICMS AND COD_EMP = :COD_EMP')
    Left = 568
    Top = 72
  end
end
