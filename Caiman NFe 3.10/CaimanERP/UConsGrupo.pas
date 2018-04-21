unit UConsGrupo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsGrupo = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsGrupo: TFrmConsGrupo;

implementation
Uses Udm, UCadProduto, UAlterarSecaoGrupo, UAlteraPreco, URelEstoque,
  UCFOP_Tributacoes;

{$R *.dfm}

procedure TFrmConsGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QGrupo.Close;

  {grava a posicao do combo}
  dm.GravaIni('configlocal.ini', 'PosicaoCombobox', 'FrmConsGrupo.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsGrupo.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QGrupo do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO_GRUPO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC' +
                    ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC' +
                    ' ORDER BY DESCRICAO');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' WHERE COD_SEC = :CODSEC ORDER BY COD_GRUPO')
              else
                 begin 
                    sql.add(' WHERE COD_GRUPO = :CODGRUPO AND COD_SEC = :CODSEC');
                    parambyname('codgrupo').AsInteger:= strtoint(EdtCons.Text);
                 end;
            end;
        end;
        case FrmConsGrupo.Tag of
//          1: Parambyname('codsec').AsInteger:= strtoint(FrmCadProduto.Cod_sec.Text);
          2: Parambyname('codsec').AsInteger:= strtoint(FrmAlterarSecao.EdtCodSec.Text);
          3: Parambyname('codsec').AsInteger:= strtoint(FrmAlteraPreco.EdtCod.Text);
          4: Parambyname('codsec').AsInteger:= strtoint(FrmRelEstoque.EdtCodSec.Text);
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsGrupo.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('configlocal.ini', 'PosicaoCombobox', 'FrmConsGrupo.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsGrupo.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
{    1: begin
          with FrmCadProduto do
            begin
               EdtCodGrupo.Text := dm.QGrupoCOD_GRUPO.AsString;
               EdtNomeGrupo.Text:= dm.QGrupoDESCRICAO.AsString;
               EdtCodSubGrupo.SetFocus;
            end;
          close;
       end;    }
    2: begin 
          with FrmAlterarSecao do
            begin 
               EdtCodGrupo.Text := dm.QGrupoCOD_GRUPO.AsString;
               EdtNomeGrupo.Text:= dm.QGrupoDESCRICAO.AsString;
               EdtCodSub.SetFocus;
            end;
          close;
       end;
    3: begin 
          with FrmAlteraPreco do
            begin 
               EdtCodGrupo.Text := dm.QGrupoCOD_GRUPO.AsString;
               EdtNomeGrupo.Text:= dm.QGrupoDESCRICAO.AsString;
               EdtCodSub.SetFocus;
            end;
          close;
       end;
    4: begin 
          with FrmRelEstoque do
            begin 
               EdtCodGrupo.Text := dm.QGrupoCOD_GRUPO.AsString;
               EdtNomeGrupo.Text:= dm.QGrupoDESCRICAO.AsString;
               EdtCodSub.SetFocus;
            end;
          close;
       end;
    5: begin 
          frmCFOP_Tributacoes.edtCodICMS.Text := dm.QGrupoCOD_GRUPO.AsString;
          frmCFOP_Tributacoes.edtDescICMS.Text := dm.QGrupoDESCRICAO.AsString;
          close;
       end;
    6: begin 
//          frmCFOP_Tributacoes.edtCodIcms_fora.Text := dm.QGrupoCOD_GRUPO.AsString;
  //        frmCFOP_Tributacoes.edtDescIcms_Fora.Text := dm.QGrupoDESCRICAO.AsString;
    //      close;

       end;
   end;
end;

end.
