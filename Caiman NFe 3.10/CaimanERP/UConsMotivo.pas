unit UConsMotivo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsMotivo = class(TFrmConsNovo)
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
  FrmConsMotivo: TFrmConsMotivo;

implementation
Uses Udm, Ubibli1, UCadMotivo, UAcertoEstoque, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsMotivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QMotivo.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsMotivo.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsMotivo.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QMotivo do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM MOTIVO_ACERTO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_MOT LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_MOT');
         1: sql.add(' WHERE NOME_MOT LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_MOT');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_MOT')
              else
                 sql.add(' WHERE COD_MOT = ' + edtcons.Text);
           end
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsMotivo.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  if (tag = 0) or (tag = 1) then
     begin 
        BuscaFormulario( TFrmCadMotivo, True );
        with FrmCadMotivo do
           begin 
              tag:= 1;
              limpaedit(FrmCadMotivo);
              ededit(FrmCadMotivo, false);
              cod_mot.Text  := dm.QMotivoCOD_MOT.AsString;
              edtnome.Text  := dm.QMotivoNOME_MOT.Value;
              if trim(dm.QMotivoENTSAI_MOT.Value) = 'E' then
                 ComboMotivo.ItemIndex:= 0
              else
                 ComboMotivo.ItemIndex:= 1;
              FormShow(sender);
              show;
           end;
        close;
     end
  else
     if tag = 2 then
        begin 
           with FrmAcertoEstoque do
              begin 
                 EdtCodMot.Text   := dm.QMotivoCOD_MOT.AsString;
                 edtnomemot.Text  := dm.QMotivoNOME_MOT.Value;
              end;
           close;
        end;
end;

procedure TFrmConsMotivo.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsMotivo.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
