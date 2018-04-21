unit UConsConta;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinsdxStatusBarPainter, dxStatusBar, dxSkinMetropolisDark,
  Data.DB;

type
  TFrmConsConta = class(TFrmConsNovo)
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
  FrmConsConta: TFrmConsConta;

implementation
Uses Udm, Ubibli1, UCadConta, UCadCheque, UDeposito, ULancCC, UConsCCChequesAberto,
     UExtratoCC, UConsLancCC, URelCCAberto, URelExtratoCC, UCadFormasPagamentos, UCTRADMRec,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QConta.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsConta.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsConta.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QConta do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CONTAS_CORRENTE');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_CONTA LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CONTA');
         1: sql.add(' WHERE NOME_CONTA LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_CONTA');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY COD_CONTA')
               else
                  sql.add(' WHERE COD_CONTA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsConta.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0,3: begin
          BuscaFormulario( TFrmCadConta, True );
          with FrmCadConta do
             begin 
                tag:= 1;
                limpaedit(FrmCadConta);
                ededit(FrmCadConta, false);
                cod_conta.Text  := dm.QContaCOD_CONTA.AsString;
                edtnome.Text    := dm.QContaNOME_CONTA.AsString;
                FormShow(sender);
                show;
             end;
          close;
       end;
   1:  begin 
          with FrmCadCheque do
             begin 
                EdtCodConta.Text := dm.QContaCOD_CONTA.AsString;
                edtnomeconta.Text:= dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   2:  begin 
          with FrmDeposito do
            begin 
               EdtCodConta.Text    := dm.QContaCOD_CONTA.AsString;
               EdtNomeConta.Text   := dm.QContaNOME_CONTA.AsString;
               EdtDataDep.SetFocus;
            end;
          close;
       end;
   4:  begin 
          with FrmLancCC do
             begin 
                EdtCodConta.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeConta.Text := dm.QContaNOME_CONTA.AsString;
                EdtCodDoc.SetFocus;
             end;
          close;
       end;
   5:  begin 
          with FrmConsCCChequesAberto do
             begin 
                cod_conta.Text    := dm.QContaCOD_CONTA.AsString;
                EdtNomeConta.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   6:  begin 
          with FrmExtratoCC do
             begin 
                EdtCodConta.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeConta.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   7:  begin 
          with FrmConsLanCC do
             begin 
                EdtCodCC.Text := dm.QContaCOD_CONTA.AsString;
                EdtNomeCC.Text:= dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   8:  begin 
          with FrmRelCCAberto do
             begin 
                EdtCodCC.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeCC.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   9:  begin 
          with FrmRelExtratoCC do
             begin 
                cod_conta.Text    := dm.QContaCOD_CONTA.AsString;
                EdtNomeConta.Text := dm.QContaNOME_CONTA.AsString;
                edtdataini.SetFocus;
             end;
          close;
       end;
   10:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaVendas.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaVendas.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   11:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaCTR.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaCTR.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   12:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaCTP.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaCTP.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   13:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaCTREstorno.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaCTREstorno.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   14:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaCTPEstorno.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaCTPEstorno.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   15:  begin 
          with FrmCadFormaPagamento do
             begin 
                EdtCodContaVendasEstorno.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeContaVendasEstorno.Text := dm.QContaNOME_CONTA.AsString;
             end;
          close;
       end;
   16:  begin 
          with FrmCtrAdmRec do
             begin 
                EdtCodConta.Text  := dm.QContaCOD_CONTA.AsString;
                EdtNomeConta.Text := dm.QContaNOME_CONTA.AsString;
                EdtCentroCusto.SetFocus;
             end;
          close;
       end
  end;
end;

procedure TFrmConsConta.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsConta.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsConta.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end; 
end;

end.


