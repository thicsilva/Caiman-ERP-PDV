unit UConsClassifContasReceber;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsClassifContasReceber = class(TFrmConsNovo)
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
  FrmConsClassifContasReceber: TFrmConsClassifContasReceber;

implementation
Uses Udm, Ubibli1, UCadClassifContasReceber, UContasReceber, URelCTR, UCadTipoVenda,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsClassifContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QClaCTR.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifContasReceber.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree; 
end;

procedure TFrmConsClassifContasReceber.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QClaCTR do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CLASSIFICACAO_CONTAS_RECEBER');
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

procedure TFrmConsClassifContasReceber.FormShow(Sender: TObject);
begin 
  inherited;
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifContasReceber.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsClassifContasReceber.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsClassifContasReceber.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
     0: begin
         BuscaFormulario( TFrmCadClassifContasReceber, True );
         with FrmCadClassifContasReceber do
             begin 
                tag:= 1;
                limpaedit(FrmCadClassifContasReceber);
                ededit(FrmCadClassifContasReceber, false);
                codigo.Text  := dm.QClaCTRCODIGO.AsString;
                EdtNome.Text := dm.QClaCTRDESCRICAO.AsString;
                FormShow(sender);
                show;
             end;
          close;
      end;
     1: begin 
         with FrmLancContasReceber do
             begin 
                EdtCodClassif.Text  := dm.QClaCTRCODIGO.AsString;
                EdtNomeClassif.Text := dm.QClaCTRDESCRICAO.AsString;
             end;
          close;
      end;
     2: begin 
         with FrmRelCTR do
             begin 
                EdtCodCla.Text  := dm.QClaCTRCODIGO.AsString;
                EdtNomeCla.Text := dm.QClaCTRDESCRICAO.AsString;
             end;
          close;
      end;
     3: begin 
         with FrmCadTipoVenda do
             begin 
                EdtCodClassif.Text  := dm.QClaCTRCODIGO.AsString;
                EdtNomeClassif.Text := dm.QClaCTRDESCRICAO.AsString;
                ComboPreco.SetFocus;
             end;
          close;
      end;
  end;
end;

end.
