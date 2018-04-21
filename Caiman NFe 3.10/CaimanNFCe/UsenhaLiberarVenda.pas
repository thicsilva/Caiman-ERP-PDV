unit UsenhaLiberarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmSenhaLiberaVenda = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtSenha: TEdit;
    QSenha: TFDQuery;
    IBTRSenha: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenhaLiberaVenda: TFrmSenhaLiberaVenda;

implementation
uses
  Udm, UVendasCaixa, UDadosCLiente, UFechaVenda, UMenuFiscal;
var  sSenha : string;

{$R *.dfm}

procedure TFrmSenhaLiberaVenda.FormShow(Sender: TObject);
begin

   EdtSenha.Clear;
   if IBTRSenha.Active then
      IBTRSenha.Commit;
   IBTRSenha.StartTransaction;
   try
     try
       with QSenha do
          begin
             close;
             UnPrepare;
             Parambyname('codemp').AsInteger:= iEmp;
             Prepare;
             Open;
             sSenha:= trim(fieldbyname('senha_excluir_venda').AsString);
          end;
       IBTRSenha.Commit;
     except
       IBTRSenha.Rollback;
       showmessage('Erro ao buscar a senha');
     end;
   finally
     qsenha.UnPrepare;
     QSenha.Close;
     edtsenha.SetFocus;
   end;

   case FrmSenhaLiberaVenda.tag of
     0:begin
          Caption:= 'Liberar Venda';
          StatusBar1.SimpleText := 'Saldo do Cliente:   R$ ' +
          floattostrf(strtofloat(FrmDadosCliente.EdtSaldo.Text), ffnumber, 15,2);
       end;
     1:begin
          Caption:= 'Liberar Desconto';
          StatusBar1.SimpleText := 'Desconto Máximo: ' + currtostrf(cDescontoMaximo, ffnumber, 2);
       end;
     3:begin
          Caption:= 'Liberar Peso Balança';
          StatusBar1.SimpleText := '';
       end;
   end;

end;

procedure TFrmSenhaLiberaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmSenhaLiberaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FrmSenhaLiberaVenda.tag = 0 then
      begin
         FrmVendasCaixa.EdtCodBarra.Clear;
         FrmVendasCaixa.EdtCodBarra.SetFocus;
      end;

   if IBTRSenha.Active then
      IBTRSenha.Commit;

   Action:= caFree;
   Self := nil;
end;

procedure TFrmSenhaLiberaVenda.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmSenhaLiberaVenda.EdtSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         if sSenha = trim(edtsenha.Text) then
            begin
               case FrmSenhaLiberaVenda.tag of
                 0: bVendaLiberada    := true;
                 1: bDescontoLiberado := true;
                 3: bBalancaLiberada  := true;
               end;
               close;
            end
         else
            begin
               case FrmSenhaLiberaVenda.tag of
                 0: bVendaLiberada    := false;
                 1: bDescontoLiberado := false;
                 3: bBalancaLiberada  := false;
               end;
               showmessage('Senha Inválida');
               EdtSenha.Clear;
               edtsenha.SetFocus;
            end;
      end;
end;

end.
