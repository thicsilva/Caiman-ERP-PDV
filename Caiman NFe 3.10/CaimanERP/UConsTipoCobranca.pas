unit UConsTipoCobranca;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsTipoCobranca = class(TFrmConsNovo)
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
  FrmConsTipoCobranca: TFrmConsTipoCobranca;

implementation
Uses Udm, Ubibli1, UCadTipoCobranca, UContasReceber, URelCTR, UConfiguracoes,
     UTrocaCobranca, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsTipoCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoCobranca.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoCobranca.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsTipoCobranca.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTipoCobranca do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM TIPO_COBRANCA');
        case ComboCons.ItemIndex of
         0: sql.add('WHERE NOME_COB LIKE ' + #39 + '%' +
                     edtcons.Text + '%' + #39 + ' ORDER BY NOME_COB');
         1: sql.add('WHERE NOME_COB LIKE ' + #39 +
                     edtcons.Text + '%' + #39 + ' ORDER BY NOME_COB');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_COB')
               else
                  sql.add(' WHERE COD_COB = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsTipoCobranca.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    0,1: begin 
            BuscaFormulario( TFrmCadTipoCobranca, True );
            with FrmCadTipoCobranca do
               begin 
                  tag:= 1;
                  limpaedit(FrmCadTipoCobranca);
                  ededit(FrmCadTipoCobranca, false);
                  cod_cob.Text  := dm.QTipoCobrancaCOD_COB.AsString;
                  EdtNome.Text  := dm.QTipoCobrancaNOME_COB.Value;
                  FormShow(sender);
                  show;
               end;
            close;
         end;
    2: begin 
          with FrmLancContasReceber do
             begin 
                EdtCodCob.Text := dm.QTipoCobrancaCOD_COB.AsString;
                EdtNomeCob.Text:= dm.QTipoCobrancaNOME_COB.Value;
                EdtNumDoc.SetFocus;
             end;
          close;
       end;
    3: begin 
          with FrmRelCTR do
             begin 
                EdtCodCob.Text := dm.QTipoCobrancaCOD_COB.AsString;
                EdtNomeCob.Text:= dm.QTipoCobrancaNOME_COB.Value;
                EdtDataIni.SetFocus;
             end;
          close;
       end;
    4: begin 
          with FrmConfiguracoes do
             begin 
                EdtCodCob.Text := dm.QTipoCobrancaCOD_COB.AsString;
                EdtNomeCob.Text:= dm.QTipoCobrancaNOME_COB.Value;
             end;
          close;
       end;
    5: begin 
          with FrmTrocaCobranca do
             begin 
                EdtCodCob.Text := dm.QTipoCobrancaCOD_COB.AsString;
                EdtNomeCob.Text:= dm.QTipoCobrancaNOME_COB.Value;
                BtnOK.SetFocus;
             end;
          close;
       end;
  end;
end;

procedure TFrmConsTipoCobranca.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoCobranca.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
