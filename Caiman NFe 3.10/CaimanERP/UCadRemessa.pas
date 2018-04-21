unit UCadRemessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, DB, StdCtrls, Grids, DBGrids, Buttons, sSpeedButton, 
  ImgList, acAlphaImageList, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  System.ImageList;

type
  TfrmCadRemessa = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    QBoletos: TFDQuery;
    QBoletosCOD: TIntegerField;
    QBoletosCOD_EMP: TIntegerField;
    QBoletosCOD_CEDENTE: TIntegerField;
    QBoletosCOD_CTR: TIntegerField;
    QBoletosDATA_DOCUMENTO: TDateField;
    QBoletosVENCIMENTO: TDateField;
    QBoletosNUMERO_DOC: TStringField;
    QBoletosESPECIE_DOC: TStringField;
    QBoletosACEITE: TStringField;
    QBoletosDATA_PROCESSAMENTO: TDateField;
    QBoletosCARTEIRA: TStringField;
    QBoletosNOSSO_NUMERO: TStringField;
    QBoletosVALOR_DOCUMENTO: TBCDField;
    QBoletosCOD_CLI: TIntegerField;
    QBoletosVALOR_ABATIMENTO: TBCDField;
    QBoletosLOCAL_PAGAMENTO: TStringField;
    QBoletosVALOR_MORA_JURUS: TBCDField;
    QBoletosVALOR_DESCONTO: TBCDField;
    QBoletosDATA_MORA_JUROS: TDateField;
    QBoletosDATA_DESCONTO: TDateField;
    QBoletosDATA_ABATIMENTO: TDateField;
    QBoletosDATA_PROTESTO: TDateField;
    QBoletosPORCENTUAL_MULTA: TBCDField;
    QBoletosOCORRENCIA: TStringField;
    QBoletosSTATUS: TStringField;
    QBoletosREMESSA: TIntegerField;
    QBoletosNOME_CLI: TStringField;
    DSQBoletos: TDataSource;
    Label1: TLabel;
    edtCod: TEdit;
    Label2: TLabel;
    edtCedente: TEdit;
    Label3: TLabel;
    edtStatus: TEdit;
    Label4: TLabel;
    edtData: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    QBoletosRemessas: TFDQuery;
    DSQBoletosRemessas: TDataSource;
    QBoletosRemessasCOD: TIntegerField;
    QBoletosRemessasCOD_REMESSA: TIntegerField;
    QBoletosRemessasCOD_BOLETO: TIntegerField;
    QBoletosRemessasCOD_EMP: TIntegerField;
    QBoletosRemessasCOD_CEDENTE: TIntegerField;
    QBoletosRemessasCOD_CTR: TIntegerField;
    QBoletosRemessasDATA_DOCUMENTO: TDateField;
    QBoletosRemessasVENCIMENTO: TDateField;
    QBoletosRemessasNUMERO_DOC: TStringField;
    QBoletosRemessasESPECIE_DOC: TStringField;
    QBoletosRemessasACEITE: TStringField;
    QBoletosRemessasDATA_PROCESSAMENTO: TDateField;
    QBoletosRemessasCARTEIRA: TStringField;
    QBoletosRemessasNOSSO_NUMERO: TStringField;
    QBoletosRemessasVALOR_DOCUMENTO: TBCDField;
    QBoletosRemessasCOD_CLI: TIntegerField;
    QBoletosRemessasVALOR_ABATIMENTO: TBCDField;
    QBoletosRemessasLOCAL_PAGAMENTO: TStringField;
    QBoletosRemessasVALOR_MORA_JURUS: TBCDField;
    QBoletosRemessasVALOR_DESCONTO: TBCDField;
    QBoletosRemessasDATA_MORA_JUROS: TDateField;
    QBoletosRemessasDATA_DESCONTO: TDateField;
    QBoletosRemessasDATA_ABATIMENTO: TDateField;
    QBoletosRemessasDATA_PROTESTO: TDateField;
    QBoletosRemessasPORCENTUAL_MULTA: TBCDField;
    QBoletosRemessasOCORRENCIA: TStringField;
    QBoletosRemessasSTATUS: TStringField;
    QBoletosRemessasREMESSA: TIntegerField;
    QBoletosRemessasNOME_CLI: TStringField;
    Label5: TLabel;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    ImagensDBGrid: TsAlphaImageList;
    IBSQL: TFDQuery;
    pBoletosPendentes: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    cbSelecionaTudo: TCheckBox;
    QBoletosRemessasVALOR_RECEBIDO: TBCDField;
    QBoletosRemessasDATA_PAGAMENTO: TDateField;
    QBoletosVALOR_RECEBIDO: TBCDField;
    QBoletosDATA_PAGAMENTO: TDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure cbSelecionaTudoClick(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRemessa: TfrmCadRemessa;

implementation

uses
  UDM, UGerenciaRemessas, UDialog, UNovoPrincipal;

{$R *.dfm}

procedure TfrmCadRemessa.cbSelecionaTudoClick(Sender: TObject);
begin 
  QBoletos.First;
  while not QBoletos.eof do
  begin 
    DBGrid2.SelectedRows.CurrentRowSelected := cbSelecionaTudo.Checked;
    QBoletos.next;
  end;
  QBoletos.First;

end;

procedure TfrmCadRemessa.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   QBoletos.Close;
   QBoletosRemessas.Close;
   Action := caFree;
end;

procedure TfrmCadRemessa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   case key of
     vk_escape : Close;
   end;
end;

procedure TfrmCadRemessa.FormShow(Sender: TObject);
begin 
   QBoletosRemessas.ParamByName( 'COD_REMESSA' ).AsInteger := StrToInt( edtCod.Text );
   QBoletosRemessas.Open;
end;


procedure TfrmCadRemessa.sSpeedButton1Click(Sender: TObject);
begin 
   if edtStatus.Text = 'GERADA' then
      begin 
         KDialog( 'Remessa já foi enviada', 'Gerenciamento de Remessas', tdtInfo );
         Exit;
      end;
   QBoletos.ParamByName( 'CODEMP' ).AsInteger := iEmp;
   QBoletos.ParamByName( 'CODCEDENTE' ).AsInteger := StrToInt( Copy( edtCedente.Text, 1, 3));
   Qboletos.Open;
   DBGrid1.Enabled := False;
   panel1.Enabled := false;
   Panel2.Enabled := false;
   pBoletosPendentes.Visible := True;
   cbSelecionaTudo.Checked := True;
   cbSelecionaTudoClick( nil );
end;

procedure TfrmCadRemessa.sSpeedButton2Click(Sender: TObject);
begin 
   if edtStatus.Text = 'GERADA' then
      begin 
         KDialog( 'Remessa já foi enviada', 'Gerenciamento de Remessas', tdtInfo );
         Exit;
      end;
   QBoletosRemessas.First;
   while not QBoletosRemessas.Eof do
      begin 
         if (DBGrid1.SelectedRows.CurrentRowSelected = true) then
            begin 
               IBSQL.SQL.Text := 'delete from REMESSAS_BOLETOS where COD=:COD';
               IBSQL.ParamByName( 'COD' ).AsInteger := QBoletosRemessasCOD.AsInteger;
               IBSQL.ExecOrOpen;
            end;
         QBoletosRemessas.Next;
      end;
   frmGerenciaRemessas.IBTRRemessas.CommitRetaining;
   QBoletosRemessas.Close;
   QBoletosRemessas.Open;
end;

procedure TfrmCadRemessa.sSpeedButton3Click(Sender: TObject);
begin 
   QBoletos.First;
   while not QBoletos.Eof do
      begin 
         if (DBGrid2.SelectedRows.CurrentRowSelected = true) then
            begin 
               IBSQL.SQL.Text := 'insert into REMESSAS_BOLETOS( COD_REMESSA, COD_BOLETO ) values ( :COD_REMESSA, :COD_BOLETO )';
               IBSQL.ParamByName( 'COD_REMESSA' ).AsInteger := StrToInt( edtCod.Text );
               IBSql.ParamByName( 'COD_BOLETO' ).AsInteger := QBoletosCOD.AsInteger;
               IBSQL.ExecOrOpen;
            end;
            QBoletos.Next;
      end;
   pBoletosPendentes.Visible := False;
   Panel1.Enabled := True;
   Panel2.Enabled := True;
   DBGrid1.Enabled := true;
   QBoletos.Close;
   QBoletosRemessas.Close;
   frmGerenciaRemessas.IBTRRemessas.CommitRetaining;
   QBoletosRemessas.Open;
end;

procedure TfrmCadRemessa.sSpeedButton4Click(Sender: TObject);
begin 
   pBoletosPendentes.Visible := False;
   Panel1.Enabled := True;
   Panel2.Enabled := True;
   DBGrid1.Enabled := true;
   QBoletos.Close;

end;

end.
