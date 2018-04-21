unit UOS;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ToolWin, cxMemo, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxSpinEdit, Vcl.DBCtrls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, RzPanel, RzDBNav, Vcl.Buttons,
  sSpeedButton, frxClass, frxDBSet;

type
  TfrmCadOS = class(TfrmCadNovoDB)
    cxPageControl1: TcxPageControl;
    cxTabOS: TcxTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbDataCadastro: TcxDBDateEdit;
    Label6: TLabel;
    cxDBDateEdit3: TcxDBDateEdit;
    Label7: TLabel;
    cxDBDateEdit4: TcxDBDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label11: TLabel;
    cxDBMemo2: TcxDBMemo;
    dbedtID_OS: TDBEdit;
    cxDBCODIGO_CLI: TcxDBLookupComboBox;
    QCliente: TFDQuery;
    QClienteCOD_CLI: TIntegerField;
    QClienteNOME_CLI: TStringField;
    dsCliente: TDataSource;
    cxTabServico: TcxTabSheet;
    dsProduto: TDataSource;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosNOME_PRO: TStringField;
    QItens: TFDQuery;
    dsItens: TDataSource;
    QItensID_OS_ITEM: TIntegerField;
    QItensID_OS: TIntegerField;
    QItensCOD_PRO: TIntegerField;
    QItensQUANTIDADE: TFloatField;
    QItensVALOR_UNITARIO: TFloatField;
    QItensVALOR_TOTAL: TFloatField;
    Panel3: TPanel;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    edtQuantidade: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label13: TLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxNCMs: TcxGridDBTableView;
    cxNCMsNCM: TcxGridDBColumn;
    cxNCMsEX: TcxGridDBColumn;
    cxNCMsDESC_NCM: TcxGridDBColumn;
    cxNCMsDESCRICAO: TcxGridDBColumn;
    cxCEST: TcxGridDBTableView;
    cxCESTCEST: TcxGridDBColumn;
    cxCESTDescricao: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    pnl3: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    QPrincipalID_OS: TIntegerField;
    QPrincipalSITUACAO: TStringField;
    QPrincipalID_CLIENTE: TIntegerField;
    QPrincipalDATA_CADASATRO: TDateField;
    QPrincipalDATA_FECHAMENTO: TDateField;
    QPrincipalDATA_ENTRADA: TDateField;
    QPrincipalDATA_ENTREGA: TDateField;
    QPrincipalOBSERVACAO: TMemoField;
    QPrincipalCOD_EMP: TIntegerField;
    QPrincipalDEFEITO: TMemoField;
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxVisualizaDBTableView1Column2: TcxGridDBColumn;
    cxVisualizaDBTableView1Column3: TcxGridDBColumn;
    cxVisualizaDBTableView1Column4: TcxGridDBColumn;
    BtnAddCliFor: TsSpeedButton;
    BtnConsCliFor: TsSpeedButton;
    Label14: TLabel;
    edtCodCliente: TcxDBTextEdit;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label15: TLabel;
    edtProduto: TcxDBTextEdit;
    QProdutosVALOR_PRO: TBCDField;
    btnFinalizar: TToolButton;
    QItensCOD_EMP: TIntegerField;
    edtTecnico: TcxDBTextEdit;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    Label17: TLabel;
    QPrincipalTECNICO: TIntegerField;
    QFuncionario: TFDQuery;
    dsFuncionario: TDataSource;
    QFuncionarioCOD_FUN: TIntegerField;
    QFuncionarioNOME_FUN: TStringField;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    QPrincipalAPARELHO: TStringField;
    QPrincipalMODELO: TStringField;
    QPrincipalNUMERO_SERIE: TStringField;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    Label16: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label18: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label19: TLabel;
    QPrincipalNOME_FUN: TStringField;
    QPrincipalNOME_CLI: TStringField;
    QPrincipalSIT: TStringField;
    QTotalItens: TFDQuery;
    QTotalItensVLR_ITENS: TFloatField;
    dsQTotalItens: TDataSource;
    DBText1: TDBText;
    cxDBTextEdit1: TcxDBTextEdit;
    Label20: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label21: TLabel;
    QPrincipalVALOR_DESCONTO: TFloatField;
    QPrincipalTOTAL_OS: TFloatField;
    cxDBTextEdit6: TcxDBTextEdit;
    Label22: TLabel;
    cxVisualizaDBTableView1Column5: TcxGridDBColumn;
    DBRadioGroup1: TDBRadioGroup;
    QPrincipalVALOR_SERVICOS: TFloatField;
    frxOS: TfrxReport;
    btnImprimir: TToolButton;
    QItensOS: TFDQuery;
    QItensOSCOD_PRO: TIntegerField;
    QItensOSQUANTIDADE: TFloatField;
    QItensOSVALOR_UNITARIO: TFloatField;
    QItensOSVALOR_TOTAL: TFloatField;
    QItensOSNOME_PRO: TStringField;
    frxItensos: TfrxDBDataset;
    QItensOSDESCRICAO: TStringField;
    cxDBTextEdit9: TcxDBTextEdit;
    Label23: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label24: TLabel;
    QPrincipalTOTAL_RESTANTE: TFloatField;
    btnTransmitirNFSe: TToolButton;
    QTotalServico: TFDQuery;
    QTotalServicoTOTALNFSE: TFloatField;
    QDescricaoServico: TFDQuery;
    QDescricaoServicoNOME_PRO: TStringField;
    QDescricaoServicoCODIGO_SERVICO: TIntegerField;
    QDescricaoServicoSERVICO_CODIGO: TStringField;
    QPrincipalNOTA_FISCAL_SERVICO: TIntegerField;
    qParametro: TFDQuery;
    qParametroNUMERO_INICIO_NFS: TIntegerField;
    ToolButton2: TToolButton;
    QBuscaItens: TFDQuery;
    QBuscaItensID_OS_ITEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TFloatField;
    QBuscaItensVALOR_CUSTO: TFloatField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensCST: TStringField;
    QBuscaItensIPI: TFloatField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    qParametroALIQUOTA: TFloatField;
    procedure QPrincipalNewRecord(DataSet: TDataSet);
    procedure cxTabServicoShow(Sender: TObject);
    procedure QItensNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure QItensAfterPost(DataSet: TDataSet);
    procedure BtnConsCliForClick(Sender: TObject);
    procedure BtnAddCliForClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure cxDBTextEdit3Exit(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtTecnicoExit(Sender: TObject);
    procedure QItensAfterScroll(DataSet: TDataSet);
    procedure QPrincipalCalcFields(DataSet: TDataSet);
    procedure RzDBNavigator1Click(Sender: TObject; Button: TRzNavigatorButton);
    procedure PageEditShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnTransmitirNFSeClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOS: TfrmCadOS;

implementation

{$R *.dfm}

uses UDM, Ubibli1, UConsCli, UNovoPrincipal, UCadCli, UConsProd, UCadProduto,
  UConsFunc, UCadFunc, URecebimento, UFechamentoOrdemServico,
  UCadNotaFiscalServico, UDadosNotaFiscal;

procedure TfrmCadOS.BtnAddCliForClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TfrmCadOS.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TfrmCadOS.BtnAlterarClick(Sender: TObject);
begin
  if QPrincipalSITUACAO.AsString = 'F' then
    begin
      MessageDlg('Ordem de serviço fechada, não pode ser editada !', mtInformation, [mbOK],0);
      Exit;
    end;
  inherited;
  QCliente.Open;
  QProdutos.Open;
  QFuncionario.Open;
end;

procedure TfrmCadOS.BtnConsCliForClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag := 48;
  FrmConsCli.ShowModal;
  QPrincipalID_CLIENTE.AsInteger := FrmConsCli._Cli;
  edtCodCliente.SetFocus;
end;

procedure TfrmCadOS.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 34;
  FrmConsProd.ShowModal;
  QItens.Edit;
  QItensCOD_PRO.AsInteger := FrmConsProd._CodPro;
  QItensVALOR_UNITARIO.AsFloat := QProdutosVALOR_PRO.AsFloat;
  edtProduto.SetFocus;
end;

procedure TfrmCadOS.btnFinalizarClick(Sender: TObject);
 var vg_TotalBruto, vg_TotalLiq, vg_TotalPag : Double;
begin
  inherited;
  vg_TotalBruto := QTotalItensVLR_ITENS.AsFloat;
  vg_TotalPag := QPrincipalVALOR_SERVICOS.AsFloat;
  vg_TotalLiq := vg_TotalBruto - QPrincipalVALOR_DESCONTO.AsFloat - vg_TotalPag;

  Application.CreateForm(TfrmFechamentoOS, frmFechamentoOS);
  frmFechamentoOS.EdtTotalBruto.Text := CurrToStr(vg_TotalBruto);
  frmFechamentoOS.EdtDesc.Text := CurrToStr(QPrincipalVALOR_DESCONTO.AsFloat);
  frmFechamentoOS.EdtTotalliq.Text := CurrToStr(vg_TotalLiq);
  frmFechamentoOS.EdtValorRec.Text := CurrToStr(vg_TotalLiq);
  frmFechamentoOS.edtValorPago.Text := CurrToStr(vg_TotalPag);
  frmFechamentoOS.EdtData.date := date;
  frmFechamentoOS.CodEmp := QPrincipalCOD_EMP.AsInteger;
  frmFechamentoOS.CodCli := QPrincipalID_CLIENTE.AsInteger;
  frmFechamentoOS.CodOS  := QPrincipalID_OS.AsInteger;
  frmFechamentoOS.Cliente := QPrincipalNOME_CLI.AsString;
  if frmFechamentoOS.showmodal = mrok then
    begin
      QPrincipal.Edit;
      QPrincipalDATA_FECHAMENTO.AsDateTime := Date;
      QPrincipalSITUACAO.AsString := frmFechamentoOS.Situacao;
      QPrincipalVALOR_SERVICOS.AsFloat := QPrincipalVALOR_SERVICOS.AsFloat + frmFechamentoOS.ValorPago;
      dsPrincipal.DataSet.Post;
      TRPrincipal.CommitRetaining;
      QPrincipal.RefreshRecord();
      QTotalItens.Close;
      QTotalItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
      QTotalItens.Open;
    end;
end;

procedure TfrmCadOS.BtnNovoClick(Sender: TObject);
begin
  inherited;
  QCliente.Open;
  QProdutos.Open;
  QFuncionario.Open;
end;

procedure TfrmCadOS.btnPesquisarClick(Sender: TObject);
begin
  QPrincipal.Close;
  QPrincipal.SQL.Clear;
  QPrincipal.SQL.Add('SELECT OS.*, F.NOME_FUN, C.NOME_CLI, CASE WHEN OS.SITUACAO = ''F'' THEN ''Fechado'' ELSE ''Aberto'' END SIT '+
                     '  FROM OS '+
                     '       LEFT OUTER JOIN CLIENTE C ON(C.COD_CLI = OS.ID_CLIENTE) '+
                     '       LEFT OUTER JOIN FUNCIONARIO F ON(F.COD_FUN = OS.TECNICO) '+
                     '  WHERE UPPER(F.NOME_FUN) LIKE UPPER(''%'+edtMask.Text+'%'') '+
                     '   ORDER BY F.NOME_FUN, OS.DATA_CADASATRO ');
  QPrincipal.Open;
end;

procedure TfrmCadOS.btnTransmitirNFSeClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadNotaFiscalServico, frmCadNotaFiscalServico);
  if QPrincipalNOTA_FISCAL_SERVICO.AsInteger = 0 then
    begin
      qParametro.Close;
      qParametro.Params[0].AsInteger := iEmp;
      qParametro.Open;
      frmCadNotaFiscalServico.QNotaFiscalServico.Append;
      frmCadNotaFiscalServico.QNotaFiscalServicoID_NF_SERVICO.AsInteger := prxcod('NOTA_FISCAL_SERVICO', 'ID_NF_SERVICO', dm.IBTransaction, dm.ibsqlcod);
      frmCadNotaFiscalServico.QNotaFiscalServicoDATA_LANCAMENTO.AsDateTime := Date;
      QTotalServico.Close;
      QTotalServico.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
      QTotalServico.Open;
      frmCadNotaFiscalServico.QNotaFiscalServicoVALOR.AsFloat := QTotalServicoTOTALNFSE.AsFloat;
      QDescricaoServico.Close;
      QDescricaoServico.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
      QDescricaoServico.Open;
      QDescricaoServico.First;
      while not QDescricaoServico.Eof do
        begin
          frmCadNotaFiscalServico.QNotaFiscalServicoDESCRICAO.AsString := frmCadNotaFiscalServico.QNotaFiscalServicoDESCRICAO.AsString + ' ' + QDescricaoServicoNOME_PRO.AsString;
          QDescricaoServico.Next;
        end;
      frmCadNotaFiscalServico.QNotaFiscalServicoNATUREZA_OPERACAO.AsString := '1';
      frmCadNotaFiscalServico.QNotaFiscalServicoALIQUOTA.AsFloat := qParametroALIQUOTA.AsFloat;
      frmCadNotaFiscalServico.JvDBComboBox2.Text := qParametroALIQUOTA.AsString;
      frmCadNotaFiscalServico.QNotaFiscalServicoCODIGO_SERVICO.AsString := QDescricaoServicoCODIGO_SERVICO.AsString;
      frmCadNotaFiscalServico.QNotaFiscalServicoVALOR_DEDUCOES.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoDESCONTOS_INCONDICIONADOS.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoOUTRAS_RETENCOES.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoISS_RETIDO.AsString := 'N';
      frmCadNotaFiscalServico.QNotaFiscalServicoVALOR_ISS_RETIDO.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoPIS.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoCOFINS.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoIR.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoINSS.AsFloat := 0;
      frmCadNotaFiscalServico.QNotaFiscalServicoCSLL.AsFloat := 0;
      if True then
        frmCadNotaFiscalServico.QNotaFiscalServicoNUMERO_NF.AsInteger := qParametroNUMERO_INICIO_NFS.AsInteger
      else
        frmCadNotaFiscalServico.QNotaFiscalServicoNUMERO_NF.AsInteger := prxcod('NOTA_FISCAL_SERVICO', 'NUMERO_NF', dm.IBTransaction, dm.ibsqlcod);

      frmCadNotaFiscalServico.QNotaFiscalServicoID_EMPRESA.AsString := QPrincipalCOD_EMP.AsString;

      frmCadNotaFiscalServico.QNotaFiscalServicoSERVICO_CODIGO.AsString := QDescricaoServicoSERVICO_CODIGO.AsString;
      frmCadNotaFiscalServico.QNotaFiscalServicoID_CADASTRO.AsInteger := QPrincipalID_CLIENTE.AsInteger;
      frmCadNotaFiscalServico.QNotaFiscalServico.Post;
      TRPrincipal.CommitRetaining;
      frmCadNotaFiscalServico.QNotaFiscalServico.RefreshRecord();
      QPrincipal.Edit;
      QPrincipalNOTA_FISCAL_SERVICO.AsInteger := frmCadNotaFiscalServico.QNotaFiscalServicoID_NF_SERVICO.AsInteger;
      dsPrincipal.DataSet.Post;
      TRPrincipal.CommitRetaining;
      QPrincipal.RefreshRecord();
    end
  else
    begin
      frmCadNotaFiscalServico.QNotaFiscalServico.Close;
      frmCadNotaFiscalServico.QNotaFiscalServico.Params[0].AsInteger := QPrincipalNOTA_FISCAL_SERVICO.AsInteger;
      frmCadNotaFiscalServico.QNotaFiscalServico.Open;
    end;

  frmCadNotaFiscalServico.ShowModal;
  frmCadNotaFiscalServico.Free;

end;

procedure TfrmCadOS.cxDBLookupComboBox1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if QItens.State in [dsInsert, dsEdit] then
    QItensVALOR_UNITARIO.AsFloat := QProdutosVALOR_PRO.AsFloat;
end;

procedure TfrmCadOS.edtQuantidadeExit(Sender: TObject);
var
  cEstoque: currency;
begin
  if QItensQUANTIDADE.AsFloat = 0 then
  begin
    AlertaCad('Digite a Quantidade');
    edtQuantidade.SetFocus;
    exit;
  end;
  if QItens.State in [dsInsert, dsEdit] then
    QItensVALOR_TOTAL.AsFloat := QItensQUANTIDADE.AsFloat * QItensVALOR_UNITARIO.AsFloat;

  { Verifica se o estoque esta ou vai ficar negativo }
  if not bEstoqueNegativo then
  begin
    cEstoque := dm.BuscaEstoqueProduto(QItensQUANTIDADE.AsInteger, iEmp);

    if cEstoque - QItensQUANTIDADE.AsFloat < 0 then
    begin
      AlertaCad('Produto com estoque negativo');
      exit;
      abort;
    end;
  end;
end;

procedure TfrmCadOS.cxDBTextEdit3Exit(Sender: TObject);
begin
  inherited;
  if QItens.State in [dsInsert, dsEdit] then
    QItensVALOR_TOTAL.AsFloat := QItensQUANTIDADE.AsFloat * QItensVALOR_UNITARIO.AsFloat;
end;

procedure TfrmCadOS.edtProdutoExit(Sender: TObject);
begin
  inherited;
  if QItens.State in [dsInsert, dsEdit] then
    QItensVALOR_UNITARIO.AsFloat := QProdutosVALOR_PRO.AsFloat;
  edtQuantidade.SetFocus;
end;

procedure TfrmCadOS.cxTabServicoShow(Sender: TObject);
begin

  inherited;
  QItens.Close;
  QItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
  QItens.Open;
end;

procedure TfrmCadOS.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  BtnAlterar.Enabled := QPrincipalSITUACAO.AsString <> 'F';
  btnFinalizar.Enabled := QPrincipalSITUACAO.AsString <> 'F';
  btnImprimir.Enabled := QPrincipal.State = dsBrowse;
end;

procedure TfrmCadOS.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  edtTecnico.SetFocus;
  QCliente.Close;
  QCliente.Open;
end;

procedure TfrmCadOS.edtTecnicoExit(Sender: TObject);
begin
  inherited;
  dbDataCadastro.SetFocus;
  QFuncionario.Close;
  QFuncionario.Open;
  if QPrincipal.State in [dsEdit, dsInsert] then
    begin
      QPrincipal.Post;
      TRPrincipal.CommitRetaining;
      QPrincipal.RefreshRecord();
      QPrincipal.Edit;
    end;
end;

procedure TfrmCadOS.FormShow(Sender: TObject);
begin
  inherited;
  QPrincipal.Open;
  QItens.Close;
  QItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
  QItens.Open;
  QCliente.Open;
  QProdutos.Open;
  QFuncionario.Open;
end;

procedure TfrmCadOS.PageEditShow(Sender: TObject);
begin
  inherited;
  QTotalItens.Close;
  QTotalItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
  QTotalItens.Open;
end;

procedure TfrmCadOS.QItensAfterPost(DataSet: TDataSet);
begin
  inherited;
  TRPrincipal.CommitRetaining;
  QItens.RefreshRecord();
end;

procedure TfrmCadOS.QItensAfterScroll(DataSet: TDataSet);
begin
  inherited;
  QTotalItens.Close;
  QTotalItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
  QTotalItens.Open;
end;

procedure TfrmCadOS.QItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  QItensID_OS_ITEM.AsInteger := prxcod('os_item', 'id_os_item', dm.IBTransaction, dm.ibsqlcod);
  QItensID_OS.AsInteger := QPrincipalID_OS.AsInteger;
  QItensCOD_EMP.AsInteger := QPrincipalCOD_EMP.AsInteger;
end;

procedure TfrmCadOS.QPrincipalCalcFields(DataSet: TDataSet);
begin
  inherited;
  QTotalItens.Close;
  QTotalItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
  QTotalItens.Open;
  QPrincipalTOTAL_OS.AsFloat := QTotalItensVLR_ITENS.AsFloat - QPrincipalVALOR_DESCONTO.AsFloat;
  QPrincipalTOTAL_RESTANTE.AsFloat := QPrincipalTOTAL_OS.AsFloat - QPrincipalVALOR_SERVICOS.AsFloat;
end;

procedure TfrmCadOS.QPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QPrincipalID_OS.AsInteger :=  prxcod('os', 'id_os', dm.IBTransaction, dm.ibsqlcod);
  QPrincipalSITUACAO.AsString := 'A';
  QPrincipalDATA_CADASATRO.AsDateTime := Date;
  QPrincipalDATA_ENTRADA.AsDateTime := Date;
  QPrincipalCOD_EMP.AsInteger := iEmp;
  QPrincipalVALOR_DESCONTO.AsFloat := 0;
  QPrincipalVALOR_SERVICOS.AsFloat := 0;
end;

procedure TfrmCadOS.RzDBNavigator1Click(Sender: TObject;
  Button: TRzNavigatorButton);
begin
  inherited;
  edtProduto.SetFocus;
end;

procedure TfrmCadOS.sSpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsFunc, FrmConsFunc);
  FrmConsFunc.tag := 5;
  FrmConsFunc.ShowModal;
  QPrincipalTECNICO.AsInteger := FrmConsFunc._CodFunc;
  edtTecnico.SetFocus;
end;

procedure TfrmCadOS.sSpeedButton2Click(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadFunc, True );
end;

procedure TfrmCadOS.ToolButton2Click(Sender: TObject);
begin
   Application.CreateForm(TFrmDadosNotaFiscal, FrmDadosNotaFiscal);
   FrmDadosNotaFiscal.EdtDataEmissao.Text := FormatDateTime('dd/mm/yyyy', Date);
   FrmDadosNotaFiscal.IDCLIENTE := QPrincipalID_CLIENTE.AsInteger;
   FrmDadosNotaFiscal.VALORDESC := QPrincipalVALOR_DESCONTO.AsFloat;
   FrmDadosNotaFiscal.IDOS := QPrincipalID_OS.AsInteger;
   FrmDadosNotaFiscal.Venda := False;
   FrmDadosNotaFiscal.Tag := 3;
   FrmDadosNotaFiscal.showmodal;
end;

procedure TfrmCadOS.btnImprimirClick(Sender: TObject);
var
   RelFile: String;
begin
   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\osA4.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo Pedido.fr3 não encontrado!' );
         Exit;
      end;
   frxOS.LoadFromFile( RelFile );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   QItensOS.Close;
   QItensOS.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
   QItensOS.Open;
   QTotalItens.Close;
   QTotalItens.Params[0].AsInteger := QPrincipalID_OS.AsInteger;
   QTotalItens.Open;

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
   frxOS.Variables['razao_emp'] := QuotedStr( dm.QConsulta.FieldByName('RAZAO_EMP').AsString );
   frxOS.Variables['endereco_emp'] := QuotedStr( dm.QConsulta.FieldByName('END_EMP').AsString );
   frxOS.Variables['numero_emp'] := QuotedStr( dm.QConsulta.FieldByName('NUMERO_EMP').AsString );
   frxOS.Variables['cep_emp'] := QuotedStr( dm.QConsulta.FieldByName('CEP_EMP').AsString );
   frxOS.Variables['cid_emp'] := QuotedStr( dm.QConsulta.FieldByName('CID_EMP').AsString );
   frxOS.Variables['estado_emp'] := QuotedStr( dm.QConsulta.FieldByName('EST_EMP').AsString );
   frxOS.Variables['tel_emp'] := QuotedStr( dm.QConsulta.FieldByName('TEL_EMP').AsString );
   frxOS.Variables['logo'] := QuotedStr( dm.QConsulta.FieldByName('caminho_foto_emp').AsString );
   frxOS.Variables['logo2'] := QuotedStr( dm.QConsulta.FieldByName('caminho_foto_emp').AsString );
   frxOS.Variables['TERMOOS'] := QuotedStr( dm.QConsulta.FieldByName('OBSERVACAO_OS').AsString );
   dm.QConsulta.Close;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   //DADOS DO CLIENTE
   dm.QConsulta.SQL.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
   dm.QConsulta.ParamByName('CODCLI').AsString := QPrincipalID_CLIENTE.AsString;
   dm.QConsulta.Open;
   if dm.QConsulta.IsEmpty then
      begin
         AlertaCad( 'Erro ao buscar dados do cliente' );
         dm.QConsulta.Close;
         dm.IBTransaction.Commit;
         exit;
      end;
   frxOS.Variables['nome_cli'] := QuotedStr( dm.QConsulta.FieldByName('NOME_CLI').AsString );
   frxOS.Variables['end_cli'] := QuotedStr( dm.QConsulta.FieldByName('ENDRES_CLI').AsString );
   frxOS.Variables['numero_cli'] := QuotedStr( dm.QConsulta.FieldByName('NUMRES_CLI').AsString );
   frxOS.Variables['cep_cli'] := QuotedStr( dm.QConsulta.FieldByName('CEPRES_CLI').AsString );
   frxOS.Variables['cid_cli'] := QuotedStr( dm.QConsulta.FieldByName('CIDRES_CLI').AsString );
   frxOS.Variables['estado_cli'] := QuotedStr( dm.QConsulta.FieldByName('ESTRES_CLI').AsString );

   dm.QConsulta.Close;

   dm.IBTransaction.Commit;
   //frxOS.Variables['maoobra'] := QuotedStr( FormatFloat('###,###,##0.00', QPrincipalVALOR_SERVICOS.AsFloat ));
   frxOS.Variables['total_geral'] := QuotedStr( FormatFloat('###,###,##0.00', QTotalItensVLR_ITENS.AsFloat ));
   frxOS.Variables['desconto'] := QuotedStr( FormatFloat('-###,###,##0.00', QPrincipalVALOR_DESCONTO.AsFloat ));
   frxOS.Variables['valor_pagar'] := QuotedStr( FormatFloat('###,###,##0.00',QPrincipalTOTAL_OS.AsFloat));
   frxOS.Variables['obs'] := QuotedStr( QPrincipalOBSERVACAO.AsString );
   frxOS.Variables['tecnico'] := QuotedStr( QPrincipalNOME_FUN.AsString );
   frxOS.Variables['os'] := QuotedStr( QPrincipalID_OS.AsString );
   frxOS.Variables['data'] := QuotedStr( QPrincipalDATA_CADASATRO.AsString );
   frxOS.Variables['fechamento'] := QuotedStr( QPrincipalDATA_FECHAMENTO.AsString );
   frxOS.Variables['serie'] := QuotedStr( QPrincipalNUMERO_SERIE.AsString );

   frxOS.Variables['aparelho'] := QuotedStr( QPrincipalAPARELHO.AsString );
   frxOS.Variables['modelo'] := QuotedStr( QPrincipalMODELO.AsString );
   frxOS.Variables['defeito'] := QuotedStr( QPrincipalDEFEITO.AsString );

   frxOS.ShowReport( true );

end;

end.
