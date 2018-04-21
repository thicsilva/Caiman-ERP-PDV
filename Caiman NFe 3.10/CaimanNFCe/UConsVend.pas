unit UConsVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TFrmConsVend = class(TFrmConsNovo)
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
  FrmConsVend: TFrmConsVend;

implementation
Uses Udm, UPreVenda, UMesas, UDavOrcamento, UVendasPED, UDAVOrdemServico, USelVend;

{$R *.dfm}

procedure TFrmConsVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QVend.Close;

  {grava a posicao do combo}
  dm.GravaIni(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVend.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
  Self := nil;
end;

procedure TFrmConsVend.BtnOkClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QVend do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * ' +
                'FROM VENDEDOR');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_VEND LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_VEND');
         1: sql.add(' WHERE NOME_VEND LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_VEND');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_VEND')
               else
                  sql.add(' WHERE COD_VEND = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsVend.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case tag of
    1: begin
         with FrmPreVenda do
            begin
               if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
                  begin
                     showmessage('Vendedor não ativo');
                     exit;
                  end;
               edtcodvend.Text   := dm.QVendCOD_VEND.AsString;
               edtnomevend.Text  := dm.QVendNOME_VEND.AsString;
               EdtCodTPV.SetFocus;
            end;
         close;
       end;
    2: begin
         with FrmMesas do
            begin
               if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
                  begin
                     showmessage('Vendedor não ativo');
                     exit;
                  end;
               EdtCodGarcon.Text := dm.QVendCOD_VEND.AsString;
               EdtNomeGarcon.Text:= dm.QVendNOME_VEND.AsString;
               EdtCodPro.SetFocus;
            end;
         close;
       end;
    3: begin
         with FrmDavOrcamento do
            begin
               if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
                  begin
                     showmessage('Vendedor não ativo');
                     exit;
                  end;
               EdtCodVend.Text := dm.QVendCOD_VEND.AsString;
               EdtNomeVend.Text:= dm.QVendNOME_VEND.AsString;
               EdtCodTPV.SetFocus;
            end;
         close;
       end;
    4: begin
         with FrmVendasPED do
            begin
               if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
                  begin
                     showmessage('Vendedor não ativo');
                     exit;
                  end;
               EdtCodVend.Text := dm.QVendCOD_VEND.AsString;
               EdtNomeVend.Text:= dm.QVendNOME_VEND.AsString;
               EdtCodTPV.SetFocus;
            end;
         close;
       end;
    5: begin
         with FrmDAVOrdemServico do
            begin
               if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
                  begin
                     showmessage('Vendedor não ativo');
                     exit;
                  end;
               EdtCodVend.Text := dm.QVendCOD_VEND.AsString;
               EdtNomeVend.Text:= dm.QVendNOME_VEND.AsString;
               EdtQuant.SetFocus;
            end;
         close;
       end;
    6: begin
          frmSelVend.cod_vend.Text := dm.QVendCOD_VEND.AsString;
          frmSelVend.vend.Text := dm.QVendNOME_VEND.AsString;
          close;
       end;
  end;
end;

procedure TFrmConsVend.FormShow(Sender: TObject);
begin
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVend.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
