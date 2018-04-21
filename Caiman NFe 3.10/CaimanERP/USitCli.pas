unit USitCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, DB, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmSitCli = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LCliente: TLabel;
    Label3: TLabel;
    LSit: TLabel;
    EdtSaldo: TLabel;
    Label5: TLabel;
    EdtLimiteCredito: TCurrencyEdit;
    EdtSaldoAtual: TCurrencyEdit;
    Label7: TLabel;
    EdtLimiteCheque: TCurrencyEdit;
    Label8: TLabel;
    EdtSaldoCheque: TCurrencyEdit;
    Label9: TLabel;
    EdtChequesDev: TCurrencyEdit;
    Label10: TLabel;
    EdtDiasAtraso: UNovosComponentes.TEdit;
    QCliente: TFDQuery;
    Label2: TLabel;
    EdtSaldoDev: TCurrencyEdit;
    QCredito: TFDQuery;
    Label4: TLabel;
    EdtSaldoDevCheque: TCurrencyEdit;
    QCheque: TFDQuery;
    QChequeTOTAL_CHEQUES: TBCDField;
    Label6: TLabel;
    LTipoCredito: TLabel;
    QCreditoVALOR_BRUTO: TBCDField;
    QCreditoDIAS_ATRASO: TBCDField;
    QCreditoTAXA_JUROS: TBCDField;
    QCreditoDIAS_CARENCIA: TIntegerField;
    QCreditoTOTAL: TCurrencyField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QCreditoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSitCli: TFrmSitCli;

implementation
uses
  Udm, UVenda, UNovoPrincipal, UfechaVendaParcelas;
var iCodCli : integer;

{$R *.dfm}

procedure TFrmSitCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if (key = vk_escape) or (key = vk_return) then
      close;
end;

procedure TFrmSitCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
end;

procedure TFrmSitCli.FormShow(Sender: TObject);
var cSaldoDev, cSaldo : currency;
var iDias, iDiasNeg   : integer;
begin 
   cSaldoDev:= 0;
   iDias    := 0;
   cSaldo   := 0;

   { Nome e Código do Cliente }
   if FrmSitCli.Tag = 0 then
      begin 
         LCliente.Caption:= FrmVenda.EdtNomecli.Text;
         iCodCli:= strtoint(FrmVenda.EdtCodcli.text);
      end;
   if FrmSitCli.Tag = 1 then
      begin
         LCliente.Caption:= frmFechaVendaParcelas.edtDescCliente.Text;
         iCodCli:= strtoint(frmFechaVendaParcelas.edtCodCliente.text);
      end;

   LSit.Font.Color:= clNavy;
   LSit.Caption:= 'OK';
   EdtDiasAtraso.Text:= '0';

   { Busca nos parametros dias para negativacao }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.Consulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT DIAS_NEGATIVACAO FROM PARAMETROS WHERE COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;
         ExecOrOpen;
         iDiasNeg:= fieldbyname('dias_negativacao').AsInteger;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;

   { Limite de Crédito e Cheque no cadastro do cliente }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCliente do
          begin 
             close;
             Parambyname('codcli').AsInteger:= iCodCli;
             open;
             LCliente.Caption      := fieldbyname('nome_cli').AsString;
             EdtLimiteCredito.Text := fieldbyname('limite_cli').AsString;
             EdtLimiteCheque.Text  := fieldbyname('limite_cheque').AsString;
             if fieldbyname('tipo_credito_cli').AsString = 'PR' then
                LTipoCredito.Caption:= 'PROMISSÓRIA'
             else
                if fieldbyname('tipo_credito_cli').AsString = 'CH' then
                   LTipoCredito.Caption:= 'CHEQUE'
                else
                   if fieldbyname('tipo_credito_cli').AsString = 'CC' then
                      LTipoCredito.Caption:= 'CONTAS CORRENTE'
                   else
                      LTipoCredito.Caption:= 'PROMISSÓRIA/CHEQUE';

             if fieldbyname('bloqueado_cli').AsString = 'S' then
                begin 
                   LSit.Font.Color:= clRed;
                   LSit.Caption:= 'BLOQUEADO';
                end
             else
                begin 
                   LSit.Font.Color:= clNavy;
                   lsit.Caption:= 'OK';
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do cliente');
     end;
   finally
     QCliente.Close;
   end;

   { SALDO DE CREDITO DO CLIENTE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCredito do
          begin 
             close;
             Parambyname('codcli').AsInteger:= iCodCli;
             open;
             if recordcount > 0 then
                begin 
                   if not (trim(LSit.Caption) = 'BLOQUEADO') then
                      begin 
                         lsit.Font.Color:= clNavy;
                         lsit.Caption:= 'PENDENTE';
                      end;
                   First;
                   while not eof do
                      begin 
                         cSaldoDev:= cSaldoDev + QCreditoTOTAL.AsCurrency;
                         if QCreditoDIAS_ATRASO.AsInteger > iDias then
                            iDias:= QCreditoDIAS_ATRASO.AsInteger;
                         next;
                      end;
                   iDiasAtrazo:= iDias;
                   EdtDiasAtraso.Text:= inttostr(iDias);
                   EdtSaldoDev.Text  := currtostr(cSaldoDev);
                   cSaldo:= strtocurr(EdtLimiteCredito.Text) - cSaldoDev;
                   cSaldoCliente:= cSaldo;
                   if cSaldo >= 0 then
                      EdtSaldoAtual.Font.Color:= clNavy
                   else
                      EdtSaldoAtual.Font.Color:= clRed;
                   EdtSaldoAtual.Text:= currtostr(cSaldo);
                end
             else
                begin 
                   iDiasAtrazo:= 0;
                   EdtDiasAtraso.Text:= '0';
                   EdtSaldoDev.Text:= '0';
                   EdtSaldoAtual.Font.Color:= clNavy;
                   EdtSaldoAtual.Text := EdtLimiteCredito.Text;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do cliente');
     end;
   finally
     QCliente.Close;
   end;

   {****** Verifica se está NEGATIVADO *******}
   if not (trim(LSit.Caption) = 'BLOQUEADO') then
      begin 
         if strtoint(EdtDiasAtraso.text) > 0 then
            begin 
               lsit.Font.Color:= clNavy;
               lsit.Caption:= 'ATRASADO';
            end;
         if strtoint(EdtDiasAtraso.text) > iDiasNeg then
            begin 
               lsit.Font.Color:= clRed;
               lsit.Caption:= 'NEGATIVADO';
            end;
      end;

   {****** CHEQUES(SALDO DEVEDOR) ********}
   //tipo 1
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCheque do
          begin 
             close;
             Parambyname('codcli').Value:= iCodCli;
             Parambyname('tipo').Value:= 1;
             open;
             EdtSaldoDevCheque.Text:= QChequeTOTAL_CHEQUES.AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o dados dos cheques');
     end;
   finally
     QCheque.Close;
   end;

   {****** CHEQUES(SALDO DEVEDOR) ********}
   //tipo 2
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCheque do
          begin 
             close;
             Parambyname('codcli').Value:= iCodCli;
             Parambyname('tipo').Value:= 2;
             open;
             EdtChequesDev.Text:= QChequeTOTAL_CHEQUES.AsString;
             if QChequeTOTAL_CHEQUES.Value > 0 then
                EdtChequesDev.Font.Color:= clRed
             else
                EdtChequesDev.Font.Color:= clNavy;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o dados dos cheques');
     end;
   finally
     QCheque.Close;
   end;

   {****** SALDO ATUAL DOS CHEQUES *******}
   EdtSaldoCheque.Text:= floattostr(strtofloat(EdtLimiteCheque.text) - strtofloat(EdtSaldoDevCheque.Text) - strtofloat(EdtChequesDev.text));
   if strtofloat(EdtSaldoCheque.text) >= 0 then
      EdtSaldoCheque.Font.Color:= clNavy
   else
      EdtSaldoCheque.Font.Color:= clRed;
end;

procedure TFrmSitCli.QCreditoCalcFields(DataSet: TDataSet);
begin 
   if QCreditoDIAS_ATRASO.AsCurrency > QCreditoDIAS_CARENCIA.AsInteger then
      QCreditoTOTAL.AsCurrency:=  QCreditoVALOR_BRUTO.AsCurrency + ((QCreditoVALOR_BRUTO.AsCurrency * (QCreditoDIAS_ATRASO.Value *
                                  (QCreditoTAXA_JUROS.Value / 30))) / 100)
   else
      QCreditoTOTAL.AsCurrency:= QCreditoVALOR_BRUTO.AsCurrency;
end;

end.
