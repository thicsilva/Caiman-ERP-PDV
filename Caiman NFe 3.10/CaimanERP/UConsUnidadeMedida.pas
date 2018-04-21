unit UConsUnidadeMedida;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsUnidadeMedida = class(TFrmConsNovo)
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
  FrmConsUnidadeMedida: TFrmConsUnidadeMedida;

implementation
uses UDM, Ubibli1, UCadUnidadeMedida, UCadProduto;

{$R *.dfm}

procedure TFrmConsUnidadeMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QUnidMed.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsUnidadeMedida.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsUnidadeMedida.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QUnidMed do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM UNIDADE_MEDIDA');
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

procedure TFrmConsUnidadeMedida.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0: begin 
         with FrmCadUnidadeMedida do
            begin 
               tag:= 1;
               limpaedit(FrmCadUnidadeMedida);
               ededit(FrmCadUnidadeMedida, false);
               codigo.Text     := dm.QUnidMedCODIGO.AsString;
               edtnome.Text    := dm.QUnidMedDESCRICAO.AsString;
               FormShow(sender);
               show;
            end;
         close;
      end;
{   1: begin
         with FrmCadProduto do
           begin
              EdtCodUndEntrada.Text  := dm.QUnidMedCODIGO.AsString;
              EdtNomeUndEntrada.Text := dm.QUnidMedDESCRICAO.AsString;
              EdtCodUndSaida.SetFocus;
           end;
         close;
      end;
   2: begin
         with FrmCadProduto do
           begin
              EdtCodUndSaida.Text  := dm.QUnidMedCODIGO.AsString;
              EdtNomeUndSaida.Text := dm.QUnidMedDESCRICAO.AsString;
              EdtCodSetorEstoque.SetFocus;
           end;
         close;
      end;}
  end;
end;

procedure TFrmConsUnidadeMedida.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmConsUnidadeMedida.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsUnidadeMedida.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
