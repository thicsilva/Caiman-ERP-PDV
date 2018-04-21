object FrmConsCentroCusto: TFrmConsCentroCusto
  Left = 308
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Centro de Custo'
  ClientHeight = 457
  ClientWidth = 586
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 438
    Width = 586
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 586
    Height = 373
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 2
      Top = 2
      Width = 582
      Height = 335
      Align = alTop
      Color = clSilver
      DataSource = DM.DSCentroCusto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'N'#218'MERO'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DA CONTA'
          Width = 361
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_RD'
          Title.Alignment = taCenter
          Title.Caption = 'D/R'
          Width = 90
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 222
      Top = 344
      Width = 69
      Height = 25
      Caption = '&Localizar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnSair: TButton
      Left = 358
      Top = 343
      Width = 69
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object GB2: TGroupBox
      Left = 216
      Top = 8
      Width = 289
      Height = 49
      TabOrder = 0
      object EdtCons: TEdit
        Left = 8
        Top = 16
        Width = 273
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtConta: TMaskEdit
        Left = 8
        Top = 16
        Width = 101
        Height = 21
        Color = clSilver
        EditMask = '9.99.999;0;_'
        MaxLength = 8
        TabOrder = 1
        Text = ''
      end
    end
    object BtnOk: TButton
      Left = 512
      Top = 24
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object GB1: TGroupBox
      Left = 8
      Top = 8
      Width = 201
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 2
      object ComboCons: TComboBox
        Left = 8
        Top = 16
        Width = 185
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'N'#218'MERO DA CONTA'
          'NOME DA CONTA')
      end
    end
  end
end
