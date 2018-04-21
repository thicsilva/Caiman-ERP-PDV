object FrmConsFor: TFrmConsFor
  Left = 316
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Fornecedor'
  ClientHeight = 383
  ClientWidth = 578
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 145
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 0
      object ComboCons: TComboBox
        Left = 8
        Top = 18
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboConsChange
        Items.Strings = (
          'C'#211'DIGO'
          'NOME'
          'CNPJ/CPF'
          'PALAVRA CHAVE')
      end
    end
    object GB2: TGroupBox
      Left = 160
      Top = 5
      Width = 321
      Height = 49
      Caption = 'Consultar por'
      TabOrder = 1
      object EdtCons: TEdit
        Left = 8
        Top = 18
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        TabOrder = 0
      end
    end
    object BtnOk: TButton
      Left = 496
      Top = 18
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      OnClick = BtnOkClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 578
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnSair: TButton
      Left = 320
      Top = 274
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BtnSairClick
    end
    object DBGrid: TDBGrid
      Left = 8
      Top = 8
      Width = 561
      Height = 257
      Color = clSilver
      DataSource = DM.DSFor
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = BtnLocalizarClick
      OnKeyDown = DBGridKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'COD.'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'RAZ'#195'O SOCIAL'
          Width = 349
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ/CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAX_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'FAX'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTATO_FOR'
          Title.Alignment = taCenter
          Title.Caption = 'CONTATO'
          Visible = True
        end>
    end
    object BtnLocalizar: TButton
      Left = 192
      Top = 274
      Width = 65
      Height = 25
      Caption = '&Localizar'
      TabOrder = 2
      OnClick = BtnLocalizarClick
    end
  end
end
