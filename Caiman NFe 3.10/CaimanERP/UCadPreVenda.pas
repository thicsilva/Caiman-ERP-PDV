unit UCadPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadNovoDB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxClasses, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxButtons, Vcl.Mask, Vcl.ComCtrls, cxTextEdit, cxCurrencyEdit, cxLabel,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ToolWin, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.Buttons, sSpeedButton,
  cxDBEdit, RxToolEdit, RxCurrEdit, Vcl.Grids, Vcl.DBGrids, System.Math,
  RzPanel, RzDBNav;

type
  TfrmCadPreVenda = class(TfrmCadNovoDB)
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxVisualizaDBTableView1Column2: TcxGridDBColumn;
    QCliente: TFDQuery;
    QClienteCOD_CLI: TIntegerField;
    QClienteNOME_CLI: TStringField;
    dsCliente: TDataSource;
    edtCodCliente: TcxDBTextEdit;
    Label14: TLabel;
    BtnConsCliFor: TsSpeedButton;
    BtnAddCliFor: TsSpeedButton;
    Label3: TLabel;
    cxDBCODIGO_CLI: TcxDBLookupComboBox;
    QPrincipalCOD_PRE: TIntegerField;
    QPrincipalDATA_PRE: TDateField;
    QPrincipalCOD_CLI: TIntegerField;
    QPrincipalCOD_TPV: TIntegerField;
    QPrincipalCOD_EMP: TIntegerField;
    QPrincipalSTATUS_PRE: TIntegerField;
    QPrincipalTOTAL_PRE: TBCDField;
    QPrincipalHORA_PRE: TTimeField;
    QPrincipalCOD_VENDA: TIntegerField;
    QPrincipalDOCUMENTO: TStringField;
    QPrincipalOBS_PRE: TStringField;
    QPrincipalDESCONTO_PRE: TBCDField;
    QPrincipalCOD_VEND: TIntegerField;
    QPrincipalSEQUENCIA_PAF: TLargeintField;
    QPrincipalSENHA_FECHAR_VENDA: TStringField;
    QPrincipalCHAVE: TStringField;
    QPrincipalNOME_CLI: TStringField;
    edtCodVendedor: TcxDBTextEdit;
    Label1: TLabel;
    BtnConsVend: TsSpeedButton;
    BtnAddVend: TsSpeedButton;
    Label2: TLabel;
    cxDBCODIGO_VEND: TcxDBLookupComboBox;
    dsVendedor: TDataSource;
    QVendedor: TFDQuery;
    QVendedorCOD_VEND: TIntegerField;
    QVendedorNOME_VEND: TStringField;
    edtCodTipoVenda: TcxDBTextEdit;
    Label4: TLabel;
    BtnConsTipoVenda: TsSpeedButton;
    BtnAddTipoVenda: TsSpeedButton;
    Label5: TLabel;
    cxDBCODIGO_TIPOVENDA: TcxDBLookupComboBox;
    QTipoVenda: TFDQuery;
    dsTipoVenda: TDataSource;
    QTipoVendaCOD_TPV: TIntegerField;
    QTipoVendaNOME_TPV: TStringField;
    QBuscaItens: TFDQuery;
    QBuscaItensCOD_PRE: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensDESCRICAO: TStringField;
    DSBuscaItens: TDataSource;
    Panel4: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    edtProduto: TcxDBTextEdit;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    QItensPre: TFDQuery;
    dsItensPre: TDataSource;
    QItensPreCOD_PRE: TIntegerField;
    QItensPreORDEM: TIntegerField;
    QItensPreCOD_PRO: TIntegerField;
    QItensPreDESCONTO: TBCDField;
    QItensPreCOD_EMP: TIntegerField;
    QItensPreQUANT: TBCDField;
    QItensPreVALOR: TBCDField;
    QItensPrePRODUTO_PROMOCAO: TStringField;
    QItensPreCANCELADO: TIntegerField;
    QItensPreCHAVE: TStringField;
    EdtQuant: TcxDBTextEdit;
    EdtValorUnit: TcxDBTextEdit;
    EdtDescPerc: TCurrencyEdit;
    EdtDescVr: TcxDBTextEdit;
    RzDBNavigator1: TRzDBNavigator;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosNOME_PRO: TStringField;
    QProdutosVALOR_PRO: TBCDField;
    dsProduto: TDataSource;
    QItensPreTOTAL_GERAL: TFloatField;
    QItensPreTOTAL: TFloatField;
    EdtTotalProd: TcxDBTextEdit;
    EdtTotalBR: TcxDBTextEdit;
    qTotal: TFDQuery;
    qTotalTOTAL: TFMTBCDField;
    Label7: TLabel;
    cxVisualizaDBTableView1Column3: TcxGridDBColumn;
    cxDBTextEdit2: TcxDBTextEdit;
    cxVisualizaDBTableView1Column4: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnConsCliForClick(Sender: TObject);
    procedure BtnAddCliForClick(Sender: TObject);
    procedure BtnConsVendClick(Sender: TObject);
    procedure BtnAddVendClick(Sender: TObject);
    procedure BtnConsTipoVendaClick(Sender: TObject);
    procedure BtnAddTipoVendaClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure EdtQuantExit(Sender: TObject);
    procedure EdtDescPercExit(Sender: TObject);
    procedure EdtDescVrExit(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure QPrincipalNewRecord(DataSet: TDataSet);
    procedure QItensPreNewRecord(DataSet: TDataSet);
    procedure PageEditShow(Sender: TObject);
    procedure QItensPreCalcFields(DataSet: TDataSet);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure RzDBNavigator1Click(Sender: TObject; Button: TRzNavigatorButton);
    procedure edtCodTipoVendaExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtTotalBRExit(Sender: TObject);
    procedure EdtTotalProdExit(Sender: TObject);
  private
    function PrxcodItemPre : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPreVenda: TfrmCadPreVenda;

implementation

{$R *.dfm}

uses UConsCli, UNovoPrincipal, UCadCli, UConsVend, UCadVend, UConsTipoVenda,
  UCadTipoVenda, UConsProd, UDM, Ubibli1;

procedure TfrmCadPreVenda.BtnAddCliForClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TfrmCadPreVenda.BtnAddTipoVendaClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadTipoVenda, True );
end;

procedure TfrmCadPreVenda.BtnAddVendClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadVend, True );
end;

procedure TfrmCadPreVenda.BtnConsCliForClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag := 48;
  FrmConsCli.ShowModal;
  QPrincipalCOD_CLI.AsInteger := FrmConsCli._Cli;
  edtCodCliente.SetFocus;
end;

procedure TfrmCadPreVenda.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 34;
  FrmConsProd.ShowModal;
  QItensPre.Edit;
  QItensPreCOD_PRO.AsInteger := FrmConsProd._CodPro;
  QItensPreVALOR.AsFloat := QProdutosVALOR_PRO.AsFloat;
  edtProduto.SetFocus;
end;

procedure TfrmCadPreVenda.BtnConsTipoVendaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.tag := 11;
  FrmConsTipoVenda.ShowModal;
  QPrincipalCOD_TPV.AsInteger := FrmConsTipoVenda._TipoVenda;
  edtCodTipoVenda.SetFocus;
end;

procedure TfrmCadPreVenda.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  QPrincipal.Close;
  QPrincipal.SQL.Clear;
  QPrincipal.SQL.Add('SELECT P.*, C.NOME_CLI '+
                     '   FROM PRE_VENDA P LEFT OUTER JOIN CLIENTE C ON(P.COD_CLI = C.COD_CLI) '+
                     '  WHERE UPPER(C.NOME_CLI) LIKE UPPER(''%'+edtMask.Text+'%'') '+
                     '   ORDER BY C.NOME_CLI, P.DATA_PRE ');
  QPrincipal.Open;
end;

procedure TfrmCadPreVenda.edtCodTipoVendaExit(Sender: TObject);
begin
  inherited;
  BtnGravarClick(Sender);
  BtnAlterarClick(Sender);
  edtProduto.SetFocus;
end;

procedure TfrmCadPreVenda.EdtDescPercExit(Sender: TObject);
begin
  inherited;
  if StrToCurr(EdtDescPerc.text) > 0 then
  begin
    EdtDescVr.text :=  currtostr
      ( RoundTo( ( RoundTo( (StrToCurr(EdtQuant.text) * StrToCurr(EdtValorUnit.text)), -2 ) * StrToCurr
          (EdtDescPerc.text)) / 100, -2 ));
  end;
end;

procedure TfrmCadPreVenda.EdtDescVrExit(Sender: TObject);
begin
  inherited;
  EdtTotalProd.text := currtostr
    ( RoundTo( RoundTo( (QItensPreQUANT.AsFloat * QItensPreVALOR.AsFloat), -2 ) - QItensPreDESCONTO.AsFloat , -2 ) );

end;

procedure TfrmCadPreVenda.edtProdutoExit(Sender: TObject);
begin
  inherited;
  QItensPre.Edit;
  QItensPreVALOR.AsFloat := QProdutosVALOR_PRO.AsFloat;
end;

procedure TfrmCadPreVenda.EdtQuantExit(Sender: TObject);
begin
  inherited;
  if QItensPre.State in [dsInsert, dsEdit] then
    QItensPreVALOR.AsFloat := QProdutosVALOR_PRO.AsFloat;
  EdtQuant.SetFocus;
end;

procedure TfrmCadPreVenda.EdtTotalBRExit(Sender: TObject);
begin
  inherited;
  EdtTotalProd.text := currtostr
    ( RoundTo( RoundTo( (QItensPreQUANT.AsFloat * QItensPreVALOR.AsFloat), -2 ) - QItensPreDESCONTO.AsFloat , -2 ) );
end;

procedure TfrmCadPreVenda.EdtTotalProdExit(Sender: TObject);
begin
  inherited;
  EdtDescVrExit(Sender);
end;

procedure TfrmCadPreVenda.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  if QItensPre.State = dsBrowse then
    QItensPre.Edit;
  QItensPreTOTAL.AsFloat := QItensPreQUANT.AsFloat * QItensPreVALOR.AsFloat;
  QItensPreTOTAL_GERAL.AsFloat := QItensPreTOTAL.AsFloat - QItensPreDESCONTO.AsFloat;
end;

procedure TfrmCadPreVenda.FormShow(Sender: TObject);
begin
  inherited;
  QPrincipal.Open;
  QCliente.Open;
  QVendedor.Open;
  QTipoVenda.Open;
  QProdutos.Open;
end;

procedure TfrmCadPreVenda.PageEditShow(Sender: TObject);
begin
  inherited;
  QCliente.Open;
  QVendedor.Open;
  QTipoVenda.Open;
  QProdutos.Open;
  QItensPre.Close;
  QItensPre.Params[0].AsInteger := QPrincipalCOD_PRE.AsInteger;
  QItensPre.Open;
  QBuscaItens.Close;
  QBuscaItens.Params[0].AsInteger := QPrincipalCOD_PRE.AsInteger;;
  QBuscaItens.Open;

end;


procedure TfrmCadPreVenda.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensCALC_TOTAL.AsFloat := (QBuscaItensQUANT.AsFloat * QBuscaItensVALOR.AsFloat)- QItensPreDESCONTO.AsFloat;
  qTotal.Close;
  qTotal.Params[0].AsInteger := QPrincipalCOD_PRE.AsInteger;
  qTotal.Open;
  QPrincipal.Edit;
  QPrincipalTOTAL_PRE.AsFloat := qTotalTOTAL.AsFloat;
end;

procedure TfrmCadPreVenda.QItensPreCalcFields(DataSet: TDataSet);
begin
  inherited;
  QItensPreTOTAL.AsFloat := QItensPreQUANT.AsFloat * QItensPreVALOR.AsFloat;
  QItensPreTOTAL_GERAL.AsFloat := QItensPreTOTAL.AsFloat - QItensPreDESCONTO.AsFloat;
end;

procedure TfrmCadPreVenda.QItensPreNewRecord(DataSet: TDataSet);
begin
  inherited;
  QItensPreCOD_PRE.AsInteger := QPrincipalCOD_PRE.AsInteger;
  QItensPreCOD_EMP.AsInteger := QPrincipalCOD_EMP.AsInteger;
  QItensPreORDEM.AsInteger := PrxcodItemPre;
  QItensPrePRODUTO_PROMOCAO.AsString := 'N';
  QItensPreCANCELADO.AsInteger := 0;
  QItensPreTOTAL.AsFloat := 0;
  QItensPreTOTAL_GERAL.AsFloat := 0;
  QItensPreDESCONTO.AsFloat := 0;
end;

procedure TfrmCadPreVenda.QPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QPrincipalCOD_PRE.AsInteger :=  prxcod('PRE_VENDA', 'COD_PRE', dm.IBTransaction, dm.ibsqlcod);
  QPrincipalSTATUS_PRE.AsInteger := 0;
  QPrincipalDATA_PRE.AsDateTime := Date;
  QPrincipalHORA_PRE.AsDateTime := Time;
  QPrincipalSEQUENCIA_PAF.AsInteger := 0;
  QPrincipalCOD_EMP.AsInteger := iEmp;
  QPrincipalSENHA_FECHAR_VENDA.AsInteger := QPrincipalCOD_PRE.AsInteger;
end;

procedure TfrmCadPreVenda.RzDBNavigator1Click(Sender: TObject;
  Button: TRzNavigatorButton);
begin
  if Button = nbInsert then
    edtProduto.SetFocus;
  if ((Button = nbPost) or (Button = nbDelete)) then
    begin
      BtnGravarClick(Sender);
      QBuscaItens.Close;
      QBuscaItens.Params[0].AsInteger := QPrincipalCOD_PRE.AsInteger;;
      QBuscaItens.Open;
      BtnAlterarClick(Sender);
    end;

end;

procedure TfrmCadPreVenda.BtnConsVendClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag := 8;
  FrmConsVend.ShowModal;
  QPrincipalCOD_VEND.AsInteger := FrmConsVend._Vend;
  edtCodVendedor.SetFocus;
end;

procedure TfrmCadPreVenda.BtnNovoClick(Sender: TObject);
begin
  inherited;
  edtCodCliente.SetFocus;
end;

function TfrmCadPreVenda.PrxcodItemPre : integer;
var ibsqlCod : TFDQuery;
begin
  ibsqlCod := TFDQuery.Create(NIL);
  with ibsqlCod do
    begin
      Connection := DM.IBDatabase;
      close;
      sql.Clear;
      sql.Text:= 'SELECT MAX(ORDEM) AS PRXCOD FROM ITENS_PRE_VENDA WHERE COD_PRE = '+QItensPreCOD_PRE.AsString;
      ExecOrOpen;
      result:= Fieldbyname('prxcod').AsInteger + 1;
      ibsqlCod.Close;
    end;
end;

end.
