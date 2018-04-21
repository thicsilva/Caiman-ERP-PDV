unit USenhaExcVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, DB, ComCtrls, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmSenhaExcVenda = class(TForm)
    Panel1: TPanel;
    EdtSenha: TEdit;
    Label1: TLabel;
    QSenha: TFDQuery;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenhaExcVenda: TFrmSenhaExcVenda;

implementation
uses
  Udm, UVendasCaixa, UMenuFiscal;
var sSenha : string;

{$R *.dfm}

procedure TFrmSenhaExcVenda.FormShow(Sender: TObject);
begin


   EdtSenha.Clear;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QSenha do
          begin
             close;
             UnPrepare;
             Parambyname('codemp').AsInteger := iEmp;
             Prepare;
             Open;
             sSenha:= trim(fieldbyname('senha_excluir_venda').AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar a senha');
     end;
   finally
     qsenha.UnPrepare;
     QSenha.Close;
     edtsenha.SetFocus;
   end;
end;

procedure TFrmSenhaExcVenda.EdtSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         if sSenha = trim(edtsenha.Text) then
            begin
               FrmVendasCaixa.CancelaTudo;
               FrmSenhaExcVenda.close;
            end
         else
            begin
               showmessage('Senha Inválida');
               edtsenha.Clear;
               edtsenha.SetFocus;
            end;
      end;
end;

procedure TFrmSenhaExcVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmSenhaExcVenda.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmSenhaExcVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      begin
         FrmVendasCaixa.PanelNomeProduto.Caption:= '';
         close;
      end;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

end.
