object frmEstatisticas: TfrmEstatisticas
  Left = 0
  Top = 0
  Width = 976
  Height = 484
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Shape1: TShape
      Left = 0
      Top = 53
      Width = 665
      Height = 3
      Align = alTop
      Brush.Color = 16754511
      Pen.Color = clNone
      Pen.Style = psClear
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 56
      Width = 665
      Height = 428
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = cxGrid1DBTableView1CellDblClick
        DataController.DataSource = dsResumFinanceiro
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = cxGrid1DBTableView1TIPO
              end>
            SummaryItems = <
              item
                Format = 'R$ ,0.00'
                Kind = skSum
                FieldName = 'VALOR'
                Column = cxGrid1DBTableView1VALOR
              end>
          end
          item
            Links = <
              item
                Column = cxGrid1DBTableView1DESC_DIAS
              end>
            SummaryItems = <
              item
                Format = 'R$ ,0.00'
                Kind = skSum
                FieldName = 'VALOR'
                Column = cxGrid1DBTableView1VALOR
              end>
          end
          item
            Links = <
              item
              end
              item
              end
              item
                Column = cxGrid1DBTableView1NOME
              end>
            SummaryItems = <
              item
                Format = 'R$ ,0.00'
                Kind = skSum
                FieldName = 'VALOR'
                Column = cxGrid1DBTableView1VALOR
              end>
          end>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.GroupSummaryLayout = gslAlignWithColumns
        OptionsView.Header = False
        Styles.Content = cxstyl1
        Styles.Group = cxstylRed
        Styles.GroupSummary = cxstyl4
        Styles.Header = cxstyl2
        Styles.OnGetGroupStyle = cxGrid1DBTableView1StylesGetGroupStyle
        Styles.OnGetGroupSummaryStyle = cxGrid1DBTableView1StylesGetGroupSummaryStyle
        object cxGrid1DBTableView1TIPO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          Visible = False
          GroupIndex = 0
          SortIndex = 0
          SortOrder = soDescending
        end
        object cxGrid1DBTableView1DESC_DIAS: TcxGridDBColumn
          Caption = 'Classifica'#231#227'o'
          DataBinding.FieldName = 'DESC_DIAS'
          Visible = False
          GroupIndex = 1
          SortIndex = 1
          SortOrder = soDescending
        end
        object cxGrid1DBTableView1NOME: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'NOME'
          Visible = False
          GroupIndex = 2
        end
        object cxGrid1DBTableView1CODIGO: TcxGridDBColumn
          Caption = 'C'#243'd'
          DataBinding.FieldName = 'CODIGO'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
        end
        object cxGrid1DBTableView1EMISSAO: TcxGridDBColumn
          Caption = 'Emiss'#227'o'
          DataBinding.FieldName = 'EMISSAO'
        end
        object cxGrid1DBTableView1VENCIMENTO: TcxGridDBColumn
          Caption = 'Vencimento'
          DataBinding.FieldName = 'VENCIMENTO'
        end
        object cxGrid1DBTableView1TELEFONE: TcxGridDBColumn
          Caption = 'Telefone de Contato'
          DataBinding.FieldName = 'TELEFONE'
        end
        object cxGrid1DBTableView1VALOR: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VALOR'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Resumo Financeiro'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 16744448
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = 16744448
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      AnchorX = 333
      AnchorY = 15
    end
    object Panel5: TPanel
      Left = 0
      Top = 29
      Width = 665
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object cxLabel2: TcxLabel
        Left = 183
        Top = 0
        Align = alLeft
        AutoSize = False
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 16744448
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = 16754511
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 97
        AnchorY = 12
      end
      object cxLabel3: TcxLabel
        Left = 0
        Top = 0
        Align = alLeft
        AutoSize = False
        Caption = 'C'#243'digo'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 16744448
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = 16754511
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 183
        AnchorY = 12
      end
      object cxLabel6: TcxLabel
        Left = 280
        Top = 0
        Align = alLeft
        AutoSize = False
        Caption = 'Vencimento'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 16744448
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = 16754511
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 92
        AnchorY = 12
      end
      object cxLabel7: TcxLabel
        Left = 372
        Top = 0
        Align = alLeft
        AutoSize = False
        Caption = 'Telefone'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 16744448
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = 16754511
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 120
        AnchorY = 12
      end
      object cxLabel8: TcxLabel
        Left = 492
        Top = 0
        Align = alLeft
        AutoSize = False
        Caption = 'Valor'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 16744448
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = 16754511
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 167
        AnchorY = 12
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 668
    Top = 3
    Width = 311
    Height = 478
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 344
      Width = 305
      Height = 131
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 27
        Width = 105
        Height = 104
        Align = alLeft
        Picture.Data = {
          0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
          01000000010008060000005C72A8660000000467414D410000B18F0BFC610500
          0000097048597300000B1300000B1301009A9C1800000C4E49444154785EED9D
          4D6C5C57198623414B259008507E16C01A55828D9B99F19D49474820458E55BB
          8B880595D8552CAAAE2AC1A252C4AAA89D993482059590805D098D6D4AF859B2
          60C3AFF85FC19A1D48C01268CF31E74B63FBB3E7CEFDEEBDE73B33CF23BD526C
          4FDE7BC739EFE31F29F625000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000288F4FBDFCD9770F16E3E7878BF1974BCC68517D3E3D150068C270567D
          6E30ABFE335A4CDE2C2DE1BE7F969E060034A55409200080962851020800A045
          4A93000200689992248000003AA014092000808E2841020800A043BC4B000100
          748C67092000801EF02A010400D0131E258000007AC49B04100040CF78920002
          00C88017092000804C7890000200C84894C0703EFEAF36CE3E820060EDD8FAEA
          67DE3B7C65F8E1F4A26B86B3C9D670B1FD6F6D9C7D0401C05A11C73F588C7F3E
          9A8DFF7CE5A5E947D2AB5D12C73F58547FD786D9571000AC0DF7C72F073C48C0
          EB67021EC61F8300602D38337E89430978197F0C0280E23977FC124712F034FE
          18040045B374FCF753FD69FBE5ED0FA5BF96056FE38F4100502CF5C72FC92781
          38FEE1ACFA877E5FF98200A048561FBFA47F09781D7F0C0280E2683EFE94D9E4
          8F7D49C0F3F8631000148579FC921E24E07DFC3108008AA1B5F14B820426B727
          1F4CF5AD52C2F86310001441EBE39774208152C61F8300C03D9D8D3F65389FFC
          A12D099434FE180400AEE97AFC9236247065513D5ED2F8631000B8258E3F0CF3
          17DAC1ED224134BFDF9A4D1F4D975F895CE31FCEC6FFD35E5F3708005CD2F7F8
          254D2490ED23FF7C7C6F38AF9E0E236EFC43451000B823D7F825AB4820E7F8AF
          DDBEF6AE780FE1FA8D7FB210020057E41EFFFDCCABDF2D938087F10B4D258000
          C00D6EC62FB940029EC62F349100020017B81BBF2448E0CAD7AE7C20DDE6311E
          C72FAC2A010400D9713B7EC90312F03C7E6115092000C88AFBF1BF9DDF8EE693
          6BDEC72FD4950002806C1434FE7C69307EA18E0410006481F1D78861FCC23209
          2000E81DC65F232D8C5FB8480208007A85F1D7488BE317CE93000280DE60FC35
          D2C1F8054D0208C021DBB3AB5575ABDA4E2FAE05D35BD3CB8C7F493A1CBF705A
          0208C01971FC83C5E49F31EB2201C65F233D8C5F78500208C011327E3914EB20
          01C65F233D8E5F10092000279C1EBFA46409E41B7FF5B7F07EFB8BFE3667C930
          7EE158028BEAA7E945C8C579E3979428819CE3DF9E6D7F62707BFA51F712C838
          7E61347FE293E98F908365E397942481DCE34FB771C9B5041C8C1F325377FC92
          1224E065FC824B09307E5875FC12CF12F0367EC19504183F341DBFC4A304BC8E
          5F702101C60FD6F14B3C49C0FBF885C767573F964D028C1FDA1ABFC483044A19
          BF9045028C1FDA1EBF24A7044A1BBFD0AB04183F74357E490E09943A7EA11709
          307EE87AFC923E2510C73F9A4D7EA9DD47B76967FC42A71260FC100EC2B88FF1
          4BFA90C0BA8C5F881218CDAABFEAD76C18C60FE120F43A7E49971258B7F10BAD
          4A80F143380859C62FE94202EB3A7EA11509307E080721EBF8256D4A60DDC72F
          9824C0F8211C0417E397B421814D19BFD048028C1FC24170357E8945029B367E
          612509307E0807C1E5F8254D24B0A9E317C6AF8C3FBE54028C1FC241703D7EC9
          2A12D8F4F10B174A80F1433808458C5F5247028CFF24AA04183F848350D4F825
          174980F1EB9C9000E38770108A1CBF449300E3BF982881E162F20DC6BFE18443
          5BF4F8250F4A80F197C18D3B37DEB3FBC6EEA36D66EF70EF72AA87658443BB16
          E397C4E7329C573B8CBF0CAE1FEE7D7DF770FFCD36133AF9BD0075088776ADC6
          9F378CBF09082013E1D08E07B3EA5F670F32593D8CBF29082003E1D032FED6C2
          F82D20809E098736CFF8E7E3EF1D477B5BB161FC5610408F84439B65FCC3C5E4
          CEF4E6F49D31A3C5F875ED31E585F1B70102E8897068B38E3FDDC6A56309CC27
          77B5C79613C6DF1608A007C2A175317EA16C0930FE3641001D130EADABF10B5B
          AF6E3D549E04187FDB20800E0987D6E5F8852881F0D803ADC35F187F1720808E
          0887D6F5F8856309CCAB43ADCB4FBA1BFFCED1939FDE3DD8FF629B0903D849F5
          EE41001D100E6D11E3177C4BA0DB8FFCBB877BDFD60EB12D7BF752BD7B1040CB
          84435BD4F8059F12E8FED37E0480005A231CDA22C72F1C7F6370363ED2AED17F
          FAF99A1F01208056088736CBF807B3C977DB18BFE04302FD7DC30F01200033C3
          D978B20EE3178E25B0987CFFF4F5FA497FE38F2000046062DDC62F3C76F3B187
          C3757A9640BFE38F200004D098751DBF102510AEF586760FEDA7FFF147100002
          68C4BA8F5FE8470279C61F41000860653665FC4294C07051FD40BB277BF28D3F
          820010C04A6CDAF8856E249077FC110480006AB3A9E3178EBF31381FDFD3EE71
          F5E41F7F040120805A6CFAF8857624E063FC1104800096C2F84F127F91457309
          F8197F040120800B61FC3AC712584C7E78FABE2F8EAFF14710000238979CE3BF
          71E7C63BD26DB8E5FF9F094C7EA43D87B3F137FE080240002A8CBF1EF524E073
          FC11048000CEC0F857E36209F81D7F040120801330FE6644090C16D58F4F3E2F
          DFE38F200004709FD1FCEA80F137E7A404FC8F3F820010C07D46F3D1FB078BF1
          6F4E0FB4CBACCBF885E9CDE923C3C5E43B258C3F820010C009FA94C0BA8DBF44
          10000238431F1260FC3E4000084065F2E2E47D8359F56B6DBCD6307E3F200004
          702E1D49E035C6EF070480002EA46509307E67200004B0949624C0F81D820010
          402DA204C2887F756AD475C3F89D925B00BB779F7A2E0CE6A8CDEC1EECBF90EA
          97121E8F00EAD250028CDF31D90590F9FA086045569400E3770E0240002B5353
          028CBF0010000268C4120930FE42400008A031D35BD3CB61ECA725C0F85760E7
          E8C927760EF69F6E33E1005E4DF54B410008C0C4290930FE15B97E77FF75ED10
          591224F05AAA5F0A02400066A204868BF15718FFEA200004001B0C024000B0C1
          200004B0D1842F1B1E9E7EEB0B8FB499AD579F7928D5BB070120808D66F760FF
          27DA3BD19230AA6FA67AF7200004B0D1200004A0775882008A01012000BDC312
          04500C080001E81D9620806240000840EFB0040114030240007A872508A01810
          0002D03B2C4100C580001080DE6109022806048000F40E4B104031200004A077
          5882008A21B70072FF7F7C048000369ADC02C83D40048000361A048000F40E4B
          104031200004A0775882008A01012000BDC31204500C080001E81D9620806240
          000840EFB0040114030240007A872508A018100002D03B2C4100C580001080DE
          6109022806048000F40E4B10406DC2006F861B567FCF7AE31CEC3F9BEA978200
          1080DE610902A84DEE01220004A0775882006A83001080D6610B0248F5FE4100
          0840EBB00501A47AFF200004A075D8820052BD7F100002D03A6C4100A9DE3F08
          0001681DB6208054EF1F048000B40E5B1040AAF70F0240005A872D0820D5FB07
          012000ADC3160490EAFD83001080D6610B0248F5FE41000840EBB00501A47AFF
          200004A075D8820052BD7F100002D03A6C4100A9DE3F080001681DB6208054EF
          1F048000B40E5B1040AAF70F0240005A872D0820D5FB07012000ADC3160490EA
          FD83001080D6610B0248F5FE41000840EBB00501A47AFF200004A075D8820052
          BD7F100002D03A6C4100A9DE3F080001681DB6208054EF1F048000B40E5B1040
          AAF70F0240005A872D0820D5FB07012000ADC3160490EAFD83001080D6610B02
          48F5FE41000840EBB00501A47AFF200004A075D8820052BD7F100002D03A6C41
          00A9DE3F080001681DB6208054EF1F048000B40E5B1040AAF70F0240005A872D
          0820D5FB07012000ADC3160490EAFD83001080D6610B0248F5FE41000840EBB0
          0501A47AFF200004A075D8820052BD7F100002D03A6C4100A9DE3F080001681D
          B6208054EF1F048000B40E5B1040AAF70F0240005A872D0820D5FB07012000AD
          C3160490EAFD83001080D6610B0248F5FE41000840EBB00501A47AFF200004A0
          75D8820052BD7F100002D03A6C4100A9DE3F080001681DB6208054EF1F048000
          B40E5B1040AAF70F0240005A872D0820D5FB07012000ADC3160490EAFD830010
          80D6610B0248F5FE41000840EBB00501A47AFF200004A075D8820052BD7FC200
          6F861B3E6A3507FBCFA6FAA5E4BEFECEE1DE97D40E43C2017C3ED52F25F7F577
          EF3EF59CD66149F8377D21D52F25F7F5AF1FEE3FA37518F362AA070000000000
          0000000000000000000000000000000000000000000000000000000000000080
          75E1D2A5B70014B4643D78CE7DAA0000000049454E44AE426082}
        Proportional = True
        Stretch = True
        ExplicitLeft = 6
        ExplicitTop = 0
        ExplicitHeight = 105
      end
      object Panel4: TPanel
        Left = 105
        Top = 27
        Width = 200
        Height = 104
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblPagar: TcxLabel
          Left = 0
          Top = 71
          Align = alTop
          AutoSize = False
          Caption = '0'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -27
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextColor = 191
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 38
          Width = 200
          AnchorX = 100
          AnchorY = 90
        end
        object lblReceber: TcxLabel
          Left = 0
          Top = 19
          Align = alTop
          AutoSize = False
          Caption = '0'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -27
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextColor = 16744448
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 33
          Width = 200
          AnchorX = 100
          AnchorY = 36
        end
        object cxLabel4: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'Total Receber'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextColor = 16744448
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 100
          AnchorY = 10
        end
        object cxLabel5: TcxLabel
          Left = 0
          Top = 52
          Align = alTop
          Caption = 'Total a Pagar'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -12
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextColor = 191
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 100
          AnchorY = 62
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Pagar/Receber Vencidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16744448
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object QResumoFinanceiro: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRResumoFinanceiro
    SQL.Strings = (
      'select * from ('
      'select '#39'Contas a Receber'#39' TIPO,'
      
        'case when cc.vencto_ctr <= current_date then '#39'Vencidas'#39' else ( '#39 +
        'Pr'#243'ximos Dias '#39' || CAST( :DIAS_R AS VARCHAR(3) ) ) end DESC_DIAS' +
        ', cc.cod_ctr CODIGO, cc.data_ctr EMISSAO, cc.valor_ctr VALOR,'
      
        'cc.vencto_ctr VENCIMENTO, cc.cod_cli COD_CLIFOR, cli.nome_cli NO' +
        'ME, cli.telcob_cli TELEFONE  from contas_receber cc'
      'inner join CLIENTE cli'
      'on( cli.cod_cli = cc.cod_cli )'
      
        'where cc.cod_emp=:cod_emp and cc.vencto_ctr < :DT_AVISO_R and cc' +
        '.valor_ctr > 0 and cc.dtpagto_ctr is null'
      'union all'
      'select '#39'Contas a Pagar'#39' TIPO,'
      
        'case when cc2.dtvencto_ctp <= current_date then '#39'Vencidas'#39' else ' +
        '( '#39'Pr'#243'ximos Dias '#39' || CAST( :DIAS_P AS VARCHAR(3) )) end DESC_DI' +
        'AS, cc2.cod_cpt CODIGO, cc2.data_ctp EMISSAO, cc2.valor_ctp VALO' +
        'R,'
      
        'cc2.dtvencto_ctp VENCIMENTO, cc2.cod_for COD_CLIFOR, forn.razao_' +
        'for NOME, forn.tel_for TELEFONE from contas_pagar cc2'
      'inner join fornecedor forn'
      'on( forn.cod_for = cc2.cod_for )'
      
        'where cc2.cod_emp=:cod_emp and cc2.dtvencto_ctp < :DT_AVISO_P an' +
        'd cc2.valor_ctp > 0 and cc2.dtpagto_ctp is null )'
      'order by TIPO, DESC_DIAS DESC, CODIGO, VENCIMENTO'
      '')
    Left = 152
    Top = 112
    ParamData = <
      item
        Name = 'DIAS_R'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DT_AVISO_R'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DIAS_P'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'DT_AVISO_P'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QResumoFinanceiroTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
    object QResumoFinanceiroDESC_DIAS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_DIAS'
      Origin = 'DESC_DIAS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 13
    end
    object QResumoFinanceiroCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QResumoFinanceiroEMISSAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QResumoFinanceiroVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QResumoFinanceiroVENCIMENTO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QResumoFinanceiroCOD_CLIFOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CLIFOR'
      Origin = 'COD_CLIFOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object QResumoFinanceiroNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QResumoFinanceiroTELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
  end
  object dsResumFinanceiro: TDataSource
    DataSet = QResumoFinanceiro
    Left = 160
    Top = 272
  end
  object TRResumoFinanceiro: TFDTransaction
    Connection = DM.IBDatabase
    Left = 160
    Top = 200
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 64
    Top = 64
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 16744448
    end
    object cxstyl2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxstylRed: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = 191
    end
    object cxstyl4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clGray
    end
    object cxstylVerde: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object cxstylNavy: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
  end
  object QTotaisContas: TFDQuery
    Connection = DM.IBDatabase
    Transaction = TRResumoFinanceiro
    SQL.Strings = (
      'select ('
      
        'select COALESCE( SUM( cc.valor_ctr ), 0 ) RECEBER  from contas_r' +
        'eceber cc'
      
        'where cc.cod_emp=:cod_emp and cc.vencto_ctr <= current_date and ' +
        'cc.valor_ctr > 0 and cc.dtpagto_ctr is null ),'
      
        '( select COALESCE( SUM( cc2.valor_ctp ), 0 ) PAGAR from contas_p' +
        'agar cc2'
      
        'where cc2.cod_emp=:cod_emp and cc2.dtvencto_ctp <= current_date ' +
        'and cc2.valor_ctp > 0 and cc2.dtpagto_ctp is null ) from EMPRESA'
      ''
      '')
    Left = 256
    Top = 120
    ParamData = <
      item
        Name = 'COD_EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QTotaisContasRECEBER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RECEBER'
      Origin = 'RECEBER'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QTotaisContasPAGAR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PAGAR'
      Origin = 'PAGAR'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
