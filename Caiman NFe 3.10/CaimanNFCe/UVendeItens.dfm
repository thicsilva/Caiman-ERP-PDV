object frmSelecionaItens: TfrmSelecionaItens
  Left = 0
  Top = 0
  Caption = 'Selecione os itens'
  ClientHeight = 334
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Scroll: TScrollBox
    Left = 0
    Top = 0
    Width = 780
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object pnlFooter: TPanel
      Left = 0
      Top = 304
      Width = 780
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object lblECLAS: TLabel
        Left = 208
        Top = 3
        Width = 303
        Height = 19
        Caption = '( F2 ) Muda Quantidade    ( F6 ) Confirmar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = lblECLASClick
      end
      object chkTodos: TRzCheckBox
        Left = 7
        Top = 3
        Width = 120
        Height = 21
        Caption = 'Marcar Todos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbUnchecked
        TabOrder = 0
        OnClick = chkTodosClick
      end
    end
    object pnlTempitem: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 774
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object lbltempQuant: TLabel
        AlignWithMargins = True
        Left = 472
        Top = 5
        Width = 168
        Height = 23
        Margins.Top = 5
        Align = alRight
        AutoSize = False
        Caption = 'X 10,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtQuanttemp: TCurrencyEdit
        AlignWithMargins = True
        Left = 648
        Top = 1
        Width = 121
        Height = 27
        Margins.Left = 5
        Margins.Top = 1
        Margins.Right = 5
        Align = alRight
        DisplayFormat = ' ,0.00; ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 26
      end
      object chkTempItem: TRzCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 463
        Height = 25
        Align = alClient
        Caption = 'chkTempItem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbUnchecked
        TabOrder = 1
        ExplicitWidth = 112
        ExplicitHeight = 20
      end
    end
  end
end
