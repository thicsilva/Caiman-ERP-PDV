unit URegSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Grids, 
  DBGrids, Mask, Buttons, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, dxSkinMetropolisDark,
  System.Math;

type
  TFrmRegSaidas = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label35: TLabel;
    Label54: TLabel;
    BtnConsModelo: TsSpeedButton;
    Label34: TLabel;
    Label21: TLabel;
    BtnAddFor: TsSpeedButton;
    Label22: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    EdtData: TMaskEdit;
    EdtNFFinal: TEdit;
    EdtCodModelo: UNovosComponentes.TEdit;
    EdtNomeModelo: TEdit;
    EdtSerie: TEdit;
    EdtCNPJ: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    EdtTotalNF: TCurrencyEdit;
    EdtInscricao: TEdit;
    ComboEmitente: TComboBox;
    ComboSituacao: TComboBox;
    EdtUF: TEdit;
    Panel4: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label30: TLabel;
    Label38: TLabel;
    BtnConsCFOP: TsSpeedButton;
    BtnAddCFOP: TsSpeedButton;
    Label39: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    EdtValorContabil: TCurrencyEdit;
    EdtBaseCalculo: TCurrencyEdit;
    EdtICMS: TCurrencyEdit;
    EdtIsentas: TCurrencyEdit;
    EdtOutras: TCurrencyEdit;
    EdtAliquota: TCurrencyEdit;
    DBGrid1: TDBGrid;
    BtnGrava: TButton;
    BtnExclui: TButton;
    EdtCFOP: UNovosComponentes.TEdit;
    EdtNomeCFOP: TEdit;
    EdtICMSRetido: TCurrencyEdit;
    EdtBaseRetido: TCurrencyEdit;
    IBTRReg: TFDTransaction;
    QInsert: TFDQuery;
    QInsertCODREG: TIntegerField;
    IBSQLReg: TFDQuery;
    QBuscaItens: TFDQuery;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensBASE_CALCULO: TBCDField;
    QBuscaItensVALOR_ICMS: TBCDField;
    QBuscaItensISENTA_NAO_TRIBUTADA: TBCDField;
    QBuscaItensOUTRAS: TBCDField;
    QBuscaItensALIQUOTA: TBCDField;
    QBuscaItensCODIGO_EMPRESA: TIntegerField;
    QBuscaItensVALOR_TOTAL: TBCDField;
    QBuscaItensNOME_CFO: TStringField;
    QBuscaItensICMS_RETIDO: TBCDField;
    QBuscaItensBASE_CALCULO_RETIDO: TBCDField;
    DSBuscaItens: TDataSource;
    Label15: TLabel;
    EdtNFInicial: TEdit;
    QBuscaItensCALC_DIFERENCA: TCurrencyField;
    QBuscaItensREGISTRADO_ECF: TStringField;
    function  Ordem : integer;
    procedure BuscaItens;
    procedure EdtCNPJExit(Sender: TObject);
    procedure EdtCNPJEnter(Sender: TObject);
    procedure EdtCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodModeloEnter(Sender: TObject);
    procedure EdtCodModeloExit(Sender: TObject);
    procedure EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsModeloClick(Sender: TObject);
    procedure LimpaItens;
    procedure Botoes(acao : string);
    procedure EdtDataExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnConsCFOPClick(Sender: TObject);
    procedure BtnAddCFOPClick(Sender: TObject);
    procedure EdtCFOPEnter(Sender: TObject);
    procedure EdtCFOPExit(Sender: TObject);
    procedure EdtCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExcluiClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegSaidas: TFrmRegSaidas;

implementation
uses
  Udm, Ubibli1, UConsModelo, UConsCFOP, UCadCFOP, UConsRegSaidas, 
  UNovoPrincipal;
var  bGrava      : boolean;
     bGravaItem  : boolean;
     iOrdem      : integer;
     bFechaForm  : boolean;

{$R *.dfm}

procedure TFrmRegSaidas.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmRegSaidas);
                btnExcluir.Enabled:= false
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmRegSaidas);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            begin 
               btnalterar.Enabled:= false;
               BtnConsultar.Enabled := true;
            end
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
      end;
end;

function TFrmRegSaidas.Ordem : integer;
var iAux : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT MAX(ORDEM) ORD ' +
                 'FROM ITENS_REGISTRO_LIVRO_SAIDAS ' +
                 'WHERE CODIGO = :COD');
         Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
         Open;
         iAux:= fieldbyname('ord').AsInteger + 1;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   result:= iAux;
end;

procedure TFrmRegSaidas.BuscaItens;
var cTotal : currency;
begin 
   cTotal     := 0;
   bFechaForm := true;

   if IBTRReg.Active then
      IBTRReg.Commit;
   IBTRReg.StartTransaction;
   with QBuscaItens do
      begin 
         close;
         Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
         open;
         while not eof do
            begin 
               {if QBuscaItensCALC_DIFERENCA.AsCurrency <> 0 then
                  bFechaForm:= false;}
               cTotal:= RoundTo( cTotal + QBuscaItensVALOR_TOTAL.AsCurrency, -2 );
               next;
            end;
      end;

   if cTotal <> strtocurr(EdtTotalNF.text) then
      bFechaForm:= false;
end;

procedure TFrmRegSaidas.EdtCNPJExit(Sender: TObject);
var bAux : boolean;
begin 
  inherited;
  bAux:= false;
  if ToolBar1.Focused then
     exit;

  {verifica se é cliente cliente}
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT COD_CLI, NOME_CLI, INSC_ESTADUAL, DOC_CLI, ESTRES_CLI ' +
                    'FROM CLIENTE ' +
                    'WHERE CNPJ_CLI = ' + #39 +  FormataCNPJ(EdtCNPJ.Text) + #39);
            open;
            if not (fieldbyname('cod_cli').IsNull) then
                begin 
                   bAux:= true;
                   EdtNome.Text:= fieldbyname('nome_cli').AsString;
                   if fieldbyname('insc_estadual').AsString = '' then
                      EdtInscricao.Text:= 'ISENTO'
                   else
                      EdtInscricao.Text := RetiraCaracter(fieldbyname('insc_estadual').AsString);
                   EdtUF.Text:= fieldbyname('estres_cli').AsString;
                end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar os dados do Cliente');
    end;
  finally
    dm.QConsulta.Close;
  end;

  {verifica se é fornecedor}
  if not bAux then
     begin 
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.QConsulta do
               begin 
                  close;
                  sql.Clear;
                  sql.add('SELECT COD_FOR, RAZAO_FOR, INSC_FOR, EST_FOR ' +
                          'FROM FORNECEDOR ' +
                          'WHERE CNPJ_FOR = ' + #39 +  FormataCNPJ(EdtCNPJ.Text) + #39);
                  open;
                  if not (fieldbyname('cod_for').IsNull) then
                      begin 
                         bAux:= true;
                         EdtNome.Text     := fieldbyname('razao_for').AsString;
                         EdtInscricao.Text:= RetiraCaracter(fieldbyname('insc_for').AsString);
                         EdtUF.Text       := fieldbyname('est_for').AsString;
                      end
                  else
                     begin 
                        EdtNome.Clear;
                        EdtCNPJ.Clear;
                        EdtInscricao.clear;
                        edtuf.Clear;
                        AlertaCad('Fornecedor/Cliente não Cadastrado');
//                        EdtCNPJ.SetFocus;
                     end;
               end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao buscar os dados do Fornecedor/Cliente');
          end;
        finally
          dm.QConsulta.Close;
        end;
     end;
end;

procedure TFrmRegSaidas.EdtCNPJEnter(Sender: TObject);
begin 
  inherited;
  EdtCNPJ.SelectAll; 
end;

procedure TFrmRegSaidas.EdtCNPJKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRegSaidas.EdtCodModeloEnter(Sender: TObject);
begin 
  inherited;
  EdtCodModelo.SelectAll;
end;

procedure TFrmRegSaidas.EdtCodModeloExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeModelo.Text:= consulta('codificacao_documentos', EdtCodModelo, 'codigo', 'descricao', dm.IBTransaction, dm.QConsulta);
  if EdtNomeModelo.Text = '' then
     begin 
        AlertaCad('Modelo de Nota Fiscal não Cadastrado');
//        EdtCodModelo.SetFocus;
        exit;
     end;
end;

procedure TFrmRegSaidas.EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsModelo.Click;
end;

procedure TFrmRegSaidas.BtnConsModeloClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsModelo, FrmConsModelo);
  FrmConsModelo.tag:= 4;
  FrmConsModelo.showmodal;
end;

procedure TFrmRegSaidas.LimpaItens;
begin 
   EdtCFOP.Clear;
   EdtNomeCFOP.Clear;
   EdtValorContabil.Clear;
   EdtBaseCalculo.Clear;
   EdtAliquota.Clear;
   EdtICMS.Clear;
   EdtIsentas.Clear;
   EdtOutras.Clear;
end;

procedure TFrmRegSaidas.EdtDataExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(edtdata.Text)
  except
    AlertaCad('Data Inválida');
//    EdtData.SetFocus;
  end;
end;

procedure TFrmRegSaidas.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M036','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  { verifica insc.estadual }
  if trim(EdtInscricao.Text) <> '' then
     begin 
{        if not VerificaInscricao(EdtInscricao.Text, EdtUF.Text) then
           begin 
              AlertaCad('Inscrição Estadual inválida para ' + EdtUF.Text);
              exit;
              abort;
           end;     }
     end;

  if trim(EdtNFInicial.Text) = '' then
     begin 
        AlertaCad('Digite o número da Nota');
//        EdtNFInicial.SetFocus;
        exit;
     end;

  if IBTRReg.Active then
     IBTRReg.Commit;
  IBTRReg.StartTransaction;
  if bGrava then
     begin 
        try
          try
            with QInsert do
               begin 
                  close;
                  Params[0].AsDate       := strtodate(EdtData.Text);
                  Params[1].AsString     := trim(EdtCNPJ.Text);
                  Params[2].AsString     := trim(EdtCodModelo.Text);
                  if EdtSerie.Text = '' then
                     Params[3].Value     := null
                  else
                     Params[3].AsString  := trim(EdtSerie.Text);
                  Params[4].AsInteger    := strtoint(EdtNFInicial.Text);
                  Params[5].AsString     := copy(ComboEmitente.Text, 1, 1);
                  Params[6].AsCurrency   := strtocurr(EdtTotalNF.Text);
                  if ComboSituacao.ItemIndex = 0 then
                     Params[7].AsString  := 'N'
                  else
                     Params[7].AsString  := 'S';
                  Params[8].AsInteger    := iEmp;
                  Params[9].Value        := null;
                  Params[10].AsString    := trim(EdtUF.Text);
                  Params[11].AsString    := trim(EdtInscricao.Text);
                  if trim(EdtNFFinal.Text) = '' then
                     Params[12].AsInteger:= strtoint(EdtNFInicial.Text)
                  else
                     Params[12].AsInteger:= strtoint(EdtNFFinal.Text);
                  Params[13].Value       := null;
                  Open;
                  EdtCod.Text:= QInsertCODREG.AsString;
               end;
            IBTRReg.Commit;
            Botoes('G');
            panel3.Enabled:= false;
            panel4.Enabled:= true;
            EdtCFOP.SetFocus;
          except
            IBTRReg.Rollback;
            AlertaCad('erro ao gravar o registro');
          end;
        finally
          QInsert.Close;
          BuscaItens;
        end;
     end
  else
     begin 
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.add('UPDATE REGISTRO_LIVRO_SAIDAS SET ' +
                          'DATA = :2, CNPJ = :3, CODIFICACAO_FISCAL = :4, SERIE_NOTA = :5, ' +
                          'NUMERO_NOTA = :6, EMITENTE = :7, VALOR_TOTAL = :8, SITUACAO = :9, ' +
                          'UF = :10, INSCRICAO = :11, NUMERO_NOTA_FINAL = :12 WHERE CODIGO = :1');
                  Parambyname('1').AsInteger   := strtoint(EdtCod.Text);
                  Parambyname('2').AsDate      := strtodate(EdtData.Text);
                  Parambyname('3').AsString    := Trim(EdtCNPJ.Text);
                  Parambyname('4').AsString    := trim(EdtCodModelo.Text);
                  if EdtSerie.Text = '' then
                     ParamByName('5').Value    := null
                  else
                     ParamByName('5').AsString := trim(EdtSerie.Text);
                  ParamByName('6').AsInteger   := strtoint(EdtNFInicial.Text);
                  Parambyname('7').AsString    := copy(ComboEmitente.Text, 1, 1);
                  Parambyname('8').AsCurrency  := strtocurr(EdtTotalNF.Text);
                  if ComboSituacao.ItemIndex = 0 then
                     ParamByName('9').AsString := 'N'
                  else
                     ParamByName('9').AsString := 'S';
                  ParamByName('10').AsString   := trim(EdtUF.Text);
                  ParamByName('11').AsString   := trim(EdtInscricao.Text);
                  if trim(EdtNFFinal.Text) = '' then
                     ParamByName('12').AsInteger:= strtoint(EdtNFInicial.Text)
                  else
                     ParamByName('12').AsInteger:= strtoint(EdtNFFinal.Text);
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
            Botoes('G');
            panel3.Enabled:= false;
            panel4.Enabled:= true;
            EdtCFOP.SetFocus;
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao gravar o registro');
          end;
        finally
          IBSQLReg.Close;
          BuscaItens;
        end;
     end;
end;

procedure TFrmRegSaidas.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;

  if not bFechaForm then
     begin 
        AlertaCad('Verifique os Valores Digitados');
        exit;
        abort;
     end;
     
  if IBTRReg.Active then
     IBTRReg.Commit;
  QBuscaItens.Close;
  bGrava:= true;
  bGravaItem:= true;
  if not DM.Acesso('M036','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        panel3.Enabled:= false;
        panel4.Enabled:= false;
        Abort;
        Exit;
     end;
  Botoes('N');
  panel3.Enabled := true;
  panel4.Enabled := false;
  EdtData.Text   := datetostr(date);
  ComboEmitente.ItemIndex:= 0;
  ComboSituacao.ItemIndex:= 0;
  Edtdata.SetFocus;
end;

procedure TFrmRegSaidas.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not panel3.Enabled then
     AlertaCad('Lançamento gravado')
  else
     begin 
        Botoes('C');
        panel3.Enabled:= false;
        panel4.Enabled:= false;
     end;
end;

procedure TFrmRegSaidas.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M036','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  panel3.Enabled:= true;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmRegSaidas.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M036','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do Registro?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRReg.Active then
           IBTRReg.Commit;
        QBuscaItens.Close;
        IBTRReg.StartTransaction;
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM REGISTRO_LIVRO_SAIDAS WHERE CODIGO = :COD');
                  Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
            panel3.Enabled:= false;
            panel4.Enabled:= false;
            bFechaForm    := true;
            Botoes('E');
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao Excluir o Lançamento');
          end;
        finally
          IBSQLReg.Close;
        end;
     end;
end;

procedure TFrmRegSaidas.FormShow(Sender: TObject);
begin 
  inherited;
  panel3.Enabled := false;
  panel4.Enabled := false;

  if tag = 0 then
     begin 
        bGrava:= true;
        bGravaItem:= true;
        if not DM.Acesso('M036','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             panel3.Enabled := true;
             Edtdata.Text   := datetostr(date);
             ComboEmitente.ItemIndex:= 0;
             ComboSituacao.ItemIndex:= 0;
             Edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmRegSaidas.BtnGravaClick(Sender: TObject);
begin 
  inherited;
  { VERIFICA OS VALORES }
  {if strtocurr(EdtValorContabil.Text) <> (strtocurr(EdtBaseCalculo.Text) +
                                          strtocurr(EdtIsentas.Text)     +
                                          strtocurr(EdtOutras.Text)) then
     begin 
        AlertaCad('Verifique os valores digitados');
//        EdtValorContabil.SetFocus;
        exit;
        abort;
     end;}

  if IBTRReg.Active then
     IBTRReg.Commit;
  IBTRReg.StartTransaction;
  try
    try
      with IBSQLReg do
         begin 
            close;
            sql.Clear;
            if bGravaItem then
               begin 
                  sql.Add('INSERT INTO ITENS_REGISTRO_LIVRO_SAIDAS (CODIGO, ORDEM, CFOP, ' +
                          'BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA, ' +
                          'CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO, BASE_CALCULO_RETIDO) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)');
                  parambyname('2').AsInteger:= Ordem;
               end
            else
               begin 
                  sql.Add('UPDATE ITENS_REGISTRO_LIVRO_SAIDAS SET CFOP = :3, ' +
                       'BASE_CALCULO = :4, VALOR_ICMS = :5, ISENTA_NAO_TRIBUTADA = :6, ' +
                       'OUTRAS = :7, ALIQUOTA = :8, CODIGO_EMPRESA = :9, VALOR_TOTAL = :10, ' +
                       'ICMS_RETIDO = :11, BASE_CALCULO_RETIDO = :12 ' +
                       'WHERE CODIGO = :1 AND ORDEM = :2');
                  parambyname('2').AsInteger:= iOrdem;
               end;
            parambyname('1').AsInteger  := strtoint(EdtCod.Text);
            Parambyname('3').AsInteger  := StrToInt(EdtCFOP.Text);
            parambyname('4').AsCurrency := StrToCurr(EdtBaseCalculo.Text);
            Parambyname('5').AsCurrency := strtocurr(EdtICMS.Text);
            Parambyname('6').AsCurrency := strtocurr(EdtIsentas.Text);
            Parambyname('7').AsCurrency := strtocurr(EdtOutras.Text);
            Parambyname('8').AsCurrency := strtocurr(EdtAliquota.Text);
            Parambyname('9').AsInteger  := iEmp;
            Parambyname('10').AsCurrency:= strtocurr(EdtValorContabil.Text);
            Parambyname('11').AsCurrency:= strtocurr(EdtICMSRetido.Text);
            Parambyname('12').AsCurrency:= strtocurr(EdtBaseRetido.Text);
            ExecOrOpen;
         end;
      IBTRReg.Commit;
    except
      IBTRReg.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    bGravaItem:= true;
    IBSQLReg.Close;
    LimpaItens;
    BuscaItens;
    EdtCFOP.SetFocus;
  end;
end;

procedure TFrmRegSaidas.BtnConsCFOPClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.tag:= 12;
  FrmConsCFOP.showmodal;
end;

procedure TFrmRegSaidas.BtnAddCFOPClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCFOP, True );
end;

procedure TFrmRegSaidas.EdtCFOPEnter(Sender: TObject);
begin 
  inherited;
  edtcfop.SelectAll;
end;

procedure TFrmRegSaidas.EdtCFOPExit(Sender: TObject);
begin 
  inherited;
  if (ToolBar1.Focused) or (EdtCFOP.Text = '') then
     begin 
        EdtNomeCFOP.Clear;
        exit;
     end;

  if (copy(trim(EdtCFOP.Text), 1, 1) <> '5') and (copy(trim(EdtCFOP.Text), 1, 1) <> '6') then
     begin 
        AlertaCad('CFOP nao é Válido para Saídas');
//        EdtCFOP.SetFocus;
        exit;
     end;

  EdtNomeCFOP.Text:= consulta('cfop', EdtCFOP, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOP.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        edtcfop.SetFocus;
     end;
end;

procedure TFrmRegSaidas.EdtCFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOP.Click
  else
     if key = vk_f2 then
        BtnAddCFOP.Click; 
end;

procedure TFrmRegSaidas.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        iOrdem:= QBuscaItensORDEM.AsInteger;
        if IBTRReg.Active then
           IBTRReg.Commit;
        QBuscaItens.Close;
        IBTRReg.StartTransaction;
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_REGISTRO_LIVRO_SAIDAS ' +
                          'WHERE CODIGO = :1 AND ORDEM = :2');
                  Parambyname('1').AsInteger := strtoint(EdtCod.text);
                  Parambyname('2').AsInteger := iOrdem;
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          IBSQLReg.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmRegSaidas.DBGrid1DblClick(Sender: TObject);
begin 
  inherited;
  iOrdem                := QBuscaItensORDEM.AsInteger;
  EdtCFOP.Text          := QBuscaItensCFOP.AsString;
  EdtNomeCFOP.Text      := QBuscaItensNOME_CFO.AsString;
  EdtValorContabil.Text := QBuscaItensVALOR_TOTAL.AsString;
  EdtBaseCalculo.Text   := QBuscaItensBASE_CALCULO.AsString;
  EdtAliquota.Text      := QBuscaItensALIQUOTA.AsString;
  EdtICMS.Text          := QBuscaItensVALOR_ICMS.AsString;
  EdtIsentas.Text       := QBuscaItensISENTA_NAO_TRIBUTADA.AsString;
  EdtOutras.Text        := QBuscaItensOUTRAS.AsString;
  EdtBaseRetido.Text    := QBuscaItensBASE_CALCULO_RETIDO.AsString;
  EdtICMSRetido.Text    := QBuscaItensICMS_RETIDO.AsString;
  bGravaItem:= false;
  EdtCFOP.SetFocus;
end;

procedure TFrmRegSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRReg.Active then
     IBTRReg.Commit;
  QBuscaItens.Close;
  Action:= caFree;
end;

procedure TFrmRegSaidas.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsRegSaidas, FrmConsRegSaidas);
  FrmConsRegSaidas.tag:= 0;
  FrmConsRegSaidas.showmodal;
end;

procedure TFrmRegSaidas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
  inherited;
  {if QBuscaItensCALC_DIFERENCA.AsCurrency <> 0 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;}
end;

procedure TFrmRegSaidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin 
  inherited;
  if not bFechaForm then
     begin 
        AlertaCad('Verifique os valores digitados');
        CanClose:= false;
     end;
end;

procedure TFrmRegSaidas.QBuscaItensCalcFields(DataSet: TDataSet);
begin 
  inherited;
  if trim(QBuscaItensREGISTRADO_ECF.AsString) = 'S' then
     QBuscaItensCALC_DIFERENCA.AsCurrency:= 0
  else
     QBuscaItensCALC_DIFERENCA.AsCurrency:= QBuscaItensVALOR_TOTAL.AsCurrency  - (QBuscaItensBASE_CALCULO.AsCurrency +
                                                                                  QBuscaItensISENTA_NAO_TRIBUTADA.AsCurrency +
                                                                                  QBuscaItensOUTRAS.AsCurrency);
end;

procedure TFrmRegSaidas.FormCreate(Sender: TObject);
begin 
  inherited;
  bFechaForm:= true; 
end;

end.
