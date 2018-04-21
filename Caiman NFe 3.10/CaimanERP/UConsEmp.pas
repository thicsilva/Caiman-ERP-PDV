unit UConsEmp;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013White,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsEmp = class(TFrmConsNovo)
    procedure BtnSairClick(Sender: TObject);
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
  FrmConsEmp: TFrmConsEmp;

implementation
Uses Udm, Ubibli1, UCadEmp, UCadUsuario, UCadPromocao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsEmp.BtnSairClick(Sender: TObject);
begin 
  inherited;
  close; 
end;

procedure TFrmConsEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QEmp.Close;
  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEmp.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsEmp.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QEmp do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM EMPRESA');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE RAZAO_EMP LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY RAZAO_EMP');
         1: sql.Add(' WHERE RAZAO_EMP LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY RAZAO_EMP');
         2: begin 
              if EdtCons.Text = '' then
                 sql.Add(' ORDER BY COD_EMP')
              else
                 sql.add(' WHERE COD_EMP = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsEmp.BtnLocalizarClick(Sender: TObject);
var i: integer;
var
  FrmCadEmp: TFrmCadEmp;
begin
  inherited;
  FrmCadEmp := BuscaFormulario( TFrmCadEmp ) as TFrmCadEmp;
  case tag of
   0,1:begin
          with FrmCadEmp do
             begin 
                tag:= 1;
                limpaedit(FrmCadEmp);
                ededit(FrmCadEmp, false);
                cod_emp.Text         := dm.QEmpCOD_EMP.AsString;
                edtnome.Text         := dm.QEmpRAZAO_EMP.Value;
                edtend.Text          := dm.QEmpEND_EMP.Value;
                edtbai.Text          := dm.QEmpBAI_EMP.Value;
                edtcid.Text          := dm.QEmpCID_EMP.Value;
                for i:= 0 to 26 do
                   begin 
                      if comboest.Items[i] = dm.QEmpEST_EMP.Value then
                         comboest.ItemIndex:= i;
                   end;
                edtcep.Text          := dm.QEmpCEP_EMP.Value;
                edttel.Text          := dm.QEmpTEL_EMP.Value;
                edtfax.Text          := dm.QEmpFAX_EMP.Value;
                edtcnpj.Text         := dm.QEmpCNPJ_EMP.Value;
                edtinsc.Text         := dm.QEmpINSC_EMP.Value;
                edtetq.Text           := dm.QEmpNOME_EMP_ETIQUETA.Value;
                EdtNumero.Text        := dm.QEmpNUMERO_EMP.Value;
                EdtResp.Text          := dm.QEmpRESP_EMP.Value;
                if not dm.QEmpCAMINHO_FOTO_EMP.IsNull then
                   begin 
                      try
                        OpenPicture.FileName:= dm.QEmpCAMINHO_FOTO_EMP.Value;
                        image.Visible:= true;
                        image.Picture.LoadFromFile(dm.QEmpCAMINHO_FOTO_EMP.Value);
                      except
                        OpenPicture.FileName:= '';
                        image.Visible:= false;
                      end;
                   end
                else
                   begin 
                      OpenPicture.FileName:= '';
                      image.Visible:= false;
                   end;
                EdtFant.Text               := dm.QEmpFANTASIA_EMP.AsString;
                if trim(dm.QEmpMOSTRAR_SITCLI_PREVENDA.AsString) = 'S' then
                   CheckSitCli.Checked:= true
                else
                   CheckSitCli.Checked:= false;
                if trim(dm.QEmpCADASTRAR_CLIENTE_SEM_CPF.AsString) = 'S' then
                   CheckCPF.Checked:= true
                else
                   CheckCPF.Checked:= false;
                ComboTipoEmp.ItemIndex    := dm.QEmpTIPO_EMP.AsInteger;
                ComboTipoCarga.ItemIndex  := dm.QEmpTIPO_CARGA_BALANCA.AsInteger;
                EdtCaminhoValidador.Text  := dm.QEmpCAMINHO_VALIDADOR_SINTEGRA.AsString;
                EdtInscMunicipal.Text     := dm.QEmpINSCRICAO_MUNICIPAL.AsString;
                EdtPerfilEFD.Text         := dm.QEmpPERFIL_EFD.AsString;
                EdtCodigoMunicipio.Text   := dm.QEmpCODIGO_MUNICIPIO.Text;
                EdtTipoAtividadeEFD.Text  := dm.QEmpTIPO_ATIVIDADE_EFD.AsString;
                EdtNomeContador.Text      := dm.QEmpNOME_CONTADOR.AsString;
                EdtCPFContador.Text       := dm.QEmpCPF_CONTADOR.AsString;
                EdtCRCContador.Text       := dm.QEmpCRC_CONTADOR.AsString;
                EdtCNPJContador.Text      := dm.QEmpCNPJ_CONTADOR.AsString;
                EdtCEPContador.Text       := dm.QEmpCEP_CONTADOR.AsString;
                EdtEndContador.Text       := dm.QEmpEND_CONTADOR.AsString;
                EdtNumeroContador.Text    := dm.QEmpNUMERO_CONTADOR.AsString;
                EdtBairroContador.Text    := dm.QEmpBAIRRO_CONTADOR.AsString;
                EdtTelContador.Text       := dm.QEmpTEL_CONTADOR.AsString;
                EdtFaxContador.Text       := dm.QEmpFAX_CONTADOR.AsString;
                EdtCodMunContador.Text    := dm.QEmpCODIGO_MUNICIPIO_CONTADOR.AsString;
                edtVersaoEFD.ItemIndex    := dm.QEmpVERSAO_EFD.AsInteger;
                edtEmailContador.Text     := DM.QEmpEMAIL_CONTADOR.AsString;
                FormShow(sender);
                show;
             end;
          close;
       end;
   2:  begin 
          with FrmCadUsu do
             begin 
                cod_emp.Text   := dm.QEmpCOD_EMP.AsString;
                EdtNomeEmp.Text:= dm.QEmpRAZAO_EMP.Value;
                btngrava.setfocus;
             end;
          close;
       end;
   3:  begin 
          with FrmCadPromocao do
             begin 
                EdtCodEmp.Text   := dm.QEmpCOD_EMP.AsString;
                EdtNomeEmp.Text  := dm.QEmpRAZAO_EMP.Value;
                EdtInicio.SetFocus;
             end;
          close;
       end;
   end;
end;

procedure TFrmConsEmp.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEmp.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
