unit UConsCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsCartas = class(TFrmConsNovo)
    QConsCarta: TFDQuery;
    DSQConsCarta: TDataSource;
    QConsCartaCOD_CARTA: TIntegerField;
    QConsCartaNOME_CARTA: TStringField;
    QConsCartaCONTEUDO_CARTA: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCartas: TFrmConsCartas;

implementation
uses
  Udm, Ubibli1, UCadCarta, UMalaSel;

{$R *.dfm}

procedure TFrmConsCartas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QConsCarta.Close;
  Action:= caFree;
end;

procedure TFrmConsCartas.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsCarta do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CARTAS');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_CARTA LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CARTA');
         1: sql.add(' WHERE NOME_CARTA LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CARTA');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_CARTA')
               else
                  sql.add(' WHERE COD_CARTA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsCartas.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case FrmConsCartas.Tag of
   0: begin 
         with FrmCadCarta do
            begin 
               tag:= 1;
               limpaedit(FrmCadCarta);
               ededit(FrmCadCarta, false);
               cod_carta.Text   := QConsCartaCOD_CARTA.AsString;
               edtnome.Text     := QConsCartaNOME_CARTA.AsString;
               Editor.Lines.Text:= QConsCartaCONTEUDO_CARTA.AsString;
               FormShow(sender);
               show;
            end;
         close;
      end;
   1: begin 
         with FrmMalaSel do
            begin 
               EdtCodCarta.Text := QConsCartaCOD_CARTA.AsString;
               EdtNomeCarta.Text:= QConsCartaNOME_CARTA.AsString;
            end;
         close;
      end;
  end;
end;

end.
