unit UConsTransp;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsTransp = class(TFrmConsNovo)
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
  FrmConsTransp: TFrmConsTransp;

implementation
Uses Udm, Ubibli1, UCadTransp, UNotaFiscal, UDadosNotaFiscal, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsTransp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTransp.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTransp.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsTransp.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTransp do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM TRANSPORTADORA');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_TRA LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_TRA');
         1: sql.add(' WHERE NOME_TRA LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_TRA');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_TRA')
               else
                  sql.add(' WHERE COD_TRA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsTransp.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin 
  inherited;
  case tag of
   0,1: begin 
          BuscaFormulario( TFrmCadTransp, False );
          with FrmCadTransp do
             begin 
                tag:= 1;
                limpaedit(FrmCadTransp);
                ededit(FrmCadTransp, false);
                cod_tra.Text    := dm.QTranspCOD_TRA.AsString;
                if dm.QTranspFJ_TRA.AsString = 'F' then
                   ComboFJ.ItemIndex:= 0
                else
                   ComboFJ.ItemIndex:= 1;
                ComboFJChange(ComboFJ);
                edtnome.Text    := dm.QTranspNOME_TRA.AsString;
                edtend.Text     := dm.QTranspEND_TRA.AsString;
                edtcid.Text     := dm.QTranspCID_TRA.AsString;
                for i:= 0 to 26 do
                   begin 
                      if comboest.Items[i] = dm.QTranspEST_TRA.AsString then
                         comboest.ItemIndex:= i;
                   end;
                EdtCNPJ.Text    := dm.QTranspCNPJ_TRA.AsString;
                EdtDoc.Text     := dm.QTranspINSC_TRA.AsString;
                EdtPlaca.Text   := dm.QTranspPLACA_TRA.AsString;
                for i:= 0 to 26 do
                   begin 
                      if ComboUFPlaca.Items[i] = dm.QTranspUF_PLACA_TRA.AsString then
                         ComboUFPlaca.ItemIndex:= i;
                   end;
                FormShow(sender);
                show;
             end;
          close;
       end;
   2: begin 
         with FrmNotaFiscal do
            begin 
               cod_tra.Text    := dm.QTranspCOD_TRA.AsString;
               EdtNomeTra.Text := dm.QTranspNOME_TRA.AsString;
            end;
         close;
      end;
   3: begin 
         with FrmDadosNotaFiscal do
            begin 
               EdtCodTransp.Text  := dm.QTranspCOD_TRA.AsString;
               EdtNomeTransp.Text := dm.QTranspNOME_TRA.AsString;
               EdtQuantidade.SetFocus;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsTransp.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTransp.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
