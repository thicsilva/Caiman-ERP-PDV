unit URelFluxoNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  JvDBSearchComboBox, Vcl.ComCtrls, Vcl.ExtCtrls, frxClass, frxDBSet,
  frxExportPDF;

type
  TfrmRelFluxonew = class(TForm)
    QMovimentos: TFDQuery;
    QCaixas: TFDQuery;
    QUsuarios: TFDQuery;
    FDTRMovimentos: TFDTransaction;
    QUsuariosCOD_USU: TIntegerField;
    QUsuariosNOME_USU: TStringField;
    QUsuariosSENHA_USU: TStringField;
    QUsuariosCOD_GRUPO: TIntegerField;
    QUsuariosOPERADOR_CAIXA: TStringField;
    grp1: TGroupBox;
    edtDataIni: TDateTimePicker;
    edtDataFim: TDateTimePicker;
    GroupBox1: TGroupBox;
    edtCodCaixa: TJvDBSearchComboBox;
    QCaixasCOD_CAI: TIntegerField;
    QCaixasCOD_EMP: TIntegerField;
    QCaixasTAMANHO_DESC_CUPOM: TIntegerField;
    QCaixasPORTA_IMP: TStringField;
    QCaixasDESC_CAI: TStringField;
    QCaixasINDICE_GAVETA: TIntegerField;
    QCaixasINDICE_BALANCA: TIntegerField;
    QCaixasPORTA_BALANCA: TIntegerField;
    QCaixasBAUD_BALANCA: TIntegerField;
    QCaixasCASAS_DECIMAIS: TIntegerField;
    QCaixasCASAS_DECIMAIS_UNITARIO: TIntegerField;
    QCaixasTRUNCAR_CAI: TStringField;
    QCaixasIMPRIMIR_COMPROVANTE_ECF: TStringField;
    QCaixasECF_MFD: TStringField;
    QCaixasIP_SERVIDOR_TEF: TStringField;
    QCaixasID_LOJA_TEF: TStringField;
    QCaixasID_TERMINAL_TEF: TStringField;
    QCaixasTEF_CAI: TStringField;
    QCaixasCAMINHO_BANCO: TStringField;
    QCaixasEXPORTAR_DADOS: TStringField;
    QCaixasR01_MF_ADICIONAL: TStringField;
    QCaixasR01_TIPO_ECF: TStringField;
    QCaixasR01_MARCA_ECF: TStringField;
    QCaixasR01_MODELO_ECF: TStringField;
    QCaixasR01_VERSAO_SB: TStringField;
    QCaixasR01_CNPJ_USUARIO: TStringField;
    QCaixasR01_IE_USUARIO: TStringField;
    QCaixasR01_NUMERO_SERIE: TStringField;
    QCaixasLINHA1: TStringField;
    QCaixasLINHA2: TStringField;
    QCaixasLINHA3: TStringField;
    QCaixasINDICE_GER_OS: TStringField;
    QCaixasINDICE_GER_ORCAMENTO: TStringField;
    QCaixasINDICE_GER_MESA: TStringField;
    QCaixasR01_NUMERO_USUARIO: TIntegerField;
    QCaixasCODIGO_NACIONAL_IDENTIFICACAO: TStringField;
    QCaixasR01_DATAHORA_SB: TSQLTimeStampField;
    QCaixasINTERVALO_RECEBE: TIntegerField;
    QCaixasINTERVALO_TRANSMITE: TIntegerField;
    QCaixasDIAS_ATUALIZACAO_PAF: TIntegerField;
    QCaixasCORTA_PAPEL: TStringField;
    QCaixasNFCE_SERIE: TIntegerField;
    QCaixasNFCE_NUMERO: TIntegerField;
    QCaixasFLUXO_TIPO: TIntegerField;
    QCaixasFLUXO_MOVCX_PAG: TStringField;
    QCaixasFLUXO_MOVCX_PAG_HIST: TStringField;
    QCaixasFLUXO_MOVCX_JUROS_HIST: TStringField;
    QCaixasFLUXO_MOVCX_DESC_HIST: TStringField;
    QCaixasFLUXO_RECEBIMENTO: TStringField;
    QCaixasFLUXO_RECEBIMENTO_HIST: TStringField;
    QCaixasFLUXO_RECEBIMENTO_DESC: TStringField;
    QCaixasFLUXO_RECEBIMENTO_JUROS: TStringField;
    QCaixasFLUXO_SALTO_ANTERIOR: TStringField;
    QCaixasFLUXO_TRANS_SAIDA: TStringField;
    QCaixasFLUXO_TRANS_ENTRADA: TStringField;
    QCaixasFLUXO_FATURAMENTO: TStringField;
    QCaixasFLUXO_FATURAMENTO_NOTAS: TStringField;
    QCaixasFLUXO_FATURAMENTO_VENDAS: TStringField;
    QCaixasFLUXO_TRANS: TStringField;
    QCaixasFLUXO_SANGRIA_SUPRIMETOS: TStringField;
    QCaixasFLUXO_SANGRIA: TStringField;
    QCaixasFLUXO_SUPRIMENTOS: TStringField;
    dsCaixa: TDataSource;
    chkTodosCaixas: TCheckBox;
    GroupBox2: TGroupBox;
    edtCodUsuario: TJvDBSearchComboBox;
    chkTodosUsuarios: TCheckBox;
    pnl1: TPanel;
    dsUsuarios: TDataSource;
    btnVisualizar: TButton;
    QMovimentosCOD: TIntegerField;
    QMovimentosCOD_MOV: TIntegerField;
    QMovimentosCOD_EMP: TIntegerField;
    QMovimentosCOD_CAI: TIntegerField;
    QMovimentosCOD_USU: TIntegerField;
    QMovimentosDATA_HORA: TSQLTimeStampField;
    QMovimentosDESCRICAO: TStringField;
    QMovimentosMODULO: TStringField;
    QMovimentosDOCUMENTO: TStringField;
    QMovimentosPLANO_CONTAS: TStringField;
    QMovimentosCOD_FORMA: TIntegerField;
    QMovimentosVALOR: TBCDField;
    QMovimentosCANCELADO: TIntegerField;
    QMovimentosSUB_MODULO: TStringField;
    QMovimentosNOME_USU: TStringField;
    QMovimentosDESC_CAI: TStringField;
    frxMovimentos: TfrxDBDataset;
    frxFRMovimentos: TfrxReport;
    QMovimentosDATA: TDateField;
    frxPDFExport1: TfrxPDFExport;
    QMovimentosDESC_FORMA: TStringField;
    QMovimentosDESC_PLANO: TStringField;
    QMovimentosOP_SALDO: TStringField;
    QMovimentosTIPO_DC: TStringField;
    QMovimentosCREDDEB: TStringField;
    GroupBox3: TGroupBox;
    chkInformativo: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkTodosCaixasClick(Sender: TObject);
    procedure chkTodosUsuariosClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQL: String;
  end;

var
  frmRelFluxonew: TfrmRelFluxonew;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmRelFluxonew.btnVisualizarClick(Sender: TObject);
begin
   QMovimentos.Close;
   QMovimentos.SQL.Clear;
   QMovimentos.SQL.Text := SQL;
   if not chkTodosCaixas.Checked then
      begin
         QMovimentos.SQL.Add( 'and cv.cod_cai=:COD_CAI' );
         QMovimentos.ParamByName( 'COD_CAI' ).AsInteger := QCaixasCOD_CAI.AsInteger;
      end;
   if not chkTodosUsuarios.Checked then
      begin
         QMovimentos.SQL.Add( 'and cv.cod_usu=:COD_USU' );
         QMovimentos.ParamByName( 'COD_USU' ).AsInteger := QUsuariosCOD_USU.AsInteger
      end;
   if not chkInformativo.Checked then
      QMovimentos.SQL.Add( 'and pl.OP_SALDO=''S''' );
   QMovimentos.SQL.Add( 'order by cv.data_hora, cv.cod_cai, cv.cod_usu');
   QMovimentos.ParamByName('COD_EMP' ).AsInteger :=   iEmp;
   QMovimentos.ParamByName('DATAINI').AsDateTime := edtDataIni.DateTime;
   QMovimentos.ParamByName('DATAFIM').AsDateTime := edtDataFim.DateTime;
   QMovimentos.Open;
   frxFRMovimentos.PrepareReport();
   frxFRMovimentos.ShowReport();
   QMovimentos.Close;
end;

procedure TfrmRelFluxonew.chkTodosCaixasClick(Sender: TObject);
begin
   edtCodCaixa.Enabled := not chkTodosCaixas.Checked;
end;

procedure TfrmRelFluxonew.chkTodosUsuariosClick(Sender: TObject);
begin
   edtCodUsuario.Enabled := not chkTodosUsuarios.Checked;
end;

procedure TfrmRelFluxonew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QUsuarios.Close;
   QCaixas.Close;
   if FDTRMovimentos.Active then
      FDTRMovimentos.Commit;
   Action := caFree;
end;

procedure TfrmRelFluxonew.FormShow(Sender: TObject);
begin
   chkInformativo.Checked := True;
   chkTodosCaixas.Checked := True;
   chkTodosUsuarios.Checked := True;
   chkTodosCaixasClick( nil );
   chkTodosUsuariosClick( nil );
   SQL := QMovimentos.SQL.Text;
   if FDTRMovimentos.Active then
      FDTRMovimentos.Commit;
   FDTRMovimentos.StartTransaction;
   QUsuarios.Close;
   QCaixas.Close;
   QUsuarios.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QCaixas.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QUsuarios.Open;
   QCaixas.Open;
end;

end.
