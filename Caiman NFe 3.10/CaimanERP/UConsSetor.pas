unit UConsSetor;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsSetor = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsSetor: TFrmConsSetor;

implementation
Uses Udm, Ubibli1, UCadSetor, UCadProduto, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsSetor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSetor.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSetor.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsSetor.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QSetor do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM SETOR_BALANCA');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_SET LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SET');
         1: sql.Add(' WHERE NOME_SET LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_SET');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_SET')
               else
                  sql.add(' WHERE COD_SET = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsSetor.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  if (tag = 0) or (tag = 1) then
     begin 
        BuscaFormulario( TFrmCadSetor, True );
        with FrmCadSetor do
           begin 
              tag:= 1;
              cod_set.Text    := dm.QSetorCOD_SET.AsString;
              edtnome.Text    := dm.QSetorNOME_SET.Value;
              FormShow(sender);
              show;
           end;
        close;
     end;
{  else
     if tag = 2 then
        begin
           with FrmCadProduto do
              begin
                 Cod_Set.Text      := dm.QSetorCOD_SET.AsString;
                 EdtNomeSetor.Text := dm.QSetorNOME_SET.Value;
                 edttecla.SetFocus;
              end;
           close;
        end;}
end;

procedure TFrmConsSetor.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsSetor.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsSetor.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
