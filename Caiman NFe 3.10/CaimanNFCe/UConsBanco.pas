unit UConsBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UVendasCaixa;

type
  TFrmConsBanco = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsBanco: TFrmConsBanco;

implementation
Uses Udm, ULancCheques, UMenuFiscal;

{$R *.dfm}

procedure TFrmConsBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QBanco.Close;
  Action:= caFree;
  Self := nil;
end;

procedure TFrmConsBanco.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsBanco.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QBanco do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM BANCO');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_BAN LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_BAN');
         1: sql.Add(' WHERE NOME_BAN LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_BAN');
         2: begin
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_BAN')
              else
                 sql.add(' WHERE COD_BAN = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsBanco.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  if tag = 4 then
     begin
        with FrmLancCheques do
           begin
              EdtCodBanco.Text  := dm.QBancoCOD_BAN.AsString;
              EdtNomeBanco.Text := dm.QBancoNOME_BAN.AsString;
              EdtAgencia.SetFocus;
           end;
        close;
     end;
end;

procedure TFrmConsBanco.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
