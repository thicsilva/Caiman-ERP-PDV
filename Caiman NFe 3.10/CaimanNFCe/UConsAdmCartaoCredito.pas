unit UConsAdmCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UVendasCaixa;

type
  TFrmConsAdmCartaoCredito = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAdmCartaoCredito: TFrmConsAdmCartaoCredito;

implementation
Uses Udm, UDadosAdm, UMenuFiscal;
var sSql : string;

{$R *.dfm}

procedure TFrmConsAdmCartaoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;

  dm.QBandeira.SQL.Clear;
  dm.QBandeira.SQL.Text:= sSql;
  dm.QBandeira.Close;

  Action:= caFree;
  Self := nil;
end;

procedure TFrmConsAdmCartaoCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmConsAdmCartaoCredito.BtnOkClick(Sender: TObject);
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

procedure TFrmConsAdmCartaoCredito.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmConsAdmCartaoCredito.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  with FrmDadosAdm do
     begin
        if trim(dm.QBandeiraATIVO.AsString) = 'N' then
           begin
              showmessage('Bandeira desativada');
              exit;
           end
        else
           begin
              EdtCodBandeira.Text  := dm.QBandeiraCODIGO.AsString;
              EdtNomeBandeira.Text := dm.QBandeiraDESCRICAO.AsString;
              EdtTipo.Text         := dm.QBandeiraCALC_TIPO.AsString;
              if trim(dm.QBandeiraTIPO_CARTAO.AsString) = 'C' then
                 begin
                    cTaxa := dm.QBandeiraTAXA_CREDITO.AsCurrency;
                    iDias := dm.QBandeiraDIAS_CREDITO.AsInteger;
                 end
              else
                 begin
                    cTaxa := dm.QBandeiraTAXA_DEBITO.AsCurrency;
                    iDias := dm.QBandeiraDIAS_DEBITO.AsInteger;
                 end;
           end;
        EdtValor.SetFocus;
     end;
  close;
end;

procedure TFrmConsAdmCartaoCredito.FormShow(Sender: TObject);
begin
  inherited;
  sSql:= dm.QBandeira.SQL.Text;
end;

procedure TFrmConsAdmCartaoCredito.DBGridDrawColumnCell(Sender: TObject;
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
