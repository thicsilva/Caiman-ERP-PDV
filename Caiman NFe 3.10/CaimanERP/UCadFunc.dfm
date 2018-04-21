inherited FrmCadFunc: TFrmCadFunc
  Left = 304
  Top = 230
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 330
  ClientWidth = 570
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 576
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 570
  end
  inherited Panel1: TPanel
    Width = 570
    Height = 249
    ExplicitWidth = 570
    ExplicitHeight = 249
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
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 48
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label7: TLabel
      Left = 8
      Top = 128
      Width = 31
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 192
      Top = 128
      Width = 36
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 392
      Top = 128
      Width = 35
      Height = 13
      Caption = 'Estado'
    end
    object Label10: TLabel
      Left = 447
      Top = 128
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label11: TLabel
      Left = 8
      Top = 168
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 136
      Top = 168
      Width = 60
      Height = 13
      Caption = 'Documento'
    end
    object Label5: TLabel
      Left = 312
      Top = 168
      Width = 44
      Height = 13
      Caption = 'Telefone'
    end
    object Label12: TLabel
      Left = 427
      Top = 168
      Width = 36
      Height = 13
      Caption = 'Celular'
    end
    object Label3: TLabel
      Left = 8
      Top = 208
      Width = 42
      Height = 13
      Caption = 'Contato'
    end
    object Label13: TLabel
      Left = 112
      Top = 8
      Width = 87
      Height = 13
      Caption = 'Data Admiss'#227'o(*)'
    end
    object Label14: TLabel
      Left = 216
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Data Demiss'#227'o'
    end
    object Image1: TImage
      Left = 440
      Top = 16
      Width = 120
      Height = 94
      AutoSize = True
      Center = True
    end
    object cod_func: TEdit
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
      Width = 397
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 60
      TabOrder = 3
    end
    object EdtEnd: TEdit
      Left = 8
      Top = 104
      Width = 397
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 4
    end
    object EdtBai: TEdit
      Left = 8
      Top = 144
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 30
      TabOrder = 5
    end
    object EdtCid: TEdit
      Left = 192
      Top = 144
      Width = 187
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 30
      TabOrder = 6
    end
    object ComboEst: TComboBox
      Left = 392
      Top = 144
      Width = 43
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
      Left = 447
      Top = 144
      Width = 64
      Height = 21
      Color = clSilver
      EditMask = '99999-999;1;_'
      MaxLength = 9
      TabOrder = 8
      Text = '     -   '
    end
    object EdtCPF: TMaskEdit
      Left = 8
      Top = 184
      Width = 105
      Height = 21
      Color = clSilver
      EditMask = '999.999.999-99;1;_'
      MaxLength = 14
      TabOrder = 9
      Text = '   .   .   -  '
      OnExit = EdtCPFExit
    end
    object EdtDoc: TEdit
      Left = 136
      Top = 184
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 20
      TabOrder = 10
    end
    object EdtTel: TMaskEdit
      Left = 312
      Top = 184
      Width = 89
      Height = 21
      Color = clSilver
      EditMask = '(27)9999-9999;1;_'
      MaxLength = 13
      TabOrder = 11
      Text = '(27)    -    '
    end
    object EdtCel: TMaskEdit
      Left = 427
      Top = 184
      Width = 86
      Height = 21
      Color = clSilver
      EditMask = '9999-9999;1;_'
      MaxLength = 9
      TabOrder = 12
      Text = '    -    '
    end
    object EdtObs: TEdit
      Left = 8
      Top = 224
      Width = 505
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 100
      TabOrder = 13
    end
    object EdtDataAdm: TMaskEdit
      Left = 112
      Top = 24
      Width = 78
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = EdtDataAdmExit
    end
    object EdtDataDem: TMaskEdit
      Left = 216
      Top = 24
      Width = 78
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = EdtDataDemExit
    end
  end
  inherited Panel2: TPanel
    Width = 570
    ExplicitWidth = 570
    inherited ToolBar1: TToolBar
      Width = 570
      Height = 104
      ExplicitWidth = 570
      ExplicitHeight = 104
      inherited BtnAlterar: TToolButton
        Wrap = True
        OnClick = BtnAlterarClick
      end
      inherited BtnExcluir: TToolButton
        Left = 0
        Top = 52
        ExplicitLeft = 0
        ExplicitTop = 52
      end
      inherited ToolButton6: TToolButton
        Left = 81
        Top = 52
        ExplicitLeft = 81
        ExplicitTop = 52
      end
      inherited BtnConsultar: TToolButton
        Left = 89
        Top = 52
        OnClick = BtnConsultarClick
        ExplicitLeft = 89
        ExplicitTop = 52
      end
      inherited BtnSair: TToolButton
        Left = 170
        Top = 52
        ExplicitLeft = 170
        ExplicitTop = 52
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 310
    Width = 570
    ExplicitTop = 310
    ExplicitWidth = 570
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBTRFunc: TFDTransaction
    Connection = DM.IBDatabase
    Left = 448
    Top = 48
  end
  object IBSQLFunc: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRFunc
    Left = 448
    Top = 104
  end
end
