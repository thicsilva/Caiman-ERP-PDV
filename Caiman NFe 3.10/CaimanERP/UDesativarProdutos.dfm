object FrmDesativarProdutos: TFrmDesativarProdutos
  Left = 519
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Desativar Produtos'
  ClientHeight = 138
  ClientWidth = 384
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 119
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Data Refer'#234'ncia'
    end
    object EdtData: TDateTimePicker
      Left = 16
      Top = 24
      Width = 105
      Height = 21
      Date = 38618.399969537000000000
      Time = 38618.399969537000000000
      TabOrder = 0
    end
    object BtnOK: TBitBtn
      Left = 157
      Top = 23
      Width = 65
      Height = 25
      Caption = '&Ok'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 238
      Top = 23
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object CheckEstoqueZerado: TCheckBox
      Left = 16
      Top = 80
      Width = 257
      Height = 17
      Caption = 'Desativar Produtos com estoque zerado'
      TabOrder = 3
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 119
    Width = 384
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object IBSPDesativa: TFDStoredProc
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    StoredProcName = 'SP_DESATIVA_PRODUTOS'
    Left = 312
    Top = 56
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
end
