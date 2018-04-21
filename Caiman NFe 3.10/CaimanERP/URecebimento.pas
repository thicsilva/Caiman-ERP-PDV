unit URecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, DB, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmRecebimento = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    Label2: TLabel;
    EdtAcres: TCurrencyEdit;
    Label3: TLabel;
    EdtDesc: TCurrencyEdit;
    Label4: TLabel;
    EdtTotalLiq: TCurrencyEdit;
    Label5: TLabel;
    EdtValorRec: TCurrencyEdit;
    Label6: TLabel;
    EdtData: TDateTimePicker;
    Panel3: TPanel;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    IBQRecebe: TFDQuery;
    IBTR: TFDTransaction;
    QInsParcela: TFDQuery;
    Label8: TLabel;
    EdtDevol: TCurrencyEdit;
    Label7: TLabel;
    ComboForma: TComboBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtAcresExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  PrxSeq(codigo : integer) : integer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecebimento: TFrmRecebimento;
  bGeraParcela : boolean;

implementation
uses
  Udm, Ubibli1, UContasRecRec, UParcelaPendente, ULancCheques, UCadCheque, 
  UNovoPrincipal, UDicFluxo;
var  iCodigoCTR  : integer;
     bManterDataNotinha : boolean;

{$R *.dfm}

function TFrmRecebimento.PrxSeq(codigo : integer) : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT MAX(SEQUENCIA_CTR) AS MAXSEQ FROM CONTAS_RECEBER WHERE COD_CTR = ' + inttostr(codigo));
             ExecOrOpen;
             result:= Fieldbyname('maxseq').AsInteger + 1;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
       AlertaCad('Erro ao buscar a sequência da parcela');
     end;
   finally
     dm.Consulta.Close;
   end;
end;

procedure TFrmRecebimento.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRecebimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRecebimento.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRecebimento.BtnOKClick(Sender: TObject);
var cTotalRestante  : currency;
    cAcresRestante  : currency;
    cDescContabil   : currency;
    iCodVenda, iCodCobranca, iCodClassif : integer;
    sDocumento      : string;
    dEmissao        : TDateTime;
    dVencto         : TDateTime;
    iParcela        : integer;
    sOBS            : string;
    iCaixaEmissao   : integer;
    cTaxaDesc, cTaxaAcres, cValorContabil, cAcresContabil : currency;
    cDiferencaAcrescimo : currency;
begin 
    iCodVenda         := 0;
    iCodCobranca      := 0;
    iCodClassif       := 0;
    sDocumento        := '';
    sOBS              := '';
    cValorContabil    := 0;
    cAcresContabil    := 0;
    cTaxaDesc         := 0;
    cTaxaAcres        := 0;
    cDescContabil     := 0;
    iCaixaEmissao     := 0;
    cDiferencaAcrescimo:= StrToCurr(EdtAcres.Text) - vg_Acres;  // verifica se vai receber mais acrescimos do que o previsto

   if EdtValorRec.Text = '0' then
      begin 
         AlertaCad('Digite o valor recebido');
//         EdtValorRec.SetFocus;
         exit;
      end;

   if StrToCurr(EdtValorRec.Text) > StrToCurr(EdtTotalLiq.Text) then
      begin 
         AlertaCad('O valor recebido está maior que o valor líquido');
         exit;
      end;

   if (EdtAcres.Text <> '0') and (EdtDesc.Text <> '0') then
      begin 
         AlertaCad('Digitar somente acréscimo ou somente desconto');
//         EdtAcres.SetFocus;
         exit;
      end;

   if Application.MessageBox('Confirma o Recebimento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         {SE O VALOR A RECEBER FOR MENOR QUE O VALOR TOTAL, RETIRA AS PARCELAS ATÉ ATINGIR O VALOR}

         FrmContasRecRec.QConsARec.Last;
         while not FrmContasRecRec.QConsARec.Bof do
            begin 
               if FrmContasRecRec.DBGridARec.SelectedRows.CurrentRowSelected = true then
                  begin 
                     if (strtofloat(EdtTotalLiq.Text) - FrmContasRecRec.QConsARecTOTAL.Value) > StrToCurr(EdtValorRec.Text) then
                         begin 
                            FrmContasRecRec.DBGridARec.SelectedRows.CurrentRowSelected:= false;
                            vg_TotalLiq:= vg_TotalLiq - FrmContasRecRec.QConsARecTOTAL.AsCurrency;
                            EdtTotalLiq.Text:= CurrToStr(vg_TotalLiq);
                            dec(vg_QtdParcela);
                         end
                     else
                        FrmContasRecRec.QConsARec.First;
                  end;
               FrmContasRecRec.QConsARec.Prior;
            end;

         { BUSCA A TAXA DO DESCONTO E ACRESCIMO }
         cTaxaDesc  := ((strtocurr(EdtDesc.Text)  * 100) / (strtocurr(EdtTotalBruto.Text) - strtocurr(edtdevol.Text)));
         cTaxaAcres := ((strtocurr(EdtAcres.Text) * 100) / (strtocurr(EdtTotalBruto.Text) - strtocurr(edtdevol.Text)));

         { BAIXA AS PARCELAS }
         cTotalRestante := strtocurr(EdtValorRec.Text);
         cAcresRestante := strtocurr(EdtAcres.Text);

         FrmContasRecRec.QConsARec.First;
         try
           try
             if IBTR.Active then
                IBTR.Commit;
             IBTR.StartTransaction;
             while not FrmContasRecRec.QConsARec.Eof do
                begin 
                   if FrmContasRecRec.DBGridARec.SelectedRows.CurrentRowSelected = true then
                      begin 
                         iCodVenda     := FrmContasRecRec.QConsaRecCOD_VENDA.AsInteger;
                         sDocumento    := FrmContasRecRec.QConsaRecNUMDOCUMENTO_CTR.AsString;
                         sOBS          := FrmContasRecRec.QConsARecOBS_CTR.AsString;
                         iCaixaEmissao := FrmContasRecRec.QConsARecCAIXA_EMISSAO_CTR.AsInteger;
                         dEmissao      := FrmContasRecRec.QConsARecDATA_CTR.Value;
                         dVencto       := FrmContasRecRec.QConsARecVENCTO_CTR.Value;
                         iCodCobranca  := FrmContasRecRec.QConsARecCOD_COB.AsInteger;
                         iCodClassif   := FrmContasRecRec.QConsARecCODIGO_CLASSIFICACAO.AsInteger;
                         iParcela      := FrmContasRecRec.QConsARecPARCELA_CTR.AsInteger;

                         with IBQRecebe do
                            begin 
                               close;
                               Parambyname('dtpagtoctr').Value        := edtdata.Date;
                               Parambyname('acrescimoctr').AsCurrency := FrmContasRecRec.QConsARecACRESCIMO.AsCurrency;
                               Parambyname('descontoctr').AsCurrency  := 0;
                               cDescContabil:= (((FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency) * cTaxaDesc) / 100);
                               Parambyname('descontoconc').AsCurrency := cDescContabil;

                               if vg_Acres > 0 then
                                  begin 
                                     if cAcresRestante >= FrmContasRecRec.QConsARecACRESCIMO.AsCurrency then
                                        begin 
                                           if cDiferencaAcrescimo > 0 then
                                              begin 
                                                 Parambyname('acresrec').AsCurrency:= FrmContasRecRec.QConsARecACRESCIMO.AsCurrency + cDiferencaAcrescimo;
                                                 cAcresContabil := FrmContasRecRec.QConsARecACRESCIMO.AsCurrency + cDiferencaAcrescimo;
                                                 cAcresRestante := cAcresRestante - (FrmContasRecRec.QConsARecACRESCIMO.AsCurrency + cDiferencaAcrescimo);
                                                 cDiferencaAcrescimo:= 0;
                                              end
                                           else
                                              begin 
                                                 Parambyname('acresrec').AsCurrency:= FrmContasRecRec.QConsARecACRESCIMO.AsCurrency;
                                                 cAcresContabil := FrmContasRecRec.QConsARecACRESCIMO.AsCurrency;
                                                 cAcresRestante := cAcresRestante - FrmContasRecRec.QConsARecACRESCIMO.AsCurrency;
                                              end;
                                        end
                                     else
                                        begin 
                                           ParamByName('acresrec').AsCurrency := cAcresRestante;
                                           cAcresContabil:= cAcresRestante;
                                           cAcresRestante:= 0;
                                        end;
                                  end
                               else
                                  begin 
                                     cAcresContabil:= (((FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency) * cTaxaAcres) / 100);
                                     Parambyname('acresrec').Value:= cAcresContabil;
                                  end;

                               if cTotalRestante >= (FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency + cAcresContabil - cDescContabil) then
                                  begin 
                                     Parambyname('vlrpagoctr').AsCurrency := (FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency + cAcresContabil - cDescContabil);
                                     cValorContabil := (FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency - cDescContabil);
                                  end
                               else
                                  begin 
                                     Parambyname('vlrpagoctr').AsCurrency := cTotalRestante;
                                     cValorContabil := cTotalRestante - cAcresContabil ;
                                  end;
                               //Parambyname('vlrpagoctr').AsCurrency
                               Parambyname('codctr').AsInteger   := FrmContasRecRec.QConsARecCOD_CTR.AsInteger;
                               Parambyname('seq').AsInteger      := FrmContasRecRec.QConsARecSEQUENCIA_CTR.AsInteger;
                               Parambyname('codcai').AsInteger   := iCaixa;
                               Parambyname('codforma').AsInteger := StrToInt(copy(ComboForma.Text, 1, 2));
                              DicFluxo.Movimentos.GravarMovimentoForma(
                                   'FLUXO_RECEBER',
                                   'FLUXO_RECEBER_CHAVE',
                                   Format( 'RECEBIMENTO CTR.:[%s/%s]<%s>',
                                      [ FrmContasRecRec.QConsARecCOD_CTR.AsString,
                                        FrmContasRecRec.QConsARecSEQUENCIA_CTR.AsString,
                                        ComboForma.Text] ),
                                   StrToInt(copy(ComboForma.Text, 1, 2)),
                                   Parambyname('vlrpagoctr').AsCurrency,
                                   ''  );
                               iCodigoCTR:= FrmContasRecRec.QConsARecCOD_CTR.AsInteger;
                               ExecOrOpen;
                            end;
                         cTotalRestante:= cTotalRestante - (FrmContasRecRec.QConsARecVALOR_CTR.AsCurrency - FrmContasRecRec.QConsARecDEVOLUCAO_CTR.AsCurrency) - cAcresContabil + cDescContabil;
                      end;
                   FrmContasRecRec.QConsARec.Next;
                end;

             { VERIFICA SE VAI FAZER PARCELA PENDENTE }
             if (StrToCurr(edttotalliq.Text) > StrToCurr(EdtValorRec.Text)) then
                begin 
                   if bPerg_Pendencia then
                      begin 
                         if Application.MessageBox('Deseja Gerar a parcela do valor pendente?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
                            begin 
                               Application.CreateForm(TFrmParcelaPendente, FrmParcelaPendente);
                               if bManterDataNotinha then
                                  begin 
                                     FrmParcelaPendente.EdtEmissao.Text:= datetostr(dEmissao);
                                     FrmParcelaPendente.EdtVenc.Text   := datetostr(dVencto);
                                  end
                               else
                                  begin 
                                     FrmParcelaPendente.EdtEmissao.Text:= datetostr(date);
                                     FrmParcelaPendente.EdtVenc.Text   := datetostr(date + 30);
                                  end;
                               FrmParcelaPendente.EdtValor.Text:= floattostr(strtofloat(EdtTotalLiq.text) - strtofloat(EdtValorRec.text));
                               FrmParcelaPendente.showmodal;
                            end;
                      end
                   else
                      bGeraParcela:= true;
                end
             else
                bGeraParcela:= false;

             { GERA PARCELA PENDENTE }
             if bGeraParcela then
                begin 
                   with QInsParcela do
                      begin 
                         close;
                         Parambyname('codctr').AsInteger       := iCodigoCTR;
                         Parambyname('sequenciactr').AsInteger := PrxSeq(iCodigoCTR);
                         Parambyname('codemp').AsInteger       := FrmContasRecRec.QConsARecCOD_EMP.AsInteger;
                         Parambyname('codvenda').AsInteger     := iCodVenda;
                         Parambyname('codcli').AsInteger       := FrmContasRecRec.QConsARecCOD_CLI.AsInteger;

                         if trim(sDocumento) = '' then
                            Parambyname('numdocumentoctr').Value  := null
                         else
                            Parambyname('numdocumentoctr').AsString := sDocumento;

                         if trim(sOBS) = '' then
                            Parambyname('obsctr').Value        := null
                         else
                            Parambyname('obsctr').AsString     := sOBS;

                         Parambyname('cx').AsInteger           := iCaixaEmissao;
                         Parambyname('codcob').AsInteger       := iCodCobranca;
                         Parambyname('parc').AsInteger         := iParcela;
                         Parambyname('devol').AsCurrency       := 0;
                         Parambyname('codclassif').AsInteger   := iCodClassif;

                         if bPerg_Pendencia then
                            begin 
                               Parambyname('valorctr').AsCurrency  := strtocurr(FrmParcelaPendente.EdtValor.Text);
                               Parambyname('datactr').AsDate       := strtodate(FrmParcelaPendente.EdtEmissao.Text);
                               Parambyname('venctoctr').AsDate     := strtodate(FrmParcelaPendente.EdtVenc.Text);
                            end
                         else
                            begin 
                               Parambyname('valorctr').AsCurrency  := strtocurr(EdtTotalLiq.text) - strtocurr(EdtValorRec.text);
                               if bManterDataNotinha then
                                  begin 
                                     Parambyname('datactr').AsDate    := dEmissao;
                                     Parambyname('venctoctr').AsDate  := dVencto;
                                  end
                               else
                                  begin 
                                     Parambyname('datactr').AsDate    := date;
                                     Parambyname('venctoctr').AsDate  := date + 30;
                                  end;
                            end;

                         ExecOrOpen;
                      end;
                end;
             IBTR.Commit;
             if dm.RetornaStringTabela( 'TIPO', 'FORMAS_PAGAMENTO', 'CODIGO',  StrToInt(copy(ComboForma.Text, 1, 2)) ) = 'CH' then
                 begin 
                     BuscaFormulario( TFrmCadCheque, True );

                 end;

           except
             IBTR.Rollback;
             AlertaCad('Erro ao Baixar a(s) parcela(s)');
           end;
         finally


           QInsParcela.Close;
           IBQRecebe.Close;
           FrmContasRecRec.PcCred.ActivePageIndex:= 0;
           FrmContasRecRec.PcCredChange(FrmContasRecRec.PcCred);
           FrmContasRecRec.PcCred.ActivePageIndex:= 1;
           FrmContasRecRec.PcCredChange(FrmContasRecRec.PcCred);
           FrmContasRecRec.EdtCodCli.SetFocus;
           FrmContasRecRec.EdtCodCli.SelectAll;
           FrmRecebimento.Close;
         end;
      end;
end;

procedure TFrmRecebimento.EdtAcresExit(Sender: TObject);
begin 
   EdtTotalLiq.Text:= currtostr(strtocurr(EdtTotalBruto.Text) - strtocurr(EdtDevol.Text) + strtocurr(EdtAcres.Text) - strtocurr(EdtDesc.Text));
   EdtValorRec.Text:= currtostr(strtocurr(EdtTotalBruto.Text) - strtocurr(EdtDevol.Text) + strtocurr(EdtAcres.Text) - strtocurr(EdtDesc.Text));
end;

procedure TFrmRecebimento.FormShow(Sender: TObject);
begin 
   ComboForma.ItemIndex:= 0;

   { verifica se vai fazer pergunta para gerar pendencia }
   if dm.RetornaStringTabela('pergunta_parcela_pendente', 'parametros', 'cod_emp', iEmp) = 'S' then
      bPerg_Pendencia:= true
   else
      bPerg_Pendencia:= false;

   { Verificar se vai manter a data da notinha ser for recebimento por conta }
   if dm.RetornaStringTabela('manter_data_notinha', 'parametros', 'cod_emp', iEmp) = 'S' then
      bManterDataNotinha:= true
   else
      bManterDataNotinha:= false;

   { verifica se o usuario pode alterar a data do recebimento }
   if (not DM.Acesso('A025','I')) then
      EdtData.Enabled:= false
   else
      EdtData.Enabled:= true;

   { verifica se o usuário pode mudar o acréscimo ou desconto }
   if (not DM.Acesso('A026','I')) then
      begin 
         EdtAcres.Enabled:= false;
         EdtDesc.Enabled := false;
      end
   else
      begin 
         EdtAcres.Enabled:= true;
         EdtDesc.Enabled := true;
      end;

   if EdtAcres.Enabled then
      EdtAcres.SetFocus
   else
      EdtValorRec.SetFocus;
end;

procedure TFrmRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if not (FrmContasRecRec.QConsRec.State = dsInactive) then
      begin 
         if (trim(dm.RetornaStringTabela('imp_recibo_pagamento', 'parametros', 'cod_emp', iEmp)) = 'S') and (trim(FrmContasRecRec.EdtCodCli.Text) <> '') then
            FrmContasRecRec.BtnRecibo.Click;
      end;
   Action:= caFree;
end;

procedure TFrmRecebimento.FormCreate(Sender: TObject);
begin 
   { busca as formas de pagamento ref. contas a receber }
   
   ComboForma.Clear;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE USAR_CONTAS_RECEBER = ' + #39 + 'S' + #39 +
                        ' ORDER BY CODIGO';
             open;
             while not eof do
                begin 
                   ComboForma.Items.Add(FormataStringD(fieldbyname('codigo').AsString, '2', '0') + '-' + fieldbyname('descricao').AsString);
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

end.
