unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView,
  FMX.Ani, FMX.ListBox, FMX.Layouts, FMX.Edit, UniProvider, MySQLUniProvider,
  Data.DB, DBAccess, Uni, SQLiteUniProvider, MemDS, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Objects,
  FGX.ProgressDialog, MultiDetailAppearanceU, System.IOUtils,
  FMX.Grid, Fmx.Bind.Grid, Data.Bind.Grid, FMX.DateTimeCtrls, FMX.Memo,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,System.Math,IdAttachmentFile,
  FMX.Effects,FMX.VirtualKeyboard,FMX.Platform,
  {$IFDEF ANDROID}
  FMX.Platform.Android,
  {$ENDIF}
  System.StrUtils, IdRawBase, IdRawClient, IdIcmpClient,
  FMX.Controls.Presentation, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    lista: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    ChangeTabAction4: TChangeTabAction;
    QRYAUX_INT: TUniQuery;
    QRYAUX_PED_INT: TUniQuery;
    QRYAUX_INT2: TUniQuery;
    QRYCLI: TUniQuery;
    ChangeTabAction5: TChangeTabAction;
    ChangeTabAction6: TChangeTabAction;
    FGACTIVITYDIALOG: TfgActivityDialog;
    ChangeTabAction7: TChangeTabAction;
    QRYPROD: TUniQuery;
    QRYPRODID: TStringField;
    QRYPRODDESC_PROD: TStringField;
    QRYPRODUN: TStringField;
    QRYPRODID_GRUP: TStringField;
    QRYPRODGRUP: TStringField;
    QRYPRODSIT: TStringField;
    QRYPRODVL_VARJ: TFloatField;
    QRYPRODVL_ATAC: TFloatField;
    QRYPRODESTOQUE: TFloatField;
    QRYPRODDATA_CAD: TMemoField;
    QRYPRODfoto: TBlobField;
    QRYCLICOD_EMPRESA: TIntegerField;
    QRYCLIID: TIntegerField;
    QRYCLIID_CID: TIntegerField;
    QRYCLICNPJ_CPF: TStringField;
    QRYCLITIPO_CLIENTE: TStringField;
    QRYCLIRAZAO: TStringField;
    QRYCLIFANTASIA: TStringField;
    QRYCLILOUGRAD: TStringField;
    QRYCLINR: TStringField;
    QRYCLICOMPLEMT: TStringField;
    QRYCLIBAIRRO: TStringField;
    QRYCLIUF: TStringField;
    QRYCLICIDADE: TStringField;
    QRYCLICEP: TStringField;
    QRYCLIINC_ESTADUAL: TStringField;
    QRYCLIFONE: TStringField;
    QRYCLICELULAR: TStringField;
    QRYCLIIMAIL: TStringField;
    QRYCLIDATA_CAD: TMemoField;
    QRYITENS: TUniQuery;
    ChangeTabAction8: TChangeTabAction;
    ChangeTabAction10: TChangeTabAction;
    QRYVISUPED1: TUniQuery;
    QRYITENS_DETAL: TUniQuery;
    ChangeTabAction11: TChangeTabAction;
    ChangeTabAction12: TChangeTabAction;
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    TB_GERAL: TTabControl;
    TabItem1: TTabItem;
    ToolBar9: TToolBar;
    Image4: TImage;
    Image5: TImage;
    Label15: TLabel;
    ToolBar10: TToolBar;
    SpeedButton5: TSpeedButton;
    BTN_CONFIG: TSpeedButton;
    EDT_USUA: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EDT_SENHA: TEdit;
    Memo1: TMemo;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Image3: TImage;
    ToolBar2: TToolBar;
    BTN_VOLT_MENU: TSpeedButton;
    ListBox1: TListBox;
    LB_NOVOPED: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    BitmapListAnimation1: TBitmapListAnimation;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    TabItem3: TTabItem;
    ToolBar3: TToolBar;
    Label2: TLabel;
    ToolBar4: TToolBar;
    BTN_VOLTARFORNEC: TSpeedButton;
    BTN_CONFIRMAFOR: TSpeedButton;
    LV_CLI: TListView;
    Panel5: TPanel;
    CB_TIPOCLI: TComboBox;
    SpeedButton11: TSpeedButton;
    EDT_BUSCACLI: TEdit;
    TabItem4: TTabItem;
    ToolBar5: TToolBar;
    Label3: TLabel;
    ToolBar6: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Label4: TLabel;
    EDT_PROD: TEdit;
    BTN_BUSCAPROD: TSpeedButton;
    Label5: TLabel;
    EDT_DESCPROD: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EDT_VALORPROD: TEdit;
    EDT_QTDE: TEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton8: TSpeedButton;
    LB_VLRTOTAL: TLabel;
    LV_ITENS: TListView;
    TabItem5: TTabItem;
    ToolBar7: TToolBar;
    Label8: TLabel;
    ToolBar8: TToolBar;
    SpeedButton3: TSpeedButton;
    TabItem6: TTabItem;
    ToolBar11: TToolBar;
    Label11: TLabel;
    ToolBar12: TToolBar;
    SpeedButton6: TSpeedButton;
    BTN_CONFIRMAPROD: TSpeedButton;
    ListViewMultiDetail: TListView;
    Panel2: TPanel;
    CB_TIPOPROD: TComboBox;
    BTN_BUSCA_PROD: TSpeedButton;
    EDT_BUSCAPROD: TEdit;
    TabItem7: TTabItem;
    ToolBar13: TToolBar;
    Label16: TLabel;
    ToolBar14: TToolBar;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Panel3: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    EDT_IDCLI: TEdit;
    EDT_RAZAOCLI: TEdit;
    Panel4: TPanel;
    Label19: TLabel;
    EDT_NUMPED: TEdit;
    Label20: TLabel;
    CB_COND_PAG: TComboBox;
    TabItem10: TTabItem;
    ToolBar19: TToolBar;
    Label35: TLabel;
    ToolBar20: TToolBar;
    SpeedButton17: TSpeedButton;
    BTN_VISUALIZA_ITENS: TSpeedButton;
    Panel6: TPanel;
    CB_STAT_PED: TComboBox;
    Label36: TLabel;
    Label37: TLabel;
    DT_INI: TDateEdit;
    DT_FIM: TDateEdit;
    Label38: TLabel;
    BTN_BUSCA_PED: TSpeedButton;
    LV_PEDIDOS: TListView;
    TabItem11: TTabItem;
    ToolBar21: TToolBar;
    Label39: TLabel;
    ToolBar22: TToolBar;
    SpeedButton18: TSpeedButton;
    LV_ITENSPED: TListView;
    TabItem12: TTabItem;
    ToolBar23: TToolBar;
    Label40: TLabel;
    ToolBar24: TToolBar;
    SpeedButton19: TSpeedButton;
    Panel7: TPanel;
    Label46: TLabel;
    Panel8: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    EDT_DADOS_ID: TEdit;
    EDT_DADOS_NOME: TEdit;
    EDT_DADOS_LOGIN: TEdit;
    EDT_DADOS_EMAIL: TEdit;
    EDT_DADOS_CAD: TEdit;
    LB_SINC: TListBox;
    Image6: TImage;
    Label51: TLabel;
    EDT_TPCLI: TEdit;
    RT_EMAIL: TRectangle;
    FloatAnimation1: TFloatAnimation;
    RT_SEL_EMAIL: TRectangle;
    ToolBar25: TToolBar;
    Label52: TLabel;
    Layout2: TLayout;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    FloatAnimation2: TFloatAnimation;
    SW_ENVCLI: TSwitch;
    Label54: TLabel;
    BTN_ALTERAR: TSpeedButton;
    TC_CONEXAO: TRectangle;
    FloatAnimation3: TFloatAnimation;
    RT_CONEXAO: TRectangle;
    Panel9: TPanel;
    Label47: TLabel;
    Panel10: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    EDT_HOST: TEdit;
    EDT_PORTA: TEdit;
    Label56: TLabel;
    EDT_DB: TEdit;
    Label57: TLabel;
    EDT_LOGIN_SERV: TEdit;
    Label58: TLabel;
    EDT_SENHA_SERV: TEdit;
    BTN_RESET: TSpeedButton;
    BTN_ATU_CONECT: TSpeedButton;
    Label59: TLabel;
    MEMO_OBS: TMemo;
    Label60: TLabel;
    EDT_DESCONTO: TEdit;
    SpeedButton16: TSpeedButton;
    Panel11: TPanel;
    BTN_SINC: TSpeedButton;
    TabItem13: TTabItem;
    ChangeTabAction13: TChangeTabAction;
    ListBoxItem7: TListBoxItem;
    SpeedButton7: TSpeedButton;
    Panel12: TPanel;
    Label12: TLabel;
    aparencia: TStyleBook;
    BTN_ENVIAPED: TSpeedButton;
    SpeedButton12: TSpeedButton;
    TabItem8: TTabItem;
    ToolBar15: TToolBar;
    ToolBar16: TToolBar;
    Label13: TLabel;
    SpeedButton14: TSpeedButton;
    Label14: TLabel;
    QRYITENSID: TIntegerField;
    QRYITENSID_VENDA_CABECALHO: TIntegerField;
    QRYITENSITEM: TIntegerField;
    QRYITENSID_PRODUTO: TIntegerField;
    QRYITENSDESC_PROD: TStringField;
    QRYITENSUN: TStringField;
    QRYITENSVALOR_UNITARIO: TFloatField;
    QRYITENSQUANTIDADE: TIntegerField;
    QRYITENSTOTAL_ITEM: TFloatField;
    QRYITENSDESCONTO: TFloatField;
    QRYITENSVALOR_TOTAL: TFloatField;
    QRYITENSST: TStringField;
    QRYITENSSINCRONIZADO: TStringField;
    QRYITENSDATA_PED: TDateField;
    QRYITENSVL_DESCONTO: TFloatField;
    QRYITENSDESC_PROD_1: TStringField;
    QRYITENS_DETALID: TIntegerField;
    QRYITENS_DETALID_VENDA_CABECALHO: TIntegerField;
    QRYITENS_DETALITEM: TIntegerField;
    QRYITENS_DETALID_PRODUTO: TStringField;
    QRYITENS_DETALDESC_PROD: TStringField;
    QRYITENS_DETALUN: TStringField;
    QRYITENS_DETALVALOR_UNITARIO: TFloatField;
    QRYITENS_DETALQUANTIDADE: TFloatField;
    QRYITENS_DETALTOTAL_ITEM: TFloatField;
    QRYITENS_DETALDESCONTO: TFloatField;
    QRYITENS_DETALVALOR_TOTAL: TFloatField;
    QRYITENS_DETALST: TStringField;
    QRYITENS_DETALSINCRONIZADO: TStringField;
    QRYITENS_DETALDATA_PED: TDateField;
    QRYITENS_DETALVL_DESCONTO: TFloatField;
    QRYITENS_DETALDESC_PRODUTO: TStringField;
    QRYVISUPED1ID_CLIENTE: TIntegerField;
    QRYVISUPED1ID_USUARIO: TIntegerField;
    QRYVISUPED1ID_FORM_PG: TIntegerField;
    QRYVISUPED1CNPJ_CPF_CLI: TStringField;
    QRYVISUPED1CLIENT: TStringField;
    QRYVISUPED1DATA_VENDA: TDateField;
    QRYVISUPED1VALOR_VENDA: TFloatField;
    QRYVISUPED1DESCONTO: TFloatField;
    QRYVISUPED1VALOR_FINAL: TFloatField;
    QRYVISUPED1SINCRONIZADO: TStringField;
    QRYVISUPED1STATUS_VENDA: TStringField;
    QRYVISUPED1DATA_PED: TDateField;
    QRYVISUPED1FLAG_ENVIO: TStringField;
    QRYVISUPED1OBS: TStringField;
    QRYVISUPED1ROTA: TIntegerField;
    QRYVISUPED1RAZAO: TStringField;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    itcCommands: TIdTCPClient;
    QRYVISUPED1ID: TIntegerField;
    QRYVISUPED: TUniQuery;
    QRYVISUPEDID_CLIENTE: TIntegerField;
    QRYVISUPEDID_USUARIO: TIntegerField;
    QRYVISUPEDID_FORM_PG: TIntegerField;
    QRYVISUPEDCNPJ_CPF_CLI: TStringField;
    QRYVISUPEDCLIENT: TStringField;
    QRYVISUPEDDATA_VENDA: TDateField;
    QRYVISUPEDVALOR_VENDA: TFloatField;
    QRYVISUPEDDESCONTO: TFloatField;
    QRYVISUPEDVALOR_FINAL: TFloatField;
    QRYVISUPEDSINCRONIZADO: TStringField;
    QRYVISUPEDSTATUS_VENDA: TStringField;
    QRYVISUPEDDATA_PED: TDateField;
    QRYVISUPEDFLAG_ENVIO: TStringField;
    QRYVISUPEDOBS: TStringField;
    QRYVISUPEDROTA: TIntegerField;
    QRYVISUPEDRAZAO: TStringField;
    QRYVISUPEDID: TIntegerField;
    Button1: TButton;
    PROCEDURE VERIFICA_USUARIO;
    PROCEDURE ATUALIZA_PEDIDOS;
    procedure BTN_SINCClick(Sender: TObject);
    procedure LB_NOVOPEDClick(Sender: TObject);
    procedure BTN_VOLTARFORNECClick(Sender: TObject);
    function GetSelectedValue(AObject: TObject): TValue;
    procedure LV_CLIItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BTN_CONFIRMAFORClick(Sender: TObject);
    PROCEDURE CONEXAO_ON;
    procedure CONEXAO_OFF;
    PROCEDURE LOG_SINC(S_DESC:STRING);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    PROCEDURE BUSCA_PROD;
    procedure BTN_CONFIRMAPRODClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    PROCEDURE BUSCA_CLI;
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    PROCEDURE ATUALIZA_ITENS;
    procedure BTN_BUSCAPRODClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    PROCEDURE ATUALIZA_VALOR_ITENS;
    procedure SpeedButton8Click(Sender: TObject);
    procedure CB_COND_PAGChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure BTN_BUSCA_PRODClick(Sender: TObject);
    procedure BTN_VOLT_MENUClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
    procedure BTN_BUSCA_PEDClick(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure LV_PEDIDOSItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BTN_VISUALIZA_ITENSClick(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure CB_TIPOCLIChange(Sender: TObject);
    PROCEDURE ENVIA_EMAIL(S_NUMEROPEDIDO : STRING);
    procedure Image6Click(Sender: TObject);
    procedure BTN_ATU_CONECTClick(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure BTN_CONFIGClick(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure LV_ITENSItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BTN_RESETClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormFocusChanged(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    FUNCTION MAX_ALPHA(EDIT:STRING;I_TAMANHO:INTEGER):STRING;
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure BTN_ALTERARClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure BTN_CANCELCONFClick(Sender: TObject);
    procedure ListBoxItem7Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    function TrocaVirgPPto(Valor: string): String;
    PROCEDURE VERIFICA_COENXAO;
    PROCEDURE ATUALIZA_PRODUTOS;
    PROCEDURE ATUALIZA_CLIENTES;
    procedure BTN_ENVIAPEDClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    PROCEDURE STATUS_SERVIDOR;
    PROCEDURE CARREGA_ENTRADA;
    procedure ListViewMultiDetailItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    S_ID_USUA, //ID DO USUARIO
    S_ID_CLI, //ID DO CLIENTE
    S_PROD, //PEGA O ID DO PRODUTO E ENVIA PARA A TELA DE VENDA
    S_NUM_PED, //NUMERO DO PEDIDO GERADO
    S_TIPO_CLI, //PARA PEGAR VALOR DE ATAC OU VAREJ
    S_TIPO_PED,  // VERIFICA SE E NOVO OU ALTERACAO //N = NOVO , A = ALTERAR
    S_COD_GRUP, //GRUPO PARA PESQUISA DE PRODUTOS
    S_OBS, //OBSERVAÇÃO NO CABECALHO
    S_ROTA, //ROTA DO CLIENTE
    S_CNPJ_CPF,//  CNPJ_CPF DO CLIENTE
    S_TP_PAG : STRING; //ID DO TIPO DE PAGAMENTO
    R_TOTAL_PED, // TOTAL DO PEDIDO
    R_VLR_ITEM,//VALOR DO ITEM SEM MASCARA
    R_VLR_ITEM2,
    R_DESC_MAX : double; // desconto maximo
    S_VISU_PED_ID : STRING;  //ID DO PEDIDO PARA VER OS ITENS
    B_ALTERA_CLI, //CONTROLA O BOTAO ALTERAR
    B_ALTERA_PROD : BOOLEAN; //CONTROLA O BOTAO PROD
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MDCONEXAO,
   {$IFDEF ANDROID}
   Android.JNI.PowerManager,
   Network,
   {$ENDIF}
   FMFORMCADASTRO;

{ TForm1 }

procedure TForm1.ATUALIZA_CLIENTES;
begin
   /// Envia clientes novos
   LOG_SINC('Envia clientes');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM CLIENTE  ');
   QRYAUX_INT.SQL.Add('WHERE FALG_NOVO = ''S''  ');
   QRYAUX_INT.Open;

   while NOT QRYAUX_INT.Eof do
   BEGIN
      DMCONEXAO.CDS_AUX2.Close;
      DMCONEXAO.CDS_AUX2.CommandText:=
      'INSERT INTO CLIENTE(          '+
      '                    COD_CLI,                   '+
      '                    CODIGO_IBGE,               '+
      '                    CNPJ_CLI,             '+
      '                    FJ_CLI,         '+
      '                    NOME_CLI,                '+
      '                    NOME_FANTASIA,             '+
      '                    ENDRES_CLI,              '+
      '                    NUMRES_CLI,                   '+
      '                    PONTO_REFERNCIA,             '+
      '                    BAIRES_CLI,               '+
      '                    ESTRES_CLI,                   '+
      '                    CIDRES_CLI,                '+
      '                    CEPRES_CLI,                   '+
      '                    INC_ESTADUAL,          '+
      '                    TELRES_CLI,                  '+
      '                    CELULAR_CLI,               '+
      '                    EMAIL_CLI,                 '+
      '                    DATACADASTRO_CLI,               '+
      '                    FLAG_NOVO,               '+
      '                    ROTA_CLI               '+
      '                    )VALUES(               '+
      '                    '+IntToStr(QRYAUX_INT.FieldByName('COD_CLI').AsInteger)+',                     '+
      '                    '+IntToStr(QRYAUX_INT.FieldByName('CODIGO_IBGE').AsInteger)+',                     '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('CNPJ_CLI').AsString)+',                '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('FJ_CLI').AsString)+',                '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('NOME_CLI').AsString)+',               '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('NOME_FANTASIA').AsString)+',            '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('ENDRES_CLI').AsString)+',             '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('NUMRES_CLI').AsString)+',                  '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('PONTO_REFERENTE').AsString)+',            '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('BAIRES_CLI').AsString)+',              '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('ESTRES_CLI').AsString)+',                  '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('CIDRES_CLI').AsString)+',              '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('CEPRES_CLI').AsString)+',                 '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('INC_ESTADUAL').AsString)+',            '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('TELRES_CLI').AsString)+',               '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('CELULAR_CLI').AsString)+',           '+
      '                    '+QuotedStr(QRYAUX_INT.FieldByName('EMAIL_CLI').AsString)+',             '+
      '                    '''+QRYAUX_INT.FieldByName('DATACADASTRO_CLI').AsString+'''    ,      '+
      '                    ''S'',           '+
      '                    '+IntToStr(QRYAUX_INT.FieldByName('ROTA_CLI').AsInteger)+'    )      ';
      DMCONEXAO.CDS_AUX2.Execute;

      QRYAUX_INT2.Close;//ALTERA STATUS PARA NAO IR MAIS PARA A EMPRESA
      QRYAUX_INT2.SQL.Clear;
      QRYAUX_INT2.SQL.Add('UPDATE CLIENTE          ');
      QRYAUX_INT2.SQL.Add('SET FALG_NOVO = ''N''         ');
      QRYAUX_INT2.SQL.Add('WHERE CNPJ_CLI = '+QuotedStr(QRYAUX_INT.FieldByName('CNPJ_CLI').AsString)+'            ');
      QRYAUX_INT2.ExecSQL;

      Application.ProcessMessages;

      QRYAUX_INT.Next;
   END;

   /////////////ATUALIZA CLIENTE
   LOG_SINC('Limpando tabela Clientes');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('DELETE FROM CLIENTE');
   QRYAUX_INT.ExecSQL;


   LOG_SINC('Inserindo clientes');
   DMCONEXAO.CDS_AUX.Close;
   DMCONEXAO.CDS_AUX.CommandText :=
   'SELECT * FROM CLIENTE';
   DMCONEXAO.CDS_AUX.Open;

   while NOT DMCONEXAO.CDS_AUX.Eof do
   BEGIN
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO CLIENTE(COD_EMPRESA,          ');
      QRYAUX_INT.SQL.Add('                    COD_CLI,                   ');
      QRYAUX_INT.SQL.Add('                    CODIGO_IBGE,               ');
      QRYAUX_INT.SQL.Add('                    CNPJ_CLI,             ');
      QRYAUX_INT.SQL.Add('                    FJ_CLI,         ');
      QRYAUX_INT.SQL.Add('                    NOME_CLI,                ');
      QRYAUX_INT.SQL.Add('                    NOME_FANTASIA,             ');
      QRYAUX_INT.SQL.Add('                    ENDRES_CLI,              ');
      QRYAUX_INT.SQL.Add('                    NUMRES_CLI,                   ');
      QRYAUX_INT.SQL.Add('                    PONTO_REFERENCIA,             ');
      QRYAUX_INT.SQL.Add('                    BAIRES_CLI,               ');
      QRYAUX_INT.SQL.Add('                    ESTRES_CLI,                   ');
      QRYAUX_INT.SQL.Add('                    CIDRES_CLI,                ');
      QRYAUX_INT.SQL.Add('                    CEPRES_CLI,                   ');
      QRYAUX_INT.SQL.Add('                    INC_ESTADUAL,          ');
      QRYAUX_INT.SQL.Add('                    TELRES_CLI,                  ');
      QRYAUX_INT.SQL.Add('                    CELULAR_CLI,               ');
      QRYAUX_INT.SQL.Add('                    EMAIL_CLI,                 ');
      QRYAUX_INT.SQL.Add('                    DATACADASTRO_CLI,               ');
      QRYAUX_INT.SQL.Add('                    ROTA_CLI               ');
      QRYAUX_INT.SQL.Add('                    )VALUES(               ');
      QRYAUX_INT.SQL.Add('                    1,                     ');
      QRYAUX_INT.SQL.Add('                    '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('COD_CLI').AsInteger)+',                     ');
      QRYAUX_INT.SQL.Add('                    '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('CODIGO_IBGE').AsInteger)+',                     ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('CNPJ_CLI').AsString)+',                ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('FJ_CLI').AsString)+',                ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('NOME_CLI').AsString)+',               ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('NOME_FANTASIA').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ENDRES_CLI').AsString)+',             ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('NUMRES_CLI').AsString)+',                  ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('PONTO_REFERENCIA').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('BAIRES_CLI').AsString)+',              ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ESTRES_CLI').AsString)+',                  ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('CIDRES_CLI').AsString)+',              ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('CEPRES_CLI').AsString)+',                 ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('INC_ESTADUAL').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('TELRES_CLI').AsString)+',               ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('CELULAR_CLI').AsString)+',           ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('EMAIL_CLI').AsString)+',             ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DATACADASTRO_CLI').AsString)+'    ,      ');
      QRYAUX_INT.SQL.Add('                    '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('ROTA_CLI').AsInteger)+'    )      ');
      QRYAUX_INT.ExecSQL;

      Application.ProcessMessages;

      DMCONEXAO.CDS_AUX.Next;
   END;
end;

procedure TForm1.ATUALIZA_ITENS;
var
  LItem: TListViewItem;
begin
  // Code to fill TListView
  LV_ITENS.BeginUpdate;
  try
    LV_ITENS.Items.Clear;

    QRYITENS.Close;
    QRYITENS.SQL.Clear;
    QRYITENS.SQL.Add('SELECT A.*,B.DESC_PROD                    ');
    QRYITENS.SQL.Add('   FROM VENDA_DETALHES_TEMP A,            ');
    QRYITENS.SQL.Add('        PRODUTO B                        ');
    QRYITENS.SQL.Add('WHERE A.ID_VENDA_CABECALHO = '+S_NUM_PED+' AND                      ');
    QRYITENS.SQL.Add('      B.ID = A.ID_PRODUTO               ');
    QRYITENS.SQL.Add('ORDER BY A.ID             ');
    QRYITENS.Open;
    QRYITENS.First;

    FormatSettings.DecimalSeparator := ',';

    while NOT QRYITENS.Eof do
    begin
      LItem := LV_ITENS.Items.Add;
      LItem.Text := QRYITENSID_PRODUTO.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'Prod.: '+QRYITENSID_PRODUTO.AsString+' - '+QRYITENSDESC_PROD.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Vlr.Un.: '+FormatFloat('"R$ ",.00', QRYITENSVALOR_UNITARIO.AsFloat)+' Qtde: '+QRYITENSQUANTIDADE.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Desc.: '+FormatFloat('"% ",.00', QRYITENSDESCONTO.AsFloat)+' Vlr.Tot.: '+FormatFloat('"R$ ",.00', QRYITENSVALOR_TOTAL.AsFloat);

      QRYITENS.Next;
    end;
  finally
    LV_ITENS.EndUpdate;
  end;
end;

procedure TForm1.ATUALIZA_PEDIDOS;
begin
   LOG_SINC('Verificando Pedidos');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM VENDA_CABECALHOS          ');
   QRYAUX_INT.SQL.Add('WHERE FLAG_ENVIO = ''S''                  ');
   QRYAUX_INT.Open;

   if NOT QRYAUX_INT.IsEmpty then
   BEGIN
     LOG_SINC('Atualizando pedidos');
     while NOT QRYAUX_INT.Eof do
     BEGIN
        FormatSettings.DecimalSeparator := '.';
        DMCONEXAO.CDS_AUX2.Close;
        DMCONEXAO.CDS_AUX2.CommandText :=
        'INSERT INTO MB_VENDA_CABECALHOS(ID,                 '+
        '                             ID_CLIENTE,         '+
        '                             ID_USUARIO,         '+
        '							                      ID_FORM_PG,         '+
        '                             CNPJ_CPF_CLI,       '+
        '							                      CLIENT,             '+
        '                             DATA_VENDA,         '+
        '                             VALOR_VENDA,        '+
        '                             DESCONTO,           '+
        '                             VALOR_FINAL,        '+
        '                             SINCRONIZADO,       '+
        '                             STATUS_VENDA,       '+
        '                             ROTA,            '+
        '                             OBS            '+
        '                             )VALUES(            '+
        '                             '+IntToStr(QRYAUX_INT.FieldByName('ID').AsInteger)+',                  '+
        '							                      '+IntToStr(QRYAUX_INT.FieldByName('ID_CLIENTE').AsInteger)+',                  '+
        '                             '+IntToStr(QRYAUX_INT.FieldByName('ID_USUARIO').AsInteger)+',                  '+
        '                             '+IntToStr(QRYAUX_INT.FieldByName('ID_FORM_PG').AsInteger)+',  '+
        '                             '+QuotedStr(QRYAUX_INT.FieldByName('CNPJ_CPF_CLI').AsString)+',             '+
        '                             '+QuotedStr(QRYAUX_INT.FieldByName('CLIENT').AsString)+',  '+
        '                             '''+FormatDateTime('YYYY-MM-DD',QRYAUX_INT.FieldByName('DATA_VENDA').AsDateTime)+''',       '+
        '							                      '''+FloatToStr(QRYAUX_INT.FieldByName('VALOR_VENDA').AsFloat)+''',            '+
        '							                      '''+FloatToStr(QRYAUX_INT.FieldByName('DESCONTO').AsFloat)+''',               '+
        '                             '''+FloatToStr(QRYAUX_INT.FieldByName('VALOR_FINAL').AsFloat)+''',              '+
        '                             '+QuotedStr(QRYAUX_INT.FieldByName('SINCRONIZADO').AsString)+',               '+
        '							                      '+QuotedStr(QRYAUX_INT.FieldByName('STATUS_VENDA').AsString)+',               '+
        '							                      '+IntToStr(QRYAUX_INT.FieldByName('ROTA').AsInteger)+',               '+
        '                             '+QuotedStr(QRYAUX_INT.FieldByName('OBS').AsString)+'   )      ';
        DMCONEXAO.CDS_AUX2.Execute;

        FormatSettings.DecimalSeparator := ',';
        QRYAUX_PED_INT.Close;
        QRYAUX_PED_INT.SQL.Clear;
        QRYAUX_PED_INT.SQL.Add('SELECT * FROM venda_detalhes      ');
        QRYAUX_PED_INT.SQL.Add('WHERE ID_VENDA_CABECALHO =  '+IntToStr(QRYAUX_INT.FieldByName('ID').AsInteger)+'                      ');
        QRYAUX_PED_INT.Open;

        while NOT QRYAUX_PED_INT.Eof do
        BEGIN
           FormatSettings.DecimalSeparator := '.';
           DMCONEXAO.CDS_AUX2.Close;
           DMCONEXAO.CDS_AUX2.CommandText :=
           'INSERT INTO MB_VENDA_DETALHES(ID,                  '+
           '                           ID_VENDA_CABECALHO,  '+
           '                           ITEM,                '+
           '                           ID_PRODUTO,          '+
           '                           DESC_PROD,           '+
           '                           UN,                  '+
           '                           VALOR_UNITARIO,      '+
           '                           QUANTIDADE,          '+
           '                           TOTAL_ITEM,          '+
           '						                     DESCONTO,            '+
           '                           VALOR_TOTAL,         '+
           '                           VL_DESCONTO,         '+
           '                           ST,                  '+
           '                           SINCRONIZADO        '+
           '                           )VALUES(             '+
           '                           '+IntToStr(QRYAUX_PED_INT.FieldByName('ID').AsInteger)+',                   '+
           '                           '+IntToStr(QRYAUX_PED_INT.FieldByName('ID_VENDA_CABECALHO').AsInteger)+',                   '+
           '                           '+IntToStr(QRYAUX_PED_INT.FieldByName('ITEM').AsInteger)+',                   '+
           '                           '+QuotedStr(QRYAUX_PED_INT.FieldByName('ID_PRODUTO').AsString)+',                 '+
           '                           '+QuotedStr(QRYAUX_PED_INT.FieldByName('DESC_PROD').AsString)+',              '+
           '						                     '+QuotedStr(QRYAUX_PED_INT.FieldByName('UN').AsString)+',                '+
           '                           '''+FloatToStr(QRYAUX_PED_INT.FieldByName('VALOR_UNITARIO').AsFloat)+''',             '+
           '						                     '+IntToStr(QRYAUX_PED_INT.FieldByName('QUANTIDADE').AsInteger)+',                  '+
           '                           '''+FloatToStr(QRYAUX_PED_INT.FieldByName('TOTAL_ITEM').AsFloat)+''',           '+
           '                           '''+FloatToStr(QRYAUX_PED_INT.FieldByName('DESCONTO').AsFloat)+''',                   '+
           '                           '''+FloatToStr(QRYAUX_PED_INT.FieldByName('VALOR_TOTAL').AsFloat)+''',               '+
            '                           '''+FloatToStr(QRYAUX_PED_INT.FieldByName('VL_DESCONTO').AsFloat)+''',               '+
           '                           '+QuotedStr(QRYAUX_PED_INT.FieldByName('ST').AsString)+',                   '+
           '                           '+QuotedStr(QRYAUX_PED_INT.FieldByName('SINCRONIZADO').AsString)+')                 ';
           DMCONEXAO.CDS_AUX2.Execute;
           FormatSettings.DecimalSeparator := ',';

           QRYAUX_PED_INT.Next;
        END;

        QRYAUX_INT2.Close;
        QRYAUX_INT2.SQL.Clear;
        QRYAUX_INT2.SQL.Add('UPDATE VENDA_CABECALHOS         ');
        QRYAUX_INT2.SQL.Add('SET FLAG_ENVIO = ''N'',            ');
        QRYAUX_INT2.SQL.Add('    STATUS_VENDA = ''E''            ');
        QRYAUX_INT2.SQL.Add('WHERE ID = '+IntToStr(QRYAUX_INT.FieldByName('ID').AsInteger)+'                    ');
        QRYAUX_INT2.ExecSQL;

        QRYAUX_INT.Next;
     END;
   END;

   //VERIFICA STATUS DO PEDIDO
   LOG_SINC('Retorno de pedido');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM VENDA_CABECALHOS     ');
   QRYAUX_INT.SQL.Add('WHERE STATUS_VENDA = ''E''           ');
   QRYAUX_INT.Open;

   while NOT QRYAUX_INT.Eof do
   BEGIN
      DMCONEXAO.CDS_AUX.Close;
      DMCONEXAO.CDS_AUX.CommandText :=
      'SELECT coalesce(STATUS_VENDA,''P'') "STATUS_VENDA" FROM MB_VENDA_CABECALHOS     '+
      'where id = '+IntToStr(QRYAUX_INT.FieldByName('ID').AsInteger)+'                 ';
      DMCONEXAO.CDS_AUX.Open;

      if DMCONEXAO.CDS_AUX.FieldByName('STATUS_VENDA').AsString <> 'P' then
      BEGIN
         QRYAUX_PED_INT.Close;
         QRYAUX_PED_INT.SQL.Clear;
         QRYAUX_PED_INT.SQL.Add('UPDATE VENDA_CABECALHOS    ');
         QRYAUX_PED_INT.SQL.Add('SET STATUS_VENDA = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('STATUS_VENDA').AsString)+'           ');
         QRYAUX_PED_INT.SQL.Add('WHERE ID = '+IntToStr(QRYAUX_INT.FieldByName('ID').AsInteger)+'                     ');
         QRYAUX_PED_INT.ExecSQL;
      END;

      QRYAUX_INT.Next;
   END;
end;

procedure TForm1.ATUALIZA_PRODUTOS;
begin
   LOG_SINC('Verificando produtos');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('DELETE FROM PRODUTO');
   QRYAUX_INT.ExecSQL;

   LOG_SINC('Inserindo produtos');
   DMCONEXAO.CDS_AUX.Close;
   DMCONEXAO.CDS_AUX.CommandText :=
   'SELECT * FROM PRODUTO '+
   'WHERE SIT = ''A''   ';
   DMCONEXAO.CDS_AUX.Open;

   while NOT DMCONEXAO.CDS_AUX.Eof do
   BEGIN
      FormatSettings.DecimalSeparator := '.';
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO PRODUTO(COD_PRO,               ');
      QRYAUX_INT.SQL.Add('                    NOME_PRO,        ');
      QRYAUX_INT.SQL.Add('                    CODIGO_UNIDADE_SAIDA,               ');
      QRYAUX_INT.SQL.Add('                    COD_GRUPO,          ');
//      QRYAUX_INT.SQL.Add('                    GRUP,             ');
      QRYAUX_INT.SQL.Add('                    ATIVO_PRO,              ');
      QRYAUX_INT.SQL.Add('                    VALOR_PRO,          ');
      QRYAUX_INT.SQL.Add('                    PRECO_PRAZO_PRO,          ');
//      QRYAUX_INT.SQL.Add('                    ESTOQUE,          ');
      QRYAUX_INT.SQL.Add('                    ULTIMA_ALTERACAO          ');
      QRYAUX_INT.SQL.Add('                     )VALUES(         ');
      QRYAUX_INT.SQL.Add('                     '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('COD_PRO').AsInteger)+',               ');
      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('NOME_PRO').AsString)+',          ');
      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('CODIGO_UNIDADE_SAIDA').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('COD_GRUPO').AsString)+',        ');
//      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('GRUP').AsString)+',           ');
      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ATIVO_PRO').AsString)+',              ');
      QRYAUX_INT.SQL.Add('                     '''+FloatToStr(DMCONEXAO.CDS_AUX.FieldByName('VALOR_PRO').AsFloat)+''',        ');
      QRYAUX_INT.SQL.Add('                     '''+FloatToStr(DMCONEXAO.CDS_AUX.FieldByName('PRECO_PRAZO_PRO').AsFloat)+''',        ');
//      QRYAUX_INT.SQL.Add('                     '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('ESTOQUE').AsInteger)+',              ');
      QRYAUX_INT.SQL.Add('                     '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ULTIMA_ALTERACAO').AsString)+'    )    ');
      QRYAUX_INT.ExecSQL;
      FormatSettings.DecimalSeparator := ',';
      Application.ProcessMessages;

      DMCONEXAO.CDS_AUX.Next;
   END;

   /////////////ATUALIZA FORMA DE PAGAMENTO
   LOG_SINC('Inserindo Forma pag.');
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('DELETE FROM FORMA_PAG');
   QRYAUX_INT.ExecSQL;

   DMCONEXAO.CDS_AUX.Close;
   DMCONEXAO.CDS_AUX.CommandText:=
   'SELECT * FROM MB_FORMA_PAG';
   DMCONEXAO.CDS_AUX.Open;

   while NOT DMCONEXAO.CDS_AUX.Eof do
   BEGIN
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO FORMA_PAG(ID,                 ');
      QRYAUX_INT.SQL.Add('                      QNT_PAC,            ');
      QRYAUX_INT.SQL.Add('                      DESC_PAG,          ');
      QRYAUX_INT.SQL.Add('                      ESPECIE_PAG        ');
      QRYAUX_INT.SQL.Add('                      )VALUES(           ');
      QRYAUX_INT.SQL.Add('                      '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('ID').AsInteger)+',                 ');
      QRYAUX_INT.SQL.Add('                      '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('QNT_PAC').AsInteger)+',                 ');
      QRYAUX_INT.SQL.Add('                      '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DESC_PAG').AsString)+',             ');
      QRYAUX_INT.SQL.Add('                      '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ESPECIE_PAG').AsString)+'   )         ');
      QRYAUX_INT.ExecSQL;

      DMCONEXAO.CDS_AUX.Next;
   END;
end;

procedure TForm1.ATUALIZA_VALOR_ITENS;
begin
   try
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT coalesce(SUM(VALOR_TOTAL),0) "TOTAL"       ');
      QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES_TEMP           ');
      QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                          ');
      QRYAUX_INT.Open;

      if QRYAUX_INT.FieldByName('TOTAL').AsFloat >0 then
         R_TOTAL_PED := QRYAUX_INT.FieldByName('TOTAL').AsFloat
      ELSE
         R_TOTAL_PED :=0;

      LB_VLRTOTAL.Text := 'Total Ped.:'+FormatFloat('"R$ ",.00',R_TOTAL_PED);
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
        ShowMessage(E.Message);
        ABORT;
      END;
   END;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  { if QRYVISUPED.IsEmpty then
      ABORT;  }
   if LV_PEDIDOS.Items.Count = 0 then
      ABORT;

   if S_VISU_PED_ID = '' then
   BEGIN
      ShowMessage('Selecione um pedido');
      ABORT;
   END;

   RT_SEL_EMAIL.Visible := TRUE;
   RT_EMAIL.Visible := TRUE;
   Panel6.Enabled := FALSE;
   ToolBar20.Enabled := FALSE;
end;

procedure TForm1.LB_NOVOPEDClick(Sender: TObject);
begin
   BUSCA_CLI;
   LV_CLI.ItemIndex :=-1;
   ChangeTabAction3.ExecuteTarget(self);
end;

procedure TForm1.ListBoxItem2Click(Sender: TObject);
begin
   DT_INI.Date := NOW-2;
   DT_FIM.Date := NOW;
   BTN_BUSCA_PEDClick(SELF);
   LV_PEDIDOS.ItemIndex :=-1;
   ChangeTabAction10.ExecuteTarget(self);
end;

procedure TForm1.ListBoxItem3Click(Sender: TObject);
begin
   ChangeTabAction5.ExecuteTarget(self);
end;

procedure TForm1.ListBoxItem4Click(Sender: TObject);
begin
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
   QRYAUX_INT.Open;

   EDT_DADOS_ID.Text:= QRYAUX_INT.FieldByName('ID').AsString;
   EDT_DADOS_NOME.Text:= QRYAUX_INT.FieldByName('DESC_USUARIO').AsString;
   EDT_DADOS_LOGIN.Text:= QRYAUX_INT.FieldByName('LOGIN').AsString;
   EDT_DADOS_EMAIL.Text:= QRYAUX_INT.FieldByName('IMAIL').AsString;
   EDT_DADOS_CAD.Text:= QRYAUX_INT.FieldByName('DATA_CAD').AsString;

   ChangeTabAction12.ExecuteTarget(self);
end;

procedure TForm1.ListBoxItem5Click(Sender: TObject);
begin
    ShowMessage('Help Service Informática - Tel. (82)99924-4042 E-mail: helpserviceinfor2016@gmail.com ');
end;

procedure TForm1.ListBoxItem6Click(Sender: TObject);
begin
   ChangeTabAction13.ExecuteTarget(self);
   FMCADASTROS.ChangeTabAction3.ExecuteTarget(self);
   FMCADASTROS.ATUALIZA_CLINOVO;
   //FMCADASTROS.CARREGA_ROTA;
   FMCADASTROS.LV_NOVOCLI.ItemIndex := -1;
   IF B_ALTERA_CLI then
   BEGIN
      FMCADASTROS.BTN_ALTERACLI.Visible := FALSE;
      FMCADASTROS.BTN_ADDCLI.Visible := TRUE;
   END ELSE
   BEGIN
      FMCADASTROS.BTN_ALTERACLI.Visible := FALSE;
      FMCADASTROS.BTN_ADDCLI.Visible := FALSE;
   END;

   FMCADASTROS.Show;
end;

procedure TForm1.ListBoxItem7Click(Sender: TObject);
begin
   ChangeTabAction13.ExecuteTarget(self);
   FMCADASTROS.ChangeTabAction2.ExecuteTarget(self);
   FMCADASTROS.CARREGA_PROD;
   FMCADASTROS.ListViewMultiDetail.ItemIndex := -1;
   IF B_ALTERA_PROD then
   BEGIN
      FMCADASTROS.BTN_ALTERAPROD.Visible := TRUE;
      FMCADASTROS.BTN_NOVOPROD.Visible := TRUE;
   END ELSE
   BEGIN
      FMCADASTROS.BTN_ALTERAPROD.Visible := FALSE;
      FMCADASTROS.BTN_NOVOPROD.Visible := FALSE;
   END;
   FMCADASTROS.Show;
end;

procedure TForm1.ListViewMultiDetailItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   S_PROD:='';

   {if QRYPROD.IsEmpty then
      ABORT; }
   if ListViewMultiDetail.Items.Count = 0 then
      ABORT;

   S_PROD := GetSelectedValue(ListViewMultiDetail).ToString;
end;

procedure TForm1.LOG_SINC(S_DESC: STRING);
begin
   LB_SINC.Items.Add(S_DESC);
   LB_SINC.ItemIndex := LB_SINC.Items.Count-1;
   LB_SINC.ItemIndex := -1;
   Application.ProcessMessages;
end;

procedure TForm1.LV_CLIItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   S_ID_CLI := '';

   {if QRYCLI.IsEmpty then
      ABORT;  }
   if LV_CLI.Items.Count = 0 then
      ABORT;

   S_ID_CLI := GetSelectedValue(LV_CLI).ToString;
end;

procedure TForm1.LV_ITENSItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   S_PROD :='';

   {if QRYITENS.IsEmpty then
      ABORT;    }
   if LV_ITENS.Items.Count = 0 then
      ABORT;

   S_PROD := GetSelectedValue(LV_ITENS).ToString;
end;

procedure TForm1.LV_PEDIDOSItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   S_VISU_PED_ID :='';

   S_VISU_PED_ID := GetSelectedValue(LV_PEDIDOS).ToString;
end;

function TForm1.MAX_ALPHA(EDIT: STRING; I_TAMANHO: INTEGER): STRING;
begin
   RESULT := Copy(EDIT,0,I_TAMANHO);
end;

procedure TForm1.RestorePosition;
begin
  VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X, 0);
  MainLayout1.Align := TAlignLayout.alClient;
  VertScrollBox1.RealignContent;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
   S_OBS := '';
   R_DESC_MAX := 0;

   QRYAUX_INT.Close;  //LIMPA A TB TEMPORARIA
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('DELETE FROM VENDA_DETALHES_TEMP');
   QRYAUX_INT.ExecSQL;

   S_TIPO_PED := 'N';
   S_OBS := MEMO_OBS.TEXT;

   QRYAUX_INT.Close; //FERIFICA SE DA DESCONTO E QUANTO
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT coalesce(FLAG_DESCONTO,''N'')"FLAG_DESCONTO",  ');
   QRYAUX_INT.SQL.Add('       coalesce(DES_MAX,0)"DES_MAX"                 ');
   QRYAUX_INT.SQL.Add(' FROM USUARIO                                     ');
   QRYAUX_INT.Open;

   if QRYAUX_INT.FieldByName('FLAG_DESCONTO').AsString = 'S' then
   BEGIN
      Label60.Visible := TRUE;
      EDT_DESCONTO.Visible := TRUE;
      R_DESC_MAX := QRYAUX_INT.FieldByName('DES_MAX').AsFloat;
   END ELSE
   BEGIN
      Label60.Visible := FALSE;
      EDT_DESCONTO.Visible := FALSE;
   END;

   ChangeTabAction4.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
   BUSCA_CLI;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
   VERIFICA_COENXAO;
   TRY
      FGACTIVITYDIALOG.MESSAGE := 'Aguarde';
      FGACTIVITYDIALOG.show;
      TRY

         FGACTIVITYDIALOG.message := 'Verificando Conexão.';
         sleep(500);

         LB_SINC.Items.Clear;
         LOG_SINC('Verificando Conexão');
         LOG_SINC('Conectando');

         FGACTIVITYDIALOG.message := 'Conectando.';
         sleep(500);

         CONEXAO_ON;

         FGACTIVITYDIALOG.message := 'Atualizando produtos.';
         sleep(500);
         ATUALIZA_PRODUTOS;

         FGACTIVITYDIALOG.message := 'Atualizando clientes.';
         sleep(500);
         ATUALIZA_CLIENTES;

         CONEXAO_OFF;
         LOG_SINC('Finalizando Sincronismo');

      FINALLY
         FGACTIVITYDIALOG.Hide;
      END;
      ShowMessage('Sincronismo finalizado');
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         CONEXAO_OFF;
         ChangeTabAction1.ExecuteTarget(self);
         Memo1.Lines.Clear;
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
   QRYVISUPED.Close;
   LV_PEDIDOS.Items.Clear;
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
   {if QRYVISUPED.IsEmpty then
      ABORT;     }
   if LV_PEDIDOS.Items.Count = 0 then
      ABORT;

   If S_VISU_PED_ID = '' THEN
   BEGIN
      ShowMessage('Selecione um pedido');
      ABORT;
   END;

   MessageDlg('Deseja realmente excluir o pedido?', System.UITypes.TMsgDlgType.mtInformation,
   [
   System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
      procedure(const AResult: TModalResult)
      begin
         case AResult of
         { Detect which button was pushed and show a different message }
         mrYes:
         begin
            TRY

               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE                         ');
               QRYAUX_INT.SQL.Add('   FROM VENDA_CABECALHOS       ');
               QRYAUX_INT.SQL.Add('WHERE ID = '+S_VISU_PED_ID+'                 ');
               QRYAUX_INT.ExecSQL;

               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE                       ');
               QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES       ');
               QRYAUX_INT.SQL.Add('WHERE ID = '+S_VISU_PED_ID+'               ');
               QRYAUX_INT.ExecSQL;

               BTN_BUSCA_PEDClick(SELF);
            EXCEPT
            ON E: EXCEPTION DO
            BEGIN
               IF E.MESSAGE <> 'Operation aborted' THEN
                  ShowMessage(E.Message);
                  ABORT;
               END;
            END;
         end;
         mrNo:
         begin
            abort;
         end;
      end;
   end
   );
  { if MessageDlg('Deseja realmente excluir o pedido?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], -1) = mrOK then
   begin
      TRY

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('DELETE                         ');
         QRYAUX_INT.SQL.Add('   FROM VENDA_CABECALHOS       ');
         QRYAUX_INT.SQL.Add('WHERE ID = '+S_VISU_PED_ID+'                 ');
         QRYAUX_INT.ExecSQL;

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('DELETE                       ');
         QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES       ');
         QRYAUX_INT.SQL.Add('WHERE ID = '+S_VISU_PED_ID+'               ');
         QRYAUX_INT.ExecSQL;

         BTN_BUSCA_PEDClick(SELF);
      EXCEPT
      ON E: EXCEPTION DO
      BEGIN
         IF E.MESSAGE <> 'Operation aborted' THEN
            ShowMessage(E.Message);
            ABORT;
         END;
      END;
   end ELSE
   BEGIN
     ABORT;
   END;     }
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
   QRYITENS_DETAL.Close;
   LV_ITENSPED.Items.Clear;
   ChangeTabAction10.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton19Click(Sender: TObject);
begin
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.BTN_VISUALIZA_ITENSClick(Sender: TObject);
var
  LItem: TListViewItem;
begin
   {if QRYVISUPED.IsEmpty then
      ABORT;      }
   if LV_PEDIDOS.Items.Count = 0 then
      ABORT;

   if S_VISU_PED_ID = '' then
   BEGIN
      ShowMessage('Selecione um pedido');
      ABORT;
   END;

  // Code to fill TListView
  LV_ITENSPED.BeginUpdate;
  try
    LV_ITENSPED.Items.Clear;


   QRYITENS_DETAL.Close;
   QRYITENS_DETAL.SQL.Clear;
   QRYITENS_DETAL.SQL.Add('SELECT A.*,B.DESC_PROD"DESC_PRODUTO"        ');
   QRYITENS_DETAL.SQL.Add('   FROM VENDA_DETALHES A,                   ');
   QRYITENS_DETAL.SQL.Add('        PRODUTO B                           ');
   QRYITENS_DETAL.SQL.Add('WHERE A.ID_VENDA_CABECALHO = '+S_VISU_PED_ID+' AND                          ');
   QRYITENS_DETAL.SQL.Add('      B.ID = A.ID_PRODUTO                   ');
   QRYITENS_DETAL.SQL.Add(' ORDER BY A.ID                 ');
   QRYITENS_DETAL.Open;

    while NOT QRYITENS_DETAL.Eof do
    begin
      LItem := LV_ITENSPED.Items.Add;
      LItem.Text := QRYITENS_DETALID_PRODUTO.AsString+' - '+QRYITENS_DETALDESC_PRODUTO.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := 'Vlr.Un.: '+FormatFloat('"R$ ",.00', QRYITENS_DETALVALOR_UNITARIO.AsFloat)+' Qtde.: '+QRYITENS_DETALQUANTIDADE.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Desc.: '+FormatFloat('"% ",.00', QRYITENS_DETALDESCONTO.AsFloat);
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Vlr.Tot.: '+FormatFloat('"R$ ",.00', QRYITENS_DETALVALOR_TOTAL.AsFloat);

      QRYITENS_DETAL.Next;
    end;
  finally
    LV_ITENSPED.EndUpdate;
  end;
  LV_ITENSPED.ItemIndex:=-1;
  QRYITENS_DETAL.Close;
  ChangeTabAction11.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
   if S_TIPO_PED = 'N' then
   BEGIN
      MessageDlg('O pedido sera excluido,deseja continuar?', System.UITypes.TMsgDlgType.mtInformation,
      [
      System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
         procedure(const AResult: TModalResult)
         begin
            case AResult of
            { Detect which button was pushed and show a different message }
            mrYes:
            begin
               QRYITENS.Close;
               QRYCLI.Close;
               QRYPROD.Close;
               LV_ITENS.Items.Clear;
               ListViewMultiDetail.Items.Clear;
               LV_CLI.Items.Clear;
               EDT_BUSCACLI.Text:='';
               EDT_BUSCAPROD.Text := '';
               CB_COND_PAG.Clear;
               LB_VLRTOTAL.Text := 'Total Ped.:';
               S_TIPO_CLI := '';
               EDT_PROD.Text:='';
               EDT_DESCONTO.Text:='';
               EDT_DESCPROD.Text:='';
               EDT_VALORPROD.Text:='';
               EDT_QTDE.Text:='';

               EDT_IDCLI.Text:= '';
               EDT_RAZAOCLI.Text:='';
               EDT_NUMPED.Text:='';
               EDT_TPCLI.Text:='';
               MEMO_OBS.Lines.Clear;
               CB_COND_PAG.Clear;

               ChangeTabAction2.ExecuteTarget(self);
            end;
            mrNo:
            begin
               abort;
            end;
         end;
      end
      );



     { if MessageDlg('O pedido sera excluido,deseja continuar?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], -1) = mrOK then
      begin
         QRYITENS.Close;
         QRYCLI.Close;
         QRYPROD.Close;
         LV_ITENS.Items.Clear;
         ListViewMultiDetail.Items.Clear;
         LV_CLI.Items.Clear;
         EDT_BUSCACLI.Text:='';
         EDT_BUSCAPROD.Text := '';
         CB_COND_PAG.Items.Clear;
         LB_VLRTOTAL.Text := 'Total Ped.:';
         S_TIPO_CLI := '';
         EDT_PROD.Text:='';
         EDT_DESCONTO.Text:='';
         EDT_DESCPROD.Text:='';
         EDT_VALORPROD.Text:='';
         EDT_QTDE.Text:='';

         EDT_IDCLI.Text:= '';
         EDT_RAZAOCLI.Text:='';
         EDT_NUMPED.Text:='';
         EDT_TPCLI.Text:='';
         MEMO_OBS.Lines.Clear;
         CB_COND_PAG.Items.Clear;

         ChangeTabAction2.ExecuteTarget(self);
      end ELSE
      BEGIN
        ABORT;
      END;  }
   END ELSE
   BEGIN
      QRYITENS.Close;
      QRYCLI.Close;
      QRYPROD.Close;
      LV_ITENS.Items.Clear;
      ListViewMultiDetail.Items.Clear;
      LV_CLI.Items.Clear;
      EDT_BUSCACLI.Text:='';
      EDT_BUSCAPROD.Text := '';
      CB_COND_PAG.Clear;
      LB_VLRTOTAL.Text := 'Total Ped.:';
      S_TIPO_CLI := '';
      EDT_PROD.Text:='';
      EDT_DESCONTO.Text:='';
      EDT_DESCPROD.Text:='';
      EDT_VALORPROD.Text:='';
      EDT_QTDE.Text:='';
      ChangeTabAction10.ExecuteTarget(self);
   END;
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
   RT_SEL_EMAIL.Visible := FALSE;
   RT_EMAIL.Visible := FALSE;
   Panel6.Enabled := TRUE;
   ToolBar20.Enabled := TRUE;
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
   VERIFICA_COENXAO;

   FGACTIVITYDIALOG.MESSAGE := 'Aguarde';
   FGACTIVITYDIALOG.show;
   TRY

      if SW_ENVCLI.IsChecked then
      BEGIN
         FGACTIVITYDIALOG.message := 'Enviando email';
         sleep(1000);
         ENVIA_EMAIL(S_VISU_PED_ID);
      END;

   FINALLY
      FGACTIVITYDIALOG.Hide;
   END;

   RT_SEL_EMAIL.Visible := FALSE;
   RT_EMAIL.Visible := FALSE;
   Panel6.Enabled := TRUE;
   ToolBar20.Enabled := TRUE;
   ShowMessage('Simulação de envio completa');
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
   if QRYITENS.IsEmpty then
   BEGIN
      ShowMessage('Pedido sem itens');
      ABORT;
   END;

   TRY
      FormatSettings.DecimalSeparator := '.';
      if S_TIPO_PED = 'N' then //N = NOVO PEDIDO
      BEGIN
         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('INSERT INTO VENDA_DETALHES (ID,                       ');
         QRYAUX_INT.SQL.Add('                            ID_VENDA_CABECALHO,       ');
         QRYAUX_INT.SQL.Add('                            ID_PRODUTO,               ');
         QRYAUX_INT.SQL.Add('                            DESC_PROD,               ');
         QRYAUX_INT.SQL.Add('                            UN,                       ');
         QRYAUX_INT.SQL.Add('                            VALOR_UNITARIO,           ');
         QRYAUX_INT.SQL.Add('                            QUANTIDADE,               ');
         QRYAUX_INT.SQL.Add('                            TOTAL_ITEM,               ');
         QRYAUX_INT.SQL.Add('                            DESCONTO,                 ');
         QRYAUX_INT.SQL.Add('                            VALOR_TOTAL,              ');
         QRYAUX_INT.SQL.Add('                            ST,                       ');
         QRYAUX_INT.SQL.Add('                            DATA_PED,                 ');
         QRYAUX_INT.SQL.Add('                            VL_DESCONTO               ');
         QRYAUX_INT.SQL.Add('                            )                         ');
         QRYAUX_INT.SQL.Add('SELECT ID,                                            ');
         QRYAUX_INT.SQL.Add('       ID_VENDA_CABECALHO,                ');
         QRYAUX_INT.SQL.Add('       ID_PRODUTO,                                    ');
         QRYAUX_INT.SQL.Add('       DESC_PROD,               ');
         QRYAUX_INT.SQL.Add('       UN,                                            ');
         QRYAUX_INT.SQL.Add('       VALOR_UNITARIO,                                ');
         QRYAUX_INT.SQL.Add('       QUANTIDADE,                                    ');
         QRYAUX_INT.SQL.Add('       TOTAL_ITEM,                                    ');
         QRYAUX_INT.SQL.Add('       DESCONTO,                                      ');
         QRYAUX_INT.SQL.Add('       VALOR_TOTAL,                                   ');
         QRYAUX_INT.SQL.Add('       ST,                                            ');
         QRYAUX_INT.SQL.Add('       DATA_PED ,                                      ');
         QRYAUX_INT.SQL.Add('       VL_DESCONTO                  ');
         QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES_TEMP                          ');
         QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                                          ');
         QRYAUX_INT.ExecSQL;

         QRYAUX_INT2.Close;  //SOMA DO TOTAL SEM DESCONTO
         QRYAUX_INT2.SQL.Clear;
         QRYAUX_INT2.SQL.Add('SELECT coalesce(SUM(TOTAL_ITEM),0) "TOTAL"       ');
         QRYAUX_INT2.SQL.Add('   FROM VENDA_DETALHES_TEMP           ');
         QRYAUX_INT2.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                          ');
         QRYAUX_INT2.Open;

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('INSERT INTO VENDA_CABECALHOS(ID,                   ');
         QRYAUX_INT.SQL.Add('                             ID_CLIENTE,           ');
         QRYAUX_INT.SQL.Add('                             ID_USUARIO,           ');
         QRYAUX_INT.SQL.Add('                             CNPJ_CPF_CLI,           ');
         QRYAUX_INT.SQL.Add('                             CLIENT,           ');
         QRYAUX_INT.SQL.Add('                             ID_FORM_PG,           ');
         QRYAUX_INT.SQL.Add('                             DATA_VENDA,           ');
         QRYAUX_INT.SQL.Add('                             VALOR_VENDA,          ');
         QRYAUX_INT.SQL.Add('                             DESCONTO,             ');
         QRYAUX_INT.SQL.Add('                             VALOR_FINAL,          ');
         QRYAUX_INT.SQL.Add('                             STATUS_VENDA,         ');
         QRYAUX_INT.SQL.Add('                             DATA_PED,         ');
         QRYAUX_INT.SQL.Add('                             FLAG_ENVIO,            ');
         QRYAUX_INT.SQL.Add('                             OBS             ');
         QRYAUX_INT.SQL.Add('                                         ');
         QRYAUX_INT.SQL.Add('                             )VALUES(              ');
         QRYAUX_INT.SQL.Add('                             '+S_NUM_PED+',                    ');
         QRYAUX_INT.SQL.Add('                             '+S_ID_CLI+',                    ');
         QRYAUX_INT.SQL.Add('                             '+S_ID_USUA+',                    ');
         QRYAUX_INT.SQL.Add('                             '+QuotedStr(S_CNPJ_CPF)+',                    ');
         QRYAUX_INT.SQL.Add('                             '+QuotedStr(EDT_RAZAOCLI.Text)+' , ');
         QRYAUX_INT.SQL.Add('                             '+S_TP_PAG+',                    ');
         QRYAUX_INT.SQL.Add('                             '''+FormatDateTime('YYYY-MM-DD',NOW)+''',         ');
         QRYAUX_INT.SQL.Add('                             '''+FloatToStr(QRYAUX_INT2.FieldByName('TOTAL').AsFloat)+''',                  ');
         QRYAUX_INT.SQL.Add('                             '''+FloatToStr(QRYAUX_INT2.FieldByName('TOTAL').AsFloat-R_TOTAL_PED)+''',                    ');
         QRYAUX_INT.SQL.Add('                             '''+FloatToStr(R_TOTAL_PED)+''',                  ');
         QRYAUX_INT.SQL.Add('                             ''P'',                  ');
         QRYAUX_INT.SQL.Add('                             '''+FormatDateTime('YYYY-MM-DD',NOW)+''',         ');
         QRYAUX_INT.SQL.Add('                             ''S'',                  ');
         QRYAUX_INT.SQL.Add('                             '+QuotedStr(S_OBS)+'  ');
         QRYAUX_INT.SQL.Add('                                    )               ');
         ShowMessage(QRYAUX_INT.SQL.Text);
         QRYAUX_INT.ExecSQL;
      END ELSE  //SE NAO E ALTERACAO DO PEDIDO
      BEGIN
         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('DELETE FROM VENDA_DETALHES     ');
         QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                  ');
         QRYAUX_INT.ExecSQL;

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('INSERT INTO VENDA_DETALHES (ID,                       ');
         QRYAUX_INT.SQL.Add('                            ID_VENDA_CABECALHO,       ');
         QRYAUX_INT.SQL.Add('                            ID_PRODUTO,               ');
         QRYAUX_INT.SQL.Add('                            DESC_PROD,               ');
         QRYAUX_INT.SQL.Add('                            UN,                       ');
         QRYAUX_INT.SQL.Add('                            VALOR_UNITARIO,           ');
         QRYAUX_INT.SQL.Add('                            QUANTIDADE,               ');
         QRYAUX_INT.SQL.Add('                            TOTAL_ITEM,               ');
         QRYAUX_INT.SQL.Add('                            DESCONTO,                 ');
         QRYAUX_INT.SQL.Add('                            VALOR_TOTAL,              ');
         QRYAUX_INT.SQL.Add('                            ST,                       ');
         QRYAUX_INT.SQL.Add('                            DATA_PED,                  ');
         QRYAUX_INT.SQL.Add('                            VL_DESCONTO                  ');
         QRYAUX_INT.SQL.Add('                            )                         ');
         QRYAUX_INT.SQL.Add('SELECT ID,                                            ');
         QRYAUX_INT.SQL.Add('       ID_VENDA_CABECALHO,                ');
         QRYAUX_INT.SQL.Add('       ID_PRODUTO,                                    ');
         QRYAUX_INT.SQL.Add('       DESC_PROD,               ');
         QRYAUX_INT.SQL.Add('       UN,                                            ');
         QRYAUX_INT.SQL.Add('       VALOR_UNITARIO,                                ');
         QRYAUX_INT.SQL.Add('       QUANTIDADE,                                    ');
         QRYAUX_INT.SQL.Add('       TOTAL_ITEM,                                    ');
         QRYAUX_INT.SQL.Add('       DESCONTO,                                      ');
         QRYAUX_INT.SQL.Add('       VALOR_TOTAL,                                   ');
         QRYAUX_INT.SQL.Add('       ST,                                            ');
         QRYAUX_INT.SQL.Add('       DATA_PED ,                                      ');
         QRYAUX_INT.SQL.Add('       VL_DESCONTO                  ');
         QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES_TEMP                          ');
         QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                                          ');
         QRYAUX_INT.ExecSQL;

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('UPDATE VENDA_CABECALHOS    ');
         QRYAUX_INT.SQL.Add('SET VALOR_FINAL = '''+FloatToStr(R_TOTAL_PED)+'''      ');
         QRYAUX_INT.SQL.Add('WHERE ID = '+S_NUM_PED+'                  ');
         QRYAUX_INT.ExecSQL;
      END;

      QRYITENS.Close;
      QRYCLI.Close;
      QRYPROD.Close;
      LV_ITENS.Items.Clear;
      ListViewMultiDetail.Items.Clear;
      LV_CLI.Items.Clear;
      EDT_BUSCACLI.Text:='';
      EDT_BUSCAPROD.Text := '';
      S_TIPO_CLI := '';
      S_OBS :='';

      EDT_PROD.Text:= '';
      EDT_DESCONTO.Text:='';
      EDT_DESCPROD.Text :='';
      EDT_VALORPROD.Text :='';
      R_VLR_ITEM :=0;
      EDT_QTDE.Text :='';

      EDT_IDCLI.Text:= '';
      EDT_RAZAOCLI.Text:='';
      EDT_NUMPED.Text:='';
      EDT_TPCLI.Text:='';
      MEMO_OBS.Lines.Clear;

      CB_COND_PAG.Clear;
      LB_VLRTOTAL.Text := 'Total Ped.:';
      FormatSettings.DecimalSeparator := ',';
      ShowMessage('Pedido Finalizado');
      ChangeTabAction2.ExecuteTarget(self);

   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         FormatSettings.DecimalSeparator := ',';
         ABORT;
      END;
   END;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
   LB_SINC.Items.Clear;
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
VAR R_VALOR,R_DESCONTO,R_VLR_TOT_DESC : REAL;
    I_QTDE : INTEGER;
begin
   if EDT_PROD.Text.Trim = '' then
   BEGIN
      ShowMessage('Item deve ser informado');
      ABORT;
   END;

   if EDT_QTDE.Text.Trim = '' then
   BEGIN
      ShowMessage('Quantidade deve ser informada');
      EDT_QTDE.SetFocus;
      ABORT;
   END;

   if EDT_DESCONTO.Text.Trim <> '' then
   BEGIN
      if StrToFloat(EDT_DESCONTO.Text) > R_DESC_MAX then
      BEGIN
         ShowMessage('Desconto maior que o permitido');
         EDT_DESCONTO.SetFocus;
         ABORT;
      END;
   END;

   TRY
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT * FROM VENDA_DETALHES_TEMP         ');
      QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+' AND                          ');
      QRYAUX_INT.SQL.Add('      ID_PRODUTO = '+EDT_PROD.Text+'                      ');
      QRYAUX_INT.Open;

      if QRYAUX_INT.IsEmpty then
      BEGIN
         FormatSettings.DecimalSeparator := '.';
         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('SELECT * FROM PRODUTO       ');
         QRYAUX_INT.SQL.Add('WHERE ID = '+EDT_PROD.Text+'                ');
         QRYAUX_INT.Open;

         R_VALOR := R_VLR_ITEM*StrToFloat(EDT_QTDE.Text);

         if EDT_DESCONTO.Text.Trim <> '' then
         BEGIN
            EDT_DESCONTO.Text := TrocaVirgPPto(EDT_DESCONTO.Text);
            R_DESCONTO := (R_VALOR*StrToFloat(EDT_DESCONTO.Text))/100;
            R_VLR_TOT_DESC := R_VALOR-R_DESCONTO;
         END ELSE
         BEGIN
            R_VLR_TOT_DESC:= R_VALOR;
            R_DESCONTO :=0;
         END;


         QRYAUX_INT2.Close;
         QRYAUX_INT2.SQL.Clear;
         QRYAUX_INT2.SQL.Add('INSERT INTO venda_detalhes_TEMP (ID_VENDA_CABECALHO,             ');
         QRYAUX_INT2.SQL.Add('                            ID_PRODUTO,          ');
         QRYAUX_INT2.SQL.Add('                            DESC_PROD,          ');
         QRYAUX_INT2.SQL.Add('                            UN,                  ');
         QRYAUX_INT2.SQL.Add('                            VALOR_UNITARIO,      ');
         QRYAUX_INT2.SQL.Add('                            QUANTIDADE,          ');
         QRYAUX_INT2.SQL.Add('                            TOTAL_ITEM,          ');
         QRYAUX_INT2.SQL.Add('                            DESCONTO,            ');
         QRYAUX_INT2.SQL.Add('                            VALOR_TOTAL,         ');
         QRYAUX_INT2.SQL.Add('                            ST,                  ');
         QRYAUX_INT2.SQL.Add('                            VL_DESCONTO,                  ');
         QRYAUX_INT2.SQL.Add('                            DATA_PED             ');
         QRYAUX_INT2.SQL.Add('                            )VALUES(             ');
         QRYAUX_INT2.SQL.Add('                            '+S_NUM_PED+',                   ');
         QRYAUX_INT2.SQL.Add('                            '+EDT_PROD.Text+',                 ');
         QRYAUX_INT2.SQL.Add('                            '+QuotedStr(QRYAUX_INT.FieldByName('DESC_PROD').AsString)+',                ');
         QRYAUX_INT2.SQL.Add('                            '+QuotedStr(QRYAUX_INT.FieldByName('UN').AsString)+',                ');
         QRYAUX_INT2.SQL.Add('                            '''+FloatToStr(QRYAUX_INT.FieldByName('VL_VARJ').AsFloat)+''',            ');
         QRYAUX_INT2.SQL.Add('                            '+EDT_QTDE.Text+',                  ');
         QRYAUX_INT2.SQL.Add('                            '''+FloatToStr(R_VALOR)+''' ,');
         QRYAUX_INT2.SQL.Add('                            '+QuotedStr(EDT_DESCONTO.Text)+',                   ');
         QRYAUX_INT2.SQL.Add('                            '''+FloatToStr(R_VLR_TOT_DESC)+''',           ');
         QRYAUX_INT2.SQL.Add('                            ''A'',          ');
         QRYAUX_INT2.SQL.Add('                            '''+FloatToStr(R_DESCONTO)+''',                  ');
         QRYAUX_INT2.SQL.Add('                            '''+FormatDateTime('YYYY-MM-DD',NOW)+'''     )        ');
         QRYAUX_INT2.ExecSQL;
      END ELSE
      BEGIN
         ShowMessage('Produto ja informado');
         FormatSettings.DecimalSeparator := ',';
         ABORT;
        { I_QTDE := QRYAUX_INT.FieldByName('QUANTIDADE').AsInteger+StrToInt(EDT_QTDE.Text);
         R_VALOR := QRYAUX_INT.FieldByName('VALOR_UNITARIO').AsFloat*I_QTDE;

         QRYAUX_INT2.Close;
         QRYAUX_INT2.SQL.Clear;
         QRYAUX_INT2.SQL.Add('UPDATE VENDA_DETALHES_TEMP      ');
         QRYAUX_INT2.SQL.Add('SET QUANTIDADE = '+IntToStr(I_QTDE)+',             ');
         QRYAUX_INT2.SQL.Add('    VALOR_TOTAL = '''+FloatToStr(R_VALOR)+'''          ');
         QRYAUX_INT2.SQL.Add('WHERE ID = '+S_NUM_PED+' AND               ');
         QRYAUX_INT2.SQL.Add('      ID_PRODUTO = '+EDT_PROD.Text+'           ');
         QRYAUX_INT2.ExecSQL;  }
      END;
      ATUALIZA_ITENS;
      ATUALIZA_VALOR_ITENS;
      FormatSettings.DecimalSeparator := ',';
      EDT_PROD.Text:= '';
      EDT_DESCONTO.Text:='';
      EDT_DESCPROD.Text :='';
      EDT_VALORPROD.Text :='';
      R_VLR_ITEM :=0;
      R_DESCONTO:=0;
      R_VLR_TOT_DESC:=0;
      R_VALOR:=0;
      EDT_QTDE.Text :='';

   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         FormatSettings.DecimalSeparator := ',';
         ABORT;
      END;
   END;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
   DMCONEXAO.CONEXAO_INT.Connected := false;
   {$IFDEF ANDROID}
   ReleaseWakeLock;
   MainActivity.finish;
   {$ENDIF}
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
   QRYPROD.Close;
   ListViewMultiDetail.Items.Clear;
   EDT_PROD.Text:= '';
   EDT_DESCONTO.Text :='';
   EDT_DESCPROD.Text :='';
   EDT_VALORPROD.Text :='';
   R_VLR_ITEM :=0;
   EDT_QTDE.Text :='';
   ChangeTabAction4.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
   if EDT_DADOS_EMAIL.Text.Trim = '' then
   BEGIN
      ShowMessage('Email deve ser informado');
      EDT_DADOS_EMAIL.SetFocus;
      ABORT;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('UPDATE USUARIO    ');
   QRYAUX_INT.SQL.Add('SET IMAIL = '+QuotedStr(EDT_DADOS_EMAIL.Text)+'    ');
   QRYAUX_INT.SQL.Add('WHERE ID = '+S_ID_USUA+'      ');
   QRYAUX_INT.ExecSQL;

   ShowMessage('Alteração concluida');
end;

procedure TForm1.BTN_CONFIRMAPRODClick(Sender: TObject);
begin
  { if QRYPROD.IsEmpty then
   BEGIN
      ShowMessage('Nenhum Item na lista');
      ABORT;
   END;   }
   if ListViewMultiDetail.Items.Count = 0 then
   BEGIN
      ShowMessage('Nenhum Item na lista');
      ABORT;
   END;

   if S_PROD = '' then
   BEGIN
      ShowMessage('Selecione um Item');
      ABORT;
   END;

   R_VLR_ITEM :=0;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM PRODUTO        ');
   QRYAUX_INT.SQL.Add('WHERE ID = '+S_PROD+'                 ');
   QRYAUX_INT.Open;

   EDT_PROD.Text:= QRYAUX_INT.FieldByName('ID').AsString;
   EDT_DESCPROD.Text := QRYAUX_INT.FieldByName('DESC_PROD').AsString;

   if S_TIPO_CLI = 'FISICA' then
   BEGIN
      EDT_VALORPROD.Text := FormatFloat(',.00', QRYAUX_INT.FieldByName('VL_VARJ').AsFloat);
      R_VLR_ITEM := QRYAUX_INT.FieldByName('VL_VARJ').AsFloat;
      R_VLR_ITEM2 := QRYAUX_INT.FieldByName('VL_ATAC').AsFloat;
   END;

   if S_TIPO_CLI = 'JURIDICA' then
   BEGIN
      EDT_VALORPROD.Text := FormatFloat(',.00', QRYAUX_INT.FieldByName('VL_ATAC').AsFloat);
      R_VLR_ITEM := QRYAUX_INT.FieldByName('VL_ATAC').AsFloat;
      R_VLR_ITEM2 := QRYAUX_INT.FieldByName('VL_VARJ').AsFloat;
   END;

   QRYPROD.Close;
   ListViewMultiDetail.Items.Clear;

   ChangeTabAction4.ExecuteTarget(self);
   S_PROD := '';
   EDT_QTDE.SetFocus;
end;

procedure TForm1.BTN_ENVIAPEDClick(Sender: TObject);
begin
   VERIFICA_COENXAO;
   TRY
      FGACTIVITYDIALOG.MESSAGE := 'Aguarde';
      FGACTIVITYDIALOG.show;
      TRY

         FGACTIVITYDIALOG.message := 'Verificando Conexão.';
         sleep(500);

         LB_SINC.Items.Clear;
         LOG_SINC('Verificando Conexão');
         LOG_SINC('Conectando');

         FGACTIVITYDIALOG.message := 'Conectando.';
         sleep(500);

         CONEXAO_ON;

         FGACTIVITYDIALOG.message := 'Atualizando Pedidos.';
         sleep(500);
         ATUALIZA_PEDIDOS;

         CONEXAO_OFF;
         LOG_SINC('Finalizando Sincronismo');

      FINALLY
         FGACTIVITYDIALOG.Hide;
      END;
      ShowMessage('Sincronismo finalizado');
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         CONEXAO_OFF;
         ChangeTabAction1.ExecuteTarget(self);
         Memo1.Lines.Clear;
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
   if QRYITENS.IsEmpty then
      ABORT;

   if S_PROD = '' then
   BEGIN
     ShowMessage('Selecione um item');
     ABORT;
   END;

   TRY
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('DELETE                               ');
      QRYAUX_INT.SQL.Add('   FROM VENDA_DETALHES_TEMP          ');
      QRYAUX_INT.SQL.Add('WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+' AND                     ');
      QRYAUX_INT.SQL.Add('      ID_PRODUTO = '+S_PROD+'                 ');
      QRYAUX_INT.ExecSQL;

      ATUALIZA_ITENS;
      ATUALIZA_VALOR_ITENS;
      S_PROD := '';
      EDT_PROD.Text:= '';
      EDT_DESCONTO.Text:='';
      EDT_DESCPROD.Text :='';
      EDT_VALORPROD.Text :='';
      R_VLR_ITEM:=0;
      EDT_QTDE.Text :='';
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
   EDT_IDCLI.Text:= '';
   EDT_RAZAOCLI.Text:='';
   EDT_NUMPED.Text:='';
   EDT_TPCLI.Text:='';
   MEMO_OBS.Lines.Clear;
   CB_COND_PAG.Clear;
   ChangeTabAction3.ExecuteTarget(self);
end;

procedure TForm1.STATUS_SERVIDOR;
begin
   TRY
      with itcCommands do
      begin
        Host := '192.168.1.205';
        PORT := 211;
        ConnectTimeout := 2000; //2 secs
        Connect;
        Disconnect;
      end;
   EXCEPT
      LOG_SINC('Problema com status servidor.');
   END;
end;

function TForm1.TrocaVirgPPto(Valor: string): String;
   var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;

procedure TForm1.UpdateKBBounds;
var
  LFocused : TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox1.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
       (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      MainLayout1.Align := TAlignLayout.alHorizontal;
      VertScrollBox1.RealignContent;
      Application.ProcessMessages;
      VertScrollBox1.ViewportPosition :=
        PointF(VertScrollBox1.ViewportPosition.X,
               LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

procedure TForm1.BTN_ALTERARClick(Sender: TObject);
begin
   {if QRYVISUPED.IsEmpty then
      ABORT; }
   if LV_PEDIDOS.Items.Count = 0 then
      ABORT;

   if S_VISU_PED_ID = '' then
   BEGIN
      ShowMessage('Selecione um pedido');
      ABORT;
   END;

   QRYAUX_PED_INT.Close;
   QRYAUX_PED_INT.SQL.Clear;
   QRYAUX_PED_INT.SQL.Add('SELECT * FROM VENDA_CABECALHOS   ');
   QRYAUX_PED_INT.SQL.Add('WHERE ID = '+S_VISU_PED_ID+'               ');
   QRYAUX_PED_INT.Open;

   if QRYAUX_PED_INT.FieldByName('STATUS_VENDA').AsString <> 'P' then
   BEGIN
      ShowMessage('Pedido não pode ser alterado');
      ABORT;
   END;

   QRYAUX_INT.Close; //FERIFICA SE DA DESCONTO E QUANTO
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT coalesce(FLAG_DESCONTO,''N'')"FLAG_DESCONTO",  ');
   QRYAUX_INT.SQL.Add('       coalesce(DES_MAX,0)"DES_MAX"                 ');
   QRYAUX_INT.SQL.Add(' FROM USUARIO                                     ');
   QRYAUX_INT.Open;

   if QRYAUX_INT.FieldByName('FLAG_DESCONTO').AsString = 'S' then
   BEGIN
      Label60.Visible := TRUE;
      EDT_DESCONTO.Visible := TRUE;
      R_DESC_MAX := QRYAUX_INT.FieldByName('DES_MAX').AsFloat;
   END ELSE
   BEGIN
      Label60.Visible := FALSE;
      EDT_DESCONTO.Visible := FALSE;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM CLIENTE        ');
   QRYAUX_INT.SQL.Add('WHERE ID = '+IntToStr(QRYAUX_PED_INT.FieldByName('ID_CLIENTE').AsInteger)+'                  ');
   QRYAUX_INT.Open;

   S_TIPO_CLI:= QRYAUX_INT.FieldByName('TIPO_CLIENTE').AsString;

   S_NUM_PED := S_VISU_PED_ID;

   S_TIPO_PED := 'A';

   //insere pedid na temp
   TRY
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('DELETE FROM VENDA_DETALHES_TEMP');
      QRYAUX_INT.ExecSQL;

      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO VENDA_DETALHES_TEMP (ID,                       ');
      QRYAUX_INT.SQL.Add('                                     ID_VENDA_CABECALHO,           ');
      QRYAUX_INT.SQL.Add('                                     ID_PRODUTO,           ');
      QRYAUX_INT.SQL.Add('                                     DESC_PROD,           ');
      QRYAUX_INT.SQL.Add('                                     UN,                   ');
      QRYAUX_INT.SQL.Add('                                     VALOR_UNITARIO,       ');
      QRYAUX_INT.SQL.Add('                                     QUANTIDADE,           ');
      QRYAUX_INT.SQL.Add('                                     DESCONTO,             ');
      QRYAUX_INT.SQL.Add('                                     VALOR_TOTAL,          ');
      QRYAUX_INT.SQL.Add('                                     ST,                   ');
      QRYAUX_INT.SQL.Add('                                     DATA_PED,              ');
      QRYAUX_INT.SQL.Add('                                     VL_DESCONTO              ');
      QRYAUX_INT.SQL.Add('                                     )                     ');
      QRYAUX_INT.SQL.Add('         SELECT ID,                                        ');
      QRYAUX_INT.SQL.Add('                ID_VENDA_CABECALHO,            ');
      QRYAUX_INT.SQL.Add('                ID_PRODUTO,                                ');
      QRYAUX_INT.SQL.Add('                DESC_PROD,           ');
      QRYAUX_INT.SQL.Add('                UN,                                        ');
      QRYAUX_INT.SQL.Add('                VALOR_UNITARIO,                            ');
      QRYAUX_INT.SQL.Add('                QUANTIDADE,                                ');
      QRYAUX_INT.SQL.Add('                DESCONTO,                                  ');
      QRYAUX_INT.SQL.Add('                VALOR_TOTAL,                               ');
      QRYAUX_INT.SQL.Add('                ST,                                        ');
      QRYAUX_INT.SQL.Add('                DATA_PED ,                                  ');
      QRYAUX_INT.SQL.Add('                VL_DESCONTO              ');
      QRYAUX_INT.SQL.Add('            FROM VENDA_DETALHES                            ');
      QRYAUX_INT.SQL.Add('         WHERE ID_VENDA_CABECALHO = '+S_NUM_PED+'                                      ');
      QRYAUX_INT.ExecSQL;
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
   //---------------------

   ATUALIZA_ITENS;
   ATUALIZA_VALOR_ITENS;
   ChangeTabAction4.ExecuteTarget(self);
end;

procedure TForm1.BTN_ATU_CONECTClick(Sender: TObject);
begin
   if EDT_HOST.Text.Trim = '' then
   BEGIN
      ShowMessage('IP deve ser informado');
      EDT_HOST.SetFocus;
      ABORT;
   END;

   if EDT_PORTA.Text.Trim = '' then
   BEGIN
      ShowMessage('Porta deve ser informada');
      EDT_PORTA.SetFocus;
      ABORT;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('UPDATE CONFICURACAO               ');
   QRYAUX_INT.SQL.Add('SET                               ');
  // 'DB_SERVIDOR =    '+QuotedStr(EDT_DB.Text)+',         ');
   QRYAUX_INT.SQL.Add('    HOST_SERVIDOR =  '+QuotedStr(EDT_HOST.Text)+',       ');
 //  QRYAUX_INT.SQL.Add('    LOGIN_SERVIDOR = '+QuotedStr(EDT_LOGIN_SERV.Text)+', ');
 //  QRYAUX_INT.SQL.Add('    SENHA_SERVIDOR = '+QuotedStr(EDT_SENHA_SERV.Text)+', ');
   QRYAUX_INT.SQL.Add('    PORTA_SERVIDOR = '+EDT_PORTA.Text+'                  ');
   QRYAUX_INT.SQL.Add('WHERE ID = 1                                             ');
   QRYAUX_INT.ExecSQL;

   ShowMessage('Configuração salva com sucesso');

   TC_CONEXAO.Visible := FALSE;
   RT_CONEXAO.Visible := FALSE;
end;

procedure TForm1.BTN_BUSCAPRODClick(Sender: TObject);
begin
   BTN_BUSCA_PRODClick(self);
   ListViewMultiDetail.ItemIndex :=-1;
   S_PROD := '';
   ChangeTabAction6.ExecuteTarget(self);
end;

procedure TForm1.BTN_BUSCA_PEDClick(Sender: TObject);
VAR S_DTINI,S_DTFIM,S_STATUS : STRING;
    LItem: TListViewItem;
begin
   S_DTINI := FormatDateTime('YYYY-MM-DD',DT_INI.Date);
   S_DTFIM := FormatDateTime('YYYY-MM-DD',DT_FIM.Date);

  LV_PEDIDOS.BeginUpdate;
  try
    LV_PEDIDOS.Items.Clear;

    QRYVISUPED.Close;
    QRYVISUPED.SQL.Clear;
    QRYVISUPED.SQL.Add('SELECT A.*,B.RAZAO             ');
    QRYVISUPED.SQL.Add('   FROM VENDA_CABECALHOS A,    ');
    QRYVISUPED.SQL.Add('        CLIENTE B              ');
    QRYVISUPED.SQL.Add('WHERE DATA_VENDA >= '+QuotedStr(S_DTINI)+'          ');
    QRYVISUPED.SQL.Add('  AND DATA_VENDA <= '+QuotedStr(S_DTFIM)+'          ');
    if CB_STAT_PED.ItemIndex = 1 then
       QRYVISUPED.SQL.Add('  AND    STATUS_VENDA = ''P''                     ');
    if CB_STAT_PED.ItemIndex = 2 then
       QRYVISUPED.SQL.Add('  AND    STATUS_VENDA = ''E''                     ');
    if CB_STAT_PED.ItemIndex = 3 then
       QRYVISUPED.SQL.Add('  AND    STATUS_VENDA = ''A''                     ');
    QRYVISUPED.SQL.Add('  AND    B.ID = A.ID_CLIENTE                    ');
    QRYVISUPED.Open;

    if QRYVISUPEDSTATUS_VENDA.AsString = 'P' then
       S_STATUS := 'Pendente';

    if QRYVISUPEDSTATUS_VENDA.AsString = 'E' then
       S_STATUS := 'Enviado';

    if QRYVISUPEDSTATUS_VENDA.AsString = 'A' then
       S_STATUS := 'Aprovado';

    while NOT QRYVISUPED.Eof do
    begin
      LItem := LV_PEDIDOS.Items.Add;
      LItem.Text := QRYVISUPEDID.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := QRYVISUPEDID_CLIENTE.AsString+' - '+QRYVISUPEDRAZAO.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Dt.Ped.: '+QRYVISUPEDdata_VENDA.AsString+' Vlr.:'+FormatFloat('"R$ ",.00', QRYVISUPEDVALOR_FINAL.AsFloat);
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Status.: '+S_STATUS;

      QRYVISUPED.Next;
    end;
  finally
    LV_PEDIDOS.EndUpdate;
  end;
  QRYVISUPED.Close;
end;

procedure TForm1.BTN_BUSCA_PRODClick(Sender: TObject);
begin
   BUSCA_PROD;
end;

procedure TForm1.BTN_CANCELCONFClick(Sender: TObject);
begin
   TC_CONEXAO.Visible := FALSE;
   RT_CONEXAO.Visible := FALSE;
end;

procedure TForm1.BTN_CONFIGClick(Sender: TObject);
begin
   if NOT TC_CONEXAO.Visible  then
   BEGIN
      TC_CONEXAO.Visible := TRUE;
      RT_CONEXAO.Visible := TRUE;
   END ELSE
   BEGIN
      TC_CONEXAO.Visible := FALSE;
      RT_CONEXAO.Visible := FALSE;
   END;
end;

procedure TForm1.BTN_CONFIRMAFORClick(Sender: TObject);
begin

   if LV_CLI.Items.Count = 0 then
   BEGIN
     ShowMessage('Sem clientes');
     ABORT;
   END;

   if S_ID_CLI = '' then
   BEGIN
     ShowMessage('Informe um cliente');
     ABORT;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM CLIENTE');
   QRYAUX_INT.SQL.Add('WHERE ID = '+S_ID_CLI+' ');
   QRYAUX_INT.Open;

   EDT_IDCLI.Text:= QRYAUX_INT.FieldByName('ID').AsString;
   EDT_RAZAOCLI.Text := QRYAUX_INT.FieldByName('RAZAO').AsString;

   S_NUM_PED := S_ID_USUA+FormatDateTime('YYYYmmss',now);

   S_TIPO_CLI := QRYAUX_INT.FieldByName('TIPO_CLIENTE').AsString;

   S_ROTA := QRYAUX_INT.FieldByName('ROTA').AsString;

   S_CNPJ_CPF := QRYAUX_INT.FieldByName('CNPJ_CPF').AsString;

   EDT_TPCLI.Text := S_TIPO_CLI;

   EDT_NUMPED.Text := S_NUM_PED;

   QRYAUX_INT.Close; //ADICIONA PAG NO COMBO
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM FORMA_PAG');
   QRYAUX_INT.SQL.Add('ORDER BY ID');
   QRYAUX_INT.Open;

   while NOT QRYAUX_INT.Eof do
   BEGIN
      CB_COND_PAG.Items.Add(QRYAUX_INT.FieldByName('ID').AsString+' - Parc.: '+QRYAUX_INT.FieldByName('QNT_PAC').AsString+' - '+QRYAUX_INT.FieldByName('DESC_PAG').AsString);

      QRYAUX_INT.Next;
   END;

   CB_COND_PAG.ItemIndex := 0;
   CB_COND_PAGChange(SELF);
   ChangeTabAction7.ExecuteTarget(self);
end;

procedure TForm1.BTN_RESETClick(Sender: TObject);
begin

   MessageDlg('Apagar os dados do aplicativo?', System.UITypes.TMsgDlgType.mtInformation,
   [
   System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
      procedure(const AResult: TModalResult)
      begin
         case AResult of
         { Detect which button was pushed and show a different message }
         mrYes:
         begin
            TRY
               //LIMPA OS CLIENTES
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM CLIENTE');
               QRYAUX_INT.ExecSQL;

               //LIMPA OS PRODUTOS
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM PRODUTO');
               QRYAUX_INT.ExecSQL;

               //LIMPA O USURAIO
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM USUARIO');
               QRYAUX_INT.ExecSQL;

               //LIMPA OS PEDIDOS
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM VENDA_CABECALHOS');
               QRYAUX_INT.ExecSQL;

               //LIMPA OS ITENS DOS PEDIDOS
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM VENDA_DETALHES');
               QRYAUX_INT.ExecSQL;

               //LIMPA FORMA DE PAG
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM FORMA_PAG');
               QRYAUX_INT.ExecSQL;

               //LIMPA GRUPO
               QRYAUX_INT.Close;
               QRYAUX_INT.SQL.Clear;
               QRYAUX_INT.SQL.Add('DELETE FROM GRUP');
               QRYAUX_INT.ExecSQL;

               ShowMessage('Aplicativo resetado');
               TC_CONEXAO.Visible := FALSE;
               RT_CONEXAO.Visible := FALSE;

            EXCEPT
            ON E: EXCEPTION DO
            BEGIN
               IF E.MESSAGE <> 'Operation aborted' THEN
                  ShowMessage(E.Message);
                  ABORT;
               END;
            END;
         end;
         mrNo:
         begin
            abort;
         end;
      end;
   end
   );

end;

procedure TForm1.BTN_SINCClick(Sender: TObject);
begin
   VERIFICA_COENXAO;
   TRY
      FGACTIVITYDIALOG.MESSAGE := 'Aguarde';
      FGACTIVITYDIALOG.show;
      TRY

         FGACTIVITYDIALOG.message := 'Verificando Conexão.';
         sleep(500);

         LB_SINC.Items.Clear;

         LOG_SINC('Verificando Conexão');
         LOG_SINC('Conectando');

         FGACTIVITYDIALOG.message := 'Conectando.';
         sleep(500);

         CONEXAO_ON;

         LOG_SINC('Verificando Status servidor');
         LOG_SINC('Verificando Status servidor');

         FGACTIVITYDIALOG.message := 'Verificando Status servidor';
         sleep(500);
       //  STATUS_SERVIDOR;

         FGACTIVITYDIALOG.message := 'Verificando usuario.';
         sleep(500);
         VERIFICA_USUARIO;


         FGACTIVITYDIALOG.message := 'Atualizando Pedidos.';
         sleep(500);
         ATUALIZA_PEDIDOS;


         FGACTIVITYDIALOG.message := 'Atualizando produtos.';
         sleep(500);
         ATUALIZA_PRODUTOS;

         FGACTIVITYDIALOG.message := 'Atualizando clientes.';
         sleep(500);
         ATUALIZA_CLIENTES;

         CONEXAO_OFF;
         LOG_SINC('Finalizando Sincronismo');

      FINALLY
         FGACTIVITYDIALOG.Hide;
      END;
      ShowMessage('Sincronismo finalizado');
   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         CONEXAO_OFF;
         ChangeTabAction1.ExecuteTarget(self);
         LB_SINC.Items.Clear;
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
end;

procedure TForm1.BTN_VOLTARFORNECClick(Sender: TObject);
begin
   QRYCLI.Close;
   LV_CLI.Items.Clear;
   EDT_BUSCACLI.Text:='';
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.BTN_VOLT_MENUClick(Sender: TObject);
begin
   ChangeTabAction1.ExecuteTarget(self);
end;

procedure TForm1.BUSCA_CLI;
var
  LItem: TListViewItem;
begin
  // Code to fill TListView
  LV_CLI.BeginUpdate;
  try
    LV_CLI.Items.Clear;

    QRYCLI.Close;
    QRYCLI.SQL.Clear;
    QRYCLI.SQL.Add('SELECT * FROM CLIENTE');
    QRYCLI.SQL.Add('WHERE COD_EMPRESA = 1 ');
    if CB_TIPOCLI.ItemIndex = 1 then
       if EDT_BUSCACLI.Text.Trim <> '' then
          QRYCLI.SQL.Add('AND ID = '+EDT_BUSCACLI.Text+' ');

    if CB_TIPOCLI.ItemIndex = 0 then
       if EDT_BUSCACLI.Text.Trim <> '' then
          QRYCLI.SQL.Add('AND RAZAO LIKE ''%'+UpperCase(EDT_BUSCACLI.Text)+'%'' ');

    QRYCLI.Open;

    while NOT QRYCLI.Eof do
    begin
      LItem := LV_CLI.Items.Add;
      LItem.Text := QRYCLIID.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := QRYCLIID.AsString+' - '+QRYCLIRAZAO.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'CNPJ: '+QRYCLICNPJ_CPF.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Tp. Cli.: '+QRYCLITIPO_CLIENTE.AsString;

      QRYCLI.Next;
    end;
  finally
    LV_CLI.EndUpdate;
  end;
  QRYCLI.CLOSE;
end;

procedure TForm1.BUSCA_PROD;
var
  LItem: TListViewItem;
begin
  // Code to fill TListView
  ListViewMultiDetail.BeginUpdate;
  try
    ListViewMultiDetail.Items.Clear;

    QRYPROD.Close;
    QRYPROD.SQL.Clear;
    QRYPROD.SQL.Add('SELECT * FROM PRODUTO');
    QRYPROD.SQL.Add('WHERE ID_GRUP = 1 ');
    if CB_TIPOPROD.ItemIndex = 1 then
       if EDT_BUSCAPROD.Text.Trim <> '' then
          QRYPROD.SQL.Add('AND ID = '+EDT_BUSCAPROD.Text+' ');

    if CB_TIPOPROD.ItemIndex = 0 then
       if EDT_BUSCAPROD.Text.Trim <> '' then
          QRYPROD.SQL.Add('AND DESC_PROD LIKE ''%'+EDT_BUSCAPROD.Text+'%'' ');
    QRYPROD.SQL.Add('ORDER BY DESC_PROD ');
    QRYPROD.Open;

    while NOT QRYPROD.Eof do
    begin
      LItem := ListViewMultiDetail.Items.Add;
      LItem.Text := QRYPRODID.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := QRYPRODID.AsString+' - '+QRYPRODDESC_PROD.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Vlr. Atc.: '+FormatFloat('"R$ ",.00', QRYPRODVL_ATAC.AsFloat)+' Vlr. Varj.: '+FormatFloat('"R$ ",.00', QRYPRODVL_VARJ.AsFloat);
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Estoque: '+QRYPRODESTOQUE.AsString;

      QRYPROD.Next;
    end;
  finally
    ListViewMultiDetail.EndUpdate;
  end;
  QRYPROD.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   try

       {$IF DEFINED(IOS) or DEFINED(ANDROID)}

           DMCONEXAO.CONEXAO_INT.Database :=
           TPath.GetDocumentsPath + PathDelim + 'banco.s3db';

           DMCONEXAO.CONEXAO_INT.Connected := TRUE;
           {
           if DMCONEXAO.CONEXAO_INT.Connected then
           BEGIN
              QRYAUX_INT.Close;
              QRYAUX_INT.SQL.Clear;
              QRYAUX_INT.SQL.Add('SELECT * FROM CONFICURACAO');
              QRYAUX_INT.Open;

              EDT_HOST.Text:= QRYAUX_INT.FieldByName('HOST_SERVIDOR').AsString;
              EDT_PORTA.Text:= QRYAUX_INT.FieldByName('PORTA_SERVIDOR').AsString;
              EDT_LOGIN_SERV.Text:=QRYAUX_INT.FieldByName('LOGIN_SERVIDOR').AsString;
              EDT_SENHA_SERV.Text := QRYAUX_INT.FieldByName('SENHA_SERVIDOR').AsString;
              EDT_DB.Text := QRYAUX_INT.FieldByName('DB_SERVIDOR').AsString;
           END;
                   }
           AcquireWakeLock;
        {$ENDIF}

   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         ABORT;
      END;
   END;

   if EDT_USUA.Text.Trim = '' then
   BEGIN
     ShowMessage('Usuario deve ser informado');
     EDT_USUA.SetFocus;
     ABORT;
   END;

   if EDT_SENHA.Text.Trim = '' then
   BEGIN
     ShowMessage('Senha deve ser informada');
     EDT_SENHA.SetFocus;
     ABORT;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
   QRYAUX_INT.Open;


   if QRYAUX_INT.IsEmpty then
   BEGIN

      MessageDlg('Sincronismo deve ser feito?, deseja sincronizar?', System.UITypes.TMsgDlgType.mtInformation,
      [
      System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
         procedure(const AResult: TModalResult)
         begin
            case AResult of
            { Detect which button was pushed and show a different message }
            mrYes:
            begin
               ChangeTabAction5.ExecuteTarget(self);
               BTN_SINCClick(SELF);
               LB_SINC.Items.Clear;
               ChangeTabAction1.ExecuteTarget(self);
               CARREGA_ENTRADA;
            end;
            mrNo:
            begin
               abort;
            end;
         end;
      end
      );

     { if MessageDlg('Sincronismo deve ser feito?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], -1) = mrOK then
      begin
         ChangeTabAction5.ExecuteTarget(self);
         BTN_SINCClick(SELF);
         LB_SINC.Items.Clear;
         ChangeTabAction1.ExecuteTarget(self);
      end ELSE
      BEGIN
        ABORT;
      END;   }
   END ELSE
   BEGIN
      CARREGA_ENTRADA;
   END;
end;

procedure TForm1.CalcContentBoundsProc(Sender: TObject;
  var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
                                2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TForm1.CARREGA_ENTRADA;
begin
   FGACTIVITYDIALOG.MESSAGE := 'Aguarde';
   FGACTIVITYDIALOG.show;
   TRY

      FGACTIVITYDIALOG.message := 'Verificando dados.';
      sleep(1000);

      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
      QRYAUX_INT.SQL.Add('WHERE LOGIN = '+QuotedStr(UpperCase(EDT_USUA.Text))+' ');
      QRYAUX_INT.Open;

      if QRYAUX_INT.IsEmpty then
      BEGIN
         ShowMessage('Usuario incorreto.');
         EDT_USUA.SetFocus;
         ABORT;
      END;

      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
      QRYAUX_INT.SQL.Add('WHERE LOGIN = '+QuotedStr(UpperCase(EDT_USUA.Text))+' AND ');
      QRYAUX_INT.SQL.Add('      SENHA  = '+QuotedStr(UpperCase(EDT_SENHA.Text))+' ');
      QRYAUX_INT.Open;

      if QRYAUX_INT.IsEmpty then
      BEGIN
         ShowMessage('Senha incorreta.');
         EDT_SENHA.SetFocus;
         ABORT;
      END;

      S_ID_USUA := QRYAUX_INT.FieldByName('ID').AsString;

     { if QRYAUX_INT.FieldByName('ALTER_CLI').AsString = 'S' then
         B_ALTERA_CLI := TRUE
      ELSE  }
         B_ALTERA_CLI := TRUE;

     { if QRYAUX_INT.FieldByName('ALTER_PROD').AsString = 'S' then
         B_ALTERA_PROD:= TRUE
      ELSE         }
         B_ALTERA_PROD := FALSE;

      EDT_SENHA.Text:='';

      FGACTIVITYDIALOG.message := 'Finalizando.';
      sleep(1000);

   FINALLY
      FGACTIVITYDIALOG.hide;
   END;
   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.CB_COND_PAGChange(Sender: TObject);
begin
   S_TP_PAG := Copy(CB_COND_PAG.Selected.Text,0,1);
end;

procedure TForm1.CB_TIPOCLIChange(Sender: TObject);
begin
   if CB_TIPOCLI.ItemIndex = 0 then
      EDT_BUSCACLI.KeyboardType := TVirtualKeyboardType(0)
   ELSE
      EDT_BUSCACLI.KeyboardType := TVirtualKeyboardType(2);
end;

procedure TForm1.CONEXAO_OFF;
begin
   TRY
      DMCONEXAO.CONEXAO_EXT.Connected := FALSE;
   EXCEPT
      ShowMessage('Problema ao desconectar');
      ABORT;
   END;
end;

procedure TForm1.CONEXAO_ON;
begin
{   DMCONEXAO.CONEXAO_EXT.Connected := FALSE;
   if NOT DMCONEXAO.CONEXAO_EXT.Connected then
   BEGIN
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT * FROM CONFICURACAO');
      QRYAUX_INT.Open;

      if QRYAUX_INT.FieldByName('HOST_SERVIDOR').AsString = '' then
      BEGIN
         ShowMessage('Dados para conexão não encontardos');
         ABORT;
      END;  }

      TRY
         {DMCONEXAO.CONEXAO_EXT.ProviderName := 'MySQL';
         DMCONEXAO.CONEXAO_EXT.Server:= QRYAUX_INT.FieldByName('HOST_SERVIDOR').AsString;
         DMCONEXAO.CONEXAO_EXT.Port := QRYAUX_INT.FieldByName('PORTA_SERVIDOR').AsInteger;
         DMCONEXAO.CONEXAO_EXT.Username:=QRYAUX_INT.FieldByName('LOGIN_SERVIDOR').AsString;
         DMCONEXAO.CONEXAO_EXT.Password := QRYAUX_INT.FieldByName('SENHA_SERVIDOR').AsString;
         DMCONEXAO.CONEXAO_EXT.Database := QRYAUX_INT.FieldByName('DB_SERVIDOR').AsString; }
         DMCONEXAO.CONEXAO_EXT.Connected := TRUE;
      EXCEPT
      ON E: EXCEPTION DO
      BEGIN
         IF E.MESSAGE <> 'Operation aborted' THEN
            ShowMessage(E.Message);
            ABORT;
         END;
      END;
   //END;
end;

PROCEDUre TForm1.ENVIA_EMAIL(S_NUMEROPEDIDO: STRING);
VAR S_MENSAGEM,S_ASSUNTO,S_EMAIL:string;
    B_PRI_VEZ : BOOLEAN;
begin

   B_PRI_VEZ := TRUE;
   S_ASSUNTO :='';
   S_EMAIL := '';
   S_MENSAGEM :='';
   //DADOS DO ASSUNTO
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
   QRYAUX_INT.Open;

   S_ASSUNTO := 'Pedido numero '+S_NUMEROPEDIDO+' do vendendor '+QRYAUX_INT.FieldByName('DESC_USUARIO').AsString;
   S_EMAIL := QRYAUX_INT.FieldByName('IMAIL').AsString;

   // DADOS DO PEDIDO
   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT A.ID,                            ');
   QRYAUX_INT.SQL.Add('       A.ID_CLIENTE,                    ');
   QRYAUX_INT.SQL.Add('       C.RAZAO,                         ');
   QRYAUX_INT.SQL.Add('       C.CNPJ_CPF,                      ');
   QRYAUX_INT.SQL.Add('       B.ID_PRODUTO,                    ');
   QRYAUX_INT.SQL.Add('       D.DESC_PROD,                     ');
   QRYAUX_INT.SQL.Add('       B.QUANTIDADE,                    ');
   QRYAUX_INT.SQL.Add('       B.VALOR_UNITARIO,                ');
   QRYAUX_INT.SQL.Add('       B.VALOR_TOTAL,                   ');
   QRYAUX_INT.SQL.Add('       A.VALOR_FINAL                    ');
   QRYAUX_INT.SQL.Add('   FROM VENDA_CABECALHOS A,             ');
   QRYAUX_INT.SQL.Add('        VENDA_DETALHES  B,              ');
   QRYAUX_INT.SQL.Add('        CLIENTE C,                      ');
   QRYAUX_INT.SQL.Add('        PRODUTO D                       ');
   QRYAUX_INT.SQL.Add('WHERE A.ID = '+S_NUMEROPEDIDO+' AND                ');
   QRYAUX_INT.SQL.Add('      B.ID_VENDA_CABECALHO = A.ID AND                   ');
   QRYAUX_INT.SQL.Add('      C.ID = A.ID_CLIENTE AND           ');
   QRYAUX_INT.SQL.Add('      D.ID = B.ID_PRODUTO               ');
   QRYAUX_INT.Open;

   while NOT QRYAUX_INT.Eof do
   BEGIN
      if B_PRI_VEZ then
      BEGIN
         S_MENSAGEM := '===================================================='+sLineBreak+
                       'Pedido '+S_NUMEROPEDIDO+sLineBreak+
                       'Cliente '+QRYAUX_INT.FieldByName('ID_CLIENTE').AsString+' - '+QRYAUX_INT.FieldByName('RAZAO').AsString+',CNPJ/CPF: '+QRYAUX_INT.FieldByName('CNPJ_CPF').AsString+sLineBreak+
                       '===================================================='+sLineBreak+
                       '================= Itens do Pedido =================='+sLineBreak;
         B_PRI_VEZ := FALSE;
      END;
      S_MENSAGEM := S_MENSAGEM+'Item: '+QRYAUX_INT.FieldByName('ID_PRODUTO').AsString+' - '+QRYAUX_INT.FieldByName('DESC_PROD').AsString+' / Vlr.: '+FormatFloat('"R$ ",.00', QRYAUX_INT.FieldByName('VALOR_UNITARIO').AsFloat)+' / Qtde: '+QRYAUX_INT.FieldByName('QUANTIDADE').AsString+' / Vlr. Total: '+FormatFloat('"R$ ",.00', QRYAUX_INT.FieldByName('VALOR_TOTAL').AsFloat)+sLineBreak;

      QRYAUX_INT.Next;
   END;

   S_MENSAGEM := S_MENSAGEM+'Valor total do pedido: '+FormatFloat('"R$ ",.00', QRYAUX_INT.FieldByName('VALOR_FINAL').AsFloat);

   Memo1.Lines.Add(S_MENSAGEM);

   QRYAUX_INT2.Close;
   QRYAUX_INT2.SQL.Clear ;
   QRYAUX_INT2.SQL.Add('SELECT IMAIL FROM CLIENTE    ');
   QRYAUX_INT2.SQL.Add('WHERE ID = '+QRYAUX_INT.FieldByName('ID_CLIENTE').AsString+'                 ');
   QRYAUX_INT2.Open;

   if TRIM(QRYAUX_INT2.FieldByName('IMAIL').AsString)= '' then
   BEGIN
      ShowMessage('Cliente sem E-mail cadastrado');
      Memo1.Lines.Clear;
      ABORT;
   END;

   TRY

      //ENVIO DO EMAIL
      {DMCONEXAO.IdSMTP.Host:= 'smtp.teste.com.br';
      DMCONEXAO.IdSMTP.Port:= 587;
      DMCONEXAO.IdSMTP.Username:= 'seu email';
      DMCONEXAO.IdSMTP.Password:= '';

      DMCONEXAO.IdMessage.From.Address:= 'seu email';
      DMCONEXAO.IdMessage.From.Name:= 'Envio de pedido';
      DMCONEXAO.IdMessage.Recipients.EMailAddresses:= TRIM(QRYAUX_INT2.FieldByName('IMAIL').AsString);//S_EMAIL;
      DMCONEXAO.IdMessage.Subject:= S_ASSUNTO;//ASSUNTO
      DMCONEXAO.IdMessage.Body:= Memo1.Lines;  //mensagem

      DMCONEXAO.IdSMTP.Connect;
      DMCONEXAO.IdSMTP.Send(DMCONEXAO.IdMessage);
      Application.ProcessMessages;
      DMCONEXAO.IdSMTP.Disconnect; }

   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         Memo1.Lines.Clear;
         ABORT;
      END;
   END;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   VertScrollBox1.OnCalcContentBounds := CalcContentBoundsProc;
end;

procedure TForm1.FormFocusChanged(Sender: TObject);
begin
   UpdateKBBounds;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var FService : IFMXVirtualKeyboardService;
begin
   if (Key = vkHardwareBack) then
   begin
      TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> nil) and (TVirtualKeyboardState.Visible  in FService.VirtualKeyBoardState) then
      begin
      // botao back pressionado se o teclado estiver aberto ele fecha se nao vai pra proxima verificação
      end
      else
         if TB_GERAL.TabIndex = 0 then//aqui esta verificando se for a tela principal do projeto ao cliar em voltar ele fecha a aplicação
         begin
           { if MessageDlg('Sair do aplicativo?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], -1) = mrOK then
            begin    }
               {$IFDEF ANDROID}
               ReleaseWakeLock;
               MainActivity.finish;
               {$ENDIF}
           { end else
            BEGIN
               Key := 0;
            END; }
         END ELSE // se nao for a tela proncipal ao ser precionado o botao voltar ele nao faz nada
         BEGIN
         // Ignora o botão de voltarr e não faz nenhuma ação
         Key := 0;
      end;
   end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   TB_GERAL.TabIndex := 0;

end;

procedure TForm1.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TForm1.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

function TForm1.GetSelectedValue(AObject: TObject): TValue;
var
  LEditor: IBindListEditorCommon;
begin
  LEditor := GetBindEditor(AObject, IBindListEditorCommon) as IBindListEditorCommon;
  Result := LEditor.SelectedValue
end;




procedure TForm1.VERIFICA_COENXAO;
begin
   {$IFDEF ANDROID}
   if NOT IsConnected then
   BEGIN
      ShowMessage('Sem Conexão a internet.');
      ABORT;
   END;
   {$ENDIF}
end;

procedure TForm1.VERIFICA_USUARIO;
begin
   LOG_SINC('Verificando usuario');

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM USUARIO');
   QRYAUX_INT.Open;

   if QRYAUX_INT.IsEmpty then
   BEGIN
      DMCONEXAO.CDS_AUX.Close;
      DMCONEXAO.CDS_AUX.CommandText :=
      'SELECT * FROM MB_USUARIO  '+
      'WHERE LOGIN = '+QuotedStr(UpperCase(EDT_USUA.Text.Trim))+'  ';
      DMCONEXAO.CDS_AUX.Open;

      if DMCONEXAO.CDS_AUX.IsEmpty then
      BEGIN
        ShowMessage('Usuario não encontrado');
        ABORT;
      END;
      LOG_SINC('Gravando novo usuario');
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO USUARIO(ID,                 ');
      QRYAUX_INT.SQL.Add('                    DESC_USUARIO,        ');
      QRYAUX_INT.SQL.Add('                    LOGIN,              ');
      QRYAUX_INT.SQL.Add('                    SENHA,              ');
      QRYAUX_INT.SQL.Add('                    IMAIL,              ');
      QRYAUX_INT.SQL.Add('                    DATA_CAD,            ');
      QRYAUX_INT.SQL.Add('                    FLAG_DESCONTO,            ');
      QRYAUX_INT.SQL.Add('                    DES_MAX ,           ');
      QRYAUX_INT.SQL.Add('                    ALTER_CLI,            ');
      QRYAUX_INT.SQL.Add('                    ALTER_PROD            ');
      QRYAUX_INT.SQL.Add('                    )VALUES(            ');
      QRYAUX_INT.SQL.Add('                    '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('ID').AsInteger)+',                  ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DESC_USUARIO').AsString)+',             ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('LOGIN').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('SENHA').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('IMAIL').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DATA_CAD').AsString)+',            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('FLAG_DESCONTO').AsString)+'  ,             ');
      QRYAUX_INT.SQL.Add('                    '''+FloatToStr(DMCONEXAO.CDS_AUX.FieldByName('DESC_MAX').AsFloat)+'''  ,            ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ALTER_CLI').AsString)+'  ,             ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ALTER_PROD').AsString)+'  )             ');
      QRYAUX_INT.ExecSQL;
   END ELSE
   BEGIN
      DMCONEXAO.CDS_AUX.Close;
      DMCONEXAO.CDS_AUX.CommandText :=
      'SELECT * FROM MB_USUARIO  '+
      'WHERE LOGIN = '+QuotedStr(EDT_USUA.Text.Trim)+'  ';
      DMCONEXAO.CDS_AUX.Open;

      LOG_SINC('Atualizando usuario');
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('UPDATE USUARIO                        ');
      QRYAUX_INT.SQL.Add('SET DESC_USUARIO = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DESC_USUARIO').AsString)+',          ');
      QRYAUX_INT.SQL.Add('    LOGIN = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('LOGIN').AsString)+',                 ');
      QRYAUX_INT.SQL.Add('    SENHA = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('SENHA').AsString)+',                    ');
      //QRYAUX_INT.SQL.Add('    IMAIL = '+QuotedStr(QRYAUX_EXT.FieldByName('IMAIL').AsString)+',        ');
      QRYAUX_INT.SQL.Add('    DATA_CAD = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('DATA_CAD').AsString)+',         ');
      QRYAUX_INT.SQL.Add('    FLAG_DESCONTO = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('FLAG_DESCONTO').AsString)+',              ');
      QRYAUX_INT.SQL.Add('    DES_MAX = '''+FloatToStr(DMCONEXAO.CDS_AUX.FieldByName('DESC_MAX').AsFloat)+''' ,                      ');
      QRYAUX_INT.SQL.Add('    ALTER_CLI = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ALTER_CLI').AsString)+',              ');
      QRYAUX_INT.SQL.Add('    ALTER_PROD = '+QuotedStr(DMCONEXAO.CDS_AUX.FieldByName('ALTER_PROD').AsString)+'              ');
      QRYAUX_INT.SQL.Add('WHERE ID = '+IntToStr(DMCONEXAO.CDS_AUX.FieldByName('ID').AsInteger)+'                          ');
      QRYAUX_INT.ExecSQL;
   END;
end;

end.
