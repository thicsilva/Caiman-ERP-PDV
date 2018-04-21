object FrmRelBal: TFrmRelBal
  Left = 370
  Top = 262
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Balan'#231'o de Compra e Venda por Produto'
  ClientHeight = 283
  ClientWidth = 393
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
    Width = 393
    Height = 225
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 389
      Height = 49
      Align = alTop
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object Label1: TLabel
        Left = 184
        Top = 24
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataIni: TDateTimePicker
        Left = 48
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 0
      end
      object EdtDataFin: TDateTimePicker
        Left = 216
        Top = 16
        Width = 105
        Height = 21
        Date = 38108.684189710600000000
        Time = 38108.684189710600000000
        TabOrder = 1
      end
    end
    object CheckEmp: TCheckBox
      Left = 240
      Top = 160
      Width = 129
      Height = 17
      TabStop = False
      Caption = 'Todas as Empresas'
      TabOrder = 3
    end
    object GB: TGroupBox
      Left = 2
      Top = 105
      Width = 389
      Height = 49
      Align = alTop
      TabOrder = 1
      object BtnCons: TsSpeedButton
        Left = 61
        Top = 18
        Width = 23
        Height = 21
        Hint = 'Consultar Se'#231#227'o'
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
        OnClick = BtnConsClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object EdtCod: TEdit
        Left = 8
        Top = 18
        Width = 49
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Se'#231#227'o'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodEnter
        OnExit = EdtCodExit
        OnKeyDown = EdtCodKeyDown
        OnKeyPress = EdtCodKeyPress
      end
      object EdtNome: TEdit
        Left = 88
        Top = 18
        Width = 273
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
        TabOrder = 1
      end
    end
    object Check: TCheckBox
      Left = 8
      Top = 160
      Width = 217
      Height = 17
      TabStop = False
      TabOrder = 2
      OnClick = CheckClick
    end
    object RdgOrdem: TRadioGroup
      Left = 2
      Top = 184
      Width = 389
      Height = 39
      Align = alBottom
      Caption = 'Ordem Impress'#227'o'
      Columns = 2
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 4
      OnClick = RdgOrdemClick
    end
    object RDG: TRadioGroup
      Left = 2
      Top = 51
      Width = 389
      Height = 54
      Align = alTop
      Columns = 2
      Items.Strings = (
        'SE'#199#195'O'
        'FORNECEDOR')
      TabOrder = 5
      OnClick = RdgOrdemClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 225
    Width = 393
    Height = 39
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnVis: TBitBtn
      Left = 47
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = BtnVisClick
    end
    object BtnImp: TBitBtn
      Left = 159
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BtnVisClick
    end
    object BtnSair: TBitBtn
      Left = 271
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 264
    Width = 393
    Height = 19
    Panels = <>
  end
  object QRelBal: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM SP_REL_GIRO(:CODEMP, :COD, :DATAINI, :DATAFIN)'
      'ORDER BY NOMEPRO')
    Left = 344
    Top = 16
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'COD'
      end
      item
        Name = 'DATAINI'
        DataType = ftDate
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
      end>
    object QRelBalCODPRO: TIntegerField
      FieldName = 'CODPRO'
      Origin = 'SP_REL_GIRO.CODPRO'
    end
    object QRelBalNOMEPRO: TStringField
      FieldName = 'NOMEPRO'
      Origin = 'SP_REL_GIRO.NOMEPRO'
      Size = 80
    end
    object QRelBalESTOQUEANT: TBCDField
      FieldName = 'ESTOQUEANT'
      Origin = 'SP_REL_GIRO.ESTOQUEANT'
      DisplayFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QRelBalOUTRASE: TBCDField
      FieldName = 'OUTRASE'
      Origin = 'SP_REL_GIRO.OUTRASE'
      Precision = 18
      Size = 3
    end
    object QRelBalOUTRASS: TBCDField
      FieldName = 'OUTRASS'
      Origin = 'SP_REL_GIRO.OUTRASS'
      Precision = 18
      Size = 3
    end
    object QRelBalACERTOE: TBCDField
      FieldName = 'ACERTOE'
      Origin = 'SP_REL_GIRO.ACERTOE'
      Precision = 18
      Size = 3
    end
    object QRelBalACERTOS: TBCDField
      FieldName = 'ACERTOS'
      Origin = 'SP_REL_GIRO.ACERTOS'
      Precision = 18
      Size = 3
    end
    object QRelBalCOMPRAS: TBCDField
      FieldName = 'COMPRAS'
      Origin = 'SP_REL_GIRO.COMPRAS'
      Precision = 18
      Size = 3
    end
    object QRelBalREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'SP_REL_GIRO.REFERENCIA'
      Size = 30
    end
    object QRelBalVENDAS: TBCDField
      FieldName = 'VENDAS'
      Origin = 'SP_REL_GIRO.VENDAS'
      Precision = 18
      Size = 3
    end
  end
end
