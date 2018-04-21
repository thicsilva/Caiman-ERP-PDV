unit UGerenciamentoNFSE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmGerenciamentoNFSE = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TsDateEdit;
    EdtDataFin: TsDateEdit;
    GroupBox2: TGroupBox;
    Combo: TComboBox;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsNfse: TFDQuery;
    QConsNfseCHAVE: TStringField;
    QConsNfseDATA_LANCAMENTO: TDateField;
    QConsNfseVALOR: TFloatField;
    QConsNfseNOME_CLI: TStringField;
    QConsNfseSITUACAO: TStringField;
    QConsNfseID_NF_SERVICO: TIntegerField;
    dsConsNfse: TDataSource;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciamentoNFSE: TfrmGerenciamentoNFSE;

implementation

{$R *.dfm}

uses UDM, UCadNotaFiscalServico;

procedure TfrmGerenciamentoNFSE.BtnOkClick(Sender: TObject);
var
   vNF: Integer;
   Situacao : String;
begin
  if Combo.ItemIndex = 1 then
    Situacao := ' AND GERADA = ''C'' '
  else
    if Combo.ItemIndex = 2 then
      Situacao := ' AND GERADA IS NULL '
    else
      if Combo.ItemIndex = 3 then
        Situacao := ' AND GERADA = ''E'' '
      else
        Situacao := '';
  with QConsNfse do
  begin
    close;
    sql.Clear;
    sql.Text := 'SELECT ID_NF_SERVICO, NFS.CHAVE, NFS.DATA_LANCAMENTO, NFS.VALOR, C.NOME_CLI, '+
                '       CASE WHEN NFS.GERADA = ''V'' THEN ''Validada'' '+
                '            WHEN NFS.GERADA = ''E'' THEN ''Enviada'' '+
                '            WHEN NFS.GERADA = ''C'' THEN ''Cancelado'' '+
                '            ELSE ''Em Digitação'' END SITUACAO  '+
                '  FROM NOTA_FISCAL_SERVICO NFS '+
                '       LEFT OUTER JOIN CLIENTE C ON(NFS.ID_CADASTRO = C.COD_CLI) '+
                ' WHERE NFS.DATA_LANCAMENTO BETWEEN '''+FormatDateTime('DD.MM.YYYY', EdtDataIni.Date)+''' AND '''+FormatDateTime('DD.MM.YYYY', EdtDataFin.Date)+''' '+
                '   AND NFS.ID_EMPRESA = '+IntToStr(iEmp) +
                Situacao;
    Open;

  end;
end;

procedure TfrmGerenciamentoNFSE.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciamentoNFSE.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadNotaFiscalServico, frmCadNotaFiscalServico);
  frmCadNotaFiscalServico.QNotaFiscalServico.Close;
  frmCadNotaFiscalServico.QNotaFiscalServico.Params[0].AsInteger := QConsNfseID_NF_SERVICO.AsInteger;
  frmCadNotaFiscalServico.QNotaFiscalServico.Open;
  frmCadNotaFiscalServico.ShowModal;
  frmCadNotaFiscalServico.Free;
end;

procedure TfrmGerenciamentoNFSE.FormShow(Sender: TObject);
begin
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
end;

end.
