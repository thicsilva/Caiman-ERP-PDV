object FrmConsVendasCaixa: TFrmConsVendasCaixa
  Left = 347
  Top = 342
  BorderStyle = bsSingle
  Caption = 'Consulta de Vendas'
  ClientHeight = 294
  ClientWidth = 532
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 275
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 217
      Height = 105
      Caption = 'Per'#237'odo'
      TabOrder = 0
      object EdtDataIni: TMaskEdit
        Left = 16
        Top = 40
        Width = 89
        Height = 21
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object EdtDataFin: TMaskEdit
        Left = 16
        Top = 72
        Width = 89
        Height = 21
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object EdtHoraIni: TMaskEdit
        Left = 128
        Top = 40
        Width = 65
        Height = 21
        EditMask = '!90:00:00;1;_'
        MaxLength = 8
        TabOrder = 1
        Text = '  :  :  '
      end
      object EdtHoraFin: TMaskEdit
        Left = 128
        Top = 72
        Width = 65
        Height = 21
        EditMask = '!90:00:00;1;_'
        MaxLength = 8
        TabOrder = 3
        Text = '  :  :  '
      end
      object CheckHora: TCheckBox
        Left = 16
        Top = 16
        Width = 177
        Height = 17
        Caption = 'Usar Hora'
        TabOrder = 4
        OnClick = CheckHoraClick
      end
    end
    object BtnOK: TBitBtn
      Left = 72
      Top = 168
      Width = 81
      Height = 25
      Caption = '&OK'
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888777777
        777777770000774448877777777777770000772244887777777777770000A222
        22488777777777770000A22222248877777777770000A2222222488777777777
        0000A22222222488777777770000A22222222248877777770000A22248A22224
        887777770000A222488A2222488777770000A2224887A2224488777700007A22
        48877A222488777700007A22477777A222488777000077777777777A22244877
        0000777777777777A222488700007777777777777A2224870000777777777777
        77A224480000777777777777777A224800007777777777777777A24800007777
        7777777777777A270000}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BitBtn1: TBitBtn
      Left = 72
      Top = 208
      Width = 81
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA64308C25E03AA4707FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFA13E08C66203C86402A54207FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E07C05B03C86402A54207FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E07
        BD5B09D16C03A74407FF00FFFF00FFA44108AC4906AC4906AC4906AC4906AC48
        06AC4806AC4906A33F07FF00FFAD4C0DE0831DB3510AFF00FFFF00FFFF00FFB7
        5305CF6A01CD6701CD6801CC6701CC6701CD6801C66102A33F079E3A05D47B28
        D67C259E3906FF00FFFF00FFFF00FFA64307AE4A06AD4A06AB4806B34F06CE69
        01CF6A01C56102A33F07A5420AF1A444BD621CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF9F3D08C45F03C96402BD5804C76201A23F07A9470DF4AA49
        B55818FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA13E08C05B03D06B01AB47
        07B45005C96401A23F07A6440CF4AB49C76D24983301FF00FFFF00FFFF00FFFF
        00FFA13E07C25D03D26C00B24E069C3909B65205C96401A23F079D3805DE8C36
        F5AA48AA490E9B36039B36039B3603AB490CCE6F12D16E05B44F05FF00FFFF00
        FFB65205C96401A23F07FF00FFAA480EF2A746F9B04CCA7026C16620D6812EF3
        A139DB8121AA490AFF00FFFF00FFFF00FFB75205C96401A23F07FF00FFFF00FF
        A9470CCF7A2CF1A344F8AB4AEEA143C86D23A4410AFF00FFFF00FFFF00FFFF00
        FFB55105C86301A23F07FF00FFFF00FFFF00FF9F3C06A8460CAF5012A7450C9D
        3905FF00FFFF00FFFF00FFFF00FFFF00FFA54208AA4707A23F07FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object Panel4: TPanel
    Left = 241
    Top = 0
    Width = 291
    Height = 275
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object Label9: TLabel
      Left = 32
      Top = 248
      Width = 83
      Height = 13
      Caption = 'Total das Vendas'
    end
    object EdtTotalVendas: TCurrencyEdit
      Left = 128
      Top = 240
      Width = 121
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      TabStop = False
      AutoSize = False
      CheckOnExit = True
      Color = cl3DLight
      DisplayFormat = ',#0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      FormatOnEditing = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ZeroEmpty = False
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 287
      Height = 223
      Align = alTop
      DataSource = DSFormas
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Width = 102
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 275
    Width = 532
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/Sair'
  end
  object QTotalFormas: TFDQuery
    Connection = DM.IBDatabaseServer
    Transaction = DM.IBTRServer
    SQL.Strings = (
      'SELECT SUM(I.VALOR) TOTAL, I.COD_FORMA, F.DESCRICAO, F.TIPO'
      'FROM VENDAS_FORMAS_PAGAMENTO I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VENDA = V.COD_VEN)'
      'INNER JOIN FORMAS_PAGAMENTO F'
      'ON (I.COD_FORMA = F.CODIGO)'
      'GROUP BY I.COD_FORMA, F.DESCRICAO, F.TIPO'
      ''
      ''
      ''
      '')
    Left = 24
    Top = 128
    object QTotalFormasTOTAL: TBCDField
      FieldName = 'TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QTotalFormasCOD_FORMA: TIntegerField
      FieldName = 'COD_FORMA'
      Required = True
    end
    object QTotalFormasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
    end
    object QTotalFormasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object DSFormas: TDataSource
    AutoEdit = False
    DataSet = QTotalFormas
    Left = 24
    Top = 176
  end
end
