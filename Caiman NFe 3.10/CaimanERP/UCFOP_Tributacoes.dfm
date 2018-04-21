object frmCFOP_Tributacoes: TfrmCFOP_Tributacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tributa'#231#245'es CFOP'
  ClientHeight = 447
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 41
    Height = 13
    Caption = 'CST IPI :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 155
    Width = 42
    Height = 13
    Caption = 'CSOSN :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sSpeedButton1: TsSpeedButton
    Left = 282
    Top = 402
    Width = 96
    Height = 36
    Caption = 'Cancelar'
    Flat = True
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      2000000000000009000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000B5390000A8D90101A8EB0000A5A60000B42F00000000000000000000
      0000000000000000000000000000000000000000000000009D0C00009C9B0000
      9B580000B8030000000000000000000000000000000000000000000000000000
      A40D0001B1E61542F0FF1545E8FF0E2CC8FF0307AAFB0000B18B0000A3070000
      0000000000000000000000000000000000000000B90E00009FC40520C6FF0312
      ACFF00009BD60000A4A20000AC1B000000000000000000000000000000000000
      AC6B0E27D8FF1B4FFFFF194AFBFF1948F5FF1643E3FF091CB7FF0000A8CB0000
      C11E0000000000000000000000000000BB1100009FC90A29D6FF0D3EF4FF0B39
      E6FF072ED4FF041CB9FF00009CDA0000AD190000000000000000000000000000
      ACC62554FCFF2356FFFF1D4FFFFF1C4DFEFF1A4BFBFF1947F0FF102DC6FF0000
      A9E70000BE35000000000000BB110000A1CD0C2DDAFF1142F8FF0E3FF4FF0D3C
      F2FF0B39EEFF0A37E8FF041FBBFF00009DC60000840400000000000000000000
      BA670405B8F42957F9FF2456FFFF2051FFFF1F51FFFF1D4EFDFF1B4BF4FF1338
      CEFF0101A9F20000B1550000A4CC0F31DEFF1446FCFF1243F8FF1040F5FF0E3E
      F4FF0D3DF4FF0B3AEFFF0A36E5FF0212ACFF00009E5E00000000000000000000
      00000000B7C92D5DFEFF2859FFFF2657FFFF2455FFFF2355FFFF2051FFFF1D4C
      F7FF153DD6FF0101A7FE1131DEFF184CFEFF1547F9FF1444F8FF1243F7FF1040
      F5FF0E3EF4FF0C3DF3FF0C3CF2FF072CD5FF00009DA800000000000000000000
      00000406C4F13C71FFFF2F61FFFF2B5BFFFF295AFFFF2859FFFF2758FFFF2455
      FFFF1D4EF8FF1B4BF3FF1C4EFDFF1B4AFDFF1848FBFF1546F9FF1444F8FF1243
      F7FF1040F5FF0F41F8FF0B34E7FF0104ABF30000AA5B00000000000000000000
      8D020000BBCC2239DAFF4275FFFF3769FFFF2F60FFFF2C5DFFFF2A5AFFFF285A
      FFFF2657FFFF2152FEFF1E4FFFFF1C4DFFFF1A4BFDFF1849FBFF1546F9FF1544
      F9FF1347FBFF0B29D9FF0000A1D50000B72A0000000000000000000000000000
      00000000C2060000BE7F080DBFF83B63F4FF4273FFFF3565FFFF2F60FFFF2B5C
      FFFF295AFFFF2859FFFF2354FFFF1F50FEFF1C4EFEFF1A4BFEFF1949FCFF164A
      FFFF0920CCFF0000A4B60000B90E000000000000000000000000000000000000
      000000000000000000000000C92C0000B1CA2338D7FF487AFFFF3A6BFFFF3162
      FFFF2D5EFFFF2A5AFFFF2758FFFF2354FFFF1F50FEFF1D4EFEFF1C4FFFFF091B
      C8FE0000B09B00008C0400000000000000000000000000000000000000000000
      00000000000000000000000000000000DA040000B37F0B10BFFB406CFBFF3768
      FFFF3262FFFF2E5FFFFF2A5BFFFF2758FFFF2455FEFF1D4FFBFF091AC6FF0000
      B094000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000BA100001B6EF4273FFFF3A6A
      FFFF3565FFFF3262FFFF2E5FFFFF2A5AFFFF2657FEFF1E4EF8FF102DCAFF0000
      ACC100008B040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000BF782740DFFF4576FFFF3D6D
      FFFF3969FFFF3565FFFF3262FFFF2D5EFFFF295BFFFF2555FEFF1C4CEFFF0A1A
      B8FF0000B8840000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000EC050000B9E54D7DFFFF4675FFFF406F
      FFFF3D6EFFFF396AFFFF3A6BFFFF3565FFFF2C5CFFFF295AFFFF2252FDFF1947
      E3FF0308B0FC0000C43F00000000000000000000000000000000000000000000
      00000000000000000000000000000000C7572337D8FF5183FFFF4877FFFF4372
      FFFF406EFFFF3D6FFFFF243FE0FF4375FFFF3364FFFF2A5BFFFF2657FFFF1D4F
      F9FF143AD1FF0000AEE00000C20F000000000000000000000000000000000000
      00000000000000000000000000000000C6BA4D76F8FF5280FFFF4B79FFFF4877
      FFFF4374FFFF2342E5FF0000AFD6131FC8FE4274FFFF3062FFFF2859FFFF2353
      FEFF1B4BF3FF0C23BFFF0000B99F000000000000000000000000000000000000
      000000000000000000000000D01D0F17CCFC6091FFFF5280FFFF4D7BFFFF497A
      FFFF3C69FAFF0000B9DF0000C30E0000BF761421CDFE4071FFFF2D5DFFFF2455
      FEFF1F4FFCFF1847E7FF040CB4FE0000C54D0000000000000000000000000000
      000000000000000000000000D0723750E4FF5E8EFFFF5482FFFF507EFFFF4B7E
      FFFF0E1ACCFE0000D04600000000000000000000CB831729D2FE3B6DFFFF2859
      FFFF2051FFFF1B4AF8FF133AD3FF0000B0E50000C21100000000000000000000
      000000000000000000000000D0C06893FCFF6491FFFF5885FFFF5281FFFF3252
      EDFF0000C6A7000000000000000000000000000000000000BF991D35DAFF3367
      FFFF2454FFFF1C4EFDFF1948F2FF0B24C3FF0000B19F00000000000000000000
      000000000000000000000000DF641D27D3FE719EFFFF6A9AFFFF5485FFFF0305
      C6F30000D61B000000000000000000000000000000000000DC040000B5B52341
      E5FF2C60FFFF2053FFFF1C52FFFF1032E1FF0000B3EF00000000000000000000
      00000000000000000000000000000000E0540000D0D7202DD6FE2637DAFF0000
      CE790000000000000000000000000000000000000000000000000000C60D0000
      B6CE2246EBFF102ADCFF0103BCF10000BD970000C72400000000000000000000
      000000000000000000000000000000000000000000000000D23A0000C3960000
      C307000000000000000000000000000000000000000000000000000000000000
      C4190000B6C80000B76D0000BB0D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    OnClick = sSpeedButton1Click
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object sSpeedButton2: TsSpeedButton
    Left = 384
    Top = 402
    Width = 90
    Height = 36
    Caption = 'Salvar'
    Flat = True
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      2000000000000009000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B6470073A13900D79C2F00DB79462BE6959A9DF39CA0A5F3A5A9
      AEF3AEB2B7F3B6B9B9F3AFAFAFF3A0A0A0F3949494F38A8A8AF35F676CF3902A
      00DC962C00DB952C00DB952C00D9972F00A49933001400000000000000000000
      0000D0570088B04B00FEBE691FFFC1691DFF966942FFB1B6B9FFD19555FFD6A0
      63FFDDA765FFF2E4D3FFFFFFFFFFF6F6F6FFE5E5E5FFD6D6D6FF939AA0FFBF6D
      21FFC87728FFC97C31FFD39355FFAA4B0DFF982F00B30000000000000000CC5E
      0091BC5600FEC27024FFC57628FFC97526FF9E754BFF9DA1A5FFC56B17FFC676
      25FFCD7B20FFDBC7B0FFEDEFF2FFFDFDFDFFF2F2F2FFE5E5E5FF9CA3AAFFC980
      2AFFD58C33FFD89440FFE4B171FFD28830FF962D00F50000000000000000C65E
      00F7C06D20FFC17026FFC16F24FFC47022FFA0774FFFA7ABB2FFB85A0FFFBC68
      20FFC4701DFFCDB9A4FFDCDFE1FFEDEDEDFFFCFCFCFFF8F8F8FFABB1B7FFC67A
      27FFD08632FFD58F3EFFE1AC6DFFD1862EFF942C00F70000000000000000CD64
      00F7C06B20FFBE6D22FFBF6C22FFC26D1FFFA47851FFBBC1C5FFAB4602FFB35A
      18FFBE6518FFBFAB96FFCBCDCFFFDBDBDBFFECECECFFFFFFFFFFB9BFC6FFC477
      25FFD08430FFD38D3DFFE0AB6CFFCE832DFF942C00F70000000000000000CE66
      00F7BE691DFFBC6820FFBD6920FFBF691DFFA67A54FFCDD2D5FF9B2A00FFAC49
      06FFBD5C0CFFB29A85FFBABBBDFFCBCBCBFFDCDCDCFFF0F0F0FFBEC4CBFFC276
      23FFD0832FFFD48B3BFFDEAA6CFFCD802CFF942C00F70000000000000000CE66
      00F7BC651DFFBA651EFFBB661EFFBD661BFFA57B57FFE6F0F7FFC9C1BEFFBCB5
      B4FFACA6A1FF9D9FA1FFA9ACB1FFBBC0C3FFCDD1D5FFE3E8ECFFB5BEC8FFB069
      21FFBA742AFFBF7C34FFDB9F5CFFCC7F2BFF942C00F70000000000000000CE66
      00F7B9621AFFB8621CFFB8631DFFBA641BFFAE6B33FFA67A55FFA97D58FFAB7F
      59FFA77C55FFA37750FF9E7249FF996D45FF956941FF92663DFF8B633BFFAA67
      23FFAB6B26FFB06E29FFD08430FFCC802DFF942C00F70000000000000000CE66
      00F7B95F18FFB65F1AFFB65F1BFFB7601BFFB9621BFFBB6319FFBC6519FFBD65
      1BFFBF681CFFC06A1EFFC26C1FFFC36E21FFC67122FFC97326FFCA7728FFCA7B
      2AFFCC7D2BFFCE7F2DFFCE8230FFCB7E2CFF952C00F70000000000000000CE67
      00F7B65D18FFB45C18FFB45C18FFB55A13FFB65C13FFB75D14FFB85F15FFB961
      16FFBA6217FFBD6418FFBE671BFFC1691CFFC16D1EFFC46F1FFFC67321FFC976
      22FFCB7925FFCC7C2BFFCE802EFFCA7D2BFF952C00F70000000000000000CE67
      00F7B45A15FFB25815FFB1652BFFAE8B70FFAE886BFFAF886CFFAF8A6BFFAF89
      6BFFAE896BFFAE8B6BFFAE8A6CFFAF8A6AFFAD8A6BFFAE8A69FFAC8968FFAC89
      69FFAC8C6CFFBF8141FFCC7D2DFFC97B2CFF952C00F70000000000000000CF67
      00F7B25712FFAF5311FFAF6C3CFFC8D2D8FFDEE2E4FFDDE1E3FFDEE2E5FFDFE3
      E6FFDDE1E4FFDDE0E3FFDADEE1FFD8DBDEFFD6D9DCFFD3D6D9FFCFD3D6FFCDD0
      D3FFB6BDC5FFB7834FFFCB7C2AFFC77A2AFF952C00F70000000000000000CF68
      00F7B05310FFAD500FFFAD6837FFD1D7DBFFEAEAEAFFECECECFFE3E3E3FFE0E0
      E0FFE1E1E1FFE0E0E0FFDDDDDDFFDDDDDDFFDADADAFFD9D9D9FFDEDEDEFFDADA
      DAFFBFC3C8FFB7824CFFCA7A28FFC67929FF952C00F70000000000000000CF68
      00F7AD5010FFAB4C0EFFAD6737FFD3D9DEFFEDEDEDFFEFEFEFFFD2D2D2FFC8C8
      C8FFC9C9C9FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFC9C9C9FFDFDFDFFFDBDB
      DBFFC1C4CAFFB6824CFFC97927FFC57628FF952D00F70000000000000000CF69
      00F7AD4F0DFFA9490CFFAD6638FFD8DFE2FFF2F2F2FFF2F2F2FFEDEDEDFFECEC
      ECFFEBEBEBFFEAEAEAFFE7E7E7FFE5E5E5FFE2E2E2FFDFDFDFFFE0E0E0FFDDDD
      DDFFC3C7CCFFB6804DFFCA7826FFC67528FF952D00F70000000000000000CF69
      00F7AA4B0AFFA7460AFFAB6436FFDBE1E5FFF6F6F6FFF7F7F7FFE1E1E1FFDADA
      DAFFD9D9D9FFD9D9D9FFD8D8D8FFD7D7D7FFD5D5D5FFD5D5D5FFE3E3E3FFE0E0
      E0FFC4C8CDFFB6804DFFC87725FFC47627FF952D00F70000000000000000CF69
      00F7A8470AFFA54307FFAC6236FFDEE5E8FFF9F9F9FFFCFCFCFFD5D5D5FFC6C6
      C6FFC7C7C7FFC8C8C8FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFE6E6E6FFE0E0
      E0FFC5C9CEFFB6804DFFC77625FFC47427FF952D00F70000000000000000CF69
      00F7A64407FFA34005FFAA6135FFE2E8ECFFFCFCFCFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFBFBFFF6F6F6FFF2F2F2FFEBEBEBFFE5E5E5FFE1E1
      E1FFC6CACFFFB7814DFFC97624FFC57526FF962E00F70000000000000000CF6A
      00F7A34205FFA03D03FFA96035FFE3E9EDFFFDFDFDFFFFFFFFFFDEDEDEFFD3D3
      D3FFD4D4D4FFD2D2D2FFD2D2D2FFD1D1D1FFD0D0D0FFCFCFCFFFE6E6E6FFE3E3
      E3FFC7CCD0FFB47E4CFFA7611EFFC17126FF9C3400F70000000000000000D068
      00F6A13F05FF9D3903FFA95F34FFE4EBEFFFFDFDFDFFFFFFFFFFDEDEDEFFD2D2
      D2FFD3D3D3FFD2D2D2FFD3D3D3FFD2D2D2FFD1D1D1FFD1D1D1FFE7E7E7FFE3E3
      E3FFC7CCD0FFAE7C4CFF6F4113FFB66B24FFA43B00F60000000000000000CD66
      00BBBD5801FFA53E01FFAD6233FFE4ECF0FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFEFEFFF7F8F8FFF3F4F4FFEEEFEFFFE8E9E9FFE5E6
      E6FFC9CFD4FFB77E49FFC9711EFFBA5A0DFFAB4400BA0000000000000000CE62
      001ACC6700B3CF6700EBCC7D2DEECACCCEEECDC9C5EECFCAC6EECFC9C4EECCC6
      C2EEC9C5C0EEC6C2BAEEC2BCB8EEBEBAB5EEBBB5B1EEB7B3ADEEB4AEA9EEAFAB
      A7EEAAAAA9EEB77031EEBC5200EBB44E00B3B044001A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    OnClick = sSpeedButton2Click
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object rbOrigem: TRadioGroup
    Left = 8
    Top = 51
    Width = 465
    Height = 58
    Caption = ' Origem '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Items.Strings = (
      'Nacional'
      'Estrangeira - Importa'#231#227'o Direta'
      'Estrangeira - Mercado Interno')
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 465
    Height = 41
    Caption = ' Tributa'#231#245'es do CFOP '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object lbDescCFOP: TLabel
      Left = 12
      Top = 18
      Width = 62
      Height = 13
      Caption = 'lbDescCFOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object edtCST_IPI_Dentro: TComboBox
    Left = 8
    Top = 131
    Width = 465
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Items.Strings = (
      '00 - Entrada com Recupera'#231#227'o de Cr'#233'dito '
      '01 - Entrada Tribut'#225'vel com Al'#237'quota Zero '
      '02 - Entrada Isenta '
      '03 - Entrada N'#227'o Tributada '
      '04 - Entrada Imune '
      '05 - Entrada com Suspens'#227'o'
      '49 - Outras Entradas'
      '50 - Sa'#237'da Tributada '
      '51 - Sa'#237'da Tribut'#225'vel com Al'#237'quota Zero '
      '52 - Sa'#237'da Isenta'
      '53 - Sa'#237'da N'#227'o Tributada'
      '54 - Sa'#237'da Imune'
      '55 - Sa'#237'da com Suspens'#227'o'
      '99 - Outras Sa'#237'das')
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 198
    Width = 465
    Height = 198
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Tributacoes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 12
        Top = 19
        Width = 92
        Height = 13
        Caption = 'Cod grupo ICMS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 168
        Top = 19
        Width = 79
        Height = 13
        Caption = 'Descri'#231#227'o ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnConsICMSContEST: TsSpeedButton
        Left = 139
        Top = 35
        Width = 23
        Height = 21
        Hint = 'Consultar Grupo de ICMS'
        Flat = True
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
        OnClick = BtnConsICMSContESTClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Label3: TLabel
        Left = 12
        Top = 62
        Width = 55
        Height = 13
        Caption = 'CST ICMS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 106
        Width = 81
        Height = 13
        Caption = 'Redu'#231#227'o ICMS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 198
        Top = 106
        Width = 38
        Height = 13
        Caption = 'Agreg.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 262
        Top = 106
        Width = 19
        Height = 13
        Caption = 'IPI :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodICMS: TEdit
        Left = 12
        Top = 36
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edtCodICMS'
        OnExit = edtCodICMSExit
      end
      object edtDescICMS: TEdit
        Left = 168
        Top = 36
        Width = 281
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit1'
      end
      object edtCST_Dentro: TComboBox
        Left = 12
        Top = 81
        Width = 437
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          '00 - Tributada integralmente'
          
            '10 - Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
            'a '
          '20 - Com redu'#231#227'o de base de c'#225'lculo'
          
            '30 - Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
            'i'#231#227'o tribut'#225'ria'
          '40 - Isenta'
          '41 - N'#227'o Tributada'
          '50 - Suspens'#227'o'
          '51 - Diferimento'
          '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
          
            '70 - Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
            'itui'#231#227'o tribut'#225'ria'
          '90 - Outras')
      end
      object edtRed_dentro: TCurrencyEdit
        Left = 12
        Top = 124
        Width = 87
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ',#0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object CheckSTContEst: TCheckBox
        Left = 153
        Top = 125
        Width = 37
        Height = 17
        Caption = 'ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = CheckSTContEstClick
      end
      object edtSTDentro: TCurrencyEdit
        Left = 198
        Top = 124
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ',#0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edtIpiDentro: TCurrencyEdit
        Left = 262
        Top = 124
        Width = 57
        Height = 21
        Margins.Left = 4
        Margins.Top = 1
        DisplayFormat = ',#0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'PIS/Cofins'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 6
        Top = 9
        Width = 44
        Height = 13
        Caption = 'CST PIS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 52
        Width = 67
        Height = 13
        Caption = 'CST COFINS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCST_PIS: TComboBox
        Left = 6
        Top = 25
        Width = 398
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
          '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
          
            '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
            'roduto'
          '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
          '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
          '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
          '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
          '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
          '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
          '49 - Outras Opera'#231#245'es de Sa'#237'da'
          
            '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
            ' Receita Tributada no Mercado Interno'
          
            '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
            ' Receita N'#227'o Tributada no Mercado Interno'
          
            '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
            ' Receita de Exporta'#231#227'o'
          
            '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas e N'#227'o-Tributadas no Mercado Interno'
          
            '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas no Mercado Interno e de Exporta'#231#227'o'
          
            '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
            'ributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
          
            '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita Tributada no Mercado Interno'
          
            '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita N'#227'o-Tributada no Mercado Interno'
          
            '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita de Exporta'#231#227'o'
          
            '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
          
            '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
            #231#227'o'
          '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
          '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
          '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
          '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
          '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
          '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
          '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
          '98 - Outras Opera'#231#245'es de Entrada'
          '99 - Outras Opera'#231#245'es')
      end
      object edtCST_COFINS: TComboBox
        Left = 6
        Top = 69
        Width = 398
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
          '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
          
            '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
            'roduto'
          '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
          '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
          '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
          '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
          '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
          '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
          '49 - Outras Opera'#231#245'es de Sa'#237'da'
          
            '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
            ' Receita Tributada no Mercado Interno'
          
            '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
            ' Receita N'#227'o Tributada no Mercado Interno'
          
            '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
            ' Receita de Exporta'#231#227'o'
          
            '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas e N'#227'o-Tributadas no Mercado Interno'
          
            '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas no Mercado Interno e de Exporta'#231#227'o'
          
            '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
            'ributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
            'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
          
            '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita Tributada no Mercado Interno'
          
            '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita N'#227'o-Tributada no Mercado Interno'
          
            '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
            'vamente a Receita de Exporta'#231#227'o'
          
            '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
          
            '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
          
            '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
            'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
            #231#227'o'
          '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
          '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
          '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
          '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
          '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
          '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
          '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
          '98 - Outras Opera'#231#245'es de Entrada'
          '99 - Outras Opera'#231#245'es')
      end
      object CheckPisCofins: TCheckBox
        Left = 6
        Top = 96
        Width = 147
        Height = 17
        Caption = 'Isento Pis/Confins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckPisCofinsClick
      end
      object PanelPisCofins: TPanel
        Left = 6
        Top = 116
        Width = 444
        Height = 50
        BevelOuter = bvNone
        TabOrder = 3
        object Label15: TLabel
          Left = 8
          Top = 6
          Width = 22
          Height = 13
          Caption = 'PIS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 85
          Top = 6
          Width = 45
          Height = 13
          Caption = 'COFINS :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 162
          Top = 6
          Width = 16
          Height = 13
          Caption = 'IR :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 239
          Top = 6
          Width = 67
          Height = 13
          Caption = 'Cont. Social :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 317
          Top = 6
          Width = 34
          Height = 13
          Caption = 'Outras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtPIS: TCurrencyEdit
          Left = 8
          Top = 22
          Width = 70
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = ',#0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtCOFINSS: TCurrencyEdit
          Left = 85
          Top = 22
          Width = 70
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = ',#0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtIR: TCurrencyEdit
          Left = 162
          Top = 22
          Width = 70
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = ',#0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtContSocial: TCurrencyEdit
          Left = 239
          Top = 22
          Width = 71
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = ',#0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edtOutras: TCurrencyEdit
          Left = 317
          Top = 22
          Width = 71
          Height = 21
          Margins.Left = 4
          Margins.Top = 1
          DisplayFormat = ',#0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  object edtCSOSN: TComboBox
    Left = 8
    Top = 171
    Width = 465
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Items.Strings = (
      '101 - Tributada pelo Simples Nacional com permiss'#227'o de cr'#233'dito'
      '102 - Tributada pelo Simples Nacional sem permiss'#227'o de cr'#233'dito'
      
        '103 - Isen'#231#227'o do ICMS no Simples Nacional para faixa de receita ' +
        'bruta'
      
        '201 - Tributada pelo S.N com permiss'#227'o de cr'#233'dito e com cob. do ' +
        'ICMS por ST'
      
        '202 - Tributada pelo S.N sem permiss'#227'o de cr'#233'dito e com cob. do ' +
        'ICMS por ST'
      
        '203 - Isen'#231#227'o do ICMS no S.N para faixa de receita bruta e com c' +
        'ob. do ICMS por ST'
      '300 - Imune'
      '400 - N'#227'o tributada pelo Simples Nacional'
      
        '500 - ICMS cob. anteriormente por ST (substitu'#237'do) ou por anteci' +
        'pa'#231#227'o'
      '900 - Outros')
  end
  object SQL_Tributacoes: TFDQuery
    Connection = DM.IBDatabase
    Transaction = IBTR_Tributacoes
    Left = 416
    Top = 8
  end
  object IBTR_Tributacoes: TFDTransaction
    Connection = DM.IBDatabase
    Left = 320
    Top = 8
  end
end
