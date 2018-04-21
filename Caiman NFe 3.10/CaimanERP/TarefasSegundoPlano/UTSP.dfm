object frmTSP: TfrmTSP
  Left = 0
  Top = 0
  Width = 749
  Height = 467
  TabOrder = 0
  object cxTarefas: TcxGrid
    AlignWithMargins = True
    Left = 40
    Top = 40
    Width = 709
    Height = 387
    Margins.Left = 40
    Margins.Top = 40
    Margins.Right = 40
    Margins.Bottom = 40
    Align = alLeft
    BorderStyle = cxcbsNone
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxTarefasTableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clNone
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.Content = cxstyl1
      object cxTarefasTableView1Column1: TcxGridColumn
        Caption = 'Tarefa'
      end
      object cxTarefasTableView1Column3: TcxGridColumn
        Caption = 'Status'
      end
      object cxTarefasTableView1Column2: TcxGridColumn
        Caption = 'Progresso'
        PropertiesClassName = 'TcxProgressBarProperties'
      end
      object cxTarefasTableView1Column4: TcxGridColumn
        Caption = 'Modulo'
        Visible = False
        GroupIndex = 0
      end
    end
    object cxTarefasLevel1: TcxGridLevel
      GridView = cxTarefasTableView1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlue
    end
  end
end
