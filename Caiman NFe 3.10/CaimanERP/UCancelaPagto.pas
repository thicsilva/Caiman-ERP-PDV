unit UCancelaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, Mask, StdCtrls, DB, Buttons, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxPC;

type
  TFrmCancelaPagto = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    Label3: TLabel;
    EdtTipoDoc: TEdit;
    EdtNumDoc: TEdit;
    Label4: TLabel;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    EdtVenc: TMaskEdit;
    Label6: TLabel;
    EdtObs: TEdit;
    Label7: TLabel;
    Label2: TLabel;
    EdtDesc: TCurrencyEdit;
    EdtAcres: TCurrencyEdit;
    Label8: TLabel;
    EdtValorPago: TCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    BtnOk: TButton;
    BtnCancela: TButton;
    QConsPagar: TFDQuery;
    QConsPagarCOD_CPT: TIntegerField;
    QConsPagarCOD_EMP: TIntegerField;
    QConsPagarDATA_CTP: TDateField;
    QConsPagarCOD_FOR: TIntegerField;
    QConsPagarTIPO_DOC_CTP: TStringField;
    QConsPagarNUM_DOC_CTP: TStringField;
    QConsPagarVALOR_CTP: TBCDField;
    QConsPagarDTVENCTO_CTP: TDateField;
    QConsPagarDTPAGTO_CTP: TDateField;
    QConsPagarVALOR_PAGO_CTP: TBCDField;
    QConsPagarDESCONTO_CTP: TBCDField;
    QConsPagarACRESCIMO_CTP: TBCDField;
    QConsPagarOBS_CTP: TStringField;
    QConsPagarRAZAO_FOR: TStringField;
    QCancela: TFDQuery;
    Label11: TLabel;
    EdtCodEmp: UNovosComponentes.TEdit;
    Label12: TLabel;
    EdtSeq: UNovosComponentes.TEdit;
    Label13: TLabel;
    EdtCheque: TEdit;
    QConsPagarCOD_ENTRADA: TIntegerField;
    QConsPagarSEQUENCIA_CTP: TIntegerField;
    QConsPagarCOD_CLASSIFICACAO: TIntegerField;
    QConsPagarCODIGO_FORMA_PAGAMENTO: TIntegerField;
    QConsPagarCODIGO_CENTRO_CUSTO: TIntegerField;
    QConsPagarCHEQUE: TStringField;
    BtnBuscaDados: TBitBtn;
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtSeqEnter(Sender: TObject);
    procedure BtnBuscaDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCancelaPagto: TFrmCancelaPagto;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal;

{$R *.dfm}

function FrmCancelaPagto: TFrmCancelaPagto;
begin
   Result := TFrmCancelaPagto( BuscaFormulario( TFrmCancelaPagto, False ) );
end;

procedure TFrmCancelaPagto.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmCancelaPagto.FormShow(Sender: TObject);
begin 
   limpaedit(FrmCancelaPagto);
   edtcod.SetFocus;
end;

procedure TFrmCancelaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsPagar.Close;
   Action:= caFree;
end;

procedure TFrmCancelaPagto.BtnCancelaClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmCancelaPagto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmCancelaPagto.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCancelaPagto.BtnOkClick(Sender: TObject);
begin 
   if application.MessageBox('Confirma o Cancelamento?', 'Cancelamento de Contas a Pagar', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with QCancela do
                begin 
                   close;
                   Parambyname('codcpt').AsInteger:= strtoint(edtcod.Text);
                   Parambyname('seqctp').AsInteger:= strtoint(EdtSeq.Text);
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao Cancelar o Pagamento');
           end;
         finally
           QCancela.Close;
           edtcod.SetFocus;
         end;

         Limpaedit(FrmCancelaPagto);
         edtcod.SetFocus;
      end
   else
      begin 
         Limpaedit(FrmCancelaPagto);
         edtcod.SetFocus;
      end;
end;

procedure TFrmCancelaPagto.EdtCodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

procedure TFrmCancelaPagto.EdtSeqEnter(Sender: TObject);
begin 
   EdtSeq.SelectAll;
end;

procedure TFrmCancelaPagto.BtnBuscaDadosClick(Sender: TObject);
begin 
   if (btncancela.Focused) then
      exit;

   if edtcod.Text = '' then
      begin 
         AlertaCad('Digite o Código do Contas a Pagar');
//         edtcod.SetFocus;
         exit;
      end;

   if EdtSeq.Text = '' then
      begin 
         AlertaCad('Digite a sequência do Contas a Pagar');
//         EdtSeq.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPagar do
      begin 
         close;
         Parambyname('codcpt').Value:= edtcod.Text;
         Parambyname('seqctp').Value:= EdtSeq.Text;
         Open;
         if recordcount > 0 then
            begin 
               edtcodemp.Text     := QConsPagarCOD_EMP.AsString;
               edtcodfor.Text     := QConsPagarCOD_FOR.AsString;
               edtnomefor.Text    := QConsPagarRAZAO_FOR.Value;
               EdtTipoDoc.Text    := QConsPagarTIPO_DOC_CTP.Value;
               EdtNumDoc.Text     := QConsPagarNUM_DOC_CTP.Value;
               edtvalor.Text      := QConsPagarVALOR_CTP.AsString;
               edtvenc.Text       := QConsPagarDTVENCTO_CTP.AsString;
               edtobs.Text        := QConsPagarOBS_CTP.Value;
               edtdesc.Text       := QConsPagarDESCONTO_CTP.AsString;
               edtacres.Text      := QConsPagarACRESCIMO_CTP.Text;
               EdtValorPago.Text  := QConsPagarVALOR_PAGO_CTP.AsString;
               EdtCheque.Text     := QConsPagarCHEQUE.AsString;
            end
         else
            begin 
               Limpaedit(FrmCancelaPagto);
               AlertaCad('Conta não Paga ou não existe');
//               edtcod.SetFocus;
            end;
      end;
   dm.IBTransaction.Commit;
   QConsPagar.Close;
end;

end.
