unit UCadTrocas;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ToolWin, Vcl.Buttons, sLabel, Vcl.DBCtrls,
  cxDBEdit, sSpeedButton, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, RzPanel, RzDBNav, frxClass, frxDBSet;

type
  TfrmCadTrocas = class(TfrmCadNovoDB)
    QPrincipalCOD_TROCA: TIntegerField;
    QPrincipalDATA_TROCA: TDateField;
    QPrincipalTROCADO: TStringField;
    QPrincipalTRC: TStringField;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    btnEfetivar: TSpeedButton;
    QItensVenda: TFDQuery;
    dsItensVenda: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    QItensVendaCOD_VEN: TIntegerField;
    QItensVendaCOD_PRO: TIntegerField;
    QItensVendaORDEM: TIntegerField;
    QItensVendaCOD_EMP: TIntegerField;
    QItensVendaNOME_PRO: TStringField;
    QItensVendaQUANT: TBCDField;
    QEntrada: TFDQuery;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
    QSaida: TFDQuery;
    QEntradaCOD_VEN: TIntegerField;
    QEntradaCOD_PRO: TIntegerField;
    QEntradaORDEM: TIntegerField;
    QEntradaCOD_EMP: TIntegerField;
    QEntradaNOME_PRO: TStringField;
    QEntradaQUANTIDADE: TFloatField;
    QSaidaCOD_VEN: TIntegerField;
    QSaidaCOD_PRO: TIntegerField;
    QSaidaORDEM: TIntegerField;
    QSaidaCOD_EMP: TIntegerField;
    QSaidaNOME_PRO: TStringField;
    QSaidaQUANTIDADE: TFloatField;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    QPrincipalCOD_EMP: TIntegerField;
    QItensTroca: TFDQuery;
    QItensTrocaCOD_ITEMTROCA: TIntegerField;
    QItensTrocaCOD_TROCA: TIntegerField;
    QItensTrocaCOD_VEN: TIntegerField;
    QItensTrocaORDEM: TIntegerField;
    QItensTrocaQUANTIDADE: TFloatField;
    QItensTrocaENTRADA_SAIDA: TStringField;
    QItensTrocaVALOR: TFloatField;
    QItensTrocaCOD_EMP: TIntegerField;
    QItensTrocaCOD_PRO: TIntegerField;
    QItensVendaVALOR: TBCDField;
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxVisualizaDBTableView1Column2: TcxGridDBColumn;
    QPrincipalCOD_VEN: TIntegerField;
    edVenda: TDBEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    BtnAddPro: TsSpeedButton;
    BtnConsPro: TsSpeedButton;
    edtProduto: TcxDBTextEdit;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosNOME_PRO: TStringField;
    QProdutosVALOR_PRO: TBCDField;
    dsProduto: TDataSource;
    dsItensTroca: TDataSource;
    RzDBNavigator1: TRzDBNavigator;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    QItensVendaTOTAL_VEN: TBCDField;
    QEntradaVALOR: TFloatField;
    DBEdit2: TDBEdit;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    DBEdit3: TDBEdit;
    QSaidaVALOR: TFloatField;
    QTotalEntrada: TFDQuery;
    dsTotalEntrada: TDataSource;
    QTotalEntradaTOTAL: TFloatField;
    dsTotalSaida: TDataSource;
    QTotalSaida: TFDQuery;
    dsDiferenca: TDataSource;
    QDiferenca: TFDQuery;
    DBEdit4: TDBEdit;
    QEntradaCOD_ITEMTROCA: TIntegerField;
    QSaidaCOD_ITEMTROCA: TIntegerField;
    spEstoque: TFDStoredProc;
    cxVisualizaDBTableView1Column3: TcxGridDBColumn;
    frxTroca: TfrxReport;
    frxItensTroca: TfrxDBDataset;
    QItensTroc: TFDQuery;
    QItensTrocCOD_ITEMTROCA: TIntegerField;
    QItensTrocCOD_VEN: TIntegerField;
    QItensTrocCOD_PRO: TIntegerField;
    QItensTrocORDEM: TIntegerField;
    QItensTrocCOD_EMP: TIntegerField;
    QItensTrocNOME_PRO: TStringField;
    QItensTrocQUANTIDADE: TFloatField;
    QItensTrocVALOR: TFloatField;
    QItensTrocVALOR_TOTAL: TFloatField;
    QItensTrocENTRADASAIDA: TStringField;
    ToolButton2: TToolButton;
    QDiferencaTOTAL: TFloatField;
    QTotalSaidaTOTAL: TFloatField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure edVendaExit(Sender: TObject);
    procedure edVendaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure QPrincipalNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure PageEditShow(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzDBNavigator1Click(Sender: TObject; Button: TRzNavigatorButton);
    procedure edtProdutoExit(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
    procedure btnEfetivarClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    procedure ExecutaSQL(SQLS : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTrocas: TfrmCadTrocas;

implementation

{$R *.dfm}

uses UDM, Ubibli1, UConsCli, UCadCli, UNovoPrincipal, UCadProduto, UConsProd;

procedure TfrmCadTrocas.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TfrmCadTrocas.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 34;
  FrmConsProd.ShowModal;
  QItensTroca.Open;
  QItensTroca.Edit;
  QItensTrocaCOD_PRO.AsInteger := FrmConsProd._CodPro;
  edtProduto.SetFocus;
end;

procedure TfrmCadTrocas.btnEfetivarClick(Sender: TObject);
begin
  //da entrada nos produtos devolvidos
  QEntrada.First;
  while not QEntrada.Eof do
    begin
      spEstoque.Prepare;
      spEstoque.ParamByName('CODEMP').AsInteger := iEmp;
      spEstoque.ParamByName('CODPRO').AsInteger := QEntradaCOD_PRO.AsInteger;
      spEstoque.ParamByName('QUANT').AsFMTBCD := QEntradaQUANTIDADE.Value;
      spEstoque.ParamByName('LOCAL').AsInteger := 1;
      spEstoque.ExecProc;
      QEntrada.Next;
    end;

  //da saida nos produtos levados
  QSaida.First;
  while not QSaida.Eof do
    begin
      spEstoque.Prepare;
      spEstoque.Params[0].AsInteger := iEmp;
      spEstoque.Params[1].AsInteger := QSaidaCOD_PRO.AsInteger;
      spEstoque.Params[2].AsFMTBCD := QSaidaQUANTIDADE.Value * -1;
      spEstoque.Params[3].AsInteger := 1;
      spEstoque.ExecProc;
      QSaida.Next;
    end;
  QPrincipalTROCADO.AsString := 'S';
  BtnGravarClick(Sender);
  PageConsulta.Show;
end;

procedure TfrmCadTrocas.btnPesquisarClick(Sender: TObject);
var Data : String;
begin
  inherited;
  Data := Copy(edtMask.Text,1,2)+'/'+Copy(edtMask.Text,3,2)+'/'+Copy(edtMask.Text,5,4);
  QPrincipal.Close;
  QPrincipal.SQL.Clear;
  QPrincipal.SQL.Add('SELECT COD_TROCA, DATA_TROCA, TROCADO, CASE WHEN TROCADO = ''S'' THEN ''Sim'' ELSE ''Não'' END AS TRC  '+
                     '  FROM TROCAS '+
                     ' WHERE DATA_TROCA = '''+FormatDateTime('DD.MM.YYYY', StrToDate(Data))+''' '+
                     ' ORDER BY DATA_TROCA DESC ');
  QPrincipal.Open;

end;

procedure TfrmCadTrocas.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var Quantidade : Integer;
begin
  inherited;
  BtnGravarClick(Sender);
  BtnAlterarClick(Sender);
  QItensTroca.Open;
  Quantidade := StrToInt(InputBox('Quantidade a ser devolvida', 'Quantidade',QItensVendaQUANT.AsString));
  if Quantidade > QItensVendaQUANT.AsFloat then
    begin
      MessageDlg('Quantidade não permitida ! Maior que a vendida !', mtInformation, [mbOK],0);
      Exit;
    end;
  QItensTroca.Append;
  QItensTrocaCOD_ITEMTROCA.AsInteger := prxcod('ITENS_TROCA', 'COD_ITEMTROCA', dm.IBTransaction, dm.ibsqlcod);
  QItensTrocaCOD_TROCA.AsInteger := QPrincipalCOD_TROCA.AsInteger;
  QItensTrocaCOD_VEN.AsInteger := QItensVendaCOD_VEN.AsInteger;
  QItensTrocaORDEM.AsInteger := QItensVendaORDEM.AsInteger;
  QItensTrocaQUANTIDADE.AsInteger := Quantidade;
  QItensTrocaENTRADA_SAIDA.AsString := 'E';
  QItensTrocaVALOR.AsFloat := QItensVendaVALOR.AsFloat;
  QItensTrocaCOD_EMP.AsInteger := iEmp;
  QItensTrocaCOD_PRO.AsInteger := QItensVendaCOD_PRO.AsInteger;
  QItensTroca.Post;
  TRPrincipal.CommitRetaining;
  edVendaExit(Sender);
end;

procedure TfrmCadTrocas.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ExecutaSQL('DELETE FROM ITENS_TROCA WHERE COD_ITEMTROCA = '+QEntradaCOD_ITEMTROCA.AsString);
  edVendaExit(Sender);
end;

procedure TfrmCadTrocas.cxGridDBTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ExecutaSQL('DELETE FROM ITENS_TROCA WHERE COD_ITEMTROCA = '+QSaidaCOD_ITEMTROCA.AsString);
  edVendaExit(Sender);
end;

procedure TfrmCadTrocas.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnEfetivar.Enabled := QPrincipalTROCADO.AsString = 'N';
  dsItensTroca.AutoEdit := QPrincipalTROCADO.AsString = 'N';
  cxGrid1.Enabled := QPrincipalTROCADO.AsString = 'N';
  cxGrid2.Enabled := QPrincipalTROCADO.AsString = 'N';
  cxGrid3.Enabled := QPrincipalTROCADO.AsString = 'N';
  RzDBNavigator1.Enabled := QPrincipalTROCADO.AsString = 'N';
end;

procedure TfrmCadTrocas.edtProdutoExit(Sender: TObject);
begin
  inherited;
  //QItensTrocaORDEM.AsInteger := QItensVendaORDEM.AsInteger;
  QItensTrocaVALOR.AsFloat := QProdutosVALOR_PRO.AsFloat;
  cxDBLookupComboBox1.SetFocus;
end;

procedure TfrmCadTrocas.edVendaExit(Sender: TObject);
begin
  inherited;
  QItensVenda.Close;
  QItensVenda.Params[0].AsInteger := iEmp;
  QItensVenda.Params[1].AsInteger := StrToInt(edVenda.Text);
  QItensVenda.Open;
  QEntrada.Close;
  QEntrada.Params[0].AsInteger := iEmp;
  QEntrada.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
  QEntrada.Open;
  QSaida.Close;
  QSaida.Params[0].AsInteger := iEmp;
  QSaida.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
  QSaida.Open;
  QTotalEntrada.Close;
  QTotalEntrada.Params[0].AsInteger := iEmp;
  QTotalEntrada.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
  QTotalEntrada.Open;
  QTotalSaida.Close;
  QTotalSaida.Params[0].AsInteger := iEmp;
  QTotalSaida.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
  QTotalSaida.Open;
  QDiferenca.Close;
  QDiferenca.Params[0].AsInteger := iEmp;
  QDiferenca.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
  QDiferenca.Open;

  QItensTroca.Open;
end;

procedure TfrmCadTrocas.edVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      edVendaExit(Sender);
    end;
end;

procedure TfrmCadTrocas.FormCreate(Sender: TObject);
begin
  inherited;
  QPrincipal.Open;
  QItensTroca.Open;
  edtMask.Text := FormatDateTime('ddmmyyyy', Date);
end;

procedure TfrmCadTrocas.FormShow(Sender: TObject);
begin
  inherited;
  QProdutos.Open;
end;

procedure TfrmCadTrocas.PageEditShow(Sender: TObject);
begin
  inherited;
  if QPrincipalCOD_VEN.AsInteger > 0 then
    edVendaExit(Sender);
end;

procedure TfrmCadTrocas.QPrincipalNewRecord(DataSet: TDataSet);
begin
  QPrincipalCOD_TROCA.AsInteger := prxcod('TROCAS', 'COD_TROCA', dm.IBTransaction, dm.ibsqlcod);
  QPrincipalDATA_TROCA.AsDateTime := Date;
  QPrincipalTROCADO.AsString := 'N';
  QPrincipalCOD_EMP.AsInteger := iEmp;
end;



procedure TfrmCadTrocas.RzDBNavigator1Click(Sender: TObject;
  Button: TRzNavigatorButton);
var Quantidade : Integer;
begin
  QProdutos.Open;
  if Button = nbInsert then
    begin
      Quantidade := StrToInt(InputBox('Quantidade a ser devolvida', 'Quantidade','1'));
      QItensTrocaCOD_ITEMTROCA.AsInteger := prxcod('ITENS_TROCA', 'COD_ITEMTROCA', dm.IBTransaction, dm.ibsqlcod);
      QItensTrocaCOD_TROCA.AsInteger := QPrincipalCOD_TROCA.AsInteger;
      QItensTrocaCOD_VEN.AsInteger := QPrincipalCOD_VEN.AsInteger;
      QItensTrocaQUANTIDADE.AsInteger := Quantidade;
      QItensTrocaENTRADA_SAIDA.AsString := 'S';

      QItensTrocaCOD_EMP.AsInteger := iEmp;
      edtProduto.SetFocus;
    end;
  if Button = nbPost then
    begin
      BtnGravarClick(Sender);
      edVendaExit(Sender);
      BtnAlterarClick(Sender);
    end;
  if Button = nbDelete then
    edVendaExit(Sender);
end;


procedure TfrmCadTrocas.ToolButton2Click(Sender: TObject);
var
   RelFile: String;
begin
   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\Troca.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo Troca.fr3 não encontrado!' );
         Exit;
      end;
   frxTroca.LoadFromFile( RelFile );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   QItensTroc.Close;
   QItensTroc.Params[0].AsInteger := QPrincipalCOD_EMP.AsInteger;
   QItensTroc.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
   QItensTroc.Open;
   QTotalEntrada.Close;
   QTotalEntrada.Params[0].AsInteger := iEmp;
   QTotalEntrada.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
   QTotalEntrada.Open;
   QTotalSaida.Close;
   QTotalSaida.Params[0].AsInteger := iEmp;
   QTotalSaida.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
   QTotalSaida.Open;
   QDiferenca.Close;
   QDiferenca.Params[0].AsInteger := iEmp;
   QDiferenca.Params[1].AsInteger := QPrincipalCOD_VEN.AsInteger;
   QDiferenca.Open;

   // DADOS DA EMPRESA
   dm.QConsulta.Close;
   dm.QConsulta.SQL.text := 'select e.*, P.OBSERVACAO_OS '+
   ' from EMPRESA e ' +
   ' left outer join parametros p '+
   ' on ( p.cod_emp = e.cod_emp ) '+
   'where e.COD_EMP=:CODEMP';
   dm.QConsulta.ParamByName('CODEMP').AsInteger := iEmp;
   dm.QConsulta.Open;
   if dm.QConsulta.IsEmpty then
      begin
         AlertaCad( 'Erro ao buscar dados da empresa' );
         dm.QConsulta.Close;
         dm.IBTransaction.Commit;
         exit;
      end;
   frxTroca.Variables['razao_emp'] := QuotedStr( dm.QConsulta.FieldByName('RAZAO_EMP').AsString );
   frxTroca.Variables['endereco_emp'] := QuotedStr( dm.QConsulta.FieldByName('END_EMP').AsString );
   frxTroca.Variables['numero_emp'] := QuotedStr( dm.QConsulta.FieldByName('NUMERO_EMP').AsString );
   frxTroca.Variables['cep_emp'] := QuotedStr( dm.QConsulta.FieldByName('CEP_EMP').AsString );
   frxTroca.Variables['cid_emp'] := QuotedStr( dm.QConsulta.FieldByName('CID_EMP').AsString );
   frxTroca.Variables['estado_emp'] := QuotedStr( dm.QConsulta.FieldByName('EST_EMP').AsString );
   frxTroca.Variables['tel_emp'] := QuotedStr( dm.QConsulta.FieldByName('TEL_EMP').AsString );
   frxTroca.Variables['logo'] := QuotedStr( dm.QConsulta.FieldByName('caminho_foto_emp').AsString );
   dm.QConsulta.Close;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   dm.QConsulta.Close;

   dm.IBTransaction.Commit;
   //frxOS.Variables['maoobra'] := QuotedStr( FormatFloat('###,###,##0.00', QPrincipalVALOR_SERVICOS.AsFloat ));
   frxTroca.Variables['total_geral'] := QuotedStr( FormatFloat('###,###,##0.00', QDiferencaTOTAL.AsFloat ));
   frxTroca.Variables['totalentrada'] := QuotedStr( FormatFloat('###,###,##0.00', QTotalEntradaTOTAL.AsFloat ));
   frxTroca.Variables['totalsaida'] := QuotedStr( FormatFloat('-###,###,##0.00',QTotalSaidaTOTAL.AsFloat));

   frxTroca.ShowReport( true );
end;

procedure TfrmCadTrocas.ExecutaSQL(SQLS : String);
var ibsqlCod : TFDQuery;
begin
  ibsqlCod := TFDQuery.Create(NIL);
  with ibsqlCod do
    begin
      Connection := DM.IBDatabase;
      close;
      sql.Clear;
      sql.Add(SQLS);
      ExecOrOpen;
      ibsqlCod.Close;
    end;
end;

end.
