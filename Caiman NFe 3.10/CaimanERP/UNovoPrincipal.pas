unit UNovoPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.ComCtrls, TDI,
  cxClasses, cxLookAndFeels, dxSkinsForm, cxGraphics, cxControls,
  cxLookAndFeelPainters, dxCustomTileControl, dxTileControl,
  dxSkinsdxBarPainter, dxBar, dxBarApplicationMenu, dxRibbon,
  dxRibbonRadialMenu, cxEdit, dxBarSkinnedCustForm, dxBarExtItems,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxContainer, dxRibbonSkins, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxAlertWindow, NxCollection,
  FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, dxSkinsCore,
  dxSkinMetropolis, System.TypInfo, UTarefasSP, ACBrBase, ACBrSocket, ACBrIBPTax,
  ACBrUtil, System.DateUtils, cxLocalization, dxSkinsDefaultPainters,
  System.IOUtils, EAppProt, Vcl.Buttons, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf;

Const
  InputBoxMessage = WM_USER + 200;

type
  TfrmMenu = class(TForm)
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    SB: TdxStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    C007ANT: TdxBarButton;
    C004: TdxBarButton;
    C006: TdxBarButton;
    C028: TdxBarButton;
    C029: TdxBarButton;
    C005: TdxBarButton;
    C020: TdxBarButton;
    C027: TdxBarButton;
    C236: TdxBarButton;
    C035: TdxBarButton;
    C031: TdxBarButton;
    C034: TdxBarButton;
    C1024: TdxBarButton;
    C1031: TdxBarButton;
    CP000: TdxBarSubItem;
    C003: TdxBarButton;
    C008: TdxBarButton;
    C009: TdxBarButton;
    CC000: TdxBarSubItem;
    C002: TdxBarButton;
    Vendedor1: TdxBarButton;
    C014: TdxBarButton;
    C015: TdxBarButton;
    FormasdePagamentos1: TdxBarButton;
    C016: TdxBarButton;
    C024: TdxBarButton;
    C012: TdxBarButton;
    C023: TdxBarButton;
    C022: TdxBarButton;
    C021: TdxBarButton;
    C036: TdxBarButton;
    ClassifContasReceber1: TdxBarButton;
    Contas1: TdxBarButton;
    CentrodeCusto1: TdxBarButton;
    C011: TdxBarSubItem;
    C010: TdxBarButton;
    C026: TdxBarButton;
    LocaisdeEstoque2: TdxBarButton;
    C1041: TdxBarButton;
    LocaisdeEstoque1: TdxBarSubItem;
    C1023: TdxBarButton;
    C1025: TdxBarButton;
    C1029: TdxBarButton;
    S002: TdxBarButton;
    C00: TdxBarSubItem;
    M014: TdxBarButton;
    M013: TdxBarButton;
    M019: TdxBarButton;
    GerenciadorNFe1: TdxBarButton;
    M020: TdxBarButton;
    R999: TdxBarButton;
    M00: TdxBarSubItem;
    M023: TdxBarButton;
    M024: TdxBarButton;
    M025: TdxBarButton;
    Duplicata1: TdxBarButton;
    M008: TdxBarButton;
    M009: TdxBarButton;
    M010: TdxBarButton;
    M017: TdxBarButton;
    M037: TdxBarButton;
    M005: TdxBarButton;
    M006: TdxBarButton;
    M007: TdxBarButton;
    M003: TdxBarButton;
    M004: TdxBarButton;
    M022: TdxBarButton;
    LanamentoFluxodecaixa1: TdxBarButton;
    AbreCaixa1: TdxBarButton;
    M015: TdxBarSubItem;
    C1027: TdxBarButton;
    Boletos1: TdxBarSubItem;
    M031: TdxBarButton;
    M038: TdxBarButton;
    M039: TdxBarButton;
    Financeiro1: TdxBarSubItem;
    M035: TdxBarButton;
    M036: TdxBarButton;
    M021: TdxBarButton;
    LivrosFiscais1: TdxBarSubItem;
    Contabilidade1: TdxBarButton;
    Contabil1: TdxBarSubItem;
    C101: TdxBarButton;
    C107: TdxBarButton;
    C104: TdxBarButton;
    C106: TdxBarButton;
    C109: TdxBarButton;
    C108: TdxBarButton;
    C102: TdxBarButton;
    C115: TdxBarButton;
    C116: TdxBarButton;
    C215: TdxBarButton;
    C112: TdxBarButton;
    C117: TdxBarButton;
    C103: TdxBarButton;
    C105: TdxBarButton;
    C214: TdxBarButton;
    C110: TdxBarButton;
    C111: TdxBarButton;
    C114: TdxBarButton;
    C1026: TdxBarButton;
    Cadastro2: TdxBarSubItem;
    C201: TdxBarButton;
    C202: TdxBarButton;
    Entrada1: TdxBarSubItem;
    C203: TdxBarButton;
    C204: TdxBarButton;
    C205: TdxBarButton;
    C211: TdxBarButton;
    C227: TdxBarButton;
    Vendas1: TdxBarSubItem;
    C228: TdxBarButton;
    C229: TdxBarButton;
    C223: TdxBarSubItem;
    C216: TdxBarButton;
    C217: TdxBarButton;
    OrcamentosEmitidos1: TdxBarButton;
    OSEmitdas1: TdxBarButton;
    PreVendasEmitidas1: TdxBarButton;
    C206: TdxBarButton;
    C230: TdxBarButton;
    C231: TdxBarButton;
    C207: TdxBarSubItem;
    C208: TdxBarButton;
    C209: TdxBarButton;
    C224: TdxBarButton;
    ConsCtr: TdxBarSubItem;
    C210: TdxBarButton;
    C232: TdxBarButton;
    Estoque: TdxBarSubItem;
    C219: TdxBarButton;
    C220: TdxBarButton;
    C221: TdxBarButton;
    ContasCorrente1: TdxBarSubItem;
    C226: TdxBarButton;
    Movimento2: TdxBarSubItem;
    C212: TdxBarButton;
    Diversas1: TdxBarSubItem;
    R001: TdxBarButton;
    R002: TdxBarButton;
    R003: TdxBarButton;
    R019: TdxBarButton;
    R020: TdxBarButton;
    R022: TdxBarButton;
    R023: TdxBarButton;
    R004: TdxBarSubItem;
    R005: TdxBarButton;
    R006: TdxBarButton;
    R007: TdxBarButton;
    Cliente4: TdxBarSubItem;
    R008: TdxBarButton;
    R009: TdxBarButton;
    R010: TdxBarButton;
    R011: TdxBarButton;
    R012: TdxBarButton;
    R013: TdxBarButton;
    R014: TdxBarButton;
    R016: TdxBarButton;
    R017: TdxBarButton;
    Cadastro3: TdxBarSubItem;
    R101: TdxBarButton;
    R102: TdxBarButton;
    R145: TdxBarButton;
    Entradas3: TdxBarSubItem;
    R103: TdxBarButton;
    R122: TdxBarButton;
    R104: TdxBarButton;
    R144: TdxBarButton;
    R114: TdxBarButton;
    R132: TdxBarButton;
    R142: TdxBarButton;
    R138: TdxBarButton;
    R139: TdxBarButton;
    R140: TdxBarButton;
    R1024: TdxBarButton;
    Vendas3: TdxBarSubItem;
    R143: TdxBarButton;
    R119: TdxBarButton;
    R120: TdxBarButton;
    OramentosEmitidos1: TdxBarButton;
    OSEmitidas1: TdxBarButton;
    R127: TdxBarButton;
    R105: TdxBarButton;
    R106: TdxBarButton;
    R123: TdxBarButton;
    R107: TdxBarButton;
    R108: TdxBarButton;
    R117: TdxBarButton;
    R128: TdxBarButton;
    ContasaReceber3: TdxBarSubItem;
    ContasaReceberCarto1: TdxBarButton;
    R109: TdxBarButton;
    R110: TdxBarButton;
    R129: TdxBarButton;
    ContasaPagar3: TdxBarSubItem;
    R111: TdxBarButton;
    R118: TdxBarButton;
    R113: TdxBarButton;
    R130: TdxBarButton;
    InventriodeEstoque1: TdxBarSubItem;
    R116: TdxBarButton;
    R141: TdxBarButton;
    R027: TdxBarButton;
    Produto5: TdxBarSubItem;
    R124: TdxBarButton;
    R126: TdxBarButton;
    ContasCorrente2: TdxBarSubItem;
    R300: TdxBarButton;
    Movimento3: TdxBarSubItem;
    R135: TdxBarButton;
    R136: TdxBarButton;
    R028: TdxBarButton;
    MalaDireta1: TdxBarSubItem;
    R029: TdxBarButton;
    R030: TdxBarButton;
    Estatsticas1: TdxBarSubItem;
    R137: TdxBarButton;
    R024: TdxBarButton;
    R025: TdxBarButton;
    LivrosFiscais3: TdxBarSubItem;
    R133: TdxBarButton;
    R026: TdxBarButton;
    R134: TdxBarButton;
    MapaResumo1: TdxBarSubItem;
    R015: TdxBarButton;
    ApuracaoPisCofins1: TdxBarButton;
    Contabil2: TdxBarSubItem;
    ComissesdeVendedores1: TdxBarButton;
    R00: TdxBarSubItem;
    P008: TdxBarButton;
    P010: TdxBarButton;
    C018: TdxBarButton;
    P002: TdxBarButton;
    P004: TdxBarButton;
    P005: TdxBarButton;
    P001: TdxBarButton;
    P006: TdxBarButton;
    P009: TdxBarButton;
    C1028: TdxBarButton;
    P011: TdxBarButton;
    GerarLivroSaidasMapaResumo1: TdxBarButton;
    P003: TdxBarButton;
    P000: TdxBarSubItem;
    B001: TdxBarButton;
    B002: TdxBarButton;
    B003: TdxBarButton;
    B004: TdxBarButton;
    B005: TdxBarButton;
    C2: TdxBarButton;
    Informaesdelicena1: TdxBarButton;
    Sobre1: TdxBarButton;
    tabCadastro: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1Bar2: TdxBar;
    CE000: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    ADM000: TdxBarSubItem;
    C025: TdxBarLargeButton;
    tabMovimentos: TdxRibbonTab;
    dxBarManager1Bar4: TdxBar;
    E003: TdxBarLargeButton;
    E001: TdxBarLargeButton;
    E002: TdxBarLargeButton;
    dxBarManager1Bar5: TdxBar;
    C1030: TdxBarLargeButton;
    M001: TdxBarLargeButton;
    dxBarManager1Bar6: TdxBar;
    M002: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    tabMiscelanea: TdxRibbonTab;
    dxBarManager1Bar7: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    ADM001: TdxBarSubItem;
    dxBarLargeButton3: TdxBarLargeButton;
    U000: TdxBarSubItem;
    tabFinanceiro: TdxRibbonTab;
    dxBarManager1Bar8: TdxBar;
    F001: TdxBarSubItem;
    F002: TdxBarSubItem;
    F003: TdxBarSubItem;
    F004: TdxBarSubItem;
    F005: TdxBarSubItem;
    F006: TdxBarLargeButton;
    F007: TdxBarLargeButton;
    dxBarManager1Bar9: TdxBar;
    F008: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    tabConsultas: TdxRibbonTab;
    dxBarManager1Bar10: TdxBar;
    C000: TdxBarSubItem;
    R000: TdxBarSubItem;
    T000: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    C1040: TdxBarButton;
    cxTradutor: TcxLocalizer;
    dxBarSubItem2: TdxBarSubItem;
    C1042: TdxBarButton;
    C007: TdxBarButton;
    dxRibbon1Tab1: TdxRibbonTab;
    dxBarManager1Bar11: TdxBar;
    CX000: TdxBarSubItem;
    CX001: TdxBarButton;
    CX002: TdxBarButton;
    dxBarButton2: TdxBarButton;
    CX003: TdxBarLargeButton;
    dxBarManager1Bar12: TdxBar;
    CX004: TdxBarLargeButton;
    dxBarManager1Bar13: TdxBar;
    CX005: TdxBarLargeButton;
    dxRibbon1Tab2: TdxRibbonTab;
    dxBarManager1Bar14: TdxBar;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    EvAppProtect1: TEvAppProtect;
    M301: TdxBarLargeButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarSubItem8: TdxBarSubItem;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    QBuscaPara: TFDQuery;
    dxBarButton8: TdxBarButton;
    dxBarSubItem10: TdxBarSubItem;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarButton9: TdxBarButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarButton10: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CE000Click(Sender: TObject);
    procedure C007ANTClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C004Click(Sender: TObject);
    procedure C006Click(Sender: TObject);
    procedure C028Click(Sender: TObject);
    procedure C029Click(Sender: TObject);
    procedure C005Click(Sender: TObject);
    procedure C020Click(Sender: TObject);
    procedure C027Click(Sender: TObject);
    procedure C236Click(Sender: TObject);
    procedure C035Click(Sender: TObject);
    procedure C031Click(Sender: TObject);
    procedure C034Click(Sender: TObject);
    procedure C1024Click(Sender: TObject);
    procedure C1031Click(Sender: TObject);
    procedure C1041Click(Sender: TObject);
    procedure C009Click(Sender: TObject);
    procedure LocaisdeEstoque2Click(Sender: TObject);
    procedure C025Click(Sender: TObject);
    procedure C002Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure C014Click(Sender: TObject);
    procedure C015Click(Sender: TObject);
    procedure FormasdePagamentos1Click(Sender: TObject);
    procedure C016Click(Sender: TObject);
    procedure C024Click(Sender: TObject);
    procedure C008Click(Sender: TObject);
    procedure C003Click(Sender: TObject);
    procedure C012Click(Sender: TObject);
    procedure C023Click(Sender: TObject);
    procedure C022Click(Sender: TObject);
    procedure C021Click(Sender: TObject);
    procedure C036Click(Sender: TObject);
    procedure ClassifContasReceber1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure C010Click(Sender: TObject);
    procedure C026Click(Sender: TObject);
    procedure C1023Click(Sender: TObject);
    procedure C1025Click(Sender: TObject);
    procedure C1029Click(Sender: TObject);
    procedure E003Click(Sender: TObject);
    procedure E001Click(Sender: TObject);
    procedure E002Click(Sender: TObject);
    procedure B001Click(Sender: TObject);
    procedure B003Click(Sender: TObject);
    procedure B002Click(Sender: TObject);
    procedure B004Click(Sender: TObject);
    procedure B005Click(Sender: TObject);
    procedure M019Click(Sender: TObject);
    procedure GerenciadorNFe1Click(Sender: TObject);
    procedure C1030Click(Sender: TObject);
    procedure M001Click(Sender: TObject);
    procedure M023Click(Sender: TObject);
    procedure M024Click(Sender: TObject);
    procedure Duplicata1Click(Sender: TObject);
    procedure M008Click(Sender: TObject);
    procedure M009Click(Sender: TObject);
    procedure M010Click(Sender: TObject);
    procedure M017Click(Sender: TObject);
    procedure M037Click(Sender: TObject);
    procedure M005Click(Sender: TObject);
    procedure M007Click(Sender: TObject);
    procedure M006Click(Sender: TObject);
    procedure M003Click(Sender: TObject);
    procedure M004Click(Sender: TObject);
    procedure M022Click(Sender: TObject);
    procedure F007Click(Sender: TObject);
    procedure M031Click(Sender: TObject);
    procedure M038Click(Sender: TObject);
    procedure M039Click(Sender: TObject);
    procedure M002Click(Sender: TObject);
    procedure C101Click(Sender: TObject);
    procedure C107Click(Sender: TObject);
    procedure C104Click(Sender: TObject);
    procedure C106Click(Sender: TObject);
    procedure C109Click(Sender: TObject);
    procedure C108Click(Sender: TObject);
    procedure C102Click(Sender: TObject);
    procedure C115Click(Sender: TObject);
    procedure C116Click(Sender: TObject);
    procedure C215Click(Sender: TObject);
    procedure C112Click(Sender: TObject);
    procedure C117Click(Sender: TObject);
    procedure C103Click(Sender: TObject);
    procedure C105Click(Sender: TObject);
    procedure C214Click(Sender: TObject);
    procedure C110Click(Sender: TObject);
    procedure C111Click(Sender: TObject);
    procedure C114Click(Sender: TObject);
    procedure C1026Click(Sender: TObject);
    procedure C201Click(Sender: TObject);
    procedure C202Click(Sender: TObject);
    procedure C203Click(Sender: TObject);
    procedure C204Click(Sender: TObject);
    procedure C205Click(Sender: TObject);
    procedure C211Click(Sender: TObject);
    procedure C227Click(Sender: TObject);
    procedure C228Click(Sender: TObject);
    procedure C229Click(Sender: TObject);
    procedure C216Click(Sender: TObject);
    procedure C217Click(Sender: TObject);
    procedure OrcamentosEmitidos1Click(Sender: TObject);
    procedure OSEmitdas1Click(Sender: TObject);
    procedure PreVendasEmitidas1Click(Sender: TObject);
    procedure C206Click(Sender: TObject);
    procedure C230Click(Sender: TObject);
    procedure C231Click(Sender: TObject);
    procedure C208Click(Sender: TObject);
    procedure C209Click(Sender: TObject);
    procedure C224Click(Sender: TObject);
    procedure C210Click(Sender: TObject);
    procedure C232Click(Sender: TObject);
    procedure C219Click(Sender: TObject);
    procedure C220Click(Sender: TObject);
    procedure C221Click(Sender: TObject);
    procedure C226Click(Sender: TObject);
    procedure C212Click(Sender: TObject);
    procedure R001Click(Sender: TObject);
    procedure R002Click(Sender: TObject);
    procedure R003Click(Sender: TObject);
    procedure R019Click(Sender: TObject);
    procedure R020Click(Sender: TObject);
    procedure R022Click(Sender: TObject);
    procedure R023Click(Sender: TObject);
    procedure R005Click(Sender: TObject);
    procedure R007Click(Sender: TObject);
    procedure R008Click(Sender: TObject);
    procedure R009Click(Sender: TObject);
    procedure R010Click(Sender: TObject);
    procedure R011Click(Sender: TObject);
    procedure R012Click(Sender: TObject);
    procedure R013Click(Sender: TObject);
    procedure R014Click(Sender: TObject);
    procedure R016Click(Sender: TObject);
    procedure R017Click(Sender: TObject);
    procedure R101Click(Sender: TObject);
    procedure R102Click(Sender: TObject);
    procedure R145Click(Sender: TObject);
    procedure R103Click(Sender: TObject);
    procedure R122Click(Sender: TObject);
    procedure R104Click(Sender: TObject);
    procedure R144Click(Sender: TObject);
    procedure R114Click(Sender: TObject);
    procedure R132Click(Sender: TObject);
    procedure R142Click(Sender: TObject);
    procedure R138Click(Sender: TObject);
    procedure R139Click(Sender: TObject);
    procedure R140Click(Sender: TObject);
    procedure R1024Click(Sender: TObject);
    procedure R143Click(Sender: TObject);
    procedure R119Click(Sender: TObject);
    procedure R120Click(Sender: TObject);
    procedure R127Click(Sender: TObject);
    procedure R105Click(Sender: TObject);
    procedure R106Click(Sender: TObject);
    procedure R123Click(Sender: TObject);
    procedure R107Click(Sender: TObject);
    procedure R108Click(Sender: TObject);
    procedure R117Click(Sender: TObject);
    procedure R128Click(Sender: TObject);
    procedure ContasaReceberCarto1Click(Sender: TObject);
    procedure R109Click(Sender: TObject);
    procedure R110Click(Sender: TObject);
    procedure R129Click(Sender: TObject);
    procedure R111Click(Sender: TObject);
    procedure R118Click(Sender: TObject);
    procedure R113Click(Sender: TObject);
    procedure R130Click(Sender: TObject);
    procedure R116Click(Sender: TObject);
    procedure R141Click(Sender: TObject);
    procedure R027Click(Sender: TObject);
    procedure R124Click(Sender: TObject);
    procedure R126Click(Sender: TObject);
    procedure R135Click(Sender: TObject);
    procedure R136Click(Sender: TObject);
    procedure R028Click(Sender: TObject);
    procedure R029Click(Sender: TObject);
    procedure R030Click(Sender: TObject);
    procedure R137Click(Sender: TObject);
    procedure R024Click(Sender: TObject);
    procedure R025Click(Sender: TObject);
    procedure R133Click(Sender: TObject);
    procedure R026Click(Sender: TObject);
    procedure R134Click(Sender: TObject);
    procedure R015Click(Sender: TObject);
    procedure ApuracaoPisCofins1Click(Sender: TObject);
    procedure ComissesdeVendedores1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure C1040Click(Sender: TObject);
    procedure C1042Click(Sender: TObject);
    procedure C007Click(Sender: TObject);
    procedure CX002Click(Sender: TObject);
    procedure CX003Click(Sender: TObject);
    procedure CX004Click(Sender: TObject);
    procedure CX005Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure P009Click(Sender: TObject);
    procedure P008Click(Sender: TObject);
    procedure C018Click(Sender: TObject);
    procedure P002Click(Sender: TObject);
    procedure P004Click(Sender: TObject);
    procedure P005Click(Sender: TObject);
    procedure P001Click(Sender: TObject);
    procedure P006Click(Sender: TObject);
    procedure C1028Click(Sender: TObject);
    procedure P011Click(Sender: TObject);
    procedure GerarLivroSaidasMapaResumo1Click(Sender: TObject);
    procedure P003Click(Sender: TObject);
    procedure R300Click(Sender: TObject);
    procedure C1027Click(Sender: TObject);
    procedure BoletoClick(Sender: TObject);
    procedure Boletos1Click(Sender: TObject);
    procedure F008Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
  private
    { Private declarations }
  protected
     procedure VerificarIBPT;
     function VerificaTabelaIBPT: Boolean;
     procedure CMDialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;
     procedure CountTSP( Sender: TObject;  Count: Integer );
     procedure InicioTSP( Sender: TObject; Index: Integer; Descricao: String );
     procedure ProgressTSP( Sender: TObject; Index: Integer;
       Descricao: String; Status: String; Progresso: Integer );
     procedure FimTSP( Sender: TObject; Index: Integer; Descricao: String );
     procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
  public
    { Public declarations }

    FTDI: TTDI;
    AligatorTSPList : TAligatorTSPList;
    procedure AtualizarIBPT( TSP: TAligatorTSP );
    procedure GravarIBPT( TSP: TAligatorTSP );
  end;

  function BuscaFormulario( aClass: TFormClass; const ForcaMostrar: Boolean = false ): TForm;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses Udm, UCadLab, UCadConvenio, UCadClassifCliente, UCadCli, UCadEmp, UCadFor,
  UCadBanco, UCadConta, UCadCheque, UCadMotivo, UDeposito, UConsCheques,
  UCadGICMS, UCadSecao, UCadProduto, UContasPagar,
  UContasPagarPag, UCancelaPagto, UConsPagar, UCadTipoVenda, UContasReceber,
  UCadCaixa, UConfiguracoes, UContasRecRec, UConsLancReceber,
  UConsContasRec, USelEmp, UConsEmp, UConsFor, UConsConvenio, UConsLab,
  UConsGRP, UConsSecao, UConsProd, UConsClassifCliente, UConsCli,
  UConsBanco, UConsConta, UConsMotivo, UConsTipoVenda,
  UConsCaixa, UEntradas, UConsEntrada, UAcertoEstoque, UConsAcertoEstoque,
  UConsEstoque, UVenda, UConsAniversario, UCadFunc, UConsFunc,
  UCadUsuario, URelEmp, URelFor, URelConvenio, URelLab, UConsVendas,
  UProdutoCliente, URelConv, UConsVendaCaixa, URelGrupoICMS, URelSecao,
  URelClaCliente, URelBanco, URelContasCorrente, URelMotivo,
  URelFuncionario, URelTipoVenda, URecCliConv, URelCTR, URelContasPagar,
  URelInventario, URelClienteGeral, URelProduto, UConsEntradasProduto,
  UConsProdVenda, URelEntradas, URelRecebimento, URelExtratoCliente, URelPagas,
  UCadGrupoUsuario, UAcesso, URelAbaixoMinimo, URelVendas, URelProdutosVendidos,
  UCadSetor, UConsSetor, URelBal, URelClienteNeg, URelEstoque, UCadTipoES,
  UConsTipoES, UConsOutrasSaidas,
  UConsOutrasEntradas, URelOutrasSaidas, URelOutrasEntradas,
  URelVendasLucro, URelCTRRes,
  UCadTipoDoc, ULancCC, UConsCCChequesAberto, UExtratoCC,
  UConsSaldoCC, URelCCAberto, URecConvenio, URelCusto,
  URepasseCheque, UConsRepasseCheque, URelChequeAberto,
  URelEntradasProduto, URelVendasProduto, UCadTipoCobranca,
  UConsTipoCobranca, URelEtiqueta, UCadCFOP, URelExtratoFor,
  UCadTransp, UNotaFiscal,
  UConsNotaFiscal, URelExtratoCC, URelProdGRP,
  URelCTREmitidas, URelMapaResumo, URelResumoMapa,
  URelPisCofins, UConsNFCFOP, UCadAdmCartaoCredito, ULancCTRADM, URecAdm,
  UFichaCliente, UCadCarta, UMalaDireta, UConsCtrAdmCartaoCred, UExtratoEstoque,
  URelResumoVendas, URelVendasSecao, UConsAcrescimos,
  URelProd, URelMargemLucro,
  URelGiro, URelPMV, URelAMR,
  UCTRDuplicata, URelEnvelope, UCadVales, UValesBaixa, UCancelaBaixaVale,
  UCadPromocao,
  URelPrecosPromocao,
  URelRegEntradas, URelRegSaidas, URelProdutosAlterados,
  UCadReceitas, UQRelMapaDetalhado, UCadTipoProduto,
  UCadClassifContasPagar, UCadEmbalagem, URelNF,
  URelVendasGrupoICMS, URelBebidasFumo, UIsentasPisEntradas,
  URelApuracaoICMS, UApuracaoPisCofins, UCadVend, URegistroProducao,
  UCadMarcas, UCadModelo, UCadUnidadeMedida, UConsPreVenda,
  UConsOrcamento, UConsOrdemServico, UCadFormasPagamentos, UCadCentroCusto,
  UDuplicataADM, URelContasReceberCartao, UCadClassifContasReceber,
  UCadLocaisEstoque, UCadSetorEstoque, UTransfLocaisEstoque,
  UGerenciamentoNFe,
  UMensagens,
  UCadSacadoBoleto, UConsSacado,
  URelComissoes, UCadRegiao,
  UfrmManifestacao, UCadTeclasAtalho, UformResumos, UTSP,
  UDicLib, UDownloadFile, UEstatisticas, UDialog, UTributacaoPerfil, UCadICMS,
  UCadNewCaixa, UNewCaixaGrupos, UDicFluxo, UMultiThreadNew,
  UNewCaixaMovimentos, UCadNewFormas, Sintegra, USintegra, USpedPis,
  UfrmSpedFiscal, UGeraInventario, UAtualizaPromocao, UAlteraPreco,
  UGeraBalanca, UExpImpProduto, UMarcarProd, URecEstoque, UDesativarProdutos,
  UComissoesVendedores, UGerarRegSaidas, UMapaResumo, UGeraRegSaidasMapaResumo,
  URelFluxoNew, UCadRemessa, UGerenciaRemessas, UOS, URelOS,
  UCadNotaFiscalServico, UGerenciamentoNFSE, UCadSNGPC, UCadSNGPCEntrada,
  UGerarXMLSNGPC, UCadPreVenda, UCadTrocas, URelProducao;//, UFaturamento;

var
   frmResumos: TfrmResumos;


function BuscaFormulario( aClass: TFormClass; const ForcaMostrar: Boolean = false ): TForm;
begin
   if not ForcaMostrar then
     begin
         Result := Nil;
         Result := frmMenu.FTDI.FormOfClass( aClass );
         if Result <> nil then
            Exit;
     end;
   Result :=  frmMenu.FTDI.MostrarFormulario(aClass, False );
end;

procedure TfrmMenu.ApuracaoPisCofins1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmApuracaoPisCofins, FrmApuracaoPisCofins);
  FrmApuracaoPisCofins.ShowModal;
end;

procedure TfrmMenu.B001Click(Sender: TObject);
begin
   Application.CreateForm( TFrmSelEmp, FrmSelEmp );
   FrmSelEmp.Tag := 1;
   FrmSelEmp.ShowModal;
end;

procedure TfrmMenu.B002Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadGrupoUsuario, False );
end;

procedure TfrmMenu.B003Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadUsu, False );
end;

procedure TfrmMenu.B004Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmAcesso, False );
end;

procedure TfrmMenu.B005Click(Sender: TObject);
var Senha : String;
begin
  PostMessage(Handle, InputBoxMessage, 0, 0);
  Senha := InputBox('Senha administrador do sistema', 'Senha', '');
  if Senha = 'Net07052016' then
    FTDI.MostrarFormulario( TFrmConfiguracoes, False )
  else
    MessageDlg('Senha errada !', mtInformation, [mbOK],0);
end;

procedure TfrmMenu.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;



procedure TfrmMenu.BoletoClick(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadRemessa, False );
end;

procedure TfrmMenu.Boletos1Click(Sender: TObject);
begin
  FTDI.MostrarFormulario(TfrmGerenciaRemessas, False );
end;

procedure TfrmMenu.C002Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadFor, False );
end;

procedure TfrmMenu.C003Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadConvenio, False  );
end;

procedure TfrmMenu.C004Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadLab, False );
end;

procedure TfrmMenu.C005Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TFrmCadGICMS, False );
end;

procedure TfrmMenu.C006Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadSecao, False );
end;

procedure TfrmMenu.C007ANTClick(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadProduto, False );
end;

procedure TfrmMenu.C007Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadProduto, False );
end;

procedure TfrmMenu.C008Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadClassifCliente, False );
end;

procedure TfrmMenu.C009Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadCli, False );
end;

procedure TfrmMenu.C010Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadBanco, False );
end;

procedure TfrmMenu.C012Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadMotivo, False );
end;

procedure TfrmMenu.C014Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadFunc, False );
end;

procedure TfrmMenu.C015Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadTipoVenda, False );
end;

procedure TfrmMenu.C016Click(Sender: TObject);
begin
//   FTDI.MostrarFormulario( TFrmCadCaixa, False );
   FTDI.MostrarFormulario( TfrmCadNewCaixa, False );
end;

procedure TfrmMenu.C018Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAlteraPreco, FrmAlteraPreco);
  FrmAlteraPreco.Tag := 0;
  FrmAlteraPreco.Show;
end;

procedure TfrmMenu.C020Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadSetor, False );
end;

procedure TfrmMenu.C021Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadTipoES, False );
end;

procedure TfrmMenu.C022Click(Sender: TObject);
begin
    FTDI.MostrarFormulario( TFrmCadTipoDoc, False );
end;

procedure TfrmMenu.C023Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadTipoCobranca, False );
end;

procedure TfrmMenu.C024Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TFrmCadCFOP, False );
end;

procedure TfrmMenu.C025Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadTransp, False );
end;

procedure TfrmMenu.C026Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadAdmCartaoCredito, False );
end;

procedure TfrmMenu.C027Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadUnidadeMedida, False );
end;

procedure TfrmMenu.C028Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadMarcas, False );
end;

procedure TfrmMenu.C029Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadModelo, False );
end;

procedure TfrmMenu.C031Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadPromocao, False );
end;

procedure TfrmMenu.C034Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadReceitas, False );
end;

procedure TfrmMenu.C035Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadTipoProduto, False );
end;

procedure TfrmMenu.C036Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadClassifContasPagar, False );
end;

procedure TfrmMenu.C101Click(Sender: TObject);
begin
  if (bDemonstracao) then
  begin
    Showmessage('Empresa Demonstração');
    exit;
    abort;
  end;

  Application.CreateForm(TFrmConsEmp, FrmConsEmp);
  FrmConsEmp.Tag := 1;
  FrmConsEmp.ShowModal;
end;

procedure TfrmMenu.C1023Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmMensagens, False );
end;

procedure TfrmMenu.C1024Click(Sender: TObject);
begin
   if not DM.Acesso('C1024','I') then
      begin
         Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
         Exit;
         Abort;
      end;
   Application.CreateForm( TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag := 46;
   FrmConsCli.ShowModal;
end;

procedure TfrmMenu.C1025Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadSacadoBoleto, False );
end;

procedure TfrmMenu.C1026Click(Sender: TObject);
begin
   Application.CreateForm(TfrmConsSacado, frmConsSacado);
   frmConsSacado.Tag := 0;
   frmConsSacado.ShowModal;
end;

procedure TfrmMenu.C1027Click(Sender: TObject);
begin
  FTDI.MostrarFormulario(TfrmGerenciaRemessas, False );
end;

procedure TfrmMenu.C1028Click(Sender: TObject);
begin
   Application.CreateForm( TfrmComissoesVendedores, frmComissoesVendedores );
   frmComissoesVendedores.Show;
end;

procedure TfrmMenu.C1029Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadRegiao, False );
end;

procedure TfrmMenu.C102Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFor, FrmConsFor);
  FrmConsFor.Tag := 5;
  FrmConsFor.ShowModal;
end;

procedure TfrmMenu.C1030Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmManifestacao, False );
end;

procedure TfrmMenu.C1031Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadTeclasAtalho, False );
end;

procedure TfrmMenu.C103Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
  FrmConsConvenio.Tag := 1;
  FrmConsConvenio.ShowModal;
end;

procedure TfrmMenu.C1040Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadTributacaoPerfil, False );
end;

procedure TfrmMenu.C1041Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadSetorEstoque, False );
end;

procedure TfrmMenu.C1042Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmCadICMS, False );
end;

procedure TfrmMenu.C104Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsLab, FrmConsLab);
  FrmConsLab.Tag := 3;
  FrmConsLab.ShowModal;
end;

procedure TfrmMenu.C105Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag := 3;
  FrmConsGRP.ShowModal;
end;

procedure TfrmMenu.C106Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSecao, FrmConsSecao);
  FrmConsSecao.Tag := 3;
  FrmConsSecao.ShowModal;
end;

procedure TfrmMenu.C107Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.Tag := 1;
  FrmConsProd.ShowModal;
end;

procedure TfrmMenu.C108Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsClassifCliente, FrmConsClassifCliente);
  FrmConsClassifCliente.Tag := 3;
  FrmConsClassifCliente.ShowModal;
end;

procedure TfrmMenu.C109Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.Tag := 9;
  FrmConsCli.ShowModal;
end;

procedure TfrmMenu.C110Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsBanco, FrmConsBanco);
  FrmConsBanco.Tag := 3;
  FrmConsBanco.ShowModal;
end;

procedure TfrmMenu.C111Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.Tag := 3;
  FrmConsConta.ShowModal;
end;

procedure TfrmMenu.C112Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsMotivo, FrmConsMotivo);
  FrmConsMotivo.Tag := 1;
  FrmConsMotivo.ShowModal;
end;

procedure TfrmMenu.C114Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsFunc, FrmConsFunc);
  FrmConsFunc.Tag := 1;
  FrmConsFunc.ShowModal;
end;

procedure TfrmMenu.C115Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.Tag := 2;
  FrmConsTipoVenda.ShowModal;
end;

procedure TfrmMenu.C116Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCaixa, FrmConsCaixa);
  FrmConsCaixa.Tag := 1;
  FrmConsCaixa.ShowModal;
end;

procedure TfrmMenu.C117Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
  FrmConsTipoCobranca.Tag := 1;
  FrmConsTipoCobranca.ShowModal;
end;

procedure TfrmMenu.CE000Click(Sender: TObject);
var Senha : String;
begin
  if (bDemonstracao) then
  begin
    AlertaCad('Empresa Demonstração');
    exit;
    abort;
  end;

  if not dm.VerificaCNPJCadastrado(sCNPJEmpresa) then
  begin
    AlertaCad('Empresa não autorizada');
    Application.Terminate;
  end;

  PostMessage(Handle, InputBoxMessage, 0, 0);
  Senha := InputBox('Senha administrador do sistema', 'Senha', '');
  if Senha = 'Net07052016' then
    FTDI.MostrarFormulario( TFrmCadEmp, False )
  else
    MessageDlg('Senha errada !', mtInformation, [mbOK],0);

end;

procedure TfrmMenu.CentrodeCusto1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadCentroCusto, False );
end;

procedure TfrmMenu.ClassifContasReceber1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadClassifContasReceber, False );
end;

procedure TfrmMenu.CMDialogKey(var Msg: TCMDialogKey);
var
   FormAtivo: TForm;
   Exec: Boolean;
begin
  if (Msg.CharCode = VK_RETURN) then
     begin
        FormAtivo := FTDI.FormIsActive;
        Exec := True;
        if FormAtivo <> nil then
           if IsPublishedProp( FormAtivo, 'AtivaTab' ) then
              Exec := GetPropValue( FormAtivo, 'AtivaTab' );
        if Exec then
           begin
              GetParentForm(Self).Perform(CM_DIALOGKEY, VK_TAB, 0);
              Msg.Result := 1;
           end
        else
           inherited;
     end
  else
    begin
         inherited;
    end;
end;

procedure TfrmMenu.ComissesdeVendedores1Click(Sender: TObject);
begin
   Application.CreateForm( TfrmRelComissoes, frmRelComissoes);
   frmRelComissoes.ShowModal;
end;

procedure TfrmMenu.Contas1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadConta, False );
end;

procedure TfrmMenu.ContasaReceberCarto1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelContasReceberCartao, FrmRelContasReceberCartao);
  FrmRelContasReceberCartao.ShowModal;

end;

procedure TfrmMenu.CountTSP(Sender: TObject; Count: Integer);
var
  Form: TForm;
begin
   if Count = 0 then
       begin
           InicioTSP( nil, 0, '' );
           with TfrmResumos( FTDI.FormOfClass( TfrmResumos ) ) do
                tltarefas.DeactivateDetail;
       end
   else
      begin
         with TfrmResumos( FTDI.FormOfClass( TfrmResumos ) ) do
              begin
                 if tltarefas.DetailOptions.DetailControl = nil then
                    begin
                       tltarefas.DetailOptions.DetailControl := TfrmTSP.Create( nil );
                       tltarefas.ActivateDetail;
                    end;
              end;
         InicioTSP( Self, 0, '' );
      end;
end;

procedure TfrmMenu.CX002Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmNewCaixaGrupos, False );
end;

procedure TfrmMenu.Duplicata1Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TFrmDuplicataADM, False );
end;

procedure TfrmMenu.dxBarButton10Click(Sender: TObject);
begin
   Application.CreateForm( TFrmRelProducao, FrmRelProducao );
   FrmRelProducao.ShowModal;
end;

procedure TfrmMenu.dxBarButton4Click(Sender: TObject);
begin
   Application.CreateForm( TfrmRelOS, frmRelOS );
   frmRelOS.ShowModal;
end;

procedure TfrmMenu.dxBarButton5Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadSNGPC, False );
end;

procedure TfrmMenu.dxBarButton6Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadSNGPCEntrada, False );
end;

procedure TfrmMenu.dxBarButton7Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TFrmGerarXMLSNGPC, False );
end;

procedure TfrmMenu.dxBarLargeButton10Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadPreVenda, False );
end;

procedure TfrmMenu.dxBarLargeButton11Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadTrocas, False );
end;

procedure TfrmMenu.dxBarLargeButton4Click(Sender: TObject);
begin
   Application.CreateForm( TFrmSintegra, FrmSintegra );
   FrmSintegra.ShowModal;
end;

procedure TfrmMenu.dxBarLargeButton5Click(Sender: TObject);
begin
   Application.CreateForm( TfrmSpedPis, frmSpedPis );
   frmSpedPis.ShowModal;
end;

procedure TfrmMenu.dxBarLargeButton6Click(Sender: TObject);
begin
   Application.CreateForm( TfrmSpedFiscal, frmSpedFiscal );
   frmSpedFiscal.ShowModal;
end;

procedure TfrmMenu.dxBarLargeButton7Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmCadOS, False );
end;

procedure TfrmMenu.dxBarLargeButton8Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmGerenciamentoNFSE, False );
end;

procedure TfrmMenu.CX003Click(Sender: TObject);
begin
  if DicFluxo.CaixaAberto then
     begin
        KDialog( 'Caixa já está aberto!', 'Caixa', tdtInfo );
        Exit;
     end;
  DicFluxo.AberturaFechamento.LocalizaCaixaUsuario;
  DicFluxo.AberturaFechamento.AbrirCaixa;
  DicFluxo.AberturaFechamento.VeficaCaixa;
end;

procedure TfrmMenu.CX004Click(Sender: TObject);
begin
  if not DicFluxo.CaixaAberto then
     begin
        KDialog( 'Caixa não está aberto!', 'Caixa', tdtInfo );
        Exit;
     end;
  DicFluxo.AberturaFechamento.LocalizaCaixaUsuario;
  DicFluxo.AberturaFechamento.FecharCaixa;
  DicFluxo.AberturaFechamento.VeficaCaixa;
end;

procedure TfrmMenu.CX005Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TfrmNewCaixaMovimentos, False );
end;

procedure TfrmMenu.E001Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmRegistroProducao, False );
end;

procedure TfrmMenu.E002Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmTransfLocaisEstoque, False );
end;

procedure TfrmMenu.E003Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmAcertoEstoque, False );
end;

procedure TfrmMenu.C201Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsEntrada, FrmConsEntrada);
  FrmConsEntrada.Tag := 1;
  FrmConsEntrada.ShowModal;
end;

procedure TfrmMenu.C202Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsEntradasProduto, FrmConsEntradasProduto);
  FrmConsEntradasProduto.ShowModal;

end;

procedure TfrmMenu.C203Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsVendas, FrmConsVendas);
  FrmConsVendas.Tag := 1;
  FrmConsVendas.ShowModal;

end;

procedure TfrmMenu.C204Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsVendaCaixa, FrmConsVendaCaixa);
  FrmConsVendaCaixa.ShowModal;

end;

procedure TfrmMenu.C205Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsProdVenda, FrmConsProdVenda);
  FrmConsProdVenda.ShowModal;

end;

procedure TfrmMenu.C206Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsAcertoEstoque, FrmConsAcertoEstoque);
  FrmConsAcertoEstoque.Tag := 1;
  FrmConsAcertoEstoque.ShowModal;
end;

procedure TfrmMenu.C208Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsPagar, FrmConsPagar);
  FrmConsPagar.ShowModal;
end;

procedure TfrmMenu.C209Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsContasRec, FrmConsContasRec);
  FrmConsContasRec.ShowModal;
end;

procedure TfrmMenu.C210Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsEstoque, FrmConsEstoque);
  FrmConsEstoque.ShowModal;
end;

procedure TfrmMenu.C211Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutoCliente, FrmProdutoCliente);
  FrmProdutoCliente.ShowModal;

end;

procedure TfrmMenu.C212Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsAniversario, FrmConsAniversario);
  FrmConsAniversario.ShowModal;

end;

procedure TfrmMenu.C214Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsSetor, FrmConsSetor);
  FrmConsSetor.Tag := 1;
  FrmConsSetor.ShowModal;
end;

procedure TfrmMenu.C215Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
  FrmConsTipoES.Tag := 1;
  FrmConsTipoES.ShowModal;
end;

procedure TfrmMenu.C216Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOutrasSaidas, FrmConsOutrasSaidas);
  FrmConsOutrasSaidas.Tag := 1;
  FrmConsOutrasSaidas.ShowModal;
end;

procedure TfrmMenu.C217Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOutrasEntradas, FrmConsOutrasEntradas);
  FrmConsOutrasEntradas.Tag := 1;
  FrmConsOutrasEntradas.ShowModal;
end;

procedure TfrmMenu.C219Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCCChequesAberto, FrmConsCCChequesAberto);
  FrmConsCCChequesAberto.ShowModal;
end;

procedure TfrmMenu.C220Click(Sender: TObject);
begin
  Application.CreateForm(TFrmSaldoCC, FrmSaldoCC);
  FrmSaldoCC.ShowModal;
end;

procedure TfrmMenu.C221Click(Sender: TObject);
begin
  Application.CreateForm(TFrmExtratoCC, FrmExtratoCC);
  FrmExtratoCC.ShowModal;
end;

procedure TfrmMenu.C224Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsAdmCartaoCred, FrmConsAdmCartaoCred);
  FrmConsAdmCartaoCred.Tag := 0;
  FrmConsAdmCartaoCred.ShowModal;
end;

procedure TfrmMenu.C226Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFichaCliente, FrmFichaCliente);
  FrmFichaCliente.ShowModal;

end;

procedure TfrmMenu.C227Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsAcrescimos, FrmConsAcrescimos);
  FrmConsAcrescimos.ShowModal;
end;

procedure TfrmMenu.C228Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsNotaFiscal, FrmConsNotaFiscal);
  FrmConsNotaFiscal.Tag := 1;
  FrmConsNotaFiscal.ShowModal;

end;

procedure TfrmMenu.C229Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsNFCFOP, FrmConsNFCFOP);
  FrmConsNFCFOP.ShowModal;

end;

procedure TfrmMenu.C230Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCheques, FrmConsCheques);
  FrmConsCheques.ShowModal;
end;

procedure TfrmMenu.C231Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsRepasse, FrmConsRepasse);
  FrmConsRepasse.ShowModal;
end;

procedure TfrmMenu.C232Click(Sender: TObject);
begin
  Application.CreateForm(TFrmExtratoEstoque, FrmExtratoEstoque);
  FrmExtratoEstoque.ShowModal;
end;

procedure TfrmMenu.C236Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadEmbalagem, False );
end;

procedure TfrmMenu.F007Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmLancCC, False );
end;

procedure TfrmMenu.F008Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TfrmGerenciaRemessas, False );
end;

procedure TfrmMenu.FimTSP(Sender: TObject; Index: Integer; Descricao: String);
var
  I: Integer;
  Frame: TfrmTSP;
begin
  with frmResumos do
      begin
         Frame := TfrmTSP( tltarefas.DetailOptions.DetailControl );
      end;
  if Descricao <> '' then
     AlertaCad( Descricao + ' Finalizada', alertTarefas, 'Tarefas' );
  with Frame.cxTarefasTableView1.DataController do
     begin
        BeginFullUpdate;
        RecordCount := AligatorTSPList.Count;
        try
           for I := 0 to  AligatorTSPList.Count -1 do
              begin
                 Values[ I, 0 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Descricao;
                 Values[ I, 2 ] := TAligatorTSP( AligatorTSPList.Items[I] ).ProgressoAtual;
                 Values[ I, 1 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Status;
                 Values[ I, 3 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Modulo;
              end;
        finally
           EndFullUpdate;
        end;
        Frame.cxTarefasTableView1.ViewData.Expand( False );
     end;
end;

procedure TfrmMenu.FormasdePagamentos1Click(Sender: TObject);
begin
//  FTDI.MostrarFormulario( TFrmCadFormaPagamento, False );
  FTDI.MostrarFormulario( TfrmCadNewFormas, False );
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   AligatorTSPList.Free;
   FTDI.Fechar( True );
end;

procedure TfrmMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := KDialog( 'Tem certeza que deseja sair do sistema', 'Aligator ERP', tdtPergunta );
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  FTDI := TTDI.Create(Self, TfrmResumos );
  FTDI.MostrarMenuPopup := False;
  frmResumos := TfrmResumos( FTDI.FormOfClass( TfrmResumos ) );
  dxSkinController1.NativeStyle := False;
   cxTradutor.LoadFromFile( ExtractFilePath( Application.ExeName ) + '\TraducaoBR.ini' );
   cxTradutor.LanguageIndex := 1;
   cxTradutor.Active := True;
  if dxSkinsUserSkinLoadFromFile(
   TPath.Combine( ExtractFilePath( Application.ExeName ),
    'Skins\SkinAligator.skinres' ), 'AligatorSkin')  then
    begin
      dxSkinController1.NativeStyle := false;
      dxSkinController1.SkinName := 'UserSkin';
      //dxRibbon1.ColorSchemeName := 'UserSkin';
      dxSkinController1.UseSkins := true;
      dxSkinController1.Refresh;
    end;


end;

procedure TfrmMenu.FormDestroy(Sender: TObject);
begin
   FreeAndNil( FTDI );
end;

procedure TfrmMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   try
     if Key <> VK_RETURN then
     if Key <> VK_ESCAPE then
     if FTDI.FormIsActive <> nil then
        SendMessage( FTDI.FormIsActive.Handle, WM_KEYDOWN, Key, ShiftStateToKeys( Shift ) );
   except

   end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
   AligatorTSPList := TAligatorTSPList.Create;
   AligatorTSPList.OnChangeCount := CountTSP;
   AligatorTSPList.OnInicioTSP := InicioTSP;
   AligatorTSPList.OnFimTSP := FimTSP;
   AligatorTSPList.OnProgresso := ProgressTSP;
   VerificarIBPT;
   if frmResumos.tlStatistics.DetailOptions.DetailControl = nil then
   frmResumos.tlStatistics.DetailOptions.DetailControl := TfrmEstatisticas.Create( nil );
   if TfrmEstatisticas( frmResumos.tlStatistics.DetailOptions.DetailControl ).AtualizaResumo( True ) then
      frmResumos.tlStatistics.ActivateDetail;
   iCaixa := 0;
   DicFluxo.AberturaFechamento.VeficaCaixa;
   iCaixa := DicFluxo.CodCaixa;
  QBuscaPara.Close;
  QBuscaPara.Parambyname('codemp').AsInteger:= iEmp;
  QBuscaPara.Open;
  if Copy(QBuscaPara.FieldByName('PERMISSAO').AsString, 1,1) = 'S' then
    dxBarLargeButton7.Visible := ivAlways
  else
    dxBarLargeButton7.Visible := ivNever;
  if Copy(QBuscaPara.FieldByName('PERMISSAO').AsString, 2,1) = 'S' then
    dxBarSubItem6.Visible := ivAlways
  else
    dxBarSubItem6.Visible := ivNever;
  if Copy(QBuscaPara.FieldByName('PERMISSAO').AsString, 3,1) = 'S' then
    dxBarSubItem8.Visible := ivAlways
  else
    dxBarSubItem8.Visible := ivNever;

  frmResumos.dxTileItem3.Visible := Copy(QBuscaPara.FieldByName('PERMISSAO').AsString, 1,1) = 'S';
end;

procedure TfrmMenu.GerarLivroSaidasMapaResumo1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmGerarRegSaidasMapaResumo,
    FrmGerarRegSaidasMapaResumo);
  FrmGerarRegSaidasMapaResumo.Show;
end;

procedure TfrmMenu.GerenciadorNFe1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmGerenciamentoNFe, False );
end;

procedure TfrmMenu.InicioTSP(Sender: TObject; Index: Integer;
  Descricao: String);
var
  I: Integer;
  Frame: TfrmTSP;
begin
  with frmResumos do
      begin
         Frame := TfrmTSP( tltarefas.DetailOptions.DetailControl );
      end;
  if Descricao <> '' then
     AlertaCad(  Descricao + ' Iniciada', alertTarefas, 'Tarefas' );
  with Frame.
     cxTarefasTableView1.DataController do
     begin
        BeginFullUpdate;
        RecordCount := AligatorTSPList.Count;
        try
           for I := 0 to  AligatorTSPList.Count -1 do
              begin
                 Values[ I, 0 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Descricao;
                 Values[ I, 2 ] := TAligatorTSP( AligatorTSPList.Items[I] ).ProgressoAtual;
                 Values[ I, 1 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Status;
                 Values[ I, 3 ] := TAligatorTSP( AligatorTSPList.Items[I] ).Modulo;
              end;
        finally
           EndFullUpdate;
        end;
        Frame.cxTarefasTableView1.ViewData.Expand( False );
     end;
end;

procedure TfrmMenu.LocaisdeEstoque2Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadLocaisEstoque, False );
end;

procedure TfrmMenu.M001Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmEntradas, False );
end;

procedure TfrmMenu.M002Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmVenda, False );
end;

procedure TfrmMenu.M003Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadCheque, False );
end;

procedure TfrmMenu.M004Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmDeposito, False );
end;

procedure TfrmMenu.M005Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmContasPagar, False );
end;

procedure TfrmMenu.M006Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmContasPagarPag, False );
end;

procedure TfrmMenu.M007Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCancelaPagto, False );
end;

procedure TfrmMenu.M008Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmLancContasReceber, False );
end;

procedure TfrmMenu.M009Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmContasRecRec, False );
end;

procedure TfrmMenu.M010Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsLancReceber, FrmConsLancReceber);
  FrmConsLancReceber.Tag := 1;
  FrmConsLancReceber.Caption := 'Cancelamento de Recebimento';
  FrmConsLancReceber.BtnLocalizar.Caption := '&Cancelar';
  FrmConsLancReceber.ShowModal;
end;

procedure TfrmMenu.M017Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmRecConvenio, False );
end;

procedure TfrmMenu.M019Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmNotaFiscal, False );
end;

procedure TfrmMenu.M022Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmRepasseCheque, False );
end;

procedure TfrmMenu.M023Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmLancCTRADM, False );
end;

procedure TfrmMenu.M024Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmRECADM, False );
end;

procedure TfrmMenu.M031Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadVales, False );
end;

procedure TfrmMenu.M037Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCTRDuplicata, False );
end;

procedure TfrmMenu.M038Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmValesBaixa, False );
end;

procedure TfrmMenu.M039Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCancelaBaixaVale, False );
end;

procedure TfrmMenu.OrcamentosEmitidos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOrcamento, FrmConsOrcamento);
  FrmConsOrcamento.Tag := 0;
  FrmConsOrcamento.ShowModal;
end;

procedure TfrmMenu.OSEmitdas1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsOrdemServico, FrmConsOrdemServico);
  FrmConsOrdemServico.Tag := 0;
  FrmConsOrdemServico.ShowModal;
end;

procedure TfrmMenu.P001Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRecEstoque, FrmRecEstoque);
  FrmRecEstoque.Show;
end;

procedure TfrmMenu.P002Click(Sender: TObject);
begin
  Application.CreateForm(TFrmGeraBalanca, FrmGeraBalanca);
  FrmGeraBalanca.Show;
end;

procedure TfrmMenu.P003Click(Sender: TObject);
begin
  if not dm.VerificaCNPJCadastrado(sCNPJEmpresa) then
  begin
    Showmessage('Empresa não autorizada');
    Application.Terminate;
  end;

  if dDataLiberacao <= date then
  begin
    Showmessage('dll não encontrada!');
  end
  else
  begin
    Application.CreateForm(TFrmSintegra, FrmSintegra);
    FrmSintegra.Show;
  end;
end;

procedure TfrmMenu.P004Click(Sender: TObject);
begin
  Application.CreateForm(TFrmExpImpProduto, FrmExpImpProduto);
  FrmExpImpProduto.Show;
end;

procedure TfrmMenu.P005Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMarcarProd, FrmMarcarProd);
  FrmMarcarProd.Show;
end;

procedure TfrmMenu.P006Click(Sender: TObject);
begin
  Application.CreateForm(TFrmDesativarProdutos, FrmDesativarProdutos);
  FrmDesativarProdutos.Show;
end;

procedure TfrmMenu.P008Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAtualizaPromocao, FrmAtualizaPromocao);
  FrmAtualizaPromocao.Show;
end;

procedure TfrmMenu.P009Click(Sender: TObject);
begin
  Application.CreateForm(TFrmGeraInventario, FrmGeraInventario);
  FrmGeraInventario.ShowModal;   //
end;

procedure TfrmMenu.P011Click(Sender: TObject);
begin
  Application.CreateForm(TFrmGerarRegSaidas, FrmGerarRegSaidas);
  FrmGerarRegSaidas.Show;
end;

procedure TfrmMenu.PreVendasEmitidas1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsPreVenda, FrmConsPreVenda);
  FrmConsPreVenda.Tag := 0;
  FrmConsPreVenda.ShowModal;
end;

procedure TfrmMenu.ProgressTSP(Sender: TObject; Index: Integer; Descricao,
  Status: String; Progresso: Integer);
var
  Frame: TfrmTSP;
begin
  if frmResumos.
      tltarefas.DetailOptions.DetailControl = nil then
      Exit;
  with frmResumos do
      begin
         Frame := TfrmTSP( tltarefas.DetailOptions.DetailControl );
      end;
  with Frame.cxTarefasTableView1.DataController do
     begin
        BeginFullUpdate;
        try
           Values[ Index, 0 ] := Descricao;
           Values[ Index, 2 ] := Progresso;
           Values[ Index, 1 ] := Status;
        finally
           EndFullUpdate;
        end;
     end;
end;

procedure TfrmMenu.R001Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEmp, FrmRelEmp);
  FrmRelEmp.ShowModal;
end;

procedure TfrmMenu.R002Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelFor, FrmRelFor);
  FrmRelFor.ShowModal;
end;

procedure TfrmMenu.R003Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelConvenio, FrmRelConvenio);
  FrmRelConvenio.ShowModal;
end;

procedure TfrmMenu.R005Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCliConv, FrmRelCliConv);
  FrmRelCliConv.ShowModal;
end;

procedure TfrmMenu.R007Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelClienteGeral, FrmRelClienteGeral);
  FrmRelClienteGeral.ShowModal;
end;

procedure TfrmMenu.R008Click(Sender: TObject);
begin
  Application.CreateForm(TFrmrelClaCliente, FrmRelClaCliente);
  FrmRelClaCliente.ShowModal;
end;

procedure TfrmMenu.R009Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelLab, FrmRelLab);
  FrmRelLab.ShowModal;

end;

procedure TfrmMenu.R010Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelGrupoICMS, FrmRelGrupoICMS);
  FrmRelGrupoICMS.ShowModal;

end;

procedure TfrmMenu.R011Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelSecao, FrmRelSecao);
  FrmRelSecao.ShowModal;

end;

procedure TfrmMenu.R012Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelBanco, FrmRelBanco);
  FrmRelBanco.ShowModal;

end;

procedure TfrmMenu.R013Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelContasCorrente, FrmRelContasCorrente);
  FrmRelContasCorrente.ShowModal;

end;

procedure TfrmMenu.R014Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelMotivo, FrmRelMotivo);
  FrmRelMotivo.ShowModal;

end;

procedure TfrmMenu.R015Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelApuracaoICMS, FrmRelApuracaoICMS);
  FrmRelApuracaoICMS.ShowModal;
end;

procedure TfrmMenu.R016Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelFuncionario, FrmRelFuncionario);
  FrmRelFuncionario.ShowModal;
end;

procedure TfrmMenu.R017Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelTipoVenda, FrmRelTipoVenda);
  FrmRelTipoVenda.ShowModal;

end;

procedure TfrmMenu.R019Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProd, FrmRelProd);
  FrmRelProd.ShowModal;

end;

procedure TfrmMenu.R020Click(Sender: TObject);
begin
   Application.CreateForm(TFrmRelProduto, FrmRelProduto);
   FrmRelProduto.ShowModal;
end;

procedure TfrmMenu.R022Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelMargemLucro, FrmRelMargemLucro);
  FrmRelMargemLucro.ShowModal;
end;

procedure TfrmMenu.R023Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProdGRP, FrmRelProdGRP);
  FrmRelProdGRP.ShowModal;
end;

procedure TfrmMenu.R024Click(Sender: TObject);
begin
  if dDataLiberacao <= date then
  begin
      Showmessage('dll não encontrada!');
  end
  else
  begin
    Application.CreateForm(TFrmRelRegEntradas, FrmRelRegEntradas);
    FrmRelRegEntradas.Tag := 0;
    FrmRelRegEntradas.ShowModal;
  end;
end;

procedure TfrmMenu.R025Click(Sender: TObject);
begin
  if dDataLiberacao <= date then
  begin
    Showmessage('dll não encontrada!');
  end
  else
  begin
    Application.CreateForm(TFrmRelRegSaidas, FrmRelRegSaidas);
    FrmRelRegSaidas.Tag := 0;
    FrmRelRegSaidas.ShowModal;
  end;
end;

procedure TfrmMenu.R026Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelMapaDetalhado, FrmRelMapaDetalhado);
  FrmRelMapaDetalhado.ShowModal;
end;

procedure TfrmMenu.R027Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProdutosAlterados, FrmRelProdutosAlterados);
  FrmRelProdutosAlterados.ShowModal;

end;

procedure TfrmMenu.R028Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEnvelope, FrmRelEnvelope);
  FrmRelEnvelope.ShowModal;

end;

procedure TfrmMenu.R029Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelPMV, FrmRelPMV);
  FrmRelPMV.ShowModal;

end;

procedure TfrmMenu.R030Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelAMR, FrmRelAMR);
  FrmRelAMR.ShowModal;

end;

procedure TfrmMenu.R101Click(Sender: TObject);
begin
    Application.CreateForm(TFrmRelEntradas, FrmRelEntradas);
    FrmRelEntradas.ShowModal;

end;

procedure TfrmMenu.R1024Click(Sender: TObject);
begin
   Application.CreateForm( TFrmConsCli, FrmConsCli );
   FrmConsCli.Tag := 45;
   FrmConsCli.ShowModal;

end;

procedure TfrmMenu.R102Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEntradasProduto, FrmRelEntradasProduto);
  FrmRelEntradasProduto.ShowModal;

end;

procedure TfrmMenu.R103Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendas, FrmRelVendas);
  FrmRelVendas.ShowModal;

end;

procedure TfrmMenu.R104Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendasProduto, FrmRelVendasProduto);
  FrmRelVendasProduto.ShowModal;

end;

procedure TfrmMenu.R105Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelConv, FrmRelConv);
  FrmRelConv.ShowModal;

end;

procedure TfrmMenu.R106Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCTR, FrmRelCTR);
  FrmRelCTR.ShowModal;

end;

procedure TfrmMenu.R107Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelRecebimento, FrmRelRecebimento);
  FrmRelRecebimento.ShowModal;

end;

procedure TfrmMenu.R108Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelExtratoCliente, FrmRelExtratoCliente);
  FrmRelExtratoCliente.ShowModal;

end;

procedure TfrmMenu.R109Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelContasAPagar, FrmRelContasAPagar);
  FrmRelContasAPagar.ShowModal;

end;

procedure TfrmMenu.R110Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelPagas, FrmRelPagas);
  FrmRelPagas.ShowModal;

end;

procedure TfrmMenu.R111Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelInventario, FrmRelInventario);
  FrmRelInventario.ShowModal;

end;

procedure TfrmMenu.R113Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelAbaixoMinimo, FrmRelAbaixoMinimo);
  FrmRelAbaixoMinimo.ShowModal;

end;

procedure TfrmMenu.R114Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelProdutosVendidos, FrmRelProdutosVendidos);
  FrmRelProdutosVendidos.ShowModal;

end;

procedure TfrmMenu.R116Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelBal, FrmRelBal);
  FrmRelBal.ShowModal;

end;

procedure TfrmMenu.R117Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelClienteNeg, FrmRelClienteNeg);
  FrmRelClienteNeg.ShowModal;

end;

procedure TfrmMenu.R118Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelEstoque, FrmRelEstoque);
  FrmRelEstoque.ShowModal;

end;

procedure TfrmMenu.R119Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelOutrasSaidas, FrmRelOutrasSaidas);
  FrmRelOutrasSaidas.ShowModal;

end;

procedure TfrmMenu.R120Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelOutrasEntradas, FrmRelOutrasEntradas);
  FrmRelOutrasEntradas.ShowModal;

end;

procedure TfrmMenu.R122Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendasLucro, FrmRelVendasLucro);
  FrmRelVendasLucro.ShowModal;

end;

procedure TfrmMenu.R123Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelAReceberRes, FrmRelAReceberRes);
  FrmRelAReceberRes.ShowModal;

end;

procedure TfrmMenu.R124Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCCAberto, FrmRelCCAberto);
  FrmRelCCAberto.ShowModal;

end;

procedure TfrmMenu.R126Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelExtratoCC, FrmRelExtratoCC);
  FrmRelExtratoCC.ShowModal;

end;

procedure TfrmMenu.R127Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCheque, FrmRelCheque);
  FrmRelCheque.ShowModal;

end;

procedure TfrmMenu.R128Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCTREmitidas, FrmRelCTREmitidas);
  FrmRelCTREmitidas.ShowModal;

end;

procedure TfrmMenu.R129Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelExtratoFor, FrmRelExtratoFor);
  FrmRelExtratoFor.ShowModal;

end;

procedure TfrmMenu.R130Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelCusto, FrmRelCusto);
  FrmRelCusto.ShowModal;

end;

procedure TfrmMenu.R132Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelPisCofins, FrmRelPisCofins);
  FrmRelPisCofins.ShowModal;

end;

procedure TfrmMenu.R133Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelMapaResumo, FrmRelMapaResumo);
  FrmRelMapaResumo.ShowModal;
end;

procedure TfrmMenu.R134Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelResumoMapa, FrmRelResumoMapa);
  FrmRelResumoMapa.ShowModal;
end;

procedure TfrmMenu.R135Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadCarta, FrmCadCarta);
  FrmCadCarta.Tag := 0;
  FrmCadCarta.ShowModal;

end;

procedure TfrmMenu.R136Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMalaDireta, FrmMalaDireta);
  FrmMalaDireta.ShowModal;

end;

procedure TfrmMenu.R137Click(Sender: TObject);
begin
  FTDI.MostrarFormulario( TFrmRelEtiqueta, False );
 //  FTDI.MostrarFormulario( TfrmRelNewEtiquetas, False );
end;

procedure TfrmMenu.R138Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelResumoVendas, FrmRelResumoVendas);
  FrmRelResumoVendas.ShowModal;

end;

procedure TfrmMenu.R139Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendasSecao, FrmRelVendasSecao);
  FrmRelVendasSecao.ShowModal;

end;

procedure TfrmMenu.R140Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelGiro, FrmRelGiro);
  FrmRelGiro.ShowModal;

end;

procedure TfrmMenu.R141Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelPrecoPromocao, FrmRelPrecoPromocao);
  FrmRelPrecoPromocao.ShowModal;

end;

procedure TfrmMenu.R142Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelBebidasFumo, FrmRelBebidasFumo);
  FrmRelBebidasFumo.ShowModal;

end;

procedure TfrmMenu.R143Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelNF, FrmRelNF);
  FrmRelNF.ShowModal;

end;

procedure TfrmMenu.R144Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelVendasGrupoICMS, FrmRelVendasGrupoICMS);
  FrmRelVendasGrupoICMS.ShowModal;

end;

procedure TfrmMenu.R145Click(Sender: TObject);
begin
  Application.CreateForm(TFrmIsentasPisEntradas, FrmIsentasPisEntradas);
  FrmIsentasPisEntradas.ShowModal;

end;

procedure TfrmMenu.R300Click(Sender: TObject);
begin
   Application.CreateForm( TfrmRelFluxonew, frmRelFluxonew );
   frmRelFluxonew.ShowModal;
end;


procedure TfrmMenu.Vendedor1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario( TFrmCadVend, False );
end;

//********************************************************//
//---------------  TABELA IBPT ---------------------------//
//********************************************************//

{$REGION 'IBPT'}

procedure TfrmMenu.VerificarIBPT;
var
   Arquivo: String;
   Estado: string;
begin
   Estado := DM.RetornaStringTabela( 'EST_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   if Estado = '' then
      Exit;
   Arquivo := TDicLib.GetAppPath( Estado + '.csv' );
   if not FileExists( Arquivo ) then
      begin
         AligatorTSPList.NovaTarefa( AtualizarIBPT, 'Download IBPT ' + Estado, 'IBPT' );
      end
   else
      begin
         Exit;
         if VerificaTabelaIBPT then
            begin
               DeleteFile( Arquivo );
               AligatorTSPList.NovaTarefa( AtualizarIBPT, 'Download IBPT ' + Estado, 'IBPT' );
            end;
      end;
end;

function TfrmMenu.VerificaTabelaIBPT: Boolean;
var
  OpenIBPT: TACBrIBPTax;
  Arquivo: String;
  Estado: string;
  Conec: TFDConnection;
  Transaction: TFDTransaction;
  Query: TFDQuery;
begin
   Result := False;
   Estado := DM.RetornaStringTabela( 'EST_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   if Estado = '' then
      Exit;
   Arquivo := TDicLib.GetAppPath( Estado + '.csv' );
   if not FileExists( Arquivo ) then
      Exit;
   OpenIBPT := TACBrIBPTax.Create( nil );
   Conec := TFDConnection.Create( nil );
   Transaction := TFDTransaction.Create( nil );
   Query := TFDQuery.Create( nil );
   try
       Conec.Params.Assign( DM.IBDatabase.Params );
       Conec.Open;
       Transaction.Connection := Conec;
       Query.Transaction := Transaction;
       Query.Connection := Conec;
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       try
            Query.Close;
            Query.SQL.Text := 'select first 1 count(*),' + #13#10 +
                    'DT_FIM from ncm where cod_emp=:cod_emp' + #13#10 +
                    'group by DT_FIM order by DT_FIM desc';
            Query.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
            Query.Open;
            OpenIBPT.AbrirTabela( Arquivo );
            Result := ( Query.FieldByName( 'COUNT' ).AsInteger < 11000 )
             or (  Query.FieldByName( 'DT_FIM' ).AsDateTime <> OpenIBPT.VigenciaFim )
             or (  Query.FieldByName( 'DT_FIM' ).AsDateTime < Now );
       finally
           if Transaction.Active then
              Transaction.Commit;
       end;
   finally
      OpenIBPT.Free;
      Query.Free;
      Transaction.Free;
      Conec.Free;
   end;
end;

procedure TfrmMenu.AtualizarIBPT( TSP: TAligatorTSP );
var
  Download: TFileDownload;
  Arquivo: String;
  Estado: string;
  ObjTemp: TAligatorTSPTemp;
begin
   Estado := DM.RetornaStringTabela( 'EST_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   if Estado = '' then
      Exit;
   Arquivo := TDicLib.GetAppPath( Estado + '.csv' );
   Download := TFileDownload.Create( 'http://www.aligatorerp.com.br/ibpt/' + Estado + '.csv' ,
      Arquivo, 2 );
   ObjTemp := TAligatorTSPTemp.Create;
   try
       ObjTemp.Obj := TSP;
       Download.OnChangeFile := ObjTemp.Porcent;
       Download.OnFim := ObjTemp.FimDownload;
       ObjTemp.Terminou := False;
       Download.Iniciar;
       while ( ( not ObjTemp.Terminou ) and ( not TThread.CheckTerminated ) ) do
           begin
              Sleep(5);
           end;
   finally
      if not ObjTemp.Terminou then
         Download.Parar;
       Download.Free;
       ObjTemp.Free;
       TThread.Synchronize( nil,
        procedure
        begin
           if FileExists( Arquivo ) then
              AligatorTSPList.NovaTarefa( GravarIBPT, 'IBPT Atualização', 'IBPT' );
        end);
   end;

end;

procedure TfrmMenu.GravarIBPT(TSP: TAligatorTSP);
var
   OpenIBPT: TACBrIBPTax;
  Arquivo: String;
  Estado: string;
  I: Integer;
  Total: Integer;
  Conec: TFDConnection;
  Transaction: TFDTransaction;
  Query: TFDQuery;
  Atualizados: Integer;
  Tempo:  TDateTime;
  const Cache: Integer = 200;
begin
   Estado := DM.RetornaStringTabela( 'EST_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   if Estado = '' then
      Exit;
   Arquivo := TDicLib.GetAppPath( Estado + '.csv' );
   if not FileExists( Arquivo ) then
      Exit;
   Atualizados := 0;
   OpenIBPT := TACBrIBPTax.Create( nil );
   Conec := TFDConnection.Create( nil );
   Tempo := Now;
   Transaction := TFDTransaction.Create( nil );
   Query := TFDQuery.Create( nil );
   try
       Conec.Params.Assign( DM.IBDatabase.Params );
       Conec.Open;
       Transaction.Connection := Conec;
       Query.Transaction := Transaction;
       Query.Connection := Conec;
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       try
          if not OpenIBPT.AbrirTabela( Arquivo ) then
             Exit;
          Total := OpenIBPT.Itens.Count;
          for I := 0 to OpenIBPT.Itens.Count -1 do
               begin
                  if MilliSecondsBetween( Now, Tempo ) > 100 then
                     begin
                        TSP.Progresso( ( ( I + 1 ) * 100 ) div Total, 'Atualizando NCM ' +
                         IntToStr( I + 1 ) + '/' + IntToStr( Total ) );
                        Tempo := Now;
                     end;
                  try
                      Query.Close;
                      Query.SQL.Text := 'UPDATE OR INSERT INTO NCM ' +
                                        '( COD_EMP, NCM, EX, TIPO, DESCRICAO, NACIONAL,' +
                                        ' IMPORTADO, ESTADUAL, MUNICIPAL, DT_INI, DT_FIM )' +
                                        ' VALUES' +
                                        '( :COD_EMP, :NCM, :EX, :TIPO, :DESCRICAO, :NACIONAL, ' +
                                        ' :IMPORTADO, :ESTADUAL, :MUNICIPAL, :DT_INI, :DT_FIM )' +
                                        ' MATCHING ( COD_EMP, NCM, EX, TIPO )';
                      with OpenIBPT.Itens.Items[I] do
                          begin
                             Query.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                             Query.ParamByName( 'NCM' ).AsInteger :=
                              StrToInt( ACBrUtil.OnlyNumber( NCM ) );
                             Query.ParamByName( 'EX' ).AsInteger := StrToIntDef( Excecao, 0 );
                             Query.ParamByName( 'TIPO' ).AsInteger := Ord( Tabela );
                             Query.ParamByName( 'DESCRICAO' ).AsString := Copy( Descricao, 1, 150 );
                             Query.ParamByName( 'NACIONAL' ).AsFloat := FederalNacional;
                             Query.ParamByName( 'IMPORTADO' ).AsFloat := FederalImportado;
                             Query.ParamByName( 'ESTADUAL' ).AsFloat := Estadual;
                             Query.ParamByName( 'MUNICIPAL' ).AsFloat := Municipal;
                             Query.ParamByName( 'DT_INI' ).AsDate := OpenIBPT.VigenciaInicio;
                             Query.ParamByName( 'DT_FIM' ).AsDate := OpenIBPT.VigenciaFim;
                          end;
                      Query.ExecSQL;
                  except

                  end;
                  Inc( Atualizados );
                  if Atualizados >= Cache then
                  if Transaction.Active then
                     begin
                        Transaction.CommitRetaining;
                        Atualizados := 0;
                     end;
                  if TThread.CheckTerminated then
                     Break;
               end;
       finally
           if Transaction.Active then
              Transaction.Commit;
       end;
   finally
      OpenIBPT.Free;
      Query.Free;
      Transaction.Free;
      Conec.Free;
   end;
end;
{$ENDREGION}

end.



