object FrmSendEmail: TFrmSendEmail
  Left = 439
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Email'
  ClientHeight = 427
  ClientWidth = 495
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 26
      Height = 13
      Caption = 'Para:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 20
      Height = 13
      Caption = 'C.C:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 67
      Width = 34
      Height = 13
      Caption = 'C.C.O.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 99
      Width = 46
      Height = 13
      Caption = 'Assunto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 131
      Width = 57
      Height = 13
      Caption = 'Prioridade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 243
      Width = 61
      Height = 13
      Caption = 'Mensagem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 152
      Top = 96
      Width = 33
      Height = 13
      Caption = 'Label4'
    end
    object EdtPara: TEdit
      Left = 96
      Top = 16
      Width = 361
      Height = 21
      TabOrder = 0
    end
    object EdtCC: TEdit
      Left = 96
      Top = 40
      Width = 361
      Height = 21
      TabOrder = 1
    end
    object EdtCCO: TEdit
      Left = 96
      Top = 64
      Width = 361
      Height = 21
      TabOrder = 2
    end
    object ComboPrioridade: TComboBox
      Left = 96
      Top = 125
      Width = 121
      Height = 21
      Style = csDropDownList
      Color = clSilver
      ItemIndex = 1
      TabOrder = 4
      Text = 'Normal'
      Items.Strings = (
        'Alta'
        'Normal'
        'Baixa')
    end
    object CheckLeitura: TCheckBox
      Left = 232
      Top = 128
      Width = 225
      Height = 17
      Caption = 'Solicito confirma'#231#227'o de Leitura.'
      TabOrder = 5
    end
    object MemoMensagem: TMemo
      Left = 96
      Top = 240
      Width = 361
      Height = 121
      Lines.Strings = (
        '')
      TabOrder = 7
    end
    object BtnEnviar: TButton
      Left = 96
      Top = 375
      Width = 169
      Height = 25
      Caption = 'Enviar'
      TabOrder = 8
      OnClick = BtnEnviarClick
    end
    object BtnCancelar: TButton
      Left = 288
      Top = 375
      Width = 169
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 9
      OnClick = BtnCancelarClick
    end
    object LbAnexos: TListBox
      Left = 96
      Top = 168
      Width = 361
      Height = 57
      ItemHeight = 13
      TabOrder = 6
    end
    object EdtAssunto: TEdit
      Left = 96
      Top = 96
      Width = 361
      Height = 21
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 408
    Width = 495
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Aguardando envio de e-mail'
        Width = 50
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 352
    Top = 272
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 240
    Top = 216
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 248
    Top = 224
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 200
    Top = 136
  end
end
