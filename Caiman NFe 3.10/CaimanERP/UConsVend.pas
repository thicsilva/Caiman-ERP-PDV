unit UConsVend;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons,
  UComissoesVendedores, UNovosComponentes, UNovoFormulario, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, Data.DB;

type
  TFrmConsVend = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    _Vend : Integer;
    { Public declarations }
  end;

var
  FrmConsVend: TFrmConsVend;

implementation
Uses Udm, Ubibli1, UCadVend, UVenda, UMMA_OS, URelComissoes, UCadCli,
  UNovoPrincipal, UCadPreVenda;

{$R *.dfm}

procedure TFrmConsVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QVend.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVend.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
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
   0,1: begin
           BuscaFormulario( TFrmCadVend, True );
           with FrmCadVend do
              begin 
                 tag:= 1;
                 limpaedit(FrmCadVend);
                 ededit(FrmCadVend, false);
                 cod_vend.Text  := dm.QVendCOD_VEND.AsString;
                 edtnome.Text   := dm.QVendNOME_VEND.Value;
                 edtSenha.Text  := DM.QVendSENHA_VEND.AsString;
                 if trim(dm.QVendATIVO_VEND.asString) = 'S' then
                    ComboAtivo.ItemIndex:= 0
                 else
                    ComboAtivo.ItemIndex:= 1;
                 EdtComissao.Text:= dm.QVendCOMISSAO_VEND.AsString;
                 FormShow(sender);
                 show;
              end;
           close;
        end;
   2: begin 
         with FrmVenda do
            begin 
               if trim(dm.QVendATIVO_VEND.AsString) = 'S' then
                  begin 
                     EdtCodVend.Text  := dm.QVendCOD_VEND.AsString;
                     EdtNomeVend.Text := dm.QVendNOME_VEND.AsString;
                  end
               else
                  begin 
                     AlertaCad('Vendedor Bloqueado');
                     exit;
                  end;
            end;
         close;
      end;
   3: begin 
         FrmMMA_OS.cod_vend.text := dm.QVendCOD_VEND.AsString;
         FrmMMA_OS.vendedor.text := dm.QVendNOME_VEND.AsString;
         close;
      end;
   4: begin 
         FrmMMA_OS.cod_vend_retorno.text := dm.QVendCOD_VEND.AsString;
         FrmMMA_OS.vendedor_retorno.text := dm.QVendNOME_VEND.AsString;
         close;
      end;
   5: begin 
         frmComissoesVendedores.EdtCodVend.Text := dm.QVendCOD_VEND.AsString;
         frmComissoesVendedores.EdtNomeVend.Text := DM.QVendNOME_VEND.AsString;
         close;
      end;
   6: begin 
          frmRelComissoes.cod_vendedor := dm.QVendCOD_VEND.AsInteger;
          frmRelComissoes.nome_vendedor := DM.QVendNOME_VEND.AsString;
          close;
      end;
   7: begin 
         FrmCadCli.edtCodVend.Text := dm.QVendCOD_VEND.AsString;
         FrmCadCli.edtVend.Text := dm.QVendNOME_VEND.AsString;
         Close;
      end;
   8: begin
        _Vend := dm.QVendCOD_VEND.AsInteger;
        close;
      end;

  end;
end;

procedure TFrmConsVend.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVend.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

procedure TFrmConsVend.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
  inherited;
  if trim(dm.QVendATIVO_VEND.AsString) = 'N' then
      begin 
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end;
end;

end.
