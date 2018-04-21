object FrmPafEcfTabelaProduto: TFrmPafEcfTabelaProduto
  Left = 429
  Top = 302
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Produtos'
  ClientHeight = 167
  ClientWidth = 386
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 148
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 104
      Width = 228
      Height = 13
      Caption = 'C:\PAF_ECF\TABELA_PRODUTOS_NORMAL.TXT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 104
      Width = 109
      Height = 13
      Caption = 'Caminho do Arquivo:'
    end
    object Label3: TLabel
      Left = 112
      Top = 120
      Width = 217
      Height = 13
      Caption = 'C:\PAF_ECF\TABELA_PRODUTOS_PRAZO.TXT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 120
      Width = 109
      Height = 13
      Caption = 'Caminho do Arquivo:'
    end
    object BtnGeraArquivo: TButton
      Left = 121
      Top = 16
      Width = 137
      Height = 41
      Caption = '&Gerar Arquivo'
      TabOrder = 0
      OnClick = BtnGeraArquivoClick
    end
    object PB: TProgressBar
      Left = 12
      Top = 72
      Width = 365
      Height = 17
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 148
    Width = 386
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/sair'
  end
  object IBAux: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRAux
    Left = 48
    Top = 32
  end
  object TRAux: TFDTransaction
    Connection = DM.IBDatabase
    Left = 104
    Top = 32
  end
end
