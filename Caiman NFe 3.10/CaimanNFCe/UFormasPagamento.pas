unit UFormasPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DB, DBClient, DBGrids;

type
  TFrmFormasPagamento = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    CDSFormas: TClientDataSet;
    DSFormas: TDataSource;
    CDSFormasCODIGO: TIntegerField;
    CDSFormasDESCRICAO: TStringField;
    CDSFormasTABELA_PRECO: TIntegerField;
    CDSFormasCALC_TABELA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CDSFormasCalcFields(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormasPagamento: TFrmFormasPagamento;

implementation
Uses UvendasCaixa, Udm, UDadosCliente;

{$R *.dfm}

procedure TFrmFormasPagamento.FormShow(Sender: TObject);
begin
   { criando o dataset }

   CDSFormas.CreateDataSet;
   CDSFormas.IndexFieldNames:= 'codigo';
   CDSFormas.Open;

   { buscando as formas de pagamento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO, TABELA_PRECO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE TIPO <> ' + #39 + 'TR' + #39  +
                        ' and TIPO <> ' + #39 + 'TV' + #39  +
                        ' ORDER BY CODIGO';
             open;
             while not eof do
                begin
                   CDSFormas.Insert;
                   CDSFormasCODIGO.AsInteger        := fieldbyname('codigo').AsInteger;
                   CDSFormasDESCRICAO.AsString      := fieldbyname('descricao').AsString;
                   CDSFormasTABELA_PRECO.AsInteger  := fieldbyname('tabela_preco').AsInteger;
                   CDSFormas.Post;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmFormasPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CDSFormas.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmFormasPagamento.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmFormasPagamento.CDSFormasCalcFields(DataSet: TDataSet);
begin
   case CDSFormasTABELA_PRECO.AsInteger of
     0: CDSFormasCALC_TABELA.AsString:= 'TABELA - A VISTA';
     1: CDSFormasCALC_TABELA.AsString:= 'TABELA - A PRAZO';
   end;
end;

procedure TFrmFormasPagamento.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         iTabelaPreco    := CDSFormasTABELA_PRECO.AsInteger;
         iFormaPagamento := CDSFormasCODIGO.AsInteger;

         if iTabelaPreco = 1 then
            begin
               FrmDadosCliente.panel3.Visible:= false;
             if ( ( DM.PW + DM.PH )/ 2) < 90 then
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
             else
                 FrmDadosCliente.Height:= Round( ( 373 * ( ( DM.PW + DM.PH )/ 2) ) /100);
               FrmDadosCliente.Position:= poDesktopCenter;
               FrmDadosCliente.Tag:= 0;
               FrmDadosCliente.showmodal;
            end;
         close;
      end;
end;

end.
