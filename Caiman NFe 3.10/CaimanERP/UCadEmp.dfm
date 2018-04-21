inherited FrmCadEmp: TFrmCadEmp
  Left = 482
  Top = 246
  Caption = 'Cadastro de Empresa'
  ClientHeight = 411
  ClientWidth = 608
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 614
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 608
  end
  inherited Panel1: TPanel
    Width = 608
    Height = 330
    ExplicitWidth = 608
    ExplicitHeight = 330
    object PC: TPageControl
      Left = 0
      Top = 0
      Width = 608
      Height = 330
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitTop = 3
      object TabSheet1: TTabSheet
        Caption = 'Dados'
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
          Width = 75
          Height = 13
          Caption = 'Raz'#227'o Social(*)'
        end
        object Label6: TLabel
          Left = 8
          Top = 128
          Width = 48
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label7: TLabel
          Left = 8
          Top = 168
          Width = 31
          Height = 13
          Caption = 'Bairro'
        end
        object Label11: TLabel
          Left = 8
          Top = 208
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object Label12: TLabel
          Left = 160
          Top = 208
          Width = 67
          Height = 13
          Caption = 'Insc.Estadual'
        end
        object Label8: TLabel
          Left = 192
          Top = 168
          Width = 36
          Height = 13
          Caption = 'Cidade'
        end
        object Label9: TLabel
          Left = 432
          Top = 168
          Width = 35
          Height = 13
          Caption = 'Estado'
        end
        object Label10: TLabel
          Left = 512
          Top = 168
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label13: TLabel
          Left = 432
          Top = 208
          Width = 44
          Height = 13
          Caption = 'Telefone'
        end
        object Label3: TLabel
          Left = 513
          Top = 208
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label5: TLabel
          Left = 8
          Top = 248
          Width = 64
          Height = 13
          Caption = 'Respons'#225'vel'
        end
        object Label14: TLabel
          Left = 432
          Top = 128
          Width = 41
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label17: TLabel
          Left = 8
          Top = 88
          Width = 43
          Height = 13
          Caption = 'Fantasia'
        end
        object Label19: TLabel
          Left = 272
          Top = 208
          Width = 74
          Height = 13
          Caption = 'Insc.Municipal'
        end
        object Image1: TImage
          Left = 448
          Top = 0
          Width = 120
          Height = 120
          AutoSize = True
          Center = True
        end
        object sSpeedButton1: TsSpeedButton
          Left = 130
          Top = 220
          Width = 25
          Height = 24
          Hint = 'Localizar'
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
          OnClick = sSpeedButton1Click
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object cod_emp: TEdit
          Left = 8
          Top = 24
          Width = 51
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
          Width = 403
          Height = 21
          CharCase = ecUpperCase
          Color = 16053492
          MaxLength = 60
          TabOrder = 1
        end
        object EdtEnd: TEdit
          Left = 8
          Top = 144
          Width = 403
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 50
          TabOrder = 3
        end
        object EdtBai: TEdit
          Left = 8
          Top = 184
          Width = 169
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 5
        end
        object EdtCNPJ: TMaskEdit
          Left = 8
          Top = 224
          Width = 114
          Height = 21
          Color = clSilver
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          TabOrder = 9
          Text = ''
          OnExit = EdtCNPJExit
          OnKeyDown = EdtCNPJKeyDown
        end
        object EdtInsc: TEdit
          Left = 160
          Top = 224
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 20
          TabOrder = 10
        end
        object EdtCid: TEdit
          Left = 192
          Top = 184
          Width = 219
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 6
        end
        object ComboEst: TComboBox
          Left = 432
          Top = 184
          Width = 66
          Height = 21
          Style = csDropDownList
          Color = clSilver
          TabOrder = 7
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object EdtCep: TMaskEdit
          Left = 512
          Top = 184
          Width = 80
          Height = 21
          Color = clSilver
          EditMask = '99999-999;1;_'
          MaxLength = 9
          TabOrder = 8
          Text = '     -   '
        end
        object EdtResp: TEdit
          Left = 8
          Top = 264
          Width = 403
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 50
          TabOrder = 14
        end
        object EdtNumero: TEdit
          Left = 432
          Top = 144
          Width = 68
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 10
          TabOrder = 4
        end
        object EdtFant: TEdit
          Left = 8
          Top = 101
          Width = 403
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 50
          TabOrder = 2
        end
        object EdtTel: TEdit
          Left = 432
          Top = 224
          Width = 67
          Height = 21
          Color = clSilver
          TabOrder = 12
        end
        object EdtFax: TEdit
          Left = 513
          Top = 224
          Width = 81
          Height = 21
          Color = clSilver
          TabOrder = 13
          OnKeyPress = EdtCodEmpCustoKeyPress
        end
        object EdtInscMunicipal: TEdit
          Left = 272
          Top = 224
          Width = 139
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 20
          TabOrder = 11
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Par'#226'metros'
        ImageIndex = 1
        object Label4: TLabel
          Left = 8
          Top = 128
          Width = 75
          Height = 13
          Caption = 'Abrev.Etiqueta'
        end
        object Label15: TLabel
          Left = 8
          Top = 48
          Width = 84
          Height = 13
          Caption = 'Tipo de Empresa'
        end
        object Label16: TLabel
          Left = 144
          Top = 128
          Width = 114
          Height = 13
          Caption = 'Tipo de Carga Balan'#231'a'
        end
        object Label18: TLabel
          Left = 8
          Top = 88
          Width = 145
          Height = 13
          Caption = 'Caminho Validador Sintegra'
        end
        object EdtEtq: TEdit
          Left = 8
          Top = 144
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 15
          TabOrder = 4
        end
        object CheckSitCli: TCheckBox
          Left = 8
          Top = 8
          Width = 241
          Height = 17
          Caption = 'Mostrar Situa'#231#227'o do Cliente nas Pre-Vendas'
          TabOrder = 0
        end
        object CheckCPF: TCheckBox
          Left = 8
          Top = 24
          Width = 201
          Height = 17
          Caption = 'Cadastrar Cliente sem CPF'
          TabOrder = 1
        end
        object ComboTipoEmp: TComboBox
          Left = 8
          Top = 64
          Width = 353
          Height = 21
          Style = csDropDownList
          Color = clSilver
          TabOrder = 2
          Items.Strings = (
            'SIMPLES NACIONAL'
            'LUCRO REAL'
            'LUCRO PRESUMIDO')
        end
        object ComboTipoCarga: TComboBox
          Left = 144
          Top = 144
          Width = 161
          Height = 21
          Style = csDropDownList
          Color = clSilver
          TabOrder = 5
          Items.Strings = (
            'POR PRODUTO'
            'POR COD.DE BARRA')
        end
        object EdtCaminhoValidador: TEdit
          Left = 8
          Top = 104
          Width = 353
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 80
          TabOrder = 3
        end
        object BtnCaminhoValidador: TButton
          Left = 368
          Top = 104
          Width = 22
          Height = 21
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = BtnCaminhoValidadorClick
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 179
          Width = 580
          Height = 121
          Caption = 'EFD'
          TabOrder = 6
          object Label21: TLabel
            Left = 8
            Top = 24
            Width = 26
            Height = 13
            Caption = 'Perfil'
          end
          object Label22: TLabel
            Left = 64
            Top = 24
            Width = 106
            Height = 13
            Caption = 'C'#243'd.Munic'#237'pio(IBGE)'
          end
          object Label23: TLabel
            Left = 8
            Top = 64
            Width = 125
            Height = 13
            Caption = 'Indicador Tipo Atividade'
          end
          object Label24: TLabel
            Left = 260
            Top = 82
            Width = 90
            Height = 13
            Caption = '* Perfil (A, B ou C)'
          end
          object Label25: TLabel
            Left = 164
            Top = 98
            Width = 201
            Height = 13
            Caption = '* Tipo Atividade (0-Industrial  1-Outros)'
          end
          object BtnConsCidade: TsSpeedButton
            Left = 173
            Top = 40
            Width = 23
            Height = 21
            Hint = 'Consultar'
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
            OnClick = BtnConsCidadeClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object Label20: TLabel
            Left = 208
            Top = 24
            Width = 133
            Height = 13
            Caption = 'Vers'#227'o Layout EFD - Fiscal'
          end
          object EdtPerfilEFD: TEdit
            Left = 8
            Top = 40
            Width = 33
            Height = 21
            Color = clSilver
            MaxLength = 1
            TabOrder = 0
          end
          object EdtCodigoMunicipio: TEdit
            Left = 64
            Top = 40
            Width = 105
            Height = 21
            Color = clSilver
            MaxLength = 7
            TabOrder = 1
          end
          object EdtTipoAtividadeEFD: TEdit
            Left = 8
            Top = 80
            Width = 33
            Height = 21
            Color = clSilver
            MaxLength = 1
            TabOrder = 2
          end
          object BConfigEFD: TButton
            Left = 438
            Top = 93
            Width = 139
            Height = 25
            Caption = 'Config. EFD Pis Cofins'
            TabOrder = 3
            OnClick = BConfigEFDClick
          end
          object edtVersaoEFD: TComboBox
            Left = 208
            Top = 40
            Width = 145
            Height = 21
            Style = csDropDownList
            TabOrder = 4
            Items.Strings = (
              'Mais Novo'
              '1.0.3'
              '1.0.4'
              '1.0.5'
              '1.0.8')
          end
        end
      end
      object Contador: TTabSheet
        Caption = 'Contador'
        ImageIndex = 3
        object Label26: TLabel
          Left = 8
          Top = 8
          Width = 30
          Height = 13
          Caption = 'Nome'
        end
        object Label27: TLabel
          Left = 8
          Top = 48
          Width = 48
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label28: TLabel
          Left = 72
          Top = 88
          Width = 31
          Height = 13
          Caption = 'Bairro'
        end
        object Label29: TLabel
          Left = 429
          Top = 88
          Width = 76
          Height = 13
          Caption = 'C'#243'd.Munic'#237'pio'
        end
        object Label31: TLabel
          Left = 521
          Top = 88
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label32: TLabel
          Left = 8
          Top = 88
          Width = 41
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label33: TLabel
          Left = 135
          Top = 128
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label34: TLabel
          Left = 328
          Top = 128
          Width = 44
          Height = 13
          Caption = 'Telefone'
        end
        object Label35: TLabel
          Left = 440
          Top = 128
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label30: TLabel
          Left = 237
          Top = 128
          Width = 21
          Height = 13
          Caption = 'CRC'
        end
        object Label36: TLabel
          Left = 8
          Top = 128
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object Label37: TLabel
          Left = 8
          Top = 168
          Width = 27
          Height = 13
          Caption = 'Email'
        end
        object EdtNomeContador: TEdit
          Left = 8
          Top = 24
          Width = 580
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 80
          TabOrder = 0
        end
        object EdtEndContador: TEdit
          Left = 8
          Top = 64
          Width = 580
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 60
          TabOrder = 1
        end
        object EdtBairroContador: TEdit
          Left = 73
          Top = 104
          Width = 347
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 50
          TabOrder = 3
        end
        object EdtCodMunContador: TEdit
          Left = 429
          Top = 104
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 7
          TabOrder = 4
        end
        object EdtCEPContador: TMaskEdit
          Left = 521
          Top = 104
          Width = 68
          Height = 21
          Color = clSilver
          EditMask = '99999-999;1;_'
          MaxLength = 9
          TabOrder = 5
          Text = '     -   '
        end
        object EdtNumeroContador: TEdit
          Left = 8
          Top = 104
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 10
          TabOrder = 2
        end
        object EdtCPFContador: TMaskEdit
          Left = 135
          Top = 144
          Width = 97
          Height = 21
          Color = clSilver
          EditMask = '999.999.999-99;0;_'
          MaxLength = 14
          TabOrder = 7
          Text = ''
          OnExit = EdtCNPJExit
        end
        object EdtTelContador: TEdit
          Left = 328
          Top = 144
          Width = 89
          Height = 21
          Color = clSilver
          MaxLength = 10
          TabOrder = 9
          OnKeyPress = EdtCodEmpCustoKeyPress
        end
        object EdtFaxContador: TEdit
          Left = 440
          Top = 144
          Width = 81
          Height = 21
          Color = clSilver
          MaxLength = 10
          TabOrder = 10
          OnKeyPress = EdtCodEmpCustoKeyPress
        end
        object EdtCRCContador: TEdit
          Left = 237
          Top = 144
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 15
          TabOrder = 8
        end
        object EdtCNPJContador: TMaskEdit
          Left = 8
          Top = 144
          Width = 121
          Height = 21
          Color = clSilver
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          TabOrder = 6
          Text = ''
          OnExit = EdtCNPJExit
        end
        object edtEmailContador: TEdit
          Left = 8
          Top = 184
          Width = 580
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 80
          TabOrder = 11
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Imagem'
        ImageIndex = 2
        object GroupBox6: TGroupBox
          Left = 8
          Top = 12
          Width = 337
          Height = 209
          Caption = 'Foto'
          TabOrder = 0
          object BtnLimpa: TBitBtn
            Left = 248
            Top = 104
            Width = 75
            Height = 25
            Caption = '&Limpa'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
              0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
              DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
              0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
              00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
              32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
              00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
              0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 0
            OnClick = BtnLimpaClick
          end
          object Panel3: TPanel
            Left = 8
            Top = 16
            Width = 225
            Height = 185
            BevelOuter = bvNone
            BevelWidth = 4
            TabOrder = 1
            object Image: TImage
              Left = 0
              Top = 0
              Width = 225
              Height = 185
              Align = alClient
              Stretch = True
              ExplicitLeft = 4
              ExplicitTop = 4
              ExplicitWidth = 217
              ExplicitHeight = 177
            end
          end
          object BtnFoto: TBitBtn
            Left = 248
            Top = 64
            Width = 75
            Height = 25
            Caption = '&Foto'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF29ABD735B3DC23A9D7FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
              AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF29ABD7A6E9F59EFFFF97FCFF99FBFF95F7FF8D
              F2FE83EAFA49C2E449C2E43AB8DFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
              8BD7ECABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF52DAF
              DBFF00FFFF00FFFF00FFFF00FF29ABD729ABD7AAF0FA91FAFF91F6FF90F5FF8E
              F4FF8DF2FE8BF1FE8CF1FF77DFF656CAEAFF00FFFF00FFFF00FFFF00FF29ABD7
              7BE5F429ABD79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF72DDF50571
              0A2CB0DAFF00FFFF00FFFF00FF29ABD793F9FD29ABD7A8E9F5A8F0FAA4F1FBA1
              F7FF8CF3FF8AF1FE05710A1A8E2B0EA31B05710AFF00FFFF00FFFF00FF29ABD7
              9DFEFF86F2FB29ABD729ABD729ABD729ABD7AFF2FB0C84140EA31B0EA31B0EA3
              1B2DB0471FA8D6FF00FFFF00FF29ABD79AFCFF96FBFF95FBFF95FAFF90F7FF6C
              DEF3087E100C84140975130EA31B0EA31B0EA31B148D23FF00FFFF00FF29ABD7
              9BFDFF94FAFF92F8FF91F6FF92F7FF93F9FF84EFFD29ABD709751324B53B0571
              0A05710A05710AFF00FFFF00FF29ABD7A4FFFF94FCFF92F9FF93F8FF8FEDFA90
              ECFA95EEFC96F1FD087E1042CE6705710A08831005710AFF00FFFF00FF25A8D6
              29ABD79EF5FB9FF7FD05710A2BAED925A8D628ABD7087E1058E08758E0870571
              0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD730AED92CADD805710A58
              E08758E08758E08705710A05710A08810FFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF05710A05710A05710A087E10067A0DFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 2
            OnClick = BtnFotoClick
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 608
    ExplicitWidth = 608
    inherited ToolBar1: TToolBar
      Width = 608
      ExplicitWidth = 608
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 391
    Width = 608
    ExplicitTop = 391
    ExplicitWidth = 608
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLEmp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREmp
    Left = 416
  end
  object IBTREmp: TFDTransaction
    Connection = DM.IBDatabase
    Left = 472
  end
  object OpenPicture: TOpenPictureDialog
    Left = 528
  end
  object OpenDialog: TOpenDialog
    Left = 304
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 296
    Top = 208
  end
end
