object FrmSelEmp: TFrmSelEmp
  Left = 423
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Selecionar Empresa'
  ClientHeight = 149
  ClientWidth = 401
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 130
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object BtnSair: TButton
      Left = 224
      Top = 96
      Width = 65
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object BtnOk: TButton
      Left = 112
      Top = 96
      Width = 65
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOkClick
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 385
      Height = 81
      Color = clGradientInactiveCaption
      DataSource = DSQEmp
      Options = [dgEditing, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = 16776176
          Expanded = False
          FieldName = 'RAZAO_EMP'
          Title.Alignment = taCenter
          Width = 332
          Visible = True
        end>
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 130
    Width = 401
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione a empresa desejada'
  end
  object QEmp: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT U.COD_EMP, E.CNPJ_EMP, E.RAZAO_EMP'
      'FROM EMPRESA_USUARIO U'
      'INNER JOIN EMPRESA E'
      'ON (U.COD_EMP = E.COD_EMP)'
      'WHERE U.COD_USU = :CODUSU'
      'ORDER BY U.COD_EMP')
    Left = 160
    Top = 32
    ParamData = <
      item
        Name = 'CODUSU'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QEmpCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'EMPRESA_USUARIO.COD_EMP'
      Required = True
    end
    object QEmpRAZAO_EMP: TStringField
      FieldName = 'RAZAO_EMP'
      Origin = 'EMPRESA.RAZAO_EMP'
      Required = True
      Size = 50
    end
    object QEmpCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      Size = 14
    end
  end
  object DSQEmp: TDataSource
    AutoEdit = False
    DataSet = QEmp
    Left = 240
    Top = 32
  end
end
