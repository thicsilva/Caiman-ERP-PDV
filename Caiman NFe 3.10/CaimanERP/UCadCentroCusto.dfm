inherited FrmCadCentroCusto: TFrmCadCentroCusto
  Left = 390
  Top = 357
  Caption = 'Cadastro Centro de Custo'
  ClientHeight = 224
  ClientWidth = 483
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 489
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 483
    Height = 147
    ExplicitWidth = 483
    ExplicitHeight = 147
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
      Width = 31
      Height = 13
      Caption = 'Conta'
    end
    object Label3: TLabel
      Left = 240
      Top = 48
      Width = 84
      Height = 13
      Caption = 'Receita/Despesa'
    end
    object Label4: TLabel
      Left = 8
      Top = 96
      Width = 153
      Height = 13
      Caption = 'Descri'#231#227'o do Centro de Custo'
    end
    object Label5: TLabel
      Left = 104
      Top = 48
      Width = 126
      Height = 13
      Caption = 'Tipo do Centro de Custo'
    end
    object Label6: TLabel
      Left = 368
      Top = 48
      Width = 77
      Height = 13
      Caption = 'D'#233'bito/Cr'#233'dito'
    end
    object codigo: TEdit
      Left = 8
      Top = 24
      Width = 64
      Height = 21
      TabStop = False
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
    object EdtConta: TMaskEdit
      Left = 8
      Top = 64
      Width = 73
      Height = 21
      Color = clSilver
      EditMask = '9.99.999;0;_'
      MaxLength = 8
      TabOrder = 1
      Text = ''
      OnExit = EdtContaExit
    end
    object ComboDR: TComboBox
      Left = 240
      Top = 64
      Width = 113
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 3
      Items.Strings = (
        'RECEITA'
        'DESPESA')
    end
    object EdtNome: TEdit
      Left = 8
      Top = 112
      Width = 465
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 80
      TabOrder = 5
    end
    object ComboTipo: TComboBox
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 2
      Items.Strings = (
        'ANAL'#205'TICA'
        'SINT'#201'TICA')
    end
    object ComboDC: TComboBox
      Left = 368
      Top = 64
      Width = 105
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 4
      Items.Strings = (
        'D'#201'BITO'
        'CR'#201'DITO')
    end
  end
  inherited Panel2: TPanel
    Width = 483
    ExplicitWidth = 483
    inherited ToolBar1: TToolBar
      Width = 483
      ExplicitWidth = 483
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 204
    Width = 483
    ExplicitTop = 204
    ExplicitWidth = 483
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCusto: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCusto
    Left = 368
    Top = 8
  end
  object IBTRCusto: TFDTransaction
    Connection = DM.IBDatabase
    Left = 488
    Top = 8
  end
end
