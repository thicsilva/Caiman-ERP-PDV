inherited FrmCadSetorEstoque: TFrmCadSetorEstoque
  Left = 465
  Top = 291
  Caption = 'Cadastro de Setores de Estoque'
  ClientHeight = 210
  ClientWidth = 379
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 385
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 379
    Height = 133
    ExplicitWidth = 379
    ExplicitHeight = 133
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
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label32: TLabel
      Left = 8
      Top = 88
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object BtnConsUsu: TsSpeedButton
      Left = 68
      Top = 104
      Width = 23
      Height = 21
      Hint = 'Consultar '
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
      OnClick = BtnConsUsuClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label33: TLabel
      Left = 98
      Top = 88
      Width = 90
      Height = 13
      Caption = 'Nome do Usu'#225'rio'
    end
    object Label3: TLabel
      Left = 112
      Top = 8
      Width = 100
      Height = 13
      Caption = 'Data In'#237'cio Estoque'
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
      Left = 8
      Top = 64
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 2
    end
    object EdtCodUsu: TEdit
      Left = 8
      Top = 104
      Width = 57
      Height = 21
      Hint = 'Pressione F2 para Consultar'
      Alignment = taRightJustify
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnEnter = EdtCodUsuEnter
      OnExit = EdtCodUsuExit
      OnKeyDown = EdtCodUsuKeyDown
      OnKeyPress = EdtCodUsuKeyPress
    end
    object EdtNomeUsu: TEdit
      Left = 98
      Top = 104
      Width = 271
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
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
      TabOrder = 4
    end
    object EdtDataInicioEstoque: TDateTimePicker
      Left = 112
      Top = 24
      Width = 105
      Height = 21
      Date = 40323.534654467600000000
      Time = 40323.534654467600000000
      Color = clSilver
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 379
    ExplicitWidth = 379
    inherited ToolBar1: TToolBar
      Width = 379
      ExplicitWidth = 379
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 190
    Width = 379
    ExplicitTop = 190
    ExplicitWidth = 379
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLSE: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRSE
    Left = 304
    Top = 8
  end
  object IBTRSE: TFDTransaction
    Connection = DM.IBDatabase
    Left = 368
    Top = 8
  end
end
