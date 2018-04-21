unit UConsFormasPagamento;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsFormasPagamento = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsFormasPagamento: TFrmConsFormasPagamento;

implementation
Uses UDM, Ubibli1, UCadFormasPagamentos, UCadCaixa, UNovoPrincipal,
  UCadNewCaixa;

{$R *.dfm}

procedure TFrmConsFormasPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QFormas.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFormasPagamento.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsFormasPagamento.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QFormas do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM FORMAS_PAGAMENTO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY CODIGO')
               else
                  sql.add(' WHERE CODIGO = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsFormasPagamento.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0: begin
         BuscaFormulario(  TFrmCadFormaPagamento, True );
         with FrmCadFormaPagamento do
            begin 
               tag:= 1;
               limpaedit(FrmCadFormaPagamento);
               ededit(FrmCadFormaPagamento, false);
               codigo.Text  := dm.QFormasCODIGO.AsString;
               edtnome.Text := dm.QFormasDESCRICAO.AsString;

               if trim(DM.QFormasTIPO.AsString) = 'DN' then
                  ComboTipo.ItemIndex:= 0
               else
               if trim(DM.QFormasTIPO.AsString) = 'PR' then
                  ComboTipo.ItemIndex:= 1
               else
               if trim(DM.QFormasTIPO.AsString) = 'CH' then
                  ComboTipo.ItemIndex:= 2
               else
               if trim(DM.QFormasTIPO.AsString) = 'CA' then
                  ComboTipo.ItemIndex:= 3
               else
               if trim(DM.QFormasTIPO.AsString) = 'BO' then
                  ComboTipo.ItemIndex:= 4
               else
               if trim(DM.QFormasTIPO.AsString) = 'TI' then
                  ComboTipo.ItemIndex:= 5
               else
               if trim(DM.QFormasTIPO.AsString) = 'CV' then
                  ComboTipo.ItemIndex:= 6
               else
               if trim(DM.QFormasTIPO.AsString) = 'TR' then
                  ComboTipo.ItemIndex:= 7
               else
               if trim(DM.QFormasTIPO.AsString) = 'CC' then
                  ComboTipo.ItemIndex:= 8
               else
               if trim(DM.QFormasTIPO.AsString) = 'TV' then
                  ComboTipo.ItemIndex:= 9
               else
               ComboTipo.ItemIndex:= -1;

               if trim(DM.QFormasUSA_TEF.AsString) = 'S' then
                  CheckTEF.Checked:= true
               else
                  CheckTEF.Checked:= false;

               if trim(DM.QFormasABRE_GAVETA.AsString) = 'S' then
                  CheckGaveta.Checked:= true
               else
                  CheckGaveta.Checked:= false;

               if trim(DM.QFormasUSAR_CONTAS_RECEBER.AsString) = 'S' then
                  CheckContasReceber.Checked:= true
               else
                  CheckContasReceber.Checked:= false;

               if trim(DM.QFormasUSAR_CONTAS_PAGAR.AsString) = 'S' then
                  CheckContasPagar.Checked:= true
               else
                  CheckContasPagar.Checked:= false;

               ComboTabelaPreco.ItemIndex:= dm.QFormasTABELA_PRECO.AsInteger;

               if trim(DM.QFormasCONCEDER_DESCONTO.AsString) = 'S' then
                  CheckDesconto.Checked:= true
               else
                  CheckDesconto.Checked:= false;

               EdtCodContaVendas.Text               := dm.QFormasCODIGO_CONTA_VENDAS.AsString;
               EdtCodCentroCustoVendas.Text         := dm.QFormasCODIGO_CENTRO_CUSTO_VENDAS.AsString;
               EdtCodContaCTR.Text                  := DM.QFormasCODIGO_CONTA_CTR.AsString;
               EdtCodContaCTP.Text                  := DM.QFormasCODIGO_CONTA_CTP.AsString;
               EdtCodCentroCustoCTR.Text            := DM.QFormasCODIGO_CENTRO_CUSTO_CTR.AsString;
               EdtCodContaCTREstorno.Text           := dm.QFormasCODIGO_CONTA_CTR_ESTORNO.AsString;
               EdtCodContaCTPEstorno.Text           := dm.QFormasCODIGO_CONTA_CTP_ESTORNO.AsString;
               EdtCodCentroCustoCTREstorno.Text     := dm.QFormasCODIGO_CENTRO_CUSTO_CTR_ESTORNO.AsString;
               EdtCodCentroCustoCTPEstorno.Text     := dm.QFormasCODIGO_CENTRO_CUSTO_CTP_ESTORNO.AsString;
               EdtCodContaVendasEstorno.Text        := dm.QFormasCODIGO_CONTA_VEN_ESTORNO.AsString;
               EdtCodCentroCustoVendasEstorno.Text  := dm.QFormasCODIGO_CENTRO_CUSTO_VEN_ESTORNO.AsString;

               if trim(DM.QFormasUSAR_PAF_ECF.AsString) = 'S' then
                  CheckPAF.Checked:= true
               else
                  CheckPAF.Checked:= false;

               FormShow(sender);
               show;
            end;
         close;
      end;
   1: begin 
         with FrmCadCaixa do
            begin 
               EdtCodForma.Text  := dm.QFormasCODIGO.AsString;
               EdtNomeForma.Text := dm.QFormasDESCRICAO.AsString;
            end;
         close;
      end;
    2: begin
          frmCadNewCaixa.EdtCodForma.Text := DM.QFormasCODIGO.AsString;
          frmCadNewCaixa.EdtNomeForma.Text := DM.QFormasDESCRICAO.AsString;
          Close;
       end;
  end;
end;

procedure TFrmConsFormasPagamento.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFormasPagamento.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
