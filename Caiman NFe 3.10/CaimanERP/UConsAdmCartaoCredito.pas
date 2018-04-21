unit UConsAdmCartaoCredito;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsAdmCartaoCredito = class(TFrmConsNovo)
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
  FrmConsAdmCartaoCredito: TFrmConsAdmCartaoCredito;

implementation
Uses Udm, Ubibli1, UCadAdmCartaoCredito, URecAdm,
     UConsCTRAdm, UConsCtrAdmCartaoCred, URelContasReceberCartao,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsAdmCartaoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QAdmCartao.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsAdmCartaoCredito.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsAdmCartaoCredito.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QAdmCartao do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM ADMINISTRADORA_CARTAO');
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

procedure TFrmConsAdmCartaoCredito.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0,1: begin
           BuscaFormulario( TFrmCadAdmCartaoCredito, True );
           with FrmCadAdmCartaoCredito do
              begin 
                 tag:= 1;
                 limpaedit(FrmCadAdmCartaoCredito);
                 codigo.Text         := dm.QAdmCartaoCODIGO.AsString;
                 edtnome.Text        := dm.QAdmCartaoDESCRICAO.AsString;
                 EdtCodTEF.Text      := dm.QAdmCartaoCODIGO_TEF.AsString;
                 BuscaBandeiras;
                 FormShow(sender);
                 show;
              end;
           close;
        end;
   4: begin 
         with FrmRECADM do
            begin 
               EdtCodAdm.Text  := dm.QAdmCartaoCODIGO.AsString;
               EdtNomeAdm.Text := dm.QAdmCartaoDESCRICAO.AsString;
               BtnOk.SetFocus;
            end;
         close;
      end;
   5: begin 
         with FrmConsCTRAdm do
            begin 
               EdtCod.Text  := dm.QAdmCartaoCODIGO.AsString;
               EdtNome.Text := dm.QAdmCartaoDESCRICAO.AsString;
            end;
         close;
      end;
   6: begin 
         with FrmConsAdmCartaoCred do
            begin 
               EdtCodAdm.Text  := dm.QAdmCartaoCODIGO.AsString;
               EdtNomeAdm.Text := dm.QAdmCartaoDESCRICAO.AsString;
            end;
         close;
      end;
   7: begin 
         with FrmRelContasReceberCartao do
            begin 
               EdtCodAdm.Text  := dm.QAdmCartaoCODIGO.AsString;
               EdtNomeAdm.Text := dm.QAdmCartaoDESCRICAO.AsString;
               EdtCodAdm.SetFocus;
            end;
         close;
      end;
   end;
end;

procedure TFrmConsAdmCartaoCredito.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsAdmCartaoCredito.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
