object FrmAcesso: TFrmAcesso
  Left = 297
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Defini'#231#227'o de Acesso aos Grupos de Usu'#225'rio'
  ClientHeight = 456
  ClientWidth = 711
  Color = clWhite
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
    Width = 711
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clSilver
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 4
      Width = 57
      Height = 13
      Caption = 'C'#243'd.Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnConsGrupo: TsSpeedButton
      Left = 61
      Top = 20
      Width = 23
      Height = 21
      Hint = 'Consultar Grupo de Usu'#225'rio'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000502020B4B201CB1662A26F032151275000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000502020C52231EC16C2E28FF6C2E28FF662A26F0000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000502020C52231EC16C2E28FF6C2E28FF6C2E28FF4B201CB1000000000000
        0000000000000C05041C3717148150221DBC552420CA4F211CBA331613790E06
        052052231EC16C2E28FF6C2E28FF6C2E28FF52231EC10502020B000000000000
        00002E13116C682B25F56C2E28FF642B24EC5D2721DB652B24EE6C2E28FF6B2C
        27FC6C2E28FF6C2E28FF6C2E28FF52231EC10502020C00000000000000002F14
        12706C2E28FF5B2721D61C0C0A42010100030000000002010104200E0C4C5E27
        23DF6C2E28FF6C2E28FF52231EC10502020C000000000000000010070625682D
        26F9592520D30603020F100E0C127164527D907F69A06B5E4E770C0A090D0A04
        04175E2723DF6B2C27FC0E0605200000000000000000000000003B19168C6C2E
        28FF180A093815131018CBB292E1E6CBA7FFE6CBA7FFE6CBA7FFBEA98BD40C0A
        090D200E0C4D6C2E28FF33161379000000000000000000000000562520CB5C28
        23DC000000017C6E5A8AE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF6B5E
        4E7702010104652B24EE4F211CBA0000000000000000000000005D2723DE5123
        1EC200000000A38F76B5E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF907F
        69A0000000005D2721DB552420CA000000000000000000000000562420CE5B27
        22D80000000082735F90E6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FFE6CBA7FF7164
        527D01010003642B24EC50221DBC0000000000000000000000003E1A16936C2E
        28FE1408072E1B18141ED5BC9BECE6CBA7FFE6CBA7FFE6CBA7FFCBB292E1100E
        0C121C0C0A426C2E28FF371714810000000000000000000000001308072D6B2C
        28FC55231FC8030101081B18141E82735F90A28F76B47C6E5A8A151310180603
        020F5B2721D6682B25F50C05041C000000000000000000000000000000003617
        14806C2E28FF55231FC81408072E000000000000000000000001180A09385925
        20D36C2E28FF2E13116C00000000000000000000000000000000000000000100
        0002361714806B2C28FC6C2E28FE5B2722D852221FC35C2823DC6C2E28FF682D
        26F92F14116F0000000000000000000000000000000000000000000000000000
        0000000000001308072D3E1A1693562420CE5E2823DD562520CB3B19168C1007
        0625000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnConsGrupoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label8: TLabel
      Left = 88
      Top = 4
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Cod_grupo: TEdit
      Left = 8
      Top = 20
      Width = 49
      Height = 21
      Hint = 'Pressione F2 para Consultar Grupo de Usu'#225'rio'
      Alignment = taRightJustify
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = Cod_grupoExit
      OnKeyDown = Cod_grupoKeyDown
      OnKeyPress = Cod_grupoKeyPress
    end
    object EdtNomeGrupo: TEdit
      Left = 88
      Top = 20
      Width = 289
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object BtnOK: TBitBtn
      Left = 389
      Top = 16
      Width = 60
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = BtnOKClick
    end
    object BtnSair: TBitBtn
      Left = 453
      Top = 16
      Width = 60
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BtnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 711
    Height = 213
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    TabOrder = 1
    object Label30: TLabel
      Left = 0
      Top = 0
      Width = 711
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Fun'#231#245'es Dispon'#237'veis'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 106
    end
    object GB1: TGroupBox
      Left = 560
      Top = 24
      Width = 73
      Height = 65
      TabOrder = 0
      object CheckIncluir: TCheckBox
        Left = 8
        Top = 8
        Width = 57
        Height = 17
        Caption = 'Inserir'
        TabOrder = 0
      end
      object CheckAlterar: TCheckBox
        Left = 8
        Top = 24
        Width = 57
        Height = 17
        Caption = 'Alterar'
        TabOrder = 1
      end
      object CheckExcluir: TCheckBox
        Left = 8
        Top = 40
        Width = 57
        Height = 17
        Caption = 'Excluir'
        TabOrder = 2
      end
    end
    object BtnGrava: TBitBtn
      Left = 557
      Top = 87
      Width = 73
      Height = 25
      Caption = '&Gravar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        AD5A59AA5454A24D4EAA9595C1C8C7CCCBCACECBCACAC8C7C6CAC9B79E9E9840
        41994444A65151FF00FFFF00FFBC7871CF6666D26868B95A5B9B8080BEA1A0E2
        D0CEFEF9F5FFFDFAF2F6F4D2B3B3962D2C993232C25B5BB05859FF00FFBB7871
        CB6565CE6767B85D5D9E7B7C9D4343B77675E7DFDDFDFBF9FEFFFDD9BAB9962E
        2E993333C05A5AAF5859FF00FFBB7871CB6565CE6667B85D5DA884839939399B
        3636CDBCBBF2F0EEFFFFFFE2C3C1962D2D983333C05A5AAF5859FF00FFBB7871
        CB6565CE6666B75C5CB28F8E9F4848943232A69A9AD5DBD8FAFFFEE6C9C8932B
        2B963030BF5959AF5859FF00FFBB7871CB6565CF6666BB5C5CC3908FC29695B3
        8686AA8D8EBAA2A1E1CAC8DCA9A9A33A3AA43E3EC35D5DAE5758FF00FFBB7871
        CC6566CB6464CB6464CB6364CC6767CD6767CC6464C85B5BC95E5ECA6161CC65
        65CD6666CF6868AC5657FF00FFBC7972B75351B25B57C68684D2A4A2D5ABAAD5
        AAA9D5ABAAD5A5A4D5A8A7D5AAA9D6AEACD39C9CCD6666AC5556FF00FFBC7871
        B14F4CE4CDCBFAF7F7F8F4F3F9F5F4F9F5F4F9F5F4F9F6F5F9F5F4F9F5F4FBFB
        FADEBEBDC45C5DAD5657FF00FFBC7871B3514EEBD7D6FCFBFAF7F0EFF7F1F0F7
        F1F0F7F1F0F7F1F0F7F1F0F6F1F0FBF9F8DEBCBBC35B5BAD5657FF00FFBC7871
        B3514EEBD7D4F0EFEFD8D5D4DAD7D7DAD7D7DAD7D7DAD7D7DAD7D7D8D5D5ECEC
        EBE0BDBCC25B5BAD5657FF00FFBC7871B3514EEBD7D5F3F1F1DEDAD9DFDBDBDF
        DBDBDFDBDBDFDBDBDFDBDBDDDAD9EEEEEEE0BDBCC35B5BAD5657FF00FFBC7871
        B3514EEAD7D5F5F4F3E4DFDEE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDFF2F1
        F0DFBDBBC35B5BAD5657FF00FFBC7871B3514EEBD7D6F1F0EFD9D5D5DAD8D7DA
        D8D7DAD8D7DAD8D7DAD8D7D8D5D5EDECEBE1BEBDC35B5BAD5657FF00FFBC7870
        B3514EE9D6D4FEFBFBFAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FDFA
        F9DEBCBBC35C5CAD5657FF00FFFF00FFA8504CC9B6B5D3D5D4D1CECED1CECED1
        CECED1CECED1CECED1CECED1CECED3D4D4CBAEADA34D4EFF00FF}
      TabOrder = 1
      OnClick = BtnGravaClick
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 13
      Width = 551
      Height = 200
      Align = alLeft
      Color = clSilver
      DataSource = DSQFuncoesDisp
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FUNCAO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FUNCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Fun'#231#227'o'
          Width = 450
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_MENU'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 262
    Width = 711
    Height = 194
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 711
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Fun'#231#245'es Utilizadas'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 96
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 13
      Width = 551
      Height = 181
      Align = alLeft
      Color = clSilver
      DataSource = DSQFuncoesUtil
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FUNCAO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FUNCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Fun'#231#227'o'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSERIR'
          Title.Alignment = taCenter
          Title.Caption = 'Ins'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALTERAR'
          Title.Alignment = taCenter
          Title.Caption = 'Alt'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXCLUIR'
          Title.Alignment = taCenter
          Title.Caption = 'Exc'
          Visible = True
        end>
    end
    object BtnExcluir: TBitBtn
      Left = 600
      Top = 160
      Width = 65
      Height = 25
      Caption = '&Excluir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = BtnExcluirClick
    end
  end
  object QFuncoesDisp: TFDQuery
    AfterScroll = QFuncoesDispAfterScroll
    Connection = DM.IBDatabase
    Transaction = IBTRFuncoesUtil
    SQL.Strings = (
      'SELECT COD_FUNCAO, NOME_FUNCAO, TIPO_MENU'
      'FROM FUNCOES'
      'WHERE COD_FUNCAO NOT IN (SELECT COD_FUNCAO FROM'
      'FUNCOES_GRUPO_USUARIO WHERE COD_GRUPO = :CODGRUPO)'
      'ORDER BY NOME_FUNCAO')
    Left = 64
    Top = 104
    ParamData = <
      item
        Name = 'CODGRUPO'
        DataType = ftInteger
      end>
    object QFuncoesDispCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Origin = 'FUNCOES.COD_FUNCAO'
      Required = True
    end
    object QFuncoesDispNOME_FUNCAO: TStringField
      FieldName = 'NOME_FUNCAO'
      Origin = 'FUNCOES.NOME_FUNCAO'
      Required = True
      Size = 80
    end
    object QFuncoesDispTIPO_MENU: TStringField
      FieldName = 'TIPO_MENU'
      Origin = 'FUNCOES.TIPO_MENU'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object IBTRFuncoesDisp: TFDTransaction
    Connection = DM.IBDatabase
    Left = 152
    Top = 104
  end
  object DSQFuncoesDisp: TDataSource
    AutoEdit = False
    DataSet = QFuncoesDisp
    Left = 256
    Top = 104
  end
  object QFuncoesUtil: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRFuncoesUtil
    SQL.Strings = (
      'SELECT FG.*, F.NOME_FUNCAO'
      'FROM FUNCOES_GRUPO_USUARIO FG'
      'INNER JOIN FUNCOES F'
      'ON (FG.COD_FUNCAO = F.COD_FUNCAO)'
      'WHERE FG.COD_GRUPO = :CODGRUPO'
      'ORDER BY F.NOME_FUNCAO')
    Left = 96
    Top = 344
    ParamData = <
      item
        Name = 'CODGRUPO'
        DataType = ftInteger
      end>
    object QFuncoesUtilCOD_FUNCAO: TIntegerField
      FieldName = 'COD_FUNCAO'
      Origin = 'FUNCOES_GRUPO_USUARIO.COD_FUNCAO'
      Required = True
    end
    object QFuncoesUtilCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'FUNCOES_GRUPO_USUARIO.COD_GRUPO'
      Required = True
    end
    object QFuncoesUtilINSERIR: TStringField
      FieldName = 'INSERIR'
      Origin = 'FUNCOES_GRUPO_USUARIO.INSERIR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFuncoesUtilALTERAR: TStringField
      FieldName = 'ALTERAR'
      Origin = 'FUNCOES_GRUPO_USUARIO.ALTERAR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFuncoesUtilEXCLUIR: TStringField
      FieldName = 'EXCLUIR'
      Origin = 'FUNCOES_GRUPO_USUARIO.EXCLUIR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QFuncoesUtilNOME_FUNCAO: TStringField
      FieldName = 'NOME_FUNCAO'
      Origin = 'FUNCOES.NOME_FUNCAO'
      Required = True
      Size = 80
    end
  end
  object DSQFuncoesUtil: TDataSource
    AutoEdit = False
    DataSet = QFuncoesUtil
    Left = 192
    Top = 352
  end
  object IBTRFuncoesUtil: TFDTransaction
    Connection = DM.IBDatabase
    Left = 288
    Top = 352
  end
  object QBuscaGrupo: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM GRUPO_USUARIO'
      'WHERE COD_GRUPO = :CODGRUPO')
    Left = 352
    Top = 104
    ParamData = <
      item
        Name = 'CODGRUPO'
        DataType = ftInteger
      end>
    object QBuscaGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'GRUPO_USUARIO.COD_GRUPO'
      Required = True
    end
    object QBuscaGrupoNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Origin = 'GRUPO_USUARIO.NOME_GRUPO'
      Required = True
      Size = 50
    end
    object QBuscaGrupoSUPER_GRUPO: TStringField
      FieldName = 'SUPER_GRUPO'
      Origin = 'GRUPO_USUARIO.SUPER_GRUPO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QGravaExclui: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRGravaExclui
    Left = 56
    Top = 176
  end
  object IBTRGravaExclui: TFDTransaction
    Connection = DM.IBDatabase
    Left = 144
    Top = 176
  end
end
