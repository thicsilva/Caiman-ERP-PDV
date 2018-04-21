unit UConsBanco;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsBanco = class(TFrmConsNovo)
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
  FrmConsBanco: TFrmConsBanco;

implementation
Uses Udm, Ubibli1, UCadBanco, UCadCheque, UConsCheque, ULancCheques,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QBanco.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsBanco.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
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
  case tag of
   0,3:begin
          BuscaFormulario( TFrmCadBanco, True );
          with FrmCadBanco do
             begin
                tag:= 1;
                limpaedit(FrmCadBanco);
                ededit(FrmCadBanco, false);
                cod_ban.Text       := dm.QBancoCOD_BAN.AsString;
                edtnome.Text       := dm.QBancoNOME_BAN.Value;
                EdtLinhaEmi.Text   := dm.QBancoLINHA_EMISSAO_BOLETO.AsString;
                EdtColEmi.Text     := dm.QBancoCOL_EMISSAO_BOLETO.AsString;
                EdtLinhaDoc.Text   := dm.QBancoLINHA_DOC_BOLETO.AsString;
                EdtColDoc.Text     := dm.QBancoCOL_DOC_BOLETO.AsString;
                EdtLinhaVenc.Text  := dm.QBancoLINHA_VENC_BOLETO.AsString;
                EdtColVenc.Text    := dm.QBancoCOL_VENC_BOLETO.AsString;
                EdtLinhaValor.Text := dm.QBancoLINHA_VALOR_BOLETO.AsString;
                EdtColValor.Text   := dm.QBancoCOL_VALOR_BOLETO.AsString;
                EdtLinhaInst.Text  := dm.QBancoLINHA_INST_BOLETO.AsString;
                EdtColInst.Text    := dm.QBancoCOL_INST_BOLETO.AsString;
                EdtLinhaSac.Text   := dm.QBancoLINHA_SACADO_BOLETO.AsString;
                EdtColSac.Text     := dm.QBancoCOL_SACADO_BOLETO.AsString;
                EdtLinhasFinal.Text:= dm.QBancoLINHAS_FINAL_BOLETO.AsString;
                if dm.QBancoIMPRIMIR_PARCELA_BOLETO.AsString = 'S' then
                   CheckParc.Checked:= true
                else
                   CheckParc.Checked:= false;
                FormShow(sender);
                show;
             end;
          close;
       end;
   1: begin
         with FrmCadCheque do
            begin
               EdtCodBanco.Text := dm.QBancoCOD_BAN.AsString;
               edtnomebanco.Text:= dm.QBancoNOME_BAN.AsString;
               edtagencia.SetFocus;
            end;
         close;
      end;
   2: begin
         with FrmConsCheque do
            begin
               edtcod.Text     := dm.QBancoCOD_BAN.AsString;
               edtnome.Text    := dm.QBancoNOME_BAN.AsString;
               btnok.SetFocus;
            end;
         close;
      end;
   4: begin
         with FrmLancCheques do
            begin
               cod_ban.Text      := dm.QBancoCOD_BAN.AsString;
               EdtNomeBanco.Text := dm.QBancoNOME_BAN.AsString;
               EdtAgencia.SetFocus;
            end;
         close;
      end;
  end;
end;

procedure TFrmConsBanco.BtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmConsBanco.FormShow(Sender: TObject);
begin
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsBanco.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.



