unit UformResumos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxCustomTileControl,
  cxClasses, dxTileControl, ShellAPI ;

type
  TfrmResumos = class(TForm)
    dxTile: TdxTileControl;
    tcaExit: TdxTileControlActionBarItem;
    tcaBlackTheme: TdxTileControlActionBarItem;
    tcaWhiteTheme: TdxTileControlActionBarItem;
    tcaClearSelection: TdxTileControlActionBarItem;
    tcaMakeTileItemLarger: TdxTileControlActionBarItem;
    tcaMakeTileItemSmaller: TdxTileControlActionBarItem;
    GrupoRapido: TdxTileControlGroup;
    dxTiledxTileControlGroup2: TdxTileControlGroup;
    tlStatistics: TdxTileControlItem;
    tlLoanCalculator: TdxTileControlItem;
    tltarefas: TdxTileControlItem;
    dxTileItem1: TdxTileControlItem;
    dxTileItem2: TdxTileControlItem;
    dxTileItem5: TdxTileControlItem;
    dxTileItem3: TdxTileControlItem;
    dxTileItem4: TdxTileControlItem;
    dxTileItem6: TdxTileControlItem;
    dxTileItem7: TdxTileControlItem;
    dxTileItem8: TdxTileControlItem;
    dxTileItem9: TdxTileControlItem;
    dxTileItem10: TdxTileControlItem;
    dxTileItem11: TdxTileControlItem;
    dxTileItem12: TdxTileControlItem;
    dxTileItem13: TdxTileControlItem;
    dxTileItem16: TdxTileControlItem;
    dxTileItem17: TdxTileControlItem;
    dxTileItem18: TdxTileControlItem;
    dxTileItem19: TdxTileControlItem;
    dxTileItem14: TdxTileControlItem;
    dxTileItem15: TdxTileControlItem;
    procedure tltarefasActivateDetail(Sender: TdxTileControlItem);
    procedure tlStatisticsActivateDetail(Sender: TdxTileControlItem);
    procedure dxTileItem1Click(Sender: TdxTileControlItem);
    procedure dxTileItem2Click(Sender: TdxTileControlItem);
    procedure dxTileItem5Click(Sender: TdxTileControlItem);
    procedure dxTileItem3Click(Sender: TdxTileControlItem);
    procedure dxTileItem4Click(Sender: TdxTileControlItem);
    procedure dxTileItem6Click(Sender: TdxTileControlItem);
    procedure dxTileItem8Click(Sender: TdxTileControlItem);
    procedure dxTileItem7Click(Sender: TdxTileControlItem);
    procedure dxTileItem9Click(Sender: TdxTileControlItem);
    procedure dxTileItem10Click(Sender: TdxTileControlItem);
    procedure dxTileItem11Click(Sender: TdxTileControlItem);
    procedure dxTileItem18Click(Sender: TdxTileControlItem);
    procedure dxTileItem12Click(Sender: TdxTileControlItem);
    procedure dxTileItem19Click(Sender: TdxTileControlItem);
    procedure dxTileItem17Click(Sender: TdxTileControlItem);
    procedure dxTileItem13Click(Sender: TdxTileControlItem);
    procedure dxTileItem16Click(Sender: TdxTileControlItem);
    procedure dxTileItem14Click(Sender: TdxTileControlItem);
    procedure dxTileItem15Click(Sender: TdxTileControlItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumos: TfrmResumos;

implementation

{$R *.dfm}

uses UTSP, UEstatisticas, UNovoPrincipal, UCadCli, UCadProduto, UNotaFiscal,
  UOS, UGerenciamentoNFe, UCadFor, UDM, UCadEmp, UCadTransp, UCadVend,
  UCadNewCaixa, UCadCheque, UContasReceber, UContasPagar, ULancCC, UCadUsuario,
  UVenda, UEntradas;

procedure TfrmResumos.dxTileItem10Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmCadTransp, False );
end;

procedure TfrmResumos.dxTileItem11Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmCadVend, False );
end;

procedure TfrmResumos.dxTileItem12Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmCadCheque, False );
end;

procedure TfrmResumos.dxTileItem13Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmLancCC, False );
end;

procedure TfrmResumos.dxTileItem14Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmVenda, False );
end;

procedure TfrmResumos.dxTileItem15Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmEntradas, False );
end;

procedure TfrmResumos.dxTileItem16Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmCadUsu, False );
end;

procedure TfrmResumos.dxTileItem17Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmContasPagar, False );
end;

procedure TfrmResumos.dxTileItem18Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TfrmCadNewCaixa, False );
end;

procedure TfrmResumos.dxTileItem19Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmLancContasReceber, False );
end;

procedure TfrmResumos.dxTileItem1Click(Sender: TdxTileControlItem);
begin
   frmMenu.FTDI.MostrarFormulario( TFrmCadCli, False );
end;

procedure TfrmResumos.dxTileItem2Click(Sender: TdxTileControlItem);
begin
   frmMenu.FTDI.MostrarFormulario( TFrmCadProduto, False );
end;

procedure TfrmResumos.dxTileItem3Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TfrmCadOS, False );
end;

procedure TfrmResumos.dxTileItem4Click(Sender: TdxTileControlItem);
begin
   frmMenu.FTDI.MostrarFormulario( TFrmGerenciamentoNFe, False );
end;

procedure TfrmResumos.dxTileItem5Click(Sender: TdxTileControlItem);
begin
   frmMenu.FTDI.MostrarFormulario( TFrmNotaFiscal, False );
end;

procedure TfrmResumos.dxTileItem6Click(Sender: TdxTileControlItem);
begin
  frmMenu.FTDI.MostrarFormulario( TFrmCadFor, False );
end;

procedure TfrmResumos.dxTileItem7Click(Sender: TdxTileControlItem);
begin
  //ShellExecute(handle,'open',PChar('C:\Caiman\CaimanBalcao.exe'), '','',SW_SHOWNORMAL);
end;

procedure TfrmResumos.dxTileItem8Click(Sender: TdxTileControlItem);
var
  NomeArquivo: String;
begin
  //NomeArquivo := 'C:\CaimanBalcao\CaimanNFCe.exe';
  //ShellExecute(handle, 'open', PChar(NomeArquivo), Nil, Nil, SW_SHOWNORMAL);
end;

procedure TfrmResumos.dxTileItem9Click(Sender: TdxTileControlItem);
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
  frmMenu.FTDI.MostrarFormulario( TFrmCadEmp, False );
end;

procedure TfrmResumos.tlStatisticsActivateDetail(Sender: TdxTileControlItem);
begin
   if tlStatistics.DetailOptions.DetailControl = nil then
      tlStatistics.DetailOptions.DetailControl := TfrmEstatisticas.Create( nil );
   TfrmEstatisticas( tlStatistics.DetailOptions.DetailControl ).AtualizaResumo;
end;

procedure TfrmResumos.tltarefasActivateDetail(Sender: TdxTileControlItem);
begin
   if tltarefas.DetailOptions.DetailControl = nil then
      tltarefas.DetailOptions.DetailControl := TfrmTSP.Create( nil );
//   tltarefas.ActivateDetail;
end;

end.
