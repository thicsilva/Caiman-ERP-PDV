unit UConsGRP;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013White,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsGRP = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsGRP: TFrmConsGRP;

implementation
Uses Udm, Ubibli1, UCadGICMS, UCadProduto, UConsProd, URelProdGRP, UEntradas,
     UNotaFiscal, UAlterarGRP, UAlteraPreco, UMapaResumo, UCadCaixa, UCadTipoES,
     UOutrasSaidas, UOutrasEntradas, UCFOP_Tributacoes, UNovoPrincipal,
  UCadNewCaixa;

{$R *.dfm}

procedure TFrmConsGRP.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QGRP.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsGRP.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsGRP.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QGRP do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM GRUPO_ICMS');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_GRP LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_GRP');
         1: sql.Add(' WHERE NOME_GRP LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_GRP');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_GRP')
              else
                 sql.add(' WHERE COD_GRP = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsGRP.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    0,3: begin 
            BuscaFormulario( TFrmCadGICMS, True );
            with FrmCadGICMS do
               begin 
                  tag:= 1;
                  limpaedit(FrmCadGICMS);
                  ededit(FrmCadGICMS, false);
                  cod_grp.Text  := dm.QGRPCOD_GRP.AsString;
                  edtnome.Text  := dm.QGRPNOME_GRP.AsString;
                  EdtAliq.Text  := dm.QGRPALIQUOTA_GRP.AsString;
                  EdtCST.text   := dm.QGRPCST.AsString;

                  if trim(dm.QGRPTIPO_GRP.AsString) = 'TRI' then
                     ComboTipo.ItemIndex:= 0
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'ST' then
                     ComboTipo.ItemIndex:= 1
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'ISE' then
                     ComboTipo.ItemIndex:= 2
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'NT' then
                     ComboTipo.ItemIndex:= 3
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'DES' then
                     ComboTipo.ItemIndex:= 4
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'ACR' then
                     ComboTipo.ItemIndex:= 5
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'CAN' then
                     ComboTipo.ItemIndex:= 6
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'ONF' then
                     ComboTipo.ItemIndex:= 7
                  else
                  if trim(dm.QGRPTIPO_GRP.AsString) = 'OUT' then
                     ComboTipo.ItemIndex:= 8
                  else
                  ComboTipo.ItemIndex:= -1;

                  if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'I' then
                     ComboICMSServico.ItemIndex:= 0
                  else
                  if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'S' then
                     ComboICMSServico.ItemIndex:= 1
                  else
                  if trim(dm.QGRPICMS_SERVICO_GRP.AsString) = 'N' then
                     ComboICMSServico.ItemIndex:= 2
                  else
                     ComboICMSServico.ItemIndex:= -1;

                  if trim(dm.QGRPECF.AsString) = 'S' then
                     CheckECF.Checked:= true
                  else
                     CheckECF.Checked:= false;

                  FormShow(sender);
                  show;
               end;
            close;
         end;
    2: begin 
          with FrmRelProdGRP do
             begin 
                edtcod.Text  := dm.QGRPCOD_GRP.AsString;
                edtnome.Text := dm.QGRPNOME_GRP.AsString;
             end;
          close;
       end;
    4: begin 
          with FrmEntradas do
             begin 
                EdtCodGRP.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNomeGRP.Text := dm.QGRPNOME_GRP.AsString;
                EdtCST.SetFocus;
             end;
          close;
       end;
{    6: begin
          with FrmCadProduto do
             begin 
                EdtICMSContEst.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSContEST.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVEstCont.SetFocus;
             end;
          close;
       end;
    7: begin 
          with FrmCadProduto do
             begin 
                EdtICMSCFEst.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSCFEST.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVEstCF.SetFocus;
             end;
          close;
       end;
    8: begin 
          with FrmCadProduto do
             begin 
                EdtICMSContFora.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSContFORA.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVForaCont.SetFocus;
             end;
          close;
       end;
    9: begin 
          with FrmCadProduto do
             begin 
                EdtICMSCFFora.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSCFFORA.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVForaCF.SetFocus;
             end;
          close;
       end;        }
    10: begin
          with FrmAlterarGRP do
             begin 
                EdtICMSContEst.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSContEST.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVEstCont.SetFocus;
             end;
          close;
       end;
    11: begin 
          with FrmAlterarGRP do
             begin 
                EdtICMSCFEst.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSCFEST.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVEstCF.SetFocus;
             end;
          close;
       end;
    12: begin 
          with FrmNotaFiscal do
             begin 
                EdtCodGRP.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNomeGRP.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOP.SetFocus;
             end;
          close;
        end;
    13: begin 
           with FrmAlteraPreco do
             begin 
                EdtCod.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNome.Text := dm.QGRPNOME_GRP.AsString;
             end;
          close;
        end;
    14: begin 
          with FrmAlterarGRP do
             begin 
                EdtICMSContFora.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSContFORA.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVForaCont.SetFocus;
             end;
          close;
       end;
    15: begin 
          with FrmAlterarGRP do
             begin 
                EdtICMSCFFora.Text     := dm.QGRPCOD_GRP.AsString;
                EdtNomeICMSCFFORA.Text := dm.QGRPNOME_GRP.AsString;
                EdtCFOPVForaCF.SetFocus;
             end;
          close;
        end;
    16: begin 
           with FrmMapaResumo do
              begin 
                 if trim(dm.QGRPECF.AsString) = 'S' then
                    begin 
                       EdtCodGrp.Text  := dm.QGRPCOD_GRP.AsString;
                       EdtNomeGrp.Text := dm.QGRPNOME_GRP.AsString;
                       EdtValor.SetFocus;
                    end
                 else
                    begin 
                       AlertaCad('Grupo não usado em ECF');
                       exit;
                    end;
              end;
           close;
        end;
    17: begin 
           with FrmCadCaixa do
              begin 
                 if trim(dm.QGRPECF.AsString) = 'S' then
                    begin 
                       EdtCodGrp.Text  := dm.QGRPCOD_GRP.AsString;
                       EdtNomeGrp.Text := dm.QGRPNOME_GRP.AsString;
                       EdtIndiceECF.SetFocus;
                    end
                 else
                    AlertaCad('Grupo não usado em ECF');
              end;
           close;
        end;
    18: begin 
          with FrmCadTipoES do
             begin 
                EdtCodGRP.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNomeGRP.Text := dm.QGRPNOME_GRP.AsString;
             end;
          close;
       end;
    19: begin 
          with FrmOutrasSaidas do
             begin 
                EdtCodGRP.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNomeGRP.Text := dm.QGRPNOME_GRP.AsString;
                EdtCST.SetFocus;
             end;
          close;
       end;
    20: begin 
          with FrmOutrasEntradas do
             begin 
                EdtCodGRP.Text  := dm.QGRPCOD_GRP.AsString;
                EdtNomeGRP.Text := dm.QGRPNOME_GRP.AsString;
                EdtCST.SetFocus;
             end;
          close;
       end;
    21: begin 
              frmCFOP_Tributacoes.edtCodICMS.Text := dm.QGRPCOD_GRP.AsString;
              frmCFOP_Tributacoes.edtDescICMS.Text := dm.QGRPNOME_GRP.AsString;
              close;
        end;
    {22: begin
           FrmCadProduto.dbedtICMS_DENTRO.Text := dm.QGRPCOD_GRP.AsString;
           FrmCadProduto.Desc_icms_dentro.Text  :=  dm.QGRPNOME_GRP.AsString;
           close;
        end;
    23: begin 
           FrmCadProduto.dbedtICMS_FORA.Text := dm.QGRPCOD_GRP.AsString;
           FrmCadProduto.Desc_icms_fora.Text  :=  dm.QGRPNOME_GRP.AsString;
           close;
        end;  }
    24: begin
           frmCadNewCaixa.EdtCodGrp.Text := DM.QGRPCOD_GRP.AsString;
           frmCadNewCaixa.EdtNomeGrp.Text := DM.QGRPNOME_GRP.AsString;
           Close;
        end;
  end;
end;

procedure TFrmConsGRP.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsGRP.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.






