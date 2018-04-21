unit UConsBandeiraCartao;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsBandeiraCartao = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsBandeiraCartao: TFrmConsBandeiraCartao;

implementation
Uses Udm, Ubibli1, ULancCTRAdm;
var sSql : string;

{$R *.dfm}

procedure TFrmConsBandeiraCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;

  dm.QBandeira.SQL.Clear;
  dm.QBandeira.SQL.Text:= sSql;
  dm.QBandeira.Close;

  Action:= caFree;
end;

procedure TFrmConsBandeiraCartao.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QBandeira do
     begin 
        close;
        sql.Clear;
        sql.Text:= sSql;

        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE B.DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY B.DESCRICAO');
         1: sql.Add(' WHERE B.DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY B.DESCRICAO');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY B.CODIGO')
               else
                  sql.add(' WHERE B.CODIGO = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsBandeiraCartao.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsBandeiraCartao.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case Tag of
    0: begin 
          with FrmLancCTRADM do
             begin 
                EdtCodBandeira.Text  := dm.QBandeiraCODIGO.AsString;
                EdtNomeBandeira.Text := dm.QBandeiraDESCRICAO.AsString;
                if trim(DM.QBandeiraTIPO_CARTAO.AsString) = 'C' then
                   begin 
                      EdtVenc.Text := datetostr(strtodate(EdtEmissao.Text) + dm.QBandeiraDIAS_CREDITO.AsInteger);
                      EdtTaxa.Text := dm.QBandeiraTAXA_CREDITO.AsString;
                   end
                else
                   begin 
                      EdtVenc.Text := datetostr(strtodate(EdtEmissao.Text) + dm.QBandeiraDIAS_DEBITO.AsInteger);
                      EdtTaxa.Text := dm.QBandeiraTAXA_DEBITO.AsString;
                   end;
             end;
          close;
       end;
  end;
end;

procedure TFrmConsBandeiraCartao.FormShow(Sender: TObject);
begin 
  inherited;
  sSql:= dm.QBandeira.SQL.Text;
end;

procedure TFrmConsBandeiraCartao.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
  inherited;
  if trim(DM.QBandeiraATIVO.AsString) = 'N' then
      begin 
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end
end;

end.
