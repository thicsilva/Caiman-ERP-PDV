unit UCadSNGPC;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ToolWin, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxSpinEdit, JvExStdCtrls, JvCombobox, JvDBCombobox,
  Vcl.DBCtrls, cxDBLookupComboBox, cxLookupEdit, cxDBLookupEdit, Vcl.Buttons,
  sSpeedButton, RzPanel, RzDBNav;

type
  TfrmCadSNGPC = class(TfrmCadNovoDB)
    QPrincipalCODIGO: TIntegerField;
    QPrincipalDATA_RECEITA: TDateField;
    QPrincipalESTADO_RECEITA: TStringField;
    QPrincipalNUMERO_RECEITA: TStringField;
    QPrincipalTIPO_USO: TStringField;
    QPrincipalCONSELHO: TStringField;
    QPrincipalESTADO_MEDIDO: TStringField;
    QPrincipalNOME_MEDIDO: TStringField;
    QPrincipalNOME_COMPRADOR: TStringField;
    QPrincipalTIPO_DOCUMENTO: TStringField;
    QPrincipalORGAO_EXPEDIDOS: TStringField;
    QPrincipalESTADO_COMPRADOR: TStringField;
    QPrincipalNOME_PACIENTE: TStringField;
    QPrincipalSEXO: TStringField;
    QPrincipalDATA_NASCIMENTO: TDateField;
    QPrincipalNUMERO_MEDICO: TLargeintField;
    QPrincipalTIPO_RECEITUARIO: TStringField;
    QPrincipalNUMERO_DOCUMENTO: TStringField;
    cxVisualizaDBTableView1Column1: TcxGridDBColumn;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabITens: TcxTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    JvDBComboBox1: TJvDBComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    JvDBComboBox2: TJvDBComboBox;
    cxDBTextEdit3: TcxDBTextEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    JvDBComboBox3: TJvDBComboBox;
    cxDBTextEdit4: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    pnl3: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column2: TcxGridDBColumn;
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
    QItensReceita: TFDQuery;
    QItensReceitaCOD_PRO: TIntegerField;
    QItensReceitaQUANTIDADE: TFloatField;
    QItensReceitaNOME_PRO: TStringField;
    QItensReceitaNUMERO_LOTE: TStringField;
    dsItensReceita: TDataSource;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    dsProduto: TDataSource;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosNOME_PRO: TStringField;
    QProdutosVALOR_PRO: TBCDField;
    QItensReceitaCODIGO_SNGPC: TIntegerField;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    QPrincipalNUMERO_NOTAFISCAL: TIntegerField;
    QPrincipalTIPO_OPERACAO_NF: TStringField;
    QPrincipalDATA_NOTA_FISCAL: TDateField;
    QPrincipalCNPJ_ORIGEM: TStringField;
    QPrincipalCNPJ_DESTINO: TStringField;
    QPrincipalENTRADA_SAIDA: TStringField;
    cxDBTextEdit8: TcxDBTextEdit;
    Label18: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label19: TLabel;
    QPrincipalDATA_CHEGADA_MEDICAMENTO: TDateField;
    QPrincipalCID: TStringField;
    QPrincipalIDADE_PACIENTE: TIntegerField;
    cxDBDateEdit3: TcxDBDateEdit;
    Label21: TLabel;
    QPrincipalDATA_VENDA_MEDICAMENTO: TDateField;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure cxTabITensShow(Sender: TObject);
    procedure QItensReceitaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QPrincipalNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSNGPC: TfrmCadSNGPC;

implementation

{$R *.dfm}

uses UDM, UConsProd, UNovoPrincipal, UCadProduto;

procedure TfrmCadSNGPC.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TfrmCadSNGPC.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 34;
  FrmConsProd.ShowModal;
  QItensReceita.Edit;
  QItensReceitaCOD_PRO.AsInteger := FrmConsProd._CodPro;
  edtProduto.SetFocus;
end;

procedure TfrmCadSNGPC.btnPesquisarClick(Sender: TObject);
begin
  QPrincipal.Close;
  QPrincipal.SQL.Clear;
  QPrincipal.SQL.Add('SELECT * FROM SNGPC WHERE UPPER(NOME_PACIENTE) LIKE UPPER(''%'+edtMask.Text+'%'') AND ENTRADA_SAIDA = ''S'' ');
  QPrincipal.Open;
end;

procedure TfrmCadSNGPC.cxTabITensShow(Sender: TObject);
begin
  inherited;
  QItensReceita.Close;
  QItensReceita.Params[0].AsInteger := QPrincipalCODIGO.AsInteger;
  QItensReceita.Open;
  QProdutos.Open;
end;

procedure TfrmCadSNGPC.FormCreate(Sender: TObject);
begin
  inherited;
  btnPesquisarClick(Sender);
end;

procedure TfrmCadSNGPC.FormShow(Sender: TObject);
begin
  inherited;
  QProdutos.Open;
end;

procedure TfrmCadSNGPC.QItensReceitaNewRecord(DataSet: TDataSet);
begin
  inherited;
  QItensReceitaCODIGO_SNGPC.AsInteger := QPrincipalCODIGO.AsInteger;
end;

procedure TfrmCadSNGPC.QPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QPrincipalENTRADA_SAIDA.AsString := 'S';
end;

end.
