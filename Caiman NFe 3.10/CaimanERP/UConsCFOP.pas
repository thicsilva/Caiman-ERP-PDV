unit UConsCFOP;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsCFOP = class(TFrmConsNovo)
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
  FrmConsCFOP: TFrmConsCFOP;

implementation
Uses Udm, Ubibli1, UCadCFOP, UNotaFiscal, UCadProduto, UEntradas,
     URegEntradas, URegSaidas, UAlterarGRP, UCadTipoES, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsCFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QCFOP.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCFOP.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsCFOP.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QCFOP do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM CFOP');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_CFO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CFO');
         1: sql.add(' WHERE NOME_CFO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CFO');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_CFO')
               else
                  sql.add(' WHERE COD_CFO = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsCFOP.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0,1: begin 
          BuscaFormulario( TFrmCadCFOP, True );
          with FrmCadCFOP do
             begin 
                tag:= 1;
                limpaedit(FrmCadCFOP);
                ededit(FrmCadCFOP, false);
                EdtCod.Text  := dm.QCFOPCOD_CFO.AsString;
                edtnome.Text := dm.QCFOPNOME_CFO.AsString;
                MemoObs.text := dm.QCFOPINF_COMPL_NF.AsString;
                if trim( dm.QCFOPUSA_CSOSN.AsString ) = 'S' then
                   CheckCSOSN.Checked := true
                else
                   CheckCSOSN.Checked := false;
                if trim(dm.QCFOPDESTACA_ICMS.AsString) = 'S' then
                   CheckICMS.Checked:= true
                else
                   CheckICMS.Checked:= false;
                if trim(dm.QCFOPSAIR_REL_RESUMO_ALIQ.AsString) = 'S' then
                   CheckRelAliq.Checked:= true
                else
                   CheckRelAliq.Checked:= false;
                if trim(dm.QCFOPREGISTRADO_ECF.AsString) = 'S' then
                   CheckCupomFiscal.Checked:= true
                else
                   CheckCupomFiscal.Checked:= false;
                if trim(dm.QCFOPCALCULA_PIS_COFINS.AsString) = 'S' then
                   CheckPisCofins.Checked:= true
                else
                   CheckPisCofins.Checked:= false;
                FormShow(sender);
                show;
             end;
          close;
       end;
  { 3: begin
         with FrmCadProduto do
            begin 
               EdtCFOPVEstCont.Text    := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVEstCont.Text:= dm.QCFOPNOME_CFO.AsString;
               EdtCSTContEst.SetFocus;
            end;
         close;
      end;
   4: begin 
         with FrmCadProduto do
            begin 
               EdtCFOPVEstCF.Text    := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVEstCF.Text:= dm.QCFOPNOME_CFO.AsString;
               EdtCSTCFEst.SetFocus;
            end;
         close;
      end;      }
   7: begin 
         with FrmEntradas do
            begin 
               EdtCFOP.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOP.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCodGRP.SetFocus;
            end;
         close;
      end;
 {  8: begin
         with FrmCadProduto do
            begin 
               EdtCFOPVForaCont.Text    := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVForaCont.Text:= dm.QCFOPNOME_CFO.AsString;
               EdtCSTContFora.SetFocus;
            end;
         close;
      end;
   9: begin 
         with FrmCadProduto do
            begin 
               EdtCFOPVForaCF.Text    := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVForaCF.Text:= dm.QCFOPNOME_CFO.AsString;
               EdtCSTCFFora.SetFocus;
            end;
         close;
      end;           }
   10: begin 
         with FrmNotaFiscal do
            begin 
               EdtCFOP.Text := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOP.Text:= dm.QCFOPNOME_CFO.AsString;
               EdtCST.SetFocus;
            end;
         close;
      end;
   11: begin 
         with FrmRegEntradas do
            begin 
               EdtCFOP.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOP.Text := dm.QCFOPNOME_CFO.AsString;
               EdtValorContabil.SetFocus;
            end;
         close;
      end;
   12: begin 
         with FrmRegSaidas do
            begin 
               EdtCFOP.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOP.Text := dm.QCFOPNOME_CFO.AsString;
               EdtValorContabil.SetFocus;
            end;
         close;
      end;
   13: begin 
         with FrmAlterarGRP do
            begin 
               EdtCFOPVEstCont.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVEstCont.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCSTContEst.SetFocus;
            end;
         close;
      end;
   14: begin 
         with FrmAlterarGRP do
            begin 
               EdtCFOPVEstCF.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVEstCF.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCSTCFEst.SetFocus;
            end;
         close;
      end;
   15: begin 
         with FrmAlterarGRP do
            begin 
               EdtCFOPVForaCont.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVForaCont.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCSTContFora.SetFocus;
            end;
         close;
      end;
   16: begin 
         with FrmAlterarGRP do
            begin 
               EdtCFOPVForaCF.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPVForaCF.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCSTCFFora.SetFocus;
            end;
         close;
      end;
   21: begin 
         with FrmCadTipoES do
            begin 
               EdtCFOPEstadoTrib.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPEstadoTrib.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCFOPEstadoSub.SetFocus;
            end;
         close;
      end;
   22: begin 
         with FrmCadTipoES do
            begin 
               EdtCFOPEstadoSub.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPEstadoSub.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCFOPForaTrib.SetFocus;
            end;
         close;
      end;
   23: begin 
         with FrmCadTipoES do
            begin 
               EdtCFOPForaTrib.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPForaTrib.Text := dm.QCFOPNOME_CFO.AsString;
               EdtCFOPForaSub.SetFocus;
            end;
         close;
      end;
   24: begin 
         with FrmCadTipoES do
            begin 
               EdtCFOPForaSub.Text     := dm.QCFOPCOD_CFO.AsString;
               EdtNomeCFOPForaSub.Text := dm.QCFOPNOME_CFO.AsString;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsCFOP.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCFOP.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
