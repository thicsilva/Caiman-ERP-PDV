unit UConsLab;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, UCONSNOVO, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsLab = class(TFrmConsNovo)
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
  FrmConsLab: TFrmConsLab;

implementation
Uses Udm, Ubibli1, UCadLab, UCadProduto, UConsProd, URelProduto,
     URelCusto, UAlteraPreco, URelProdutosVendidos, URelEstoque, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QLab.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLab.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsLab.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QLab do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM LABORATORIO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_LAB LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_LAB');
         1: sql.add(' WHERE NOME_LAB LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_LAB');
         2: begin
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_LAB')
              else
                 sql.add(' WHERE COD_LAB = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsLab.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
    0,3: begin
           BuscaFormulario( TFrmCadLab, True );
            with FrmCadLab do
               begin
                  tag:= 1;
                  limpaedit(FrmCadLab);
                  ededit(FrmCadLab, false);
                  cod_lab.Text  := dm.QLabCOD_LAB.AsString;
                  edtnome.Text  := dm.QLabNOME_LAB.AsString;
                  FormShow(sender);
                  show;
               end;
            close;
         end;
{    1: begin
          with FrmCadProduto do
             begin
                cod_lab.Text     := dm.QLabCOD_LAB.AsString;
                edtnomelab.Text  := dm.QLabNOME_LAB.AsString;
                cod_sec.SetFocus;
             end;
          close;
       end;
    2: begin
          with FrmConsProd do
             begin
                edtcod.Text   := dm.QLabCOD_LAB.AsString;
                edtnome.Text  := dm.QLabNOME_LAB.AsString;
                btnok.SetFocus;
             end;
          close;
       end;  }
    4: begin
          with FrmRelProduto do
             begin
                EdtCodIni.Text   := dm.QLabCOD_LAB.AsString;
                EdtNomeIni.Text  := dm.QLabNOME_LAB.AsString;
                edtcodfin.SetFocus;
             end;
          close;
       end;
    5: begin
          with FrmRelProduto do
             begin
                EdtCodFin.Text   := dm.QLabCOD_LAB.AsString;
                EdtNomeFin.Text  := dm.QLabNOME_LAB.AsString;
             end;
          close;
       end;
    6: begin
          with FrmRelCusto do
             begin
                EdtCodIni.Text   := dm.QLabCOD_LAB.AsString;
                EdtNomeIni.Text  := dm.QLabNOME_LAB.AsString;
                edtcodfin.SetFocus;
             end;
          close;
       end;
    7: begin
          with FrmRelCusto do
             begin
                EdtCodFin.Text   := dm.QLabCOD_LAB.AsString;
                EdtNomeFin.Text  := dm.QLabNOME_LAB.AsString;
                rdg.SetFocus;
             end;
          close;
       end;
    9: begin
          with FrmAlteraPreco do
             begin
                EdtCod.Text  := dm.QLabCOD_LAB.AsString;
                EdtNome.Text := dm.QLabNOME_LAB.AsString;
                BtnOk.SetFocus;
             end;
          close;
       end;
    10: begin
          with FrmRelProdutosVendidos do
             begin
                EdtCod.Text  := dm.QLabCOD_LAB.AsString;
                EdtNome.Text := dm.QLabNOME_LAB.AsString;
             end;
          close;
       end;
    11: begin
          with FrmRelEstoque do
             begin
                EdtCod.Text  := dm.QLabCOD_LAB.AsString;
                EdtNome.Text := dm.QLabNOME_LAB.AsString;
             end;
          close;
       end;
    12: begin
           with frmCadProduto do
              begin
                 QPrincipalCOD_LAB.AsInteger := DM.QLabCOD_LAB.AsInteger;
              end;
           Close;
        end;
  end;
end;

procedure TFrmConsLab.FormShow(Sender: TObject);
begin
  //inherited;
  {busca a posicao do combo}
 { try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLab.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;}
end;

end.

