object frmSelecionaCFOPS: TfrmSelecionaCFOPS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tributos Produto'
  ClientHeight = 427
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 8
    Top = 59
    Width = 465
    Height = 345
    Caption = ' Tributos Entrada '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label95: TLabel
      Left = 12
      Top = 26
      Width = 44
      Height = 13
      Caption = 'Origem :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label114: TLabel
      Left = 12
      Top = 68
      Width = 41
      Height = 13
      Caption = 'CST IPI :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzDBComboBox1: TRzDBComboBox
      Left = 12
      Top = 43
      Width = 328
      Height = 21
      DataField = 'ORIGEM'
      DataSource = DS_T_E
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        '0 - Nacional'
        '1 - Estrangeira - Importa'#231#227'o direta'
        '2 - Estrangeira - Adquirida no mercado interno')
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object RzDBComboBox6: TRzDBComboBox
      Left = 12
      Top = 85
      Width = 328
      Height = 21
      DataField = 'CST_IPI'
      DataSource = DS_T_E
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        '00 - Entrada com Recupera'#231#227'o de Cr'#233'dito '
        '01 - Entrada Tribut'#225'vel com Al'#237'quota Zero '
        '02 - Entrada Isenta '
        '03 - Entrada N'#227'o Tributada '
        '04 - Entrada Imune '
        '05 - Entrada com Suspens'#227'o'
        '49 - Outras Entradas'
        '50 - Sa'#237'da Tributada '
        '51 - Sa'#237'da Tribut'#225'vel com Al'#237'quota Zero '
        '52 - Sa'#237'da Isenta'
        '53 - Sa'#237'da N'#227'o Tributada'
        '54 - Sa'#237'da Imune'
        '55 - Sa'#237'da com Suspens'#227'o'
        '99 - Outras Sa'#237'das')
      Values.Strings = (
        '00'
        '01'
        '02'
        '03'
        '04'
        '05'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '99')
    end
    object PageControl1: TPageControl
      Left = 12
      Top = 112
      Width = 440
      Height = 225
      ActivePage = TabSheet8
      TabOrder = 2
      object TabSheet8: TTabSheet
        Caption = ' Dentro do Estado '
        object Label96: TLabel
          Left = 11
          Top = 49
          Width = 96
          Height = 13
          Caption = 'C'#243'd. Grupo ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton4: TsSpeedButton
          Left = 130
          Top = 68
          Width = 23
          Height = 21
          Hint = 'Consultar Grupo de ICMS'
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
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label97: TLabel
          Left = 159
          Top = 49
          Width = 85
          Height = 13
          Caption = 'Descri'#231#227'o ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label98: TLabel
          Left = 11
          Top = 96
          Width = 55
          Height = 13
          Caption = 'CST ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label99: TLabel
          Left = 12
          Top = 146
          Width = 81
          Height = 13
          Caption = 'Redu'#231#227'o ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label100: TLabel
          Left = 159
          Top = 146
          Width = 38
          Height = 13
          Caption = 'Agreg.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label101: TLabel
          Left = 252
          Top = 146
          Width = 19
          Height = 13
          Caption = 'IPI :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label115: TLabel
          Left = 12
          Top = 5
          Width = 128
          Height = 13
          Caption = 'CFOP Dentro do estado :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedtICMS_DENTRO: TDBEdit
          Left = 10
          Top = 68
          Width = 114
          Height = 21
          DataField = 'ICMS_DENTRO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = dbedtICMS_DENTROExit
        end
        object Desc_icms_dentro: TEdit
          Left = 159
          Top = 68
          Width = 250
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'Desc_icms_dentro'
        end
        object RzDBComboBox2: TRzDBComboBox
          Left = 11
          Top = 113
          Width = 398
          Height = 21
          DataField = 'CST_DENTRO'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Items.Strings = (
            '00 - Tributada integralmente'
            
              '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
              'a '
            '20 - Com redu'#231#227'o de base de c'#225'lculo'
            
              '30 - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
              'i'#231#227'o tribut'#225'ria'
            '40 - Isenta'
            '41 - N'#227'o Tributada'
            '50 - Suspens'#227'o'
            '51 - Diferimento'
            '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
            
              '70 - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
              'itui'#231#227'o tribut'#225'ria'
            '90 - Outras')
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
        end
        object dbchkTEM_SUBSTITUICAO: TDBCheckBox
          Left = 114
          Top = 167
          Width = 39
          Height = 17
          Caption = 'ST'
          DataField = 'TEM_SUBSTITUICAO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbchkTEM_SUBSTITUICAOClick
        end
        object dbedtREDU_ICMS_DENTRO: TDBEdit
          Left = 12
          Top = 165
          Width = 87
          Height = 21
          DataField = 'REDU_ICMS_DENTRO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbedtAGREG_DENTRO: TDBEdit
          Left = 159
          Top = 165
          Width = 87
          Height = 21
          DataField = 'AGREG_DENTRO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object dbedtIPI_DENTRO: TDBEdit
          Left = 252
          Top = 165
          Width = 87
          Height = 21
          DataField = 'IPI_DENTRO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object cfop_Dentro: TRzDBComboBox
          Left = 12
          Top = 22
          Width = 398
          Height = 21
          DataField = 'COD_CFOP_DENTRO'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = cfop_DentroChange
          Items.Strings = (
            '00 - Tributada integralmente'
            
              '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
              'a '
            '20 - Com redu'#231#227'o de base de c'#225'lculo'
            
              '30 - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
              'i'#231#227'o tribut'#225'ria'
            '40 - Isenta'
            '41 - N'#227'o Tributada'
            '50 - Suspens'#227'o'
            '51 - Diferimento'
            '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
            
              '70 - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
              'itui'#231#227'o tribut'#225'ria'
            '90 - Outras')
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
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Fora do Estado '
        ImageIndex = 1
        object Label102: TLabel
          Left = 11
          Top = 49
          Width = 96
          Height = 13
          Caption = 'C'#243'd. Grupo ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label103: TLabel
          Left = 159
          Top = 49
          Width = 85
          Height = 13
          Caption = 'Descri'#231#227'o ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton5: TsSpeedButton
          Left = 130
          Top = 68
          Width = 23
          Height = 21
          Hint = 'Consultar Grupo de ICMS'
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
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object Label104: TLabel
          Left = 11
          Top = 96
          Width = 55
          Height = 13
          Caption = 'CST ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label105: TLabel
          Left = 12
          Top = 146
          Width = 81
          Height = 13
          Caption = 'Redu'#231#227'o ICMS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label107: TLabel
          Left = 116
          Top = 146
          Width = 19
          Height = 13
          Caption = 'IPI :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label116: TLabel
          Left = 12
          Top = 5
          Width = 115
          Height = 13
          Caption = 'CFOP Fora do estado :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedtICMS_FORA: TDBEdit
          Left = 11
          Top = 68
          Width = 114
          Height = 21
          DataField = 'ICMS_FORA'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = dbedtICMS_FORAExit
        end
        object Desc_icms_fora: TEdit
          Left = 159
          Top = 68
          Width = 250
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'Desc_icms_dentro'
        end
        object RzDBComboBox3: TRzDBComboBox
          Left = 11
          Top = 113
          Width = 398
          Height = 21
          DataField = 'CST_FORA'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Items.Strings = (
            '00 - Tributada integralmente'
            
              '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
              'a '
            '20 - Com redu'#231#227'o de base de c'#225'lculo'
            
              '30 - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
              'i'#231#227'o tribut'#225'ria'
            '40 - Isenta'
            '41 - N'#227'o Tributada'
            '50 - Suspens'#227'o'
            '51 - Diferimento'
            '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
            
              '70 - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
              'itui'#231#227'o tribut'#225'ria'
            '90 - Outras')
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
        end
        object dbedtREDU_ICMS_FORA: TDBEdit
          Left = 12
          Top = 165
          Width = 87
          Height = 21
          DataField = 'REDU_ICMS_FORA'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbedtIPI_FORA: TDBEdit
          Left = 116
          Top = 165
          Width = 87
          Height = 21
          DataField = 'IPI_FORA'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object cfop_fora: TRzDBComboBox
          Left = 12
          Top = 22
          Width = 398
          Height = 21
          DataField = 'COD_CFOP_FORA'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = cfop_foraChange
          Items.Strings = (
            '00 - Tributada integralmente'
            
              '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
              'a '
            '20 - Com redu'#231#227'o de base de c'#225'lculo'
            
              '30 - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
              'i'#231#227'o tribut'#225'ria'
            '40 - Isenta'
            '41 - N'#227'o Tributada'
            '50 - Suspens'#227'o'
            '51 - Diferimento'
            '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
            
              '70 - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
              'itui'#231#227'o tribut'#225'ria'
            '90 - Outras')
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
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'Pis/Cofins'
        ImageIndex = 2
        object Label106: TLabel
          Left = 3
          Top = 8
          Width = 44
          Height = 13
          Caption = 'CST PIS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label108: TLabel
          Left = 3
          Top = 52
          Width = 67
          Height = 13
          Caption = 'CST COFINS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzDBComboBox4: TRzDBComboBox
          Left = 3
          Top = 25
          Width = 398
          Height = 21
          DataField = 'CST_PIS'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
            '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
            
              '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
              'roduto'
            '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
            '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
            '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
            '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
            '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
            '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
            '49 - Outras Opera'#231#245'es de Sa'#237'da'
            
              '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
              ' Receita Tributada no Mercado Interno'
            
              '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
              ' Receita N'#227'o Tributada no Mercado Interno'
            
              '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
              ' Receita de Exporta'#231#227'o'
            
              '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas e N'#227'o-Tributadas no Mercado Interno'
            
              '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas no Mercado Interno e de Exporta'#231#227'o'
            
              '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
              'ributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
            
              '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita Tributada no Mercado Interno'
            
              '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita N'#227'o-Tributada no Mercado Interno'
            
              '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita de Exporta'#231#227'o'
            
              '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
            
              '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
              #231#227'o'
            '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
            '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
            '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
            '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
            '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
            '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
            '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
            '98 - Outras Opera'#231#245'es de Entrada'
            '99 - Outras Opera'#231#245'es')
          Values.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '49'
            '50'
            '51'
            '52'
            '53'
            '54'
            '55'
            '56'
            '60'
            '61'
            '62'
            '63'
            '64'
            '65'
            '66'
            '67'
            '70'
            '71'
            '72'
            '73'
            '74'
            '75'
            '98'
            '99')
        end
        object RzDBComboBox5: TRzDBComboBox
          Left = 3
          Top = 69
          Width = 398
          Height = 21
          DataField = 'CST_COFINS'
          DataSource = DS_T_E
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Items.Strings = (
            '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
            '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
            
              '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
              'roduto'
            '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
            '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
            '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
            '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
            '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
            '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
            '49 - Outras Opera'#231#245'es de Sa'#237'da'
            
              '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
              ' Receita Tributada no Mercado Interno'
            
              '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
              ' Receita N'#227'o Tributada no Mercado Interno'
            
              '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
              ' Receita de Exporta'#231#227'o'
            
              '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas e N'#227'o-Tributadas no Mercado Interno'
            
              '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas no Mercado Interno e de Exporta'#231#227'o'
            
              '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
              'ributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
              'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
            
              '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita Tributada no Mercado Interno'
            
              '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita N'#227'o-Tributada no Mercado Interno'
            
              '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
              'vamente a Receita de Exporta'#231#227'o'
            
              '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
            
              '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
            
              '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
              'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
              #231#227'o'
            '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
            '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
            '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
            '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
            '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
            '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
            '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
            '98 - Outras Opera'#231#245'es de Entrada'
            '99 - Outras Opera'#231#245'es')
          Values.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '49'
            '50'
            '51'
            '52'
            '53'
            '54'
            '55'
            '56'
            '60'
            '61'
            '62'
            '63'
            '64'
            '65'
            '66'
            '67'
            '70'
            '71'
            '72'
            '73'
            '74'
            '75'
            '98'
            '99')
        end
        object DBCheckBox1: TDBCheckBox
          Left = 3
          Top = 96
          Width = 126
          Height = 17
          Caption = 'Isento Pis/Cofins'
          DataField = 'TEM_SUBSTITUICAO'
          DataSource = DS_T_E
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = DBCheckBox1Click
        end
        object PanelPisCofins: TPanel
          Left = 3
          Top = 119
          Width = 398
          Height = 54
          BevelOuter = bvNone
          TabOrder = 3
          object Label109: TLabel
            Left = 8
            Top = 6
            Width = 22
            Height = 13
            Caption = 'PIS :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label110: TLabel
            Left = 85
            Top = 6
            Width = 45
            Height = 13
            Caption = 'COFINS :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label111: TLabel
            Left = 162
            Top = 6
            Width = 16
            Height = 13
            Caption = 'IR :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label112: TLabel
            Left = 239
            Top = 6
            Width = 67
            Height = 13
            Caption = 'Cont. Social :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label113: TLabel
            Left = 317
            Top = 6
            Width = 34
            Height = 13
            Caption = 'Outras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedtPIS: TDBEdit
            Left = 8
            Top = 22
            Width = 70
            Height = 21
            DataField = 'PIS'
            DataSource = DS_T_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object dbedtCOFINS: TDBEdit
            Left = 85
            Top = 22
            Width = 70
            Height = 21
            DataField = 'COFINS'
            DataSource = DS_T_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dbedtIR: TDBEdit
            Left = 161
            Top = 22
            Width = 70
            Height = 21
            DataField = 'IR'
            DataSource = DS_T_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object dbedtCONT_SOCIAL: TDBEdit
            Left = 239
            Top = 22
            Width = 70
            Height = 21
            DataField = 'CONT_SOCIAL'
            DataSource = DS_T_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object dbedtOUTRAS: TDBEdit
            Left = 317
            Top = 22
            Width = 70
            Height = 21
            DataField = 'OUTRAS'
            DataSource = DS_T_E
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
    end
  end
  object Button1: TButton
    Left = 479
    Top = 13
    Width = 186
    Height = 25
    Caption = 'Cadastro de CFOP'
    TabOrder = 2
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 45
    Caption = ' Produto '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbproduto: TLabel
      Left = 15
      Top = 17
      Width = 53
      Height = 13
      Caption = 'lbproduto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 374
    Width = 173
    Height = 25
    Caption = 'Confirmar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 343
    Width = 173
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object SqlsPRODUTO_T_E: TFDUpdateSQL
    Connection = DM.IBDatabase
    InsertSQL.Strings = (
      'insert into PRODUTO_TRIBUTACOES_ENT'
      
        '  (AGREG_DENTRO, COD_CFOP_DENTRO, COD_CFOP_FORA, COD_EMP, COD_PR' +
        'OD, COFINS, '
      
        '   CONT_SOCIAL, CSOSN, CST_COFINS, CST_DENTRO, CST_FORA, CST_IPI' +
        ', CST_PIS, '
      
        '   ICMS_DENTRO, ICMS_FORA, IPI_DENTRO, IPI_FORA, IR, ISENTO_PIS_' +
        'COFINS, '
      
        '   ORIGEM, OUTRAS, PIS, REDU_ICMS_DENTRO, REDU_ICMS_FORA, TEM_SU' +
        'BSTITUICAO)'
      'values'
      
        '  (:AGREG_DENTRO, :COD_CFOP_DENTRO, :COD_CFOP_FORA, :COD_EMP, :C' +
        'OD_PROD, '
      
        '   :COFINS, :CONT_SOCIAL, :CSOSN, :CST_COFINS, :CST_DENTRO, :CST' +
        '_FORA, '
      
        '   :CST_IPI, :CST_PIS, :ICMS_DENTRO, :ICMS_FORA, :IPI_DENTRO, :I' +
        'PI_FORA, '
      
        '   :IR, :ISENTO_PIS_COFINS, :ORIGEM, :OUTRAS, :PIS, :REDU_ICMS_D' +
        'ENTRO, '
      '   :REDU_ICMS_FORA, :TEM_SUBSTITUICAO)')
    ModifySQL.Strings = (
      'update PRODUTO_TRIBUTACOES_ENT'
      'set'
      '  AGREG_DENTRO = :AGREG_DENTRO,'
      '  COD_CFOP_DENTRO = :COD_CFOP_DENTRO,'
      '  COD_CFOP_FORA = :COD_CFOP_FORA,'
      '  COD_EMP = :COD_EMP,'
      '  COD_PROD = :COD_PROD,'
      '  COFINS = :COFINS,'
      '  CONT_SOCIAL = :CONT_SOCIAL,'
      '  CSOSN = :CSOSN,'
      '  CST_COFINS = :CST_COFINS,'
      '  CST_DENTRO = :CST_DENTRO,'
      '  CST_FORA = :CST_FORA,'
      '  CST_IPI = :CST_IPI,'
      '  CST_PIS = :CST_PIS,'
      '  ICMS_DENTRO = :ICMS_DENTRO,'
      '  ICMS_FORA = :ICMS_FORA,'
      '  IPI_DENTRO = :IPI_DENTRO,'
      '  IPI_FORA = :IPI_FORA,'
      '  IR = :IR,'
      '  ISENTO_PIS_COFINS = :ISENTO_PIS_COFINS,'
      '  ORIGEM = :ORIGEM,'
      '  OUTRAS = :OUTRAS,'
      '  PIS = :PIS,'
      '  REDU_ICMS_DENTRO = :REDU_ICMS_DENTRO,'
      '  REDU_ICMS_FORA = :REDU_ICMS_FORA,'
      '  TEM_SUBSTITUICAO = :TEM_SUBSTITUICAO'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_PROD = :OLD_COD_PROD')
    DeleteSQL.Strings = (
      'delete from PRODUTO_TRIBUTACOES_ENT'
      'where'
      '  COD_EMP = :OLD_COD_EMP and'
      '  COD_PROD = :OLD_COD_PROD')
    FetchRowSQL.Strings = (
      'Select '
      '  COD,'
      '  COD_PROD,'
      '  ORIGEM,'
      '  ICMS_DENTRO,'
      '  CST_DENTRO,'
      '  IPI_DENTRO,'
      '  REDU_ICMS_DENTRO,'
      '  TEM_SUBSTITUICAO,'
      '  AGREG_DENTRO,'
      '  ICMS_FORA,'
      '  CST_FORA,'
      '  IPI_FORA,'
      '  REDU_ICMS_FORA,'
      '  CST_IPI,'
      '  CSOSN,'
      '  CST_PIS,'
      '  CST_COFINS,'
      '  ISENTO_PIS_COFINS,'
      '  PIS,'
      '  COFINS,'
      '  IR,'
      '  CONT_SOCIAL,'
      '  OUTRAS,'
      '  COD_EMP,'
      '  COD_CFOP_DENTRO,'
      '  COD_CFOP_FORA'
      'from PRODUTO_TRIBUTACOES_ENT '
      'where'
      '  COD_EMP = :COD_EMP and'
      '  COD_PROD = :COD_PROD')
    Left = 520
    Top = 232
  end
  object PRODUTO_T_E: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTransaction1
    UpdateObject = SqlsPRODUTO_T_E
    SQL.Strings = (
      
        'select * from PRODUTO_TRIBUTACOES_ENT where COD_PROD=:COD_PRO an' +
        'd COD_EMP=:COD_EMP')
    Left = 528
    Top = 280
    ParamData = <
      item
        Name = 'COD_PRO'
      end
      item
        Name = 'COD_EMP'
      end>
    object PRODUTO_T_ECOD: TIntegerField
      FieldName = 'COD'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object PRODUTO_T_ECOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_PROD"'
    end
    object PRODUTO_T_EORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ORIGEM"'
      Size = 1
    end
    object PRODUTO_T_EICMS_DENTRO: TIntegerField
      FieldName = 'ICMS_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ICMS_DENTRO"'
    end
    object PRODUTO_T_ECST_DENTRO: TStringField
      FieldName = 'CST_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_DENTRO"'
      Size = 2
    end
    object PRODUTO_T_EIPI_DENTRO: TFloatField
      FieldName = 'IPI_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IPI_DENTRO"'
    end
    object PRODUTO_T_EREDU_ICMS_DENTRO: TFloatField
      FieldName = 'REDU_ICMS_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."REDU_ICMS_DENTRO"'
    end
    object PRODUTO_T_ETEM_SUBSTITUICAO: TStringField
      FieldName = 'TEM_SUBSTITUICAO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."TEM_SUBSTITUICAO"'
      Size = 1
    end
    object PRODUTO_T_EAGREG_DENTRO: TFloatField
      FieldName = 'AGREG_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."AGREG_DENTRO"'
    end
    object PRODUTO_T_EICMS_FORA: TIntegerField
      FieldName = 'ICMS_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ICMS_FORA"'
    end
    object PRODUTO_T_ECST_FORA: TStringField
      FieldName = 'CST_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_FORA"'
      Size = 2
    end
    object PRODUTO_T_EIPI_FORA: TFloatField
      FieldName = 'IPI_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IPI_FORA"'
    end
    object PRODUTO_T_EREDU_ICMS_FORA: TFloatField
      FieldName = 'REDU_ICMS_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."REDU_ICMS_FORA"'
    end
    object PRODUTO_T_ECST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_IPI"'
      Size = 2
    end
    object PRODUTO_T_ECSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CSOSN"'
      Size = 3
    end
    object PRODUTO_T_ECST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_PIS"'
      Size = 2
    end
    object PRODUTO_T_ECST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CST_COFINS"'
      Size = 2
    end
    object PRODUTO_T_EISENTO_PIS_COFINS: TStringField
      FieldName = 'ISENTO_PIS_COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."ISENTO_PIS_COFINS"'
      Size = 1
    end
    object PRODUTO_T_EPIS: TFloatField
      FieldName = 'PIS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."PIS"'
    end
    object PRODUTO_T_ECOFINS: TFloatField
      FieldName = 'COFINS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COFINS"'
    end
    object PRODUTO_T_EIR: TFloatField
      FieldName = 'IR'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."IR"'
    end
    object PRODUTO_T_ECONT_SOCIAL: TFloatField
      FieldName = 'CONT_SOCIAL'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."CONT_SOCIAL"'
    end
    object PRODUTO_T_EOUTRAS: TFloatField
      FieldName = 'OUTRAS'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."OUTRAS"'
    end
    object PRODUTO_T_ECOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_EMP"'
    end
    object PRODUTO_T_ECOD_CFOP_DENTRO: TIntegerField
      FieldName = 'COD_CFOP_DENTRO'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_CFOP_DENTRO"'
    end
    object PRODUTO_T_ECOD_CFOP_FORA: TIntegerField
      FieldName = 'COD_CFOP_FORA'
      Origin = '"PRODUTO_TRIBUTACOES_ENT"."COD_CFOP_FORA"'
    end
  end
  object DS_T_E: TDataSource
    DataSet = PRODUTO_T_E
    Left = 560
    Top = 184
  end
  object IBTransaction1: TFDTransaction
    Connection = DM.IBDatabase
    Left = 512
    Top = 88
  end
end
