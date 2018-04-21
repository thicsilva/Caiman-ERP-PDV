unit UConsTipoES;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsTipoES = class(TFrmConsNovo)
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
  FrmConsTipoES: TFrmConsTipoES;

implementation
Uses Udm, Ubibli1, UCadTipoES, UOutrasSaidas, UOutrasEntradas, UConsOutrasSaidas,
     UConsOutrasEntradas, URelOutrasSaidas, URelOutrasEntradas, UEntradas,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsTipoES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoES.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoES.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsTipoES.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTipoES do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM TIPO_ES');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_ES LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_ES');
         1: sql.add(' WHERE NOME_ES LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_ES');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_ES')
               else
                  sql.add(' WHERE COD_ES = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsTipoES.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    0,1: begin
            BuscaFormulario( TFrmCadTipoES, True );
            with FrmCadTipoES do
               begin 
                  tag:= 1;
                  limpaedit(FrmCadTipoES);
                  ededit(FrmCadTipoES, false);
                  cod_es.Text      := dm.QTipoESCOD_ES.AsString;
                  edtnome.Text     := dm.QTipoESNOME_ES.AsString;

                  if trim(dm.QTipoESTIPO_ES.AsString) = 'E' then
                     RdgTipo.ItemIndex := 0
                  else
                     RdgTipo.ItemIndex := 1;

                  if trim(dm.QTipoESTIPO_PRECO.AsString) = 'V' then
                     RdgPreco.ItemIndex := 0
                  else
                     RdgPreco.ItemIndex := 1;

                  EdtCFOPEstadoTrib.Text  := dm.QTipoESCFOP_ESTADO_TRIBUTADO.AsString;
                  EdtCFOPEstadoSub.Text   := dm.QTipoESCFOP_ESTADO_SUBSTITUICAO.AsString;
                  EdtCFOPForaTrib.Text    := dm.QTipoESCFOP_FORA_TRIBUTADO.AsString;
                  EdtCFOPForaSub.Text     := dm.QTipoESCFOP_FORA_SUBSTITUICAO.AsString;
                  EdtCodGRP.Text          := dm.QTipoESCOD_GRP_ESPECIFICO.AsString;
                  EdtCodLocal.Text        := dm.QTipoESCODIGO_LOCAL_ESTOQUE.AsString;

                  if trim(dm.QTipoESCONTROLA_ESTOQUE.AsString) = 'S' then
                     CheckEstoque.Checked := true
                  else
                     CheckEstoque.Checked:= false;

                  if trim(dm.QTipoESATUALIZA_CUSTO_ENTRADAS.AsString) = 'S' then
                     CheckCusto.Checked := true
                  else
                     CheckCusto.Checked:= false;

                  FormShow(sender);
                  show;
               end;
            close;
         end;
    2:   begin 
            with FrmOutrasSaidas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'S' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                        edtcodcli.SetFocus;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Entradas');
                        exit;
                     end;
               end;
            close;
         end;
    3:   begin 
            with FrmOutrasEntradas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'E' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                        edtcodfor.SetFocus;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Saídas');
                        exit;
                    end;
               end;
            close;
         end;
    4:   begin 
            with FrmConsOutrasSaidas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'S' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Entradas');
                        exit;
                     end;
               end;
            close;
         end;
    5:   begin 
            with FrmConsOutrasEntradas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'E' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Saídas');
                        exit;
                    end;
               end;
            close;
         end;
    6:   begin 
             with FrmRelOutrasSaidas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'S' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Entradas');
                        exit;
                     end;
               end;
            close;
         end;
    7:   begin 
            with FrmRelOutrasEntradas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'E' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Saídas');
                        exit;
                    end;
               end;
            close;
         end;
    8:   begin 
            with FrmEntradas do
               begin 
                  if trim(dm.QTipoESTIPO_ES.AsString) = 'E' then
                     begin 
                        EdtCodTipo.Text   := dm.QTipoESCOD_ES.AsString;
                        EdtNomeTipo.Text  := dm.QTipoESNOME_ES.AsString;
                     end
                  else
                     begin 
                        AlertaCad('Este tipo pertence a Saídas');
                        exit;
                    end;
               end;
            close;
         end;
  end;

end;

procedure TFrmConsTipoES.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsTipoES.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoES.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
