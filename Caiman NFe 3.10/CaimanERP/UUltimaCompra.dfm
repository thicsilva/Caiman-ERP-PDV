object FrmUltimaCompra: TFrmUltimaCompra
  Left = 299
  Top = 246
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #218'ltima Compra / Venda'
  ClientHeight = 358
  ClientWidth = 599
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
    Width = 599
    Height = 49
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 0
    object EdtCodPro: TEdit
      Left = 8
      Top = 14
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtNomePro: TEdit
      Left = 80
      Top = 14
      Width = 505
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 599
    Height = 290
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelWidth = 2
    Color = 16710131
    TabOrder = 1
    object GroupBox7: TGroupBox
      Left = 8
      Top = 8
      Width = 297
      Height = 241
      Caption = 'Compras'
      TabOrder = 0
      object Label8: TLabel
        Left = 8
        Top = 40
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Data Emiss'#227'o:'
      end
      object Label9: TLabel
        Left = 8
        Top = 72
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fornecedor:'
      end
      object Label19: TLabel
        Left = 8
        Top = 88
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nota Fiscal:'
      end
      object Label20: TLabel
        Left = 8
        Top = 104
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Quant.:'
      end
      object Label21: TLabel
        Left = 8
        Top = 120
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Unit'#225'rio:'
      end
      object Label22: TLabel
        Left = 8
        Top = 136
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Frete:'
      end
      object Label42: TLabel
        Left = 8
        Top = 200
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'ICMS:'
      end
      object Label43: TLabel
        Left = 8
        Top = 216
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IPI:'
      end
      object LDataEmissao: TLabel
        Left = 88
        Top = 40
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LDataEmissao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFornec: TLabel
        Left = 88
        Top = 72
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LFornec'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LNF: TLabel
        Left = 88
        Top = 88
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LQuantCompra: TLabel
        Left = 88
        Top = 104
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LQuantCompra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LUnitCompra: TLabel
        Left = 88
        Top = 120
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LUnitCompra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFrete: TLabel
        Left = 88
        Top = 136
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LFrete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LICMS: TLabel
        Left = 88
        Top = 200
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LIPI: TLabel
        Left = 88
        Top = 216
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LIPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label56: TLabel
        Left = 8
        Top = 152
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vl.Desconto:'
      end
      object Label57: TLabel
        Left = 8
        Top = 168
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vl.Acr'#233'scimo:'
      end
      object LVlDesconto: TLabel
        Left = 88
        Top = 152
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LVlDesconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LVlAcrescimo: TLabel
        Left = 88
        Top = 168
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LPercDesconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 8
        Top = 56
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Data Entrada:'
      end
      object LDataEntrada: TLabel
        Left = 88
        Top = 56
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LDataEntrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label68: TLabel
        Left = 8
        Top = 184
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vl.Sub.Trib.:'
      end
      object LVlSubTrib: TLabel
        Left = 88
        Top = 184
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LVlSubTrib'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 8
        Top = 24
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Empresa:'
      end
      object LEmpresa: TLabel
        Left = 88
        Top = 24
        Width = 201
        Height = 13
        AutoSize = False
        Caption = 'LEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox8: TGroupBox
      Left = 320
      Top = 8
      Width = 265
      Height = 241
      Caption = #218'ltima Venda'
      TabOrder = 1
      object Label44: TLabel
        Left = 8
        Top = 24
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Data:'
      end
      object Label45: TLabel
        Left = 8
        Top = 40
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cliente:'
      end
      object Label46: TLabel
        Left = 8
        Top = 56
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
      end
      object Label47: TLabel
        Left = 8
        Top = 88
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Quant.:'
      end
      object Label48: TLabel
        Left = 8
        Top = 104
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Unit'#225'rio:'
      end
      object LDataVenda: TLabel
        Left = 96
        Top = 24
        Width = 129
        Height = 13
        AutoSize = False
        Caption = 'LDataVenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LCliente: TLabel
        Left = 96
        Top = 40
        Width = 161
        Height = 13
        AutoSize = False
        Caption = 'LCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LQuantVenda: TLabel
        Left = 96
        Top = 88
        Width = 129
        Height = 13
        AutoSize = False
        Caption = 'LQuantVenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LUnitVenda: TLabel
        Left = 96
        Top = 104
        Width = 129
        Height = 13
        AutoSize = False
        Caption = 'LUnitVenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 8
        Top = 56
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cupom Fiscal:'
      end
      object Label90: TLabel
        Left = 8
        Top = 72
        Width = 81
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nota Fiscal:'
      end
      object LCOO: TLabel
        Left = 96
        Top = 56
        Width = 129
        Height = 13
        AutoSize = False
        Caption = 'LCOO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LNFSaida: TLabel
        Left = 96
        Top = 72
        Width = 129
        Height = 13
        AutoSize = False
        Caption = 'LNF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox9: TGroupBox
      Left = 8
      Top = 248
      Width = 297
      Height = 33
      TabOrder = 2
      object BtnPrimeiro: TsSpeedButton
        Left = 7
        Top = 8
        Width = 65
        Height = 22
        Hint = 'Primeira Compra'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130F0000130F00000001000000010000000094000000
          9C0008009C0000089C0008089C0010189C000000A5000800A5000008A5000808
          A5001010A5001018A5000000AD000008AD001008AD000010AD000018AD000000
          B5000008B5000010B5003131B5003939B5000000BD000008BD000010BD000810
          BD000018BD000818BD001018BD001021BD003139BD004242BD00424ABD004A4A
          BD00525ABD006363BD00736BBD006373BD000008C6000010C6000810C6000018
          C6000021C6000821C6000029C6001031C6005A5AC6006363C6006B63C6006373
          C6000010CE000810CE000018CE000021CE000029CE002129CE002929CE00737B
          CE007384CE008484CE000018D6000818D6000021D6000829D6001029D6001829
          D6002929D6000831D6001031D6001831D6007B84D6008484D6008C84D600848C
          D6000018DE000021DE000029DE001829DE001031DE002931DE002142DE002942
          DE003152DE003952DE00395ADE000018E7000021E7000821E7001029E7000831
          E7001031E7001831E7002131E7001039E7001042E7003142E7000021EF000029
          EF000831EF001031EF001839EF001042EF001842EF002142EF00214AEF00314A
          EF003152EF00425AEF00527BEF00BDC6EF000029F7000839F7001839F7001842
          F7002142F700314AF700425AF700426BF7004A73F700B5CEF700C6D6F700BDDE
          F700D6DEF700FF00FF004A6BFF005273FF00C6D6FF00CED6FF00DED6FF00CEDE
          FF00D6DEFF00DEDEFF00DEE7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B7B7B7B
          7B751B7B7B7B7B7B7B7B7B7B7B7B7B7B752A297B7B7B7B7B7B7B7B7B7B7B7B75
          1A40277B7B7B7B7B7B7B7B7B7B7B752A44341C7B7B7B7B7B7B7B7B7B7B752A6C
          3C3C2718131D212020307B7B752A6C5A35341A2713080308150D7B752A6C564C
          3E342927120F0608010D752A7D68614B3E342918130D0407150D752A6C5E5657
          35342918120D0806010D7B752A75573E3E342918130D0809010D7B7B752A6C44
          3E3429180D0F0907150D7B7B7B751A6C3E352918191D202020247B7B7B7B752A
          3F3D1B7B7B7B7B7B7B7B7B7B7B7B7B751A352A7B7B7B7B7B7B7B7B7B7B7B7B7B
          752A2A7B7B7B7B7B7B7B7B7B7B7B7B7B7B75197B7B7B7B7B7B7B}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPrimeiroClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnAnterior: TsSpeedButton
        Left = 78
        Top = 8
        Width = 65
        Height = 22
        Hint = 'Compra Anterior'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000003100000042
          0000004A000000520000006B0000004A080000630800006B0800007B0800008C
          080000940800009C080000A50800006B10000873100000A51000089C180000A5
          180008A5180008AD180008842100109C210008A5210010AD2100108C290008A5
          290008AD290008B5290010A5310018A5310021A5310008AD310010AD3100189C
          390010AD390010A5420010B5420029A54A0010AD4A0018B54A0021BD4A0042BD
          4A0018B5520021B5520039B5520029BD520042BD52004AC6520029BD5A0039BD
          5A0042BD5A0042C65A0031BD630039BD630042BD63004ABD630039BD6B004ABD
          6B0042C673004AC6730052C673004AC67B0052C67B0073D67B0063CE8C006BCE
          8C006BD68C0084D68C0073D694007BDE9C0084DEA5008CDEAD0094DEB50094E7
          B5009CE7B500ADE7B500B5E7B500A5E7BD00B5E7BD00A5E7C600ADE7C600B5EF
          C600BDEFCE00BDEFD600C6F7DE00D6F7DE00D6F7E700E7F7EF00EFFFEF00F7FF
          F700FF00FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A5A5A00
          01030301005A5A5A5A5A5A5A5A0101080B0B0B0B0802025A5A5A5A5A05060F0C
          0B0B0B0B0C0C07005A5A5A050D16120B0B0B0B0B0B0B0C07025A5A05201A120F
          2F5755170B0B0B0C025A0314241C1029595C430F0B0B0B0C0801032327202959
          5C3F0B0B0B0B0B0C0A010D2B2B44585C59514E4B4B4B4B0B0B020E3830525C5C
          5C5C5C5C5C5C5C0B0B030E3E3A304D5C59463232323232120B010E39462B2B48
          5C573C202020191209015A1E50412627475C592D1C191613075A5A1E3C53402B
          2A48502B22202015075A5A5A1541564A3E35303434281C065A5A5A5A5A373748
          534F47453D21215A5A5A5A5A5A5A5A1E2C363625185A5A5A5A5A}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPrimeiroClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnProximo: TsSpeedButton
        Left = 150
        Top = 8
        Width = 65
        Height = 22
        Hint = 'Pr'#243'xima Compra'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000003100000042
          0000004A000000520000006B0000004A080000630800006B0800007B0800008C
          080000940800009C080000A50800006B10000873100000A51000089C180000A5
          180008A5180008AD180008842100109C210008A5210010AD2100108C290008A5
          290008AD290010AD290008B5290010A5310018A5310021A5310010AD310018AD
          3100189C390010AD390010A5420010B5420029A54A0010AD4A0018B54A0021BD
          4A0039BD4A0042BD4A0018B5520021B5520039B552004AC6520029BD5A0052C6
          5A0031BD630039BD630042BD63004ABD630039BD6B004ABD6B0042C673004AC6
          730052C673004AC67B0052C67B0052CE7B0073D67B0052CE840063CE8C006BCE
          8C006BD68C0084D68C007BD694007BDE9C0084DE9C008CDE9C0084DEA50094DE
          A50094DEB50094E7B5009CE7B500ADE7B500A5E7C600ADE7C600B5EFC600BDEF
          C600BDEFCE00BDEFD600C6F7DE00D6F7DE00D6F7E700E7F7EF00EFFFEF00F7FF
          F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A5A5A00
          01030301005A5A5A5A5A5A5A5A0101080B0B0B0B0802025A5A5A5A5A05060F0C
          0B0B0B0B0C0C07005A5A5A050D16120B0B0B0B0B0B0B0C07025A5A05201B120F
          1755572F0B0B0B0C025A0314251B100B10435B592B0B0B0C0801032428200F0B
          0B0B3E5B592B0B0C0A010D2D2D525150505050595B58310B0B020E36305B5B5B
          5B5B5B5B5B5B4D0B0B030E3C383C3F3F3F3944595B4921120B010E37482D282D
          2D3C575B4620191209015A1F4F41272836595B4620191613075A5A1F3A53402D
          2D4F4A2823201B15075A5A5A1541564C3C33303232291D065A5A5A5A5A35354A
          534E4A453B22225A5A5A5A5A5A5A5A1F2E343426185A5A5A5A5A}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPrimeiroClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object BtnUltimo: TsSpeedButton
        Left = 222
        Top = 8
        Width = 65
        Height = 22
        Hint = #218'ltima Compra'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130F0000130F00000001000000010000000094000000
          9C0008009C0000089C0008089C0010189C000000A5000800A5000008A5000808
          A5001010A5001018A5000000AD000008AD001008AD000010AD000018AD000000
          B5000008B5000010B5003131B5003939B5000000BD000008BD000010BD000810
          BD000018BD000818BD001018BD001021BD003139BD004242BD00424ABD004A4A
          BD00525ABD006363BD00736BBD006373BD000008C6000010C6000810C6000018
          C6000021C6000821C6000029C6001031C6005A5AC6006363C6006B63C6006373
          C6000010CE000810CE000018CE000021CE000029CE002129CE002929CE00737B
          CE007384CE008484CE000018D6000818D6000021D6000829D6001029D6001829
          D6002929D6000831D6001031D6001831D6007B84D6008484D6008C84D600848C
          D6000018DE000021DE000029DE001829DE001031DE002931DE002142DE002942
          DE003152DE003952DE00395ADE000018E7000021E7000821E7001029E7000831
          E7001031E7001831E7002131E7001039E7001042E7003142E7000021EF000029
          EF000831EF001031EF001839EF001042EF001842EF002142EF00214AEF00314A
          EF003152EF00425AEF00527BEF00BDC6EF000029F7000839F7001839F7001842
          F7002142F700314AF700425AF700426BF7004A73F700B5CEF700C6D6F700BDDE
          F700D6DEF700FF00FF004A6BFF005273FF00C6D6FF00CED6FF00DED6FF00CEDE
          FF00D6DEFF00DEDEFF00DEE7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B7B7B7B
          7B1B757B7B7B7B7B7B7B7B7B7B7B7B7B7B292A757B7B7B7B7B7B7B7B7B7B7B7B
          7B27401A757B7B7B7B7B7B7B7B7B7B7B7B1C34442A757B7B7B7B302020211D13
          18273C3C6C2A757B7B7B0D1508030813271A34355A6C2A757B7B0D0108060F12
          2729343E4C566C2A757B0D1507040D131829343E4B61687D2A750D0106080D12
          1829343557565E6C2A750D0109080D131829343E3E57752A757B0D1507090F0D
          1829343E446C2A757B7B242020201D191829353E6C1A757B7B7B7B7B7B7B7B7B
          7B1B3D3F2A757B7B7B7B7B7B7B7B7B7B7B2A351A757B7B7B7B7B7B7B7B7B7B7B
          7B2A2A757B7B7B7B7B7B7B7B7B7B7B7B7B19757B7B7B7B7B7B7B}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPrimeiroClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 339
    Width = 599
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'ESC p/sair'
  end
  object QCompras: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      'SELECT I.*, E.*, F.RAZAO_FOR, EMP.RAZAO_EMP'
      'FROM ITENS_ENTRADA I'
      'INNER JOIN ENTRADAS E'
      'ON (I.COD_ENT = E.COD_ENT)'
      'INNER JOIN FORNECEDOR F'
      'ON (E.COD_FOR = F.COD_FOR)'
      'INNER JOIN EMPRESA EMP'
      'ON (I.COD_EMP = EMP.COD_EMP)'
      'WHERE I.COD_PRO = :CODPRO')
    Left = 368
    Top = 224
    ParamData = <
      item
        Name = 'CODPRO'
      end>
  end
  object QUltimaVenda: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT I.QUANT, I.VALOR, V.DATA_VEN, V.CUPOM_FISCAL_VEN, V.NUMER' +
        'O_NOTA_FISCAL, C.NOME_CLI'
      'FROM ITENS_VENDA I'
      'INNER JOIN VENDAS V'
      'ON (I.COD_VEN = V.COD_VEN)'
      'INNER JOIN CLIENTE C'
      'ON (V.COD_CLI = C.COD_CLI)'
      
        'WHERE I.COD_VEN = :CODVEN AND I.COD_PRO = :CODPRO AND I.COD_EMP ' +
        '= :CODEMP AND CANCELADO = 0 AND VENDA_CANCELADA = 0')
    Left = 440
    Top = 224
    ParamData = <
      item
        Name = 'CODVEN'
        DataType = ftInteger
      end
      item
        Name = 'CODPRO'
        DataType = ftInteger
      end
      item
        Name = 'CODEMP'
        DataType = ftInteger
      end>
  end
end
