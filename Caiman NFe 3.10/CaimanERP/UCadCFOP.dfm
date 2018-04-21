inherited FrmCadCFOP: TFrmCadCFOP
  Left = 291
  Top = 156
  Caption = 'Cadastro de CFOP'
  ClientHeight = 392
  ClientWidth = 533
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 539
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 533
  end
  inherited Panel1: TPanel
    Width = 533
    Height = 311
    ExplicitWidth = 533
    ExplicitHeight = 315
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Codigo'
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object EdtCod: TMaskEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      Color = clYellow
      EditMask = '0.000;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object EdtNome: TEdit
      Left = 8
      Top = 104
      Width = 510
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 200
      TabOrder = 5
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 136
      Width = 513
      Height = 141
      Caption = 'Informa'#231#245'es Complementares da Nota Fiscal'
      TabOrder = 6
      object MemoObs: TMemo
        Left = 2
        Top = 15
        Width = 509
        Height = 124
        Align = alClient
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        TabOrder = 0
        OnEnter = MemoObsEnter
        OnExit = MemoObsExit
        OnKeyPress = MemoObsKeyPress
      end
    end
    object CheckICMS: TCheckBox
      Left = 120
      Top = 7
      Width = 185
      Height = 17
      Caption = 'Destaca ICMS'
      TabOrder = 1
    end
    object CheckRelAliq: TCheckBox
      Left = 120
      Top = 39
      Width = 409
      Height = 17
      Caption = 
        'Sair no Relat'#243'rio de Resumo por Al'#237'quota e no Rel.Isentas de Pis' +
        '/Cofins'
      TabOrder = 3
    end
    object CheckCupomFiscal: TCheckBox
      Left = 120
      Top = 55
      Width = 353
      Height = 17
      Caption = 'Decorrente de Cupom Fiscal'
      TabOrder = 4
    end
    object CheckPisCofins: TCheckBox
      Left = 120
      Top = 23
      Width = 185
      Height = 17
      Caption = 'Pis Cofins'
      TabOrder = 2
    end
    object CheckCSOSN: TCheckBox
      Left = 120
      Top = 72
      Width = 185
      Height = 17
      Caption = 'Usar CSOSN'
      TabOrder = 7
    end
    object btnTributacoes: TButton
      Left = 392
      Top = 283
      Width = 129
      Height = 25
      Caption = 'Tributa'#231#245'es'
      Enabled = False
      TabOrder = 8
      OnClick = btnTributacoesClick
    end
  end
  inherited Panel2: TPanel
    Width = 533
    ExplicitWidth = 533
    inherited ToolBar1: TToolBar
      Width = 533
      ExplicitWidth = 533
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 372
    Width = 533
    ExplicitTop = 372
    ExplicitWidth = 533
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLCFOP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRCFOP
    Left = 344
    Top = 8
  end
  object IBTRCFOP: TFDTransaction
    Connection = DM.IBDatabase
    Left = 488
    Top = 8
  end
end
