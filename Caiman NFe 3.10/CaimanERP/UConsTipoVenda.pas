unit UConsTipoVenda;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, Data.DB;

type
  TFrmConsTipoVenda = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    _TipoVenda : Integer;
    { Public declarations }
  end;

var
  FrmConsTipoVenda: TFrmConsTipoVenda;

implementation
Uses Udm, Ubibli1, UCadTipoVenda, UConfiguracoes, UVenda,
     UNotaFiscal, UNovoPrincipal, UfechaVendaParcelas, UCadPreVenda;

{$R *.dfm}

procedure TFrmConsTipoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QTipoVenda.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoVenda.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
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
        sql.add('SELECT T.*, C.DESCRICAO ' +
                'FROM TIPO_VENDA T       ' +
                'INNER JOIN CLASSIFICACAO_CONTAS_RECEBER C ' +
                'ON (T.CODIGO_CLASSIFICACAO = C.CODIGO) ');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE T.NOME_TPV LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY T.NOME_TPV');
         1: sql.Add(' WHERE T.NOME_TPV LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY T.NOME_TPV');
         2: begin 
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY T.COD_TPV')
               else
                  sql.add(' WHERE T.COD_TPV = ' + edtcons.Text);
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
   0,2: begin 
           BuscaFormulario( TFrmCadTipoVenda,  True );
           with FrmCadTipoVenda do
              begin 
                 tag:= 1;
                 limpaedit(FrmCadTipoVenda);
                 ededit(FrmCadTipoVenda, false);
                 cod_tpv.Text         := dm.QTipoVendaCOD_TPV.AsString;
                 edtnome.Text         := dm.QTipoVendaNOME_TPV.AsString;
                 EdtQtdParc.Text      := dm.QTipoVendaQTDPARCELAS_TPV.AsString;
                 EdtDiasPriParc.Text  := dm.QTipoVendaDIASPRIPARC_TPV.AsString;
                 EdtDiasentreParc.Text:= dm.QTipoVendaDIASENTREPARC_TPV.AsString;
                 if trim(dm.QTipoVendaPOSSUI_ENTRADA.AsString) = 'S' then
                    ComboEnt.ItemIndex:= 0
                 else
                    ComboEnt.ItemIndex:= 1;
                 EdtPercEnt.Text      := dm.QTipoVendaPERC_ENTRADA.AsString;
                 if trim(dm.QTipoVendaTABELA_PRECO_TPV.AsString) = 'N' then
                    ComboPreco.ItemIndex:= 0
                 else
                    ComboPreco.ItemIndex:= 1;

                 EdtCodClassif.Text  := dm.QTipoVendaCODIGO_CLASSIFICACAO.AsString;
                 EdtNomeClassif.Text := dm.QTipoVendaDESCRICAO.AsString;

                 FormShow(sender);
                 show;
              end;
           close;
        end;
   1: begin 
         with FrmConfiguracoes do
            begin 
               EdtCodTPV.Text     := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text    := dm.QTipoVendaNOME_TPV.Value;
            end;
         close;
      end;
   3: begin 
         with FrmVenda do
            begin 
               edtcodtpv.Text  := dm.QTipoVendaCOD_TPV.AsString;
               edtnometpv.Text := dm.QTipoVendaNOME_TPV.Value;
            end;
         close;
      end;
   4: begin 
         with FrmConfiguracoes do
            begin 
               EdtCodTVPrazo.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTVPrazo.Text := dm.QTipoVendaNOME_TPV.Value;
            end;
         close;
      end;
   9: begin 
         with FrmNotaFiscal do
            begin 
               EdtCodTPV.Text  := dm.QTipoVendaCOD_TPV.AsString;
               EdtNomeTPV.Text := dm.QTipoVendaNOME_TPV.Value;
               cod_tra.SetFocus;
            end;
         close;
      end;
    10: begin
           frmFechaVendaParcelas.edtCodTpv.Text := DM.QTipoVendaCOD_TPV.AsString;
           frmFechaVendaParcelas.edtDescTPV.Text := DM.QTipoVendaNOME_TPV.AsString;
           frmFechaVendaParcelas.edtCodTpv.SetFocus;
           Close;
        end;
   11: begin
        _TipoVenda := dm.QTipoVendaCOD_TPV.AsInteger;
        close;
      end;
  end;
end;

procedure TFrmConsTipoVenda.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsTipoVenda.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.

