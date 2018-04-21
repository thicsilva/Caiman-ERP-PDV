unit ULancCTRADM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, Mask, 
  StdCtrls, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, 
  acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancCTRADM = class(TFrmCadastroNovo)
    Label1: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    EdtEmissao: TMaskEdit;
    Label2: TLabel;
    Label6: TLabel;
    EdtVenc: TMaskEdit;
    Label4: TLabel;
    EdtNumDoc: TEdit;
    Label5: TLabel;
    EdtValor: TCurrencyEdit;
    IBSQLCartao: TFDQuery;
    IBTRCartao: TFDTransaction;
    QInsert: TFDQuery;
    Label3: TLabel;
    EdtTaxa: TCurrencyEdit;
    QInsertCODIGO: TIntegerField;
    Label7: TLabel;
    EdtCodBandeira: UNovosComponentes.TEdit;
    BtnConsBandeira: TsSpeedButton;
    EdtNomeBandeira: TEdit;
    Label8: TLabel;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label22: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtParcela: TEdit;
    Label11: TLabel;
    EdtCodVenda: TEdit;
    BtnConsVenda: TsSpeedButton;
    procedure EdtEmissaoExit(Sender: TObject);
    procedure EdtVencExit(Sender: TObject);
    procedure EdtCodBandeiraKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddBandeiraClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCodBandeiraEnter(Sender: TObject);
    procedure EdtCodBandeiraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodBandeiraExit(Sender: TObject);
    procedure BtnConsBandeiraClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnConsVendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmLancCTRADM: TFrmLancCTRADM;

implementation
uses
  Udm, Ubibli1, UCadAdmCartaoCredito, UConsAdmCartaoCredito, UConsCTRAdm,
  UConsCli, UConsVendas, UConsBandeiraCartao, UNovoPrincipal, UPrincipal;
var  bGrava   : boolean;
     iQtdParc : integer;
     aDia : array[1..7] of string = ('Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado');

{$R *.dfm}

function FrmLancCTRADM: TFrmLancCTRADM;
begin
   Result := TFrmLancCTRADM( BuscaFormulario( TFrmLancCTRADM, False ) );
end;

procedure TFrmLancCTRADM.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmLancCTRADM, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmLancCTRADM);
                btnExcluir.Enabled:= false
             end
          else
              btnExcluir.Enabled := true;
          BtnConsultar.Enabled   := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmLancCTRADM);
         EDedit(FrmLancCTRADM, false);
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

procedure TFrmLancCTRADM.EdtEmissaoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(EdtEmissao.Text);
  except
    AlertaCad('Data Inválida');
//    EdtEmissao.SetFocus;
  end;
end;

procedure TFrmLancCTRADM.EdtVencExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(EdtVenc.Text);
    {LData.Caption:= aDia[dayofWeek(strtodate(EdtVenc.text))];
    if DayOfWeek(strtodate(EdtVenc.text)) in [1,7] then
       LData.Font.Color:= clRed
    else
       LData.Font.Color:= clNavy;}
  except
    AlertaCad('Data Inválida');
//    EdtVenc.SetFocus;
  end;
end;

procedure TFrmLancCTRADM.EdtCodBandeiraKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmLancCTRADM.BtnAddBandeiraClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadAdmCartaoCredito, True );
end;

procedure TFrmLancCTRADM.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M023','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtEmissao.Text      := datetostr(date);
             edtvenc.Text         := datetostr(date);
             EdtCodVenda.Enabled  := true;
             BtnConsVenda.Enabled := true;
             EdtEmissao.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmLancCTRADM.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;

  if not DM.Acesso('M023','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtEmissao.Text      := datetostr(date);
  edtvenc.Text         := datetostr(date);
  EdtCodVenda.Enabled  := true;
  BtnConsVenda.Enabled := true;
  EdtEmissao.SetFocus;
end;

procedure TFrmLancCTRADM.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmLancCTRADM.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M023','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  EdtCodVenda.Enabled  := false;
  BtnConsVenda.Enabled := false;
  EdtEmissao.SetFocus;
end;

procedure TFrmLancCTRADM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCartao.Active then
     IBTRCartao.Commit;
  IBSQLCartao.Close;
  Action:= caFree;
end;

procedure TFrmLancCTRADM.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M023','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if strtodate(EdtVenc.Text) < strtodate(EdtEmissao.Text) then
     begin 
        AlertaCad('O vencimento não pode ser menor que a data de emissão');
        exit;
     end;

  if edtvalor.Text = '0' then
     begin 
        AlertaCad('Digite o Valor');
//        edtvalor.SetFocus;
        exit;
     end;

  if bGrava then
     begin 
        if IBTRCartao.Active then
           IBTRCartao.Commit;
        IBTRCartao.StartTransaction;
        try
          try
            with QInsert do
               begin 
                  close;
                  Parambyname('codigo_bandeira').AsInteger := strtoint(EdtCodBandeira.Text);
                  Parambyname('documento').AsString        := trim(EdtNumDoc.Text);
                  Parambyname('emissao').AsDate            := strtodate(EdtEmissao.Text);
                  Parambyname('vencimento').AsDate         := strtodate(EdtVenc.Text);
                  Parambyname('codcai').AsInteger          := iCaixa;
                  Parambyname('codemp').AsInteger          := iEmp;

                  if trim(EdtCodVenda.Text) <> '' then
                     Parambyname('codven').AsInteger       := strtoint(EdtCodVenda.Text)
                  else
                     Parambyname('codven').Value           := null;

                  Parambyname('valor').AsCurrency          := strtocurr(EdtValor.Text);
                  Parambyname('taxa').AsCurrency           := strtocurr(EdtTaxa.Text);
                  Parambyname('codcli').AsInteger          := strtoint(EdtCodCli.Text);
                  Parambyname('parcela').AsInteger         := strtoint(EdtParcela.Text);
                  open;
                  EdtCodigo.Text:= QInsertCODIGO.AsString;
               end;
            IBTRCartao.Commit;
            Botoes('G');
          except
            IBTRCartao.Rollback;
            AlertaCad('Erro ao gravar o Lançamento');
          end;
        finally
          QInsert.Close;
        end;
     end
  else
     begin 
        if IBTRCartao.Active then
           IBTRCartao.Commit;
        IBTRCartao.StartTransaction;
        try
          try
            with IBSQLCartao do
              begin 
                 close;
                 sql.Clear;
                 sql.Add('UPDATE CONTAS_RECEBER_ADM_CARTAO SET ' +
                                 'CODIGO_BANDEIRA = :2, ' +
                                 'DOCUMENTO       = :3, ' +
                                 'EMISSAO         = :4, ' +
                                 'VENCIMENTO      = :5, ' +
                                 'VALOR           = :6, ' +
                                 'TAXA            = :7, ' +
                                 'COD_CLI         = :8  ' +
                         'WHERE CODIGO = :1');

                 Parambyname('1').AsInteger  := strtoint(EdtCodigo.Text);
                 Parambyname('2').AsInteger  := strtoint(EdtCodBandeira.Text);
                 Parambyname('3').AsString   := trim(EdtNumDoc.Text);
                 Parambyname('4').Asdate     := strtodate(EdtEmissao.Text);
                 Parambyname('5').AsDate     := strtodate(EdtVenc.Text);
                 Parambyname('6').AsCurrency := StrToCurr(edtvalor.Text);
                 Parambyname('7').AsCurrency := StrToCurr(EdtTaxa.Text);
                 Parambyname('8').AsInteger  := strtoint(EdtCodCli.Text); 
                 ExecOrOpen;
              end;
            IBTRCartao.Commit;
            Botoes('G');
          except
            IBTRCartao.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          IBSQLCartao.Close;
        end;
     end;
end;

procedure TFrmLancCTRADM.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M023','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if application.MessageBox('Confirma a Exclusão do Lançamento?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin 
        if IBTRCartao.Active then
           IBTRCartao.Commit;
        IBTRCartao.StartTransaction;
        try
          try
            with IBSQLCartao do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM CONTAS_RECEBER_ADM_CARTAO WHERE CODIGO = :1');
                  Parambyname('1').AsInteger:= strtoint(EdtCodigo.text);
                  ExecOrOpen;
               end;
            IBTRCartao.Commit;
            Limpaedit(FrmLancCTRADM);
            ededit(FrmLancCTRADM, false);
            Botoes('E');
          except
            IBTRCartao.Rollback;
            AlertaCad('Erro ao excluir o Lançamento');
          end;
        finally
          IBSQLCartao.Close;
        end;
     end;
end;

procedure TFrmLancCTRADM.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCTRAdm, FrmConsCTRAdm);
  FrmConsCTRAdm.tag:= 0;
  FrmConsCTRAdm.ShowModal;
end;

procedure TFrmLancCTRADM.EdtCodBandeiraEnter(Sender: TObject);
begin 
  inherited;
  EdtCodBandeira.SelectAll;
end;

procedure TFrmLancCTRADM.EdtCodBandeiraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsBandeira.Click;
end;

procedure TFrmLancCTRADM.EdtCodBandeiraExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodBandeira.Text) = '' then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.Text:= 'SELECT * ' +
                       'FROM BANDEIRAS_CARTAO ' +
                       'WHERE CODIGO = :CODIGO';
            Parambyname('codigo').AsInteger:= strtoint(EdtCodBandeira.Text);
            open;
            if not fieldbyname('codigo').IsNull then
               begin 
                  EdtNomeBandeira.Text:= fieldbyname('descricao').AsString;
                  if trim(fieldbyname('TIPO_CARTAO').AsString) = 'C' then
                     begin 
                        EdtVenc.Text := datetostr(strtodate(EdtEmissao.Text) + fieldbyname('DIAS_CREDITO').AsInteger);
                        EdtTaxa.Text := fieldbyname('TAXA_CREDITO').AsString;
                     end
                  else
                     begin 
                        EdtTaxa.Text := fieldbyname('TAXA_DEBITO').AsString;
                        EdtVenc.Text := datetostr(strtodate(EdtEmissao.Text) + fieldbyname('DIAS_DEBITO').AsInteger);
                     end;
               end
            else
               begin 
                  EdtNomeBandeira.Clear;
                  EdtTaxa.Clear;
                  EdtCodBandeira.SetFocus;
                  AlertaCad('Bandeira não cadastrada');
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar a bandeira');
//      EdtCodBandeira.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmLancCTRADM.BtnConsBandeiraClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsBandeiraCartao, FrmConsBandeiraCartao);
  FrmConsBandeiraCartao.Tag:= 0;
  FrmConsBandeiraCartao.ShowModal;
end;

procedure TFrmLancCTRADM.EdtCodCliEnter(Sender: TObject);
begin 
  inherited;
  EdtCodCli.SelectAll; 
end;

procedure TFrmLancCTRADM.EdtCodCliExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  EdtNomeCli.Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', strtoint(EdtCodCli.Text));
  if trim(EdtNomeCli.Text) = '' then
     begin 
        AlertaCad('Cliente não cadastrado');
//        EdtCodCli.SetFocus;
     end;
end;

procedure TFrmLancCTRADM.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCli.Click;
end;

procedure TFrmLancCTRADM.BtnConsCliClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.Tag:= 41;
  FrmConsCli.ShowModal;
end;

procedure TFrmLancCTRADM.BtnConsVendaClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsVendas, FrmConsVendas);
  FrmConsVendas.Tag:= 5;
  FrmConsVendas.showmodal;
end;

end.
