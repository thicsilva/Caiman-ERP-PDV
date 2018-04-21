unit UConsConvenio;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsConvenio = class(TFrmConsNovo)
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
  FrmConsConvenio: TFrmConsConvenio;

implementation
Uses Udm, Ubibli1, UCadConvenio, UCadCli, UConsCli, URelConv, URecCliConv, URelCTR,
     URelRecebimento, URecConvenio, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsConvenio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QConv.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsConvenio.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsConvenio.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QConv do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM CONVENIO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_CON LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CON');
         1: sql.add(' WHERE NOME_CON LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CON');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_CON')
               else
                  sql.add(' WHERE COD_CON = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsConvenio.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin 
  inherited;
  case tag of
   0,1:begin 
          BuscaFormulario( TFrmCadConvenio, True );
          with FrmCadConvenio do
             begin 
                Tag:= 1;
                limpaedit(FrmCadConvenio);
                ededit(FrmCadConvenio, false);
                cod_con.Text         := dm.QConvCOD_CON.AsString;
                edtnome.Text         := dm.QConvNOME_CON.Value;
                edtend.Text          := dm.QConvEND_CON.Value;
                edtbai.Text          := dm.QConvBAI_CON.Value;
                edtcid.Text          := dm.QConvCID_CON.Value;
                for i:= 0 to 26 do
                   begin 
                      if comboest.Items[i] = dm.QConvEST_CON.Value then
                         comboest.ItemIndex:= i;
                   end;
                edtcep.Text          := dm.QConvCEP_CON.Value;
                edttel.Text          := dm.QConvTEL_CON.Value;
                edtfax.Text          := dm.QConvFAX_CON.Value;
                edtcnpj.Text         := dm.QConvCNPJ_CON.Value;
                edtinsc.Text         := dm.QConvINSC_CON.Value;
                edtresp.Text         := dm.QConvRESPONSAVEL_CON.Value;
                if trim(dm.QConvATIVO_CON.Value) = 'S' then
                   comboativo.ItemIndex:= 0
                else
                   comboativo.ItemIndex:= 1;
                MemoTermo.Text       := DM.qconvOBS_AUTORIZACAO_CON.Value;
                if dm.QConvDIA_REFERENCIA_CON.IsNull then
                   ComboDia.ItemIndex:= -1
                else
                   combodia.ItemIndex:= dm.QConvDIA_REFERENCIA_CON.Value - 1;
                edtdesconto.Text     := dm.QConvDESCONTO_CON.AsString;
                FormShow(sender);
                Show;
             end;
          close;
       end;
   2:  begin 
          with FrmCadCli do
             begin 
                EdtCodConvenio.Text  := dm.QConvCOD_CON.AsString;
                EdtNomeConvenio.Text := dm.QConvNOME_CON.AsString;

                pg.ActivePageIndex:= 0;
                if ComboFJ.ItemIndex = 0 then
                   edtnasc.SetFocus
                else
                   EdtCNPJ.SetFocus;
             end;
          close;
       end;
   3:  begin 
          with FrmConsCli do
             begin 
                edtcod.Text   := dm.QConvCOD_CON.AsString;
                edtnome.Text  := dm.QConvNOME_CON.Value;
                btnok.SetFocus;
             end;
          close;
       end;
   4:  begin 
          with FrmRelConv do
             begin 
                cod_con.Text   := dm.QConvCOD_CON.AsString;
                EdtNomeCon.Text:= dm.QConvNOME_CON.Value;
             end;
          close;
       end;
   5:  begin 
          with FrmRelCliConv do
             begin 
                EdtCodConvIni.Text  := dm.QConvCOD_CON.AsString;
                EdtNomeConvIni.Text := dm.QConvNOME_CON.Value;
                EdtCodConvFin.SetFocus;
             end;
          close;
       end;
   6:  begin 
          with FrmRelCliConv do
             begin 
                EdtCodConvFin.Text  := dm.QConvCOD_CON.AsString;
                EdtNomeConvFin.Text := dm.QConvNOME_CON.Value;
                BtnVis.SetFocus;
             end;
          close;
       end;
   7:  begin 
          with FrmRelCTR do
             begin 
                EdtCodConv.Text   := dm.QConvCOD_CON.AsString;
                EdtNomeConv.Text  := dm.QConvNOME_CON.Value;
                BtnVis.SetFocus;
             end;
          close;
       end;
   8:  begin 
          with FrmRelRecebimento do
             begin 
                EdtCodConv.Text := dm.QConvCOD_CON.AsString;
                EdtNomeConv.Text:= dm.QConvNOME_CON.Value;
                ComboCaixa.SetFocus;
             end;
          close;
       end;
   9:  begin 
          with FrmRecConvenio do
             begin 
                cod_con.Text     := dm.QConvCOD_CON.AsString;
                EdtNomeCon.Text  := dm.QConvNOME_CON.Value;
                edtdataini.SetFocus;
             end;
          close;
       end;
  end;
end;

procedure TFrmConsConvenio.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsConvenio.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
