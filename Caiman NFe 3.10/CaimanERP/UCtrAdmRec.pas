unit UCtrAdmRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls, DB, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmCtrAdmRec = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    Label1: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    EdtAcres: TCurrencyEdit;
    Label2: TLabel;
    EdtDesc: TCurrencyEdit;
    Label3: TLabel;
    EdtTotalLiq: TCurrencyEdit;
    Label4: TLabel;
    QBaixa: TFDQuery;
    IBTRAdm: TFDTransaction;
    Label6: TLabel;
    EdtData: TDateTimePicker;
    GBCentroCusto: TGroupBox;
    BtnConsCentroCusto: TsSpeedButton;
    EdtCodCentroCusto: UNovosComponentes.TEdit;
    EdtCentroCusto: TMaskEdit;
    EdtNomeCentroCusto: TEdit;
    EdtCodConta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    BtnConsConta: TsSpeedButton;
    QInsertCC: TFDQuery;
    QInsertCCCODIGO: TIntegerField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcresExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LancamentoContasCorrente(const cValor : currency; const sHistorico, sDocumento : string);
    procedure BtnConsContaClick(Sender: TObject);
    procedure BtnConsCentroCustoClick(Sender: TObject);
    procedure EdtCodContaEnter(Sender: TObject);
    procedure EdtCodContaExit(Sender: TObject);
    procedure EdtCodContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCentroCustoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCtrAdmRec: TFrmCtrAdmRec;

implementation
uses
  Udm, Ubibli1, URecAdm, UConsConta, UConsCentroCusto, UNovoPrincipal;

{$R *.dfm}

procedure TFrmCtrAdmRec.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmCtrAdmRec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmCtrAdmRec.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCtrAdmRec.EdtAcresExit(Sender: TObject);
begin 
   EdtTotalLiq.Text:= floattostr(strtofloat(EdtTotalBruto.text) + strtofloat(EdtAcres.text) -
                      strtofloat(EdtDesc.text));
end;

procedure TFrmCtrAdmRec.BtnOKClick(Sender: TObject);
var cTaxaAcres, cTaxaDesc, cTotal : currency;
begin 
   if (trim(EdtCodConta.Text) <> '') and (Trim(EdtCodCentroCusto.Text) = '') then
       begin 
          AlertaCad('Digite o Centro de Custo');
//          EdtCentroCusto.SetFocus;
          exit;
       end;

   if (trim(EdtCodConta.Text) = '') and (Trim(EdtCodCentroCusto.Text) <> '') then
       begin 
          AlertaCad('Digite o Código da Conta');
//          EdtCodConta.SetFocus;
          exit;
       end;

   if Application.MessageBox('Confirma o Recebimento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         cTaxaAcres:= (StrToCurr(EdtAcres.text) * 100) / StrToCurr(EdtTotalBruto.text);
         cTaxaDesc := (StrToCurr(EdtDesc.text)  * 100)  / StrToCurr(EdtTotalBruto.text);
         if IBTRAdm.Active then
            IBTRAdm.Commit;
         IBTRAdm.StartTransaction;
         try
           try
             with QBaixa do
                begin 
                   FrmRECADM.QRecAdm.First;
                   while not FrmRECADM.QRecAdm.Eof do
                      begin 
                         if FrmRECADM.DBGrid1.SelectedRows.CurrentRowSelected = true then
                            begin 
                               cTotal:= FrmRECADM.QRecAdmLIQUIDO.AsCurrency +
                                        ((FrmRECADM.QRecAdmLIQUIDO.AsCurrency * cTaxaAcres) / 100) -
                                        ((FrmRECADM.QRecAdmLIQUIDO.AsCurrency * cTaxaDesc) / 100);
                               close;
                               Parambyname('data').Value           := EdtData.Date;
                               Parambyname('acres').AsCurrency     := (FrmRECADM.QRecAdmLIQUIDO.AsCurrency * cTaxaAcres) / 100;
                               Parambyname('desc').AsCurrency      := (FrmRECADM.QRecAdmLIQUIDO.AsCurrency * cTaxaDesc) / 100;
                               Parambyname('valorpago').AsCurrency := cTotal;
                               Parambyname('codigo').AsInteger     := FrmRECADM.QRecAdmCODIGO.AsInteger;
                               ExecOrOpen;

                               if trim(EdtCodConta.Text) <> '' then
                                  begin 
                                     LancamentoContasCorrente(cTotal, 'Receb.' + FrmRECADM.QRecAdmNOME_CLI.AsString + ' Cartão ' + FrmRECADM.QRecAdmDOCUMENTO.AsString, FrmRECADM.QRecAdmDOCUMENTO.AsString) ;
                                  end;

                            end;
                         FrmRECADM.QRecAdm.Next;
                      end;
                end;
             IBTRAdm.Commit;
           except
             IBTRAdm.Rollback;
             AlertaCad('Erro ao Baixar as Parcelas');
           end;
         finally
           QBaixa.Close;
           FrmRECADM.BtnOk.Click;
           close;
         end;
      end;
end;

procedure TFrmCtrAdmRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRAdm.Active then
      IBTRAdm.Commit;
   QBaixa.Close;
   Action:= caFree;
end;

procedure TFrmCTRAdmRec.LancamentoContasCorrente(const cValor : currency; const sHistorico, sDocumento : string);
var iCodigoLancamento : integer;
    sDebCred : string;
begin 
   sDebCred:= dm.RetornaStringTabela('debcred', 'centro_custo', 'codigo', strtoint(EdtCodCentroCusto.Text));

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsertCC do
          begin 
             close;
             Parambyname('codconta').AsInteger := strtoint(EdtCodConta.Text);
             Parambyname('dataemi').Value      := EdtData.date;
             Parambyname('datavenc').Value     := EdtData.date;
             Parambyname('numcheque').Value    := null;
             Parambyname('valor').AsCurrency   := cValor;
             Parambyname('conc').asInteger     := 0;
             Parambyname('DC').AsString        := trim(sDebCred);
             Parambyname('hist').asString      := sHistorico;
             Parambyname('coddoc').asinteger   := 1;
             Parambyname('doc').asString       := sDocumento;
             Parambyname('codemp').AsInteger   := iEmp;
             open;
             iCodigoLancamento:= QInsertCCCODIGO.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro lançando no Contas Corrente');
     end;
   finally
     QInsertCC.Close;
   end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO LANCAMENTOS_CENTRO_CUSTO (COD_LAN, COD_CENTRO_CUSTO, VALOR) ' +
                       'VALUES (:CODLAN, :CENTRO, :VALOR)';
            Parambyname('codlan').AsInteger := iCodigoLancamento;
            Parambyname('centro').AsInteger := strtoint(EdtCodCentroCusto.Text);
            Parambyname('valor').AsCurrency := cValor;
            ExecOrOpen;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao gravar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCtrAdmRec.BtnConsContaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 16;
   FrmConsConta.showmodal;
end;

procedure TFrmCtrAdmRec.BtnConsCentroCustoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
   FrmConsCentroCusto.Tag:= 10;
   FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCtrAdmRec.EdtCodContaEnter(Sender: TObject);
begin 
   EdtCodConta.SelectAll;
end;

procedure TFrmCtrAdmRec.EdtCodContaExit(Sender: TObject);
begin 
   if BtnCancelar.Focused then
     exit;

   if trim(EdtCodConta.Text) = '' then
      begin 
         EdtNomeConta.Clear;
         exit;
      end;

  EdtNomeConta.Text:= Consulta('contas_corrente', EdtCodConta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Erro ao buscar a Conta');
//        EdtCodConta.SetFocus;
     end;
end;

procedure TFrmCtrAdmRec.EdtCodContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConta.Click;
end;

procedure TFrmCtrAdmRec.EdtCodContaKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmCtrAdmRec.EdtCentroCustoExit(Sender: TObject);
begin 
   if BtnCancelar.Focused then
     exit;

  if trim(EdtCentroCusto.Text) = '' then
     begin 
        EdtCodCentroCusto.Clear;
        EdtNomeCentroCusto.Clear;
        exit;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.Text:= 'SELECT CODIGO, DESCRICAO, DEBCRED, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCusto.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCusto.Text  := fieldbyname('codigo').AsString;
                        EdtNomeCentroCusto.Text := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCusto.Clear;
//                        EdtCentroCusto.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCusto.Clear;
                  EdtCentroCusto.Clear;
                  EdtNomeCentroCusto.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCusto.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

end.
