unit UConsSubGrupo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013White,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsSubGrupo = class(TFrmConsNovo)
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
  FrmConsSubGrupo: TFrmConsSubGrupo;

implementation
Uses Udm, UCadProduto, UAlterarSecaoGrupo, UAlteraPreco, URelEstoque;

{$R *.dfm}

procedure TFrmConsSubGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSubGrupo.Close;

  {grava a posicao do combo}
  dm.GravaIni('configlocal.ini', 'PosicaoCombobox', 'FrmConsSubGrupo.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsSubGrupo.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QSubGrupo do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM SECAO_GRUPO_SUBGRUPO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO' +
                    ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' AND COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO' +
                    ' ORDER BY DESCRICAO');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO ' +
                          ' ORDER BY COD_GRUPO')
              else
                 begin 
                    sql.add(' WHERE COD_SUBGRUPO = :CODSUBGRUPO AND COD_GRUPO = :CODGRUPO' +
                            ' AND COD_SEC = :CODSEC');
                    parambyname('codsubgrupo').AsInteger:= strtoint(EdtCons.Text);
                 end;
            end;
        end;
        case FrmConsSubGrupo.Tag of
{          1: begin
                Parambyname('codsec').AsInteger  := strtoint(FrmCadProduto.Cod_sec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmCadProduto.EdtCodGrupo.Text);
             end;       }
          2: begin 
                Parambyname('codsec').AsInteger  := strtoint(FrmAlterarSecao.EdtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmAlterarSecao.EdtCodGrupo.Text);
             end;
          3: begin 
                Parambyname('codsec').AsInteger  := strtoint(FrmAlteraPreco.EdtCod.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmAlteraPreco.EdtCodGrupo.Text);
             end;
          4: begin 
                Parambyname('codsec').AsInteger  := strtoint(FrmRelEstoque.EdtCodSec.Text);
                Parambyname('codgrupo').AsInteger:= strtoint(FrmRelEstoque.EdtCodGrupo.Text);
             end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSubGrupo.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('configlocal.ini', 'PosicaoCombobox', 'FrmConsSubGrupo.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsSubGrupo.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    {1: begin
          with FrmCadProduto do
            begin 
               EdtCodSubGrupo.Text := dm.QSubGrupoCOD_SUBGRUPO.AsString;
               EdtNomeSubGrupo.Text:= dm.QSubGrupoDESCRICAO.AsString;
               EdtCodUndEntrada.SetFocus;
            end;
          close;
       end;      }
    2: begin 
          with FrmAlterarSecao do
            begin 
               EdtCodSub.Text := dm.QSubGrupoCOD_SUBGRUPO.AsString;
               EdtNomeSub.Text:= dm.QSubGrupoDESCRICAO.AsString;
               BtnOK.SetFocus;
            end;
          close;
       end;
    3: begin 
          with FrmAlteraPreco do
            begin 
               EdtCodSub.Text := dm.QSubGrupoCOD_SUBGRUPO.AsString;
               EdtNomeSub.Text:= dm.QSubGrupoDESCRICAO.AsString;
               BtnOK.SetFocus;
            end;
          close;
       end;
    4: begin 
          with FrmRelEstoque do
            begin 
               EdtCodSub.Text := dm.QSubGrupoCOD_SUBGRUPO.AsString;
               EdtNomeSub.Text:= dm.QSubGrupoDESCRICAO.AsString;
            end;
          close;
       end;
  end;
end;

end.
