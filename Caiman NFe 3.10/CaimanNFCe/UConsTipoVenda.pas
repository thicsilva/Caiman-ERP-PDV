unit UConsTipoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons,
  UVendasCaixa;

type
  TFrmConsTipoVenda = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsTipoVenda: TFrmConsTipoVenda;

implementation
Uses Udm, UDadosCliente, UPreVenda,
     UDavOrcamento, UVendasPED, UDavOrdemServico, UMenuFiscal;

{$R *.dfm}

procedure TFrmConsTipoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoVenda.Close;

  {grava a posicao do combo}
  dm.GravaIni(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoVenda.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
  Self := nil;
end;

procedure TFrmConsTipoVenda.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsTipoVenda.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTipoVenda do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * FROM TIPO_VENDA');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_TPV LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_TPV');
         1: sql.Add(' WHERE NOME_TPV LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_TPV');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_TPV')
               else
                  sql.add(' WHERE COD_TPV = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;


procedure TFrmConsTipoVenda.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
   0: begin
         with FrmDadosCliente do
            begin
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.AsString;
               EdtCodCli.SetFocus;
            end;
         close;
      end;
   1: begin
         with FrmPreVenda do
            begin
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.AsString;
            end;
         close;
      end;
   2: begin
         with FrmDavOrcamento do
            begin
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.AsString;
            end;
         close;
      end;
   3: begin
         with FrmVendasPED do
            begin
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.AsString;
            end;
         close;
      end;
   4: begin
         with FrmDAVOrdemServico do
            begin
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.AsString;
               EdtCodMarca.SetFocus;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsTipoVenda.FormShow(Sender: TObject);
begin
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoVenda.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
