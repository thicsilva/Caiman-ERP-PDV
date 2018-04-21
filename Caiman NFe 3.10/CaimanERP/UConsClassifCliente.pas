unit UConsClassifCliente;

interface

uses
  SysUtils, Classes, Controls,  Forms,
  UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsClassifCliente = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsClassifCliente: TFrmConsClassifCliente;

implementation
Uses Udm, Ubibli1, UCadClassifCliente, UCadCli, UConsCli, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsClassifCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QCla.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifCliente.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsClassifCliente.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QCla do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM CLASSIF_CLIENTE');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_CLA LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CLA');
         1: sql.Add(' WHERE NOME_CLA LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CLA');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_CLA')
               else
                  sql.add(' WHERE COD_CLA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsClassifCliente.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
   0,3: begin
           BuscaFormulario( TFrmCadClassifCliente, True );
           with FrmCadClassifCliente do
              begin
                 tag:= 1;
                 limpaedit(FrmCadClassifCliente);
                 ededit(FrmCadClassifCliente, false);
                 cod_cla.Text  := dm.QClaCOD_CLA.AsString;
                 edtnome.Text  := dm.QClaNOME_CLA.Value;
                 FormShow(sender);
                 show;
              end;
           close;
        end;
   1: begin
         with FrmCadCli do
            begin
               cod_cla.Text   := dm.QClaCOD_CLA.AsString;
               edtnomecla.Text:= dm.QClaNOME_CLA.Value;
               EdtCodConvenio.SetFocus;
            end;
         close;
      end;
   2: begin
         with FrmConsCli do
            begin
               edtcod.Text   := dm.QClaCOD_CLA.AsString;
               edtnome.Text  := dm.QClaNOME_CLA.Value;
               btnok.SetFocus;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsClassifCliente.FormShow(Sender: TObject);
begin
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsClassifCliente.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.



