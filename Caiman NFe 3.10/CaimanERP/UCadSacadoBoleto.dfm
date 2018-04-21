inherited frmCadSacadoBoleto: TfrmCadSacadoBoleto
  Caption = 'Cadastro de Cedentes'
  ClientHeight = 401
  ClientWidth = 615
  OnShow = FormShow
  ExplicitWidth = 621
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 615
  end
  inherited Panel1: TPanel
    Width = 615
    Height = 320
    ExplicitWidth = 615
    ExplicitHeight = 320
    object pgc1: TPageControl
      Left = 0
      Top = 0
      Width = 615
      Height = 320
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados Sacado'
        object Label11: TLabel
          Left = 9
          Top = 83
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object Label2: TLabel
          Left = 9
          Top = 45
          Width = 75
          Height = 13
          Caption = 'Raz'#227'o Social(*)'
        end
        object Label6: TLabel
          Left = 9
          Top = 128
          Width = 48
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label14: TLabel
          Left = 433
          Top = 128
          Width = 41
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label7: TLabel
          Left = 9
          Top = 168
          Width = 31
          Height = 13
          Caption = 'Bairro'
        end
        object Label8: TLabel
          Left = 193
          Top = 168
          Width = 36
          Height = 13
          Caption = 'Cidade'
        end
        object Label9: TLabel
          Left = 433
          Top = 168
          Width = 35
          Height = 13
          Caption = 'Estado'
        end
        object Label10: TLabel
          Left = 513
          Top = 168
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label1: TLabel
          Left = 9
          Top = 1
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
        end
        object EdtCNPJ: TMaskEdit
          Left = 9
          Top = 99
          Width = 118
          Height = 21
          Color = clSilver
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          TabOrder = 2
          Text = ''
        end
        object EdtNome: TEdit
          Left = 9
          Top = 61
          Width = 403
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 60
          TabOrder = 1
        end
        object EdtNumero: TEdit
          Left = 433
          Top = 144
          Width = 67
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 10
          TabOrder = 4
        end
        object EdtEnd: TEdit
          Left = 9
          Top = 144
          Width = 402
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 50
          TabOrder = 3
        end
        object EdtBai: TEdit
          Left = 9
          Top = 184
          Width = 168
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 5
        end
        object EdtCid: TEdit
          Left = 193
          Top = 184
          Width = 218
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 6
        end
        object ComboEst: TComboBox
          Left = 433
          Top = 184
          Width = 65
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
          Left = 513
          Top = 184
          Width = 80
          Height = 21
          Color = clSilver
          EditMask = '99999-999;1;_'
          MaxLength = 9
          TabOrder = 8
          Text = '     -   '
        end
        object COD: TEdit
          Left = 9
          Top = 18
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
      end
      object TabSheet2: TTabSheet
        Caption = 'Dados Cedente'
        ImageIndex = 1
        object Label3: TLabel
          Left = 11
          Top = 3
          Width = 32
          Height = 13
          Caption = 'Banco'
        end
        object Label4: TLabel
          Left = 169
          Top = 3
          Width = 101
          Height = 13
          Caption = 'Descri'#231#227'o do Banco'
        end
        object Label5: TLabel
          Left = 11
          Top = 43
          Width = 47
          Height = 13
          Caption = 'Ag'#234'ncia :'
        end
        object Label12: TLabel
          Left = 119
          Top = 43
          Width = 51
          Height = 13
          Caption = 'A. Digito :'
        end
        object Label13: TLabel
          Left = 367
          Top = 43
          Width = 90
          Height = 13
          Caption = 'C'#243'digo Cedente :'
        end
        object Label15: TLabel
          Left = 187
          Top = 43
          Width = 37
          Height = 13
          Caption = 'Conta :'
        end
        object Label16: TLabel
          Left = 295
          Top = 43
          Width = 51
          Height = 13
          Caption = 'C. Digito :'
        end
        object Label17: TLabel
          Left = 119
          Top = 82
          Width = 109
          Height = 13
          Caption = 'Local de Pagamento :'
        end
        object Label18: TLabel
          Left = 13
          Top = 123
          Width = 137
          Height = 13
          Caption = 'Instru'#231#245'es de pagamento :'
        end
        object Label19: TLabel
          Left = 13
          Top = 166
          Width = 92
          Height = 13
          Caption = 'Multa por atrazo :'
        end
        object Label20: TLabel
          Left = 115
          Top = 166
          Width = 109
          Height = 13
          Caption = 'Valor por dia Atrazo :'
        end
        object Label21: TLabel
          Left = 227
          Top = 167
          Width = 67
          Height = 13
          Caption = 'Esp'#233'cie Doc.:'
        end
        object Label22: TLabel
          Left = 300
          Top = 167
          Width = 83
          Height = 13
          Caption = 'Esp'#233'cie Moeda :'
        end
        object Label24: TLabel
          Left = 104
          Top = 206
          Width = 76
          Height = 13
          Caption = 'Nosso N'#250'mero'
        end
        object Label23: TLabel
          Left = 13
          Top = 207
          Width = 40
          Height = 13
          Caption = 'Carteira'
        end
        object Label25: TLabel
          Left = 13
          Top = 250
          Width = 74
          Height = 13
          Caption = 'Dias Protesto :'
        end
        object Label26: TLabel
          Left = 412
          Top = 250
          Width = 88
          Height = 13
          Caption = 'Numero Remessa'
        end
        object Label27: TLabel
          Left = 11
          Top = 83
          Width = 55
          Height = 13
          Caption = 'Convenio :'
        end
        object edtBanco: TComboBox
          Left = 11
          Top = 19
          Width = 145
          Height = 21
          Color = clSilver
          TabOrder = 0
          Text = '001'
          OnChange = edtBancoChange
          OnExit = edtBancoExit
          Items.Strings = (
            '001'
            '004'
            '021'
            '033'
            '041'
            '070'
            '1042'
            '237'
            '341'
            '389'
            '748'
            '756'
            '399')
        end
        object edtDescBanco: TEdit
          Left = 169
          Top = 19
          Width = 328
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 100
          ReadOnly = True
          TabOrder = 1
        end
        object edtAgencia: TEdit
          Left = 11
          Top = 59
          Width = 102
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 2
        end
        object edtAgenciaDigito: TEdit
          Left = 119
          Top = 59
          Width = 58
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 10
          TabOrder = 3
        end
        object edtCedente: TEdit
          Left = 367
          Top = 59
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 6
        end
        object edtConta: TEdit
          Left = 187
          Top = 59
          Width = 102
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 4
        end
        object edtContaDigito: TEdit
          Left = 295
          Top = 59
          Width = 58
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 10
          TabOrder = 5
        end
        object edtLocalPagamento: TEdit
          Left = 119
          Top = 99
          Width = 378
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 200
          TabOrder = 8
        end
        object edtInstrucoes: TEdit
          Left = 13
          Top = 139
          Width = 484
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 255
          TabOrder = 9
        end
        object edtMulta: TCurrencyEdit
          Left = 13
          Top = 183
          Width = 85
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Color = clSilver
          DisplayFormat = '% ,0.00;'
          TabOrder = 10
        end
        object edtoValorDia: TCurrencyEdit
          Left = 115
          Top = 183
          Width = 106
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Color = clSilver
          TabOrder = 11
        end
        object edtEspecie: TEdit
          Left = 227
          Top = 183
          Width = 67
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 12
        end
        object edtMoeda: TEdit
          Left = 300
          Top = 183
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 13
        end
        object edtNossoNumero: TCurrencyEdit
          Left = 104
          Top = 223
          Width = 85
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Color = clSilver
          DisplayFormat = '0;'
          TabOrder = 16
        end
        object rgAceite: TRadioGroup
          Left = 386
          Top = 166
          Width = 111
          Height = 38
          Caption = ' Aceite '
          Columns = 2
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 14
        end
        object edtCarteira: TEdit
          Left = 13
          Top = 223
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 15
        end
        object rgTipoImpressao: TRadioGroup
          Left = 206
          Top = 210
          Width = 291
          Height = 38
          Caption = ' Tipo de Impressao '
          Columns = 3
          Items.Strings = (
            'Boleto Normal'
            'Boleto Carne'
            'Boleto Extrato')
          TabOrder = 17
        end
        object rgLayout: TRadioGroup
          Left = 104
          Top = 250
          Width = 276
          Height = 38
          Caption = ' Layout Remessa '
          Columns = 3
          Items.Strings = (
            'CNAB 240'
            'CNAB 400'
            'Sem Remessa')
          TabOrder = 18
        end
        object edtDiasProtesto: TCurrencyEdit
          Left = 13
          Top = 267
          Width = 85
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Color = clSilver
          DisplayFormat = '0;'
          TabOrder = 19
        end
        object edtRemessas: TCurrencyEdit
          Left = 411
          Top = 267
          Width = 85
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Color = clSilver
          DisplayFormat = '0;'
          TabOrder = 20
        end
        object edtConvenio: TEdit
          Left = 11
          Top = 99
          Width = 102
          Height = 21
          CharCase = ecUpperCase
          Color = clSilver
          MaxLength = 30
          TabOrder = 7
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 615
    ExplicitWidth = 615
    inherited ToolBar1: TToolBar
      Width = 615
      ExplicitWidth = 615
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 381
    Width = 615
    ExplicitTop = 381
    ExplicitWidth = 615
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLSacado: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRSacado
    Left = 472
    Top = 16
  end
  object IBTRSacado: TFDTransaction
    Connection = DM.IBDatabase
    Left = 536
    Top = 16
  end
end
