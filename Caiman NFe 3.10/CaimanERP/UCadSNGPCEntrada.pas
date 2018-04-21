unit UCadSNGPCEntrada;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ToolWin, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.Buttons, sSpeedButton, RzPanel,
  RzDBNav, Vcl.DBCtrls, JvExStdCtrls, JvCombobox, JvDBCombobox, cxDBEdit,
  cxMaskEdit, cxCalendar;

type
  TfrmCadSNGPCEntrada = class(TfrmCadNovoDB)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    cxDBDateEdit3: TcxDBDateEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    JvDBComboBox4: TJvDBComboBox;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosNOME_PRO: TStringField;
    QProdutosVALOR_PRO: TBCDField;
    dsProduto: TDataSource;
    QItensReceita: TFDQuery;
    QItensReceitaCOD_PRO: TIntegerField;
    QItensReceitaQUANTIDADE: TFloatField;
    QItensReceitaNOME_PRO: TStringField;
    QItensReceitaNUMERO_LOTE: TStringField;
    QItensReceitaCODIGO_SNGPC: TIntegerField;
    dsItensReceita: TDataSource;
    cxTabRemedios: TcxTabSheet;
    pnl3: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxNCMs: TcxGridDBTableView;
    cxNCMsNCM: TcxGridDBColumn;
    cxNCMsEX: TcxGridDBColumn;
    cxNCMsDESC_NCM: TcxGridDBColumn;
    cxNCMsDESCRICAO: TcxGridDBColumn;
    cxCEST: TcxGridDBTableView;
    cxCESTCEST: TcxGridDBColumn;
    cxCESTDescricao: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    Label13: TLabel;
    Label17: TLabel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label20: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    edtQuantidade: TcxDBTextEdit;
    edtProduto: TcxDBTextEdit;
    QPrincipalCODIGO: TIntegerField;
    QPrincipalDATA_RECEITA: TDateField;
    QPrincipalESTADO_RECEITA: TStringField;
    QPrincipalNUMERO_RECEITA: TStringField;
    QPrincipalTIPO_USO: TStringField;
    QPrincipalCONSELHO: TStringField;
    QPrincipalESTADO_MEDIDO: TStringField;
    QPrincipalNUMERO_MEDICO: TLargeintField;
    QPrincipalNOME_MEDIDO: TStringField;
    QPrincipalNOME_COMPRADOR: TStringField;
    QPrincipalESTADO_COMPRADOR: TStringField;
    QPrincipalTIPO_DOCUMENTO: TStringField;
    QPrincipalORGAO_EXPEDIDOS: TStringField;
    QPrincipalNOME_PACIENTE: TStringField;
    QPrincipalSEXO: TStringField;
    QPrincipalDATA_NASCIMENTO: TDateField;
    QPrincipalTIPO_RECEITUARIO: TStringField;
    QPrincipalNUMERO_DOCUMENTO: TStringField;
    QPrincipalNUMERO_NOTAFISCAL: TIntegerField;
    QPrincipalTIPO_OPERACAO_NF: TStringField;
    QPrincipalDATA_NOTA_FISCAL: TDateField;
    QPrincipalCNPJ_ORIGEM: TStringField;
    QPrincipalCNPJ_DESTINO: TStringField;
    QPrincipalENTRADA_SAIDA: TStringField;
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxVisualizaDBTableView1Column2: TcxGridDBColumn;
    cxVisualizaDBTableView1Column3: TcxGridDBColumn;
    QPrincipalDATA_CHEGADA_MEDICAMENTO: TDateField;
    cxDBDateEdit1: TcxDBDateEdit;
    Label1: TLabel;
    procedure cxTabRemediosShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QPrincipalNewRecord(DataSet: TDataSet);
    procedure QItensReceitaNewRecord(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSNGPCEntrada: TfrmCadSNGPCEntrada;

implementation

{$R *.dfm}

uses UConsProd, UNovoPrincipal, UCadProduto;

procedure TfrmCadSNGPCEntrada.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TfrmCadSNGPCEntrada.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 34;
  FrmConsProd.ShowModal;
  QItensReceita.Edit;
  QItensReceitaCOD_PRO.AsInteger := FrmConsProd._CodPro;
  edtProduto.SetFocus;
end;

procedure TfrmCadSNGPCEntrada.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  QPrincipal.Close;
  QPrincipal.SQL.Clear;
  QPrincipal.SQL.Add('SELECT * FROM SNGPC WHERE UPPER(CNPJ_ORIGEM) LIKE UPPER(''%'+edtMask.Text+'%'') AND ENTRADA_SAIDA = ''E'' ');
  QPrincipal.Open;
end;

procedure TfrmCadSNGPCEntrada.cxTabRemediosShow(Sender: TObject);
begin
  inherited;
  QItensReceita.Close;
  QItensReceita.Params[0].AsInteger := QPrincipalCODIGO.AsInteger;
  QItensReceita.Open;
  QProdutos.Open;
end;

procedure TfrmCadSNGPCEntrada.FormCreate(Sender: TObject);
begin
  inherited;
  btnPesquisarClick(Sender);
end;

procedure TfrmCadSNGPCEntrada.FormShow(Sender: TObject);
begin
  inherited;
  QProdutos.Open;
end;

procedure TfrmCadSNGPCEntrada.QItensReceitaNewRecord(DataSet: TDataSet);
begin
  inherited;
  QItensReceitaCODIGO_SNGPC.AsInteger := QPrincipalCODIGO.AsInteger;
end;

procedure TfrmCadSNGPCEntrada.QPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QPrincipalENTRADA_SAIDA.AsString := 'E';
end;

end.
