unit UConsModelos;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsModelos = class(TFrmConsNovo)
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
  FrmConsModelos: TFrmConsModelos;

implementation
Uses Udm, Ubibli1, UCadModelo;

{$R *.dfm}

procedure TFrmConsModelos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QModelos.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsModelos.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsModelos.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QModelos do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM MODELOS');
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

procedure TFrmConsModelos.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0: begin 
         with FrmCadModelo do
            begin 
               tag:= 1;
               limpaedit(FrmCadModelo);
               ededit(FrmCadModelo, false);
               codigo.Text  := dm.QModelosCODIGO.AsString;
               edtnome.Text := dm.QModelosDESCRICAO.AsString;
               FormShow(sender);
               show;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsModelos.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsModelos.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsModelos.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
