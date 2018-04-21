unit UFechaVendaPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, Buttons, ExtCtrls, ComCtrls, 
  DB, DBClient, Grids, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmFechaVendaPED = class(TForm)
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    BtnOk: TBitBtn;
    Panel3: TPanel;
    QAtualizaVenda: TFDQuery;
    IBTRAtualiza: TFDTransaction;
    DSFormas: TDataSource;
    CDSFormas: TClientDataSet;
    CDSFormasCODIGO: TIntegerField;
    CDSFormasDESCRICAO: TStringField;
    CDSFormasVALOR: TCurrencyField;
    CDSFormasUSA_TEF: TStringField;
    CDSFormasABRE_GAVETA: TStringField;
    CDSFormasINDICE: TStringField;
    CDSFormasTIPO: TStringField;
    CDSFormasDESCRICAO_ECF: TStringField;
    CDSFormasCONCEDER_DESCONTO: TStringField;
    PanelTroco: TPanel;
    Label5: TLabel;
    EdtTroco: TCurrencyEdit;
    PanelDesconto: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EdtPercentualDesconto: TCurrencyEdit;
    EdtValorDesconto: TCurrencyEdit;
    PanelFormas: TPanel;
    Label3: TLabel;
    DBGridFormas: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure EdtValorDescontoExit(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizaVenda;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPercentualDescontoExit(Sender: TObject);
    procedure FormasPagamento;
    procedure FormCreate(Sender: TObject);
    procedure CDSFormasAfterOpen(DataSet: TDataSet);
    procedure CalculaTroco;
    procedure DBGridFormasExit(Sender: TObject);
    procedure DBGridFormasEnter(Sender: TObject);
    procedure DBGridFormasColEnter(Sender: TObject);
    function  TotalizaFormasPagamento(const sTipo : string) : currency;
    procedure FormasComDesconto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechaVendaPED: TFrmFechaVendaPED;

implementation
uses
  UVendasPED, UDM, UECF, ULancCheques, UDadosCliente, UDadosAdm, UTotalProdutos, 
  UsenhaLiberarVenda;
var  cTotalVenda        : currency;
     cDescontoVenda     : currency;
     cDescontoMaximo    : currency;
     cTotalPromocao     : currency;
     cTotalSemPromocao  : currency;
     cValorMaximo       : currency;
     bDescontoLiberado  : boolean;

{$R *.dfm}

procedure TFrmFechaVendaPED.AtualizaVenda;
var iCodTroco  : integer;
    sDocumento : string;
begin
   sDocumento:= dm.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli', strtoint(FrmVendasPED.EdtCodcli.Text));
   GravaFechamentoVenda(strtoint(FrmVendasPED.EdtCodigo.Text), cDescontoVenda, (cTotalVenda - cDescontoVenda), FrmVendasPED.EdtNomecli.Text, sDocumento);

   { deletando as formas de pagamento da venda - caso existe }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM VENDAS_FORMAS_PAGAMENTO ' +
                        'WHERE COD_VENDA = :CODVEN';
             Parambyname('codven').AsInteger:= strtoint(FrmVendasPED.EdtCodigo.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao excluir as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { grava as formas de pagamento }
   CDSFormas.First;
   while not CDSFormas.Eof do
      begin
         if CDSFormasVALOR.AsCurrency > 0 then
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
                         sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                                    'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
                         Parambyname('codvenda').AsInteger  := strtoint(FrmVendasPED.EdtCodigo.Text);
                         Parambyname('codforma').AsInteger  := CDSFormasCODIGO.AsInteger;
                         Parambyname('valor').AsCurrency    := CDSFormasVALOR.AsCurrency;
                         ExecOrOpen;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   showmessage('erro ao gravar as formas de pagamento');
                 end;
               finally
                 dm.QConsulta.Close;
               end;
            end;

         CDSFormas.Next;
      end;

   { gravando o troco }
   iCodTroco:= dm.BuscaFormaPagamento('TR');

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                        'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
             Parambyname('codvenda').AsInteger  := strtoint(FrmVendasPED.EdtCodigo.Text);
             Parambyname('codforma').AsInteger  := iCodTroco;
             Parambyname('valor').AsCurrency    := strtocurr(EdtTroco.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao gravar as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmFechaVendaPED.FormShow(Sender: TObject);
begin
   { busca parametros }

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT DESCONTO_MAXIMO_VENDA ' +
                        'FROM PARAMETROS ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             cDescontoMaximo:= fieldbyname('desconto_maximo_venda').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os Parâmetros');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmFechaVendaPED.EdtValorDescontoExit(Sender: TObject);
begin
   if strtocurr(EdtValorDesconto.Text) < 0 then
      begin
         showmessage('Valor do Desconto não pode ser negativo');
         EdtValorDesconto.SetFocus;
         exit;
         abort;
      end;

   cDescontoVenda:= strtocurr(EdtValorDesconto.Text);
   if cDescontoVenda > 0 then
      FormasComDesconto
   else
      begin
         EdtPercentualDesconto.Clear;
         FormasPagamento;
      end;

   EdtTroco.Text:= '0';

   if not EdtPercentualDesconto.Focused then
      begin
         bDescontoLiberado     := false;
         PanelDesconto.Enabled := false;
      end;
end;

procedure TFrmFechaVendaPED.BtnOkClick(Sender: TObject);
var bPagou, bErroFormas : boolean;
    cSomaFormas : currency;
begin
   btnok.Enabled:= false;
   bPagou       := false;
   bErroFormas  := false;

   bPodeEncerrarVenda:= true;
   cSomaFormas  := 0;

   { Verifica Formas de Pagamento }
   with CDSFormas do
      begin
         first;
         while not eof do
            begin
               if CDSFormasVALOR.AsCurrency > 0 then
                  begin
                     if bPagou then
                        bErroFormas:= true
                     else
                        begin
                           bErroFormas:= false;
                           cSomaFormas:= cSomaFormas + CDSFormasVALOR.AsCurrency;
                           if cSomaFormas >= (cTotalVenda - cDescontoVenda) then
                              bPagou:= true;
                        end;
                  end;
               next;
            end;
      end;

   if (bErroFormas) or (not bPagou) then
      begin
         showmessage('Verifique as formas de pagamento');
         DBGridFormas.SetFocus;
         btnok.Enabled:= true;
         exit;
      end;

   { Verifica se o troco é menor que zero }
   if StrToCurr(EdtTroco.Text) < 0 then
      begin
         showmessage('O Troco está com valor negativo! ' + #13 +
                     'Verifique as formas de pagamento');

         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end;

   { verifica se o total dos Cartões é maior que o total da venda }
   if TotalizaFormasPagamento('CA') > (cTotalVenda - cDescontoVenda) then
      begin
         showmessage('Verifique o total dos cartões');
         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end;

   { Desabilita o botão OK para evitar que pressionem ENTER mais vezes }
   BtnOk.Enabled:= false;

   { Cheque }
   if TotalizaFormasPagamento('CH') > 0 then
      begin
         if trim(dm.RetornaStringTabela('LANCAR_CHEQUE_CAIXA', 'parametros', 'cod_emp', iEmp)) = 'S' then
            begin
               Application.CreateForm(TFrmLancCheques, FrmLancCheques);
               FrmLancCheques.Tag:= 0;
               FrmLancCheques.showmodal;
            end;
      end;

   if TotalizaFormasPagamento('PR') > 0 then
      begin
         bPodeEncerrarVenda             := false;
         FrmDadosCliente.panel3.Visible := true;
             if ( ( DM.PW + DM.PH )/ 2) < 90 then
                 FrmDadosCliente.Height:= Round( ( 529 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
             else
                 FrmDadosCliente.Height:= Round( ( 529 * ( ( DM.PW + DM.PH )/ 2) ) /100);
         FrmDadosCliente.Position       := poDesktopCenter;
         FrmDadosCliente.Tag            := 10;
         FrmDadosCliente.showmodal;
      end;

   { SE FOR CARTAO SEM TEF, ABRE O FORM PARA LANÇAR OS MESMOS }
   if (TotalizaFormasPagamento('CA') > 0) then
      begin
         Application.CreateForm(TFrmDadosAdm, FrmDadosAdm);
         FrmDadosAdm.EdtValor.Text:= CurrToStr(TotalizaFormasPagamento('CA'));
         FrmDadosAdm.EdtParcelamento.Text:= '1';
         FrmDadosAdm.showmodal;
      end;

   if bPodeEncerrarVenda then
      begin
         { ATUALIZA A VENDA }
         AtualizaVenda;

         FrmVendasPED.LimpaNovaVenda;

         FrmFechaVendaPED.Close;
      end
   else
      begin
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
      end;
end;

procedure TFrmFechaVendaPED.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CDSFormas.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmFechaVendaPED.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (chr(Key) in ['G', 'g']) then
      begin
         AbreGaveta(iECF, IGaveta);
      end;

   case key of
    vk_f2: begin
              Application.CreateForm(TFrmTotalProdutos, FrmTotalProdutos);
              FrmTotalProdutos.EdtPromocao.Text     := CurrToStr(cTotalPromocao);
              FrmTotalProdutos.EdtForaPromocao.Text := CurrToStr(cTotalSemPromocao);
              FrmTotalProdutos.ShowModal;
           end;
    vk_f3: begin
              if (cTotalSemPromocao > 0) and (cDescontoMaximo > 0) then
                 begin
                    EdtPercentualDesconto.Text:= currtostr(cDescontoMaximo);
                    EdtPercentualDescontoExit(self);
                 end;
           end;
    vk_f4: begin
              Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
              FrmSenhaLiberaVenda.Tag:= 1;
              FrmSenhaLiberaVenda.ShowModal;
              if bDescontoLiberado then
                 begin
                    PanelDesconto.Enabled:= true;
                    EdtPercentualDesconto.SetFocus;
                 end;
           end;
    vk_next   :BtnOkClick(BtnOK);
    vk_escape :close;
   end;
end;

procedure TFrmFechaVendaPED.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmFechaVendaPED.EdtValorDescontoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_down then
      SelectNext(ActiveControl, true, true)
   else
      if key = vk_up then
         SelectNext(ActiveControl, false, true);
end;

procedure TFrmFechaVendaPED.EdtPercentualDescontoExit(Sender: TObject);
begin
   if strtocurr(EdtPercentualDesconto.Text) < 0 then
      begin
         showmessage('Valor do Desconto não pode ser negativo');
         EdtPercentualDesconto.SetFocus;
         exit;
         abort;
      end;

   if strtocurr(EdtPercentualDesconto.Text) > 0 then
      begin
         cDescontoVenda        := strtocurr(currtostrf((cTotalSemPromocao * strtocurr(EdtPercentualDesconto.text)) / 100, ffFixed, 2));
         EdtValorDesconto.Text := currtostr(cDescontoVenda);
         if cDescontoVenda > 0 then
            FormasComDesconto;
         EdtTroco.Text := '0';
      end
   else
      begin
         EdtValorDesconto.Clear;
         cDescontoVenda:= 0;
         FormasPagamento;
      end;

   if not EdtValorDesconto.Focused then
      begin
         bDescontoLiberado     := false;
         PanelDesconto.Enabled := false;
      end;
end;

procedure TFrmFechaVendaPED.FormasPagamento;
var sFormaCliente : string;
begin
   cTotalVenda        := strtocurr(FrmVendasPED.EdtTotalLiq.Text);
   cTotalPromocao     := dm.TotalizaProdutos('S', strtoint(FrmVendasPED.EdtCodigo.Text));
   cTotalSemPromocao  := dm.TotalizaProdutos('N', strtoint(FrmVendasPED.EdtCodigo.Text));

   { busca a forma de pagamento do cliente }
   sFormaCliente:= DM.RetornaStringTabela('tipo_credito_cli', 'cliente', 'cod_cli', strtoint(FrmVendasPED.EdtCodcli.Text));

   { busca o parametros }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT VALOR_MAXIMO_VENDAS, DESCONTO_TOTAL_VENDA ' +
                        'FROM PARAMETROS ' +
                        'WHERE COD_EMP = :CODEMP ';
             parambyname('codemp').AsInteger:= iEmp;
             open;
             cValorMaximo:= fieldbyname('valor_maximo_vendas').AsCurrency;

             if trim(fieldbyname('desconto_total_venda').AsString) = 'N' then
                FrmFechaVendaPED.PanelDesconto.Enabled:= false
             else
                FrmFechaVendaPED.PanelDesconto.Enabled:= true;

          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao buscar os parâmetros');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { criando o dataset }
   cdsformas.Close;
   CDSFormas.CreateDataSet;
   CDSFormas.IndexFieldNames:= 'codigo';
   CDSFormas.Open;

   { montando o ClientDataSet com as formas de pagamento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT I.INDICE, I.DESCRICAO_ECF, F.* ' +
                        'FROM INDICE_FORMA_PAGAMENTO I ' +
                        'INNER JOIN FORMAS_PAGAMENTO F ' +
                        'ON (I.COD_FORMA = F.CODIGO)   ' +
                        'WHERE I.COD_CAIXA = :CODCAI AND I.COD_EMP = :CODEMP AND ' +
                        'F.USAR_PAF_ECF = ' + #39 + 'S' + #39 + ' AND F.TIPO <> ' + #39 + 'TR' + #39 +
                        ' AND F.TIPO <> ' + #39 + 'TV' + #39 +
                        ' ORDER BY F.CODIGO';
             Parambyname('codcai').AsInteger:= iCaixa;
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             while not eof do
                begin
                   if (trim(fieldbyname('tipo').AsString) = 'DN') or
                      (trim(fieldbyname('tipo').AsString) = 'CA') or
                      (trim(fieldbyname('tipo').AsString) = 'CV') or
                      (trim(fieldbyname('tipo').AsString) = 'TI') or

                      ((trim(sFormaCliente) = 'PR') and (trim(fieldbyname('tipo').AsString) = 'PR')) or
                      ((trim(sFormaCliente) = 'CH') and (trim(fieldbyname('tipo').AsString) = 'CH')) or
                      ((trim(sFormaCliente) = 'BO') and (trim(fieldbyname('tipo').AsString) = 'BO')) or
                      ((trim(sFormaCliente) = 'PC') and ((trim(fieldbyname('tipo').AsString) = 'PR') or (trim(fieldbyname('tipo').AsString) = 'CH') or (trim(fieldbyname('tipo').AsString) = 'BO'))) then

                         begin
                            CDSFormas.Insert;
                            CDSFormasCODIGO.AsInteger           := fieldbyname('codigo').AsInteger;
                            CDSFormasDESCRICAO.AsString         := fieldbyname('descricao').AsString;

                            if trim(FieldByName('tipo').AsString) = 'DN' then
                               CDSFormasVALOR.AsCurrency        := cTotalVenda
                            else
                               CDSFormasVALOR.AsCurrency        := 0;

                            CDSFormasTIPO.AsString              := trim(fieldbyname('tipo').AsString);
                            CDSFormasUSA_TEF.AsString           := trim(fieldbyname('usa_tef').AsString);
                            CDSFormasABRE_GAVETA.AsString       := trim(fieldbyname('abre_gaveta').AsString);
                            CDSFormasINDICE.AsString            := trim(fieldbyname('indice').AsString);
                            CDSFormasDESCRICAO_ECF.AsString     := trim(fieldbyname('descricao_ecf').AsString);
                            CDSFormasCONCEDER_DESCONTO.AsString := trim(fieldbyname('conceder_desconto').AsString);
                            CDSFormas.Post;
                         end;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.close;
     CDSFormas.First;
   end;
end;

procedure TFrmFechaVendaPED.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
     FormasPagamento;
end;

procedure TFrmFechaVendaPED.CDSFormasAfterOpen(DataSet: TDataSet);
begin
   CDSFormasVALOR.MaxValue:= cValorMaximo;
end;

procedure TFrmFechaVendaPED.CalculaTroco;
var cTotalFormas, cValorTroco : currency;
begin
   cTotalFormas:= 0;
   cValorTroco := 0;

   with CDSFormas do
      begin
         First;
         while not eof do
            begin
               cTotalFormas:= cTotalFormas + CDSFormasVALOR.AsCurrency;
               next;
            end;
      end;
   cValorTroco:= cTotalFormas - (cTotalVenda - cDescontoVenda);
   EdtTroco.Text:= currtostr(cValorTroco);
end;

procedure TFrmFechaVendaPED.DBGridFormasExit(Sender: TObject);
begin
   CalculaTroco;
end;

procedure TFrmFechaVendaPED.DBGridFormasEnter(Sender: TObject);
begin
   CDSFormas.First;
   DBGridFormas.SelectedIndex:= 1;
end;

procedure TFrmFechaVendaPED.DBGridFormasColEnter(Sender: TObject);
begin
   if DBGridFormas.SelectedIndex = 0 then
      DBGridFormas.SelectedIndex:= 1;
end;

function TFrmFechaVendaPED.TotalizaFormasPagamento(const sTipo : string) : currency;
var cTotalForma : currency;
begin
   cTotalForma := 0;

   with CDSFormas do
      begin
         First;
         while not eof do
            begin
               if trim(CDSFormasTIPO.AsString) = trim(sTipo) then
                  cTotalForma:= cTotalForma + CDSFormasVALOR.AsCurrency;

               next;
            end;
      end;
   result:= cTotalForma;
end;

procedure TFrmFechaVendaPED.FormasComDesconto;
var bAux : boolean;
begin
   bAux:= false;

   with CDSFormas do
      begin
         DisableControls;
         First;

         { verfifica se tem alguma forma que concede desconto }
         while not eof do
            begin
               if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'S' then
                  bAux:= true;
               next;
            end;

         if bAux then
            begin
               First;
               Edit;
               CDSFormasVALOR.AsCurrency:= (cTotalVenda - cDescontoVenda);
               Post;
               while not eof do
                  begin
                     if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'N' then
                        Delete
                     else
                        next;
                  end;
            end
         else
            begin
               cDescontoVenda:= 0;
               EdtPercentualDesconto.Clear;
               EdtValorDesconto.Clear;
               PanelDesconto.Enabled:= false;
               showmessage('Formas de Pagamento não concedem desconto');
            end;

         First;
         EnableControls;
      end;
end;

end.
