unit UContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Mask, ComCtrls, StdCtrls, Buttons, ExtCtrls, ImgList, 
  ToolWin, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmContasPagar = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_cpt: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label21: TLabel;
    EdtCodFor: UNovosComponentes.TEdit;
    BtnConsFor: TsSpeedButton;
    BtnAddFor: TsSpeedButton;
    EdtNomeFor: TEdit;
    Label22: TLabel;
    EdtTipoDoc: TEdit;
    Label3: TLabel;
    EdtNumDoc: TEdit;
    Label4: TLabel;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtObs: TEdit;
    Label7: TLabel;
    IBSQLCTP: TFDQuery;
    IBTRCTP: TFDTransaction;
    EdtData: TMaskEdit;
    EdtVenc: TMaskEdit;
    QInsCTP: TFDQuery;
    QInsCTPCODCTP: TIntegerField;
    EdtSeq: UNovosComponentes.TEdit;
    Label10: TLabel;
    EdtCodClassif: UNovosComponentes.TEdit;
    BtnConsClassif: TsSpeedButton;
    BtnAddClassif: TsSpeedButton;
    EdtNomeClassif: TEdit;
    Label11: TLabel;
    Label8: TLabel;
    EdtCodCentroCusto: UNovosComponentes.TEdit;
    BtnConsCentroCusto: TsSpeedButton;
    BtnAddCentroCusto: TsSpeedButton;
    EdtNomeCentroCusto: TEdit;
    Label9: TLabel;
    EdtCentroCusto: TMaskEdit;
    CheckPendente: TCheckBox;
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnAddForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodForExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtVencExit(Sender: TObject);
    procedure EdtCodForEnter(Sender: TObject);
    procedure BtnAddClassifClick(Sender: TObject);
    procedure BtnConsClassifClick(Sender: TObject);
    procedure EdtCodClassifEnter(Sender: TObject);
    procedure EdtCodClassifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClassifExit(Sender: TObject);
    procedure BtnConsCentroCustoClick(Sender: TObject);
    procedure BtnAddCentroCustoClick(Sender: TObject);
    procedure EdtCentroCustoExit(Sender: TObject);
    procedure EdtCentroCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmContasPagar: TFrmContasPagar;

implementation
uses
  Udm, Ubibli1, UconsFor, UcadFor, UConsLancPagar, ULancContabil, 
  UCadClassifContasPagar, UConsClassifContasPagar, UConsCentroCusto, 
  UCadCentroCusto, UNovoPrincipal, UPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmContasPagar: TFrmContasPagar;
begin
   Result := TFrmContasPagar( BuscaFormulario( TFrmContasPagar, False ) );
end;

procedure TFrmContasPagar.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmContasPagar, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmContasPagar);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmContasPagar);
         EDedit(FrmContasPagar, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmContasPagar.BtnConsForClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFor, FrmConsFor);
  FrmConsFor.Tag:= 1;
  FrmConsFor.ShowModal;
end;

procedure TFrmContasPagar.BtnAddForClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadFor, True );
end;

procedure TFrmContasPagar.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     begin 
        Application.CreateForm(TFrmConsFor, FrmConsFor);
        FrmConsFor.Tag:= 1;
        FrmConsFor.ShowModal;
     end
  else
     if key = vk_f2 then
        begin 
            BuscaFormulario( TFrmCadFor, True );
        end;
end;

procedure TFrmContasPagar.EdtCodForKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmContasPagar.EdtCodForExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeFor.Text:= consulta('fornecedor', EdtCodFor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
  if edtnomefor.Text = '' then
     begin 
        AlertaCad('Fornecedor não Cadastrado');
//        edtcodfor.SetFocus;
     end;
end;

procedure TFrmContasPagar.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M005','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
              Botoes('N');
              edtdata.Text          := datetostr(date);
              EdtSeq.Text           := '1';
              CheckPendente.Checked := true;
              edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmContasPagar.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('M005','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtdata.Text       := datetostr(date);
  EdtSeq.Text        := '1';
  CheckPendente.Checked:= true;
  edtdata.SetFocus;
end;

procedure TFrmContasPagar.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmContasPagar.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M005','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCTP.Active then
     IBTRCTP.Commit;
  IBSQLCTP.Close;
  Action:= caFree;
end;

procedure TFrmContasPagar.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M005','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if edtvalor.text = '0' then
     begin 
        AlertaCad('Digite o Valor');
//        edtvalor.setfocus;
        exit;
     end;

  if bGrava then
     begin 
        if IBTRCTP.Active then
           IBTRCTP.Commit;
        IBTRCTP.StartTransaction;
        try
          try
            with QInsCTP do
               begin 
                  close;
                  Parambyname('seq').AsInteger        := strtoint(EdtSeq.Text);
                  parambyname('codemp').AsInteger     := iEmp;
                  Parambyname('data').AsDate          := strtodate(edtdata.Text);
                  Parambyname('codfor').AsInteger     := strtoint(edtcodfor.Text);
                  Parambyname('tipodoc').AsString     := trim(EdtTipoDoc.Text);
                  Parambyname('numdoc').AsString      := trim(EdtNumDoc.Text);
                  Parambyname('valor').AsCurrency     := strtocurr(edtvalor.Text);
                  Parambyname('dtvencto').AsDate      := strtodate(EdtVenc.Text);
                  Parambyname('obs').AsString         := trim(EdtObs.Text);
                  Parambyname('codentrada').Value     := null;
                  Parambyname('dtpagto').Value        := null;
                  Parambyname('codcla').AsInteger     := strtoint(EdtCodClassif.Text);
                  Parambyname('acrescimo').AsCurrency := 0;
                  Parambyname('desconto').AsCurrency  := 0;
                  Parambyname('valorpago').AsCurrency := 0;
                  Parambyname('centrocusto').AsInteger:= strtoint(EdtCodCentroCusto.Text);

                  if CheckPendente.Checked then
                     Parambyname('duppendente').AsString := 'S'
                  else
                     Parambyname('duppendente').AsString := 'N';

                  Open;
                  cod_cpt.Text:= QInsCTPCODCTP.AsString;
               end;
            IBTRCTP.Commit;
            Botoes('G');
          except
            IBTRCTP.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          QInsCTP.Close;
        end;
     end
  else
     begin 
        if IBTRCTP.Active then
           IBTRCTP.Commit;
        IBTRCTP.StartTransaction;
        try
          try
            with IBSQLCTP do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('UPDATE CONTAS_PAGAR SET DATA_CTP = :DATACTP, COD_FOR = :CODFOR,  ' +
                          'TIPO_DOC_CTP = :TIPO_DOCCTP, NUM_DOC_CTP = :NUM_DOCCTP,          ' +
                          'VALOR_CTP = :VALORCTP, DTVENCTO_CTP = :DTVENCTOCTP,              ' +
                          'OBS_CTP = :OBSCTP, COD_CLASSIFICACAO = :CODCLA,                  ' +
                          'DUPLICATA_PENDENTE = :DUPPENDENTE, CODIGO_CENTRO_CUSTO = :CC     ' +
                          'WHERE COD_CPT = :CODCPT AND SEQUENCIA_CTP = :SEQ');
                  Parambyname('codcpt').AsInteger        := strtoint(cod_cpt.Text);
                  Parambyname('seq').AsInteger           := StrToInt(EdtSeq.Text);
                  Parambyname('datactp').AsDate          := strtodate(edtdata.text);
                  Parambyname('codfor').AsInteger        := strtoint(EdtCodFor.Text);
                  Parambyname('tipo_docctp').AsString    := EdtTipoDoc.Text;
                  Parambyname('num_docctp').AsString     := trim(EdtNumDoc.Text);
                  Parambyname('valorctp').AsCurrency     := StrToCurr(edtvalor.Text);
                  Parambyname('dtvenctoctp').AsDate      := strtodate(EdtVenc.Text);
                  Parambyname('cc').AsInteger            := strtoint(EdtCodCentroCusto.Text);

                  if edtobs.Text = '' then
                     Parambyname('obsctp').Value         := null
                  else
                     Parambyname('obsctp').AsString      := EdtObs.Text;
                  Parambyname('codcla').AsInteger:= strtoint(EdtCodClassif.Text);

                  if CheckPendente.Checked then
                     Parambyname('duppendente').AsString := 'S'
                  else
                     Parambyname('duppendente').AsString := 'N';
                     
                  ExecOrOpen;
               end;
            IBTRCTP.Commit;
            Botoes('G');
          except
            IBTRCTP.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          IBSQLCTP.Close;
        end;
     end;
end;

procedure TFrmContasPagar.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M005','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if application.MessageBox('Confirma a Exclusão do Lançamento?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin 
        if IBTRCTP.Active then
           IBTRCTP.Commit;
        IBTRCTP.StartTransaction;
        try
          try
            with IBSQLCTP do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM CONTAS_PAGAR WHERE COD_CPT = :COD AND SEQUENCIA_CTP = :SEQ');
                  Parambyname('cod').AsInteger := strtoint(cod_cpt.text);
                  Parambyname('seq').AsInteger := strtoint(EdtSeq.Text);
                  ExecOrOpen;
               end;
            IBTRCTP.Commit;
            Limpaedit(FrmContasPagar);
            ededit(FrmContasPagar, false);
            Botoes('E');
          except
            IBTRCTP.Rollback;
            AlertaCad('Erro ao excluir o Lançamento');
          end;
        finally
          IBSQLCTP.Close;
        end;
     end;
end;

procedure TFrmContasPagar.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmConsLancPagar, True );
end;

procedure TFrmContasPagar.EdtDataExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(edtdata.text);
  except
    AlertaCad('Data Inválida');
//    edtdata.setfocus;
  end;
end;

procedure TFrmContasPagar.EdtVencExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(EdtVenc.text);
  except
    AlertaCad('Data Inválida');
//    EdtVenc.setfocus;
  end;
end;

procedure TFrmContasPagar.EdtCodForEnter(Sender: TObject);
begin 
  inherited;
  edtcodfor.SelectAll;
end;

procedure TFrmContasPagar.BtnAddClassifClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadClassifContasPagar, True );
end;

procedure TFrmContasPagar.BtnConsClassifClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsClassifContasPagar, FrmConsClassifContasPagar);
  FrmConsClassifContasPagar.Tag:= 1;
  FrmConsClassifContasPagar.ShowModal;
end;

procedure TFrmContasPagar.EdtCodClassifEnter(Sender: TObject);
begin 
  inherited;
  EdtCodClassif.SelectAll;
end;

procedure TFrmContasPagar.EdtCodClassifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  case key of
   vk_f3: BtnConsClassif.Click;
   vk_f2: BtnAddClassif.Click;
  end;
end;

procedure TFrmContasPagar.EdtCodClassifExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeClassif.Text:= consulta('classificacao_contas_pagar', EdtCodClassif, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if EdtNomeClassif.Text = '' then
     begin 
        AlertaCad('Classificação não Cadastrada');
//        EdtCodClassif.SetFocus;
     end;
end;

procedure TFrmContasPagar.BtnConsCentroCustoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 8;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmContasPagar.BtnAddCentroCustoClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCentroCusto, True );
end;

procedure TFrmContasPagar.EdtCentroCustoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCusto.Text) = '' then
     begin 
        EdtCodCentroCusto.Clear;
        EdtNomeCentroCusto.Clear;
        exit;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCusto.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCusto.Text   := fieldbyname('codigo').AsString;
                        EdtNomeCentroCusto.Text  := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCusto.Clear;
//                        EdtCentroCusto.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCusto.Clear;
                  EdtCentroCusto.Clear;
                  EdtNomeCentroCusto.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCusto.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmContasPagar.EdtCentroCustoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCentroCusto.Click
  else
     if key = vk_f2 then
        BtnAddCentroCusto.Click;
end;

end.



