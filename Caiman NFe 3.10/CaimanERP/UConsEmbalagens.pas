unit UConsEmbalagens;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsEmbalagens = class(TFrmConsNovo)
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
  FrmConsEmbalagens: TFrmConsEmbalagens;

implementation
uses Udm, Ubibli1, UCadEmbalagem, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsEmbalagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QEmb.Close;
  dm.QEmb.SQL.Clear;
  dm.QEmb.SQL.Text:= sSql;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEmbalagens.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsEmbalagens.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QEmb do
     begin 
        close;
        sql.Clear;
        sql.Text:= sSql;
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

procedure TFrmConsEmbalagens.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0,1: begin 
           BuscaFormulario( TFrmCadEmbalagem, True );
           with FrmCadEmbalagem do
              begin 
                 tag:= 1;
                 limpaedit(FrmCadEmbalagem);
                 ededit(FrmCadEmbalagem, false);
                 codigo.Text     := dm.QEmbCODIGO.AsString;
                 edtnome.Text    := dm.QEmbDESCRICAO.AsString;
                 EdtCodPro.Text  := dm.QEmbCOD_PRO.AsString;
                 EdtNomePro.Text := dm.QEmbNOME_PRO.AsString;
                 EdtQuant.Text   := dm.QEmbQUANT.AsString;
                 EdtUnidade.Text := dm.QEmbUNIDADE.AsString;
                 EdtCodBarra.Text:= dm.QEmbCODIGO_BARRA.AsString;
                 edtValor.Value  := dm.QEmbVALOR.AsCurrency;
                 FormShow(sender);
                 show;
              end;
           close;
        end;
  end;
end;

procedure TFrmConsEmbalagens.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close; 
end;

procedure TFrmConsEmbalagens.FormShow(Sender: TObject);
begin 
  inherited;
  sSql:= dm.qEmb.SQL.Text;

  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEmbalagens.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
