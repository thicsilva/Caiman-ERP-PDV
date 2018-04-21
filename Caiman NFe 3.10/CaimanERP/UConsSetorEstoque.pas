unit UConsSetorEstoque;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsSetorEstoque = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsSetorEstoque: TFrmConsSetorEstoque;

implementation
Uses Udm, Ubibli1, UCadSetorEstoque, UCadProduto, URelEstoque, UAlteraPreco, URecEstoque,
  DB, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsSetorEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSetorEstoque.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSetorEstoque.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsSetorEstoque.BtnOKClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QSetorEstoque do
     begin
        close;
        sql.Clear;
        sql.Add('SELECT S.*, U.NOME_USU ' +
                'FROM SETORES_ESTOQUE S ' +
                'INNER JOIN USUARIO U ' +
                'ON (S.COD_USU = U.COD_USU)');

        case ComboCons.ItemIndex of
         0: sql.add(' WHERE S.DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY S.DESCRICAO');
         1: sql.add(' WHERE S.DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY S.DESCRICAO');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY S.CODIGO')
               else
                  sql.add(' WHERE S.CODIGO = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSetorEstoque.FormShow(Sender: TObject);
begin
  inherited;
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSetorEstoque.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsSetorEstoque.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmConsSetorEstoque.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
     0: begin
           BuscaFormulario( TFrmCadSetorEstoque, True );
           with FrmCadSetorEstoque do
              begin
                 tag:= 1;
                 limpaedit(FrmCadSetorEstoque);
                 ededit(FrmCadSetorEstoque, false);
                 codigo.Text     := dm.QSetorEstoqueCODIGO.AsString;
                 EdtNome.Text    := dm.QSetorEstoqueDESCRICAO.AsString;
                 EdtCodUsu.Text  := dm.QSetorEstoqueCOD_USU.AsString;
                 EdtNomeUsu.Text := dm.QSetorEstoqueNOME_USU.AsString;
                 EdtDataInicioEstoque.Date:= dm.QSetorEstoqueDATA_INICIO_ESTOQUE.AsDateTime;

                 FormShow(sender);
                 show;
              end;
           close;
        end;
{     1: begin
           with FrmCadProduto do
              begin
                 EdtCodSetorEstoque.Text  := dm.QSetorEstoqueCODIGO.AsString;
                 EdtNomeSetorEstoque.Text := dm.QSetorEstoqueDESCRICAO.AsString;
                 EdtValor.SetFocus;
              end;
           close;
        end;            }
     2: begin
           with FrmRelEstoque do
              begin
                 EdtCod.Text  := dm.QSetorEstoqueCODIGO.AsString;
                 EdtNome.Text := dm.QSetorEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     3: begin
           with FrmAlteraPreco do
              begin
                 EdtCod.Text  := dm.QSetorEstoqueCODIGO.AsString;
                 EdtNome.Text := dm.QSetorEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     4: begin
           with FrmRecEstoque do
              begin
                 EdtCodSetor.Text  := dm.QSetorEstoqueCODIGO.AsString;
                 EdtNomeSetor.Text := dm.QSetorEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     5: begin
           with frmCadProduto do
              begin
                 QPrincipalCODIGO_SETOR_ESTOQUE.AsInteger := DM.QSetorEstoqueCODIGO.AsInteger;
              end;
           Close;
        end;
  end;
end;

end.


