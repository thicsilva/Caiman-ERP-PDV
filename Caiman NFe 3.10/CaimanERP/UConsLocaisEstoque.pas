unit UConsLocaisEstoque;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, Data.DB;

type
  TFrmConsLocaisEstoque = class(TFrmConsNovo)
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
  FrmConsLocaisEstoque: TFrmConsLocaisEstoque;

implementation
Uses Udm, Ubibli1, UCadLocaisEstoque, UCadTipoES, UAcertoEstoque, UConfiguracoes,
     URegistroProducao, URelEstoque, URecEstoque, UTransfLocaisEstoque,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsLocaisEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QLocaisEstoque.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLocaisEstoque.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsLocaisEstoque.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QLocaisEstoque do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * ' +
                'FROM LOCAIS_ESTOQUE ');
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

procedure TFrmConsLocaisEstoque.FormShow(Sender: TObject);
begin 
  inherited;
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLocaisEstoque.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsLocaisEstoque.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsLocaisEstoque.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
     0: begin
          BuscaFormulario( TFrmCadLocaisEstoque, True );
           with FrmCadLocaisEstoque do
              begin 
                 tag:= 1;
                 limpaedit(FrmCadLocaisEstoque);
                 ededit(FrmCadLocaisEstoque, false);
                 codigo.Text     := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNome.Text    := dm.QLocaisEstoqueDESCRICAO.AsString;

                 FormShow(sender);
                 show;
              end;
           close;
        end;
     1: begin 
           with FrmCadTipoES do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     2: begin 
           with FrmAcertoEstoque do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     3: begin 
           with FrmConfiguracoes do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     4: begin 
           with FrmRelEstoque do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     5: begin 
           with FrmRegistroProducao do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     6: begin 
           with FrmRecEstoque do
              begin 
                 EdtCodLocal.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocal.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
                 EdtCodSetor.SetFocus;
              end;
           close;
        end;
     7: begin 
           with FrmTransfLocaisEstoque do
              begin 
                 EdtCodOrigem.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeOrigem.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
                 EdtCodDestino.SetFocus;
              end;
           close;
        end;
     8: begin 
           with FrmTransfLocaisEstoque do
              begin 
                 EdtCodDestino.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeDestino.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     9: begin 
           with FrmConfiguracoes do
              begin 
                 EdtCodLocalOrigem.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocalOrigem.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
     10: begin 
           with FrmConfiguracoes do
              begin 
                 EdtCodLocalDestino.Text  := dm.QLocaisEstoqueCODIGO.AsString;
                 EdtNomeLocalDestino.Text := dm.QLocaisEstoqueDESCRICAO.AsString;
              end;
           close;
        end;
  end;
end;

end.
