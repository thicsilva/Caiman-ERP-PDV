unit ULancContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Mask, StdCtrls, Grids, DBGrids, Buttons, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancContasPagar = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label21: TLabel;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    Label3: TLabel;
    EdtTipoDoc: TEdit;
    EdtNumDoc: TEdit;
    Label4: TLabel;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtObs: TEdit;
    EdtEmissao: TMaskEdit;
    EdtVencimento: TMaskEdit;
    DBGrid1: TDBGrid;
    BtnGravar: TBitBtn;
    BtnSair: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    QConsCTP: TFDQuery;
    DSQConsCTP: TDataSource;
    QConsCTPCOD_CPT: TIntegerField;
    QConsCTPCOD_EMP: TIntegerField;
    QConsCTPDATA_CTP: TDateField;
    QConsCTPCOD_FOR: TIntegerField;
    QConsCTPTIPO_DOC_CTP: TStringField;
    QConsCTPNUM_DOC_CTP: TStringField;
    QConsCTPVALOR_CTP: TBCDField;
    QConsCTPDTVENCTO_CTP: TDateField;
    QConsCTPOBS_CTP: TStringField;
    QConsCTPCOD_ENTRADA: TIntegerField;
    IBTREntCTP: TFDTransaction;
    IBSQLCTP: TFDQuery;
    QInsCTP: TFDQuery;
    QInsCTPCODCTP: TIntegerField;
    EdtSequencia: UNovosComponentes.TEdit;
    QConsCTPSEQUENCIA_CTP: TIntegerField;
    QConsCTPDTPAGTO_CTP: TDateField;
    Label10: TLabel;
    EdtCodClassif: UNovosComponentes.TEdit;
    BtnConsClassif: TsSpeedButton;
    BtnAddClassif: TsSpeedButton;
    EdtNomeClassif: TEdit;
    Label11: TLabel;
    QConsCTPCOD_CLASSIFICACAO: TIntegerField;
    QConsCTPDESCRICAO: TStringField;
    Label8: TLabel;
    EdtCentroCusto: TMaskEdit;
    BtnConsCentroCusto: TsSpeedButton;
    BtnAddCentroCusto: TsSpeedButton;
    EdtNomeCentroCusto: TEdit;
    Label9: TLabel;
    EdtCodCentroCusto: UNovosComponentes.TEdit;
    CheckPendente: TCheckBox;
    QConsCTPDUPLICATA_PENDENTE: TStringField;
    procedure EdtEmissaoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscaCTP;
    procedure Limpa;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClassifExit(Sender: TObject);
    procedure EdtCodClassifEnter(Sender: TObject);
    procedure EdtCodClassifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClassifKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsClassifClick(Sender: TObject);
    procedure BtnAddClassifClick(Sender: TObject);
    procedure EdtCentroCustoExit(Sender: TObject);
    procedure BtnConsCentroCustoClick(Sender: TObject);
    procedure BtnAddCentroCustoClick(Sender: TObject);
    procedure EdtCentroCustoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancContasPagar: TFrmLancContasPagar;

implementation
uses
  Udm, UEntradas, UBibli1, UConsClassifContasPagar, UCadClassifContasPagar, 
  UConsCentroCusto, UCadCentroCusto, UNovoPrincipal;
var  bTemLancamentos : boolean;
     bGravaCTP       : boolean;
     iCodCTP         : integer;
     iSeqCTP         : integer;

{$R *.dfm}

procedure TFrmLancContasPagar.Limpa;
begin 
   EdtCodigo.Clear;
   EdtSequencia.Text      := '1';
   EdtEmissao.Text        := FrmEntradas.EdtEmissao.Text;
   EdtNumDoc.Text         := FrmEntradas.EdtNumNF.Text;
   CheckPendente.Checked  := true;
   edtvalor.Clear;
   EdtVencimento.Clear;
   edtobs.Clear;
end;

procedure TFrmLancContasPagar.BuscaCTP;
begin 
   if IBTREntCTP.Active then
      IBTREntCTP.Commit;
   IBTREntCTP.StartTransaction;
   with QConsCTP do
      begin 
         close;
         Parambyname('codentrada').Value:= FrmEntradas.EdtCod.Text;
         open;
         if recordcount > 0 then
            bTemLancamentos:= true
         else
            bTemLancamentos:= false;
      end;
end;

procedure TFrmLancContasPagar.EdtEmissaoExit(Sender: TObject);
begin 
   with sender as TMaskEdit do
      begin 
         try
           strtodate(text);
         except
           AlertaCad('Data Inválida');
           setfocus;
         end;
      end;
end;

procedure TFrmLancContasPagar.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmLancContasPagar.FormShow(Sender: TObject);
begin 
   bGravaCTP:= true;
   BuscaCTP;
   if not bTemLancamentos then
      begin 
         EdtSequencia.Text      := '1';
         EdtEmissao.Text        := FrmEntradas.EdtEnt.Text;
         edtcodfor.Text         := FrmEntradas.EdtCodFor.Text;
         edtnomefor.Text        := FrmEntradas.EdtNomeFor.Text;
         EdtTipoDoc.Clear;
         EdtNumDoc.Text         := FrmEntradas.EdtNumNF.Text;
         edtvalor.Text          := FrmEntradas.EdtTotalNF.Text;
         EdtVencimento.Text     := datetostr(strtodate(FrmEntradas.EdtEmissao.Text) + 30);
         CheckPendente.Checked  := true;
         EdtEmissao.SetFocus;
      end
   else
      begin 
         limpa;
         DBGrid1.SetFocus;
      end;
end;

procedure TFrmLancContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTREntCTP.Active then
      IBTREntCTP.Commit;
   QConsCTP.Close;
   Action:= caFree;
end;

procedure TFrmLancContasPagar.BtnGravarClick(Sender: TObject);
begin 
   if (bGravaCTP) and (not DM.Acesso('M005','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if EdtVencimento.Text = '  /  /    ' then
     begin 
        AlertaCad('Digite a data de vencimento');
//        EdtVencimento.SetFocus;
        exit;
     end;

  if strtocurr(EdtValor.Text) = 0 then
     begin 
        AlertaCad('Digite o Valor');
//        edtvalor.SetFocus;
        exit;
     end;

  if bGravaCTP then
     begin 
        if IBTREntCTP.Active then
           IBTREntCTP.Commit;
        IBTREntCTP.StartTransaction;
        try
          try
            with QInsCTP do
               begin 
                  close;
                  Parambyname('seq').AsInteger         := strtoint(EdtSequencia.Text);
                  parambyname('codemp').AsInteger      := iEmp;
                  Parambyname('data').AsDate           := strtodate(EdtEmissao.Text);
                  Parambyname('codfor').AsInteger      := strtoint(edtcodfor.Text);
                  Parambyname('tipodoc').AsString      := EdtTipoDoc.Text;
                  Parambyname('numdoc').AsString       := trim(EdtNumDoc.Text);
                  Parambyname('valor').AsCurrency      := strtocurr(edtvalor.Text);
                  Parambyname('dtvencto').AsDate       := strtodate(EdtVencimento.Text);
                  Parambyname('obs').AsString          := trim(EdtObs.Text);
                  Parambyname('codentrada').AsInteger  := strtoint(FrmEntradas.EdtCod.Text);
                  Parambyname('codcla').AsInteger      := strtoint(EdtCodClassif.Text);
                  Parambyname('dtpagto').value         := null;
                  Parambyname('valorpago').AsCurrency  := 0;
                  Parambyname('desconto').AsCurrency   := 0;
                  Parambyname('valorpago').AsCurrency  := 0;
                  Parambyname('centrocusto').AsInteger := strtoint(EdtCodCentroCusto.Text);

                  if CheckPendente.Checked then
                     Parambyname('duppendente').AsString := 'S'
                  else
                     Parambyname('duppendente').AsString := 'N';

                  Open;
                  EdtCodigo.Text:= QInsCTPCODCTP.AsString;
               end;
            IBTREntCTP.Commit;
          except
            IBTREntCTP.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          QInsCTP.Close;
          bGravaCTP:= true;
        end;
     end
  else
     begin 
        if IBTREntCTP.Active then
           IBTREntCTP.Commit;
        IBTREntCTP.StartTransaction;
        try
          try
            with IBSQLCTP do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('UPDATE CONTAS_PAGAR SET DATA_CTP = :DATACTP, COD_FOR = :CODFOR, ' +
                          'TIPO_DOC_CTP = :TIPO_DOCCTP, NUM_DOC_CTP = :NUM_DOCCTP, ' +
                          'VALOR_CTP = :VALORCTP, DTVENCTO_CTP = :DTVENCTOCTP, OBS_CTP = :OBSCTP,   ' +
                          'DTPAGTO_CTP = :DTPAGTO, VALOR_PAGO_CTP = :VALORPAGO, ' +
                          'COD_CLASSIFICACAO = :CODCLA, CODIGO_CENTRO_CUSTO = :CENTROCUSTO ' +
                          'WHERE COD_CPT = :CODCPT AND SEQUENCIA_CTP = :SEQ');

                  Parambyname('codcpt').AsInteger        := strtoint(EdtCodigo.Text);
                  Parambyname('seq').AsInteger           := strtoint(EdtSequencia.Text);
                  Parambyname('datactp').AsDate          := strtodate(EdtEmissao.text);
                  Parambyname('codfor').AsInteger        := strtoint(EdtCodFor.Text);
                  Parambyname('tipo_docctp').AsString    := trim(EdtTipoDoc.Text);
                  Parambyname('num_docctp').AsString     := trim(EdtNumDoc.Text);
                  Parambyname('valorctp').AsCurrency     := strtocurr(edtvalor.Text);
                  Parambyname('dtvenctoctp').AsDate      := strtodate(EdtVencimento.Text);
                  Parambyname('obsctp').AsString         := trim(EdtObs.Text);
                  Parambyname('codcla').AsInteger        := strtoint(EdtCodClassif.Text);
                  Parambyname('dtpagto').Value           := null;
                  Parambyname('valorpago').AsCurrency    := 0;
                  Parambyname('centrocusto').AsInteger   := strtoint(EdtCodCentroCusto.Text);
                  ExecOrOpen;
               end;
            IBTREntCTP.Commit;
          except
            IBTREntCTP.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          IBSQLCTP.Close;
        end;
     end;
  bGravaCTP:= true;
  Limpa;
  BuscaCTP;
  EdtTipoDoc.SetFocus;
end;

procedure TFrmLancContasPagar.BtnAlterarClick(Sender: TObject);
begin 
   if not DM.Acesso('M005','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
   bGravaCTP:= false;
   EdtCodigo.Text      := QConsCTPCOD_CPT.AsString;
   EdtSequencia.Text   := QConsCTPSEQUENCIA_CTP.AsString;
   EdtEmissao.Text     := QConsCTPDATA_CTP.AsString;
   EdtCodFor.Text      := QConsCTPCOD_FOR.AsString;
   EdtTipoDoc.Text     := QConsCTPTIPO_DOC_CTP.AsString;
   EdtNumDoc.Text      := QConsCTPNUM_DOC_CTP.AsString;
   EdtValor.Text       := QConsCTPVALOR_CTP.AsString;
   EdtVencimento.Text  := QConsCTPDTVENCTO_CTP.AsString;
   EdtObs.Text         := QConsCTPOBS_CTP.AsString;
   EdtCodClassif.Text  := QConsCTPCOD_CLASSIFICACAO.AsString;
   EdtNomeClassif.Text := QConsCTPDESCRICAO.AsString;

   if trim(QConsCTPDUPLICATA_PENDENTE.AsString) = 'S' then
      CheckPendente.Checked:= true
   else
      CheckPendente.Checked:= false;

   EdtEmissao.SetFocus;
end;

procedure TFrmLancContasPagar.BtnExcluirClick(Sender: TObject);
begin 
   if not DM.Acesso('M005','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
   if Application.MessageBox('Confirma a Exclusão do Lançamento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         iCodCTP:= QConsCTPCOD_CPT.AsInteger;
         iSeqCTP:= QConsCTPSEQUENCIA_CTP.AsInteger;
         if IBTREntCTP.Active then
            IBTREntCTP.Commit;
         IBTREntCTP.StartTransaction;
         try
           try
             with IBSQLCTP do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('DELETE FROM CONTAS_PAGAR WHERE COD_CPT = :COD AND SEQUENCIA_CTP = :SEQ');
                   Parambyname('cod').AsInteger:= iCodCTP;
                   Parambyname('seq').AsInteger:= iSeqCTP;
                   ExecOrOpen;
                end;
             IBTREntCTP.Commit;
           except
             IBTREntCTP.Rollback;
             AlertaCad('Erro ao Excluir o Lançamento');
           end;
         finally
           IBSQLCTP.Close;
           limpa;
           BuscaCTP;
           bGravaCTP:= true;
         end;
      end;
end;

procedure TFrmLancContasPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmLancContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmLancContasPagar.EdtCodClassifExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomeClassif.Text:= consulta('classificacao_contas_pagar', EdtCodClassif, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if EdtNomeClassif.Text = '' then
      begin 
         AlertaCad('Classificação não Cadastrada');
//         EdtCodClassif.SetFocus;
      end;
end;

procedure TFrmLancContasPagar.EdtCodClassifEnter(Sender: TObject);
begin 
   EdtCodClassif.SelectAll;
end;

procedure TFrmLancContasPagar.EdtCodClassifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   case key of
   vk_f3: BtnConsClassif.Click;
   vk_f2: BtnAddClassif.Click;
  end;
end;

procedure TFrmLancContasPagar.EdtCodClassifKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmLancContasPagar.BtnConsClassifClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsClassifContasPagar, FrmConsClassifContasPagar);
   FrmConsClassifContasPagar.Tag:= 3;
   FrmConsClassifContasPagar.ShowModal;
end;

procedure TFrmLancContasPagar.BtnAddClassifClick(Sender: TObject);
begin 
   BuscaFormulario( TFrmCadClassifContasPagar, True );
end;

procedure TFrmLancContasPagar.EdtCentroCustoExit(Sender: TObject);
begin 
   if btnsair.Focused then
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

procedure TFrmLancContasPagar.BtnConsCentroCustoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
   FrmConsCentroCusto.Tag:= 11;
   FrmConsCentroCusto.ShowModal;
end;

procedure TFrmLancContasPagar.BtnAddCentroCustoClick(Sender: TObject);
begin 
   BuscaFormulario( TFrmCadCentroCusto, True );
end;

procedure TFrmLancContasPagar.EdtCentroCustoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsCentroCusto.Click
   else
      if key = vk_f2 then
         BtnAddCentroCusto.Click;
end;

end.
