object FrmAlteraParcela: TFrmAlteraParcela
  Left = 406
  Top = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alterar Parcelas'
  ClientHeight = 154
  ClientWidth = 389
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 97
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 144
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Seq.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Data Emiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 104
      Top = 48
      Width = 54
      Height = 13
      Caption = 'Data Venc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 296
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 200
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Data Pagto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 88
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Parc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCod: TEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtSeq: TEdit
      Left = 144
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EdtDataEmi: TMaskEdit
      Left = 8
      Top = 64
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = EdtDataEmiExit
    end
    object EdtDataVen: TMaskEdit
      Left = 104
      Top = 64
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = EdtDataVenExit
    end
    object EdtValor: TCurrencyEdit
      Left = 296
      Top = 64
      Width = 81
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
    object EdtDataPagto: TMaskEdit
      Left = 200
      Top = 64
      Width = 81
      Height = 21
      Color = clSilver
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnExit = EdtDataPagtoExit
    end
    object EdtParc: TEdit
      Left = 88
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 389
    Height = 38
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object BtnOK: TBitBtn
      Left = 109
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Ok'
      TabOrder = 0
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 221
      Top = 6
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 135
    Width = 389
    Height = 19
    Panels = <>
  end
  object QUpdValor: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'UPDATE CONTAS_RECEBER '
      'SET VALOR_CTR = :VALORCTR'
      'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ')
    Left = 288
    ParamData = <
      item
        Name = 'VALORCTR'
        DataType = ftCurrency
      end
      item
        Name = 'CODCTR'
        DataType = ftInteger
      end
      item
        Name = 'SEQ'
        DataType = ftInteger
      end>
  end
end
