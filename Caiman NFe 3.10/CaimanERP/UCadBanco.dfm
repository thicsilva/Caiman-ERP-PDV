inherited FrmCadBanco: TFrmCadBanco
  Left = 383
  Top = 178
  Caption = 'Cadastro de Banco'
  ClientHeight = 308
  ClientWidth = 378
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 384
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited Shape1: TShape
    Width = 378
  end
  inherited Panel1: TPanel
    Width = 378
    Height = 227
    ExplicitWidth = 378
    ExplicitHeight = 227
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
      Width = 49
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object cod_ban: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = cod_banKeyPress
    end
    object EdtNome: TEdit
      Left = 8
      Top = 64
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      Color = clSilver
      MaxLength = 50
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 92
      Width = 378
      Height = 135
      Align = alBottom
      Caption = 'Configura'#231#227'o Boleto [Linha/Coluna]'
      TabOrder = 2
      object Label3: TLabel
        Left = 104
        Top = 24
        Width = 68
        Height = 13
        Caption = 'Data Emissao'
      end
      object Label4: TLabel
        Left = 200
        Top = 24
        Width = 60
        Height = 13
        Caption = 'Documento'
      end
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Data Venc.'
      end
      object Label6: TLabel
        Left = 8
        Top = 72
        Width = 27
        Height = 13
        Caption = 'Valor'
      end
      object Label7: TLabel
        Left = 104
        Top = 72
        Width = 53
        Height = 13
        Caption = 'Instru'#231#245'es'
      end
      object Label8: TLabel
        Left = 200
        Top = 72
        Width = 37
        Height = 13
        Caption = 'Sacado'
      end
      object Label9: TLabel
        Left = 288
        Top = 72
        Width = 61
        Height = 13
        Caption = 'Linhas Final'
      end
      object Image1: TImage
        Left = 170
        Top = 105
        Width = 24
        Height = 24
        AutoSize = True
        Center = True
        Picture.Data = {
          0B54504E474772617068696336090000424D3609000000000000360000002800
          0000180000001800000001002000000000000009000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00514E
          4FFF514E4FFF514E4FFF514E4FFF514E4FFF514E4FFF514E4FFF514E4FFF514E
          4FFF514E4FFF514E4FFF514E4FFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005754
          55FF535052FF848081FF848081FF848081FF848081FF848081FF848081FF8480
          81FF848081FF535052FF575455FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00C3712200C3712200C3712200C3712200C3712200C37122005D5B
          5CFF4A474AFFB2ADADFFD3D0D0FFD3D0D0FFD3D0D0FFD3D0D0FFD3D0D0FFD3D0
          D0FFB2ADADFF4A474AFF5D5B5CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00C5742400C5742400C574240FC5742433C5742433C5742433605E
          5FFF403E40FFA7A2A2FFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9EAFFEAE9
          EAFFA7A2A2FF403E40FF646263FFC5742433C5742433C5742433C5742403FFFF
          FF00FFFFFF00C777271EC77727C0CA7D2CFFD28B38FF54493EFF424142FF403F
          40FF3E3D3EFF989495FFDFDEDFFFDFDEDFFFDFDEDFFFDFDEDFFFDFDEDFFFDFDE
          DFFF989495FF3F3E3FFF434141FF46423FFF54493EFFD28B38FFC87828FFC777
          2799C7772706CA7A2BC6E6B05BFFFFD679FFFFCF71FF524C45FF5E5C5EFF5958
          59FF595859FF898586FFD5D3D4FFD5D3D4FFD5D3D4FFD5D3D4FFD5D3D4FFD5D3
          D4FF898586FF595859FF595859FF5E5C5EFF524C45FFFFD173FFFFD97CFFE1A8
          53FFCA7A2B87D5903FFFFFDB82FFFFD076FFFFC96DFF575149FF4B4A4BFF4645
          46FF464546FF7A7677FFC2C0C1FFC2C0C1FFC2C0C1FFC2C0C1FFC2C0C1FFC2C0
          C1FF7A7677FF464546FF464546FF4B4A4BFF575149FFFFCA6FFFFFD278FFFBD6
          7EFFCD7E2FEADB9A4BFFFFD984FFFFCD77FFFFC66FFF7A6952FF424142FF3E3D
          3DFF3E3D3DFF686566FF686566FF686566FF686566FF686566FF686566FF6865
          66FF676566FF434242FF3E3D3EFF424142FF7A6952FFFFC770FFFFD07AFFFFDC
          88FFD08234FFDE9E50FFFFDA8AFFFFCE7EFFFFC775FFA5885EFF61594FFF6159
          4FFF61594FFF61594FFF61594FFF61594FFF61594FFF61594FFF61594FFF6159
          4FFF61594FFF61594FFF625A50FF61594FFFA5885EFFFFC877FFFFD080FFFFDD
          8EFFD48739FFE1A356FFFFDF94FFFFD488FFFFCC80FFFAC97CFFFAC97CFFFAC9
          7CFFFAC97CFFFAC97CFFFAC97CFFFAC97CFFFAC97CFFFAC97CFFFAC97CFFFAC9
          7CFFFAC97CFFFAC97CFFFAC97CFFFAC97CFF4A5A54FF4E5455FFFFD58AFFFFE1
          97FFD88C3EFFE3A85DFFFFE4A0FFFFD993FFFFD28CFFFBCF88FFFBCF88FFFBCF
          88FFFBCF88FFFBCF88FFFBCF88FFFBCF88FFFBCF88FFFBCF88FFFBCF88FFFBCF
          88FFFBCF88FFFBCF88FFFBCF88FFFBCF88FF3AD9DDFF51A4DBFFFFDB96FFFFE7
          A3FFDB9043FFE7AD64FFFFEBABFFFFE09FFFFFD897FFFBD593FFFBD593FF819E
          ACFF186FC2FF0B69C5FF0B69C5FF0B69C5FF0B69C5FF0B69C5FF0B69C5FF0B69
          C5FF0B69C5FF1E71C1FF93A6A9FFFBD593FFFBD593FFFFD998FFFFE1A1FFFFEE
          AFFFDF9549FFEAB26BFFFFF1B8FFFFE6ABFFFFDEA2FFFDDA9EFFFCDA9EFF3286
          C6FF54DCF6FF55CCFBFF54C8FBFF54C8FBFF54C8FBFF54C8FBFF54C8FBFF54C8
          FBFF56CDFBFF51D9F4FF3B8AC4FFFCDA9EFFFEDB9FFFFFDFA4FFFFE8ADFFFFF4
          BBFFE39A4EFFECB572FFFFFBC7FFFFEFBBFFFFE9B4FFFFE5B2FFFFE6B4FF2299
          DAFF3FE1FAFF3AD2FAFF3AD2FAFF3BD3FAFF3CD4FAFF3CD5FAFF3CD5FAFF3CD4
          FAFF3CD4FAFF42E2FAFF28A0DCFFFFE7B8FFFFE7B6FFFFEAB7FFFFF1BFFFFFFE
          CBFFE69E52FFECAD68FFFFFFD8FFFFFCCDFFFFF4C5FFFFF1C3FFFFF1C5FF28A7
          E3FF29F2FBFF28F1FBFF29F2FBFF2AF2FCFF2BF2FCFF2BF2FCFF2BF2FCFF2AF2
          FCFF29F2FBFF2AF1FBFF30AFE4FFFFF1C8FFFFF2C6FFFFF6C8FFFFFED0FFFBEF
          C4FFE9A257DEECA55AA8F5CE9DFFFDF7D3FFFFFFD9FFFFFFD6FFFFFFD6FF21AD
          EBFF0EABEDFF0EAFEEFF0FB3EFFF0FB5F0FF0FB6F0FF0FB7F0FF0FB7F0FF0FB6
          F0FF0FB4EFFF0FB1EFFF1EB1EDFFFFFFD9FFFFFFD8FFFFFFDCFFFCF1CEFFF4CA
          97FFECA55A69EEA85E0CEEA85E96EEA85EE7EEA85EFFEFAB61FFEFAC63FFF0B0
          66FFF0B36AFFF1B76EFFF1B970FFF2BB73FFF2BC74FFF2BC74FFF2BC74FFF2BC
          73FFF2BA72FFF1B870FFF1B56CFFF0B168FFEFAE65FFEFAB62FFEEAA62D9EEA8
          5E6CFFFFFF00F0AB6000FFFFFF00FFFFFF00FFFFFF00FFFFFF04A49E9FFFE9E6
          E8FFDCD9DBFFDDDBDCFFDEDCDDFFDFDDDEFFDFDDDFFFDFDDDFFFDFDDDFFFDFDD
          DEFFDFDCDEFFDEDBDDFFE9E7E8FFA9A3A5FFFFFFFF0EFFFFFF09FFFFFF04FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A2A4FFECEB
          EBFFE2E0E1FFE3E1E2FFE4E2E3FFE4E3E3FFE4E2E3FFE4E3E4FFE5E3E4FFE5E3
          E4FFE4E3E3FFE4E2E3FFEDECECFFACA6A8FFFFFFFF09FFFFFF05FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABA6A7FFF0EF
          F0FFE9E7E8FFE9E7E8FFEAE8E9FFEAE8E9FFE9E7E8FFE9E7E8FFEBE9EAFFEBE9
          EAFFEAE8E9FFEAE8E9FFF1F0F1FFAFAAABFFFFFFFF05FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1ABADFFF5F4
          F5FFEFEEEFFFEFEEEFFFF0EFF0FFEFEEEFFFEFEEEFFFEFEEEFFFF0EFF0FFF0EF
          F0FFF0EFF0FFF0EFF0FFF5F4F5FFB2ACAEFFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B0B2FFF9F8
          F8FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5
          F5FFF5F5F5FFF5F5F5FFF9F8F8FFB5B0B2FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9B4B6FFFDFD
          FDFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
          FCFFFCFCFCFFFCFCFCFFFDFDFDFFB9B4B6FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDB7B9FFBDB7
          B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7
          B9FDBDB7B9FDBDB7B9FDBDB7B9FDBDB7B9FDFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00}
      end
      object EdtLinhaEmi: TEdit
        Left = 104
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 2
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColEmi: TEdit
        Left = 144
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 3
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhaDoc: TEdit
        Left = 200
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 4
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColDoc: TEdit
        Left = 240
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 5
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhaVenc: TEdit
        Left = 8
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 0
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColVenc: TEdit
        Left = 48
        Top = 40
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 1
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhaValor: TEdit
        Left = 8
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 6
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColValor: TEdit
        Left = 48
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 7
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhaInst: TEdit
        Left = 104
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 8
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColInst: TEdit
        Left = 144
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 9
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhaSac: TEdit
        Left = 200
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 10
        OnEnter = EdtLinhaVencEnter
      end
      object EdtColSac: TEdit
        Left = 240
        Top = 88
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 11
        OnEnter = EdtLinhaVencEnter
      end
      object EdtLinhasFinal: TEdit
        Left = 288
        Top = 88
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        TabOrder = 12
        OnEnter = EdtLinhaVencEnter
      end
      object CheckParc: TCheckBox
        Left = 8
        Top = 112
        Width = 141
        Height = 17
        Caption = 'Imprimir parcela no boleto'
        TabOrder = 13
      end
    end
  end
  inherited Panel2: TPanel
    Width = 378
    ExplicitWidth = 378
    inherited ToolBar1: TToolBar
      Width = 378
      Height = 104
      ExplicitWidth = 378
      ExplicitHeight = 104
      inherited BtnAlterar: TToolButton
        Wrap = True
        OnClick = BtnAlterarClick
      end
      inherited BtnExcluir: TToolButton
        Left = 0
        Top = 52
        ExplicitLeft = 0
        ExplicitTop = 52
      end
      inherited ToolButton6: TToolButton
        Left = 81
        Top = 52
        ExplicitLeft = 81
        ExplicitTop = 52
      end
      inherited BtnConsultar: TToolButton
        Left = 89
        Top = 52
        OnClick = BtnConsultarClick
        ExplicitLeft = 89
        ExplicitTop = 52
      end
      inherited BtnSair: TToolButton
        Left = 170
        Top = 52
        ExplicitLeft = 170
        ExplicitTop = 52
      end
    end
  end
  inherited SB: TdxStatusBar
    Top = 288
    Width = 378
    ExplicitTop = 288
    ExplicitWidth = 378
  end
  inherited BarraMenu: TcxImageList
    FormatVersion = 1
  end
  object IBSQLBan: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTRBan
    Left = 328
    Top = 48
  end
  object IBTRBan: TFDTransaction
    Connection = DM.IBDatabase
    Left = 240
    Top = 48
  end
end
