unit ULancCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, Buttons, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancCheques = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    cod_che: UNovosComponentes.TEdit;
    Label2: TLabel;
    cod_ban: UNovosComponentes.TEdit;
    BtnConsBanco: TsSpeedButton;
    BtnAddBanco: TsSpeedButton;
    EdtNomeBanco: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    EdtAgencia: TEdit;
    EdtConta: TEdit;
    Label7: TLabel;
    EdtNumero: TEdit;
    Label8: TLabel;
    EdtDataEmi: TMaskEdit;
    Label10: TLabel;
    EdtDataVenc: TMaskEdit;
    Label11: TLabel;
    EdtValor: TCurrencyEdit;
    Label12: TLabel;
    EdtEmitente: TEdit;
    Label9: TLabel;
    EdtObs: TEdit;
    Label13: TLabel;
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
    QConsChequeEMITENTE_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeVENCTO_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequeNOME_CLI: TStringField;
    BtnExcluir: TBitBtn;
    QConsChequeNOME_BAN: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cod_banExit(Sender: TObject);
    procedure cod_banKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsBancoClick(Sender: TObject);
    procedure BtnAddBancoClick(Sender: TObject);
    procedure cod_banKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataEmiExit(Sender: TObject);
    procedure EdtEmitenteEnter(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Buscacheque;
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cod_banEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancCheques: TFrmLancCheques;

implementation
uses
  Udm, Ubibli1, UCadbanco, UConsBanco, UContasRecRec, UVenda, UNovoPrincipal;

{$R *.dfm}

procedure TFrmLancCheques.Buscacheque;
begin 
   if IBTRLancCheque.Active then
      IBTRLancCheque.Commit;
   IBTRLancCheque.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT CH.COD_CHE, CH.COD_BANCO, CH.AGENCIA_CHE, CH.CONTA_CHE, ' +
                 'CH.NUMERO_CHE, CH.EMITENTE_CHE, CH.EMISSAO_CHE, CH.VENCTO_CHE, ' +
                 'CH.VALOR_CHE, C.NOME_CLI, B.NOME_BAN ' +
                 'FROM CHEQUE CH ' +
                 'INNER JOIN CLIENTE C ' +
                 'ON (CH.COD_CLI = C.COD_CLI) ' +
                 'INNER JOIN BANCO B ' +
                 'ON (CH.COD_BANCO = B.COD_BAN)');
         case FrmLancCheques.Tag of
           1: begin 
                 sql.Add(' WHERE CH.COD_CTR = :COD');
                 ParamByName('cod').Asinteger := FrmContasRecRec.QConsARecCOD_CTR.Value;
              end;
           2: begin 
                 sql.add(' WHERE CH.COD_VENDA = :COD');
                 ParamByName('cod').AsInteger := strtoint(FrmVenda.EdtCod.Text);
              end;
         end;
         sql.add(' ORDER BY CH.COD_CHE');
         open;
      end;
   IBTRLancCheque.CommitRetaining;
end;

procedure TFrmLancCheques.FormShow(Sender: TObject);
begin 
   Limpaedit(FrmLancCheques);
   cod_ban.SetFocus;
   Buscacheque;
end;

procedure TFrmLancCheques.cod_banEnter(Sender: TObject);
begin
   cod_ban.SelectAll;
end;

procedure TFrmLancCheques.cod_banExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;
  EdtNomeBanco.Text:= consulta('banco', cod_ban, 'cod_ban', 'nome_ban', dm.IBTransaction, dm.qConsulta);
  if edtnomebanco.Text = '' then
     begin 
        AlertaCad('Banco não Cadastrado');
//        cod_ban.SetFocus;

     end;
end;

procedure TFrmLancCheques.cod_banKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmLancCheques.BtnConsBancoClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsBanco, FrmConsBanco);
  FrmConsBanco.tag:= 4;
  frmConsbanco.showmodal;
end;

procedure TFrmLancCheques.BtnAddBancoClick(Sender: TObject);
begin 
   BuscaFormulario( TFrmCadBanco, True );
end;

procedure TFrmLancCheques.cod_banKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsBanco.Click
   else
      if key = vk_f2 then
         BtnAddBanco.Click;
end;

procedure TFrmLancCheques.EdtDataEmiExit(Sender: TObject);
begin 
   with sender as TMaskEdit do
     begin 
        if text = '  /  /    ' then
           exit;
        try
          strtodate(Text);
        except
          AlertaCad('Data Inválida');
          setfocus;
        end;
     end;
end;

procedure TFrmLancCheques.EdtEmitenteEnter(Sender: TObject);
begin 
   if EdtEmitente.Text = '' then
      begin 
         case FrmLancCheques.Tag of
           1: EdtEmitente.Text:= FrmContasRecRec.EdtNomeCli.Text;
           2: EdtEmitente.Text:= FrmVenda.EdtNomecli.Text;
         end;
      end;
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
             sql.Add('INSERT INTO CHEQUE(COD_CHE, COD_CLI, COD_BANCO, AGENCIA_CHE, CONTA_CHE, ' +
                     'NUMERO_CHE, EMITENTE_CHE, EMISSAO_CHE, VENCTO_CHE, VALOR_CHE, OBS_CHE, ' +
                     'COD_EMP, COD_CTR, COD_VENDA, COD_USUARIO, COD_EMITENTE) ' +
                     'VALUES(:CODCHE, :CODCLI, :CODBANCO, :AGENCIACHE, :CONTACHE, :NUMEROCHE, ' +
                     ':EMITENTECHE, :EMISSAOCHE, :VENCTOCHE, :VALORCHE, :OBSCHE, :CODEMP, :CODCTR, :CODVENDA, :COD_USU, :COD_EMITENTE)');
             cod_che.Text:= inttostr(prxcod('cheque', 'cod_che', dm.IBTransaction, dm.ibsqlcod));
             Parambyname('codche').AsInteger        := strtoint(cod_che.Text);
             case FrmLancCheques.Tag of
                1: begin 
                      Parambyname('codcli').AsInteger  := strtoint(FrmContasRecRec.EdtCodCli.Text);
                      Parambyname('COD_EMITENTE').AsInteger  := strtoint(FrmContasRecRec.EdtCodCli.Text);
                end;
                2: begin 
                      Parambyname('codcli').AsInteger  := strtoint(FrmVenda.EdtCodcli.Text);
                      Parambyname('COD_EMITENTE').AsInteger  := strtoint(FrmVenda.EdtCodcli.Text);
                end;
             end;
             Parambyname('COD_USU').AsInteger       := iCodUsu;
             Parambyname('codbanco').AsInteger      := strtoint(cod_ban.Text);
             Parambyname('agenciache').AsString     := edtagencia.Text;
             Parambyname('contache').AsString       := edtconta.Text;
             Parambyname('numeroche').AsString      := edtnumero.Text;
             Parambyname('emitenteche').AsString    := edtemitente.Text;
             Parambyname('emissaoche').AsDate       := strtodate(edtdataemi.Text);
             Parambyname('venctoche').AsDate        := strtodate(edtdatavenc.Text);
             Parambyname('valorche').AsFloat        := strtofloat(edtvalor.Text);
             Parambyname('obsche').AsString         := edtobs.Text;
             Parambyname('codemp').AsInteger        := iEmp;
             case FrmLancCheques.Tag of
               1: begin 
                     Parambyname('codctr').AsInteger := FrmContasRecRec.QConsARecCOD_CTR.Value;
                     Parambyname('codvenda').Value   := null;
                  end;
               2: begin 
                     Parambyname('codctr').Value       := null;
                     Parambyname('codvenda').AsInteger := strtoint(FrmVenda.EdtCod.Text);
                  end;
             end;
             ExecOrOpen;
          end;
       IBTRLancCheque.Commit;
       Limpaedit(FrmLancCheques);
     except
       IBTRLancCheque.Rollback;
       AlertaCad('Erro ao Gravar o Cheque');
     end;
   finally
     IBSQLCheque.Close;
     buscacheque;
   end;
end;

procedure TFrmLancCheques.BtnExcluirClick(Sender: TObject);
var vl_cod : integer;
begin 
   if Application.MessageBox('Confirma a Exclusão do Cheque?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         vl_cod:= QConsChequeCOD_CHE.Value;
         if IBTRLancCheque.Active then
            IBTRLancCheque.Commit;
         IBTRLancCheque.StartTransaction;
         try
           try
             with IBSQLCheque do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM CHEQUE WHERE COD_CHE = ' + inttostr(vl_cod));
                   ExecOrOpen;
                end;
             IBTRLancCheque.Commit;
           except
             IBTRLancCheque.Rollback;
             AlertaCad('Erro ao Excluir o Cheque');
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

end.

