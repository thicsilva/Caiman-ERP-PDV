unit UConsTipoDoc;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsTipoDoc = class(TFrmConsNovo)
    procedure BtnSairClick(Sender: TObject);
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
  FrmConsTipoDoc: TFrmConsTipoDoc;

implementation
Uses Udm, UCadTipoDoc, Ubibli1, ULancCC, UConfiguracoes;

{$R *.dfm}

procedure TFrmConsTipoDoc.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoDoc.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoDoc.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsTipoDoc.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTipoDoc do
     begin 
        close;
        sql.Clear;
        sql.add(' SELECT * FROM TIPO_DOCUMENTO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_DOC LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_DOC');
         1: sql.add(' WHERE NOME_DOC LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_DOC');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_DOC')
               else
                  sql.add(' WHERE COD_DOC = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsTipoDoc.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0:begin 
        with FrmCadTipoDoc do
           begin 
              tag:= 1;
              limpaedit(FrmCadTipoDoc);
              ededit(FrmCadTipoDoc, false);
              cod_doc.Text := dm.QTipoDocCOD_DOC.AsString;
              edtnome.Text := dm.QTipoDocNOME_DOC.AsString;
              FormShow(sender);
              show;
           end;
        close;
     end;
   1:begin 
        with FrmLancCC do
           begin 
              EdtCodDoc.Text  := dm.QTipoDocCOD_DOC.AsString;
              EdtNomeDoc.Text := dm.QTipoDocNOME_DOC.AsString;
              EdtDoc.SetFocus;
           end;
        close;
     end;
   2:begin 
        with FrmConfiguracoes do
           begin 
              cod_doc.Text        := dm.QTipoDocCOD_DOC.AsString;
              EdtNomeTipoDoc.Text := dm.QTipoDocNOME_DOC.AsString;
           end;
        close;
     end;
  end;
end;

procedure TFrmConsTipoDoc.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoDoc.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
