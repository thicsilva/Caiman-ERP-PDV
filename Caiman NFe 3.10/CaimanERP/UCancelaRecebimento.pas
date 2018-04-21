unit UCancelaRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, StdCtrls, ComCtrls, ExtCtrls, Buttons, DB, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmCancelaRecebimento = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtSeq: UNovosComponentes.TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtEmissao: TMaskEdit;
    EdtVenc: TMaskEdit;
    Label5: TLabel;
    EdtReceb: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtDoc: TEdit;
    Label8: TLabel;
    EdtValorBruto: TCurrencyEdit;
    Label9: TLabel;
    EdtValorRec: TCurrencyEdit;
    Label10: TLabel;
    EdtCodCli: UNovosComponentes.TEdit;
    Label11: TLabel;
    EdtNomeCli: TEdit;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    IBSQLCanc: TFDQuery;
    IBTRCanc: TFDTransaction;
    Label12: TLabel;
    EdtFormaPagamento: TEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure DeleteSeqPosteriores;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelaRecebimento: TFrmCancelaRecebimento;

implementation
uses
  Udm, UConsLancReceber, UNovoPrincipal;

{$R *.dfm}

procedure TFrmCancelaRecebimento.DeleteSeqPosteriores;
begin 
   if IBTRCanc.Active then
      IBTRCanc.Commit;
   IBTRCanc.StartTransaction;
   try
     try
       with IBSQLCanc do
          begin 
             close;
             sql.Clear;
             sql.Add('DELETE FROM CONTAS_RECEBER WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR > :SEQ');
             Parambyname('codctr').AsInteger := strtoint(EdtCod.Text);
             Parambyname('seq').AsInteger    := strtoint(EdtSeq.Text);
             ExecOrOpen;
          end;
       IBTRCanc.Commit;
     except
       IBTRCanc.Rollback;
       AlertaCad('Erro ao excluir as sequências posteriores');
     end;
   finally
     IBSQLCanc.Close;
   end;
end;

procedure TFrmCancelaRecebimento.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmCancelaRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRCanc.Active then
      IBTRCanc.Commit;
      
   Action:= caFree;
end;

procedure TFrmCancelaRecebimento.BtnOKClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma o Cancelamento do Recebimento desta Parcela?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         DeleteSeqPosteriores;
         if IBTRCanc.Active then
            IBTRCanc.Commit;
         IBTRCanc.StartTransaction;
         try
           try
             with IBSQLCanc do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('UPDATE CONTAS_RECEBER SET DTPAGTO_CTR = NULL, VLRPAGO_CTR = NULL, ' +
                           'ACRESCIMO_CTR = NULL, DESCONTO_CTR = NULL, ACRESCIMO_RECEBIDO_CTR = NULL, ' +
                           'DESCONTO_CONCEDIDO_CTR = NULL, CODIGO_FORMA_PAGAMENTO = NULL ' +
                           'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ');
                   Parambyname('codctr').AsInteger := strtoint(EdtCod.Text);
                   Parambyname('seq').AsInteger    := strtoint(EdtSeq.Text);
                   ExecOrOpen;
                end;
             IBTRCanc.Commit;
           except
             IBTRCanc.Rollback;
             AlertaCad('Erro ao cancelar o recebimento');
           end;
         finally
           IBSQLCanc.Close;
         end;
      end;

   FrmConsLancReceber.BtnOk.Click;
   close;
end;

procedure TFrmCancelaRecebimento.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
