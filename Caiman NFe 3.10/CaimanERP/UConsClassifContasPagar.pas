unit UConsClassifContasPagar;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsClassifContasPagar = class(TFrmConsNovo)
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
  FrmConsClassifContasPagar: TFrmConsClassifContasPagar;

implementation
Uses Udm, Ubibli1, UCadClassifContasPagar, UContasPagar, URelPagas,
     ULancContasPagar, URelContasPagar;

{$R *.dfm}

procedure TFrmConsClassifContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QClaCTP.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifContasPagar.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsClassifContasPagar.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QClaCTP do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CLASSIFICACAO_CONTAS_PAGAR');
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

procedure TFrmConsClassifContasPagar.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifContasPagar.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsClassifContasPagar.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close; 
end;

procedure TFrmConsClassifContasPagar.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0: begin 
         with FrmCadClassifContasPagar do
             begin 
                tag:= 1;
                limpaedit(FrmCadClassifContasPagar);
                ededit(FrmCadClassifContasPagar, false);
                codigo.Text  := dm.QClaCTPCODIGO.AsString;
                EdtNome.Text := dm.QClaCTPDESCRICAO.AsString;
                FormShow(sender);
                show;
             end;
          close;
      end;
   1: begin 
         with frmContasPagar do
            begin 
               EdtCodClassif.Text := dm.QClaCTPCODIGO.AsString;
               EdtNomeClassif.Text:= dm.QClaCTPDESCRICAO.AsString;
               EdtCentroCusto.SetFocus;
            end;
         close;
      end;
   2: begin 
         with FrmRelPagas do
            begin 
               EdtCodCla.Text := dm.QClaCTPCODIGO.AsString;
               EdtNomeCla.Text:= dm.QClaCTPDESCRICAO.AsString;
            end;
         close;
      end;
   3: begin 
         with FrmLancContasPagar do
            begin 
               EdtCodClassif.Text := dm.QClaCTPCODIGO.AsString;
               EdtNomeClassif.Text:= dm.QClaCTPDESCRICAO.AsString;
               EdtCentroCusto.SetFocus;
            end;
         close;
      end;
   4: begin 
         with FrmRelContasAPagar do
            begin 
               EdtCodCla.Text := dm.QClaCTPCODIGO.AsString;
               EdtNomeCla.Text:= dm.QClaCTPDESCRICAO.AsString;
            end;
         close;
      end;
  end;
end;

end.
