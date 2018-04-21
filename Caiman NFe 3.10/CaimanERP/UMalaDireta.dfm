object FrmMalaDireta: TFrmMalaDireta
  Left = 342
  Top = 300
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mala Direta'
  ClientHeight = 240
  ClientWidth = 412
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
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 412
    Height = 44
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 2
    object BtnImp: TBitBtn
      Left = 108
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Seleciona'
      TabOrder = 0
      OnClick = BtnImpClick
      OnKeyDown = BtnImpKeyDown
      OnKeyPress = BtnImpKeyPress
    end
    object BtnSair: TBitBtn
      Left = 228
      Top = 11
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BtnSairClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 177
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object PC: TPageControl
      Left = 2
      Top = 2
      Width = 408
      Height = 143
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cobran'#231'a'
        object GroupBox1: TGroupBox
          Left = 60
          Top = 29
          Width = 281
          Height = 57
          Caption = 'Per'#237'odo [Vencimento]'
          TabOrder = 0
          object Label1: TLabel
            Left = 128
            Top = 32
            Width = 7
            Height = 13
            Caption = 'A'
          end
          object EdtDataIni: TDateTimePicker
            Left = 8
            Top = 24
            Width = 97
            Height = 21
            Date = 38534.474621076400000000
            Time = 38534.474621076400000000
            TabOrder = 0
          end
          object EdtDataFin: TDateTimePicker
            Left = 160
            Top = 24
            Width = 97
            Height = 21
            Date = 38534.474621076400000000
            Time = 38534.474621076400000000
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = '&Aniversariantes'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox2: TGroupBox
          Left = 60
          Top = 45
          Width = 281
          Height = 57
          Caption = 'Per'#237'odo '
          TabOrder = 0
          object Label2: TLabel
            Left = 128
            Top = 32
            Width = 7
            Height = 13
            Caption = 'A'
          end
          object EdtDtAniIni: TDateTimePicker
            Left = 8
            Top = 24
            Width = 97
            Height = 21
            Date = 38534.474621076400000000
            Time = 38534.474621076400000000
            TabOrder = 0
          end
          object EdtDtAniFin: TDateTimePicker
            Left = 160
            Top = 24
            Width = 97
            Height = 21
            Date = 38534.474621076400000000
            Time = 38534.474621076400000000
            TabOrder = 1
          end
        end
        object RadioClientes: TRadioButton
          Left = 56
          Top = 8
          Width = 89
          Height = 17
          Caption = 'Clientes'
          TabOrder = 1
        end
        object RadioFilhos: TRadioButton
          Left = 192
          Top = 8
          Width = 89
          Height = 17
          Caption = 'Filhos'
          TabOrder = 2
        end
      end
    end
    object CheckEmp: TCheckBox
      Left = 8
      Top = 152
      Width = 393
      Height = 17
      Caption = 'Todas as Empresas'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 221
    Width = 412
    Height = 19
    Panels = <>
  end
  object QCobranca: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_CLI'
      'FROM CONTAS_RECEBER'
      'WHERE VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN'
      'AND DTPAGTO_CTR IS NULL')
    Left = 296
    Top = 176
    ParamData = <
      item
        Name = 'DATAINI'
      end
      item
        Name = 'DATAFIN'
      end>
  end
  object QSeleciona: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'UPDATE CLIENTE'
      'SET SELECIONADO_CLI = '#39'S'#39
      'WHERE COD_CLI = :CODCLI')
    Left = 360
    Top = 176
    ParamData = <
      item
        Name = 'CODCLI'
        DataType = ftInteger
      end>
  end
  object QNiverCliente: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT COD_CLI'
      'FROM CLIENTE'
      'WHERE EXTRACT(DAY FROM NASCIMENTO_CLI)  >= :DIA1  AND'
      '               EXTRACT(DAY FROM NASCIMENTO_CLI) <=  :DIA2  AND'
      '               EXTRACT(MONTH FROM NASCIMENTO_CLI) >= :MES1 AND'
      '               EXTRACT(MONTH FROM NASCIMENTO_CLI) <= :MES2')
    Left = 360
    Top = 80
    ParamData = <
      item
        Name = 'DIA1'
      end
      item
        Name = 'DIA2'
      end
      item
        Name = 'MES1'
      end
      item
        Name = 'MES2'
      end>
  end
end
