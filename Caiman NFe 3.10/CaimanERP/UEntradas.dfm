inherited FrmEntradas: TFrmEntradas
  Left = 294
  Top = 136
  Caption = 'Entradas'
  ClientHeight = 627
  ClientWidth = 717
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 723
  ExplicitHeight = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Top = 115
    Width = 717
    ExplicitWidth = 717
  end
  inherited Panel1: TPanel
    Top = 121
    Width = 717
    Height = 486
    ExplicitWidth = 717
    ExplicitHeight = 486
    object DBGrid1: TDBGrid
      Left = 0
      Top = 259
      Width = 717
      Height = 227
      TabStop = False
      Align = alClient
      Color = clGradientInactiveCaption
      DataSource = DSQBuscaItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'ITEM'
          Width = 33
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'COD.PROD.'
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'NOME_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
          Width = 339
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CST'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'QTD_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'QTD.'
          Width = 53
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_UNIT_PRO'
          Title.Alignment = taCenter
          Title.Caption = 'UNIT.'
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_ICMS'
          Title.Alignment = taCenter
          Title.Caption = 'ICMS(%)'
          Width = 48
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_BCR'
          Title.Alignment = taCenter
          Title.Caption = 'BCR(%)'
          Width = 48
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_ST'
          Title.Alignment = taCenter
          Title.Caption = 'ST(%)'
          Width = 43
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_SUB_TRIBUTARIA'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Sub.Trib.'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_IPI'
          Title.Alignment = taCenter
          Title.Caption = 'IPI(%)'
          Width = 37
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_IPI'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.IPI'
          Width = 67
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_DESC'
          Title.Alignment = taCenter
          Title.Caption = 'DESC(%)'
          Width = 51
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_DESCONTO'
          Title.Alignment = taCenter
          Title.Caption = 'VL.DESC.'
          Width = 63
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'PERC_ACRES'
          Title.Alignment = taCenter
          Title.Caption = 'ACR'#201'S(%)'
          Width = 56
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'VALOR_ACRESCIMO'
          Title.Alignment = taCenter
          Title.Caption = 'VL.ACRESC.'
          Width = 69
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'COD_CFOP'
          Title.Alignment = taCenter
          Title.Caption = 'CFOP'
          Width = 52
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 0
      Top = 259
      Width = 717
      Height = 227
      Align = alClient
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 2
      ExplicitHeight = 287
      object Label10: TLabel
        Left = 80
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Cod.Produto'
      end
      object BtnConsPro: TsSpeedButton
        Left = 204
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Consultar Produto'
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
        OnClick = BtnConsProClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddPro: TsSpeedButton
        Left = 229
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Cadastrar Produto'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddProClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label11: TLabel
        Left = 258
        Top = 8
        Width = 111
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
      end
      object Label40: TLabel
        Left = 306
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Grupo ICMS(*)'
      end
      object BtnConsGRP: TsSpeedButton
        Left = 364
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Consultar Grupo de ICMS'
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
        OnClick = BtnConsGRPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddGRP: TsSpeedButton
        Left = 389
        Top = 64
        Width = 25
        Height = 21
        Hint = 'Cadastrar Grupo de ICMS'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddGRPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label41: TLabel
        Left = 418
        Top = 48
        Width = 147
        Height = 13
        Caption = 'Descri'#231#227'o do Grupo de ICMS'
      end
      object Label38: TLabel
        Left = 8
        Top = 48
        Width = 66
        Height = 13
        Caption = 'Cod.CFOP.(*)'
      end
      object BtnConsCFOP: TsSpeedButton
        Left = 68
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Consultar CFOP'
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
        OnClick = BtnConsCFOPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddCFOP: TsSpeedButton
        Left = 93
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Cadastrar CFOP'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddCFOPClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label39: TLabel
        Left = 122
        Top = 48
        Width = 97
        Height = 13
        Caption = 'Descri'#231#227'o do CFOP'
      end
      object Label52: TLabel
        Left = 664
        Top = 48
        Width = 18
        Height = 13
        Caption = 'CST'
      end
      object Label55: TLabel
        Left = 8
        Top = 8
        Width = 22
        Height = 13
        Caption = 'Item'
      end
      object EdtNomePro: TEdit
        Left = 258
        Top = 24
        Width = 447
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
      end
      object EdtCodPro: TEdit
        Left = 80
        Top = 24
        Width = 121
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Produto'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EdtCodProEnter
        OnExit = EdtCodProExit
        OnKeyDown = EdtCodProKeyDown
      end
      object EdtCodGRP: TEdit
        Left = 306
        Top = 64
        Width = 55
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Grupo de ICMS'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = EdtCodGRPEnter
        OnExit = EdtCodGRPExit
        OnKeyDown = EdtCodGRPKeyDown
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtNomeGRP: TEdit
        Left = 418
        Top = 64
        Width = 239
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
      object EdtCFOP: TEdit
        Left = 8
        Top = 64
        Width = 57
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para CFOP'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = EdtCFOPEnter
        OnExit = EdtCFOPExit
        OnKeyDown = EdtCFOPKeyDown
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtNomeCFOP: TEdit
        Left = 122
        Top = 64
        Width = 175
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
      end
      object EdtCST: TEdit
        Left = 664
        Top = 64
        Width = 41
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Cadastrar Grupo de ICMS'
        Alignment = taRightJustify
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = EdtCSTEnter
        OnExit = EdtCSTExit
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtItem: TEdit
        Left = 8
        Top = 24
        Width = 57
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 408
        Top = 88
        Width = 297
        Height = 97
        TabOrder = 8
        object LTribSaida: TLabel
          Left = 8
          Top = 17
          Width = 225
          Height = 16
          AutoSize = False
          Caption = 'LTributacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 65
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'Margem >>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 8
          Top = 41
          Width = 89
          Height = 16
          AutoSize = False
          Caption = 'P.Venda >>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtPrecoVenda: TCurrencyEdit
          Left = 112
          Top = 39
          Width = 89
          Height = 18
          Margins.Top = 0
          TabStop = False
          Alignment = taLeftJustify
          AutoSize = False
          BorderStyle = bsNone
          CheckOnExit = True
          Color = 16710131
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtMargem: TCurrencyEdit
          Left = 112
          Top = 63
          Width = 89
          Height = 18
          Margins.Top = 0
          TabStop = False
          Alignment = taLeftJustify
          AutoSize = False
          BorderStyle = bsNone
          CheckOnExit = True
          Color = 16710131
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 88
        Width = 393
        Height = 97
        TabOrder = 9
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Unidade'
        end
        object Label13: TLabel
          Left = 88
          Top = 32
          Width = 5
          Height = 13
          Caption = 'x'
        end
        object Label14: TLabel
          Left = 104
          Top = 8
          Width = 62
          Height = 13
          Caption = 'Quantidade'
        end
        object Label15: TLabel
          Left = 184
          Top = 32
          Width = 8
          Height = 13
          Caption = '='
        end
        object Label16: TLabel
          Left = 200
          Top = 8
          Width = 62
          Height = 13
          Caption = 'Quantidade'
        end
        object Label17: TLabel
          Left = 8
          Top = 48
          Width = 74
          Height = 13
          Caption = 'Valor Unidade'
        end
        object Label18: TLabel
          Left = 88
          Top = 68
          Width = 4
          Height = 13
          Caption = '/'
        end
        object Label27: TLabel
          Left = 104
          Top = 48
          Width = 62
          Height = 13
          Caption = 'Quantidade'
        end
        object Label20: TLabel
          Left = 184
          Top = 68
          Width = 8
          Height = 13
          Caption = '='
        end
        object Label23: TLabel
          Left = 200
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Valor'
        end
        object Label29: TLabel
          Left = 297
          Top = 48
          Width = 25
          Height = 13
          Caption = 'Total'
        end
        object EdtUnid: TCurrencyEdit
          Left = 8
          Top = 24
          Width = 73
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DecimalPlaces = 3
          DisplayFormat = ',#0.000'
          FormatOnEditing = True
          TabOrder = 0
          ZeroEmpty = False
          OnExit = EdtUnidExit
        end
        object EdtQuantUnid: TCurrencyEdit
          Left = 104
          Top = 24
          Width = 73
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          TabOrder = 1
          ZeroEmpty = False
          OnExit = EdtQuantUnidExit
        end
        object EdtQuant: TCurrencyEdit
          Left = 200
          Top = 24
          Width = 81
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DecimalPlaces = 3
          DisplayFormat = ',#0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
        object EdtValorUnid: TCurrencyEdit
          Left = 8
          Top = 64
          Width = 73
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DecimalPlaces = 4
          DisplayFormat = ',#0.0000'
          FormatOnEditing = True
          TabOrder = 3
          ZeroEmpty = False
          OnExit = EdtValorUnidExit
        end
        object EdtQuantUnid2: TCurrencyEdit
          Left = 104
          Top = 64
          Width = 73
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          ZeroEmpty = False
        end
        object EdtValorUnit: TCurrencyEdit
          Left = 200
          Top = 64
          Width = 81
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DecimalPlaces = 4
          DisplayFormat = ',#0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          ZeroEmpty = False
        end
        object EdtTotal: TCurrencyEdit
          Left = 296
          Top = 64
          Width = 81
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          ZeroEmpty = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 184
        Width = 697
        Height = 97
        TabOrder = 10
        object Label19: TLabel
          Left = 160
          Top = 8
          Width = 42
          Height = 13
          Caption = 'Desc.(%)'
        end
        object Label24: TLabel
          Left = 8
          Top = 8
          Width = 50
          Height = 13
          Caption = 'Acr'#233'sc.(%)'
        end
        object Label51: TLabel
          Left = 160
          Top = 48
          Width = 57
          Height = 13
          Caption = 'Sub.Trib(%)'
        end
        object Label56: TLabel
          Left = 232
          Top = 48
          Width = 61
          Height = 13
          Caption = 'Sub.Trib(R$)'
        end
        object Label46: TLabel
          Left = 80
          Top = 8
          Width = 54
          Height = 13
          Caption = 'Acr'#233'sc.(R$)'
        end
        object Label26: TLabel
          Left = 312
          Top = 48
          Width = 27
          Height = 13
          Caption = 'IPI(%)'
        end
        object Label47: TLabel
          Left = 232
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Desc.(R$)'
        end
        object Label57: TLabel
          Left = 384
          Top = 48
          Width = 31
          Height = 13
          Caption = 'IPI(R$)'
        end
        object Label28: TLabel
          Left = 480
          Top = 48
          Width = 30
          Height = 13
          Caption = 'Custo'
        end
        object Label25: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 13
          Caption = 'ICMS(%)'
        end
        object Label45: TLabel
          Left = 80
          Top = 48
          Width = 36
          Height = 13
          Caption = 'BCR(%)'
        end
        object EdtPerAcrescimoItem: TCurrencyEdit
          Left = 8
          Top = 24
          Width = 65
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 0
          ZeroEmpty = False
          OnExit = EdtPerAcrescimoItemExit
        end
        object EdtPercST: TCurrencyEdit
          Left = 160
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 6
          ZeroEmpty = False
        end
        object EdtSubValor: TCurrencyEdit
          Left = 232
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 7
          ZeroEmpty = False
        end
        object EdtPerDescontoItem: TCurrencyEdit
          Left = 160
          Top = 24
          Width = 65
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 2
          ZeroEmpty = False
          OnExit = EdtPerDescontoItemExit
        end
        object EdtPerIPI: TCurrencyEdit
          Left = 312
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 8
          ZeroEmpty = False
          OnExit = EdtPerIPIExit
        end
        object EdtVlDescontoItem: TCurrencyEdit
          Left = 232
          Top = 24
          Width = 65
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 3
          ZeroEmpty = False
        end
        object EdtIPIValor: TCurrencyEdit
          Left = 384
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 9
          ZeroEmpty = False
          OnExit = EdtPerIPIExit
        end
        object EdtCusto: TCurrencyEdit
          Left = 480
          Top = 64
          Width = 89
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DecimalPlaces = 4
          DisplayFormat = ',#0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          ZeroEmpty = False
        end
        object EdtPerICMS: TCurrencyEdit
          Left = 8
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          ReadOnly = True
          TabOrder = 4
          ZeroEmpty = False
        end
        object EdtPercBCR: TCurrencyEdit
          Left = 80
          Top = 64
          Width = 65
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 5
          ZeroEmpty = False
        end
        object EdtVlAcrescimoItem: TCurrencyEdit
          Left = 80
          Top = 24
          Width = 65
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          AutoSize = False
          CheckOnExit = True
          Color = clSilver
          DisplayFormat = ',#0.00'
          FormatOnEditing = True
          TabOrder = 1
          ZeroEmpty = False
        end
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 215
      Width = 717
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = 16710131
      TabOrder = 1
      object Label30: TLabel
        Left = 0
        Top = 0
        Width = 717
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Itens da Entrada'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 84
      end
      object BtnGrava: TBitBtn
        Left = 5
        Top = 16
        Width = 65
        Height = 25
        Caption = '&Grava'
        TabOrder = 0
        OnClick = BtnGravaClick
      end
      object BtnNew: TBitBtn
        Left = 69
        Top = 16
        Width = 65
        Height = 25
        Caption = '&Novo'
        TabOrder = 1
        OnClick = BtnNewClick
      end
      object BtnExclui: TBitBtn
        Left = 133
        Top = 16
        Width = 65
        Height = 25
        Caption = '&Exclui'
        TabOrder = 2
        OnClick = BtnExcluiClick
      end
      object BtnItens: TBitBtn
        Left = 197
        Top = 16
        Width = 65
        Height = 25
        Caption = '&Itens'
        NumGlyphs = 2
        TabOrder = 3
        OnClick = BtnItensClick
      end
      object BtnRecalcular: TButton
        Left = 280
        Top = 16
        Width = 113
        Height = 25
        Caption = '&Recalcular Custo'
        TabOrder = 4
        OnClick = BtnRecalcularClick
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 215
      Align = alTop
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
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 52
        Height = 13
        Caption = 'Emiss'#227'o(*)'
      end
      object Label3: TLabel
        Left = 88
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Entrada(*)'
      end
      object Label21: TLabel
        Left = 8
        Top = 88
        Width = 62
        Height = 13
        Caption = 'Cod.Forn.(*)'
      end
      object BtnConsFor: TsSpeedButton
        Left = 124
        Top = 104
        Width = 23
        Height = 21
        Hint = 'Consultar Fornecedor'
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
        OnClick = BtnConsForClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddFor: TsSpeedButton
        Left = 149
        Top = 104
        Width = 25
        Height = 21
        Hint = 'Cadastrar Fornecedor'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddForClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label22: TLabel
        Left = 178
        Top = 88
        Width = 128
        Height = 13
        Caption = 'Descri'#231#227'o do Fornecedor'
      end
      object Label4: TLabel
        Left = 176
        Top = 128
        Width = 51
        Height = 13
        Caption = 'Acr'#233'scimo'
      end
      object Label5: TLabel
        Left = 240
        Top = 128
        Width = 49
        Height = 13
        Caption = 'Desconto'
      end
      object Label6: TLabel
        Left = 304
        Top = 128
        Width = 26
        Height = 13
        Caption = 'Frete'
      end
      object Label7: TLabel
        Left = 368
        Top = 128
        Width = 55
        Height = 13
        Caption = 'ICMS Frete'
      end
      object Label8: TLabel
        Left = 88
        Top = 128
        Width = 58
        Height = 13
        Caption = 'Total da NF'
      end
      object Label33: TLabel
        Left = 576
        Top = 48
        Width = 67
        Height = 13
        Caption = 'A Vista/Prazo'
      end
      object Label35: TLabel
        Left = 168
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Nota Fiscal'
      end
      object Label34: TLabel
        Left = 528
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Serie'
      end
      object Label42: TLabel
        Left = 432
        Top = 128
        Width = 58
        Height = 13
        Caption = 'Base S.Trib.'
      end
      object Label43: TLabel
        Left = 504
        Top = 128
        Width = 60
        Height = 13
        Caption = 'ICMS S.Trib.'
      end
      object Label54: TLabel
        Left = 232
        Top = 48
        Width = 40
        Height = 13
        Caption = 'Modelo'
      end
      object BtnConsModelo: TsSpeedButton
        Left = 276
        Top = 64
        Width = 23
        Height = 21
        Hint = 'Consultar Modelo'
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
        OnClick = BtnConsModeloClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label53: TLabel
        Left = 8
        Top = 128
        Width = 75
        Height = 13
        Caption = 'Total Produtos'
      end
      object Label36: TLabel
        Left = 88
        Top = 8
        Width = 86
        Height = 13
        Caption = 'Tipo de Entradas'
      end
      object BtnConsTipo: TsSpeedButton
        Left = 147
        Top = 24
        Width = 25
        Height = 21
        Hint = 'Consultar Tipo de Outras Entradas'
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
        OnClick = BtnConsTipoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAddTipo: TsSpeedButton
        Left = 176
        Top = 24
        Width = 25
        Height = 21
        Hint = 'Cadastrar Outras Entradas'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000101D0E2857A14FDA5BA650E11627
          1335000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003865328A67BC5CFF67BC5CFF4077
          39A1000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000111F0F2A4074
          389E457F3DAC457F3DAC457F3DAC457F3DAC59A14FDC67BC5CFF67BC5CFF5BA7
          51E4457F3DAC457F3DAC457F3DAC457F3DAC407739A116271335509349C967BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF5BA650E14E8E46C267BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC
          5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF67BC5CFF57A14FDA0C170B1F3560
          2F833765318837653188376531883765318853964ACD67BC5CFF67BC5CFF569F
          4ED83765318837653188376531883765318836623085101D0E27000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003C6D359467BC5CFF67BC5CFF457F
          3DAC000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000003562318767BC5CFF67BC5CFF4074
          389E000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C170B1F4E8E46C2519347C8111F
          0F2A000000000000000000000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddTipoClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label58: TLabel
        Left = 200
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object EdtCod: TEdit
        Left = 8
        Top = 24
        Width = 65
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EdtCodFor: TEdit
        Left = 8
        Top = 104
        Width = 113
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Fornecedor'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnEnter = EdtCodForEnter
        OnExit = EdtCodForExit
        OnKeyDown = EdtCodForKeyDown
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtNomeFor: TEdit
        Left = 176
        Top = 104
        Width = 385
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 18
      end
      object EdtAcres: TCurrencyEdit
        Left = 176
        Top = 144
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 11
        ZeroEmpty = False
      end
      object EdtDesc: TCurrencyEdit
        Left = 240
        Top = 144
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 12
        ZeroEmpty = False
      end
      object EdtFrete: TCurrencyEdit
        Left = 304
        Top = 144
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 13
        ZeroEmpty = False
      end
      object EdtICMSFrete: TCurrencyEdit
        Left = 368
        Top = 144
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 14
        ZeroEmpty = False
      end
      object EdtTotalNF: TCurrencyEdit
        Left = 88
        Top = 144
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 10
        ZeroEmpty = False
      end
      object ComboTipo: TComboBox
        Left = 576
        Top = 64
        Width = 129
        Height = 21
        Style = csDropDownList
        Color = clSilver
        TabOrder = 7
        Items.Strings = (
          'A PRAZO'
          'A VISTA')
      end
      object EdtEmissao: TMaskEdit
        Left = 8
        Top = 64
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnExit = EdtEmissaoExit
      end
      object EdtEnt: TMaskEdit
        Left = 88
        Top = 64
        Width = 73
        Height = 21
        Color = clSilver
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnExit = EdtEmissaoExit
      end
      object EdtNumNF: TEdit
        Left = 168
        Top = 64
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 6
        TabOrder = 4
        OnExit = EdtNumNFExit
      end
      object EdtSerie: TEdit
        Left = 528
        Top = 64
        Width = 33
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 3
        TabOrder = 6
      end
      object EdtBaseSub: TCurrencyEdit
        Left = 432
        Top = 144
        Width = 65
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 15
        ZeroEmpty = False
      end
      object EdtICMSSub: TCurrencyEdit
        Left = 504
        Top = 144
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 16
        ZeroEmpty = False
      end
      object GroupBox2: TGroupBox
        Left = 576
        Top = 101
        Width = 129
        Height = 65
        TabOrder = 17
        object CheckFrete: TCheckBox
          Left = 8
          Top = 14
          Width = 97
          Height = 17
          TabStop = False
          Caption = 'Frete Incluso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object CheckSub: TCheckBox
          Left = 8
          Top = 30
          Width = 113
          Height = 17
          TabStop = False
          Caption = 'ICMS Sub.Trib.Incluso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object CheckCustoSemDesconto: TCheckBox
          Left = 8
          Top = 46
          Width = 113
          Height = 17
          TabStop = False
          Caption = 'Custo sem Desconto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object Panel3: TPanel
        Left = 8
        Top = 173
        Width = 697
        Height = 35
        BevelOuter = bvNone
        BevelWidth = 2
        Color = clGradientInactiveCaption
        TabOrder = 19
        object Label31: TLabel
          Left = 5
          Top = 15
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Calc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 239
          Top = 15
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'ICMS Calc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 484
          Top = 15
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'IPI Calc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 591
          Top = 15
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Diferen'#231'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 123
          Top = 14
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base Calc.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 366
          Top = 14
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sub.Trib'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object EdtTotalCalc: TCurrencyEdit
          Left = 56
          Top = 8
          Width = 57
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object EdtTotalICMS: TCurrencyEdit
          Left = 296
          Top = 8
          Width = 57
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
        object EdtTotalIPI: TCurrencyEdit
          Left = 528
          Top = 8
          Width = 49
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
        object EdtDiferenca: TCurrencyEdit
          Left = 640
          Top = 8
          Width = 49
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          ZeroEmpty = False
        end
        object EdtTotalBase: TCurrencyEdit
          Left = 174
          Top = 8
          Width = 57
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          ZeroEmpty = False
        end
        object EdtTotalST: TCurrencyEdit
          Left = 408
          Top = 6
          Width = 57
          Height = 21
          Margins.Top = 1
          TabStop = False
          AutoSize = False
          CheckOnExit = True
          Color = cl3DLight
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Segoe UI'
          Font.Style = []
          FormatOnEditing = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          ZeroEmpty = False
        end
      end
      object EdtCodModelo: TEdit
        Left = 232
        Top = 64
        Width = 41
        Height = 21
        Hint = 'Pressione F2 para Consultar ou F3 para Fornecedor'
        Alignment = taRightJustify
        Color = clSilver
        MaxLength = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnEnter = EdtCodModeloEnter
        OnExit = EdtCodModeloExit
        OnKeyDown = EdtCodModeloKeyDown
      end
      object EdtNomeModelo: TEdit
        Left = 304
        Top = 64
        Width = 209
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object EdtTotalProdutos: TCurrencyEdit
        Left = 8
        Top = 144
        Width = 73
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        AutoSize = False
        CheckOnExit = True
        Color = clSilver
        DisplayFormat = ',#0.00'
        FormatOnEditing = True
        TabOrder = 9
        ZeroEmpty = False
      end
      object EdtCodTipo: TEdit
        Left = 88
        Top = 24
        Width = 57
        Height = 21
        Hint = 
          'Pressione F2 para Consultar ou F3 para Cadastrar Tipo de Outras ' +
          'Entradas'
        Alignment = taRightJustify
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = EdtCodTipoEnter
        OnExit = EdtCodTipoExit
        OnKeyDown = EdtCodTipoKeyDown
        OnKeyPress = EdtCodForKeyPress
      end
      object EdtNomeTipo: TEdit
        Left = 203
        Top = 24
        Width = 501
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 21
      end
    end
  end
  inherited Panel2: TPanel
    Width = 717
    Height = 112
    ExplicitWidth = 717
    inherited ToolBar1: TToolBar
      Width = 717
      Height = 112
      ExplicitWidth = 717
      ExplicitHeight = 112
      inherited BtnNovo: TToolButton
        ExplicitWidth = 75
      end
      inherited BtnAlterar: TToolButton
        OnClick = BtnAlterarClick
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
        ExplicitHeight = 60
      end
      inherited BtnConsultar: TToolButton
        Left = 0
        Top = 60
        OnClick = BtnConsultarClick
        ExplicitLeft = 0
        ExplicitTop = 60
      end
      inherited BtnSair: TToolButton
        Left = 81
        Top = 60
        ExplicitLeft = 81
        ExplicitTop = 60
      end
      object ToolButton1: TToolButton
        Left = 162
        Top = 60
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object BtnFinalizar: TToolButton
        Left = 170
        Top = 60
        Caption = 'Finalizar'
        ImageIndex = 7
        OnClick = BtnFinalizarClick
      end
      object Importar: TToolButton
        Left = 251
        Top = 60
        Caption = 'Importar XML'
        ImageIndex = 8
        OnClick = ImportarClick
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 607
    Width = 717
    ExplicitTop = 607
    ExplicitWidth = 717
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBTREnt: TFDTransaction
    Connection = DM.IBDatabase
    Left = 576
    Top = 64
  end
  object QInsEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREnt
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_ENTRADAS (:CODEMP, :DATAEMI, :DATAENT, :CODFOR, :' +
        'TOTAL, :ACRES, :DESC, :FRETE, :ICMSFRETE, :TIPOENT,  :NUMNFENT, ' +
        ':SERIE, :BASESUB, :ICMSSUB, :FRETEINCLUSO, :ICMSSUBINCLUSO, :MOD' +
        'ELO, :TOTALPRODUTOS, :CUSTOSEMDESCONTO, :CODIGOES)')
    Left = 424
    ParamData = <
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end
      item
        Name = 'DATAEMI'
        DataType = ftDate
      end
      item
        Name = 'DATAENT'
        DataType = ftDate
      end
      item
        Name = 'CODFOR'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'ACRES'
        DataType = ftCurrency
      end
      item
        Name = 'DESC'
        DataType = ftCurrency
      end
      item
        Name = 'FRETE'
        DataType = ftCurrency
      end
      item
        Name = 'ICMSFRETE'
        DataType = ftCurrency
      end
      item
        Name = 'TIPOENT'
        DataType = ftString
      end
      item
        Name = 'NUMNFENT'
        DataType = ftString
      end
      item
        Name = 'SERIE'
        DataType = ftString
      end
      item
        Name = 'BASESUB'
        DataType = ftCurrency
      end
      item
        Name = 'ICMSSUB'
        DataType = ftCurrency
      end
      item
        Name = 'FRETEINCLUSO'
        DataType = ftString
      end
      item
        Name = 'ICMSSUBINCLUSO'
        DataType = ftString
      end
      item
        Name = 'MODELO'
      end
      item
        Name = 'TOTALPRODUTOS'
        DataType = ftCurrency
      end
      item
        Name = 'CUSTOSEMDESCONTO'
      end
      item
        Name = 'CODIGOES'
      end>
    object QInsEntradaCODENT: TIntegerField
      FieldName = 'CODENT'
      Origin = 'INSERT_ENTRADAS.CODENT'
    end
  end
  object QBuscaItens: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREnt
    SQL.Strings = (
      
        'SELECT I.*, P.NOME_PRO, P.VALOR_PRO, P.MARGEM_LUCRO_PRO,  G.NOME' +
        '_GRP, G.TIPO_GRP'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN PRODUTO P'
      'ON (I.COD_PRO = P.COD_PRO)'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'WHERE COD_ENT = :CODENT'
      'ORDER BY I.ORDEM')
    Left = 656
    Top = 360
    ParamData = <
      item
        Name = 'CODENT'
        DataType = ftInteger
      end>
    object QBuscaItensCOD_ENT: TIntegerField
      FieldName = 'COD_ENT'
      Origin = 'ITENS_ENTRADA.COD_ENT'
      Required = True
    end
    object QBuscaItensCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Origin = 'ITENS_ENTRADA.COD_PRO'
      Required = True
    end
    object QBuscaItensQTD_PRO: TBCDField
      FieldName = 'QTD_PRO'
      Origin = 'ITENS_ENTRADA.QTD_PRO'
      Required = True
      DisplayFormat = ',#0.000'
      EditFormat = ',#0.000'
      Precision = 18
      Size = 3
    end
    object QBuscaItensPERC_ICMS: TBCDField
      FieldName = 'PERC_ICMS'
      Origin = 'ITENS_ENTRADA.PERC_ICMS'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensPERC_IPI: TBCDField
      FieldName = 'PERC_IPI'
      Origin = 'ITENS_ENTRADA.PERC_IPI'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensQTDUND_ENT: TBCDField
      FieldName = 'QTDUND_ENT'
      Origin = 'ITENS_ENTRADA.QTDUND_ENT'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensPERC_DESC: TBCDField
      FieldName = 'PERC_DESC'
      Origin = 'ITENS_ENTRADA.PERC_DESC'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensPERC_ACRES: TBCDField
      FieldName = 'PERC_ACRES'
      Origin = 'ITENS_ENTRADA.PERC_ACRES'
      DisplayFormat = ',#0.00'
      EditFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNOME_PRO: TStringField
      DisplayWidth = 80
      FieldName = 'NOME_PRO'
      Origin = 'PRODUTO.NOME_PRO'
      Required = True
      Size = 80
    end
    object QBuscaItensCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'ITENS_ENTRADA.COD_EMP'
      Required = True
    end
    object QBuscaItensVALOR_UNIT_PRO: TBCDField
      FieldName = 'VALOR_UNIT_PRO'
      Origin = 'ITENS_ENTRADA.VALOR_UNIT_PRO'
      Required = True
      DisplayFormat = ',#0.0000'
      Precision = 18
    end
    object QBuscaItensCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'ITENS_ENTRADA.CUSTO'
      DisplayFormat = ',#0.0000'
      Precision = 18
    end
    object QBuscaItensVALOR_PRO: TBCDField
      FieldName = 'VALOR_PRO'
      Origin = 'PRODUTO.VALOR_PRO'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaItensCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = 'ITENS_ENTRADA.COD_GRP'
    end
    object QBuscaItensCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = 'ITENS_ENTRADA.COD_CFOP'
    end
    object QBuscaItensMARGEM_LUCRO_PRO: TBCDField
      FieldName = 'MARGEM_LUCRO_PRO'
      Origin = 'PRODUTO.MARGEM_LUCRO_PRO'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'ITENS_ENTRADA.VALOR_DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_ACRESCIMO: TBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Origin = 'ITENS_ENTRADA.VALOR_ACRESCIMO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensNOME_GRP: TStringField
      FieldName = 'NOME_GRP'
      Origin = 'GRUPO_ICMS.NOME_GRP'
      Required = True
      Size = 50
    end
    object QBuscaItensPERC_BCR: TBCDField
      FieldName = 'PERC_BCR'
      Origin = 'ITENS_ENTRADA.PERC_BCR'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = 'GRUPO_ICMS.TIPO_GRP'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensPERC_ST: TBCDField
      FieldName = 'PERC_ST'
      Origin = 'ITENS_ENTRADA.PERC_ST'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QBuscaItensCST: TStringField
      FieldName = 'CST'
      Origin = 'ITENS_ENTRADA.CST'
      FixedChar = True
      Size = 3
    end
    object QBuscaItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_ENTRADA.VALOR_TOTAL'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QBuscaItensBASE_CALCULO: TBCDField
      FieldName = 'BASE_CALCULO'
      Origin = 'ITENS_ENTRADA.BASE_CALCULO'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QBuscaItensVALOR_ICMS: TBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'ITENS_ENTRADA.VALOR_ICMS'
      DisplayFormat = ',#0.00'
      Precision = 18
    end
    object QBuscaItensORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ITENS_ENTRADA.ORDEM'
      Required = True
    end
    object QBuscaItensVALOR_SUB_TRIBUTARIA: TBCDField
      FieldName = 'VALOR_SUB_TRIBUTARIA'
      Origin = 'ITENS_ENTRADA.VALOR_SUB_TRIBUTARIA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object QBuscaItensVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'ITENS_ENTRADA.VALOR_IPI'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSQBuscaItens: TDataSource
    AutoEdit = False
    DataSet = QBuscaItens
    Left = 656
    Top = 408
  end
  object QDelEntrada: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREnt
    SQL.Strings = (
      'DELETE FROM ENTRADAS'
      'WHERE COD_ENT = :CODENT')
    Left = 464
    Top = 16
    ParamData = <
      item
        Name = 'CODENT'
        DataType = ftInteger
      end>
  end
  object QUpdEnt: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTREnt
    SQL.Strings = (
      'UPDATE ENTRADAS'
      
        'SET DATAEMI_ENT = :DATAEMIENT, DATAENT_ENT = :DATAENTENT, COD_FO' +
        'R = :CODFOR, TOTAL_ENT = :TOTALENT, ACRES_ENT = :ACRESENT, DESC_' +
        'ENT = :DESCENT, FRETE_ENT = :FRETEENT, ICMSFRETE_ENT = :ICMSFRET' +
        'EENT, TIPO_ENT = :TIPOENT, NUMNF_ENT = :NUMNFENT, SERIE_ENT = :S' +
        'ERIE,  BASE_SUB_TRIB = :BASESUB, VALOR_ICMS_SUB = :ICMSSUB,'
      
        'FRETE_INCLUSO = :FRETEINCLUSO, ICMS_SUB_INCLUSO = :ICMSSUBINCLUS' +
        'O, CODIFICACAO_FISCAL = :MODELO, TOTAL_PRODUTOS = :TOTALPRODUTOS'
      'WHERE COD_ENT = :CODENT')
    Left = 528
    Top = 8
    ParamData = <
      item
        Name = 'DATAEMIENT'
        DataType = ftDate
      end
      item
        Name = 'DATAENTENT'
        DataType = ftDate
      end
      item
        Name = 'CODFOR'
        DataType = ftInteger
      end
      item
        Name = 'TOTALENT'
        DataType = ftCurrency
      end
      item
        Name = 'ACRESENT'
        DataType = ftCurrency
      end
      item
        Name = 'DESCENT'
        DataType = ftCurrency
      end
      item
        Name = 'FRETEENT'
        DataType = ftCurrency
      end
      item
        Name = 'ICMSFRETEENT'
        DataType = ftCurrency
      end
      item
        Name = 'TIPOENT'
        DataType = ftString
      end
      item
        Name = 'NUMNFENT'
        DataType = ftString
      end
      item
        Name = 'SERIE'
        DataType = ftString
      end
      item
        Name = 'BASESUB'
        DataType = ftCurrency
      end
      item
        Name = 'ICMSSUB'
        DataType = ftCurrency
      end
      item
        Name = 'FRETEINCLUSO'
        DataType = ftString
      end
      item
        Name = 'ICMSSUBINCLUSO'
        DataType = ftString
      end
      item
        Name = 'MODELO'
      end
      item
        Name = 'TOTALPRODUTOS'
        DataType = ftCurrency
      end
      item
        Name = 'CODENT'
        DataType = ftInteger
      end>
  end
  object IBTRItem: TFDTransaction
    Connection = DM.IBDatabase
    Left = 704
    Top = 272
  end
  object IBSQLItem: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRItem
    Left = 660
    Top = 504
  end
  object QInsRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT *'
      
        'FROM SP_INSERT_REG_ENTRADAS(:DATA, :CODFOR, :CNPJ, :CODMODELO, :' +
        'SERIE, :NUMERONOTA, :EMITENTE, :VALORTOTAL, :SITUACAO, :CODEMP, ' +
        ':CODENTRADA, :UF, :INSC, :SUBSERIE, :CIFFOB, :CODNF)')
    Left = 632
    Top = 272
    ParamData = <
      item
        Name = 'DATA'
      end
      item
        Name = 'CODFOR'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'CODMODELO'
      end
      item
        Name = 'SERIE'
      end
      item
        Name = 'NUMERONOTA'
      end
      item
        Name = 'EMITENTE'
      end
      item
        Name = 'VALORTOTAL'
      end
      item
        Name = 'SITUACAO'
      end
      item
        Name = 'CODEMP'
      end
      item
        Name = 'CODENTRADA'
      end
      item
        Name = 'UF'
      end
      item
        Name = 'INSC'
      end
      item
        Name = 'SUBSERIE'
      end
      item
        Name = 'CIFFOB'
      end
      item
        Name = 'CODNF'
      end>
    object QInsRegistroCODREG: TIntegerField
      FieldName = 'CODREG'
      Origin = 'SP_INSERT_REG_ENTRADAS.CODREG'
    end
  end
  object QItensRegistro: TFDQuery
    OnCalcFields = QItensRegistroCalcFields
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT SUM(I.VALOR_TOTAL) VALORTOTAL, SUM(I.BASE_CALCULO)'
      'BASECALCULO, SUM(I.VALOR_ICMS) VALORICMS, '
      
        'SUM((I.QTD_PRO * I.VALOR_UNIT_PRO) - I.VALOR_DESCONTO) TOTAL_PRO' +
        'DUTO, I.COD_GRP, I.COD_CFOP, G.ALIQUOTA_GRP, '
      
        'SUM(((I.QTD_PRO * I.VALOR_UNIT_PRO)  * I.PERC_IPI) / 100) VALOR_' +
        'PERC_IPI, SUM(VALOR_IPI) VALOR_IPI, '
      'G.TIPO_GRP'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN GRUPO_ICMS G'
      'ON (I.COD_GRP = G.COD_GRP)'
      'WHERE COD_ENT = :CODENT'
      'GROUP BY I.COD_GRP, I.COD_CFOP, G.ALIQUOTA_GRP, G.TIPO_GRP')
    Left = 448
    Top = 272
    ParamData = <
      item
        Name = 'CODENT'
      end>
    object QItensRegistroVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      ProviderFlags = []
      Precision = 18
    end
    object QItensRegistroBASECALCULO: TBCDField
      FieldName = 'BASECALCULO'
      ProviderFlags = []
      Precision = 18
    end
    object QItensRegistroVALORICMS: TBCDField
      FieldName = 'VALORICMS'
      ProviderFlags = []
      Precision = 18
    end
    object QItensRegistroTOTAL_PRODUTO: TFMTBCDField
      FieldName = 'TOTAL_PRODUTO'
      ProviderFlags = []
      Precision = 18
      Size = 7
    end
    object QItensRegistroCOD_GRP: TIntegerField
      FieldName = 'COD_GRP'
      Origin = '"ITENS_ENTRADA"."COD_GRP"'
    end
    object QItensRegistroCOD_CFOP: TIntegerField
      FieldName = 'COD_CFOP'
      Origin = '"ITENS_ENTRADA"."COD_CFOP"'
    end
    object QItensRegistroALIQUOTA_GRP: TBCDField
      FieldName = 'ALIQUOTA_GRP'
      Origin = '"GRUPO_ICMS"."ALIQUOTA_GRP"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QItensRegistroVALOR_PERC_IPI: TFloatField
      FieldName = 'VALOR_PERC_IPI'
      ProviderFlags = []
    end
    object QItensRegistroVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object QItensRegistroTIPO_GRP: TStringField
      FieldName = 'TIPO_GRP'
      Origin = '"GRUPO_ICMS"."TIPO_GRP"'
      FixedChar = True
      Size = 3
    end
    object QItensRegistroCALC_VALOR_IPI: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_IPI'
      Calculated = True
    end
  end
  object QInsItensRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTRAux
    SQL.Strings = (
      'INSERT INTO ITENS_REGISTRO_LIVRO_ENTRADAS ('
      
        'CODIGO, ORDEM, CFOP, BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUT' +
        'ADA, OUTRAS, ALIQUOTA, CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO,' +
        ' BASE_CALCULO_RETIDO)'
      'VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)')
    Left = 544
    Top = 272
    ParamData = <
      item
        Name = '1'
      end
      item
        Name = '2'
      end
      item
        Name = '3'
      end
      item
        Name = '4'
      end
      item
        Name = '5'
      end
      item
        Name = '6'
      end
      item
        Name = '7'
      end
      item
        Name = '8'
      end
      item
        Name = '9'
      end
      item
        Name = '10'
      end
      item
        Name = '11'
      end
      item
        Name = '12'
      end>
  end
  object QBuscaRegistro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT R.*, F.RAZAO_FOR, M.DESCRICAO'
      'FROM REGISTRO_LIVRO_ENTRADAS R'
      'INNER JOIN FORNECEDOR F'
      'ON (R.COD_FOR = F.COD_FOR)'
      'INNER JOIN CODIFICACAO_DOCUMENTOS M'
      'ON (R.CODIFICACAO_FISCAL = M.CODIGO)'
      'WHERE R.CODIGO = :COD'
      '')
    Left = 656
    Top = 456
    ParamData = <
      item
        Name = 'COD'
      end>
    object QBuscaRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO'
      Required = True
    end
    object QBuscaRegistroDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.DATA'
      Required = True
    end
    object QBuscaRegistroCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CNPJ'
      Required = True
      Size = 14
    end
    object QBuscaRegistroSERIE_NOTA: TStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SERIE_NOTA'
      Size = 3
    end
    object QBuscaRegistroNUMERO_NOTA: TIntegerField
      FieldName = 'NUMERO_NOTA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.NUMERO_NOTA'
      Required = True
    end
    object QBuscaRegistroEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.EMITENTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object QBuscaRegistroSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QBuscaRegistroCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_EMPRESA'
      Required = True
    end
    object QBuscaRegistroCODIGO_ENTRADA: TIntegerField
      FieldName = 'CODIGO_ENTRADA'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIGO_ENTRADA'
    end
    object QBuscaRegistroINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.INSCRICAO'
      Required = True
      Size = 14
    end
    object QBuscaRegistroUF: TStringField
      FieldName = 'UF'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.UF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QBuscaRegistroCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.COD_FOR'
      Required = True
    end
    object QBuscaRegistroRAZAO_FOR: TStringField
      FieldName = 'RAZAO_FOR'
      Origin = 'FORNECEDOR.RAZAO_FOR'
      Required = True
      Size = 60
    end
    object QBuscaRegistroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'MODELO_NOTA_FISCAL.DESCRICAO'
      Required = True
      Size = 80
    end
    object QBuscaRegistroSUB_SERIE: TStringField
      FieldName = 'SUB_SERIE'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.SUB_SERIE'
      Size = 2
    end
    object QBuscaRegistroCIF_FOB: TIntegerField
      FieldName = 'CIF_FOB'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CIF_FOB'
    end
    object QBuscaRegistroCODIFICACAO_FISCAL: TStringField
      FieldName = 'CODIFICACAO_FISCAL'
      Origin = 'REGISTRO_LIVRO_ENTRADAS.CODIFICACAO_FISCAL'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
end
