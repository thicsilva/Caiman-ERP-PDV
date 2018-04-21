inherited FrmCadGICMS: TFrmCadGICMS
  Left = 527
  Top = 347
  Caption = 'Cadastro de Grupo de ICMS'
  ClientHeight = 257
  ClientWidth = 409
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 415
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 409
    Height = 180
    ExplicitWidth = 409
    ExplicitHeight = 180
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 8
      Top = 96
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 8
      Top = 136
      Width = 59
      Height = 13
      Caption = 'Al'#237'quota(%)'
    end
    object Label4: TLabel
      Left = 112
      Top = 56
      Width = 22
      Height = 13
      Caption = 'Tipo'
    end
    object Label5: TLabel
      Left = 80
      Top = 136
      Width = 18
      Height = 13
      Caption = 'CST'
    end
    object Label6: TLabel
      Left = 8
      Top = 56
      Width = 75
      Height = 13
      Caption = 'ICMS/SERVI'#199'O'
    end
    object cod_grp: TEdit
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
      Top = 112
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 4
    end
    object EdtAliq: TCurrencyEdit
      Left = 8
      Top = 152
      Width = 65
      Height = 21
      Margins.Left = 4
      Margins.Top = 1
      AutoSize = False
      CheckOnExit = True
      Color = clSilver
      DisplayFormat = ',#0.00'
      FormatOnEditing = True
      TabOrder = 5
      ZeroEmpty = False
    end
    object ComboTipo: TComboBox
      Left = 112
      Top = 72
      Width = 201
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 3
      Items.Strings = (
        'TRIBUTADA'
        'SUB.TRIBUT'#193'RIA'
        'ISENTAS'
        'N'#195'O TRIBUTADA'
        'DESCONTOS'
        'ACR'#201'SCIMOS'
        'CANCELAMENTOS'
        'OPERA'#199#213'ES N'#195'O FISCAIS'
        'OUTRAS')
    end
    object EdtCST: TEdit
      Left = 80
      Top = 152
      Width = 41
      Height = 21
      Color = clSilver
      MaxLength = 3
      TabOrder = 6
    end
    object ComboICMSServico: TComboBox
      Left = 8
      Top = 72
      Width = 89
      Height = 21
      Style = csDropDownList
      Color = clSilver
      TabOrder = 2
      Items.Strings = (
        'ICMS'
        'SERVI'#199'O'
        'NAO FISCAL')
    end
    object CheckECF: TCheckBox
      Left = 88
      Top = 24
      Width = 217
      Height = 17
      Caption = 'Grupo Usado no ECF'
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Width = 409
    ExplicitWidth = 409
    inherited ToolBar1: TToolBar
      Width = 409
      ExplicitWidth = 409
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited BtnConsultar: TToolButton
        OnClick = BtnConsultarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 237
    Width = 409
    ExplicitTop = 237
    ExplicitWidth = 409
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLGRP: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGRP
    Left = 304
  end
  object IBTRGRP: TFDTransaction
    Connection = DM.IBDatabase
    Left = 352
  end
end
