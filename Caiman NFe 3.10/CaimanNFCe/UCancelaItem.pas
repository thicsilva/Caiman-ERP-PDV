unit UCancelaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB;

type
  TFrmCancelaItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    EdtItem: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    EdtSenha: TEdit;
    procedure EdtItemKeyPress(Sender: TObject; var Key: Char);
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
  FrmCancelaItem: TFrmCancelaItem;

implementation
uses
  Udm, UECF, UVendasCaixa, UVendeItens;
var sSenha : string;

{$R *.dfm}

procedure TFrmCancelaItem.EdtItemKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      begin
         key:= #0;
         exit;
      end;
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCancelaItem.FormShow(Sender: TObject);
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
             sql.Add('SELECT SENHA_EXCLUIR_VENDA ' +
                     'FROM PARAMETROS ' +
                     'WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             sSenha:= trim(fieldbyname('senha_excluir_venda').AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar a senha');
     end;
   finally
     dm.QConsulta.Close;
   end;

   edtitem.Clear;
   EdtSenha.Clear;
   edtitem.SetFocus;
end;

procedure TFrmCancelaItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;

end;

procedure TFrmCancelaItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FrmVendasCaixa.PanelNomeProduto.Caption:= '';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmCancelaItem.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmCancelaItem.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
var sAux : string;
    bAux : boolean;
    bConcluido : boolean;
    ItemSelecionado: TItemConta;
begin
   if key = #13 then
      begin
         bAux:= false;
         bConcluido:= false;
         sAux:= '';

         if trim(EdtItem.Text) = '' then
            begin
               showmessage('Digite a Ordem do Item no Cupom Fiscal');
               EdtItem.SetFocus;
               exit;
               abort;
            end;

         try
           strtoint(trim(EdtItem.Text))
         except
           showmessage('Verifique o Número do item');
           EdtItem.SetFocus;
           exit;
           abort;
         end;

         { busca o item e verifica se ja esta cancelado }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'SELECT COD_PRO, CANCELADO ' +
                              'FROM ITENS_VENDA ' +
                              'WHERE COD_VEN = :CODVEN AND ORDEM = :ORD';
                   Parambyname('codven').AsInteger := iCodigoVenda;
                   Parambyname('ord').AsInteger    := StrToInt(trim(EdtItem.Text));
                   Open;
                   if not fieldbyname('cod_pro').IsNull then
                      begin
                         if fieldbyname('cancelado').AsInteger = 0 then
                            bAux:= true
                         else
                            begin
                               bAux:= false;
                               showmessage('Este item já esta cancelado');
                            end;
                      end
                   else
                      bAux:= false;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
           end;
         finally
           dm.QConsulta.Close;
         end;

         if sSenha = trim(edtsenha.Text) then
            begin
               {cancelando o Item}
               if bAux then
                  begin
                     if CancelaItemCupomFiscal(iECF, strtoint(EdtItem.Text)) = 0 then
                        begin
                           if FrmVendasCaixa.Tag = 3 then
                             begin
                                 ItemSelecionado :=
                                    frmSelecionaItens.ListaItens.BuscaItemOrdemCupom(
                                       strtoint(EdtItem.Text) );
                                 if ItemSelecionado <> nil then
                                    ItemSelecionado.CanceladoNoCupom := True;
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
                                     sql.Text:= 'UPDATE ITENS_VENDA ' +
                                                'SET CANCELADO = 1  ' +
                                                'WHERE COD_VEN = :CODVEN AND ORDEM = :ORD';
                                     Parambyname('codven').AsInteger := iCodigoVenda;
                                     Parambyname('ord').AsInteger    := strtoint(EdtItem.Text);
                                     ExecOrOpen;

                                     { atualizando a venda }
                                     FrmVendasCaixa.MemoItens.Lines.Add('     Cancelamento do Item: ' + trim(edtitem.Text));
                                     cTotalVenda:= SubTotalCupomFiscal(iECF);
                                     FrmVendasCaixa.EdtTotalVenda.Text:= currtostr(cTotalVenda);
                                     bConcluido:= true;

                                  end;
                               dm.IBTransaction.Commit;
                             except
                               dm.IBTransaction.Rollback;
                               bConcluido:= false;
                               showmessage('Erro ao cancelar o item');
                             end;
                           finally
                             dm.QConsulta.Close;
                           end;
                        end;
                  end;
            end
         else
            begin
               bConcluido:= false;
               showmessage('Senha Inválida');
               edtsenha.Clear;
               edtsenha.SetFocus;
            end;
      end;

   if bConcluido then
      close;
end;

end.
