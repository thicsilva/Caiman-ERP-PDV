unit UConsTipoProduto;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsTipoProduto = class(TFrmConsNovo)
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
  FrmConsTipoProduto: TFrmConsTipoProduto;

implementation
Uses Udm, Ubibli1, UCadTipoProduto;

{$R *.dfm}

procedure TFrmConsTipoProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QLab.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoProduto.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsTipoProduto.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTPProd do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM TIPO_PRODUTO');
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

procedure TFrmConsTipoProduto.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    0: begin 
          with FrmCadTipoProduto do
             begin 
                tag:= 1;
                limpaedit(FrmCadTipoProduto);
                ededit(FrmCadTipoProduto, false);
                codigo.Text  := dm.QTPProdCODIGO.AsString;
                EdtNome.Text := dm.QTPProdDESCRICAO.AsString;
                edtCodEFD.Text := dm.QTPProdEFD_TIPO.AsString;
                if trim(dm.QTPProdSERVICO.AsString) = 'S' then
                   CheckServico.Checked:= true
                else
                   CheckServico.Checked:= false;
                FormShow(sender);
                show;
             end;
          close;
       end;
  end;
end;

procedure TFrmConsTipoProduto.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoProduto.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
