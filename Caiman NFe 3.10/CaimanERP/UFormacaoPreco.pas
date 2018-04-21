unit UFormacaoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario;

type
  TFrmFormacaoPreco = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    EdtCodProd: UNovosComponentes.TEdit;
    EdtNomeProd: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LGrupoICMS: TLabel;
    LMargem: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    EdtCusto: TCurrencyEdit;
    Label6: TLabel;
    EdtMargemLucro: TCurrencyEdit;
    Label7: TLabel;
    EdtSugestao: TCurrencyEdit;
    Label8: TLabel;
    EdtPrecoVenda: TCurrencyEdit;
    Label10: TLabel;
    EdtPrecoOFF: TCurrencyEdit;
    Label30: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtCredICMS: TCurrencyEdit;
    EdtCredPis: TCurrencyEdit;
    EdtCredCofins: TCurrencyEdit;
    Label14: TLabel;
    EdtDebICMS: TCurrencyEdit;
    Label15: TLabel;
    EdtDebPis: TCurrencyEdit;
    Label16: TLabel;
    EdtDebCofins: TCurrencyEdit;
    EdtReceitaLiq: TCurrencyEdit;
    Label17: TLabel;
    Label18: TLabel;
    EdtCustoLiq: TCurrencyEdit;
    Label19: TLabel;
    EdtLucroBruto: TCurrencyEdit;
    Label20: TLabel;
    EdtDespOper: TCurrencyEdit;
    Label21: TLabel;
    EdtLucroAntes: TCurrencyEdit;
    Label22: TLabel;
    EdtCSLL: TCurrencyEdit;
    Label23: TLabel;
    EdtIR: TCurrencyEdit;
    Label24: TLabel;
    EdtLucroLiq: TCurrencyEdit;
    RdgPreco: TRadioGroup;
    LIsentoPisCofins: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EdtPercLucroLiq: TCurrencyEdit;
    EdtAuxPrecoVenda: TCurrencyEdit;
    EdtAuxPromocao: TCurrencyEdit;
    EdtAuxProgramado: TCurrencyEdit;
    Label27: TLabel;
    EdtPromocao: TCurrencyEdit;
    PanelCreditoICMS: TPanel;
    Label28: TLabel;
    EdtValorCredICMS: TCurrencyEdit;
    StatusBar2: TStatusBar;
    Label29: TLabel;
    EdtPrazo: TCurrencyEdit;
    Label31: TLabel;
    EdtPrazoOFF: TCurrencyEdit;
    BtnGravar: TButton;
    BtnGrava: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtMargemLucroExit(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure CalculaImpostos;
    procedure RdgPrecoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Limpa;
    procedure BtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormacaoPreco: TFrmFormacaoPreco;

implementation
uses
  UDM, UEntradas, UAlteraPreco, UNovoPrincipal;
var  cPis, cCofins, cIR, cCSLL, cAliqICMS, cDespesas, cCredICMS : currency;

{$R *.dfm}

procedure TFrmFormacaoPreco.Limpa;
begin 
   EdtCredICMS.Clear;
   EdtCredPis.Clear;
   EdtCredCofins.Clear;

   EdtDebICMS.Clear;
   EdtDebPis.Clear;
   EdtDebCofins.Clear;

   EdtReceitaLiq.Clear;
   EdtCustoLiq.Clear;
   EdtLucroBruto.Clear;
   EdtDespOper.Clear;
   EdtLucroAntes.Clear;
   EdtCSLL.Clear;
   EdtIR.Clear;
   EdtLucroLiq.Clear;
   EdtPercLucroLiq.Clear;
end;

procedure TFrmFormacaoPreco.CalculaImpostos;
var cAuxCusto      : currency;
    cAuxPrecoVenda : currency;
    cTotalCredito  : currency;
    cTotalDebito   : currency;
    cLucroAntes    : currency;
begin 
   case RdgPreco.ItemIndex of
     0: cAuxPrecoVenda:= strtocurr(EdtSugestao.Text);
     1: cAuxPrecoVenda:= strtocurr(EdtPrecoVenda.text);
     2: cAuxPrecoVenda:= strtocurr(EdtPromocao.Text);
     3: cAuxPrecoVenda:= strtocurr(EdtPrazo.Text);
     4: cAuxPrecoVenda:= strtocurr(EdtPrecoOFF.Text);
     5: cAuxPrecoVenda:= strtocurr(EdtPrazoOFF.Text);
   end;

   if cAuxPrecoVenda > 0 then
      begin 
         cAuxCusto       := strtocurr(EdtCusto.Text);
         cTotalCredito   := 0;
         cTotalDebito    := 0;
         cLucroAntes     := 0;

         { calcula os creditos }
         EdtCredICMS.Text   := currtostr(cCredICMS);
         EdtCredPis.Text    := currtostr((cAuxCusto * cPis) / 100);
         EdtCredCofins.Text := currtostr((cAuxCusto * cCofins) / 100);
         cTotalCredito      := strtocurr(EdtCredICMS.Text) + strtocurr(EdtCredPis.Text) + strtocurr(EdtCredCofins.Text);

         { calcula os debitos }
         EdtDebICMS.Text    := currtostr((cAuxPrecoVenda * cAliqICMS) / 100);
         EdtDebPis.Text     := currtostr((cAuxPrecoVenda * cPis) / 100);
         EdtDebCofins.Text  := currtostr((cAuxPrecoVenda * cCofins) / 100);
         cTotalDebito       := strtocurr(EdtDebICMS.Text) + strtocurr(EdtDebPis.Text) + strtocurr(EdtDebCofins.Text);

         { calcula a receita liquida }
         EdtReceitaLiq.Text:= currtostr(cAuxPrecoVenda - cTotalDebito);

         { calcula o custo liquido }
         EdtCustoLiq.Text  := currtostr(cAuxCusto - cTotalCredito);

         { calcula o lucro bruto }
         EdtLucroBruto.Text:= currtostr(strtocurr(EdtReceitaLiq.Text) - strtocurr(EdtCustoLiq.Text));

         { calcula a despesa operacional }
         EdtDespOper.Text  := currtostr((cAuxPrecoVenda * cDespesas) / 100);

         { calcula o lucro antes das provisoes }
         cLucroAntes:= (strtocurr(EdtLucroBruto.Text) - strtocurr(EdtDespOper.Text));
         EdtLucroAntes.Text:= currtostr(cLucroAntes);

         { calcula a contribuicao social e o IR }
         EdtCSLL.Text:= currtostr((cLucroAntes * cCSLL) / 100);
         EdtIR.Text  := currtostr((cLucroAntes * cIR) / 100);

         { calcula o lucro liquido }
         EdtLucroLiq.Text     := currtostr(cLucroAntes - strtocurr(EdtCSLL.Text) - strtocurr(EdtIR.Text));
         EdtPercLucroLiq.Text := currtostr((strtocurr(EdtLucroLiq.Text) / cAuxPrecoVenda) * 100);
      end
   else
      Limpa;
end;

procedure TFrmFormacaoPreco.FormShow(Sender: TObject);
begin 
   cPis      := 0;
   cCofins   := 0;
   cIR       := 0;
   cCSLL     := 0;
   cDespesas := 0;
   cAliqICMS := 0;
   cCredICMS := 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
      with dm.QConsulta do
         begin 
            Close;
            SQL.Clear;
            SQL.Add('SELECT P.VALOR_PRO, P.PROMOCAO_PRO, P.MARGEM_LUCRO_PRO, ' +
                    'P.PRECO_PROGRAMADO, P.ALIQUOTA_PIS, P.ALIQUOTA_COFINS,  ' +
                    'P.ALIQUOTA_IR, P.ALIQUOTA_CSLL, P.ALIQUOTA_OUTRAS,      ' +
                    'P.ISENTO_PIS_COFINS_PRO, P.PRECO_CUSTO, P.CREDITO_ICMS, ' +
                    'P.PRECO_PRAZO_PRO, P.PRECO_PROGRAMADO_PRAZO,            ' +
                    'G.ALIQUOTA_GRP, G.NOME_GRP                              ' +
                    'FROM PRODUTO P ' +
                    'INNER JOIN GRUPO_ICMS G ' +
                    'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
                    'WHERE P.COD_PRO = :CODPRO');
            Parambyname('codpro').AsInteger:= strtoint(EdtCodProd.Text);
            Open;
            EdtAuxPrecoVenda.Text := fieldbyname('valor_pro').AsString;
            EdtAuxPromocao.Text   := fieldbyname('promocao_pro').AsString;
            EdtAuxProgramado.Text := fieldbyname('preco_programado').AsString;
            LMargem.Caption     := currtostrf(fieldbyname('margem_lucro_pro').AsCurrency, ffnumber, 2) + '%';
            LGrupoICMS.Caption  := fieldbyname('nome_grp').AsString;
            if trim(fieldbyname('isento_pis_cofins_pro').AsString) = 'S' then
               LIsentoPisCofins.Caption:= 'ISENTO'
            else
               LIsentoPisCofins.Caption:= 'NORMAL';

            EdtMargemLucro.Text := fieldbyname('margem_lucro_pro').AsString;
            EdtPrecoVenda.Text  := fieldbyname('valor_pro').AsString;
            EdtPrecoOFF.Text    := fieldbyname('preco_programado').AsString;
            EdtPromocao.Text    := fieldbyname('promocao_pro').AsString;
            EdtPrazo.Text       := fieldbyname('preco_prazo_pro').AsString;
            EdtPrazoOFF.Text    := fieldbyname('preco_programado_prazo').AsString;

            case FrmFormacaoPreco.Tag of
              0: begin 
                    RdgPreco.ItemIndex := 0;
                    EdtCusto.Text      := FrmEntradas.QBuscaItensCUSTO.AsString; //Entradas
                    cCredICMS          := FrmEntradas.QBuscaItensVALOR_ICMS.AsCurrency / FrmEntradas.QBuscaItensQTD_PRO.AsCurrency;
                 end;
              1: begin 
                    RdgPreco.ItemIndex := 1;
                    EdtCusto.Text      := fieldbyname('preco_custo').AsString;   //AlteraPreco
                    cCredICMS          := fieldbyname('credito_icms').AsCurrency;
                 end;
            end;

            cPis      := fieldbyname('aliquota_pis').AsCurrency;
            cCofins   := fieldbyname('aliquota_cofins').AsCurrency;
            cIR       := fieldbyname('aliquota_ir').AsCurrency;
            cCSLL     := fieldbyname('aliquota_csll').AsCurrency;
            cDespesas := fieldbyname('aliquota_outras').AsCurrency;
            cAliqICMS := fieldbyname('aliquota_grp').AsCurrency;
         end;
      dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do produto');
     end;
   finally
     dm.QConsulta.Close;
     EdtMargemLucroExit(self);
     RdgPrecoClick(self);
     EdtMargemLucro.SetFocus;
   end;
end;

procedure TFrmFormacaoPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
   if FrmFormacaoPreco.Tag = 1 then
      FrmAlteraPreco.BtnOk.Click;
end;

procedure TFrmFormacaoPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   case key of
    vk_escape: begin 
                  if PanelCreditoICMS.Visible then
                     begin 
                        EdtMargemLucro.SetFocus;
                        PanelCreditoICMS.Visible:= false;
                     end
                  else
                     close;
               end;
    vk_f4: begin 
              EdtValorCredICMS.Clear;
              EdtValorCredICMS.Text:= currtostr(cCredICMS);
              PanelCreditoICMS.Visible:= true;
              EdtValorCredICMS.SetFocus;
           end;
   end;
end;

procedure TFrmFormacaoPreco.EdtMargemLucroExit(Sender: TObject);
begin 
   if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMargemLucro.text) > 0) then
      EdtSugestao.Text:= currtostr(strtocurr(EdtCusto.Text) / (1 - (strtocurr(EdtMargemLucro.Text) / 100)))
   else
      EdtSugestao.Clear;

   if RdgPreco.ItemIndex = 0 then
      CalculaImpostos;
end;

procedure TFrmFormacaoPreco.BtnGravaClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Atualização do Produto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
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
                   sql.add('UPDATE PRODUTO SET VALOR_PRO = :1, PRECO_PROGRAMADO = :2,   ' +
                           'MARGEM_LUCRO_PRO = :3, PRECO_CUSTO = :4, PROMOCAO_PRO = :5, ' +
                           'PRECO_PRAZO_PRO = :6, PRECO_PROGRAMADO_PRAZO = :8           ' +
                           'WHERE COD_PRO = :7');
                   Parambyname('1').AsCurrency:= strtocurr(EdtPrecoVenda.Text);
                   Parambyname('2').AsCurrency:= strtocurr(EdtPrecoOFF.Text);
                   Parambyname('3').AsCurrency:= strtocurr(EdtMargemLucro.Text);
                   Parambyname('4').AsCurrency:= strtocurr(EdtCusto.Text);
                   Parambyname('5').AsCurrency:= strtocurr(EdtPromocao.Text);
                   Parambyname('6').AsCurrency:= strtocurr(EdtPrazo.Text);
                   Parambyname('7').AsInteger := StrToInt(EdtCodProd.Text);
                   Parambyname('8').AsCurrency:= StrToCurr(EdtPrazoOFF.Text);
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao atualizar o produto');
           end;
         finally
           dm.QConsulta.Close;
           close;
         end;
      end;
end;

procedure TFrmFormacaoPreco.RdgPrecoClick(Sender: TObject);
begin 
   CalculaImpostos;
end;

procedure TFrmFormacaoPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmFormacaoPreco.BtnGravarClick(Sender: TObject);
var cAuxCreditoICMS : currency;
begin 
   if Application.MessageBox('Confirma a Atualização do Crédito de ICMS?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         cAuxCreditoICMS:= cCredICMS;
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.add('UPDATE PRODUTO SET CREDITO_ICMS = :1 ' +
                           'WHERE COD_PRO = :2');
                   Parambyname('1').AsCurrency:= strtocurr(EdtValorCredICMS.Text);
                   Parambyname('2').AsInteger:= StrToInt(EdtCodProd.Text);
                   ExecOrOpen;
                   cCredICMS:= strtocurr(EdtValorCredICMS.Text);
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             cCredICMS:= cAuxCreditoICMS;
             AlertaCad('Erro ao atualizar o produto');
           end;
         finally
           dm.QConsulta.Close;
           EdtMargemLucro.SetFocus;
           PanelCreditoICMS.Visible:= false;
           EdtCredICMS.Text:= currtostr(cCredICMS);
           RdgPrecoClick(sender);
         end;
      end;
end;

end.
