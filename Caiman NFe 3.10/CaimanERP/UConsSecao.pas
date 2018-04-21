unit UConsSecao;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsSecao = class(TFrmConsNovo)
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
  FrmConsSecao: TFrmConsSecao;

implementation
Uses Udm, Ubibli1, UCadSecao, UCadProduto, UConsProd,
     URelProduto, URelCusto, URelBal, URelProdutosVendidos,
     URelMargemLucro, URelEstoque, URelGiro, UAlterarSecaoGrupo,
     URelAbaixoMinimo, UAlteraPreco, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSec.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSecao.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsSecao.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QSec do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_SEC LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SEC');
         1: sql.add(' WHERE NOME_SEC LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SEC');
         2: begin
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_SEC')
              else
                 sql.add(' WHERE COD_SEC = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSecao.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
    0,3: begin
            BuscaFormulario( TFrmCadSecao, True );
            with FrmCadSecao do
               begin
                  tag:= 1;
                  limpaedit(FrmCadSecao);
                  ededit(FrmCadSecao, false);
                  cod_sec.Text:= dm.QSecCOD_SEC.AsString;
                  edtnome.Text:= dm.QSecNOME_SEC.AsString;
                  if dm.QSecBEBIDAS_FUMO_SEC.AsString = 'S' then
                     CheckBebidas.Checked:= true
                  else
                     CheckBebidas.Checked:= false;
                  if not dm.QSecCAMINHO_FOTO_SEC.IsNull then
                     begin
                        try
                          OpenPicture.FileName:= dm.QSecCAMINHO_FOTO_SEC.AsString;
                          image.Visible:= true;
                          image.Picture.LoadFromFile(dm.QSecCAMINHO_FOTO_SEC.AsString);
                        except
                          OpenPicture.FileName:= '';
                          image.Visible:= false;
                        end;
                     end
                  else
                     begin
                        OpenPicture.FileName:= '';
                        image.Visible:= false;
                     end;
                  FormShow(sender);
                  show;
               end;
            close;
         end;
{    1: begin
          with FrmCadProduto do
            begin
               cod_sec.Text    := dm.QSecCOD_SEC.AsString;
               EdtNomeSec.Text := dm.QSecNOME_SEC.AsString;
               EdtCodGrupo.SetFocus;
            end;
          close;
       end;}
    2: begin
          with FrmConsProd do
             begin
                edtcod.Text    := dm.QSecCOD_SEC.AsString;
                edtnome.Text   := dm.QSecNOME_SEC.AsString;
                btnok.SetFocus;
             end;
          close;
       end;
    4: begin
          with FrmRelProduto do
             begin
                EdtCodIni.Text  := dm.QSecCOD_SEC.AsString;
                EdtNomeIni.Text := dm.QSecNOME_SEC.AsString;
                edtcodini.SetFocus;
             end;
          close;
       end;
    5: begin
          with FrmRelProduto do
             begin
                edtcodfin.Text  := dm.QSecCOD_SEC.AsString;
                edtnomefin.Text := dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    6: begin
          with FrmRelCusto do
             begin
                edtcodini.Text  := dm.QSecCOD_SEC.AsString;
                edtnomeini.Text := dm.QSecNOME_SEC.AsString;
                edtcodfin.SetFocus;
             end;
          close;
       end;
    7: begin
          with FrmRelCusto do
             begin
                edtcodfin.Text := dm.QSecCOD_SEC.AsString;
                edtnomefin.Text:= dm.QSecNOME_SEC.AsString;
                rdg.SetFocus;
             end;
          close;
       end;
    8: begin
          with FrmRelBal do
             begin
                edtcod.Text := dm.QSecCOD_SEC.AsString;
                EdtNome.Text:= dm.QSecNOME_SEC.AsString;
                BtnVis.SetFocus;
             end;
          close;
       end;
    9: begin
          with FrmRelProdutosVendidos do
             begin
                edtcod.Text := dm.QSecCOD_SEC.AsString;
                EdtNome.Text:= dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    12: begin
          with FrmRelMargemLucro do
             begin
                EdtCodIni.Text := dm.QSecCOD_SEC.AsString;
                EdtNomeIni.Text:= dm.QSecNOME_SEC.AsString;
                EdtCodFin.SetFocus;
             end;
          close;
       end;
    13: begin
          with FrmRelMargemLucro do
             begin
                EdtCodFin.Text := dm.QSecCOD_SEC.AsString;
                EdtNomeFin.Text:= dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    14: begin
          with FrmRelEstoque do
             begin
                EdtCodSec.Text := dm.QSecCOD_SEC.AsString;
                EdtNomeSec.Text:= dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    16: begin
          with FrmRelGiro do
             begin
                EdtCodIni.Text := dm.QSecCOD_SEC.AsString;
                EdtNomeIni.Text:= dm.QSecNOME_SEC.AsString;
                EdtCodFin.SetFocus;
             end;
          close;
       end;
    17: begin
          with FrmRelGiro do
             begin
                EdtCodFin.Text := dm.QSecCOD_SEC.AsString;
                EdtNomeFin.Text:= dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    19: begin
          with FrmAlterarSecao do
             begin
                EdtCodSec.Text  := dm.QSecCOD_SEC.AsString;
                EdtNomeSec.Text := dm.QSecNOME_SEC.AsString;
                BtnOK.SetFocus;
             end;
          close;
       end;
    20: begin
          with FrmRelAbaixoMinimo do
             begin
                EdtCodSec.Text   := dm.QSecCOD_SEC.AsString;
                EdtNomeSec.Text  := dm.QSecNOME_SEC.AsString;
             end;
          close;
       end;
    21: begin
          with FrmAlteraPreco do
             begin
                EdtCod.Text   := dm.QSecCOD_SEC.AsString;
                EdtNome.Text  := dm.QSecNOME_SEC.AsString;
                EdtCodGrupo.SetFocus;
             end;
          close;
       end;
    22: begin
           with frmCadProduto do
              begin
                 QPrincipalCOD_SEC.AsInteger := DM.QSecCOD_SEC.AsInteger;
              end;
           Close;
        end;
  end;
end;

procedure TFrmConsSecao.FormShow(Sender: TObject);
begin
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSecao.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.

