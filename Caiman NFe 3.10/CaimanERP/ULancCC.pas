unit ULancCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, 
  Buttons, DB, Grids, DBGrids, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancCC = class(TFrmCadastroNovo)
    Label1: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    ComboDC: TComboBox;
    Label3: TLabel;
    EdtDoc: TEdit;
    Label6: TLabel;
    EdtValor: TCurrencyEdit;
    Label4: TLabel;
    EdtHist: TEdit;
    Label5: TLabel;
    Label17: TLabel;
    EdtCodDoc: UNovosComponentes.TEdit;
    BtnConsDoc: TsSpeedButton;
    BtnAddDoc: TsSpeedButton;
    EdtNomeDoc: TEdit;
    Label18: TLabel;
    Label7: TLabel;
    IBSQLan: TFDQuery;
    IBTRLan: TFDTransaction;
    Label8: TLabel;
    EdtCodConta: UNovosComponentes.TEdit;
    BtnConsConta: TsSpeedButton;
    BtnAddConta: TsSpeedButton;
    EdtNomeConta: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtNumCheque: TEdit;
    QInsert: TFDQuery;
    EdtData: TDateTimePicker;
    EdtVencto: TDateTimePicker;
    Panel3: TPanel;
    Label30: TLabel;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    BtnConsCentroCusto: TsSpeedButton;
    BtnAddCentroCusto: TsSpeedButton;
    EdtNomeCentro: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    EdtValorCentro: TCurrencyEdit;
    BtnGrava: TButton;
    BtnExclui: TButton;
    EdtCentroCusto: TMaskEdit;
    EdtCodigoCentro: UNovosComponentes.TEdit;
    QCentro: TFDQuery;
    QCentroCOD_LAN: TIntegerField;
    QCentroCOD_CENTRO_CUSTO: TIntegerField;
    QCentroVALOR: TBCDField;
    QCentroCONTA: TStringField;
    QCentroDESCRICAO: TStringField;
    DSCentro: TDataSource;
    QInsertCODIGO: TIntegerField;
    GBTotalCentro: TGroupBox;
    EdtTotalCentro: TCurrencyEdit;
    procedure EdtCodDocKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddDocClick(Sender: TObject);
    procedure BtnConsDocClick(Sender: TObject);
    procedure EdtCodDocExit(Sender: TObject);
    procedure EdtCodDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Botoes(acao : string);
    procedure EdtValorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnAddContaClick(Sender: TObject);
    procedure BtnConsContaClick(Sender: TObject);
    procedure EdtCodContaExit(Sender: TObject);
    procedure EdtCodContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCodContaEnter(Sender: TObject);
    procedure EdtCodDocEnter(Sender: TObject);
    procedure BtnAddCentroCustoClick(Sender: TObject);
    procedure BtnConsCentroCustoClick(Sender: TObject);
    procedure EdtCentroCustoExit(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure LimpaItens;
    procedure BuscaCentros;
    procedure BtnExcluiClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmLancCC: TFrmLancCC;

implementation

uses
  UCadTipoDoc, UConsTipoDoc, Udm, Ubibli1, UCadConta, UConsConta, UConsLancCC, 
  UCadCentroCusto, UConsCentroCusto, UNovoPrincipal, UPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmLancCC: TFrmLancCC;
begin
   Result := TFrmLancCC( BuscaFormulario( TFrmLancCC,False ) );
end;

procedure TFrmLancCC.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          panel1.Enabled:= true;
          panel3.Enabled:= false;
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmLancCC);
                btnExcluir.Enabled:= false;
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled  := false;
      end
   else
      begin 
         Panel1.Enabled:= false;
         Panel3.Enabled:= false;

         if not (acao = 'G') then
            Limpaedit(FrmLancCC);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            begin 
               btnExcluir.Enabled:= true;
               Panel3.Enabled    := true;
            end
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmLancCC.BuscaCentros;
var cTotal : currency;
begin 
   cTotal:= 0;

   if IBTRLan.Active then
      IBTRLan.Commit;
   IBTRLan.StartTransaction;
   with QCentro do
      begin 
         close;
         parambyname('codlan').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         while not eof do
            begin 
               cTotal:= cTotal + QCentroVALOR.AsCurrency;
               next;
            end;
      end;
   EdtTotalCentro.Text:= currtostr(cTotal);

   if strtocurr(EdtValor.Text) = strtocurr(EdtTotalCentro.Text) then
      EdtTotalCentro.Font.Color:= clWindowText
   else
      EdtTotalCentro.Font.Color:= clRed;

end;

procedure TFrmLancCC.LimpaItens;
begin 
   EdtCodigoCentro.Clear;
   EdtCentroCusto.Clear;
   EdtNomeCentro.Clear;
   EdtValorCentro.Clear;
end;

procedure TFrmLancCC.EdtCodDocKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmLancCC.BtnAddDocClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadTipoDoc, True );
end;

procedure TFrmLancCC.BtnConsDocClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoDoc, FrmConsTipoDoc);
  FrmConsTipoDoc.tag:= 1;
  FrmConsTipoDoc.showmodal;
end;

procedure TFrmLancCC.EdtCodDocExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeDoc.Text:= Consulta('tipo_documento', EdtCodDoc, 'cod_doc', 'nome_doc', dm.IBTransaction, dm.qConsulta);
  if EdtNomeDoc.Text = '' then
     begin 
        AlertaCad('Erro ao buscar o tipo de documento');
//        EdtCodDoc.SetFocus;
     end;
end;

procedure TFrmLancCC.EdtCodDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsDoc.Click
  else
     if key = vk_f2 then
        BtnAddDoc.Click;
end;

procedure TFrmLancCC.EdtValorExit(Sender: TObject);
begin 
  inherited;
  if edtvalor.Text = '0' then
     begin 
        AlertaCad('Digite o Valor');
//        edtvalor.SetFocus;
     end;
end;

procedure TFrmLancCC.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M016','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtdata.Date      := date;
             EdtVencto.Date    := date;
             ComboDC.ItemIndex := 0;
             EdtData.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmLancCC.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  if IBTRLan.Active then
     IBTRLan.Commit;
  QCentro.Close;

  bGrava:= true;
  if not DM.Acesso('M016','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtdata.Date     := date;
  EdtVencto.Date   := date;
  ComboDC.ItemIndex:= 0;
  EdtData.SetFocus;
end;

procedure TFrmLancCC.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  Botoes('C');
end;

procedure TFrmLancCC.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M016','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  EdtData.SetFocus;
end;

procedure TFrmLancCC.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRLan.Active then
     IBTRLan.Commit;
  IBSQLan.Close;
  Action:= caFree; 
end;

procedure TFrmLancCC.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M016','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if EdtVencto.Date < EdtData.Date then
     begin 
        AlertaCad('A data de vencimento não pode ser menor que a data de emissão');
//        EdtVencto.SetFocus;
        exit;
     end;

  if trim(EdtHist.Text) = '' then
     begin 
        AlertaCad('Digite o Histórico');
//        EdtHist.SetFocus;
        exit;
     end;

  if IBTRLan.Active then
     IBTRLan.Commit;
  IBTRLan.StartTransaction;
  if bGrava then
     begin 
        try
          try
            with QInsert do
               begin 
                  close;
                  Parambyname('codconta').AsInteger  := strtoint(EdtCodConta.Text);
                  Parambyname('dataemi').AsDate      := EdtData.Date;
                  Parambyname('datavenc').AsDate     := EdtVencto.Date;

                  if trim(EdtNumCheque.Text) = '' then
                     Parambyname('numcheque').Value:= null
                  else
                    Parambyname('numcheque').AsString:= trim(EdtNumCheque.Text);

                  Parambyname('valor').AsCurrency := strtocurr(EdtValor.Text);

                  if EdtData.Date = EdtVencto.Date then
                     Parambyname('conc').AsInteger := 0
                  else
                     Parambyname('conc').AsInteger := 1;

                  Parambyname('dc').AsInteger     := ComboDC.ItemIndex;
                  Parambyname('hist').AsString    := trim(EdtHist.Text);
                  Parambyname('coddoc').AsInteger := strtoint(EdtCodDoc.Text);

                  if trim(EdtDoc.Text) = '' then
                     Parambyname('doc').Value     := null
                  else
                     Parambyname('doc').AsString  := trim(EdtDoc.Text);

                  Parambyname('codemp').AsInteger := iEmp;
                  open;
                  EdtCodigo.Text:= QInsertCODIGO.AsString;
               end;
            IBTRLan.Commit;
            Botoes('G');
            EdtCentroCusto.SetFocus;
          except
            IBTRLan.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          QInsert.Close;
        end;
     end
  else
     begin 
        try
          try
            with IBSQLan do
              begin 
                 close;
                 sql.Clear;
                    begin 
                       sql.Add('UPDATE LANCAMENTOS_CONTAS_CORRENTE SET COD_CONTA = :2, DATAEMI_LAN = :3,     ' +
                               'DATAVENC_LAN = :4, NUM_CHEQUE_LAN = :5, VALOR_LAN = :6, CONCILIADO_LAN = :7, ' +
                               'DC_LAN = :8, HISTORICO_LAN = :9, COD_DOC = :10, DOCUMENTO_LAN = :11          ' +
                               'WHERE COD_LAN = :1');
                    end;
                 Parambyname('1').AsInteger              := strtoint(EdtCodigo.Text);
                 Parambyname('2').AsInteger              := strtoint(EdtCodConta.Text);
                 Parambyname('3').AsDate                 := EdtData.Date;
                 Parambyname('4').AsDate                 := EdtVencto.Date;

                 if trim(EdtNumCheque.Text) = '' then
                    Parambyname('5').value               := null
                 else
                    Parambyname('5').AsString            := trim(EdtNumCheque.Text);

                 Parambyname('6').AsCurrency             := strtocurr(EdtValor.Text);

                 if EdtData.Date = EdtVencto.Date then
                    Parambyname('7').AsInteger           := 0
                 else
                    Parambyname('7').AsInteger           := 1;

                 Parambyname('8').AsInteger              := ComboDC.ItemIndex;
                 Parambyname('9').AsString               := trim(EdtHist.Text);
                 Parambyname('10').AsInteger             := strtoint(EdtCodDoc.Text);

                 if trim(EdtDoc.Text) = '' then
                    Parambyname('11').Value              := null
                 else
                    Parambyname('11').AsString           := trim(EdtDoc.Text);
                 ExecOrOpen;
              end;
            IBTRLan.Commit;
            Botoes('G');
          except
            IBTRLan.Rollback;
            AlertaCad('Erro ao Gravar o Lançamento');
          end;
        finally
          IBSQLan.Close;
          BuscaCentros;
        end;
     end;
end;

procedure TFrmLancCC.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;

  if not DM.Acesso('M016','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if Application.MessageBox('Confirma a Exclusão do Lançamento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRLan.Active then
           IBTRLan.Commit;
        IBTRLan.StartTransaction;
        try
          try
            with IBSQLan do
               begin 
                  close;
                  sql.Clear;
                  sql.Text:= 'DELETE FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                             'WHERE COD_LAN = :COD';
                  Parambyname('cod').AsInteger:= strtoint(edtcodigo.Text);
                  ExecOrOpen;
               end;
            IBTRLan.Commit;
            Botoes('E');
          except
            IBTRLan.Rollback;
            AlertaCad('Erro ao excluir o lançamento');
          end;
        finally
          IBSQLan.Close;
        end;
     end;
end;

procedure TFrmLancCC.BtnAddContaClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadConta, True );
end;

procedure TFrmLancCC.BtnConsContaClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 4;
  FrmConsConta.showmodal;
end;

procedure TFrmLancCC.EdtCodContaExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeConta.Text:= Consulta('contas_corrente', EdtCodConta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Erro ao buscar a Conta');
//        EdtCodConta.SetFocus;
     end;
end;

procedure TFrmLancCC.EdtCodContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsConta.Click
  else
     if key = vk_f2 then
        BtnAddConta.Click;
end;

procedure TFrmLancCC.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsLanCC, FrmConsLanCC);
  FrmConsLanCC.showmodal;
end;

procedure TFrmLancCC.EdtCodContaEnter(Sender: TObject);
begin 
  inherited;
  EdtCodConta.SelectAll;
end;

procedure TFrmLancCC.EdtCodDocEnter(Sender: TObject);
begin 
  inherited;
  EdtCodDoc.SelectAll;
end;

procedure TFrmLancCC.BtnAddCentroCustoClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCentroCusto, True );
end;

procedure TFrmLancCC.BtnConsCentroCustoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 1;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmLancCC.EdtCentroCustoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCusto.Text) = '' then
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, DEBCRED, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCusto.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodigoCentro.Text := fieldbyname('codigo').AsString;
                        EdtNomeCentro.Text   := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentro.Clear;
//                        EdtCentroCusto.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodigoCentro.Clear;
                  EdtCentroCusto.Clear;
                  EdtNomeCentro.Clear;
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

procedure TFrmLancCC.BtnGravaClick(Sender: TObject);
begin 
  inherited;
  if Trim(EdtCodigoCentro.Text) = '' then
     begin 
        AlertaCad('Digite o Centro de custo');
//        EdtCentroCusto.SetFocus;
        exit;
     end;

  if strtocurr(EdtValorCentro.Text) = 0 then
     begin 
        AlertaCad('Digite o Valor');
//        EdtValorCentro.SetFocus;
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
            sql.Text:= 'INSERT INTO LANCAMENTOS_CENTRO_CUSTO (COD_LAN, COD_CENTRO_CUSTO, VALOR) ' +
                       'VALUES (:CODLAN, :CENTRO, :VALOR)';
            Parambyname('codlan').AsInteger := strtoint(EdtCodigo.Text);
            Parambyname('centro').AsInteger := strtoint(EdtCodigoCentro.Text);
            Parambyname('valor').AsCurrency := strtocurr(EdtValorCentro.Text);
            ExecOrOpen;
            LimpaItens;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao gravar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
    buscaCentros;
    EdtCentroCusto.SetFocus;
  end;
end;

procedure TFrmLancCC.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.clear;
            sql.Text:= 'DELETE FROM LANCAMENTOS_CENTRO_CUSTO ' +
                       'WHERE COD_LAN = :CODLAN AND COD_CENTRO_CUSTO = :CENTRO';
            Parambyname('codlan').AsInteger:= QCentroCOD_LAN.AsInteger;
            Parambyname('centro').AsInteger:= QCentroCOD_CENTRO_CUSTO.AsInteger;
            ExecOrOpen;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao excluir o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
    BuscaCentros;
  end;
end;

end.
