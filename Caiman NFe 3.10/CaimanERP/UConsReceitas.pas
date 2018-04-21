unit UConsReceitas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsReceitas = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsReceitas: TFrmConsReceitas;

implementation
Uses Udm, Ubibli1, UCadReceitas, UCadProduto, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsReceitas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QReceita.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsReceitas.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsReceitas.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QReceita do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM RECEITAS');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE INGREDIENTES LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY INGREDIENTES');
         1: sql.add(' WHERE INGREDIENTES LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY INGREDIENTES');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_RECEITA')
               else
                  sql.add(' WHERE COD_RECEITA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsReceitas.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0,1: begin 
          BuscaFormulario( TFrmCadReceitas, True );
          with FrmCadReceitas do
             begin 
                tag:= 1;
                limpaedit(FrmCadReceitas);
                ededit(FrmCadReceitas, false);
                cod_receita.Text     := dm.QReceitaCOD_RECEITA.AsString;
                MemoIngredientes.Text:= dm.QReceitaINGREDIENTES.AsString;
                FormShow(sender);
                show;
             end;
          close;
       end;
{   2:begin
        with FrmCadProduto do
           begin
              EdtCodReceita.Text:= dm.QReceitaCOD_RECEITA.AsString;
              EdtDiasValidade.SetFocus;
           end;
        close;
     end;      }
  end;
end;

procedure TFrmConsReceitas.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsReceitas.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsReceitas.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
