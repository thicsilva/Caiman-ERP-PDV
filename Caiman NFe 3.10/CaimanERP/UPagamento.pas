unit UPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, Mask, StdCtrls, DB, Buttons, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmPagamento = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label2: TLabel;
    EdtDesc: TCurrencyEdit;
    Label8: TLabel;
    EdtAcres: TCurrencyEdit;
    Label9: TLabel;
    EdtValorPago: TCurrencyEdit;
    BtnOk: TButton;
    BtnCancela: TButton;
    Label10: TLabel;
    Label11: TLabel;
    EdtPagto: TMaskEdit;
    QPagamento: TFDQuery;
    IBTRPagto: TFDTransaction;
    Label1: TLabel;
    EdtTotal: TCurrencyEdit;
    Label3: TLabel;
    ComboForma: TComboBox;
    GBCentroCusto: TGroupBox;
    EdtCodConta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    Label4: TLabel;
    EdtCheque: TEdit;
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtDescExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtPagtoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboFormaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagamento: TFrmPagamento;

implementation
uses
  UContasPagarPag, Udm, Ubibli1, UNovoPrincipal, UDicFluxo;

{$R *.dfm}

procedure TFrmPagamento.BtnCancelaClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmPagamento.FormShow(Sender: TObject);
begin 
   edtacres.Clear;
   edtdesc.Clear;
   ComboForma.ItemIndex:= 0;
   ComboFormaChange(self);
   edtpagto.SetFocus;
end;

procedure TFrmPagamento.EdtDescExit(Sender: TObject);
begin 
   EdtValorPago.Text := floattostr(strtofloat(EdtTotal.Text) + strtofloat(edtacres.Text) - strtofloat(edtdesc.Text));
end;

procedure TFrmPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmPagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmPagamento.BtnOkClick(Sender: TObject);
begin 
   { EFETUA O PAGAMENTO }
   if application.MessageBox('Confirma o Pagamento?', 'Contas a Pagar', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin 
         if IBTRPagto.Active then
            IBTRPagto.Commit;
         IBTRPagto.StartTransaction;
         try
           try
             FrmContasPagarPag.QConsContasPagar.First;
             while not FrmContasPagarPag.QConsContasPagar.Eof do
                begin 
                   if FrmContasPagarPag.DBGrid1.SelectedRows.CurrentRowSelected then
                      begin 
                         with QPagamento do
                            begin 
                               close;
                               sql.Clear;
                               sql.Text:= 'UPDATE CONTAS_PAGAR SET DTPAGTO_CTP = :DATA, VALOR_PAGO_CTP = :VALOR, ' +
                                          'DESCONTO_CTP = :DESCONTO, ACRESCIMO_CTP = :ACRESCIMO,                 ' +
                                          'CODIGO_FORMA_PAGAMENTO = :FORMA, CHEQUE = :CHEQUE                     ' +
                                          'WHERE COD_CPT = :CODCPT AND SEQUENCIA_CTP = :SEQ';

                               Parambyname('data').AsDate            := strtodate(edtpagto.Text);
                               Parambyname('valor').AsCurrency       := FrmContasPagarPag.QConsContasPagarVALOR_CTP.AsCurrency + strtocurr(EdtAcres.Text) - strtocurr(EdtDesc.Text);
                               Parambyname('desconto').AsCurrency    := strtocurr(EdtDesc.Text);
                               Parambyname('acrescimo').AsCurrency   := strtocurr(EdtAcres.Text);
                               Parambyname('codcpt').AsInteger       := FrmContasPagarPag.QConsContasPagarCOD_CPT.AsInteger;
                               Parambyname('seq').AsInteger          := FrmContasPagarPag.QConsContasPagarSEQUENCIA_CTP.AsInteger;
                               Parambyname('forma').AsInteger        := strtoint(copy(ComboForma.Text, 1, 2));
                               Parambyname('cheque').AsString        := trim(EdtCheque.Text);
                               DicFluxo.Movimentos.GravarMovimentoForma(
                                   'FLUXO_PAGAR',
                                   'FLUXO_PAGAR_CHAVE',
                                   Format( 'PAGAMENTO CPT.:[%s/%s]<%s>',
                                      [ FrmContasPagarPag.QConsContasPagarCOD_CPT.AsString,
                                        FrmContasPagarPag.QConsContasPagarSEQUENCIA_CTP.AsString,
                                        ComboForma.Text] ),
                                   StrToInt(copy(ComboForma.Text, 1, 2)),
                                   FrmContasPagarPag.QConsContasPagarVALOR_CTP.AsCurrency + strtocurr(EdtAcres.Text) - strtocurr(EdtDesc.Text),
                                   ''  );
                               ExecOrOpen;
                            end;
                      end;
                   FrmContasPagarPag.QConsContasPagar.Next;
                end;
             IBTRPagto.Commit;
           except
             IBTRPagto.Rollback;
             AlertaCad('Erro ao efetuar os Pagamentos');
           end;
         finally
             QPagamento.Close;
             FrmContasPagarPag.BtnOk.Click;
             close;
         end;
      end;
end;

procedure TFrmPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmPagamento.EdtPagtoExit(Sender: TObject);
begin 
   if BtnCancela.Focused then
      exit;
   try
     strtodate(edtpagto.Text);
   except
     AlertaCad('Data Inválida');
//     edtpagto.SetFocus;
   end;
end;

procedure TFrmPagamento.FormCreate(Sender: TObject);
begin 
   { busca as formas de pagamento ref. contas a receber }
   
   ComboForma.Clear;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE USAR_CONTAS_PAGAR = ' + #39 + 'S' + #39 +
                        ' ORDER BY CODIGO';
             open;
             while not eof do
                begin 
                   ComboForma.Items.Add(FormataStringD(fieldbyname('codigo').AsString, '2', '0') + '-' + fieldbyname('descricao').AsString);
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TFrmPagamento.ComboFormaChange(Sender: TObject);
begin 
   { busca a conta relacionada com a forma de pagamento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT F.CODIGO_CONTA_CTP, C.NOME_CONTA ' +
                        'FROM FORMAS_PAGAMENTO F   ' +
                        'INNER JOIN CONTAS_CORRENTE C ' +
                        'ON (F.CODIGO_CONTA_CTP = C.COD_CONTA) ' +
                        'WHERE F.CODIGO = :CODIGO';
             Parambyname('codigo').AsInteger:= strtoint(copy(ComboForma.Text, 1, 2));
             open;
             EdtCodConta.Text  := fieldbyname('codigo_conta_ctp').AsString;
             EdtNomeConta.Text := fieldbyname('nome_conta').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a conta');
       EdtCodConta.clear;
       EdtNomeConta.Clear;
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

end.
