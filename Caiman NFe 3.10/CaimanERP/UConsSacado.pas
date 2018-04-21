unit UConsSacado;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TfrmConsSacado = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsSacado: TfrmConsSacado;

implementation

uses UDM, UCadSacadoBoleto, UNovoPrincipal;

{$R *.dfm}

procedure TfrmConsSacado.BtnLocalizarClick(Sender: TObject);
var
  I: Integer;
begin 
  inherited;
  case Tag of
     0: begin 
          BuscaFormulario( TfrmCadSacadoBoleto, True  );
           with frmCadSacadoBoleto do
              begin 

                 cod.Text := dm.QSacadoCOD.AsString;
                 edtBanco.Text := dm.QSacadoBANCO.AsString;
                 edtAgencia.Text := dm.QSacadoAGENCIA.AsString;
                 edtAgenciaDigito.Text := dm.QSacadoAGENCIA_DIGITO.AsString;
                 edtCedente.Text := dm.QSacadoCODIGO_CEDENTE.AsString;
                 edtConta.Text := dm.QSacadoCONTA.AsString;
                 edtContaDigito.Text := dm.QSacadoCONTA_DIGITO.AsString;
                 edtLocalPagamento.Text := DM.QSacadoMENSAGEM_PAGAMENTO.AsString;
                 edtInstrucoes.Text := DM.QSacadoINSTRUCOES_DE_PAGAMENTO.AsString;
                 edtMulta.Value := dm.QSacadoMULTA_ATRASO.AsCurrency;
                 edtoValorDia.Value := DM.QSacadoVALOR_DIA_ATRASO.AsCurrency;
                 edtEspecie.Text := DM.QSacadoESPECIE_DOC.AsString;
                 edtMoeda.Text := dm.QSacadoESPECIE_MOEDA.AsString;
                 if Trim( DM.QSacadoACEITE.AsString ) = 'S' then
                    rgAceite.ItemIndex := 0
                 else
                    rgAceite.ItemIndex := 1;
                 edtCarteira.Text := DM.QSacadoCARTEIRA.AsString;
                 edtNossoNumero.Text := DM.QSacadoNOSSO_NUMERO.AsString;
                 EdtNome.Text := DM.QSacadoSACADO_NOME.AsString;
                 EdtCNPJ.Text := dm.QSacadoSACADO_CNPJ.AsString;
                 EdtEnd.Text := dm.QSacadoSACADO_ENDERECO.AsString;
                 EdtNumero.Text := DM.QSacadoSACADO_NUMERO.Text;
                 EdtBai.Text := dm.QSacadoSACADO_BAIRRO.AsString;
                 EdtCid.Text := dm.QSacadoSACADO_CIDADE.AsString;
                for i:= 0 to 26 do
                   begin 
                      if comboest.Items[i] = dm.QSacadoSACADO_UF.Value then
                         comboest.ItemIndex:= i;
                   end;

                 EdtCep.Text := DM.QSacadoSACADO_CEP.AsString;
                 rgTipoImpressao.ItemIndex := dm.QSacadoTIPO_IMPRESSAO.AsInteger;
                 rgLayout.ItemIndex := dm.QSacadoTIPO_REMESSA.AsInteger;
                 edtDiasProtesto.Text := dm.QSacadoDIAS_PROTESTO.AsString;
                 edtRemessas.Text := DM.QSacadoNUMERO_REMESSA.AsString;
                 edtConvenio.Text := DM.QSacadoCONVENIO.AsString;
                 Show;
              end;
           Close;
        end;
     1: begin 
           with frmCadSacadoBoleto do
              begin 

                 cod.Text := dm.QSacadoCOD.AsString;
                 edtBanco.Text := dm.QSacadoBANCO.AsString;
                 edtAgencia.Text := dm.QSacadoAGENCIA.AsString;
                 edtAgenciaDigito.Text := dm.QSacadoAGENCIA_DIGITO.AsString;
                 edtCedente.Text := dm.QSacadoCODIGO_CEDENTE.AsString;
                 edtConta.Text := dm.QSacadoCONTA.AsString;
                 edtContaDigito.Text := dm.QSacadoCONTA_DIGITO.AsString;
                 edtLocalPagamento.Text := DM.QSacadoMENSAGEM_PAGAMENTO.AsString;
                 edtInstrucoes.Text := DM.QSacadoINSTRUCOES_DE_PAGAMENTO.AsString;
                 edtMulta.Value := dm.QSacadoMULTA_ATRASO.AsCurrency;
                 edtoValorDia.Value := DM.QSacadoVALOR_DIA_ATRASO.AsCurrency;
                 edtEspecie.Text := DM.QSacadoESPECIE_DOC.AsString;
                 edtMoeda.Text := dm.QSacadoESPECIE_MOEDA.AsString;
                 if Trim( DM.QSacadoACEITE.AsString ) = 'S' then
                    rgAceite.ItemIndex := 0
                 else
                    rgAceite.ItemIndex := 1;
                 edtCarteira.Text := DM.QSacadoCARTEIRA.AsString;
                 edtNossoNumero.Text := DM.QSacadoNOSSO_NUMERO.AsString;
                 EdtNome.Text := DM.QSacadoSACADO_NOME.AsString;
                 EdtCNPJ.Text := dm.QSacadoSACADO_CNPJ.AsString;
                 EdtEnd.Text := dm.QSacadoSACADO_ENDERECO.AsString;
                 EdtNumero.Text := DM.QSacadoSACADO_NUMERO.Text;
                 EdtBai.Text := dm.QSacadoSACADO_BAIRRO.AsString;
                 EdtCid.Text := dm.QSacadoSACADO_CIDADE.AsString;
                for i:= 0 to 26 do
                   begin 
                      if comboest.Items[i] = dm.QSacadoSACADO_UF.Value then
                         comboest.ItemIndex:= i;
                   end;
                 EdtCep.Text := DM.QSacadoSACADO_CEP.AsString;
                 rgTipoImpressao.ItemIndex := dm.QSacadoTIPO_IMPRESSAO.AsInteger;
                 rgLayout.ItemIndex := dm.QSacadoTIPO_REMESSA.AsInteger;
                 edtDiasProtesto.Text := dm.QSacadoDIAS_PROTESTO.AsString;
                 edtRemessas.Text := DM.QSacadoNUMERO_REMESSA.AsString;
                 edtConvenio.Text := DM.QSacadoCONVENIO.AsString;
                 frmCadSacadoBoleto.Tag := 1;
                 Show;
              end;
           Close;

     end;
     3: begin 
        if not DM.QSacadoCOD.IsNull then
           begin 
              if dm.SetarCedente( DM.QSacadoCOD.AsInteger ) then
                 ModalResult := mrOk
              else
                 BtnOKClick( nil );
           end


     end;
  end;

end;

procedure TfrmConsSacado.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QSacado do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM BOLETOS_SACADO');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE SACADO_NOME LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' AND COD_EMP=' + IntToStr( iEmp ) +
                    ' ORDER BY SACADO_NOME');
         1: sql.add(' WHERE CODIGO_CEDENTE LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' AND COD_EMP=' + IntToStr( iEmp ) +
                    ' ORDER BY SACADO_NOME');
         2: begin 
               if EdtCons.Text <> '' then
                 begin 
                    sql.add(' WHERE COD = :COD ' + ' AND COD_EMP=' + IntToStr( iEmp ));
                    parambyname('COD').AsInteger:= StrToInt(EdtCons.Text);
                 end
               else
                  sql.Add(  ' WHERE COD_EMP=' + IntToStr( iEmp ) );
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TfrmConsSacado.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QSacado.Close;
  {grava a posicao do combo}
  dm.GravaIni('configlocal.ini', 'PosicaoCombobox', 'FrmConsSacado.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TfrmConsSacado.FormShow(Sender: TObject);
begin 
  inherited;
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('configlocal.ini', 'PosicaoCombobox', 'FrmConsSacado.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;

end;

end.
