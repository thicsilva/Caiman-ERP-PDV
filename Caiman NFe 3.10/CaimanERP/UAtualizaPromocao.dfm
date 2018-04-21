object FrmAtualizaPromocao: TFrmAtualizaPromocao
  Left = 479
  Top = 465
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualizar Promo'#231#245'es'
  ClientHeight = 137
  ClientWidth = 351
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
    Width = 351
    Height = 118
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 347
      Height = 114
      Align = alClient
      Caption = 'Data para Atualiza'#231#227'o'
      Color = 16710131
      ParentColor = False
      TabOrder = 0
      object EdtData: TDateTimePicker
        Left = 16
        Top = 31
        Width = 137
        Height = 25
        Date = 38762.628664988400000000
        Time = 38762.628664988400000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object BtnOK: TBitBtn
        Left = 178
        Top = 30
        Width = 68
        Height = 25
        Caption = '&OK'
        TabOrder = 1
        TabStop = False
        OnClick = BtnOKClick
      end
      object BtnSair: TBitBtn
        Left = 258
        Top = 30
        Width = 68
        Height = 25
        Caption = '&Sair'
        TabOrder = 2
        TabStop = False
        OnClick = BtnSairClick
      end
      object CheckProg: TCheckBox
        Left = 16
        Top = 80
        Width = 209
        Height = 17
        Caption = 'Atualizar os Pre'#231'os Programados'
        TabOrder = 3
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 118
    Width = 351
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object QEntraPromocao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_PRO, VALOR_PROMOCAO'
      'FROM PROMOCOES'
      'WHERE (DATA_TERMINO >= :TERMINO) AND '
      
        '(DATA_INICIO <= :INICIO) AND (COD_EMP IS NULL OR COD_EMP = :CODE' +
        'MP)'
      'ORDER BY DATA_TERMINO DESC')
    Left = 232
    Top = 72
    ParamData = <
      item
        Name = 'TERMINO'
        DataType = ftDate
      end
      item
        Name = 'INICIO'
        DataType = ftDate
      end
      item
        Name = 'CODEMP'
      end>
  end
end
