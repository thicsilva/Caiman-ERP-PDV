object frmBuscarXML: TfrmBuscarXML
  Left = 348
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importa XML | Receita Federal | Entrada por Chave de acesso'
  ClientHeight = 396
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 0
    Top = 158
    Width = 649
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Conectando ao SEFAZ'
    FocusControl = ProgressBar1
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 1
    Top = 176
    Width = 644
    Height = 17
    TabOrder = 1
    Visible = False
  end
  object WebBrowser1: TWebBrowser
    Left = 280
    Top = 8
    Width = 0
    Height = 0
    TabStop = False
    TabOrder = 0
    OnProgressChange = WebBrowser1ProgressChange
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C00000000000000000000000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 101
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 162
      Height = 13
      Caption = 'Chave de acesso da nota fiscal: '
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 187
      Height = 13
      Caption = 'Digite o c'#243'digo da imagem ao lado: '
    end
    object edtChaveNFe: TEdit
      Left = 8
      Top = 24
      Width = 329
      Height = 21
      TabOrder = 0
    end
    object edtCaptcha: TEdit
      Left = 8
      Top = 63
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object Button2: TButton
      Left = 264
      Top = 66
      Width = 76
      Height = 27
      Caption = 'Lan'#231'ar XML'
      Enabled = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 104
    Width = 351
    Height = 49
    TabOrder = 3
    object btnPegarHTML: TButton
      Left = 90
      Top = 14
      Width = 76
      Height = 27
      Caption = 'Pegar HTML'
      Enabled = False
      TabOrder = 0
      OnClick = btnPegarHTMLClick
    end
    object btnNovaConsulta: TButton
      Left = 179
      Top = 14
      Width = 76
      Height = 27
      Caption = 'Nova Consulta'
      Enabled = False
      TabOrder = 1
      OnClick = btnNovaConsultaClick
    end
    object btnGerarXML: TButton
      Left = 270
      Top = 14
      Width = 76
      Height = 27
      Caption = 'Gerar XML'
      Enabled = False
      TabOrder = 2
      OnClick = btnGerarXMLClick
    end
    object Button1: TButton
      Left = 8
      Top = 14
      Width = 76
      Height = 27
      Caption = 'Buscar XML'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel4: TPanel
    Left = 353
    Top = -3
    Width = 293
    Height = 156
    TabOrder = 4
    object Image1: TImage
      Left = 15
      Top = 18
      Width = 262
      Height = 105
      Center = True
    end
    object Label3: TLabel
      Left = 1
      Top = 130
      Width = 291
      Height = 25
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = 'Clique aqui caso n'#227'o consiga visualizar a imagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label3Click
    end
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 200
    Width = 643
    Height = 193
    ActivePage = TabSheet2
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = 'Dados HTML'
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 635
        Height = 165
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados XML'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 635
        Height = 165
        Align = alClient
        TabOrder = 0
        object WBXML: TWebBrowser
          Left = 1
          Top = 1
          Width = 633
          Height = 163
          Align = alClient
          TabOrder = 0
          ControlData = {
            4C0000006C410000D91000000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Sobre'
      ImageIndex = 2
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 635
        Height = 139
        Align = alClient
        Caption = 
          'Projeto Recuperar XML'#13#10'Este projeto '#233' mantido pela comunidade de' +
          ' desenvolvedores do ACBr.'#13#10#13#10'Seu uso tem por objetivo fornecer o' +
          's dados de NF-e utilizando busca basedo no layout do site da NF-' +
          'e. Este site sofre modifica'#231#245'es constantes o que na maioria das ' +
          'vezes faz com que este projeto se torne incompat'#237'vel, portanto n' +
          #227'o h'#225' garantias de continuidade e manuten'#231#227'o deste projeto, use-' +
          'o por conta e risco.'#13#10#13#10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        WordWrap = True
        ExplicitWidth = 615
        ExplicitHeight = 104
      end
      object Label5: TLabel
        Left = 0
        Top = 139
        Width = 635
        Height = 26
        Align = alBottom
        Caption = 
          'OS ARQUIVOS GERADOS POR ESTE PROGRAMA N'#195'O SUBSTITUEM O XML ORIGI' +
          'NAL DA NF-E! Solicite aos fornecedores o envio do xml original, ' +
          'al'#233'm de obrigat'#243'rio, '#233' mais seguro.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 551
      end
    end
  end
end
