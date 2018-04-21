unit UDadosAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, DB, Mask, 
  rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmDadosAdm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label21: TLabel;
    EdtCodBandeira: TEdit;
    BtnConsBandeira: TsSpeedButton;
    EdtNomeBandeira: TEdit;
    Label22: TLabel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    BtnExcluir: TBitBtn;
    QBuscaParcelas: TFDQuery;
    QDelParcela: TFDQuery;
    QGravaParcela: TFDQuery;
    DSQBuscaParc: TDataSource;
    Label1: TLabel;
    EdtTipo: TEdit;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    Label2: TLabel;
    EdtParcelamento: TEdit;
    QBuscaParcelasCODIGO: TIntegerField;
    QBuscaParcelasEMISSAO: TDateField;
    QBuscaParcelasVENCIMENTO: TDateField;
    QBuscaParcelasVALOR: TBCDField;
    QBuscaParcelasTAXA: TBCDField;
    QBuscaParcelasDESCRICAO: TStringField;
    Label3: TLabel;
    EdtCodCli: TEdit;
    BtnConsCLi: TsSpeedButton;
    EdtNomeCLi: TEdit;
    Label4: TLabel;
    QBuscaParcelasPARCELA: TIntegerField;
    procedure EdtCodBandeiraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodBandeiraExit(Sender: TObject);
    procedure EdtCodBandeiraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsBandeiraClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BuscaParcelas;
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure Limpa;
    procedure EdtCodBandeiraEnter(Sender: TObject);
    procedure EdtParcelamentoEnter(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BtnConsCLiClick(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosAdm: TFrmDadosAdm;
  cTaxa : currency;
  iDias : integer;

implementation
uses
  Udm, UConsAdmCartaoCredito, UVendasCaixa, UConsCli;

{$R *.dfm}

procedure TFrmDadosAdm.Limpa;
begin
   EdtCodBandeira.Clear;
   EdtNomeBandeira.Clear;
   EdtTipo.Clear;
   EdtValor.Clear;
   EdtParcelamento.Text:= '1';
   EdtCodBandeira.SetFocus;
end;

procedure TFrmDadosAdm.BuscaParcelas;
begin
   if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
   DM.IBTransaction.StartTransaction;
   with QBuscaParcelas do
      begin
         close;
         Parambyname('codven').AsInteger:= iCodigoVenda;
         Open;
      end;
end;

procedure TFrmDadosAdm.EdtCodBandeiraKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmDadosAdm.EdtCodBandeiraExit(Sender: TObject);
begin
   if (BtnSair.Focused) or (DBGrid1.Focused) then
      exit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO, TAXA_CREDITO, TAXA_DEBITO, TIPO_CARTAO, ' +
                        'DIAS_CREDITO, DIAS_DEBITO, ATIVO ' +
                        'FROM BANDEIRAS_CARTAO ' +
                        'WHERE CODIGO = :CODIGO AND ATIVO = ' + #39 + 'S' + #39;
             Parambyname('codigo').AsInteger:= strtoint(EdtCodBandeira.Text);
             open;
             if not (fieldbyname('codigo').IsNull) then
                begin
                   EdtNomeBandeira.Text:= fieldbyname('descricao').AsString;
                   if trim(fieldbyname('TIPO_CARTAO').AsString) = 'C' then
                      begin
                         EdtTipo.Text:= 'CRÉDITO';
                         cTaxa := fieldbyname('TAXA_CREDITO').AsCurrency;
                         iDias := fieldbyname('DIAS_CREDITO').AsInteger;
                      end
                   else
                      begin
                         EdtTipo.Text:= 'DÉBITO';
                         cTaxa := fieldbyname('TAXA_DEBITO').AsCurrency;
                         iDias := fieldbyname('DIAS_DEBITO').AsInteger;
                      end;
                end
             else
                begin
                   showmessage('Bandeira não cadastrada');
                   EdtCodBandeira.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados da bandeira');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmDadosAdm.EdtCodBandeiraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsBandeira.Click;
end;

procedure TFrmDadosAdm.BtnConsBandeiraClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsAdmCartaoCredito, FrmConsAdmCartaoCredito);
   FrmConsAdmCartaoCredito.ShowModal;
end;

procedure TFrmDadosAdm.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmDadosAdm.BtnExcluirClick(Sender: TObject);
var iAuxCodigo : integer;
begin
   if Application.MessageBox('Confirma a Exclusão da Parcela?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         iAuxCodigo:= QBuscaParcelasCODIGO.AsInteger;

         if DM.IBTransaction.Active then
            DM.IBTransaction.Commit;
         DM.IBTransaction.StartTransaction;
         try
           try
             with QDelParcela do
               begin
                  close;
                  Parambyname('codigo').AsInteger:= iAuxCodigo;
                  ExecOrOpen;
               end;
             DM.IBTransaction.Commit;
           except
             DM.IBTransaction.Rollback;
             showmessage('Erro ao Excluir a Parcela');
           end;
         finally
           QDelParcela.Close;
           Limpa;
           BuscaParcelas;
         end;
      end;
end;

procedure TFrmDadosAdm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   { atualiza o código do cliente na venda }
   if trim(EdtCodCli.Text) <> '' then
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
                 sql.Text:= 'UPDATE VENDAS ' +
                            'SET COD_CLI = :CODCLI ' +
                            'WHERE COD_VEN = :CODVEN';
                 Parambyname('codcli').AsInteger := strtoint(EdtCodCli.text);
                 Parambyname('codven').AsInteger := iCodigoVenda;
                 ExecOrOpen;
              end;
           dm.IBTransaction.Commit;
         except
           dm.IBTransaction.Rollback;
           showmessage('Erro ao Atualizar a Venda');
         end;
       finally
          dm.QConsulta.Close;
       end;
   end;

   if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
   QBuscaParcelas.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmDadosAdm.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmDadosAdm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmDadosAdm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmDadosAdm.BtnOKClick(Sender: TObject);
var i : integer;
begin
   if trim(EdtCodBandeira.Text) = '' then
      begin
         showmessage('Digite o código da bandeira');
         EdtCodBandeira.SetFocus;
         exit;
      end;

   if strtocurr(EdtValor.Text) = 0 then
      begin
         showmessage('Digite o valor');
         EdtValor.SetFocus;
         exit;
      end;

   if trim(EdtParcelamento.Text) = '' then
      begin
         showmessage('Digite a quantidade de parcelas');
         EdtParcelamento.SetFocus;
         exit;
      end;

   for i:= 1 to strtoint(EdtParcelamento.Text) do
      begin
         if DM.IBTransaction.Active then
            DM.IBTransaction.Commit;
         DM.IBTransaction.StartTransaction;
         try
           try
             with QGravaParcela do
                begin
                   close;
                   parambyname('band').AsInteger       := strtoint(EdtCodBandeira.Text);
                   parambyname('emissao').AsDate       := date;
                   parambyname('vencto').AsDate        := date + (i * iDias);
                   parambyname('cai').AsInteger        := iCaixa;
                   parambyname('emp').AsInteger        := iEmp;
                   parambyname('ven').AsInteger        := iCodigoVenda;
                   parambyname('valor').AsCurrency     := strtocurr(EdtValor.Text) / strtoint(EdtParcelamento.Text);
                   parambyname('taxa').AsCurrency      := cTaxa;
                   Parambyname('codcli').AsInteger     := strtoint(EdtCodCli.Text);
                   Parambyname('documento').AsString   := 'CF ' + inttostr(iCOOVenda);
                   Parambyname('parcela').AsInteger    := i;
                   ExecOrOpen;
                end;
             DM.IBTransaction.Commit;
           except
             DM.IBTransaction.Rollback;
             showmessage('Erro gravando parcela');
           end;
         finally
           QGravaParcela.Close;
         end;
      end;
   Limpa;
   BuscaParcelas;
end;

procedure TFrmDadosAdm.EdtCodBandeiraEnter(Sender: TObject);
begin
   EdtCodBandeira.SelectAll;
end;

procedure TFrmDadosAdm.EdtParcelamentoEnter(Sender: TObject);
begin
   EdtParcelamento.SelectAll;
end;

procedure TFrmDadosAdm.EdtCodCliEnter(Sender: TObject);
begin
   EdtCodCli.SelectAll;
end;

procedure TFrmDadosAdm.BtnConsCLiClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCLi);
   FrmConsCli.Tag:= 9;
   FrmConsCli.ShowModal;
end;

procedure TFrmDadosAdm.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCLi.Click;
end;

procedure TFrmDadosAdm.EdtCodCliExit(Sender: TObject);
begin
   if BtnSair.Focused then
      exit;

   EdtNomeCLi.Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', strtoint(EdtCodCli.Text));
   if trim(EdtNomeCLi.Text) = '' then
      begin
         showmessage('Cliente não Cadastrado');
         EdtCodCli.SetFocus;
      end
   else
      iCodCliente:= strtoint(EdtCodCli.Text);
end;

end.
