unit UConsCaixa;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsCaixa = class(TFrmConsNovo)
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
  FrmConsCaixa: TFrmConsCaixa;

implementation
Uses Udm, Ubibli1, UCadCaixa, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QCaixa.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCaixa.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsCaixa.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QCaixa do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM CAIXA');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE DESC_CAI LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 +
                    ' AND COD_EMP = ' + inttostr(iEmp) + ' ORDER BY DESC_CAI');
         1: sql.Add(' WHERE DESC_CAI LIKE ' + #39 +
                      edtcons.Text + '%' + #39 +
                    ' AND COD_EMP = ' + inttostr(iEmp) + ' ORDER BY DESC_CAI');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' WHERE COD_EMP = ' + inttostr(iEmp) + ' ORDER BY COD_CAI')
              else
                 sql.add(' WHERE COD_CAI = ' + edtcons.Text + ' AND COD_EMP = ' + inttostr(iEmp));
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsCaixa.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  if (tag = 0) or (tag = 1) then
     begin 
        BuscaFormulario(  TFrmCadCaixa, True );
        with FrmCadCaixa do
           begin 
              tag:= 1;
              limpaedit(FrmCadCaixa);
              ededit(FrmCadCaixa, false);
              EdtCodCaixa.Text          := dm.QCaixaCOD_CAI.AsString;
              edtnome.Text              := dm.QCaixaDESC_CAI.Value;
              EdtTamDesc.Text           := dm.QCaixaTAMANHO_DESC_CUPOM.AsString;

              if trim(dm.QCaixaPORTA_IMP.AsString) = 'COM1' then
                 ComboPortaECF.ItemIndex := 0
              else
                 if trim(dm.QCaixaPORTA_IMP.AsString) = 'COM2' then
                    ComboPortaECF.ItemIndex := 1
                 else
                    ComboPortaECF.ItemIndex:= -1;

              if not DM.QCaixaPORTA_BALANCA.IsNull then
                 ComboPortaBal.ItemIndex:= dm.QCaixaPORTA_BALANCA.AsInteger - 1
              else
                 ComboPortaBal.ItemIndex:= -1;

              if dm.QCaixaBAUD_BALANCA.AsInteger = 1200 then
                 ComboBaudBal.ItemIndex := 0
              else
                 if dm.QCaixaBAUD_BALANCA.AsInteger = 2400 then
                    ComboBaudBal.ItemIndex := 1
                 else
                    if dm.QCaixaBAUD_BALANCA.AsInteger = 4800 then
                       ComboBaudBal.ItemIndex := 2
                    else
                       if dm.QCaixaBAUD_BALANCA.AsInteger = 9600 then
                          ComboBaudBal.ItemIndex := 3
                       else
                          if dm.QCaixaBAUD_BALANCA.AsInteger = 19200 then
                             ComboBaudBal.ItemIndex := 4
                          else
                             if dm.QCaixaBAUD_BALANCA.AsInteger = 38400 then
                                ComboBaudBal.ItemIndex := 5
                             else
                                ComboBaudBal.ItemIndex:= -1;

              ComboGaveta.ItemIndex     := dm.QCaixaINDICE_GAVETA.value - 1;
              ComboBalanca.ItemIndex    := dm.QCaixaINDICE_BALANCA.AsInteger;
              if dm.QCaixaCASAS_DECIMAIS.IsNull then
                 RDGDecimaisQuant.ItemIndex:= -1
              else
                 RDGDecimaisQuant.ItemIndex:= dm.QCaixaCASAS_DECIMAIS.AsInteger - 2;

              EdtLinha1.Text   := dm.QCaixaLINHA1.AsString;
              EdtLinha2.Text   := dm.QCaixaLINHA2.AsString;
              EdtLinha3.Text   := dm.QCaixaLINHA3.AsString;
              if dm.QCaixaCASAS_DECIMAIS_UNITARIO.IsNull then
                 RDGDecimaisUnitario.ItemIndex:= -1
              else
                 RDGDecimaisUnitario.ItemIndex:= dm.QCaixaCASAS_DECIMAIS_UNITARIO.AsInteger - 2;
              if trim(dm.QCaixaTRUNCAR_CAI.AsString) = 'S' then
                 CheckTrunca.Checked:= true
              else
                 CheckTrunca.Checked:= false;
              if trim(dm.QCaixaIMPRIMIR_COMPROVANTE_ECF.AsString) = 'S' then
                 CheckComprovante.Checked:= true
              else
                 CheckComprovante.Checked:= false;
              if trim(dm.QCaixaECF_MFD.AsString) = 'S' then
                 CheckMFD.Checked:= true
              else
                 CheckMFD.Checked:= false;
              if trim(dm.QCaixaTEF_CAI.AsString) = 'S' then
                 CheckTEF.Checked:= true
              else
                 CheckTEF.Checked:= false;
              EdtIPTef.Text        := dm.QCaixaIP_SERVIDOR_TEF.AsString;
              EdtIDLoja.Text       := dm.QCaixaID_LOJA_TEF.AsString;
              EdtIDTerminal.Text   := dm.QCaixaID_TERMINAL_TEF.AsString;
              EdtCaminhoBanco.Text := dm.QCaixaCAMINHO_BANCO.AsString;
              if trim(dm.QCaixaEXPORTAR_DADOS.AsString) = 'S' then
                 CheckExportar.Checked:= true
              else
                 CheckExportar.Checked:= false;

              EdtNumeroSerieECF.Text    := dm.QCaixaR01_NUMERO_SERIE.AsString;
              EdtMemoriaAdicional.Text  := dm.QCaixaR01_MF_ADICIONAL.AsString;
              EdtTipoECF.Text           := dm.QCaixaR01_TIPO_ECF.AsString;
              EdtMarcaECF.Text          := dm.QCaixaR01_MARCA_ECF.AsString;
              EdtModeloECF.Text         := dm.QCaixaR01_MODELO_ECF.AsString;
              EdtVersaoSB.Text          := dm.QCaixaR01_VERSAO_SB.AsString;
              EdtDataSB.Text            := datetostr(dm.QCaixaR01_DATAHORA_SB.AsDateTime);
              EdtHoraSB.Text            := timetostr(dm.QCaixaR01_DATAHORA_SB.AsDateTime);
              EdtCNPJUsuario.Text       := dm.QCaixaR01_CNPJ_USUARIO.AsString;
              EdtIEUsuario.Text         := dm.QCaixaR01_IE_USUARIO.AsString;
              EdtIndiceOS.Text          := dm.QCaixaINDICE_GER_OS.AsString;
              EdtIndiceOrcamento.Text   := dm.QCaixaINDICE_GER_ORCAMENTO.AsString;
              EdtIndiceMesa.Text        := dm.QCaixaINDICE_GER_MESA.AsString;
              EdtNumeroUsuario.Text     := dm.QCaixaR01_NUMERO_USUARIO.AsString;
              EdtCodNacional.Text       := dm.QCaixaCODIGO_NACIONAL_IDENTIFICACAO.AsString;
              EdtIntervaloRecebe.Text   := dm.QCaixaINTERVALO_RECEBE.AsString;
              EdtIntervaloTransmite.Text:= dm.QCaixaINTERVALO_TRANSMITE.AsString;
              EdtDiasPAF.Text           := DM.QCaixaDIAS_ATUALIZACAO_PAF.AsString; 

              // ATUALIZAÇÂO KADOSHI

              if trim( dm.QCaixaCORTA_PAPEL.AsString ) = 'S' then
                 CheckCortaPapel.Checked := True
              else
                 CheckCortaPapel.Checked := False;

              // FIM

              FormShow(sender);
              show;
           end;
        close;
     end;
end;

procedure TFrmConsCaixa.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close;
end;

procedure TFrmConsCaixa.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCaixa.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
