inherited FrmCadTransp: TFrmCadTransp
  Left = 323
  Top = 258
  Caption = 'Cadastro de Transportadora'
  ClientHeight = 336
  ClientWidth = 532
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 538
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 532
    Height = 259
    ExplicitWidth = 532
    ExplicitHeight = 259
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 88
      Top = 8
      Width = 73
      Height = 13
      Caption = 'F'#237'sica/Jur'#237'dica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Nome(*)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 48
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 128
      Width = 36
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 341
      Top = 127
      Width = 35
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 168
      Width = 40
      Height = 13
      Caption = 'CNPJ(*)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 190
      Top = 168
      Width = 67
      Height = 13
      Caption = 'Insc.Estadual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 208
      Width = 84
      Height = 13
      Caption = 'Placa do Ve'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 128
      Top = 208
      Width = 81
      Height = 13
      Caption = 'Estado da Placa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 406
      Top = -3
      Width = 120
      Height = 120
      AutoSize = True
      Center = True
    end
    object cod_tra: TEdit
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
    object ComboFJ: TComboBox
      Left = 88
      Top = 24
      Width = 79
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 1
      OnChange = ComboFJChange
      Items.Strings = (
        'F'
        'J')
    end
    object EdtNome: TEdit
      Left = 8
      Top = 64
      Width = 387
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 2
    end
    object EdtEnd: TEdit
      Left = 8
      Top = 104
      Width = 387
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 3
    end
    object EdtCid: TEdit
      Left = 8
      Top = 144
      Width = 322
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 30
      TabOrder = 4
    end
    object ComboEst: TComboBox
      Left = 341
      Top = 143
      Width = 53
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 5
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
    object EdtCNPJ: TMaskEdit
      Left = 8
      Top = 184
      Width = 175
      Height = 21
      Color = clSilver
      EditMask = '99.999.999/9999-99;1;_'
      MaxLength = 18
      TabOrder = 6
      Text = '  .   .   /    -  '
    end
    object EdtDoc: TEdit
      Left = 190
      Top = 184
      Width = 207
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 7
    end
    object EdtPlaca: TEdit
      Left = 8
      Top = 224
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 10
      TabOrder = 8
    end
    object ComboUFPlaca: TComboBox
      Left = 128
      Top = 224
      Width = 49
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 9
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
  end
  inherited Panel2: TPanel
    Width = 532
    ExplicitWidth = 532
    inherited ToolBar1: TToolBar
      Width = 532
      ExplicitWidth = 532
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 316
    Width = 532
    ExplicitTop = 316
    ExplicitWidth = 532
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLTransp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRTransp
    Left = 312
    Top = 48
  end
  object IBTRTransp: TFDTransaction
    Connection = DM.IBDatabase
    Left = 208
    Top = 64
  end
end
