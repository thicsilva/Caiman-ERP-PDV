object FrmConsProd: TFrmConsProd
  Left = 158
  Top = -25
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Produto'
  ClientHeight = 598
  ClientWidth = 921
  Color = clWhite
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 598
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 921
      Height = 169
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Men: TLabel
        Left = 8
        Top = 150
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 56
        Width = 169
        Height = 49
        Caption = 'Consultar por'
        TabOrder = 1
        object ComboCons: TComboBox
          Left = 8
          Top = 16
          Width = 153
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboConsChange
          Items.Strings = (
            'C'#211'DIGO'
            'NOME'
            'REFER'#202'NCIA'
            'COD.BARRA'
            'FABRICANTE'
            'SE'#199#195'O'
            'PALAVRA CHAVE')
        end
      end
      object GB2: TGroupBox
        Left = 184
        Top = 56
        Width = 369
        Height = 49
        Caption = 'Consultar por'
        TabOrder = 2
        object BtnCons: TsSpeedButton
          Left = 68
          Top = 16
          Width = 23
          Height = 21
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
          OnClick = BtnConsClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object EdtCons: TEdit
          Left = 8
          Top = 16
          Width = 353
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object EdtCod: TEdit
          Left = 8
          Top = 16
          Width = 57
          Height = 21
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
          Left = 98
          Top = 16
          Width = 263
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
          TabOrder = 1
        end
      end
      object BtnOk: TButton
        Left = 618
        Top = 56
        Width = 71
        Height = 25
        Caption = 'OK'
        TabOrder = 3
        OnClick = BtnOkClick
      end
      object BtnSair: TButton
        Left = 618
        Top = 96
        Width = 71
        Height = 25
        Caption = 'Sair'
        TabOrder = 4
        OnClick = BtnSairClick
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 545
        Height = 49
        Caption = 'Classifica'#231#227'o do Produto'
        TabOrder = 0
        object ComboClassif: TComboBox
          Left = 8
          Top = 16
          Width = 529
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboConsChange
        end
      end
      object RdgAtivo: TRadioGroup
        Left = 8
        Top = 104
        Width = 545
        Height = 33
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Ativos'
          'Destivados'
          'Todos')
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 169
      Width = 921
      Height = 429
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object DBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 375
        Align = alTop
        Color = clSilver
        DataSource = DM.DSProd
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnColumnMoved = DBGridColumnMoved
        OnDrawColumnCell = DBGridDrawColumnCell
        OnDblClick = BtnLocalizarClick
        OnKeyDown = DBGridKeyDown
        OnKeyPress = DBGridKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'D.'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_BARRA_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'COD.BARRA'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Title.Alignment = taCenter
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE_CONSIGNADO'
            Title.Caption = 'ESTOQUE CON.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 338
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAMANHO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROMOCAO_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'PROMO'#199#195'O'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_PRAZO_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'VALOR A PRAZO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_PROGRAMADO'
            Title.Alignment = taCenter
            Title.Caption = 'PRE'#199'O OFF'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_PROGRAMADO_PRAZO'
            Title.Alignment = taCenter
            Title.Caption = 'PRAZO OFF'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_VALIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'DATA VALIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_GRP'
            Title.Alignment = taCenter
            Title.Caption = 'GRUPO ICMS'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_PIS_COFINS'
            Title.Alignment = taCenter
            Title.Caption = 'PIS/COFINS'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_SEC'
            Title.Alignment = taCenter
            Title.Caption = 'SE'#199#195'O'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'GRUPO'
            Width = 201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO1'
            Title.Alignment = taCenter
            Title.Caption = 'SUB-GRUPO'
            Width = 224
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'REFER'#202'NCIA'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCALIZACAO_PRO'
            Title.Alignment = taCenter
            Title.Caption = 'LOCALIZA'#199#195'O'
            Width = 112
            Visible = True
          end>
      end
      object BtnLocalizar: TButton
        Left = 101
        Top = 381
        Width = 65
        Height = 25
        Caption = 'Localizar'
        TabOrder = 1
        OnClick = BtnLocalizarClick
      end
      object BtnPromocao: TButton
        Left = 252
        Top = 381
        Width = 65
        Height = 25
        Caption = 'Promo'#231#227'o'
        TabOrder = 2
        TabStop = False
        OnClick = BtnPromocaoClick
      end
      object Button1: TButton
        Left = 405
        Top = 381
        Width = 134
        Height = 25
        Caption = 'Estoque consignado'
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
end
