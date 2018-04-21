unit UDeposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmDeposito = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GB2: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    CheckEmp: TCheckBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    BtnConscli: TsSpeedButton;
    edtcodCli: UNovosComponentes.TEdit;
    EdtNomecli: TEdit;
    DBGrid: TDBGrid;
    QConsChe: TFDQuery;
    DSQConsChe: TDataSource;
    QConsCheCOD_CHE: TIntegerField;
    QConsCheCOD_CLI: TIntegerField;
    QConsCheAGENCIA_CHE: TStringField;
    QConsCheCONTA_CHE: TStringField;
    QConsCheNUMERO_CHE: TStringField;
    QConsCheEMISSAO_CHE: TDateField;
    QConsCheVENCTO_CHE: TDateField;
    QConsCheVALOR_CHE: TBCDField;
    QConsChePRIDEP_CHE: TDateField;
    QConsChePRIDEV_CHE: TDateField;
    QConsCheSEGDEP_CHE: TDateField;
    QConsCheSEGDEV_CHE: TDateField;
    QConsCheOBS_CHE: TStringField;
    QConsCheNOME_CLI: TStringField;
    QConsCheNOME_BAN: TStringField;
    CheckDev: TCheckBox;
    GroupBox2: TGroupBox;
    BtnConsConta: TsSpeedButton;
    EdtCodConta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    Label2: TLabel;
    LTotalGeral: TLabel;
    CheckSel: TCheckBox;
    GroupBox3: TGroupBox;
    EdtDataDep: TDateTimePicker;
    BtnConf: TButton;
    BtnSair: TButton;
    IBTRConsChe: TFDTransaction;
    IBTRDeposita: TFDTransaction;
    QConsChePAGTODEV_CHE: TDateField;
    QDeposita: TFDQuery;
    QConsCheCOD_EMP: TIntegerField;
    QinsCC: TFDQuery;
    IBSPInsFluxo: TFDStoredProc;
    QConsCheEMITENTE: TStringField;
    procedure edtcodCliKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConscliClick(Sender: TObject);
    procedure edtcodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodCliExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsContaClick(Sender: TObject);
    procedure EdtCodContaExit(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure CheckSelClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtcodCliEnter(Sender: TObject);
    procedure EdtCodContaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmDeposito: TFrmDeposito;

implementation
uses
  Udm, Ubibli1, UConsCli, UConsConta, UNovoPrincipal, UPrincipal;
var  sSql : string;

{$R *.dfm}

function FrmDeposito: TFrmDeposito;
begin
   Result := TFrmDeposito( BuscaFormulario( TFrmDeposito, False ) );
end;

procedure TFrmDeposito.edtcodCliKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmDeposito.BtnConscliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 3;
   FrmConsCli.showmodal;
end;

procedure TFrmDeposito.edtcodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         Application.CreateForm(TFrmConsCli, FrmConsCli);
         FrmConsCli.tag:= 3;
         FrmConsCli.showmodal;
      end;

end;

procedure TFrmDeposito.edtcodCliExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   if edtcodcli.Text = '' then
      begin 
         edtnomecli.Clear;
         exit;
      end
   else
      begin 
         edtnomecli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
         if edtnomecli.Text = '' then
            begin 
               AlertaCad('Cliente não Cadastrado');
//               edtcodcli.SetFocus;
            end;
      end;
end;

procedure TFrmDeposito.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmDeposito.FormShow(Sender: TObject);
begin 
   edtdataini.Date    := date;
   edtdatafin.Date    := date;
   edtdatadep.Date    := date;
   edtcodcli.Clear;
   edtnomecli.Clear;
   checkemp.Checked   := true;
   checkdev.Checked   := false;
   checksel.Checked   := false;
   LTotalGeral.Caption:= '0,00';
   sSql:= QConsChe.SQL.Text;
end;

procedure TFrmDeposito.EdtCodContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         Application.CreateForm(TFrmConsConta, FrmConsConta);
         FrmConsConta.tag:= 2;
         FrmConsConta.showmodal;
      end;
end;

procedure TFrmDeposito.BtnConsContaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 2;
   FrmConsConta.showmodal;
end;

procedure TFrmDeposito.EdtCodContaExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   edtnomeconta.Text := consulta('contas_corrente', EdtCodConta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
   if edtnomeconta.Text = '' then
      begin 
         AlertaCad('Conta não Cadastrada');
//         edtcodconta.SetFocus;
      end;
end;

procedure TFrmDeposito.BtnOkClick(Sender: TObject);
var cValotTotal : currency;
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdatafin.SetFocus;
         exit;
      end;
   cValotTotal:= 0;
   if IBTRConsChe.Active then
      IBTRConsChe.Commit;
   IBTRConsChe.StartTransaction;
   with QConsChe do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         IF CheckDev.Checked then
            sql.Add(' WHERE ((CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.PRIDEP_CHE IS NULL) ' +
                    ' OR (CHE.PRIDEV_CHE IS NOT NULL AND CHE.SEGDEP_CHE IS NULL) OR (CHE.SEGDEV_CHE IS NOT NULL AND CHE.PAGTODEV_CHE IS NULL))')
         else
            sql.Add(' WHERE (CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.PRIDEP_CHE IS NULL)');

         if edtcodcli.Text <> '' then
            begin 
               sql.Add(' AND (CHE.COD_CLI = :CODCLI)');
               Parambyname('codcli').AsInteger:= strtoint(edtcodCli.Text);
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND (CHE.COD_EMP = :CODEMP)');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         sql.Add(' ORDER BY CHE.VENCTO_CHE, CHE.COD_CHE');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= edtdatafin.Date;
         open;
         if recordcount > 0 then
            begin 
               first;
               while not eof do
                  begin 
                     cValotTotal:= cValotTotal + QConsCheVALOR_CHE.AsCurrency;
                     next;
                  end;
               LTotalGeral.Caption:= CurrToStrF(cValotTotal, ffnumber, 2);
            end
         else
            LTotalGeral.Caption:= '0,00';
      end;
   IBTRConsChe.CommitRetaining;
end;

procedure TFrmDeposito.CheckSelClick(Sender: TObject);
begin 
   if CheckSel.Checked then
      begin 
         QConsChe.First;
         while not QConsChe.EOF do
             begin 
                dbgrid.SelectedRows.CurrentRowSelected := true;
                QConsChe.Next;
             end;
         QConsChe.First;
      end
   else
      begin 
         QConsChe.First;
         while not QConsChe.Eof do
            begin 
               dbgrid.SelectedRows.CurrentRowSelected:= false;
               QConsChe.Next;
            end;
         QConsChe.First;
      end;
end;

procedure TFrmDeposito.BtnConfClick(Sender: TObject);
var i, iCodDoc : integer;
    bLancaCC, bLancaFluxo : boolean;
    cTotal : currency;
begin 
   if edtcodconta.Text = '' then
      begin 
         AlertaCad('Digite Número da Conta');
//         edtcodconta.SetFocus;
         exit;
      end;

   { BUSCA PARAMETROS }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.Consulta do
      begin 
         close;
         sql.clear;
         sql.add('SELECT LANCAR_CHEQUES_CC, COD_DOC, LANCAR_CHEQUE_CAIXA ' +
                 'FROM PARAMETROS ' +
                 'WHERE COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;
         ExecOrOpen;
         iCodDoc:= fieldbyname('cod_doc').AsInteger;
         if trim(fieldbyname('lancar_cheques_cc').AsString) = 'S' then
            bLancaCC:= true
         else
            bLancaCC:= false;
         if trim(fieldbyname('LANCAR_CHEQUE_CAIXA').AsString) = 'S' then
            bLancaFluxo:= true
         else
            bLancaFluxo:= false;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;

   { VERIFICA SE TEM CHEQUE SELECIONADO }
   i:= 0;
   with QConsChe do
      begin 
         first;
         while not eof do
            begin 
               if dbgrid.SelectedRows.CurrentRowSelected = true then
                  i:= i+ 1;
               next;
            end;
         first;
      end;
   if i = 0 then
      begin 
         AlertaCad('Selecione o(s) Cheques');
         exit;
      end;

   { EFETUA O DEPÓSITO }
   cTotal:= 0;
   if IBTRDeposita.Active then
      IBTRDeposita.Commit;
   IBTRDeposita.StartTransaction;
   try
     try
       with QDeposita do
          begin 
             QConsChe.First;
             while not QConsChe.Eof do
                begin 
                   if DBGrid.SelectedRows.CurrentRowSelected then
                      begin 
                         cTotal:= cTotal + QConsCheVALOR_CHE.AsCurrency;
                         close;
                         sql.Clear;
                         if QConsChePRIDEP_CHE.IsNull then
                            begin 
                               sql.Add('UPDATE CHEQUE SET COD_CONTA = :CODCONTA, PRIDEP_CHE = :PRIDEPCHE WHERE COD_CHE = :CODCHE');
                               Parambyname('codconta').AsInteger:= strtoint(edtcodconta.Text);
                               Parambyname('PRIDEPCHE').AsDate  := edtdatadep.Date;
                               Parambyname('codche').AsInteger  := QConsCheCOD_CHE.Value;
                               ExecOrOpen;
                            end
                         else
                            if QConsCheSEGDEP_CHE.IsNull then
                               begin 
                                  sql.Add('UPDATE CHEQUE SET COD_CONTA = :CODCONTA, SEGDEP_CHE = :SEGDEPCHE WHERE COD_CHE = :CODCHE');
                                  Parambyname('codconta').AsInteger:= strtoint(edtcodconta.Text);
                                  Parambyname('segdepche').AsDate:= edtdatadep.Date;
                                  Parambyname('codche').AsInteger:= QConsCheCOD_CHE.Value;
                                  ExecOrOpen;
                               end
                            else
                               if QConsChePAGTODEV_CHE.IsNull then
                                  begin 
                                     sql.Add('UPDATE CHEQUE SET COD_CONTA = :CODCONTA, PAGTODEV_CHE = :PAGTODEVCHE WHERE COD_CHE = :CODCHE');
                                     Parambyname('codconta').AsInteger:= strtoint(edtcodconta.Text);
                                     Parambyname('pagtodevche').AsDate := edtdatadep.Date;
                                     Parambyname('codche').AsInteger   := QConsCheCOD_CHE.Value;
                                     ExecOrOpen;
                                  end;

                         {  LANÇA NO CONTAS CORRENTE }
                         if bLancaCC then
                            begin 
                               QinsCC.Close;
                               QinsCC.ParamByName('2').AsInteger  := strtoint(EdtCodConta.Text);
                               QinsCC.ParamByName('3').Asdate  := EdtDataDep.Date;
                               QinsCC.ParamByName('4').AsDate  := EdtDataDep.Date;
                               QinsCC.ParamByName('5').AsString  := QConsCheNUMERO_CHE.AsString;
                               QinsCC.ParamByName('6').AsFloat  := QConsCheVALOR_CHE.AsFloat;
                               QinsCC.ParamByName('7').Asinteger := 1;
                               QinsCC.ParamByName('8').Asinteger  := 1;
                               QinsCC.ParamByName('9').AsString  := 'DEPÓSITO CHEQUE DE ' + QConsCheEMITENTE.AsString;
                               QinsCC.ParamByName('10').AsInteger := iCodDoc;
                               QinsCC.ParamByName('11').AsString := 'DEPÓSITO';
                               QinsCC.ParamByName('12').AsInteger := iEmp;
                               QinsCC.ExecOrOpen;
                            end;
                      end;
                   QConsChe.Next;
                end;

             { LANÇA O TOTAL DEPOSITADO NO FLUXO DE CAIXA }
             if bLancaFluxo then
                begin 
                   IBSPInsFluxo.Close;
                   IBSPInsFluxo.ParamByName('codemp').AsInteger := iEmp;
                   IBSPInsFluxo.ParamByName('data').AsDate    := EdtDataDep.date;
                   IBSPInsFluxo.ParamByName('dc').Value      := 'C';
                   IBSPInsFluxo.ParamByName('valor').Value   := cTotal;
                   IBSPInsFluxo.ParamByName('hist').Value    := copy('DEPÓSITO EFETUADO EM ' + datetostr(EdtDataDep.date) + ' (' + trim(EdtNomeConta.text) + ')', 1, 60);
                   IBSPInsFluxo.ParamByName('doc').Value     := null;
                   IBSPInsFluxo.ParamByName('codcaixa').Value:= iCaixa;
                   IBSPInsFluxo.ExecProc;
                end;
          end;
       IBTRDeposita.Commit;
     except
       IBTRDeposita.Rollback;
       AlertaCad('Erro ao Depositar os Cheques');
     end;
   finally
      QDeposita.Close;
      IBSPInsFluxo.Close;
      QinsCC.Close;
      IBTRConsChe.Commit;
      QConsChe.Close;
      btnok.Click;
   end;
end;

procedure TFrmDeposito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRConsChe.Active then
      IBTRConsChe.Commit;
   qconsche.SQL.Clear;
   qconsche.SQL.Text:= sSql;
   QConsChe.Close;
   Action:= caFree;
end;

procedure TFrmDeposito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         btnsair.Focused;
         btnsair.Click;
      end;
end;

procedure TFrmDeposito.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmDeposito.edtcodCliEnter(Sender: TObject);
begin 
   edtcodCli.SelectAll;
end;

procedure TFrmDeposito.EdtCodContaEnter(Sender: TObject);
begin 
   EdtCodConta.SelectAll;
end;

end.

