unit UConsProdCodBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, Mask, rxToolEdit, rxCurrEdit, 
  UVendasCaixa, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsProdCodBarra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    EdtCodBarra: TEdit;
    QConsProd: TFDQuery;
    EdtNome: TEdit;
    EdtValor: TCurrencyEdit;
    LabelPromocao: TLabel;
    LUnid: TLabel;
    QAux: TFDQuery;
    QConsProdNOME_PRO: TStringField;
    QConsProdVALOR_PRO: TBCDField;
    QConsProdPROMOCAO_PRO: TBCDField;
    QConsProdDESCRICAO: TStringField;
    QConsProdCOD_PRO: TIntegerField;
    procedure EdtCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaDadosEmbalagem(const iCodEmb : integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProdCodBarra: TFrmConsProdCodBarra;

implementation
uses
  Udm, UConsProd, UMenuFiscal, Ubibli1;
var  iTamanhoCodBalanca : integer;
     cQuantEmbalagem, cAuxValor : currency;
     sUnidade : string;
     sSqlProduto, sSqlEmbalagem : string;

{$R *.dfm}

procedure TFrmConsProdCodBarra.BuscaDadosEmbalagem(const iCodEmb : integer);
begin
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QAux do
          begin
             close;
             sql.Clear;
             sql.add('SELECT QUANT, UNIDADE   ' +
                     'FROM PRODUTO_EMBALAGENS ' +
                     'WHERE CODIGO = :COD');
             Parambyname('cod').AsInteger:= iCodEmb;
             Open;
             sUnidade        := trim(fieldbyname('unidade').AsString);
             cQuantEmbalagem := fieldbyname('quant').AsCurrency;
          end;
       dm.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       sUnidade:= '';
       cQuantEmbalagem:= 1;
       showmessage('Erro ao buscar a quantidade na embalagem');
     end;
   finally
     QAux.Close;
   end;
end;

procedure TFrmConsProdCodBarra.EdtCodBarraKeyPress(Sender: TObject;
          var Key: Char);
var sCodigoBarra : string;
    bProdutoEncontrado : boolean;
begin
   if (key = #13) and (trim(EdtCodBarra.text) <> '') then
      begin
         key:= #0;
          if ColocaZerosEnter then
             begin
                EdtCodBarra.Text := FormataStringD( EdtCodBarra.Text,
                     IntToStr( ColocaZerosNum ), '0' );
             end;

         cQuantEmbalagem    := 1;
         cAuxValor          := 0;
         sUnidade           := '';
         bProdutoEncontrado := false;

         if (Length(trim(EdtCodBarra.Text)) = 13) and (copy(trim(EdtCodBarra.text), 1, 1) = '2') then
            sCodigoBarra:= inttostr(strtoint(copy(trim(EdtCodBarra.Text), 2, iTamanhoCodBalanca)))
         else
            sCodigoBarra:= trim(EdtCodBarra.Text);

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with QConsProd do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= sSqlProduto;
                   Parambyname('codbar').AsString:= sCodigoBarra;
                   open;

                   if fieldbyname('cod_pro').IsNull then
                      begin
                         { nao achou na tabela de produtos, agora vou procurar na tabela de embalagens }
                         bProdutoEncontrado:= false;
                         dm.IBTransaction.Commit;
                         dm.IBTransaction.StartTransaction;
                         close;
                         sql.Clear;
                         sql.Text:= sSqlEmbalagem;
                         Parambyname('codbar').AsString:= sCodigoBarra;
                         Open;
                         if fieldbyname('cod_pro').IsNull then
                            bProdutoEncontrado:= false
                         else
                            begin
                               bProdutoEncontrado:= true;
                               cQuantEmbalagem:= fieldbyname('quant').AsCurrency;
                            end;
                      end
                   else
                      begin
                         bProdutoEncontrado:= true;
                         cQuantEmbalagem   := 1;
                      end;

                   if bProdutoEncontrado then
                      begin
                         sUnidade:= trim(fieldbyname('descricao').AsString);
                         if fieldbyname('promocao_pro').AsCurrency > 0 then
                            begin
                               cAuxValor:= fieldbyname('promocao_pro').AsCurrency * cQuantEmbalagem;
                               LabelPromocao.Caption:= 'Promoção';
                            end
                         else
                            begin
                               cAuxValor:= fieldbyname('valor_pro').AsCurrency * cQuantEmbalagem;
                               LabelPromocao.Caption:= '';
                            end;
                         EdtNome.text  := fieldbyname('nome_pro').AsString;
                         LUnid.Caption := sUnidade;
                         EdtValor.Text := currtostr(cAuxValor);
                      end
                   else
                      begin
                         EdtNome.Clear;
                         edtvalor.Clear;
                         LUnid.Caption:= '';
                         LabelPromocao.Caption:= '';
                         showmessage('Produto não Cadastrado');
                      end;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             showmessage('Erro ao buscar o produto');
           end;
         finally
           QConsProd.Close;
           EdtCodBarra.SetFocus;
           edtcodbarra.SelectAll;
         end;
      end;
end;

procedure TFrmConsProdCodBarra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsProd.Close;
   if qconsprod.Prepared then
      qconsprod.UnPrepare;
   FrmConsProd.EdtConsulta.SetFocus;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsProdCodBarra.FormShow(Sender: TObject);
begin
   {busca o tamanho do código da balanca}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT TAMANHO_CODIGO_BALANCA ' +
                     'FROM PARAMETROS ' +
                     'WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             iTamanhoCodBalanca:= fieldbyname('TAMANHO_CODIGO_BALANCA').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar o tamanho do código da balança');
     end;
   finally
     dm.QConsulta.Close;
   end;

   EdtNome.Clear;
   edtvalor.Clear;
   LabelPromocao.Caption:= '';
   EdtCodBarra.Clear;
   LUnid.Caption:= '';
   EdtCodBarra.SetFocus;
end;

procedure TFrmConsProdCodBarra.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsProdCodBarra.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
   sSqlProduto:=   'SELECT P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, U.DESCRICAO ' +
                   'FROM PRODUTO P ' +
                   'INNER JOIN UNIDADE_MEDIDA U ' +
                   'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                   'WHERE P.CODIGO_BARRA_PRO = :CODBAR';

   sSqlEmbalagem:= 'SELECT E.COD_PRO, E.QUANT, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO, U.DESCRICAO ' +
                   'FROM PRODUTO_EMBALAGENS E ' +
                   'INNER JOIN PRODUTO P ' +
                   'ON (E.COD_PRO = P.COD_PRO) ' +
                   'INNER JOIN UNIDADE_MEDIDA U ' +
                   'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                   'WHERE E.CODIGO_BARRA = :CODBAR';
end;

end.
