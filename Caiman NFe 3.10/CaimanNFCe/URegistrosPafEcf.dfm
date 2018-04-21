object frmRegistrosDoPafEcf: TfrmRegistrosDoPafEcf
  Left = 413
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Registros do PAF-ECF'
  ClientHeight = 325
  ClientWidth = 479
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 306
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 61
      Width = 473
      Height = 239
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = ' Estoque Total '
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object BtnGeraArquivo: TButton
          Left = 160
          Top = 77
          Width = 137
          Height = 41
          Caption = '&Gerar Arquivo'
          TabOrder = 0
          OnClick = BtnGeraArquivoClick
        end
        object PB: TProgressBar
          Left = 69
          Top = 124
          Width = 308
          Height = 17
          Smooth = True
          TabOrder = 1
        end
      end
      object TabSheet2: TTabSheet
        Caption = ' Estoque Parcial '
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid1: TDBGrid
          Left = 3
          Top = 3
          Width = 459
          Height = 168
          DataSource = SParcial
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_BARRA'
              Title.Caption = ' C'#243'digo '
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = ' Descri'#231#227'o '
              Visible = True
            end>
        end
        object Button1: TButton
          Left = 3
          Top = 177
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 84
          Top = 177
          Width = 75
          Height = 25
          Caption = 'Deletar'
          TabOrder = 2
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 165
          Top = 177
          Width = 100
          Height = 25
          Caption = '&Gerar Arquivo'
          TabOrder = 3
          OnClick = Button3Click
        end
        object PB2: TProgressBar
          Left = 271
          Top = 182
          Width = 191
          Height = 17
          Smooth = True
          TabOrder = 4
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 479
      Height = 55
      Align = alTop
      Caption = 'Per'#237'odo'
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object Label1: TLabel
        Left = 182
        Top = 29
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object EdtDataFin: TDateTimePicker
        Left = 217
        Top = 24
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 0
      end
      object EdtDataIni: TDateTimePicker
        Left = 57
        Top = 24
        Width = 97
        Height = 21
        Date = 40196.478224826400000000
        Time = 40196.478224826400000000
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 306
    Width = 479
    Height = 19
    Panels = <
      item
        Text = 'ESC p/sair'
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object Parcial: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ParcialIndex1'
        Fields = 'COD_BARRA'
        Options = [ixPrimary, ixUnique]
      end>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 152
    object ParcialCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Required = True
      Size = 30
    end
    object ParcialDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ParcialCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
    end
  end
  object SParcial: TDataSource
    DataSet = Parcial
    Left = 408
    Top = 128
  end
end
