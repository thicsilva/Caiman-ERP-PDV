inherited FrmCadUsu: TFrmCadUsu
  Left = 292
  Top = 211
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 404
  ClientWidth = 504
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 510
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 504
    Height = 327
    ExplicitWidth = 504
    ExplicitHeight = 327
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 504
      Height = 135
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 41
        Height = 13
        Caption = 'Nome(*)'
      end
      object Label3: TLabel
        Left = 391
        Top = 48
        Width = 32
        Height = 13
        Caption = 'Senha'
      end
      object Label7: TLabel
        Left = 8
        Top = 88
        Width = 57
        Height = 13
        Caption = 'C'#243'd.Grupo'
      end
      object BtnConsGrupo: TsSpeedButton
        Left = 61
        Top = 104
        Width = 23
        Height = 21
        Hint = 'Consultar Grupo de Usu'#225'rio'
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
        OnClick = BtnConsGrupoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label8: TLabel
        Left = 88
        Top = 88
        Width = 102
        Height = 13
        Caption = 'Descri'#231#227'o do Grupo'
      end
      object cod_usu: TEdit
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
        Left = 8
        Top = 64
        Width = 370
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 10
        TabOrder = 1
      end
      object EdtSenha: TEdit
        Left = 391
        Top = 64
        Width = 105
        Height = 21
        Color = clSilver
        MaxLength = 6
        PasswordChar = '*'
        TabOrder = 2
      end
      object Cod_grupo: TEdit
        Left = 8
        Top = 104
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Grupo de Usu'#225'rio'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = Cod_grupoEnter
        OnExit = Cod_grupoExit
        OnKeyDown = Cod_grupoKeyDown
        OnKeyPress = cod_empKeyPress
      end
      object EdtNomeGrupo: TEdit
        Left = 88
        Top = 104
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
        TabOrder = 4
      end
      object CheckOperador: TCheckBox
        Left = 385
        Top = 104
        Width = 109
        Height = 17
        Caption = 'Operador de Caixa'
        TabOrder = 5
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 135
      Width = 504
      Height = 192
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 504
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Empresas Autorizadas'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 114
      end
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 60
        Height = 13
        Caption = 'Cod.Emp.(*)'
      end
      object BtnConsEmp: TsSpeedButton
        Left = 61
        Top = 40
        Width = 23
        Height = 21
        Hint = 'Consultar Empresa'
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
        OnClick = BtnConsEmpClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label6: TLabel
        Left = 88
        Top = 24
        Width = 111
        Height = 13
        Caption = 'Descri'#231#227'o da Empresa'
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 85
        Width = 504
        Height = 107
        Align = alBottom
        Color = clSilver
        DataSource = DSQBuscaItens
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_EMP'
            Title.Alignment = taCenter
            Title.Caption = 'EMP.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAO_EMP'
            Title.Alignment = taCenter
            Title.Caption = 'DESCRI'#199#195'O DA EMPRESA'
            Width = 413
            Visible = True
          end>
      end
      object cod_emp: TEdit
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar Empresa'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = cod_empEnter
        OnExit = cod_empExit
        OnKeyDown = cod_empKeyDown
        OnKeyPress = cod_empKeyPress
      end
      object EdtNomeEmp: TEdit
        Left = 88
        Top = 40
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
      object BtnGrava: TBitBtn
        Left = 389
        Top = 15
        Width = 65
        Height = 25
        Caption = '&Grava'
        TabOrder = 3
        OnClick = BtnGravaClick
      end
      object BtnExclui: TBitBtn
        Left = 389
        Top = 47
        Width = 65
        Height = 25
        Caption = '&Exclui'
        TabOrder = 4
        OnClick = BtnExcluiClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 504
    Color = 16710131
    ExplicitWidth = 504
    inherited ToolBar1: TToolBar
      Width = 504
      ExplicitWidth = 504
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 384
    Width = 504
    ExplicitTop = 384
    ExplicitWidth = 504
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLUsu: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRUsu
    Left = 424
    Top = 8
  end
  object IBTRUsu: TFDTransaction
    Connection = DM.IBDatabase
    Left = 488
    Top = 8
  end
  object IBSQLUsuEmp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRUsu
    Left = 160
    Top = 296
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRUsu
    SQL.Strings = (
      'SELECT I.*, E.RAZAO_EMP'
      'FROM EMPRESA_USUARIO I'
      'INNER JOIN EMPRESA E'
      'ON (I.COD_EMP = E.COD_EMP)'
      'WHERE I.COD_USU = :CODUSU'
      'ORDER BY I.COD_EMP')
    Left = 248
    Top = 296
    ParamData = <
      item
        Name = 'CODUSU'
        DataType = ftInteger
      end>
    object QBuscaItensCOD_USU: TIntegerField
      FieldName = 'COD_USU'
      Origin = 'EMPRESA_USUARIO.COD_USU'
      Required = True
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'EMPRESA_USUARIO.COD_EMP'
      Required = True
    end
    object QBuscaItensRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'EMPRESA.RAZAO_EMP'
      Required = True
      Size = 50
    end
  end
  object DSQBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 336
    Top = 296
  end
end
