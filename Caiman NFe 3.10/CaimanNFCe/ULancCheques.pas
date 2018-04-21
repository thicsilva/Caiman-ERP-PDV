unit ULancCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, rxToolEdit, rxCurrEdit, Mask, Buttons, StdCtrls, ComCtrls, ExtCtrls, 
  Grids, DBGrids, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancCheques = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    IBSQLCheque: TFDQuery;
    IBTRLancCheque: TFDTransaction;
    QConsCheque: TFDQuery;
    DSQConsCheque: TDataSource;
    QConsChequeCOD_CHE: TIntegerField;
    QConsChequeCOD_BANCO: TIntegerField;
    QConsChequeAGENCIA_CHE: TStringField;
    QConsChequeCONTA_CHE: TStringField;
    QConsChequeNUMERO_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeVENCTO_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequeNOME_CLI: TStringField;
    BtnExcluir: TBitBtn;
    QConsChequeNOME_BAN: TStringField;
    Label4: TLabel;
    EdtCodCliente: TEdit;
    BtnConsCli: TsSpeedButton;
    Label22: TLabel;
    EdtCodEmitente: TEdit;
    BtnConsEmitente: TsSpeedButton;
    Label2: TLabel;
    EdtCodBanco: TEdit;
    BtnConsBanco: TsSpeedButton;
    Label6: TLabel;
    EdtAgencia: TEdit;
    Label7: TLabel;
    EdtConta: TEdit;
    Label8: TLabel;
    EdtNumero: TEdit;
    Label10: TLabel;
    EdtDataEmi: TMaskEdit;
    Label11: TLabel;
    EdtDataVenc: TMaskEdit;
    Label12: TLabel;
    EdtValor: TCurrencyEdit;
    Label13: TLabel;
    EdtObs: TEdit;
    Label5: TLabel;
    EdtNomeCliente: TEdit;
    Label23: TLabel;
    EdtNomeEmitente: TEdit;
    Label3: TLabel;
    EdtNomeBanco: TEdit;
    Label1: TLabel;
    cod_che: TEdit;
    Label19: TLabel;
    EdtDias: TEdit;
    QConsChequeEMITENTE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Buscacheque;
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnConsEmitenteClick(Sender: TObject);
    procedure BtnConsBancoClick(Sender: TObject);
    procedure EdtCodClienteEnter(Sender: TObject);
    procedure EdtCodClienteExit(Sender: TObject);
    procedure EdtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodEmitenteEnter(Sender: TObject);
    procedure EdtCodEmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodBancoEnter(Sender: TObject);
    procedure EdtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodBancoExit(Sender: TObject);
    procedure EdtDiasEnter(Sender: TObject);
    procedure EdtDiasExit(Sender: TObject);
    procedure AtualizaClienteVenda(const iCodCliente : integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancCheques: TFrmLancCheques;

implementation
uses
  Udm, Ubibli1, UConsBanco, UVendasCaixa, UConsCli, UFechaVenda, UVendasPED;

{$R *.dfm}

procedure TFrmLancCheques.AtualizaClienteVenda(const iCodCliente : integer);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE VENDAS SET COD_CLI = :CODCLI WHERE COD_VEN = :CODVEN';
             Parambyname('codcli').AsInteger:= iCodCliente;
             if FrmLancCheques.Tag = 10 then
                Parambyname('codven').AsInteger:= strtoint(FrmVendasPED.EdtCodigo.Text)
             else
                Parambyname('codven').AsInteger:= iCodigoVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao gravar o cliente na venda');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmLancCheques.Buscacheque;
begin
   if IBTRLancCheque.Active then
      IBTRLancCheque.Commit;
   IBTRLancCheque.StartTransaction;
   with QConsCheque do
      begin
         close;
         if FrmLancCheques.Tag = 10 then
            Parambyname('codvenda').AsInteger:= strtoint(FrmVendasPED.EdtCodigo.text)
         else
            ParamByName('codvenda').AsInteger:= iCodigoVenda;
         open;
      end;
   IBTRLancCheque.CommitRetaining;
end;

procedure TFrmLancCheques.FormShow(Sender: TObject);
begin

   Limpaedit(FrmLancCheques);
   EdtDataEmi.Text:= datetostr(date);
   if tag = 0 then  //fechavenda
      EdtValor.Text:= currtostr(FrmFechaVenda.TotalizaFormasPagamento('CH'));

   EdtDias.SetFocus;
end;

procedure TFrmLancCheques.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmLancCheques.BtnOKClick(Sender: TObject);
begin
   if IBTRLancCheque.Active then
      IBTRLancCheque.Commit;
   IBTRLancCheque.StartTransaction;
   try
     try
       with IBSQLCheque do
          begin
             close;
             sql.Clear;
             cod_che.Text:= inttostr(prxcod('cheque', 'cod_che', dm.IBTransaction, dm.ibsqlcod));
             sql.Add('INSERT INTO CHEQUE(COD_CHE, COD_CLI, COD_BANCO, AGENCIA_CHE, ' +
                     'CONTA_CHE, NUMERO_CHE, EMISSAO_CHE, VENCTO_CHE, VALOR_CHE, OBS_CHE, COD_EMP, ' +
                     'COD_EMITENTE, COD_VENDA, COD_CAIXA, COD_USUARIO, DESC_CLI, DESC_EMI, DESC_BANCO) ' +
                     'VALUES(:CODCHE, :CODCLI, :CODBANCO, :AGENCIACHE, :CONTACHE, :NUMEROCHE, ' +
                     ':EMISSAOCHE, :VENCTOCHE, :VALORCHE, :OBSCHE, :CODEMP, :CODEMITENTE, ' +
                     ':CODVENDA, :CODCAIXA, :CODUSU, :DESC_CLI, :DESC_EMI, :DESC_BANCO)');
             Parambyname('codche').AsInteger        := strtoint(cod_che.Text);
             Parambyname('codcli').AsInteger        := strtoint(EdtCodCliente.Text);
             Parambyname('codbanco').AsInteger      := strtoint(EdtCodBanco.Text);
             Parambyname('agenciache').AsString     := edtagencia.Text;
             Parambyname('contache').AsString       := edtconta.Text;
             Parambyname('numeroche').AsString      := edtnumero.Text;
             Parambyname('emissaoche').AsDate       := strtodate(edtdataemi.Text);
             Parambyname('venctoche').AsDate        := strtodate(edtdatavenc.Text);
             Parambyname('valorche').AsCurrency     := strtocurr(edtvalor.Text);
             Parambyname('obsche').AsString         := edtobs.Text;
             Parambyname('codemp').AsInteger        := iEmp;
             Parambyname('codemitente').AsInteger   := strtoint(EdtCodEmitente.Text);
             ParamByName('DESC_CLI').AsString       := EdtNomeCliente.Text;
             ParamByName('DESC_EMI' ).AsString      := EdtNomeEmitente.Text;
             ParamByName('DESC_BANCO').AsString     := EdtNomeBanco.Text;
             if FrmLancCheques.Tag = 10 then
                Parambyname('codvenda').AsInteger   := strtoint(FrmVendasPED.EdtCodigo.Text)
             else
                Parambyname('codvenda').AsInteger   := iCodigoVenda;
             Parambyname('codcaixa').AsInteger      := iCaixa;
             Parambyname('codusu').AsInteger        := ICodUsu;
             ExecOrOpen;
          end;
       IBTRLancCheque.Commit;
     except
       IBTRLancCheque.Rollback;
       showmessage('Erro ao Gravar o Cheque');
     end;
   finally
     AtualizaClienteVenda(strtoint(EdtCodCliente.Text));
     Limpaedit(FrmLancCheques);

     IBSQLCheque.Close;
     buscacheque;
     EdtDias.SetFocus;
   end;
end;

procedure TFrmLancCheques.BtnExcluirClick(Sender: TObject);
var iCodigoCheque : integer;
begin
   if Application.MessageBox('Confirma a Exclusão do Cheque?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         iCodigoCheque:= QConsChequeCOD_CHE.AsInteger;
         if IBTRLancCheque.Active then
            IBTRLancCheque.Commit;
         IBTRLancCheque.StartTransaction;
         try
           try
             with IBSQLCheque do
                begin
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM CHEQUE WHERE COD_CHE = :CODIGO');
                   Parambyname('codigo').AsInteger:= iCodigoCheque;
                   ExecOrOpen;
                end;
             IBTRLancCheque.Commit;
           except
             IBTRLancCheque.Rollback;
             showmessage('Erro ao Excluir o Cheque');
           end;
         finally
           IBSQLCheque.Close;
           Buscacheque;
         end;
      end;
end;

procedure TFrmLancCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRLancCheque.Active then
      IBTRLancCheque.Commit;
   IBSQLCheque.Close;
   QConsCheque.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmLancCheques.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmLancCheques.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmLancCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmLancCheques.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 4;
   FrmConsCli.ShowModal;
end;

procedure TFrmLancCheques.BtnConsEmitenteClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 5;
   FrmConsCli.ShowModal;
end;

procedure TFrmLancCheques.BtnConsBancoClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsBanco, FrmConsBanco);
   FrmConsBanco.tag:= 4;
   frmConsbanco.showmodal;
end;

procedure TFrmLancCheques.EdtCodClienteEnter(Sender: TObject);
begin
   EdtCodCliente.SelectAll;
end;

procedure TFrmLancCheques.EdtCodClienteExit(Sender: TObject);
begin
   if BtnSair.Focused then
     exit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_CLI, NOME_CLI, TIPO_CREDITO_CLI, BLOQUEADO_CLI ' +
                        'FROM CLIENTE ' +
                        'WHERE COD_CLI = :CODCLI';
             if sender = EdtCodCliente then
                Parambyname('codcli').AsInteger:= strtoint(EdtCodCliente.Text)
             else
                Parambyname('codcli').AsInteger:= strtoint(EdtCodEmitente.Text);
             Open;
             if not (fieldbyname('cod_cli').IsNull) then
                begin
                   if trim(fieldbyname('bloqueado_cli').AsString) = 'S' then
                      begin
                         if sender = EdtCodCliente then
                            begin
                               EdtNomeCliente.Clear;
                               showmessage('Cliente BLOQUEADO');
                               EdtCodCliente.SetFocus;
                            end
                        else
                            begin
                               EdtNomeEmitente.Clear;
                               showmessage('Cliente BLOQUADO');
                               EdtCodEmitente.SetFocus;
                            end;
                      end
                   else
                      begin
                         if (trim(fieldbyname('tipo_credito_cli').AsString) = 'CH') or (trim(fieldbyname('tipo_credito_cli').AsString) = 'PC') then
                            begin
                               if sender = EdtCodCliente then
                                  EdtNomeCliente.Text:= fieldbyname('nome_cli').AsString
                               else
                                  EdtNomeEmitente.Text:= fieldbyname('nome_cli').AsString;
                            end
                         else
                             begin
                                if sender = EdtCodCliente then
                                   begin
                                      EdtNomeCliente.Clear;
                                      showmessage('Cliente não tem como tipo de crédito CHEQUE/TODOS');
                                      EdtCodCliente.SetFocus;
                                   end
                                else
                                   begin
                                      EdtNomeEmitente.Clear;
                                      showmessage('Cliente não tem como tipo de crédito CHEQUE/TODOS');
                                      EdtCodEmitente.SetFocus;
                                   end;
                             end;
                      end;
                end
             else
                begin
                   if sender = EdtCodCliente then
                      begin
                         EdtNomeCliente.Clear;
                         showmessage('Cliente não Cadastrado');
                         EdtCodCliente.SetFocus;
                      end
                   else
                      begin
                         EdtNomeEmitente.Clear;
                         showmessage('Cliente não Cadastrado');
                         EdtCodEmitente.SetFocus;
                      end;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados do cliente');
       if sender = EdtCodCliente then
          EdtCodCliente.SetFocus
       else
          EdtCodEmitente.SetFocus;
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmLancCheques.EdtCodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCli.Click;
end;

procedure TFrmLancCheques.EdtCodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmLancCheques.EdtCodEmitenteEnter(Sender: TObject);
begin
   EdtCodEmitente.SelectAll;
end;

procedure TFrmLancCheques.EdtCodEmitenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsEmitente.Click;
end;

procedure TFrmLancCheques.EdtCodBancoEnter(Sender: TObject);
begin
   EdtCodBanco.SelectAll;
end;

procedure TFrmLancCheques.EdtCodBancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsBanco.Click;
end;

procedure TFrmLancCheques.EdtCodBancoExit(Sender: TObject);
begin
   if BtnSair.Focused then
      exit;
   EdtNomeBanco.Text:= consulta('banco', EdtCodBanco, 'cod_ban', 'nome_ban', dm.IBTransaction, dm.qConsulta);
   if edtnomebanco.Text = '' then
      begin
         showmessage('Banco não Cadastrado');
         EdtCodBanco.SetFocus;
      end;
end;

procedure TFrmLancCheques.EdtDiasEnter(Sender: TObject);
begin
   EdtDias.SelectAll;
end;

procedure TFrmLancCheques.EdtDiasExit(Sender: TObject);
begin
   if trim(EdtDias.Text) = '' then
      exit;

   if StrToInt(EdtDias.Text) > 0 then
      EdtDataVenc.Text:= datetostr(date + StrToInt(EdtDias.Text))
   else
      begin
         EdtDataVenc.Text:= datetostr(date )
      end;
end;

end.
