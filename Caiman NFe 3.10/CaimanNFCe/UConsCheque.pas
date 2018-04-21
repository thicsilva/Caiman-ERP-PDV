unit UConsCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons, DB, Grids, DBGrids, 
  dxCore, rxToolEdit, rxCurrEdit, UVendasCaixa, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsCheque = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Panel3: TPanel;
    DSConsCheque: TDataSource;
    DBGrid1: TDBGrid;
    QConsCheque: TFDQuery;
    EdtCodCli: TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Panel2: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MemoObs: TMemo;
    EdtChequesDev: TCurrencyEdit;
    EdtLimite: TCurrencyEdit;
    EdtSaldo: TCurrencyEdit;
    EdtChequesAberto: TCurrencyEdit;
    LTipoCredito: TLabel;
    LAtivo: TLabel;
    Label2: TLabel;
    EdtChequesOK: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    QCliente: TFDQuery;
    BtnLocalizar: TButton;
    BtnCliente: TButton;
    BtnSair: TButton;
    QConsChequeCOD_CHE: TIntegerField;
    QConsChequeCOD_CLI: TIntegerField;
    QConsChequeCOD_BANCO: TIntegerField;
    QConsChequeAGENCIA_CHE: TStringField;
    QConsChequeCONTA_CHE: TStringField;
    QConsChequeNUMERO_CHE: TStringField;
    QConsChequeEMITENTE_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeVENCTO_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequeCOD_CONTA: TIntegerField;
    QConsChequePRIDEP_CHE: TDateField;
    QConsChequeSEGDEP_CHE: TDateField;
    QConsChequePRIDEV_CHE: TDateField;
    QConsChequeSEGDEV_CHE: TDateField;
    QConsChequePAGTODEV_CHE: TDateField;
    QConsChequeOBS_CHE: TStringField;
    QConsChequeCOD_EMP: TIntegerField;
    QConsChequeCOD_VENDA: TIntegerField;
    QConsChequeDESTINO_CHE: TStringField;
    QConsChequeCOD_REPASSE: TIntegerField;
    QConsChequeSELECIONADO_CHE: TStringField;
    QConsChequeCOD_CTR: TIntegerField;
    QConsChequeCOD_EMITENTE: TIntegerField;
    QConsChequeCOD_CAIXA: TIntegerField;
    QConsChequeCOD_USUARIO: TIntegerField;
    QConsChequeCODIGO_PAF: TIntegerField;
    QConsChequeDESC_CLIENTE: TStringField;
    QConsChequeDESC_EMITENTE: TStringField;
    QConsChequeCALC_STATUS: TStringField;
    QConsChequeNOME_BAN: TStringField;
    BtnSelecionarCliente: TButton;
    BtnCancelar: TButton;
    procedure QConsChequeCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnClienteClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BuscaCheques;
    procedure Limpa;
    procedure BtnSelecionarClienteClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCheque: TFrmConsCheque;

implementation
uses
  Udm, UDadosCheque, UDadosCadCliente, UConsCli, UsenhaLiberarVenda, 
  UMenuFiscal;

{$R *.dfm}

procedure TFrmConsCheque.Limpa;
begin
   EdtCodCli.Text:= inttostr(iCodCliente);
   MemoOBS.Clear;
   EdtChequesOK.Clear;
   EdtLimite.Clear;
   EdtChequesAberto.Clear;
   EdtChequesDev.Clear;
   EdtSaldo.Clear;
   LAtivo.Caption:= '';
   LTipoCredito.Caption:= '';
   //EdtCodCliExit(self);
end;

procedure TFrmConsCheque.QConsChequeCalcFields(DataSet: TDataSet);
begin
   if not QConsChequePAGTODEV_CHE.IsNull then
      QConsChequeCALC_STATUS.AsString:= 'PAGO'
   else
      if not QConsChequeSEGDEV_CHE.IsNull then
         QConsChequeCALC_STATUS.AsString:= '2ª DEVOLUÇÃO'
      else
         if not QConsChequeSEGDEP_CHE.IsNull then
            QConsChequeCALC_STATUS.AsString:= '2º DEPOSITO'
         else
            if not QConsChequePRIDEV_CHE.IsNull then
               QConsChequeCALC_STATUS.AsString:= '1ª DEVOLUÇÃO'
            else
               if not QConsChequePRIDEP_CHE.IsNull then
                  QConsChequeCALC_STATUS.AsString:= '1º DEPOSITO'
               else
                  QConsChequeCALC_STATUS.AsString:= 'ABERTO';
end;

procedure TFrmConsCheque.FormShow(Sender: TObject);
begin
   limpa;
end;

procedure TFrmConsCheque.BuscaCheques;
var caDepositar, cDepositado, cDevolvido, cPago, cSaldo : currency;
begin
   caDepositar:= 0;
   cDepositado:= 0;
   cDevolvido := 0;
   cPago      := 0;
   cSaldo     := 0;

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QConsCheque do
      begin
         close;
         Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
         Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
         Open;
         First;
         DisableControls;
         while not eof do
             begin
                if not QConsChequePAGTODEV_CHE.IsNull then
                   cPago:= cPago + QConsChequeVALOR_CHE.AsCurrency
                else
                if not QConsChequeSEGDEV_CHE.IsNull then
                   cDevolvido:= cDevolvido + QConsChequeVALOR_CHE.AsCurrency
                else
                if not QConsChequeSEGDEP_CHE.IsNull then
                   cDepositado:= cDepositado + QConsChequeVALOR_CHE.AsCurrency
                else
                if not QConsChequePRIDEV_CHE.IsNull then
                   cDevolvido:= cDevolvido + QConsChequeVALOR_CHE.AsCurrency
                else
                if not QConsChequePRIDEP_CHE.IsNull then
                   cDepositado:= cDepositado + QConsChequeVALOR_CHE.AsCurrency
                else
                   caDepositar:= caDepositar + QConsChequeVALOR_CHE.AsCurrency;
                next;
             end;
         First;
         EnableControls;
         DBGrid1.SetFocus;

         EdtChequesOK.Text    := currtostr(cDepositado + cPago);
         EdtChequesAberto.Text:= currtostr(caDepositar);
         EdtChequesDev.Text   := currtostr(cDevolvido);
         cSaldo               := strtocurr(EdtLimite.Text) - cDevolvido - caDepositar;
         EdtSaldo.Text        := currtostr(cSaldo);
         if cSaldo >= 0 then
            EdtSaldo.Font.Color:= clNavy
         else
            EdtSaldo.Font.Color:= clRed;
      end;
end;

procedure TFrmConsCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
      
   if key = vk_f2 then
      EdtCodCli.SetFocus;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmConsCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if QConsCheque.Transaction.Active then
      QConsCheque.Transaction.Commit;
   QConsCheque.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsCheque.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsCheque.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsCheque.BtnLocalizarClick(Sender: TObject);
begin
   Application.CreateForm(TFrmDadosCheque, FrmDadosCheque);
   with FrmDadosCheque do
      begin
         EdtCod.Text       := QConsChequeCOD_CHE.AsString;
         EdtDataEmi.Text   := QConsChequeEMISSAO_CHE.AsString;
         EdtDataVenc.Text  := QConsChequeVENCTO_CHE.AsString;
         EdtValor.Text     := QConsChequeVALOR_CHE.AsString;
         EdtcodCli.text    := QConsChequeCOD_CLI.AsString;
         EdtNomeCli.Text   := EdtNomeCli.Text;
         EdtCodBanco.Text  := QConsChequeCOD_BANCO.AsString;
         EdtNomeBanco.Text := QConsChequeNOME_BAN.AsString;
         EdtAgencia.Text   := QConsChequeAGENCIA_CHE.AsString;
         EdtConta.Text     := QConsChequeCONTA_CHE.AsString;
         EdtNumero.Text    := QConsChequeNUMERO_CHE.AsString;
         EdtEmitente.Text  := QConsChequeDESC_EMITENTE.AsString;
         EdtObs.Text       := QConsChequeOBS_CHE.AsString;
         showmodal;
      end;
end;

procedure TFrmConsCheque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if (QConsChequeCALC_STATUS.AsString = '1ª DEVOLUÇÃO') or (QConsChequeCALC_STATUS.AsString = '2ª DEVOLUÇÃO') then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsCheque.BtnClienteClick(Sender: TObject);
begin
   Application.CreateForm(TFrmDadosCadCliente, FrmDadosCadCliente);
   FrmDadosCadCliente.EdtCod.Text := EdtCodCli.Text;
   FrmDadosCadCliente.EdtNome.Text:= EdtNomeCli.Text;
   FrmDadosCadCliente.ShowModal;
end;

procedure TFrmConsCheque.EdtCodCliEnter(Sender: TObject);
begin
   edtcodcli.SelectAll;
end;

procedure TFrmConsCheque.EdtCodCliExit(Sender: TObject);
var bAux : boolean;
begin
   bAux:= false;
   if BtnSair.Focused then
      exit;

   if QCliente.Transaction.Active then
      QCliente.Transaction.Commit;
   QCliente.Transaction.StartTransaction;
   try
     try
       with QCliente do
          begin
             close;
             Parambyname('codcli').AsInteger := strtoint(edtcodcli.Text);
             open;
             if not fieldbyname('cod_cli').IsNull then
                begin
                   bAux:= true;
                   if trim(fieldbyname('bloqueado_cli').AsString) = 'S' then
                      begin
                         LAtivo.Font.Color:= clRed;
                         LAtivo.Caption:= 'CLIENTE BLOQ.';
                      end
                   else
                      begin
                         LAtivo.Font.Color:= clNavy;
                         LAtivo.Caption:= '';
                      end;
                   EdtNomeCli.Text      := fieldbyname('nome_cli').AsString;
                   LTipoCredito.Caption := fieldbyname('tipo_credito_cli').AsString;
                   EdtLimite.Text       := fieldbyname('limite_cheque').AsString;
                   MemoObs.Text         := fieldbyname('obs_venda').AsString;
                   if trim(fieldbyname('CONTROLAR_LIMITE').AsString) = 'S' then
                      bContLimiteCliente:= true
                   else
                      bContLimiteCliente:= false;
                end
             else
                begin
                   bAux:= false;
                   Limpa;
                   showmessage('Cliente não Cadastrado');
                   edtcodcli.SetFocus;
                end;
          end;
       QCliente.Transaction.Commit;
     except
       QCliente.Transaction.Rollback;
       showmessage('Erro ao buscar o cliente');
       edtnomecli.Clear;
       memoobs.Clear;
       edtcodcli.SetFocus;
     end;
   finally
     QCliente.Close;
   end;

   if bAux then
      BuscaCheques;
end;

procedure TFrmConsCheque.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCli.Click;
end;

procedure TFrmConsCheque.EdtCodCliKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsCheque.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 3;
   FrmConsCli.showmodal;
end;

procedure TFrmConsCheque.BtnSelecionarClienteClick(Sender: TObject);
begin
   if (bContLimiteCliente) and ((strtocurr(EdtLimite.Text) = 0) or (strtocurr(EdtSaldo.Text) <= 0)) then
      begin
         Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
         FrmSenhaLiberaVenda.tag:= 0;
         FrmSenhaLiberaVenda.showmodal;
         if not bVendaLiberada then
            exit;
      end;

   iCodCliente   := strtoint(EdtCodCli.Text);
   cSaldoCliente := strtofloat(EdtSaldo.text);

   FrmVendasCaixa.info2.Caption := EdtNomeCli.Text;
    FrmVendasCaixa.info3.Caption := 'Tipo venda : CHEQUE';
   iFormaPagamento:= dm.BuscaFormaPagamento('CH');

   close;
end;

procedure TFrmConsCheque.BtnCancelarClick(Sender: TObject);
begin
   FrmVendasCaixa.info2.Caption := '';
    FrmVendasCaixa.info3.Caption := '';
   iFormaPagamento:= dm.BuscaFormaPagamento('DN');
   FrmVendasCaixa.BuscaPadroes;
end;

end.
