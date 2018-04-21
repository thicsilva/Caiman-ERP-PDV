unit UFechamentoOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrUtil, frxClass;

type
  TfrmFechamentoOS = class(TForm)
    Panel3: TPanel;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    EdtValorRec: TCurrencyEdit;
    EdtData: TDateTimePicker;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    EdtDesc: TCurrencyEdit;
    EdtTotalLiq: TCurrencyEdit;
    StatusBar1: TStatusBar;
    IBTR: TFDTransaction;
    QInsParcela: TFDQuery;
    dataVencimento: TDateTimePicker;
    Label2: TLabel;
    frxRecibo: TfrxReport;
    edtValorPago: TCurrencyEdit;
    Label7: TLabel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    function PrxSeq(codigo : integer) : integer;
    procedure ImpReciboFast;
    { Private declarations }
  public
    CodEmp, CodCli, CodOS : Integer;
    Cliente, Situacao : String;
    ValorPago : Double;
    { Public declarations }
  end;

var
  frmFechamentoOS: TfrmFechamentoOS;

implementation

{$R *.dfm}

uses UDM, Ubibli1, UOS, UDicFluxo, UVenda, UDialog, Extensos;

procedure TfrmFechamentoOS.FormShow(Sender: TObject);
begin
  dataVencimento.Date := Date + 30;
  EdtData.Date := Date;
end;

function TfrmFechamentoOS.PrxSeq(codigo : integer) : integer;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT MAX(SEQUENCIA_CTR) AS MAXSEQ FROM CONTAS_RECEBER WHERE COD_CTR = ' + inttostr(codigo));
             ExecOrOpen;
             result:= Fieldbyname('maxseq').AsInteger + 1;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
       AlertaCad('Erro ao buscar a sequência da parcela');
     end;
   finally
     dm.Consulta.Close;
   end;
end;

procedure TfrmFechamentoOS.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFechamentoOS.BtnOKClick(Sender: TObject);
var iCodigoCTR : Integer;
begin
  if not DicFluxo.AberturaFechamento.VerificarVendas then
     begin
       Abort;
     end;
  Situacao := 'F';
  ValorPago := 0;
  if EdtTotalLiq.Value > EdtValorRec.Value then
    begin
      if MessageDlg('Deseja finalizar a Ordem de Serviço e gerar um contas a receber do valor restante ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           with QInsParcela do
              begin
                 close;
                 iCodigoCTR := prxcod('CONTAS_RECEBER', 'COD_CTR', dm.IBTransaction, dm.ibsqlcod);
                 Parambyname('codctr').AsInteger       := iCodigoCTR;
                 Parambyname('sequenciactr').AsInteger := PrxSeq(iCodigoCTR);
                 Parambyname('codemp').AsInteger       := CodEmp;
                 Parambyname('codos').AsInteger        := CodOS;
                 Parambyname('codcli').AsInteger       := CodCli;

                 Parambyname('numdocumentoctr').Value  := CodOS;

                 Parambyname('obsctr').Value        := null;

                 Parambyname('cx').Value           := null;
                 Parambyname('codcob').Value       := 1;
                 Parambyname('parc').AsInteger         := 1;
                 Parambyname('devol').AsCurrency       := 0;
                 Parambyname('codclassif').Value   := 2;

                 Parambyname('valorctr').AsCurrency  := EdtTotalLiq.Value  - EdtValorRec.Value;
                 Parambyname('datactr').AsDate       := Date;
                 Parambyname('venctoctr').AsDate     := dataVencimento.DateTime;


                 ExecOrOpen;
              end;
        end
      else
        Situacao := 'A';
    end;
   ValorPago := EdtValorRec.Value;
   DicFluxo.Movimentos.GravarMovimento(
      'FLUXO_FATURAMENTO' ,
      'FLUXO_FATURAMENTO_VENDAS',
      'CAIXA['+ Poem_Zeros( IntToStr( DicFluxo.CodCaixa ), 3 ) +']/' +
         IntToStr(CodOS) + '/' +
         'CLIENTE[' + Cliente  + ']',
      'DN',
      EdtValorRec.Value,
      'OS[' + Poem_Zeros(CodOS, 9 ) + ']' );
  if MessageDlg('Deseja imprimir recibo ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    ImpReciboFast;
  ModalResult := mrOk;
end;

procedure TfrmFechamentoOS.ImpReciboFast;
var
    CaminhoRel: string;
begin
//
   CaminhoRel := ExtractFilePath( Application.ExeName ) + '\Report\recibo_contas.fr3';
   if not FileExists( CaminhoRel ) then
      begin
         KDialog( 'Arquivo recibo_contas.f3 não encontrado' ) ;
         exit;
      end;
   frxRecibo.LoadFromFile( CaminhoRel );
   frxRecibo.Variables[ 'data_extenso' ] := QuotedStr( FormatDateTime('dddddd',Now) );
   frxRecibo.Variables[ 'valor' ]  := QuotedStr( FormatFloat( '0.00', EdtValorRec.Value ));
   frxRecibo.Variables[ 'valor_extenso' ] := QuotedStr( extenso( EdtValorRec.Value ) );
   frxRecibo.Variables[ 'numero' ] := QuotedStr( FormataStringD( IntToStr(CodOS),
        '6', '0') + '/' + '1') ;
   frxRecibo.Variables [ 'recebido' ] := QuotedStr( Cliente );
   frxRecibo.Variables[ 'empresa' ] := QuotedStr( trim(dm.RetornaStringTabela('RAZAO_EMP', 'empresa', 'cod_emp', iEmp)) ) ;
   frxRecibo.Variables[ 'local' ] := QuotedStr( trim(dm.RetornaStringTabela('CID_EMP', 'empresa', 'cod_emp', iEmp))  + ' - ' +
   trim(dm.RetornaStringTabela('EST_EMP', 'empresa', 'cod_emp', iEmp))) ;
   frxRecibo.ShowReport( True );
end;

end.
