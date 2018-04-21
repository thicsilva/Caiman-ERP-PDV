unit UConsModelo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsModelo = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsModelo: TFrmConsModelo;

implementation
Uses Udm, UEntradas, URegEntradas, URegSaidas, UNotaFiscal;

{$R *.dfm}

procedure TFrmConsModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QModelo.Close;

  {grava a posicao do combo}
  dm.GravaIni('configlocal.ini', 'PosicaoCombobox', 'FrmConsModelo.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsModelo.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QModelo do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CODIFICACAO_DOCUMENTOS');
        case ComboCons.ItemIndex of
          0: sql.Add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
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

procedure TFrmConsModelo.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   2:begin 
        with FrmEntradas do
           begin 
              EdtCodModelo.Text := dm.QModeloCODIGO.AsString;
              EdtNomeModelo.Text:= dm.QModeloDESCRICAO.AsString;
              EdtSerie.SetFocus;
           end;
        close;
     end;
   3:begin 
        with FrmRegEntradas do
           begin 
              EdtCodModelo.Text := dm.QModeloCODIGO.AsString;
              EdtNomeModelo.Text:= dm.QModeloDESCRICAO.AsString;
              EdtSerie.SetFocus;
           end;
        close;
     end;
   4:begin 
        with FrmRegSaidas do
           begin 
              EdtCodModelo.Text := dm.QModeloCODIGO.AsString;
              EdtNomeModelo.Text:= dm.QModeloDESCRICAO.AsString;
              EdtSerie.SetFocus;
           end;
        close;
     end;
   5:begin 
        with FrmNotaFiscal do
           begin 
              EdtModelo.Text := dm.QModeloCODIGO.AsString;
              EdtSerie.SetFocus;
           end;
        close;
     end;
  end;
end;

procedure TFrmConsModelo.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('configlocal.ini', 'PosicaoCombobox', 'FrmConsModelo.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
 
